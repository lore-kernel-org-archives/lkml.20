Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2448C41B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888042; cv=none; b=DuIiAba3EniWGNae88Jc9KiIM+ddpAG+4WkbetQzfM6rxXB/mKBlIkXi5UbC3/OHddqAMbXClIukWfJLdObuUllegD3wneAWhTTcc7k0b82yzOGlzvmSpN5sPwcWeVJaMW/LzHNHfMpGajdJM+8nnPNEJexBBParI3ZGEEoXQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888042; c=relaxed/simple;
	bh=CkRsJ159TvaDsvquCPxKwJ6wdILNj5u3k2nbupL6rAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOAniuyqzQ3YuvaWAR4cx1mMbYPbbP/MKr0A6lamT9ZR3vkZgqF6sM/hNOstwQM/+zlBxH/fUJ2LvBbvLAvUkpY1I7r6JnhKZLPBqvVruQL3Vu2Ku3lpzxmOosbqCAzsVNrWCeaaRxUaHn6c4hs5AcikZKHIndp6b0Sek7YZXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J50Xe8QR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J50Xe8QR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso25456765e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791888038; x=1792492838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KHR1iqY8VcX9IADGibYzOfCACxk2AXBdRyC6sfDr5Y=;
        b=J50Xe8QRU8waWzvmYjxmzT/KQbl0AonZ0Elu2nJW8wkS/5tfKzkLA3mBtItL8u4Nmw
         jzbwOd3aiGFYAh8Q6eVBfuRsAYJ5ksAcN+Wo/NiP+E4aeGRQY9NIuXxK6IyvX5CaqWbz
         Gp5Bmhpovs95txe9NNs2VYvBj3QFBUK4pFu9ocQzV9cAzVISfwzo7RI8frKQ6ZMcgBR1
         BL8sCA1nHADR+M1Is0ia6EWFRSEfjIuVv3wfcVBcnES/99zRHlYO+5tCuGBBBCc8WUVb
         EYIPjfE9nzkuejRt4HF+wm+LAObbt+gVsfeEAnikq8TR4lyNPhLA9kstZ/EBSQvlX7K+
         IDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888038; x=1792492838;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KHR1iqY8VcX9IADGibYzOfCACxk2AXBdRyC6sfDr5Y=;
        b=UgJUWgY5fkylvhL1coLZX3ndYNCgrYbIVTH01rAUeXLTaAR9vBmTEIEwmIF2NGrUS5
         CP9yI10wCcAaxNGIXG0tv2zjvYNmPgfSVEvpfBsX+QRslW+5VDMmJ+/Re8WhP+d5W3eF
         4fuXcZbQIlGtmL7E1XZIjCvAUwnFPYTfEqX6CAhCOYrnFa89I27GFEBvQLpCZq5LwL3P
         rogWhBR2UsgpPF4pSqcHnhtM36tTy4LbJRnTRt2LSFSqTW0NAMWlLg9RmhHgPMiaMYAm
         TdfCKJ07iauBfKKIM2DcU4OgGgY0x6hIMP5TEPaSb5QALiwjw16XYM+1bhybDL2IuR3w
         nRVA==
X-Forwarded-Encrypted: i=1; AKwUvBybSvBI4DE3k5CyZdJeMmCbUnLvi/bN2tpbY90caUgnCYJhpRNeHf5PbbUipILQC6o7rvLtSw9uKp8+m/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFp0hZ5oNUNHf6TN+vmqRfogdkgCeQq25+foyqfxfYk5GVnY4j
	cLNZz7lrGnhPgWY26LAJWxF20bvlUGaGkza2p9l1P2O0fejXM9iMt0XC
X-Gm-Gg: AYBFou16ku2mhAZKJBXLOUKAe7Rrc8/H8DGG5RrtGZoiFbADlvot0OrbmIk9U8BloXa
	1DJ4+WKSGMU/ovtWh+8ETVoxG0jlRwtJkfAqE9neL/Lb9WQJEC1mSx2uiFOiFqB5VB7aUgAtMlQ
	wvG5HW5KXdKZOU94hy4Io5fic+vkLGrzt6T2Y8sifSgmcnuwVnwlqnM8UzPpVedn1tnWqlrOROW
	+EgLiuU/R4JSsu8V8JMMajp87mamzK+WjjHvGGOY71vq0JO8njE3HrFXC7Wyb6vL9UB1NGV5Mg+
	ose5PFxZxm5S2D29MB03ympFNwJavgFgH8fK6MKsb4OXO2btAlxMS2gcWzcXdFxPhewni6sZTeG
	e8+GTF9/BPKq6z+aijvH8WsEvBnJu5sU6FD0L9UHn8+dMrx3E2X3BCOaFqOhnIvoqTrvsyri0r4
	5MncHvtaIyEUk5XEiZJkNaVMwK6ft5c00cxwnnVSLjWdG2JqNv6Mfb+Aotzky2TeklJX8DrRr4e
	gZFZT/2fUvJQowRjgtGRfWKYeISOQZk2n1YI2d6HbZolvk7Yy/kCCKrQQ==
X-Received: by 2002:a05:600c:4594:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4a18e4d6ac3mr234388855e9.26.1791888037890;
        Tue, 13 Oct 2026 03:40:37 -0700 (PDT)
Received: from gmail.com ([2a01:e11:1403:8620:e22b:cb88:4091:8aab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3970sm4191952f8f.37.2026.10.13.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:40:37 -0700 (PDT)
From: Paolo Pisati <p.pisati@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Joshua Leivenzon <hacker1024@users.sourceforge.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luke Jones <luke@ljones.dev>,
	Ivan Levchenko <me@livan.pro>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 3/7] HID: asus: Force hid-input to bind to the Zenbook Duo hotkey interface
Date: Tue, 13 Oct 2026 12:40:00 +0200
Message-ID: <20261013104033.36079-4-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013104033.36079-1-p.pisati@gmail.com>
References: <20261013104033.36079-1-p.pisati@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Assisted-by: LLM
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA
---
 drivers/hid/hid-asus.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 242e273e4cb3..d69431615c27 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1405,6 +1405,7 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct asus_drvdata *drvdata;
 	struct hid_report *rep;
 	bool is_vendor = false;
+	unsigned int connect_mask;
 	int ret;
 
 	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
@@ -1500,7 +1501,18 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
+	/*
+	 * The Zenbook Duo keyboard reports its hotkeys on a dedicated USB
+	 * interface that only has vendor usage collections, which hid-input
+	 * does not consider an input application. Make it bind to the
+	 * interface carrying the ASUS vendor collection anyway so the
+	 * hotkeys get mapped.
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

