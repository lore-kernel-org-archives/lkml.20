Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218126;
	b=fJ+RF6ATa46Xp5IRbmVIayUvIMfGPx/YsViXC3+oNuG4diA1mx1t7l5XswLr9VwfaPNj
	 IiQZBU2+6VSQ42tGOD8rV9MaXccJjsRNa2bWVNrEw5deqAKn+J4IoKI2AFo3FBH6G418j
	 JN/wMSoJhBcPSE6ci9yOZEq+Bp1qcgMIkDaE3djEjhzwHxRb/j6U58riaVLsnAuhydcFv
	 uhfsB9ydHZN11c4mUfvjQOgOsaPDPaRlP0CGLx9x5fZBRZcdtry/3sd7AmwB0A90vshxb
	 wYnCM77M9gy+zYNR9B3ZeYtak2aQhQc8iHXEpgnDftt+ZORc08GUqu3aKc+0/nqAkLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ootfTXrKHKwvE1mze1ealqjStl64BOQ9AFDTh8t9yhQ=;
	b=SaaPHGMlobNElchGo9JTod+qZAyiC5cIh5dmziuwGa4wBCiUwk3vCPMZW11B9BdWBf71
	 DrKoMNw7QPOg2Q6a9FGzWacb2yQwpkG47ObM5CUe3wFskryYCKQGwPaUu72WrZufb/qOA
	 VSQ158hI2rbNnIWXF34BALHFbWPIEKtljILbCWNuzOKVkdMCpITwdatBtI7WabivFZjf+
	 f4Czegsi5dI0dYtlBQYxPSl8XqNQ7PIXAGfbdFgmUA2mOyWus4o3I7KVoVyHpKW9O/btw
	 OMSonEIW9ZDcWpJxqF89HxSiKzjrOj8metxd9SDTqZB7ThKq9eHAP7ps8zVRwljDiyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aww8henu;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20182606A329
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20182606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aww8henu
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so12846235e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218124; x=1793822924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ootfTXrKHKwvE1mze1ealqjStl64BOQ9AFDTh8t9yhQ=;
        b=Aww8henule/dr0pYzyWZV/kbCN4VlRv3Bb4rx2MgwPJgsI8SN2p2YmsWAxM36qalAs
         +il1t3sJ/4NSyxiKNL6vVPAaOKBuRJ6W2WmywZM/k/zbEMkPXPF73Dq44IsHAZHcLSa2
         TL691IhDDtBxzBpZhySiOIt0qWfUybzi5wotqNgX/vlB/WzkKPPZEnCzzmAP4cRawfzQ
         s+x6A1bLf+pJJPEO/hdS07ARKQB0IcCk9tEyhQyZKUW1f4AehGoqNeimzwryrof2RsJA
         eRvOIuGKw8hQLdYbwX3svaJpyomAw7PYRw4Bj8l7tCfClx0ZeJ2/ZmwxR+NC39xI6jw5
         EF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218124; x=1793822924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ootfTXrKHKwvE1mze1ealqjStl64BOQ9AFDTh8t9yhQ=;
        b=w/tE8kYepZklNOc1G5MA7KSdg+m8qXqhVTHscGrPmLtgnxvlqhDJ2gcMwaj+TYvXw0
         wHJZg9fFEeTi9vnXzSdsVPyF5iq5mmbU5n3nz8dwpGqxg1EOV68TTiVA0zbIh/MvB05M
         qJOvbTECTRdeAmOxDIats7oFEpBB+Oi14hwqNXHftHb0OuLVdeODO+cMMGNOPp/0BnRT
         9o4a6w0UNZ8QHl9SjdDWb+ldQwG9GOTSk3yL5aHnYJAsT+N8sR25lm9qzkOcfoD2dmmx
         ETK47PMutyhRMOi6lArbj5hW1pV0sFF5ma9HYt6QL2UDBlZZU6GGxICGMaX88s17OjQJ
         syNA==
