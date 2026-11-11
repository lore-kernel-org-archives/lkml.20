Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380221;
	b=M97Qukaq/O9TpRRbBBRwGTjriY2gWEf829C2q/xa3qH+cAFTQW3c1VEcV4CLvJ6IaYeK
	 I/hOSZEvFKEDF2lOa/LA0NBbG3rjL0Rvt6oN8m/c24wozUv7T8YUvOWB4LP5aR0TfafLJ
	 HDiC7mMRXLz5P4+/lDlbQ9tb7wa7vNq+4p/MPEBuu8rB0JtYbbSZamZ5vajlmw2Q9VpOc
	 zpbSY6xVTdSe9M38/7Jv4nMs0k7Ek46ZoaMVHDLVdYLEizB2/TdF1Dls14ao/871KXLWP
	 prlqdxs3PaxAHcQ8ixMX/vJ9AzrQ9+Y0/YvEV5zyVNvlt/gvUTwynnXEBmf1VcfAovA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XoV5PIcrw1Z3DaArO3kOYgwAVJdr5E7QgHxi/hx80C4=;
	b=Y7ctQmSh8k4eRQpypkk0ikXb/MT5s6xDT44x2dSg2b2cCDeqgOqx3DuIBdlbAbHHyAgj
	 R7b+4sOHRLnj2CJPnMgAkoHOU0EtAYEasgt5BtON5ZmD6xV9YNbaWeM3eXq3k7wADRU5v
	 1WH6eB243mU9RYQXp0I6yXT6geYy9OcNAM+4t2Qnexe/y4tJk3az9IG39NQecGQmBmpWL
	 I0H5DokggB6I5Otdao+l2E6G+pI1FoiFBjKpVQqeklUaDCel7nmiAy22L8p5vEkJv6UsJ
	 hFGpK4Gk3qQ0sHzoePVcVRFKdeFaPs8ihEqe1G14yfobYO4CGCRMX2WYmliWbqzRqGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C/NqzYfI";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2317606B7F1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2317606B7F1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/NqzYfI
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3ada81853so2560461c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380220; x=1794985020; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoV5PIcrw1Z3DaArO3kOYgwAVJdr5E7QgHxi/hx80C4=;
        b=C/NqzYfIvN15W2YlCVQK77b7WL/gHElr/qGI/Rr4Pee0lip8JnTziZIL+R09Baf7vo
         84ClEXSfcyHhc3+4pDiYcKwsQ8+izLCCdAk/ew4xAGNGW0IOqFrhJ1o2LEvMnDkASCDU
         AMmfHO0Eb8bf5xQfpnhLiK4VQE0yoOl3Cbdmx4qVJlX+5hbh6OI1nT3j+q3jeoePykeD
         rgCDH7v421XgUOD27oTZDSyhWSy155uSrv5XXMWREWyLbl4etimXTd3FkeArFOcAl8fz
         +3UeBWb6LYDRbrTacVXnKOLKrdO6N/I9SbIhiHu8KqnRCtQj6Ux7TRId5QSMugV6LZnI
         clHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380220; x=1794985020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XoV5PIcrw1Z3DaArO3kOYgwAVJdr5E7QgHxi/hx80C4=;
        b=xu+4VSCVDrBiEFGm4Byib44ry6uqELGgPEV9t6xQwmym9i0YfwZN2RPaCeBb7kmuEN
         lYsw5nBNptreIQEh+iPhOL1xPikI0Z34DtppkBLvNjHe9f4MqhEj4PH5XwAhm5BuMT4v
         lNr+1VOEjSw5veExf3Q/gPn1jx0Id1JnXf5lIum+VqJ62PdQGCM4RzZRe5HaBa2tqvzy
         96dFmVZxUEY1rDyIjUw9GFvUehkZQ+b5zjl6PqxVDXxPHzp3kw6z0PmnvNVjNNihOQai
         4bEMv2JqlwotE1FTst6a0u9VbclOVvcr0gEE4P95USq0OGnx58kwVdDPaQAXNSgRJD1N
         3j9g==
X-Forwarded-Encrypted: i=1; AL+hErHVCNAUk9F0QTXja6oC1UqRcGOCVRXm7UlTnKRNDx0rukVjFFyyIbwBDkOBUV5IwOJupeSC70CEoM9u0pc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pepYUnOynSxbfGYLZ21+s9/mhEi+HnwuNUm4qeTIy0Ivnb3WU
	aWb1uOiejP8uAabLIjqX1AAt0V0XSn4ljszfAq71Co8xjhTIPKMoC2g4
X-Gm-Gg: AYBFou1cGiLtC6jjZymy0A25TsgTdipq12qioenfJsEYDouJa6hErchWKFXN0tsCD96
	PgTzkX23O6PPRAUDB2RI/l1wuMcpcJzhnizAdoKPrJAwhvB6erYNFvKlUmH3ykIhKNjgQLCwpXA
	INMrr8KZc9lMsLabbMNaLJha2HGRdW4poUMYInbCB8Zedi4SGfW8Cm80UoB/LDirdjZQMvzPT9k
	08G9vatj8WVJ95att3rjh50HMa90UmEiAR3LrYu3x9VkPw7dr97DefcdqvTu9OxsTTyIw/j6QH7
	5aNiKU3bNdU6rJmUA3ruLeW6Ebv5fdLQ8tlOTL0iHMKkHOaeKYJTLzCiGeTs7trL9kQUjncQKKE
	z2R52UD48/qpHbSq7avQb3a9IFLmYn7yG80gMz1O1gMoakmNEVocpp8z7OKsfIRLowYYygAmEHt
	UR6KQSRJyD9K0SelXIHKkTSY5tNVd1M0815E9Fd28BToRG8YzfM7xe0TR4PjcUKaeXcTD2PknlG
	A3+ncexMnFJ00z9kxgEotmuzJWg8eFn/q8qxGowgw2IWF1D+MAxE0lkKRhV8VAYSSK/ehnq/IOB
	7B/khRVC+ZH99K8vqdCy8FGZkxsuQH1C3MQ2vDOVXlIG4nl+YN1rcNybUaOATxgEwKBEZznbYwl
	ldlHwGOYvhaN7zOUjahNSTXQM+m8Nzo3qpavhjdw=
