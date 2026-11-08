Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172605;
	b=yNSpAolgTxk49igdDm8bTJRgG7AH6ewwslnu6p06iX7bQ0K8zmxvskPFMxXNO3uNkyZO
	 IT/juEausoo7hn8vRiM9foChypK/Fz2cJt/O7n+EWE/X5f8EuLr+f/gTbvmM++chQT7+G
	 ACCu/B/RmnmXa2HS7nPt1pomyroM5p0YU3wEjzuZ9Y6vkmSYU6G0Cr7sT3wGVCtnzt3yz
	 7MSFwqbh3LCmp+Wkh7HJtZjcuCg51RiS7ic4xhyEwVvEj1QwwltEfKC1LsQwB2p0bzZDF
	 ixf7W3jnTxEVZo6ABwxeiNHOi6m5sJnnUaVBV5W4CZA5gqIZWxNn8giUVrfEVVmhsoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
	b=2QpmT4pS5sRDGuxYp5GejZtRI9XF30mJWeODJDvZepmV5gnYwhyteBDY12EI8OeR9doP
	 xFkE2SAsU7SvCeAoRsQdvydyVMNKpbLFzr+De2yse/pSqEYMuC85x+kV/QtzmzHUeNc6d
	 Y8zu2zcYJCtStfU5tkHPIy+IyM2+iWcllv+nMV7spM/476vbMuxAfHZWiQp+5r9frjhJz
	 VynfkYD7S6+I3bEc0FDhOuaAwJoVyZl98Vsn4U15aPWL8pDFfNaQYNlWDn43R2pE58SDc
	 uW1m68rWd5IOS9gkgjHLUeqJYpI8AW6RxopVuW6ykZ6O516m2UVDundUd2WOESkf1bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjh5ETJg;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5821606A335
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5821606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjh5ETJg
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6aa9606ddadso154624eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172604; x=1794777404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=Gjh5ETJgttZxG2mF8evsbAwLJ3GjkEAy1jrx5pHGUifMlHZbZ/aRG/9t7kzuCZy2YT
         IoCcF9EcDPklzfhwN4lKbeau1ssASVIAO9+YEwDGqsVtVrc7bQKNDA2oJ9RPlgRTFGPm
         9RNOH/wVC25C9JUFfkjNFbB9omFoKfH9ZY90Tfkmb3LvNUrGTFnlCmrWvRTjwFpsPNR4
         8zeDjaZ25FoCP/wRiR0QjdIiwPxUor82lLp3viYCTm0h0rL2LHt7yNrz31uNWKvB4rim
         W72JXuV4fuwgIcWb0VlcSoG9KysFWAu+osxDFjzdufgvCYbffSwt0Tt/SP9uKVb5u3TG
         O33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172604; x=1794777404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=sn55J+MfXJ/k7OSdg6b/mQV5EjNyuJ+zPyLxInBC3kZ8bOULhoMdQXiksbz+xp+hCi
         Sncg79LamaOiukpA5PX+QwZmvOylENeDQJ63LV42Yy2THnsl9W3pX8gB9fCmriL4Et4E
         HdRgdvKzZOBlLYVRD1q8Ze2Wj7bs2T18x3EztSS4cM0hTU+RUbE5EiAVSh4SRa4a7XeZ
         gzzrZIwoMlNnfLoLlPQhuLT5609DyWY5j3KYLFdEQNy3gLgvGxXT3wIXdtFlHsrqZ1Bi
         WC3tko9D8DX0nfNVvf3Lvqix/9fNtDB+6+yQxPR1Ge0RhoVEgriEZ1LCgrP4VIjveJgp
         E/Fw==
X-Forwarded-Encrypted: i=1; AL+hErGVEEYBXa3B2J4rmip5QM/iac94Bmxt95ZmSuoCoswn/YbwIgbrTr/PjYPJc5sAd5y3+EhmfQNmgIO9RJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TADR/2xaOlUA0EsVYThnL6Hyi0ip7e/X9e6toPduvL2H5vuUO
	qRlNrdIutARwcwko6Ben218WpH4v4/XBwv88nKhQYVqcaVwWmOMWlkvX
