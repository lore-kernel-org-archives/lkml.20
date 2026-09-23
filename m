Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A4549B1EF;
	Wed, 23 Sep 2026 11:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162436; cv=fail; b=d4lgZEtzw5f3JvGxT/7vinV/J1NxNL3jLHcqIlj5aEZnsIyBbEuV5aufCmTNP8qoQqepOHIhit29rN3kFx1GQBVtpFq8bgAS079T4zAhzpDvjwFT1M+ouH52+g/Vl+JNXNUAPkTaJkyKz0FlX3fyNgXpxJRpPQX5jeIomQqISGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162436; c=relaxed/simple;
	bh=nwL7l+2/va5rCHv+Sz9IejrgsfshWb/1myHFrvSqecg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cNjecyzxPSDl0I6Xh2keEzfhTyCOI6ajT6eyzfGfEx733HUXvg0UDKPYYfBlHMMnU2ZUvQCy+014S7BOyH7zAeFBjSWqspJzPQ4jh02QQRCdjjc6gNrAFzAzx5vwQ5HlSo+1/hhJer75rPc6QoCuEvf9UiZMWDmjE61rHWY0sKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jm4kFOpc; arc=fail smtp.client-ip=52.101.53.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jm4kFOpc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6CkIm2DcUgnaq1OTrS2IOQqaNu/LX47js0dXTguxHFduKRiv4/UgI5j9d6mQavec9Sfa+m2Fn4XqhkFiiMmN9pQ/lrcb6C2lg9NU0e7cnVy6QucgfU6NOLEU+HKrP3vmQFs0xJA88syh/P5Mdyk5ZG9bqf88lpKnuO6/7WzZI0SbVT2gZlk/RPwm3Rc0Ipd3NsJV9LNIc4soBnPb/LCMYSlK81JerSBfnjW6zXNnychA0klVTmP6Pa+p1cOrfC8gd81I5faSHQqTXJ6vTUniPyF8jUSli6HBQI4F1IX+RZXhEU3W+zvYilkELvTWvTs8RCufckakO/x8aZO3ojB6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUHXmE1ecYNDSwXJJTehtj322aYUtBOxOpEODNtKCV4=;
 b=G7IpKvGdqnnlYVKcUmw/J9BG7Xff9u3F9xRmhCWYHjsa0Pm+O5r8ITQIUJhgerzANVg59hmdrOyEBvvtsU2dlkcziBgemOtOXHs7sEWCfjDcT080B4rqnd1892MMj4QRKMz+KdOgQx7Tby2IusO2frs18OcqWcWsc+mffvhGzTfRh9YtY6Z/lyDQ76NwoN9P6VO/6tatSSZGxl/s+/mXvIX8he9gsfw5tsCjL5GFxHe1YDvgXwt3G1JbvztwoCJ3o5Ag5bhlrlP0bGirmnLsMTaqRuEFpmBm39Nuxar7YmHHBil0hpGXcDI6oArt1l5VcfwnGJkkMIVUNZThylmMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUHXmE1ecYNDSwXJJTehtj322aYUtBOxOpEODNtKCV4=;
 b=Jm4kFOpcYHAjV4CH0zpVKO/w2JpACO+E8Q0iUaWQKFI8wW/+/ydVjHViXEppLHxC5ZFHSWQnKayK7yntiJmNX7mKuSlvSU33YyFU+e5B9Cyttn5W7RA/KFUCT6xbZdIY4Za4+ozIMZ06R1BaCNYPbK8gSBE0Sefw76Ar/dLd8hI=
Received: from BN9PR03CA0861.namprd03.prod.outlook.com (2603:10b6:408:13d::26)
 by MW6PR12MB8835.namprd12.prod.outlook.com (2603:10b6:303:240::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:20:29 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:13d:cafe::74) by BN9PR03CA0861.outlook.office365.com
 (2603:10b6:408:13d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 11:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 11:20:28 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 06:20:26 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH Intenal 2/2] EDAC/amd64: Limit UMC csrow decode to the implemented chip selects
