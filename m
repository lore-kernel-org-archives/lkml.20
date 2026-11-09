Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223704;
	b=LJqkDbTeEnMcjqAiUesimQDfR2ZELTBJsWBXPY+OXndLXUiH3megmZ7Kv2HM7UP/NomK
	 Tlhjb5GvMnl86rLbsLy2QvEfdDD7zqMZTYHncBVyjO+JsJUf7bkuk7sa3yuQn7jL9KLwe
	 g09vVqKCilLAAypJ7SQgK9hFVSq2K4tBUZVT+dQIZtpa889hcLvJuWpoZpAM+euP1WN8V
	 ZKsFLSIBbLVx2E0n02FMWgNnPM+i9PS6z5/ShuJ1zAF20q55i6nGmNgg03NE7C2vK9sYW
	 eBgsiAftjW0VDS2nYoA9SaVrzEdCPMBDUxlSRJ+Sd0X4Ba2ez45f3xzJN+qF/+y52sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=6Kp3s1+NmVBEMo0MFuyvuc55C1924bWMRV+hw/2BMKE=;
	b=iQWb5DJHHRGcQm3ynrsWOtCcM7ilXYgnqmS6sxBFCl10jeSbVqB2Er0bv7vDgaXvVvKj
	 0EPvHzuVXICQ5hmDLpoGhKOLCTIgT4HI+DN2AMuRx27mTTQmiYosWKhG8K9YJh5Zc4vmD
	 ypdB4X39Eu1GCoBsnoqElLAfhY0jESr8JgEguVNgd2bbydfmgE07Ydm/5D+Bi7kzuNcjq
	 gPXeEkliEPsUCcA0rL/D5nhTv9cP/eWmNwv1zCFDs7ATZSoENzouAFi8kgISvT2dWF3iQ
	 D2pen4VCSoMLZxDk/cqfAAYi285/AuuCz/3DWKpqJoT9iQG+3GwlrxM4H4MbaLvilKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j6laZtw4;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060E0606D823
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060E0606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j6laZtw4
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfd5771ccso5337261fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223702; x=1794828502; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Kp3s1+NmVBEMo0MFuyvuc55C1924bWMRV+hw/2BMKE=;
        b=j6laZtw4eaU1c5Qglnqi0bHnlSrHos9vN7e0lUW6/bdTOIvLIFpSP7aoJSSQp8iE8K
         FmCncKOR/QPkpzjGRhLBVJxzf4VkQqBfSVquHK8ydAzrsVCcfZz802dU7oHk+d8HKbXR
         3rdm6TP/4RTB0s/GVrAVceKTlBybgZqLmDXvK4P8QTzjpL/BFS7d2/oAzGNvd34aBSpd
         WfYhVC/SUgluonhKZMiECGAbJkrxEiCh0rqy+IMdSNmBsInjV/pIpVoAN/JhNXZjcm7l
         o4sGyHcIagrISbSBLKpXVk6npBhRoA8XR9VEISz7xhHEexzSVbr9XnClAis+5L6JCh/i
         v3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223702; x=1794828502;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Kp3s1+NmVBEMo0MFuyvuc55C1924bWMRV+hw/2BMKE=;
        b=pEwduQclixSqfIfEZCaRSI6WlUQf24AGgA3ilxOPPbClgx2gSwq/dNB8DxDhcqNRbx
         pacxn+vC7Cytf0lKXk+JHOdyoQqcW3UYgMHu9FMfQWT3xjoog7XHQgDTg/v0aIsKPgwj
         1XQlqp6cex/Hf1DSTTiuWT47dQgVeiL5QKNDecC5ziJMBFuQL2/thyR/bZaCHGW8vyRs
         rf6xaf++Vkdy+zoZYhsdSqC58/2NGcBMt2/mH3sxkvUcDwVILmdbRXo7zrSOLM62Yp/m
         u1D+U7+EPnp58t/d6YQ3ETLw+otu3o+l0ugApyo6/M0QWOyrBdFc8BupLoXfQ8JUu+UD
         iYJg==
X-Forwarded-Encrypted: i=1; AL+hErGpIY8UY4ODjAGUzclQdv+WqXREbP3c+kOdznRmmP2+7Bnl9kJFYjwDSGm0EyoP0YaNkcuvMiYv8ubtac4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k5R+X1/FbR7Bhp8+46bkrNYY/qITIgwk6xQzWWiawBUbw0WBy
	ZGNuLWMNXqKOx52qcN6JnZgzq8qfACpv5XQLtsxvwS0LHcrbTxKPw+rPpz22Qw==
X-Gm-Gg: AYBFou20TE9RsozdzpnX6drDbxLunCX7SnA2aJdiryOoRIlw7XjVd6Ymx4ZvJjAlrDi
	vnxynSisZBdODeeKCoU4vCYmilv+yJ/NJdChxxpaMUSaiAQKaZfnisDEYALSisltY1q9qsHUhTu
	88xLgus25GV/+hJD35pO8kmbYzoJ+AAKCKBsiscuy5GkRNSnUhGJSKKx22E0pQwriPq7D7dS4RV
	4iwMEgXFjpXEs6oFr2CkMo7vR1BfjWD6ILjcwdszdzwiSlM+09rjOXaaQDeH60d7X91JbycdzP+
	WbgbEToeYmvVQBOF8I9U0xaZkS8G5VYgbR54rkz/PcabT1WDYz5mLnIcztk4zZfFIYW5GNIvxqf
	pTE860ux05xlEQWP5VMRFieZxf74d3PoZhQsVG7CAOJuAQOfLnbiOLMO1A20iB9//RGtfIKD1ic
	ZAaAJE1NqVClStUmaOBEB7xwFzXVFt1Jzv0/2RVPe8Gt0kdYxgoVR6bqeIzN7LcyX2asTY6kVdz
	8tk+z5VDFtq3RswL5nu84z4FbsyCwMahCKbg+NaEccYuU5e8brhWh976UV5WXx65lqU5N1xrwmp
	4Q6L1RKKyWUbBq10ToexUqO4SSC6UdYvVNn8iEr8Bv4MvXhBJj0MKOsf
X-Received: by 2002:a05:6512:3dab:b0:5bf:b144:366b with SMTP id 2adb3069b0e04-5c14c010e2cmr980184e87.35.1794223702158;
        Mon, 09 Nov 2026 03:28:22 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b8064c6sm779958e87.35.2026.11.09.03.28.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2026 03:28:21 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH 3/8] char: xillybus: Return error in fops read method handler
Date: Mon,  9 Nov 2026 12:27:55 +0100
Message-Id: <20261109112800.48663-4-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261109112800.48663-1-eli.billauer@gmail.com>
References: <20261109112800.48663-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Be sure to return an error status from the driver's read fops method when
the USB device is unplugged or a hardware error occurs, and all available
data has been delivered.

Before this patch, the return value was zero in this case, meaning EOF,
which didn't expose the reason for ending the data stream.

The existing memory barrier smp_rmb(), together with the assignment of
xdev->error in report_io_error() with a spinlock taken, ensure that
xdev->error has its updated value when the hereby corrected assignment
takes place.

Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---
 drivers/char/xillybus/xillyusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 4c53d808737a..45612fd760f0 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1544,7 +1544,7 @@ static ssize_t xillyusb_read(struct file *filp, char __user *userbuf,
 			if (READ_ONCE(fifo->fill))
 				continue;
 
-			rc = 0;
+			rc = xdev->error; /* Usually zero, meaning EOF */
 			break;
 		}
 
-- 
2.17.1

