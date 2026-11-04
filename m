Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793783791;
	b=Uk+J8Sko7SFSuvJfuQ791fmAZdS4E2o+W14gkAhZv7us6L70r1IEVMroc7azuU7IiSJM
	 dSzthFHesp4ziOIMVaG153PGMzD0GKBoV+m/IVC4Q4dz71x06Gs28zxGO+ubcjBylxzcP
	 c4zDFzimBwIjkUe8dZFH9gV6lX9uomcKGFY3imbkyN5hNslesAsU/jkqp1k2sdMFdamqP
	 ERx6ELJKt5NTvMyJHSWyMtkxNfYHQ2XVlGddXPTFjUHOoKOTFa/DelczBVVwVB7tQfog2
	 XBsHZQVcai6GGfjTza1hxOIqvAmBQWWXVQPEuHemcAwxeEOKGO6sZRFwYSpGCT6QObg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783791;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KLVschr4w1v531LJyxLjNgJ2eXfNx2x1JkuwlBYwHsM=;
	b=lIfGvOa84PndrYEFfmrQMgV9HtSKL1XKW5yMxMh8VnUyiAce5wP/YQSTLT0c6qzsIXaH
	 g0RYOGcCMg7GaHcthr9U2zqL5cWco6HqNDx2O3R9QWD1IsXEpF1u6ihuu23RG7Q/JMtsN
	 f3fEdb8KpfSSCLi6e91DcSxPZKZlw3HDwDHGd1Xl+g/R50WmhdSgGiGbyJwtt/8SIFR1P
	 hp0C8KWb6v5vV4HIhuUIR6jvTD/43wERxSBWGGlD+5gMeH4QaSBEAu1Uu6jco6Y/xagBX
	 OKsA/Si6jHbYHcU23dhO3mskpkul2oyAN9IBAEGDV5BUK511h3I+UyKKTAHf79ihl5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KXI2zsBc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED49606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED49606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KXI2zsBc
ARC-Seal: i=1; a=rsa-sha256; t=1793783764; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZTNSMEYivhuNEYPMowb5lXJxVRgR5RBmL+0PjfXusSQoz1fnX4wtynrcVy/nhAoOd9zCM3NhiP0e08snESGWMcwC23Gw7PxTcKUl43gK0++OHOoUZnISEQX++vlYtO2VpTFxCkzMtfZMCjw+wmcnQVuCpS56w/i+mTvahM2fYPg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793783764; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KLVschr4w1v531LJyxLjNgJ2eXfNx2x1JkuwlBYwHsM=; 
	b=jIQFVUJaPQCGdpNLq/nNCuyRSdzDtjyvv1AtBAk02ScY7cw7WEM65ed9zV+amgdEEJgNiEqppzqVz9SAXIiXPlyUWzH0GTpWshoIsCyt2yuIp8uDD3OZfB3SHLBjsuVgQ9h8SZO5WeU8ujGwAA4kujNNLmZu3ArVGl9OJIQ2a9k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=robert.mader@collabora.com;
	dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: a=rsa-sha256; b=KXI2zsBcf2L2Cnnyb6PG1UcYiCa9qRyCutNWfQJO7FjjkJLQXl/32H426AXH0jAKWAG0oPuqn43GropbAI15z7O5i0o4bA8i2mBSsV876c+VvAfLF9MDqVhF/GKCgOwanlmyJD+eUrnKcpIOXiRmsTLw8OZrFuGBClGhn+duTuA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=KLVschr4w1v531LJyxLjNgJ2eXfNx2x1JkuwlBYwHsM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793783762414909.3026191968756;
	Wed, 4 Nov 2026 01:16:02 -0800 (PST)
Message-ID: <4082e72c-dba9-48cc-891e-1e6be5616fb4@collabora.com>
Date: Wed, 4 Nov 2026 10:15:57 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] drm/vkms: improve color curve LUTs precision
To: Leandro Ribeiro <leandro.ribeiro@collabora.com>, louis.chauvet@bootlin.com
Cc: airlied@gmail.com, alex.hung@amd.com, daniel@fooishbar.org,
 hamohammed.sa@gmail.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, pekka.paalanen@collabora.com, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260804203351.148521-1-leandro.ribeiro@collabora.com>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <20260804203351.148521-1-leandro.ribeiro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks a lot for the series!

I'm using it as part of a branch [1] to test my/our Weston post-blend 
color-op pipeline implementation [2] - including additional commits 
using the new script to add gamma 2.2 and 2.4 [3] curves. The Weston 
tests compare the vkms output against the GL renderer for e.g. NV12 
bt709-limited-range bt1886/gamma2.4 content - successfully (i.e. the 
results match very closely).

I also went through the commits and didn't spot any more issues. Thus 
with the 32bit issues raised by the bot addressed the whole series is:

Reviewed-by: Robert Mader <robert.mader@collabora.com>

Tested-by: Robert Mader <robert.mader@collabora.com>

Best regards,

Robert

---

1: https://gitlab.com/rmader/linux/-/commits/post-blend-2026-11-02

2: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/2157

3: For SDR video, see 
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/539

On 04.08.26 22:33, Leandro Ribeiro wrote:
> Currently VKMS only supports uniform LUTs. Besides the userspace
> provided LUTs, it also represents color curves with LUTs, as it can't
> simply implement the continuous curve formulas (floating-point would be
> required).
>
> This adds support to represent color curves with non-uniform LUTs,
> improving the precision significantly. It also provides a script
> that was used to create these LUTs.
>
> The optimized LUTs use more samples in regions where the interpolation
> and quantization errors are higher (usually in regions with a steeper
> slope). The LUT generator script compares different strategies and uses
> greedy subdivision, which outperformed the other methods, to generate
> the optimized LUTs for VKMS.
>
> Leandro Ribeiro (11):
>    drm/vkms: rename VKMS_LUT_SIZE to VKMS_GAMMA_LUT_SIZE
>    drm/vkms: allow color curve LUTs to have different sizes
>    drm/vkms: remove TEST_LUT_SIZE
>    drm/vkms: remove linear_eotf
>    drm/vkms: improve the way in which we access LUT member
>    drm/vkms: rename struct vkms_color_lut::base to y
>    drm/vkms: rename get_lut_index() to get_uniform_lut_index()
>    drm/vkms: add support to non-uniform LUT for internal color curves
>    drm/vkms: test sRGB and inverse sRGB LUTs using more samples
>    drm/vkms: add script to create optimized LUTs for color curves
>    drm/vkms: replace uniform sRGB LUT and its inverse with optimal ones
>
>   .../gpu/drm/vkms/scripts/color-curve-lut.py   |  561 +++++++
>   drivers/gpu/drm/vkms/tests/vkms_color_test.c  |   46 +-
>   drivers/gpu/drm/vkms/vkms_composer.c          |  127 +-
>   drivers/gpu/drm/vkms/vkms_composer.h          |    2 +-
>   drivers/gpu/drm/vkms/vkms_crtc.c              |    4 +-
>   drivers/gpu/drm/vkms/vkms_drv.c               |    2 +-
>   drivers/gpu/drm/vkms/vkms_drv.h               |   13 +-
>   drivers/gpu/drm/vkms/vkms_luts.c              | 1469 ++++++++---------
>   drivers/gpu/drm/vkms/vkms_luts.h              |    3 -
>   9 files changed, 1383 insertions(+), 844 deletions(-)
>   create mode 100644 drivers/gpu/drm/vkms/scripts/color-curve-lut.py
>
-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

