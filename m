Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441519;
	b=4EGBH6EBzA148hzT7P41a4snN7D8ZYXogTw2oaSTBYTAHs2u2uizHZehcfTHal3KC4yZ
	 PkEl1xy4H/ghcAundyZmvaw/ftL4gK+Yij1/K8JN3z6k1NemYKQ/r6nQIUx/4eZ3BoQkR
	 SaXH9rqXejZsRWmv7OJMB3fpNgWgwJoloozBgqfiDlsJ0QjLFul+sPtLVWWBVISGRWeLh
	 HUgHw+3MFyejDVss8WsUpgDN2F9GLKQGCgL0LRXllGALa7MbcxRpfKrVG+4Tm4PM8pzvK
	 gNzsyjI51tmG4q0hYacoA6gCZ9XIa5VWM5/De2li0LTla7kT6FVwCHaX3lM7OZ6HfXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4q9LZR8lO5Ut3wMXLJYCt156smic9s4b9LeYVAkPcUw=;
	b=Qc4kSbzPL8d2WgnwF+840GwDa+WUp9wsKx0nJEVWW2EUsOxLT/CGrIZu3xesvSKpQSME
	 /uMkPeED2/iFbhojnGdkaSJ6NTKuv9ykWY6vDhMO00rZAdx083aTO/Fn2P2YDvoJw6hQT
	 5soZ71W5Xdbfc8rEDUVgwD68WtmMAMg8ccpRwMEcGZtj6dtNtFJPyGagVvvvjkP5k/FAn
	 g+AASNlh93W4xen6lnE6V878/hTBfGew+99dyg/yfycEHRDrUtD6l/Ag+XwiMU0m9ogF7
	 QSzfgYTCYj2mE/hsZrzIgSmQk74/Qp2I1StaPNXbOfLLgtEhqEz2JbS1PeYaGV43oQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b3n3iESw;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90FD606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90FD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b3n3iESw
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e189660cbdso1740700e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441518; x=1793046318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4q9LZR8lO5Ut3wMXLJYCt156smic9s4b9LeYVAkPcUw=;
        b=b3n3iESwm43cGITB3Nstp67NHJ9NaTjO8YW6SzFN0R8RveeAZUxnbsu+4Ef/Yhe8AO
         33evcLFrWK+B8KyjJKEmJjStJ/bZyJgtZtA2T0PqY6W3za0WygokmuekeVF+Z+DLHfH2
         WKhuUF6W/vwLY0XegluMV/fhj8GXFSAOQ5f1Eu8vHmsuZ5oSpG0SGNbWFHYj6jnCdzX5
         ROT3sXIxosF1+cjjbog8StFejCo9gi+gX2Yx/llkyAzTBdTMpYwHx03axYPQb9d0/+vh
         /srxTzpK1bl19mWL8u/GwvoMBQreIJLXkEnnTGlJqBCUh64sdJIzaY56Hqn/MUsNd/Sw
         V6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441518; x=1793046318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q9LZR8lO5Ut3wMXLJYCt156smic9s4b9LeYVAkPcUw=;
        b=Qo87inTxsTtwXFeaxrbZMd4jrvYaKyz26dD4unjs2l82I5sqPAmHoL2ambU6ndM9Ep
         brtKvmyuFes8YbkJPTrqiHqpUJO2uDdTyKbhkIGeFh/N0w127AQvl/J8T7LLKf8cC26H
         OKKklfDLBwERO0EzTq/M8Al4H1WAlMss9hnWmN82FR1s98HYqwIiKcUYukn48No2fVeo
         9BqIBPmJFOILCN1EAbqmn9kuKil6h7f5VMWK1sAnJ7p2anNfNtmT4ohL9MTxS8hlNUqM
         hDPuwvktKUDLC3+DO+UqTFC8TsYAXpHiNt6i0KcVAbZk+tjeWswyZs4QkXfEXmPCUvCx
         L7Vw==
X-Forwarded-Encrypted: i=1; AKwUvBz4do2xR1A47CNTiJBREHkViI8UOyYxaRUounKGfu0fuMzSzgomZLJ1ba3WWW363FokKoszqEEA5T8XWFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGIdE6YphAXP6xaLV2WiFxjF12Dss5pl3ykfkNGkXkrZxPjXQK
	wSI5uqSlVWZWeToYHjlmUGPGa8ylRAdHnt+enHI3qi1cTEr2j5fvS0ks
