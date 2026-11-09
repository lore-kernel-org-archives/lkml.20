Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210066;
	b=drISToKMukDAKWmYF3kh6RyZeS7/B/G3VLLywUI1sGsMrChc5Tb1FMGdVnn++ZJXaosj
	 lut6HzKyrJkwmzem6BRrIwOlt6A7Jnk4VevMAhjn/sTIPVxZVRQ5yVlhEd+b+K2EghXIz
	 W3QsH+q4qCGeeX9RoQfoDAe4WasN/+aL1lKEiURLtxiUllq07o1Vzmib+Wnxhh7JJsETN
	 TIfXLtQBrULd/05NkgK2WN5zNcY+L4+Z6NIKHqwDyBrpBc2LTawni23xMCZJ3vrchCQJ0
	 iLua7O0JBCMw/ZtRQre4lvR/1TNbv465GItZiawk5YjEDrQU921HLODAHx/T11p9qfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7/Tf8BQkHl6UVzxzkfSyq7osHN9OzzgsIStTSdb69F8=;
	b=qijC7LrXS37/m3OV5QOMsb5vONqGmq3Iz8mXmwkGY7RAEANdzM1QBwnf0SsqWaOh8/kA
	 JcR0Q6d5W/dG4hv/bAtV7v1LRvd/Vb/ZRNM8THMKFAdwFXF3Pkhena2xGxrCIeo18Q7bn
	 yQztR7w/nvcTscc223mBDkqMl6DrZ4zQ5jlmoQQO2Ne0ggho1fD65uxxqOechCwiYSxgE
	 dWKthzL3VU3hy0A9p5ZYEhWKuicOgLmrS/EE6joX3orkqqCC2Kt2cHUBHYAcEzAtotzDp
	 B0AdkmywZz6vpx46mNZq/UdTfZEFB3w9cSOYFozbvJXSlSyx+dw0A8hps7phcP94C9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZOTQkV+;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BA8606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10BA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZOTQkV+
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492690dd5daso285937f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210064; x=1794814864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/Tf8BQkHl6UVzxzkfSyq7osHN9OzzgsIStTSdb69F8=;
        b=mZOTQkV+vLquQji8j5B4z1Gl2LGSodzaimGpH93zsU56EGBh/xzMvHlhvbSoW4NHkP
         HveazwUWmoyoGK0AhRLuN7o2TpKXauCgfaAxuCK2MiLdQ7+Dc3NdcfivxWj1mJGQsnHf
         s02Ddk49zg6UYFOh2QB3oSuefmmh35Ov7PAmjsxI71ZwMWZPIrk5B9qP0zqptgG1vv2l
         CgPXKkyQWsqzdjKUWNbXa0fCb4KTaigW/6PsgT5oBe6aC+jH1zV46u5gPgZbH5RrsJ7H
         aqR2mc0g2gv/KxEG1o87TT2A1DB9av75Amcq0bg2UGRvcBobtnO3jJM8+3UantXj/Pjo
         MYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210064; x=1794814864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/Tf8BQkHl6UVzxzkfSyq7osHN9OzzgsIStTSdb69F8=;
        b=eM3MQFygreqOUif/1ymgUbhY0iJ/JTt+dLw4HRTi0+6QkYT/JqbiK8TSPE4wIBVKyS
         PB7hNfck0ZlVCSnbh764J/SMDINRnMuty5dr6yx7uUHAi1iawjkJ/1Gan8O+7oy6IvZz
         x3JenGfQy5Az68fQiNh/AfPK8Srydc3qo1x/XVcalu3rWxTTeHCc+t9m8kNEsSojvBNh
         7muRN1PF8WzuFvQhrJfqEF6kSNJyPIr2LOst7ssj7EVCd0qTnv3ROjZaeXZAameF4msv
         BdwoVH9OgihCdHB5M1Ndn4xgSCF0iGjfVEiGEhZMxF82S3dDurENtUcsDkoxU9kNDfra
         8pgA==
X-Forwarded-Encrypted: i=1; AL+hErFZ3AwHvLfC3JG8RriDIrAvy3nsg6AYAvB4Ci1J1j3qD/h9Jixbmp4936PheE5tmfan8Y1znxAboZaTSGI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XsD8hVp+zVID/rbFh1iFNjHnKOJOBDISzsfdYxJXyzC2QXGj9
	+Wg7iuVgXMzBkFbHPU60yD9fGAW5BBPkWIrIXKYPrBuDYqVxR20W/mwCdHASu//A
