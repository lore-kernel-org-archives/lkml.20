Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380204;
	b=IBdLQwuBVSu4z3Gldkt5lNGMIfobMMabr+/89v2B0gYXDIvHJzjf36TGvbA5hbHPJ48C
	 FB0MD46L27SbdZ82tuEIorEQE8Y6IEJpf88d9ZamNtmzK0JibcVYW+pUcmNVbB2DbSwd4
	 7xt8AVod7PLavuh198qZkbkioNKzU3wtArffa6WkrKR84spqdrobmxRzd8dxw5+g8qInR
	 1vynM6lMv0pu6iRfR4X+/9DrHObKptf4rjvmSku5rAX1Ytl1PAytnS5XS65XHfmTCuO4Q
	 2AACXqwXSkI1Qsass2e1FjWnyNVT+laMbImc/rldsN3Q1uxyUl9VB2wNRtX36mGznfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=s142rQGIYqwFuKUkekSLUqq2un/ylJfkIxejVPS7Jqg=;
	b=14S4RfVz700PyeuzDcrkUpl/+2bxqoP0g0NxT8Hogv9gyFR5l88gf6y+OmJHLD9schzV
	 P/3HvSqI/3ITs+f4rGdeFZ2SO+Nl4NjQEC7bRbmpF2LdxPGlAnwmAy0WQqcWIHEw8uwp7
	 p50JRayi2DF4p5pnfdO9IF5q6iaIVs8I3oWyRQcsQjUG14uwVpaYyJ3hdxhGJvPfBUxQp
	 qQEBMJWCFT96tl7npBw/wjmgZdb4/FYRFhP1rgTvXezi4zyfsCdLVPTYIpmSkZI3g44M6
	 o0VUG0lH/JFjTdFi4M+IDRVkDDuHq9s3qJKLnSnQF7TKfdLnAfZoeeaMLURBxkxcczg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jv6oAtCV;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969FA60A2625
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969FA60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jv6oAtCV
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so4894416c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380203; x=1794985003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s142rQGIYqwFuKUkekSLUqq2un/ylJfkIxejVPS7Jqg=;
        b=Jv6oAtCVj+V0OSEebtHUvH7w1tD2PVnjPhlkv+6C6YHxE9JtzJgPnXBEate9YhmSTm
         XXBJCttF+EVZZOcLor92H9uk4QI0X4I6DbkadxKU+zPhjIISmVwzCU9nl1MFO/q76BsX
         m8nVl3qY8Dj0tDi0ZbIyeKef/1rztkeMkspKt+62Eu9OOL0pSfzP4vAhjBgyi5m9lYCG
         h0p2qCf6rHmHJkZU3i+ae4zEfXTOvr+6S2W0xCsfPV3VchXQyIsdshSA7HSkkmAOONR1
         oB0Yfwq0Q3jTOwVHroCiAPEkAHXDBF1P0MtuRHRwgPKd3nOPFUf4JqJrnwHRjpUa/5TF
         KKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380203; x=1794985003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s142rQGIYqwFuKUkekSLUqq2un/ylJfkIxejVPS7Jqg=;
        b=PJVT3OHYMlil8rNVjydjvd4gnmpmzk2lwaPExcLe5KQ0Jc1yFaZme8X1UE9QIE/l0V
         smJs9X+bsF77pAD3Z87gZzbe47Tz1yb9zVNZJUW4KsllfoIXsKS4jAKyuEaWYeMJ0kNG
         EaCqvsayx7GPzbMu5+0HnbfMPO4CLb5Q67j5e/LcA31Y9V+7Yk6g3mNR3nFbbjb5Li2S
         jLtDVzzsl7JSUURRYg/9BGA7UFD80KJ5tuk4HvOPEehHbJBDEUXYjPGbaw7bflL3sO/X
         Ot3MvunS4mijP5wR5wjQH2Ete3X8NI+BlsIoun4gMhUbGoc1K/muNZIUDgKuaa/UBmf8
         iMrw==
X-Forwarded-Encrypted: i=1; AL+hErHZuzb7hDIfZWsk7KmoVMAT375PnTaj0Ue+GAGXhuBkIJXyK06rt1RCr1gKVdh/Ed7k9SGWc0LcS6xbguc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FS3ruMaP7EnZ+tPkoGVGWsrPbNq2Xj1twTltwuXkbliFv7QKD
	h8Bm4Y+BKDrdBTnaKUNOSA7u+cUK1fdRmX3nkBz7FdlRul/XatVqjYlL
