Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821822;
	b=igOI9w3vJmMpH9x8mtCAorbSbqFNN9UdHM9iVtda4TanlYkFqFtSRKZe9cEkuKEzYulu
	 s3papjU2Nj5MY4tDKRS7Bk5DbOVgfcOBEDN3WmcDz/VuN8gEMg16lEZbavL+kppbzVOpP
	 YsxDASfbdJOaUjteS5OndJPrCWzuaEXnmKIP2J54LBTPW9sDza4Y79ldDYNbJGBfU1p7S
	 PO2ItwsTwK7jabC/1DIwHdnbyqqqmwE3J5y0K+GR1AQaF9a29zAUdq6ZYx6puGKayy2gX
	 KkBHJT7aq/4YWVr3Y2F92Ud7efYY+QBTzvnb4sQUuRaZvj8gyZy7e2Cyn/PhJiAJw0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=OT/io50s2GTf++6usH4VAdftnCA55S4d8sAF74Ec5zI=;
	b=3PvrHdxa26ZDKYOlfMp0s7noxScoQ7BR+QVa+tJfCo/rfkFP5G7zCcyY24tEtenj537b
	 VnCKJ9nuH+0GmNARWdtYvLQ4C3ddgBIt7km7m/+/kD9nMHsX90v3Lnm2/iq1c5rKuir/D
	 nVRyGvFIY4q103s6/sUQGibZ/SofNVGboDtDVcOcBypxtwTlirfTJU2PEpeF2RKZ+V8S8
	 YZLcAaQlD1Z3aHDFjCXC2MtLHp6mOCce/2cPps/BndSk3n/deLouWeQgme08SCfBuIm5F
	 WKWQ2BRGhfjtGnHrtIlEMF75h/OyjAcJx8BNcnFdmgDmkoV4lYml6+SyIKI7Ew8cTQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGHNw1OC;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DB606AC17
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898DB606AC17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGHNw1OC
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dde81a6820so710562eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821821; x=1794426621; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OT/io50s2GTf++6usH4VAdftnCA55S4d8sAF74Ec5zI=;
        b=bGHNw1OCkJP67JAUat0ugoirxrIwnORV+zMh8qw/ehxwkL7zFaV3h3/Pdto5xKTkpc
         QQIhjFOHJSCK1Wxqn5C7OkIsjbcySL1CCMA9fX1p2I5+TtNDsgeOIC171X6rWMtX+Cs1
         RiVGD0rasx0GLquN8O4dNoZ9xYlmDpKR25znSLWEGDM2cUctzkvvfa4dQcH3QVDOYB0n
         Xz449sJTLf8U8bOy/dgbqCQyKkzcwoHPHDMb6pMd8XNLrTrjoxZZX7Bv1Zx6QbRNFJoC
         zOFQpoix31ylJ9jDeEcoFaafFtL1gmQZ83gd7v1HYhSHSRDm2hm4PfctEFppx91/Qgzw
         CDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821821; x=1794426621;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OT/io50s2GTf++6usH4VAdftnCA55S4d8sAF74Ec5zI=;
        b=WuUYUPzMZL0iwQgXb1zNNCKLR649TLxxytborcj/7JUL4rBy2LIqeWH1PcgpumZ32r
         h0Fm3aMuJpWQ0+GXZQIuMw/6sXsi4aQv0qSpuM+r51375IGTXQ5nQqshf9sVGbP0Rftx
         UMGKESRJ/kvjx+sZT83JHb0K6bAM+VvgwKFIJEMpafWpHZOYJ3jCclNG0An6n4B/pAK/
         8F23FQYlZBeDVOChSUB20SZ9vJHVIJLmsI/v83h/XbKROEy6nEZF0QVoLSwLZF3oLR8D
         JVTIHpHWeTtLghDQqpVwd3v3IGrkzXMqObw/bAbczes0PAf945p726Vve0yehmOlZzs2
         MdWA==
X-Forwarded-Encrypted: i=1; AKwUvBzWn+QGBbu8bHsoRQCsxXUWExwqcUn6WyS3INYlfOLSGr2JhUWZdp5ZawHnilYZWma31wBEy3XvQ3MruCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xW1xPWXChhtmdzYdJkkcOYqPDN/WOUqE0R0uWBmmUMbTVk8q2
	dUH77UgupRUrWOquq/iC4NcZy13hs8TcUzJnqAvudPrsVad+ZLXepFYleTXP+QWq
