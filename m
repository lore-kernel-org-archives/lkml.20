Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075739;
	b=CsSiXSCiYUTJIyaVPC01FYane0f/cLeRXLOXputc7Cg4HLgFpi/SA6FyJVBeOEZHZKV7
	 e5M9Rtji9wYN4AUrsmHQ5dcRVgjkZc9ZdnQVbxsFmkF4L/F2oZJXIGpQ6KiUjW11GlVms
	 6SYSIBrjWMGYTeQ6C9hm6+5j0iRMwFa5E7E3dJo9DwFb4XNpqN4wMI0mzvU1BIGjNozjN
	 im0XgroHrFI6jHXDUOUzmxLGMIiMWdM55bE/UmI0z5rfitsefn0v+trrmTyNW3P7YDUow
	 UCdEDH3Grf2ULsPH0uB2FDUlOqhpRmgtbEH/AuqL929GJTTjnL1KkWy/0Y/+pmYeVIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
	b=FZG7ZtIZZ0CaEVuZreDiNS9SKjqUjbYpvD2N3tqND+kD2fjs12BIG1n2oT3iDcqpAwj/
	 WUIVSWHVOCDPv8HLkNUaFxurhNjdMCSFIV6licvTe4yqYuytKhO+gXWHGdY5pRoDwAjJu
	 qhnlkIN3Py9qbYlPx8gLs3zuu5eu2njIuFoSLgQ0wCOezke/PgcumANNekHWc16OV+m4s
	 T/D7yYszgJsy0Dw32G3FAE386agvSfFHaEePNR6anteACDiulGD5tLWVKbBhjBXU+HaXP
	 E756Z7+Wgf3CFfn3ub5KPOGqVGS5T5s+SnpNxItwhFTFSE+JZ5iXnTHLg/8/GUY49Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIomP3o2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0548606D80E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0548606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rIomP3o2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so15419795e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075737; x=1794680537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=rIomP3o29GXVzbDK589kzLBQbPuooMxPFZaRigOgOuX2MR63eMLVz2NyXxlgVEgbkB
         8VikXcKaw0kzbMXQi+oB6xnfPrmrqHpCl4DC/VxvWIEiWIuB6xEf7NbfDHv2pdpqehwW
         GjOUfQiyB7Mf39UuXqZkz5XTyUGBV87fMNmQEV0xN4gwCSq0ZOxj60rFxMVARA+OXlAj
         e3pmVwGRatWNxUA9nL6rE0KzgYKmPxXlLh0nJI9JvMPvTABnOq4jA7vENBfDDnc3TtDu
         OVOVX2c11kjTt+QrReEqKeJu7IWT3xmDFqo8WVvRnQT1umxqVO/5h7WH+k5/51sjuqzG
         XD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075737; x=1794680537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UMDkxpgyre+waMfCtjfzdU/2CLXXfR7MyacRoArghZk=;
        b=vp+c3F9hQMe9VT/QHwtVqphg8zwoTax2nf1m6wYA4hGijBeLzL/onk/7gTEr63ZTMQ
         ONwwX/ilXYb6d7LD0KV5OR74xF8K1YqNqEloGDCkz8RhhGlJGRTcZoRqcJeL6LFkh7q9
         PirrH93E91Ohzap/xMSFJivCOGCrho5K5moR4lHCnoIkTg6tE2aGMX/qqWxQZGn1RNsM
         ye7SxCE6OEXzq5EGesZkEPFA0q68Bok8v4wMuA7l3v3gIJFxmKKwkuFE+8jpExfxqdhh
         mtWh6B2Ubq4AJe6LDaZ6HjFFf7uq6uDnGXwWGLOKgnaiUa8QOEYWHAEH3QjpWqN8+nZ0
         g5mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxegbbLPJpdx1UeNoW03Bq7foicwuOtMGCOyJX8WeLgAPtgcmWgJfdwdGWpW5Tqp5vql9B19yISI6XYCvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wCRZUUBanylMOO3Cb4BiXdDvtCBRu3KjomAR+AIASAxGE9f6x
	VorP5rmQVJy6QDnzsqPdzzfibAFwcIpknQpGaOcDUd7UNpaVqSZrduaL
