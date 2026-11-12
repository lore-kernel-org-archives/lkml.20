Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466207;
	b=FF3KBNSbj4eq6gKdov6o0bSHCKckt/lfZH22rcRtkio9I0KD5OnbtIiHqC7nJo1o83m1
	 CczQHcB28zp/ZAtOD20JPL0msw7btgjuEJOxwyZNi7ACQVSZBZrLm/B/ajRVcERLX7lzO
	 UDq9hEh5wQTPfdOss5nmKQXDhCN8qjATpfXOcaKOF51kkUYvYb34SYBKJBzwUAY8qv8bM
	 dl1Q++wymBnFg2jW/MubrrIF8iafCwMhDl2JRDlT/e28M3TME/dnq/m6L9ZoSLDcniuq0
	 OZlao2rI5RBSBs1o46aOQubtuNNmrXO5TMh8x5KUbxVE/1s5QxWIXaz9ssYQ+b3QHLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vVhsLL1Pu2n4j4YLMUMbDZ8LRYF6+iKldnx7jPCdxAo=;
	b=uaUaqc5ET2aeM28QgAVEbSyuwZx71vySrM0FBRaoBHudxeVEkfQPY8LDPWQzo4w+sexM
	 DqSVEFTDUZeUtn9h/E/ViZYye8NngqDxoOWBzHFyEl0pIkFvfrqp19JGmy2hT/H6uTeXx
	 IkmoGjjjFu62FM7+bfmz4/Bs4+QCt/AJY9dG+XqGCL89b4O1S9zaeSRUHkRdnCcCCbpjC
	 50V13FoAAqMv2I7uMHepdevsbYxA/6SzfjTGUu2m5LFuwRLVD69sjHfQdpRGvQeKrykAu
	 3Ax/ITe5rcDW8ZlSR8rxXrriJk0JOoafwi5ASVqQoJflf+bD7NcQKW0ESRyta9jQXPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sQgENo/2";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519160A3822
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B519160A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQgENo/2
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37198ed3727so708777eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466206; x=1795071006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVhsLL1Pu2n4j4YLMUMbDZ8LRYF6+iKldnx7jPCdxAo=;
        b=sQgENo/24/gIstvnmHdJ37mKIaFHgWCiOdtzSyn1dzejSjFBNtRobRvtwpNQNPeYtR
         z02szg3y0g3T5rskLbVnlvmiOXvkPefGi6JnRDM1/RcCMZqK3OBx3t658Ao5JUnTn21l
         h/yRUraq8euyoLfKuRfXRjsAviaYNeQswX9jW4ksbB14lojPXeAGRiRZljXLgCpp/KlO
         DuLOiLUiJMKSpjs3zPlO5gupkPAHyDGAX+0JAFLnltRabMvbkpaLqOaknelstP8G+kAI
         s7vCPHFxs/Yu6WGQi+NHKeVG9mzicVMBuWa646rAKniF6KmmaXnEBEuBLzEz1ABnHx/9
         luMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466206; x=1795071006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVhsLL1Pu2n4j4YLMUMbDZ8LRYF6+iKldnx7jPCdxAo=;
        b=t2IN1Rb+dee+yWFg0aTgDkCucg8cJk5u8VrCCPOvOriIIiCrP1cWdmgaaUyEmgGLzI
         NGAvRu0nuxc093S75lJ2nu/pKu1bBCzIL/+4gC2SRkeaXAiUx+hETnMswe+FPgK/bNPf
         z6Ga8zWCT4Xg6q91eN+oEFxpDu06vgwI1aav6CQ5P0ouDy3dAFiEglczF/YmyyMGucHZ
         221YGO2kE6jDGPiR8DhLd96bF/kYWgDN3uKWxU1MbCXEGQZYjo2/IN+bzhRtOPxNheO0
         lDpxC/uJRnu9Fo6nsdoCGmAXyelOSFZZPrGKE39xLj1ZdR4bHP7Eo6Cm9bpyHVjdKNqj
         ThzQ==