X-Gm-Gg: AYBFou2T2KzOw17tnBLhiFt5GX/jZZasS60g26BbcAJyQ+IxeYh48pTxiFWG7A9oisB
	wgKmsaSF8QVAbz6esGt3J5+4OrkKvVuXLJFqak/rEVFbyu5QJPpFxtyzZ1HtelLdOjuvwDB/tMk
	2YQDMcGn885AuBWeAC1WWfi4Z5pDS3vJIjSJmBSklfdGWGix4xMwP9A5t0F9c8IRcgTvQzzzwfc
	6fwpjb1/1TUg1DMEWA3rKRBTLZFQBhnFlrVccSpEbYhq5ZcJ6jklC/iETtpxGKBoI3S0QcJdKaq
	UZPlIqdQ1oivS5MR1VuTXi825kckv5HyziW1S8ZRDLu17Vag8OhZlHBKK3WQwj5Zg/nmaPMoAtX
	Oo+kfl4BzFbYycHyxMZJlBlY+IyCq+X7P21lhbI2PrNdauR4P+jSomlS9iXVaE1iLe3BNAsssoF
	DHUp4NT8FRIyh2dzEUfp7b4aAdWRevLy/98n3yd1eLjb/8Yy4t2n2eVnS4MalmBnIADrdcz/TPo
	d5AVrea
X-Received: by 2002:a05:6122:32d4:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5eaa9eb7e68mr3507437e0c.0.1792441517762;
        Mon, 19 Oct 2026 13:25:17 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b128725sm11194050e0c.0.2026.10.19.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:25:17 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	Farhan Ali <alifm@linux.ibm.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Darrell Gum <d@rrell.co>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] PCI: Do not mistake an absent device for an active link
Date: Mon, 19 Oct 2026 17:24:45 -0300
Message-ID: <20261019202445.38259-3-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019202445.38259-1-fbeltranmillalen@gmail.com>
References: <20261019202445.38259-1-fbeltranmillalen@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When an inaccessible bridge's Link Status register reads as 0xffff,
both PCI_EXP_LNKSTA_DLLLA and PCI_EXP_LNKSTA_LT appear set.  The link
wait code then takes the inaccessible bridge for an active link:

  - pci_bridge_wait_for_secondary_bus(), for ports up to 5 GT/s, decides
    that the link is up and waits PCIE_RESET_READY_POLL_MS for the device
    below it;

  - pcie_wait_for_link_status(), used for faster ports and by
    pcie_retrain_link(), reports success at once when waiting for an
    active link, and times out after PCIE_LINK_RETRAIN_TIMEOUT_MS when
    waiting for LT to clear.

Treat an all-ones read as the device being gone.  All callers of
pcie_wait_for_link_status() and pcie_retrain_link() treat any non-zero
return as failure.

On a MacBookPro14,3 whose Thunderbolt controller does not come back from
S3, the downstream ports of the controller are 2.5 GT/s ports that no
longer answer.  Resume spent about 65 seconds waiting for the xHCI
controller behind one of them ("not ready 65535ms after resume"); with
the pci_bridge_wait_for_secondary_bus() change it gives up on that
controller after about one second.  That machine never reaches
pcie_wait_for_link_status() in this situation, so that part has not been
tested.

Assisted-by: LLM
Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
Tested-by: Darrell Gum <d@rrell.co>
---
v3:
- No change, apart from adding Darrell's Tested-by from v2 (was 3/3).

v2:
- Also cover pcie_wait_for_link_status().

 drivers/pci/pci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index eacaa1e71a83..24b51dd0f9cc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4604,8 +4604,8 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
  * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE.
  * @active: Waiting for active or inactive?
  *
- * Return 0 if successful, or -ETIMEDOUT if status has not changed within
- * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if @pdev is not accessible, or -ETIMEDOUT
+ * if status has not changed within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
  */
 static int pcie_wait_for_link_status(struct pci_dev *pdev,
 				     bool use_lt, bool active)
@@ -4620,6 +4620,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
 	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
 		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+		/* All ones means @pdev is gone; it would look like an active link */
+		if (PCI_POSSIBLE_ERROR(lnksta))
+			return -ENODEV;
 		if ((lnksta & lnksta_mask) == lnksta_match)
 			return 0;
 		msleep(1);
@@ -4642,8 +4645,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
  * according to @use_lt.  It is not verified whether the use of the DLLLA
  * bit is valid.
  *
- * Return 0 if successful, or -ETIMEDOUT if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if @pdev is not accessible, or -ETIMEDOUT
+ * if training has not completed within PCIE_LINK_RETRAIN_TIMEOUT_MS
+ * milliseconds.
  */
 int pcie_retrain_link(struct pci_dev *pdev, bool use_lt)
 {
@@ -4876,8 +4880,10 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type)
 		if (!dev->link_active_reporting)
 			return -ENOTTY;
 
+		/* All ones means @dev is gone; it would look like an active link */
 		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &status);
-		if (!(status & PCI_EXP_LNKSTA_DLLLA))
+		if (PCI_POSSIBLE_ERROR(status) ||
+		    !(status & PCI_EXP_LNKSTA_DLLLA))
 			return -ENOTTY;
 
 		return pci_dev_wait(child, reset_type,
