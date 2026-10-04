Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB41D4718C6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135705; cv=fail; b=HUZ9vLe11pw1AaRVPrc7xF4QesFyHAzeC4GDWRgI4zZ7r3xpwkv5PqRXAvAZCTWJijFc5kTz0hAqOTbEy8CFI4rzZ27W4UyG1Gn8+IiQ4PLoJZhdxf9nRkMfLsdlFuw+WFrYwJQhdHjo3zEpa2iJBdrDwj//X6YSxE4PjXxdPbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135705; c=relaxed/simple;
	bh=P/gUuZ3L+nck7vC9A+FMnNpb+EZjSJ+V9Got9JR4DKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GPfMEFundaMuI1EhKg58xj7ckmLiFGcNW89Ztw6Hs5rECIf5T22rWhMwHmR+A0XrTNh84jpMvsRTDe9MppEPkc9WKBgdPL/jKBiMNLWbHB3EkQ/KTKO9UIBhtBpu7g5I13rDd9trZQj/wpezJxekflFFrThpDo3Lnkjjpzi/pR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=RPRNH1Gp; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="RPRNH1Gp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPvl7paoJm90Qe54W+/gswUiyOOl5MGMUlXRODQf/5az2lxi3COqMFs2liexxogG0T5au4ECJnzOO/iZKXMOIs2PUFlLpslky0GiIjivJppAVpnFydYAQSGNaoqP94Ji+l2hmBB/xWmS3a1XQOQvgvRyuzhb0gcRLQnb8U5J/bY1PwSWiwcrTOQgUT6zfjLyscTwG/fss09ZO4Y0chE/X0WWSxIVtRpIuGaG8LY5EHy7zUTUosjo2q/xJSUj7Q5G3NviHdEb7TNhif0q5jouFdDpb9+6cUMCTmzMVaIDsO0vBNdsSdroadMi2zwD7BkaA8WeLTp6fhud/VSir9JRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIASjBkNmUnLRUD2/zjesG4Bv1jqe2QbCTleZXkst+o=;
 b=GlVL9ZTtlNrNDl5b401AkIc1HZ8PNekXEHiYjI357ZQDlKEuhFuY8xFkjZdZfgqiFd0ZwNgZ2j38mZDtmXBhw6bqQi4UWllAFQlxMVselXvC2Ac+VrUjLK4oHpiEAhJRNoDVFxWKNuuXoC/XjWIRxnWeccH3vPvJSza9Q4Hyykppji2+A7XGwF6BCZr0/wSQNMZE0aqZMsO07/qVFsuuBndlBFyPtMxx6/ENPWVMAzAfPz3NYwN0f3bt+qW3vqDZI7JsAvDYvmEAac+jaL22Sx3U2EWfnAI8b5slOHuvnTuTb6e26JBOfvEiAQLhLACW0Np5nb5aK2TiRbGCuiWDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIASjBkNmUnLRUD2/zjesG4Bv1jqe2QbCTleZXkst+o=;
 b=RPRNH1GpLYP4A79Y3nPJhVIC928c1mVAprTSWi/S7/7bb/n4UeViJA8j9aw0qpqrg5/shMMBCbne+5h8rMBt8z6tGBhRKxQqbOA6QqrfVTLKPO0D0fUEs+MgjOurqMd1tT+PdYI8xDcl7+o5ATdiW6KUhj6mHeR+oKotWVYERWY=
Received: from OSTPR01CA0077.jpnprd01.prod.outlook.com (2603:1096:604:218::13)
 by TY4PR01MB17064.jpnprd01.prod.outlook.com (2603:1096:405:339::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 17:41:39 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:218:cafe::4c) by OSTPR01CA0077.outlook.office365.com
 (2603:1096:604:218::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 17:41:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Sun, 4 Oct 2026 17:41:39 +0000
Received: from demon-pc (unknown [10.226.92.36])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id AA6373000251;
	Mon,  5 Oct 2026 02:41:37 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2 2/3] mfd: rz-mtu3: Reuse shared_reg_update_bit() in start_stop_ch()
