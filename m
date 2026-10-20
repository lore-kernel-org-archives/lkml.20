Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792488270;
	b=FsU6u+FrjrOlsLYuZCt97QxwiXAu0YmwLH61dnUx9Vl77UrSeJwCMx6XqJxgFkfwpM/K
	 Vp0oz5RkVD5fliqnUTAKbV8z4JmZcHE3o9cjcqXPf5+o8iMW51HekcYuQcmyzvf0vCzLM
	 CG5r3Avc3HRR4ciG/Gs9+81d0LVHiWF4baNdHEqgcUWbwiu5L+wUV6LPPFgiTzQ0wSolq
	 4iuOJerH1N+cSJSJ6QFzt6aciMDeHqEaQKfxPqt7MCH+9/dq9+UGwgPYEcfq5zmE7rVFA
	 7DPx7dyZohAMwM7sabWCYPfuUoxCZGJWwBM7jrjY1QbYc3+ZmWxUndfOKL8r1s+xWLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=roQqyNfx8Pypy612wi71JOnX5eZuqCINaeYET6UT91o=;
	b=qdVth71i5DH6V93Q5qi6DKJrHXzoNhwGt4o4HIeSz8mEheq76NnJoFwKtbD52LBohL8Y
	 ZoKtptYf3TqR3ob/uM9NnzMwbjVh0BSVWJS742gGz/jgIRoTh1ymYrLijr8Cnc1f2Cp22
	 egBEVs+pzcVQeglIZ01ZUb2V6C3xNh2exZV52gGJjlec7U2TfrmYY4Yqu3f28Q5zG3EKp
	 Hu2PJZ8HpfWbSoVMnqvFk7qxC3VEabxL6dpgAPVS3YAnFix7tC3y6zpN8qAumqGXmilYa
	 wzSQ41y8sxKk9NygIXgYGaXbJpoLsYJfEjtIcdtNPuE1njmevxp1dy/W/06P4ogNiyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eksGq0G5;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07463606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07463606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eksGq0G5
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b060ec084so2085043f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792488268; x=1793093068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=roQqyNfx8Pypy612wi71JOnX5eZuqCINaeYET6UT91o=;
        b=eksGq0G5h1n0keQQ4BX+42RP9ZBIUB+OxNrzvFK3v0KLlhn0c1HGzZCjKdMuAqRibW
         NmkGnaJpgNrRJP6rjeXFYLpFdp8EdHtjdXdhxaaMY8YlBn+24v0GMeEIyUr0qiKwj4RS
         Q/zhw+OTCEOrN+LXpcPxkpRCNAevYYgweV0aXB+TDoJww0RhL+BjC6y5dyo64MhqngSM
         Qch1KFUcRNfiTQcxFTqlXyV0U5Wa4KvOyZX8ehplauXQ9ZCkWk/fpwDaw5S32xPHGLts
         Bokq46iJ0Nh1juC0oCJlbcWKOytbS7z2a7aCASOmpapkjD1rRPz0Hdyms12VSCGFQPqE
         BZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792488268; x=1793093068;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=roQqyNfx8Pypy612wi71JOnX5eZuqCINaeYET6UT91o=;
        b=Kq7yhgjLtZECG6rpWx6WYjJnosrfco7dwo0SebgDLUMk251spwZpSOFa7L06NtsT87
         e+6990rjL88LGO4W1or+YtZGbazYuFdtAreJ2hye0n2hLyXkubpVVetdHCEp51YTks2P
         w0Zses7/PUk4g27PEiT7hSDqyZ+a5maC66ev7OE37kap44WYAPELp4FMcouSmo1UB8T3
         oGdb/t4yLok7BzztmNQPO7/Vc0Mlh4WycOi6cy9D3KF5KzQwewISEhaZhxoOprIaphOT
         5A4JI3YGZAth+hGiGME0spZ8AfhnO1bDFJ6AEXfDHnMExbIRi/MopVPxsBMFyNNSkMMA
         Ivsg==
