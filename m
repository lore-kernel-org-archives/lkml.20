Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736142;
	b=X1Ipph/x13FZlTnEntQHjUbt+LA54sid+88pgRIzTqFrrfM8jxfCAkGLmsIUQ+6nv+zL
	 DfCcD7YHKd11AqkRm8e0Ot0zjpFPqGXu/qZhLwG5ffYN4gRi9x73D/TLbEKpGgCTMgkZD
	 EnzsiDsu94p4ADwDTd1amWrPUg9sroIwgAEC/gkeBzIOeMUqqdrxJEop+yenAVdlYp6/l
	 dpVpIp5Nm+oH7/6dUDGJWdUO9CkdeXinFILl2amPMlmEQgM1bUmx6YOImjvjUQduaIiBH
	 c53UOdpZ736/tH57b9FopWDMBQF4DiBxbrUtYKGiGMXXutzSACb6ruLiVwWo4BAkb2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
	b=U7mEryBlzrcU8hAx7wXZJkKufA7eYXryaEAv8BbrIKeq82TqhQKoHoh31o8XFa1PRYub
	 qpBYjAv5VyZb8NGTdsKaB4GsuakB3RkYubtEHjU9z7KoGOMuT/Jf7XGYkp9EHCloTUsZf
	 UAt/Ud94mWIqirGcmY4nN/RVUY+Gi5UoEkVl8jSi7PzLVWby+max5Q8MzwN1KEYxYUm9c
	 GzeFxWKlXV3DieQ3pyNr40JcMteaulm93XyhZWg+bYKQEf+NSiE1pSwcK50nr9wv63sfH
	 nCO9DM8maiXjyhmooxC2X7ldbhpMXDuvWYxnNPET24eUN7PYRfpeYbJXECVVvllJwNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgt4IS1F;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DDF606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63DDF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgt4IS1F
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b125371596so9980147b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736141; x=1794340941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
        b=pgt4IS1FC7nW0YArEAhe7aIbrJPeoyutEcmMPEHSLdqxh05jrfHi1QtBR5dGtgdiXl
         ifcp5mhPyKEBTZ3Fc9OEMJYv587LsBPAsmi0wie8r/2XWdC92lOVwo2cGBMnyxE3ueVK
         o6ONndjZ0SaeJoYfivLmH998WaGrwOakXCJY+61hSNvkIZq2WWGxZCAx73d8ltr6NGmc
         9zSu2HY0evpOvZiA+j271Fhz+xz5GY8NxfDYOOLvsiFFL6mh5EYSfZvsFFSe7kS0mBkk
         szTcM/i8O75tnWzFyWlrTTu0xHljVJWA7gaGqFlCVNHi1HX/2+e5dNNdhd0KvjP7OsYt
         6Bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736141; x=1794340941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPsd08imWPUgooGMrfpChvpxAcwbOgNAsgqoEHv8Bts=;
        b=wamxxQYjzKGc4xIDqFSeMxKI7Yn6bMUv7Pz2qyn59AeaAKcR4g24NbBmtK/UQi3Ypa
         W/zplIuQ/6jAKrUBWCzCfF1/kdTVOGK7f6VxNY/DRC/4V700BsUtkYMoLMsNmjy2Jb5m
         WV327a6UUYSvzLfhGfpT1b670OVtCnvf+3fen+lYTIDsGqDX4o0obcE86lO1Nkf771+q
         iVOZI2Nfo13dyLOzcWAzJyVEtkIhmEp790FXyCDCsjj+gwVh+oVaIl/KyqUiHawgwYtL
         Gt+DzFQLQQ76saPp6AxAyKgqfKNNnCVw/J/J5Io1FPoeA7kNchn/bnU8RQrKKX8XgxuX
         PJ3w==
