Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204697;
	b=MoTPD16IHYLcPPG5S47pmZa0B75nYjCW8Civguut1mgKUP5K6bpS0OWhUFkkha3g9B9C
	 cX6oXD/4cZkmuPLPRUGtv7c2MdXCcnv8w/WOqt+EhjMK9Q1jkfrY9KmM7Hk9o/ihpwZn1
	 3y9jDBVBia+Uw7diZGavISxF7xYfH/5noexAnqhECBKXnDeG6i4UBEs6jnPAsyO+vBRUA
	 uiOOiHG0R8AyjyoUIh0FyhMm48HkxE8sM7J3Hfa/Nb8BY8BObk1i7SlH6AzAuAk2LUtRI
	 MojA++w2C4evBp0qumr2B1ruT8me0LnYuvmlGzyYfA0lnY8s6GZ0vZoCRPk/uKXG+yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8m7dQxCboWCqtELVdkToHmnIGOnHpHH542//byrS0DU=;
	b=S+BZIzmqBPIE4epZd4txvjRU5ACssoVFtQ4RjaR3ss6mtFzoRRUbXSj6xI1oopin52sB
	 SzMQW/Qmr3OKBCEn+VMe489cYhXusOWg2rDZ/MqlnNcjDkm8sQrYo04UVL8oY8Omy2kd1
	 b4VPuiBXOZScplUmWWornUrYq4HxbOg40Tg/+8l5ykSgFutBg2XrLhJIysgxV6/sQZ2f8
	 AIwMCq8EIb9RbJt/hA7mAe+tHd81CNktb0DfZ304k/ExiXuS1wUsA+r4Uj0F9cV3CCU5x
	 raOBGmK9kzXiezm5MbaiaCIFa61Kle4xnjYjtQABQyAQEnIrA4RHcjK6bOAbzXrwBAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8oFTGKh;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F4E6083606
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F4E6083606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T8oFTGKh
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-372bdb942dbso713096eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204697; x=1794809497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m7dQxCboWCqtELVdkToHmnIGOnHpHH542//byrS0DU=;
        b=T8oFTGKhw9v4RXYtjS9yUVjenGTa1WR7im2XzJP1xDmptDuvUzm9VVCMk9lbc04PUj
         LrZQT9YHSfwiAFtj2pf5Cl4VcvgDr6Vubv4fvAj3rWP6FcGVNH95J0iZdj3rlpjkW6Np
         vSRAtiLneiMPXq0S8FpyRCJSVLV9nwTxiIKDet3UB9PyYT7OL+PIzc8PO2E9LS4JtHpf
         GpLT2qWV5n1rnHn7A94VPgRdeporT/FwPLidLh6rI9h/55TZ6nuxrIQdgpdt1s8rIODM
         14QO3IrINzGk7u1MGbnL03nvXYGuqwCb9zlgLXWjtHhfgpLzlql4sOhlsQSf96xHSzoo
         Or8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204697; x=1794809497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8m7dQxCboWCqtELVdkToHmnIGOnHpHH542//byrS0DU=;
        b=g1jEGS6iHjdgdy9gRF/yRic2wqNcGrs6AYGHOWD14xjL4xrwyUQ7T446NOBd7vr6f0
         BsFb8tViFz07FlzB0BGvIxZRBrGPIAzMHaC7lq51NtaJphEl65nG1LhAm7+YHagctCJa
         NCVdi7yeqXGe7zgXqUQzp0h6MgLgukt59A6BCpcL7LXtmrrUZz2qyQXLMb/jSZtTimJ9
         Sb88p/gLBQ0IAhGQa31idTSyyZbvChcttJTjuOetDVOeZT27/AgkfJqdOgZzmGyLCch6
         vxN2jwsEszWr4O9qJkpvSyfJNzYfpPGGuoXR+bnuuFBdAZrJNJ9tqQT5hbxOYb+2Yx10
         ng4A==
X-Forwarded-Encrypted: i=1; AL+hErEzwvaexoRq+WBkaTB82kH/1wDw76GGEc8d94SXdYiILcdRx0XGkGtzZCiR1hQZ6S29d0zxTYr8U6A9pDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z98JAWvmSnfHxZQk1YHQnxkWPLaWqNNDUClDJBFj9GzpX+mRRi3
	br35eMLLWj0RMzJw8y5d5NvOFLdNDXK8P2XlvH4hIhU1pcFvN9TqdYPp
X-Gm-Gg: AYBFou1/aIiExT4o+z91zBr88JUlbwmtctwxFkusJbdaAbcdM+azX/OGYH0ZgSbR2yK
	DiMgWcyzEf9v5XFfanbPktoPGixSM3nNv2sVq+1EPEsONkIVCPLD3lXGhNaXSQxG9f+3IawITIM
	UhYaw7GJggRqNfwv5EFK1xOUWpUpBJRDjvGdy3iYIUwEV1DfnF+wjlXJddYsrLxX5S7GKSnXuyO
	5h3oact00drUn3cw1sgeje7/d/PQMap68G7bFSFE8qI3DOvk0m/uh4NJM4rbyroXEKlNqhCHnuF
	31hGyy4a+3cxJzJztBcM/+ZD3HCAS2z/waEOxnY0SU6hSmtkyItYWpqqLlNBsNdRf2yDTEg3Jm4
	XSD9W3e3QRuGdaPbBUw6DihJepNgYPgI5Lupm/PslVF+SGv329mLDMVobkW7kIp08tTYgQxN1aT
	NxcmdSVj2aMhFxstih1GzkZn/6T8h9kb0CpgITpHy+EhF4K1ewNZoO3DXS6A7rCZhp1grQIglOe
	ZGVDRVszpRdanOY8Wmwm2w84FwiowTh6ZHOdzko5UsYygFUB2/sJBuqsFygbGIZvzFxxN7uFObj
	Y4bVu71pzfXrX8Qoohbcx9pH8vfGoTqq1oTD58sofFtIthkqFwg1pWwMQMdPjuGgXEKMGGCc8hY
	SRAbhc3/dcoL9+dqF
X-Received: by 2002:a05:693c:2109:b0:36d:394d:e690 with SMTP id 5a478bee46e88-3725808378bmr6046926eec.40.1794204696568;
        Sun, 08 Nov 2026 22:11:36 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:35 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/18] HID: logitech-hidpp: manage send_mutex with devm_mutex_init()
Date: Sun,  8 Nov 2026 22:11:01 -0800
Message-ID: <20261109061103.2887636-18-dmitry.torokhov@gmail.com>
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

Manually initializing and destroying the HID++ command mutex in probe
and remove destroys the mutex before devres tears down managed child
resources such as the delayed input device and battery power supply.
Switching to devm_mutex_init() eliminates manual teardown boilerplate
while keeping the mutex valid throughout child device teardown.

Initialize the command mutex with devm_mutex_init() during probe,
returning early on allocation failure, and drop manual mutex
destruction from the error path and device removal handler.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d0ec973a4b49..7ff7b7d8e2d2 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4732,9 +4732,12 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	INIT_WORK(&hidpp->work, hidpp_connect_event);
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
@@ -4810,7 +4813,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_hw_stop(hdev);
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-	mutex_destroy(&hidpp->send_mutex);
 	return ret;
 }
 
@@ -4827,7 +4829,6 @@ static void hidpp_remove(struct hid_device *hdev)
 	disable_work_sync(&hidpp->reset_hi_res_work);
 
 	hid_hw_stop(hdev);
-	mutex_destroy(&hidpp->send_mutex);
 }
 
 #define LDJ_DEVICE(product) \
-- 
2.56.0.506.g506a7eabc5-goog

