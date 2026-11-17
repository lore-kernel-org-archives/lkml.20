Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888801;
	b=N6uVoK9a6jvx4VCjirdIkaDKfhZrbqBkGtPqMx5xC3P+k4w8WhoJ9MXBjrk40jdzuTQN
	 u9EDGp376+gf8Uz3eDbr1/RQ2OofUy6p82r52SFYQj+8nAT+lteToU+NjamVS2j71836n
	 JbUkqpH3kGg7f2i7os9NsBAtWjkdObFvC17q7rhtwPqtGOSpiAkowArJZTKlpJO4To1r4
	 YSJHPuG3lRXFXwTRhtqxd+RUbTuI5pwrplX0aLMuAJl/OCwVECNKlrgQVSvdMqsn3JcjK
	 9/YeKKh3rJjw0vDWDD66FmRVNXS+yO/E6Vu0GIGxdz8ntrYqkgyPtu4mDOs2+hNXWgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888801;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=GIB2B7mYhhCuaXa2qGqXRr8ECOhej4QafGUPWUjEekY=;
	b=24nruaFByYsRArXVsIqynuvOk4+VsqbjGKhxUZAAVKMr9DpPvvCY4byRFxqHFX9wu2Ov
	 kKyzwdVelj+xlgGiOVcUc2s/dGCAJ2maXK09ctTOLsgGwCmTFdvE07LmdoBoCNIlJrbxD
	 JF7Jpx/teqbl3DBnzAT22AWIN+qJFYLdZpauanNtvk90RiCrwdXhjP9nx9H6B3xX75O20
	 XNzTAWlJPkosceiQSz7L5xKsc66hHPB8tu8JYQ0m3OI/JcCCRBHPm8doJH8aAe3ON3i+7
	 24t5Y8+xAWCoGwcRAMepLbS+qAK3Ta7VbNASNDfiGGczX2GSKTe+MyMetqSzklwUO3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TzvKhIfV;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA6E606A323;
	Tue, 17 Nov 2026 04:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA6E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=TzvKhIfV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=GIB2B7mYhhCuaXa2qGqXRr8ECOhej4QafGUPWUjEekY=;
	b=TzvKhIfVwVIvdNc1LKH7+Slcg2uBb070Nfw/H777wXB3cQL5YzVu9iqQe6UjUw
	+HDf7XVkJzOlKKkvs6kadTtbRt7tF8IMn1F+38x/0QPJAP4jHXY7H8gFcPfMDUmH
	RIyWNapjf2YVzprv5n3j0tzWuNd2qdPLcr0APFQTuqZMg=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3HxVZ1PtqHveJIA--.26682S2;
	Tue, 17 Nov 2026 12:13:14 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH net] net: wan: farsync: reuse card slots after hot-unplug
Date: Tue, 17 Nov 2026 12:13:14 +0800
Message-ID: <20261117121314.811514-1-shxzhaosr@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.53.0
X-CM-TRANSID:_____wD3HxVZ1PtqHveJIA--.26682S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFW8ZFW5JF48JrW3Cr1DGFg_yoW8ZF17pa
	98CFnxtFZ5tF47J34UXw4UCFy8J393J3y3GFW8C3ZIka1jyr95ZFWqgFnxArnxt3ykJF18
	try5Kw13Wa47GaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UMpBhUUUUU=
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7hrkI2r71FpgJQAA3p

farsync keeps fst_card_array[FST_MAX_CARDS] and a file-static
no_of_cards_added counter that is only ever incremented:

	fst_card_array[no_of_cards_added] = card;
	card->card_no = no_of_cards_added++;

fst_remove_one() clears the array slot but leaves the counter at its
last value, so every probe/remove cycle permanently consumes one slot.
After FST_MAX_CARDS cycles the driver fails probe with "FarSync: too
many cards" even though no card is present.  A failed probe after the
slot was claimed leaks the slot the same way.

Pick the first free slot instead of an ever-growing counter so slots
are reused after removal.  card->card_no already records the slot that
fst_remove_one() clears, so the rest of the driver is unchanged.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Shirong Zhao <shxzhaosr@163.com>
---
 drivers/net/wan/farsync.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index 6508c53..a6fa4d3 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -2325,7 +2325,6 @@ static const struct net_device_ops fst_ops = {
 static int
 fst_add_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
-	static int no_of_cards_added;
 	struct fst_card_info *card;
 	int err = 0;
 	int i;
@@ -2466,13 +2465,17 @@ fst_add_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, card);
 
 	/* Remainder of card setup */
-	if (no_of_cards_added >= FST_MAX_CARDS) {
+	for (i = 0; i < FST_MAX_CARDS; i++) {
+		if (!fst_card_array[i])
+			break;
+	}
+	if (i == FST_MAX_CARDS) {
 		pr_err("FarSync: too many cards\n");
 		err = -ENOMEM;
 		goto card_array_fail;
 	}
-	fst_card_array[no_of_cards_added] = card;
-	card->card_no = no_of_cards_added++;	/* Record instance and bump it */
+	fst_card_array[i] = card;
+	card->card_no = i;
 	err = fst_init_card(card);
 	if (err)
 		goto init_card_fail;

