Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694866;
	b=RtCdydRUvBRq0FbXX34hi1EvTREssZ2u2BskXIqvthMfMkKgLzQPGFLuDsXtfZLDv0QR
	 5+KhREajFe3S1wr9stn89pRQ/LIjuf9lHAAcG3QiqWWrp0D3L/W45ykDJpFQLnYne3KT0
	 ikY1+C044GxRSUmvRZjcgdDiBzEPFFUkYMkGpnbI9fg2s8XwAOEoq/MbY3orCdhwxXZkR
	 CxhYk7SDdktZ6xPde1qRaSxubLANEmMer8BASd6+ek22VuSmqfs+hC2ETTETU16HI2bCS
	 NAVNiYsOwkQn7OFFVWEZ2K5mAZan8Fh2Y50MBH1sb38wSRVM5Y7mvR+9rlcITEKaNig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
	b=re53n7i/tXP5DUQ3cMcfSES3L7uC1K7FN7CQl10kU93rRU19+LqvERTGvZN+lu0OpIE1
	 CaoDxa7sEV8+5kx4BE72rTX5KeNXDsFyI8W+O4K04SESkRHnL2OIw02xKRB+RQKZZlWL7
	 V8EdaHGdsQ0Fcwg0wTWof4ok6KaU8qxdN+Dw8Ze3kTQCnTfDIA9BmIEl5e8rP7tSTg7ho
	 J/k48/ISPalX3qJO4buCIaXabMk8cX/m1q2hYlY+I3tAWMdHgs9K/v3yWl3K86IYTXKy8
	 ve3Wrv4NDBrWMZQGdFizH8x+1lLU3t6RU6HtrW51wXbEAfAxIUPS+Vxx3dBLmHPtFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cHBFjP8U;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A68606A891
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2A68606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cHBFjP8U
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso487537866b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794694864; x=1795299664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
        b=cHBFjP8U3dEZKylbHQyrhREgxJY4psaggAq8ElzGT7A44EkqkaEgeQBbC4ZtH7U0V1
         K/aiY7NUofodpOJCR1GPOwY+5LyODVcIeLDI5015iloHAL3w7KrpT9onQdC1NOJ3IdJJ
         4ZhW6RnyDAgnK/Qpj+tBqOTAr7CWNGMAqQQjB9rVxFGu7g/UtPLEceS1iWyJN+oanint
         ELtpbhWpiVOAvzGibirjxbBQz0oV7Fl5ABw/fKPy/oyJFziOoib4+sJ0JhILXD3ldOVX
         dRkdcM91v/7JnsRGUJTWm3NVsZFrN5k3SKv9OZOsMgd40z/RrMStJ7+/hVebPI9nJ3wk
         /PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694864; x=1795299664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PgNMIqtoqnJsAK2y3DPQyuTYuIaiwX8FKfGaxN4/bPo=;
        b=Tf97ZqVkCeIPEkD4Ikf13Bfa7Z/6/YVGPHdpTrvzEeXKANVpKwe/lpvAZeRSjiuXDE
         ITz3swZraPV+8nrMVJuEc+CrS6fG7lxMbNXt5DfxkLS/N/0y0OW7uQO1oiPGN8lGwUrP
         q7yBxIr7oHzeEvl0AMJ5f1eSv7WeN5HQ2eZEbONoJrvA2cB1fSb+9ft7n8ShB0+tTuCV
         HnQcE3hvCjwLmNyaQA/dkx7SCU0JWwVUNFc+yHD+iGaMPG4WY/sUnqASp+a7ojWG54ic
         xH8G+c+0s5Pfnij2/FmHTmPPpg5UvnbesgKIVHOztchGjzEgZQgyf6ciEhkbxLYNfJrw
         hA0w==
X-Forwarded-Encrypted: i=1; AL+hErHeMBtIrhj6Q1MIE5svQiTtw1GVt3+Z0INFCqnk9v3jzX/XVwZTVeT28UQwW4p6skBiqeh/jUYyAd4qkrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/j/UFrE1uXnui1ujcYKynMUdIwSfZmSFslHrLcVI/5PnT4Xn5U
	Kh1OEDJVdWUMoKEVaMXsNNnEIUgJ+XmO3m9koCy4RG7RaNNWz2LHBxmz/qWj3bzbgJUfkQPRWK6
	bUKjNRQ==
