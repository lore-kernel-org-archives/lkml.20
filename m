Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017356;
	b=z6aWpKI4K8GhEqP1Zd6o+R6bEQlXL2rzgqYJg1Gk/e/7ddfW/OW7aczZg1rFvzKpYebs
	 Fmna2HuUUeZ67SjesWjrQ6Qxjc3Ru6jTYTwKIQQUvXgqlxgNB8DsjqSzyyNmiqfJJvMe0
	 7BooXekCZymkR/k4J+jOfBtN795frBsqkJBNKWKoMfQYCCZy4IgNSsWfTYAYrT3c3s4db
	 3Vl+i2brOo6guLMGw2vfZHve6r/FmiWpuP501qjJUWjLH8nfhEOC+MJliXfOqft+nfoai
	 eIjr0A2hY+KDHMbCp6QJSJaupeTHRa44UHIC1tWBfut97h9poaS5RQL02Yy4H0hJfzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2qAvvGtmJQQmvBJnY//KXBAoQMLJVMG+H1wUmvjA/DA=;
	b=Uqlss6XM81sIQiw8PadsAprYDGaH1zlP2gPEG8gO8sS+8j7p5QG4hFkpLwJ/XjWh7t+X
	 ivM9zlWfMNJ8hyy/CPhlOZ8CtXz6QRgYigOt+qx6351HxuWnmYFoSKIq79IMhbnMxQFRA
	 fbrn/XESq+TiHGp0XLMLYuAK0zgf8HtIlLKeImwN10J6uZBD2cHMp9z6uy9Fc5i/JwojK
	 yfkBGOdjla9fa34jwtVOpCzX6c9vfsnV/feA5Jf0lyyLNs0WSXRulM261h1kRyxy48ymT
	 0JZko41FIZ5NZkn+LM1ko+BFH9ADIm++riTudhOuXgixSZXMH2yRs/35aEjEtM78fqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vap4hVlx;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7531F606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7531F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vap4hVlx
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so2155757c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017355; x=1794622155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qAvvGtmJQQmvBJnY//KXBAoQMLJVMG+H1wUmvjA/DA=;
        b=Vap4hVlx7nVvqer+QKxWQLIo0Bpj+irEq/wK954gzVzkM65hd1VrrB2B73jvZM007u
         vN8n9cALjWgyDvUEp6h2ryKbrz237EWQqglvVTJNeEFMgontX2D2Lljzz35/gEJIj0b1
         dIRyrYYaBWqtybnRVVFTfzGurCz8c9k7tnubayJX+qqmbkhilYJP8U6LFGKsGdZE0DkO
         R+TBri6xe8mpMfK679uAv4efC6IVaCMfaixyUzXxcVUg/qXmCZVhu3SOfVIVHMqm6gx+
         BOYMyGAfvHiOrS1FMVFJp4tUo0p1Q493WEkjGFmf95wEjqGjYT/erVAqYpPqU3G/XLj1
         AGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017355; x=1794622155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qAvvGtmJQQmvBJnY//KXBAoQMLJVMG+H1wUmvjA/DA=;
        b=1lDCIN21UtHwJLY1U6lEbXtOio+dDOKVAnNuwEgDfAV/WP2eDtJFtSvkh1FhCaHJ79
         NuuQWYFWd9rG6Oa5QwTFLPM5ftCUjqWTnbVFjCNIshRSUdkZOjkqDC3hjT8RXHT9b1oi
         IwLuOsp0PY1mbOCAfEu0RqCnRxKnMnizoQBYUycZpfxRJlMRvojKmo2d92bi/irTtanJ
         A6J/EvYaBx5roxYIVwWzHelMul8rxWPC4cLqBOWC7IMxp8MWP2n4/GNuyEGotVipPS5d
         LJeNNzyxcDvIG8UqjLhuNnTLH//XaA6NRVHVj/rBfCH03yJ3HLOtS5En4yPfXYId3xz8
         1V+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJTVph3Oj/I3Ip4mhSP5L3G+FTlBx2XXtu9LaYHtk29zVdGBrkhRvWSSjlGFH0GCW/2Z/ePcCm5MWJ6KY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BYROPMjUfXd3fPw2cjXHIiRehYi8emsJo4Ntg9bmYZa6vC/JY
	VuZ8F5Etw0IQijluLJGusRNrUV7m5uOZhzolZjMbkJh81Lu/m0XTxYWG