X-Gm-Gg: AYBFou0NhlQOMyuHcVH2hRn0srHHsuDdQzasAlNBy4SgHLRkP43bWEhZmjAelsSSglR
	bBRKU929AEuym3Yof7JKVzicCDdD7WDQR7rqGYrySRMFX8QJL/tv3fCuqrWdj5iIL0O9soeUAWV
	mu8TNjtCsTDd09xBy13UY7Mnhbp60TPKbJUHJF7CoAGZ2+OeSzBjYoSRIJfn3eXPyWCg3hiDpQJ
	OJKrFoA42u4i/AWFAh5JGEidMb48p7kUlGcTNjKuC3ZXCVWbg9VNeMq2JlKxB4hmADjmfwz8bVp
	tHxoc2XZ5oDAdoP8IqIJJe1FfuC9mkI7IR9vOAR6xP+AOhfbhAuvisOTlqCvtt7Sue0NM5+71eI
	Muoi+lN8rUBtOo9rszQn3T6D2UdBaGfnTueyc8ux/oBxlHkFlitXQpiZ9j0Qui6sY5LSAbKyYoQ
	gb3jEy0gZTJdTJLAxwGPW0TZDgdDrH+MOIoGQvA7u9sXphpxIAk2YyiQuVUDL1wrU/9lCz6yBMP
	xni6PU/WK/aKnRw0/4A4rLmB5sbgAyke+raa9+ar8d5qQh2UXMuB73TdeVL0Ew/W9dro9Ic+XDh
	8afdJ4lKBHRL6VM2zp/LdGJlUJf3PmIEYHLVXJcl+rVyQ8Ldt5RA0ckto/SUPZcYLpxRycdWtGE
	LC5lrRZRjwU7R1OA=
X-Received: by 2002:a05:600c:c166:b0:4a1:e92b:ae4a with SMTP id 5b1f17b1804b1-4b6de1c6820mr102380285e9.21.1794075737248;
        Sat, 07 Nov 2026 10:22:17 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:16 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:34 +0100
Subject: [PATCH v2 4/6] firmware: raspberrypi: Remove unnecessary braces in
 transaction helper
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
Message-Id: <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=R8pNK8uv7/mdLr9QZyRKpk7qvj0fnfV1DdkNj860TPY=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVvy1kMsW3iud0rs8Tle7zpWX29u4KhUV91
 AKwCIIlrpyJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z7X0D/9VAqyxpg0/A0Pisn5PP89dvOX1GEAoFiqqyb+TJUHMa7CKi31bKq9olA1MpdWkUGcI21Q
 blhVoCgBYACvMYCbM3u1g4U/qRR9ZSaSRNx/TH3LHiCYOBKipc5YDJ3yLMSAidzs06w4ofj9eg+
 jmXCVOqWoQyceoVjxr3QA4+5niHrSjyAummOoFCPTnGP7+SY6Lh/FJqZeoecbJmR7BJGHjyzNFB
 dr9DlMRWEhIdqy13LUrn2Ywt/s+VFqp5YTdmMEpfez24j/DFhDtr1rvhyFkeyFIUsEsDP6PAX7j
 kG5QDsJzdhhp6Y1vqdsZMsgnnSjDZmBXHGL/uow6w32GphpgpTjnuyElj+8XZphk9L74Wuv4WJB
 LVbLhrew/UC26B6bkCB93UsIfOExJWmI1GAXRc4Jn6syGldSp2utjVHE/2hhmWJt6hrPX4jd36g
 Sg+S7ZZOAvN6YwBIGgpQaWe0FXCL8LWP0vaXlu2R+phifhmLoizX+xz6pmGLbrt7Zh2bjgnYUL6
 gjRHVI/LTkn+sawkcLauGKTpVK5N1iBlaqakZIVdGE+NVPz5oEmmATB6kk8QMPB1F953+A8nXUL
 S/MsFIWD6KQ7NgOOLc5Yk6RSlOQ0T9YeUtGIa5QcoE4VGI1EtLTsV8BBU2GjQ2v7sMUz042Hy3V
 KMy9e/9BYaPNPCQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Braces are not needed around the single-statement arms of the
wait_for_completion_timeout() check.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 04163c3f385d..d9a569a6dae7 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -60,11 +60,10 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
 	reinit_completion(&fw->c);
 	ret = mbox_send_message(fw->chan, &message);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&fw->c, HZ)) {
+		if (wait_for_completion_timeout(&fw->c, HZ))
 			ret = 0;
-		} else {
+		else
 			ret = -ETIMEDOUT;
-		}
 	} else {
 		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
 	}

-- 
2.56.0

