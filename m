Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593740;
	b=0Yu/N5UnF90ZeIo2IGjZRJFXyzhUxvcCR9UDLGhVjeCQ2oO/LjkTiXDQY111/Er/veAV
	 4J7HP1LI3SFHw2a7MCGzEPpp02iIHwvqU7TmT1BxKDpzfZbcw59GbJyNU3TKKBOhsv/mA
	 GWvY7xHLJByvpnfL+/yTPXp57DAyvh1fBgwLR/a57l+j+dEoGYjDhLZbmyCUhSFg1VhdC
	 qkqGcNzHQ946EJ6LFuCHy73odPVf8AhkejfphgyBmn2Rk1z5oqgA7tL+D2UxIaDHFUyE+
	 Pad/4RLC6IWiGA9kv0lYnRdlHPtqfW9SghDSOohCEEIGttI/kBOz36Q0IQ8AdvFhk9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
	b=R84jV/7C7hb1zgEa+un0bYmipM9Qbj1IbGKOSl+ysC/slurgNPvIyRmSFVVQKpKYX8Af
	 sR4KlaJOK+lMEwbyho0qR/O3BsXKES1AiWQ//pnNmLjkjMQBs094cCeX9HFxUlRPHH5p7
	 v7WibYwbEBp+jknOo8fs2Xj7qtP5o/57Osge/Q/x5lcKUcP2x5UGoloP7VuvrF5Q1TnBX
	 4T2EUbD6aBngCpBFHMRA/Z3+ZuyFmjvx8hrnz3U7+imRM6K9Yg/nv1YErrKJpV4xLDIbZ
	 pkce0nckGBmFQ1v3iaAHOGXK5sKASznKGWBVh+kH2l8o/KIuWKxLfRQeszs14u6CG9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmudmQSY;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31405607E840
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31405607E840
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmudmQSY
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-86288992de5so1576919a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593739; x=1795198539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=JmudmQSY4Wn1PqJbteckODjmulP82kaHCdVDK15u4BAGX7zKTuYbdLb52QrOIqF5yk
         WB9gHq7nEHJnZ+MHwGWFlUm109GwSovyD7yzb5Jhz5GFU2UxKtTLnezXMNXbi9TXcu2i
         ODDmeLUVsqxa/mObg+7FW2LdCBb4IdBbt4zjT+2Us++d/Qblc342PlzHTVzhafF9Ev4E
         x9cCXzVmPkqIAaXJ7V19/mMLxGsRQ3I6IvqkyWaRG9vmg5rDF96r8D4c9kFOZ93L/DST
         YfB5S251Oop9CNDCS9UaPQq3DJljXhcp45EBFEZqF7qrhtwJQzcp13l8kW+bIsFa20pb
         tevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593739; x=1795198539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNo5qhtsBv7Y9DGF9dmvBQzqD4m+n2CIICREnklMfow=;
        b=N1Z1rrHpDRXqrrindTU4ya9s9/QlrzN/g02PUE2XQty3V6EfO1hPCQg5DY22YJoGMa
         abGCpSMctJmKEkwUuWaDlddlojxenNeOcXa/g8ReaMWRemnL/Q7XiLbu+fUGWCEKKBH4
         spDXkXerXpOIjuo/mO7v9isdAWUMlEe5sgpvjE+Rx29lE/+i60CZFkF0i3C3xjLcLz6Y
         WEAbcbLE5Ux1vNjbh3wf4j8WcGAxDj2Ujc6ibnItr9fTeRZjCv4fj4qZDvmfI2wG/VHQ
         k02lHK4ZlUcue/sJohiPa/xilZlXv3M8GxCoa5IpzSH0OkOwUCQ3mO2FnMXipxbf1v5j
         6eSQ==
X-Forwarded-Encrypted: i=1; AL+hErEjRx+9/usG6QXqGCoKkz/KoH1kPS2B2fv9NSNMEqs8NCtho4dDAE6LxHsYORxXdSWBKLGpAPW+CkC6wWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xbQxqilhRfyycMgDjpMXFx4oyUpsQqtpjMWKPmFnMxONOAS0R
	HVl1yatAHHL0TtDFKUXvt/whMuI+9CAyJFc37HQB9obmSYC4ch6H8+TMHHUmgcIn
X-Gm-Gg: AYBFou2dKOdxlbJjVDSmmVqn5jDVa136mCErMT9hwGgBvaBvHVax8pLj/N/QCdXC/cN
	s2vD9bmffailWbCzql/DtE3wGkkOnw6QgNCMsfzq9LwUMcBR69vYoe5fSP+ip6mAbf7B9eNdQ8h
	l8jSMRpUFTcma51DCuSP61za1ASPZbam++97Tjso4j3sD8sOgdo6bZkZVHQDD9DT5YBOfk5NjPA
	Nez1idk5yXRyE8Aba3ffC+vPeXDNujex50+MoyJGK0tHrxanr6/H/oILB/IO2NRbQqwXAv65Boi
	J0nzlSR2eItAH5xVidoCrA3bkBSvgDG/RdL3yhW3SvmrWa0hAWiymcS9O6SsnF904I+1T//S5Xn
	trSL6N3qUL2myh8R5JuKktyycgl6eAdCpPdzNvV0d+PQLxnxA/8ihbATDtHTkAmzETCh0prJs+A
	geRaG3NsHq3IXyqcGRX2EBp5ObABLbBXa4HYi1phCxPJA1XaDwNC7rFVn+LuRnh12nl8qzW/o8C
	EYcCRmrwj8GLemzolVhW1bSn+eFL8YkKemZH0wQGngyFBI4HhsTZJLlN0AQgvN+expKRCJxQWPo
	RsW6oDdwbX/hLP7u9ZDsgnz4y9U8s2JyEvN3HEs/kmVbQ5py8J9A04X4l6Dmi5nn0OuLM4eHPQt
	5up+QU9G8ZEKJv8gencJyjiWLZvwiRPHf20ced3VL/8X2ls1MrhlC2b9Ivl2yPxwZaNLL+3vCxQ
	F20YtooNFRKmnNPtJltzj5zWj+DOFz3gYABfluBXYp0K8pBFblE90P
X-Received: by 2002:a05:6830:442a:b0:848:8d7d:4e47 with SMTP id 46e09a7af769-8615267812emr3934270a34.10.1794593739079;
        Fri, 13 Nov 2026 10:15:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:36 -0700
Subject: [PATCH v4 20/58] mtd: rawnand: socrates: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-20-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Drain operations before unmapping the FPGA registers.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1b578193af3b ("[MTD] [NAND] Add support for NAND on the Socrates board")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 91d4394c1137..5b9b99bc1b38 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -142,9 +142,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, host);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +159,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +190,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_lifetime(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +218,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0