X-Forwarded-Encrypted: i=1; AKwUvBwaEPEFDmDCEAkZkSDpGzdOjwU+1F65VDBk97hRUW5tTKAFg4uWOHHzE8ct3bX59TsJpA71CiZyRxY2Lm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yjtejn0KUo6V8PV8B0PbpOP/S3gW86UyU1H2rygwlAaVJx/5q
	bwVryqi7iDdllcps57RoH5Ob1FQDS1zKinCtkWIVvQdLtZQAlvB0tYNR
X-Gm-Gg: AYBFou0e50tPAvmSV9Gick19kPhq/UJFn+IDCPpB4f+bRvfeE4zQMaXaWzFvz6yYVtm
	qqEdRZP4mi5LEG3SSD5b7VG0zjIgzOlHrIZJonog8NVDO2y7v9oP0Xd/IONx8W4fHS1oAcD3wWa
	891UrIoMP8YpDfIYKLSdtOh5YFghjjGeyt4vM28T+Bw561skIlXELgqrOip6TEQYwTzdJSiZCjL
	NZabfENj9yGxCF/ua75czVZqdeJw5YUnYAyNG+pup7yoVyg+5YiwL53DB5yxoSgBMXXXUj0nkdb
	avUR+aSP/t8Vlb3uMHMROGUUqjGuWRclbXH/u+CmWfX3sU5pQwa2TJkIwt4doiIwnUAK6/f0DZd
	tXiY8CGjseMIc39R0axiU5DuX03WYIc4+vJT4D0YUE8wTUdeQzXPhjl5kfmycnwa62v1zXEka30
	QXyXkwOj3bMR1gKqmVM2Va9ke9rJEDQzIgQwI8hHtoqKoT7WiOKIInecitQ6AQ8U+Ef4kybJ+D8
	VR4ydN5G/adsyPi6ZerYM20kxBm+ds70c+J7H8xRH5DZ5XxOAJtQ7uJorzaQLxS7jJMmYf1XEyA
	5v8AbvzdRfVyckd+N3CuQlSsLn05QyFpa7QOXJ4JjUBNz5xOPCo=
X-Received: by 2002:a05:690e:4546:10b0:677:ade8:a076 with SMTP id 956f58d0204a3-67ba50c7b54mr6675580d50.47.1793736141331;
        Tue, 03 Nov 2026 12:02:21 -0800 (PST)
Received: from Abelha2665.autotrac.corp ([149.78.105.186])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bee245f70sm92764d50.11.2026.11.03.12.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:02:20 -0800 (PST)
From: Jhon Wilker Rodrigues Aquino <jhonwilker0112@gmail.com>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
Subject: [PATCH v2 2/2] usb: misc: usb251xb: configure battery charging from DT
Date: Tue,  3 Nov 2026 17:01:54 -0300
Message-ID: <20261103200154.125681-3-jhonwilker0112@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103200154.125681-1-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
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

From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Parse the battery-charging-enable port list from the device tree and set the corresponding bits in the hub configuration register.

Keep charging disabled by default when the property is omitted.

Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
---
 drivers/usb/misc/usb251xb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index fb0693742f018..7c0086a554cfe 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -577,6 +577,11 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 			      (wchar_t *)hub->serial,
 			      USB251XB_STRING_BUFSIZE);
 
+	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
+	if (data->bat_support)
+		usb251xb_get_ports_field(hub, "battery-charging-enable",
+					 data->port_cnt, true, &hub->bat_charge_en);
+
 	/*
 	 * The datasheet documents the register as 'Port Swap' but in real the
 	 * register controls the USB DP/DM signal swapping for each port.
@@ -588,7 +593,6 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
 	/* The following parameters are currently not exposed to devicetree, but
 	 * may be as soon as needed.
 	 */
-	hub->bat_charge_en = USB251XB_DEF_BATTERY_CHARGING_ENABLE;
 	hub->boost_57 = USB251XB_DEF_BOOST_57;
 	hub->boost_14 = USB251XB_DEF_BOOST_14;
 	hub->port_map12 = USB251XB_DEF_PORT_MAP_12;
-- 
2.43.0

