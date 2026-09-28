Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00AC4F30E2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616154; cv=fail; b=M55xEBFsMm1u1/UmW1DvFYfFQcgzo5AgFDbBPlXYgRNQQHS38jkRAFCimDjRADWWhbvRf+uk3Z4rjbTTHDV9m88hdYRT5M4aFW9ygx8+XdQc2dfonRHuO2FL30746qN0foc4Rqs/emJnVzlV5s5JPrTzaooZLi+tlJ/Ql5uFrAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616154; c=relaxed/simple;
	bh=kgJKby0uZaVveHhoIEkYt/hymTyyHykGql9aZqIohvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CFjMrLtfeonij+TbdWOkuY2DKGaWz4K+cxRqCOSIDn2VVWAI5o9IzaeoNMDstkskY8PP49ZTSeCdQN67rl7yncO899TIEsaXbejMVsKsNiOiQ2rAcPK35qigMLaEszjvJ2TOycueLUa5KZexHrCsTkNbCaVCwe5sYZ5q45uZ77c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=eMNwVZh4; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=av6uAN/4; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="eMNwVZh4";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="av6uAN/4"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SFKD1i2327689;
	Mon, 28 Sep 2026 12:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=x9sNJrZy6a8WKUVffetUFArQ9hGmaZpG12V0hQ3t8
	M0=; b=eMNwVZh42vSdbpJIOq0vHu8WkKa2ZZumDSmS4CB7CNa86iZPCLqoP0vtO
	uGe35QU+i3kLb4JDNajUEs/u2wdJElZu8rebt6i2q95ed59JJoR3faxwG3F+ATu7
	bITNQ9WHOcopB3alqLz741QkP7pGyPpJa2P54uy/uBqfhReSAJWbzKDdRmmaHNu4
	C/6zIR5uGhkHKpn51IIKP0IqFZ4vIIBa8sl88NaSLph6+YcPRan4Zi5RlEuJEoxV
	cQxKb7Xr0xJiWs9sdCpdlO5G/98aji6VFPiMAcJ4F8mQrX1Yih+SBS8MXttSzLd0
	BfsH1JtuQX/nRSJH5HzGsoV9oFAzA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013057.outbound.protection.outlook.com [40.107.201.57])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5qpq7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:22:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnHFhJWTL2ttpwqXdOCOsrCPdunsK9JGBstvnTaut+JxHfkoah10RFHNh755CuJEqT6ohSFvjV9LQHbUv4zVcMJDZqV5dvplYbcgVhrT5phi1gAI0Rq5PrwCAiO0u/4EiSJtp4HQfueioaUuhvKvxg5Q84TIOmIVsCG0UZP36dkprTbHFyt9ex2Qg+ZQGY2slcteqFB4YdsD6vlerSMDSkd5iAXaTTQMB52KEyzqRlTnj/eVv1Ci6Ky1RaAAZy0qmPD7a9hczDzUwmngNaqrJ4FRIV/FYgShHggCWhnY3imDxrkTczWmW53aqBguOQf/+vIBRu7iPehD+7W354g3qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9sNJrZy6a8WKUVffetUFArQ9hGmaZpG12V0hQ3t8M0=;
 b=Kn3nZLOqsEue2VB5+QLryLRKrBgRaqN4DVfzhBnO8/kpvJp8CazHLKWleYd6fF+OvKxQttyUhEjwcDa75SXbipogl8Hxn9OhcEjNGHjV0xVqan1nULvPBki1FXbMDpooz0OGlW/odIt7FjAWwY/kh2rXtYTlCQGr57qtK2CrIuIRdm6VxdS2adAgtHPg6sEMuy5w2a6u7ZSQR+9JndP5p+4OHOeDR6GARzlSz0xNwKJmiQZ0cqaOhIegFhugB3+GrOR7DP767wNVBce9PsyY0mypnr4HjeDx6c1UDC5ZCoVBCg0LcHajRqbLeoKIO7woet+ip7rzFUT9ioDBIjjaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9sNJrZy6a8WKUVffetUFArQ9hGmaZpG12V0hQ3t8M0=;
 b=av6uAN/4YqEpDgSmWbOGNee4AFPVhdq130cenwJdnlVl8DUx4D5I683/p3OxWuRV5bMcA4vMPRBFnN446mfPnNeJYS7ILevrSx824jZkyxdMqt/kvtuFFQZkBI1pZyovlDqV1UmOqBzw4xD9RIm/F1xhZtJvWdLoWNg+wSiXo78=
