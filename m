Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069525;
	b=YJGTjkrt7gmoeCkGPCTYEv95MIYF1VQMgZHarvS4hKnrSf2sMFWWvfAq8fJGzrMZEJBE
	 boenY1DinbL+S9R80IwveZBOt4eRKjkhjEtfGDtuEozh3JMQPkjIlNCV7ExW3s9ZdQkfP
	 77iJ1os4I5B48yR5/RJqxHV1FwBfwAmQYjJa8LF1rIqNPjFMuIAglfFL1IAFDuPEyXVZk
	 EhC5Djto9a6M/g2BbXcuR62TSIwyaHeCpgbCcu63Q9etpX4UagX79Id3DI8blfSOiV12e
	 DZYGeLUOtzz/1jBYj+kQzeXidB94fLFGNfw+X4MmfPgxXG9QWg4KnoqowalzmE/h2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=oK1UqNMw8ALfTMiacdC8RCw5rD9bSMFu0hEhUP7jD78=;
	b=ESQA+WnK16aycDDW+YuMAqVRPUDtrUQzkUL6L0G1Dtv55+7AbD6iYw4MJxCIELHlkOPa
	 736ZowoxBI+yg/FT+Lt6jCziZyZ1S5JyUfpCL+iBbHly++WSfm//Za17GWNLaM0j/e5tx
	 PKMJfS0xfV8xfbjWMdbQPUAX9Bys0hfzKs8TOAV5c5bERUknfMFJxTJEr7nEnUboY5X/l
	 ZgwE09+4X9g4/hEK+b3TRdPVQcBtQmokl4uSSLXghdLYo/F5yRA80phWJo39e21zwMtXK
	 MAexifbRIboM5G/KA8VceBnDji6/KV0Xd5Yq/qTdfzy7qoYRlU4krWgJ40nWjzaPwcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lc/Wx/JL";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB990606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB990606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lc/Wx/JL
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10085775e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069523; x=1794674323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oK1UqNMw8ALfTMiacdC8RCw5rD9bSMFu0hEhUP7jD78=;
        b=lc/Wx/JL2LjUO1Tp8JHTV6ReYsTS30Y8i3xitF6jhPT+8SGWqCaaCj184u9Qc6PAgg
         hCghj3Bc82gNb/hvwk0s3uxQEkPsOP7CU8OLeEzeyu5wVsjckN4W15beouCD8npYMea1
         quYB4cKXzUwFdnCC/rVY2Mu6OblGdKgyou7qL+tE9SASV1Nftw48Zj2jvprb5KOZofW1
         QF89VpAAqaL8Av2uA0uVYKlKeYgcnkya09Xs3VxKbf8Ic0OHdRh36VAtMvKkY4d46MZu
         1PqXE0QTHX3wzLybpzyI8IMOuvXy/xHwZsfHulHmTmKPbUWmF/oZknYZUwZK3TpoR/4n
         m8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069523; x=1794674323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oK1UqNMw8ALfTMiacdC8RCw5rD9bSMFu0hEhUP7jD78=;
        b=s0Qbr16Bu1I3yy4IL2XVaV3+T4kr6LNlw7mKd8XVeTepuNWMZO0iEC5ESO1Q/YsNkx
         glDCZZJ+JNbJxlwhXpgOiuo19Bc/P9w3o9zlIdhQXMkOUxKkabJGLiWzpnIPo+hAzpvP
         +In7xsG61KdcPlHQ2wzkwKbvQw7iglZuW21gkc8dzRa2lkaQpxR/d2Xy1RwIHf/il12Y
         78c2MyX38o/UKgJjKIuuPYfjS1iURTq87mMDzIynL/L3FqMNKYbdNzdILaVxWO/lJM9Q
         tmhKnEaP1sd8zUxqZ1yk53TllvNd2mDJ0pXnM+u261a8m9rwRzbPESzawKJxsBtEALOx
         qXew==
X-Forwarded-Encrypted: i=1; AKwUvBwKo7xU6+uuFODUPvvZDcDbPdZ5WWcebhI844catxrtDxblZHgQy6yh+Hnmkwaoio2B06AW2sk43iIOiAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eKn8mU7C5MsdNmZzH6oAoyvoJYsTUWvAFivPF1ZWQ3p7kysrY
	5w8iSm6fWQe7PGh03ISXGi1OAGL0NhWmyL3zIj27VgSzeQUIMy1L5JHH