Date: Sun,  4 Oct 2026 20:40:23 +0300
Message-ID: <20261004174024.502949-3-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|TY4PR01MB17064:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 978d9571-5ac1-433b-20b3-08df223ebebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	jqIUTi5A8bqH9g0XdEZA3y7ah+E/lSTunS5dDRrLFKKbIk7i9XEnAnFtkEqZoZMw7ismiHpyLVRyQJ5SK7pai6U+cuj+UJNCDB7AwDP7KSEVYOnLZFj1gTJ85j2Oz1CdSrv3k2tDxa4SPWO/WQrlfMQQGEBqSN+Q2l5ytAxPDoOysD5rhUqfn71wUgU/EbclRjsm9tXJib3+sEnYUoyd/EVIRGFohEGabGpQk8BX3Yb6iWjgm6+fhSJeeIJGrgf2U01MIh+j+jj45K8MSN5cqGJhO22kLRYqeniXWCNVvJ+8Hoe9CsURi3Pc2yvf2D03SLtezlHeDX9q16JsQWMWR4/f5gsydQ2uLiSM4kBjZOg005bonAoP5MI/jw7Bc48nxUake+0m4cKMOavRavcpLGmRjsDRGGbYxd0Dh8w+XFHtqImLSLhvg2cCmJqUF78laJoVoxnB+0lHsYCFqox8DrbRnzpSrqEOUDBnyDd+J2TAuT77QfVAkiOx/UOFHQYM0dRofdC4jVwLze4pzwUHIq6JoTpdHDmOOFqMyyeU4s1YxQJzbAOm822IXcKHpf0XojPZYxzIuQjpXY6EQNhv5Fj90a14BKC5fevUSRYSo0kbOuYj3cCI6BvOZBWScvkVWVzXbj6G39wPMv5zuOcqtghitFiJ1ZjZY5kWK8uEsI7DsJGF/3O3CgnFZdQMRcSs146conwoKXXS5seK61+HnQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Myp6oD7+EFCSRP+/VdkM3patv/jnLYcU7kEG3OGQEV5p4M/W9vqAKgDDeSRoMBpALsxgbNGEKBolymaF3j6jed3cWEZJUAeXN1wwPgzFn75Vytw9W39jJfe2640ab/snHnKAdilBUn9DVtRQ7/U2EaBnB1w9x6xl6O7tWC2IpbP/wd/udJaNMS3eGsKvJ8iF0+9kzH8rUJqMyR0dijjbUQoWBWol+Pkjv8FAB/8/f0LJm4pXEYo9EZuHUM3PEw39DRdcAX0O0520YH0o1WvHLqehkLbwYhQIH+OT8cNAKNGpLHkSvdBWOVAU/46V3dwziebp3cfo+z5mQD8muoki4ypQ6/uRm6puboMlmCquvl2vuPArGnyb4xJkIP+U+38nnonbeD5uR8iiCB+CWYdJnl6LHvCSo3qoAxvnr7T3Sm8cn8xtctTHqLTrStQkLoB2
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 17:41:39.2586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 978d9571-5ac1-433b-20b3-08df223ebebc
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17064

rz_mtu3_start_stop_ch() performs the same shared register update
sequence already implemented by rz_mtu3_shared_reg_update_bit().

Reuse the helper instead of open-coding the read-modify-write sequence.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * capitalize subject after prefix

 drivers/mfd/rz-mtu3.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 0fca16aaa566..5be1f5a4167e 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -163,12 +163,12 @@ void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
 				   u16 pos, u8 val)
 {
 	struct rz_mtu3_priv *priv = ch->priv;
-	unsigned long tmdr, flags;
+	unsigned long reg_val, flags;
 
 	spin_lock_irqsave(&priv->lock, flags);
-	tmdr = rz_mtu3_shared_reg_read(ch, offset);
-	__assign_bit(pos, &tmdr, !!val);
-	rz_mtu3_shared_reg_write(ch, offset, tmdr);
+	reg_val = rz_mtu3_shared_reg_read(ch, offset);
+	__assign_bit(pos, &reg_val, !!val);
+	rz_mtu3_shared_reg_write(ch, offset, reg_val);
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_update_bit);
@@ -235,22 +235,8 @@ static u8 rz_mtu3_get_tstr_bit_pos(struct rz_mtu3_channel *ch)
 
 static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 {
-	struct rz_mtu3_priv *priv = ch->priv;
-	unsigned long flags, tstr;
-	u16 offset;
-	u8 bitpos;
-
-	offset = rz_mtu3_get_tstr_offset(ch);
-	bitpos = rz_mtu3_get_tstr_bit_pos(ch);
-
-	/* start stop register shared by multiple timer channels */
-	spin_lock_irqsave(&priv->lock, flags);
-
-	tstr = rz_mtu3_shared_reg_read(ch, offset);
-	__assign_bit(bitpos, &tstr, start);
-	rz_mtu3_shared_reg_write(ch, offset, tstr);
-
-	spin_unlock_irqrestore(&priv->lock, flags);
+	rz_mtu3_shared_reg_update_bit(ch, rz_mtu3_get_tstr_offset(ch),
+				      rz_mtu3_get_tstr_bit_pos(ch), start);
 }
 
 bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
-- 
2.55.0
