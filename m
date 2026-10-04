Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0053646EF99
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135702; cv=fail; b=fyGutdRwUy+IiyX1Pe/YAyKnYaEsa/ZpVmFX3e9DIVF5YiIlEIGm/5wR/DbKcPX26MSkd6ScMURPUfqdHpR5keS8M11l+PXVIwUCUUmHt0Xww6/ZubL6CXdC027JpiR5DjetkKpX3EWec7K9Ojt2Orlm0PaawAnWFBVcP4k88nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135702; c=relaxed/simple;
	bh=4udUjIndUMch4gigQBgVdOBlIce1dE7GZzuSPZ41FnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1euuUJby3tj6HT5EiFbYDF7EQ8NdT7afbbSzb4cvvFzhSTZaglL12ph+DFyn6isoUnj66lx/lwjycZYJaydNnHpo/yvz/DFv81Enb2PcRC7P8aGPRJUOZM9Lr2wFFPW6qtVa7SRWGshrMz8GE1U4P1NwepvXogs4nAXJKaXl0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=owlSFhwA; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="owlSFhwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJx4su8aSyHpaTgJFiTe8MkSNIGAXBmEBvbgfw9KbqtpJdMIvvI68WtttoINiM6Atl0wQknkqoX1bbo04PLH9x+mkkVSfnwPmVrwn64SuqvwdUfug74geRdD1eHRXxschFfZTTFjTzwFJc1u0tH29zZwavOhzDWYPv3yPQj613KW3qkM6n2B9QJP38wmEiQGy/lJ3l/bFQHzXXmHUsrtvQQt5UNZFi5K6GPhi6nX4FkZYCuLHb1ACq5QnT+7y3OEmhaaVfQoeCgahz2OoT0bwGyreOEC2kH3qPd5QKgsIi14sDFNM3vDGQP7RW7vl9pmG44DGmjjK2VgHd5+EQLpEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1m4sPypDNWjlienL51hcDndqembap+HMzp44Uc/Ahs=;
 b=JDe9KCpz67EbKEyrcUSeftNEkpdlJ81tT01XL8ywpZIxchrb9AlbMCm1vGB1nhnr4Hfw5EIQzHIWTPj/HeGb3Zf6wV7AfN17z8/O+Jfrb1ueXzwzgRn2tmdWSasd7u1wsMDGdtbkgW2w2MDWlOyoU+xYvuDXW8J72YEoLO+jjE1voUPrjUppERO1WfeBm4/S0HBQ7LX1DvCEwG2fqpqg/f44Sg2nzGk2tAr6OxuRQZEsA5308EOCTbtJBgPi7RxI/kFu7URsuBMRPvEjK/0mTLba2p6ihyiij7w4E0dLQWxUyyQ/FK4o56n+RYMYr48BdPJT/qNywNuLP9tWHwANvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1m4sPypDNWjlienL51hcDndqembap+HMzp44Uc/Ahs=;
 b=owlSFhwALAcn+Ne/zJkGNF4kWrPVBRBs+M9EUkxUnk3XxVlQVXITWVt5ye6uR8msAzw2zUJvVXL7kwvmKEiEMzgLyvn0+cvTZSSOXxmX6WKJGzs93CN9BSdTzeRl1n4cHzzLix2Q7D6c7dngYBMIN89EPcPkx5pNwRam+liPNy0=
Received: from TY4P301CA0089.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:37a::10)
 by TY6PR01MB17567.jpnprd01.prod.outlook.com (2603:1096:405:348::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 17:41:36 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37a:cafe::a5) by TY4P301CA0089.outlook.office365.com
 (2603:1096:405:37a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 17:41:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Sun, 4 Oct 2026 17:41:36 +0000
Received: from demon-pc (unknown [10.226.92.36])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 1293E300024E;
	Mon,  5 Oct 2026 02:41:34 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 1/3] mfd: rz-mtu3: Do not use struct rz_mtu3_channel::dev
