Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075737;
	b=qIJBl1W0k330sZ+vD3h6qmfDsbtw5M1G90MUt9rJk83wTWuHDaglHEmIVOUm1HD3nZrE
	 NVD3lSGFNcat0Zdfi2lrZKxMcDAtRkW+A4LPpAZKqoaYpuWRiVVRHlgARIeeEqV7j+bp6
	 gVPfl9DmhJmbGKnu3vnIHLSSarh32Y3is/whzM2BcmXuNDA4+xS7dYLI9xmMF+oZ2O6Pz
	 dbGxoEUWEboBHjOtDCjeq4zcBJBcc9/TFJ22p04cthoXuu5DZqZ+OWszaCy0V81uQqFY3
	 3zCDr214QGzLae3/c8DFn6/xf0ZsqMDOEzY1S/5XoeQTZkO1FV69TARfsfvKMQBtzXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
	b=aJVom2UYrmmxMiB6PX4rxZbCc2Qou68TVcDat2dGi7HCM88UHUcme5Q/0lvSeHtXhwIp
	 JykClbYuoO0BIURB84Xb90Ms10+wC7HJfRV+nrdnUX8zDhZdE8f4xhZbtYkDuqD5wl1zo
	 KpKALOZs84/6lwocRPRo2jx+Pm3TQskJYlOJt/r6TIfLYX64v/jJYV+ggsDUspJ/E2paM
	 GnraFTmO90sHtAFKeDTa4MR7t812O92XZl3TMvQILytelS1jlKo90ear8Bkr2swihAb23
	 NaIfd1Q2LUsag6Myao+8odyVikBeKPuaPA5fTq1uYfLMld1XBa8vpwqIcGV5GulRXrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laQKDcYB;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED22606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ED22606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=laQKDcYB
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so18936635e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075736; x=1794680536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=laQKDcYBgY9+0OvP8pF9/zheq3+qnULr6rCme6HzA7HScMN/6CZ92JURWGgPuXAmaO
         /SabkMjLq49tzNyzO+k31xDZOOkKR2BIqq85w7WemcC0acWQGqbHKcCMDba39e2w7HN1
         4u60qdls76MdRnrm2ypczMBUySLp/XBqrAxLFyvc/rCazdEyuFmGvlRDbZEfDcUAaByh
         7z7V/LyN4/XAOtAICdFZG7oR1Bd9ikQH4ALghxOruBdvv/neAapkxeOEtaAnJKK/Qh+1
         G7vsACSQyF4kOdtZtydrzo1QX1cXRgiSHrtwTtuwxbGe3VRilWJW2DR8SiQgCI/T+BgO
         x/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075736; x=1794680536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzwI3rZnsJFnqXSjxmAO1NnPnVH/mx7ySNL6UPkWKZw=;
        b=U5clmAq4WOEm7ZlZHF094DP1sDLO8Dsyf0BeVkxBG0RIwzEo7Apcy6eP9Cjetudvep
         QXt3Co4PpoEREJld7v1HQ4vD+GjyoMIRG3IfWwLVDLvrorh5TCfCn3cGLzobAUFzRxR5
         S4ZUM2PfbKFI48bpwHjCrSQi8fjuAihbC4HwwRwao80nW9ylxsuyGVnjFPMtBz81z/b+
         EWF+VCEHT5Kq3nvaxNh6qI3G8yFPkEQCM7ob64EuP5Sv49RURJAxtVrKnF4WMBzTd4ue
         qIaYyAWl/2lxYJJ9CRUWP41IepEIXs0U8EJWarQmOPkKArMjts0vhDCpUuJK/gx+o995
         FMOw==
X-Forwarded-Encrypted: i=1; AKwUvByeqd/a8Gj7ikb8EgCfxkG6fX9Pc1jFBuecC2BVDoOBBejVvPDjwIAWcXCb3jSO3C3GXE3RcUftp7D4JKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+hRKDMzBavH7QHeyBzP7rDvhm8SwCH/EX0235zIwgGkaDCk05
	wvRIdY2rRS7FiwR1GpRHlHm8uIr8wMdaEqFRS7ED/aDQIDHCIku23oCN
