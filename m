Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575433;
	b=PYtlkQPG4lRimidKeMzkkvJCAHmNGBUTFlYjxLEFB/MbBRH0+7iUiaLVCGnkH0NCC1tD
	 /ADY7ItffK4mmgZxsRY7Dzpj1M/lLP4TLUVN90BvXCxqpYiP7ccfqvpKhFpXDll5W4YoO
	 jnhBwrlAaDB+UiH4m0slxDXulBCB/I7erk00vYAtE2fXrqvrV9B7fBr1eDNvxXKIQZg0M
	 xaELw/kz6WIZrId63hhbSLsCgzvdEk7HdKC4tbBDCrxiQUX5L4nXIpnurMSODaCtV70af
	 6R2HlGydb1KqTyb+Dm4UFEuZCswKA3pac+5s3CHT/Dh0vGzLz4Cke43NROdnWE8hfjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=ff70TfoYW5vv+iBaKSoq6x1++Arz0G5jzkSXdb473iw=;
	b=cOA/B8bHNqEsGv+98mwP2IGXxO6iirJEtjx3AlyHNbrJrL6/qMZ90zwdiIfXD1x2wx1D
	 rdrqGkWotK9i/Dag3cttfMYiCLhHk93hT2zXitDkjZf5nbTHlAsmdhfdAhAtd2N5cEuIx
	 /H5ftkUNRKCpgNazDQBsKw5PJyL3K6tp9pxqox1BtgPTjON603uxXugDUlGcM3xshQEep
	 AqCy3dqXFxGly3TckJsvnvgG465qhMPo0PZCav5SwScVLFCofiJdViD+eS2dY82xxmVW2
	 ifNuVJIoxK15PV4fNXP+uadTczvdVDMDTpMgTswHhewxp6XTKBiqEbm5tUs/XKO/ylA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0Igtgr9;
	arc=none smtp.remote-ip=74.125.225.130