Date: Sun,  4 Oct 2026 20:40:22 +0300
Message-ID: <20261004174024.502949-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|TY6PR01MB17567:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 513d2e17-fc1b-4c70-1ded-08df223ebd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|18002099003|22082099003|11063799006|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	H/iSSNt4r+rfqkmNduomZAD9QchafOCe14Tou+2ITJC7NSCK9xJMUE1b1zag3upJSxfPkI8dtCQNm/m3iSsXabeQ9eUusGibCaI4Soj6h6E+dhrgl8zTwafK+hbHf/J7WQx1wp2yEJDbpmfhR51rWJFnKVFMkJKx6DhnCvVPYMbEIOhbhir3ponT2WrMhkXMacfFEblNdYS1hP/BG8irRWtJq0dOxE6unS45j8X02KDiMB4qnrIDGIlU34sTfLSUzMqLaF5nPZpAsWkJCodniNOXhuNPt/FI6I/Dv8d7ukEdkYfWzBxCsb3WZ93HsdfD6ym/iycGFY3ei/A2DSC10vgcrnJBwQZsc6HGeb0tqwG3nfqF08XIaInEocXUvSsoAeF8B98mEjP1tT03XDEXSSbpR6v8xmwQSc8e6O0w+vdstz1Feryoc6J/cHrthEuFpNNGTdKMZ5OCWhjBnmKVlWKWlG66Wods5tQYu4aQ3cs6ZsCh3UOkznQGPK/+giPdOQw3eBY1OJNaNhuJCvYHN6maqBzUbs+mKmnfsdyo8j0zcACmncYEAdVW7gIUtPyWR8OxRgiFenO2Yd6O2fmcvbN2PRYHWfIJEKxYJ+oMcJj1aaPXGfg95UdBKi1robCJZaxdy3PnHWsGCX8zZMZtFP4z7tbhIzcVnqh6PypJhTIuD3K7+LdK047+9mXQZ5ilVkR1Bare8hvXhXar9oFXbQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(18002099003)(22082099003)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pqAr8y0lqmxm1LKQEHhZG/4NrKpFXDZE8ZluCGQho6iLf0wjJSGLsxTUmX0N8zPLRs/lsSE7UI2pl9k/RCpR3KD9hEtVgAy69tLB0296XFNrwjWSb8OuyTV7g69Ce7IL4oE1Pyl5M01/3z6qu3RleXzgo8gn1EFYlhmUdiFVMsA5v5i+87bwFcFo27mDEoNtLvQNmyG4JxlQmxkBII3xiZbmUmWDNKPxHX33LHfg4x64MBBGnwSC6sakYQprYz95cLuVBQivbdMQ0mcDfLB98cZV2xwc0fup0icIAQU5AZfs7aVhxy5HaVBe1h/XgxUZE4buAqhs1y2r5NrEcDbiCVwo548JgULP8YWYm1UxZC4FKwEH224kLqZLY3IEslpBp/dafjuskExEg5FBg6KlkKrpheJRWvfT8Xae+YEHdothc6JZHhYhI8iqObPJsRMW
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 17:41:36.5796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 513d2e17-fc1b-4c70-1ded-08df223ebd21
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6PR01MB17567

Channels 1 and 2 are used by both the PWM and counter drivers. Both
subdrivers assign struct rz_mtu3_channel::dev to their own device
instance for those shared channels, so the value stored in it depends on
which subdriver binds last.

The MFD core helpers currently use ch->dev->parent to retrieve the
parent driver data, which makes them depend on subdriver-populated
state.

This is fragile for shared channels and unnecessarily couples the core
to child driver initialization.

Add a priv pointer to struct rz_mtu3_channel, populated by the MFD
driver at probe time, and use it directly in place of ch->dev->parent
in every MFD core helper, so the core no longer depends on
subdriver-assigned state. Remove struct rz_mtu3::priv_data, which
becomes redundant now that every channel carries its own priv pointer.

