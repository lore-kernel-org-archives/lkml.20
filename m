Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171921;
	b=o1yMeozlwgCXKvpcHnCM/CntXMENk0aIFMnqaSqYgUZeHM5l2TyM00W2W2QgRan65mmq
	 RbV+0mJEXz2JAi578IeMc/Ez6Wi8RcX1vxiXLwUVxlyQipa/pUO1FrqQTgGRxW0vClzqJ
	 MM7AMs0rEm3E4V9LkHtcntNan8HU+uTKe0hDmSLbihcjKuA9zAEMUtEkB9D0ET8/Y86KD
	 2Tp+IEjBIGF5CGvSidjgUlWwmfuHaDizzhQ7iUXWT2EtkwXgclAqoS4qsXh9mJWit+Z2E
	 vcE3FqRVhIQy3UnWzThxsaAcA8kd2z/Ivl0m8svbq+Ksx6+CmCyra34wfQ664r7e38g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=VOXdJqtU61quagom20vbQEtOrGbaqfLbHDdzOijlTys=;
	b=q5+crxbzGbPheU/E73zy90bHSmm9YoYUm1Zz6Z7rnZlmb4PtpZWKQ7zYiX36sIGE1xGF
	 Tdzo0m3VrKAh2qWmJM12vDrUmTfOi+mK++llisG6XeCyCcMqGAqaYOannn0uh+iIkVfPh
	 MIh90zKBGcAMmjko7N83nyhEvzc+SOiqS+SHDkLv4zCzYXjZAxf108iKpRb9sKqzxwm5H
	 gHlw/tXIbAQI3LeZ4Iq6jsZbSnysMnYWqBDO99oNk9ZRLeGi8Fi/Y68XgiXMwGLtysOGm
	 gNb7jBf+ci0aprEJjYT9rR8Gcdgqgef7r+aprEI1gh4xKyOCYVjuBn9IxLCdlUQo0Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOFI0uKb;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE671606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE671606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yOFI0uKb
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-85c1135c286so176607a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171919; x=1794776719; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VOXdJqtU61quagom20vbQEtOrGbaqfLbHDdzOijlTys=;
        b=yOFI0uKbuBmma6KiWoraFZ1FPpVDQQwjeHcK1XBmdzpnMHa2Wctu7hc4DtqvVC12v9
         VHeXeFmd1SC1JMpQ5EFZSjHY3Zz26OZq44MsJVXjKudCzuwAN5zqYEOLmHSpGw++caWf
         cxgLdq4Bjs26RdZDH6rZjidh48Ru/hE0ylT7pvaSRLQK00qXPTAe0aL+xNKIe+4srpob
         V2tk7QJMqnunh59Ozjr8P659aOc9V62u87s3Of6QPvDGOpPUYXREcTldxpITofPQfpLy
         BhKjrgOlSoGNj25iLokE36HUnwpjMUH0F23/S8j0ddiuUUvXqX91qW7EsUK791hvQRrc
         Adpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171919; x=1794776719;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VOXdJqtU61quagom20vbQEtOrGbaqfLbHDdzOijlTys=;
        b=QmOMKHKLZuve5o0zqRwjbSYmbdKds7uvfx5em614lCOCdtamLLnRTRc/YuQasXtP94
         V5VfqKc/hRsuWkd1SKrOb8lKhlqJhpm39Ls0Tonb/pA0Bfnkh4XZNm3aeTH3x7X/tV9X
         qvWDJuLYcePrTao8QWcLYJ2CfdJpevnsUuprCMAbzbq5V0K3WHIk3Qtn/KgL07Gybvf0
         Yy7NT5a4ziqePTZU+kaoFqAdYhmJnUf4jmaNpaQQn6q9SB5JVu9DFnHeMwODqFDRn66v
         0ZgkPQduk6jASzCukTzmtz3OGyrc37h8WRH1Da+zUZLmU810MjUMGSzh2ndxtuTpTNql
         Rthw==
X-Forwarded-Encrypted: i=1; AL+hErERzSfJqJYGkJ6sloolcYpMAdhmEd28YMb+C0arDQgNf1qldPHmlBcUSHT34a+hqxThncTGobo60ebwIw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BmftCMM5FNimoaDujaPH7PhYxqrA/maW4vz2hKz4URjHeNddR
	hT1aQpPwFD7sI3S389QmXXZkWF69M1IocErs/ZceVSCeXWZPj0zNWbCUBVFegw==
