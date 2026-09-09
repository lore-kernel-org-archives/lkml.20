Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E59418368;
	Wed,  9 Sep 2026 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990547; cv=fail; b=YztJytBZZYvMLCVQpsHoBUguu3ekjUHt6pYdK9WUtFi+jW1YsRi+ERxdu1fCbwOS5ZBechpH3fsSHlLD8h5YJGEvIcI1obET1mqALog7tQlvka5y3jP3ev9TNZH9F5xg/EBt/C9F/dzVlV9oD4m4wG2y3T8v0TAhM8DLS+I/k8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990547; c=relaxed/simple;
	bh=TUQaINKMHDadRJsn45MMOmZ4KqMCPPjxcUCxdp9uVwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h+gqIHgmO95qWa7BenATFhnOjXqPinPjbh4NSlmJMWwRb2gfKayUEy/yPjAbt3Ls24fSReQA4bo/8voLGwQs7rw/MYPWyElve9+hJVjaolUBjORfNkpNLbXO6T5W4aI1H/0wuUSxxaKymuQnVYxBpn1HPaw9l7ulRoPI/AwAkSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cne24QS7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=G/Lmmihp; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cne24QS7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="G/Lmmihp"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JG7ur1158970;
	Wed, 9 Sep 2026 16:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=T4LpxIp3CipCrQPvZYo8TrCaDXujU+IWSw2BIcWEI
	nM=; b=cne24QS78T107tCKu13+775vSOWGZRzR1aJYtyBZPC5PExvkEz4otE3eI
	+hJykSKPHWuavV1wJiNRKQJp5nl5PUZvF443AnSti2cLsBuzbzaxx3LtatMpfFI2
	/mM/7/2gYwSUmNi5Bs+/rHB5Z2RdvUB+nw163XEhkkginVaPlTyzttuoT9WfcGoE
	w+WctTimq8bXtptt6rR3qA0+UgeY1GzFHH/CqAtHuDwzmFiDNukOxEEE8tZ3XEAN
	eQDroR/r8OaHRPDWh++4ObZz2nQSEq4rlWyNZAQWW8gUfE70X1h/ISmwf758Fki1
	LHd54auxmB1/G3GGTv9nfElbqzgnA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011001.outbound.protection.outlook.com [52.101.57.1])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxes30v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGRSAVO3JmZpKsKyN/kXDZjyYSN17IXLucmPzXEvspMkA02xIIoJiHtcH1EW92r5ZU+Vg4ZxmAtrgKaxoBdQgqlnT7+wMgfOYKSRfPbvRr1WUxCGEKan3oMpPQMN1LwD8eZBucFTjgsC5JL9QmxT1H85LdoM8JLlVBBeJ+CDhBEMqua7bKIPNbfdoFz+xdWeZ9LJ6vbsUxYl6By1wPwQx6An+OQHfkqP7NBTjJg0MeXci/HxhnEqp+zNh3URbjajNFVtjKQTu6LfxgjyIo2BQBdo/A4wy5xAe2TaUgP8QV2HGGvg8h/dAWj15Mmc0wknU18V/PuK1KAiaZ9kGy/H9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4LpxIp3CipCrQPvZYo8TrCaDXujU+IWSw2BIcWEInM=;
 b=UE7s7rmh67y/hDKBv4VR5iPW2AvatpvnQkSr4DY/sTNE181mwsuGef1nR//PqTsqsg+Hx9LGvOCjMO1yBV91cI48fnBE869bGAnTOKVPcE+nt0rse+7dLI1fwjtpTENMI4lM/eLwlg4FeuyK3nv3JcTSAXosWbscXjH0YcYNALxaTsXx7x0bTjszxv9WQo9+gxa3kyYV0t4zujxd4blptVp75LiXgTLhiOMP6vnvo2906hbPN7ku07TNcLd1nOYMmVezK//ZMXvIwqHnoLC4Ofr2v2htLeFSuaWUuu+XijLTpFfN7eXrpIFJaWpeQWfCDZmKxhRq4TQ9YI6Dm7XkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4LpxIp3CipCrQPvZYo8TrCaDXujU+IWSw2BIcWEInM=;
 b=G/Lmmihp9XarkITh52O2S+5auA7rtsMelxzOKqg3sL70ZMEgqPyawZ5lRXXcNzokkzPV+r9l1Vkobw8RKV0m3of+AsmrXVbfnL1s8SCXhNut08KrfY+DhJJoxfN7lQICSBLDm6KRDke6w/UAbq6eHbaDtoPlSrx0lTKHrjsFfJY=
