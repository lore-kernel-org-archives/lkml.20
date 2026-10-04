Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0A3A6418
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131122; cv=none; b=bwMDB4ft+TC4lzh21AUrw6h4Jun8YKlfZ19+U1Z+x8Mo6kopVG3jsFFs4SrsAX0uQYwf4PhwckfcC33wIImIsDqJibHZzHLmy7LXN0GylxwWhJTxmoYvzN49jrEqzL0yqttPMMQRmV/3H7u/lmbN71aSduku7IrgAf5+WduAvqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131122; c=relaxed/simple;
	bh=2af0EyCuknnXglOMLIsaiGeotIoVaUsd3p1MriTvYUs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D1jVRWMmLHuRogPs6XLrfOj38z5u94Pi7bYVf1F1G39zpsSauyDWLIWdlE5Cf6Z4kftRcYnyJeAM48wORH8RHInztlNpFmbsklGiIpAobTMveetPFHDafmpN5b4MoIN2GTsDi3/0R2aEJTzdVa/1A+I8WAEMoOLnjBV2rBWdSmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JK1JgtDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JK1JgtDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8AF31F000FF;
	Sun,  4 Oct 2026 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791131120;
	bh=8KhSzt0+tyTJNff2lh+2iPJgtpjNsvPTEXh8mp/hSSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=JK1JgtDCV9DVp8hXl3113V/kA/j2o6jMltl7TdQv0iF+5RUyQZ3pW3yhM200fNebF
	 scSBFusEpbr8LsxiUbwht1hi2i+QkL7Y0pEowcWzv7Tm0Z9ZNGH8N2gkwyMx0rjslh
	 DehGzruhheX71ZaWDXBLW6DOKSlatkfUCvZAPOCwRwYI5aVapZ1JdYIz9tuJuvu8dT
	 N8gUJ6fqxWr0BLj3g6RUgZoP4gdVPWfeWx9IrkXZJglau1KoHPJB/6VBXoR9h2z9nQ
	 o4anXm5zk3smeGi9LXrUGYDa0AINP49EWwy2s2dFR4PJE575WK2fnNZYaBHTMCpBAo
	 VwiMldIXpGhtQ==
From: Nathan Chancellor <nathan@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brigham Campbell <me@brighamcampbell.com>
Cc: Christian Heusel <christian@heusel.eu>, linux-kernel@vger.kernel.org
In-Reply-To: <20261003-ignore-pacman-signature-v1-1-d16a9a026f55@brighamcampbell.com>
References: <20261003-ignore-pacman-signature-v1-1-d16a9a026f55@brighamcampbell.com>
Subject: Re: [PATCH] .gitignore: ignore pacman package signatures
Message-Id: <179113111599.1398860.5391372805949286723.b4-ty@b4>
Date: Sun, 04 Oct 2026 18:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=717; i=nathan@kernel.org;
 h=from:subject:message-id; bh=2af0EyCuknnXglOMLIsaiGeotIoVaUsd3p1MriTvYUs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmHat+Gyp//ZfTDdFr006lf5Y4Ir15fatCUkpPKML23X
 jv3rPPrjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCROYyMDIeuHfXccfxh6Iu4
 /Z9miH7cXuXrduCH+PzXljaPe86x/l3GyNBoq/g4T6p6+xvJh/bTZ1yIiDvfGHxw2nrt9Sc0giv
 T41gB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Sat, 03 Oct 2026 22:01:13 -0600, Brigham Campbell wrote:
> .gitignore: ignore pacman package signatures

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] .gitignore: ignore pacman package signatures
      https://git.kernel.org/kbuild/c/fe366c131a13a

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


