Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834F25B0AF;
	Tue,  8 Sep 2026 03:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788838135; cv=fail; b=ASD3+sfn1ramEeOUt/uZ3ApU9/jmysgKZAxARZoXX+j2ni/9Hpy7zaww+SObvw80VvuT1GESzPYY/hnJbH6Cffc5himW4rbRBldvAmBU2/2VDEnuWK62Chk/Rk0U8wpLyAG1+OiGB2nlpvSNHdHMVIL7uh5s+EC0ORlDxZHXgEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788838135; c=relaxed/simple;
	bh=0gtOzlSoEDMtah1LbBL6Upeoc8KMl8R/iB2wRDguinA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IWJgiaEcazd8qADj0virFkylkb10kf6iadYmvzkLpAvsre8ZJco+80ZACD4SfZMaKcG/LGBac28O633jvHY6Pi1fp7Rdla7rXZEBXKsx3oe3k+dHOOKxP2CctT8PRPWha1whse8Hmt9uIrHfHjvlby1tCWI6PAPe/u7QE7PoYv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Tj7q97KE; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MLfRSj3V; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Tj7q97KE";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MLfRSj3V"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 687NniK2299363;
	Mon, 7 Sep 2026 22:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ykzWyeYLBawIU
	+nG6Io5uFjnJe0DJ0huhkBBOpB2kI0=; b=Tj7q97KEtm5gndoHtlyzL/BPyfDPS
	qP/wBR/xpykhgJ5t5XluTCbDwIC91lyYs8jw3ekVAztplKgis6nc91QNJifRZrKN
	3ahAnm6ilPorje6XWhT5vPiirjOY17zvFsIDym/Zj2/Y3ITwXfES4E/5SRZYWBam
	BweGgdeuH29kcpipEjXuSAkBl6GnUzEpA2nohvCChoLuVpNPZRtxiDU9lD5Ix7Qx
	BTjjwkDv8eK/BfXzzF6ZwYYBqUOxdMhpwAGAU3IAs7wEhvHpXBHDQAgDF5HTNa+g
	WAxYGlaxl7HXuRF3hwFlNQeKznMSwuyt/51Kjoeo1OKgnDCuPARa27X3Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ghth3cwmw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 22:28:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ++IHzF/TOgBvJouVKdZZlwSEApn/KICR+EWpxHW4u1zbVlPUOzlLGWlvB5UqP429gwi9GTauNtNrPwyG0B52nqTztdFdFQSeXI21iJ7G0PXkUO0NDo+E+WiLUoeg+QmE20n3r1hROU2cIjO+ffuLli9rbXQHzHwb6GAGXumkmgPlvlcoXNE3NivVKGDvJeP88M5UhFboqqXBe8BnkUEE2EEJz5sMZcY3PD/sDhIb4chYy1V215A1qtACfuCJCdUbShR1zKS2eARvRd5d3M+mDIh5VZCsOmHCaKpCnDz4VNGi++e0v0i117truGSmL1cTDw1SWBnzLm8tX/cPLzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykzWyeYLBawIU+nG6Io5uFjnJe0DJ0huhkBBOpB2kI0=;
 b=MxOmmwU/gypEK8Z5XapleOLn6KCPk85mLelbR9X1x1GtrVcOjIMvuK92FwTF2Sv0MCJ3qEA+5f+OX0VLrKGIx7ISKqNQwG+8iBx0KIMu9uGQtwYk9v04VhE3tauXPmWHKVJzBmeFF2+/I2oxJ2ETCZBfE04gy6JSDuvAEsTmANwGzN6qldhPUG6GgGsURAv8JK31Cc7IsQhEgOqYeNRVKuNDJ6UyUUsFyxv/w47mKMPbYGj8ec8hBxBQkJDnMsQEOWjrotxPygGZp0GGQrYHQzegyjYnW/qJvc/GZtKCZVJxpA+bUxHA+kJ80z+GXSevE451AnDBQCgCobLW0AnUNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykzWyeYLBawIU+nG6Io5uFjnJe0DJ0huhkBBOpB2kI0=;
 b=MLfRSj3VqayEn3YCjcXmz5GiykAsZxV+yzK13Y+06jyN+dl8DMaVPtpy6r9ypqbLd23hRP9ZcisxBbBDD4s5EBIY3XqvHKdpm1DKme0xubsAHFbAHGCA0bWcOB2jTzx7SAGHK6it3cAVtD5zIQZrSmC8GIt+Vy123TqXqonbnHA=
