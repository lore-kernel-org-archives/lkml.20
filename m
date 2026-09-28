Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2654F5DF2;
	Mon, 28 Sep 2026 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616092; cv=fail; b=K/RiI4M+pLUMQhEZu2R8P1DgQotUnfrouAv35V/ieEF5SdJGhMspyk5Su8cQIuOJGyjYOFKGRwZU02flNpaF/qsucmyp7u5FK09tSH4PjZSGeW5bW1KAWap+s1HU/ccD/uQnnK/ovZNfnpxZYqnkqDiOxPlxblz5BGwgdQNe4S4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616092; c=relaxed/simple;
	bh=CXHrIV1uVyJT0zGeb2F85gDLfLBVT5apSdivJWNcSsw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QXB0WQFPAx54oZoPrREZmJrg9W5S9Ed+HD9N2u3AELDfpHQ5vzOtaIe6t+qIzxTUYHF5mcVo1WLHY7q0P7dyGNJ4WoOoEtOqfuP9DGV0Xdk9dqQoQUyPs0pyY0r6VZz3h/MFHZQ6XFioek5ZJslY27RBF/KGz6od9xAhid+ugKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bqPDWHYI; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Q2Rw3oyS; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bqPDWHYI";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Q2Rw3oyS"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SFKH8M2327780;
	Mon, 28 Sep 2026 12:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iWTKZS9e4WWfTLIRL5hKjvepn09m2Uohgm8LKh1Aj
	rg=; b=bqPDWHYIeGCvcYvR27QZMlgX4YV371iM7nmZ0iDs51Y8aAE4ZUZN3WrFu
	ocvUUAhytfxfbuL7VCAX2qg9SbLRAopmQey9SF60KscN0TqhZkq+UESrdvv01vko
	qZIsGo7Wgeij1J6eehWGGHh2MQKWt7IKFwrmcrYnaTvIxmwqdcGCKVd4CmErcSA6
	yzi/Dkuxg1qHGT4b7c88VbFynvUQSDtQxUjWE3CkiQVG4q8k+UcAoxlz12nI37j1
	5XLsoWSXTXS22SW0hS/5zL7fkjkZdoWAR8gEFqN3sN38pFNa+vu4FdPJ8sNwtEsg
	Oy01ViX79Fr4OkkdtrzdOKsL/bdTg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5qph2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:21:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyhsLYzZIwV+oTqumElJq2i7DSzJWsC1YDOLuE1z2ywiiBXd7B59dFNq6jPOVJRsNCxnLfoiCsP3hqxQT5L2LkMrJ7d+8wlP5ZalPEaCGe6M5QsMl6sPWmG9qnk3wP24KgdJotv2W8YnXg2/Uwl91fw1T7v1Lv35CgLbQx8eNYf9yAdRx+rWX8PCTJ+Qnhd33F3KHr/zjAEU/1yNK/346cwkbLjlD5ijQVkEfwavTPNOtP5GPYubGojtwbM0HhdFidDrjOUtlFr9P0PLRUShSvVE4juCN3h9dvun5fjF+azKEoP+Rp4ckA9Maz56jn0m4OuvRmlQYMg6O3oi0/Pf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWTKZS9e4WWfTLIRL5hKjvepn09m2Uohgm8LKh1Ajrg=;
 b=yzH+cSqvLBtICki1aLTHhNqrmnKqlofE4AJ+fDf6Weo9Gei1ww8FQ4r6pMxmzpDvCxdCl6I/CkxElU+zjfoM/5FdE1TRZjzIKlta+z2E+oMIxYqXu2Yj6UbkJBH338RbKmhvpgmTPajmyC8foaqrKYFeuGQ+gHwaWQQHI56M0sU+STAG+XgoAwzggI4GJHWAFBBaDobtSrByYhnoa0lplWHHnKipN/KIxjJG8yuEAvf9uN/giUhxhgyvd8vBbjk6mX3+UPqPxX6Ge2NKkyF/RRGAn3W6PkgNLFySpfsNn6rwJekN+IuHzn+XllEk28NY8/W22DQhDtLVhrVV1+Dtng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWTKZS9e4WWfTLIRL5hKjvepn09m2Uohgm8LKh1Ajrg=;
 b=Q2Rw3oySKZaz6RfMl6w0rsboB+ZqEUBVD5u+KAtC+vX2PinVf4IB6tEFDhtXeWiHZxuuY/VoIyALIgV/04ztfUOGcb7GLHu6VQtJ2zPcJHwDY7EYRIHGd4gSuWwaMA8vy1O8oqGFiN2sW37mEvQhDcUH2IWLS95ndk+IgCK8vzc=
