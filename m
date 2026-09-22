Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4A354EECE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087201; cv=fail; b=UYViqICABKFOAuopj0zKtboY+jsexNuX/jTJGm7lhX2X4zlUJJDlmAvc213+a9jP+vT4PIaSDJCigq+z+SsxfWPuFvkDu51G/GMPkm+bFd/5Aix+hQrgkPiG7gdoAvU+L0/eYoLuQdPOCgxG6xBM5jNCGQ3fsPFwHbI/kKA8le0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087201; c=relaxed/simple;
	bh=ncTgFYtEs7HhODO0tnorozcCgUJhoL5IqhiB7xsZ75U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2f/SN5pfxLNt0JQPbk+Rh1viivck6UdtTgjWLueqEZ2PZbiPiGe2oiHdopN6fxpYaH4HU8ecglwzBa1KFxi27XHp1P/cO8oDqxidzXhgKdgPLVNpIpP83fs9pSWYGvU4uAQnufAfviBbTtnNsdhZzXNqWahbf5lw+bt/8SMGPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=otDzMcY6; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NEc2OOpd; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="otDzMcY6";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NEc2OOpd"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPajw2082073;
	Tue, 22 Sep 2026 09:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PEe0oKsAM4JtE3aD7yU/YG9KK9uxIWpl9locaVSKw
	Yo=; b=otDzMcY64Mx52WfOA2qdqtn54tvmtL9k8xtT5v2ZQN83/TnX1BzLENCv8
	5frS0H27xCcI2hI/qEDayuk3M4sAlzW6arhVIA3+734NibmXRbSuwQGof+gFb8b2
	Ypwrxmpm271QSCd/u9yIIHm2SX4JRglQjF71vZYtbgsBNIfhV8R9KT5pa+DW95Yv
	t6NryKo8Z51bdBJO0I+xLrBuCVZtqqwfIWTTlTQqxCLZKHTyDvusXwfCtUIMoOu0
	KuLWYIwdhbchxtHauYqjmB7piK2MILTp7myP+vV/klQ2sRhkVbBur98WrkY0oxpf
	jMQVeQEGmbEZxfk9AKtKf3wHmkgYQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010034.outbound.protection.outlook.com [52.101.56.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm3k8s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:26:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3jDKzeI2vgf16ROpPMPjx/siiOUxpgHLZTLWZynbAf5Kj+Nbb+ZCyvxi5ZHoBYt3lNW3RzxzjGRfUrpZmeGR8pL7bwY77PSdCi8weE3REykucIyntG1lV1egybfhdq8UtiWBQdhyKSGg7CcrYLF0MLYvElryXZwIu0o4kQOxVw7EINCHoX2pU2hpTYRSE0LZOneqLc4D2WZFKvWKr5mQKj6dSDZ9nAo6L+Tk9texEUQoTUu3oIVjePt8/64KOXR0V98I5czrz2xrzFwp3N9mlhZZiaI+bx6f1O1w78n7EV75EI266W2jJswJKQXrCWoO31jZOB4SG2k/t0Ua5MfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEe0oKsAM4JtE3aD7yU/YG9KK9uxIWpl9locaVSKwYo=;
 b=h3l5B1fOspPIhG0POLbQx01A7Udr8JzJYRzng44Of5E4SmVmZRoIg14jGK0FGaMqr8xo7QvrCOZnIAD2TrhbF3rmjJyKiiPf4Qvi6nKQlyyWNcDjrcG/da73srYrJXJNUTPc2OCW5CKyM9CKHV6L9NJ4APXfqgvxvJn9xLsQG4Ha8mRXHE94IenCxCrmwLOq/IhK4vEPPa+mMAF74oFUSnvukNtEfBOpuk3Bc6gM5RzdYem4IuVm8Mjx9jLBBhos6I6ZVYetwv95ZvYVbcw1do6jAiTL6fE5Akz2lP5VaihU/XrBL6JCp+rMcDJVRUfMLpuxRhr62ClTKc53r67+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEe0oKsAM4JtE3aD7yU/YG9KK9uxIWpl9locaVSKwYo=;
 b=NEc2OOpdurNkZmP87bqxZsYkXk4+l6BaVsZukj40DeHJUkGISB/jsO9VlFZi2BNtp95AO3e5WXqUv9ImnBdS2xmQslknHALdTtVOZseJGymY/WzU9xLXW9UxbHORDBlJCMnBaEjsrSBKOfP0hKRYUJFjOtBGubIx3ofRs2x0/NI=
Received: from BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28)
 by IA5PR10MB998093.namprd10.prod.outlook.com (2603:10b6:208:608::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 14:26:31 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::98) by BL1PR13CA0323.outlook.office365.com
 (2603:10b6:208:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue,
 22 Sep 2026 14:26:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:26:29 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:25:36 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:25:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:25:36 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MEPa2B129824;
	Tue, 22 Sep 2026 09:25:36 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Hemanth Selam
	<hemanth.selam@gmail.com>
CC: Nishanth Menon <nm@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] soc: ti: knav_qmss: Fix typos in comments
Date: Tue, 22 Sep 2026 09:25:35 -0500
Message-ID: <179008712859.4044183.3879456994998111210.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260911085055.715191-1-hemanth.selam@gmail.com>
References: <20260911085055.715191-1-hemanth.selam@gmail.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA5PR10MB998093:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6788d3-8034-4d22-55c4-08df18b57e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	tQp7FguYLZ/UcdDURQkVY4LexRM/pKp2kjEsLXt2UQJlkjglL21yD76e4aGXSMuZKbgoJlex87mZsMn2jEsmbng+73MLa4y7D7keRvjwVVYwwS1IKDJaZsHIlLTAC4gSCH1Zw6XSVH+qAmutbYBf1AWttWn+fd42UYUuKbyuvlO4Fa3cltesQnB1D6cvnS1+lBGDvJdeC2ccGlWCHZE4Gp0/YCK7r2iMOq5R+CB2ISf09tRCDVnsei8KskD/vdoVsws3+Bup8j+fowApM0OA2bBgVwM+2AoqWU6JBvYKr2oRezUplDAYeiYdW9wDwWzkAJSSySuwxUNYrO9EfHMu+nfquE1YUSXU6Cgj83udu8a/V6ofalKrdPkttElUpTGeucOW+pGs2+HljgKDAeK9WU+WS/ayE3dFLFRg1k8tsuxaemak/Rwa7d/dGW6sERaKwXw8hcEGcdxZWIgiWjJkzY8a6YO8smea1Se46p3sY1WJumwVlkwA30Dng7oZ7JrBsOP7uCulFig/S3c/y7LnZycOUQLNVXTtE/SOWW90MGgXnDUN6S0baEz4nI2n9xNVp2oujT4yb7WC8SMPr+jfA8soZFk/qFGApTty9Lb/3LZ/5QYPiABW9jPnx3TyyEtZCjzZiOM2AxHDUKCH3qe1S8gI+verGFvs+sSWErzQGxeO3uHYytrTG3l7kNPUcpeDb6XEtCeowiKurrmPnapvyw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7ZALXLUy0aT6/BqQTdN+uVZH+7BoqoMFrhpsC2zwclEYBPuS9kXcB59sVYryr8LVFz6MJLQOuzoRieNIp5+3kQWdUcJQ7WPOoXPDFExje0auRRJArYFS+gDRpPC1RTLZtn5jT7e1ceRjoDlphijoJlk6NgfKA3xzHsqPg79UAzZRnIpK3W/z1JAqDkx8PJwa/1jET3QMzG3cg1MOuCMxrSjNO0K6pZT+lGLks7D1KCI9d56n8X5BSzsrZbEaz4v/+ekAkQEDVe4gO9m2oIoTMduARfytrES4UQQawanrQ7K+X/pNS9CaeZ9BPF8so4YrMd+cvzsFHzSE5GFRBCERbCbSut3lSN1IKwAo857bf4u6Mcz6oKoWCM1TwlETtz26aNeKstMpYVG2Bb4BHp9tAEOxu7MQOsjVrRuno7pnIbn5lNQnp/0CLpR5wbIMD2v4
X-Exchange-RoutingPolicyChecked:
	WHwgHxuyIkew98wQbQMchxQwO+xzQ7jbiUBafCqjcbfWsDepWQyYHxpy/6YF8MSE4mRbPv8yJM3PWJcVATIAKHZNHxM9sD/gCQxREr9e/b7etpEN1aLB1ATR+t8KaCOrpi/nmSq++M7hV31kb5rra8G90jtRhuXf1YwrrUoWFkjj5+GO4w77ClkRzDHZ4uQ5cgleWLKnCbUav4sPkt3MWFZhEhrbGWD3RTXT0LqyqRaN9Nh6aZWnkS3Qgc5EavJgtn395TeFz6CebHiYGplys95umIQ/DZaYQgllfQtaL+pPkZACCFmdgbc3S9WDsYHtbikUmZb1ZVsWIUcy4+UNNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:26:29.8483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6788d3-8034-4d22-55c4-08df18b57e75
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR10MB998093
X-Proofpoint-ORIG-GUID: BfdcwYYBA6g8pJg-Wla8sfCubTFR6oX8
X-Proofpoint-GUID: BfdcwYYBA6g8pJg-Wla8sfCubTFR6oX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX7Be8DyOLsu7N
 Xuhb4jgLlrqixB80ekaf0L3XiH3lxUykwHb9vVaxif/HuF8UMDSqK3tN3eW6kO0yw+xJuN1ICaW
 MPHImyL2EKJQe2yy/OpybY53Jd3OpB/FNC1qtC/LRZ7kFHcQYqu2aHA6EybQS/r9PDX91rBoUnQ
 v5u5LYcvJgvPI7IU6bp7MrtcWTL2Cx+8gRMDinMiDkF6PNEVO0H2EpoOa3MSBTHcDdv7TGPCxAL
 b0vbi5LsGM9eqc6CDhhb7/emt7CJVIzHag0vZ3JcIN3VJ+G1a+yo8OM8IVrca6Gpq0b43qiGwv8
 LnCYtTwr4EK9N3xy6KV1+1tbcU8M8rZ2oVeml5JpIAwloWU09oDkJbVguyO2q3QohN8CWb+07p9
 x5A9+9trvZbNPERja7UJ9XOeUJtJNLJdr/dAmfyqRY5KVUvCNB6Bc85zv+0sP0sD9Jy0qXQaGPT
 wlwz10BaRQBTTF8JfwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfXxDmsmyGBy/Pv
 RnBb0L2cS+FqVwRaDB+GEfKcSpODdpddAoNh57IVmaVwvBYit7/bMAKoM946NW7ItnKWxqhEiDV
 K7ce+DTSR04yo/Z/rSuohjQcinBMneE=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab29019 cx=c_pps
 a=KX2Ufr5/9I0VBrHrQzOW6Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220210

Hi Hemanth Selam,

On Fri, 11 Sep 2026 14:20:55 +0530, Hemanth Selam wrote:
> Correct "specifes" to "specifies" in the knav_queue_open() kernel-doc and
> "accomodate" to "accommodate" in knav_pool_create().  No code changes.

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: knav_qmss: Fix typos in comments
      commit: e0d291986738791444dd0426c85f5e7d747fa44f

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

