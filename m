Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A229739F187
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857279; cv=none; b=dO5KPlBdqL+LsrZtSZfaf8WR0V+k32BwVoFuF18dZPuzem5+jsXREUcAIFJoCKj4L/XJcB+unsCsNPSvezz6eO/ZPOicV/lFxVTVaKzO3ENUGswZZ6yglnevOVI62bC8pGiMCrtUhZk11FIYW9cpsGRxzDB8NHlHk891LUV8MlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857279; c=relaxed/simple;
	bh=ft0Di8pJXd1cV0IPnAYGRlU6/sR1zWIgqXD+009XfSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hT/VF9IovCWKw/X9hAY9vlySCq41mtIYimaMI7sYOHtMFG5eTDhcd9Zs1np/0izD8UQk11FxSn6mvCpb/hcyArmJC3Ya9mMPqLsdKccm9p+4qgw+izD+DDycBjXcLVsHqAfh0RWtgJX8XGzm7CBWqJL4oxEBE8Zd8aKdGD78Dbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssyWOiWQ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssyWOiWQ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso2685767b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857277; x=1790462077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=20+tpjFi3yTqUHE14mXh3LEyPwl3PLKFcJJxppA0avk=;
        b=ssyWOiWQm6fSZGsa41AA70A9EiXrG3z18ZLY6NQP4Khk5VrCRkaXMdKfwd7aeD+YI4
         k+PWQuCDxZ7e0RCzEy6i8xiCqOk40/iipXGSUcd9M1bkhExBEVybQCE5ZGFScyj4uW2s
         iNjA9fPsXFeFgBpfIESFd9jxxSKgErAcNaeB9DwXvXke54CpA677lbqeOyPWGpOWCMw4
         6QThKG98PZLKby5eLeSC9t9s0+W/dHVmaBrHV3jbAMGgPl2DkLcODClfrAbARCWFTIs2
         hQRfRx+HP+CzhHbPvJauHHV5HuVsDa+v7a2Wzb0s+ZouqGUxWpfN6p2POiLHbNBVG1BJ
         edQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857277; x=1790462077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=20+tpjFi3yTqUHE14mXh3LEyPwl3PLKFcJJxppA0avk=;
        b=oTiOe/OcXaiAqUCfwJKusBvPUbit+f6RLdWJ4NpLh8jwJVYMpvHVKGrvvbzH4Z9iEI
         OObEeBgk5F8sUK7y52UOTgZA3F5EukTPA63dnU4KCaVwQm8wtUO3clC/+Qno0DovkIpp
         dNqkMTTd4Q38IFx9oec9rCQkMG7ktqc3U7X7ZDvUUuOR7Cp63AiXvX2840a8auwvWdkW
         j8aYCSOL3h0kTuTAKR4x3MQ2DFaKVo1bO9mDBzmKRxOjE05vVPSWG0e4qla58m0xC5Gf
         y8RjYesdFFT0bRcgBs1eWqd4zK7hfRzOujWzVluSTwqB6BkfStBnqj8YFZHQaMfK6y/t
         1ogQ==
X-Forwarded-Encrypted: i=1; AKwUvBypX4bxqVADKEac5jNrFH6C/LUFJ2j9npLsViRQfgrXPMduevg/aDuJzOmWO/ec7igUQbfiFg0yj/o6qJI=@vger.kernel.org
X-Gm-Message-State: AFuF++kpEAmupnLENVj/TFRdguwYtG46l1rcmD0YyoHtUV0jpMiULR64
	km+W6C5D7paUVy/k4Y1hjjpzDNdkjJw6HZ85sV7WrRQXk4Tc7iNGL806
X-Gm-Gg: AYBFou3/HFBuMoGrPbMj85BRpm078w+ix94DhIybwH7W/3ybuy1SBclmeuQCRKm2nR/
	Cz9uaRJ5Pk3tW0tkJMZgZ4lyNY4myo5iNALzsZ2MkuhTqo/Endc/+rJfpur/2/5Q5CPJaWtkHwz
	JqY6HmOkiE/bOfnh8wDdU8zgQguO+isuDQvSAe11vx50QLHGxM+czBgLzKKTqnZqEy9D9cBt0CH
	K7fOGlNIRycIg91S5pqO5bX883EacuTdhufAU895GJIt+0nh64J17K3iptmK2TOxsVG9BNR5wmq
	jfjLGiePjC8zD61iwQ4mNd/UNMF3kZ+ckhHseFyxqNnjSBNg2l7fzM3Z2dHUICfAOYDuLXMbq0h
	wZz9Hv4U2mkk64K18/5W4EICvtQacsthS+D0omzhgC6qBERUS6PqLbtmCFl2NHp9NOZb802gfmD
	rHl5Hx2hAS4MaI108u7/1lYwDFB7a1u7Izx7FtMVmhGmidGFuWLjlXmBQWzRStWo6ekL8a9WEvj
	L+T+pyDADXvg+bFSxKIpVqT4DD5tei+OKDNn9G0wrIzD3wSYlRiCu9ptl0iKFwaadRh+Ig6byTu
	Env7Dnjxiw==