X-Gm-Gg: AYBFou3WBxZc/O/OiCbFr3YGN+nN3tprDKlcbnyGoA/mRysFlTGSQbg2rbBl/uMlUIa
	FYqsqZQhwzvKvrfjxvYDm398aQpH30hvDuapxX+gSAa7qeatL/mnRl0WJuxhVBXJoZ2jL8YyHLE
	BYkgAkqqytyRbAVe1rWLkIyChIMQpdLNgunU0jMQkNm1uXtGAoV09al3qquR27IqbRT49BwMnKY
	QHXCn/VDKpeiBB1M+V4t4pY0Aqoq+dz+Jcrv7f6Ft9CWij1Pm3WpoVtvrZ+Dm5s6ubxe2wleliy
	nQPptt7fIB3KcSKWjv/XDw/q/47j5oiBgJzRXgGKcPBBoLg/MK5D7YMZ/K6KP1Qbd5kyJm+lrYR
	6GXHV+XL7X2NgzMWUyHgQAVwMB3/hg93036mgTCpd7++rUoqnUQSf87hMwtFLq09Z6eF1QYMC7/
	nUaJQMWTuI4qxjMpOVF1COD9X/GpiOYYjx0pYgAk5R5sS4C+yXm6mQZCj5xeoCLKhq5UDeYUiKM
	/1VpL7ek/3Rj4kKVZsKqMHDNw7cETUKvSXCQjGruOHZghn5PaSfdmhhYViBnRL32FtYPggRijrR
	EGCCK/MG1rPYy4ONVXAghNLX6kjgoIkW537EGiExnnj4lwrEVJH0IXxCJgwXPKtpJz0JTwOOrJy
	1DH6sU6q1r7bv3IsRycmUTGE3SiR3HwMgP1wFPjxiKGMkp3nJCpLcOAQAEycwwF/uNTGKAeaA+k
	Fv8amXL3touJy8APqp0WKhHnSL22TZo/zyCCwS2AeIWjNCbkjObog=
X-Received: by 2002:a05:6820:55c6:20b0:716:bf0b:f804 with SMTP id 006d021491bc7-716bf0bfc08mr1741495eaf.79.1793821821491;
        Wed, 04 Nov 2026 11:50:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c12eb1b9sm2504522eaf.10.2026.11.04.11.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:50:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:50:19 -0700
Subject: [PATCH] mtd: core: reject OOB transfers starting at the device end
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
Message-Id: <20261104-submit-mtd-oob-end-v1-v1-1-5cb8ad921cb0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gasiIu5iszCpokTwXZoqwji3
 a26fIv/D0gclRN8qgMib5o0+AJTV0C/0U+M6oqhbdremKbDtNpFMy7ZYQgW2TvcDErnqBcrJDR
 Caf+RRffnO3xfl3BmyvcMzvMC9n0lXXkAAAA=
X-Change-ID: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtd_check_oob_ops() permits offs == mtd->size when the data length is
zero. For an OOB-only request with a nonzero ooboffs, maxooblen then
underflows because there are no pages remaining. The wrapped value lets
the request pass the OOB length check.

The OOB ioctls can reach this case by encoding the OOB offset in the low
bits of start. On a partition ending before its master device, the
subsequent address translation allows the request to read or write OOB
in the page immediately following the partition.

Reject nonempty OOB transfers starting at or beyond the end of the MTD
device before calculating the remaining OOB capacity. Keep empty
requests and data-only operations unchanged.

Fixes: d82c36821684 ("mtd: Fix mtd_check_oob_ops()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..b82fd7ccd111 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1676,6 +1676,9 @@ static int mtd_check_oob_ops(struct mtd_info *mtd, loff_t offs,
 	if (ops->ooblen) {
 		size_t maxooblen;
 
+		if (offs >= mtd->size)
+			return -EINVAL;
+
 		if (ops->ooboffs >= mtd_oobavail(mtd, ops))
 			return -EINVAL;
 

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261104-submit-mtd-oob-end-v1-f4dc6fbfcfca

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

