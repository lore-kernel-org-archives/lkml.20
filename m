Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32B3E0C7A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787905629; cv=none; b=rgy2uqAui99mejbWxiJ1r+lhryetGgxgVbp06Xevd0hSjrqFIjRteKStBMqgwruvzg05Bsc2Cu06Y36CFzymW1Fst/czzL7pgHFtwAJkFYgsRKWXbvupbayn4LThMcStZvjMcG7BA3QfTX38crOwqsBZ5aZMBluM8/QfQyjsJi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787905629; c=relaxed/simple;
	bh=5hEvnLDNcTGoaqofp1S+4NAECFlyfDmkOkI6CNlGqy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7tK16dmCL7Xmog4Tjt4p30pPYDy61ajuyJ6XdSMDC6tif1M1zR6dXP2v5g9E4IRXF6PcUN5glc11RzPq1SjoPmQxzITENoFaSUVHzUsnKyOfiJOGh2pomIpASRNsmh5pVLq6eB75HvId0uuvvo+Dckg8Rw3f5UZXMt+YgOTdf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1d35dkG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1d35dkG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84864086bfeso621856b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787905628; x=1788510428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBtdkO99POWoOXgQruRlbYMJZ092vG9oZUJO+zx1F24=;
        b=f1d35dkGfhnAIZ8XxgxYTGXMM7qfZ4vn7wMUY/4rJsFBYeXUOhdv8MNWQ7jtrf+gqp
         HSl+Uoxygss3K4Ik6UWhjy4YgOO5wu1tivW7phh18fnz5G/JR4IyBPGI6tP6lKdYpYxx
         sqTZNpON3qxJROkZRX/7cFM0a0sqKRihqdmbBjZY4yUsgxcuuMLCOeHzWUjdIcvC5s8E
         ExEPIAvgEZeHW8ECS0RZdKjKV7U/bwqILcCVihmTfXyiRG9I2D5Ab76gxEtojsFmAmu6
         ObfZ05S6gHwbk0l6PoiCQ+w+/tlk9zYvdsrJ3IYidlbdATIbFluPCKLrZdSgkJPdpyBR
         tpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787905628; x=1788510428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBtdkO99POWoOXgQruRlbYMJZ092vG9oZUJO+zx1F24=;
        b=Gaf3p9ZMiEHH/qMv+317g3nkwcOBZ6QqRFolC2WjIHI/p3IhZ+7bpvkQUDsfFKIoJs
         t314aAVa3cLtZxo1NeAdD7YnehghtXB/euR+wiyRvf7Il/D2DPF20wwzOfVvKMh3dGNr
         5yOM+VMU5TWEmyDI0UfrGaoZvlOBLOxKhDQ4lNu6HvqE95Q7uZGiT2q1Jdyi5+2trWYw
         76qltRtdt99+CF8nF3TnlLU2b3FOgoEfo8RYo3nZ3jc7fql8YeOUQWpwdWNLd73mpVlA
         85fKyyqvuaDXmHIRyuC/gB+TD+/5NvwhF98rc0RQMjwwkxBU0hClI1p+bYY4bK+sugWo
         Txng==
X-Forwarded-Encrypted: i=1; AHgh+Rr15VwtaJvA84nH+SlI5vBYIP7zTpVYa34s0TzuPy1t/l88DLkh4GSryn0Q/r3keC+88cHE2ppOX8bpK8A=@vger.kernel.org
X-Gm-Message-State: AFuF++kObz5T9GDrqo04BD5RZlM1upeBbO4VlwrLBOHCDqeCzdbbbfYd
	AM+ySr233AckpEXtPrnKUDg+rkPfDJMmXGtxhg4T5h/ACRV22PbGOUUV
X-Gm-Gg: AR+sD10Y/D8YSBRe6VyM/l8YhAJiJBlh9zWgz7kPmol0yY+s34wQ8hYo22XcQSH4z0R
	S+FSkRIBG3NF5GqwLjZyJrIl5vXBe1Lv2HOp9F3/d3PQv+912+6rzBMTLIu4/BrkUEuNyMi5cJh
	HRDBZU+QmJnWi9GqPT7Uu4gixBbicOT/X91pBwj7PW9IUzFrHeBdjHywHAaJzW/cQzuHTVMsTeY
	w+lIgakefjV/NMSGAyvsnBI3azjlpM5OwGmG+4CWYXj6hBSVk+urycXtirecwWLza575BikWe5b
	wREhb04LWjT+dmZW6/ZS70E2W2LQw/iK6SOW970IbAD8/+45dgTGocf48ZTc5fbV+mv9vSolxWk
	HyIMV359hVw+Ro4rOG1mOOCN1y8P/ZSG+aeO0AAsw8g/qCDBtTmYWf12B4sJSgYWQ6KVD0VeOpE
	gO1G2dG1iadcpvpy3t/co2frHdtNDZMhUu7vWcVITwXfXhGRNWi+tt+V2gwIK3vgNiuK2+K6wya
	u8urvyxmxEXz6CBVRyd8Zf5NGMWR9d7aU+pAjbLt9YEz+m0EviGhkib4JrOqk16pU0H2W0I
X-Received: by 2002:a05:6a00:1daa:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-85627dc169bmr10564110b3a.4.1787905627482;
        Fri, 28 Aug 2026 01:27:07 -0700 (PDT)
Received: from ian-lin-DREAMBOOK-PRO-14V.. (59-124-157-10.hinet-ip.hinet.net. [59.124.157.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm350364b3a.24.2026.08.28.01.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:27:06 -0700 (PDT)
From: Ian Lin <jisayme@gmail.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Lin <jisayme@gmail.com>
Subject: [PATCH v2] USB: serial: option: add Compal EXM-G1x support
Date: Fri, 28 Aug 2026 16:26:45 +0800
Message-ID: <20260828082645.13018-1-jisayme@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828075644.6228-1-jisayme@gmail.com>
References: <20260828075644.6228-1-jisayme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Compal EXM-G1x is a Qualcomm SDX12-based LTE modem. Add support for
its vendor-specific serial interfaces with protocols 0x30, 0x40, and
0x60.

Relevant output from usb-devices:

T:  Bus=04 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  1
P:  Vendor=04b7 ProdID=8217 Rev=05.04
S:  Manufacturer=COMPAL
S:  Product=EXM-G1x
C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=896mA
I:  If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#= 8 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan

Tested on a Compal EXM-G1x modem.

Signed-off-by: Ian Lin <jisayme@gmail.com>
---
Changes in v2:
- Split the USB serial change into a standalone patch.
- Document the Qualcomm SDX12 chipset and include usb-devices output.
- Sort the VID/PID entries and add a product-name comment.

 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e4ad14375..e4d9f2e70 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2542,6 +2542,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, UNISOC_PRODUCT_UIS7720, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x30) },	/* Compal EXM-G1x */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x40) },
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x04b7, 0x8217, 0xff, 0xff, 0x60) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
 	  .driver_info = NCTRL(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
-- 
2.43.0
