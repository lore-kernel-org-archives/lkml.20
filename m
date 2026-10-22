Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792643217;
	b=H4X+t5rx4do7yQMRLz0ycwyb/pNuUWxJHbwPCgiukVh2qsL8313fPaltTb08JZnVYE+c
	 eDtDTwQb5guf+73n8qa4AQ2HHhocYTDdIgO4kafSswu2AN27AJ5jy3d7Wqx+ppRggCeHc
	 wLae/KJa2LsN/5KRQUCUix1mjl1MRQvQZxtahMpLwdy8LDZ1MX1NFAYRpzGLWzh4gb/1a
	 KzAGsGD3BoMU6rYDOx3xd7mtcyPcZeDm18MWgzAmkgwSqOF7tUnwfuFgc4XAs6Aq9ftoO
	 ggfENp4Og8NLUjCpNLpZa63emyaXrpHyFxddE0RsLiCJY4Dcs7Wbaop3swhnt15jvLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792643217;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QyrPU+9qb7FlzuMPTalwYRP4LzjdbPzuTGPIxXyilBE=;
	b=mmJxlui5fMvG8AcrT88JorZKmvt2UI0c6APV5/xei5WzPtvxQf3BjPfIs/vyVBm+9jlO
	 2o8hwyNvfuH067uLLtj/bITrHcv10jEU7QmfBx/2cIw6uzoImHyN8/LMg/GmgRVI3TXII
	 kXXeWvyxWtyjK+MfLbHgAHoV3x7yuEnMriJGcRSqr1aIDmBhNqRi9/4R+lTywgUW/e054
	 R8kntlzlRUzeH/9SCTJObZmw79i+NcNvVsWkepRT9nRgMeveEObSkZnbGs5TkrmkDAWuT
	 g58bNFddOnCzpNqw1QEZXVLSeWukA3z4xPC4ipyc1mWAltU6eSJt2JRbFIn6+f1PCcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ehy6eXZ7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.16
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BD606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 778BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ehy6eXZ7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k77TMzNtKwKvlhHmf6lNcAsJ39DKVNPqcPSUpYS62R6v7J1MTDNkltPn2HwBEY0XBcdh/sUheWqpxBmp20rwErNpKqbimkZ5BTUqEhEhDD+fR/HtO7FFVHHoXjs8k1GfsC6HkVhYNdz2EeZ/9SI4VJI+Z/2mQC61NdyKI8Q2n4Gczy7063hdOGFDbbiTSc6G7/fVuhMTPjFM6d0T1JPNjIFFYSr2jtqVIqE4IJGRlqFNi9C+AKREsTQXZle1aGBxV6okeSKsX+LrC9Z2Fk61U6wqG04p2ZwgWp1zPMrTs3+pbZgF6mjcq1/OF6d5zX0TXyvZwWOLnduhQA4vP1kflA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyrPU+9qb7FlzuMPTalwYRP4LzjdbPzuTGPIxXyilBE=;
 b=fWtbQQ6z4XXLKP16KkTVA0w6d2tIYEh3U8WjkuJilUULUqHJObk86Lrym/+3OJ1FHPH/2pFYusevQLOtEfazz5vHGu6ki1UgXkw5OdcRRNRaw84tUaEKW/U6obWudAmahSLxXfcSPgM72fbzCubCX6mcZ2uYmR1+TYfEyyI4o4hFdKU55y40QjY8QeXREh62q7qr1iNjbj8tD1bC7Gx3THFBl+J6ciZFGOsRG9N43qhQ9dFrMqivNoDyWY9dep9WwHzr5OVfpIFD6/6mTdyC8dvGl76Qh1xnE9gUYmH/0b3TVTeW11/1BW8nV6UfVQx5Ss0t14QER8firdGrVq8prg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyrPU+9qb7FlzuMPTalwYRP4LzjdbPzuTGPIxXyilBE=;
 b=ehy6eXZ7Jq5DZuu/DVPJDfWNAiflkEhi8j4qwdXtydQponH2mQuVwNNJhKW0cONfKoEiCYP01R9F/ikat/chKs6ylM/b+89WKIgKjLmLaWk9RsRSXaYafX8e3JPxB0Ih2kE3TI5OQwaqIvsY+TdrbVGGaISs3HJW8hQc//nH0go=