Received: from mail-wm2-f2.google.com (mail-wm2-f2.google.com [74.125.225.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B19606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B19606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P0Igtgr9
Received: by mail-wm2-f2.google.com with SMTP id 5b1f17b1804b1-4a210b0d5c3so9994905e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793575431; x=1794180231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ff70TfoYW5vv+iBaKSoq6x1++Arz0G5jzkSXdb473iw=;
        b=P0Igtgr9CKLZNf9WQ7WY5CsaYzVM5/E+a7ccOVfheqa6wyqkC1uWRiZwgostOMzsyZ
         CziX1u3/464O4IXDH4SUbCB/fnlsi0T4l+vsfIMTvvn2urZd1lHSe9ebB0RhTuL/mBQE
         fI7crULmzTKXSfd7DA3ggoXEIcDk2yP0OqM6cMDpx2ewh8ZnnEX2K9Cj/jwcxz39f8FJ
         L+jzMeg3h96w6/eg9JoIK+hWU6ePIjojoOfgOWU9h3dhPiPYc418jLLjjFRopaEohHSd
         BAxoENydY8PYdMtOgF16TkorKib0k0a2A11cwqoIZFmbb0WuCJLLkCTvanxvh+dr1DWp
         XKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575431; x=1794180231;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ff70TfoYW5vv+iBaKSoq6x1++Arz0G5jzkSXdb473iw=;
        b=ClwbVsA0jkczwLUp4mDWBmE09JFAZSqvrVPOBpWO0Rx7cgKTl/K1iGjjzxdCEX5Nv5
         HIMPyrH9T1wW8F8s107WJxEkaR4n0qemy/IuoQmup7VlVvqi2zoGpxbqXvsPB5R36/ac
         UDJhigIPRK9ZfR1qvdkFS7m4zWtsxxkpPFL8yf+yleUYbQkMCpr23ZCyDsYy1k2ObSZj
         6vjX/CbhhYpPqZyt3SXgNLmzC1c7bOh0iCVGpCsUf0pykZbHMz6xmSHc6QC4z3JN8AxS
         JVdsqP8S4zMir8H1vWdprZd7q19lLMHzgt7rNGY2Ik1HNSPpTf/XTkks4zbLQvZY1tBH
         bw2w==
X-Forwarded-Encrypted: i=1; AKwUvBwlfdqBhCw/SokafSOTdYIHH3IKfPe5R/z8fUZl2M3BsSb63A1eOYTI7epdu1MODY/Zc2Tp2v/BOcNthkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5rbulsT0Sd4vTB5QW9Q3Qub2rFZQ85r6H+tli9td0CJZGuN5u
	msvon1Hb3Li7pdNnku103CKYUmfkmHeM+1gC4WumfSAKi0lPN7wKakBM
X-Gm-Gg: AYBFou3ooxFZBD5nbnc9ETaN5bQLC1alai26PRLUBMLPQUlRXT237nw/G5CvRbX7G6A
	FzjobqjfY8jW37jqOraOcf5RhMe9tRuduZawwyN6vldLofH98bIlnuIDoP5VD9tufJgDUhH4rs1
	XWLkf0XaF4MpiVokvlouqUl3MZhTDu01i6cJYxZVIGscufLAguBF9DZnUPjQRbjTEug1P8sZaaF
	apKMDmodcyYjPCmH6UXz2puMaF2rHOSdfiU0PDxrWOr2IQSR+WfsZTR0FHMkiULvmpTAGKdk1tZ
	AS2jEtHi2Fmmoq1iHzf4R81H9yrO1m1b+qxbM8FPG0AGBTuu6U9tR6YyoZLo6fJ+Jhsv+AiE3Ui
	9BCveCqLaudZSgnKChfjGztNDeeSyMrP3aIjwnGke1gfRCMdXEDH/RzeCLa5Z6OgxFvoZRxJPVE
	uYSVOpgaasuEdvJdSylUkhxWhZCEOaDzY9ipjbL5V4/oNv6Tmf4kRQifxyKMYryH3TEJBaa1XKy
	dBZ8RgJ6Sx1q38ssCb5u+jjVBIxy3ty7oXpHH65vatDi8psz+pOnQKtZcC+wFVrcou8/A6d6Gda
	56LV0Y3jXTqi2I/OPtGiXM+G7LbeVJynKw==
X-Received: by 2002:a05:600c:3ba0:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4ac151a84f0mr192130815e9.3.1793575431515;
        Sun, 01 Nov 2026 15:23:51 -0800 (PST)
Received: from [192.168.1.7] ([31.94.68.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04723sm342967035e9.5.2026.11.01.15.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 15:23:51 -0800 (PST)
Message-ID: <54c182e5-1474-47af-ae72-d28560a12bcf@gmail.com>
Date: Sun, 1 Nov 2026 23:23:49 +0000
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
Content-Language: en-US
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Lane <richardlanedev@gmail.com>
From: Richard Lane <richardlanedev@gmail.com>
Subject: [PATCH v2 1/3] drm/amdgpu: use pitch and surface offset for GMC v7/v8
 fb size
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

gmc_v7_0_get_vbios_fb_size() and gmc_v8_0_get_vbios_fb_size() currently
calculate the pre-OS framebuffer reservation as VIEWPORT_WIDTH *
VIEWPORT_HEIGHT * 4, assuming the scanout stride matches the viewport
width and that the surface starts at offset 0 of VRAM.

On Apple 27" 5K iMacs, EFI initializes a single 2560x2880 viewport at
boot but allocates a 5120-pixel stride surface (mmGRPH_PITCH = 5120)
and places mmGRPH_PRIMARY_SURFACE_ADDRESS at a 3 MiB offset (0x300000)
from vram_start, spanning [3 MiB, 59.25 MiB) in VRAM. Reserving only
2560 * 2880 * 4 bytes allows permanent TTM driver BOs to overlap the
active scanout and corrupt the boot splash screen.

Calculate the reservation size using mmGRPH_PITCH instead of
VIEWPORT_WIDTH and add the mmGRPH_PRIMARY_SURFACE_ADDRESS offset from
vram_start so the full active pre-OS scanout region is preserved.

Signed-off-by: Richard Lane <richardlanedev@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c | 8 +++++---
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index c09f5153679e..00704dbfc1bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -929,9 +929,11 @@ static unsigned int gmc_v7_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	} else {
 		u32 viewport = RREG32(mmVIEWPORT_SIZE);
 
-		size = (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
-			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) *
-			4);
+		size = REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
+		       RREG32(mmGRPH_PITCH) * 4;
+		if (size)
+			size += RREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS) -
+				lower_32_bits(adev->gmc.vram_start);
 	}
 
 	return size;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 15592027e7c0..a64a3cc07858 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1037,9 +1037,11 @@ static unsigned int gmc_v8_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	} else {
 		u32 viewport = RREG32(mmVIEWPORT_SIZE);
 
-		size = (REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
-			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) *
-			4);
+		size = REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
+		       RREG32(mmGRPH_PITCH) * 4;
+		if (size)
+			size += RREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS) -
+				lower_32_bits(adev->gmc.vram_start);
 	}
 
 	return size;
-- 
2.55.0
