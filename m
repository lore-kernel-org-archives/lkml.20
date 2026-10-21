Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616542;
	b=SeFA5eqLHrCw8Q2EO+7EEzcIBp60QcFDeLwsA7FZP3gygJkJlQ8H6nsPFSlL3WkgVLUg
	 pavLLKkKXpmeEnk/vrcD7kk+Nr1QWZoe00wtbKvXESIAinLJhFXgPChBq+t1QJLNVSZn6
	 nONwnP049pIqKUJxVkWCKDNPvH7Zx7uKmYjMhneHQCO+UNurs/+MFoPB6vCNEB+6CQVK0
	 zG589wQC2YWMFhDZ8bwIEq54Rk0SO3NPJOhKdw1mtrLnOm9/Qu4LPVUnvgOu9o1RO4Tsf
	 W0CCKCKVAlZfgzQEYDrWXwU0fFpyIItG1n2zNjVAyx+Obp2Vtbf7qDcy+j9PXY9GA1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
	b=mBWb5CuCOZuDpQqjiYix7q+ktCSBUBAJw+iJUXahpzbvdR6+5BcVppXJbf4JAgsTAn+L
	 RukGrs2YERPGsuPsGMAN/6LDlpzXxy6S6EWE0lYdV85WPd3Rqor2nTd92WJ1Ipwq83KqB
	 FqX8/G/R/zR5cocN3v/b8ZTnCec6gjYeMl8F5GbWbCZWvLsT/5AlH1OrZHnKp71NOpCir
	 cZke1xCbpkBlgs/MYIu5sakj7EgsbaoiQKu5XUVMp/WgSzzjRNqeaDNzzrSWza1EwVfRw
	 /rAdvOgPQzEWAhv+NrgNbpVbUCkitmifpH8zFKVde88AaulRmWV8exwFY2Pph4HWsCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGr9rruy;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F0E606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F0E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nGr9rruy
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b19e291cc6so939862eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616540; x=1793221340; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=nGr9rruy71G3na/fGIbhHloOneRMl5hpbXWRjZNowxE4fRXwHDVRJg2Ui9jX/hY6bC
         BIzxvyoMCjOia5FTqQGECBSZ7kVfwXQrz8ZWpN53whKYAPKuIYo4oTs40yVWcM9NvgsA
         5+DDb8brDY5rCtxqj9gtSAbkJNuSb1EmjJBLpnb4M4whRokTOttY6m1q6KEEMibRmnC6
         Ec5VCvGdTpVhd8TZRnhqcz8CASOc/NalYC6rxJ8c6d7DVwNOegc/7i2gwPimToHtyUXf
         Et4XPP+rvPaHK9xIBR5K92q1IoPATnV/Gm0R7ZbC474mfCcx++sZYslpW0EPc5QEWJnk
         OmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616540; x=1793221340;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DKdX40sfVlGrn1f1rpsI16luuxZgM7QgTjRWQCsXog=;
        b=XozpWDr8xhnG0lMK18u5KsZTaB7mV7nKzEASA7yIdy4FdwDdXbfaWaPrh2jk7cmZ+x
         f5lUqqa2+fqctJJahKL2WY/19lHdHqrUWD/AFdEBtw+vIP1PGYhFfrFDds5ZJVxm67sG
         H78E+hgj74Yt8hUUBCaz+8kMXYgoIy3qmoPQUae6DZtRfPzNVnT065c6bQTXcV/Womgx
         VHQ2+v6oEJ8IhzUStdv2XYhEmIwV0XR1DfmRIxjPjqaKl+d2As9jmP+1x6u74x8W+535
         Z0Ich9Kr8UcH3pHlvKeEQTH9hy0Qw8hVkn3eeaFef/6ESMVcnz0YOszpshYXwO2gC1y7
         Y1CQ==