X-Forwarded-Encrypted: i=1; AKwUvByVsUtDMiZVvkeZK3+Ou/77GQmX+8S1cjoc34/xBIV4M12BSiKbBp0diMQ2ciAPgMM/z8T+/QsEg7oW5nE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1x65p1VGyfUNJ0cVFykg/yZ5FnMxSHAfvB7lgBmfvUlZR/qd1
	n7u7JQ56h6/PDnDYsFWnLedi7BLZyp2kLUja/B4l63MTi3ZJfym2ZNDK
X-Gm-Gg: AYBFou1kQqb6pOTpPcWV22afA7uaINVoySkH6GmF7AS4JqNfc+VAGInKwksbd6DpRRQ
	q/WO2JzdZ3xRV7Ksg8M2qBuTyS7iqEYfoieFXOCSfPWlOV8YBAmUblae33nt2xbGe9MGp4RXzP5
	8Z5eryf91x1W54FDyasd6ed8BRGcH2t570zeErjN/U8f/NLmt2Qi05JjrNybnhnH6GuHFBH13pr
	B7X6VWS6BaMF8fMN86ihQFBtVsOXkGqAZrbPK1G9QZutHrfmWOq6lAEe+7hIiXfmOy+4lZqYNHy
	enynlQjyfwBNihby2fWiME4Bw9BuGYhd4HRetr/97c/JOkFjzH/WvCXwT1SsBX/LHmEA0tq7MZF
	7BjoOPVuo6VVY1DwgU/ACl6Znyy0CD0yPznd0u5hTv72s9vwb2kNNH8RD+Pj+XvllqvJMHhmHAm
	kFZ7o5nkDJpdaH30A7VrVObdn4j2K1QvbOAr3PKMcK7Ni2v07DTBrdt6s3v4+U01Y7cHwm2bE3x
	5YY+0AlXbv2odSH+2sFCUipD1e/IVJa+OP0mhJC0hBjX+fj/23U06eAYab9fg1V/5A96pzEi752
	2OvfGn+wX/Zyz3Mb8w==
X-Received: by 2002:a05:600c:37c3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a96701830cmr76128215e9.25.1793218124439;
        Wed, 28 Oct 2026 13:08:44 -0700 (PDT)
Received: from fedora ([2a02:587:85d1:a500:5135:1deb:a9ab:fb3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm30134320f8f.4.2026.10.28.13.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:08:44 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH v2 1/3] HID: haptic: Replace create_singlethread_workqueue with alloc_ordered_workqueue
Date: Wed, 28 Oct 2026 22:08:37 +0200
Message-ID: <20261028200839.202670-2-mail@taterr.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028200839.202670-1-mail@taterr.org>
References: <20261028200839.202670-1-mail@taterr.org>
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

create_singlethread_workqueue() is deprecated. Replace it with

alloc_ordered_workqueue() for the haptic workqueue.

Pass the format string directly to alloc_ordered_workqueue() to avoid

a format string vulnerability where hdev->name could contain % specifiers.

This also eliminates the need for the intermediate kmalloc/sprintf.

Use flags=0 as this workqueue only transmits output reports and is

not part of the memory reclaim path.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/hid/hid-haptic.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index 8760eeb08b2c..c3aa7db44766 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -418,7 +418,6 @@ int hid_haptic_init(struct hid_device *hdev,
 		.hid_usage = HID_HP_WAVEFORMSTOP & HID_USAGE,
 	};
 	const char *prefix = "hid-haptic";
-	char *name;
 	int (*flush)(struct input_dev *dev, struct file *file);
 	int (*event)(struct input_dev *dev, unsigned int type, unsigned int code, int value);
 
@@ -457,12 +456,7 @@ int hid_haptic_init(struct hid_device *hdev,
 	haptic->manual_trigger_report_len =
 		hid_report_len(haptic->manual_trigger_report);
 	mutex_init(&haptic->manual_trigger_mutex);
-	name = kmalloc(strlen(prefix) + strlen(hdev->name) + 2, GFP_KERNEL);
-	if (name) {
-		sprintf(name, "%s %s", prefix, hdev->name);
-		haptic->wq = create_singlethread_workqueue(name);
-		kfree(name);
-	}
+	haptic->wq = alloc_ordered_workqueue("%s %s", 0, prefix, hdev->name);
 	if (!haptic->wq) {
 		ret = -ENOMEM;
 		goto duration_map;
-- 
2.56.0

