Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC0554DAD3;
	Tue, 22 Sep 2026 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087152; cv=fail; b=k+tEfQPd+O3Iwa3AeAK5SQNSgX16huZ7Ta0AfLXNQij+IZ91kk9WPdfuUzc9MsKwWmrE5at3AWsmT/yNO4awNLkyU22EJgrEdqg6jqus0sr1t0g14bbdCmiBtuBK3HZo6/AFJbJ9ROuZxUQ/tSJc3Vpnw4o1q7mro4PfsLNXN1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087152; c=relaxed/simple;
	bh=nRkU/qZGrucLj+cvhxp5WiFDKNuLttfjz/wPz4+utxw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VcdN8DLa2e6uQl+F+tifLpn/+ByuToQw6CuxA7WiXifKj5wnTFzENpZbT4vdAKd9VJ/cTpYJLlTFHUZnURCxKdRP4JB6B8vc2MFPRGvU0fJTwxz7x4adVNkPyUU3x2mvpqBVDAa8uWqjwOG57EkJOPsfARGmYAJ8pjLuyUqiEWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BIoVWhhI; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TzpeYiRX; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BIoVWhhI";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TzpeYiRX"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPWH02082016;
	Tue, 22 Sep 2026 09:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=X7HOu7FupWlLAPA5xitYoekgsBKf+F7N3bNKolcOG
	/k=; b=BIoVWhhIGHQ987O1aPnleLMuVBkZ3vTupfk6HorgKGsyz63VFwptDM/3q
	jjQQZwEkccAmy91NlKpT7Tsj74nc20GGSkHUmPi2zy3tG92iHwOqJX0Ul02WXwbx
	Ma9woD6W5srOH+vMBpLKSXeVJFeI6QpmSQBmu0F9UvmX3Yzuuv7SUXfCiRAeOd5e
	S8aPiY9sOOPtN3XkC6C5X618jZUO/9oNAYZ2RU+ph38PWgOJ8R4cTx7PGjYQU188
	/XHFcsC8TBWfJ4oW7f1h4pZiA7D5d31o//4IVTIAuYT5QT5+dOrkYk9SmclqdiZI
	k2eALfU/MTSwc1oCV6DvP1YXXcQQw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm3j2u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:25:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQD66KHlKdrCZCfsRC7bZqSe3tZV2aU15SUCnWfup0xebohB0aPaiFCYeuFkEAd/41rWDkT4kD2NjyEUOug8Ti92Zgc9Dvf2oWM5vIl4pW8O+9nSIv+8iOftfJ9SigZSgP5G+M4KP5dAtKPnKxOpl36nt0CN7V2iua+MUtnumwNeGpv+HzHw37Ee48bgWlkwOBlOnr+q7xbqsbIcsnQklIB5WYOBVSIkzMyYBxyk8MhuPy5Ryuf2paTblMAPeQf7rqDcgCzcWxl4dCwbRCrrbguARhvzJ+EJtPF8aF3GF00v7DKUaMfbCgdbnkVIyRfeF4n357BWLItR1oPcKOT+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7HOu7FupWlLAPA5xitYoekgsBKf+F7N3bNKolcOG/k=;
 b=ZXgMF0qIrvNlsf4BlpjhEFdMKDdlmO+9VHllv4WJVsfK6YYQGRRd8dcw7orJqp4kFETXyWqwNLX+Ld94++KVMzAyaxiAT6JmTlcpDjm8kcT6ZDxBv7PSgI1MxcLeowx8w6mw1I/uvF3wppR0vo5WdCoVZJht8+O69k/IH5Do5ZkdAGjAgMwSF0QI5YxcberKVpvCyDrbZcFFbZ1Bv3cLEt2E5dFKD9nZhLgYGqrejzodD2vfwNK2ULliwW0wz53kEBuEFdUeXW+ThnNWSx8gIxCNfijuESCodRLussfEv6HNCtbXyZ7QIED95As7ECYww+V8mZHYT8hyQ6eiB8SM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7HOu7FupWlLAPA5xitYoekgsBKf+F7N3bNKolcOG/k=;
 b=TzpeYiRX+ryHdju2ZrZ08qKlGOV9d1QPRU22S3EczAcFnKVZwZvPRx2dcWkxOFMO4M5nRqsjKVQl6cr4Zs5ZTKm/maX6NQRIkInzmFjrQd3/iQWUDnLHslC1j9RBxYZvpmT7dP/I+eem8y7eum1rqG18NnLEHw5dLMKwbtgyCvo=
