Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554064EA374;
	Fri,  4 Sep 2026 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534883; cv=fail; b=PmZu/zB4bd1jn2VCQyqPRdSpYf3+26CrLchymxP4j6q5Qdv9jsOkdHSpvegskg4Zwd3Samac+DKoBeI3y6cbck0T7L0DKC56y9B56BDKvZqtw389PGjYNqteXs5RbhZmxPObDQeUg2C6ryd9xDRp4B1gpRyCfbK+U8SvfZaQMOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534883; c=relaxed/simple;
	bh=7FnPlHhr2Mg1k4th7Ey89+W3iiPV7X6h21ZAtQ9aiw0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKDxaBV1HjYnrEgr5V7Cr3Aq17ZZQZIv2rY5HMPsK0JuRiOxcyA90LQc3oPgJEd1EucfF5H1ShWZ4E28vXLPtZwuCFfvlnjnT45/B3zYFFI9gHE4DdpKF+UI3NAyU49+7R/QriCjOxTy1FiKA2sJQONBYDuYbQzuO4J6g12z53w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WjhMM8EH; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kg/4Lygw; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WjhMM8EH";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kg/4Lygw"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684EsWM84004515;
	Fri, 4 Sep 2026 10:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=5fNUPtmtqXffYSE
	qWwzLr5HfZ28SCTHhGz2QFZwvJUc=; b=WjhMM8EHn48Zytfv9+KMFtu+/1jZXi4
	jS/f2MBjGhc3KNiC3aFirjhwobxT4vXl785qm+h652McatXpOxaPWPAWNi/2mMJa
	CMGSyXL91D4BYYnaQYd0tDzrLGGUY2xv5UaygIPLJSMZJSKuDlNIeCGbei7OaWsi
	5JVi3pypQEMwXYQJinltYx6dRAFNC/e+682CcIbq6lTT03TiLBst4/8sw3LXnufr
	ujRjLVrhsNLzPcZvalt4iDPEKGDkvPAc94B1hEAlZ9G/wxVtIodmArzgItlHRrSr
	pvh8AvXvuPwm09+I+qu9eKmm5qY+GwyvlyohaO0pIdjmmPoSFP/exCg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gg02sr71q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 10:14:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShMSrRvdiKKRESFhqNlg2UZozS2ZLFvnBKg4Pm5OcoFrmYQ9a6IfqS1ZPFcPvJKBoa400T/DwNwL9pkNhmNHrUUxGrx7Gm9EVpkEQykXjDq3wv8HtozpJhT7OWKNex64SiyNvip/Jk/8mQAxnN/cBQRp1hR66v2N5haICCLktT9u6movUWyLVYA5LstSSA4iqeaguE6FOXwXYi5v8ykAsRSRb4TJRaeTXA6gV6WyPUxgVbQPVAq3L3sve16jGikzT7Tl1IgqpuzL+MYXyVl21If4eQqX3pLbTKeIHYltJUo6+mFDyS6DVB7eN8RrfaF1sAoOHmnUPCp0GCBWcr7q+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fNUPtmtqXffYSEqWwzLr5HfZ28SCTHhGz2QFZwvJUc=;
 b=OrLzKAGy9RM87NB4NCoaXVTwO4N9zrryXVYQ0F37LE8dPmHH9KznWU8+djOIWSORLOki330ZBFCvafugFunPlPz2kcSnjUnL4lIyUg53XTtGU9ITKSeqtv378gijFlVOmVhUT48paXRKnRTpszhJMUsvYNEAHE2kHBBOXi+CzONe9UfcFil8HlqH81KQF1xyvlWvecEbkZGlCKRo/6BdB7Vt+laSri8WCt6l4OZBIOTbNdZJaEmB3fzY7HV2uGXD0k234slRnqamJ6SCaWeUnDX99oBslDCt5Mj3XISPdWOsJN+0X75FzU2ccJuqY6bhAia+JPlp8NvK3NBQFz6T/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fNUPtmtqXffYSEqWwzLr5HfZ28SCTHhGz2QFZwvJUc=;
 b=kg/4LygwVUxbzhHtvv6/fH7I4RBburQSMm2xWufWps7S+HqFij9YNJgfvnc544nGJt381xz6dql/OWX0GlahU71uNDp94gy0DBaYAcKzb09xH4whMr5TYPhP+LHkgK0M2yAknSUbGoSFEFXd+63+ZYbVCCfCkWpxntEbKoGVbu8=
