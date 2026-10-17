Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8D34B437
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792243846; cv=fail; b=LrEi7E8P0t4rZap3f7GKRv0HLwCBLT14YZk34r7QtWA1R+csNzV+Iguiz1ACUnTLVOD6Sev5pR6/EAqT4eAP6YrUvOQnF54JHFK8b+65pnaOP55gd9uDSVBaX3um0DP5dl+iMlcNt+wJbNHRGb4Nto6zVAjdp0lS/zKry0cVUhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792243846; c=relaxed/simple;
	bh=KxZOmyOCdluDixGrYcHBKzmD3E7bEmaUrc2KvvkTpBc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtFiGTJLQO0eBEwiUqMpgFfcG3gscm7qam88HHUZvY6F0bg+0EjZcrqcJoV0F/HegH2BSBt+gbIM1EhJQa6AXeBqUVCGVIHg9jhMLpcMAVhaF6s1X8Ejdq70M2h1cs8TKe+I+oMYRzkqlGGxJjaXBzVkIRcd/T1pF14tnQKaT4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EhwCDKZ4; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=QrmWUrEC; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EhwCDKZ4";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="QrmWUrEC"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69HDCrTA2392863;
	Sat, 17 Oct 2026 08:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=wsMoKqmG2BzI4Jc
	WJje8mTAVUbMRsjwix993fHxeyK4=; b=EhwCDKZ4m175I2jZkqhQT108C9pbEqa
	3JoLsJtkmlz9z4JIJaacwC9NA/gn4qtFNPZT9oA4Z2I7/tHumGHNkeU1wklWHkSv
	AcF+vDKi9AecyBKnN9P+1r0bubDDkcpmTp1FYSi4drXelBz4gNkXyDvs7In8PZwn
	c6oWSUun0rvT8zRJ7Q5Pp1h+SAltCa7E/2HLuj+f6Yy0j93RCUVa0fkSRKuqP7yM
	r02xdL1k6NRneE84T2UFTDjSF11CYs3zyMLOy2YoQdZ/Rq3iQWjQkmQIESqTVm4o
	EbTfkDCkoLiSNI98u2nW5MI38gxlZg8AYEVlIsaxPNim854vzZEq1IA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hbn504ub8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 17 Oct 2026 08:30:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfD5d4LmiQvfgghaNlpDPNZ6yH/k6tAWlzlrE6k0Vq63Yftc1PfwbBmYhbh1Myogjc0x5ks4nQniSt90GxK9UXAEA5mANjKM91esFXKix332CfTrCzZclApfxD+X2awu2vACfTB5EGD6IhLoCgw2++ki/2RPmKPZcDtf2FVA/NHRgrxgq0XxMpJea5MoFK3rmoyjQ6x/0ylW6ei9OPu+QJ+KX9GNDSAWdozJNANpHGPbi4zbcysUeN89qNS9BXD2UUKDrvxJlNeXXxcsU/AJoxS71JduB3KZrpawJeBldBfNFiWahpUIkDXI3yO8NI3fF4ir0XwVqFd+qpS0eu56Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsMoKqmG2BzI4JcWJje8mTAVUbMRsjwix993fHxeyK4=;
 b=xhRRuUggzbarhuTdmIWsHHaXcUg5dEBEjDvaQvhA6tjthKwoxw5oWwr64twLK5n9ZNTkFUzMN4XxUuoka0Qsp1o9737TElnkp9TmMz/jig0zETJ+fE9Le03w7Efr22QoYLr+7tKPwNZ5nczkiBH8VrHUXXSL2OJQfKjBSMBw7wFvXOCZCMOFw0NqhkCuuLOvlyZ4Y5Ek2oqUdX7n7yqpUHQI/6ke4PgcZty5GBtvUFljQmBZM0hsJwm1LmHDsXdlpxQzLnq6xVqHQ75Piv6AGf4MVjHYI7H7MR8MOvfVOzda+LfSfbEbIAmUcPBsqYdSSGzTcvWeSKf8htQjIoxeCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsMoKqmG2BzI4JcWJje8mTAVUbMRsjwix993fHxeyK4=;
 b=QrmWUrECbZ3P9zww9TLjgHvjTOLJOiG8/grezzjd+3mI2SyHuxHEdZg5UnCb62ouirYyQIuEfTL15Fvpsq98WcNR5BPEC+Litu6quckqxHYr+zyVg1j5x5WiCD0DHKOLeNLG9cvzIEe2BLnl5dYGV57/ey0Z9QF44vnvu3BqsbU=