X-Received: by 2002:a05:7023:d0d:b0:1a1:8bac:c1c1 with SMTP id a92af1059eb24-1b3c02f06b0mr1632616c88.15.1794380219612;
        Tue, 10 Nov 2026 22:56:59 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:58 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:21 -0800
Subject: [PATCH v2 23/33] HID: logitech-hidpp: index G920 force-feedback
 slots by effect ID
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-hid-logitech-hidpp-v2-23-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The G920 driver previously maintained an effect_ids array indexed by
hardware slot minus 1 to store the associated input effect ID. Locating
the hardware slot assigned to an effect ID required iterating through
the array in hidpp_ff_find_effect() on every playback, destroy, or
update request.

Reverse the mapping by storing an array of hardware slot numbers indexed
directly by the 0-based input effect ID. Because input effect IDs are
allocated in the range 0 to num_effects - 1, looking up a slot becomes
an O(1) array access and hidpp_ff_find_effect() can be removed. Sizing
the array as u8 slots[] also allows zero to represent an unassigned slot
because hardware slot numbers returned by the device are non-zero,
eliminating the need to initialize entries to -1.

In g920_get_config(), deduct the reserved autocenter slot count when
storing num_effects so that data.num_effects reflects the number of
user-assignable effect slots and can be passed directly to
input_ff_create().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index ceaa57af6eab..9526286ba406 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2344,7 +2344,7 @@ struct hidpp_ff_private_data {
 	struct workqueue_struct *wq;
 	atomic_t workqueue_size;
 	u8 num_effects;
-	int effect_ids[] __counted_by(num_effects);
+	u8 slots[] __counted_by(num_effects);
 };
 
 struct g920_data {
@@ -2401,17 +2401,6 @@ static const char *HIDPP_FF_CONDITION_NAMES[] = {
 };
 
 
-static u8 hidpp_ff_find_effect(struct hidpp_ff_private_data *data, int effect_id)
-{
-	int i;
-
-	for (i = 0; i < data->num_effects; i++)
-		if (data->effect_ids[i] == effect_id)
-			return i+1;
-
-	return 0;
-}
-
 static void hidpp_ff_work_handler(struct work_struct *w)
 {
 	struct hidpp_ff_work_data *wd = container_of(w, struct hidpp_ff_work_data, work);
@@ -2431,7 +2420,7 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 		break;
 	default:
 		/* find current slot for effect */
-		wd->params[0] = hidpp_ff_find_effect(data, wd->effect_id);
+		wd->params[0] = data->slots[wd->effect_id];
 		break;
 	}
 
@@ -2449,10 +2438,10 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	switch (wd->command) {
 	case HIDPP_FF_DOWNLOAD_EFFECT:
 		slot = response.fap.params[0];
-		if (slot > 0 && slot <= data->num_effects) {
+		if (slot > 0) {
 			if (wd->effect_id >= 0)
 				/* regular effect uploaded */
-				data->effect_ids[slot-1] = wd->effect_id;
+				data->slots[wd->effect_id] = slot;
 			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
 				/* autocenter spring uploaded */
 				g920->slot_autocenter = slot;
@@ -2460,10 +2449,10 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 		break;
 	case HIDPP_FF_DESTROY_EFFECT:
 		slot = wd->params[0];
-		if (slot > 0 && slot <= data->num_effects) {
+		if (slot > 0) {
 			if (wd->effect_id >= 0)
 				/* regular effect destroyed */
-				data->effect_ids[slot-1] = -1;
+				data->slots[wd->effect_id] = 0;
 			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
 				/* autocenter spring destroyed */
 				g920->slot_autocenter = 0;
@@ -2855,14 +2844,12 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	}
 
 	struct hidpp_ff_private_data *data __free(kfree) =
-		kzalloc_flex(*data, effect_ids, num_slots);
+		kzalloc_flex(*data, slots, num_slots);
 	if (!data)
 		return -ENOMEM;
 
 	data->hidpp = hidpp;
 	data->num_effects = num_slots;
-	for (j = 0; j < num_slots; j++)
-		data->effect_ids[j] = -1;
 
 	/* init the hardware command queue */
 	atomic_set(&data->workqueue_size, 0);
@@ -2883,7 +2870,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 		for (j = 0; hidpp_ff_effects_v2[j] >= 0; j++)
 			set_bit(hidpp_ff_effects_v2[j], dev->ffbit);
 
-	error = input_ff_create(dev, num_slots - HIDPP_FF_RESERVED_SLOTS);
+	error = input_ff_create(dev, num_slots);
 	if (error) {
 		hid_err(hid, "Failed to create FF device!\n");
 		bitmap_zero(dev->ffbit, FF_CNT);
@@ -3461,7 +3448,7 @@ static int g920_get_config(struct hidpp_device *hidpp)
 		return -EINVAL;
 	}
 
-	data.num_effects = response.fap.params[0];
+	data.num_effects = response.fap.params[0] - HIDPP_FF_RESERVED_SLOTS;
 
 	/* reset all forces */
 	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,

-- 
2.56.0.542.g3ef89b7020-goog

