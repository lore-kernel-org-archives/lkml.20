Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D5599A5A;
	Tue,  8 Sep 2026 17:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889790; cv=fail; b=P5FxmHd1p1gs0ybiFsbPxFf0Ig4pfaqFgc8MXpKnCk2mugeiYzlpa7d2XWugVMlqtF9zRdVlzVFF35HMihl/zQIFvHT2CbstXpBR2WzDMl34uSHIedDBWHpgDIzUg1FgFkLfV6OZtckATxYd0zZScHE7IY0HyI/H3hk82Wq7YKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889790; c=relaxed/simple;
	bh=qbKgNcwS3dRIMeGrwEzNncwKSjOiZM9W7AzHeFH179U=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ug9nLBO9x9UytQKcpeU+4Np2WQE5YUQv1XRe8f9n9VUcGiTNoqizhmZe8maHhBmk0ATXIL6BeM+asVhgGEXtg5JbD2DwZQFG2PueZ3H4hklEZjiNsxRMtlqnVmZ6BzDdKDPAuf0BJaE/6ea5KDAa7YrGJOjNJJc8GAMy71OiYes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BMtrx2Bk; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SGexz34W; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BMtrx2Bk";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SGexz34W"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688HQX872576574;
	Tue, 8 Sep 2026 12:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=/XQywx9trXFruxi
	8mhD8NUxMixH7Z2pNmPKkQVEnW04=; b=BMtrx2BkG3s9NtgI7bW85X0KsIL1qcy
	+G+IJ6MtxQhigd3WOOWRxvGHqUAdHAjfosuIptMK3uKL/LHNZpoGJXJ9dpe8AE5A
	+ffj83hez53S+nMcVYzQAxtujIIot9C4sexuEE649M0oBXmbFchNpv/TqgpHM2lX
	5ihiAlQxzZejeTSwaG56Nb1v99KGdSDuaobubZYl7MEg+NR2DdpAvlJwOPU3GPPj
	MkUK881k12uroJj2yhbvT/LQTD0T/PeoaQVg9PVrl2ljzB6MsY78T30IGb/mngiQ
	wxAOD8te5wp8gH+/dzdgxqPrjr40q2wai1D25hE6UxcPBtcsQXSkSeA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gjn9v0rv1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 12:49:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUnoTB8TGw971/gu5ZewJPiggOhV9rlWxp3dBsZHlxdurr8sH2i81UMns3TRhTqtCKAmtkG0R2VYG0OfRrfWQBuJgnWK2CgOvxj3L2NcSb5Ok+sJD9UtID7dRmXK5hpBu1zo+llqrZvlCpLPerYdHcJD/kHfO0t1ZlWJFaw57pmkrDPny7UdzUuive2SHwk9O2eOXvf4x9US44tP65TXSLEintbog8630eWZ6rRZwYeqcrotfCE1nTZ7GzObkBsE0gq66lTejZ4bW5U20NHcICdK4BKwVW2FeOwfsikhrEWvTl5OANjoZhPtCHONKb5ywm/zcHeH7sCkuPTbB9nu2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XQywx9trXFruxi8mhD8NUxMixH7Z2pNmPKkQVEnW04=;
 b=yhyAtUKrSA1nYdgAIJAHCnKJmZPjE2bdNUvqTWNKncxmiJIsFw/4ns9ztxRfP8HknI6dhhKiJwBE/hzH302qT/ffy4SpoEpuaC0mYyU7iHS1DX4u/gvh0FzOG8DSCeuB8qvQ53jLAs6wRIU+Vev0WVDG3AuP/18ZCszzgfYNfPo6DHkbUTgLJ/PnJE1um8OJYl37zTfe5y1rjgIhP/02UxzT6rjQZMkZx1DBlDcN6xoU7isMXzXIkWGGW13DpNL7T+ppI3LGncjENP2XxE5u3CFrwYyZ9oyBHlhy/RawGTwCCR2W9nOXkFKAftotNai/p3amP+sf7x0P1kiqJCnrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XQywx9trXFruxi8mhD8NUxMixH7Z2pNmPKkQVEnW04=;
 b=SGexz34WBHueFw+IenMnoaEllUyIEoQxPpJs8P7+IigsgbUwOMMlqNLkLgi1zkykAsBF3VUACmzqGPzai4W6o53p5e+YddSUeb/CTt41etM5q+nwNToSV1HW2/cBDeIlS2B1Hi1b/S6iSI3B+Wr5mRPcdERPlhHFmOg2A7f8zHY=
