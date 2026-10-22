Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687568;
	b=slbL8tdDN+xFUooDmTcj7ijhbNyMiAuZpu1XswHuO7Xsf6fjwaDb5MD0jsoq6I1AR7Vf
	 iyKvCO4QejxJQ2/WBJ8WiGF8r8YdQt87hO0fV6cWESqQzBwaZgOnimTApnAgB0fCHgX6o
	 I8w/hLH/SUr7r4KDCyPa46clNC/ZzBlp32PK77TbxTFkk3B23OeWMazh+MnRhSsPw2qLP
	 iBe2wqatId+u0SkiLMwO+b4TPei5BWrb0QSWFPfqfySA4+dvfVNttdYXtD/gFC59Drp/+
	 LsgwNA+PxnSWV5yUTwFIfX2rUR3jTPoKlORlYlzCDJyelPQOSlsiFrPr8n0++lVDwvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ulbhMpPNAEqRrIOhtV5MGUC4m/y05Tb2A9NkmVyj/X8=;
	b=hpL6OMasVsoWk3xbdEPx1rTCPpf9DUFGLIGknefkrItrz+6JfQklrlqfusDIfTGuO/jS
	 ASz6cmlp+qmq6UO0A12PyjJMO7FVHGdl6dOsdqnXiXHjj8tVEPnELn3u7S3C9p8vf5Sl+
	 0rCK8PAIaLzzKNWrRP+GUkcmJjWPDIAdMSZ3Ow5uA0kYzM1ioyLcAebJUQQR0gm60Io9y
	 t4Ts/58Nn9mXMCeM6h5j/xioCaaKvMjomwa64ZYFrWfidJao6PmDL3uTlhug+TKtxeDRN
	 zdn1wpY95nU4b/rrYAI9tMcNI1J8G+0jMw6OmxLh5kJQUE1aePXY3n+F8XjiEbq+JUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V02IlN5i;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F641606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F641606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V02IlN5i
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b001cd92bso3113f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687567; x=1793292367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulbhMpPNAEqRrIOhtV5MGUC4m/y05Tb2A9NkmVyj/X8=;
        b=V02IlN5iKRq9f3UIaNYf4qBsqYnr4l/l1KhUDGmkCUKaiS/X9h8h9pTCOlP26lwQBC
         6Ubo3bRbASFVUO4Y7aV5Y64cxTndUcxU/M6oXGrVQ3ELWe570k2A4i3i0PsUFmHqzp4P
         0f3+1STiGrSkfsyvMu+W4LkrN0rmNffD7yVa1JgTHvgfENNl8fAjnlx5rvoEkjZ/vPzP
         Y5dDTjkUxE/rt6PLd0grpYr1GCPmQyJ/xCiy30snNwiYKXfzuWV/+trMSrl2r+h+WmUO
         FTUjZUb39eJzoOFjrJUCip+qBfMpKBe8IjpfrVVVgAt3UtV2J/0G93rbhBm76lZeGdkx
         ZTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687567; x=1793292367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulbhMpPNAEqRrIOhtV5MGUC4m/y05Tb2A9NkmVyj/X8=;
        b=Bd5ujg8uy9S1ubHBdhxXHT4sgoHNSpD7Xr8Jl7Eb0LJInaArADe/DsQDvX1/vIQ2qa
         0Z5lh1K8PqNiZdf4p94qYFFQqKqORtaM6f3FrinGBnVS1+xFmcWsW8BmZQZI4UH0uR3x
         MppLPKjwDBE4Y5Wh+FpEKgYx/a22LfdnB8wA8SNPaUxuKC0QaraSdkEADBAo9JpwP45W
         rNQ3ZnV7/B+Qd/HXc2Mro9n5DbvM4CiFxX3d00Q9gK4sWI6wGZ8BhGpKHq/HpxpgPsNX
         1LLamYsXnmERJq4B0pYL+laL+aTyT7WK9CuLsq0t5zr7gsUtvDEmVaSQZkulaYQmmNYF
         D1yQ==
X-Forwarded-Encrypted: i=1; AKwUvBw52lGc7q6V3oHf7SM/Plgm+GkNHklgxDoqm8UOY6+dhMn3APWkEvY5f/MfTioJaoPoP5sKgmwvyOlvB8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm1ZpZ2yKlpssIqlrkhXJYH1acmZCdndHGwCbv6TP1THdIKj2/
	UhdKI1zYF6ZkFQ9JFp71NuEzj3VOq/b7bXqbBQc0INwQgyNQHEDdAuQ=
