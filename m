Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21C15477E;
	Mon,  5 Oct 2026 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204583; cv=fail; b=spAbUmrs0+6Yg9hu+FcqGGCvwIuSXZR9niN9PY78HrkiEL2aKW8+JH5Zm4W8ptX6SKXMSCwgJcc4ay9jXVfJcRgnVH0zZYOjCS5DiHdGmA3o2zkWQPMoHgzLEV66snP0nl5lrrPEGppR70ljBcoJNq0gOxBciOllfhgJ2urWuN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204583; c=relaxed/simple;
	bh=i5rN9o39a8mFFwo/JQKP6IYJyuUaeVpLLfWIVHm5GEs=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asQuKsUwoSMjqFnX6yhFh0CaJvRKLiNCyAp2wWFShOvAZ7X1ahy20COR6LB9icmSMxefl3kCrDCCnFdrkO3NLxKxfzwsXLgZMfcdNk05X40uT+SgxG9GHTy7Mju/TE2ydiVsdQnsG5qvgBSgwWRWa25wKwnZVIJkVhDA1uttlk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=cDU+Q68f; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=V/MjF3o2; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="cDU+Q68f";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="V/MjF3o2"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695CICwI4052425;
	Mon, 5 Oct 2026 07:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	proofpoint-05-2026; bh=yjwfgoHV/QFSLoBAnzcr/Yo62JOGfgHlqukwTkz4V
	xI=; b=cDU+Q68frmcxN9jNiRq+Kav6RQgoFwypzEsVfujauhvqWzQZZ/jtynIrU
	+DhbaG7+BXySafALKDDRHfBpQs87GSdHE/f2aCtB9sX+htK4PAc75G7pM3OfE6hn
	RiynANerp9OcNTLo+e7LL9rqw/VA5w546xeoJTuq7w+Qjb2dytuhgmxCBJmlCEH0
	iyctjhrOnKg341iG61/97IQpPhR9iClrsXz81cXUQmQ9yXMT8Cvu9zUhUWNaqwTw
	IXht7J9oygVFfCqc4t/CpQlcjRrgjcBrHNNyWlOmPP96yQzbQUG7dz/NilwG6zDv
	sJ5VRSvVO0/uYEO2l/vwo7a486iAg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h3knnn0sg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:49:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSucaNXbYd8g/Lz1KT++Ug5qhqWilXL8nDoKn+xsilFUINy0NegI9KbEQgPy3ACE6ABOPBwUSH0D/RSAv4UZ1QA7CGyn7zWd7MdRmIRR1tjgvrFIW+ARZV844ZjzQsQBbUVWrVDhNl6sOINka2dM1AzEC/KAObyxPOvU235i61D6RKozbIX50AvJV/z9BUKUtUpfCoTpsOosi6PGgHbqWGIHfFr2JFT/mYERXysgmtPiJ94tbT25Ffv0lHNAs4aRgqp+pCrXJJJPfn/p80HvMyA7V/OgN9hCm0072n7HWZfLEwtV7JVcAp5HQ8IznBLynaC5ZSCXBM9OLMhshVcExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjwfgoHV/QFSLoBAnzcr/Yo62JOGfgHlqukwTkz4VxI=;
 b=UcrrOpqNY3mx27Hr7WbeNA6fSkfpILMtRF40avnhljx4tOMRnUmkyKx7xPpQcrHKTIUXolovRFr975i8P1eYeWjLPKeBV+dYiL4stf9W9HoTV/Q2r8g2W4TvXkOcvGATVU3zbK+cj1yEPWJDzCKqZfdyJXrJiNEeAMAOWmdiuXGyypP6sO40NhM9hrsRlbOg1Ra8yeIMFBWNcTg3vPfu0NC5l7wSBOsZVG64h4HS9VMhnEYOFb9rYNBZt7q8ICmK9Fv9FM7WQeyUtJDv5RaVb9N/ONH330qNOKNsTclljL0H4mnu+CFZexsbg5lDdPnK9mvDvm3t/EuJEnKTg+Uwug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjwfgoHV/QFSLoBAnzcr/Yo62JOGfgHlqukwTkz4VxI=;
 b=V/MjF3o2LHhgYRdVmoYkSGmXdD01eS+23gOFVgK0SiKWHYqgLEZwEuwRpg3q+wLIrq04D1pfemm6RNx06vmJ7Lepvbxw+ZHSdsWYtofqYxcMLwWEOd9sAbaQ6ZqyZOE0SrcJMfu6iPmjjnUdbcUDS2hX2oxtOGqSt7yS7Ej+i5E=