Received: from PH1PEPF000132E8.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::28)
 by CO1PR10MB4595.namprd10.prod.outlook.com (2603:10b6:303:98::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 14:25:39 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2a01:111:f403:f90f::5) by PH1PEPF000132E8.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue,
 22 Sep 2026 14:25:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:25:38 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:25:13 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:25:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:25:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MEPCav1032447;
	Tue, 22 Sep 2026 09:25:12 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhargav Joshi <j.bhargav.u@gmail.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] ARM: dts: keystone-k2g: Fix usb-nop-xceiv dtbs_check warnings
Date: Tue, 22 Sep 2026 09:25:11 -0500
Message-ID: <179008709913.4043991.12442611610959571184.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
References: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|CO1PR10MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: f202da76-6ec3-4881-40c8-08df18b5601f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	2cBGe6yNqmZFhW5SWQzkuuLaZdp8qf0vJ0NjTfr67rc9e/hAQdpExRZhiWs95KYsXKu0ttbWoCv09RughHiVc76w1U5F/iwhruJPyHuGFZ+zYx3QgUEc4IO6GQN26MFyrbJyD0E7ogO0utUa1rxcg8uD7J9cAaIHfXXCuqveYM0ZCFTtVvt8Xzh7IXgn8wu+6xcbsNJaXmmI+gTftB3K8bsPa+KnGqKb54UHcet7IBYLpPFSUEbkFPaGRw4otu+Q+udqBd7R89YJjjZI9+cTggs+SdHd47dZ8KgH9zmyau+rhNq/lSrVmUNe5WWKBh4yZIqxb0cy/gunzdmzzk9Xj3DfuqG3xCqwuVHYq+s3NwdmjQ5TZcE+cDV3PppkDe71hxMrZuUBSJEqW08I3SeJxzMvoabn8AtIyqBGNvOBwnJD2PXl8/e2BDvqbG1u2GADL8GQZA3tjIo4YC35mAumuEdFxatBKNoWE8CPPoSUOoOjH/CLp4O09IhQh/+PJXOMhB6WydhvdjPYVmFfzdr7ka6rThN5M1xDdxjvLy/JY/c5yPQpxucofbApECYNq5FVNqezwjz1s3qlibQCJH6IwhpRCpJcdyRZSAP+OQ49BYO9udYWIA5CPLuBRvMFRiCGc0Sjebgq8S6WQukUl3HDepJY9wqWVJnI3CCrRDTaI9AfuQJB+VvPX7eMnCa60Jxg9HkN4+ZrWfYRK55Ri8Aqxw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6+8ojN4iD2ph0rYaZvkMSyS/HZyukMpledLHqKZPQ9MLV8zmG3zfEI7XoLUKxZzAW1sv7LpYMJM3LLRBy77o3mE5T3LPr64IYfbJB+qwe6vRTruUys/O2q+zdKrSgB7b5cXw866Ze2jiKQIbKCTLqf+KZp09vRBl9C1tQxF89EWnBJPwY3krJ3sZ4tySWt+VIquX9QfjR0caCcpIG8Fgkpp4Byu9QG6SCaD85hUqj/e0pXXgYmr748QAE2nQlS4CfwXL/qr9P0qhKeIgz83Cpom2zcl5iR7bAeLOBhyOKMwqPAwzGmYE1qxtGcvXgoEAUok5T4TwtTpH4H/SXIWFvp6+ZNstOVVkn1y7Blazt3cIGnF8sBNBssaOo9w2gpk80aOda7/YwJh8hF8wgjcCeVIn4RWDhLapk/LjDVdmN1sB4khT5u1x1PZVZD4oL2CO
X-Exchange-RoutingPolicyChecked:
	0FNeCmXs9jX8HyOtESajiIav5PAGcIxOX1Ade/ersriYlExpdH9JD8Lz2CgedVF5LS5dhxkWldsSgjCkkrdCPfuyfFhIYe4hh9QxpHdFD4CpwNeU43OJrj8SRRkBTvnn1vb2909L2IakDfxyMdSpLCU2dXcn8kYzvwAShSqJ3VGJ9stnxRFZuTT2X8Fbo5SqlnZ+8IUVvhhPgnpec90q11nK40MVZjfBCLxdkQXVrQlmdZCAwkinaZVidvnucO8iA4JaCZmcssQMDI4pYmtTBngY5hpK5kRGAqL/pzTI9JXomcVpd7zYyvhh5Mi2TdgOZ6ntW+s+qyS63dST8kCFDw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:25:38.9858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f202da76-6ec3-4881-40c8-08df18b5601f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4595
