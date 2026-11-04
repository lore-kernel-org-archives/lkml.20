Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778139;
	b=gynZJNhP9W+Ne32tg6koZMRz3bbfXoUmoa2oQaDhe9/1eCgOlcGwNBo7/xlaHjpSymSZ
	 2UBjVh3GVZuCOUkk70p/NU0/ABiKvRZSvq9b0+Erbqh9p0icLt0KA8+n4xr2GBfhd2JVY
	 VQASkjbS3p3xScLEm99u1vLpVVGujzSIsxV5SbCAInDXfj8GtNEeOOaxiV8qq3arkmXri
	 1PA/uQFZ/q0snw2fcxWDYzNlRxsvokq3Cgu6j1PD+K7n2Z0xDihTjpwhyyCAB0DIFjAXc
	 BJ215+1VKBCg6FVhsQS+me55roAGBudpAH9o9EHVH1cC2BwjaZ00njw0Jch9ymMpjLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
	b=xwO9xV2h1Gzv7ZE8KIerJBV36Y/yl60S1kt+3jiiw/pc873ligPVtHL6dnxxGRuqQztq
	 BhwzcaCEHIeoXPt23VAD9yoZckA31W6KsE72exoeRVNMq+Hw2/98KRCN+TxzLfVL2FwHT
	 4CUXhSoGuigbs/7kT8G5S/sq5oD6NVXtzXdHZXTdMULkAp8XsqO9OU3JJ61urjojvVudU
	 JwaVl0BvtryFrpMGGqBaZLuXPlOYJzgQcEpEbneU3OX5gY2vArEqCAV81ALpwIejprtna
	 DOi45Qfz9sTeUF/InPydWGzPgGkjThA+IrvZOSZOzTc+FiYrBDHcViH6ocLVFdHm2rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOFw0+rQ;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444D4606A337
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444D4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOFw0+rQ
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso306561c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778138; x=1794382938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
        b=GOFw0+rQ4Ki57IB4ZW29BzoZiSL96hz+qgDdjQj/oPScTAJi6HjnRAB21NRT9r425C
         xFTZYWbk9VXMZLFutBr+ixjINLhyH8eUmPnDgjRXZEi5NmM/N21ZUhJB+gezsya3SppW
         f40oBw4DuuBXQ7h+VNBCbpqg17daldox5cbY9/+Pt5zItqHpb4bCcdRp/ZejRi/NDrV6
         +o78jxmwCzV6VS3Wpiz5z380+tdLFoyj3ipB3Ths2yn0XTFclU6/E7BXA1sN1/j+SqI+
         F/NYKZ1PW5nmiThlTwpH/cXt5B2wsfDpzxDVU1aULl4tiIoVGfBTP3SNUpB/e0nuxS1O
         VdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778138; x=1794382938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DmsYpFlGwWZ6wODCprWn4/pAbquT0OQazWJnECBB6Is=;
        b=HVQoY74waXUaANdN/66Hcp5VtsBXvlvOtyK/oIWstk9WBaDCj3ajDODipa87tpXIXr
         0SGDzefWdz2txmwVT7tWyVdo7Geohvb0Rg9lsVwOAt9msYC2py0fSpzuQRt7yhktgZ4M
         Kk6OyyhT21Fhcp1jabWw6urubxCgtbJP+qOsGTEgintoAo3dR988MMfiLJ1RXA4KxXao
         lvwRd20jUUcmgGvq9NPGd7Yg9M/LV7Stn+22CGRpGiiumX3SJ7oJIxQbggdp4uyVBgvA
         W8gELFgbzte+e0X2uGkrIzja1rbhmPoNSDmE5/96z/J3ZObYXBaxevUuoeQl3ZWb594M
         bVvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb64u6ucZe+lFQEDpN6rkgKh+35bvErrHR0FBK1SwZGDYchimbg5jU4rYJL7p1DnGkvaJtWZa0ZeMEE7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z95kIf6yeiivmJA58b63gsomrGSMhsvzP9/a43hhF1f4zUpmmjw
	wVBRQ+S5kMTOnjAr08v67hY0W+DWJyfEkRmF4sqKfU7eCW5BECz/12zT
X-Gm-Gg: AYBFou1mzwrbbet/J1uYpmtJwIS9hXQi6bGV2jHv6b2zJfb74TukjANRM5PgjQafGRZ
	gIDfRK7Pg8QyQ4XoArmAqBKAWfkMQuC5gPRgHsKdyGshqpOvx1gkqHri/k12MDfBA33/JnfiYmK
	yFkM3MCg7xBjay5lMEOgDnAQ8Qw8RImhUFiUKM8wrSpTl3ZZ3bobg5plpwizIlcjKhL7bKCPxmB
	ebYOXvtjHMgDgAWpmimQSQP5CzJ99cc/AumAha97rb6udaujottiVW6cehCoZawne+8ujak4uK5
	Jfm+dZmWTFDprEirwOLXFcjy3VYBk0+kLLdUxkkPnnphawJeTES3XqzHCuJG4b2rSVe4fSvt73o
	Wi6H9JEu3fxykSjd4TRmMjcKzcldvVuSkhlKh9vsUsYmTyVfA/48oTJ2dQ49jkYRhBJ3pr6mC0A
	OfCzo3G1uUGaKq7yRPHhvnTwQqgZc/YG/r70yUFXs3qVdAa6ZyKeTzstyxRZCa0o3uVkkYPs14W
	EVy5QtdWuTE/cr98aPZM9cRs7upL4qxhDvL5wC7vEInK0ev7JJ2WEN3VRlnC2fe7Ev9kWsgAgnX
	cbOt9sN8ehu9VJ/ELpA31adQeg1NrvuegAz+54g4qmaGGycVnM1UyQ==
X-Received: by 2002:a05:701b:4555:10b0:1b1:f02b:2317 with SMTP id a92af1059eb24-1b1f03a6afamr11492019c88.22.1793778138147;
        Tue, 03 Nov 2026 23:42:18 -0800 (PST)
Received: from 192.168.1.71 ([2402:a00:163:2ce9:c926:5826:36de:3b37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm5318385c88.5.2026.11.03.23.42.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 23:42:17 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	romain.gantois@bootlin.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: usb: ti,tusb1046: document HPD_IN override
Date: Wed,  4 Nov 2026 13:12:01 +0530
Message-ID: <20261104074202.76712-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104074202.76712-1-blfizzyy@gmail.com>
References: <20261104074202.76712-1-blfizzyy@gmail.com>
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

For boards where HPD_IN is not asserted by hardware, the TUSB1046
can force it high over I2C using the HPDIN_OVERRIDE bit in the
General register (0x0A).

Document the optional ti,hpd-in-override property to force HPD_IN
high when DisplayPort mode is selected.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/usb/ti,tusb1046.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index e1501ea6b50b..58e9fde3ca71 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -20,6 +20,14 @@ properties:
   reg:
     maxItems: 1
 
+  ti,hpd-in-override:
+    type: boolean
+    description: |
+      Force the HPD_IN signal high through the HPDIN_OVERRIDE bit in the
+      General register while DisplayPort Alt Mode is active. This is useful
+      on boards where HPD_IN is not driven by the downstream DisplayPort
+      sink.
+
 required:
   - compatible
   - reg
@@ -39,6 +47,7 @@ examples:
 
             mode-switch;
             orientation-switch;
+            ti,hpd-in-override;
 
             port {
                 endpoint {
-- 
2.50.1 (Apple Git-155)

