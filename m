Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0733B4F7CAF;
	Mon, 28 Sep 2026 17:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616046; cv=fail; b=gFm+w3lW8s+2mTiEXv6vsNh4ARGC6bLERUvMrgXjpkNY9FYP3dafBTdauzEu/aHK0VrENvQWzhf8WKJIuFoolLFJ9iEHAF4qONcO0o+TQY6GrobVQtU6hyMPql9hNA4ECRrzT+q7/MR3TqBAG9ptMUvEARjLL9FUBJnVCsD2SFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616046; c=relaxed/simple;
	bh=izs6cLj0pLOfjImW8SaMLJABPzlZYUvx9fZ2GANjYgM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UHpGFr8nrmyOvEevpOQBy53mJZfiq+tR1ce/7e4L75dvDx/ZoD/lY3A3PVCJZitrV0hPMBR2LmDAuMcgug70KueiqQ/znDTfjuL5GfCyGhctowsS83pRm7cEI2yG39Nm8R0/RCLKv+0QVGEc/IejeSebKF3B8HhTWQe/UpVHSfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=G0ucKtdG; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=dqshMSD3; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="G0ucKtdG";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="dqshMSD3"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SFKDCm2327688;
	Mon, 28 Sep 2026 12:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dT1WC2j2N+lo/1F7lHYY3TfznrGACLIJraPGRbPzU
	aY=; b=G0ucKtdG7UekEgR54kra2BUsdoaWEJ50OcxdR1b0ohNEf5vOSI/fzXajy
	fASdG0gvOKY3aTOEAy2aqfVaLdz+9ERCHsxx5dBO1n6joJaGMhPsQxFrlXW+We/w
	0QIoSO7E1UEXbumqHg00ZSQgo3sNWpzjyc+G5wjLr77deGY945cAhCaFOozKzxrM
	Og9yQEV70CLO9WXNIr45hZ88olJNYB/s/1mBD2k5ViHrZSIDV9aUGX2xcvKNmkhS
	t12izBh5Ysg+yOSdRicrXvT0kyIn3gmUN8lrn9/SWM7fAouozYNg+Wt16zGc+DT3
	bDZW89TG7YIzBLb1dCBAtHsbSD8Xg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5qpe7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:20:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyRYsNo+1Y2XhYzcgP89LaxcTqp2+34KkAGK8NcTn7CGaihOUp+Usfo1uYna1iAIaVTvrUovLg/IKM0kbHyDNn6yzzKbCnchafQTDMOrkLdgoftL8e9J1pmWTXppaYXx2BmUYtkH/aNu6IcmaZ2HFD2YlaRlkv4MePkJpzf+8zGYo56j41nNKU4PhkO8uK5wszqfhG7DlSwDPgV4MupvKztuzrBHWeH5Du63TcHtJZ4xaJUnvynVpBT+elO+xYRhAzQ+eLzabU1zb/w6McQ/DR1A2UL2/vUaEu6agtdCesh5gM47DJYmcE/nlhTGt2NQjd/pKeD690MAlRDjmfuRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dT1WC2j2N+lo/1F7lHYY3TfznrGACLIJraPGRbPzUaY=;
 b=Gr2rO1TWd1/5vAHk7GR80hrsT39sanwh3Luefn9AG+Ac/ib9v1qfgAJI8r/LTj1iEBBJz0l+M9YdBQxuh40re/3GBxLndbuyVA3u3S1T4FaEmNE5gGTtsP+EOH9Hgquq3UD4cumdoW4XqamMD60spsdM8NI6bw33dUynr73Nx7Viuf5sXZFXDpZbWN6tmQPbnfUAmh8W2soINXsE+WQmz7RR9SdClOtGDHda+sj29TX3bVFE5xdRM3VvPRDvkzBCHRbfGupwkp6Tef8clfe78SX4KWhheVdn/QPghvAJ7ViHRgBwekiQK9wi+pP4RZUWKIyHruLlATmxmb3g1BbUsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dT1WC2j2N+lo/1F7lHYY3TfznrGACLIJraPGRbPzUaY=;
 b=dqshMSD3F8hcDo3pj/i9jw/PuTQv9Yod5IDy0VQYPWKYtG4LN+HfyKyKVgJoqNno+1PXyuMxRVEn6klzTK6vzM/7saw3y7daGtR66r/k9kzf5d+rbK4zUSUlVS7NizHErTovllq3584eiCJXTllb6TYfe5pdJXQu52yCs7uLEaM=
