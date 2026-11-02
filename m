Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.27.248.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641273;
	b=pzsm1r060Km0jjBHLzh4bPDms/BWykenBsUqEr6fYlUSWp40SqtuWix8dQ1NO6RAw3qZ
	 x84tNFVv6m+0lqPXwM2ndRxjLcBpTzJCtEpLWrJFdk/0c2h1UCXrUDwfxB4NtqSvWkNbq
	 5un/h5G3jiC95FElBpFe2W4O1MvYSBm3iBbbba156m53NuzAhUkP2q68GuoctaVRE12C6
	 9luwGcV6X1W4Os27V4Xe2PLZi2k/lSd4GiTUiw5X2yrTcih/8sv1F57fYH6vPvAtZIqlx
	 TwyuH5BYQ8YkXcRMi1nl1tqDPd6wYn/VjiCBR6AbqB2ZTy/7jdXAy9TaEFZh563wCOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641273;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=kkOH7iuJae2q55d0aoiLBhkj/PtC9AgD5/0vO+Wsnl8=;
	b=pj0CohseBGdlobSv4STMwZgomeYfYjl0GY8B8K7OlRVIPxTU8Dg4dbd4Bxhw95hkqTbN
	 1GVAJYghT9fdR+GnpdIpeeXR4co3sNzrJn08ROCko+88PDOTvcyKiPORZhIYRKdzd7m+D
	 l//SY5DqyMDrIuF0Pr9PC3Nd9/jVfwG/yXipWeNd6dNUzoszj/g7EjueLRxQiALxfyvbl
	 SW8NPY9xt8Im9xGOWYe+jqAm1PaI9FnniS3K32XlJ7JN1efYBgowDaQ88kmyve1Nt7xWY
	 btoEHGyOTo3W3MqN2tcuMw/q1nglkdYspr4MN8bk/GlajmHy+Qe1VdZY9bWwwdC1IGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=LAMccuq8;
	arc=none smtp.remote-ip=37.27.248.198
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EC1606B0CA;
	Mon,  2 Nov 2026 17:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57EC1606B0CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=LAMccuq8
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 6201D43F7F;
	Mon,  2 Nov 2026 19:41:05 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 6159441D13;
	Mon,  2 Nov 2026 19:41:04 +0200 (EET)
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c5:43c3:0:addf:9aff:bff3:4b66])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 87A191FD956;
	Mon,  2 Nov 2026 19:41:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793641263;
	bh=kkOH7iuJae2q55d0aoiLBhkj/PtC9AgD5/0vO+Wsnl8=; h=From:To:Subject;
	b=LAMccuq83FMMzeSRh44evNrezHV3hIrxwxM6ZKsopEPCPio7nAGJeVehOdYfg++8a
	 9Tb7R850AeJ+i4Y6eF0SNmwZShGhDiaJOtGkH1GlBLoWgCGThFcZX0ieUAq7K4LxqB
	 +ObV+D0Kvs9lrUVK2X7cnMV80Xh1t0GslET5+F06U2k8nFybIjB4lkk4ZuNQC3+imB
	 epHHGF/IDtkoIDwqbZxVKteq7+9X0Iy012F1gU5HxAKWdbIMBK3WMweeBtCMiKh79C
	 np+9wIz1y7PuXX9lXC9AKSF1B5kULEZEQ4YW7tfmtWn6b4tcTV5KQ6vooVPh49MQvd
	 b1eM0h3MqQ3OQ==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:addf:9aff:bff3:4b66) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: tiwai@suse.com
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	perex@perex.cz,
	baojun.xu@ti.com,
	kevin-lu@ti.com,
	sen@ti.com,
	matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
Date: Mon,  2 Nov 2026 18:40:52 +0100
Message-ID: <20261102174052.1216670-1-lkml@antheas.dev>
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
X-PPP-Message-ID: 
 <179364126331.221749.8026019414900587865@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

The V2 UEFI spec for per-device calibration data in TAS allows for
manufacturers to specify up to five custom calibration register
addresses and values to optimize per-device in factory.

A basic description of the spec is found in a comment in function
tas2781_apply_calib(). However, currently, for the condition of
p->dspbin_typ != TASDEV_BASIC, if custom calibration addresses have been
provided by the manufacturer, they are ignored and the ones listed in
firmware are used.

In case the manufacturer chose to change different registers other than
the default ones (r0, invr0, r0_low, pow, tlimit), this causes the
UEFI calibration data to scratch different registers and cause the
firmware to misbehave. This is true in the Xbox ROG Ally X, for one of
the firmwares, where it pops and has audio dropouts after the
calibration data is applied.

Therefore, add a new bool to indicate that UEFI supplied custom
calibration addresses, and if so, use them regardless of dspbin_typ.

Closes: https://lore.kernel.org/all/179122346529.6.9250312386131579603.1671009695@8alias.com/
Co-developed-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
Different laptop this time. This bug was valid, just not present on the
Xbox Ally X. assembledev is not a real name, so assembledev if you want
a reported by provide a legal name and email address. You may test this
patch and add Tested-by: real-name <real-email> or omit it.

Technically the V1:
https://lore.kernel.org/all/20260107093134.583873-1-lkml@antheas.dev/

No functionality change, just the commit message.
---
 sound/hda/codecs/side-codecs/tas2781_hda.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
index e0da299df780..70e5118a17a1 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
@@ -64,6 +64,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		TASDEVICE_REG(0, 0x18, 0x7c),
 	};
 	unsigned int crc, oft, node_num;
+	bool custom_addr = false;
 	unsigned char *buf;
 	int i, j, k, l;
 
@@ -104,6 +105,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		for (j = 0, k = 0; j < node_num; j++) {
 			oft = j * 6 + 3;
 			if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
+				custom_addr = true;
 				for (i = 0; i < TASDEV_CALIB_N; i++) {
 					buf = &data[(oft + i + 1) * 4];
 					cali_reg[i] = TASDEVICE_REG(buf[1],
@@ -163,7 +165,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
 		}
 	}
 
-	if (p->dspbin_typ == TASDEV_BASIC) {
+	if (custom_addr || p->dspbin_typ == TASDEV_BASIC) {
 		r->r0_reg = cali_reg[0];
 		r->invr0_reg = cali_reg[1];
 		r->r0_low_reg = cali_reg[2];

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


