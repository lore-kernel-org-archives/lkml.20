Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9374148125B;
	Mon,  5 Oct 2026 12:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204638; cv=fail; b=eu6q3sY0nq/FeQy2mwEoBEIlERKAYVvJWh61r8R2IaRE5BySgGyaBz2LJy4YGqHySQsPb0kAdMGuIBXgIKn+2cyMOxdDgvf4+zcAmZxuHqghypSo3EJWXphCmtJrbmQ88r9AlnbTzEAePUdULFzqIEqOzzHGaIDQUuJqZ7xJ0lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204638; c=relaxed/simple;
	bh=oNmlPyBpxisv3Qjb3Ont9IeKjQLvLqs7rv6y2w0QXMM=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IwNvGhRbs/PFPIIET29fiFL44rZHieUoThAaV9tmlfi5LL/rNxcn9ckPNymtQu/JHAZAznDMqsHMVGgy3zwVM69S/ZPgHz8NjvGxVdjISIRsQPv06wb2gKEHsLu6kWrbcUtV6MrT/C7iEeGt6/WdQk1gt63Wt9OohD2Ur4U4G0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I7qgfLqt; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Q2t6TeEP; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I7qgfLqt";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Q2t6TeEP"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CI7ZY4126201;
	Mon, 5 Oct 2026 07:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	proofpoint-05-2026; bh=c/sG85KH7HZznpEKjkUC53lGroOyjUo9uJLqzV3dd
	F8=; b=I7qgfLqtdvfokNWB0Oyamw49jOWlV+d5OUmVncAesz0EhLPpcG71IyF/+
	VGzTx2Bcg38aVmkmsJTPTJ0F+YRLYund7fVOqBRLfgTWLxZYVxDLifzsRW4gS/OE
	A04ye5M3gS4yE7OT5Vy11+SKkIBFDGDIoATGTsUREAXPMGoZITrNUsOeHgDWy98r
	ckUEtwelXsWZr9K5HrbkUMMo3DKaMuFYuMNlm0DBB9jU7iQU7emW8rxepacUslt0
	i8zWmcUFhXIdEoFapw8N+AFmvhnGIKjJg5DBJa4+B+SoVU3ofPPlMH+45PYO78v7
	kPkvx82KyjkgsFEmJ8FPwwOaWGhPA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h3h335aka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:50:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwT2bcPAsxUEUt7ZSpfajmBxz/GyldH/dUA24dBg5Vm3APVVf1/Wdg3okK395hsEJyChC+BhMucLaidV8dcg9wo4GsbcycF1qs4CU5e5D20xhWauSw099kkn++WRAuZJjT7ukjP5czbeY4vL1/XdQYPrFrn5tYc+wLCz9gnGDD0S+r6HFDwu+0VG4FwzO8NKvREC8pKwtcRAB0cBtDIAy+qCtkCWPyMFAKcwmujJ8U/4vZVL3uLCQE7yO5a2rywk5FjKQR8RcxStej+jhtxKD98zhd0lmAszWlKIAdZAp1xFPPVa5RS+Z0kZ8n+e/bi0L1n08eprqoIPqOIhoBPSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/sG85KH7HZznpEKjkUC53lGroOyjUo9uJLqzV3ddF8=;
 b=ZjC66BjJZB6xGoQoNpAmFIi0Nvgj92CeH0i7/Gk1Peo1pcDq8Agn2LwFbYbJepQH3l2OicQQ3N53YhTjyF3pfCLDD14EvK/08PbXon0UcrT66fwvlPqE1SbG8ftOEnYuqpZTt69XBf9JoCyB6nWFSfAAMyJnnH4Qf0gL5DZsitO894D++ZF5RAAUn3EE3HsA7UfWmXfVsrGAKQB50J5uG72OhjYUPce8+E8/noAKx6gxyknp5V0525xlfZyYFQwnV7KJZUK+NWjpijxcDKOK3xDTwC0IeZSUQAcb1avBI838JxFVNe7XduXFxBPM7LMkXL28AFpO+ww6znapWHsf+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/sG85KH7HZznpEKjkUC53lGroOyjUo9uJLqzV3ddF8=;
 b=Q2t6TeEPKAOCsPTVsnfwM1noWSrpg8Zts23QyHV014izL4GFVCGJAyY1pN8GM1MDzgmJHlx5HzhgOR0udAnA+iW9VPltQSVp8iv2iSNSY4+iSmvEzvI+ICD5EabbF4ccyXbsvnv0jwg61Zt/kfAzBVh9ef7+Ba4DFbGMwpxidwk=
