Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6C51A73A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545094; cv=fail; b=oB+FAXJ8S2OIK+D1wUdzpsbzMGsw7PhbOoXgy5uxukRTVVjKtuSwwkpTFdLQaWVZq0C2XKATiO6o6vdIlYC2GZNQ72tD8ULUTD0tgWmxUvFlP50skCpSPhIaQGQUKNO0l2FGeSJM4A+DQSvA/ujRmmiBNib0A1cOmMAlLRM9mu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545094; c=relaxed/simple;
	bh=cseQnFSLOIm26FgLP1j0rXuFXJyzWZloD+l/rCwf0Aw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr8FNt1QPiJpR8sGDcJij1Q3jxV18QAGdJ1dPA7awSy/jJjjXVZPcD1xOiHxy4b4RPXkC8lQ6ion2Jn1FOUkxE0SpB1sUmsI+ILCjdWsStnQgGtZA5ckSXUWb1osz4rx1WKXVDSGKgLCCk13CjJEziVJ4TMAfZB10XQX8Zom20c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GZJrSerX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IEzpKLxR; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GZJrSerX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IEzpKLxR"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHtTC4080702;
	Fri, 4 Sep 2026 13:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=dNtdDMMcYiJTLhC
	a6iGX6UA5hIF6RX/NV6bojP3f3Dw=; b=GZJrSerXaOpAwkMNA6f3eCMYy88q7aH
	hxQX0/0bugjX3m/eX3VrO4kFqN2qcickgo7VF+kW43H4mI+/HIr6nqBIN4e8qXvA
	4Kvq+9jIWMt7Yrnj3BdT9lHS6HsJ09Vz9RUe8LiE/JDMJPMT+qZFx6WmSXDdeSpk
	aHuxKx9NFY44qcCYUn2PBPzG35xpk92ETkg85Xhif/7FB1W7vLWN/BV2QUJqUfik
	qlqYLKhP1wC7SOA9LxjXeH4PSW44Xp+dcyH7R6Lz3zcOApEKHo8gVpTqi4qbBDyg
	VQaRSrNTRBthKtzpaRRZR0bG6C6ge4/K8Dha3/w85Z6H7IGWjdVPLDQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq1hjh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 13:04:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wA1Os2+X5reUFr9/gJ7Rh6yvw/t3lQVPOxW/J5Me76pVaY7u+G7IHVdBjlD0SK5hHM4xKhQjYpHxX1Yu1HSYqjaGxOnON6AdqimTxiCBj4OYUMyfLC3SxePP4VpnObrviPZneJ5J47ti6naFoH+0ZD2uRQpkDTmC8GGoSqM8L6JPohQYZwxdv859H1FKbiGYGbE0Nf5HeO/g21g79aumWylha5LZpXTG84qrm1Xje3XvLn5CWD52xS4lTYckIr19bhKPd/GKIaALexfDZVaowJZ1td+EmZBtEA4PKMqxCfSfjBO2JhG6SHauUiv+zZ3GX+8sUDzieuypEjkPUtgDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNtdDMMcYiJTLhCa6iGX6UA5hIF6RX/NV6bojP3f3Dw=;
 b=srznx93UGCGTytTzjsLjbSanS5WxAgZgMGFfxn+zCs2Bno0fljs+BNHqJNGVx/BcRSfF8AJbZT5MkdTeXubZuiXmUrYuYZKJYRyRf9kcQNHc7PiX4mg9X9PMI1zJpsN/2IqTlK+nmIxIrBogTXFsDOWYS1TL/F3QQMU21JHwot8cvDJdKrJ2W4VRYQPjFXee/BwPIYZERbHujfDZmEG+J1wpfMOGPBfnQwLCYnGEiyvWGPW7VhIPfobaKpWJ1wFJPyEDFyxAd/oS/0e9AbC8JG+985cn5DixerSWeUMRSA0OD4U1xRSAifw8ES26qsnBjqmYCqQ/LPR24xnk7OYLvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNtdDMMcYiJTLhCa6iGX6UA5hIF6RX/NV6bojP3f3Dw=;
 b=IEzpKLxRcggw45TuV02sBmH6PQrDGa94ggiNBQl1wTo99uAHP8rlEQ86XmKrrYSqjCNGvBlTyR7MpDu2T7T0ppxf22vfTl8Baphr1Xj/+WouR/olKmjd8mZMtJZ6SVKnveN/Plp991D+YiNvrIZpmUPvR7R9AEVr5q34FMOhEWM=
