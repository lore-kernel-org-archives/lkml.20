Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739069;
	b=es7lpTTIvz0kFj+AvFbihzfGfL6nxf2QJUX9atRs4pKcnlWPwg5Qr0EU6YRlqiRheWUp
	 Sbc21grWxMhdu7HqKLuPERJfmzXc1mEFNIBp0TLiuhrCL7O6TZbnZb8MjwECsO3urY643
	 pooCz0CFje490bPFuOFkxBJsav9FjTi6DmRlyP5ZeCxp8mUENf5nNBG9ITm8+X/GVL2no
	 2w9BdhFiPDFsE9hvOMSUTHW/wqrADmWVtg30NCE1AG0wLWncjCkn0b5B2yNJJSWc/1fzK
	 zyqo5Qt5BjsCTS/fQKwZfX1TXH1F1bMgLwcymmh0k9lxR5PszYnW51W3j5kxgwTud6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qG5b3GBAm10vBf9IK+PFH6C3j46v3ALudwzqDcSeLhk=;
	b=V/irQ+Bjx55S2zUgHSsP/vDV1WtcbfWxXnfzzJVL8oAfAsSDNlyXZ+42pM5XW4xgz4rN
	 CnKI2ZfOv0so10kN7Yxpgtwtt7ubtv5in2FSKYW64WE+NAvy6H7wPPnxnynkXoGbUzivv
	 ogNH2vUniMIzAWQ37blRfDGLfH0lV5aGnKHyHav6daW/ZeUJ6e5Nz/dLIgIRCnHE/pBAr
	 g1h/2KvssKwAIWoJf4GXlRt9B6vsTRT4o/IDnAlUMR9NdP+jCQBOjUUCEyJsGRvlgior+
	 FoAYuHgeg0qznk8DN38adCHvryJg1YTdmivEPoRWXtcZ3Bnq+GPiyI7V0nxl5Y7NFPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgiCm4CB;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F67F606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F67F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HgiCm4CB
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so1375888eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739068; x=1793343868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qG5b3GBAm10vBf9IK+PFH6C3j46v3ALudwzqDcSeLhk=;
        b=HgiCm4CB/WS6pRw2SWQIvkZ1zLtaW1GUKFazHOhdwUgfMlbe/K+ehi8yZssfpEPqaa
         7aqJUyj1cDGLrh5U9k4dkSALQFRC7I5q42ZpvyIz4f69htYbNxp04eKUKtamPx1DBj+v
         M+l2WR4CdWV2bv2AR85rgzE8nG7XWJKlgTuJRvXZQh7HqW+IJs4nsYC2AwHzrfp3qUH/
         qIQw3eNXPkBVV/IEpTErqIqt+nEHeE9VoO/dLaCps+nlgU3yQICyx6HDL6T/LHXxmbt8
         c5VOIveoku6z6YZCoD1Kxkh2q/xMXmgRxNqJ6MzPGLecUHiYLJX52h1hZ7Wv7Kf/kQve
         gsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739068; x=1793343868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qG5b3GBAm10vBf9IK+PFH6C3j46v3ALudwzqDcSeLhk=;
        b=AJweJWltJAZUotxRdQb21AtLWhPUK+rR0gnE/52e/H+z7zcjZgQ9NDdOikJsC9BMP4
         LqkzuWTjToSqy7/WF7F/qYTbTuvTgV4181RdoiKe5w+BvnUw+kczFSjehEmrP8srqT3G
         oOc+HtV7+c/CsRd1byY7aAxLKOUsjwl31nBj7vayNgEtaA9M8sb5MXgx4j/Vfowme4vC
         klc4bvMvXmAh9aXfPPYv0ZaycdgXXw5OjwYlE0DjG4GNc4MZbjcSuKhAWinrLP7uy2wA
         N+J5BH+HdufCKU4R/6CFgelofF+jzPOdLR8TuUai1B47Pr6D+kIKI34Znh/uwkWbLI8Y
         dEFA==
