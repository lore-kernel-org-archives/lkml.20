Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380191;
	b=TUwf1Ql2Mt3UIz+/54T+utKIX+e3QbSJYQrVctGxJ09O9ETbvTf/ZhkZ/CNlPoFmCaNr
	 q/9nRztMhminwaM9/8SBjGlR4leTzu8PdjcCwP/jlEgBI3v00dmTszjB/aVZh9VgjseBl
	 MywFMZRJD4ollUeYLjQlLhPWHZHy+VpaAK96Cys55Lqo5YqeU533GSVZh0Lo5BDLKmV4F
	 7PGYkLlHG0SGJJYqh0f2XpPrO6JGfSD/o7clgt/Qb1Xqoct6WSS10ptzpPhPmFUHU/auJ
	 Rr6yTiaAhdxoGkzVnVMcfC71X1Ma0K2Z+O6wTJbmgq9ibRo/SCTpa0AGeb6U/oSt6zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xOxTVkJvL5fIfalUxaM9jLKgqHystwJOtIasfX34Vd8=;
	b=qY1YVbC7jrIGHG8/2jrpzBsShP5c0wBwVyPL8fFFt+Z6C5gw+niiXGV14bMR4OaZkATy
	 3oygx2bMEuIe6V9G6no7TG/vVeFR7EetQqylD4P/c5498q3WzETvzs02qXsxIW6wiRZr/
	 zRKOyBJZW4+ulB0COUdlZB0QKKL7uCmuFGgLKLgFnDied8xYKqLzSAkRgXYnvMuWvzWPi
	 9j+m+L5yPFjrbWSjrqr9QmCfudWYw+/rjlBnFMBx7uipuf+JXIucFjOE+w+ygYaleCSHb
	 kCbuS3iV2yUiuM6uaoa/PpYM8I0c++jYIx6SiknTI0SD1FR7Sk2i04bChnvuXx66cVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzJwJ5Ym;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944AA60A380F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944AA60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzJwJ5Ym
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so2218892c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380191; x=1794984991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOxTVkJvL5fIfalUxaM9jLKgqHystwJOtIasfX34Vd8=;
        b=WzJwJ5YmEHZmO6+/lyRDLTkXW+QuTGRlhYXjQyaV25nirrsoTvwkfIhe2hDNer6sL3
         7Km2YxEVLKh/VGXGLN5BBRfAd1Hwa3NCQfB8XM4G62wgBLDq/3V0aH92cH09o1p4LKrw
         wj1xObzxF1MJoEJKMZU5ixh1nEsrzfqs7TVDfuDbu5wrQ1BQbKhR9zWv01L6C4rhIMVc
         4/yevFIWoTPnFsoB26REoJO8kOt50jciNW0hpk9ubC5yCKkLd6xHkDZqGptZ2kpyE/SX
         Rgz9AP9gsfR6q49Y8EoPMgR8fDxtuo51pyyY9H6tnzHrtso0WJiWHZXfbq8PLz9sJIJI
         tFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380191; x=1794984991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOxTVkJvL5fIfalUxaM9jLKgqHystwJOtIasfX34Vd8=;
        b=pn1ih8AdFfE2fflcFsuBbMGqLhZEsPDXwUHtail3Rz6ZQthY8PSfj5odywsYP0bJy4
         v0ukg9VTYsl4JrJ8VZo3mbBOObwR10FXJVbnsxiMw4rWQxqDzebgFhX2yROmEPhdfVdt
         O5186+rkLad6oe5ZimyZjrLrWpgTxo8nw1qP8UCp7kBhzfa0S+7ajfyD5HxpucIfXeXj
         4K0st5Uz1dtVkQqSin8Lmb49sql+6+7Zivp8Qh52+Gci5GamNeeyYMaZRF8Vbp2Blg3J
         HQ1Vr2eSLkyZ9Wh4m+bwEhJRFtueYMvp8+LRW3KFP1Fx9I3VwmWKdeCIU401OOFOikJJ
         HGgw==
