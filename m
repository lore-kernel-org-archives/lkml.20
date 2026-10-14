Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707BB30B517
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966576; cv=fail; b=BjiBtIgHtGaYA2QzQhP3h2jByiq6r39F8W/vr9mgXJRxMwvgmi+GhIGIIA7BiE23BsqMpy5J73dorC7VjPTt9j/phBT7VVq0uLrZTIFBbQFHNCMEk0Zghj9OA6wleE1TJRapx6p3CyjDkM99PGaOhGnzBJE91tLa4YoGwjnvoso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966576; c=relaxed/simple;
	bh=iZOCI0NaDx9OHgHmxgLVkNLNumDIAeTz9dFPHeMDsqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AKssMVypFWu9HOhrnYlOrGuhj0X2ruVF4Gj4Mbx6YRecEghmwlFi6Rlmu6jwKxQYkE2Fx4ipXT6MAyKlKiMe0DNDvCFsBYnB0AVY2n4N/pctYPBfiL6/24HErqRKUxhMyO4PE5iAg9VyqY6lFxQR5v7M26b8gCGw5FyQ4855ZqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=GFPxM6iK; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=VHLdW65c; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="GFPxM6iK";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="VHLdW65c"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69E6AlXB2155397;
	Wed, 14 Oct 2026 03:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YnpBKiRAPA9nc/evGOhS9YGWGm2ztdu/VR9aJu/bl
	iU=; b=GFPxM6iKvD8d9qhgaBc8a54akhj8/yvzTNO1FQcOkpPyPID4J3AE3Fs1L
	mnJ2jcJYp2wWeVjlY1dOrjXzSUgGr/R7oVHJl2EDLcqYEDRsu+KgFWb9+zIMZhlu
	lW6i/E3LMhMCItLgSuTO5+J84mMi9+I2t3MNalzxn9Fz5lm7Sq9XAHD8a8lFiboE
	FAHBLsRk03gRJ98CPRjKUf0HNHAAnOXWP6EiVi/kotsJAgcVUEH4XncpGMXC7aN9
	p+wVoCkGoyPu+fPFb6tCbsNSpujZaz6+UVljul4DXy3pYpl0fiS/yWh9iJ4XomaC
	gt2Bo+O44GE9pu5y0g2WcLY7eB8tw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010012.outbound.protection.outlook.com [40.93.198.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ha02ra4cm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 03:29:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc28DCO2ZKUdH3l6/aTn9jgvXinrXuTwgZdWcYAOiz75+JInkl6TioXDVFu6kTyR6TuvGTGJlY2MmVc5O8x0ms+ckgskjWdFlIFPzLQriC5bm46sTzQjjKI3l8lssvDKs1Mu42dY72XBzts8XE4caX0/EOE0aaMcYMGaKn8gytGLioQ0rkFlbiKiazR6KEiMh4segHxPXBvntHmcSHR0X3+tBngoX0VCo3kKUvc3AdnkF0mIjKn9aNYlIXSfiN3OMcI5RQzqog2w56fZgVbGhnw4CQrINtFa9c/wz1dYeUcK78PtM3W1bAg5r6GGbx5H2R1s18uttLOQP6K1RouBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnpBKiRAPA9nc/evGOhS9YGWGm2ztdu/VR9aJu/bliU=;
 b=akyX9htiYCJCVIMeZnehDh9+AqMLNh0HtOpL4QWG5ovOD4hXQspbpbASB9UW0lBB21LSh5C2HKW4TnXCS9SkYhCduLdy8jwY2ygshU/6Mun0U+xzJ5svTuJ5HOk2lcn8JqYq/CMpzxaL7m/JtjCRwOHsJKUk0oHvn0kmQWb0XFT0GBJ32LOCwkTdeWwJdPwmR+QAbTTcvZe4Z/1Z/YeGEjZZuXuZhTACoOmsQYlYSEyNh0XYrwQ07OEDzYHJ0dHpVu3P0uvpZMDoiqtYuPt38acY8nEyrj4/uol/OjFMSHEnjdoMngKgFEuLdPS2X/jlmW/3fqyJMfI7UVPR66A+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnpBKiRAPA9nc/evGOhS9YGWGm2ztdu/VR9aJu/bliU=;
 b=VHLdW65c0kdN2YdW8JpiNtsf2j6Je/c5ryQ7+OAtBy2lvDaxo3Tn3rtlPCJN9IqfsZD7jja6tTTwYwIqZgxePSoW+3XBhB7vo9mJw+pnaesN1J8rMjkVxPporbUHhn6xz0S6lyD/GclxTQAWsJVF78FAdBD12Bziz73GVlr4nbA=
Received: from CH2PR17CA0022.namprd17.prod.outlook.com (2603:10b6:610:53::32)
 by DSAPR10MB857696.namprd10.prod.outlook.com (2603:10b6:8:51f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 08:29:18 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::ab) by CH2PR17CA0022.outlook.office365.com
 (2603:10b6:610:53::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 08:29:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 08:29:17 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 03:29:04 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 14 Oct
 2026 03:29:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 14 Oct 2026 03:29:04 -0500
Received: from [172.24.22.240] (lt5cg60819vj.dhcp.ti.com [172.24.22.240])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69E8T1dm1944246;
	Wed, 14 Oct 2026 03:29:02 -0500
Message-ID: <a24d4dba-e363-45d2-be76-fd3b10532c90@ti.com>
Date: Wed, 14 Oct 2026 13:59:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] firmware: ti: ti_sci_clock: Add ABI5.0 compliant
 Clock APIs
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <afd@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-6-b-padhi@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260930194131.117129-6-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DSAPR10MB857696:EE_
X-MS-Office365-Filtering-Correlation-Id: 36be77d8-b007-4cc3-8d5d-08df29cd3d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|5023799004|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	CUGNGFcNgJcKneTDKPixhvF8h77BD86zSsu9wYP4jaIZeb6SjKOR8ySinJDEK9fINsouBAnlEaopgfZkZsvR2g4WcjgJDJVAoHfbd/r1xrYj2tn6g0rr+jIpxKdWbVrjUxaQsiNJTO4ZrsNVRx8W//RVTINsyj1IkJkPaHYb/slDfPYkAF/c4eCqQRnQXUrDkWcxhDCC4zalp4dVhK4irpNZycn0Rdl48J7QteW97vBvNdo+tIIS6dINEknBohwAV6dWh6ky0KcuEHrph1Qcw0R+QZCBw0t8ffCRzz5YDc8i4V0+KmSG8IE5xQRJ75UndXQJ4tsN7zCigw9Rude3D0V6Ow1eZ45+rER9n1GqyaM/y7iOs6xmW5zLhZTZ1oBu2kvMBli74c5mG8zFdjI1Y9HcVkdWbuyXuNjlyO9LYAx1amUv0SH9cyNHfOQLIgCd2EuOhuqwgdf8pZhPcmA/Le3ISgJG1e6Jf6Ejw3f1Djczm6zBQqsMmdybwg6euKpkcKdUZRbPwhKnVeLxXNH8sDQ0hG6ddDIlkHPl12kaRb0CLETQpwaWupcuJRKh5IsX0uKEiIrs5RinOTUtp2/B6AHoxKnVZM2XNjjvvQFVkr++4VYb9xrL8236gBt0mvQYVdpE3OTQRv9fkbOGw2TC5w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(5023799004)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JarIa6B7Eq/lwYlNKfFJv7cIgDD/kQi6D/y7pVKo+UtmsWb66vxGIBaBaYl/0VABMJxsq+lxc4wFXKvXFMAGDeNj6Dl0Bk7i4iXXu2bhD7ean4MZhWl92saOCLQSR721ScCBmDVBa7z3Q0Qfs6h21Xf0S39e/M/st5MAiJSau7GHpolMFkDceD23+HjmG1c/ihLSTLI4mpWIqih1TqNosLdR7yiMfjb+73qmNYZhfaP1HcdM9z+yuF4QcHqRDsTqRtHUj9UI2HPF8tTNviF80Yp40CA8Lvqk62llIVAuGg0yZn0HX5KqqIXymZiR/Ud15Cv1dLY85DOajmFDCdCpZHGnf6CiQktyaEuqtyEV38Qoh0hW80stmEwgHWrggDlpS4OUmxS6ChOv73bPrYLBS5/7jwXIDzksjxZaUqEIIjcMtIi/+/RsHbJTX2pCaAoZ
X-Exchange-RoutingPolicyChecked:
	DXz8eeGiS+3dn+SacxMcJ2Lhb6jfVDMXI6WcNHGQZ9YBFUw2JuMyV8pqpPxxbSMHJ7Ff7PigpUHrxI7b7ey6oPla1qb6gNWP4l0CXLUHFVuoZZ0WcnaHF/7pnFD9aYCkbDFvWd4/WZJ810qcpzWlaLYc+6bGjv82sL3a7vFc5nOAz7iSFiLGojkYsHNvBDEBLSS2NUUmZe9hD8zuKtbcs61jFJc9qQaTzNgWKr8rznYWrCYkH926WcQyHjvqIUjhN7fTNHRQsWEGL+bZy6hIRoPSUvEYvS/e2Ic+Mjj4MYOZj2tHQTr+WRIfCnlPA+HOLfOZknPMti9q7wW028+rMQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:29:17.9151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36be77d8-b007-4cc3-8d5d-08df29cd3d1b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSAPR10MB857696
X-Proofpoint-GUID: Tm2Kd_eAPxORFHDzXneASCVADeK5GIt5
X-Proofpoint-ORIG-GUID: Tm2Kd_eAPxORFHDzXneASCVADeK5GIt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX1V52AApvJuba
 4R3oyKzIizqX4KWyyEhVd+VSPwCe/fIQmnt+bGUlt5NYjmIgWghDxBrj8/oK7XIncsSQdZNCatH
 FpV4le+xMEEw3OOc8TSY06rauA+LexvziVlXIuZYKQES0rhRnU3Y4TKzjl8h1fuJxynhOfhTqV2
 E0UJD+FxjEruEy4jLH2Acx+hGPHtSGazToNhwILbWwd3mjCxXQ3iRjbQj1iyxB61wthrbsOHWJj
 zNMBKIbXQdHhixUEEeXb+RVOIuFODJx8hztW81XJjN6y+k5dR1ZzjjKq4DusWCjaR0qbUY9dXyl
 kf9rd8SJkx7UaHsWcjCfxdQEKXprdRVYii2zXUb85Osrw15WgVSdUD8FRCxh0wSXRzyZqj4WTTH
 gwBNrfIJPp7wBorfyM98tzMD5g36MvcNWGwIVmXXLkwcF3CByYoDsInTlqABlA1Zn5t7cQ1Rvft
 4OG4RNOje2P1fin2GYw==
X-Authority-Analysis: v=2.4 cv=Vcxir1p9 c=1 sm=1 tr=0 ts=6acf3d63 cx=c_pps
 a=Ho/Krdd5x/ljPkV1+9yTnA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=5P_LVEWm-8OdGHI6_y0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX1ZlW36e1sDR4
 rK4JETsaRRWHawrIKGOHypohUA/KIowFxnL3oXbhGkWglIvXCG3fiNIaiGMNl9fvDvnZ09BFxIJ
 m4kRWprr8SnFaN86EkH2+VsUL0ks9pM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140033



On 10/1/2026 1:11 AM, Beleswar Padhi wrote:
> The previous TI K2G and K3 architectures were tightly coupled systems in
> terms of Safety and Security. All the TI-SCI messages from HLOS (Linux)
> were sent to a single sec proxy thread terminating at the core running
> Safety service (DM). In K2G systems, DM handled both Safety & Security
> requests by itself. Whereas in K3 systems, DM serviced the Safety
> requests itself, and forwarded the Security requests to core running
> Security service (TIFS) on the HLOS's behalf. This posed various
> limitations:
>    a. Increased latency: An extra forwarding hop through DM adds latency
>       in requests and responses.
>    b. Freedom From Interference (FFI) concerns: Having Safety service
>       proxy Security's requests (& vice versa) undermines the isolation
>       and FFI of the system.
>    c. Potential Deadlock Scenario: Forwarding messages between Safety
>       and Security cores can result in a deadlock if there are circular
>       dependencies.
> 
> To eliminate all the above limitations, the TI TDA54 class of SoCs
> introduce an architectural change: Isolation of Security and Safety
> services. To realize this enhanced isolation in hardware, two
> independent sec proxy threads are now provided for HLOS to communicate
> separately with the Security and Safety cores respectively. And the
> TI-SCI message forwarding has been eliminated in Software. The System
> Firmware ABI5.0 version necessitates this improved isolation and FFI
> change.
> 

Till this point, all patches has repeated commit msg, I don't think you
need this repeat in all patches

> In ABI5.0, the message structures for set_clock_state, get_clock_state,
> query_clock_freq, set_clock_freq, and get_clock_freq APIs have been
> updated to combine the existing u8 clk_id and u32 clk_id_32 into a
> single u32 clk_id. This is a good cleanup that came as a by-product of
> the major ABI update. So, add new ABI5.0 compliant APIs to account for
> this change.
> 

Good clean up to get rid from two entries for clock id.

> Note: The following TI-SCI messages are not supported with ABI5.0, since
> parent clock configuration is done internally by PDM firmware:
> TI_SCI_MSG_SET_CLOCK_PARENT, TI_SCI_MSG_GET_CLOCK_PARENT, and
> TI_SCI_MSG_GET_NUM_CLOCK_PARENTS. Hence, the corresponding clock parent
> ops are left unset. Also, SSC support is not enabled in hardware on the
> TDA54 SoC, so the needs_ssc argument of get_clock is ignored.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Note:
> This patch is dependent on the following 2 series
> 1. https://lore.kernel.org/all/20260930172948.2901336-1-b-padhi@ti.com/
> 2. https://lore.kernel.org/all/20260930160607.2674980-1-b-padhi@ti.com/
> 
>  drivers/firmware/ti/ti_sci.h       | 138 +++++++++++
>  drivers/firmware/ti/ti_sci_clock.c | 380 +++++++++++++++++++++++++++++
>  drivers/firmware/ti/ti_sci_core.c  |   2 +
>  3 files changed, 520 insertions(+)
> 
> diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
> index 2f633aeab70b1..5e0a35b394d19 100644
> --- a/drivers/firmware/ti/ti_sci.h
> +++ b/drivers/firmware/ti/ti_sci.h
> @@ -483,6 +483,34 @@ struct ti_sci_msg_req_set_clock_state {
>  	u32 clk_id_32;
>  } __packed;
>  
> +/**
> + * struct ti_sci_msg_req_set_clock_state_abi5_pdm - Request to setup a Clock state
> + * @hdr:	Generic Header, Certain flags can be set specific to the clocks.
> + *		Uses the MSG_FLAG_CLOCK_* flags defined for
> + *		&struct ti_sci_msg_req_set_clock_state.
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *		Each device has it's own set of clock inputs. This indexes
> + *		which clock input to modify.
> + * @request_state: Request the state for the clock to be set to.
> + *		Uses the MSG_CLOCK_SW_STATE_* values defined for
> + *		&struct ti_sci_msg_req_set_clock_state.
> + *
> + * Normally, all required clocks are managed by TISCI entity, this is used
> + * only for specific control *IF* required. Auto managed state is
> + * MSG_CLOCK_SW_STATE_AUTO, in other states, TISCI entity assume remote
> + * will explicitly control.
> + *
> + * Request type is TI_SCI_MSG_SET_CLOCK_STATE, response is a generic
> + * ACK or NACK message.
> + */
> +struct ti_sci_msg_req_set_clock_state_abi5_pdm {
> +	struct ti_sci_msg_hdr hdr;
> +	u32 dev_id;
> +	u32 clk_id;
> +	u8 request_state;
> +} __packed;
> +

while you are at this, can you think of getting rid of state and
encapsulate state with set-freq ie set-freq 0 means disabled and any
positive number is enable

>  /**
>   * struct ti_sci_msg_req_get_clock_state - Request for clock state
>   * @hdr:	Generic Header
> @@ -505,6 +533,23 @@ struct ti_sci_msg_req_get_clock_state {
>  	u32 clk_id_32;
>  } __packed;
>  
> +/**
> + * struct ti_sci_msg_req_get_clock_state_abi5_pdm - Request for clock state
> + * @hdr:	Generic Header
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *		Each device has it's own set of clock inputs. This indexes
> + *		which clock input to get state of.
> + *
> + * Request type is TI_SCI_MSG_GET_CLOCK_STATE, response is state
> + * of the clock
> + */
> +struct ti_sci_msg_req_get_clock_state_abi5_pdm {
> +	struct ti_sci_msg_hdr hdr;
> +	u32 dev_id;
> +	u32 clk_id;
> +} __packed;
> +
>  /**
>   * struct ti_sci_msg_resp_get_clock_state - Response to get clock state
>   * @hdr:	Generic Header
> @@ -659,6 +704,37 @@ struct ti_sci_msg_req_query_clock_freq {
>  	u32 clk_id_32;
>  } __packed;
>  
> +/**
> + * struct ti_sci_msg_req_query_clock_freq_abi5_pdm - Request to query a frequency
> + * @hdr:	Generic Header
> + * @dev_id:	Device identifier this request is for
> + * @min_freq_hz: The minimum allowable frequency in Hz. This is the minimum
> + *		allowable programmed frequency and does not account for clock
> + *		tolerances and jitter.
> + * @target_freq_hz: The target clock frequency. A frequency will be found
> + *		as close to this target frequency as possible.
> + * @max_freq_hz: The maximum allowable frequency in Hz. This is the maximum
> + *		allowable programmed frequency and does not account for clock
> + *		tolerances and jitter.
> + * @clk_id:	Clock identifier for the device for this request.
> + *
> + * NOTE: Normally clock frequency management is automatically done by TISCI
> + * entity. In case of specific requests, TISCI evaluates capability to achieve
> + * requested frequency within provided range and responds with
> + * result message.
> + *
> + * Request type is TI_SCI_MSG_QUERY_CLOCK_FREQ, response is appropriate message,
> + * or NACK in case of inability to satisfy request.
> + */
> +struct ti_sci_msg_req_query_clock_freq_abi5_pdm {
> +	struct ti_sci_msg_hdr hdr;
> +	u32 dev_id;
> +	u64 min_freq_hz;
> +	u64 target_freq_hz;
> +	u64 max_freq_hz;
> +	u32 clk_id;
> +} __packed;
> +
>  /**
>   * struct ti_sci_msg_resp_query_clock_freq - Response to a clock frequency query
>   * @hdr:	Generic Header
> @@ -718,6 +794,49 @@ struct ti_sci_msg_req_set_clock_freq {
>  	u32 clk_id_32;
>  } __packed;
>  
> +/**
> + * struct ti_sci_msg_req_set_clock_freq_abi5_pdm - Request to setup a clock frequency
> + * @hdr:	Generic Header
> + * @dev_id:	Device identifier this request is for
> + * @min_freq_hz: The minimum allowable frequency in Hz. This is the minimum
> + *		allowable programmed frequency and does not account for clock
> + *		tolerances and jitter.
> + * @target_freq_hz: The target clock frequency. The clock will be programmed
> + *		at a rate as close to this target frequency as possible.
> + * @max_freq_hz: The maximum allowable frequency in Hz. This is the maximum
> + *		allowable programmed frequency and does not account for clock
> + *		tolerances and jitter.
> + * @clk_id:	Clock identifier for the device for this request.
> + *
> + * NOTE: Normally clock frequency management is automatically done by TISCI
> + * entity. In case of specific requests, TISCI evaluates capability to achieve
> + * requested range and responds with success/failure message.
> + *
> + * This sets the desired frequency for a clock within an allowable
> + * range. This message will fail on an enabled clock unless
> + * MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE is set for the clock. Additionally,
> + * if other clocks have their frequency modified due to this message,
> + * they also must have the MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE or be disabled.
> + *
> + * Calling set frequency on a clock input to the SoC pseudo-device will
> + * inform the PMMC of that clock's frequency. Setting a frequency of
> + * zero will indicate the clock is disabled.
> + *
> + * Calling set frequency on clock outputs from the SoC pseudo-device will
> + * function similarly to setting the clock frequency on a device.
> + *
> + * Request type is TI_SCI_MSG_SET_CLOCK_FREQ, response is a generic ACK/NACK
> + * message.
> + */
> +struct ti_sci_msg_req_set_clock_freq_abi5_pdm {
> +	struct ti_sci_msg_hdr hdr;
> +	u32 dev_id;
> +	u64 min_freq_hz;
> +	u64 target_freq_hz;
> +	u64 max_freq_hz;
> +	u32 clk_id;
> +} __packed;

ti_sci_msg_req_query_clock_freq_abi5_pdm  is same as of above
could you combine these two ?

> +
>  /**
>   * struct ti_sci_msg_req_get_clock_freq - Request to get the clock frequency
>   * @hdr:	Generic Header
> @@ -739,6 +858,24 @@ struct ti_sci_msg_req_get_clock_freq {
>  	u32 clk_id_32;
>  } __packed;
>  
> +/**
> + * struct ti_sci_msg_req_get_clock_freq_abi5_pdm - Request to get the clock frequency
> + * @hdr:	Generic Header
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *
> + * NOTE: Normally clock frequency management is automatically done by TISCI
> + * entity. In some cases, clock frequencies are configured by host.
> + *
> + * Request type is TI_SCI_MSG_GET_CLOCK_FREQ, responded with clock frequency
> + * that the clock is currently at.
> + */
> +struct ti_sci_msg_req_get_clock_freq_abi5_pdm {
> +	struct ti_sci_msg_hdr hdr;
> +	u32 dev_id;
> +	u32 clk_id;
> +} __packed;
> +
>  /**
>   * struct ti_sci_msg_resp_get_clock_freq - Response of clock frequency request
>   * @hdr:	Generic Header
> @@ -1738,6 +1875,7 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
>  void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
>  void ti_sci_setup_device_ops_abi5(struct ti_sci_dev_ops *dops);
>  void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
> +void ti_sci_setup_clock_ops_abi5(struct ti_sci_clk_ops *cops);
>  void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
>  void ti_sci_setup_rm_core_ops(struct ti_sci_rm_core_ops *rm_core_ops);
>  void ti_sci_setup_rm_irq_ops(struct ti_sci_rm_irq_ops *iops);
> diff --git a/drivers/firmware/ti/ti_sci_clock.c b/drivers/firmware/ti/ti_sci_clock.c
> index f266522fb7d08..faf37cc6df8d2 100644
> --- a/drivers/firmware/ti/ti_sci_clock.c
> +++ b/drivers/firmware/ti/ti_sci_clock.c
> @@ -50,6 +50,40 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
>  	return 0;
>  }
>  
> +/**
> + * ti_sci_set_clock_state_abi5_pdm() - Set clock state helper
> + * @handle:	pointer to TI SCI handle
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *		Each device has it's own set of clock inputs. This indexes
> + *		which clock input to modify.
> + * @flags:	Header flags as needed
> + * @state:	State to request for the clock.
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_set_clock_state_abi5_pdm(const struct ti_sci_handle *handle,
> +					   u32 dev_id, u32 clk_id,
> +					   u32 flags, u8 state)
> +{
> +	struct ti_sci_msg_req_set_clock_state_abi5_pdm req;
> +	struct ti_sci_msg_hdr resp;
> +	int ret = 0;
> +
> +	req.dev_id = dev_id;
> +	req.clk_id = clk_id;
> +	req.request_state = state;
> +
> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
> +			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> +			     &req, sizeof(req),
> +			     &resp, sizeof(resp));
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /**
>   * ti_sci_cmd_get_clock_state() - Get clock state helper
>   * @handle:	pointer to TI SCI handle
> @@ -96,6 +130,47 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
>  	return 0;
>  }
>  
> +/**
> + * ti_sci_cmd_get_clock_state_abi5_pdm() - Get clock state helper
> + * @handle:	pointer to TI SCI handle
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *		Each device has it's own set of clock inputs. This indexes
> + *		which clock input to modify.
> + * @programmed_state:	State requested for clock to move to
> + * @current_state:	State that the clock is currently in
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_get_clock_state_abi5_pdm(const struct ti_sci_handle *handle,
> +					       u32 dev_id, u32 clk_id,
> +					       u8 *programmed_state, u8 *current_state)
> +{
> +	struct ti_sci_msg_req_get_clock_state_abi5_pdm req;
> +	struct ti_sci_msg_resp_get_clock_state resp;
> +	int ret = 0;
> +
> +	if (!programmed_state && !current_state)
> +		return -EINVAL;
> +
> +	req.dev_id = dev_id;
> +	req.clk_id = clk_id;
> +
> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
> +			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> +			     &req, sizeof(req),
> +			     &resp, sizeof(resp));
> +	if (ret)
> +		return ret;
> +
> +	if (programmed_state)
> +		*programmed_state = resp.programmed_state;
> +	if (current_state)
> +		*current_state = resp.current_state;

Isn't this a bug, if programed state is not equal to current_state for
clock ?

> +
> +	return 0;
> +}
> +
>  /**
>   * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
>   * @handle:	pointer to TI SCI handle
> @@ -123,6 +198,32 @@ static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
>  				      MSG_CLOCK_SW_STATE_REQ);
>  }
>  
> +/**
> + * ti_sci_cmd_get_clock_abi5_pdm() - Get control of a clock from TI SCI
> + * @handle:	pointer to TI SCI handle
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *		Each device has it's own set of clock inputs. This indexes
> + *		which clock input to modify.
> + * @needs_ssc:	unused, SSC is not supported with ABI5
> + * @can_change_freq: 'true' if frequency change is desired, else 'false'
> + * @enable_input_term: 'true' if input termination is desired, else 'false'
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_get_clock_abi5_pdm(const struct ti_sci_handle *handle, u32 dev_id,
> +					 u32 clk_id, bool needs_ssc,
> +					 bool can_change_freq, bool enable_input_term)
> +{
> +	u32 flags = 0;
> +
> +	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;

get is changing freq, why ?

> +	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
> +
> +	return ti_sci_set_clock_state_abi5_pdm(handle, dev_id, clk_id, flags,
> +					       MSG_CLOCK_SW_STATE_REQ);
> +}
> +
>  /**
>   * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
>   * @handle:	pointer to TI SCI handle
> @@ -143,6 +244,26 @@ static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
>  				      MSG_CLOCK_SW_STATE_UNREQ);
>  }
>  
> +/**
> + * ti_sci_cmd_idle_clock_abi5_pdm() - Idle a clock which is in our control

Idle means what, you are leaving owner ship and keeping state as is ?
or something else, not clear from above comments

> + * @handle:	pointer to TI SCI handle
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *		Each device has it's own set of clock inputs. This indexes
> + *		which clock input to modify.
> + *
> + * NOTE: This clock must have been requested by get_clock previously.
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_idle_clock_abi5_pdm(const struct ti_sci_handle *handle,
> +					  u32 dev_id, u32 clk_id)
> +{
> +	return ti_sci_set_clock_state_abi5_pdm(handle, dev_id, clk_id,
> +					       MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
> +					       MSG_CLOCK_SW_STATE_UNREQ);
> +}
> +
>  /**
>   * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
>   * @handle:	pointer to TI SCI handle
> @@ -163,6 +284,26 @@ static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
>  				      MSG_CLOCK_SW_STATE_AUTO);
>  }
>  
> +/**
> + * ti_sci_cmd_put_clock_abi5_pdm() - Release a clock from our control back to TISCI
> + * @handle:	pointer to TI SCI handle
> + * @dev_id:	Device identifier this request is for
> + * @clk_id:	Clock identifier for the device for this request.
> + *		Each device has it's own set of clock inputs. This indexes
> + *		which clock input to modify.
> + *
> + * NOTE: This clock must have been requested by get_clock previously.
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_put_clock_abi5_pdm(const struct ti_sci_handle *handle,
> +					 u32 dev_id, u32 clk_id)
> +{
> +	return ti_sci_set_clock_state_abi5_pdm(handle, dev_id, clk_id,
> +					       MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
> +					       MSG_CLOCK_SW_STATE_AUTO);

put clock is , making state is disable , any reason AUTO is selected here

> +}
> +
>  /**
>   * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
>   * @handle:	pointer to TI SCI handle
> @@ -191,6 +332,34 @@ static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
>  	return 0;
>  }
>  
> [..]