X-Forwarded-Encrypted: i=1; AKwUvBwbKrpCqgAUjGBgbcAmS82rcPTYaDHJxtCpZ0QTSRzisUIyZaTfb1CNRG0ylxLq4ebIblkB8AjdcLOYOpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGHc/MoC3TZJsA2yoK042apsgr7ngD/RMpsNIxdtViMBdCVhke
	Zagnw6djIXyocD/GJrUjiaxBLRSNXQ+yRDNOLTTXkJI2DxCH/3Vg5Dil
X-Gm-Gg: AYBFou06DUrW3ESBKQNXJIOc4xs7sCUMoZKBJEU3yqm4FHTaiB7YImNOLuNICLkx2z9
	vllVvnYOG3YQRyqmrR0aOVPLLbCYmzuoUIJp284YO+8MQ1vDX2VGnFiSkHG8HKZqQTaJM87ARxm
	L8x3cCi2qUzJ0/1FXC1hz499dBsOa9PykBzeQn9UI7IbQ9dYQdx8va1df/atC9ivXXt2aKY0Nkr
	eMviaHPZVEwc6kjFih+EU3bIIpwzDBBZftxYNjAar09o+zjHgBRTkd6UoEys0Cz4hs9yDAko7c6
	CoXzKoR5qqZy07IcpcLEvo7G+G+HhsfOkYG2XT8Rg8q0ebmRgeafBAG65XraohIXkjStZEHu7a4
	ik7Noa6DChRHLANOQgOKpPn0Nz2KOr3ADuS3va7bg02sMQftJK8hCGDjt2qc3BJaEFHFeadLmiH
	5Mx07HzQgKlaqOAmX3/qW3EADyOfTpNz7+Q1GMg/So8QBfRRPZo9zRq96kQUqPJUx9H2bRBElq3
	Hs18SekLwLzrtQMYo+nEBixPh/190D5AUUTrGCv4E7nKrDkvomA8hUalmuPBaW+OvwR2Ib3bgJS
	ZhTKj1Vub7AAwxfC4EpgIrzwlVAHXOMlJ5qcTQ==
X-Received: by 2002:a05:7301:f8d:b0:35a:7020:c08a with SMTP id 5a478bee46e88-369d976cd6amr2105063eec.19.1792739068048;
        Fri, 23 Oct 2026 00:04:28 -0700 (PDT)
Received: from SAJV1N5.lan ([14.139.240.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9de33acsm4764472eec.20.2026.10.23.00.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:04:27 -0700 (PDT)
From: Divyanshu Jha <divyanshuj2006@gmail.com>
To: Oliver Neukum <oliver@neukum.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Divyanshu Jha <divyanshuj2006@gmail.com>
Subject: [PATCH net-next] net: usb: cdc_ncm: add Apple Silicon MacBook Air (05ac:1903) device ID
Date: Fri, 23 Oct 2026 12:34:19 +0530
Message-ID: <20261023070419.235361-1-divyanshuj2006@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The Apple Silicon MacBook Air exposes a CDC-NCM interface (05ac:1903)
when connected host-to-host over USB-C.

Like other Apple CDC-NCM peripherals (0x1902 and 0x1905), Apple's
firmware omits the CDC status interrupt endpoint. This causes the
standard cdc_ncm probe to fail with a missing endpoint error.

Add device ID 05ac:1903 to cdc_ncm_devs binding to
apple_private_interface_info so the driver bypasses the interrupt
check and initializes host-to-host networking successfully.

Signed-off-by: Divyanshu Jha <divyanshuj2006@gmail.com>
---
 drivers/net/usb/cdc_ncm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3..6848b9421 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -2019,6 +2019,12 @@ static const struct usb_device_id cdc_devs[] = {
 	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1902, 2),
 		.driver_info = (unsigned long)&apple_private_interface_info,
 	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1903, 0),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
+	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1903, 2),
+		.driver_info = (unsigned long)&apple_private_interface_info,
+	},
 	{ USB_DEVICE_INTERFACE_NUMBER(0x05ac, 0x1905, 0),
 		.driver_info = (unsigned long)&apple_private_interface_info,
 	},
-- 
2.47.3

