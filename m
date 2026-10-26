Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003156;
	b=wlN8zxoXGlWU7HcN39WQJaL6C73De3hXPTj3kSqc+TaqbTzEiJvfwkyE/J/DSxB0nDE6
	 BJlIkRyyjuBvxWyKRd8vZDGMwsDGqU+qS2kxM7+5TiX1y/fw7zv1cVuvTIVRTZY9QFBYA
	 Je+AykXMaWqmD+bzdjYTaIIsGAbT0yhfk32WgkBdz3tZ5QdGOoa0EQyAM1K7zuUnluMLg
	 +pxzCan4rNPCW21MpdKkPDukFuH/OUqfY5+owqP/hjKvCMp1gUaz90qhAWM6vFHqQHAAh
	 Q001ALyYbd3c4KA+DkWdu0T7MbEJBfbOgkT0QFCf4hhRqnyxm6URyaf9MimDIdjX5Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7eRaLgV48P2SND4IyWtKYmX6gzcBAgKq+lEfwtAQccs=;
	b=FFh5XU8oAsmef15Strs6hybQ0jPdBR8aDo24UDeNTE5X5VdsmeaYBk7oQDxn0KeM6USA
	 uqH3fkJEP3v5ZfrFjIEZXvx+mbgf5ZDlulcDvBAEvI7iY61aYOZsUe3PeBuRmpsSTQcg3
	 bQ8FUmEdV6vkCtVAKYZEsnZGNQHfnamJaPgXWCSJzkiJXk6viz/7w+rdtrjldV4GHaWxx
	 ysFhASK1u8B8S0C8D0jW/+wZczY7OXrg2g264Utn2PNINyRKiGd/70Rowy5zS7zvv1EaL
	 kGqVPunotjSgieZnkE3phjk+sxQltMxcMCvgEQRjT9/UupZWpiRGMXRWZNs4tzi/7Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tEs26hWr;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EEF606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00EEF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tEs26hWr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so6268045e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793003154; x=1793607954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7eRaLgV48P2SND4IyWtKYmX6gzcBAgKq+lEfwtAQccs=;
        b=tEs26hWr9jfgtvYpkS1MlL+JsdeGjGQygBlHpNNOlrmtbaUvwZMxNxf2aoBzqt1oNg
         oZQMPxrl2bxskiBYIUvCJaABb/QNcMKXUDQpE2/WsQT9s++o8EpbweJhelru6ZMUQA8m
         W8jPO+jz8Rg8to7PK/ZlL6pm5RBnkSKdCyMpbx7Q2C+hL67Fb050sR1+FHWBdRovP+kw
         2nLfcoswtAYob7Daebw5ayI5Swujl6+1sR+qMzoehhBnXm0KMglsYBGHIqSfgt3lLP4f
         WhsoN8EKIcWFiwqWLYjcCj+bkxIETptMA7QShE8UsINFntf6qRwCpiXCgPjwI4JSLo+b
         JHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003154; x=1793607954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7eRaLgV48P2SND4IyWtKYmX6gzcBAgKq+lEfwtAQccs=;
        b=JNwTRduYHItm2C1CYHMP4LG8rlLZAPMLZrftZlmqpU2xUk4HTp3AamquTCKHz8EDeg
         WLhXCRwK9nOsTyb+0SlnE7IPY0GPzA87s5NZ8LuqpJWdvuT6woKogTHUCfBpSw6xxS7r
         /JWuM6mBJLa6agYWv10GJ8jFLyE4ocLw9Os4mUCiF989LxV58UVVOoQr1v2J7zWI2VBn
         73Qxx1/kl6PTid7U9FuBM4HDglHA1HzdMLVEInzC6CMj96k0Pr5jqFmS329sRdmoycrS
         mf5rutPzr2HGt7nf9YABZEzDMi0eLAhM2ktbVso+BvWQ1yM4V2jPWYg9WQAyTkSBllg4
         Q2sA==
X-Forwarded-Encrypted: i=1; AKwUvBxGxvr9ukMylZekvi+ME+pUrHSBKPGsuAC5zIyPDiNQXgtjH/eC6Qt7tDSL6UxfGURECnrMOZRUim6aXBc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxyzbMEbHzSs6gDHaKxBkttQa+g9IoM6wWrMccO6BgUKrwLMtk
	rfRFANEADHu5EwwJNtgI4Dr9AfNXZZFEYsnpujtGREFKeHH53RZdVno=
