Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DB4F85B2;
	Mon, 28 Sep 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616132; cv=fail; b=PgJ+e9n498NYSWiJDnzWrY16Khk6cRJfy6L2YNm0j2tEm2gailxaF92I9Gyg1Yvpllj66MZ9Lh/128OixtcmHSwzdGl6lIyScHl5mastOtuKOxwYPZEcH8wdaR3P8WXDG6gEMpfjEA6PsCjQmMjvrkg24q5X1MZxZFNeVaJpQTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616132; c=relaxed/simple;
	bh=MjAyRjHBNfjh+Jjd+2FwNI2WsRc1cI4M8c8igUqlZEA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I98VnXRJfKA0W7TaHmAT5ud7wbAHhU1v87yG5IYkEH/0grkxmtX/3yh0Dt96Nd0P86A9sxBlGCbE6Q0VBrque8v8fO+MMYAJrNWjdUUgnB4RotecPpNLwwv/9Jsz1S0dunLrkzQmEFSi2XF6A3aqaIDUjVmRX77btuvjFmkDTOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=RVTD/q1U; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=fbG9ZHwh; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="RVTD/q1U";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="fbG9ZHwh"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68SFJx812095011;
	Mon, 28 Sep 2026 12:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5cJ4SrlHJSznoqbF0rUkWPtl+MuPVPHJN7YIGLY2h
	M0=; b=RVTD/q1UbGEDixwKwYMlGFn2xQS2KF7pwYu98gxN2k1DPvpVcbB4SAGzm
	vnE1+oRU0ksDbUESFGzqYM5TvqYDazN529PdthYgBhbbmh4q2iUpEFbn1xIqVQBC
	fvLkMVn0lQ6hAtiBOUNg2JhBShhu4yIswYdkZCL7oaZsIdLnTi0+APoQrLkS93Td
	bv0FQ9koLGvohoceGLAErDetgToH4CRQvrAnrBthxHDo2b7L4tzwo+VXtX1rdFSS
	BioVmVUZKlCLPCkTJAybNr4YHYhBHneZq9yhUyuVf+Lzrgxh7dU+ucEqqlsIHcpl
	6p+DZftVClVvTPK9uWOz83bjKlGeQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013003.outbound.protection.outlook.com [40.93.201.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nqd8e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:21:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybeuEZnDolFPegyBb1vCMNHQx0YGO5UZcZniX/0rNlEANkG4tNFg97LAKO0wxWzvaudATtflQ20WlRNAudTm3BTtOJzIJmqvmPPTGM2NUyKTdIoh8qU1LFU4SKFlNYsuJK+Q14hwAP8d6uyD7/Z5PUaxwntEqmKdIg61TpwKsNLeZSbJ9bTnWcHrspp+/+g2pqBF34/Tf4yn+JIoTlfSo9FqLm9pG3n4hVUAwWGAGgi8D8Hxqml41SrqUXJ/NKu6vbRQ9+LZrdJ/q/+KYA7zMZTG8a4KMYG2X2D57LY+o2uxHqRLxWYetY7ab4S/280WGRiyslmMk3n58UWLdcTxDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cJ4SrlHJSznoqbF0rUkWPtl+MuPVPHJN7YIGLY2hM0=;
 b=Sw8Czcr5kvi8SDr+be4x4ASkajiVCKVcmczQFfg6v1xRNAAqzEJtMieGQ257bHIMgdij0m+6zPRm1jb6O9y9TBkzzKhpXw0ZJuf9OpcviRHcPKFDHCZVfJB+PAdXWVXMfOVzjHv0Yg2g7PTrf/tFJWtu8ax3iYpVj9ZlnTiY3Qlcth8CLc/mdE+KXI3a0vOL2OtPYl2KAFEw4zvoeUEBjOTqr7CYdL0krHXLM+IqEF+6JBTFTdb6hiGCKp+XHLIWrokk9W8co5R/Fphi27dE9xbHg7awoE029/x4SrevEVOdeo2zA9BLRw22dML/wGXbEMhei8keOiQuUWwZxibiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cJ4SrlHJSznoqbF0rUkWPtl+MuPVPHJN7YIGLY2hM0=;
 b=fbG9ZHwhI48tmf4kx16GnBpi5TrFWO+mQzwMQjM90R75akKmoav4R4inXN6+RfRbyVKyo/QDgu3VDIPqKUIZvUhNyZC+3lPOGnPb1i2DGkzWOb15TlBQejF4RAJHzKHbHaSoXuW3YjUriw0FvbznM9eFxxEzjdcHLwACya2YhAE=
Received: from MN2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:208:1a0::26)
 by LV0PR10MB998146.namprd10.prod.outlook.com (2603:10b6:408:391::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 17:21:29 +0000
Received: from BN3PEPF00022BC4.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::69) by MN2PR07CA0016.outlook.office365.com
 (2603:10b6:208:1a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 28 Sep 2026 17:21:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF00022BC4.mail.protection.outlook.com (10.167.248.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:21:28 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:21:07 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:21:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:21:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHL7gp290518;
	Mon, 28 Sep 2026 12:21:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] arm64: dts: ti: k3-am62-verdin-[ivy|zinnia]: fix main_gpio0/main_gpio1 line names size
Date: Mon, 28 Sep 2026 12:21:06 -0500
Message-ID: <179061605886.2961362.11967994887250931454.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922152551.270845-1-francesco@dolcini.it>
References: <20260922152551.270845-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC4:EE_|LV0PR10MB998146:EE_
X-MS-Office365-Filtering-Correlation-Id: 66a23331-a5f6-46ec-7912-08df1d84eed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	lJdze6OlAALBmF60eyPXaV8/aWOf0I7fxTRrGIEqUWPhz/COJavNxOO5ENHhrpCr6q3poBTaGMPWgK0h45uTmZwTI59UsQTrzzc2VkuwWV6CD8eMxxqTKP16ByyIAzn/JcUbV21IPiOjpiGSMfGTRcO++q2HLNfBu2GRkV5dtl34VNKpzVYldWzWdH3wIbzvrjo+BSG3SVzTA/BVocEjQLJBKn2jzYnaQi/UxA79OtxhacT5dg2/7kgGqPtsSNaXR3ztAFqkKsrClS2l3+BosBXnpuYuL9xf8PbQyfGg3G/UXiD+c0GXpp5cC79UHRjzgtxLOMh8TrOyk7AQbscO+Oztd3OFf0/+pzugdsf0a+1RyB5ceT+I2aGk16hMEsAICqPt19rJV2X4Aao9pkKRpG34fXf28/iL3XkBf4K65YjzlV8SIAPV+WwbyfbjlBAml1pVrLN//r1sALodPMQes8ZVDdFeUBrr5qvR5MudfP5BsV6AsrKjhai5J8eICh5jtPNiVHcCKHMGCkiRWXdvcX1HUeVOPTbpvlGqWjO2vPUPEcYalgBb5To7EB11/XtMC8Qs/l6ieLw0nnQ4B0I668kq3H2/Wy3UfGkoyB0gm/b+dxpjiWvMfFg6NGJf5ReZDyfQ2rjaGdJ5vFw66JEtUg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UH2KhqB9m6C8hTi869Oh74Re/AKCMoDi1wDXRTwtu05yA0zGbzTIfcMCHzSgAdddVAPHv1X1m1O4HadjUF98YtMhar7Oa1MyxW4XQ6Ah2PERs1qkJluszE9FaHpMEcmO4q5Dckm03mLYK+HrMBaSgRV0yHX+7gka8fFIgzd9vB1jpM02lGQylpE8W2PsQDg8//pr3f0XF2GftFz7nRMn4x5oLoJ+LVHZiWxE4gj0NO0wIS9jBTAxJUXSdlIyDhM3IlvduFKj7dMLhUgnAZiNxIT6pwqottAr5evThZ4owrCzwxGirbNmDK+x/68QS0ShrnCEULqNeiajyPeeKCmbOTEgArRZ86RkInU13+5A3CxHTeuJuUsuFCJFxwUiDkA67UQYYOdCrK+SMZJUiaAD1j7pIc5DeK+qA+bM5+q+wOTezumVtiDpH64IuFK4sk0o
X-Exchange-RoutingPolicyChecked:
	2/JNcv2zO6UZGx44nnCqbtbEqMAbUyY0iIS29jT9ea9GC2Jo50/hoflxHP6RiTYsX5XJXlv7GxnQdIDi6oEo9T3HA6dMxRbaz2M3QAElETOOxkm/YxVPyyFjqpAacpSBBV9Tu/2J6llVixMXAF+363IMo3t4/BnyuLJJjaP3klaiDYcivaQZzmui5vn6XaB5oAyMpd8Wc/4Ffb7mudkXpIDfrmIRcLhpkGxljEmAlVsKyU+/flggffBu/VP7SD0064MLtrWZ7vZau3IYYu9i+aK1I4lXyRgOOiZ+0mPBemtCM3v+gMa2tXginOW/TRCbbEyHfgdBzEnpVZLct5JLkQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:21:28.8639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a23331-a5f6-46ec-7912-08df1d84eed7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB998146
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX/Ky+4eyxpKE4
 5PiGOgyQDAU8UGYGNTV6gpWrcas5ekXR2aTUHaEDBom6pvzRZaJh493ohjc8bWonBJrz8Tpcx7B
 68VpdD+PNKSELrvaFo8auq0NB7jYcQA=
X-Proofpoint-ORIG-GUID: 90xeyXWfpAGWklAMC0GoJpmfWEuqIES5
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6abaa21b cx=c_pps
 a=9JMNuyHA4Bc1wrbCcMLwMw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=m8ToADvmAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: 90xeyXWfpAGWklAMC0GoJpmfWEuqIES5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfXzOsUtUjEYqSO
 abeC9deUONeWvv/6f0a2wAIM3cTr41OcU2b9p4XVpGnBoLA/YJbm+XiMNV8AFjq5z4fnhTwvKB2
 fNqMhxpFoVVxHnpQKMygSrrIqK82Qxrjdb72eX2plD9QGd7fgU6+rHeDETnJZMIyv7b25xevzRa
 2to+Pr+TzZjUZvn9hgoOvNIRrappFpRP9FP0dkiMkuprB2t/HZSesMTE5m4WB4EYnxS0IV5ZZN5
 S7LCNnwKixdUbgkMw9Q3tAKCqNH6A6WBqE5q7bt3LK0hbgcgdhpYN/AFlR+82jVFYZ5bfbF6m2L
 wxtcJ1hiPb1ACE6i/AXQbrZy+Ky7mC2dEbAUpvxnEqvR+SoZqun0bhhBaQ3RF32qg/+LFDDazVO
 dQUxzSM6CN3hJ+Mo7aT3W/X34UtWv9rxkEtER/P5bnFB/nip5/uuQJTVF2cxqphE13YYYWY4sw2
 uOBIEhmAfsaVtS6ywVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069

Hi Francesco Dolcini,

On Tue, 22 Sep 2026 17:25:47 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> zinnia and ivy redefines gpio-line-names for main_gpio0/main_gpio1, sized
> 87/88 entries instead of the SoC's actual 92/52 ti,ngpio. Resize both
> arrays to match, keeping every existing label at its original index.
> 
> missed from previous https://lore.kernel.org/all/20260914190943.50843-1-francesco@dolcini.it/
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am62-verdin-ivy: fix main_gpio0/main_gpio1 line names size
      commit: a74db73609d6e307bfcb6ef8073be2c47fb5bd9e
[2/2] arm64: dts: ti: k3-am62-verdin-zinnia: fix main_gpio0/main_gpio1 line names size
      commit: 9dd7a67b29e0d49c66c4785014ac3befb086fbfc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