X-Gm-Gg: AYBFou0Iv98KykwSGEGBd8sc2MLZua4CnHcwIHieG2IwV3vNcnOfCFyF9HwlHh9OYs3
	iDWqXpF/4a+0etxf0KudfUjpeTPzdoOvi3M4N5/dCCzHf2wxVGANCCEkKdyYvMAOBjJzmSSPFmE
	GYY45PeV/+tcRS7uhC8diMmg+wK74Orj4vJX28qw1kyLVYMei6LfFlhVQUGzjaxQFpwzgdNArAK
	niqD0FGMMQMCtPvtIwcKPHt6q81b4vikrlz+zB7kmLnerfg2WdDPBMWlHu2KpLcXBmjBjleaePs
	90UXhY0suhZqTv9oJ+fEwOeryJTVpHgTusGVUa9yT6II0hKN9othqq/nueW8gNT6IJZ+lKjozo8
	HWz148lWNbMKL+ByQA4mLC3eOSBUAmO2SDIJ/CXMfCrWlTmDaKpHp3ek1m/NDpRHgycIUqctRZQ
	DneiDFeTiSSApxSgtEji5PyT3mrwpfsrJkjeYbmFatUU/pcuNXoToLwZwQ9JtepLYsWerV4Ut7w
	KkTlJVQt1NK3qXCapDwKrFsgJxj3A91NA9Okui/gBJUaMAqV/bsWZRlY+SOG8hcqtQhT0AOvyuG
	QlU3gHSUvhsitB87/7opXBjkDkNfxafGRW1sbrYDr2hdx8bG+3xtHpydmS8wxvFpWPkSSMQEJl8
	ND1CxNeQ6Bm7EKJ8=
X-Received: by 2002:a05:600c:8b76:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4b6df6df28emr105183555e9.20.1794069522860;
        Sat, 07 Nov 2026 08:38:42 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:42 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH 0/6] firmware: raspberrypi: Style cleanups and registration
 error handling
Date: Sat, 07 Nov 2026 17:38:04 +0100
Message-Id: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AEjDSXEVcRJ20s1DDBFqLe
 PdC3wHehSam0pDogslbmx47EvmOsLzy/hTWFYkQXIjeu4GLnmy51VnMvlW5qG2fbMKzPJbowhq
 HvkdHqCZFz389Tvf9AxiWk7NqAAAA
X-Change-ID: 20261107-fix-raspberrypi-firmware-be9c602d6755
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=DQ28gjc1y4PVvUnOLYS9GDNE2byLHmuFa3IBNYA0Ozo=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRw3b/PSC6KrLEuMlv5lgLTraBLSCea0Iod
 +Q5z+ITI7+JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z/SaD/0cmIY65hp/lDLARQaP/py3EitXBfcrHXgsqO4XPYw5kvSdW0LSo4gIPjsfFgsabkLyA+w
 BgmSx/7rlkii1FmwWqn2kTDk3SRNl7edCGCQJEVQTZee6f+ViTQ9YedwTDA2AIyTx3ssZ5/C0+K
 HpXyyw6+BTDHMhRsoPmrdDLPkJ3eBfO/4zO+NJCDhpFZ20u709Zj582NUypAxBYnZ/owdY5gNvm
 vveypgCSoY89MOBTC/QVzTpu282iySXEag76ddow2PTF1KaGGnV3jfiv8dhvvXL7KBHRprUzWy2
 fAtGcXlGIGiRQeDjZDWRZUeyIHkh42jQ2gElXY8UaYtH2j69X3LIbgN/5flxcK8c5mEHTM4R8Ft
 FWkOmhlWZR3WH+rFQuRH4dvZ+wjP4VoqVdShXwgNrmgXW1OMFnGGZkqknYRSUNXjrrliVScFvWP
 G+hnzBAFIfskMV8m8BfavLhzLcP5haszsXDFj857pgFfCwYlAdgx1FA/ocOMIALDRobY6vtys5W
 8/vWVhCeCBvxjwchFAtEPbkv7+3+/WxEL+Ll2Rs1OjgPBDa4QZ4+sr7NuhVHpzTfXuY7ChUPASF
 TdmVyuSfyMYgvS7qSDdsBI5QuJeGE9ow1/t7XyVp1orIUkPQL0qqY8IQXjhHfHAo2EgSFHp8OJ8
 aMTVIWTkAR77fpA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

This series does minor style cleanups in the Raspberry Pi firmware
driver and fixes error handling when registering the hwmon and clock
platform devices.

The first five patches address checkpatch warnings (missing blank lines
after declarations, incorrect indentation, unnecessary braces, and
undocumented memory barriers).

The final patch checks the return value of
platform_device_register_data() so that an error pointer is no longer
stored in the global rpi_hwmon / rpi_clk variables.

---
Sander Speetjens (6):
      firmware: raspberrypi: Add blank line after declaration in response_callback
      firmware: raspberrypi: Fix indentation of return statement
      firmware: raspberrypi: Add blank line after declaration in probe error path
      firmware: raspberrypi: Remove unnecessary braces in transaction helper
      firmware: raspberrypi: Document memory barriers in property list path
      firmware: raspberrypi: Handle device registration errors

 drivers/firmware/raspberrypi.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