Received: from MN2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:208:23b::35)
 by DS4PPF4F3334483.namprd10.prod.outlook.com (2603:10b6:f:fc00::d1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Mon, 28 Sep
 2026 17:20:34 +0000
Received: from BN7PEPF000000A7.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::2f) by MN2PR11CA0030.outlook.office365.com
 (2603:10b6:208:23b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:20:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN7PEPF000000A7.mail.protection.outlook.com (10.167.245.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:20:30 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:19:52 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:19:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:19:51 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHJpJu287968;
	Mon, 28 Sep 2026 12:19:51 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Brandon Brnich <b-brnich@ti.com>
CC: Nishanth Menon <nm@ti.com>, <afd@ti.com>
Subject: Re: [PATCH v3 0/4] Add SRAM Nodes for VPU
Date: Mon, 28 Sep 2026 12:19:50 -0500
Message-ID: <179061598372.2959805.5387498768885006105.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260921184850.3810018-1-b-brnich@ti.com>
References: <20260921184850.3810018-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A7:EE_|DS4PPF4F3334483:EE_
X-MS-Office365-Filtering-Correlation-Id: 12fab37c-266d-434c-1de8-08df1d84cc1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	p3B+h/o+uUUosM3JTxu/u+aGJ5ZOTk1i+rPTc+0eB+XiTvJGSQvRhpV1xa+5uIkUGHaTSdD4UhZwmgfyLb3ka0+3QAPsmJx76L0LPG3eS9MNdxqs6PtLx5uS+56xD9Rjg9HMeqfzWVwHKtzX4WJHJmrFHXtqoXTxMkJBFy6730wDhLkfEJg9oIRN4yrjlhlvy9aZvqIZlh7PNRffQ8iKn4HeY0S9M6iBiRol1on/h6Qmfh46vs6xUKV4ww/ltKdzBqB+FDxJRdmay+g4moUzM7O+YHvKPDfBAG0Mg6vcOkZoo/3NpmAHRQyXX1woNV9KqCpuYFscojUPNBEuABEoP00bQBQbLCD0KO3elSK8Hdv/bkqvifxKsC6FJbQ4IQqRYnvGQ1dT89LXW4igXVgBYNo+3RjbIBJGUY1hB8GAVi7ETCMYr62oMDuBQ1wuI05yHf1ckGZlHrvWmZuzk1wvZPWkJvwlyDKatEXNPD5qem5EHiWbU6sOLae7YoBwfN8u/tWl7wNfmMkAMTKZzU0gh8sXVxq6H+gOIwVy7ck7pfgHxhVUVDIXv8Nj7MTzhlsPG+7Yj0h12i6WDLknMPa0ZhHImTs8PuWPGTkfX9pmDQMwWHEVK5djYfczxDsaoXHOimV1U85ZNJYvtkgArYeW5g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0vCDqBog6PE497pOFB1Gdnnsdpht15Rmhf8Cs1Z6jm6yvIKQZwuv6NLAXcbJL7zMW81lq/LpQWqsD1YErr1hdBTZQdGZ1IkbsyiaHASzV0HweXjfA+nUXbBG/LfZfctSWI3jWhiWVIuptSPM2ynkAkeYQO4xB2lw+mK+SUw2+kSieDpZyEKcVjbWkiLDINDqwOfQjm3uuCO3Ua8ka8KPD7M4QXaTPBJeGZDhT9OijNu38mXIzhrqlwDpKODATu7FtCN/Pl+TrNQcwmf3inUTJfMazB/5vXTcIm57doyaUTnntGamxPlJj4SFwTmDFejClIqlDFgosB3MgoRjzwjGKajqOY4su29tsFRRghuO0f9130nJt7+byUzss6TBb1/IKLazNTNsr3yIX5ZnY1eycdOSZ8WeNGwahV6B+LLzOR9ngzuamk2rtfOpQ6RfBKi/
X-Exchange-RoutingPolicyChecked:
	KQTxVBuzWpKrpDLJD5ddlW/96y2YMmQhDW70LUiJdX9xHwM8uoDEB+2pULaCLzNkl3Fs0wRVXWlLf6OE9QfTH4TSFtTgxhpz4OVVcjv9Awmv/yWNO4oReksvo4pBdpUXHbwef4HVtegpbojm5HwVNd8JSahjKITSB3p3ZXZz3Vn/c0UkknUoiPpcSPZUyYiVLVHPGG4csmRdcm93CXxEnM3aYPWUoJKvZzlPyuYksetyaV1hNT+hwylR5web2xb7JS+kGZ2ULly8JJcU5LKXbRFJTAcnjW6z6jV9MeQLi5n0XW+Jebe9OkU7F4xNfItUikcIOvbFOu240yX6iZPu2w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:20:30.6121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fab37c-266d-434c-1de8-08df1d84cc1e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4F3334483
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6abaa1e4 cx=c_pps
 a=lJB3plHzOIAfJWf+6KWQLg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfXxmWnpeKq56nS
 DOPcD1Tc5mcdQEbVaGOM3DuFEdh0yavUhJpijLXIjGRmjeXNEgAOlt0toN1IVQ6nE1a5xxo76Rr
 /BuGMJJQQnrkXMQG6mqljSSv1ecSftErvcrGocUKgXtDZ0sCZQODdFKiJaYPibg5P4SBC6uuLqE
 dKK5BJbDVqkc3SX0JtFddfsTyqcg6J9pFnGta4GASgj/WUq/m2pXXgQYVvrdy5T9bPsMT/Q5z+e
 0sdIPwAbNE++UlBDI1hv3kx3y4rc78HETIPE77Z6ymY6GWCM8s73s1r8ObYBw6hOkJJkK4hOWpg
 /b6GNow5fNtloIyaa6kZ2d02cQ5yYubs2RGJK6ogm+hbhIwPZD1kv2JiXGmfcr/CNbghv5XDMdx
 qgV5g6l1U3JOSljE3PaI/Ik4uzUaPWXNWhd92NJ2NK/Tk2f+UpNfpdzmcjDUmPNiBoZRbof8/py
 1u/Pzgoqp0zmgSGmkoA==
X-Proofpoint-ORIG-GUID: Y5J7nq29GPXCkABAE5Rx_tCt0bziT3OX
X-Proofpoint-GUID: Y5J7nq29GPXCkABAE5Rx_tCt0bziT3OX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX1W+P8bgbv80I
 cloiHuQY8OJjDerlrJhJzs1scrN4+JpTzj9JRy42BtK9b1iYpZOGl18AwX5q91lrhGkbNdG80p2
 BoZw7y7x3R63Qq+gykAwWhYlnM1sXEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069

Hi Brandon Brnich,

On Mon, 21 Sep 2026 13:48:46 -0500, Brandon Brnich wrote:
> This series is responsible for adding the SRAM nodes for the Wave5 VPU to
> use. First patch is responsible for carving out the SRAM pool from
> main_navss that the VPU on J721s2 will then reference.
> 
> The last 2 patches use the existing oc_sram pool already found in the
> relevant device trees.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
      commit: b4824bac766e1696a31c54c14541b65e33eb683f
[2/4] arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
      commit: 86ab93a198114653faf0fef11a88d4a240f5adf4
[3/4] arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
      commit: 0bd8ecba297bd50fe5b154a96f6eaf0233b28dd3
[4/4] arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node
      commit: 330236fda4fd7a63e3bf9d9ce1b7ce227ddb8f1c

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