Received: from CH0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:610:e5::24)
 by SN4PR10MB5622.namprd10.prod.outlook.com (2603:10b6:806:209::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 12:50:16 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::36) by CH0PR03CA0259.outlook.office365.com
 (2603:10b6:610:e5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:50:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:50:15 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:36 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:49:36 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CnZD51158901;
	Mon, 5 Oct 2026 07:49:35 -0500
Date: Mon, 5 Oct 2026 07:49:35 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Tony Lindgren
	<tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 3/5] arm64: dts: ti: K3 updates for v7.4
Message-ID: <20261005124935.pduihnrs2kggkkwf@engulf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y5oyni2j4p7ztzzg"
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|SN4PR10MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c1f5551-a0b3-4f21-f87c-08df22df33c3
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|18002099003|10067099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	Ottkh1x+jX/qWKzeDhNQWbK1nzdzgbp7VCLiEdoKDflDwsDGdiocXyk+uBQ7aQPidlwkssXGKGHg13lWSEn4ZJukDuqAzVno9eCkU7zCj4GjQsiYsne0lpVBliUk6RlmjXivXFTYvAstg2expNtYf6T73NixviaI2bFLhDbOIYRDHtNIZPEOe2ZKH6lIt5Hah1B23Mj1myYQlDibDpZs6CjGjA+EVE/rBczRzRBQESSbB1Qb1/Fj8dJIsZl+91V0OLuyUyYXr1n6lLCH8tyK/LRxdQ0nSwveViJIKXSmR/F5p1R3yXoQIclmr5uTe4cpmPs5FZz9B99mW+QxFR7vG9qHVz4S9q5y/JIBqKY3U43gs3KxsZQuj6uBC0akPPJ4/k0f1ALXwTAKRPChRRf8pF4/FcxRUe9mgacIdrnNPl5eWIAYpvJko4koS8dE+MJBLYNOQFAyjzRRIlsvRD/YsNdVcAhlrfZfVvDPnoWad/CEuhZG8J2y+UzUeqhHirp2ncJMBtxg9Qi7IQikHIPNcgnkyrrMjNMMf3Tb3MPim0YgZGFlNbh9JpPk2vRavOR55GsM/ENijNwItR+yjL4Fu34K5ViNnRAAKgqDspb57U/kA6ZMxVrZ1ji3No2AZsdVugkeECmxCRUQ4YjjP8c6PA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(18002099003)(10067099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UdJhgFLAWCtnqHQ9GpTSnDMvsDIF1fgY6g0w/ES5PTgl3Kx8cuVwlGF/oIbu2eWE2HpyF0Q8IwY0mUJIYgWsEoapmDy0oEeVK5+uvR8l8kZAapAzGxbNY6byDdVXAiFBLfvXySzS+breBHGFcW8+t/mJDJSxpKDiy3oN8Gqf4rzKK8y4JpTqj89QgQo1bW3pm5ccAwwAJY5Rwj3Ixg4XSmIX23judL1RsOOFKwPR8hXhX2L+KGLJFhW3pYuwQMBYV+gLGuE423sD8W9vzSOaRM408aE1SXktodXaC5xxccRAaKPl8fkg5v6at6svhhxQkm5KsJBjHOE4mtHztp4f4/YTUZvz9837DsjPpCGe3hW9PyAgvnMQPcsKUbh9aIYj0DG7Bnm1EYG/9yNUrQrGbHW5L15nu6kt5OxpyAtPsP09D5/XWR+3uXyMUVS2Yktw
X-Exchange-RoutingPolicyChecked:
	WRtbSQhjTqjlHiDCPA51UG0vHzf1NJ9KhW38hdJCSJGovvJA9c3B92/CNtk5GdLbn2AfwCUo9/UZVUlZuhOkGCeVHG7fnVDR6pCp+wUcHpPQz7DEVcvRCuuctfXiZ+q7FJOaTaK9RcZ5ADwHsTPL7bxJQTwjReWDm3Hvfw642BzXtE5WfDG+FZqUv+hw8uYUzkwD9zVc1ZpyjFjnQQqh7zFBIcoAFlGHwaGJFgunFxSj4HSgF2tyfveHYB41N9UEVStXEChhJ/tiFD1W3SH1fgT9e5SctXofC2M43Jqs5C61UpfQRvQEwfKC0k5faS2FUiC8Of+miDP2NeW/0ImYwA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:50:15.0460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c1f5551-a0b3-4f21-f87c-08df22df33c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5622
X-Proofpoint-ORIG-GUID: crt59Itk1h5wZibWIEoyP134jOMOk-La
X-Proofpoint-GUID: crt59Itk1h5wZibWIEoyP134jOMOk-La
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX3CAT3Leu8hE6
 iX2uSw35OlPFNtzy079qea+tUX7MYE4BVsZSsTr9NcaohPAsgMGkCrxpwnzfCqey/o/tYa23gZO
 D0Z33NSqeJQVoEdpDIADoV4KhaJwQn0=
X-Authority-Analysis: v=2.4 cv=QJX91QLL c=1 sm=1 tr=0 ts=6ac39d10 cx=c_pps
 a=nnEkt3JPOmPsbYuuSDyGUw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=Q9vtp2V0DUpYXeNngSgA:9 a=CjuIK1q_8ugA:10
 a=odnS7ORkraWzws-mpykA:9 a=FfaGCDsud1wA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfXzCPaHrUrnJXm
 bW3gtbYhIRspyM3tdFD7rxxLNteGIkcvR9YDSzZbcWI7Gn4r+aWHjJhCQUvwTDwD32E/mRAicVl
 ZwLaXgVUZGBCXV0him2KjKD19zzEp/zDN590hWakC6dQjGxgq9oMggV8VRWRZ2bHNZLKHwbSPH5
 VCp2uJI0LluSGa1LBHlF1fiVyCK+sRhUtDvKKe3KJBAxwsoYAjjtmKexbPwcmzJC1Zd9zC2IIXw
 Z0I115q8/6/Acrd3hSjIUwtYRPox2Sh7iGzBQUmPhq1nWOGygifRxVnoUJprx5wTjxSDRFJvywc
 p4e4vGmZurdOjJwjcv7oE7q2wl7ROQGKo0dkBZ1SABn8qOh5UqBu46ud5+VOYyKr2dLBl76Qm9i
 EdDwe/iXDFNCEMhXNAANGDZVb0aRUCi/ujOmIyNF/DK2R0ZnJIlgLzzWIiQFhGXQeMimG7MNEQP
 91VeZYsHbWljb8YEnMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050049

--y5oyni2j4p7ztzzg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that the property 'power-off-delay-us' picked up that is availa=
ble
in linux-next. We are clean on dtbs_check on linux-next next-20261002.

Please pull

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-d=
t-for-v7.4

for you to fetch changes up to 0d14dd104de66eff1500dec9e80d72c4ab82b608:

  arm64: dts: ti: k3-am62*: Add wkup R5F nodes to pre-ram bootphase (2026-1=
0-01 19:35:44 -0500)

----------------------------------------------------------------
TI K3 device tree updates for v7.4

Generic Fixes/Cleanups:
* MMC: Configure the MMC clock pads as OUTPUT across AM62x, AM62A and AM62P
  based boards (SK, LP-SK, BeaglePlay, PocketBeagle2, phyCORE, TQMa62xx,
  Variscite and Verdin), so the clock pin is driven correctly.
* am62a: Fix the MMC0_CLK pin register address.
* am62*: Add the wakeup R5F nodes to the pre-RAM bootphase, and split the R=
5F
  memory region on AM62A and AM62P.
* am62*: Correct the wkup R5F memory region size on the AM62A, AM62D and AM=
62P
  boards and SoMs that reuse the shared IPC firmware layout.
* k3-pinctrl: Add virtual GPIO select mux macros.
* am62a/am62p/j722s: Fix watchdog comments.
* dt-bindings: Update the audio-refclk binding and the J721E system control=
ler
  binding.

SoC Specific features and Fixes:
AM62A:
* Assign on-chip SRAM to the VPU (wave5) node.

AM62P/J722S:
* Add the GPU node.
* Assign on-chip SRAM to the VPU node.

J721S2:
* Add an mmio-sram node to main_navss and assign SRAM to the VPU node.

Board Specific:
AM62x:
* SK: Mark the eMMC as non-removable.
* AM62L EVM: Remove unnecessary internal pull-ups on the MMC0 pins.
* Verdin, Ivy and Zinnia: Fix the main_gpio0/main_gpio1 line-names array si=
zes
  and add the missing SODIMM_84 line name.

AM62A:
* SK: Add an ethernet alias.

AM62P:
* Verdin: Build the Zinnia DTBs.

AM654:
* Base board: Add a power-off delay so the MMC supply is properly power-cyc=
led.

AM67 (J722S):
* Add support for the PHYTEC phyCORE-AM67x SoM, including its bindings.

AM69 (J784S4/J742S2):
* Aquila: Add the Toradex DSI-to-LVDS adapter with the 10.1" V2 display and=
 fix
  a typo in the AQUILA_B73 GPIO line name.
* EVM: Set the ACSPCIe refclk to MAIN_PLL2_HSDIV4 for PCIe1.

J7200:
* Common proc board: Add an ethernet alias.

J721S2:
* EVM: Add an audio overlay.
* Common proc board: Add an ethernet alias.

J722S:
* EVM: Switch the audio codec clock from audio_refclk1 to an external clock,
  and add an ethernet alias

----------------------------------------------------------------
Akashdeep Kaur (1):
      arm64: dts: ti: k3-pinctrl: Add virtual GPIO select mux macros

Brandon Brnich (4):
      arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
      arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
      arm64: dts: ti: k3-am62a-main: Assign SRAM to VPU node
      arm64: dts: ti: k3-am62p-j722s-common-main: Assign SRAM to VPU node

Francesco Dolcini (7):
      arm64: dts: ti: k3-am62-verdin: Set MMC clock pins as OUTPUT
      arm64: dts: ti: k3-am62p5-verdin: build zinnia dtbs
      arm64: dts: ti: k3-am62-verdin: add SODIMM_84 gpio-line-name
      arm64: dts: ti: k3-am69-aquila: fix AQUILA_B73 gpio-line-names typo
      arm64: dts: ti: k3-am62-verdin: fix main_gpio0/main_gpio1 line names =
size
      arm64: dts: ti: k3-am62-verdin-ivy: Fix main_gpio0/main_gpio1 line na=
mes size
      arm64: dts: ti: k3-am62-verdin-zinnia: Fix main_gpio0/main_gpio1 line=
 names size

Jared McArthur (2):
      arm64: dts: ti: k3-j722s-evm: Switch audio codec clock from audio_ref=
clk1 to external clock
      arm64: dts: ti: k3-j784s4-j742s2-evm-common: Set ACSPCIe refclk to MA=
IN_PLL2_HSDIV4 for pcie1

Jayesh Choudhary (1):
      arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Judith Mendez (19):
      arm64: dts: ti: k3-am62a-mcu: Fix watchdog comment
      arm64: dts: ti: k3-am62p-j722s-mcu: Fix watchdog comment
      arm64: dts: ti: k3-am625-sk-common: Add non-removable flag for eMMC
      arm64: dts: ti: k3-am654-base-board: Add power-off delay for proper M=
MC power cycle
      arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
      arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for=
 MMC0
      arm64: dts: ti: k3-am62a7-sk: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am62a7-sk: Set SD clock pin as OUTPUT
      arm64: dts: ti: k3-am62a-phycore-som: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am62-lp-sk: Set eMMC clock pins as OUTPUT
      arm64: dts: ti: k3-am62-pocketbeagle2: Set SD clock pin as OUTPUT
      arm64: dts: ti: k3-am625-beagleplay: Set MMC clock pins as OUTPUT
      arm64: dts: ti: k3-am62x-sk-common: Set SD clock pin as OUTPUT
      arm64: dts: ti: k3-am625-sk-common: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am62-phycore-som: Set eMMC clock pin as OUTPUT
      arm64: dts: ti: k3-am625-tqma62xx: Set MMC clock pins as OUTPUT
      arm64: dts: ti: k3-am625-var-som-symphony: Set SD clock pins as OUTPUT
      arm64: dts: ti: k3-am625-var-som: Set MMC clock pins as OUTPUT
      arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD clock pin as OUTPUT

Leonardo Costa (1):
      arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to LVDS adapter with =
the 10.1" V2 display

Markus Schneider-Pargmann (TI) (9):
      arm64: dts: ti: k3-am62a-phycore-som: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a7-sk: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62p5-sk: Fix wkup R5F memory region size
      arm64: dts: ti: var-som-am62p: Fix wkup R5F memory region size
      arm64: dts: ti: k3-am62a: Split r5f memory region
      arm64: dts: ti: k3-am62p: Split r5f memory region
      arm64: dts: ti: k3-am62*: Add wkup R5F nodes to pre-ram bootphase

Michael Walle (1):
      arm64: dts: ti: am62p/j722s: Add GPU node

Moteen Shah (1):
      dt-bindings: ti: Update audio-refclk binding and j721e system control=
ler

Nathan Morrisson (2):
      dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
      arm64: dts: ti: Add support for the phyCORE-AM67x

Siddharth Vadapalli (4):
      arm64: dts: ti: k3-am62a7-sk: Add ethernet alias
      arm64: dts: ti: k3-j7200-common-proc-board: Add ethernet alias
      arm64: dts: ti: k3-j721s2-common-proc-board: Add ethernet alias
      arm64: dts: ti: k3-j722s-evm: Add ethernet alias

 Documentation/devicetree/bindings/arm/ti/k3.yaml   |   7 +
 .../bindings/clock/ti,am62-audio-refclk.yaml       |   8 +-
 .../soc/ti/ti,j721e-system-controller.yaml         |   6 +-
 arch/arm64/boot/dts/ti/Makefile                    |  12 +
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts           |   2 +-
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi    |   2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts   |   2 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-ivy.dtsi     |  41 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi  |  41 +-
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi         |  49 +--
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts     |   6 +-
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi     |   3 +-
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts      |   4 +-
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi      |   2 +-
 .../boot/dts/ti/k3-am625-var-som-symphony.dts      |   2 +-
 arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi       |   4 +-
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |   1 +
 arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi           |   2 +-
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi   |  31 +-
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      |  11 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts            |  35 +-
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts           |  32 +-
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts           |   4 +-
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |  12 +
 .../boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi     |   2 +-
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      |  11 +-
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi        |  29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts            |  29 +-
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi      |  29 +-
 arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi |   2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi     |   2 +-
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts     |   1 +
 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi    | 324 ++++++++++++++++
 .../arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts | 431 +++++++++++++++++=
++++
 ...uila-dsi-to-lvds-v2-panel-cap-touch-10inch.dtso | 161 ++++++++
 arch/arm64/boot/dts/ti/k3-am69-aquila.dtsi         |   2 +-
 .../boot/dts/ti/k3-j7200-common-proc-board.dts     |   1 +
 .../boot/dts/ti/k3-j721s2-common-proc-board.dts    |   1 +
 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso    | 157 ++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi         |  18 +
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts            |  26 +-
 .../boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi   |   2 +
 arch/arm64/boot/dts/ti/k3-pinctrl.h                |  10 +
 43 files changed, 1379 insertions(+), 178 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am6754-phyboard-rigel.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-v2-pa=
nel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--y5oyni2j4p7ztzzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmrDnNkACgkQ3bWEnRc2
JJ2JYA/+LXpynR6urxhdhvD5KzMchj1h0MLfblpw/AUWvokNazVDSwW7cItU2ccF
S/Y/dXOYw9rdaiAUxJ2IJdXEBO+o6ZdFYIZYBBvcYKVST3VJQWJ503oIxuOOGiE1
LBx0NFMRmEx4Co3uMMTTNeBd30Q3Qcc+uAGF8KUuUs8NJlj3qkgyU91V4nxfTrNT
A4zDHq1bVeNquUzdU7PlQ3SHhFIDUP9u20VC8jvzD0xm42Dr9XLQM2QUOR6wgENM
TQpdFUkiXCeO+RlCMsR/LubdujNgfpRe7g93+DWXJev0Ghlvi4KDFPd96xTNyyvX
0PrVZODJkCEs2OSNQ9Orf/8OAvyWd5F94FRE2BltTz0BQq4lWOOK0ZpgFcSaZn7w
dZt1lGsSuF09zlfvQJRkLtJ44lNMgPNCbn0S9rfUpZiTQXmU6CTal/3hWMJEt9DO
XTqI+ZuCgQfL7jZHelEpwqWyODcUPU5XJ/Va4FmJHbp5EMRKsr9nWlNrcfoTvHKj
BnoQ0w04xHwflJdiyppbHnQ4tXjHdXSM2uukq8KM2vrgQj4Rm8rVi8OEuA7dNJj/
cRFNZo97pWU2bRmghv0qG9qZoLK8iOexB6yUR9dgR7gX9Tsh586oR3+UFXq8BQ3g
4Ks9HOtMGUXM15dHr/06A+iahkSaBwaXTJLdYPdKtcgnQnXAtMk=
=gQWK
-----END PGP SIGNATURE-----

--y5oyni2j4p7ztzzg--
