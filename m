Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793251406;
	b=LZ0FNzAOV8GGlmCW3RZXRXIGRhrOry6Ap8jAt9Pc46wLSy6NlRvIXo22R8W4I5vO/eGQ
	 4zZp03d9OUpXSoue6E9a0m+XdM/wWYg4lL9IYBJikpLZfffDW7g8UbolYzkSoJLlvbaJM
	 V3KlhA1WrcXssHAJxf9P4+pg9EmgH2TcNCZr+W28TnX9ML/EAR+Wgms1MygpD3zvYAMn1
	 D4ismIzCCuAOxcgflsKjJ7C5mtWRXA+YwWCAjqXihQj5dScBCFlBGdNsiYecRMNBO23E1
	 kR+2Lpspt1CtkF3mnZJHZ+fmQzF6Dk3WLzl0JkfX2lpsZ16PKZ9bA2px3ofwaJN7XWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:Received:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3Lg+FgJV09tVnv78E8W4PKyxu20xSS1d1mIdbRMTE4Q=;
	b=tSI4Fq6xtB54ZrWnBAfLZ1OgYCY+zcq6jHxdV2p/AkFhyc3rl/Xn1QoZuN0NLPKDN+nM
	 krBzaoT9DTEXDRz6t4jAhXhTxAEX/1deYzjAgW/QiQ/cPZOjNtV9NrAuiXC1ahQp19/Xa
	 tb7M1MQz5mre7jLk5nmhddD/mjr2+Eltd8W+8KaMtZxU7jiUnHdMAuWKS+a1awJjbDHkZ
	 RNkYIX2Pt4E76MiHIV1QslSzrcrVvpifg0lk3xt49yNEwuxr5FZ+72lCwF11LbWqiW2pg
	 7Fc00jUwJeo+HJMXUsI+lk9juVjCF4awiHNV1IremFZIB7bqiDjuLbmB4DqtLHCBmFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=comlore.com;
	spf=none smtp.mailfrom=comlore.com;
	dkim=pass header.d=comlore-com.20260707.gappssmtp.com header.i=@comlore-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UaicBMbV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D44606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D44606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=comlore.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=comlore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=comlore-com.20260707.gappssmtp.com header.i=@comlore-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UaicBMbV
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c79f306e9so18441706d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793251403; cv=none;
        d=google.com; s=arc-20260327;
        b=TfbNjGm99hU103KyngcUQStgkvERJuGuGSKdn2K997x7bUvI68z5oM3jiM9Oo6RzCH
         nvIkExclMV6cprP4mjdtLF2Ac/tkedBTyXGlEkvuxFkevLiVq+BCvrP72zBGB2AVVUnC
         jzwlyLcMbqjYFsk0ME2mQeK0GPe8b1zqJugy58llkQSt/h/3F1vfAI0gWmz0///Manio
         30LJrtohvOA54M+5B/C0HcamFMA15b8AVUtbcqORakHBfp/zhubmbTpDqbIgcJW9ZQ6u
         xrmuJkVkDPXz/vM8GAPZA6w+XL+x4L0Q3kBIHdAmF8z61cx2tLRdLkqE90zC+8lzZdCj
         dX/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3Lg+FgJV09tVnv78E8W4PKyxu20xSS1d1mIdbRMTE4Q=;
        fh=/gEvHn5QkoJA3kho6yrKIb4q3zkpBUkNNV5mFjJcEbk=;
        b=ohoHiE23Y9/Z2BJjf00ZZxFQzFXPZHpsLQn3sYEq17nENkscrsbhYTF6I8qpkNkYoc
         gF85zIlkVxA4qIDpkpINyL3Mgk1tf799nfNco9DJBlz8tRzAvNenvgJuu6zPE9kVj36h
         71kGkXqJbGuKKVgeUMHSODs1wr8H3ao4BHQFUNMhLvGR139errGeI6UZ1wvbURi4IPnz
         VUFXY7PuIhRyvXC+VWsEV7usiR1e/HzbrUq8qFcl+lC/i7FKOxzCfBEoCxEpF6JdEHqY
         Zb9SG4xI8MW0tPIGRT2fCtYRHOi6nB+s2fKoyolu/+DzkeOHI3lTaRnblLjWMgEME9ml
         sD2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comlore-com.20260707.gappssmtp.com; s=20260707; t=1793251403; x=1793856203; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Lg+FgJV09tVnv78E8W4PKyxu20xSS1d1mIdbRMTE4Q=;
        b=UaicBMbV0EubpHtn37WWWv5TXo6Wv++xAzEvkN1YhxtdJz70Evg5Pv0Z7+IWc8RSOD
         u6F5hAWybeA3/xtJIBzMpUKiR803HNfQDigSQ81/iRPhRrN0bv+pNUQvaetrdIPRrR1O
         e85Wenq7AMShyUamuJ4oAuY8xU1/aBraz7I4vwrRKJuC8m6yNwM4P2eJ9b46g2lYKlk3
         EXqw/e/IVPbZuzVBbb0W/GVpCfBXNJhtGk4AaJFkONBf/38m+DIVO3usErwC9GbYOSct
         O8DKBXWehz6bZxC4uxhNVZnBe9HPNcLafboRASYDcG+x8XEuep01CisxfV3r8Pj9lbyD
         0s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793251403; x=1793856203;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Lg+FgJV09tVnv78E8W4PKyxu20xSS1d1mIdbRMTE4Q=;
        b=JlMQJ609TcVItqzOlKV9pUe+ztZsvqr3EsBfU+EqmxoMumHJKZD+tHf0H33IQwIOoZ
         rh8QyD3tZrH/F2cOsMrOh+G3YBq0uB1NS7ZlC6DKJC+ouyrkymbqUII4H1+L82a+ZVZr
         e7qKF7vATlfTZmlCVrkq0YhbWjYPsgdbEZyLOpnfxAanKzUqtUatvFI5w7Zg9kCSu5je
         JpDg8PGeZjqbVK2vsZKEOMyZ9E28ytxjLi+YVccl7GOqqLDC+pfVFpr9/QU/r+yga3gN
         GcIDvUWhBB+c4VVsVu0jIIaDgRK37uoNXA2VnfgtKZEQ5njiYnsEzmA3bCXft8kxn44L
         0LkA==
