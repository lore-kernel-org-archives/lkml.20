Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380202;
	b=5OkKLrGjLUeDKt3yTAobl0vfCusqfjSzXC+vpMGwuutuYMXzDQJey2iz71vf1wed1/6G
	 mS7LpfVoJL+hrA3TlwYj1/k5VgrxtPE9qdOneTgVa7SU2c7suonYoH/+vgHIhNG2xHa67
	 2l8059fAP2+L0HS/TvHgJaZE2Zhr9MCEyRBTA5dp8IDCYoLi1wvVA6PQKtZ5Tm7QBIiNM
	 jMprrDKDm5GrvQOILl5xLm1LzRUolLz2QQXKZbN/DQ3SVKYhxjKwjGRO+Xz5Y9im1qD0K
	 Xf75d3neA120umZ8AAjscAEYZBArTXaUo5Q1GEHdSK4d6ailEtcQsUh/XmgkOPd6EJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1Yt98aftbzappM4NZjAdKvDjSZighEgA8WJl219P+eE=;
	b=PTLBkYLaggXJc7Qr2IC9iAmU29SQ5Teb71VeKf981cE14RdnmU1MK67g1dbL9xWoPDQO
	 /HMPJXmC5OqR1pUnhdQy2GxbOve9R7SPr+8eBHC4g4cK5+en8/bjJLeeDjcRT3cQ92BId
	 nriYz8ezjmj1DsZj0BqoIjzS/UTd4YcNFVr1pV/wILGiBG1AvRDamVntn678MYi2nGZRq
	 quXyRqXRZqSekd9JOz9ASLjHADFbAtJuhKJ/Z78HQgiPM73NJW7zNx8iboDjXaQ5VgE26
	 GGDygJK2ZdlzD9f5Qa6rirIJybl18J8fmHZJNYYpQIWXwY0iQ1Ob7diKSFFAYz+S8zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPl5TzAq;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1760A2617
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB1760A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zPl5TzAq
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso4759241c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380201; x=1794985001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Yt98aftbzappM4NZjAdKvDjSZighEgA8WJl219P+eE=;
        b=zPl5TzAqaAandcmyf93fMP/SKnmJFwqHEkWQEndip5DNWbt/eDobWVihWYuECbfMxA
         oR1/YK5tWXzWXDZMBqOsQ+F6VpVljf0ycYIC0hHiJPc9xGsyQCSmD8JBM9eaHfAKfWyP
         G1/ia4qD8Vjn6iogDMfSMOtalQjXpsW+Nmu+cfVaxey5h3y3cC2oKgfk8UYMArcSDIgE
         zEsPsfhBEfrrB/jKQQU/DmPDsVKkigtr+Irbw+jVJ1jDa4Y09dFhNzN/rbFC3wQ1ouX2
         eeHEikZkG4N6kebZuq7LFrMMmgyPVIslYG1xvjgK2xLlvgbGRJr0gyx6KgvFkz8tXxtB
         4LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380201; x=1794985001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Yt98aftbzappM4NZjAdKvDjSZighEgA8WJl219P+eE=;
        b=ZiPflC3xiQ7eTD+prdMH8gFFAAXLMOm4blRDyyYIQRGRMhqHVCoeQo0gAPAf5MESR7
         nG5irhwNC6s1UOKZotG2ZVPYURNxasGHMrMBXlM1Od6NDrR9B0w2exfFAQhqFLdU7QTD
         5uEZjqA6aKU5S+Fph2eaHHDF6DQVVE4ND3F8hCqhv3Dh9UbSr2Q1g5H0MjpeZ1GwjhE/
         V3F6CuRiURuWaNcAmmpVJz6iiO7TUAvSQU1/4c/G+DtxK5U9Zfn8dxOpdyZfO3EmBxFY
         QCX0t0kPoxY6ed2eVC5HXsxfeS30qHYU1UYno6t/Cyg7eW6B9RDz03V/p4zrQV8ils6h
         RYlA==
X-Forwarded-Encrypted: i=1; AL+hErEY/rCgOF0uxEkTGQyQycxinYkTJbLTkZvOaZTW56aqiTU6zn1Zv1/A7Agm+p8+vcfT25Cvy3nI0q19pGo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J5u1FCImoNYadD4TtKMjlp/kol7fY8uxE22zwFYOSeg8hNof5
	KAJc5cLgNx9XvLD7lIhAhRuiwvIJCifDN4Mw7fXQEehl5N6Yi7Y1NG1o
