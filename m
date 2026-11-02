Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639790;
	b=KJRlZD6f9HsQ0wHeiuFkK/qvz9uo2vjtf7dlzWcM8Kq7sSnYT8jVZisqI0aikuBNO0mT
	 Rt8Um0tFBFoKP5s5/SvF+rN85Eon3YYZ9BQf5cd0ZTZj2fWYHNkN8DvwM4srBXh6r3Y5f
	 kYBd6pcym+udm96xgfEcwJGh0nhTVchwJbVjfS9WR44/aBAnFzj2QoenFCFVeZn23aMXO
	 BvlyU5yumDLFF7TtEGLwNBDQ8Yi2q33ZLb4ZyGhkpcR+ek4KRLA64sOL6EdddQ2rGokC6
	 GXn/nue4txQ0d0Kxpy0Mi2a6uSEaXCoV+EFJTYYpqoL9ws9uLNMcX3X2692xVfebWgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0+IqcO9AhETeBZJKsJy+A603A0xPkBeTUx1oq9nUAqw=;
	b=TyVUBHANtKrXNGmpn0ve7FsXto94PTuih+gEl1wMdIM7x64A+pNuKc1TZpJ2DDGKmwpz
	 NjTxqrXeNB55W1E+fbEt7GuEEmYUoCAWnwQO4ax3GHbXGLnrWu4ebfHiGYCR25f8H1mFP
	 A9aA/3pPh2qTiUfUxZkL7O9cLbB/HeeIzjxYNKuNY54cbOA67VF7taP+gME7E/YHVd0w3
	 N3AEoj37t1lq9+heubcmdpZOvg/f+MYj2jLHJOIXaCV1oF2CwaLCPjt666XqiCESWGSm4
	 mQ/wl11T4lgljVZAUu98v8gl4d/GkqAiV1LmuToPfpiX/A6yx0NzIrBTz01RDijOR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOIgfhKd;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250A606A934
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E250A606A934
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MOIgfhKd
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e47347279so2007001f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639788; x=1794244588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+IqcO9AhETeBZJKsJy+A603A0xPkBeTUx1oq9nUAqw=;
        b=MOIgfhKd7FD9tehJYzRDFvr+iT+JgR1wbDAOM3Le02gHisuS/0CyQ9ELsqIPZDrwZ1
         njjSOkzW0VntU4y4pdVJrm79Wswh0beleLwkQwc9HOJCSM6mB39X455gQip0wtrXPXJR
         nX9qbSY73MfwbeFZ+wg7A78KmVy3W3gQJM+4UTwxHRhwgP13Q9ruIw31wiSI676dQAWV
         87PVfgONLyLPwshqDs2F0GYYIw1+0MkuECWJHJy3WRAxPz55HWREQT0Vhm2jIUBC+DAJ
         4oxTdu8pDZN2z/3zAaBE+XdAZX3AeHXzwNnAF2mFIJK9rxAMK3nEUi8aw2RPjy3nb9JT
         YnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639788; x=1794244588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0+IqcO9AhETeBZJKsJy+A603A0xPkBeTUx1oq9nUAqw=;
        b=d1tRjDibVkWc4+vzI3qbcEa8BoxYCmsL/pbPghbC34ZH2FMjzHDapD5PzAsbX0u1No
         6X+KAiX2blij4YxvK9VpmUJaLjis8vg+sddKkMxpQaBbwwa0T4EdhoSvnblH8eimIawO
         kJgnhbYo+H639kpQ1PWhRtRV9UKafH7UCyQZN9I0Zx9T6IbQ3NG1ykYh52gp/kyP6vTU
         PjBnAU7/QOYOvFBNrPCwo4k3knAxiF+l8L8RvSqCwQTgrlTTuBBnBJ8BfnQHQfL1ABM4
         pkpYA+0zUbADsy+F+krSusXnDoAj7NmAorzcS3PHtxEAUibKryfiSVbL3C5kp7mZ+F7E
         W7Xg==
X-Forwarded-Encrypted: i=1; AKwUvBxjkRs+tZVihOk8d6tOPodL9insdwD1yOggst2boYltJDS6nOpC11l7lT3ecEDABwI3Qrvz7NaGHf3OH4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mLp4uSse5IgRP7miOhfeXodDumNTXXo9APrbeeN2jbO309oH4
	TmHB7QDDMCb7efJI3F11Q2pp4d0jJDI+xPSAxUjRDuPd/z3jW2z+/BDtvoVa64QYZXarfg==
