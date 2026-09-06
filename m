Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2CD2D876A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788693223; cv=none; b=UZuwTae+eXr0zTeF4D+9Hz+npHJ9evbnY2vxPdtccjalFL5IRlykPFMtBKA7WpJ99PMtHC+uB9BZK9zR40JPRlDU/h9kMEImKNjsDNhRxnA69QbnGSNaCsPdHbKftwQNmlXEr0KTR/goPoHwQ5NizOseEUYZBnHotlDQhxNaBtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788693223; c=relaxed/simple;
	bh=SQrNxrxAwiU7NSMtXzTH7LOESS94+w3iIeakyELpdUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oRAf3An6MPauuu+RRLNHtaEzADyGqCiATSBanZEHnO1Av1X/JmY2ZE1+0nzx7gmy/E7XXJxPJKO2axItkXuaMH9/tuMc7+jrCkW7ipCkA5ddDYUgqXYGbkWpOSYmL1tnVkfPb3P+Ll5FGJ3Z4SqZkDbVUCksoLh5aZJk3c/3YRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ha77/0C8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ha77/0C8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4FA1F00A3A;
	Sun,  6 Sep 2026 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788693221;
	bh=reByKNuMP2HZOFqpWrPpEC7zwsOeY8mT4wyzlBb5Xv0=;
	h=Date:From:To:Cc:Subject;
	b=ha77/0C8ueN8H6EMpXfdbjtF6a7g9oLtv4+o7zpvSBlcwku8dl153/q6dL2pqmupT
	 uBQHLgzYt3Uj9IBRMSsy1JJDjgi6zpFremIDYgTmGVNMClHqQialtzAdBgknpyBej+
	 Xp9jdCVE+0m5VYlG1SrnojUtz40g9ETXFrDZBEcXCvYgEvtOyGI+c03bupiQgGE+KL
	 FRc+AdcZQYDaEHGQMEt+JEXNAHUhhpl+1bbcvzGoOzPzYrJ/XE9Ty3q1FHRFBwSGvT
	 oDJ/+GKrTjJBc0OQ07TZqI1mY85jI6DDyG4ouZaJ4BG8I+RlyaSJ9m8LkAr+AHjFIo
	 RiUfVpQj8K03w==
Date: Sun, 6 Sep 2026 13:13:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [GIT PULL] perf events fixes
Message-ID: <ap1K4AyMCwR2Tr75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2026-09-06

for you to fetch changes up to 58a8108bc73de0740d5b88150465d6690ea5f85f:

Misc perf events fixes:

 - Skip empty AUX records with only format flags
   (Leo Yan)

 - Fix use-after-free when perf mmap() revival races with the
   last munmap() (Yilin Zhang, Weiming Shi)

 Thanks,

	Ingo

------------------>
Leo Yan (1):
      perf/core: Skip empty AUX records with only format flags

Yilin Zhang (1):
      perf: Fix use-after-free when perf mmap() revival races with the last munmap()


 kernel/events/core.c        | 20 ++++++++++----------
 kernel/events/ring_buffer.c |  9 +++++++--
 2 files changed, 17 insertions(+), 12 deletions(-)