Received: from BLAPR03CA0111.namprd03.prod.outlook.com (2603:10b6:208:32a::26)
 by LV3PR10MB8130.namprd10.prod.outlook.com (2603:10b6:408:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 03:28:31 +0000
Received: from BN3PEPF00022BC9.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::6) by BLAPR03CA0111.outlook.office365.com
 (2603:10b6:208:32a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 03:28:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BC9.mail.protection.outlook.com (10.167.248.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 03:28:30 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 22:28:30 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 22:28:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 22:28:30 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6883SPTI2661269;
	Mon, 7 Sep 2026 22:28:25 -0500
From: Niranjan Holalu Yogendra <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 1/2] ASoC: tac5xx2-sdw: add tac5272 support
Date: Tue, 8 Sep 2026 08:57:56 +0530
Message-ID: <20260908032757.389-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC9:EE_|LV3PR10MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a765ef3-24c2-4c50-ec18-08df0d59416e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	/JQXas/ATojrXvkIvrLmaDlaULw1J1BEi33lbfflKAJxkEIn2sOxaTo+Eg9tIbu1+hz23Ot7o6iYJ8uzUUK2y3/ziNGIeGfX63tzfDOQEHicOXThQIEjv2Ca8n84mHym3s6RLYx43ae2OTr0L0Q48HcvIDOUA9nmqEywFIgjqvdvHMEbE5tEQWM2chSRiqtRnQeUU2dMrQgPR51TAYB/Cb1QY9g/UUqcHbiBl6nVFu6u/RHg3hhQqig63+7bTR9zRcLRqOD3aQLOrIMgAa72f6rbb51SpE+YhqiGvRofri8gbKAY1m1Zd5twO0WeP69XHvsySIS+cbBQTuN1202YnQOVBUa4tJ76OvklEqhQrDVYO1tBMmoHkTg0nIYYuSVyQSNPST4GmNhIwc2UNWg3iXWiqtvnHjgDBYVdiQUnuqDqBEnV2bZ0wOMbgpAsSoW7CKYoLjuo6UJo6wijkzWKfxE3IGFdTrLnbZIygGlRhRsPTrSPqb/YCI4K9w3TL/ie30azVfrvi/iyQOZ1cL+03QDVKNG99dWVxQXZi0kgDc6w5sdM9Y8NMMRNc5QP4QzPahAxyEAqVgzmmK167A1QprA7ENVQLtDXr4+y/Fd4lfyXu4jI4Pj7YIlgH8KF9NELRSww98HZXRi0f2RsVuCSG2TaMUNbB49D2JJRuUVo0fdL8v+vxHOMrqduleAnYQtgLpuwIbdOcIlMG/e8pnYLrQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XLCQet0mGUxSuXgPDKxOEukE34ndiyvJ4XAHkQFGpuknQcJhV/VR77PBd0uS3c2n4a6iRmyRKoX+ikEq53i52ds3z4SPxl2XBARhCvkffLXDLtU+wXrEAbdJFRksTvaEKvQ7joeEtGFAYGbKmEBCur+a30f24ZCN67C1XiOvuSRPyv50+n1mDZozD9ffyYPT+Os42XZmvFoQxzjcXc83zqpg1rtyLFo8eCyVHh+KCZpBGzOsqVDXqfHpzOJwFkumLwOJtGoARG5JB5pXunO3I0+pYB5JQiUJZtMAVw+yedDK2ZqJ6p616tXe74pYfRDh1eSPPSZYdGDKDQjbQ8QURT/OC5dgwU+UxI43StnA+9J6U9GoBtXt/yCpGLZ4UN70Fb+bmWM+dAczLl/JpePbmPoJ66pwhWZqWH0XikXgrAnjS25TlkoY1+/WlavkNcfc
X-Exchange-RoutingPolicyChecked:
	ZPcpX59JOLdXjDJf1vEKvv9VrntLj1RyMhQtMWry/WGtFF2F1T5KWaowXH9VQftbs1H3gzxkdPHfVUyylog/7WpJVx8OJW/xaYqC04oTXVScMhwP+kaoq67tIgPSHpVNHRDN7TkYWlRD4Uccmby1bsPIopq0zQtsFMWX/dHAtXLUDMI608PGBDy/4yC9Co4fLUvdCjouAh9e92HD+0n1YevgBU8TlQOc9wNwIU3WftT5wyzuVTdbXVpLoX0yoZ6nY/WfaYuF3yPjRKDMKhPVh5IE2DhINQ87iPbABEaQeOwhXTJr8lNSoYtr+IK6wdLI3db3RHztPr5jOZnKlRzAaQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 03:28:30.9748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a765ef3-24c2-4c50-ec18-08df0d59416e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8130
X-Proofpoint-ORIG-GUID: _3eq6pA72laTq7SDyBGd9SwjKAdEn0bE
X-Proofpoint-GUID: _3eq6pA72laTq7SDyBGd9SwjKAdEn0bE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfX99g3i80Knsqn
 a5opS+Hl9zIlwjXhHOAL+1aMbxYKUn3fZ9gZzqmTWYtS7XiiCJR0OQu30GymxZxVRotvEtqwVa6
 Vod9jjl+RLFGhgVouzCR/fvp8AjcwKpIwR8Spub7D8jpbldsV7zhi33scjAoaPP+Pnlxjs0lHkE
 /0pKQ9azDCHRkE5qxFeJWamEYmkqsS/KQQM1GyLzuTZkL205Rmk/9BIsGXUxGNjPez5razNzTKd
 HDSy4kuwGPa5fjb9z+RRQIV9mM8RMzLpkWiEFr7jFB+I0gmvUimNdpjalQQZWU5X5YliJYzmDmA
 lXQVVoINvtlQLvGRSEABln94jUwvusYf0f5NsWXCkHvFKvhS4CWUcMy1CGZZrHqlZN0za5CfUIV
 9ABL/7UGOb9BIC4LS+Y+zFehOoUA66xNzDdpP3ffM+hwvFjp7JBO48dKWJou2FstPZAyiSBMi8l
 Z+l1MivkkGvIW65TKjQ==
X-Authority-Analysis: v=2.4 cv=Jd+Ma0KV c=1 sm=1 tr=0 ts=6a9f80e2 cx=c_pps
 a=8eopZEidgIdRxOfdJNpAuQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=QyXUC8HyAAAA:8
 a=gxjz5_87dGNnbkViNrEA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAzNCBTYWx0ZWRfXyVwrGJQyH/mW
 ORS0U2SOhgB9dhv5XUbePC254ds1nFYRlS6wFFd3g6Aqyn7jCg5f5Bd8my+xTGImnuA5Z1UypZA
 uqiUudgBTox8kSQ5WQGsTU36vXhZseY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080034

From: Niranjan H Y <niranjan.hy@ti.com>

  Add support for tac5272 which is a UAJ
only variant with no speaker and dmic.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/tac5xx2-sdw.c | 50 ++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index a5f654cde..fe6d3f981 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -146,6 +146,8 @@ struct tac5xx2_prv {
 	struct device *dev;
 	bool hw_init;
 	bool first_hw_init_done;
+	bool support_spk;
+	bool support_dmic;
 	u32 part_id;
 	u32 rev_id;
 	struct snd_soc_jack *hs_jack;
@@ -1168,6 +1170,28 @@ static int tac_interrupt_callback(struct sdw_slave *slave,
 	return 0;
 }
 
+static struct snd_soc_dai_driver tac5272_dai_driver[] = {
+	{
+		.name = "tac5xx2-aif3",
+		.id = TAC5XX2_UAJ,
+		.playback = {
+			.stream_name = "DP4 UAJ Speaker Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.capture = {
+			.stream_name = "DP7 UAJ Mic Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = TAC5XX2_DEVICE_RATES,
+			.formats = TAC5XX2_DEVICE_FORMATS,
+		},
+		.ops = &tac_dai_ops,
+	},
+};
+
 static struct snd_soc_dai_driver tac5572_dai_driver[] = {
 	{
 		.name = "tac5xx2-aif1",
@@ -1409,8 +1433,16 @@ static const struct snd_soc_component_driver soc_codec_driver_tacdevice = {
 	.endianness = 1,
 };
 
+static const struct snd_soc_component_driver soc_codec_driver_tac5272 = {
+	.probe = tac_component_probe,
+	.remove = tac_component_remove,
+	.idle_bias_on = 0,
+	.endianness = 1,
+};
+
 static s32 tac_init(struct tac5xx2_prv *tac_dev)
 {
+	const struct snd_soc_component_driver *template;
 	struct snd_soc_component_driver *component_driver;
 	struct snd_soc_dai_driver *dai_drv;
 	int num_dais;
@@ -1419,21 +1451,30 @@ static s32 tac_init(struct tac5xx2_prv *tac_dev)
 	dev_set_drvdata(tac_dev->dev, tac_dev);
 
 	switch (tac_dev->part_id) {
+	case 0x5272:
+		dai_drv = tac5272_dai_driver;
+		num_dais = ARRAY_SIZE(tac5272_dai_driver);
+		template = &soc_codec_driver_tac5272;
+		break;
 	case 0x5572:
 		dai_drv = tac5572_dai_driver;
 		num_dais = ARRAY_SIZE(tac5572_dai_driver);
+		template = &soc_codec_driver_tacdevice;
 		break;
 	case 0x5672:
 		dai_drv = tac5672_dai_driver;
 		num_dais = ARRAY_SIZE(tac5672_dai_driver);
+		template = &soc_codec_driver_tacdevice;
 		break;
 	case 0x5682:
 		dai_drv = tac5682_dai_driver;
 		num_dais = ARRAY_SIZE(tac5682_dai_driver);
+		template = &soc_codec_driver_tacdevice;
 		break;
 	case 0x2883:
 		dai_drv = tas2883_dai_driver;
 		num_dais = ARRAY_SIZE(tas2883_dai_driver);
+		template = &soc_codec_driver_tacdevice;
 		break;
 	default:
 		dev_err(tac_dev->dev, "Unsupported device: 0x%x\n",
@@ -1446,7 +1487,7 @@ static s32 tac_init(struct tac5xx2_prv *tac_dev)
 	if (!component_driver)
 		return -ENOMEM;
 
-	memcpy(component_driver, &soc_codec_driver_tacdevice, sizeof(*component_driver));
+	memcpy(component_driver, template, sizeof(*component_driver));
 	if (tac_has_uaj_support(tac_dev))
 		component_driver->set_jack = tac5xx2_set_jack;
 
@@ -1756,7 +1797,7 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
 		}
 	}
 
-	if (tac_dev->sa_func_data) {
+	if (tac_dev->sa_func_data && tac_dev->support_spk) {
 		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
 					     tac_dev->sa_func_data);
 		if (ret) {
@@ -1775,7 +1816,7 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
 		}
 	}
 
-	if (tac_dev->sm_func_data) {
+	if (tac_dev->sm_func_data && tac_dev->support_dmic) {
 		ret = sdca_regmap_write_init(dev, tac_dev->regmap,
 					     tac_dev->sm_func_data);
 		if (ret) {
@@ -1995,6 +2036,8 @@ static s32 tac_sdw_probe(struct sdw_slave *peripheral,
 	tac_dev->first_hw_init_done = false;
 	tac_dev->part_id = id->part_id;
 	tac_dev->rev_id = 0x0;
+	tac_dev->support_spk = (id->part_id != 0x5272);
+	tac_dev->support_dmic = (id->part_id != 0x5272);
 	dev_set_drvdata(dev, tac_dev);
 
 	regmap = devm_regmap_init_sdw_mbq_cfg(&peripheral->dev, peripheral,
@@ -2045,6 +2088,7 @@ static void tac_sdw_remove(struct sdw_slave *peripheral)
 }
 
 static const struct sdw_device_id tac_sdw_id[] = {
+	SDW_SLAVE_ENTRY(0x0102, 0x5272, 0),
 	SDW_SLAVE_ENTRY(0x0102, 0x5572, 0),
 	SDW_SLAVE_ENTRY(0x0102, 0x5672, 0),
 	SDW_SLAVE_ENTRY(0x0102, 0x5682, 0),
-- 
2.34.1

