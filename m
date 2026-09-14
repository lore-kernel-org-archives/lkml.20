Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2849EC4F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416965; cv=fail; b=jjLcOf8acoCoOhFIklANTernvx1oGh4OCaKWmVCffv2Z2L8HZbLlOI2eNpNsH8OdPDDG75VxxhDoMnsbBGzubAJkUbMqaQGZWyrRV43d4RLjEDZOcObyRx/AUZrD6OUZcSdkqB6dKJrbYaCsYlVTYDZh1HcIZ3D0df2R65x9ZnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416965; c=relaxed/simple;
	bh=30vD1Tcr5FjlLgdhCqyE7V+NtD7fd9dZyO8HKs3xtlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hRnecsERRzLx+BdI/zu1b0F3vnJY1bv2eB40bc9/eWFLXJYNdBkP1p9hkeiT0hbXTjKsK+9g0ZaoWXJRxbyD2Cb2RmrBcQfk2wzIImjPMJK00eudvAaU2KShhg9vYkPvWLG5LX7dXAlYU/vcLH+pMEX7k6mCUNEjN7FndKVphU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oBWy1p4T; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oBWy1p4T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh4ZPMUS096hAOslvPPsuY3mtVjftkbFrqtLGV7MqqOFQa9Vxr/sHPtlm+/UbV8HtKpRaRbdvHTzR5zG4UrYSsLXirnrz8OPzgVPfnoUYOoSSBBoHUMTV9lm5TjoXZlWs2u7FuTf1Ryteeunb11mfyTMRuOWRbz4sKb1SeAHf23cUudqYtdTy0VDI+mcEoa/WdiVdYPwCVD7/1PTgIFEpZzfNx+f++llvCFJOuhSia6SG/Lmc4JhZFlHY1MY/IAHAyvloQsrOto1B3vc6uZUFAH86e+3fMY/B+p0VwDiC0zvVGZRypQo9UK9j5p4y9Nk20iNauJ3wZqOk8yxCYCpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnVbdkHgTdASCFUIvn1WWIe5QXLKBMmkFeIeCEsmLeU=;
 b=Zj4ZJ6hGPTlvS7eH72GyVkZG5L/2jGtQuLf2eT7kkbjC91zfuWdVHdSqXA5ev1ks2FnE4MJTkfRK3C9iMxfXOBWiUYxd1gjWAk/S6aFpv9O4FWbUnRZWmGbB6aegnwGAPI+fcO27ftNSZF3se/NxEQ79f41ZzzfmFlVFxmKHrvKYSv3f7vCD6hGeZMAYd/OKJUaRW4tTS+jWAM5WF8MiKbz8pSF8PvEjTFsIPkOi/v1FM8a8hP8N7/980NV2HE46xlVSxWp3MSlC7XU8D7A4tcDOdQfqx2BNXy91j5ZnOcPHeW+feLZOQA9KYuG99wfWV8WnKcmqL4LumSyKNJ01DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnVbdkHgTdASCFUIvn1WWIe5QXLKBMmkFeIeCEsmLeU=;
 b=oBWy1p4TwUh4qIkFxv1VFPE100L+dSKJQ7hNxL4W0YNE2840q5aCqlLC4mZGmIWe3Foir99ProeEwCuEOV/r88atGzwBv1TjWiJINMkppD7FWg5ysazNF6UUQCw5ocMIOw+Uh6+8iZV7KHNpIvkpD2N3DIGQmBS5dqpV60mZn/U=
Received: from TY4P286CA0054.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:36e::11)
 by TYWPR01MB10393.jpnprd01.prod.outlook.com (2603:1096:400:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:16:00 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e:cafe::89) by TY4P286CA0054.outlook.office365.com
 (2603:1096:405:36e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 20:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 20:16:00 +0000
Received: from demon-pc.localdomain (unknown [10.226.93.156])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 73138300026F;
	Tue, 15 Sep 2026 05:15:58 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 2/3] mfd: rz-mtu3: reuse shared_reg_update_bit() in start_stop_ch()