X-Gm-Gg: AYBFou2hJq6hMn0tPY4WP0Eoc2o0MHqk4XsqKIBLbEv3ug4gpwGS4DoXScuY8nLxgKX
	IDX9uGW/+fZupEtqia8L/a9x3GPiZSSC2dGFxaoYpqqofJTE6UZ89apeT73us1VHzeOko831dzF
	YfYQNR2XBRLWKpSlwtxpAb+4MMQ1BJ39NeoVf7mRYz8ikpF6UZC//XjGlcWtyVO4Yn7CJQwkapR
	ZAHK94IRn9ip9pXLlf5RZ3f9E4B4LBW+gvzzTAydu5+1E340VytK5gEiP+G5oRcfiTxsz/zEMP8
	mBvEW6MoCd8yRJ8VJ+/JDZFkDy8wgsrErsTUtzglK1LC3mw9mtXXu3gNZTFcUiWyDdk3wNJlr7C
	WlUXyxNUlymqhjcOUwP1wptEBQ+tr7iFXvLaPVtG6UCTX32BzHr3B4ERPDfD8gy6eMHbEfqFJns
	ixmmwzee+qUQCEFLoNgxdEkJQctendFKNnZiH8vofWR8PBi7HFaThio4mEEmW/sjR3Y+J/jv0gz
	8gFKTRhwH03Hj8ap3MjFy0Ym9UKPaF9VXO5UdLh8gdRfz1GkiD45tektDsVueRY+Rkw00jxGbjf
	J9VWUY6EX6xwj2A8eiabq8CkvvedZQqPVQ4Er4oYGK1z5bwslbdO5GlUKsJu6+GHNB0RhftOh1o
	PvcaV5o9MVn2ggKvInw==
X-Received: by 2002:a05:7022:f519:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b3c034e284mr1319869c88.34.1794380202584;
        Tue, 10 Nov 2026 22:56:42 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:41 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:11 -0800
Subject: [PATCH v2 13/33] HID: logitech-hidpp: fix K750 solar battery
 feature lookup and reconnect
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
Message-Id: <20261110-hid-logitech-hidpp-v2-13-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

In hidpp_solar_request_battery_event(), the driver checked whether
hidpp->battery.feature_index == 0xff instead of checking
solar_feature_index, causing it to re-query the root feature table
unnecessarily or misidentify whether the solar feature was resolved.

Furthermore, in hidpp_connect_event(), the HIDPP20_BATTERY block lacked
a branch for HIDPP_QUIRK_CLASS_K750, causing wireless reconnects of a
K750 keyboard to fall through to hidpp20_query_battery_info_1000() which
fails because the K750 does not implement feature 0x1000.

Check solar_feature_index in hidpp_solar_request_battery_event() and
re-enable solar battery reporting via the solar request helper on K750
reconnects.

Fixes: 696ecef9b587 ("HID: logitech-hidpp: add support for battery status for the K750")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index f717f0308454..cdeb1b3c2f21 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2122,7 +2122,7 @@ static int hidpp_solar_request_battery_event(struct hidpp_device *hidpp)
 	u8 params[2] = { 1, 1 };
 	int ret;
 
-	if (hidpp->battery.feature_index == 0xff) {
+	if (hidpp->battery.solar_feature_index == 0xff) {
 		ret = hidpp_root_get_feature(hidpp,
 					     HIDPP_PAGE_SOLAR_KEYBOARD,
 					     &hidpp->battery.solar_feature_index);
@@ -4582,7 +4582,9 @@ static void hidpp_connect_event(struct work_struct *work)
 		else
 			hidpp10_query_battery_status(hidpp);
 	} else if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
-		if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
+		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
+			hidpp_solar_request_battery_event(hidpp);
+		else if (hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_VOLTAGE)
 			hidpp20_query_battery_voltage_info(hidpp);
 		else if (hidpp->capabilities & HIDPP_CAPABILITY_UNIFIED_BATTERY)
 			hidpp20_query_battery_info_1004(hidpp);

-- 
2.56.0.542.g3ef89b7020-goog