Received: from BN0PR04CA0111.namprd04.prod.outlook.com (2603:10b6:408:ec::26)
 by CH3PR10MB6835.namprd10.prod.outlook.com (2603:10b6:610:152::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Mon, 28 Sep
 2026 17:21:12 +0000
Received: from BN7PEPF00000096.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::7) by BN0PR04CA0111.outlook.office365.com
 (2603:10b6:408:ec::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:21:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF00000096.mail.protection.outlook.com (10.167.245.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:21:12 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:20:50 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:20:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:20:49 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHKn5k3571316;
	Mon, 28 Sep 2026 12:20:49 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Akashdeep Kaur <a-kaur@ti.com>
CC: Nishanth Menon <nm@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>
Subject: Re: [PATCH v3] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux macros
Date: Mon, 28 Sep 2026 12:20:47 -0500
Message-ID: <179061600039.2960722.15243289415723442058.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922102629.3707296-1-a-kaur@ti.com>
References: <20260922102629.3707296-1-a-kaur@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000096:EE_|CH3PR10MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efc4190-f5cf-48ad-59fe-08df1d84e528
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MaR7AUm9Hq+Rxsd36P1T2j+9xku8tdCoymIhXzQgFA5oOxtmIIzWrKC+XURxgeftKWA/lzmTUCCI14OqJm218VhDl8izUg6VFyZTv96/lgY7Bi5/scHQmBbD3jOlJbKHeOw3D3bzxURjzhmkCOHxCsBAmqy+vNyeGSO70Hsigrk4UcXWiCz/bnQ8IQQ4IbauR5Jqx63JhwrUj7Fan4+0eNhhDE5XP7pw8UVaaDu2ZTBUvPaVRJMm9KUydWR1Oz6gs0NWpLNd3U5rmdsKAs17gJcx2hunglpGQ2KBqY8n30li93tJsakbggUJO4RrEpt1h5O8/OwsPVpIS932PHBdOmRMWQ5V5bZIamLbHB6+J5lLgmql8aEoxMv0R8t7otcb4LCoABPCcfc70hPLnNyWO4JUxAwOf3sQz6ZZ4otlbzndzk3bSkrTtvxIS0h9Z6dR9CwR23XCBfKGqH9rztzEZ1/2jzBUCSO6TbzxHAaEDhfrgmFYpPm2qfuIuLASQ4NDXkpFUdj34mQTGlBATaTLOLkJp46hlAI+fU5XO//BM+scqhIDkN1mu9Z6V4F8rgG+ythFTEsdJR0G85zZeDZHtPlnhWPdasNcdrhgUX5w1rnkj/RQtCHvYMmX9AHT116y57BWxUyfadGzNKLkT0xJ6Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IvaCFOa9Qh/Nrkn5M9BzfXQd0Ak+8f4pfyCV6+oQZVf8SSnR163jrJ8uggkjpf7g86q4/Pvse6Yz+7tJSdNofVshh4n/TSw/b0YwXEjBiq0+h9SRkLDB+3mjbuK5vRphU9O4FFJ4YRrcYLiZRu56i/kLuBhVvZoCY9HeSoPNI+tgMzRguyACTcdlprOSkQu3CC4uFM0YNkldNdIStsekpVU++lyHYQhGXzQTWrJheJzp0y2y2nDGvJmGidjdrudfx2d72z7udPTd8aMtRu+HB9BbHa0hDDMhFABvBRM6iKxqv2ZRTY6ZSiV4prx0T27ZgC0R7KSMdKzO2qCRACV6lD+FWSTMOm6M5VvD8Z8g8vBdfATm+pIUsWWMfkuJJwGyhJ9bsS/OjV3W4n9402U3qrBlfcZLX3RfkBxwXZ427tivlMo616lk+NtNq0GozEnQ
X-Exchange-RoutingPolicyChecked:
	XAtCC/CfVGRKB6R3ooxnLDlTp8GOtGTvQDAg1ZHtGvDB/5HtyBjJ0fzzyx6Ijf8UW1vUeWO9KkXU+P4TB0Lm1rtu9QJ5VqocuYXryriyR5YW9sIok/mesZG1On1A+sHoHXiuACkUzIQfIiQTUIni5UoaQx3JBquB/pCdEPyFyvhm6h90JJn331OWmXRFC3qRCGj+ejAXjIYsZPhVL3sOFBec+d+sZBwHLecpuIfL5f+vzgn+zhDF+g5lsYZIPAm6EwQb4xZLu1HPdfykzeiscKMgzeCKHU0ZRaOHcL7mcY8v8rrFQEaOuYwmtPJ/hVTdzNWYLAnIJFXK4q7ubm4hvw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:21:12.6290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efc4190-f5cf-48ad-59fe-08df1d84e528
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000096.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6835
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6abaa20c cx=c_pps
 a=3vo4EN8bzuoLd/SmvO3peg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX0sPg5pSV1bj1
 vrZQIhuJS+C9PFXPhx7RRT17OFannd/OwoGkLfWdOTRWtgPZidupY02gyyD0NJ6MWykH6VwgYkv
 D10+nI23SaClKkNOSEsR8QMfV11fq0c4a9e1RQS7cS7V2VmnLt9J0enjODDTQm2x6A1lwd2URJN
 Lf9gteyjyaflSHpWLG6M4pgSYOISSNkr2AVxV7Q1AGGZiIy9yIoXE59iYyizQD0tL6Blz58MoKF
 QfxOIq3vAIZ47odNz+CpzMadZwbAyCeqxg5SZ1tWWA/JvQIIQNiW6CuBxRvQTBXdSX7wrpMlOdt
 YmcWJ0yiQh92R+0n/fPjdWPMOIj834CZu9I9AzzSzbkLquIvnIptVE7spPEDugV0uv5wTWeJoPC
 brAtUKW4XlCG3Hldvz7Fx2jLJC0ex9mthH51esH9pX+db67rjNhy9TxN177EaIZBDnDv4bzwqLP
 Lj2TByOUm0AD6nRa3uQ==
X-Proofpoint-ORIG-GUID: UNV4LP9bA_zguQUWF9mGtC3G9E7bG2CR
X-Proofpoint-GUID: UNV4LP9bA_zguQUWF9mGtC3G9E7bG2CR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX4RfVr7jeMb9P
 eepiNXDEJkLs2mG3dn1ZjwC346AdrCEtHudAp3vxFwGJOzBaiMdpHbauSfmabMKLkzKqHY+b2JM
 0HJ5ot31wbL/d5pcft37A7gpes8wDwI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069

Hi Akashdeep Kaur,

On Tue, 22 Sep 2026 15:56:29 +0530, Akashdeep Kaur wrote:
> Add virtual GPIO select mux macros for configuring the vgpio_sel
> field in pad configuration registers. This field selects GPIO
> controller routing. The meaning of each value is SoC-specific -
> refer to the Technical Reference Manual for the specific SoC.
> 
> For example, on AM62L, values 0 and 1 select GPIO controller 0 and 2
> respectively, while on J784S4, values 0-3 select different GPIO
> controller pairs based on the pin. Pad configuration register
> field details can be found in each SoC's Technical Reference
> Manual (example: section 14.2.1.2.1 of [1]).
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

I expect to see users in teh future and not just macro addition :)

Thank you!

[1/1] arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux macros
      commit: bcd9448aa62b50cc27e9a0d2cf8e63240f8212cb

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