X-Gm-Gg: AYBFou0+fCC5ZfjmMIiGhpqbjOoHHikiI8AS1mV9mhq7/hkQ8tVdmgQZVnKpvJif8/a
	c8yKE6ImcAhXEvPtvz093rUpunaACzTVJ0jlT5cgu9pfYr+nycajxJEP+HRfeG17tvoU2QXB88f
	Y2K7UMdngsfPR2FhxOMjcp+E5ih3x3s8d/7x9dh7VNMvZrGAOVKZfyTpZVetjhnV3naCK6l0yow
	UTXnHnvNVetKxtQiaq3CAyIogKGLbMkOZj4M1StXYSDHeeQVA4P3LyO+sCHjZJa8Nm3dB15Le1t
	GcJoeNnKrgkQ9Av2FzvtEYu6WrtE3q//UPCd4MqRWcWNXAK7Tuo0K8B/WtQF9b59vc9/HJBTZhq
	6zsvnvVIozKacLkuL1zKBzq2Zu8/LfdxxrKY8iJTBy/DZknLCVyMm6/WGHdFeBFA7tLXw0nd1NP
	rEE1FEPJS7iecsO4qK+gyhFQN/XW5ySwCNC0M5w1J+3f2xBf/mpTRb0sLTvU1xC3IaJjSG4jZbM
	YnW+3zqDEVAFdMOOAWe3eXSwwY3D0pk40iE9LkW7/9oy//o7urDoUBc49a8+mMOZm4sP8YCu6R0
	lF/KYpYdWjK1kROBSMStD1wNFQdF1EQ9Sr32KHB7He125Fw1lZdUjrBYjQ==
X-Received: by 2002:a5d:5f95:0:b0:48d:ffce:6cef with SMTP id ffacd0b85a97d-48e263ac3a5mr12539089f8f.0.1792687566645;
        Thu, 22 Oct 2026 09:46:06 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:7204:b73f:b5ab:d041])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e25827087sm13154209f8f.21.2026.10.22.09.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:46:06 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Adrian McMenamin <adrianmcmenamin@gmail.com>,
	Florian Fuchs <fuchsfl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: sh: aica: Fix spu_memset() stride
Date: Thu, 22 Oct 2026 18:32:41 +0200
Message-ID: <20261022163241.2504922-1-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spu_memset() writes one 32-bit word per iteration, but advances the
destination offset by only one byte. spu_reset() calls it with
0x200000 / 4 words to clear the 2 MiB of sound RAM, so:

 - three out of four writel() calls target an unaligned address. The
   SH4 can't do that. Each one traps and is emulated by the unaligned
   access fixup. This call to spu_memset() causes 393216 unaligned
   accesses, visible in /proc/cpu/alignment.
 - the clear covered only about 512 KiB of sound RAM, not 2 MiB.

Advance the offset by the size of the written word, to clear the full
sound RAM using aligned writes.

Fixes: 198de43d758c ("[ALSA] Add ALSA support for the SEGA Dreamcast PCM device")
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
The patch has been tested on the hardware and sound is also still
working well, the boot is faster by about 4s due to less unaligned
fixups.

Previously: 7.9s to boot:
[    2.900000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
..
[    7.872000] ALSA device list:
[    7.876000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast

After: 3.8s to boot:
[    2.892000] AICA AICA: ALSA Driver for Yamaha AICA Super Intelligent Sound Processor
..
[    3.796000] ALSA device list:
[    3.800000]   #1: Yamaha AICA Super Intelligent Sound Processor for SEGA Dreamcast

 sound/sh/aica.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 078fc7fc08f9..04f80c8c89c0 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -94,7 +94,7 @@ static void spu_memset(u32 toi, u32 what, int length)
 		local_irq_save(flags);
 		writel(what, toi + SPU_MEMORY_BASE);
 		local_irq_restore(flags);
-		toi++;
+		toi += sizeof(what);
 	}
 }
 

base-commit: c1b1c25de0d6008c3fcabc942fba635ea3693c3f
-- 
2.43.0