Received: from MW4PR04CA0140.namprd04.prod.outlook.com (2603:10b6:303:84::25)
 by CH0PR10MB4891.namprd10.prod.outlook.com (2603:10b6:610:c1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 8 Sep
 2026 17:49:39 +0000
Received: from SJ1PEPF000037AC.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::6a) by MW4PR04CA0140.outlook.office365.com
 (2603:10b6:303:84::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 17:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037AC.mail.protection.outlook.com (10.167.244.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 17:49:38 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:49:34 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:49:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 12:49:34 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688HnYQx3907648;
	Tue, 8 Sep 2026 12:49:34 -0500
Date: Tue, 8 Sep 2026 12:49:34 -0500
From: Nishanth Menon <nm@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mmc: dts: am654: Add 650ms power off delay for proper
 MMC power cycle
Message-ID: <20260908174934.pbbvtrfhlnjinipu@constable>
References: <20260908170635.238775-1-jm@ti.com>
 <20260908171613.bpd6eo53cjtlrztr@macaw>
 <e8abc328-578e-48cb-a469-1e3edec6780a@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e8abc328-578e-48cb-a469-1e3edec6780a@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AC:EE_|CH0PR10MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: 63274ce8-f83d-4e1f-3eaf-08df0dd18dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|10067099003|4143699003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	QnBnR9KCQtIIXTIDVpSfpHQeQmH72mWK2nfU4YLb84TIk3SXKz98sCasCCAp/Z9qIpROFpcBLOJLUjARgAAZAfAVuuS9BRVTSmfmoF355gzhIkLvdJuBvMNXhA/4B+7JZWsejjI3DonvKgE/HO/io55C5XprsHBufAGwWUKnzmiJzm17/i2qtXrX7T8SPXt5YmqX4JNBoh1BTrpxFhakH/IdB+ZItNudl/RdWXxCKossCq4uaDMhqVvPDR6sEIXqlLbT/Ilidg77zGNaeLKFGBGINseTTiWsjIF6Fa+hRKVqk573f/OMlI39gok05zUkkzlICz2Ui9OOXYyCJ2Sc266sLIz3zOtkM3YNV5f4djxOO+TNOHNGQWKKz3iGxEBD2kQiFuhQ9MyyoPYtPX0tF3S0LS1SM0M0asRcrXrSWCrpYYKDmIlgt9a2LYjOks2XPbPiUWs/wvz5I8loaNg+nNXEUwd4QSmJ5yj1O7nrVskHlx1BInj6Odohcm0bzkCg1vKUvPU5YMyHcCgCCGXsZrBGwVzZgkedYBsHSLn1vGSJQJTP9zz+un0PC8oqZhYtIf1GrDTKYlh7Jd0car1DWxxqiNNY0af5lcAcU/VMYzIinlkAnf4xJ/Xl8q+VBr3CDe09Kmp1ZtLgtW04/T06fPuvQw8wpYQjxpo1AedxhjXhLbIGI7hSDPPIqcXYoGTnBer8IM/N7MCfjSyZRhLt2A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(10067099003)(4143699003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P2x4RoowB+bAT7rIPlcKFekFiCFeJqKf8Q7DbspTZMxn8y5yCVeMaUimOBZFquKG2wOo9zWmaVQuoeO0HyC/DzWLc3lsQqfZGLEhFdLDHVEK6P40d9kkdoA+NSAl5iKXNH8zl6jv7j0/sl5rzlryn0oJKffchdbhPmY2X8AwWiUTowpy/p0lpZsVwhwXqP5OlXPAB6uIJofc4MP3Qo5QSB3jp9Huzq+5jv2UwkTWA4GslIdq05lmbJd7+6WH6B+Wq+J9YqeMg51/e6nF/1l4ixrB/EMNkAoQGZhGOMJXtI62ZKGM2FpNwCEeT2GvK54M5rb0T6dip0e85ULxIDfvvWnjSUXWXym5UqIJheAxBw5/VzU4dBCKJQFlgmcT9ZeU+qwtyd6+4xpa6rko9nETH7vZazytfK9T+s352+0MZytWEtiEnp6M+fsypHUjbHIF
X-Exchange-RoutingPolicyChecked:
	O6Po+/VsmPMkGYFrktucx/XJXrm0Laod+itTwSeDJlCq8Jw141zr8udjFpAbeEykky3XVFOavR5HZ64MxSEjDkTbCeyi735apP/mURYf6KWrSKlQi/DeZBd5EROFxOFwiG5/kB4vMPKJnnEVe5CmIyoFq42KOraV/IOrTRmINcq1v8dPOXQfN4brHoJ6JX6lrx5JBruEbJ2/KUQmI83L/Rzg4UjB3wcxJ7W8J6tg2E/WCZWLJzKOWf7OPoWJMvYTNBGsxIqWZvZLp6oJaW+secbdGNiXSvTOfhscgHZ4t8cMYZVaIsGFisPklzjcPBKj1yW3GzmV/EVSW6O0BqGMPA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:49:38.4750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63274ce8-f83d-4e1f-3eaf-08df0dd18dab
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4891
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5MyBTYWx0ZWRfX5hQkrZ3akzfE
 FIKKqS26guOzUdR9or1Z96DU2tdekrsn1RM2h+nk9dUqNMyEbV0ETcqjdS2oBu2r/OjxsMzFxug
 4X5dCGjwO57uUD1LRonqIiek2vUoVkw=
X-Proofpoint-ORIG-GUID: m1lT9uWQoxMoUzRl4JqM7g8RuUJC7_hL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5MyBTYWx0ZWRfX9UeoCrtJO0LB
 oCQXrPnTkhbj2xyDUTgpTOhFlA1XW9NUZX45reA3AA/cvX8na4bfa/AU+QP+BOzGfkjhlrGrV74
 LumBzyzg2DiFRC2fmBt8LyUGYqPjvkmKg+FKUaNDLcF6b2ZJXLNW0SzZz4BYygpOUQB4iz4sDHm
 54G2qHMPAaruzByyhYsxcYjH4jI/OIeqB6TLKwKL0vPjkdwIw4byLz2luH2co+jR/V3sQ1Ofvbb
 OkZrNoc+dzHC/FjZqCvxGGwr8nAoZ3PCCYWg1z205KT38eG7H8XDOy9ti8SMebCwwoQe672+yQx
 /IixQHrY2uMKb/UDCNs5f6+0iwwbuTKagEbhDwucVAYtWVx4tJ0CF13BzzbYZizmdQacaw9qIRs
 YIJL9iAWihPgtXkpgECqxaEkRrGaRof/4RVySYSiVkr9gNvRqdQpIVmYSPIiPpyqWehMsjaDHwt
 sWnjL4bGd7jAt18Vt7A==
X-Proofpoint-GUID: m1lT9uWQoxMoUzRl4JqM7g8RuUJC7_hL
X-Authority-Analysis: v=2.4 cv=fvjsol4f c=1 sm=1 tr=0 ts=6aa04ab6 cx=c_pps
 a=vzv6YJZFwQv9rWyERtU3yg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=8jhjWW5gZpHrmKHaHMYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080193

On 12:29-20260908, Judith Mendez wrote:
> Hi Nishanth,
> 
> On 9/8/26 12:16, Nishanth Menon wrote:
> > On 12:06-20260908, Judith Mendez wrote:
> > > The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
> > > SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
> > > power cycle. Measured discharge time on this board is ~632.97ms to
> > > reach < 0.5V threshold.
> > > 
> > > During boot, MMC power cycles between boot stages. Without power off
> > > delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
> > > from previous stages. When U-Boot initializes, card no longer asserts
> > > S18A in ACMD41 response (already switched to 1.8V). Host misinterprets
> > > card state and forces 1.8V anyway, falling into a bad state and causing
> > > a boot failure.
> > > 
> > > Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
> > > during power cycles, allowing card to fully reset state between boot
> > > stages.
> > > 
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> > 
> > Fixes ?
> 
> Fix is really for u-boot, don't think I can point to a u-boot
> commit here can I?

You'd face the same problem if you are starting from a different boot
media and then enable MMC in linux kernel, right? what was described in
the patch sounds like a discharge latency of the evm. This was missed in
the original commit?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
