Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380236;
	b=JXTj+9vOMaXWLHchXU2mHiivFE8Huqtr2Wln5B+4jCM0ItX+epdq1+lDnX6duyvhBUb5
	 for0p0L3iJxAgnGOEIc9OZE5Lf3FtsTtyKO5vLILZkdEl+x2rJlfuG+tUuxJ/V+8D4d7r
	 W+yDzABd+MqvIdDg6A+OlxFio9Ezgss4hmOWZRBrLdiln06iH08hzp5PbHosfEd3i/vWy
	 FoUpqVcKClFxiIqDgt7/tSi+2A0fmquEKz04LnImEJLHZ7DA8lfoh3Vt0C3KqdPz+Kky9
	 c1ban6e4TevjyM/ne567WR04UYmISmyqE+LfRyxMIbbj0RhbXsM6XmnojP+FPo0ydtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZHsFZhQ/4wAZApRj3ZGgA+KMlqW5OQzafAFFcUtWCwU=;
	b=qvQTq0X8NvgXVMWTH7I15feHHqH1xL5bULoE3wZhgY2lcHJwKubBTZbRS+IRm71UKXz/
	 /uO33w6YTNFQNUhAW+OhHMPrV6XA2DeLR3K+O7mjp+bKIGEUYJ+ZqLg8xRp8mMyc6Uy+4
	 cK2NjoO2qVyf4KdQOJngbHFdQE2703w5R96vBugE3p6Hi91rSYy3qall2uzxUku0dfijg
	 7J1O/EREeDGTcji+4EnGjOvC95VZJEPntUMbzT8QtMrBcFT1NRPm/CRycfe0uMQOHRRpH
	 bZoKSQqs7kDroB8B3jA37vWxXcC8CKPsQTPCs/JtV1HVwDo8anzThB+cv8u2x2yLtmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqPdEgJn;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374C0606A334
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 374C0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZqPdEgJn
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so4894864c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380235; x=1794985035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHsFZhQ/4wAZApRj3ZGgA+KMlqW5OQzafAFFcUtWCwU=;
        b=ZqPdEgJndpIWqn9Ec3zf0lnNUS2PDQVT05hPJ4qzZShL5SAofoJQZKa67gN1pAO1IU
         upQwUZKDp8hq/OSRIZeJhQBvrm9v/5iXo+oz/0cGMk2h0zvSX+egudyaSHJCA2RTyiyd
         5ga0aYy3B2MXKJ46s6m1OgShqQ+rB1qo1fDsVJlfeROegzseWdO0Kr5by3ZUxzc8rarq
         ZpSfH9cGJSSgHoI3h6qiY+EMCrbIZOsMV0EAHbCuQeuCK25H3SsZigbwSD9xZKXmo3FN
         75vb9fFIBShjwCvxu54sgc6B2DDvxuNX/qQCwOJw+Aiux2i1h78Aokbxs+Dsgw54v0gk
         i25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380235; x=1794985035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZHsFZhQ/4wAZApRj3ZGgA+KMlqW5OQzafAFFcUtWCwU=;
        b=GhYGlgbDa4mJOqnrNfTSEDX+gB64Vvnp0hBCR6zTLXSjKdiLhkxmtN6iUe3EOxLdMH
         8PhIUS9RAnXJ/XXqHil08PNG2mdPJSTcropraNszuE82I0usHECD8QulAOx63siK8XX9
         7ZAC7VeUcxA318VK5dJC2AC1A5ImdaVGew5qwsiplJaM1654C/f+eKJkWwiWLPxWFxhr
         /VsUysaSLhdkRjKtxbnVK7omOpCFvhie2PTWNnHo/ZOAgCGP+Z9dHlElCk07khikh4wE
         z7U4MP7owkkRdXabZ5XYN7LNVCTDoBiv5Fk36VgsKq/wVl3bVLyhNIS+WvCZCTC7frEV
         a9fw==