X-Gm-Gg: AYBFou1znyUHatjEjysa7duPUCRad7oc3k1JqjbJP8ro99xT4JBjFpzYx3Yj4WGr8vH
	Ky4AfDLK4nHzeuvoRIpa9715/cCCICfGKiJMJ9F0A8RDSWRBCum9W+KZCElTeCF4FNwQHjVJmoG
	B3rNj0VrzV2OEkvZE9ZqbMZjZvpwAUj9pqZOIfoWyLVoHqcT56hBocJXP4u+YGM/Qv/lbsZJpQm
	u8nCQ7iXYh9WjLzz4ky2A5UmgyMLTRhI8l/HdxKXrbCuMClfqszFElPFw850GyF2EThtF16Robl
	At8YJwNNnBDl0zJJxgNIbbGnRiqwwrDXExSmu/XvTjjOUQ6eEg10tep5f13I2/96kcLihrDLxlY
	azR+SkrkmJSFxKgl/gCEEt78rmfTjle8k5cs94jgJSJHwfE+HqCYcBmzXyPlSfC9SisdO+hLiPv
	7z8vB1elqi/msGYn1BXpSmvl45vqH56S42ZFcsMmfvhjpUhLXHXSdWWeruLE50MJm8wubo7hR+5
	wEb/bOzBoIGCCce9To8iPWQnLEp7evCe8R3ErHyCzH1QN2B8wa55zv/c3sfB+CL60HDIEXdnGNh
	apz3Z6mmZezElnV567SmvmtnJkj+My0Afrwd8GMpCw4EARJDA0zYWYRaiid2CEScA42v14Baiaw
	grKNijd5l69Mkf75V7puTYWTaU1S7S8z+XJLVPgU5uwusrIWWBzPNTzIMJBldNsAXAZC/NeyILI
	yv6Bp//+XqnPJn31V4WY7OfTNccj7eU0jBfRYmcUkKVQTkAwW92whOgDC+leMoDGW5rE/cRoL2C
	lTbMQXVTcpmXvoVhBEDMuhvflyOzuBP3xwoEKP/qE7rX1cAcrTfzFBTfnC5P5TES6i3KTTagbC3
	AtgVj0b3cTnlYStdCoVVcux7irh/KErIas/TC526ioi1fT3sBz981jBjmDWgWG10
X-Received: by 2002:a17:906:f5a0:b0:c46:d493:47be with SMTP id a640c23a62f3a-c50963bba24mr513799866b.19.1794694864369;
        Sat, 14 Nov 2026 14:21:04 -0800 (PST)
Received: from Desktop.fritz.box (p200300f24709d9006da21e9e53ecde1c.dip0.t-ipconnect.de. [2003:f2:4709:d900:6da2:1e9e:53ec:de1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b1fsm255612966b.21.2026.11.14.14.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:21:03 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: request firmware-2.bin directly
Date: Sat, 14 Nov 2026 23:20:58 +0100
Message-ID: <20261114222058.184034-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114222058.184034-1-julius@bairaktaris.de>
References: <20261114222058.184034-1-julius@bairaktaris.de>
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

ath12k requests the optional firmware-2.bin with
firmware_request_nowarn() and uses API 1 when the request fails.
firmware_request_nowarn() only silences the kernel's warning. It does
not set FW_OPT_NOFALLBACK_SYSFS, so with
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y the lookup of a missing file
falls back to sysfs and sends a firmware uevent, which user space such
as OpenWrt's procd hotplug handler reports as a missing firmware file.

Request the file with request_firmware_direct(), which sets
FW_OPT_NOFALLBACK_SYSFS, so a missing file is not passed to user space.
This is the same change as for ath11k.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- target ath-next in the subject
- name the code path that produces the message and why request_firmware_direct() avoids it
- drop the Assisted-by trailer
- rebased on ath-next 1be6c8d3027d, no code change
- new patch, same change for ath12k

v1: https://lore.kernel.org/all/20260910071838.1983652-1-julius@bairaktaris.de/

 drivers/net/wireless/ath/ath12k/fw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/fw.c b/drivers/net/wireless/ath/ath12k/fw.c
index 22074653cbb8..842830d2bfa3 100644
--- a/drivers/net/wireless/ath/ath12k/fw.c
+++ b/drivers/net/wireless/ath/ath12k/fw.c
@@ -15,10 +15,12 @@ static int ath12k_fw_request_firmware_api_n(struct ath12k_base *ab,
 	struct ath12k_fw_ie *hdr;
 	const u8 *data;
 	__le32 *timestamp;
+	char path[100];
 
-	ab->fw.fw = ath12k_core_firmware_request(ab, name);
-	if (IS_ERR(ab->fw.fw)) {
-		ret = PTR_ERR(ab->fw.fw);
+	ath12k_core_create_firmware_path(ab, name, path, sizeof(path));
+
+	ret = request_firmware_direct(&ab->fw.fw, path, ab->dev);
+	if (ret) {
 		ath12k_dbg(ab, ATH12K_DBG_BOOT, "failed to load %s: %d\n", name, ret);
 		ab->fw.fw = NULL;
 		return ret;
-- 
2.53.0

