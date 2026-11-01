Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793545755;
	b=0QBv2tC/yeC0z59nTLyIoyYiwy0QforBZ6eXJDaD5sXeew0SGgNHqJqcnPExJbzzX2nh
	 rESpU28n0fUSv20sMme5P1V0CQM/+wYC3n+/4HtNQPvl/UPxfVO+7S9kKeOKjhbjlJ15T
	 LRsNmUHOS9lcX6D9d0uyoaEfFDv1YW0CcztrZWiRRXQnZj1KACpyROzIahEuNZvjC0VD/
	 ygMyI3MHpo9fXrnc0O0QDaQVAkFNkgBnLCU8XBogwbPHzPOHccgzlCAFO1jX7Sboy2cbB
	 S5FwBQNjtyGUp9Rk45GeEzoQLAi2vBeMf54ZpULJVGPWfellkekTheDTvgKhdpg/SjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793545755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:From:Date:Subject:To:Cc;
	bh=r7sqR2vKS8k46feKmXGRK3DyHQiJEHIGx7m70vFc/3o=;
	b=Ac3mNfmXT2Vwa7GM2IRyt5PYzTRw5PDKt44Wn/e+THaAI2PrcQ9LspLMViUb5DEhzI+e
	 Zehz145rH6yBGy4sTkxILkDmA69U6KtDzqi2+GYWh6mRbLdu5/M5jlF3XxE6ds4OHw+6J
	 js0eqfRb9iW7FQQ8jEkkfdnM4XL0bXz8IZhVmkwtfLqJ9YDeRxBt0YnN/8XkA/e0kElsq
	 xUakog+XURNB08W6RI4blRBKr5iK+fa6BUovEKpSURYgU8W5cBqoLfb+fjm/lbGh2LpAC
	 6j/V8F/WIGakFbWKofWGXEJtZEgGX4GKb5bclf3AykSZdbd9OgdWsFNGVxRFI72D47w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V9Xx2hTh;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBB606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89FBB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V9Xx2hTh
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9d1114320so16535875ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 07:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793545755; x=1794150555; darn=vger.kernel.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7sqR2vKS8k46feKmXGRK3DyHQiJEHIGx7m70vFc/3o=;
        b=V9Xx2hThdKxFw9nADiYlhHfmk3u14emJP/DqNa743jFAxL4IO/2Zx+VtJA1/V4ZKpY
         kp0pASv7rNJWBXPW1vwq3M5hF0qJQQMaPZ+HcSYtivquFrTqDx5xpLQV3FtNMnxq/ieD
         4nEmEd49br5WtlCOf2EKtIBcsmk+3t1LtdH/3OAEsKVpG6gViGd9I1MYRRTg7GV5Y3EN
         TYES+eFfTJrySSEZkf53we70A/vqAgUR1ixY4DIH/BHOl7n9WsjtbBReE3NRbO4q6bop
         dRHn46psXuz+On/gJDNcYnJNnNcH9GgcOpb+6lft7TYdmtW/cBa/jHLQgN96vRIR9IlP
         1rtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793545755; x=1794150555;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7sqR2vKS8k46feKmXGRK3DyHQiJEHIGx7m70vFc/3o=;
        b=uZursxjmE4duzsgqQPwGx7/2odNC+Jm28qdY/DWcCnA4Yc2zCIFdTypPMUx4X7z4Ur
         v/AfiDlNrc/kIarae7LR6yYNUbIhphrv6yaSxwyzoHMamD+atxgFlvtvivqel78vOsUa
         rGzNJS+Par4JRyyzTNuiGzIEolg9r60cj53k/C0V2E1tVpt3yk5KzcpdPDWXPMa2TdGJ
         RVLrOrL3nRu+WwIpFk+NUhW6qp+M3iWhvr5AzXbxt/Fb5FrPhqDVL8RKc8aDacnMXgGr
         fjcONRgSCIKLnQAFIvEfw/mayfs4UDekxVTVMYCOyYKkIB5dzR4BUhCe9KcI5Yjw+W7b
         Dw2g==
