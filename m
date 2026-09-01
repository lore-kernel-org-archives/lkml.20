Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC64137C911
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296971; cv=none; b=BV0FFAxzauWE9qU6Hz40Ts9WCFY+sWoICkR66O/x/yhDVkA9xUrAwH0al2saLRBX2oIhNqeXYvJUnV1QqF3wu1Nc4EOF0kh244b4hKc1SahSKU8+QnvY3Z+Xm9PTT4F/grMJ7ilr47vUJeUGhnea83w7QplZwyW5C7RD5tagYGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296971; c=relaxed/simple;
	bh=xZzYN/RaKg0fDD5U/HD/6dDYsMjYMdMQMO+HiK/FJTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ldum+OIPrOl5RlprCMTMxZyoCcT2PAZPrhUhLhM1xddKvf+YOo5QFoaYN7b9xi0cHHIoAkF8mBkSyJfInCHq6n4DN30kQ/ie7e+l7XttwGtKdvbwniG7Yz5wC5Eup9uxrwXPJ/FRdkosCkLzKQK+vrwHnW1u/VLwmuroENz0mmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWFX9swB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWFX9swB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB041F000E9;
	Tue,  1 Sep 2026 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788296970;
	bh=xZzYN/RaKg0fDD5U/HD/6dDYsMjYMdMQMO+HiK/FJTw=;
	h=From:To:Cc:Subject:Date;
	b=gWFX9swB3cFZv4yaRtw0OaxmK0kNXdBPTYtqGjMEMXy1J/Dx8B2oFecWVCKq2XexC
	 9XshgWEanJZaigON4A9/lZmU0GNAxwLdJfFY41ESjEvgw8Bd+dUiMaVcr9IKhZLab2
	 6MJcC5Gj14HeGyffKko5P3qJiwvl1FOzL00jZKZAZ5sGJVpRLbZ+su6bwXuVua/QDq
	 xtY8plIAxqCDtoX3ZO/Hzvj4F5QCPVndgUrCTUjDnURVbpXW+MWPq9syVutK2yHPve
	 gaKNXC0CJtGa+hW+K8i55l/Ji6BHk0cq+CvWiF5q0+fHmhZ0+NoIGNdruuGhM/nkc5
	 6mqrBH91CXsrA==
From: Tejun Heo <tj@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Yao Kai <yaokai34@huawei.com>,
	liuyongqiang <liuyongqiang13@huawei.com>,
	Tejun Heo <tj@kernel.org>
Subject: [PATCHSET wq/for-7.4] workqueue: Make flush_workqueue() cost scale with active pwqs
Date: Tue,  1 Sep 2026 11:09:26 -1000
Message-ID: <20260901210929.3092513-1-tj@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Since 636b927eba5b ("workqueue: Make unbound workqueues to use per-cpu
pool_workqueues"), flush_workqueue() walks one pwq per possible CPU, cycling
each pool lock, even when the workqueue is idle. Yao Kai reported the XFS
CIL workqueue, flushed on every log force, spending up to 64us per flush in
that walk on a 128-CPU machine.

This patchset makes flushes visit only the pwqs which have been active since
the last flush by tracking them on per-node lists. On a 192-CPU 2-node
machine, flushing an idle per-cpu workqueue goes from 40k to 4.2M per second
and 16 threads doing queue+flush in a loop go from 30k to 110k flushes per
second. Dense flushes with every pwq active get 15-20% slower on unbound
workqueues.

Yao, can you please test whether this resolves the fsync latencies you
reported?

This patchset contains the following three patches:

 0001-workqueue-Add-for_each_node_with_fallback.patch
 0002-workqueue-Maintain-pwq-total_in_flight.patch
 0003-workqueue-Make-flush_workqueue-visit-only-pwqs-activ.patch

0001-0002 are prep patches. 0003 implements the active pwq lists.

The patchset is on top of wq/for-7.4 (ab85b68e630e) and also available in
the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git wq-flush-active-pwq-lists

diffstat follows. Thanks.

 kernel/workqueue.c | 301 ++++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 238 insertions(+), 63 deletions(-)

--
tejun
