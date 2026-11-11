Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380239;
	b=syRLRL1lkfKLzGTkI9X42gCOogNFxvUHjwN8dtzDviZoHVPWgSfz56Ef8mu1Pvw37p3y
	 rSFT4qnMd0lJTiFIGLrMZ6GXe34SQD0JXLR+FQbWXDiQ/8mF+2e8y07xxAJncw3ZhJXeV
	 5rt/7TlzQBdL6pk+5+mRm/Qn9fNZwN29J6pxaCKiHSyW1T9d1v+U7MYIrHepj+AFyOyKb
	 043UC4+PJubHxI5hr3fi/7dgpedb6MQ38LEAV+OP74urNGb7tYIJX5VEBpeGNig0S1kSl
	 xeYQk12JUQS+p562ea6I2YhcOtcPd+l2mo2Dv3igKV9b/2F4m3aR3oc86Wo6f91CRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LLae+NccOKaXCuAT/8LHfaWjJP6dfSgFnTHThUpT/B8=;
	b=PFJnxWsko+QOsIWeKU3J8V/nAdJl+auegdYTj6mKXs1oQ5jpBcZJ/I4TMR9+UvhlyLNo
	 F1+phejx2RlLdTdtJ+8WMfwC4HSNpu5yzgR2q2Zrd9cprDektvvltXr3sB5QjXu7Vx2ye
	 3GAH/l/V19i8qpHUvSA4AEfJF/vHwHMMoeYae2PuS6Amn2HC212VfFCF/OrRBIlnoKPrx
	 lil1Q0QPUqxHjwwaC2uZwGVu8K3CDlFpcG6DFN49uQ73QLn+QYJQpHNYhMlvcU2DdLL+2
	 FLBwNRcmm42UuZP9S+zR3UGjhWpDznzolJ6R0KPkviBaBsjPmx1dzAPzj6/1JwoH00g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veJztS+t;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933D3606EDA2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 933D3606EDA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=veJztS+t
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37000e7234bso663708eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380239; x=1794985039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLae+NccOKaXCuAT/8LHfaWjJP6dfSgFnTHThUpT/B8=;
        b=veJztS+tdKLJJJcjvy4KYbcS8XvcVBC0hP7hKvJVmO7pm+vsce8nBQspOqU0zpnHJJ
         ZFv6RsfpP4253EPQnk71pwdbUK7Y1qS7IKS1A9kw6SNsAp6xWqw8ddIc6TM49fN1DHvP
         7ZSGWHajWbq9M4/6uxTDHDYSptWBC/VbShPaYB7/Cny1JY+Ki7Ck1IpgQWmXnyMt1zeE
         KfNuohp2pRtSxRjhy0I/y7g1ltb12N9jj+qCsn8wzEwIY48kjNtcuA8l5sQJVU1hSge8
         /EGWkMD/z3tHGnJXbj0gm3cvEUVGuBwYCFLD414W5jo3ZFqry5z8Bb5xGY4ZsLkLbegK
         MUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380239; x=1794985039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LLae+NccOKaXCuAT/8LHfaWjJP6dfSgFnTHThUpT/B8=;
        b=AYelkSF74B771jn9H9gRVJqN8GWXmrN3oLohwneJ4xcIytzZvBZ/qg//VZI9hs3CPL
         SSP6QO2wEOI6B827v2WPvjiIVaJ78od/4B3MoYgK6zAPQDVWoHY4L1l+Za87Gq04tz1N
         2/20tKg72RbNjsS8UYBZ0uwBK0fP/CGOJsZMRxk88M3fxNDf4Vg04Kux8kOB9SkT/QxM
         ZCbkI9n+Hp/lTSbd3jPVpP7nOtkhw2s7mGok/OJ/Y3wilzennali1Y0w2dEb7lgA6xDL
         M0xjUu5jrlYY/PaKXhHKJ5e3vUnvA3nE98/aIX3ymgc2LPxJ1ZTtt1X3742u1w5gQJ8Y
         CYKw==
X-Forwarded-Encrypted: i=1; AL+hErHWkcbX9SXD5H9OSI/e5d8wzJEdxFilm7x6kNwtiAQmlbZ9vRJwmYi0a/RwZVaFCIs5jlTMKUbkxAwqP3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d5lFlYAPDhIQz5WS9W1nqaGBDv1+tQ387XlPQqfay7IsQFKkT
	OXdsWx9zXgh74M7VF0WAM99eQe0HmcFT4eMoMHhfDOnsJm4g8EyztwZI
