Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD4433C1B7;
	Tue,  6 Oct 2026 04:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791260650; cv=fail; b=OJvWzaduucffH+J1K3mcQlKyBSaGvCFf38dzvai4YLB1vfG3UwwHjTnbhf9gI2cKCXFPb1B6NiiJ89thBuQpt5IlDznPtzVPdRCnJPzrPPzbbYG3HDqiVfv0W0lZPX3NpNMJwzVNx4Sh/jwJ4YTn5wN2RmESNHhJZNY7mP2AUYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791260650; c=relaxed/simple;
	bh=mnBeodSJ0um1TI+PK9ZIlZhWjSUwZSFD1uT5YafSiQM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SEhGp23mcnetzdtbsyDeGq08Sn6LOIxesKomT9O/VD59sDSglGCbWOSPR6u7dPS7Hi1nyWVuuBtIYBaIrRPdzreBZVUOxrQ1IWcxn/tzFvYNuNrBoJgmo0McOj1W2oyVJoLN9ghGySozmGlha8QdYW2E07qLGt3Wmt9tIfAZ7zU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=PRUNUT6x; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=kHOnmGI8; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="PRUNUT6x";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="kHOnmGI8"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 696396oL1428681;
	Mon, 5 Oct 2026 23:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Ue6g5Z+IJxmuM
	4YgN4o5fq3hyvpVZtMviz2+jAFFnc8=; b=PRUNUT6xTZb62rca+PCqQi50CkmZg
	fyJLTDjcSW/ALTaKe7u4iQFLvR19LqjLsvNGh3mLilTwsLgYJcUO01znND6kUyaf
	ocDhsDP4zANws0rbpEU8pqHhJF9gR09D2p4SBmrj+mJqbH7kji7dZd3R9+YeOvsI
	v91iIYoR4lsKEvMhv9izFpWKCeauz4BQig2XWGXT9W4uNPtnKlt+132rsIxLTfNE
	qNHcvgp9NaIPxYX+aqW5dEJqHVvakMWSuH+0QGlspqHchsOnmdJsEQLb/sy0halu
	uiFvM8PP8B21tBAaAcxMLyuHbiEAmX2Hl+VmeBa1ip3jKExR4Geh+i2Uw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h4d7dvprk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 23:23:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y3pMjP5gipvGhVVnNs6Q0cxpiBo+meXyZNt+V6Sbnbeq3p6Ht4r/9YOgVasqJySsEHAEIbnwwJqxfBZm2GombN5ZKM+F7V1s/zGyTWfdG3nmDV1fLqFYW1Nx6UN7hP6mM75E/mqDhdehu9nqP33rfXq6Swnr/d/HYpBT9isA3DWB939Lagau27lSEqyc1YacfjvQHR2+i1mI20boTY6dfAhXy6hB+MuNYhbFAz7FzeQ3Ey38Dx5mXHYywEFlhcTh72iCzMP8H/cHxKhogVrEG1bVwl/aljmGfSi+g4g3MPUaI5xS7bkzuZ4NysIxI/jVdKPxMlCc6KH1l1lXN1TiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue6g5Z+IJxmuM4YgN4o5fq3hyvpVZtMviz2+jAFFnc8=;
 b=uTjFrC8yV3i43Eu6wNN2jpU6nrCFiE47TzFDDqWmN07njvb8Rby1LPISQmem1Oe/+FL5m4TITMK5d4fDoG0GUDDUpIiw/IdTMueiQiBsVndndmB8/WK12c4Clx68OMe623ax6WoZXMg+xbDvxyfxJZDPF4uD42a5bTI3WQ/0ai+ANCABRmaaAR+SM01Sm4pRFqIEvEqKZL49a9wELdfzbUP8tpa/1MCZplJTywrAXQfR7OGwkxmVjBHuH/290tL+K2naRdUraiz2EVzAyaQ7Zhq0pYC3F9uw3/5yfkTdUe0NG7ba/4KoGB4jzNpQaad6OTy9Zxlvsf85R5e7vS0dqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=amd.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ue6g5Z+IJxmuM4YgN4o5fq3hyvpVZtMviz2+jAFFnc8=;
 b=kHOnmGI8iCdFJ+seKaHZgOCyICjRsXWxbFoFBr83UJFN/KSA6bBT6ME1ukh/+C3bk1ENUH1xmKL+IlGBhccHRp3zOdJ5IRQoKNoaXc/+dLk5wWnVNGGISESRtuVmZ6k7Gf30tFqmg7UAXAzD8zDtZQ4g3KkUNniyEHYcV4FyP3w=
