Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746772;
	b=xQvEdWxqlG+I5dgw33DP1rphXk1JGhe52w4JaIpVmDgex8uZsCKwEj7oFxab+cyQY3wU
	 9hAE5tpAOicQZU4TyhVKAATfY47c+JA/fRMSl8TOZxou+CXvGuhyONgMskLRzfkRViHqQ
	 dbwOBxWGy02ClU/1Tlcd89UzZU4+XQMDE6yK0lZqex/aKAX9gb/yTFvVTctU1qtCMeVcS
	 pwNLPZzykgwvKekU860xRW/1tHs4STmsK0YZdzbw6uhRL5evmymkVB5iGULVY+G4h7wbc
	 Rphdix2fAKXy5fOtYNg3gltIDy/+GzVBj5/yG3i8SOIOoL+VL/sNPdhDN1p6yk9wPdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/nRVFFdVoOcvMQfARJukXiW43LqdQgC1g8x/9aYkCas=;
	b=ukueQ8EchEFt52x5uCbpkGQm24+Fob43sSb3RpvLSn/5m9FMfVLYi0ZZPonAMFVs+zPS
	 x7pKgg6wDicMcWGk2sTHYrIcOVUqPmoVxkkIH6l2aa6ti1h+S/+FgJUCVtA743nMGDP2M
	 pnhDFxQnFwFa8R3GwAbieTOmW/24GWueXrjxSOBE9lyiBEfneZzBVal9hl2oIvrBRXoSe
	 7D7Jn13sMsOEmXic0ig8EjwIUdiyIVpyJljtc4lzc4Mham00IjzKQ5tSLfiXkWgH0hZ92
	 twSTUR1RN7iCNrCAMvIGnPMubqSTie837EdGQRI9J+a3hA5eZuLLE392uwNJRkco14g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X4ZsMtqs;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE37606D805
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE37606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X4ZsMtqs
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so63983eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793746771; x=1794351571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nRVFFdVoOcvMQfARJukXiW43LqdQgC1g8x/9aYkCas=;
        b=X4ZsMtqsF0WW7V3d8FDaw9tcvLPi2S0pP0wgANHkQGOijlXdtd2pznDL27mKtsqi0O
         nBWuXqccUiLR3st/E0uY0K9cC3u3TfiLvJ7xRCyTYx2J2WPCGmoMA2uDJZ0PYlyxkC7T
         NnoBWAi/oYQPAGxu9NyeEeOBXUUEJJ/2PK4SFunEKIvcke3DmRtq0jWuQ9co3LbMYZPw
         7xW9Om6gbTqP3SPVb7TbGQH/oHRkOE5CR0yuhV+/UDX2gTqwfs6rYT/BE7OL9a1EF0D6
         5s6pmXa3dIJm56AF4aV7MG+yG5oqQonAdS7uNE/yrZA7w57UeSWckTrCkXkRg6fcOjaG
         adkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746771; x=1794351571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nRVFFdVoOcvMQfARJukXiW43LqdQgC1g8x/9aYkCas=;
        b=nftav7ty7hSxWxnJwJH8r6BHduRtLNMw5GUd5w4CDZ7C4BEKIjKrKO6VMv4JuOJb6T
         2W1X85ZGO4Xb0JRDYMB2hvsE0L9nQ3hjUKFGHLuBl1H3sWRgCCaEXMLpOthZfM+47PFF
         nmv/g7wihTvYccHpIkS7r7FH/zqK4UhesU6xADCTbJBwkj4sh21oQfghQVDNPd/VvYBZ
         NkxijMrIT63n+fB2d96G1weURjp2EcE7pC0ktILRKOQICFQgbuci4uPBoKYCfHU/GlbN
         ERprcp+GeJh3V0O75NNHmiDD7nBfoPjX3PQP9DRpyrp65a/cJUgj6gHsEtheb5j2FsVo
         qzAg==
X-Forwarded-Encrypted: i=1; AKwUvBxTez355gCVhLjhZs3OYRRTGkHXkEHFK9xSj6rXcXjhd430zMK08ey8w/mRfNwPIAybD69PIjoILxnj+ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HEwBahSPoDZwGe0q0eFIOg+hFfhvwUpOlhOYKSrdt5YaFMNaj
	NbzS9TrY1CCkY7jeEH8AcKm2FNz9KgXnZjKSn/M3CDVTFdcsi+DGLlPt