X-Forwarded-Encrypted: i=1; AKwUvBybtTsWD8pwdD5kWjSDUdAEA2SgkZ8gBdtFWfrjZgL4Io8LoJFTGOs+Cvs1YSQw+xHX/8HxY+hVe7jtMxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0EXydLMwtV5siEA5wYlx2APQcUbEyutMuRRRSDCPRzi0+L4+O
	/p2adG8NDJ8JZiju39tTfAywN1wZL4JD+USbsNejymRfxmfNQMIC3nVrPLFLikYhWxKdCQ8D1YD
	yu/RpBSbQ8mXg1Nfj50CTNkYyGmI+t+a/c+B/oMEy
X-Gm-Gg: AYBFou2O3xJP7CQcvDX8BmCH0Og8vXgFiTUwUaJ99UdOCgtcuSwYwRLuSOorw7z22yp
	JFW+vTBY0EItLfTavdnqDauAgq+kYJ+bUDfe79+Rb20MEzXUcsN3kjVcWPhQc9QawU07T5BGztY
	VRQSerrxI2KD5Z5hyrC2elWr+1TULGoYqzdttTDPH2UkVr6LVuQjmK2c2dE25TQA0nYp17re1Lq
	AcH+UaZcg8KceaRqEkPs1Xa5JLNQq8XZvA7AlwGjM9tDQegVcFD3YMeAHzhWgocJdYC7sNii5bP
	aaX86AaCC8e4MgROhsgcaBxcPz3TuAa6DO2iGaJh/DiKOIunKEBFAXpF+WA0czL5XRrngHq3vbx
	CXtn2Wti6jtbw4OvLO2o+wMvZGG2n5nivvSz9k21xXFDAHsyvdG7nTziU
X-Received: by 2002:a05:6214:238d:b0:914:47db:4640 with SMTP id
 6a1803df08f44-91c7cf96bb5mr75175836d6.19.1793251403564; Wed, 28 Oct 2026
 22:23:23 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 00:23:22 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 22:23:06 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 28 Oct 2026 22:20:28 -0700
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 28 Oct 2026 22:14:21 -0700
From: Ted Bullock <tbullock@comlore.com>
Date: Thu, 29 Oct 2026 00:23:22 -0500
X-Gm-Features: AclHuK_tNNj08QVgFsStypVC3FMQXg1t9_UmaQA8dmxpz6COnH-A2PgFV31jkL4
Message-ID: <CAMwFX_CpeF-K1-9R38Fscu7EghETOOV5FmJvd=8No7YhapvL1w@mail.gmail.com>
Subject: [RFC PATCH] drm/radeon: UVD GTT corruption and RV6xx coverage
To: amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, 
	dri-devel@lists.freedesktop.org, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I investigated video corruption on my older iMac7,1 (RV610/M74,
device ID 1002:94c8).

When the decoder was reading compressed video from system memory while
the GPU was drawing, it would corrupt video frames. Moving the input
to VRAM allowed frames to decode correctly. Disabling graphics draws
also stopped the corruption.

Here is a proposal to keep UVD buffers in VRAM for this family of
devices, as the driver already does for some other chips. The patch
covers RV610, RV620, RV630, RV635 and RV670. These chips share the
RV6xx decoder path and legacy R600 firmware, so I think they are
likely to have the same hardware requirements. Someone with the
other hardware would need to verify that.

I tested this on Debian.

I used Codex to help with the investigation, testing and patch.

Signed-off-by: Ted Bullock <tbullock@comlore.com>
---
 drivers/gpu/drm/radeon/radeon_cs.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c
b/drivers/gpu/drm/radeon/radeon_cs.c
index 2db819a..9bfd3ea 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -125,11 +125,16 @@ static int radeon_cs_parser_relocs(struct
radeon_cs_parser *p)

 		/* The first reloc of an UVD job is the msg and that must be in
 		 * VRAM, the second reloc is the DPB and for WMV that must be in
-		 * VRAM as well. Also put everything into VRAM on AGP cards and older
-		 * IGP chips to avoid image corruptions
+		 * VRAM as well. Also put everything into VRAM on RV6xx, AGP cards
+		 * and older IGP chips to avoid image corruptions
 		 */
 		if (p->ring == R600_RING_TYPE_UVD_INDEX &&
 		    (i <= 0 || pci_find_capability(p->rdev->pdev, PCI_CAP_ID_AGP) ||
+		     p->rdev->family == CHIP_RV610 ||
+		     p->rdev->family == CHIP_RV620 ||
+		     p->rdev->family == CHIP_RV630 ||
+		     p->rdev->family == CHIP_RV635 ||
+		     p->rdev->family == CHIP_RV670 ||
 		     p->rdev->family == CHIP_RS780 ||
 		     p->rdev->family == CHIP_RS880)) {