X-Gm-Gg: AYBFou0EUMG6EooUEUf9PI2GKGYszaSa6MjTiO/4rrX52L/TPeXDJCQzEVtrvagmFDh
	0bBLAY4znkccbs2k7msiVF8z1aRfEjcXEvIgWGmpfgjo6EDSUCT+kOzhXN6+DwpuDxmcKipcDle
	vWVPemZItts77rDOQJ/lNGiL0nn4cKZq3DREMAuJMt87+6TPlnOZVWfgUtwyqDBaqFRqAAaHLlg
	CngSpVEkVlRdWPvuBSzw9KWZWuNlnwlW5+NgeeJPfMqVuB1Tn+S2H0pwxps2EG+Sqmuzdj+Jaoe
	3gcU0jL477hU2W4MrBptvdoFiN4ivoPr1v02NDPAwYgL3mgELJpj9hoypsZ03HAbOkgpYz9GJdS
	kevHHnaQ0eC3ZmVQ24G3IFCex/GTGd9ttjD6bN/kAl7MNcTjagkfsH3cHct3Ln+2T/z2bgnIKUX
	cdu8hlzektF/G+wfehFeDoqUjaFC78tyrj0wjRln5RaPVRKCZrHtJvp1ow5MqyXp7mGNuK0n+BE
	a9vyKW62Uz3E68lkMfvntoWjNeFX0ntIbYwEGp2voCzrSlboRD2WyG1fnIUhGpl2szwbQp9icTy
	k6cjSB6UdhpqSjf0TNTT4JKK+WjfYO+7ts/4hHdU8pSZhYtI/H43eLARQqnvIzQ=
X-Received: by 2002:a05:6000:186c:b0:48e:7a19:7aad with SMTP id ffacd0b85a97d-48e7a197e64mr17551414f8f.6.1793639788299;
        Mon, 02 Nov 2026 09:16:28 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm23598760f8f.6.2026.11.02.09.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:16:27 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/4] wifi: cw1200: describe the chips in a table
Date: Mon,  2 Nov 2026 17:16:01 +0000
Message-ID: <20261102171603.368298-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102171603.368298-1-pmazzini@gmail.com>
References: <20261102171603.368298-1-pmazzini@gmail.com>
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

Replace the firmware selection switch with a table keyed by the
silicon revision, so per-chip properties can be added in one place.
The SDD path becomes const to take the table's names.

No functional change.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/net/wireless/st/cw1200/cw1200.h |  3 +-
 drivers/net/wireless/st/cw1200/fwio.c   | 67 +++++++++++++++----------
 drivers/net/wireless/st/cw1200/fwio.h   |  6 +++
 drivers/net/wireless/st/cw1200/main.c   |  2 +-
 4 files changed, 49 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/cw1200.h b/drivers/net/wireless/st/cw1200/cw1200.h
index 48f808cdc1cb..8867b2c94c8d 100644
--- a/drivers/net/wireless/st/cw1200/cw1200.h
+++ b/drivers/net/wireless/st/cw1200/cw1200.h
@@ -117,10 +117,11 @@ struct cw1200_common {
 		CW1200_HW_REV_CUT22 = 22,
 		CW1X60_HW_REV       = 40,
 	} hw_revision;
+	const struct cw1200_chip	*chip;
 	int                             hw_refclk;
 	bool				hw_have_5ghz;
 	const struct firmware		*sdd;
-	char                            *sdd_path;
+	const char			*sdd_path;
 
 	struct cw1200_debug_priv	*debug;
 
diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
index 2a03dc533b6a..6601aec1f231 100644
--- a/drivers/net/wireless/st/cw1200/fwio.c
+++ b/drivers/net/wireless/st/cw1200/fwio.c
@@ -48,6 +48,41 @@ static int cw1200_get_hw_type(u32 config_reg_val, int *major_revision)
 	return hw_type;
 }
 