X-Gm-Gg: AYBFou2oBR4nop9+UImvEo6cM4GeYj5XDZKfttSIzoOe0Z1lHZKswn991ldotlC05mO
	hiTU8xQ/HUYGRMj+6myc8HZLBeYgUsx6ZRWaYPlACVaD8qVwbNDtRRJNMdqWWnpx1dLiapgVeWg
	yYqwWJIot+bUnGTKLxLf+qsAWDD97Ea2wB7tCmCEPT5ZkOL3GkMpbvFWKqZWePmxZHGtyBZG93C
	KXYwCwwEnGQ1pkI9xyph2Qv1p6TDyA0XQIsmTC/qHAJQvUqSLNqTVa4lLe7co7RxHdVqurshEOP
	vdylIK8lniZae3383j9qHOzmMVgAIzDz6LQ6sUKTYO5/MMQasEagVKBYn9VUxEzgEeP/oWH44GV
	ASUU7ZQRXy4kQzUpVgmnKH0HoYTq/mw0WEq3eMZOYxoeLPtpczGn1KuVEr8JfzMt4nMnKaXXJA6
	bJzyVlRUFurMJ5sPzbBga5GoOOp8IBfb4cvWvb+f5lYOZUsms1eu1FIincmG4Aa7h/zf0IJpeR2
	dAfCRe/8XtD6zsSNLN2hwmsDwpqj85UNkwJjxxYMELsRh6DilM+XPegFvPE46T0ShznIIY9djh2
	gcdshXaDPnpSt02T+i4ayEO2iEvHpVzhzqgF
X-Received: by 2002:a05:600c:524c:b0:4a2:105f:ab88 with SMTP id 5b1f17b1804b1-4a35ac963f8mr104850175e9.18.1793003154248;
        Mon, 26 Oct 2026 01:25:54 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm211058215e9.1.2026.10.26.01.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:25:53 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: sakari.ailus@linux.intel.com,
	johannes.goede@oss.qualcomm.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	fernandorimoli11@gmail.com,
	lsa.uz@pm.me,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] media: ipu-bridge: don't reference the module image from software nodes
Date: Mon, 26 Oct 2026 09:25:48 +0100
Message-ID: <20261026082549.662885-2-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026082549.662885-1-dmanresa@gmail.com>
References: <20261026082549.662885-1-dmanresa@gmail.com>
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

The software nodes the bridge registers are deliberately never
unregistered, so that a later rebind can reuse them. Nothing reachable
from them may therefore point into the module image, but two properties
still do: the "link-frequencies" values point at cfg->link_freqs in
ipu_supported_sensors[], and the "lens-focus" property name is a string
literal.

Both dangle once the module is unloaded. Re-probing sensor drivers then
read poisoned link frequencies from the surviving nodes and fail:

  ov5693: supported link freq 419200000 not found

Copy both into struct ipu_sensor, where the other property names and
values already live.

Assisted-by: LLM
Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IPU6 (8086:465d); boot and sensor rebind, not unload or rescan
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 12 +++++++++---
 include/media/ipu-bridge.h           |  6 ++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a..aea4699 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -290,6 +290,7 @@ static const struct ipu_property_names prop_names = {
 	.remote_endpoint = "remote-endpoint",
 	.link_frequencies = "link-frequencies",
 	.clock_noncontinuous = "clock-noncontinuous",
+	.lens_focus = "lens-focus",
 };
 
 static const char * const ipu_vcm_types[] = {
@@ -623,7 +624,8 @@ static void ipu_bridge_create_fwnode_properties(
 		sensor->vcm_ref[0] =
 			SOFTWARE_NODE_REFERENCE(&sensor->swnodes[SWNODE_VCM]);
 		sensor->dev_properties[3] =
-			PROPERTY_ENTRY_REF_ARRAY("lens-focus", sensor->vcm_ref);
+			PROPERTY_ENTRY_REF_ARRAY(names->lens_focus,
+						 sensor->vcm_ref);
 	}
 
 	sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_BUS_TYPE)] =
@@ -636,11 +638,15 @@ static void ipu_bridge_create_fwnode_properties(
 		PROPERTY_ENTRY_REF_ARRAY(names->remote_endpoint,
 					 sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
+	if (cfg->nr_link_freqs > 0) {
+		memcpy(sensor->link_freqs, cfg->link_freqs,
+		       cfg->nr_link_freqs * sizeof(*sensor->link_freqs));
+
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_LINK_FREQUENCIES)] =
 			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
-						     cfg->link_freqs,
+						     sensor->link_freqs,
 						     cfg->nr_link_freqs);
+	}
 
 	if (cfg->flags & IPU_BR_FL_CSI2_CLK_NONCONTINUOUS)
 		sensor->ep_properties[IPU_BRIDGE_NEXT_PROPERTY(i, EP_CLOCK_NONCONTINUOUS)] =
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 3ef94c2..7c89fb6 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -136,6 +136,7 @@ struct ipu_property_names {
 	char remote_endpoint[16];
 	char link_frequencies[17];
 	char clock_noncontinuous[20];
+	char lens_focus[11];
 };
 
 struct ipu_node_names {
@@ -178,6 +179,11 @@ struct ipu_sensor {
 	const char *vcm_type;
 
 	struct ipu_property_names prop_names;
+	/*
+	 * The registered software nodes outlive the module, so the property
+	 * values they point at must not live in it.
+	 */
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
 	struct property_entry ep_properties[IPU_BRIDGE_EP_NUM_ENTRIES];
 	struct property_entry dev_properties[5];
 	struct property_entry ipu_properties[3];
-- 
2.43.0

