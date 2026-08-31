Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8002B3876A1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788203584; cv=none; b=FGTyAHPUVJvQ+8X8OdVtxbmVg4aJBX8DapbypskeSWfAlu/eEHI7b0kl1gMeaEzzB7nEXKYZa1gy6AXQwLR3OxLFq2+fA3eyOekgNZEn3VAPPg7wTHGG3RfTHARcGZEPE4i/ysuaE7J/BiWBGdmVJH6f7dlzRgn38drVxVANBr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788203584; c=relaxed/simple;
	bh=j0EoqL8IuiLtmXdt0H398BbvsC8H1qJ95HdoZ4a/ugs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILLbvzyIb4kZXz1wbHWAP+bZmAo4N8DSFarW4RrbWizuDawp8t0nwm0gLN6KJVwlqyyIk56bGI+ab40KGkO2Lh5twi73D/bE1SZRIzLZ2p+YczVckba8Br4JPlg2w1rLCf6NWyUsrN+bH0MGuL5mIk4+HUh4zXxy88/t1by9DDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRyfRY3G; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRyfRY3G"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-9382fbb1208so400899785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788203581; x=1788808381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMGIA5ANiEfyPx0Aer3EeRWdzc/nK5frp0+gRGq+39k=;
        b=FRyfRY3GT7QO/HwjrsEAtakRlhGRtkO8TbzPE8zlbTPfRw20x6ZA8T18L68naOig3s
         FwCd041aCmbebD8b9L8ZIK1Qa/BwkFnwxfwRnnLYl/Eynveb425u4wvpc+NJ/SV7RuBd
         hfzfzQ1T/wOQ4dq4l/lGUOkznoRwiXqyiOpykxB8vVOEpJYmpHfkqwD5WnDlKv7fXeUg
         +tyx1S4OvBAACZQyBIm/TFFgIXf3D/UhARnGwOi8Ak5RxzMb491oMIjHzdEzXOW/kmrm
         qNEMreb5AVX0rm5ak2UFyypFNr098MehzJJaUVyrcPDMSq2T6s9EtU9ZrZAUmu1iC1cQ
         oGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788203581; x=1788808381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMGIA5ANiEfyPx0Aer3EeRWdzc/nK5frp0+gRGq+39k=;
        b=Gm7giAgHpaNeURy3W5gap1zojR0sCDd16+uwb2xG1AlG5zhnogGuRqAs3C0VXetMqE
         LNsX96Tg9dZDILxO43vWNcOrkU5pubWSu376IFn6b/NmYZqdOHxqbVvhAzNCFc1+o+tu
         4AScB+5Yr6tBwz9vkwG8RRp8lTom1HIODPzN3hbG4lGJfVorfAXhlNwU/JE7T6tg911N
         35/918K2ZUEqZ6KJRM07fJI1/5FzLjCQBMSQqtZj0f568ps5KiIAPlIoG3p6D73ylkVe
         OJomoW9sK5SJLSPrivAyrwa3nJ+isNKv4DzyHMi6f/ArfrSAN2bc4qjf3ua0JUhLfQCr
         WJpg==
X-Gm-Message-State: AFuF++nHCN8GlKl13ZpqnUefJBAdEgS7LKjMvNY2Qx51aVVku6KMriUd
	uQNPgvsT+xrlKSYHeQxxrzhaqjTIJ8c7Bpwcqr/wTDDtmVZ9Jn7CZbss
X-Gm-Gg: AR+sD116i7l/M3NOtNN+qLfynbLGLcFgBerjcv5O1qaFjCc+1tEslVBVyBpZULOkqgd
	rDOm6aO3Gx6b8r1rLfh56d3dnveRL1vESH59qQYexxYnAFrwt6Ea0xsVGuPtrdl0i/RX2xGA8HD
	QDGXlshnXYiCdJbVQNQcr2d9OCyfusVDpjJhMMnCBFYt7WOOt0V8X3cznRuCjGrIUcSv7FfwAew
	z6P3jHwMjEXjx6fm2s0/LUqBJqSyFnb/MNVfe1Spay7kHSpIS+PiZbICQT0O3xlQytO4PhtT8CP
	8a4Fx/2zHUjDIUgj811H2zGy0C1d0RMLRXwPDTsqVaWm4h9EDdEu4wvGUA3cULekhiL2a1h8G+q
	JBu+x0my6FOnj7rQjduYvZpYTBdjH1oOd7V1vy8iREVyrz3G8G93JhGjm1WPPYBdhPcPREKemnA
	AR4hQZH0Y1fbprlEF/3Pn2Y7EnnAH0XAO8s6rr1XI3MSdk4uJmWlv3knnbDPDcoQ6+O62e8fETd
	lM=
X-Received: by 2002:a05:620a:6289:b0:937:65d:d89e with SMTP id af79cd13be357-9391378427emr3807337785a.3.1788203581043;
        Mon, 31 Aug 2026 12:13:01 -0700 (PDT)
Received: from zmitepc.ad.psu.edu ([66.71.17.237])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4460e56sm92298346d6.14.2026.08.31.12.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:13:00 -0700 (PDT)
From: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
Subject: [PATCH] usb: quirks: add WINDOWS_CONFIG_REQ_SIZE for Razer BlackShark V3
Date: Mon, 31 Aug 2026 15:12:57 -0400
Message-ID: <20260831191257.43084-1-memobayoglu2007@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Razer BlackShark V3 and V3 Pro wireless dongles fingerprint the
USB host by its configuration-descriptor read pattern during
enumeration. Unless they see a single full-length (wLength=255)
request like Windows sends, they refuse to bring up the wireless
telemetry relay and battery, charging and EQ state all read back as
zero.

USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE already implements exactly this
behaviour, so just register it for the four BlackShark V3 PIDs:

  0x0576  V3 Pro (wired USB-C)
  0x0577  V3 Pro (2.4GHz dongle)
  0x0579  V3     (wired USB-C)
  0x057a  V3     (2.4GHz dongle)

Both the dongle and the wired transport enumerate the same firmware
and need the quirk. Verified on 0x057a and 0x0577: with the quirk the
vendor channel answers and battery/charging/EQ read correctly;
without it every vendor GET returns zero.

Tested-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
Signed-off-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
---
 drivers/usb/core/quirks.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b..9b5420be2 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -502,6 +502,11 @@ static const struct usb_device_id usb_quirk_list[] = {
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
 	/* Razer - Razer Kiyo Pro Webcam */
 	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
+	/* Razer BlackShark V3 / V3 Pro - unlock wireless telemetry relay */
+	{ USB_DEVICE(0x1532, 0x0576), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0577), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x0579), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
+	{ USB_DEVICE(0x1532, 0x057a), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
 
 	/* Lenovo ThinkPad OneLink+ Dock twin hub controllers (VIA Labs VL812) */
 	{ USB_DEVICE(0x17ef, 0x1018), .driver_info = USB_QUIRK_RESET_RESUME },
-- 
2.55.0