Received: from SJ0PR13CA0148.namprd13.prod.outlook.com (2603:10b6:a03:2c6::33)
 by CH0PR10MB7464.namprd10.prod.outlook.com (2603:10b6:610:191::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 4 Sep 2026
 18:04:43 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::da) by SJ0PR13CA0148.outlook.office365.com
 (2603:10b6:a03:2c6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Fri, 4
 Sep 2026 18:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 18:04:42 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 13:03:43 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 13:03:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 13:03:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684I3hSL3965088;
	Fri, 4 Sep 2026 13:03:43 -0500
Date: Fri, 4 Sep 2026 13:03:43 -0500
From: Nishanth Menon <nm@ti.com>
To: Rosen Penev <rosenp@gmail.com>
CC: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: ti_sci: simplify resource allocation
Message-ID: <20260904180343.ppckrd3ohix6ftyf@jockstrap>
References: <20260430221123.79947-1-rosenp@gmail.com>
 <20260903174710.yxgdfqjt5neryhjh@earshot>
 <CAKxU2N_SPEoxJ2jE_Dm2AtYW5vxU-Cx66knCDL21bPGdbpHhCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAKxU2N_SPEoxJ2jE_Dm2AtYW5vxU-Cx66knCDL21bPGdbpHhCw@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|CH0PR10MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: a75b1bb6-5749-4429-c235-08df0aaefef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|4143699003|56012099006|18002099003|22082099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	G/BJ1KQ69fTpwFiH4KvNq+0a0qw9VxQtxvOmGEAl1wWMo8UQn/Hsne5++x4xHLt/AVnTdTI4ty0w4OidfwbhMSBqPfN3CPxN/FrMFlLU259jAUtQsWCsA1LW7CnDU9kHsvczuk6B0vc/zIXw/0emgszty1O2d4u8hUuCKBYhHPu1IpZmLV+P4lw/H/mQMrARR1/jtinWm5CTXEXVJ8+IiliAZ8zhXrzBf2D6EylCy23Q97IxKShrvLJw7lZ9xCjfM2ue9iWbmsnVhN6AvyqTD6F/VmfXOShoAVIW36Om+s926NlloUItM+Cc2VFQf9hcjYgz/kHiucemmSTdtWtcN6/LedqbLZPJWCht1rcqpINHi4ZEpY3qBmZJE/bSy04ZC2wMv97QCjIf8PSGdv2c2cVOA53gU7506noO8Snmts5RiBMmrcOotkEy4dCNTeflYmgH+AUMwESTv0QgTiQ1IBbpxkSCuIhWl1g2/ReldQm0SXndh4lPmki8+51njlaL0ygwCWBOg3I3BxH2ZczYptulcekxfxVpSCFjcJjUbPTWl/rxnx4iYC1vs8Qi9fhCEKy5kmf7p/I9fxU2GWW1lJd7uHV52fIhVfodvfiUizou3eIJntN3nvAtL2r3mxlcPTaNTAXJXog20YfayWcKWeys+WcMGp6Vz3RkvM7QEuuCjzfwSgDzVmBvuXc15VVmMun7fSlue85CeBgmPp+6YQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eMbs8MCfyEnlnpp7UGDY2PdQ64JT7U62REpcQiVkFJzmJkWIFR7eyalzjSFz47KNXaF2QKCNLTlQpf7ohiCcoBzp8AEsLli03rq05K/YDGqyJ/XIhV4Vc2icGNUEAP8kFhq03N4con+7wkE2/QHBr3/Nw+4a45ebSWCDE82uGxLTcfOcPFwPo5nfWihNCezxnFDGbitTgamJd40BbgcLt+D9rtIryFuxHXiqpsQs5EoThDB1f5WWDgrRu5HxWLTCpD65iVFkwCgEBypRBhY4DCVmSVUOO8+My48J/KcJHJG+pG9tB7fJZM5gQ+K51XWtpiMFN/GQFyszvDGpUNsAgxERn4XgO7Qrm0accU9SoBf6LIKWzgf/PSoGZRDChMrk0HrNLZDXhcTxrvUxS+s8iQehKehuujFpO31tTmOZDMwMk/Rqi0CdzV2Wsju3TUlp
X-Exchange-RoutingPolicyChecked:
	4Hz7igHGWJEqTROK+Erh9iN4eewuNWr+3c9Op4sGBNsRpul5Tah2iZhDmxgoXyX1b+op62uBH6yoQyq8xIQMOrjOxgCIMAByvScudI/qjrO4klzOJa2xq+46AdZEOTmOCrqlMevyJUk7BMIBULVsB24dsFE2C9w3SIK9WCXKfk5rMvEwJCU8YkT46APfx9rLMIoeoceGDGKe9u6aZmqHskn3vut3OdC+y9iRITOAOa97zNhP8mrj9CZ9qbgjC2ADP8aiaLBZeL0NpOvEcYOnRKMlB2dkAxfXOKZTZRyH0P792nxBtHPMIeu1hHx0sR42gpjwvbK9e06Hi/FR+Cs7Sg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:04:42.6431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a75b1bb6-5749-4429-c235-08df0aaefef2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7464
X-Authority-Analysis: v=2.4 cv=AfqB2XXG c=1 sm=1 tr=0 ts=6a9b0843 cx=c_pps
 a=F5APu9G2MQgGAPAZFPwQAQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=H_6yIR3iVM_bC_xHXUQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: rwRGtzX_0fMoNZIed7U-Rc3TEoeblgbW
X-Proofpoint-GUID: rwRGtzX_0fMoNZIed7U-Rc3TEoeblgbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE2NSBTYWx0ZWRfXynkO7Rt+fIKo
 BV1qVgpSAHjkn1Vciat9qGv6e7B6RwWXCZsvbowcrdXLPAow6ewTH6DQHksYROglW+pzsClC7ya
 giRvtOLI7t8kacHqobLxp+CCjLDnLm7pKJ3MoHvgOpQ6S3HhG4rM1N8dMhjBXSqegS7CkDS8Qbw
 Jqjd6cdeNDBilPtZKKPAphOnkAHnYsDFQWvmk5bhsOqJpTp7CMGGREOjBTP5gvT1G+z1CyJ7/Si
 Y0SsLwtcjO1dBRKFVJl7lY5Yje4NTJM3tVW0tWdunWhduoLPq5+x8+VV61ahT+t5IlUb+g8b19U
 6Ij/UVWRZBfCnAh8Ang7qqsoWr/QgXzA7P6afkBDFuRQm6YRU/ZqXqWasa7diH0eOyATZYKOyai
 uYgPP6uH/2XGRsYnhdt3p5vEINFrsdsYqoaD9wrzLnyi3kwpYGTkVK2BKRdwgBveSY4lsdp9qnM
 g+cja6+7bHZpMf8c1oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE2NSBTYWx0ZWRfX7B2TCT0zId7U
 KVo3dzUcP/LNl3Va0ams0lbJ5S/6x5+DOudz9yXZHe0SsvdgFT7AGM7PDyUhliYFtqHhNeGCWmB
 jRzTeSxMRBkGoSCheaeG57LyGVsX57g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040165

On 13:34-20260903, Rosen Penev wrote:
[...]

> > make[5]: *** [scripts/Makefile.build:290: drivers/dma/ti/k3-udma.o] Error 1
> > make[4]: *** [scripts/Makefile.build:551: drivers/dma/ti] Error 2
> > make[3]: *** [scripts/Makefile.build:551: drivers/dma] Error 2
> > make[3]: *** Waiting for unfinished jobs....
> > make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
> > make[1]: *** [/workdir/Makefile:2232: .] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> >
> >
> > If I am not mistaken, k3-udma.c and k3-ringacc.c will be impacted. can
> > you check and update the patch?
> Just the former.

OK, I would'nt be able to apply the patch which breaks build.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