X-Forwarded-Encrypted: i=1; AKwUvBzpHn2aC9trvL6Fi4QTwYjYqdx8s2B6mDqLCx0J6JQSXkWztz/PeB2kwmiZyVZ4yTlqLorrt1736+tzH7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+iFbY790oNxGSEbpbftYEvcEwxeCXLj39T64rpreVVvvo41rS
	z06ypX0ICEIXb/u+gQPa8TB5wHKYzIpjG/lLFoaBNd8dI1lRDplig27C
X-Gm-Gg: AYBFou3FT9bdCdtfSzknyKH1PxCC9DcYR5IAaHufVajFm1ZIEdZW+fbnvnwgXWwdc5B
	n7QuMArZnmnjLu99lN3t/9HQXhTbix0pXe0yfEBg+ZrHf3J6Xt0+W7MiUf5LtV/EuLiNNU+XtJA
	QAIqgLTQxoQX1oRTQ+tnTXbGvAGa9WotweA5psntJIdXMh1Dok6topV22sm3xgdyXL4hG0Q3S+P
	9bnzEj/HLlp4JRT79TTnPUaSDPXahvM+5C3eQNfdy8Zc3onF+ACjcLyOyy9HemQ/xyq/3YwmoDU
	uHrUy/V1IeNfUse6hkp4Zy4rdARxV9tVqP169Kl9YlPHRka1ngJM4+sYoKBlABVnPN40HUPHex3
	pSVigot7T7fYgn3GXiDWcdYykHJYex/FFjdyieLUeHtbuDkWEiMRitHlLcoYqggzchwivS96Rll
	vNG3PTEboPhHp97XRN5XpCt4z9ahNr2CbzxSI4cquSy4oGdG02xn/6ZiU1xNLEARyPu3+8XcdZW
	Ioyd9ggiZtx8OcyUZERzYsQAIw0iFpD659lE22CmnO7wb874hO4pbZ354OIJ8dAbo3jLOFTNd7J
	S3JodNAGYG1mt3EfcFoN9qo6HrM=
X-Received: by 2002:a17:903:1b4c:b0:2e4:b37a:d583 with SMTP id d9443c01a7336-2eb3651554emr70954765ad.61.1793545754372;
        Sun, 01 Nov 2026 07:09:14 -0800 (PST)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39266b84sm18746045ad.43.2026.11.01.07.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:09:12 -0800 (PST)
Message-ID: <6ae75618.320b261f.106342.b1ef@mx.google.com>
From: Liang Haowen <nbg2974@gmail.com>
Date: Sun, 1 Nov 2026 20:45:00 +0800
Subject: [PATCH] HID: add ALWAYS_POLL quirk for YJX-CHIP EWEADN a8a4 units
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Replacement receivers with VID 0xa8a4 first appeared here in
October 2026, and the mice themselves use the same VID when
connected by USB cable. The interface layout and endpoint match
the original 0xa8a5 units, and the endpoint carries the same
9-byte report 0x02 payload, so extend the quirk to keep those
pointers alive on boot and replug too.

Link: https://lore.kernel.org/r/20261012154240.33221-1-nbg2974@gmail.com
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Liang Haowen <nbg2974@gmail.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 91319aa..1fc77cb 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1654,6 +1654,7 @@
 
 #define USB_VENDOR_ID_YJXCHIP		0xa8a5
 #define USB_DEVICE_ID_YJXCHIP_MOUSE	0x2255
+#define USB_VENDOR_ID_YJXCHIP2		0xa8a4
 
 #define USB_VENDOR_ID_ZEROPLUS		0x0c12
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 793db00..362768b 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -225,6 +225,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_XIN_MO, USB_DEVICE_ID_XIN_MO_DUAL_ARCADE), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_YJXCHIP, USB_DEVICE_ID_YJXCHIP_MOUSE),
 		HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_YJXCHIP2, USB_DEVICE_ID_YJXCHIP_MOUSE),
+		HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_GROUP_AUDIO), HID_QUIRK_NOGET },
 
 	{ 0 }
-- 
2.55.0