Received: from CH2PR14CA0037.namprd14.prod.outlook.com (2603:10b6:610:56::17)
 by DS0PR10MB7510.namprd10.prod.outlook.com (2603:10b6:8:166::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 15:14:26 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::3c) by CH2PR14CA0037.outlook.office365.com
 (2603:10b6:610:56::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 15:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 15:14:24 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:13:36 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:13:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 10:13:35 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684FDZhe537102;
	Fri, 4 Sep 2026 10:13:35 -0500
Date: Fri, 4 Sep 2026 10:13:35 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: ti: k3-am62: Set MMC clock pins as
 OUTPUT
Message-ID: <20260904151335.fi5mvjpvziw2g3r2@exemption>
References: <20260805225438.464184-1-jm@ti.com>
 <20260805225438.464184-4-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260805225438.464184-4-jm@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|DS0PR10MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 816aac35-4a38-4364-7779-08df0a9734b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|10067099003|56012099006|3023799007|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B4cbd8qPYvS0RGWHvRYYkTfPRTDxpLp2J9xlbyAGkPEekEGKo0nTW9MlxgkXpjeOlH3scPpHjLihUAlq++fyQo8gUV+F/ZUz2iUVzjLXJo7kezbF3KSxytPQSOwczitRBY/1YNilRhPU/FZXRV4DYI9FpssObYdi1AIA6knkxHgA95Nc7jEABzE1OLSeklw+0DYOy8e7odE4v4xXn2gdxDW6B6nPPrW6ag+jqAZ7vFdlsKE/ncMnrnN4NHnlZnXGN4CsfmbKndsXcNGY6J5wD/hldfASREILE3aiTmnpSe5/rY3bTL7dd3SM6QGSOzR3MAvTsR3Xl3LfCqpmbpNG1r7CsQjC6EAllpXK2VZkrxzSBT0T7vZue6LtqNhv37cpCS/e6Hbx87AP9032DfVXAhs4d2vOyCBkZkkibEF541mIu0A2UAqx0/3fW8KqFT1sBleSubrMhn61uk/mujgbAL6IISW02XN6mdY4ooWV68+Oyutb2UGQBHKeIkD6FDLCAgUbBCKKgJ7zgREfvFK8LuvTRUOqNupMKZfCMd7Wd4h+4ROwzUG1lsk8hwOY22UVYUvIkXFBalD6oovDXmUuVyHt685YiW23ZKt3q8JD/jXZZN2C3NL4iciesEhXmFBHc8n9XLDq9XiMYUDYBeznAg0OKoipQ9f3zMehUmq5Qq67N77i3HnBmBqSRm0o89h0ScPXygFCn6dLzjGHis6Bpw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(10067099003)(56012099006)(3023799007)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tBK3+ka7i3F+sOk+g4uUgwa7/jCsQ9kOvjTpqqPxuu2IpcioGJTE2ms3gxWgYMaeKt9QLHeyee7fp4MU6Oo6YM54Nl0ujnuy2/g6qgmXZuY/jAcOY6uUIRTqedcUIqi+nph+MJJkKQt4kVmWW9PDRXhodS+50kjt3NJ88zssTLOFerkawC3s4NgkXyUDc5mtx822N/s+iP/qOOP2JwUU9UYBgccszHVdnPx3kG8iuVW7mwndDY2PjFumQM4i7EqVKt43EYnfYnvmuA2409LIbBm+/M51bZJvno7H0mKE05rywxdgHRLNoIqoVCkk9ZsBMpFsmxikP8DmE2fS68rYIYxVNXhmLvSnYELllstQMmTbYscYhgVn0Zl+Q5BE3NNv0CAWcRRJB5Sj+CGCb+7nKzhYLH5JZ11cgTnanAkXAkchV64pP+/YllaWzIs86M7g
X-Exchange-RoutingPolicyChecked:
	WLE1r4X1+ZLyuDYh+SKH9zjUKg0rS3zaI3dPTOLMG4CsxvMoHZ1q0mXu7/bUDBAYV4ekDe3lcUmZ8jZ4nBY3I/XyX6pp2yhlyhg5BthdMGQgMfyWZlbZrgV4k2MennS8IlghpKY1ILv09MqvpKCmDvHPz6Nqki1o7UGoBQuL/QBFPrgpq4Rbveqs2WucB6wKWqKhuXQOZZhP/fR0OgCpR9JrmhcyJqxq/7yv+XgU6v6dWzLDI+eqnQyQNkW3Lqt7bd2Puf9CuQxY5vu7Cg1Pu9Vm3f10wac/HFoKpkDr7chga5VzY29a0C0JG0LtJLO0V2X+B3uRV0FtRcupeyanlA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:14:24.9503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 816aac35-4a38-4364-7779-08df0a9734b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7510
X-Proofpoint-GUID: o8cU32_yYv8tILssE9yjTH9YXXUSw-Sj
X-Authority-Analysis: v=2.4 cv=GZMnWwXL c=1 sm=1 tr=0 ts=6a9ae05b cx=c_pps
 a=Tu5Wf88tfLtYLtD+ArEHOw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=456oIrItClgPVpcDbCAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEzOSBTYWx0ZWRfX1kICqEV+TrwU
 U9XZEv0zbVCnOCStKQLEsXwDwybASUpaMdtnDECFflS9kWNCYj2Y31mbKLvMFynZJY7EkU3bdGl
 1YsFqphqL/q6SPGpnGTN8WkWvCGhKMo=
X-Proofpoint-ORIG-GUID: o8cU32_yYv8tILssE9yjTH9YXXUSw-Sj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEzOSBTYWx0ZWRfX+Bo1xG719f6M
 jQujNAWSzvwpj1auguJb6lzzVFyxb2vgcEOdZw2jLiDKT04xdCaBc2Ne4PaoNL3WY2DQdFaJixQ
 VJOvBBfF1trCPO+3d/0v/8ezJcYea5v9+6BsP1+Nvl0/S95hkud/d4eJ0WRg/koaWsR7o7yrTfo
 kzODw/Al3+XJBULHlHoFnnNfH59JXQN0y4bkrcjNX2ce/eF55A9pNsXDMqfSQGLhm+c/Z6X8kj2
 2p9G3lu03CZF1WAcj3xF+h4hMGyVc00q/i7k1v2wkaxkuTRl453mIXo2x/YMRA0VLTLtjEy6njz
 qW4f6BlTTUh15kMF9jwuKM8RE1X/ApZnaklfujOgdUTbH8v5SdJGcPhKAn9rmswqoHlA5QG/h2P
 s1QYw56bYJOMJucc+uwm3MVw2OdTBoBVHu+cyj19VnME+rtHTgYiBBRSTB/CEdJrgtTGDqEB6LZ
 1YX/b6/WPmprWHE2tmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040139

On 17:54-20260805, Judith Mendez wrote:
> MMC clock pins must be configured as OUTPUT-only per TRM [0] with
> receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
> PIN_INPUT to PIN_OUTPUT to match documentation.
> 
> [0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals
> 
> Fixes: a0b8da04153e ("arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file")
> Fixes: 92d8c028aa92 ("arm64: dts: ti: Add k3-am62-pocketbeagle2")
> Fixes: f5a731f0787f ("arm64: dts: ti: Add k3-am625-beagleplay")
> Fixes: 2517e476b819 ("arm64: dts: ti: Add support for AM6254atl SiP SK")
> Fixes: a841581451af ("arm64: dts: ti: Refractor AM625 SK dts")

This and previous patch, I see you have tried to squash patches that
makes it harder to apply to various stable trees. Either split them up
so that it can be applied to the appropriate stable trees OR use # to
indicate the kernel to apply to -> see stable-rules.


> Cc: <stable@vger.kernel.org>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Reviewed-by: Moteen Shah <m-shah@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
