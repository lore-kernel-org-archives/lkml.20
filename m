Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193975;
	b=m835i/y0I9PlbIOH/qUsPEiYkX1ipLu3RSzpT3TEi60hxbDGOxBXYj1e2tHZ+JWeSIJj
	 +UJbjf1/pAk7TzsWsN5KKkrn9AjQk3DSJgnNVO95fKqlzEB5SAIOHc3BZefYcHcNEsXns
	 kzpLtlDPrSdlo+w43PDChP8Qz2BvYQVmdOjtmjfjFtMKRqeB0qwymcABP6zBaKEzvc8z5
	 aVIVhm75euZbVPVTUVx4nVaM2Oa7RgM5bfYb4Wfx3xqZsXu1m5ibHxxGm/dTjUAk4W6Sc
	 V+JxxKmE5F2f8LJLdn6FV8Rk6ZjId2QW8Q7I53Rp9LueRchr8nex9K4RP3oPWD/1ZyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8lGk7ecJbJY8uCu7oKsWi906u8BzDPDWd5oQV0tOkG0=;
	b=3VwStX73ycTQIb8dLiis1LUCD+DXBtOhigfcbCOqzVSZUaibIZMG6Dd3R0ydjwvbgpv+
	 ioQ+MW+WWt6V3+bC4VZ5Zu2KMex9uU2gUDGjftKxDsr8jgViLxC00wJt/4lopWCuDh5DI
	 h0E4gsAPXy9FTUEj96XQpr52H9JGvYFxYhd/5XouHpf4Ohpqos3AFCQMOMVGL9uDwRwhl
	 CFpjG5pVUz7cw+/aptIVSAzuBviasrauSq0YU3F75WwkbQrX1pI4yr/zqycD/ZSUambO3
	 DECNZY1C4DrnK5HyQNj4ya9zvnw9Ebp++6AeTal02ZuPhhCNjle+sZQMNISQ1Nf3McA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvmOyktS;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A19606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A19606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FvmOyktS
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso1710769eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793193974; x=1793798774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lGk7ecJbJY8uCu7oKsWi906u8BzDPDWd5oQV0tOkG0=;
        b=FvmOyktS1q29kBO0PSFzhCQQ4fSCh+73Qzo8DDROfe2c39OvqnCOjD7C3prM2DQ+Uj
         AOhGfDjXapl2DoNUNBVSCaRHpOabol6kRewnRg3X6OzvvYaE1U+L39lJdQnR6P8iAGN2
         gLW94k0E/yGLh0LnSKLbpzfLMZQ/Cxx3zqOUbhvFUFriFc/UBA4oK+MEpOBvbjEZOc7M
         e9N7OlaUrwan+0v+33gj9srblm9CaNaX+hvSFwQYp6hwsNkUKPfBqaJuIWomu1cMERzc
         6pc+6eDvnFCK9NQbtsinuXYSEq6DYmnjI8uayP5DM8vpzxn7KMDRciU6m7RmKGwyCh3L
         vmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193974; x=1793798774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8lGk7ecJbJY8uCu7oKsWi906u8BzDPDWd5oQV0tOkG0=;
        b=1wG6Bx1vrhd/sHrhFeiRf9YOcUQkRGxDvnYSM4Xd2Rn8tvg+dbKgPS8oF5pi1CZA2x
         w3XdI6mV9pdj6ydOAPTvYj/64a5ZVc6bfJp8hTE6waZ1QaWCnzxvGeDbiGgSuSr1HHBY
         MBjyBQe0bg3caa4XIC+eddZ18viiR1HOw20cmVee4fLP35MvOKPr2SD7wvMUsa0BNuRr
         bQ2N819YHedpSpfNiPmL2Afvv0qHGRamtLfbJ/EOSRy6xWvzYemaGTulEPscB2U9io5O
         UaBrQqT5bE/fabjsNOzXI4uxG+2SlSk65RoDOYjMIBKYaiushSdOsFdG187vJ0P4WWOK
         GPEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzu9+d3RL8Fw/DWVMC8arQkkZFtgIyd3zTpbjYkkH25PflbIkfzo/9+juXFB+ReeXs+1zzJ0nsqx/WnWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdVP9TxAdPYUzctdplug5ETGVhIvA2qEjF1aDJne/ahQ+bSpfA
	dOvkmb+wsgRgRW9X3+RxS90WRwrVvETlK3/ym22F6U80fLKeyn5URsvq