X-Gm-Gg: AYBFou23IVCQiF9Pr5bnjSJtf67yCwriNf6cYxXylvHIAvwgdaNNAAzlh3g2v7grgFS
	BwbDAxbbg/8dAuyGRq5AYGqbudCcJpJWlc7UgnaJTPc+Z+zfQjwqI4gN1Nl23eujzjIB1lN+J/w
	RWuTtjbHUVU+fr7UtLOVgMZ2WRY1b2VK2G9iT6AY1ZTEyBQttFWtmIFb7dygCGMAB5gv0e1myo3
	Q9qOthtMO3kBtDlz7st+1KjpEn/hCPrJzBA27zdnZoscdl1EruXldl/cE8qny+NSP5SbLLjzKt0
	AbKl74SihQ6Wn7N9etlbu8/GH99nSTzJZ4w9YC3XfXPYa6NvrEJLxr9lNrHE43IGzhaVgFgeG6J
	cViMUvXCsfgzBrUopEwH7MDnDWn3pmC2Lx6Hxdv2nCAeFegQadV6ncd2SBJkm91PHlOn9wbv/I4
	xGxBJ/wJfXRHTg9diEIjTF8B4CUzF85ff3uilvcT8QZ2lJ5SUJvMW63SDyH0JCr8PDARCsV021/
	PHmRbQrZWGbSv5eYa0pWczxnkcroiPUHPb4FB6+HAPPJJ72OwkkEqFBIKQIKkkYInS9zC2dVryU
	15MBGFH6kUaDMB7p9Rpet2iWdK6CTuSSIWo4WGf72++v9cqUmJNJ36wa2xqrMgCMc2ArMmnr723
	QsIQjZhpPHkP+V59e
X-Received: by 2002:a05:701b:42d4:10b0:143:2967:c0b1 with SMTP id a92af1059eb24-1ac5b7e1cdfmr22675097c88.25.1793746770941;
        Tue, 03 Nov 2026 14:59:30 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm1187111eec.8.2026.11.03.14.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:59:29 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: David Heidelberg <david@ixit.cz>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: stmfts - validate slot ID in touch events
Date: Tue,  3 Nov 2026 14:58:42 -0800
Message-ID: <20261103225923.3892612-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103225923.3892612-1-dmitry.torokhov@gmail.com>
References: <20261103225923.3892612-1-dmitry.torokhov@gmail.com>
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

Both FTS4 and FTS5 contact and release reporting functions extract a
4-bit slot/touch ID (values 0 to 15) from the event payload. However,
the driver initializes only STMFTS_MAX_FINGERS (10) multi-touch slots.

Passing a slot ID greater than or equal to STMFTS_MAX_FINGERS to
input_mt_slot() is silently rejected by the input core without updating
mt->slot, which causes subsequent slot state, coordinate, or release
reports to corrupt or release the previously active slot.

Validate that the slot ID is strictly less than STMFTS_MAX_FINGERS in
stmfts_report_contact_event(), stmfts_report_contact_release(),
stmfts5_report_contact_event(), and stmfts5_report_contact_release(),
logging a warning and returning early when an invalid slot ID is
encountered.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/stmfts.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 3613c7f2ab15..25d127aa8642 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -232,6 +232,12 @@ static void stmfts_report_contact_event(struct stmfts_data *sdata,
 	u8 orientation = event[6];
 	u8 area = event[7];
 
+	if (slot_id >= STMFTS_MAX_FINGERS) {
+		dev_warn(&sdata->client->dev,
+			 "invalid slot ID %u\n", slot_id);
+		return;
+	}
+
 	input_mt_slot(sdata->input, slot_id);
 
 	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, true);
@@ -250,6 +256,12 @@ static void stmfts_report_contact_release(struct stmfts_data *sdata,
 {
 	u8 slot_id = (event[0] & STMFTS_MASK_TOUCH_ID) >> 4;
 
+	if (slot_id >= STMFTS_MAX_FINGERS) {
+		dev_warn(&sdata->client->dev,
+			 "invalid slot ID %u\n", slot_id);
+		return;
+	}
+
 	input_mt_slot(sdata->input, slot_id);
 	input_mt_report_slot_inactive(sdata->input);
 
@@ -282,6 +294,12 @@ static void stmfts5_report_contact_event(struct stmfts_data *sdata,
 	int distance = 0;
 	unsigned int tool;
 
+	if (touch_id >= STMFTS_MAX_FINGERS) {
+		dev_warn(&sdata->client->dev,
+			 "invalid slot ID %u\n", touch_id);
+		return;
+	}
+
 	switch (touch_type) {
 	case STMFTS_TOUCH_TYPE_STYLUS:
 		tool = MT_TOOL_PEN;
@@ -340,6 +358,12 @@ static void stmfts5_report_contact_release(struct stmfts_data *sdata,
 	/* format: touch ID is in high 4 bits of event[1] */
 	u8 touch_id = (event[1] & STMFTS_MASK_TOUCH_ID) >> 4;
 
+	if (touch_id >= STMFTS_MAX_FINGERS) {
+		dev_warn(&sdata->client->dev,
+			 "invalid slot ID %u\n", touch_id);
+		return;
+	}
+
 	input_mt_slot(sdata->input, touch_id);
 	input_mt_report_slot_inactive(sdata->input);
 }
-- 
2.56.0.385.gac671c819a-goog

