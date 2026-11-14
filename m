Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794684041;
	b=u0+IWsCf5HqYlIi0Np38mVP39eS7q/LZS1bQusmSHwuVkNeE0jrMr/qNBEFJzhXC+nL1
	 WCeJYjq+VplcqCx7iaQ2ZGkGiA3tdiidQD19TWxsLS8e94QgY7gpbrks89++nTuVxKBeo
	 Xro3RUQoAuQ4DYEKoWbOM7QDiTA0haOtal1oXt0HIWGQgdGTEMJhMnZGz3lYrgzuVkBB9
	 8aInIet+/udBnJJBLXlbcA5WUF6Obr6i/PWQCTFhskyPYzEVXNdFh/RrPqH9wvboKeMIp
	 2KoIxWJ+UsnUh9ZkOl+EqKepzDj4ybDAkwKVLBhOCgcRLk7RzO7fJU9c0TnmMA6OnIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794684041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
	b=EFME0eWvxTEXLxKRmbZfmaIaqGLoL30raxLfGLbQyq4I/oh2gxr7f8FYFOG9RSqWxavs
	 QN6j0I7CGprj3kW4TJbmsKeg3F+0E09cfsIbezYSqqJ/6RkmlYSNKEmCTYEL0HNpJ/lSN
	 szEvG6I1w+eBQcXknmkA62OA9bGXAhkWCFKH3X9+yj6lyPFPVyXBRsLDrlgt1w/Rl9N+6
	 RjPxkS45tQHWO0O4ZmBtzsT18eaQgfTdBRWu0d8vzi4lgfRLiMiHT6nbWjw1OXvF25UEB
	 IwOd7lQsQDnrlSa34EO25WpW3MmFy4PcD8NTdy7vrIxlkhO2xtC/ZyzrWEc+ca9JHIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e9/eErsd";
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FD2606A88E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FD2606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9/eErsd
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91f332a4b2eso9961926d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794684039; x=1795288839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=e9/eErsdjQzE+fwx2wzvD3ted4g22V+ZS02UKdEWRf0WYZvRmGBGxdYfUDe2YMBlKZ
         oMbqJT3HBDBKsEbbGtqgteBJKwHll0JtbDs+TxhZEtHANKun3bfkGROWoLD6sMOSbb4h
         42kWucC+MAhMRBfTPPDTo9/FtnG0qkMTDI/95nHHyc9F2a8T30jVE3ACoLl/1fh4NcS+
         k0Kh6b/OGRGoUmoL20+WsVAVXo+xTLpe7PH06sezICSleX+z66F9Smou5LhAjLEa2WJp
         GVXLYI3MX5mxFaYCz3VGKlR9bTAI7Mc5/XwaeeSRL03olzv0bY2Dl5wv3jlapN0zLnBq
         8uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794684039; x=1795288839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukzA+tidxl/pC0CHkRorSuH0akKAZ+OPpvDSyn/yS9I=;
        b=D3IIu4tLeCtDBBs8GcnyK9bxjETXXKAfS9AG4tCOQ8fup/Q9SHZcbO/WnsXoMRyC96
         h7ZdNiXtx7cbaBTzZysElgu8gTcS9pLU/UogzSOgR7psWRLixkI12GKxTgj5bcOzU1ux
         jn3szBNaWQSP7D3hozxajg18Dhqg7Bz9s6UAzKSWEcg0HPtbd5XhKTLTF880gex8lxow
         7HB7VOPGLUPPZFWzQu6ZQtFrgcBBOQFpW6ARbuZlIzk7AyF0gTTUCw2CwekNBPdXZQQm
         WCEQ/mnAVMac/ldct3nb6tUxSLBontWyi+Q4+NdmIFTuD8qGFHpLz52Slu6fzf6t/KQ1
         OSSA==
X-Forwarded-Encrypted: i=1; AL+hErGwc1z8/PwFJUvHb71i6JoO8gEWuvW2own8TIWwmxPabL5V4QPIualNicvqt+AvjojS+KdaC81u8mWwve0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k2eSr8aOVZJ3pd4rfoj+RijRc0zEk6juTnI4so2LA2w9N0wh5
	dw/2eWZz+OyenDshmdt+aQkvNbP1p7Tz5QwarO7CsTvr7daoJEt1wvcm
