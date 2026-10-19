Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792442564;
	b=1Hn9oWWp4trqlqf7wq84urPcj6THiIs0Jktdimqb5EjkhiNS5CJ8PIV5KErmnJxaIp+m
	 a7SBQbAg4XNoNPwlM9KsjGeugL3GgbbvdtCEGzkXI88wmffp2TkdOIVA/eg4IzoGNmtJk
	 uxtjHR2PbDX2AC+KL922ntuSVui+zHYyO72P3+JjuvdsjgnoV8IGG0pMQ6sTVZRmXzbbl
	 tmdGh20OEDQNyH/9qxfNsXmwi8AXMqRNWu6oZkzF16+ky9D9jDMVe7VtmKO9Yj9fZO9oi
	 ea8t6vIMas7NbGQWcMIx0hoIp8zXPfXRAFXTZ5aJD0a++cvpFiUUZmSzK8pMzw77NcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442564;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=ROatlRj3KVZS45TZhoeX32KVNPsI65bWTE8jl/FBo5U=;
	b=rlBJv8LaJarIZl5IPKW+bLhP7HYTY8xhFa1VRfPtgaOn1anpftjXhtXybeR1TAQlJEQf
	 +aBSBYMN9G7DvmPt6TzquQlXOeCwBsrvB0wteOKmBtT8/z9P7z1kKoAratGPtWStYQIYF
	 aGBTwJslHxl3zOj0SYg3Neotlj6DCXjSPyuTkiNtvTbI+bZ6JaFzTDUVc2XkW4359+plk
	 Q/pjuNjjbD9V/Cq61+fDWerIZFTOQCKUmmkNG8Rqca34BB3xy8etMPc7reHkEiMKTQYRZ
	 sNHGL3caQP7dMev9O59VBTJFwrbdldxactvo9CjnIk4+ApCeyncho45N8V3vtzMhAXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BOkMjzUL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.68
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013068.outbound.protection.outlook.com [40.93.196.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1FE606A31D;
	Mon, 19 Oct 2026 20:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=BOkMjzUL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qn6GqDvubyo9B5piUdmOdri/tx5Z1mRRTygJ21Kk0XEgu/btUouKk1o4D2i5hpZtqLHcGcCNpmNTyE6NJ4iAUs7yVlwu2ULar/KwGCkHOvB02TxShrN/GI3Zj0u6oXxrfqKbrNVgeXRYcVKpFsBtAVjFAMCr+t4eccqyLf/dXg8Hoeb0Sd5tFzFtNjPJYOx01tLEfhr5Qs4KPStljanywT3/O9lB6/YpCT+uAkgwAh/X69VWEkMCtgT8Z8Ys1rJ/1dbTw+0qXZ7y0gyvxvWfndPzeV6rZsZu3IT/S8ogEgfhuDcOpp9I0XmrWhEaLyPdMCJu4aeqoDcOaD2Uz+hU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROatlRj3KVZS45TZhoeX32KVNPsI65bWTE8jl/FBo5U=;
 b=ojsXNGcWi3ojplGdYbpUd8jhuu0lJW2JkhI4TwNuoSFMbVmeLRyv4RK3rYa8PoDUGIZeNqHUtKJwrF4X62pYniCDVLNEy1qwNlrqGo7GNyzrHHRu/OaJfYKB1W0pz8ZWGU4mdUwDbxkIJf6s47TH0dCtDzhJZtZRmm4AMtVao5iSdnDDxpPomKc82QmG7VgyXD/ipwSnWaimVQ/7CR3D8qV9NiQBAPRep9Tix+viG8T+2DTDeb7PDj9Z7XsWCE7FYh74Bh95Sbk86qnQQrARNxvGDKaKdxfojZV4QXXH8E+WbAZwXytZULxv9Y8W9MoNKzt9pHyU6qEoXnKCCPgz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROatlRj3KVZS45TZhoeX32KVNPsI65bWTE8jl/FBo5U=;
 b=BOkMjzULRARpRn5xZ1s2oWGkKXbz3XJ1/iXAo5veZ7Nt6HEKSYixlW/ATU1SvzGVOC6z6bhWvS5MpgwsBwM31AwL+ShjVeucoFNrzLmJPqLcqHsHwO/V5WIsErol+tiuv5TMVWy+DhTYDt7VMiD1pk9ec5ItnG40zxsTaGvDK1w=
Received: from PH8PR02CA0044.namprd02.prod.outlook.com (2603:10b6:510:2da::9)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 20:42:39 +0000
Received: from PH5PEPF0000002B.namprd04.prod.outlook.com
 (2603:10b6:510:2da:cafe::3c) by PH8PR02CA0044.outlook.office365.com
 (2603:10b6:510:2da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 20:42:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH5PEPF0000002B.mail.protection.outlook.com (10.167.243.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 20:42:39 +0000
Received: from quartz-7b1chost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 15:42:40 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH] EDAC/amd64: Use the UMC bank's AMD Node ID on Zen6
Date: Mon, 19 Oct 2026 15:42:28 -0500
Message-ID: <20261019204228.1053516-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.55.0
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PEPF0000002B:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: d1106ddb-de10-446e-6c20-08df2e21841f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|18002099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JGQufdWZuoarneHcviCaZkRsdGAj0pxW5QSvGQS4OBu+KlBol7G7BSYYv0iXHitJi1Su8f9X5NYfKMEuayDXTpmL5BbepwaUrd0F+5526d/wL9uGBDUjmXt/Cdg49nJQrzPcvX8gL7K2zkcR5vH+b1gZsjGZ3DFzxg6ZeF+XFL2qjPImtoPeOhoJ5MfY5BUnVhJ6QP8TgJCBNZ+PuzdMWv5LRlBhKRgyEUuWhN0zhCweLhv8r/Yvnl7RahrEM+qbTnuZUVkNEaxXDVHAR9B5PYbCCwCuwZrs91ORhPlYhDOdecHPIA3WHSxkDwxAwlhOmOz4xVFLftwgMNdxQQNndQD6lQiI3xZ55SaeiKY+9AulRs+Sukn24B7ybJD4rlRF6ee5J+GcNKlDBN3vMmCDcvcrWqtoTRr67DnZaT2iyL7wPF7jWVa5/sA8VZ4FrWxCPBDA1BEQt68um8ZJhDV3iIl5qGC4jOzkEmkFNVuvZGSzqHakXlajPuDEJfRap3ZZ/SIci/AxD/JtO7Vbr2uQS+w/TxW7gXZTMQcbDW5VdmpKPUuO60EEJP+/Y7Z/lKY9Is1+bp0aCW04Zo1BYsqirVxjQz6nGH0W9tv/ZoB8L8TXnOBlz7vfitHzJ9udx874fIJR3F9PAhz+65efy9p0NiHlZ/7pNw85LWecfP9Nrn2iPzCafHmHlVWL1MV01lCTriKLqE5vsBdXTF1BtlddWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(18002099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	u/CIM9ob3En1b/FFU4fOqPVhk4ZmnPqLlqUxA00VL158NIblMdzN1Dx4IqgHn22eS4bVFTDgJtRfhcJ8zYDMkK5HGSW8oiEbX6AktS97aYsAwH2WkN7ywNKZ0z0mPxREIagZEi/OuRg639bngcXZVfQO93I9PpYZYTNIHsxSzMph247gzjKVO24WXJMN7JGxw6+98BaWlZ2Q0VNLoidiI/uYVH2xDSXyNbvwOpvav847194hF8zyNv3dBZOogUdS8bjgdT3g3koubYoXOSX+6PxrJcFyKqZZfjoqMl/9czxSqHnRfW5KhwU4t/d/xRMDNQhzhXrfJZLkbnZB9va5umHbSlmVTFZpy09jKUNGbvit2vEI7SbV2ymENxY9y8FpSJrd/JpLHLkxGcg32spD7WFQiJGezRbBRvopZMEf333G+MWCHe7t7Y9IqfvYVbrQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 20:42:39.4223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1106ddb-de10-446e-6c20-08df2e21841f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH5PEPF0000002B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838

decode_dram_ecc() is given the AMD Node ID of the CPU that reported the
error. This is the node of the CPU managing the MCA bank, not the node
of the bank itself.

On Zen6 systems, a UMC MCA bank may be managed by a CPU on a different
AMD Node. The error is then decoded and logged against the wrong memory
controller.

MCA_IPID[InstanceIdHi] holds the global AMD Node ID of the bank. Use it
directly on Zen6 systems.

Fixes: 6fffa38c4c44 ("EDAC/amd64: Add support for AMD family 1Ah-based newer models")
Cc: stable@vger.kernel.org
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 0c0d11c72925..7adb79c658af 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -1044,6 +1044,10 @@ static int fixup_node_id(int node_id, struct mce *m)
 	/* MCA_IPID[InstanceIdHi] give the AMD Node ID for the bank. */
 	u8 nid = (m->ipid >> 44) & 0xF;
 
+	/* The managing CPU may be on a different AMD Node than the bank. */
+	if (cpu_feature_enabled(X86_FEATURE_ZEN6))
+		return nid;
+
 	if (smca_get_bank_type(m->extcpu, m->bank) != SMCA_UMC_V2)
 		return node_id;
 

base-commit: 0489f2176209b710890096699c4b869f1db91df4
-- 
2.55.0