X-Proofpoint-ORIG-GUID: C4SYTgq000cR8lQ1uqy7HhiHBuVQsMnV
X-Proofpoint-GUID: C4SYTgq000cR8lQ1uqy7HhiHBuVQsMnV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX40Kn3He+/MRq
 9xd3FbvChK2DHyzO/7Ip1MWej7sCOHhmdOM3vSr0eKK+zO5CuwWLk6IOdWyhLpmBxXFiHTdVGmb
 3fg/Aj7lgQJjVpK7bM6lXgbqIccCK2YlMfzepqEdIlk8nXIVl3zvHvtZl1txLIPaeSDR00zgMEO
 LHa4Oi19ROWDJVjXEz/90FiN0hpUZuLIjhAr4ihxNnWvJuG2JhJCSzVoKPwGkSasC1SZtA/rdbN
 sFlxbiMmxjkhNTLQ3E50fkqja5ySoIKLvcpQ3ARJ1+WTAFCBOd9Q8JU1Fl7I3m+z7Or4ZrR8fBd
 Mo3JO83WFSgafaFVEiE2sfmArJ5VDDLIuH3kCaebvN4OpDWUqFVWfdtRztj/tUTLoolLskbyCMe
 M6uVPOEZbL/nuWGnXgGqdp5iDe42syJwCSRW/mO0WvEmrsXGpPyMTvcf668f2gKLWKbMaCh2kG3
 cwtNpyHeR61zjp0354Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfXwe6PYUJ+tACP
 glyWYniJBFsTMg3E2pvS9Y9Y9/meZ1AdPTygDXlrd9tbqOYC888xm8QnCZI39HlqjNTP+Q2LsMM
 9O+1vsIIDBPlv4zi5YIwvGs3qg6nZpk=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab28fe8 cx=c_pps
 a=2iQKv3wDMkjwRE6X2MvZ0A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220210

Hi Bhargav Joshi,

On Fri, 11 Sep 2026 02:22:49 +0530, Bhargav Joshi wrote:
> usb0_phy and usb1_phy fail dtbs_check because:
> - missing the required #phy-cells.
> - simple-bus wrapper that forces unnecessary reg.
> 
> Patch 1 adds #phy-cells with value 0 as required by binding.
> Patch 2 drops the wrapper and moves the PHYs to root.
> 
> [...]

I have applied the following to branch ti-keystone-dts-next on [1].
Thank you!

[1/2] ARM: dts: keystone-k2g: Add required #phy-cells to usb-nop-xceiv nodes
      commit: f786d34150f2fbcfcb124048aae8859919bb1cbc
[2/2] ARM: dts: keystone-k2g: Move usb-phy nodes out of simple-bus
      commit: 483872c9385c9726b056428adbaaf213623ab5a3

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