Received: from DS1PR05CA0013.namprd05.prod.outlook.com (2603:10b6:8:457::13)
 by SA2PR10MB4540.namprd10.prod.outlook.com (2603:10b6:806:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Tue, 6 Oct
 2026 04:23:38 +0000
Received: from DM3PEPF000265BA.namprd04.prod.outlook.com
 (2603:10b6:8:457:cafe::4d) by DS1PR05CA0013.outlook.office365.com
 (2603:10b6:8:457::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 6
 Oct 2026 04:23:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM3PEPF000265BA.mail.protection.outlook.com (10.167.23.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 04:23:38 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 23:23:35 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 23:23:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 23:23:35 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6964NTH52472613;
	Mon, 5 Oct 2026 23:23:30 -0500
From: Niranjan Holalu Yogendra <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>,
        Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH v1] ASoC: amd: acp-legacy-mach: skip dai link for amp reference stream
Date: Tue, 6 Oct 2026 09:53:15 +0530
Message-ID: <20261006042315.1038-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BA:EE_|SA2PR10MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: 3766cbef-7f5e-4c6c-e1fc-08df23619837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|23010399003|376014|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	h2SdaE+yhwP1Ty0QpcSheLw3YZudPZuwolb1Rkezs5jtd7mzLQP2Reg8W2CW67jPTrp1L1OX1gxxC3DalWAYaWyrKg2NaXRwKmYaprFvd6oydJvvPOdDcyT9tlXGmDqIFu+HxNfYEtR2hg4vfdOvPHbYuZERvy+f6rtB55VUJBXqmzRz2viP2HvcsbJYjJ0m2GDWAhVWF/pJtM3xNltF2u8NEELd7xbHUfz5Lmj6MUGXtp64Oj+rvrpgrrjS5nX27UcPl2b6/+3l4yjWokaKjzN7XK7qmtI/gTYxEscEDO0XczHguR/oFJDW+t/s+ZKSKPqsTbnjYrsWZDDJHjtUyjpgE+TqkXD8hvIEFw6ZayT+p6a8jDHHbve8HAepH4jU7eB5axdMyTX2pNmVIAH3AJ5KNHRhXFLTJNlNwHIFdUHC2nSxMYX+SWy94WLzq73dVJD44CJz7WM7umK0XMvkXPj/QyzcvU8iZLMgmM3jctvQwBvpLPFMv5I31uVLqnSFI/fGkst2jTkiSh1MinbZHb0OWzx2LFwbhVVHCjgUeKE99OlvZsh+717i0IILYY5ezp7QJSp0CYfGLsl4W3PTnqQv40ehkqcnfmV9A3lQI4pL6tls500LvsZzrEOVItE2NoB6cMgOFJxOFJb3/X+DGoEFTCdj+CZhr6iDoEOzJmZfzhXGUVapsoJ1T0lXLfAM3rLs2lbYOzHSRl2pM2cJBw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(23010399003)(376014)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PF49rJJd9YkZb91Y65O3sLLGRhfPGIwtS3hKe2MFtssg0ZX/t2ayGSW0ujjIHsPDMwcdlOBbcNgTCdqy+D6V8DnmBSyIbsK2jM4dFDiPw8BZVV9McoTJJsuFgsxVI631ZC3Sy09YKdvg8g8/Y1PZmQFzVhR3Xp3oLa++WOTeEuUUyHeuGjXKGzxC/OCZ1OY4Ev88keV0JJv15kiqZdUdXrgknEnHdxpWfPExNmDAkARSkfUnGV8zMmE+wug+FBF0bFJTQKvBk2cg2F9K8HzP8e/cvWyeU2aR+0yjsyffy94Pukj6kJBA+5EkIHW44SN8YSmOuxibaKTLDxcWT1OjJvPzHzR46EdboXB9nfWTjYh5vYMyxl6cnX8hO6ZLcb+9bP1IKbHxBl5oIpTep71u7RndPDm9EwTvtE/bwmDQTJh4dL4WMxUK0n1XNvdZ5+2O
X-Exchange-RoutingPolicyChecked:
	x3/styAdfj7VI/4B/EBJmAA/KZVxHr5/jgk62E2VIIXX+pojBU2DoJtBCwQH6UzP13uVhJ9O/0MryCgYA3lI2hZrnmg8TcsUUBX1/dNosdhfxc6Mx7nbMNni9zuwjEBcRkHUZm16b5Is3GHxQ9Yqj6YhaeZodeZaPYsMiMsjXMB8x9TcpPxmGkZi8+U/9LAvaZYhpqw3SHdok4/ATTfwzjNH07MNqsdxFyMrcKvTjazQ5Fr9HPShFCf5uEXsyBrK2GXzZI6eQ1VsWG930VPFCSJ0UzHqR0EQDtCLftNkv9hYpBonzz+f2mBC2bhrDb5S3hADpz4c3teuac6f+tf9PA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 04:23:38.1584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3766cbef-7f5e-4c6c-e1fc-08df23619837
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4540
X-Authority-Analysis: v=2.4 cv=AMeVrcbb c=1 sm=1 tr=0 ts=6ac477d1 cx=c_pps
 a=vivBcqwirDOV8GiKLGAusg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=zd2uoN0lAAAA:8 a=QyXUC8HyAAAA:8
 a=e-5aWskjT6loJPdrAQ0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAxNyBTYWx0ZWRfX64XjMplaJCYY
 uo94rUVnQfemDdkHrsseDhnDAOMZQWH0dPHMvSYYe0AtHVS3u90TjJ7JBxeEh/vzNcVPqkP/mI5
 ExsY1quOZxF6aSlfKMbzu8LA6KVNgeU=
X-Proofpoint-ORIG-GUID: ZG5dPIZJXg94Y08FBTjxkMocuvzlQO5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAxNyBTYWx0ZWRfX6qE+POlad7J3
 /UomRjkG0HvAPBoBClHzvslt8t2UvWp964PpVxTpp3XQBQPjwJoix8uRtC+jkz/P7BFUhvphVrs
 FGzy7b4nYWqgXKp3OHgTOKczi3fjKqeGIrYIQ7+zjCHwzhOY545PkF0r7r8PAyVBnnLYXQAFRiU
 aWfkpvekoqhLIYrytAxZ69hCNpwBXhSLHG315yDjCW2fsYMAqEC1jZHr4znan48RD7n0vR417tz
 BKVhmOqsW5eGvtHkJQ2q7mvKzwicW86RL321fgN8VtI6tzGmEP2yfop7SCrWfQyNj9oo/U9S4PP
 tK226/FxPNhS54iCJ4oJ7hd3+WrJ5WhPooY4yhvt2VjiCqbBgnC2Bua/qRQGouBMWuE95VPI0LG
 e8wsaHlhNoIy1ZSE3iRU3VdEVbLDoZ+1Kn80TVbMIZ29VuhHy7nsISo85Y5SyqXjbsfzUi+YsRH
 B872TG2g2KhiKH8ixZw==
X-Proofpoint-GUID: ZG5dPIZJXg94Y08FBTjxkMocuvzlQO5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060017

From: Niranjan H Y <niranjan.hy@ti.com>

  Amps can provide reference stream to hosts DSP which
can be used for input audio proocessing. But legacy AMD soc
doesn't support such a feature. So skip adding the dai link
for the same.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Suggested-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 1a05d4288..a8b62817b 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -265,6 +265,14 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			if (!soc_end->dai_info->direction[stream])
 				continue;
 
+			/*
+			 * skip adding reference stream for amp type
+			 * as legacy AMD doesn't use the DSP.
+			 */
+			if (soc_end->dai_info->dai_type == SOC_SDW_DAI_TYPE_AMP &&
+			    stream == SNDRV_PCM_STREAM_CAPTURE)
+				continue;
+
 			int link_num = ffs(soc_end->link_mask) - 1;
 
 			cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
@@ -448,6 +456,30 @@ static int soc_card_dai_links_create(struct snd_soc_card *card)
 
 	sdw_be_num = ret;
 
+	/*
+	 * Legacy AMD has no DSP, so AMP reference capture streams are not
+	 * supported. Subtract them from num_devs so create_sdw_dailink()
+	 * uses the correct count directly, and decrement sdw_be_num when
+	 * all capture endpoints on a DAI are AMP type.
+	 */
+	for (int i = 0; i < num_ends; i++) {
+		struct asoc_sdw_dailink *d = &soc_dais[i];
+		struct asoc_sdw_endpoint *e;
+
+		if (!d->initialised)
+			break;
+		if (!d->num_devs[SNDRV_PCM_STREAM_CAPTURE])
+			continue;
+
+		list_for_each_entry(e, &d->endpoints, list) {
+			if (e->dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] &&
+			    e->dai_info->dai_type == SOC_SDW_DAI_TYPE_AMP)
+				d->num_devs[SNDRV_PCM_STREAM_CAPTURE]--;
+		}
+		if (!d->num_devs[SNDRV_PCM_STREAM_CAPTURE])
+			sdw_be_num--;
+	}
+
 	/* enable dmic */
 	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC)
 		dmic_num = 1;
-- 
2.34.1