Received: from SJ2P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::12)
 by PH0PR10MB6436.namprd10.prod.outlook.com (2603:10b6:510:21c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:48:13 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:5da:cafe::15) by SJ2P220CA0001.outlook.office365.com
 (2603:10b6:a03:5da::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:48:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Wed, 9 Sep 2026 21:48:09 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:44 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0L1072162;
	Wed, 9 Sep 2026 16:47:44 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 08/15] arm64: dts: ti: k3-am625-beagleplay: Set MMC clock pins as OUTPUT
Date: Wed, 9 Sep 2026 16:47:36 -0500
Message-ID: <20260909214743.899477-9-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|PH0PR10MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: e18d578c-a9f8-4122-d487-08df0ebc09d9
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|7416014|10067099003|3023799007|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	ejoChJCaWsJe/jaUfb4siKOkcFwYxRd6+xcumfqQjE8e8le7YZV2Q67hOrxNM04cFSdez0vVbNW2GCkymQ9ffh1yRq4joPYopfTQMzgRzdrgfC4HXHd3kCK9k+pvpGrH2bCS8bHZhsMo+8OURusO36TBpU5IdLJHdJeYQ2ky3jp+PtbHovCUGSHup0M9rqqdXFOuwHdGs/N3GS5RynPrAQ/itYy+ZrMpw4bfx22RVQ0qgOz5w8Ms0vMAZit0wot6XIpaK7xOHiV5p5Kgt5ZmrwfGnWspe4hN5ttCj3JIUMjqOdTsbi5b3rmdcfezgUKKu9Wsm8QM80ns/kwp+WSlrEq9X3UKwsSNuHBu3MTFI547wcAe/xwaQXs6TCRHW9hyre3QYeUhdVgOkKjBqQt1GGWzw+Dz2dSh0eRbh0cP4cQZmIvJ5FGVDeveHMeGNJhpltIDDUjYTfqP029f5HCmMWp5oP97MB60EaRtAkaD4FJ72z2tvdddKdNMRjkw1ZqwX5Vtw362kdQIF8bNWyztWrSYNcSPCxZ1gz5mtapVEN5b2kexjP/I1JTJmal6Ed3tJLcIr0PTweMjIbCmxzgdFkHEB1f4/V12khXIFmhmp7NO2Iawrbha29WFq1MbXjzBcYMr2CJyYI2sG0TXxmYir9bb0Gzfn/34xtvcEpIBu1h/pC/7Oed6yAWn4BOkGi73zT9hJm12qdQJBuEbyC5rMQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(7416014)(10067099003)(3023799007)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A7iss745hkTRCzpS2/imcmHP4Z/N7ejbTAU+ixuYoSEWR4vqS3v+/qWZF/w8YQ9j1chguKV+p/Gu5nK1MswUJ2SrWCng8GH74YNexNUKtdJftVJ5m5rAFpe7o5coBJP75w1mo7VUlz2UH9lYG3OHDS7wObwzkFJmsiH5aPCXjzCJiBFzspVw/Knl9JdouF1ezerYs3eM6satDYT+r/jDCrwyXob+kFbeQcGkEgMw6o9CLtJcIXUwCEV2dlMrQMLfVSoVH/CwDuXI6Td/QwqRn6rtJItW1OtaL/tjxycBP1O7KRcIq9lmCjsVISPi7FcHgfso26u3RdeHlCsDWfrbC+YwRd/ekayudLlWi1SmV2NnDDMrFqFJxAwTrjIFcUlKj65DskLbZb8O7pqkYKwFEeZikReMHDJE57q/vgT64z49/aCBF9NLbFVaXFtYbqPf
X-Exchange-RoutingPolicyChecked:
	5A50MBvxYJ1r8FTuCQ8b4246fRTevIEnC/VboNSA09eRFhCZRuOxox2WKWz0xeqd+a31ab+sSTGS4CwmCELQB/+083lDxydV1vzZVRonycJ3HioecWyrUCl6s25nLoMXy005M6lYUpfJelRzTATHTa9VG7TrDmtXD2+VU3FlCsnr6lvvDUb4AOi1DEOOUS8X7UFKGC4vwJ+l2J+hLUP8EwN3PjQx6LXRhmsDwP4NNpOtVccvCQTZF7LmLEls4eJtqJFKrK7nNPMRlMV+VBVdckP4ekA9VY3ygJ07AXL80O13PGp0lCihH5sgRZz4cLwf7QXNeUIIRXVY7nc7GeY4RA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:09.0583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e18d578c-a9f8-4122-d487-08df0ebc09d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6436
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX7neRdPXPhXrd
 +UAig7YtbgKuZsLDfPJX2b69eP8jKUxpijGUPPLC4ATMYl1HFsxyF/ffUyBfbm3RI8wy3umNrAN
 Zlhz5ahG0SlBPNvA6xXiRSbtqmNVTbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX1VvRbZY59Zdr
 xI6aR2ZBnh2I4q4rdN5xwd+7/+ujMHe849FA2762BQnbmI5k0X6pgnCRf8QozLN+devCINtbmRo
 zGX4wLabd9pHp42sSQ5zXwIkQ6JsyR7sLF42mPsqLASXPInlS4JXaunN7EOv7aY90EeXk4QcosR
 MYfbgDjcVwtfaGIUFPPmHKlDpVhSxpJfWDMxQXAAKDB2wyGdkTJhEfiWxDh35Qjblgxve1UkIpy
 NhySLDzalm3zK+aCp1+RFWClwqZnCQ0+Lhl7UGj96bWjfGLlx3eI8B8n3aEDCmsJAmf1uPMShPv
 +7gd6Ovqy7SXYcrvLS8aSzzdGx2LmTfvlbahbal2LVIpe5/UPDakB6fIcxbnrqNO3zxO37y1is2
 DDCPI/mkrAJuMC6PMrJdpMgoDKW8N7/Ra2KdfjbvincaNGLxoP5u53pV4qgQt10ldkRSlDeek27
 TqnRkpYEn5J+8XLqhQw==