Received: from SJ0PR13CA0063.namprd13.prod.outlook.com (2603:10b6:a03:2c4::8)
 by SA3PR12MB208015.namprd12.prod.outlook.com (2603:10b6:806:517::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:26:52 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::b) by SJ0PR13CA0063.outlook.office365.com
 (2603:10b6:a03:2c4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Thu,
 22 Oct 2026 04:26:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 04:26:52 +0000
Received: from purico-9dcchost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 23:26:51 -0500
From: Melody Wang <huibo.wang@amd.com>
To: <x86@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Tom Lendacky
	<thomas.lendacky@amd.com>, <ardb@kernel.org>, Melody Wang
	<huibo.wang@amd.com>
Subject: [PATCH v5 4/7] x86/sev: Add a function to contain all SEV-specific setup operations
Date: Thu, 22 Oct 2026 04:25:40 +0000
Message-ID: <58bdcb5fef22cbd22ea7e11db11cf202bca6ba9a.1792206487.git.huibo.wang@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792206487.git.huibo.wang@amd.com>
References: <cover.1792206487.git.huibo.wang@amd.com>
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
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SA3PR12MB208015:EE_
X-MS-Office365-Filtering-Correlation-Id: da935d0d-a96a-40b2-b8d9-08df2ff4b2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|18002099003|261021123027099003|22082099003|261009223027099003|11063799006|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8JiTJDvTwNywFSXshfyIZNab+PeIHLkRDTLu8uyXHTWRFk3YAwfvCDTR+T1lyCQPxKd1Z6btMtpFtZmISQN9jy2cEiRYGmyt1203Osexc1OdzB5oLE4eZqNov4kURrp1SySiFDozfFSOKEyrv88Mgk7Zb/9Yubmuf4P0PrxANrELU8exbY2E6DR9sBROrMB1xzMAd2xCkOhsgQe6nvRbOePvSJMUTsiV3N2k12PTsTA1rfp9Hhz0VmRavYoRzFxhCTdxGEwV7eALbyPKL3+OCpE/2kE3CY5Cc0OJO7pThGhnpMLa2tK4pSfRe3e3SHL2sxgeB9I5ZwFcnecJ6dTQucXdfvzFZ7jACBxBV0nrNeY4b3g8I5Nh3QUGGh41K1/w3iJWL5FC1QYY7Fr7oLNBqJxcLkrsJmntpmagumnJtwrKl6vpBnG0tie6npwmt+5BB2vO43LE6H2IdC4zHfVIrZqAO+lRa+zDdUjemn8v6pDmtdBponJcIDAksIDDOwvSL5asN9snIa3+d9rpdY+CepAeYzRdMgzk6v6jZ1By9PbOvHZgHzKSZVwHPcvViFi/7c0LbmNa/3/WSuxAT6BB7+tLoaWP3mb1QksJBpzpWJuQNT49kpq4aA5k75jhx+WaTWjF85BAgEEy/SlsHOlnPVCFTfByiSvvp0vCVrKzm/55S0oHLqtFlP5qsmQvi30lIfaV3ngL4Tkx7iP0sAjg2w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(261021123027099003)(22082099003)(261009223027099003)(11063799006)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2cwT5cYHzgkr+WbvPHrbCyTYRGT32mu10m59SrpkUJEAhcRfp9taCTCMz3dHXRe0PmNZeInv4+soksJ5JIxeQGjjKkWsQ2sc7rgd8L+NKjCPIpmsevVE2OC9AB1PSbZS9ZHNqOst3qdkqeewTjLzhS8LIF4GAzI5CO/Y644vTyYhSdJe/ILaEVmems+caAWzZbDS/jJY5HGo4eNQ691VgSubVMTGYwA2KAvhUuASYFLeEsgown+/5nQsRynIM+ReD5EDdLtvM5gfdM1lGaJZFuRHXxiDbptnELv+J48Wv+6hHKIXtqNprYZ6/poc8QybZG32baOqLXsnPFm7OFRg7UDJw5ALMZilcceXf5GXTXZraaAI80DPBbFR10Lhe+zC3Vbqwd4/zJIrnmDxzMAxojYUEh1gF5XX5MuxSBelUreFDQy7B8zjw0ocjTwmaYDE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:26:52.4560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da935d0d-a96a-40b2-b8d9-08df2ff4b2a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB208015

To make the code clean in the boot phase, add a sev_prepare() wrapper
which contains early SEV-specific checks in order to have all that code
in a single place.

No functional changes.

Signed-off-by: Melody Wang <huibo.wang@amd.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cef32e2c82d8..2a1fa773d241 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -783,7 +783,7 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
 	return EFI_SUCCESS;
 }
 
-static bool have_unsupported_snp_features(void)
+static bool sev_prepare(void)
 {
 	u64 unsupported;
 
@@ -791,9 +791,9 @@ static bool have_unsupported_snp_features(void)
 	if (unsupported) {
 		efi_err("Unsupported SEV-SNP features detected: 0x%llx\n",
 			unsupported);
-		return true;
+		return false;
 	}
-	return false;
+	return true;
 }
 
 static void efi_get_seed(void *seed, int size)
@@ -933,7 +933,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 
 	hdr = &boot_params->hdr;
 
-	if (have_unsupported_snp_features())
+	if (!sev_prepare())
 		efi_exit(handle, EFI_UNSUPPORTED);
 
 	if (IS_ENABLED(CONFIG_EFI_DXE_MEM_ATTRIBUTES)) {
-- 
2.43.0