X-Gm-Gg: AYBFou1+Ethd1gsunEoUT5xe9bFjn7Bt2lA1rLtOm2Qmv3keStlnVI+nJtxn+a0pBF8
	4bvgzUSFzd0q5Yiex2bfCrndktqPYEap4mpH3mFERs6pv4HLtgkKKKuKnL5WAIWxtQsiBoFXqO4
	jZppgvk62f9tZxRVJJGv1ATFeSKLPkDtiGEnPi9oo9cii2ulW9CkzihtNu7neQLDt0ZSdX4LtTv
	yaiKpcPml8/kgPNpsY3vXFhkkgTVqYPanXBkkBeNwlsRs3vo5FwaLehma10DevX5ojAtsvUxNWW
	de0JymE4VwvneiwwQExQkQ8Lki7Bsz60lnQTtgOeXZW/+oHHyHDpVtQAgzf22LpmGWyyGP+vQUV
	BVhGDM36OJQ36ErSR2iafW0mDdGUzbYHZc8QgHeat3E43yrH9UO7A2dX2lR0F5WGmKxEBoApR1v
	t8LMBNVf72W/wvKdZr8uXfkm6EVZNh57/qhcB8srvhhmNjSgwDgIaFOOr5Fx09oy1byBSX55yPs
	ALzi8TsD/PVDEBNlNS5bjtoF5ahLaichOGn4olkVovNQInKvrXtfNlsT1xySbcPimqGFpDHCJNl
	ri7wGzJwCo3f1o1i88kVyeAXE5QV+Oy3vF10YtAIgiSDudEoJIonG2veG1LwIr9u6xLx
X-Received: by 2002:a05:701b:4546:20b0:190:f24b:9491 with SMTP id a92af1059eb24-1a6cbe7ddb9mr3384162c88.12.1793193973628;
        Wed, 28 Oct 2026 06:26:13 -0700 (PDT)
Received: from toolbx (2607-8700-5500-3d9a-0000-0000-0000-0003.16clouds.com. [2607:8700:5500:3d9a::3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814aa1sm10708639c88.7.2026.10.28.06.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:26:13 -0700 (PDT)
From: ZiAo Wang <ziaowang2007@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	ZiAo Wang <ziaowang2007@gmail.com>
Subject: [PATCH 2/3] HID: quirks: Ignore Valkyrie USB LCD devices
Date: Wed, 28 Oct 2026 21:25:35 +0800
Message-ID: <20261028132536.375927-3-ziaowang2007@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028132536.375927-1-ziaowang2007@gmail.com>
References: <20261028132536.375927-1-ziaowang2007@gmail.com>
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

Valkyrie USB LCD devices (0x345f:0x9132) expose a HID interface
for vendor-specific display control commands and a separate USB
interface for bulk framebuffer transfers.

The HID interface is not intended for input and should be managed
by the dedicated USB display driver instead of the HID subsystem.

Add the device to the HID quirk table with HID_QUIRK_IGNORE to
prevent the HID driver from binding to it.

Signed-off-by: ZiAo Wang <ziaowang2007@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 91319aa651..d135ea8f06 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1704,4 +1704,7 @@
 #define USB_VENDOR_ID_HUAWEI			0x12d1
 #define USB_DEVICE_ID_HUAWEI_CD30KBD		0x109b
 
+#define USB_VENDOR_ID_VALKYRIE			0x345f
+#define USB_PRODUCT_ID_VALKYRIE_LCD		0x9132
+
 #endif
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 793db001a6..70ada7320c 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -226,6 +226,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YJXCHIP, USB_DEVICE_ID_YJXCHIP_MOUSE),
 		HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_GROUP_AUDIO), HID_QUIRK_NOGET },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_VALKYRIE, USB_PRODUCT_ID_VALKYRIE_LCD), HID_QUIRK_IGNORE },
 
 	{ 0 }
 };
-- 
2.56.0

