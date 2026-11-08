Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172301;
	b=sDbtuaI/XNIbswXCRLiWRGzgwwyXCEIDPC8zEXvNpgDKYHd7xJs5DVxFG4Q+G13pM7XK
	 E3yPWzfNESK9N9IEXLteoUb0GPyynQHbQUvPr3Ri45qBurjBTK58uXl87s1K8Q8g91smP
	 gRTVmBDHfX6oTnIYW8e//s9lQfJN18Prh+2duRDewrxX1KZZBpVQaBn25wQedpJPboDEf
	 hNPAs7M/8tbNXOLD0nrf6f/3AU4MA388MdjItsvefD+aiIQ4g5Cyfi239Rxj2Lyaj7ymO
	 nAFr9spNxJSPeFPuUTONEwgOIX8PJ84jacvT/V2e1Ce4kiopw4X/PZPrYofoNkCAlkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/tM7Th5heSIu0EjehKmDLLPeUVpt5UbMkUrc5jBJaHc=;
	b=3RQ5o6T+8TmnM9MiqT9UoQEqEesz8VQ2kAyFMcFCyRA+9p3u0vU0J51O8sIDGyouDnZT
	 boRTjtyHWZuQllFaGOQVLRZu/C1SaIba5mBqRkeI9r9/gx0Qo8OjMXB0kP2eeqr4YQWtm
	 BqV6ferwA0+/dcnaJzFs5D/r7tQOl5RBRTUsBpQJB1ThTEXD22IMAI0Gw/Ky3yGzfJLU2
	 v5B3ohW0c4RLztDd4Sko3jqPwBFvHvuDy7/eatoG8p7KMdlzkeFF024FORquYfnLq+uMC
	 7If4Et+5KjI3vIz8qqpeM+yBK4iglr9yGisx1zHC5WgPL9W4aUNNybwcZOD8C5O1P9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbVzcdn9;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81799606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81799606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbVzcdn9
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6dde81a6820so160063eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172299; x=1794777099; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/tM7Th5heSIu0EjehKmDLLPeUVpt5UbMkUrc5jBJaHc=;
        b=kbVzcdn92NzR3ioHuL7Zysi4TmV2lBIZPG7EFR60AOfU6xCcTAn0sSs95LOm/VzAaK
         YUUB8F9dBl5v37jOk3MrVUCEk7zC44pjGveY41UTyGkM/hATte8flR6iArHQkwewiSi4
         MnG8lgJQxGUNHvgWBAq/xMTjmQ70j/mdhttDzzePGbSYrBtoO6bZgyVTh7hgaCeGpUc4
         erLDO6SM9w/dDpRRt6KmlW47VQhEDteFapTYVoBdBpTt3NXOwBOm4vuDPezjGQPBhQLZ
         YaTuCXtAIdf14dxGbDdeYe306hErmERh+W1KMDMD/RPTEpcCjhap59bzH9oKC/BoeGaw
         Y2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172299; x=1794777099;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/tM7Th5heSIu0EjehKmDLLPeUVpt5UbMkUrc5jBJaHc=;
        b=ptNiuvJrCEVFRsNxWGYsg5LzE6tDKy0L2RUvzoqIX7E1yXpEkIZJT0aGvXuzoQgFe0
         8X0Nfy2bvKGURxWI+nAeZsQwKrW5yHW911pBUTqWQt1KMVKUM9itl/MIkksWgak4dfFK
         Qr34wsMLpfMTifpSHf2z+fQG0qe1Jo7aPpg8xbm/YQwuUaOv7W1YUc15OTeNwx3o+zon
         RMnAkm0hxtjn+vkpPMHPyw5iEh5DNjNYqVNagvC8w8LBbRxKRYjgAFNFR57wcXqMahIK
         OkYRQUMOJEt7Jn5B1F7DUdBTpLSvyIsyIkozfE6OcEWIw63VnNGboLfCSPO3IKY72jQ/
         Imwg==