+static const struct cw1200_chip cw1200_chips[] = {
+	{
+		.revision = CW1200_HW_REV_CUT10,
+		.firmware = FIRMWARE_CUT10,
+		.sdd = SDD_FILE_10,
+	}, {
+		.revision = CW1200_HW_REV_CUT11,
+		.firmware = FIRMWARE_CUT11,
+		.sdd = SDD_FILE_11,
+	}, {
+		.revision = CW1200_HW_REV_CUT20,
+		.firmware = FIRMWARE_CUT20,
+		.sdd = SDD_FILE_20,
+	}, {
+		.revision = CW1200_HW_REV_CUT22,
+		.firmware = FIRMWARE_CUT22,
+		.sdd = SDD_FILE_22,
+	}, {
+		.revision = CW1X60_HW_REV,
+		.firmware = FIRMWARE_CW1X60,
+		.sdd = SDD_FILE_CW1X60,
+	},
+};
+
+static const struct cw1200_chip *cw1200_find_chip(int revision)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(cw1200_chips); i++)
+		if (cw1200_chips[i].revision == revision)
+			return &cw1200_chips[i];
+
+	return NULL;
+}
+
 static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 {
 	int ret, block, num_blocks;
@@ -90,36 +125,14 @@ static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 			goto exit; \
 	} while (0)
 
-	switch (priv->hw_revision) {
-	case CW1200_HW_REV_CUT10:
-		fw_path = FIRMWARE_CUT10;
-		if (!priv->sdd_path)
-			priv->sdd_path = SDD_FILE_10;
-		break;
-	case CW1200_HW_REV_CUT11:
-		fw_path = FIRMWARE_CUT11;
-		if (!priv->sdd_path)
-			priv->sdd_path = SDD_FILE_11;
-		break;
-	case CW1200_HW_REV_CUT20:
-		fw_path = FIRMWARE_CUT20;
-		if (!priv->sdd_path)
-			priv->sdd_path = SDD_FILE_20;
-		break;
-	case CW1200_HW_REV_CUT22:
-		fw_path = FIRMWARE_CUT22;
-		if (!priv->sdd_path)
-			priv->sdd_path = SDD_FILE_22;
-		break;
-	case CW1X60_HW_REV:
-		fw_path = FIRMWARE_CW1X60;
-		if (!priv->sdd_path)
-			priv->sdd_path = SDD_FILE_CW1X60;
-		break;
-	default:
+	priv->chip = cw1200_find_chip(priv->hw_revision);
+	if (!priv->chip) {
 		pr_err("Invalid silicon revision %d.\n", priv->hw_revision);
 		return -EINVAL;
 	}
+	fw_path = priv->chip->firmware;
+	if (!priv->sdd_path)
+		priv->sdd_path = priv->chip->sdd;
 
 	/* Initialize common registers */
 	APB_WRITE(DOWNLOAD_IMAGE_SIZE_REG, DOWNLOAD_ARE_YOU_HERE);
diff --git a/drivers/net/wireless/st/cw1200/fwio.h b/drivers/net/wireless/st/cw1200/fwio.h
index c287160a492e..e97cbcd54e57 100644
--- a/drivers/net/wireless/st/cw1200/fwio.h
+++ b/drivers/net/wireless/st/cw1200/fwio.h
@@ -26,6 +26,12 @@
 #define SDD_FILE_11		"sdd_11.bin"
 #define SDD_FILE_10		"sdd_10.bin"
 
+struct cw1200_chip {
+	int revision;
+	const char *firmware;
+	const char *sdd;
+};
+
 int cw1200_load_firmware(struct cw1200_common *priv);
 
 /* SDD definitions */
diff --git a/drivers/net/wireless/st/cw1200/main.c b/drivers/net/wireless/st/cw1200/main.c
index 5d569eeb353f..793471acbfb6 100644
--- a/drivers/net/wireless/st/cw1200/main.c
+++ b/drivers/net/wireless/st/cw1200/main.c
@@ -541,7 +541,7 @@ int cw1200_core_probe(const struct hwbus_ops *hwbus_ops,
 	if (cw1200_refclk)
 		priv->hw_refclk = cw1200_refclk;
 
-	priv->sdd_path = (char *)sdd_path;
+	priv->sdd_path = sdd_path;
 	if (cw1200_sdd_path)
 		priv->sdd_path = cw1200_sdd_path;
 
-- 
2.52.0