X-Gm-Gg: AYBFou2CnbIZ0c0fk6gPV+tbtIMXvhpK6fTF+deqORyRxh2d9Tw1d4BzQ/cUjFuP0Xm
	1NiyebRt4+Uws8QPbRI+r1ygrs1y3cjJOHN0VEqWoo5AxuREOYF2+8Zf4RzrGXgCgZq6LS1QsSQ
	OupJ9ZfUhPijUDfli/NLuCE+bBWoFk2IHCa/8M87NyT85kn/QkxoWuvQJ0JVg2PYUKxCKVAWIU1
	Pm/tAGOPA7jem9gZTh7zgRI0xzCZBAtVZe2iNajykVCmI9OOzPTfCwo7f0HyCkkyBYp21t46SLT
	c8ExCjyQ/wt39Ag7yLe2twvtO6Ki4NBoX6xyEV9ss43AbdiQUUYqG1LKClr9WeGVX0Od20Gz3yw
	y0WbrVMqT+IBD1paJfcaEpMrXkf7YU4rWBhgBZHAnDlsX43by6l47FKyU8FNZAw4BdftXg7zq84
	wJdi9lPunBg8t3kRayjAyeafP9U2pYnuwu9b/2PlXG1zUze1yPtp4LEtmXcZnd2EtgK17/kiedw
	Ll0xJgiMbNigknmt3E+k9xLECZObyHuPGQiHWfAXchCdQtFCgMG0BmmKJuP3T5ttWjrCIt5XILS
	tYzqJRMmIY5ju0SsIb6Hz6l7z5jFedxbXkT9uCYxBASHb9XMEeqfYwaKqOvBVfFyyBJh+uU3rF8
	MN7yczbCDuEmXCfE54w==
X-Received: by 2002:a05:7022:e21:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b3c02f09e4mr2248938c88.12.1794380238611;
        Tue, 10 Nov 2026 22:57:18 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:17 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:31 -0800
Subject: [PATCH v2 33/33] HID: logitech-hidpp: remove unused kfifo and
 clean up minor helpers
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
Message-Id: <20261110-hid-logitech-hidpp-v2-33-30743e91d83b@gmail.com>
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

Remove unused linux/kfifo.h header inclusion and the unused
delayed_work_fifo field from struct hidpp_device. Also drop the unused
finger_count and button_feature_index fields from struct wtp_data.

Drop the redundant input dev.parent assignment in hidpp_allocate_input()
which is already performed by devm_input_allocate_device(). Also drop
the stale ret format specifier in the hidpp_connect_event() input device
allocation failure log message.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 019b917c3b90..6529c7b10b8f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -18,7 +18,6 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
-#include <linux/kfifo.h>
 #include <linux/input/mt.h>
 #include <linux/workqueue.h>
 #include <linux/atomic.h>
@@ -198,7 +197,6 @@ struct hidpp_device {
 
 	struct work_struct work;
 	struct work_struct reset_hi_res_work;
-	struct kfifo delayed_work_fifo;
 	struct input_dev *delayed_input;
 
 	unsigned long quirks;
@@ -2847,9 +2845,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 
 struct wtp_data {
 	u16 x_size, y_size;
-	u8 finger_count;
 	u8 mt_feature_index;
-	u8 button_feature_index;
 	u8 maxcontacts;
 	bool flip_y;
 	unsigned int resolution;
@@ -4360,7 +4356,6 @@ static struct input_dev *hidpp_allocate_input(struct hid_device *hdev)
 	input_dev->id.vendor  = hdev->vendor;
 	input_dev->id.product = hdev->product;
 	input_dev->id.version = hdev->version;
-	input_dev->dev.parent = &hdev->dev;
 
 	return input_dev;
 }
@@ -4474,7 +4469,7 @@ static void hidpp_connect_event(struct work_struct *work)
 
 	input = hidpp_allocate_input(hdev);
 	if (!input) {
-		hid_err(hdev, "cannot allocate new input device: %d\n", ret);
+		hid_err(hdev, "cannot allocate new input device\n");
 		return;
 	}
 

-- 
2.56.0.542.g3ef89b7020-goog