X-Gm-Gg: AYBFou2isjCcX2q8SIhOUjDdn6aoCsx+pFQwmsy6nZA2JUbl3KukZRiGuda1VOhbp7K
	trhnmLbnh3Ocbw+X2EJKFjUslZAoQl8okCiRcaMk5MuKaZqEfuGFUe1aROndE43g2aO9s6aCfXV
	yXfqMZWHwm5z1lxzRVNp4ZMvJYwdPhZ192Zm4L8+hxDzqE14cFQagIF4YW7xNEIBF2BIAnibMeE
	iEt79PtaMAT3qp0SOYJEZZ8ZavMYjuOgHlWqH1Ddz1vSCZtQPuSP3CThnRy55R3Ep35K0vCl/uB
	vHYSKgfh6ffaM/Y4oCs3Jfz/j09Q0dhb9+bk6UZg+P72TEg925w4HtxIpSoiufen5fAWk+9l9Nu
	H7zILLNytBfkROiPPzGdqi0SJ5Ksl1An/Ih+Y0goOwHV6J4KcEtxVqNkk7ZbYj97YhtEoTrk0PV
	K12XnqTc+piIOiMq/AKMD3yIFJqIlJC/hBh3mYJC4KfPQRpOB5BrU2F81foFHr9wj2mEVrJoJ7f
	hUOLygtljBKFealCpPO5iNiekfPwKMOSJIPZpqeDbA63RjfWcNQtb8IfkaotOIrwUPABdzWQXFN
	0OuwnAWszrKZ61jWZmvvXZN5UuYWbK4t1YQ=
X-Received: by 2002:a05:6214:23cd:b0:91c:62c0:9875 with SMTP id 6a1803df08f44-91f24193e5cmr101226126d6.19.1794684039539;
        Sat, 14 Nov 2026 11:20:39 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm48544256d6.44.2026.11.14.11.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:20:39 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 2/3] mtd: rawnand: vf610_nfc: keep a timed-out command from completing the next one
Date: Sat, 14 Nov 2026 20:20:30 +0100
Message-ID: <20261114192031.959376-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114192031.959376-1-mehmet.fide@gmail.com>
References: <20261114192031.959376-1-mehmet.fide@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A command that timed out can still finish later. Its interrupt then
completes cmd_done and leaves NFC_ISR[IDLE] set, so the next command
returns before the controller is done: the completion is already done
or, if only the completion is reinitialized, enabling the idle interrupt
raises it again at once.

On a timeout, disable the idle interrupt and wait for a running handler
to return. Before a command is started, clear the status flags and
reinitialize the completion.

Fixes: 456930d80a2d ("mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
Applies as is down to 6.6.y. 6.1.y and older differ in the probe context
around platform_get_irq(), I can send a backport for those.

 drivers/mtd/nand/raw/vf610_nfc.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index acc9ff282083..547eb1513893 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -154,6 +154,7 @@ struct vf610_nfc {
 	struct device *dev;
 	void __iomem *regs;
 	struct completion cmd_done;
+	int irq;
 	/* Status and ID are in alternate locations. */
 	enum vf610_nfc_variant variant;
 	struct clk *clk;
@@ -291,6 +292,9 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 {
 	unsigned long timeout = msecs_to_jiffies(100);
 
+	vf610_nfc_clear_status(nfc);
+	reinit_completion(&nfc->cmd_done);
+
 	/*
 	 * Barrier is needed after this write. This write need
 	 * to be done before reading the next register the first
@@ -301,8 +305,11 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 	vf610_nfc_set(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
 	vf610_nfc_set(nfc, NFC_FLASH_CMD2, START_BIT);
 
-	if (!wait_for_completion_timeout(&nfc->cmd_done, timeout))
+	if (!wait_for_completion_timeout(&nfc->cmd_done, timeout)) {
 		dev_warn(nfc->dev, "Timeout while waiting for BUSY.\n");
+		vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
+		synchronize_irq(nfc->irq);
+	}
 
 	vf610_nfc_clear_status(nfc);
 }
@@ -885,6 +892,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
+	nfc->irq = irq;
 
 	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(nfc->regs))
-- 
2.56.0

