Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329284;
	b=P60HbT8IlaW2XT/KVuuDjVz4FNXDdHOd2KcGKbaGVLOhFO8jezdbw6kG4vHfSHcBg/0N
	 vkKhYcOMVhtISx2sMP2MC1jYE0imkFblwbcDQRSbCdxpsJ+O6Z/OZ1aIVZ7JaxnN+L0rb
	 aCqsabURT+lsQZpQT5rKC+D75xkmw0u0GrfIJLHZ9rg5ubABU9foEPXm5XDgec0HAbCFK
	 J1cgxoOZh8PsqluDL2b3SJ/sVx0yotcvBWxoxBW2VRe1e3PpjcOqW5Vdvd0AtKe+MHDSX
	 w3x+Lsj/K1xR4iaHcGAA6aqD2k2ReI3zIr0xUBkTrZCG/71AY+xwgHsmc84sQ4LNfIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mahm02DJyuRv3Ysr2SDFTlFeGc04ROwevypZNTuvRVk=;
	b=Qb+2p8BtvzpH8RuKbH3xAgU/LN1ctO5FbWVWS5FvkIyf74hAI+IjTGSoBp07FzLnM8aU
	 lhZG5OdtD9NPXLEKRAGTNKJRoRIBvbzz15+jGAB05T4Dt5MzTFXEdCt7G4xTWm5ex7sJK
	 CvV0DXoOP7fcINxxYCGq1sjcksljDB7+Es0g2Afi/zgwqnWOu5hXPekRUfH4yQVJYiX2q
	 KEdMPPzi8MXYEwsBjhqDKGyE6x5XodGuJkuMOM9Vr0XBzeQQZ+95bTuaY2+UEurLy2JQM
	 P5triwdxDGKu2oLKWyWXQuXRd5wo4utoQ9a/vvPD10L8pLItVCQBRvnjaVt2ksPtl3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vvZl9mrR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D03C606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D03C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vvZl9mrR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso18975055e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329283; x=1794934083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mahm02DJyuRv3Ysr2SDFTlFeGc04ROwevypZNTuvRVk=;
        b=vvZl9mrRteT5g2Hb7I+JjCcUwBGDVQme7eGGzrPzM3WYb1McKDVNy2XaHVWmu3Ni/t
         SfHMc5Yp3DYeWF09W2iWZ1PxavgBKyN+NuExocyFqgJ7JCRXvnOvqwxvRviYWaOnOdSd
         Vi293Unhk02EEHTS3wpA3EhftWFd6ClAGldk9cWHLQh65LSJbo8GSal8y3SOlFXa+CNP
         eIzqe1XnArEGkCg9B7yqUUeIXmpyy+rCypcsSl4aVmYbygE2PfcWsTlNLIpfvXSGFAnY
         LTxPny+8vCg8J1lCYCeLidoJMIDRy+267of6baOOlqDDwHjx9B46rhcSOuxxT3/abkRO
         QlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329283; x=1794934083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mahm02DJyuRv3Ysr2SDFTlFeGc04ROwevypZNTuvRVk=;
        b=DQIRzpaWrPoYukjwgjclDNusjcg2yOA0dlsFI++UlvpG9CKfJMmnTtFfiQJdMDvsMF
         nAvaUaE5WM5BKSaaePJncuwxJlKT37mEsXURsT/RrOu5d1aXX/qWTSOPi3EOGHsn1LNd
         CMP29et5vNn/hWj22coDmMzvav061DCZ7kIzsNLQ+ErBRyB7ilkT4DHt/nQdUJ7Hht9B
         ayBH1dO1EFFeHm+5ItU6btqkeM7jZtcHXm7odm8L4nIcti8+u1zO5aMu0kagcglro4nv
         vy9fXhZz9zxZe0wB8DTiAeqOmfRzMbJAMM2cgOzK3tINZGEs3sS1Ft5FXGldgVDLer0Y
         +1ig==
X-Forwarded-Encrypted: i=1; AL+hErFlZW3ybWPbovr/3RSGc75yx+PN3fi/mfrigV6kF21TxodPOFTNx2lIFdLtjRpkEAhiaLAM8yJGl6suxy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rVRQjdA1nq179ZufsS5PiMe6oA9j94hVkk5ZgJcNEX2k8s4Be
	HrZ11QrCJuelP+kL4FDznhyA7uYcNssM1fz0U6aQEGHli2XbzL7ZLirg
