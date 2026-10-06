Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0446337BE6C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791308162; cv=none; b=par60I18L8C+YHms/JtKagc9w6r6S4bdLnm4K7NHsIEe2UeXbJHLcwyT58dkMs1Rm9xF9H5ZFMTbLBmJEfNWThVBgGR67J4zy0X8NMRTnZ7nY0lqxDAyhx1DxUJR6bLOnpcfGBIJ7beiUIi5aeftWoNgSbeVBa/HSD8MUqXbKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791308162; c=relaxed/simple;
	bh=vMnmTwE2G+AQgif2NbsLP9FLqmSZ6FMc9EKcPS6lvVo=;
	h=Date:Message-ID:From:To:Cc:Subject; b=b3dwUM3mN9+cBnGsXDJZOcHf/puZIBKNpdSSrdB0YHpsmiIskgoo240c8s76gDmJcbsiKkMV1j0IXa5NzKRsRnc4l71jzlnjrw3a5M7wTXuRpkXzez+E4C2QrRBO/+kjipRaG9LQPBcTxK16UNsaKGNDYFSJdCz29XcqGh3QPTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVF61WKE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVF61WKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854741F0089B;
	Tue,  6 Oct 2026 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791308160;
	bh=QmM3AxiFbp2cYQ08Z8YKdo6OO8AxnjwHJQ0hnfPDJng=;
	h=Date:From:To:Cc:Subject;
	b=fVF61WKE0+SLBIZ48SW22faJwxvIlUykFPiJHKyV41CKh7J1mFVqqQmDERlIIyUqv
	 Seq3CsbaWDGnXt5c3IFxOorA1BCN6+rL298IpUr3Wk6EIrIaOXYFF2pHJbK4FBut81
	 i6gc/W0Qs6GOCMIwpQqIvbyPNUcKiXy5PivwbSwFpF2snezagonCDiH9OMVIN9QHX8
	 pagWwPUCRk/LNKqq1uC6VOGJwmUDvSM3FIJ5FJ9cEin3EL5LstImSwU5QEUCNXIRca
	 3OLraj/ddx9jpeTJn1dyqwaAATWMKTbBXNUNcu61lynoR6zC9FS7AF4njCeVdIBFHT
	 KkLW2hn8UpwZA==
Date: Tue, 06 Oct 2026 07:35:59 -1000
Message-ID: <8b5da0d81963439650838cacae437645@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] workqueue: Fixes for v7.3-rc6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

The following changes since commit db6365ced4d5855e321f772b240c0e473bcfcdd5:

  workqueue: Fix NULL current_pwq deref in flush dependency check (2026-09-26 22:18:50 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.3-rc6-fixes

for you to fetch changes up to 980db94e3eeefdd8a1c46f86412c33a7f7806f51:

  workqueue: Fix NULL current_pwq deref in chained work check (2026-09-28 07:46:45 -1000)

----------------------------------------------------------------
workqueue: Fixes for v7.3-rc6

- Fix a NULL dereference in the chained work check when a kworker queues
  work on a draining or destroying workqueue outside work item execution.

----------------------------------------------------------------
Pavankumar Kondeti (1):
      workqueue: Fix NULL current_pwq deref in chained work check

 kernel/workqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
tejun