X-Gm-Gg: AYBFou3k99q3rW0dmHqmvWj3h/CBczkEW52cWUECHBQ5Fh1APg7hJhMvFcQ8rLaTXjp
	ovzwqW7id0EJaCelDXbFl6ckEOPabwx2g8cJUfdOWd+GVNRYQYkmLsgmSDbYKd7dkZEK2SV3W9H
	ldPHrFlzapiUBmW+FKwsREQvNY6w+3BsO9Lsd9Aqxp/dPhjbG+NgXWefgkqs9UbQkLwaY/uZCOc
	ugSUbCAy3McNoJDzjSYXawvM6tEdKQ5iwIQLsfnJAEmclL1bfszNwiJjdtvAXYedC6m0lnQ6D+1
	RfxDX2K9CawE2/1eTpF69nHAXwzKh0kGAfWT0AiBT5ZchUjMihx00XTNFx1XJc2aNexOjFDU8+/
	GMhB9NCHrbFrcU9/LAFhRYzJta03onPaE7W858JCAo9MLvbuNmOJB7yqzmLAvpHZmu7TRsqjzXv
	nyfglrvmmUSb5l4C56np4iXxLz1llROe+N7YYccb+7TcBz4Rc/yEFKzHf/06Oth2FprfSzpyhBh
	CZW839yO/JKaU2WfPG5bAJUMnjH1HHeSKwf5ntEwI6r+Ddi1Q+0aGTMw4sxiVqtY8iqOMFWuAft
	IpZuPIFzONeSNqp80ijSQcpH50nTSGG9iRSkN/q/fEqngyfvuNhtub5hgbyVNUBe1egprnOXnkh
	VVYNo+E25TQyMU0E/ub8qr74OfXssdXd0JrUVzPJ5y4YaS1IsRQBIBRG0L3HgWg07nXy5nEYY1z
	dpZMPSoEGEoy0nU/s7iIvZUAqfSL4jLrUTa9WpqMnt5dDi7qK+XN4=
X-Received: by 2002:a05:6820:1690:b0:709:529a:478f with SMTP id 006d021491bc7-7170f2dad52mr1144251eaf.60.1794172603603;
        Sun, 08 Nov 2026 13:16:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1896378eaf.12.2026.11.08.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:16:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:16:36 -0700
Subject: [PATCH 2/3] mtd: rawnand: qcom: retain the BAM transaction if
 replacement fails
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-2-509f30a9e14d@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v1-0-509f30a9e14d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Attaching a chip frees the controller's BAM transaction before allocating
one sized for its page geometry. Allocation failure leaves bam_txn NULL,
although later chip scans and previously registered chips still use that
shared transaction.

Allocate the replacement before freeing the old transaction. Restore the
old capacity on failure so the controller retains a usable transaction
for already initialized chips, including I/O during probe cleanup.

Fixes: ba7542eb2dd5 ("mtd: rawnand: qcom: fix memory corruption that causes panic")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f240d1effa04..062fba9eaecc 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1329,21 +1329,22 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
-	/* Free the initially allocated BAM transaction for reading the ONFI params */
-	if (nandc->props->supports_bam)
-		qcom_free_bam_transaction(nandc);
-
-	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
-				     cwperpage);
-
 	/* Now allocate the BAM transaction based on updated max_cwperpage */
 	if (nandc->props->supports_bam) {
-		nandc->bam_txn = qcom_alloc_bam_transaction(nandc);
-		if (!nandc->bam_txn) {
+		unsigned int old_max_cwperpage = nandc->max_cwperpage;
+		struct bam_transaction *bam_txn;
+
+		nandc->max_cwperpage = max_t(unsigned int, old_max_cwperpage,
+					     cwperpage);
+		bam_txn = qcom_alloc_bam_transaction(nandc);
+		if (!bam_txn) {
+			nandc->max_cwperpage = old_max_cwperpage;
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
 			return -ENOMEM;
 		}
+		qcom_free_bam_transaction(nandc);
+		nandc->bam_txn = bam_txn;
 	}
 
 	/*

-- 
2.53.0