X-Gm-Gg: AYBFou356cFPNb5xJAb/FFZg4E4VDXzA5CS9HBQ1OQ9D3OCdaZJNVplyBfh5jI3E3n2
	a2tBBtnEn8ftk3NjHalSiTBvCNTzBBZ3cHJpmks9D3vbj7pKF1srdSrUx/Z5WOugGgZ0FL2vDuQ
	08Xa0XjFJRVViVDl0VPR0Q8supCLmiG35cP7cIRHyp3MF3zOWkbwasSU0deiBl3tkrpsnJScXGo
	fBiiYzNKKbzuCHB1MXxw+FAGqxBg1d+9uKAnxMbYFfj4DNqGrKTflW+cpE6pmFPoxrFS7eUfz+7
	odpXrm9AcR6rjwqyYyh+G5s4WuUkXxdV+ayQd64mIPKuLPvSFyi1VDLn84ekxuSJgxGOqg95Ano
	YyRxQkjf9IevvIDVRpf0AwMwaLIWyCgvGeX3ljnrUPjv4Ubysf4KX2mfG8pLEKYiZ8i5dRQrAMd
	rwx8getF1G292dqwZXc7og44//a2fMe/xMb94YtcorvOmsgLU5XdMZtD5sJW7Sg5oIkKeGUy+tW
	l6WxpIplN5lof/iTDQZFEBVt0HO5w2jDE7FUVh1NcOeNc6y4DafsmqpxlFBXwUkjvJaFm90wvAZ
	NJxe9dQ8NexB2BTKMliESYcUg5uBTz+v0E/dPuiS8YuQBAR0OM29Y5uhLhRomYjcTb+TDqpK2X2
	0kOCPoFKCXFfwEPU=
X-Received: by 2002:a05:600c:8114:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4b6e0267f25mr100876325e9.31.1794075735680;
        Sat, 07 Nov 2026 10:22:15 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:15 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:32 +0100
Subject: [PATCH v2 2/6] firmware: raspberrypi: Fix indentation of return
 statement
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-fix-raspberrypi-firmware-v2-2-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=724;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=acy165BVhCPBqoiZ1D61v2aa3PiKHUPL5mFy64dozN8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xViPZpGbe3EcIdc8tO/kU7I9kDujb5JGo4q
 4DxcIgq6T+JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z08/EACVstIEZrV+LU+vktgC+n+/GER7F54JLwMgOgCSe6UwrjrZ2SdzmBbf9ObaE5CM8Ny7iFh
 3DtfCdDifAmMjF0zn1Xmb4p1EZZFJxJn61iTXKPaeUnZLSXxXCe14uBeTuMfdVfiRPsKPePcF3R
 jx1RE2YS8uYf8nn7SLmtn4OvxKLYcPuQSmFAENIPeE08zeiexWaDWEJU/J3FX2yhZymKjV7vNeF
 LqzKI1KT0DMvn676uOa/vLPc/cXsRHSjM4g8LwUC2YLDzTKrqC10/BQKRg6Yh5PPyBWlowW8cbO
 irHrtVFwb+ulcXxhpIhBRfku40eB2zuraBwC5Ole14oD1XQiRbVu3GNcDB83ulD4Fczo6mziQni
 +bmZVMqmvh4hxBz7Wmd+rwiIc1wv7WI+jMEtq6cwYwM4zEI9/XjS0zmH6NjuLFneyKOJboy6nAR
 30biqBkcCDcwRSdwz3rblDzw6owbpdYZxUboYoO9GHIyj5dVuQjFzAjzHiFkdkFGaxcDt0L4WRN
 CtiwYkABuWnHmKxGSJjA3SIIpUUgueywb2TnWFZv6aWDr7C0R6O+6shdzz/clmwNJgTlp3ZGnbh
 JrL4b4gZt7U63FlSWfUbk+9JlweUr2f919kNYuHiLeDyx/Woba3FEd5pHKG+5QhYfjyTZmojMFD
 muh+3CGApnjEwRQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

The return was over-indented; statements should start on a tab stop.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 8f3653c4a669..e0c91719b4d0 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -267,7 +267,7 @@ unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int
 		 * assume the maximum clock rate is absolute maximum we can
 		 * store over our type.
 		 */
-		 return UINT_MAX;
+		return UINT_MAX;
 
 	return le32_to_cpu(msg.rate);
 }

-- 
2.56.0

