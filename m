Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4957C3AE6FB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790321107; cv=none; b=BqY6MG0Jvbu1N1hZSwaY4DsAEGhx1oGY8+55o5dKU39CIqB0BADjw5q9HizptLqUtCHaiLsJVI0hiPTUVRa0o9T27kb4Ugdusn6/RotR8dZ6MDJUGrjHmsRaqfzybAYjfYJOMvYPUA34G5RZ23NTukER1aAMTNWmKWxCJwtJtGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790321107; c=relaxed/simple;
	bh=ersj+g9wuWICEsSor+fBJ93A/gEubvUy55x2siG8kjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n/Aw4DIMNCvvWs8D5nb0zD800BKN8tlZKW54tvYkS7hOqjGp6d9DJWlMOKWEXyqq/h9p9VFzr1BUjcRAnl7/aYuGQyw5vf8eURTqS6ENlc7BD31r+JJS5ZASWYgAdbK19su4ENVbdMU1lBaL3+4A4JNA9UgKYoJ0365Gh5+cnuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9Xc6Qa5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9Xc6Qa5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so3208025e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790321104; x=1790925904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJsFR3C4BXwq6V8a4asvimu14gijx70uQQhfBt9Dfjk=;
        b=E9Xc6Qa56L9aSYeXqTEY5Ftw8yCoAtigQWrVJluFs4otlC4tuxE8gxODr/IioQh05C
         6idGdye2KGYebNk8PgAG3+dTVF6MzLIczBzgUADt3fYRQ6RfZ+9v0ifaNx/OF+Aecfh0
         nYKfzO6iNx5kuIVitzc1T+OUkeL/3L0ov5pwzU1VDIjRPjX6gYQmaSEdPnoVQEUFuEU/
         eLXbrmqvbheZGbziRSdds5hJ6nAVfXv8umi+fqD8XYifKIgI39DwgpHUMC2nxgKt5HSB
         Bx32wzw/kOvXD5UEVsXDYThj3zIEGlWg/ZVXk6qkzUcC/Trv9Zcp7vg+Q1KepSO9Ej3W
         g1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790321104; x=1790925904;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJsFR3C4BXwq6V8a4asvimu14gijx70uQQhfBt9Dfjk=;
        b=mPatTIpZVxUaKqVQKQrE8EBGldLbj8K+KXhOWS9vDGBcawJlic0qpvsAL70bTkpyuh
         fEPfx9hCA3uLlt+6YCVhjVQQcGvXVxeL5ZSBrEJDW11CIdSb/wEpOLjcvz+GxowrhN6O
         qE++sujZ3tMp93yKXlZXT+BL838cpUztc/j8wuzdWLaO8iyeHeyqa+VH+G5Cbr5xHfHE
         slruYBz2IF+IkHEl7eemC3ZF4TtVr6iNCcbqf2eAHk4KVab9rivYKTTc+Kqkd1D8S9Hr
         eG4lAnhKmsu6CyVilb04UDOGwspvm/YdaSsbw3Qd/H7V4lpEeCXw9MB1oJZCpGy9bWJg
         vy2g==
X-Forwarded-Encrypted: i=1; AKwUvByt/L1Hm7dCrQ5c8rI39wdqcaP1wndPjkk4TKjfzlnnB2qrtm1QlAmfnjusLynbl5YRwTPQMHPwvQBIc9o=@vger.kernel.org
X-Gm-Message-State: AFuF++ltkmDAwvbmkP6uji0LkuJXUzLV6EDM2mJVCnyUHF7GpQn9kom3
	TyFzn7Raa07mZ1VfSa5S0ghGfhan5GtwZZHU0knadb8qEwpVjWIxhFLy
X-Gm-Gg: AYBFou3CI+kPo5u1Cu7HAVKmDkx1fe4zdL3FVaEz9Sik5MzulUI525K+T1+UNJbZ0n3
	Xej4TCV0gBQKg0z0Ax/GJ2xXW8Texw0L84Q+GxiOQC/w90wBv90pc31jkqdEHhPnzpoXdGJaEey
	eSXQHLgmlj2K09WV+W5aAaGfsy+TRJyvCXiFBtaT0i8zI4am7y8gZcXZoxYPfHf2x3XMJTzNAqR
	irkiTT55wgtHCe10dmEY0+B+CD4MwE/v61n/LRoLQVsso0ElbLoonKtaEONtpNm6RAgSp9XArzL
	uLJBkBb9BZAma8Egri8a+bILZkYcNdYpuPGguOs5iLTHJweCdQ9wsvzDyWP7cWzqi7AgLGe+3fu
	qqkRHQ++dDT45U42DcZGQ2S77eWJ1AREpNaKzfc72ZKxymJvbbZv4wIBbMpkNy1kCrMK2JsOyGl
	g5wpRcdDK71kDYT2LAjZCvHO1Y9ziwfrfsjqST8xB4Rf8MJGT7/2Zc0lxtBVPEmVZsVoks+jsWJ
	OSQ0g==
X-Received: by 2002:a05:600c:1546:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fe66f4f59mr83248455e9.23.1790321104123;
        Fri, 25 Sep 2026 00:25:04 -0700 (PDT)
Received: from abcmhome.hgw.local ([83.66.10.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm201790475e9.12.2026.09.25.00.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:25:03 -0700 (PDT)
From: =?UTF-8?q?Ayhan=20=C3=87i=C3=A7ek?= <ayhancicek@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	=?UTF-8?q?Ayhan=20=C3=87i=C3=A7ek?= <ayhancicek@gmail.com>
Subject: [PATCH] drm/amdgpu: extend MacBook VRAM-at-0 workaround to VERDE
Date: Fri, 25 Sep 2026 10:24:44 +0300
Message-ID: <20260925072444.18982-1-ayhancicek@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing MacBook workaround reserves VRAM at address 0 for
Polaris ASICs when the iGPU is enabled. This prevents cursor
allocations from landing at address 0.

A MacBookPro11,5 with Radeon R9 M370X (VERDE) hits the same
failure mode. Hardware cursor updates repeatedly log
"DC: Cursor address is 0!" followed by
"DC failed to set cursor attributes".

Extend the existing workaround to CHIP_VERDE. With this change,
hardware cursor operation is stable, the cursor errors remain at
zero during repeated cursor movement, and cursor disappearance
and flicker are no longer observed.

Signed-off-by: Ayhan Çiçek <ayhancicek@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 1bf2a42fa..9e7f9cc2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -1086,6 +1086,7 @@ void amdgpu_gmc_init_vga_resv_regions(struct amdgpu_device *adev)
 	case CHIP_RENOIR:
 		adev->mman.keep_stolen_vga_memory = true;
 		break;
+	case CHIP_VERDE:
 	case CHIP_POLARIS10:
 	case CHIP_POLARIS11:
 	case CHIP_POLARIS12:
-- 
2.55.0