X-Forwarded-Encrypted: i=1; AL+hErEk8YW9TZevzAXU+F7Zza4Nc7qXUidzZWuLrxlH7I90Yi5rA1a5Y3MntnAt60a8sGlGS/+NzVbLTkzHKuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d40iVRFDrCwhAuzVL2+b3dFj01VJ+WrlUiwGUlUnaIuY9kmZm
	gJ4gQrrylXtqtsz0wsga3WJ/hTednpvXyjJ1nkYUjwKDE43DcPYEkT1pBVKw3g==
X-Gm-Gg: AYBFou27O6ndxAbh7+dD+jpYhV0KWB/dsmB3CBG/JOx6dqf1T8c5/UYnnad21+DfhE5
	s4s+P17vwWH+IIHeXxxAzmCsqWWMXa+s+7eaVQAKNUC6wygripP2uNPCtvS65ttNx3T4AWm+jfL
	nsCsHVbGA2+R5E4vnSAKkEVZMxoD0Y+xyhTGXwTjVhaS3DmkaF3xGtnYalupLIdiOnkcl4iHWOM
	YZ+DXZAJgu2Kbt0EsjPgKGxWrAdRyg79i2oZWjU0xIL4hiUSQNATc+yt7iXpgj4Sm4jkwBePkzc
	fYnGQixYFnfvxMn7R43TS0gBCbMWVHpavzLCHZ6AKPMicq5vhfBKkjfbzZpCLGPde3+AEvmgEhb
	NJzDCEoL/VknxZVIHXzZLjvND2e2ahv6dpJEfQprvVnbfppv5Hvx1YHOU/TbyqyDcG+nS1R5iWK
	828OBvljksu4W6l0dZm/vJYDR9ZkwqxF0KpxgCEjtyJ1rXs7WWgIUgFQ7UBmVmaNiMtbUJK+Yu/
	Ql669UeAcrA2o1Gx1/glYqJYBQCfC+htQqPLxMbwtJg7zmqIZ5EJALLoS+/eymC4sdNh4HdBrXt
	kL986J/8+O++fIBz5cmsLIPcnCZGA/cgZR5t0+OX5Jwk/AM+4jxzY3zDqgjV4k/bKrSk7DlnC1m
	xEef8qY5qahv/4DtyyVkrh0fkDwW6jPFb86jQVSs=
X-Received: by 2002:a05:701b:2302:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b3c024ac28mr1481360c88.1.1794380189133;
        Tue, 10 Nov 2026 22:56:29 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:28 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:03 -0800
Subject: [PATCH v2 05/33] HID: logitech-hidpp: do not store ERR_PTR in
 battery->ps
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
Message-Id: <20261110-hid-logitech-hidpp-v2-5-30743e91d83b@gmail.com>
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

When power supply registration fails, storing the error pointer directly
in the battery supply field leaves it non-NULL. Callers such as the
connect handler and battery event handlers only check for non-NULL
before notifying the power supply core, causing an error-pointer
dereference oops and blocking retries on subsequent reconnect events.

Capture the registered power supply pointer in a local variable and
publish it to device state only after registration and sysfs linking
succeed.

Fixes: a52ec107fa81 ("HID: logitech-hidpp: create the battery for all types of HID++ devices")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0e1a9fd98faf..6ac41b7d76ee 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4333,6 +4333,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	struct power_supply_desc *desc = &hidpp->battery.desc;
 	enum power_supply_property *battery_props;
 	struct hidpp_battery *battery;
+	struct power_supply *ps;
 	unsigned int num_battery_props;
 	unsigned long n;
 	int ret;
@@ -4413,15 +4414,16 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	desc->use_for_apm = 0;
 
-	battery->ps = devm_power_supply_register(&hidpp->hid_dev->dev,
-						 &battery->desc,
-						 &cfg);
-	if (IS_ERR(battery->ps))
-		return PTR_ERR(battery->ps);
+	ps = devm_power_supply_register(&hidpp->hid_dev->dev,
+					&battery->desc,
+					&cfg);
+	if (IS_ERR(ps))
+		return PTR_ERR(ps);
 
-	power_supply_powers(battery->ps, &hidpp->hid_dev->dev);
+	power_supply_powers(ps, &hidpp->hid_dev->dev);
+	battery->ps = ps;
 
-	return ret;
+	return 0;
 }
 
 /* Get name + serial for USB and Bluetooth HID++ devices */

-- 
2.56.0.542.g3ef89b7020-goog