Keep struct rz_mtu3_channel::dev for now, as it is still used by the PWM
and counter drivers.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * capitalize subject after prefix
 * switch struct rz_mtu3_priv retrieval to a back-pointer stored in
   struct rz_mtu3_channel::priv
 * remove struct rz_mtu3::priv_data as it is unused now

 drivers/mfd/rz-mtu3.c       | 40 +++++++++++++------------------------
 include/linux/mfd/rz-mtu3.h |  7 ++++---
 2 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 0a254e61ec0a..0fca16aaa566 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -62,8 +62,7 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
 
 u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 
 	if (rz_mtu3_is_16bit_shared_reg(offset))
 		return readw(priv->mmio + offset);
@@ -74,8 +73,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_read);
 
 u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	u16 ch_offs;
 
 	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
@@ -86,8 +84,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_read);
 
 u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	u16 ch_offs;
 
 	/* MTU8 doesn't have 16-bit registers */
@@ -102,8 +99,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_read);
 
 u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	u16 ch_offs;
 
 	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
@@ -117,8 +113,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_read);
 
 void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u8 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	u16 ch_offs;
 
 	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
@@ -128,8 +123,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_write);
 
 void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u16 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	u16 ch_offs;
 
 	/* MTU8 doesn't have 16-bit registers */
@@ -143,8 +137,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_write);
 
 void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u32 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	u16 ch_offs;
 
 	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
@@ -157,8 +150,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_write);
 
 void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 offset, u16 value)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 
 	if (rz_mtu3_is_16bit_shared_reg(offset))
 		writew(value, priv->mmio + offset);
@@ -170,8 +162,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_write);
 void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
 				   u16 pos, u8 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	unsigned long tmdr, flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
@@ -244,8 +235,7 @@ static u8 rz_mtu3_get_tstr_bit_pos(struct rz_mtu3_channel *ch)
 
 static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	unsigned long flags, tstr;
 	u16 offset;
 	u8 bitpos;
@@ -265,8 +255,7 @@ static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 
 bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = ch->priv;
 	unsigned long flags, tstr;
 	u16 offset;
 	u8 bitpos;
@@ -320,12 +309,10 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	if (!ddata)
 		return -ENOMEM;
 
-	ddata->priv_data = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!ddata->priv_data)
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
-	priv = ddata->priv_data;
-
 	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->mmio))
 		return PTR_ERR(priv->mmio);
@@ -344,6 +331,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	for (i = 0; i < RZ_MTU_NUM_CHANNELS; i++) {
 		ddata->channels[i].channel_number = i;
 		ddata->channels[i].is_busy = false;
+		ddata->channels[i].priv = priv;
 		mutex_init(&ddata->channels[i].lock);
 	}
 
diff --git a/include/linux/mfd/rz-mtu3.h b/include/linux/mfd/rz-mtu3.h
index 8421d49500bf..3884ae5b008c 100644
--- a/include/linux/mfd/rz-mtu3.h
+++ b/include/linux/mfd/rz-mtu3.h
@@ -122,6 +122,8 @@ enum rz_mtu3_channels {
 	RZ_MTU_NUM_CHANNELS
 };
 
+struct rz_mtu3_priv;
+
 /**
  * struct rz_mtu3_channel - MTU3 channel private data
  *
@@ -129,12 +131,14 @@ enum rz_mtu3_channels {
  * @channel_number: channel number
  * @lock: Lock to protect channel state
  * @is_busy: channel state
+ * @priv: MFD private data
  */
 struct rz_mtu3_channel {
 	struct device *dev;
 	unsigned int channel_number;
 	struct mutex lock;
 	bool is_busy;
+	struct rz_mtu3_priv *priv;
 };
 
 /**
@@ -142,13 +146,10 @@ struct rz_mtu3_channel {
  *
  * @clk: MTU3 module clock
  * @rz_mtu3_channel: HW channels
- * @priv_data: MTU3 core driver private data
  */
 struct rz_mtu3 {
 	struct clk *clk;
 	struct rz_mtu3_channel channels[RZ_MTU_NUM_CHANNELS];
-
-	void *priv_data;
 };
 
 static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
-- 
2.55.0
