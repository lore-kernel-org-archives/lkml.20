Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810604;
	b=tAWjp/nDejqPOJ8bArt0XkNJORKbUhlhTr1cgr2jKc24860o+o/EoX7pgMu34Oc+Vh3f
	 r2JxDfPz4E/z09PgHkIBTc1a2sp42I+pUhmQ9qQLBVgSTx4zubSZjBrBEiLpgHZ+7O5/c
	 G9yt9FgTcJer/PLvta0fYy4m3m6PVDgxedP5J6goq6bGhTTq3xupJXQETca8ItDoVxANz
	 KGA5fAauVua4YKsnUkR/jXpvHYvpy351Wm4AOsCSqWjkl0TW5XYmFpdEfSuzTYjryevgZ
	 oIEs6XEvByl/mSTCgGA0UX24Bze24eamT3T3UDggwcfvFB9DJqlpn/pbLkx4awejrMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
	b=RBBaln0ZDvmK2jWGjyHcNX2Y/aF4h8dlbD0mccXiNozqVgW40R2G2H/RFHLr0Oxcpz0x
	 HI06ezLfBj4eilWBVqFVKnd82bNpxobRET+EGezmx0gSYVx6X9TNESaD8ZJhnQ0iH+sYF
	 kfLzD7e7UgT0ByPDkXlLhlKNgydBBAO80jqQ3sqt2ITyN1PKzaycUcEbCj4I6spHxE9WR
	 JkSLhXswK6pw4PZuuq//5JPyAWADE1S4UGbdzhEjIqAnvHaZ3X7kfgUuu0rYUfDKbYrBk
	 oRNkOKWDPnTSadTmD9hsRh6ZBmB2VjaDuboD0LIoZSfL6ketZlujoeYoF6oxx3GvqCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sJd2y1/x";
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0A60A3802
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE0A60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sJd2y1/x
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d290b10a35so1088355eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810602; x=1795415402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=sJd2y1/xQ8K9icpM3DLOnFoD+WfiLsb13rYSMQRFM5VuYDVXdg5nKnMBFDLt1VQGhd
         y72TzoIbiCU8CYCfvMHvJSUWtEGVoUNFRlFxL7mDAimY+6hgk3ivv403PyOFGpTzR9eS
         1d+r/3FjKT+DqvvRCCVlHUS1Yber1PAi6icaTZf20hIInWUoQVU6eP6QPGc1Y29FvUbL
         zm5IY6nVDpGK2GHXrqU2hAeSFWHcf3RicWx4YmEsTL1im/fAlWuEdltwdypLgz18BE1C
         HkxzvecHyc5ANT4/fEiuAeE9AmEGXP7z6i5eDIdn9Nwy+EBV+/peBSJLjRZIXpyjSzd1
         o+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810602; x=1795415402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=KhVmBWHm3qpeDvjf0Oodh/RjzZl58YjL03M2vTBSHk5Uzi146vlLLo2vmyt11Z5CCB
         i40LdgzjojOKJOqxojft165fyrgt+dKx4JJorAmw2tuYaGFbL3N8N4uHrUIWtsH7fVCe
         lAnvJgQ2RRvLGHechud6Oc69do9pJex5W2LCiOWhqS04No8Vl2HAek55Jlb3wJ19mQFL
         S6TerCbzd5t6bUddpTI7ZwSfM2g6XQ6ga5Ur9xtkaJHUwxA6AJvRGAAV/Bx/1l1D1TIL
         z9cLhAaUsuJYriqoB1td/8Aurup27QuOSLe8On5j1Vk6uGBirjz9kK5hUwAiJUMH2aUs
         G/4Q==
X-Forwarded-Encrypted: i=1; AL+hErEF0ldPD0QhiGAMfwiKIK8iGNTWBQlmSVjHbbgNdU8RCWGd5cD3bGNyTBb9pEQCd5skQcAuWGNRmhgT2VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M0a5dAwSWvR0tW03Po383oKJAVZQaDcivYAu3Wj/jN+2AJANw
	Q5stz4bn3w8oFW8kpwWxyLwzxKk6YqQlwVX49+4mjgwZLasOo/UXYJp3
X-Gm-Gg: AYBFou0UxbQsctvzA9LUBmfkIwmYQBNWJIa+y2D1FTHvv7Q+ls1COyidmfjlZUOVJcb
	MvqaXyLzto1VD5eBRYb0JmnxY064kUW4g2CL0QY/wdpngfhc3w+UQ1gIi9gU3xDhXSmXWfd8LSB
	rQAHxAvLPw7+WgUumjP+7YuNId6itAjI0XX/08IOflHyNsRmXz6lrPPyedkitJXKu5MibkCX9HB
	4Bg4d9lf1YaUoj+3uCJUFunb3jZ3s11292GlEBs04IexvdvAvjCPjXppDOZYhcVGTOkp1sN8AmE
	9n+3J846yx0zLB4rSTyo+RQiTN/qH5959Vi2btz1E9kx/+UsRyCgxSaL0It0Ny6P8RVYUiyjL5R
	RhHnFPzrKcSqGMWjW5KBPcoP1mn/c1SvV1aR2RwTu5AbhZBfuauUusEg0Dy5pIw4Lhb8Il8mBCp
	r2pckARcb37J1hTaLyRIUe8958egbtquazYhHY4gHQfQ1+GKCMKIfsy+t0dszAkwioPJ3bsqEJZ
	sTVQegqOKYwTmxZbfyQKqEV5aJ0ZutuefhLpy0Ut0xSJyG1FDj8217Ts9YjHEJ7ivvkZA70qApV
	987bF7ObbAjWtMUqWSkq9rPkz6iD7Hsi59hjcoihaGc7c/D+WJJ/fAbiBmmcAwHcMAqx4cG0UKm
	EMmCFTgVw1VzSMUE3zDzBU7Jf8bd51nhti06Q7Dog5dFSFGkTBucZoRfCwkAoq9TN2gKbE6ed2f
	U2xN38HnZlCdtLJz2PpMo3aB9pyoL9uHfKhmV3KqJY45ORzp7ITIw=
X-Received: by 2002:a05:6820:1689:b0:71a:f583:67cd with SMTP id 006d021491bc7-71af5836de2mr1125386eaf.42.1794810602259;
        Sun, 15 Nov 2026 22:30:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:29 -0700
Subject: [PATCH v5 14/58] mtd: rawnand: intel: retain open-handle state on
 removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-14-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.17-dev

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index d8071180cc0d..42a1d85b1cd4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -585,12 +585,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_host);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +694,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		ebu_nand_disable(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -717,9 +726,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