X-Gm-Gg: AYBFou3KWpLFHEWNPUseBKHUmBBovjEgH7onBP8t+LSyTB0qG62e2xIiHhWTo9fxLpH
	luhuDvAZtJupS+SXsW1UXDCOkqNpKiklJdyL+AImmImKee6OUmHKR6udJnDAqAa0VqrIlw/aDjC
	yF6luD01iNA2/8jJVJFAMFmVRpK/9LUaDNNfcOZsxh4Cm51rHpiUUw3409x5GqxwHNm+D2i+/46
	7J7vr8fok2jGKfxxSm9+gqGunwHcqOD7JbQffeSztQmm9ZqFKF06oJl+OLV4NaLO9wxLkor2btf
	4fdmNsoXOHoa3zzhNwz2bQnv4pXxYyPn9V4kVk+7CmUFY6PJyPlf8yhCgJRTa/nVxCPe/GmQTbD
	AW9NL6eUAw3W0OMWA2BausGQykJak/3VCi7lVkHcMC9tFJEpdBfMB1Nd2lq0O7zxSrdxyzUA6cf
	7xxClKGRFr+sGS1alSZsnpbbAv6cVAnwdSqp/eVtHvHHdRIjntP7vbZJe+RzNV7Zfw5eyYbOhP2
	OPB/824TRb9QSmQjySeCJ7LmBXQbqj4y6EEGptDhjg/PVOeetzzaZR8b2Kx8Ni3qXcPJrBh4H7J
	fb3yRKnEOZGJzDbWDm6sRKopxBgbvHA4m7cQfX/TljGXFsuP0A8PsrmQguglAvw3x2oaS4yTl5h
	nvxMqfWCyZTdtkcQ=
X-Received: by 2002:a05:600c:c166:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ba0234e9ebmr54275785e9.27.1794329282950;
        Tue, 10 Nov 2026 08:48:02 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:02 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:47 +0100
Subject: [PATCH v3 1/5] firmware: raspberrypi: Add blank line after
 declaration in response_callback
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
Message-Id: <20261110-fix-raspberrypi-firmware-v3-1-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=696;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=5xn/m74GBcjNDWR0uXws/+MR55rEUDRNu7O7ky4ZQB8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80q/phpJnezQN84UJe9nipq2vbL5zuhJAGrUJ
 8GBmGdMGciJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKvwAKCRB4zXhFDAXI
 Z36oD/4rIr5DxiIZE/2sXkkSoXSKCCvnahjHSJ0siOs6fL/qv4vHBJIp1D1qKxaE5qg3lgMubpn
 8qVTZmSYCORqTdz62aSr74lcBOs0GkCuVnzCQYEXufazM7giUYyTLuz3wzeiaRuAYL8cHoydDyP
 G/R5jla5NxrAjA1fYSWMKFbJjs9E8pEHb8SO1p1fRr28Ttqw5xLJwm1SLdRFrFvHuG2xvyj/iLC
 SFT08h3cJMJ3H39Y6juBS1TzE2Uw3yyxizOe/aJvE1GkmRvWnMO58XXVLdlZCqfo7hPrTg4JdCy
 2l60lTy7NRoYCfb32nPOC/haFwFOHbHevP9ECXwqy+Dqvc2VYaxvtPvEb8FIBvgjErbqmNXR/u2
 g+KZUp55jlpcJ29FWc3d+whufeEMNo+78Cunmq9y4sLdbV2nA6FO/HeI2g6WTB+WdxFSVNUnvQs
 qx3F55xuuPwaGqnu9trf5qDEEPELe9G6dp69Uv/gaEbRtcZ9yB5le4lEDmEoyWJ/aUPGuueAtv0
 DB0qmQZCD+Z+nAwpW4SsF2Y56xz0s5vcX5UioFRqykVeNZP7EZvPTXaABRWkMrih9Wu+tnqtjdK
 4BziUzdFUT8CYGm8+9/OHngb1pMtQBweqLibgDAnPDu7ppAtFzPWRcIcaZ8g0qiCt9aFv+X8RR9
 QRPaAJrexib22hQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add a blank line after the local variable declaration.

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 443459c8c90f..8f3653c4a669 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -40,6 +40,7 @@ static DEFINE_MUTEX(transaction_lock);
 static void response_callback(struct mbox_client *cl, void *msg)
 {
 	struct rpi_firmware *fw = container_of(cl, struct rpi_firmware, cl);
+
 	complete(&fw->c);
 }
 

-- 
2.56.0