X-Forwarded-Encrypted: i=1; AKwUvBysWugohjJGrTQFgeymhWr+0QgA6C6/3DVmNC1HFBOItnDy05Xwuo0Mj3pcr3QuoGe0LuE8pp3J/pjwT/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAbgal6fYojCA2CumkHLhR0XFImJLwIZiru6yFY5VO7eFVAW54
	YrMWYj9l/hE8ik+6yLE3gTZl2HMs6qU/vumjKDFMRnAr8qyRq1HB0nki
X-Gm-Gg: AYBFou2Fe1F4Exn3o7nTd90LkXzTg+bMbMZEzspKsvbQQLNclOUtoRx4X4CtUxT0Qqr
	ZyJx5Zj7dhnDY4hpHV9bturOFOVjvuHHytzBMPnGEZJSMjgJ3P0w63CgL5XeM6NCjpjnbKc0wgJ
	Ik0f+1YcMfXbsQdZlbiUBf8k4moENLhBNsbgA0iEjNFxFRVVYlLSAdXRT6s/AvVcWytevrQ8atq
	AS7/Zt0DwTfxa87rUYa8Yrj0cdz0yNA8Thm+d91p2x5r6if7WvvirGgIFFg55qIb1QSUa49qVEq
	pMIgIUwh3VGn4MFHW3vJ+12euBJbM1h/Inqv9uo10CLber4iH77a/nrqmV0W6LstmXs2xyvoYZ/
	fbgvo9lm4e98yQXs+yGMVsQvCCiILvPU5T0Jb9kHILstor78bMeeXqnfPn35TVgJWnJOIsre+WV
	uEs5Ws9h28utqBExhYyRicBJiiWMuCaxXaG/p1RccJudrkoTdEGnKowugGqmnQp7BaSWLp8GDGS
	EYjbn8RszXJgw96UF7CxXeFDQLa4cEwFv/ZtG2H2JwYkQtkdbZPRzs0
X-Received: by 2002:a5d:6f10:0:b0:48e:390:80cf with SMTP id ffacd0b85a97d-48e07f9e4dbmr20042638f8f.32.1792488268226;
        Tue, 20 Oct 2026 02:24:28 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:f99e:1a52:655b:681])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820822sm5316731f8f.34.2026.10.20.02.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:24:27 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Benato <denis.benato@linux.dev>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	Nathan Chancellor <nathan@kernel.org>,
	Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH v4 3/7] HID: asus: Force hid-input to bind to the Zenbook Duo hotkey interface
Date: Tue, 20 Oct 2026 11:24:13 +0200
Message-ID: <20261020092423.36380-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020092423.36380-1-p.pisati@gmail.com>
References: <20261020092423.36380-1-p.pisati@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Joshua Leivenzon <hacker1024@users.sourceforge.net>

The Zenbook Duo USB keyboard reports its hotkeys on a dedicated
interface, separate from the keyboard and consumer control ones, that
only contains ASUS vendor usage collections. hid-input does not
consider those an input application and never binds to the interface,
so the hotkeys are never mapped.

Pass HID_CONNECT_HIDINPUT_FORCE for the interface of Zenbook Duo
keyboards that carries the ASUS vendor collection, which skips that
check, so the vendor usages go through asus_input_mapping() like on
any other ASUS keyboard. The other interfaces either have a proper
input application or nothing worth an input device.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
[pisati: use HID_CONNECT_HIDINPUT_FORCE on the vendor interface instead
 of injecting a fake keyboard collection into its report descriptor]
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/hid/hid-asus.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 54f4d68eecc7..68211ebe1290 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1514,6 +1514,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct asus_drvdata *drvdata;
 	struct hid_report *rep;
 	bool is_vendor = false;
+	unsigned int connect_mask;
 	int ret;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
@@ -1609,7 +1610,15 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	/*
+	 * The Zenbook Duo hotkey interface only has vendor collections, which
+	 * hid-input does not bind to on its own.
+	 */
+	connect_mask = HID_CONNECT_DEFAULT;
+	if ((drvdata->quirks & QUIRK_ZENBOOK_DUO_KEYBOARD) && is_vendor)
+		connect_mask |= HID_CONNECT_HIDINPUT_FORCE;
+
+	ret = hid_hw_start(hdev, connect_mask);
 	if (ret) {
 		asus_worker_stop(drvdata->worker);
 		hid_err(hdev, "Asus hw start failed: %d\n", ret);
-- 
2.43.0