Received: from BN9PR03CA0060.namprd03.prod.outlook.com (2603:10b6:408:fb::35)
 by MW5PR10MB5715.namprd10.prod.outlook.com (2603:10b6:303:19c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 12:49:30 +0000
Received: from BN7PEPF000000A3.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::34) by BN9PR03CA0060.outlook.office365.com
 (2603:10b6:408:fb::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:49:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN7PEPF000000A3.mail.protection.outlook.com (10.167.248.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:49:27 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:15 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:49:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CnFlL193466;
	Mon, 5 Oct 2026 07:49:15 -0500
Date: Mon, 5 Oct 2026 07:49:15 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Tony Lindgren
	<tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 1/5] soc: ti: Driver updates for v7.4
Message-ID: <20261005124915.e632elbacgr6nxgs@anyway>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7a7mvxosqgb7eqzg"
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A3:EE_|MW5PR10MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 7567b553-f84d-4400-6ff8-08df22df173e
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0gyx+x30vX3Iwgm6Ez8CB0ro0HmcpuuRDPOFPNT6/TIH0C2j0yeS3kt8jSAPabAGPEqMBbLOmjzSTlcG7qS6Rn6nwWAJ18R7gsBRbvzExkXLrJLYeb14lFaDXygHfiiavtYwQiv88GMDM3rwg2CBhhbAO9zU4TLR/hZXXnPo+QH/fwc/WR77xYYsv9ByEmQak0VIo85E+8JAGBS2CnAflp7Bk6ChUEqWLBVzJVRPmseWkkkF0pkKlD/z1+zq4C37mnn4Ewn06Lmo6P/IXuLdAWFA/8WnZ/CKStkBgiPxGpaDT8avvY7J86O+rUw7X1+EeCTEEX9hfzYDid7myMfLdFeWIabvdbQEowrFoOogLpfJD5+uupO2Q2Il914ifE7HRaRul+gme6FAK69Cs5rvPRrhdzvlf1hyjOd0owuB/ARdvYxt1TPacJq3y5AYssxSd+9UZW7Qo7XzFpSjF3BEWMrOs7rgkm+svk5D/GwCMZYYetJCmYcQ899RmtSD3/9D/RcC2+z9A5H/w2tOZPnSRwpCTC2WTC5rJr26DJet3POjC4DVX2Z0RRMHL+GFBx68Vd2RZ1bWZDiZsOzgeiRawAxR4zyroqT8QcOocHkgd0mr+eAK6rqtpN5LycobJcHTZcqsqAj1k/D5f/xCHyOOjw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AgB4aPKZqePOinlesh1QNXfK0Uo4zDp/lg7v8O96g9SVzpMAz/LRBJFczgDQuFNKX3Pc8Rmxu8D0eI66uSA5wldIOZfaNg8BA6jdFYq0BmdYO9QOoEeuHNPepvdQYD0jk6lbEhJBaJLwUedyi+kwsuMUTj359rk9LXGQ5fgAdf3Yq1+HFY96krOh74Zyl7264qtu5JdOockfz/yvH54J5uzfyjIIfRu7NdjKTEoKH54L+SBN01oyZOtPIfBPvxpU3/tlTJYndZwI3in7ZOCszqmUUkSbq/goFi5OMLvVL1GwwSCVGkpJBUAxH/GdW+2Anbiuntaxn2riU09NjI3CoRQSqAmY/LierClr9pGWB1eYo5dc66bCKkCM+bYHgr8JZ8+JKsyQsqCVMijhldL66/1QafJYesg1v8mdNBoSJyBB8gBD3Jf2qyKK6/zGIbNq
X-Exchange-RoutingPolicyChecked:
	Rh4FkGGLGMRF4OM1vrKfm/HXn8PtL+EiubR0lc06lr5s0fkYJqDUNe5+n9+Kf3V4I+xpJurlp/2kq4UM2/quLiVmpGNnfSUBAFE30PL8t4yFiU4d5F32ONwZR0y1poPIXCKUw5DK0j0dsWyx4kGm/nlVD3OROqozVEy0+1BhYXhFxOV6ugM3A5lY6zh9e4WBxGo5BwDTLkc6EW9XtF0+RutP/o9j1gsRgC8DSnJdtizKcDRZU0FsdOo0KzhlIsBOh+C7fuRVu/BcPHJ0s8pvq8zf1NDKvPqjqEHIyQm9obnZx3KhldBH40YQzXvkfy1BTC3AhDTvwkN1s1ZwCg2SIA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:49:27.1769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7567b553-f84d-4400-6ff8-08df22df173e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5715
X-Authority-Analysis: v=2.4 cv=I/7w19gg c=1 sm=1 tr=0 ts=6ac39cde cx=c_pps
 a=cC1MplHVCFGqAfo43Zf6QA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=MJwXx7QtVkOLgzW8-9MA:9 a=CjuIK1q_8ugA:10 a=SJ07Qs1Z2VWhagBt9tcA:9
 a=FfaGCDsud1wA:10
X-Proofpoint-GUID: S74Yfg6am4agaMofnkySFvv30WDsRl_i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfXx5zv6p9DY5QE
 yijZk0tKvbjBSlxC91eQd2GkTMD5LkFUjVmDpZpybCYFif0mS157l4b6NcE++GdoK7wZVa17ovX
 h/sC6mmqO6+yJdYiPewCfHswMHeJ3b8h0tZApSxUeRKR8jL7eI/jJlL/HTkFMBF+X22dURQ+tvd
 PBBmGiRc08bhUNO+tP019PrX2UC5zfgTu1faWVXUgL+NGiSF+wqAwvso+mppdGvIzVBe57LxWNN
 DlY3shD5zX9sCllS6r4ieE/VZPDKB6OIIUT/7t6zvRDY1MFWFa/mb3sQ7geG+Zoggb2ETawhTxu
 Ep/zq8iC7Z+6DWjniFBAPMdBEcWev9hpYYlZDa0YP1LM5gOJOjhTWhABLP1OGU5HBYs3OiZDcqn
 FTgiqI1CZW9/kv6X5TOD56EQtSKWRnP/cKho+qqAPqNvfSAcikyZ5WVk4jRn9l9vXRFwN0ZqAYj
 5XCyPmcDsG1yDEOpkCA==
X-Proofpoint-ORIG-GUID: S74Yfg6am4agaMofnkySFvv30WDsRl_i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX7UpkS0Hn14Dp
 nHHWUplt7fCkuLCACFPJnPyiaL4pA3TuKZ+vtlNnLysUMdGXAX9ZxNWx2cwAD9kAznPrZG4dAeG
 wTBWXLdMfDZN1XTG95GIEnLpfrAVUYc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050049

--7a7mvxosqgb7eqzg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v7.4

for you to fetch changes up to 6c4e6e8f5cf95f7e0d4f04928a9ae70e20c73d4b:

  soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc (2026-09-28 1=
2:04:19 -0500)

----------------------------------------------------------------
TI SoC driver updates for v7.4

Small cleanup-only pull request for drivers/firmware and drivers/soc/ti.
It contains no functional changes to SoC behavior and no new features

Firmware:
- ti_sci: Simplify the buffer pointer allocation by using kzalloc() in place
  of kcalloc()
- ti_sci: Fix a typo in comments

SoC drivers:
- k3-ringacc: Correct the ring API kernel-doc and the DMA ring initializati=
on
  kernel-doc so the documentation matches the code
- knav_qmss: Fix typos in comments

----------------------------------------------------------------
Hemanth Selam (2):
      firmware: ti_sci: Fix typo "upto" in comments
      soc: ti: knav_qmss: Fix typos in comments

Karl Mehltretter (2):
      soc: ti: k3-ringacc: Correct ring API kernel-doc
      soc: ti: k3-ringacc: Fix DMA ring initialization kernel-doc

Siddharth Karanam (1):
      firmware: ti_sci: replace kcalloc with kzalloc for buffer pointer all=
ocation

 drivers/firmware/ti_sci.c         |  6 +++---
 drivers/soc/ti/knav_qmss_queue.c  |  4 ++--
 include/linux/soc/ti/k3-ringacc.h | 31 ++++++++++++++++---------------
 3 files changed, 21 insertions(+), 20 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--7a7mvxosqgb7eqzg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmrDnMMACgkQ3bWEnRc2
JJ2BoA//cKMOvIreBxpbX45hwToLyccnCX1sudPIVlI8LN8T5D3wQBbx+tEO8I0W
R9q9C3KSeyPdOGzSQS8VhM05istyfQv8bxHJr5+oizt6C2lY0mQCzRMMMG5pus5P
lvOitYvFPHfE7FN0eeSNARwM6mJaIfJHGQ4/m7mX1s4IOpX9J3Kyuhvi9yudkH3Z
p4pJhFScV8LKFd7XVCFnPNI5GKr6TA6z+wbHGQnaH5zF5h1471cpvt74acYjtgB+
AlVIkmSwCIzeueLEAFKqBahkdmSxgsh/rot6/otWE5/TdV/lIu/0ViX6+Ieg+0dz
zXr0pzWC2FMUJYyNxTfN/+oI+QXs2/Wvy4NpPKunr2ZYwFDXJVBJte2rJczDkQte
ExqEt6J7E0Pz/sOu2RviiCIMg+UDal4OCWFjzhVHqr25sFTwGpA2V5MpzYYb8Hav
VzUkN/5uZ2AYj4+IZU3FKl6h+NxD9MUKGLjcis5bPBH4LJ3FbpirzeANC5rnJsTE
ZHjugnb59MhohyrtjQuwBsFbumTIVblhqB9C2ZNNAugiIZIXXSlZ89NO9921ADS5
pbhvmtjeV9k9wnjtSMw2k2J2MTzFqLK2+gFTJGo5MYnilnpgvn4iYSLuM9pS142c
qDnBn5+tAHPYmxWD3uFp2M+ri9eQqBhVuB/QsiE7Fn+gJkz+H94=
=9tWw
-----END PGP SIGNATURE-----

--7a7mvxosqgb7eqzg--