X-Forwarded-Encrypted: i=1; AL+hErEQyvf2W/OMmjClYj7mfHUpBRPCe73Z3Y1sXTROLE/hoc/GMThJfI/3ScdQlW3VYvA56SFnYHokzTN5wjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T7aL2V5DxNgO9nHiWoZirhe6CW2s4pNCy+9izUqMkvuQqkoww
	bMRiDWBTnOAF+ql1jIAZLL9uBfsJeqXhDxCWka8uUd3tuMpZhLQCAauu
X-Gm-Gg: AYBFou2VUbNWOsUWLfZ6OuwDKaZCZ28c2Eo80QiPKSXoC54x2lyeb7VbPNLUTceme1E
	CNi4nOX3rxd5WfET0xdANtNINOrrole/XB6MT23anp3isqrMfLhTON/QfNHiT0xOdxGv4wxc/+6
	y/jvdakdJZq9vqYxJzaCRC0tJ2//wD/rnsb0q8sQg1X+DORIL7FtfbSpRGTjQLwJVLgpvurF9mU
	26RlWgu6ftDSHLgd5yQJ7N0uwjtD1IPfA2u073QDnSRh96c3YljxC1NFeeHjh+xWTJqZsihMdsG
	8Ophwc44Vx6FiVQOZ8iUT1DTKlzYHYIATw8MKewuitYmSxKSCuE86oDdN4u6/9yr2ZRUWhKZ4vJ
	Um5fyKVwBZ7F1MreEMWttJMfyKvSJ4r6jNukfaC77OUfLzBNYCJ70sLz0fIxa6uvY3zliX1Vlto
	FdDFQWQzAx4YCnuVBHqYYN21Gk2e8+FnCB+FKkjFnEd1MWOHRVY1dIh/3/HWQRWGHKmFmWlG+YS
	Bdaim+A4qHBcrJxtV647eKE0xLdsj9iRIyx6COWhC726MP8CGbqmxWKkwoyrSJisoJcQZFD/LOE
	Rg5vgnG5yiZszb8A7u9sjm7qqFF0u4+eFhGCXS4XPM2QNpwev9PAy8ESJjGZ4ZLmz4NRwtYnHeJ
	AAEyUwuIIf74+pi9D
X-Received: by 2002:a05:7300:148c:b0:361:a195:c46e with SMTP id 5a478bee46e88-377de5f761amr2466577eec.1.1794466205719;
        Wed, 11 Nov 2026 22:50:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:05 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Mark Featherston <mark@embeddedTS.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] Input: ads7846 - simplify sample filtering
Date: Wed, 11 Nov 2026 22:49:54 -0800
Message-ID: <20261112064957.1796975-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
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

The filter and filter_data members of struct ads7846, along with the
generic signature of ads7846_debounce_filter(), are leftovers from
custom filter callbacks that were removed in commit 937f5d5ec642
("Input: ads7846 - remove custom filter handling functions from pdata").

Drop the filter and filter_data function pointers, remove the unused
ads7846_no_filter() stub, simplify ads7846_debounce_filter() to take
struct ads7846 and the sample value directly, and call it without
pointer indirection.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 72 ++++++++++++-----------------
 1 file changed, 30 insertions(+), 42 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 9bcb2ef129cd..f1827684c902 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -135,8 +135,6 @@ struct ads7846 {
 	bool			suspended;	/* P: lock */
 
 	void			(*read_state)(struct ads7846 *ts);
-	int			(*filter)(void *data, int data_idx, int *val);
-	void			*filter_data;
 	struct gpio_desc	*gpio_pendown;
 	struct gpio_desc	*gpio_hsync;
 };
@@ -631,11 +629,12 @@ ATTRIBUTE_GROUPS(ads784x);
 
 /*--------------------------------------------------------------------------*/
 