Received: from MN2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:208:1a0::26)
 by LV8PR10MB7798.namprd10.prod.outlook.com (2603:10b6:408:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 17:22:00 +0000
Received: from BN3PEPF00022BC4.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::8a) by MN2PR07CA0016.outlook.office365.com
 (2603:10b6:208:1a0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 28 Sep 2026 17:21:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF00022BC4.mail.protection.outlook.com (10.167.248.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:21:53 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:21:26 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:21:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:21:26 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHLPuJ3572168;
	Mon, 28 Sep 2026 12:21:25 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Karl Mehltretter
	<kmehltretter@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Udit
 Kumar" <u-kumar1@ti.com>
Subject: Re: [PATCH v2 1/2] soc: ti: k3-ringacc: Correct ring API kernel-doc
Date: Mon, 28 Sep 2026 12:21:24 -0500
Message-ID: <179061607924.2961558.18237039527241096578.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260923061658.20140-1-kmehltretter@gmail.com>
References: <20260923061658.20140-1-kmehltretter@gmail.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC4:EE_|LV8PR10MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c1fd2b-66ce-4b6f-1ffe-08df1d84fdac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	C0LHygApyZwx8M2lpLoriGoOK5LQd6+xylJ2nDBdDt6bdt+CiK+dEtCkL7Z2DOnIofUD9DfG0DR7I/k5fC/OakRggAGqavH+fVfSORIK7JxaPMInI7Cz7f0PJZVJ6XmHXO+FtM9jV536G067CJp5vHnA5BGVF1/eMxWmAxbhp3W+BtkoAiP6F4nF1jtQrHR7hIuLULqjcOMckdjJcm07CGtioig0MPVVpW0AUpI2Q7dDgy8HQf+t2SWiTcRtj37QnKu0r74O9P7JmD1g/KYyKu7IXrI4c6SfKAGGdWjPrqTdPbgg3b1FjXkXF87LcunL4hL8U2TqfV4oT7bTzU2srrHYzZXtzoBbozcfKEZNtc3+xW/BAg78B89R6Jo5PTms9dcvloHsR/6OGNfxigLju8Rds6wR9FYiaJHDTL4wS2vWTf8C0JhSXrAqi4EZpLPWecArX7D4bUIhi8tcgQOp24K2ZlPJSEnMNL4Idt7uQYdJvCps+v/1XRS4p841H2ySVUGgGw75e7DDDUVWc7dmd1NEmdcl653EkrKYro50q3ynQ33xx8vEB6sAsMFmV6y522peIgimUjLZGbmqq8/9RjIetlXJL9ga4Upv7sNiTCLBIngK+K/YES1julBpKReFvdxW+aDPU0EwL7pWedW5Aw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rqrXoNh0uoTUoHaSoA7XjymoZ3/5oKEvCcOA4gh0d9gzn2r9g5st3EwQSzCCPIIs71ZgeN4hg58X4LHPBRvPACBNFtSS5iridvBjXWhoWvcJSdTcVIsiRDcJD9DdSOsPwPVNaTAEmhfFbuhe6Vl3qbOe3JNpM72gCgBEN2kY+Osbz+SHGiYB7oliP/omy2j3tjb8TsmFNuMrrWamZR7R5GDW0h5VZLydpu6iRwQhu1B/BWGpA+/AX9Ve0dDKMoG+MJCpO/xbOb65F+zW1Q6xDVnriCmWbs7df3Tb+fPhVN9LrkdS71YOANaDx9hSiiXV9tGSiwT+Q9STS1uA6NK6W0TwFLbkM9UXEplfRnSQLmOIeb7+eHOpSx0MCbFZXDKAu86QBvw29L9polEsliXsI6KhWNi9cTpE5JnynEWCJ1ZY3ky04Vv/ebItjBpfYhnc
X-Exchange-RoutingPolicyChecked:
	afQAvqV0P8a73WN+oSNfrv9zhcvFZ/hRP8SvkfqtK7TjI5X9q0c1Vm3y466Lm8TGwDtdRSE54axqHgmU2vtws4QCTJuJikEeEgvQUI5NXL3PLbdgYovGodmZVmW9TQj5wrlo7SXHIr9239OgNNSOENaE8fgFGvUwzR1q7SryA04vb9bGRILYVG5gjN8Zq8NIfVnE3vl9UlrPtcb1w2KSxzec1/DhssH/eCst1AxEYjN4+k+pzR8OB/k+qimcn4k/czZB/fHhbvsULYTadv5IGogF2NO5h5pcNrXFQT4rcBsoKjNm0Z5aOe9r9K4HA6Z698ESg4Ws+MoUkS/9PlSTQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:21:53.7523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c1fd2b-66ce-4b6f-1ffe-08df1d84fdac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7798
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6abaa243 cx=c_pps
 a=Wsr1RZNaL8V8irrcAsW+4Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX6DKOhZS5DhrQ
 83m9LRk+Ez5djjYVMztcgWOcs+voccnzmPkVQYNspK+DWlxAF9/mszhZxyjeK7OiTH0Dp3Jst4V
 elseIHWGpL5K9OAqf01maMdtxZzZh9pNXYM8IUC+M9Hxy0zD17ti5DkSDgK8x+OusedD5Plp2RT
 xvnpp1xjJRhUVfCF23ubItswAeJ3I2538UeoQmUQdgY0KnAhw9EoOgANsDabCmeVNPYHnVGcJlR
 scy2l5l6oP+Z23sQRrzw9HPBXWcI5LVZQoYm3CGTe13Jr4Ij+OyMGsoCn0wYdLZRpFKKt4XCX/b
 92oepYliZDgA3q665iYBbZvVp25Rgo9OVCTEBItgglm+PZ1Q6Ky3SFcCAfOFG8vgl7TJtxQTiHI
 9ToGMoqIZuBdfUV/nFeNruYZc1g8uD/7jffms1xXz5hAXLrd9y8TxPgyjy52x5tkgs0fYGBZGjy
 rZ25wLWVM+oEPn4Osag==
X-Proofpoint-ORIG-GUID: nle6xoxbgFLsJh-XlWWgi30_IjtuASfk
X-Proofpoint-GUID: nle6xoxbgFLsJh-XlWWgi30_IjtuASfk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX5QMWweY8RkTv
 oyoVmIsgIeZ3Kt6gDdW4sflI7rc0Op/CXo7rB0cUn+Mryo6mFTdhvOJh6rmL87NBWnqQAKqJ3gO
 45ie72L/OliJ//KtdOyUbZKgeKo3Mt4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069

Hi Karl Mehltretter,

On Wed, 23 Sep 2026 08:16:57 +0200, Karl Mehltretter wrote:
> The ring accelerator header labels k3_ring_cfg as an enum, uses
> propname instead of property, and gives the DMA reset helper the
> ordinary reset helper's name. The DMA reset comment also omits occ,
> including the convention that zero requests a hardware occupancy read.
> 
> The proxy flag is parsed as a separate parameter, and the pop helpers
> describe pushing elements. Proxy access is supported in Message mode;
> the listed Credentials and Queue modes are not implemented. The phandle
> lookup returns encoded error pointers rather than integer error values.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/2] soc: ti: k3-ringacc: Correct ring API kernel-doc
      commit: 45ea6911ad16859d4ce4f25780b0ebcf5660e43a
[2/2] soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc
      commit: 6c4e6e8f5cf95f7e0d4f04928a9ae70e20c73d4b

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