X-Proofpoint-GUID: Zy5f-DXEbaCWhben6cNNVLDsq841XLHy
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa1d421 cx=c_pps
 a=/9/UiQo4Js8eZu4DIT4oEg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=KfNCkNSrpQvzNYtdEsIA:9
X-Proofpoint-ORIG-GUID: Zy5f-DXEbaCWhben6cNNVLDsq841XLHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090244

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Fixes: f5a731f0787f ("arm64: dts: ti: Add k3-am625-beagleplay")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index c468b9c5fc09a..898e4ca3fd87e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -323,7 +323,7 @@ emmc_pins_default: emmc-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x0218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x0214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x0210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x020c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */
@@ -346,7 +346,7 @@ sd_pins_default: sd-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x023c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62X_IOPAD(0x0234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x0234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62X_IOPAD(0x0230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62X_IOPAD(0x022c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62X_IOPAD(0x0228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
@@ -358,7 +358,7 @@ AM62X_IOPAD(0x0240, PIN_INPUT, 7) /* (D17) MMC1_SDCD.GPIO1_48 */
 	wifi_pins_default: wifi-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0120, PIN_INPUT, 0) /* (C24) MMC2_CMD */
-			AM62X_IOPAD(0x0118, PIN_INPUT, 0) /* (D25) MMC2_CLK */
+			AM62X_IOPAD(0x0118, PIN_OUTPUT, 0) /* (D25) MMC2_CLK */
 			AM62X_IOPAD(0x0114, PIN_INPUT, 0) /* (B24) MMC2_DAT0 */
 			AM62X_IOPAD(0x0110, PIN_INPUT, 0) /* (C25) MMC2_DAT1 */
 			AM62X_IOPAD(0x010c, PIN_INPUT, 0) /* (E23) MMC2_DAT2 */
-- 
2.34.1