X-Forwarded-Encrypted: i=1; AL+hErEHmw7HoClpAC6eImBkfxQzrCxKV+gPLiM46n0zK+Tir2mJsPEYY5hoo+KVPUO+eoe3VtppWNU/ptRH/7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z92iQ9IDMlc4hvTn/xL/1/QZoxRpBdSrugKAL3dlYbNoQrfQX1h
	Mr4PGnXjdaX2Enc2QQh1qisy8Ke4H7uOYNpa+Av4X+1qLxBG/D/Nh+U8
X-Gm-Gg: AYBFou16VfiBor1Gv+UWZJBox8hhbxLhBuKwSMmovpgakmI5W36JtGNKMad012AYZ3S
	mCpWibm3D0dOwV4E8Y8ag6vaI7GA/N79brR8tN5ZSI4pW6V5/W9TvujdB7Kit280J3//EREwE7X
	u1WeqE8y3cbVbcSaLTJWlIxHZr0FRJl4c66Nz0doRG3N0HQyowaTKMexoPXn21mpicX2df5IAw8
	mDmDmKKudkBjCoqfcA9J39/GKXlz1LmISU227S5ZTItgQuygSgp7QuhL+fEYDQPqVUZHTqTBGsh
	sUU/2F0dUmhZKYon3ASP4UW7UCD4OJA00gmf4R70mYeoGZYkfA9VJqrkxwCjc+zpFPwgYfs08MF
	G7CQtpjZglckzk20cS6bM5agx4VA0KeDWgvQOYjLKLpVDWh+msqVDj5lZ4OrZZY3L+sFsOXBgNx
	GG4zCVn/5e6wtwuvufDfGWXrICti6s2vt8zpFbRRPuI7QuBzHhKwmp3jYfWMvipsQ+36ML4etII
	rRqCMCzaQoFcVsP+F69K3xQWEDpOnv8fd1Hgs2M3X7c5EcVNvM37YXtnkR8ZKuaUfs0ha7N55Xp
	QWN4JvSWS/hCtXr/c3x9MXIe+GUcSICeXdBAvxZknW5RxVxK5wCb9nsuau2BDXXVZ3YpJ38msRg
	/vZFgEFc50kFYHZn9jw==
X-Received: by 2002:a05:701b:42c7:20b0:149:1b5b:1f25 with SMTP id a92af1059eb24-1b3c02f369dmr1565441c88.15.1794380235205;
        Tue, 10 Nov 2026 22:57:15 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:14 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:29 -0800
Subject: [PATCH v2 31/33] HID: logitech-hidpp: manage send_mutex with
 devm_mutex_init()
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
Message-Id: <20261110-hid-logitech-hidpp-v2-31-30743e91d83b@gmail.com>
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

Manually initializing and destroying the HID++ command mutex in probe
and remove destroys the mutex before devres tears down managed child
resources such as the delayed input device and battery power supply.
Switching to devm_mutex_init() eliminates manual teardown boilerplate
while keeping the mutex valid throughout child device teardown.

Initialize the command mutex with devm_mutex_init() during probe,
returning early on allocation failure, and drop manual mutex
destruction from the error path and device removal handler.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index b6c7a951cc94..be3c2649b0e3 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4631,9 +4631,12 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	INIT_WORK(&hidpp->work, hidpp_connect_event);
 	disable_work(&hidpp->work);
 	INIT_WORK(&hidpp->reset_hi_res_work, hidpp_reset_hi_res_handler);
-	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
 
+	ret = devm_mutex_init(&hdev->dev, &hidpp->send_mutex);
+	if (ret)
+		return ret;
+
 	/* indicates we are handling the battery properties in the kernel */
 	ret = sysfs_create_group(&hdev->dev.kobj, &ps_attribute_group);
 	if (ret)
@@ -4710,7 +4713,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_hw_stop(hdev);
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-	mutex_destroy(&hidpp->send_mutex);
 	return ret;
 }
 
@@ -4737,7 +4739,6 @@ static void hidpp_remove(struct hid_device *hdev)
 	hid_device_io_stop(hdev);
 
 	hid_hw_stop(hdev);
-	mutex_destroy(&hidpp->send_mutex);
 }
 
 #define LDJ_DEVICE(product) \

-- 
2.56.0.542.g3ef89b7020-goog

