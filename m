Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204678;
	b=tCrLQdqEaWHpA58dVhNQcA7Ml2pi6W8zy5PBJFE1d7MdFvJZAhuLQkIAd0suYozzNCX5
	 gVtOrog/ZBXpN3+HdWmSEq0fxfapagAgXmfqO+D1UGPDbM+UTTAfofmVitWyeqZmXSxkJ
	 bFn9AqbYjy6XCfps7sars4RAFmFL0eq7dk6CIMLtAZdEfTx1YPReNagf2m/d+7U4jnana
	 r1g8nKoKzI1Iz+HmO4WMxzUXMm+p0lK5Ft3CSJKwP2CcVJeBNh551oE2coYH14vtbGmk9
	 3sRuZHwwTCE07MFnX5vRZ76P0OJaFgLpQpYH0yS0iTWKaxwz9tBL0+Jz0JNyP5IgSgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d0+9T6WMMBqwCfVLifFK6dacPPozrHvyz8Xfn7g/UCw=;
	b=PIzUs83sKd4j6cW/4tkk1aRC/Kf0cABMoeUTZT29puCPxplEGDT7XdyOZM4FZk5Ld32W
	 QpK7nTOgrpXWzqBoGhHfOwGXT81qjv+pC0Q/cw8te/SGyTKVR3KPVFq1X47Mj3gFmTXZy
	 VNbrzSvsohSdfVfRNlQ4OCZa+qER/V+OXxrm8dr2YyaCZy7avL6wFqlCX5J/nhkUegLfL
	 +L/casMRA4Bq6OHCyYxKodWzTcxumhUOxMRGGpsveuShOViMyghq1l6qFApWjk6tI1DYn
	 k9iBITq7rrjWrZUtIXE/9mDWn8iKYBsv/GUSQZ+HOrA/5beSHrGX0pZ63tfiPRkSNiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbG3f67H;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F2E606A33D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F2E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbG3f67H
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36ff9c9da34so901247eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204677; x=1794809477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0+9T6WMMBqwCfVLifFK6dacPPozrHvyz8Xfn7g/UCw=;
        b=CbG3f67H9GUeuN8CRNc5kJQBRsAnWzfsF5ytysEWLD0oDckJ7to9w+mGZ51P+JI0gK
         mZsG8X1UFhB7aWz6wSl+gvElBeCgseMK9GMdZej8g5yglvAZILYXfTOmlOHuI52QYiFM
         Cky21RlWHqUQxh/fhTZngLTW958l70dcKIDHIacfIaoapajRzBFJlc1Vy4rjIBd1aPZY
         P7CSFN1jzfHti1TC32gmJI1j7VhoThfghd/qO1+UmY6TGurTJloY2MEPo2TV8UBlUJ4o
         GiiWbrhjw686kzrn3W3oo3Yej4w44vnL4be2s7XaRRo2nwamXgWXfFshp8SFPQx2foee
         MzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204677; x=1794809477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0+9T6WMMBqwCfVLifFK6dacPPozrHvyz8Xfn7g/UCw=;
        b=OXvotp6PwHrxs8QJR0zHKihShn0EShtwzMWCjyv+eD+pB2wt9SnY3tlrvDmFU6hetT
         jFqcpbO9wfb0aXRLregZS6WTDxrKRN/UTEdLBcdFSdMQI0l+Ut+7wBwTTc28Qx/FaYQ6
         JWJMqipMOK9Zh91mqKDX5/UlZYCeeF+sfZCf3O8DHdODqh3jTh7qSByIGP7pJ6OZ5kt1
         GNtPXDG9EJriFR9WvxU6rZsqrx7L+ntlVN+u/fQHVstXp7POtcXBdUjHFtYCunGazcbf
         9q1wpX0SSXpyXT0jsGfbOHkyP/efASE9+TLDSXcTI56QdEFN98gAb036HpI3fjn7+Jn2
         fxhw==