Date: Wed, 23 Sep 2026 16:50:03 +0530
Message-ID: <20260923112003.3677719-3-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923112003.3677719-1-Vishal.Badole@amd.com>
References: <20260923112003.3677719-1-Vishal.Badole@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|MW6PR12MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a843a9d-d926-4d73-5b30-08df1964ac1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|56012099006|6133799003|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9lgMGv98xl2YeY6umZ1b8+9QUg4yGLj3vxfUpi/t5WMC1dM81yNWpcKQb8aYZp02P/s5NVk41zGuBS7dCa8r9aFbQ8iLfH5gyfSmpdojBs23SvlbsYy4rZcGwpho9ovT+lPyWlfBcXMBgOx93pJpwkQTscHI7U+e2RG7vSevO3F9prwFnUo7lPlv+Mju2qQ6dH+paExgjeNOpmh7IWxEAtstBC3Pr+en1mhfSTKRvS45Ca/J/UmWce0hjdij1ICOmb0DeZE9Rop1FQZfssZNBpotBOybrZPNGx48F/sStFniF/Cu1cLsY8bzi5kHH+UdWqeupr1K9qEvGwZM2JsX76HURdOjVp903ih+eDNbpPGmZzCaW+tPpGNpOHQ1yTYvQIBZs5E4vIYVx6e8cRVgoqxfQHnqhZcbYHtkUL4HXrpzqLmsqXF+aYFs69OptucmNSGE5oCOlzNeiRK8qEu2RDg1dJpTR4qW12F1LdOmcKSzAY+ke4G/dapWL8gbKpfPFtDMvHHingC6thdPO7iIwtO6ibWxD0D5LyMTMvPq9zMBkL2jbYrZQiZyphiww8ymadHOExtjphG/B0R0oZrK170u3dTvcBwafAyxohOwzVMz5id6dGRDrbun+jyuEIRqkcjMHwF17cyY6gCZlqWId1La3LV0Kl/p/Z8t2kughSkINAGBqsErqmyibE09o3ZsNZYI6kh7s2+UQgAINeb8fg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hIlfrljgHqa5KLS8DcuLAoAFX2C5Yfh3eUuwHysuhlO2sV6YeIbHBffyykymUSIcOKGbbm4yCXXibvkCjW8BfP4x1/j4ZpoM1Bu5hy55SjpSZlk0+V3q+cByucLKjEj6M8nq7dwVKoGRGRApi/7f87tpTStEjMO8NmstDhu3Sax8FaSVyqRSpy7GPnfmETuU+emFsQy0Iti2avYSUYS3n3mF3c/1OMJIkur6uyevpZW/bhddQ6cluPFaSbxw9NS6+OoplC/9AJwrkIYhRtTp5b7drqtZMoR+5Y4Yiua+TftUaJE3wrihdVTBj3kto/eaeVYTAZDhNOJzIjpbwDPNoVIH9/BG0dusewjTxQjr1Ma9b+B2BHCKLISWNwVZPrPvl3K+VN5RYjDRGyJpnE1lNqFUT1Nmqwpso8GWQAjOCFHGw0ekqkItnr/eZdfoVD4+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:20:28.4311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a843a9d-d926-4d73-5b30-08df1964ac1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8835

For DRAM ECC errors on SMCA systems, the Chip Select which reported the
error is encoded in the MCA_SYND[ErrorInformation] field. The EDAC core
uses that value to index into the csrow array which was sized during
probe from pvt->csels[].b_cnt.

On Family 1Ah Model 88h a corrected DRAM error results in:

  EDAC MC0: INTERNAL ERROR: csrow value is out of range (5 >= 4)
  WARNING: drivers/edac/edac_mc.c:919 at edac_raw_mc_handle_error

and the error is subsequently reported against "unknown memory", so the
DIMM which actually reported the error cannot be identified.

This happens because the syndrome field is masked with a hardcoded 0x7,
i.e. eight possible chip selects, while umc_prep_chip_selects() sizes
every UMC channel for four. Bit 2 of that field is therefore not a valid
Chip Select bit, and whenever hardware leaves it set the decoded value
exceeds the number of csrows the EDAC core knows about.

Mask with the number of chip selects the controller actually implements
so the decoded value can never exceed what was allocated, instead of
relying on an assumption about the field width that no longer holds.

Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
---
 drivers/edac/amd64_edac.c | 13 +++++++------
 drivers/edac/amd64_edac.h |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index ff0ebc8e15f6..f6f9b8e63234 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2796,13 +2796,14 @@ static inline void decode_bus_error(int node_id, struct mce *m)
  * the instance_id. For example, instance_id=0xYXXXXX where Y is the channel
  * number.
  *
- * For DRAM ECC errors, the Chip Select number is given in bits [2:0] of
- * the MCA_SYND[ErrorInformation] field.
+ * For DRAM ECC errors, the Chip Select number is given in the low bits of
+ * the MCA_SYND[ErrorInformation] field. Only as many bits as the UMC has
+ * implemented chip selects are valid there.
  */
-static void umc_get_err_info(struct mce *m, struct err_info *err)
+static void umc_get_err_info(struct amd64_pvt *pvt, struct mce *m, struct err_info *err)
 {
 	err->channel = (m->ipid & GENMASK(31, 0)) >> 20;
-	err->csrow = m->synd & 0x7;
+	err->csrow = m->synd & (pvt->csels[0].b_cnt - 1);
 }
 
 static void decode_umc_error(int node_id, struct mce *m)
@@ -2841,7 +2842,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 			err.err_code = ERR_CHANNEL;
 	}
 
-	pvt->ops->get_err_info(m, &err);
+	pvt->ops->get_err_info(pvt, m, &err);
 
 	a_err.addr = m->addr;
 	a_err.ipid = m->ipid;
@@ -3514,7 +3515,7 @@ static int umc_hw_info_get(struct amd64_pvt *pvt)
  * UMC1 CH[3:0] = 0x0025[3:0]000
  * UMC1 CH[7:4] = 0x0035[3:0]000
  */
-static void gpu_get_err_info(struct mce *m, struct err_info *err)
+static void gpu_get_err_info(struct amd64_pvt *pvt, struct mce *m, struct err_info *err)
 {
 	u8 ch = (m->ipid & GENMASK(31, 0)) >> 20;
 	u8 phy = ((m->ipid >> 12) & 0xf);
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..9a8b7e296087 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -467,7 +467,7 @@ struct low_ops {
 	bool (*ecc_enabled)(struct amd64_pvt *pvt);
 	void (*setup_mci_misc_attrs)(struct mem_ctl_info *mci);
 	void (*dump_misc_regs)(struct amd64_pvt *pvt);
-	void (*get_err_info)(struct mce *m, struct err_info *err);
+	void (*get_err_info)(struct amd64_pvt *pvt, struct mce *m, struct err_info *err);
 };
 
 int __amd64_read_pci_cfg_dword(struct pci_dev *pdev, int offset,
-- 
2.34.1

