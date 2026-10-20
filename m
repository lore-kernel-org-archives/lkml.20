Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792458754;
	b=5QVvKvFoj4WOjp3WF3YDppMRNS049Ieulc0EmOi/wmBSUg6I8kDZoGj6i8aJZsU4dXKi
	 8kIDHhl/1PHZspgPXGoWeYlVeX6TlwPOm2uMfjzaZFEN25FJKRfnnCthKary8JS49eCcD
	 mO1QFvppqkKLOZQjnQCocnCQt3dJaXyKX34Mf9iXICHTbDs1XGGswth6nCdZHzm5jkaxY
	 5OIA+GRYnSuzgRXYjnhEEuh6WAfgFRuCc/Lxj66fmzzmf/oq+Ir7acz6yK8IYsoY95rjo
	 wqMoCu8AV7XKdCyALR1PR78MmoizSoH3CKeW6XJN+ViKnzY6pj+anWfsg6dboH8GQnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458754;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=EDb81ODBOIviSgbM/9YZM6j2MRvCexhZwKGIcotEK+8=;
	b=u1jSIc2+wL0nCtYR9/wqK58f7fH1NOThAFzuGzFxfzQH/IepT3AUCUnuNuKbErpvFzX9
	 bCNiVJ78KXODFEL5KDQZbIDSvN1xiQ8g9mDmnTvmJ1L/TyG/jKQ7nTXAk+jUNKN/KFpqV
	 77k1RigCXHVlh++Ltm1UScfnrRIvBrS8JOEM8Bng6v14jlGv+rYsf09oKLazln3l7X5HF
	 8qvUxtxw6fWd8JYM3WfyDd1CQCvwgxlotHtnlG1MbfOPUNcB4bny9r0UeDNGHMjc3gfsf
	 syH3Dj4zNSA2ukdPeXfbnZMzZ+/JKEIqHitHQI+/DsHwcL8JGa5axYuNNtan8jSeW1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=QRosOGbj;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC2606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CC2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=QRosOGbj
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6F61640E02A0;
	Tue, 20 Oct 2026 01:12:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id y63A_sgtp2ax; Tue, 20 Oct 2026 01:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792458748; bh=EDb81ODBOIviSgbM/9YZM6j2MRvCexhZwKGIcotEK+8=;
	h=Date:From:To:Cc:Subject:From;
	b=QRosOGbjpqiqFwaych1BAbacNIecd58LtSHGsQmC6syQ/9t+AfdZsTVk1plS2x0+r
	 Okh+2Vsd6q8WeuIFkBthZwpi79VMIVrLhdVxz7OZTsQK2oiUL51L6iCZkhqwB2TpFz
	 byD1aM8cPcQYiczCQhgPZOhfAYUJAzlVcedvnNhSmr8DXY0cURqUY8cYsZvLSx7G2r
	 0qldM1L2NQQ6NA4IVVVPBIE8jKF62VQRam3788L1cpXd2wWPbf/STrxl5X79n9YzPf
	 sXDVYAy3S6584cXGkk+NQHTO5pUcpwAL/+EM3GmOnQ03YTiCkQroi8iuQiVySDOaYd
	 Ur/k76JUFDvvwzDcOA3DhN/bzGSVxA+nbDa9ryTY/NRRI9nsstrrSYdkQVjs3U+4Dp
	 sud5vTC+IrFemejfY/cpfZZftlzISjASzv12YgfwQrOucVRG8eIF7Bu3DjIsQDc0aq
	 G+dg2tz23tIBqrjLhi4Ji6tas/Js06xadEuD5+ZqupBwAmwE+0WUTERXi1RCiEyOpy
	 mCmPKtJchhQhmYz1kr7PAB5cWZbKSSiYaxHOV/hV1u74yFFjOgF/L56RtpQTP/iiIT
	 xLB+PN5UOOZZylfyJSuEG7+XT1VfKcYMbibpPe271khn29uAi0ITa2g3RCN7ZNcFaI
	 AsEIpnu7Ezm2ErZ2NCsGxaDc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5898640E029C;
	Tue, 20 Oct 2026 01:12:25 +0000 (UTC)
Date: Mon, 19 Oct 2026 18:12:22 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/bugs for v7.4-rc1
Message-ID: <20261020011222.GAata_9v7y26cjCQfW@fat_crate.local>
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

Hi Linus,

please pull the x86 spec bugs lineup for v7.4-rc1.

Thx.

---

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_bugs_for_v7.4_rc1

for you to fetch changes up to 1847c80537891baead3975f3ca969233ff7b2a11:

  x86/bugs: Fix CONFIG_MITIGATION_RETPOLINE=n mitigation reporting (2026-10-02 15:48:29 -0700)

----------------------------------------------------------------
- AMD Zen6's BTB has per-context tagging so there's no need for the expensive
  SRSO SafeRET mitigation anymore; add glue to detect and handle that

- Fix Spectre v2 mitigation reporting for RETPOLINE=n builds

----------------------------------------------------------------
Borislav Petkov (AMD) (1):
      x86/bugs: Adapt SRSO mitigation to Zen6

Kim Phillips (1):
      x86/bugs: Fix CONFIG_MITIGATION_RETPOLINE=n mitigation reporting

 arch/x86/include/asm/cpufeatures.h |  1 +
 arch/x86/kernel/cpu/bugs.c         | 20 +++++++++++++++++---
 arch/x86/kernel/cpu/scattered.c    |  1 +
 3 files changed, 19 insertions(+), 3 deletions(-)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
