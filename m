Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810618;
	b=zZcVjajO4SVYBQWW+97DxIqcO5iUqLh1rN0S9nS9/RO0y7sIRl5QL5vtNS9Xc2xSX/8x
	 fVEMu3ypjTatzOfCbK0IA4vzem2m9GZroM5lUFHHv3o3LKN0Qy4l4cI3TAh+gUl7ge5f+
	 nZegZagDQtAAd/ns2pRjeRwahWgI8pnLFCOxDtvMZBA8j7YpkqrdmjbpHB5hm8QtAZS/3
	 yBnDL+WsHeFkGgtTd4IBQk7V86Zm0Bn8z58xQNYdLRHdkuYOpnpXAnzTnqi/YdjwgHfsi
	 JOnL4juiZuiXLw12BDo8qrlfxAtTUGlJ4QC4cmcnUS4qY2Tr9XRUpqEXEMPo33/x+qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
	b=h+Hmu2+OZX2vA7OOGiUO7QkwHqcMA3/5SEqRB9mZcJzcZB65glqw2gh0/YM6f19+PeYx
	 +6ofpjT2Kdzbk3kk0dUzHBZUJG8zteK1U08pR/khI2eAsp5E2eS/6U/inslNqq33MVKfd
	 MTAu+2RYjgFhJaFPr8I1k4RJjEmSWKVSruFYfIfMxYXanhCjEE8JdOKlP7SmSfPv9yZ42
	 GHncKQ+kvS1MuBEna+cZ1ZZ6Dn3/tP+ntwOoAm96m1iCVFreGbJWdV6Clg70pkaC3ng/E
	 WWQy/A6Oq+8DN9Q9KECS8A4u4YhiehfffQR8eflAvHoh372pKpGu9J++CvNkvExa7zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZtbUcYF;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5CB60A2638
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5CB60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZtbUcYF
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71ab5e64742so2622385eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810617; x=1795415417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=cZtbUcYFi/lJRRZgT0R5pW6jwCzps8N78rL3FBt0dMExqRiJEvpFRi4Aff/E1DGlXI
         YqEkfKOt7o8xxLcLnpUPISka4shPJUFPvshnRVvtP/Qkkk5PXTvo1/8BBloJxe7p1eRJ
         EDKRQ2P8oibm0P8a7cGxTjeAEGcgXR7WL8Q2GYZAJLLFPH7UCu2uVkUYtwY3OqwEohNP
         u6e3Wn9TSmJynBRMSrhjZgRyqm8Fks4UKQq9g5TXytGQmixK0Ifw7pj7m0fuydV0+VkI
         1hRO8z1WWZxS5mTNwHVNMlaGKtDKqIgjWnsUz18vB0GrVoYyg1+6AIKqrjiw+wRwJ1ON
         39ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810617; x=1795415417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=gXTQQFWaTcMWYCMYiksuEx69xH7AdtpO3NoIPfBNX5jcrcEe6JTnSqGxR8NMgbVNjT
         wkrDlqvjqcAx/0T8Z7WRnPvERnC2f3YB+lKZvG/mVM27ZVGta6rlN5OY3XaklNZHmKu1
         pkpSvjNLGcRYZf9LzBTOc7aMK3qILMhEco5lD5aQqJXdROc4rEO/jU5Cgcu+7iIKUlt1
         csqPq22Mzf2pK85YDdw5TeEl0cfCbwHZmgTmw7u3BVotms/w7R6DYZ8OFmjTTROXye9O
         IFhEcHhsJUMFtMlFeVgPujg2WmFV331DchSsnOguMPeqZ6cQHNRFVa/XqBLBDIIF/v3I
         EdWw==
X-Forwarded-Encrypted: i=1; AL+hErG29Ge3OVi+mM7ceIPCnTUSHph1cX4HxkVozRN7x/KlxVQJcDqahux/srPs29Ybg8PxNX99gJpOWLHWJ3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XY9A0uug4mg06AZyNqYkAoa74PSEMOjqdkHxft7p080PX3wFi
	buZakzHnr49L1fUF4oGm3UEHCuZgX1W5toBk3gKUx4dwUvhIKOCQOKfOB30skTuL
X-Gm-Gg: AYBFou0dP4GL03vC0O3miJBY9kVx9Qh/iaHOKGhekngemeLS2/nXzADRsXKTTNLRI6U
	Zc8MOXR/Rr6FeHks7cca6HaBAYLPd4Fb8DqoExhgvzbiV6uAvj+aieugQogqkqMWsBLhdfsttVR
	ZpfYDuCUPcY3jM4LnJQf3/OdEzwE2jKqebWztZu1e2o5AfqdoI4SFSuVu3bcT59FMhsDQduB+Ee
	VZWVayIKD7eGubSFGR5mZ5EaY+p5iGsCbP29t0twEU6CBHr2WgzkClEsZEduoO/OU5JlgRaMDZ4
	IkjU9P8iEZXx71mS+RqLaIbp20awDBMPikB9wOgsQG6lEJLZOvqbLBCA0D1ZL/R6/bNMlZQbYxO
	yQTB5sbiZHVZyBdJvlaUUCcVd2ScsSalzP2CCzCGqQ/glLw7ttg8Ycu5t5cSR52kG76FOH3dPI1
	5S93ET0i4Yn2al1toCIo+DzfGh+6lp0KqGq0pIfs4wGLEIiOHS1+NcUzYxvMNvk1u0otQ2YNE9D
	NQr437onCNkQOKdddA0Rnn5k78T8S3ZRNfftYISKt6Ab0/8D3LBdq7uyBXJRhLV8+yBGUODjciv
	9z3JhG0AbABXDANx4+Hc0NHYpgMfKJwQ+25CNWC07aqyXzGR4XG8isn/BEJoUuIjypv9sGiZ6k1
	qDJZPtJKM5opeOudKMZmuxR+vcxvGCTMaIF673LNMjL3Dz6XV+xZ3k4fV9Q3FlWM9Oejqjf8Ms2
	c8ZK9okNBUWB+SGgEuh0036WSvcbbmQm1LZ2dEwTSurXp8o/+KTZI=
X-Received: by 2002:a05:6820:a508:10b0:716:e9e0:5440 with SMTP id 006d021491bc7-71ab50dec00mr4383132eaf.63.1794810617417;
        Sun, 15 Nov 2026 22:30:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:40 -0700
Subject: [PATCH v5 25/58] mtd: rawnand: hisi504: retain open-handle state
 on removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-25-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the host through its embedded legacy controller.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index ccc21d21c3e0..a9e6ed2d4c4b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -740,9 +740,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, host);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +793,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +817,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

