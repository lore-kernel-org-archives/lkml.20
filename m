Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010062.outbound.protection.outlook.com [52.101.228.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F04E49E5EC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416963; cv=fail; b=ZjfwQ86SIAGq+ClaUUl96zT9sDZIHT7mYpyEdusiSXRLxtUk7r401VDL/Ft6e2P4DXAszjP0Lw6tKvFozz9ETbctJZyxUryaSQmIgNO2E144jr82ghu9TMWqaf/TDGAN+b80IY2stWuDNBqysPHSrX8cFd0JWrH4shQqFyCGnag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416963; c=relaxed/simple;
	bh=t8bsygYQFB4cJt6KiM7uas2AH6+yP8A62DdUz9+XbTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKxM3ivFwSdGHLnTq16e3jr5L2v0a24lCaUzgzC0VU87xC+iXX0vgGluzeZG7OY6j/soWCqmo4CeDOA6zVzG3/NnY23xp4s2GJU3hQ6Kybbbwcd0RcRAShhWpQRcT1rxtwbMjqTsVmUkFWouAj8/aGGGJ9gZkDQPnVRsPzlfDt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YtTXNJEk; arc=fail smtp.client-ip=52.101.228.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YtTXNJEk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFVObTWLZZeGw4MPdba8qx6ZXYLqajA7Obdd6V1lVaN4AsJS2tpsl5vpV6X75p1BvQ76FVsxLloujABK8mvB7JeAGfuXsf23rReC8pUotIgnCxvMYik4qmaXBrjv2wdP7r39Wxd8RZ+8yjrx3fbCPeQHkT8eMQLcghlrFoUmYjcYYgWznbY5enulvbI3a2hOcxrrgCmTx0OJ2b1T7a3oYfFVM+cNSRq1qsJDHIwHOsebvrGmlUrsQeHC+KrYFoq6LPtGX8H6L9jA/MrMp93/ZjrSzzSqfOsomBg+iK3vo9qvthXFLy+tYwOOgsLoWUWEh4rOBtphWFTta24iRzwKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5ovWw/djs60bamXLV3iewL0ukoTqaeEgj3TniqV9S0=;
 b=kURrD6Ud1x4idxVMhS1L7rzl5vVqVCpoQ72O0aF++cNNLjtF1ehRjhJcBCuAHxWRvnl8H0rNeI8lJTWcZYp5aIXfYhDIs3MVGHjNdxv5MA9l4uNva0Egq2A1hoCxnFvMf13cev9gLBcg4U1v959NfU60Zn607/LdrYrFDwbG6hlb6l5aqsktf9O2X92+5N/8S5WO36+UZTsZZdLMf+Pb/ipq5lIcoq6BZOoImXAwUHuvDO9Kvod8B2CqU86ANQyZ2ulXuT6ZfdnuVlLSW+BxqZDGPriwB7bajWEr/SgZvku7TEsXKnDV7JH9U+35/NQzJgv5mqaSkOj13r1d98Q4lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5ovWw/djs60bamXLV3iewL0ukoTqaeEgj3TniqV9S0=;
 b=YtTXNJEkqtkILPDKIPg05Zz8ZwtNwitMyDtKAbnM3ZhHmabvWL3sOX/hg7hvV23ThriNu4NmSlQH8A+ds0atOp+jsVSL0WtIf8/tcd76KzdyWn8iVPpo93fHub527P+3d7WrCcIU1HopL1JRGkiAEd/eea8yor/WOysVEy8rScY=
Received: from TY4P286CA0075.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:36d::18)
 by TY3PR01MB10014.jpnprd01.prod.outlook.com (2603:1096:400:1ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:15:57 +0000
Received: from TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d:cafe::75) by TY4P286CA0075.outlook.office365.com
 (2603:1096:405:36d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 20:15:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005022.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 20:15:57 +0000
Received: from demon-pc.localdomain (unknown [10.226.93.156])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id E6D67300026E;
	Tue, 15 Sep 2026 05:15:55 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 1/3] mfd: rz-mtu3: do not use struct rz_mtu3_channel::dev
