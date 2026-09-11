Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66229ACFD;
	Fri, 11 Sep 2026 19:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156451; cv=fail; b=h2vNRNiCmFhouxzyfZz5UFguZyqyCzoK4Q695ZA6bnvGjAN/xS/StFX51aXu6F+1faiaFUymSQ0mLEkheMwMGVv9JdcoLuc8S7HH067Tz6YYTImsFpGaK8oZEXhltOpteW2ngKHkaRp8FLZPWoGv0K63fsl+uwBIyA9cnhOOrLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156451; c=relaxed/simple;
	bh=ioh2kAtPGOAn/yb7CH4OGH4UzfLSmVAmfVU7sGiCWTQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fn7sgYP+8dEeF3V9WyoZGZCkaRnjBrQ1VEBJt/t+9372DnNbyLXTTjqilaTbEz4V6dKYXC+KUSkk3sdT2JQ1YWdiTB3038jsFN7VLELUCW2ene+iQi/43D6tbFMnsQ61cerHlO3zlHcn27rlwg3Z754D6u7t5I76cS8yAiDu7Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=oFNS2MtO; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GZs3p+u1; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="oFNS2MtO";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GZs3p+u1"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BJ4O152451778;
	Fri, 11 Sep 2026 14:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=1e9Yln52GpApMK5351WwUGH7x8Pgdp3wkvFiAJeRF
	i8=; b=oFNS2MtOQPSpLY+FA85t+lFC+9ebz91zgDTbLyTcBVFvgbacmFIaO4uOx
	T3iYVT7LuN1Qi2MHJPdvy2f7VMSqVAuO0Hp6WD60lk5Cr0pIE8nMiB+772BL4rBV
	YnEGFebWj+YB5+Qau9Z7TiNL9/zNIU93oWczg1v4TtIAml4MrUe1p9Ad3CILYNI8
	TIk/E/mfIM1utwI+SV8oepHwGqGYxtAu6ODvffVk/WW/HKZqHLq4sr6zM7Fs4xWw
	70PPH9TW2yHO/+D6kAJSaA+7pMzQmJAEQNQyROZVEMh8gxxel6Z7CBh7WQxN+76/
	2HNlQSysSXksTMGs097lOHYfLCm5w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gmqfwg7ah-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 14:53:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvDlRw/UYu8oK2iBzJUW2l5oy5qOFI+BDfCnEd223HQEgwnIKOojb/F4S5EhDLlVjTfY0riSQ0+AT/+QulleYAua8foYnzUYGplOknl7+VC8Zurg6mOarlw0CW4JUos8qF76rzV19+t+zG8MpRz3Mza4zqzJjUgUPyNTR1Rt0TwTeMf/gvjJizVblpv7GFfATFhuvGvt3popSfnwnOeOr9I39n86Y7r2LHBOxsxFySjkwxSreSCXgOtc2/AMdx9twnebq08S5RiTFjh3eBo9QE7SVY88Wv47m6x4kDfwn79dH+TQck3151dvzO1wPnccAc9U6dJp7Kwq7bOfixflHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e9Yln52GpApMK5351WwUGH7x8Pgdp3wkvFiAJeRFi8=;
 b=bkSaTTaONsW88xiqdSn56dM++CwxaHr7UaykAeqlF+XX7IdSd2kEfp2O24p3dQ0qKQnx233QEasiHoGHfhiNEh7N8hjomgJX8zqK2wv8TRPjiGXfwOHvT/Z/0xlsOsRhgDiwpEjVlh0ASUxytIYSCx7A00KF0BE9paRttQt7lkMXz5Hl4w6oRNKFgQfLcmxo6NC4cC0Geq0y49cvmuG3uhiteC+6PzjBO28yuXI5m8kN1wGd/Suj9aMuPGq/O0DKPKZbM7iG8rTYPOxAEmi1Llj7BCSqrpIk+/v63f2K379zTjeiAorfIHe8ZrVHfKcWHtmHHl/SqGtBvcWQNyfTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=phytec.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e9Yln52GpApMK5351WwUGH7x8Pgdp3wkvFiAJeRFi8=;
 b=GZs3p+u181JQdFV5e1O6yIc2yShGLUMmZWtyos/6efcmS96FUBAbk6HCKNlbfz/0N94gDNGAb7kC+6Yui/8uOz+AbXEE0YuOgu4r6TX4SXE3M4bYVWJQSuLMWDW4JB6CtZsqKvRy7AcDp5ZG3xSxtWhG0/hNHtU1H8mhzg5ZIqU=
