Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A57946DFFD
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546264; cv=none; b=bdB7iW3Pmke+eN2fT0IP9F+nGl7r5S4lHuo3ua5WsH+aIUFsMx34s+4Xzkz1rPvs8O/nG64sA6FkJ//bSUR04m5UkW2FG4ObwscbZv7p2CUBHyYr2MxU+ozUxRG0Kw9owdveXsebDQUKnTd69ZmxpNsLPZcvJCMEGT3xIpU0UqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546264; c=relaxed/simple;
	bh=goPI6bhosYCEPpMVqc3V6eJkJQxLt6sX1dvOjPJVJ6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0KtOnLauYKYDxX6hJf+CcQ8LUZ7jg0ZJ1jfnrpnOT9YCfnNGBMiU7xYEMvSs4LCyQ44vElG2vuIgeDfkkPz7by/AMMI6wnZelJ5Tj2Wsw30TxOWEzm0TRUleihQfh4mQvueFYygLT1L0kuJ1bkgR0ke6hVMuxD8rVNWwpwYN8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UKW1vP6Z; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UKW1vP6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=HQ
	jeT3BgKrVLOKsTa29XhpZyZEE9cQXut5VF6I2Q6nY=; b=UKW1vP6Z6eX7/4aGu5
	iuMplru/RiAkdsqKDZeb6HbCcyDZPeDWdsRgJmWDWZ19cDzkrmKB6WX34noelqad
	2nXuIMWhv7KvD42J8DIm9+sxMV4ezcrQ1Gw/OGrkF4zaLabbInqlB/8H8ZYkbqr/
	1VKMkOJ1GF4qITE3Mmo+OLpj0=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3fyzyTqpqO+zNRw--.39630S2;
	Wed, 16 Sep 2026 16:10:27 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kthread: Drop warning on cpumask allocation failure in kthread_affine_node()
Date: Wed, 16 Sep 2026 16:10:24 +0800
Message-ID: <20260916081024.50861-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aqkhrxXXIm43mqfs@localhost.localdomain>
References: <20260914120941.63968-2-quchaosheng000406@163.com> <deab3ef5-e63f-474f-9a1b-fb4f4b65be2a@redhat.com> <aqkhrxXXIm43mqfs@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3fyzyTqpqO+zNRw--.39630S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrW3GFWkArWrKF4xKrW5GFg_yoW8GrWxpa
	yUK34qyr4vyFya9wsrGa1Iy34Fyr93ZayDCryfur98CayfWay3JrW3KFWjvr4Ykrs5GF1q
	qr45W3s3Cws8AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UI9aPUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC-xMVimqqTvPOkwAA3T

Hi Frederic,

Thanks for looking at this.

The posting you are responding to is v1, which dropped the message entirely.
That one was wrong and I have not resent it. v2 replaced WARN_ON_ONCE(1) with
pr_warn_once(), so the thread still reports the condition:

	if (!zalloc_cpumask_var(&affinity, GFP_KERNEL)) {
		pr_warn_once("kthread: %s: no cpumask, node affinity not set\n",
			     current->comm);
		return;
	}

One correction to the v1 description, though, because I think it changes the
picture: kthread_affine_node() is not the thread main function. It is called
from kthread() before threadfn(), and returning from it only skips the affinity
setup for this thread -- threadfn(data) is still run either way, so no callback
is skipped. The early return is also not something the patch adds; it is already
there in the current code, above the warning. The patch only changes how the
failure is reported.

The reason I would like to keep it visible in some form is the point you make:
the thread does not join kthread_affinity_list, so a later CPU hotplug will not
fix up its affinity, and that state is worth telling someone about.

That said, if your position is that WARN_ON_ONCE(1) is the right severity and
pr_warn_once() would let it go unnoticed, just say so and I will drop the patch.
I would rather not push something you have already said no to.

Thanks,
Quchaosheng

