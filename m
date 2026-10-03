Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B126433DEC8
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018019; cv=none; b=Dunfo+OuV5uXLz1PjPLF5KS/QaS8cWl6w3Xi3UxfIVJwRW+L9F5TNdC1co0KQqOvc/nFqH8oJrgMu8MnObBqP561DI3ar3N9pYYtE9H3ix0Hrnf5/dv3RCVloyAAMBJ+MeFOR25bR1Wnkj/1tc5knY3BB7LDca+FrfRmqYVIaBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018019; c=relaxed/simple;
	bh=Gqln2HSTYBcxm0OiDBkTUMVKuzF33da3ftRsy7DC6Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UIrfWpLCPcAcsRDl2hLFmR3Q3mA8rnL8FlLYxmOht4H0ZhXYY6v2x9Is4mZIlJXPSyVpJpRat7u3aP42KWRo0z51gicKJsIDfXg/mQHMuNrWCyt6u229X3zqlAMTX0U3jIsfOqHKmMY8v1CxhXiBlVuORjuQyH8BGhFAaIcZvuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImGZt3AV; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImGZt3AV"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e3092c8667so1401755ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018017; x=1791622817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XiAtNXBcVho7+bPRrrdtDPhvWeEZ2yz41dniWV/stxY=;
        b=ImGZt3AV/Di323IXbpt44geTKCSZv6ZmKrIqtO4pTUcfdEqRwj9VH6IKXaky2zuxAa
         4Zbmhw1xGoB00AVnf/OAbwrOnx2z3MxAkeezOZjvMQT+KTTQOphot4hJwtFZIIy6BclX
         COBu52y+6gAdovwFt3RBFu35QOep6h/9d14AAnpbLD3FqWEJaYDsL9QYiWNL4de37OJ7
         YLUlO1vuXYalXMCtfEMEE0gMHdvmkORffRCGw3Ow1X42Ary0cIDwJVvL5rmJW8GtKwYU
         93SSKQmpkFd9fVdkGs8yY/M5gy2jjBWYFYOzjkn/w00xDhIbEXvKuN6MrsOMHmbyNG2I
         zeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018017; x=1791622817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiAtNXBcVho7+bPRrrdtDPhvWeEZ2yz41dniWV/stxY=;
        b=cIeqLzpE+PfX8CaC8yCD7jyHrDZiWkdyHIxXchARtTmS502UP0H+JkDHNaKg4M2CrA
         TgJNxVlFFqrR1rHl9lGTuySfN0B99VUkTqL1brK7mBr2ZHASjMJfrzbfZgqxYxvJZcO9
         tB+x1iRf+MzSIpMpmQJda6lwK4bpHnCeX5P2dMhtBPMXk0dQwxfUojNUIOQ/w/eiqbKO
         MMg/li6yEgxftJW3ichRLVGmp54v7Jr/RVYIQ9qVoNLOWBshCrMPOcv5B7u4daDTFXwi
         5CbY9DlLEzNXgeBJwQVZEzOUyrbu177iNV7xlLv/CaCB97Z0PccR+ngkJXE/K7KZFbkk
         B5Mg==
X-Forwarded-Encrypted: i=1; AKwUvByHi6HT/MtDfmPUnwe1U6A4ZlvljmlX8LWDrdhxwLZ7RUpVYRbAy3zHav2RVdojsM4XgGzodaZsH15NMcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqk6BiwtN5WDHBvFawbrJY/OCJiMFdJ8t5bD1oiBFS2K39zT0v
	10IPefK92kugqYBH0RroeqkAxDVBxuK3seDIRUq9r05rUmfombAdWAa1
X-Gm-Gg: AYBFou1yg+eQhPSNTUZQL1ItYzfmSe7iSDAUu8piF/pwlf7kJoZ6Bg/GcMdpW5ioXmo
	6ZKql0OHYAD2Feq2xVfdEiCr9VNmuuVyvf6K37Bof1PwKZkDaeEsBUord69tRZGBUA6mYYjejI2
	1NAgGxLQgtah8ap8QimUn96UPH/KcRlD7uv95BTHYZndVgocZcmHCEnu2k8Id+FgrolCY4+TMQn
	oJVGFCpgASwzoRrcwUXFYWhZf1DvJMfxpY/UxmT7DFvrA8AGgfO7G2vHKdlMSLeFeSnxmuhphKu
	kjvyWn8vdnQafdvL3Zq3hz3m/+GPvnm3HBkgm3RqDjJpJyuwi633OmjEWdC5we4OVHPRvAh43+Q
	Uu03vLYVbtFIfBBawnGXytmVnOxO+vtsBoNdRe0JqjTjkdESdHgIGO3EtVxmWgV2DcNJwzFFW+M
	ACSkCzjF81FvaGNqAB7TRaBucqct3Sz8Qx0CQ0iMbwRyZokfyEQ4x6BXkqMkKGjkEEHw==
X-Received: by 2002:a17:90a:ec8c:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3a6ce82e436mr4223235a91.51.1791018015805;
        Sat, 03 Oct 2026 02:00:15 -0700 (PDT)
Received: from localhost ([2602:ffe4:806:2289:21fe:8574:7a8d:1dce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e48c38bsm2314877a91.9.2026.10.03.02.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:00:15 -0700 (PDT)
From: Evanshenf <archwse@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Jianmin Lv <lvjianmin@loongson.cn>,
	Qianhai Wu <wuqianhai@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>,
	Xi Ruoyao <xry111@xry111.site>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Sui Jingfeng <suijingfeng@loongson.cn>,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/loongson: Fix framebuffer selection in async cursor updates
Date: Sat,  3 Oct 2026 09:00:13 +0000
Message-ID: <20261003090006.4e29fdce9913-1-archwse@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An asynchronous cursor update swaps the new framebuffer into the live
plane state. However, the driver reads both old_fb and new_fb from the
live state before this swap. When an enabled cursor changes buffers, the
address-update condition is therefore false and the hardware continues
scanning the previous buffer.

Read new_fb from the new plane state before swapping the framebuffer
references. This updates the hardware address when the framebuffer
changes while retaining the existing behavior for cursor movement.

Verified on a Loongson 3A5000 with LS7A2000 using 32x32 and 64x64 legacy
cursor updates. Callback counters and read-only register observations
confirmed the asynchronous path, the stale address before the change,
and the new address afterward. Same-framebuffer movement and cursor
disable/re-enable also passed, with the primary framebuffer and mode
unchanged.

AI assistance was used to investigate the existing report, prepare the
fix and test tools, run the build and hardware comparison, and draft
this message.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202311152357.4KFS0M8f-lkp@intel.com/
Fixes: f39db26c5428 ("drm: Add kms driver for loongson display controller")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Evanshenf <archwse@gmail.com>
---
 drivers/gpu/drm/loongson/lsdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index bcc0ffa..7b9c65c 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -230,7 +230,7 @@ static void lsdc_cursor_plane_atomic_async_update(struct drm_plane *plane,
 
 	new_state = drm_atomic_get_new_plane_state(state, plane);
 
-	new_fb = plane->state->fb;
+	new_fb = new_state->fb;
 
 	plane->state->crtc_x = new_state->crtc_x;
 	plane->state->crtc_y = new_state->crtc_y;

base-commit: bca45af5998a05f34b13a2ef11e639bac9c62643
-- 
2.43.0