-static int ads7846_debounce_filter(void *ads, int data_idx, int *val)
+static enum ads7846_filter ads7846_debounce_filter(struct ads7846 *ts, int val)
 {
-	struct ads7846 *ts = ads;
+	if (!ts->debounce_max)
+		return ADS7846_FILTER_OK;
 
-	if (!ts->read_cnt || (abs(ts->last_read - *val) > ts->debounce_tol)) {
+	if (!ts->read_cnt || abs(ts->last_read - val) > ts->debounce_tol) {
 		/* Start over collecting consistent readings. */
 		ts->read_rep = 0;
 		/*
@@ -643,39 +642,34 @@ static int ads7846_debounce_filter(void *ads, int data_idx, int *val)
 		 * wasn't consistent enough.
 		 */
 		if (ts->read_cnt < ts->debounce_max) {
-			ts->last_read = *val;
-			ts->read_cnt++;
-			return ADS7846_FILTER_REPEAT;
-		} else {
-			/*
-			 * Maximum number of debouncing reached and still
-			 * not enough number of consistent readings. Abort
-			 * the whole sample, repeat it in the next sampling
-			 * period.
-			 */
-			ts->read_cnt = 0;
-			return ADS7846_FILTER_IGNORE;
-		}
-	} else {
-		if (++ts->read_rep > ts->debounce_rep) {
-			/*
-			 * Got a good reading for this coordinate,
-			 * go for the next one.
-			 */
-			ts->read_cnt = 0;
-			ts->read_rep = 0;
-			return ADS7846_FILTER_OK;
-		} else {
-			/* Read more values that are consistent. */
+			ts->last_read = val;
 			ts->read_cnt++;
 			return ADS7846_FILTER_REPEAT;
 		}
+
+		/*
+		 * Maximum number of debouncing reached and still
+		 * not enough number of consistent readings. Abort
+		 * the whole sample, repeat it in the next sampling
+		 * period.
+		 */
+		ts->read_cnt = 0;
+		return ADS7846_FILTER_IGNORE;
 	}
-}
 
-static int ads7846_no_filter(void *ads, int data_idx, int *val)
-{
-	return ADS7846_FILTER_OK;
+	if (++ts->read_rep > ts->debounce_rep) {
+		/*
+		 * Got a good reading for this coordinate,
+		 * go for the next one.
+		 */
+		ts->read_cnt = 0;
+		ts->read_rep = 0;
+		return ADS7846_FILTER_OK;
+	}
+
+	/* Read more values that are consistent. */
+	ts->read_cnt++;
+	return ADS7846_FILTER_REPEAT;
 }
 
 static int ads7846_get_value(struct ads7846_buf *buf)
@@ -759,7 +753,7 @@ static int ads7846_filter_cmd(struct ads7846 *ts, unsigned int cmd_idx)
 	for (b = l->skip; b < l->count; b++) {
 		int val = ads7846_get_value(&packet->rx[l->offset + b]);
 
-		switch (ts->filter(ts->filter_data, cmd_idx, &val)) {
+		switch (ads7846_debounce_filter(ts, val)) {
 		case ADS7846_FILTER_REPEAT:
 			if (b == l->count - 1)
 				return -EAGAIN;
@@ -1367,14 +1361,8 @@ static int ads7846_probe(struct spi_device *spi)
 	device_property_read_u16(dev, "ti,debounce-tol", &ts->debounce_tol);
 	device_property_read_u16(dev, "ti,debounce-rep", &ts->debounce_rep);
 
-	if (ts->debounce_max) {
-		if (ts->debounce_max < 2)
-			ts->debounce_max = 2;
-		ts->filter = ads7846_debounce_filter;
-		ts->filter_data = ts;
-	} else {
-		ts->filter = ads7846_no_filter;
-	}
+	if (ts->debounce_max && ts->debounce_max < 2)
+		ts->debounce_max = 2;
 
 	err = ads7846_setup_pendown(ts);
 	if (err)
-- 
2.56.0.567.gdb80ae8cd5-goog