X-Gm-Gg: AYBFou0P9rCxWa6A890f2d3g3skcqAkYoZWskAHAFCwIdo02oM9flPA7cuSp6BIS0YM
	rWrRzHU0DmgsELk5h9xUjdeSPjwtsAkrZNIaIoixJcjB6OiuWawsreMF8mWtJ/HVz3R4B3alPXJ
	f07zO28NVSnG5k7/QDp2j8xOEiruS2DdwJQK7imyYHsgqu+ZslzoZWCd2Uhc5rJG6PsNJWWrc2G
	R55NQPJq1R+GWQFZpNzVbrjmVVjSCokp1BhpyvZL3Ix4JrBAqPOCD8KRgYX73KUP0edBwqYY9uS
	/ZhL1Mvo6+cy6u2fVaRQ8tSl1wykDX187OVm5UoRT8zbJBNDGxAh46TdEpDSZQuUO8TWksWFEmy
	pUdqLRahHSro0SEsYJr2RlmgC+hHX9+VnZmfMbnpxG+sXj2bMXLCqxdfoVchJS21YMNpaBCyVeU
	SEU8O/UiwXXCKIQF/E22F0ETc++hfZzsg81MdGgZNz9dSdAGLscxu7DcN9qrU6vBhX2Pyc7wvO1
	GMk2CJ0oEvupnS7F+V6HiJYKdBpLh0XjawzF2r+84bhXQXMGsJ3zksCZJHGdkRV6q4GkmlJgMu/
	246oDdhC66bvqeW6bm8Nt9TTWwBl54Dsb8fVAP+NGgReyYp5zAvzs5dfJGfFzCDM1Px/OlBBGjt
	hPs0Kt9ER3kKwyR9+WPN4k6XzBTNvi2fMLTcz83M=
X-Received: by 2002:a05:7022:1e08:b0:1ab:aaf3:389d with SMTP id a92af1059eb24-1b3c023c0d1mr1325386c88.1.1794380201027;
        Tue, 10 Nov 2026 22:56:41 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:40 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:10 -0800
Subject: [PATCH v2 12/33] HID: logitech-hidpp: mark device online on
 unified battery 0x1004 events
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
Message-Id: <20261110-hid-logitech-hidpp-v2-12-30743e91d83b@gmail.com>
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

When a wireless device disconnects, its battery state is marked offline.
However, when the device reconnects and sends an unsolicited unified
battery status event (feature 0x1004), hidpp20_battery_event_1004()
never updated hidpp->battery.online to true and did not include the
online state in the changed check.

As a result, sysfs POWER_SUPPLY_PROP_ONLINE stayed 0, power supply
listeners were not notified of the online transition, and the 0 to 1
online transition check in hidpp_raw_hidpp_event() failed to schedule
reset_hi_res_work to reconfigure high-resolution scrolling on reconnect.

Include !hidpp->battery.online in the changed check and mark
hidpp->battery.online true when receiving a 0x1004 status event.

Fixes: e037acf0b1ae ("HID: logitech-hidpp: add support for Unified Battery (1004) feature")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 28402baf04fb..f717f0308454 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1761,12 +1761,15 @@ static int hidpp20_battery_event_1004(struct hidpp_device *hidpp,
 	status = hidpp20_unifiedbattery_map_status(hidpp, params[2], params[3]);
 	level = hidpp20_unifiedbattery_map_level(hidpp, params[1]);
 
-	changed = status != hidpp->battery.status ||
+	changed = !hidpp->battery.online ||
+		  status != hidpp->battery.status ||
 		  (state_of_charge != hidpp->battery.capacity &&
 		   hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_PERCENTAGE) ||
 		  (level != hidpp->battery.level &&
 		   hidpp->capabilities & HIDPP_CAPABILITY_BATTERY_LEVEL_STATUS);
 
+	hidpp->battery.online = true;
+
 	if (changed) {
 		hidpp->battery.capacity = state_of_charge;
 		hidpp->battery.status = status;

-- 
2.56.0.542.g3ef89b7020-goog