X-Forwarded-Encrypted: i=1; AKwUvBy98wkPUAp9ZFQSXo1H1vyP0Mk5BfFmmQUu9aDnr2OLu9164VTFblZtaAq7SuZ9+ScXq8Y90TGd1DIwxaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5emF/0uA3AWYWokvAytqY+BEtygybrB+2uJxhNijkyP4UNP2u
	rNhbDpeqncmM2Qarb7t8El2gL9p4zEqNzDuEC9a0x1548OVA72MXUP2X
X-Gm-Gg: AYBFou1uXsvOD7oPzyK/nJtn20YY16PNhU1SSdBUS9LqA7/bv+y4w1a0KgYzREqG9Un
	+QakA6kDJ34RG003vfUU/1tLCCkTaldgNKd5Pm08/wrsDAZaQHgj53lcgD0fZhwD4csfTwuPFq+
	qoKix7y/iikjBsi4zJn9jLuLyKfQRXRX6x4bPv+5I1RbE13XE0T6bWe4lCGSElcQLSjhtR9tRG2
	jr/I8laqKTVY/ZNQzi8IoF3Tp1fEKPdXbudM57lSBx+IuGD5C1qRyUuB7lkDdGgUS0Tu0r7lalf
	ruYyanqA+vhuC6oN9BqXhxfCmVLBERiEfQwwDgCYgJ1GAG1KSnOOyylSRTf1GF+wmAFvu4ed8J8
	iqBVFRk33F4Zv7fOejt/6tMzn+M8SLFNMiYbDxWYdQVtPM2lQun+7QetsJqZpPNXSIE9Wi9N3Q0
	KFb43aAgYcmUw/TO9UkGQJ77ak2vXeiSU0OWMa+T1ouIrStPaCUneeuFcGI4LltRhQNIVh6R63w
	XAcs/lbPfQ7LeV+5MrywbHlswn9U7PnxH1X5vQnh9E+UsvxLnDNu5sNFsqH+I4Iyt0UYApblSZB
	So5j6FnHSdcnhZtBNDph/Nv1Zeka4v22whbQzEWzBk9rU9Blib+NWSgoVvibzXg7YHyni4BIDRz
	cyzI2zorybUtD6zizO3w85vwFwA08baXU/A9m9YVWDSXUec8JKqhe9eoW9nN0XQvG1eosOjAcZ6
	jAugo=
X-Received: by 2002:a05:6820:83c4:20b0:70a:6888:2274 with SMTP id 006d021491bc7-70a68883cb7mr438594eaf.45.1792616540307;
        Wed, 21 Oct 2026 14:02:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61ce790sm2885699fac.11.2026.10.21.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:02:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:02:13 -0600
Subject: [PATCH] dmaengine: sun6i: use the channel pause enable bit
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
Message-Id: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wqDMBBEf0X2uUtNChr6K6UPuWx1C24lUSmI/
 95NfRrOMHN2KJSZCtybHTJtXPgjCubSQBy9DISclMG2tjOtNVjWMPGiIR1jmjzOfi2EQbvNYGd
 cNPHm+j45UMec6cXfv//xPFkFb4pLldZF8PWdvcSxVmokGVjoev6O4wcRv+NjowAAAA==
X-Change-ID: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The channel pause register uses bit 0 to suspend DMA requests. Bit 1 is
reserved, but sun6i_dma_pause() writes only that bit and returns success.
An active peripheral transfer can therefore continue while its client
expects it to be paused, for example while the 8250 driver reads RX
residue and copies a partially filled receive buffer.

Use bit 0, as specified by the H616 DMA channel pause register.
This fixes the pause request itself; it does not add paused-state
reporting or change the handling of transactions already on the bus.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 7704b016aed8..204b0b812431 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -60,7 +60,7 @@
 #define DMA_CHAN_ENABLE_STOP		0
 
 #define DMA_CHAN_PAUSE		0x04
-#define DMA_CHAN_PAUSE_PAUSE		BIT(1)
+#define DMA_CHAN_PAUSE_PAUSE		BIT(0)
 #define DMA_CHAN_PAUSE_RESUME		0
 
 #define DMA_CHAN_LLI_ADDR	0x08

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