Date: Mon, 14 Sep 2026 23:14:54 +0300
Message-ID: <20260914201456.2018403-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260914201456.2018403-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005022:EE_|TY3PR01MB10014:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a34a2fe4-c915-4dac-2302-08df129cfcc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4ZeFXRUIN75rK6xg9rq4ZOuEPa/xCevrMETNKsF0SmdX3/h0cu4vZhdSEvEI2e3Khn4PvJMLsWMhMzNKb23b2aZxVeOZZ9HE8nUwxzOYEU9BHJuMoeZC3W9RMFRkjZ7GAgexdNDJKokceWw+cS1D2Cx0mGXjthCgT44JZDNZVOWQ3y77pP53ZwQUh+fRLrPdJnxK8NVrj59oFOygtnDaMcCAO2fenMw5lGjyia9N3JSyZr0Ye8RfdamrqBOqAY0ICtGiyhJcRK5PIrSOZ1D8/IYBAD5/NFoI6ThwJMTjCUIQGmYL2S7QvLKpIK7EoAlrz0VGM8kqmrad40ahlTu6yVfpR0cJ2Th3fh8pL3rJlaaKcvNLmXJmEu/zsHi+Lc7K/o1HmubtPYBYeaSYEbJHvrKhFGvquTB4zJwzkghdAi7KynlG+kIwXHfH8BCuM9WwGB2pK1kHzwamjWtMBd6/usNz89SrQJO+c/0Rm2be8dZlGYh1hj2RW7/qzwLvg/gDrc2ZTwQSypM0ikrt+pjPC56ACnqpgzFJsyqAK7ZlhWZzSwE+Zs2FcK3nLWNqG3X5gtzYflcfqiWCaI4sgzA6yHLCZPnNzAhL9Hmu236LDwoJxORetTu6/4N+GGbFYDOnpAslgj3V0nGKiEFX0jiBaPdkGHhqVd2kutqpIb+oWC9/BuMUylDcayvx2uLI1VxBPiQtt6I6lZCP/90CFqBy+A==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B3ZqHvl9rfe3SircV1FVbcqzt9s9G0AJvj8iglwwiMA8zVfkPjXZvjrVaGlB4o6g+3DN35GCLNVznR20T6/qoWsI7zN83WWpXwe9b33WFQHlAuGaIou77JJw4O7bV/QtaY75BpieMcY4pze4cL1W5KX6Vl/rvpGRkmI6m+Og0JhbWdchPpYG9fjbv6QlaLeAO+Mq7SyfJhtNQbeTjcCJrruQAOLLlqIhJn0VEjEsv0ahQvD57I6KJor6bBLHTGcFcbGLj9K9WNO/9jFgXAfvjjSCfdihP3ilKk+ONTh0Ch3BZwZU0iB7O9uh97r0DzIHng6B4m1X+2IA7n9ehO5ppH4pNMgPzFcfphioBGaAnVpzMT72u93CJXHxKiGOcGCF3nSz42Dghq2pdbae+EvGy6KT9ylouHsPKDlfTZaQKeJB+dESQq/c6peTI1OvN89w
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:15:57.4378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a34a2fe4-c915-4dac-2302-08df129cfcc5
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005022.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10014

Channels 1 and 2 are used by both the PWM and counter drivers. Both
subdrivers assign struct rz_mtu3_channel::dev to their own device
instance for those shared channels, so the value stored in it depends on
which subdriver binds last.

The MFD core helpers currently use ch->dev->parent to retrieve the
parent driver data, which makes them depend on subdriver-populated
state.

This is fragile for shared channels and unnecessarily couples the core
to child driver initialization.

Introduce a rz_mtu3_ch_to_priv() helper that takes in a pointer to a
struct rz_mtu3_channel and returns a pointer to the struct rz_mtu3_priv.

This is possible because the struct rz_mtu3_channel contains its index
(channel_number) in the struct rz_mtu3's channels array, allowing us to
retrieve the pointer of the first channel, and then its container.

By doing this, we remove the dependency on subdriver assigned data from
the parent driver.

Keep struct rz_mtu3_channel::dev for now, as it is still used by the PWM
and counter drivers.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/mfd/rz-mtu3.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 0a254e61ec0a..d809436e2124 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -60,10 +60,17 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
 		offset == RZ_MTU3_TCNTSA || offset == RZ_MTU3_TCNTSB);
 }
 
+static inline struct rz_mtu3_priv *rz_mtu3_ch_to_priv(struct rz_mtu3_channel *ch)
+{
+	struct rz_mtu3_channel *first_ch = ch - ch->channel_number;
+	struct rz_mtu3 *mtu = container_of(first_ch, struct rz_mtu3, channels[0]);
+
+	return mtu->priv_data;
+}
+
 u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 
 	if (rz_mtu3_is_16bit_shared_reg(offset))
 		return readw(priv->mmio + offset);
@@ -74,8 +81,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_read);
 
 u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	u16 ch_offs;
 
 	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
@@ -86,8 +92,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_read);
 
 u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	u16 ch_offs;
 
 	/* MTU8 doesn't have 16-bit registers */
@@ -102,8 +107,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_read);
 
 u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	u16 ch_offs;
 
 	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
@@ -117,8 +121,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_read);
 
 void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u8 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	u16 ch_offs;
 
 	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
@@ -128,8 +131,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_write);
 
 void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u16 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	u16 ch_offs;
 
 	/* MTU8 doesn't have 16-bit registers */
@@ -143,8 +145,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_write);
 
 void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u32 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	u16 ch_offs;
 
 	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
@@ -157,8 +158,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_write);
 
 void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 offset, u16 value)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 
 	if (rz_mtu3_is_16bit_shared_reg(offset))
 		writew(value, priv->mmio + offset);
@@ -170,8 +170,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_write);
 void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
 				   u16 pos, u8 val)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	unsigned long tmdr, flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
@@ -244,8 +243,7 @@ static u8 rz_mtu3_get_tstr_bit_pos(struct rz_mtu3_channel *ch)
 
 static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	unsigned long flags, tstr;
 	u16 offset;
 	u8 bitpos;
@@ -265,8 +263,7 @@ static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 
 bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
+	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
 	unsigned long flags, tstr;
 	u16 offset;
 	u8 bitpos;
-- 
2.55.0

