Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982308;
	b=g5Wa+6Em4ePhBfbn9D7H8Xq+iwVoBpGJWkm2/co6VioW1Oy03RrV2lLZWfrz3vgHe7Z6
	 ji3owp2s248q9kcE1tXPRMIRLsYKITshPKk23kbMMyiLAAkval2NUHLUSmbm/aI4tu7hH
	 BGpbPDM3mluzFZPj2nJ2MV6rZoIXbXq07nB0PasDJWATFzXfWTjrJFCeu6fl6++JAzH9+
	 ZTHCNcbGDr1Lw+/fbjxgXIC1upFuW5UXioFxTY7TR+63FZ/QCq/ItFaZISf+nMVbWl/IQ
	 BR8u514vwOHO9CzrXK0P27CX4tXM+242/CbBkLxNwEADe0jkYPf22Jqgms1WiyCVfoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982308;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Debian-User;
	bh=aDikpMOn5+HJJPzpuKasVpb1aKPshcvdq9pRmiwR3Mk=;
	b=zpFuFh8KNBABZdiq70P2ou3MFInmM3f99a/g0vuX/jFoUMEEvJR+7449jBuSN5W9cJbK
	 jLQHbjTbGx6pTx3BuAwxlJ33mqAM1DoWExw8PBKckPMK1QmSg6ovYid1JyBW7C5wh4Sqr
	 56ZAOU0SfmAG8Wc1gUgc2H3C1wP6yZyupOJqUTtFgMk9BLcijCF5SRITzNA3hSyqo7CXw
	 95DeRpDEIDmHzG/bBWeDGYbtrVgMsYIOqZpVn5ssCA6UXpkeXWWRHmzIuF5/4DtR4jPgE
	 NqqHIMT5l1v+vh7UhIU2VJ5Z2T0bakx3NGf43MiY4z07KS4WNQBJmc7735sBojDPWqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="oSrL97/u";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C77E606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C77E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=oSrL97/u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aDikpMOn5+HJJPzpuKasVpb1aKPshcvdq9pRmiwR3Mk=; b=oSrL97/uUH0n4Y+TC/LgB2dj4D
	BkgkcsxFpBnuGYgw1SdrbfjcXmS+AhWdHrsJBYKh8WSLMoZGi5Ygutijd/HHbKdN/t9irez0hOkhU
	iRPOoamtX/goPfMPdj3ly4/3IcmBH/6TTLwtzKPHSbwW6netVCPTXqlmc/mkX9wTYreKD1qbD8/uS
	AutXQPGoaR15mG27AYqo4WsAwTgblyMCL0HhiobcOUQEGxqheO4qzwUNhKpNtN6cGbSwj+SekUptc
	tnoSfW9StReod9M2TFpFSXnrm7AWx4Kd38pcKF+O4noE3NiiuUqmPQ5wOgplqpD2I5ns/dakxoU5V
	8QJ8R/BQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xPMkS-009PY7-1m;
	Fri, 06 Nov 2026 16:25:04 +0000
Date: Fri, 6 Nov 2026 08:25:00 -0800
From: Breno Leitao <leitao@debian.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, a.hindborg@kernel.org, 
	kernel-team@meta.com
Subject: [GIT PULL] configfs: Fixes for 7.4
Message-ID: <au3_CGlshhRsbX5T@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Debian-User: leitao

Linus,

Please consider pulling this configfs fix for 7.4-rc2.

It contains a single fix that fixes the build of the new configfs
selftest on 32-bit architectures, which broke when the test was added in
this 7.4 merge window

Thanks,
--breno

----------------------------------------------------------------
The following changes since commit 05441d697f7f9a927264f4058cbbc6a03dfcac9d:

  Merge tag 'cocci-7.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jlawall/linux (2026-11-03 08:36:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.4-rc2

for you to fetch changes up to 57d94d26ed42773d6378da45eed9de03b116e7f7:

  selftests/configfs: fix the build on 32-bit architectures (2026-11-04 03:09:57 -0800)

Tag SHA: 841e4384ce222f6fe5a4a157e4b934e2e20c3736
HEAD SHA: 57d94d26ed42773d6378da45eed9de03b116e7f7

----------------------------------------------------------------
configfs: Fixes for v7.4-rc2

- Fix the build of the configfs selftest on 32-bit architectures,
  broken since the test was added in the v7.4 merge window. The
  harness casts the ASSERT_NE() operands to intmax_t, so handing it
  the pointer returned by mkdtemp() triggers gcc's pointer-to-int-cast
  warning on 32-bit, and the test builds with -Werror. KernelCI's
  32-bit arm kselftest builds hit this.

----------------------------------------------------------------
Sasha Levin (1):
      selftests/configfs: fix the build on 32-bit architectures

 tools/testing/selftests/filesystems/configfs/configfs_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