Received: from MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::7) by
 SAWPR10MB997815.namprd10.prod.outlook.com (2603:10b6:806:4e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 19:53:28 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:303:8b:cafe::35) by MW4P221CA0002.outlook.office365.com
 (2603:10b6:303:8b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 19:53:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 19:53:28 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:53:08 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 14:53:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 14:53:08 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68BJr8AK715656;
	Fri, 11 Sep 2026 14:53:08 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Nathan Morrisson
	<nmorrisson@phytec.com>
CC: Nishanth Menon <nm@ti.com>, <afd@ti.com>,
        <sashiko-reviews@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
        <w.egorov@phytec.de>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
Date: Fri, 11 Sep 2026 14:53:06 -0500
Message-ID: <178915637194.2344413.2430020020216783881.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260903153304.2823245-1-nmorrisson@phytec.com>
References: <20260903153304.2823245-1-nmorrisson@phytec.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|SAWPR10MB997815:EE_
X-MS-Office365-Filtering-Correlation-Id: b696e4e4-1149-4586-b8fa-08df103e5946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	lSmoymi7esonlWAoHASxhWxk8IN9cKSdErPo/Ne9h5egmrbRSW6hIbji4YRcZTvb05G39ALAyDQkQdVJclHhwbricdlTJk6LI57CssL5PhpJVt6ZacLVe8qO3t68UlFJDE7ngfUOOtter/d4bNAQXShril3b9/2pGL9ObTDmPia89LHyES+4l2o/S95M8rxWUquMwASuMeeTrMphxjHkrk5lUtSWouhSY9ziMdaD3LeHgzLSI58w0nvAjeFrHQx2LgJoez1ELBO42g7o6Qvn78YCqm/n9ccg01MrIE6gxssVUbkAjrO/uDvPG0sTPQ8OK7wHSn+O6UE1gU5AqQn5n+5se0xhLy1gGsDzWRBh2+ukTFdJijTehxwbpfkMItpZiSNcJPRIW/8H5VfOkJaVbScUrxjJ39vldwOa8IUY4HR/NFoqyUunx31WcGMB/dgxE0RPZlEWQeXW19oLMywFX/3SYMQTijR7ljDNaI6YKsyRsEojQfooiA8jKgW7+VB0dmfaDbFRiD5gVKzx4gxFl0Sbzz7N/OCZyPs0LBeBKlBGTy42XK6Y1cSWrlPBHxXuepUfKGQRHAYAQvTKEgd46k0OKodtWC4KhcpNvgAYvfykKC/NnBdkqH3ucbfFSTbC/KQk8MHJ7tP/PX6E6NhOUe7EoIJed4q5ijRwMCboTkreim/C9bn6oHqJoj3kmuYayhhzHdpEMqIN9yx6scTUiA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5rPw2bUgSyK9gkB4WRf/mYOROUQjG2HpGRcnKnrn1LtvbWMhYfo3Z1Zp37ISD18iV2+wOpPV2JRIf5nU6rK684wZ1DWtXTSonyFa6+3vDHKKmc/y3zWAlx/BO6Go+u8gaP8MT7uwOEwm4PtAIZCIO3k86mktNv7ENb9y7lK7kQOA9vFYJ6BIGQo0q8rPP/KAdWL2iVEmjlisil+14GPNTyotqLWk1150QtVibHSSiD3TN5SahDnZlUQFrR/WcbtQIm70BgrIK/GqUFFdwewNq2iquS7e137YLstbOtzXvlFd/g3/snkDxKEE5tDhegtcVMzwZP55lJB8uHn8zJAu1ThewCsy+mbvX6mei7ELQQRbOC+MgbOg0EpmzSI2IIsWhjv/Px/6joJ8l0uQrvBqUpmRPy44IKRrXzcmsbIlJQfOhUIgU/ZhlbZxrE/knnAd
X-Exchange-RoutingPolicyChecked:
	n8Tu8q4SKK7PJgYWSga7zV8eNw0Dhibhe/AG8eO8AmA1l35IxmvGMmCPe6Q2RpgQplJ4c0kmDEPz/YiEgrNa1JhjjnUslr21mcBYtfiGNOpYz4vJOqCkkkPAAID9Ix6uZg8WqG7Z9rtnUcGsQ7+yAeELIHr9ydpnwB1V0nxNmLGmS/OppTn3eIWoWpFO8pKSBhv0awC8u9Tz1LVAiyECGGo62q+mXSopCcRiQj8LJzFPU86ht+k7SS3W7Neu/16EVWETI89m32hqVEsEwJD40CWVel7U6EPI8XtU6iSHv/CWjJMYrFqAUywzQK/d9zROsm88ua59OHQlZTGIex8rMw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:53:28.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b696e4e4-1149-4586-b8fa-08df103e5946
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR10MB997815
X-Authority-Analysis: v=2.4 cv=GsjXaU1C c=1 sm=1 tr=0 ts=6aa45c3b cx=c_pps
 a=cexuP6Tr12ZHfMaaS00NHg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: u2TE63JmrZLbeExRvdXzVBdCnlhSNNTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX6AgRbyDJL+i7
 +unvrZl+6K+emOheFh6RQVwlrggRraR0Ajskfh4ADWT9eDym3IVW3zaI+0YA39t0mrnF6bauF6N
 jV0p6AHzlxASdX1gf6UUxn8GQOVPN36QU1g5EoVnFM8PbSCTn9QpZorRwg0yVHJ3z9iFbFZUlyT
 Z+XBmBG3QVAwcWGD1XVhlfwCbSptN3b/JbnpYpFFp5G/ws/bHM/rEsjElppXVSTL3yyuwRZMt9j
 I8vzH0gbt235loEfYGeEdjMpIE0kz47nHTpy70E0eEcE33QH+MDpZ1Lslx9nqYkIskTVbPl5v1q
 Un5fEF41vxg3velA1cxqpZd7IvPJHXDSNwbSqZvJDmRDtDu8w6oSwgcfAjgqFXkx65L3tQRG01F
 1NLY+D16A9FgRhjIi4XRW+29VhLUc306B2SLEAdTSYY7jOxIpuquNyFfboeqNUL2SEsgMo224vn
 Ht4TovZAdCTs3bgMhaQ==
X-Proofpoint-ORIG-GUID: u2TE63JmrZLbeExRvdXzVBdCnlhSNNTw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3OSBTYWx0ZWRfX7wUXiwSecYtb
 uASBQMnjHnkjLtDa2nglIwkAixNIH+YBtHIse5P8YekDfuMDgtPtOeUVLq4wPEpRNNlgSU3S6um
 6MA1w/WKUhHfInrVW2AfRRheuSMgVoQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110279

Hi Nathan Morrisson,

On Thu, 03 Sep 2026 08:33:03 -0700, Nathan Morrisson wrote:
> Add device tree bindings for the AM67x based phyCORE-AM67x SoM and
> phyBOARD-Rigel.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
      commit: 2ac05f627c9976e311dfb1bedd32d67c54764715
[2/2] arm64: dts: ti: Add support for the phyCORE-AM67x
      commit: 02b57c8a48ecbf5e1c11a62da840b4ae7e6332a6

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