X-Received: by 2002:a05:6a00:194d:b0:858:ea6a:4415 with SMTP id d2e1a72fcca58-87341085f89mr12763659b3a.2.1789857276921;
        Sat, 19 Sep 2026 15:34:36 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72acd1813sm1361390a12.4.2026.09.19.15.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:34:36 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ieee802154: ca8210: fix SPI RX length validation and FIFO out-of-bounds read
Date: Sat, 19 Sep 2026 22:34:35 +0000
Message-ID: <20260919223435.3883048-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/net/ieee802154/ca8210.c, validate MAC command/data frame
lengths received over SPI before copying payload bytes or indexing MAC
header fields.

Fixes: ded845a781a5 ("ieee802154: Add CA8210 IEEE 802.15.4 device driver")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index 01af4f9cf7f2..d3205275741a 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -697,7 +697,8 @@ static void ca8210_rx_done(struct cas_control *cas_ctl)
 
 	if (buf[0] & SPI_SYN) {
 		if (priv->sync_command_response) {
-			memcpy(priv->sync_command_response, buf, len);
+			memcpy(priv->sync_command_response, buf,
+			       min_t(size_t, len, sizeof(struct mac_message)));
 			complete(&priv->sync_exchange_complete);
 		} else {
 			if (cascoda_api_upstream)
@@ -1677,6 +1678,9 @@ static u8 hwme_get_request_sync(
 		return IEEE802154_SYSTEM_ERROR;
 
 	if (response.pdata.hwme_get_cnf.status == IEEE802154_SUCCESS) {
+		if (response.pdata.hwme_get_cnf.hw_attribute_length >
+		    sizeof(response.pdata.hwme_get_cnf.hw_attribute_value))
+			return IEEE802154_SYSTEM_ERROR;
 		*hw_attribute_length =
 			response.pdata.hwme_get_cnf.hw_attribute_length;
 		memcpy(
@@ -1755,13 +1759,17 @@ static int ca8210_skb_rx(
 	u8                    *data_ind
 )
 {
-	struct ieee802154_hdr hdr;
+	struct ieee802154_hdr hdr = { };
 	int msdulen;
 	int hlen;
-	u8 mpdulinkquality = data_ind[23];
+	u8 mpdulinkquality;
 	struct sk_buff *skb;
 	struct ca8210_priv *priv = hw->priv;
 
+	if (len < 30)
+		return -EINVAL;
+	mpdulinkquality = data_ind[23];
+
 	/* Allocate mtu size buffer for every rx packet */
 	skb = dev_alloc_skb(IEEE802154_MTU + sizeof(hdr));
 	if (!skb)
@@ -1770,7 +1778,7 @@ static int ca8210_skb_rx(
 	skb_reserve(skb, sizeof(hdr));
 
 	msdulen = data_ind[22]; /* msdu_length */
-	if (msdulen > IEEE802154_MTU) {
+	if (msdulen > IEEE802154_MTU || len < 30 + msdulen) {
 		dev_err(
 			&priv->spi->dev,
 			"received erroneously large msdu length!\n"
@@ -1787,6 +1795,10 @@ static int ca8210_skb_rx(
 	hdr.sec.level = data_ind[29 + msdulen];
 	dev_dbg(&priv->spi->dev, "security level: %#03x\n", hdr.sec.level);
 	if (hdr.sec.level > 0) {
+		if (len < 40 + msdulen) {
+			kfree_skb(skb);
+			return -EINVAL;
+		}
 		hdr.sec.key_id_mode = data_ind[30 + msdulen];
 		memcpy(&hdr.sec.extended_src, &data_ind[31 + msdulen], 8);
 		hdr.sec.key_id = data_ind[39 + msdulen];
@@ -1801,6 +1813,7 @@ static int ca8210_skb_rx(
 	hdr.dest.pan_id = cpu_to_le16(get_unaligned_le16(&data_ind[12]));
 	dev_dbg(&priv->spi->dev, "dstPanId: %#06x\n", hdr.dest.pan_id);
 	memcpy(&hdr.dest.extended_addr, &data_ind[14], 8);
+	hdr.seq = data_ind[24];
 
 	/* Fill in FC implicitly */
 	hdr.fc.type = 1; /* Data frame */
@@ -2028,11 +2041,14 @@ static int ca8210_xmit_async(struct ieee802154_hw *hw, struct sk_buff *skb)
 static int ca8210_get_ed(struct ieee802154_hw *hw, u8 *level)
 {
 	u8 lenvar;
+	u8 buf[sizeof(((struct hwme_get_confirm_pset *)0)->hw_attribute_value)] = { 0 };
+	u8 status;
 	struct ca8210_priv *priv = hw->priv;
 
-	return link_to_linux_err(
-		hwme_get_request_sync(HWME_EDVALUE, &lenvar, level, priv->spi)
-	);
+	status = hwme_get_request_sync(HWME_EDVALUE, &lenvar, buf, priv->spi);
+	if (status == IEEE802154_SUCCESS)
+		*level = buf[0];
+	return link_to_linux_err(status);
 }
 
 /**