Received: from PH5P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::7)
 by CHBPR10MB514554.namprd10.prod.outlook.com (2603:10b6:610:36b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.12; Sat, 17 Oct
 2026 13:30:24 +0000
Received: from CY6PEPF0000004D.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::39) by PH5P222CA0004.outlook.office365.com
 (2603:10b6:510:34b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Sat,
 17 Oct 2026 13:30:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY6PEPF0000004D.mail.protection.outlook.com (10.167.247.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 13:30:23 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 17 Oct
 2026 08:30:07 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 17 Oct
 2026 08:30:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 17 Oct 2026 08:30:07 -0500
Received: from localhost (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69HDU7gc3471224;
	Sat, 17 Oct 2026 08:30:07 -0500
Date: Sat, 17 Oct 2026 08:30:07 -0500
From: Kendall Willis <k-willis@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 20/22] firmware: ti: ti_sci_pm: Move pm ops into its
 own file
Message-ID: <20261017133007.cp265f33t4an77g5@uda0506412>
References: <20260930160607.2674980-1-b-padhi@ti.com>
 <20260930160607.2674980-21-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260930160607.2674980-21-b-padhi@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF0000004D:EE_|CHBPR10MB514554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7d6737-6ffd-4c41-6766-08df2c52cc31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|6133799003|18002099003|22082099003|10067099003|3023799007|4143699003|261009221227099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	T/nAkA1a6lkPlmHvYge0enPIpzL20JD2CL6GNJOUzL7ZzhPoMOO0sy2KKH3313K7qt4MY68pmKXArUcQ4Ss+y2RqteJLgPgpiRSUstHaAl81Pajji2qVNu5c47CFuqxHjCWP5n+foZARGTMuU5W39B66y4GHH7Xb84xorJPuuC9Sbio8ZaAIWgldvcTNQa4yvAf30SJIjjeVAF+etiSgIgs0jECJiIKixJ6v+RWXNuJycNoHyF3tNgLw7816Klds6Pvb881l7G7ChtfsxXnNA12rOdKEkM4usH3urOpaXSNlpyuYSN98H7539GCCawBjmw48tbeQy4qOaBI0dOfq84jJHdc+Xr1ej+TZyic4zimQh6jDQjD5hYZ3IlhtwMsHkFN7YqHyCgELMWjfdmnrk5KS+pj4wgiQD2dy2zBCAfjwnOGEkiRkHGUD33p91tb4nT5/ME6za1lMou54jy/b2UVqOA5qno0dyAaoBBJwjKQ44lpJNXweXFG/PK1lXUudUf+n3cZmytsWUwil4+BrfcemzbVgXdBGN2903Pcf7nX3vL7oWq5SKucy8eGHEhaUj6AIOJqtebdKwwlEWOPvg663s8LXoCIK0tGiq5E9x4M/inx00PDdzMA0AtLe6jQc1dT93i+IEnjluZWWmKCNVQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(4143699003)(261009221227099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6/cExYwLkf92wR9aq1jexhvudphUoEajDeL861h8FW9sLyT7LT7tbvLf6A/Zz7cr9uVlxCRxMhSAihQ5fs5g13f67DaQhuSrClyOrHUUOjw+n41ScSMqQAdzcJilYKHPJv0exV22k5Oy8uZlZ/sqQ48CBBAjVjNA/w5qaRbRLq6mPxPA/A9eabyEUCcjiefrjQifZutjoaSAnpaGYxkC/Ng/i37uboBbHUyfzBlSbuPZc5iMjiqfXqfTeTjbasf/ou2kJWNyk83pQPg9WyiWWzQc0rdKvYXXFdi0+v8u/LriwwnIHAat7Q7MNTnNpjMKnepY6ZMbryYtz4vl2L6/lsr3EOitnMR9pCkgvEZUgdfTBcamCxkwyDvv0kFMDrdSArK/W6TdpoZu3eHS470NdWCncNtqyS0sAX50WXqVdw2PRPEsZBQ7C1b54DMIW1bB
X-Exchange-RoutingPolicyChecked:
	i/YLTb1PEO7pS0plgTXNJEdU1NLjPvbcwOCleKQ1MI6S220COMcwrum1jSK0MgN+oSFL9Sg+4ThpBnrRCp6Vfgvw0hXW4LcD1foDSCfI4XIaDyzTBeGZblVBjUTUsVklDIvNpvqcxt4uu7+/CcUK1waPlU3nTd2GTyQGIG8iILmolPEqG+aY4I8ZXNts8CaN+c8bhBEFcMSc68G1cR1i84snVKW8Wd0ov+drVIMSbVEg5fCeZ9PgR9gBeUnOlQCp1ro0KECXHOaiiHXaOxBC+uy3uV5Hk8s63NzXCvCF/uFoZEf11KCzNiFfropqM7ruIaj4zLA50DhjuDYAd/kKzg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 13:30:23.3769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7d6737-6ffd-4c41-6766-08df2c52cc31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF0000004D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR10MB514554
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA1MyBTYWx0ZWRfXyoc9HyYXNNfN
 49rCyh91hofcuZpkOd0+7340rb3gyk/8tdqqe5DV/C2L8UMNtRizyrBFXgsbTCSEGF0ZEBITjQv
 1/iUz81RHxsYfKG1C1o6IEeoVyDOopE=
X-Proofpoint-ORIG-GUID: UnjncHSrBeD99ctkc44p1hKTOXCc7Sbe
X-Proofpoint-GUID: UnjncHSrBeD99ctkc44p1hKTOXCc7Sbe
X-Authority-Analysis: v=2.4 cv=IuOL47/g c=1 sm=1 tr=0 ts=6ad37877 cx=c_pps
 a=MVrca6uEa0E4C5ICDaep3Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=n4jmMJC5xKspMt2KM7UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA1MyBTYWx0ZWRfXwBhhJd/usKyB
 OJcSVLI1A5YD02fnD2yu0UHwnoGPvaNWgMBH80+TE7jD1QHtTOxzstDRPupUy3E0EIJ5BxExwKH
 CLvjxHhOaYNe+8K9tRMsewFnA0UxYCoHPcsxCTUCWbSlsD8H3TQtyf0Z1zdDOS7gJPj9cf8PszM
 L3iXzCVWFmZ85E6+9aCtVdO8fqs31ujA99qB+FR9SMqqMAxR+Nx1ntS/AbmlXucFhsJFYZjiyGy
 21W9FCmSN7e01ndtsg4x8VQ7kuI9ZjrEKOETZMFNaBcOHjzutxVpxQ42ElpkKnRHKIelCg4PbRC
 EE8avhaCS8g3KTPI5H2dp3z6UkfR+gGjNpolcrmUWuno3MKYemHc6FzsyBAELBjD3L9eCTEAu7U
 Aa0K0Q9VAVf6h5tE0SXaCULFmue0yuTw2RuJs7TIdvvNbTS3g3HJxgXsJhC3suDX4GNW6JJqd80
 fLqOWAPPtiztS8bbPcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170053

Hi Beleswar,
On 21:36-20260930, Beleswar Padhi wrote:
> From: Andrew Davis <afd@ti.com>
> 
> Extract the power management operations related functions and services
> from ti_sci_core.c into its own file. This breaks down the single
> large file into smaller logical files for better readability and
> maintenance.
> 
> The pm ops need access to the TI SCI instance to get the device used for
> error reporting. Move struct ti_sci_xfer, struct ti_sci_xfers_info,
> struct ti_sci_desc, struct ti_sci_info and handle_to_ti_sci_info() from
> ti_sci_core.c into ti_sci.h, along with the includes they need, so that
> they can be shared with the split files. Upcoming splits also need
> access to the instance state, so this is done once here.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Would it be possible to add the following LPM related functions to
ti_sci_pm.c?
  ti_sci_partial_io_wakeup_enabled
  ti_sci_prepare_system_suspend

> ---
> v2: Changelog:
> 1. None to this patch.
> 
> Link to v1:
> https://lore.kernel.org/all/20260929201746.4078803-21-b-padhi@ti.com/
> 
>  drivers/firmware/ti/Makefile      |   1 +
>  drivers/firmware/ti/ti_sci.h      | 100 ++++++++++++++
>  drivers/firmware/ti/ti_sci_core.c | 220 +-----------------------------
>  drivers/firmware/ti/ti_sci_pm.c   | 145 ++++++++++++++++++++
>  4 files changed, 247 insertions(+), 219 deletions(-)
>  create mode 100644 drivers/firmware/ti/ti_sci_pm.c
> 
> diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
> index c4233542ad57d..bbfe73587a3c7 100644
> --- a/drivers/firmware/ti/Makefile
> +++ b/drivers/firmware/ti/Makefile
> @@ -3,4 +3,5 @@
>  ti_sci-y			:= ti_sci_core.o
>  ti_sci-y			+= ti_sci_clock.o
>  ti_sci-y			+= ti_sci_device.o
> +ti_sci-y			+= ti_sci_pm.o
>  obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
> diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
> index cce59cac35ed6..7a707c632276e 100644
> --- a/drivers/firmware/ti/ti_sci.h
> +++ b/drivers/firmware/ti/ti_sci.h
> @@ -13,8 +13,107 @@
>  #define __TI_SCI_H
>  
>  #include <linux/compiler_types.h>
> +#include <linux/completion.h>
> +#include <linux/container_of.h>
> +#include <linux/hashtable.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mutex.h>
> +#include <linux/semaphore.h>
> +#include <linux/soc/ti/ti-msgmgr.h>
> +#include <linux/soc/ti/ti_sci_protocol.h>
> +#include <linux/spinlock.h>
>  #include <linux/types.h>
>  
> +/**
> + * struct ti_sci_xfer - Structure representing a message flow
> + * @tx_message:	Transmit message
> + * @rx_buf:	Pointer to store received message
> + * @rx_len:	Receive message length
> + * @done:	completion event
> + */
> +struct ti_sci_xfer {
> +	struct ti_msgmgr_message tx_message;
> +	void *rx_buf;
> +	u8 rx_len;
> +	struct completion done;
> +};
> +
> +/**
> + * struct ti_sci_xfers_info - Structure to manage transfer information
> + * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
> + *			Messages.
> + * @xfer_block:		Preallocated Message array
> + * @xfer_alloc_table:	Bitmap table for allocated messages.
> + *			Index of this bitmap table is also used for message
> + *			sequence identifier.
> + * @xfer_lock:		Protection for message allocation
> + */
> +struct ti_sci_xfers_info {
> +	struct semaphore sem_xfer_count;
> +	struct ti_sci_xfer *xfer_block;
> +	unsigned long *xfer_alloc_table;
> +	/* protect transfer allocation */
> +	spinlock_t xfer_lock;
> +};
> +
> +/**
> + * struct ti_sci_desc - Description of SoC integration
> + * @default_host_id:	Host identifier representing the compute entity
> + * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
> + * @max_msgs: Maximum number of messages that can be pending
> + *		  simultaneously in the system
> + * @max_msg_size: Maximum size of data per message that can be handled.
> + */
> +struct ti_sci_desc {
> +	u8 default_host_id;
> +	int max_rx_timeout_ms;
> +	int max_msgs;
> +	int max_msg_size;
> +};
> +
> +/**
> + * struct ti_sci_info - Structure representing a TI SCI instance
> + * @dev:	Device pointer
> + * @desc:	SoC description for this instance
> + * @d:		Debugfs file entry
> + * @debug_region: Memory region where the debug message are available
> + * @debug_region_size: Debug region size
> + * @debug_buffer: Buffer allocated to copy debug messages.
> + * @handle:	Instance of TI SCI handle to send to clients.
> + * @cl:		Mailbox Client
> + * @chan_tx:	Transmit mailbox channel
> + * @chan_rx:	Receive mailbox channel
> + * @minfo:	Message info
> + * @node:	list head
> + * @irqs:	List of allocated irqs
> + * @irq_lock:	Protection for irq hash list
> + * @host_id:	Host ID
> + * @fw_caps:	FW/SoC low power capabilities
> + * @users:	Number of users of this instance
> + */
> +struct ti_sci_info {
> +	struct device *dev;
> +	const struct ti_sci_desc *desc;
> +	struct dentry *d;
> +	void __iomem *debug_region;
> +	char *debug_buffer;
> +	size_t debug_region_size;
> +	struct ti_sci_handle handle;
> +	struct mbox_client cl;
> +	struct mbox_chan *chan_tx;
> +	struct mbox_chan *chan_rx;
> +	struct ti_sci_xfers_info minfo;
> +	struct list_head node;
> +	DECLARE_HASHTABLE(irqs, 8);
> +	struct mutex irq_lock;
> +	u8 host_id;
> +	u64 fw_caps;
> +	/* protected by ti_sci_list_mutex */
> +	int users;
> +};
> +
> +#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
> +
>  /* Generic Messages */
>  #define TI_SCI_MSG_ENABLE_WDT	0x0000
>  #define TI_SCI_MSG_WAKE_RESET	0x0001
> @@ -1567,5 +1666,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
>  
>  void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
>  void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
> +void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops);
>  
>  #endif /* __TI_SCI_H */
> diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
> index 848c040f598e0..60d0d64ac4ae8 100644
> --- a/drivers/firmware/ti/ti_sci_core.c
> +++ b/drivers/firmware/ti/ti_sci_core.c
> @@ -13,11 +13,9 @@
>  #include <linux/cpu.h>
>  #include <linux/debugfs.h>
>  #include <linux/export.h>
> -#include <linux/hashtable.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> -#include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> @@ -25,10 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_qos.h>
>  #include <linux/property.h>
> -#include <linux/semaphore.h>
>  #include <linux/slab.h>
> -#include <linux/soc/ti/ti-msgmgr.h>
> -#include <linux/soc/ti/ti_sci_protocol.h>
>  #include <linux/suspend.h>
>  #include <linux/sys_soc.h>
>  #include <linux/reboot.h>
> @@ -40,53 +35,6 @@ static LIST_HEAD(ti_sci_list);
>  /* Protection for the entire list */
>  static DEFINE_MUTEX(ti_sci_list_mutex);
>  
> -/**
> - * struct ti_sci_xfer - Structure representing a message flow
> - * @tx_message:	Transmit message
> - * @rx_buf:	Pointer to store received message
> - * @rx_len:	Receive message length
> - * @done:	completion event
> - */
> -struct ti_sci_xfer {
> -	struct ti_msgmgr_message tx_message;
> -	void *rx_buf;
> -	u8 rx_len;
> -	struct completion done;
> -};
> -
> -/**
> - * struct ti_sci_xfers_info - Structure to manage transfer information
> - * @sem_xfer_count:	Counting Semaphore for managing max simultaneous
> - *			Messages.
> - * @xfer_block:		Preallocated Message array
> - * @xfer_alloc_table:	Bitmap table for allocated messages.
> - *			Index of this bitmap table is also used for message
> - *			sequence identifier.
> - * @xfer_lock:		Protection for message allocation
> - */
> -struct ti_sci_xfers_info {
> -	struct semaphore sem_xfer_count;
> -	struct ti_sci_xfer *xfer_block;
> -	unsigned long *xfer_alloc_table;
> -	/* protect transfer allocation */
> -	spinlock_t xfer_lock;
> -};
> -
> -/**
> - * struct ti_sci_desc - Description of SoC integration
> - * @default_host_id:	Host identifier representing the compute entity
> - * @max_rx_timeout_ms:	Timeout for communication with SoC (in Milliseconds)
> - * @max_msgs: Maximum number of messages that can be pending
> - *		  simultaneously in the system
> - * @max_msg_size: Maximum size of data per message that can be handled.
> - */
> -struct ti_sci_desc {
> -	u8 default_host_id;
> -	int max_rx_timeout_ms;
> -	int max_msgs;
> -	int max_msg_size;
> -};
> -
>  /**
>   * struct ti_sci_irq - Description of allocated irqs
>   * @node: Link to hash table
> @@ -97,49 +45,7 @@ struct ti_sci_irq {
>  	struct ti_sci_msg_req_manage_irq desc;
>  };
>  
> -/**
> - * struct ti_sci_info - Structure representing a TI SCI instance
> - * @dev:	Device pointer
> - * @desc:	SoC description for this instance
> - * @d:		Debugfs file entry
> - * @debug_region: Memory region where the debug message are available
> - * @debug_region_size: Debug region size
> - * @debug_buffer: Buffer allocated to copy debug messages.
> - * @handle:	Instance of TI SCI handle to send to clients.
> - * @cl:		Mailbox Client
> - * @chan_tx:	Transmit mailbox channel
> - * @chan_rx:	Receive mailbox channel
> - * @minfo:	Message info
> - * @node:	list head
> - * @irqs:	List of allocated irqs
> - * @irq_lock:	Protection for irq hash list
> - * @host_id:	Host ID
> - * @fw_caps:	FW/SoC low power capabilities
> - * @users:	Number of users of this instance
> - */
> -struct ti_sci_info {
> -	struct device *dev;
> -	const struct ti_sci_desc *desc;
> -	struct dentry *d;
> -	void __iomem *debug_region;
> -	char *debug_buffer;
> -	size_t debug_region_size;
> -	struct ti_sci_handle handle;
> -	struct mbox_client cl;
> -	struct mbox_chan *chan_tx;
> -	struct mbox_chan *chan_rx;
> -	struct ti_sci_xfers_info minfo;
> -	struct list_head node;
> -	DECLARE_HASHTABLE(irqs, 8);
> -	struct mutex irq_lock;
> -	u8 host_id;
> -	u64 fw_caps;
> -	/* protected by ti_sci_list_mutex */
> -	int users;
> -};
> -
>  #define cl_to_ti_sci_info(c)	container_of(c, struct ti_sci_info, cl)
> -#define handle_to_ti_sci_info(h) container_of(h, struct ti_sci_info, handle)
>  
>  #ifdef CONFIG_DEBUG_FS
>  
> @@ -687,128 +593,6 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
>  	return 0;
>  }
>  
> -/**
> - * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
> - * @handle:		Pointer to TI SCI handle
> - * @source:		The wakeup source that woke the SoC from LPM
> - * @timestamp:		Timestamp of the wakeup event
> - * @pin:		The pin that has triggered wake up
> - * @mode:		The last entered low power mode
> - *
> - * Return: 0 if all went well, else returns appropriate error value.
> - */
> -static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
> -					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
> -{
> -	struct ti_sci_msg_hdr req;
> -	struct ti_sci_msg_resp_lpm_wake_reason resp;
> -	struct device *dev;
> -	int ret = 0;
> -
> -	if (IS_ERR(handle))
> -		return PTR_ERR(handle);
> -	if (!handle)
> -		return -EINVAL;
> -
> -	dev = handle_to_ti_sci_info(handle)->dev;
> -
> -	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
> -			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> -			     &req, sizeof(req),
> -			     &resp, sizeof(resp));
> -	if (ret) {
> -		dev_err(dev, "Failed to get wake reason\n");
> -		return ret;
> -	}
> -
> -	if (source)
> -		*source = resp.wake_source;
> -	if (timestamp)
> -		*timestamp = resp.wake_timestamp;
> -	if (pin)
> -		*pin = resp.wake_pin;
> -	if (mode)
> -		*mode = resp.mode;
> -
> -	return 0;
> -}
> -
> -/**
> - * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
> - * @handle:	pointer to TI SCI handle
> - * @id:	Device identifier
> - * @state:	The desired state of device constraint: set or clear
> - *
> - * Return: 0 if all went well, else returns appropriate error value.
> - */
> -static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
> -					    u32 id, u8 state)
> -{
> -	struct ti_sci_msg_req_lpm_set_device_constraint req;
> -	struct ti_sci_msg_hdr resp;
> -	struct device *dev;
> -	int ret = 0;
> -
> -	if (IS_ERR(handle))
> -		return PTR_ERR(handle);
> -	if (!handle)
> -		return -EINVAL;
> -
> -	dev = handle_to_ti_sci_info(handle)->dev;
> -
> -	req.id = id;
> -	req.state = state;
> -
> -	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
> -			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> -			     &req, sizeof(req),
> -			     &resp, sizeof(resp));
> -	if (ret) {
> -		dev_err(dev, "Failed to set device constraint\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -/**
> - * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
> - * @handle:	pointer to TI SCI handle
> - * @latency:	maximum acceptable latency (in ms) to wake up from LPM
> - * @state:	The desired state of latency constraint: set or clear
> - *
> - * Return: 0 if all went well, else returns appropriate error value.
> - */
> -static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
> -					     u16 latency, u8 state)
> -{
> -	struct ti_sci_msg_req_lpm_set_latency_constraint req;
> -	struct ti_sci_msg_hdr resp;
> -	struct device *dev;
> -	int ret = 0;
> -
> -	if (IS_ERR(handle))
> -		return PTR_ERR(handle);
> -	if (!handle)
> -		return -EINVAL;
> -
> -	dev = handle_to_ti_sci_info(handle)->dev;
> -
> -	req.latency = latency;
> -	req.state = state;
> -
> -	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
> -			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> -			     &req, sizeof(req),
> -			     &resp, sizeof(resp));
> -	if (ret) {
> -		dev_err(dev, "Failed to set device constraint\n");
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * ti_sci_cmd_lpm_abort() - Abort entry to LPM by clearing selection of LPM to enter
>   * @dev:	Device pointer corresponding to the SCI entity
> @@ -1708,9 +1492,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
>  
>  	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
>  		pr_debug("detected DM managed LPM in fw_caps\n");
> -		pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
> -		pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
> -		pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
> +		ti_sci_setup_pm_ops(pmops);
>  	}
>  
>  	rm_core_ops->get_range = ti_sci_cmd_get_resource_range;
> diff --git a/drivers/firmware/ti/ti_sci_pm.c b/drivers/firmware/ti/ti_sci_pm.c
> new file mode 100644
> index 0000000000000..6ea09a7e342e7
> --- /dev/null
> +++ b/drivers/firmware/ti/ti_sci_pm.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Texas Instruments System Control Interface Protocol Driver
> + *
> + * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
> + *	Nishanth Menon
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/soc/ti/ti_sci_protocol.h>
> +
> +#include "ti_sci.h"
> +
> +/**
> + * ti_sci_msg_cmd_lpm_wake_reason() - Get the wakeup source from LPM
> + * @handle:		Pointer to TI SCI handle
> + * @source:		The wakeup source that woke the SoC from LPM
> + * @timestamp:		Timestamp of the wakeup event
> + * @pin:		The pin that has triggered wake up
> + * @mode:		The last entered low power mode
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
> +					  u32 *source, u64 *timestamp, u8 *pin, u8 *mode)
> +{
> +	struct ti_sci_msg_hdr req;
> +	struct ti_sci_msg_resp_lpm_wake_reason resp;
> +	struct device *dev;
> +	int ret = 0;
> +
> +	if (IS_ERR(handle))
> +		return PTR_ERR(handle);
> +	if (!handle)
> +		return -EINVAL;
> +
> +	dev = handle_to_ti_sci_info(handle)->dev;
> +
> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_WAKE_REASON,
> +			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> +			     &req, sizeof(req),
> +			     &resp, sizeof(resp));
> +	if (ret) {
> +		dev_err(dev, "Failed to get wake reason\n");
> +		return ret;
> +	}
> +
> +	if (source)
> +		*source = resp.wake_source;
> +	if (timestamp)
> +		*timestamp = resp.wake_timestamp;
> +	if (pin)
> +		*pin = resp.wake_pin;
> +	if (mode)
> +		*mode = resp.mode;
> +
> +	return 0;
> +}
> +
> +/**
> + * ti_sci_cmd_set_device_constraint() - Set LPM constraint on behalf of a device
> + * @handle:	pointer to TI SCI handle
> + * @id:	Device identifier
> + * @state:	The desired state of device constraint: set or clear
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
> +					    u32 id, u8 state)
> +{
> +	struct ti_sci_msg_req_lpm_set_device_constraint req;
> +	struct ti_sci_msg_hdr resp;
> +	struct device *dev;
> +	int ret = 0;
> +
> +	if (IS_ERR(handle))
> +		return PTR_ERR(handle);
> +	if (!handle)
> +		return -EINVAL;
> +
> +	dev = handle_to_ti_sci_info(handle)->dev;
> +
> +	req.id = id;
> +	req.state = state;
> +
> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
> +			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> +			     &req, sizeof(req),
> +			     &resp, sizeof(resp));
> +	if (ret) {
> +		dev_err(dev, "Failed to set device constraint\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * ti_sci_cmd_set_latency_constraint() - Set LPM resume latency constraint
> + * @handle:	pointer to TI SCI handle
> + * @latency:	maximum acceptable latency (in ms) to wake up from LPM
> + * @state:	The desired state of latency constraint: set or clear
> + *
> + * Return: 0 if all went well, else returns appropriate error value.
> + */
> +static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
> +					     u16 latency, u8 state)
> +{
> +	struct ti_sci_msg_req_lpm_set_latency_constraint req;
> +	struct ti_sci_msg_hdr resp;
> +	struct device *dev;
> +	int ret = 0;
> +
> +	if (IS_ERR(handle))
> +		return PTR_ERR(handle);
> +	if (!handle)
> +		return -EINVAL;
> +
> +	dev = handle_to_ti_sci_info(handle)->dev;
> +
> +	req.latency = latency;
> +	req.state = state;
> +
> +	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
> +			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
> +			     &req, sizeof(req),
> +			     &resp, sizeof(resp));
> +	if (ret) {
> +		dev_err(dev, "Failed to set device constraint\n");

Could you correct this line to:

  if (ret) {
             dev_err(dev, "Failed to set latency constraint\n");

Best,
Kendall

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * ti_sci_setup_pm_ops() - Setup the pm operations structures
> + * @pmops:	pointer to TISCI pm ops structure
> + */
> +void ti_sci_setup_pm_ops(struct ti_sci_pm_ops *pmops)
> +{
> +	pmops->lpm_wake_reason = ti_sci_msg_cmd_lpm_wake_reason;
> +	pmops->set_device_constraint = ti_sci_cmd_set_device_constraint;
> +	pmops->set_latency_constraint = ti_sci_cmd_set_latency_constraint;
> +}
> -- 
> 2.34.1
> 
> 
