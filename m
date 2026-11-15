Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775556;
	b=0rX6Y548lg5wZ8nyRqVFA4/2BwSagzZ+3TwM57SKgo1aCvgYSGtfifEm2XQWw2WXTnpt
	 rMOGcYGHfAEqs09AgB14QFJZGW7TLRixAJ2Z0SXMz8HScAB+pd7qGq1N+CUzn0KQuVxhm
	 hU/G//Hg/Hb+alXayuRTOnFyUWOAkuPE4KGIc9puOhrGBZGdGeTAH9JfnDoOmFatlbxDb
	 5XxrQs1CI3w04X7XKf8EoGFxWXYyiTW4xz/JSA1X1KWBS9wHnB+cuMaUmCSer+sy/vXhr
	 48pNSwlvG8pgZC9w9PNe/UIcLHZh0j5xKbw0jWE87XTW0i0DI3KLZV7vDkFuufx0vXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775556;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject;
	bh=zGDVcdUxEOy2e55YJEes7/sNySa6uwXNeFrtXBRwhcw=;
	b=tCY+xIT6aUUeO6GcocydW419c1cd4Yzy9S/yOPXXl18Z3Q0cekd6ZEwjr9ImCCAvGphF
	 JRTCTB6BXLDsAUc+3KBix4YLm/1Gj6xyIlUb9OJ8vWA/aKaPxzjPpr8EmirZgqu+Wyo6K
	 bI4FAd9InzI1b2werAa6YZq40aaqH4olqo2wT3mX5BUcPcaLjebPcX0iAocv89S8PWlTJ
	 BhyQ6K1BJN2kzJd/Jm6iq6XOiwmYzKB45fDo4FiVVOlLLdTYSP2fRhRwjpxuJYTdKFs/g
	 zdoFvuGhnzppP6lIiaPTnXTygU02pgqFVU4CcsyOWJdHnsTeOxDMGLQTfcDSDbV4Sew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CXLW/XHn";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA544606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CXLW/XHn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 610711F000C4;
	Sun, 15 Nov 2026 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794775556;
	bh=zGDVcdUxEOy2e55YJEes7/sNySa6uwXNeFrtXBRwhcw=;
	h=Date:From:To:Cc:Subject;
	b=CXLW/XHnYVDKIFbodzFL8Bd5LS0tjzDck03MdpawY+3c4KkIoxwW+dOG/0aWFVx/I
	 73TJT+pLDZxdqeY65qhGNDyLzscZf147gqiB41vWQ2CFKFj5IeHe+mjqJdW/oCKqER
	 K+iVwxjlt3M4v3aefik0J++FZtFweQfnfbJaH/ARZou6p3LLUI44eiwsNp/YyX7zPi
	 XDmRLmdqbkFLCVvNT/DptT0Gob70DytmB8R09AIrxFp9BPPuvCjaHF1y2tnlqV7Lhs
	 5jB5D2jNyjTSZDpmbQHjJd/2p90tdTrkFCePgMC18ooGboA6iDj/KQRhQDBjDHXa9O
	 R88o45/znF7vg==
Date: Sun, 15 Nov 2026 10:45:55 -1000
Message-ID: <fb224bad9baf5f44cf17e1d664776a4e@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] workqueue: Fixes for v7.4-rc2
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hello,

The following changes since commit d89e1d186ec9271bf78e62771779e9fc03bf0fc3:

  Merge tag 'fscrypt-for-linus' of git://git.kernel.org/pub/scm/fs/fscrypt/linux (2026-10-29 14:00:23 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tags/wq-for-7.4-rc2-fixes

for you to fetch changes up to c7d64f52bffaca093acfb34277877138f6ec243a:

  workqueue: Fix drain_workqueue() missing work items chained across pwqs (2026-11-02 08:06:21 -1000)

----------------------------------------------------------------
workqueue: Fixes for v7.4-rc2

- Draining a workqueue could return while a work item queued by another work
  item was still pending, making workqueue destruction warn and leak the
  workqueue.

----------------------------------------------------------------
Tejun Heo (1):
      workqueue: Fix drain_workqueue() missing work items chained across pwqs

 kernel/workqueue.c | 68 ++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 17 deletions(-)

-- 
tejun