X-Forwarded-Encrypted: i=1; AL+hErGVjxy2IEYhIenMAKGCa/0ETTiwRMqzQhpk+V1A9+frgzJe0C9LWPyxyv/wz769KJ+D2e9gXAiGxwXZKgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m04eMr33BDrmqTScr46d0hnh9ebHo64vQya2gdZe2A4aCuJcU
	nm/8AibgJ6BdXloVCre5VrulH+PVyJbZcxEi4W2xxUpK6MguHJC7cVOhy7dD4w==
X-Gm-Gg: AYBFou2xZr5+/Eh9IzVbyGauZlj8xRILuLbc6DDeZ0nEF1uhEUnxdn2+VQHNP2+xZWA
	gJE07Q2FrDGYQKNIAUJmz+75OOHgjUotM4xCNE84VYftFf2uhyO+/XVlg/xdsypiGnlIaovbhmp
	nIJpclbnjQYj20lWA2CW9Q/6vorH/2eDzTU8YVKGJI+ak/0SU9LW1IKEFOAutm8EW1dr57RTB/A
	NQJ01D8CEDjWbrPn3CQTXoWw452hHOnaXM67UjW0FlPiRCV4V1q7aJC/MYVbsRyWUlny+irTGEF
	MNN01o+xqELW5Zbrw97TUyJCmcZ7Yxe/AXve4bNgD7xnYl5AeHlfLWVSpRwdDszgmqcEFfpwrpQ
	jBY/hx9aFGI56x2Jt3mtWNyt9eeJ+OElQMEIMq0M/V1xYfNcTSJ8ND8D94Ek46ral6i/iV/z8Cp
	Za44G3j51CuNO1FM+HoP7A27cOwI/nuIdOt5dowsNmf4CpqqONF9QpBmgK3VJ3/5kLzTak9vhT+
	ZCIGsW9h7x6mZJXRbnoGl5nZHP1cCH6iPnGbafH2BFVBdxU7vn9wZbjtjrMd7u4jDQral4pqf/H
	1COB07MJKupbwhdWlTH2KWfN2qctaIMhyl3CGd6paDPnxm6wMKCyVdYoEL4lxBTrSNcPw2UxfYC
	l1t+UlFkEhmagyNQsd32vwYBfkFjiE6s7sysk5Qyu8ae6xfBh5TxPNskc1V+F0WPDB/Q5Glhy4H
	+EbSPNsZd7IvPA1wD/Yafp2MUKDbLSX8cDIKelnC7ubmoJdqaed8c=
X-Received: by 2002:a05:6820:c2cc:20b0:716:d70f:1c1c with SMTP id 006d021491bc7-7170f30f0e9mr760112eaf.90.1794172299437;
        Sun, 08 Nov 2026 13:11:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f5e1e93sm1970733eaf.0.2026.11.08.13.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:11:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:11:37 -0700
Subject: [PATCH] mtd: leave the device type unset when naming fails
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
Message-Id: <20261108-submit-mtd-devname-retry-v1-v1-1-a67f332c54dd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMzQrCMBCEX6Xs2cUmBQ2+injIz9aukCibGJTSd
 zexhzl8w8y3QiZhynAZVhCqnPmZGqjDAH6x6U7IoTHoUZ+UGg3mt4tcMJaAgWqykVCoyBerwmk
 +e6cpmNFM0AwvoZk/f/v1tnO7P8iXruwLZzOhE5v80qtmPfbsr237ARH9KoSfAAAA
X-Change-ID: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

add_mtd_device() uses dev.type to reject a second registration of the
same MTD. It sets that field before dev_set_name(), but the failure path
for the name allocation leaves it set even though no device was
registered. Retrying registration then warns and fails with -EEXIST.

Set the type only after naming succeeds. The later registration error
paths already clear it before releasing the device.

Fixes: fa06052d637b ("mtd: Convert to dynamically allocated bdi infrastructure")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..4f62a13dc481 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -798,12 +798,12 @@ int add_mtd_device(struct mtd_info *mtd)
 	/* Caller should have set dev.parent to match the
 	 * physical device, if appropriate.
 	 */
-	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
 	mtd->dev.devt = MTD_DEVT(i);
 	error = dev_set_name(&mtd->dev, "mtd%d", i);
 	if (error)
 		goto fail_devname;
+	mtd->dev.type = &mtd_devtype;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