X-Gm-Gg: AYBFou2vDtByzJ7y2A7FiadN0tArn3lhnAL3jHdz7CmzKnrkIUMLkcA7kYoOiI2kZIC
	v9YttwfL3aVQNYnRfKlPCDQMZD2qNAQMvNUBPbNIRwO0+JHhoB/sx73T97eJ9ptiOT8MSgYeYUV
	oLyL8cili5meADT8gFjbc3POeoQcfX1v4E/qaMlsDvCGi6maJbykwSwnWyBNBezUPmyqmXYqo3n
	PtaDM7bW9FZltF07pkv/My5eeKwJmgyB2bjxCQcFA80VUzcxwA2mIdPHgC5amnk26+to3uLUqyv
	YeLooSMWyD8zQ95aHR70TQcYwDkxXB4PHlJEx3a3AeMywiS0hn3PXhWRZNfHGCZKygbH0hxXQW/
	QBwSYSc4B07+/MsQWcV9rytNMZqUfJWD6alDLH317Ul65WgGqRNS+OjiNQkz7DkPgobwG/LsAxF
	UEaQNkNNYrH294BztWWzeJ0hU7OwpE+gjqGluw6nLReYC8VhYn3WIsnPy3p7+849jTOix53aWNV
	s8SQQl/eqkyhtXrDTxBOFVAXzp60Dhi5rmIQhzuEzctI20D52GpCyKI27ovs9aSXpjPoWSK1Iu4
	reCRl7scH/N/mIdogbsycBHaIjohZL5FcJwFtwjTr94wfuGQEsTmnZDqds3a9tl6nTuaSSYt8uW
	6QnfIddEvnGW6DoGqZVLwplBNLYTM7tdpCGjkZn5dMyHgKY2FxOr3ziC1I9PULCDNVIarMWHzRW
	m62Q5JvhLE+ZLpU+DMOmPJ5SSLpyyqspnCQj6HjxHREdyu7HDHmi0Z
X-Received: by 2002:a05:6830:91a:b0:85c:4897:f2ff with SMTP id 46e09a7af769-85f5084cce8mr2349585a34.25.1794171919700;
        Sun, 08 Nov 2026 13:05:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fbd820csm2226208a34.23.2026.11.08.13.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:05:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:05:17 -0700
Subject: [PATCH] mtd: rawnand: intel: disable NAND when probe fails after
 scanning
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
Message-Id: <20261108-submit-intel-nand-probe-disable-v1-v1-1-eb0471429e09@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN3QrCMAyG4VsZOTasHTrBWxEP+hNdZMtGU8dg7
 N5t9fD9CE92UEpMCrdmh0QrK89Swp4aCIOTFyHH0tCZrrfWXFE/fuKMLJlGFCcRlzR7wsjq/Ei
 4WjS9ucRozi70AQq0JHry9ntyf/y7KG8Kucr1wjsl9MlJGOo05dhWuhXaMhzHFziLSe2mAAAA
X-Change-ID: 20261107-submit-intel-nand-probe-disable-v1-0605dd04ac6c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Operations issued by nand_scan() enable NAND mode in EBU_NAND_CON through
ebu_select_chip(). A failed scan or MTD registration releases the DMA
channels and other probe resources without clearing that enable bit.

Disable NAND mode on both error paths, as the removal path already does.
Keep failures before scanning on their existing cleanup path.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..97c82e9c1af2 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -690,7 +690,7 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	/* Scan to find existence of the device */
 	ret = nand_scan(&ebu_host->chip, 1);
 	if (ret)
-		goto err_cleanup_dma;
+		goto err_disable_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
@@ -700,6 +700,8 @@ static int ebu_nand_probe(struct platform_device *pdev)
 
 err_clean_nand:
 	nand_cleanup(&ebu_host->chip);
+err_disable_nand:
+	ebu_nand_disable(&ebu_host->chip);
 err_cleanup_dma:
 	ebu_dma_cleanup(ebu_host);
 err_of_node_put:

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-intel-nand-probe-disable-v1-0605dd04ac6c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