X-Gm-Gg: AYBFou1woc1PVHeZeXTIFd5YIUhDopXPZvapxnliFu3L4zV0QS+P7bmdNcDKLcQ1dk6
	yUvWdL+RvowncAzTMErM6JRgGyeYbj6nRiVVrmN1rewCPq3Fi61D4xcz6E5JFsRSGayW7UsNSId
	F6kP4CMIed9cAKVqiLx5hygeMTs0eco7071SLyhV2jgs3F0yTnimxXMARFn/JS8JCExpeyY56RO
	Dm7Ch2e88xlEbmEeaw4v1EKAY2dYfDC+FNft6BKU67qUsGLcLaj4vot6Z+izQ4436x1ZCtyotPG
	5csmsY8qjazNJpqQIaD91uuWNNGEJxhY5wE1BY3bSX+dtaAQQMTtpyAxTwFe+VRsfXOiAvXJg5O
	VnGUH8lTQsfTYpiW9dWbtanH7GErUErAtAExA6JWE0n7260ZCv9sunDLs/wEPwSDrvkEkyMVUSs
	t5PnqFVawdRPzARMHdMIctzJvlS/KjDoOkvMtvyNTxRRNYIRyIYGWHK7xWGa2fBkEG1EnYmbr7w
	jouuQFJOfnCk1AOW+DKutmzhgZixrniK76BmnaqxiVDrEegzmEkih9O6G44I6H4PRntEfq3Eog3
	mvoke1nzKvPnJIgRkZVzq7JyXhbDqKB9OopWCBf3eLhY6MJ6XzeRL0PE1R0Kuwyd/o5n7+/v1Se
	ENa1mhC11
X-Received: by 2002:a05:6000:22c1:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-4958b5374bamr7080666f8f.37.1794210064251;
        Sun, 08 Nov 2026 23:41:04 -0800 (PST)
Received: from nest.tail012287.ts.net ([176.40.105.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm8898526f8f.39.2026.11.08.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:41:03 -0800 (PST)
From: Yazdan Ghalavand <yazdanghalavand@gmail.com>
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau/bios/vmap: only read max2 if the header contains it
Date: Mon,  9 Nov 2026 10:41:02 +0300
Message-ID: <20261109074102.11997-1-yazdanghalavand@gmail.com>
X-Mailer: git-send-email 2.56.0
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

nvbios_vmap_parse() reads the id of the third "max voltage" entry
(max2) from offset 0xc of a version 0x20 voltage map table whenever
the table's *entry* length is at least 0xc. The entry length says
nothing about the size of the header, though. On a GeForce 710M
(GF117) the header is only 0xa bytes long while the entries are 0x26
bytes, so "max2" is actually read from byte 2 of the first voltage map
entry:

  header:  20 0a 26 12 01 c8 00 ff ff ff
  entry 0: 01 10 50 f8 0c 00 ...
                 ^^ read as max2 = 0x50

There is no vmap entry 0x50 (the table has 0x12 entries), so
nvkm_volt_map() falls back to interpreting the id as a voltage in
10 mV units, and nvkm_cstate_find_best() caps every cstate at 800 mV.
That is below the boot voltage (850 mV) and below what every cstate of
the board needs (900-950 mV), so no cstate is ever valid and setting
any pstate fails with -EINVAL.

Check the header length instead of the entry length before reading
max2.

Fermi reclocking is disabled upstream, so on this board the bug is
only visible with reclocking force-enabled, but the parser runs for
every GPU with a version 0x20 vmap table, including those where
reclocking is enabled.

Tested on the GeForce 710M with Fermi reclocking force-enabled locally:
without this patch, writing pstate 0f fails with -EINVAL; with it, the
pstate is accepted and the core clock goes to 774 MHz.

Fixes: 4a4555a7f1dd ("drm/nouveau/volt: Parse the max voltage map entries")
Signed-off-by: Yazdan Ghalavand <yazdanghalavand@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c
index c228ca1..07b3b47 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/vmap.c
@@ -68,7 +68,7 @@ nvbios_vmap_parse(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt, u8 *len,
 	case 0x20:
 		info->max0 = nvbios_rd08(bios, vmap + 0x7);
 		info->max1 = nvbios_rd08(bios, vmap + 0x8);
-		if (*len >= 0xc)
+		if (*hdr > 0xc)
 			info->max2 = nvbios_rd08(bios, vmap + 0xc);
 		else
 			info->max2 = 0xff;
-- 
2.56.0