X-Forwarded-Encrypted: i=1; AL+hErFYJfIID9kYot3anYPyh6zUKWAH4kqW28qcGKqj/7yW2yUR0ybJRGZfNfA+bJWTvWfxU9bdijpB26cygns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LNtPhxIG239hzcOFQTgOXYszdCe6XfOMAhaQH98LriinUZzmQ
	sAjbdEBcHIeWgcQjOBlZJ9cEkfEEQt12Q6uDy/jXdujAM41y07G4j0WFuVkkcQ==
X-Gm-Gg: AYBFou3bA3hAiQDCzOdRVKutXTouhK/TXFFxemqjQFwTF9AINjItySQTx1DrieuVwHZ
	oBRQwLB2eRD9otLGQaUXe9gT3wONFzsboiGFG8QX2KZ+t3NivryBRdYpW894z+5UQa9TMbSV1NB
	R2Xqu0TCsVvhFeEtj40w6WILXujQZkRcgUU2/sX6rlSU2UCR+VoCqNEACw884IBnCI40idb8wNA
	br+SBJcWF7DIFoXVzwlKe19pC6qOqDHWXDu0HOhlCZP4h8qRaFwSlE+3amJFDAN3NRAb7kG848E
	2nCfQYLPzP9IqGkTEdDHedUKBLHDzzmD9LJc02koF6Mei90LxJUArPLtRCH8KxGAuiFuQL1NCwa
	d9ikrqK+wuYscY95oimuvzwwNTGSZW0vzCgx+ruG9Pa0Ab9ZAYyK1k801RxFcmiWcU5Q5S6U6za
	I3sJB18NkCNdefJwIeVLjwyrFNPyw88dIdAxoS6PCD8p2VmbHGQ33o39ckuHZDgBuBwGYT8cuS8
	pYDAfoJSkDpr2+CT+ESkGmwYugl2KbacbaRXAwD2dUkaKllT6ZavQnDTlhT+yHJew9C2kjkQzQQ
	8kb4hhJwgU+rlOkJNq2pWH7fXkWuHY00ISFJFPYWfsg3/ivB7aYD05Ghovprul/TsTFwWDLbnL6
	Dtk+saLLKam8cOsC0
X-Received: by 2002:a05:693c:835b:b0:373:9551:b971 with SMTP id 5a478bee46e88-3739551c52dmr2920611eec.14.1794204677033;
        Sun, 08 Nov 2026 22:11:17 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:16 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 06/18] HID: logitech-hidpp: avoid NULL subtraction in consumer key report fixup
Date: Sun,  8 Nov 2026 22:10:50 -0800
Message-ID: <20261109061103.2887636-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
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

Report fixup runs for all 27 MHz devices because the keyboard quirk
is only determined later after parsing the report descriptor. For mice
and other devices without the consumer collection, searching for the
descriptor fragment returns NULL, yet the remaining length calculation
subtracts the base descriptor pointer from NULL before checking the
search result, triggering pointer-subtraction undefined behavior.

Ensure the search result is non-NULL before computing the remaining
descriptor length.

Fixes: 42bc4f3129e6 ("HID: logitech-hidpp: add support for HID++ 1.0 consumer keys reports")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 9f3ae8724dd2..a1a69705338f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3866,11 +3866,9 @@ static u8 *hidpp10_consumer_keys_report_fixup(struct hidpp_device *hidpp,
 		0x26, 0x00	/* LOGICAL_MAX (...                    */
 	};
 	char *consumer_rdesc, *rdesc = (char *)_rdesc;
-	unsigned int size;
 
 	consumer_rdesc = strnstr(rdesc, consumer_rdesc_start, *rsize);
-	size = *rsize - (consumer_rdesc - rdesc);
-	if (consumer_rdesc && size >= 25) {
+	if (consumer_rdesc && *rsize - (consumer_rdesc - rdesc) >= 25) {
 		consumer_rdesc[15] = 0x7f;
 		consumer_rdesc[16] = 0x10;
 		consumer_rdesc[20] = 0x7f;
-- 
2.56.0.506.g506a7eabc5-goog