X-Gm-Gg: AYBFou2XOadt/YwPo7XjuyQMhCNwPj4Z2HJkrssQwMXj0MX6y3Ad9ygi46GPle8RGC1
	LiDQDoWOmNI2KpDdZqawtdIXGmxc4dUfAc/2fpS9bPbNZ1hA5b8NjKAKvz7OIz0qBu6l+vGkS+9
	Z7hErXHDqmXfvovP/KFmFIeP76gphX7PTvDhmqT2MFomuW0dU8JkVQyuMnvKKda+yubB81BziDt
	Ej7PJIvGIzYwNZpD7dMJJY9Cyh4VvCZI/+ts7qt2SPVvgIKjS8dNUCvD7SpPg+fgK+bMAmKPzDq
	IBbiaRKn/U2bN3FLfBWd69HArCYdpdIO0enV1b+XNssvnXVd5qKFo/AlhmiSftL5vsIwiXkMlx+
	2sCnyxYWpGf4h2RayeeslmqHWWpgV12TkDelI3jn8nvE1lyQ+xiBBD7cvF3bgxsfyI/XsQnwc1l
	f6O1I41XX3owqJOpAquVLl3WYjH4C/RQ+uSe0P1Ka97fj8GeDo2lvoAqLCv+dtHSSpCGRuXD23e
	Ojtw7sCaEQewiQD4GsJXY5EBFxWsGAGaBXtp2u5gakx6K0sLcUKpvyydU7NQm4Go+VGYzXvPQCq
	m5fivmzODwnlqdFHHwT1oJFsckRAr8+o8gelDcsOLbf9m/xK0GhgJSgqm4iyD6GcNbpn9FM=
X-Received: by 2002:a05:7022:3c84:b0:1a7:e1c6:6f33 with SMTP id a92af1059eb24-1b25d31d96dmr4197905c88.30.1794017355366;
        Fri, 06 Nov 2026 18:09:15 -0800 (PST)
Received: from localhost ([2409:40c4:100c:32b8:cdcf:1840:88f5:4e8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm13130210eec.10.2026.11.06.18.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:09:14 -0800 (PST)
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: [PATCH v2] Input: synaptics - make InterTouch quirks table driven
Date: Sat,  7 Nov 2026 07:37:51 +0530
Message-ID: <20261107020751.3959748-1-lovekeshsolanki00@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105042614.688312-1-lovekeshsolanki00@gmail.com>
References: <20261105042614.688312-1-lovekeshsolanki00@gmail.com>
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

Move the device specific InterTouch quirk into a dedicated table to
simplify exempting more devices in the future.

Signed-off-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
---
Changes in v2:
- Guard synaptics_intertouch_quirk & synaptics_intertouch_blocklist by
#ifdef CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS to match its only caller
synaptics_intertouch_disabled().

---

 drivers/input/mouse/synaptics.c | 52 ++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 1ed9261bff2b..8561256406af 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -213,6 +213,25 @@ static const char * const forcepad_pnp_ids[] = {
 	NULL
 };
 
+#ifdef CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS
+struct synaptics_intertouch_quirk {
+	u32 board_id;
+	const char *pnp_id;
+};
+
+/*
+ * List of devices with broken board revisions.
+ */
+static const struct synaptics_intertouch_quirk
+synaptics_intertouch_blocklist[] = {
+	{
+		/* ThinkPad T440p */
+		.board_id = 2722,
+		.pnp_id = "LEN0036",
+	},
+};
+#endif
+
 /*
  * Send a command to the synaptics touchpad by special commands
  */
@@ -1814,6 +1833,33 @@ static int synaptics_create_intertouch(struct psmouse *psmouse,
 				  leave_breadcrumbs);
 }
 
+/*
+ * synaptics_intertouch_disabled - check if InterTouch should be disabled
+ * for a given touchpad based on its board revision.
+ *
+ * Returns true if the touchpad's board ID and PNP ID match a known broken
+ * entry in the synaptics_intertouch_blocklist table.
+ */
+static bool synaptics_intertouch_disabled(struct psmouse *psmouse,
+					  const struct synaptics_device_info *info)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(synaptics_intertouch_blocklist); i++) {
+		const struct synaptics_intertouch_quirk *quirk =
+			&synaptics_intertouch_blocklist[i];
+
+		if (info->board_id == quirk->board_id &&
+		    psmouse_matches_pnp_id(psmouse,
+					   (const char * const []) {
+						   quirk->pnp_id, NULL
+					   }))
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * synaptics_setup_intertouch - called once the PS/2 devices are enumerated
  * and decides to instantiate a SMBus InterTouch device.
@@ -1840,10 +1886,8 @@ static int synaptics_setup_intertouch(struct psmouse *psmouse,
 			return -ENXIO;
 		}
 
-		/* Disable intertouch on known-broken T440p board revisions */
-		if (info->board_id == 2722 &&
-		    psmouse_matches_pnp_id(psmouse,
-					   (const char * const []){"LEN0036", NULL})) {
+		/* Disable intertouch on known-broken board revisions */
+		if (synaptics_intertouch_disabled(psmouse, info)) {
 			psmouse_info(psmouse,
 				     "Disabling intertouch for board id %u\n",
 				     info->board_id);
-- 
2.56.0