Date: Mon, 14 Sep 2026 23:14:55 +0300
Message-ID: <20260914201456.2018403-3-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TYWPR01MB10393:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ffd0e878-9517-4d3c-9700-08df129cfe4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|10067099003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hdmnpmqZJlbh6A9yR2gvDj4FyNXg/5WEehbx8SFCanCqHE9rDoxmNx07FEEWfdkzf7stxv/Y51cGLwyO4DrbHxftMPdBI3JTnJpb1w7Mztf7/f4eti1hri6a+ztju8O5Q5S5WgIW2QxgzgrhcLgGHwibHHFfBfpTkhoUrdxbyt/fDOCINBdCM9thPQlDBCtE1DfTt3j6O8BPPzmaM8wr0GxgWWN57KAEyi2jouFCWDD4cMDEYumOdBgP1B2OrZoCdhDn1ahY5m20Pogyr1MaLIuMOUfSBAAH2hA1bcU5rrzo4qHTbFnH0WViocFsXxXrq6K70b+ronWEP284q9Skria6RMEyyF5Y0QngVOGzWE2He5BPT9FnR/Lgq2a3KqiTnpYSIatvBne0gT32STaw4CuiBuuBBFLCEMSLcy5OKkcTKvg8sfiwzMBxqGJjNGQQfbuMF3GDMsoDb6kvsazzyfezd08yUa1xur5ID+4/D4XAoOCXyawQckSi6OljbBipdp0F2043mhT6zlnP3p6mNvYFShKoR3/+L6zGFk02v8+u9RBh7+u5lUhKcj01RQwQdBxCOIQPvjD7e06NbxuKMspWDnsQJD0tO1gJtQUez74lyGt/V1ohj/8L+DOUplVpEf4RKmYEKy7P7xYoKFBE6gT3xhzgezb7EwVTRU3BIjVaT4IOdDDRu2OlXAJSVLlSzKz25v339x8Y6HoL5suaOw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Zn4nGF5/QAUInkii/NpvGwBe/X16uAifq0OWlOKvn2rWQp4yd0dIJ3QROmaX0I4RgEwvf+nN8x8ZWdEw2H9Y78TjpqMZyos1luuTR4wq5jwk8KvtFHFq9qzDHyORtDI5fWchjvRI/9bLCy9CnUwbH4fQqMZ37nDSI8UVHxXEsBnb5bPwJlX+KxgOOJTdTwdvrpS9guBbUgAXnA1cZRVSja07hJ5emUkUbJdLdBQuCWRKgBOb7kYsy1VCSWqAoAGkOUY0CvWvkNKkRT4qlpcEuwdF3BBckm258K6oydQTxLLRafVnGQyTZeHn09H3ao7SqL++OOT4Ay7AXVNXiW233ngyfc0V35opI1dGsGTM7iO8mASddvy0wW2jgB5exNP+0miS2HH7bE+jYbSJL1ynUURVyDMvLHe1DKiRtRgghkqkAoPxJDajnZ3AUKMV0Ocz
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:16:00.0057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd0e878-9517-4d3c-9700-08df129cfe4d
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10393

rz_mtu3_start_stop_ch() performs the same shared register update
sequence already implemented by rz_mtu3_shared_reg_update_bit().

Reuse the helper instead of open-coding the read-modify-write sequence.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/mfd/rz-mtu3.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index d809436e2124..88aa1fedf1ef 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -171,12 +171,12 @@ void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
 				   u16 pos, u8 val)
 {
 	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
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
@@ -243,22 +243,8 @@ static u8 rz_mtu3_get_tstr_bit_pos(struct rz_mtu3_channel *ch)
 
 static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
 {
-	struct rz_mtu3_priv *priv = rz_mtu3_ch_to_priv(ch);
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

