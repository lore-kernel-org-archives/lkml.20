Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296696;
	b=pZE1df4szpUMSA3t/P5GS1PsbxHorr/DwypMSVGeYjTf/Ik+GfAKSqpdkqqqd53HLvij
	 tRyfAT8mdgM/K3Xkxm5wOONgjp4Jt0KkBNcLformiVurMCKKGcyB38TDj0G+yZvrFzkI1
	 YhxSJMYq3o/mT9Hoibsn/c6Jg5M8nbujB7lZEMe5/LURRSl9gzqkmYf9GZUMPv5FCEtfm
	 RtNUphoe/PCPov1Bq8jD24kpuKm8RN30TWHsxSJS1aWwXyCF1lCwxoRueWKqC80B8fGgR
	 IvG//c8bNYrjEqOnMpfbgfE6hnKC9stX+w8QVy9dMo0kzF+1Q1KGUeMwjLvYMQ+ezlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
	b=W0jiVZ0KQzGrQX2cMZlWNCPs2gGVsxEplCLVYyve1TUJGUdKyh72J6ITfxHo3NqQGlsL
	 AexDiQSLo57CkVlSPtZt17BtjFHvRvbOACvi2AqKtX6VpZddxL9EM7jqHX8M5e+o0rewQ
	 mNX0QHTctxxZiOdvGKaKUKsOWJO5IJ0QQE4jpd69WGCT2ekoG9LHDgzRWxHrDbylAeuam
	 JU4f5J2aSvFzxk9tGjKKyMRB2f9cAzGzTrloCF9hRjZgUOkOhF2HxCk+ZrNq5Ex2sJQlr
	 LjT6y5Zj1XkcobDHWltbheNI2XIub6UFT6KiO5eg8KJKLAgmOWmWTRwqraanmm3oY5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K1HP/SMi";
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C308E606D296
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C308E606D296
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1HP/SMi
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6e560e00a86so1053647eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296694; x=1794901494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
        b=K1HP/SMiukpEATJdAO73UEk26vQGC+iFZfKZL8rYJtz9MfTiR41PYYHYqj4tAo/6w/
         fuM2OgyXNeAJGdL1t2Mwy8uScN9qW94+9OhBzn3DfEEwt7kc7bxoseNzS6kbFAx/2zR9
         c0r38uDsihefrut/UqtIpXCrjinCigAt6uEsn2xpBKHUpaCdYP98qmz0f2wCR8cVzCgT
         2NHc97UAyrdeZxK7Tl67oxrYZorNwCo9FZxiHAch+k/U3BNPPh2MilYhoCcgO8XhxJ/x
         kYBQ/FqveBrhNEqNCwv8wkf1b0jewk/U+d3+e/Y0oSYRqul+bP2/+fYj1tM+04ndFzde
         QN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296694; x=1794901494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbdgh15lLoRVXKPHuZMnVRIK8oPQOLAhA/ub2vbd0UQ=;
        b=kkNET7yyfjom8/Sx2wEwbIiNDU0iOXebBzV5Ew12qfs3p78Pp1TA1g1/P2M5p5PanU
         5o7OixjdCV0pT2VmlESUXCALQXr39XIMpQPB8W8v67J3cjEBpwYCwVWmMw4u9VzXyaO3
         75+gVFmAqM8O2k6ziWAl6/3u2D8Ihx9R7627Mwdcbb3977d9bwV0mVfAXwK+enMQA+l4
         R4ljt2JONFUwzNAnq+byTe4hkGKGezJUAhBpGyxphsymnyT/R8A83eiiedFjaKgQcD4F
         nXm6uAhaSHenvy1x+Ea2koyv7hqLYMmQabqoKqgf2t/vjn6vjSs/Wu0LRDfY9mUEMsvU
         o1hA==
X-Forwarded-Encrypted: i=1; AL+hErGYVTSjyO3KW/xDPRi7KxcvGjnYaDGlY/cTzOtWbNWZV0Hv//jDx4P/VuTsyGK7x9j1b6oZ4LHRXqsJQ+I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ihj+bbcWEA+ch/Amu0MUcgBAOI69EUsseAa4SJ3GKsWESRbzV
	aMZqxY7CkJIp4Dt0Q7xPBxQX3DoxEaswrD0zdDjHJt2aYuDmwknRq4zT7RwkYpdP
X-Gm-Gg: AYBFou3SI7uHH93CyeX5T+gkqFHfJhHpVh30k7EG45kH/q5LaBhTA8MFmiumAEG/BOA
	FHOXd42JUaJhyCmPMbTVtUlNFj00yWX1Pv3kUaqakl/1Oe21zGO7PH2fsR7VLAGpI+ACsSeI5eY
	Y/Hj3tsuphyQM+VWpHC5KrpXT7FRJlhAEzFPm8d+PP58VtVEYolKJM8oAV2/l/7rz3G9M8BVUYT
	8JAxlFuH2d5S240eJmKxCK10vMocDchR95rzEDkD5g4mTZ6OFBcLhhYZ4WzG1HyFJTHUoS2xEdc
	hMziy7L1Gt/e95Ga61zd1w1n7ZZzd0u6ensBs33HnhKU4abvYBBg05wKZgTFKk8DLgqzGWaiTSP
	D0c/pS97NNv3rVNKFdGZacd30jWr1pAdnLDlrU9MJsntuRPY3ATvtFMCxHmfFGUq/hUkSwu6Bob
	9c2IHj2kPQ9NOL7LrIjlfbUZyWktktBadgM3BAPlgyADJkl1DPBuLctR4+D4CRnHhw7C3V75ghn
	MdMq5ydc3tAIUrb2z30Cf15n55Q33vY/a8YOxzS8ySxCGKJYUeaflasnyiShLHJGblQ1AgToXQC
	u5+KJHqWGYKPhbPHU2TYE3i9kGJQHuujz8WzDC36bvDEg0X9vOJjfcO0x5gRc/jvLdKSCThAqk2
	vhE4DONIo9T3xDaxq7dtPdM/y1vJlx2pp4DCxsQUgbA8sKAK3eUuEwTYJ7J4joWeDIXXkfPh/9A
	7mATW6BbJZbCRKsAtS3JnuiJO9uRUcXNT4VnsdDQlYb+YYxbTnHco=
X-Received: by 2002:a05:6808:1713:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5683c945eb5mr1346257b6e.19.1794296694580;
        Mon, 09 Nov 2026 23:44:54 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:54 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:34 -0700
Subject: [PATCH v2 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-31-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded legacy controller and drain I/O before clock
disable.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 4d8b92e7e672..d9f1e57c1ebf 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1686,6 +1686,11 @@ static const struct nand_controller_ops mxcnd_controller_ops = {
 	.exec_op = mxcnd_exec_op,
 };
 
+static void mxcnd_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mxc_nand_host, nand.legacy.dummy_controller));
+}
+
 static int mxcnd_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -1694,10 +1699,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, mxcnd_release);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1805,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_release(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1836,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0

