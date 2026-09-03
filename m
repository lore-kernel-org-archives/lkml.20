Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013CA4F30FE;
	Thu,  3 Sep 2026 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454497; cv=fail; b=pWaOD8BhyatbESbw2/ifXKn0dJ7xbdDXXCqbRsdH/lSX90PgyNVQusR0oFzgeW4OVtRoNa1mVT82fuEsBWUjVEVKkL7vXLSZTqcK0owcF+fNbHkOb/OYPt4CgKGVRYCo7b5TUsYbf2bIT7Rpov4dbH2kFoEBBSGcqS3jGlTLYbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454497; c=relaxed/simple;
	bh=PkAMYZV5oNzKXD3oAlr0W3C/WVS0eyZ9wQ1CpFiFHus=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPe4GOQOIKiTGsFT57zOglQDILz1Jd6yzWHDoJgH3XyRQHgS6pPWeshi2kYQi8eybVaEYeMd5f0QiwIsW1kJ7We8AXGjQDnvG4VcW46b7uOUv6eSzDWLlz4cQUiAm3VEjjYLxiudJ6OeXa1dkGxsGQ/CxMkpuQg2BHcziUfCShk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=VjIlWR65; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UfRkSAhQ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="VjIlWR65";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UfRkSAhQ"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683G0fJm1342695;
	Thu, 3 Sep 2026 11:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=fozJqIt14dG6yQl
	HEcz5C5OMBh7De5CtRaCnnoCW0qg=; b=VjIlWR65dTTecDvIjzOXiOJ3DN6s/CY
	+GZmuNBGDN3IFJSpOYZPqjef4j/v0OYlWbYUvsqevt/Zsk64++8NRaka3mo63XZX
	GMGexkjqntuxJjbXhY48KwaRB2rDO/aJP+K10OthmV6rfNOZdxuZsi6OX7BhhDoF
	8qOKBBw2hW6ge3UXcpYaSk0CfB+rPjEunrdklwqacl8KImL7brCdEc/rfMAkmk6P
	OYPG36YtwL3oSJE+xx6tFL7zVkvwFSw5mT0iQ5CWIHJoOwRj8sg0AHhNR3HAVX/7
	LDNc2Z7hL6F+jGnZtapzmGRMi4dOa/xQO83uXxEma/gFyq1QmZ6Rv7w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gewt8nm2t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 11:54:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9GfcymPsfBT00akXAbQJReVs9tA09azduHABXNu3ZaAqVD3xLmI9ZM/4Oaobmy7iBjH6TcXgHH5bDejKFWXVTCSTlyLVAFzXjyH9YXtcF4kaIRLBqmaXPYKkvXaxrj2lVrp9zqkAKKrqz2lwjp9sUnN33jBtlUVaXgtuquP1IfUECIsLo2O30Gv4LsMTOA9Dq2FLkXNM+qLUariOFV7jz1BiUUYfg0LhB3sPRd1G+nyuWvE5VEbcUTxIBqsr7KZ8QY4Uq+StQmMK8uldeN9x5hLVevm/L2kNp8ZteUOxrSeas7A+8N+NsuX/ij+danbIOtH99rujpgkkG5cFn3ADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fozJqIt14dG6yQlHEcz5C5OMBh7De5CtRaCnnoCW0qg=;
 b=uAeTe8nqCOym3xgGqAHQpJjdl7iOXVydif2y+BOe5kxU6nVDyh4kK/QST/57n7iZ8GAdbbbe6/9E4eX17LjNXE92nZzs/KDeEkiR704fNvgC4pVu/Too4j8gxxAAcxh39A4T5SLt6ZjicjJkxndgoVzhVOvutma16vT5NEOGovrQqItvNCcOmUahexD0NpOk5wUhlmNowf9a/6kUxsnMBEctvsrOlMfsYZJEc0eXkAc0GIAGmWsUrkRC2MZv8fnK3Zel1yL3GsNIFisW7wVHHqTKBVw5vnjXCMCPYRX/+OGt/aklKcj15wWvK9QWri5S6xOB8a4WQNkoID+WgpEoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fozJqIt14dG6yQlHEcz5C5OMBh7De5CtRaCnnoCW0qg=;
 b=UfRkSAhQ2D6H4amH7NTUIQXkGNoTo+w/J+1Q7Wpdt4WcbRwF3sjtJEcr4e31Rtho9q2rQne9AXmYuJjdsTLEITt29l/aF/tubNrnzTh+JsKt1bkRESKKpfTzF9CYgJCxdxRkFR4NqNRDG3jBAaFrXkiMzHRM31kXLYltOQYFLdY=
Received: from SJ0PR13CA0186.namprd13.prod.outlook.com (2603:10b6:a03:2c3::11)
 by SJ0PR10MB4656.namprd10.prod.outlook.com (2603:10b6:a03:2d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 16:54:46 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::26) by SJ0PR13CA0186.outlook.office365.com
 (2603:10b6:a03:2c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 16:54:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 16:54:45 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 11:54:03 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 11:54:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 11:54:02 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683Gs2gg1898750;
	Thu, 3 Sep 2026 11:54:02 -0500
Date: Thu, 3 Sep 2026 11:54:02 -0500
From: Bryan Brattlof <bb@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk-common: Add non-removable
 flag for eMMC
Message-ID: <20260903165402.4zj3kujypflij5ag@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20260806202106.671328-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260806202106.671328-1-jm@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|SJ0PR10MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: c1cc7595-b9c2-4d65-0e2d-08df09dc0eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	tsGhPpJOp1IPb867i/ruadUDbOGG1b0eiMIpVR89VjD6IvBgIYpXj0QpvnvyJafmo3GwOkFOeh261he/lUAz01RsmisFI2tp6ydbf6vXMl5YGiP+KvG6xjpr9+WWUCanxQtrfXhtM/J+73RVxk6SojPVoh7ViDgU26kbSt7+nNsmIzXrGaJs/U/K1OAK7/UcufQB1KGpCjleia6SsrPxTr065HAmkpVq/lB9QQFk3jHOVFT9m/N9d9KKaTc/dtqANTLNgWEx6eBEImrfPk55gCkVDb4Z0iu051CpAtXmHgkgcCKb431TvXqF0CTJft/L+ovF4o6kFhMFDmasubTaij38SHhH+K4DhiJB6zfPbt4JPiUKxgu26oZKGgExbFgJ86YbA6kcT/4XPicngp+FDBdgllnDUmK+zJ6vW55hdwiZ09Uzx5Uj/WY3mFhkz0KO5XOxXOoDVlUj8WzNXykryYqXkpMHuFBnGIKeWZJoeivg33qP12GB84y7BKpukc/1whc7Sows5pp1C18pfaEVUqcytaSomoxHTyhcSSBs+qLJBqF38uo9rmt+aCvEbIJ0MVfnZvA04HX3X5ip2lNivkiz79DSpizxuH/ZmnvmdkGyX1n71XjoTBEjevwky+RDfxR8cHD5eaClDKG5Cz5dLmbLF6OIn8b6R1RxgHF+bb9WChRXXRMRKJ5WpTYrni3z47W62wI9mrvmbf1WcE1jbA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BwVQeiiO9qd0G2DnZvVEX9u3+evxIQChPB3DhHrpKZUmINHSvYPj+xIVq9JKo4fmpLK4P9bX9Wi/PYOz2t1irI7/gVXR93WMON8mA2pPgfCHYHuglWAqbOZfy9Z9UJvP0rWGnSb+67JWTLX44swiGF8Zse/oPiIlzlH1JQCEy5/XryIbVLM4vr1vfS8KeaFLib+soC/wt6Z9cVE0X52E0EaXwrKdxovXe3z0ypKIxQswSJ2tTgE5KzdtFENcMFDkOxBY2DQGC83ALQqb66/wO72N4qrTvua/cb/iv+fTORaIWTmSMqxcZIy0u32KNmlT4qAnvgQ3b19Oub5skcxCCtvcvj18vCfSVnGfqTcL4OCAA3FN+LATjJud8+ukgRPvBKHLeuzICULTUalAflQXAxf3p6/J2O1UzWaxIFuXO7ax1cWQQbhMvBvK0TT/jdfV
X-Exchange-RoutingPolicyChecked:
	tfD2dx4oBlpPdZHhoMo13O6oJdvk7agFLZTcJLy9q2sdvneS0FsIWEoOkSgNGce6aDSqtSfm+dohVDTaU103WqDnGLx0eNhNPWNpyKxPK6Nl4viL0Y8wm7MIDzJ/ErwGCMEzKNT+zTR3202JXXMOksR7hue8f6WDXsl2b4JV5I20Y+d85tsmZyXcUJDu/RRjFbTSlDwdMw60jkXUx7wkTtICMXDN2HPnITNPNfjDQz3HNx2ungP/svgv/9iZoW4oSnu5scsurtRM5JbeFqaKfshaIHdhqdJRA0QtUU5XjpYgNNLahj2iYkn++HOMaskbtogNLd1x9zSw5eBymv5XDw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 16:54:45.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cc7595-b9c2-4d65-0e2d-08df09dc0eb9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4656
X-Authority-Analysis: v=2.4 cv=de+wG3Xe c=1 sm=1 tr=0 ts=6a99a65a cx=c_pps
 a=VvAZzv+PhNtEUaR8E1V7rA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=83GCK8Fr1NFgPFjxGjUA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: Jc58XpFtax8GZnjxH2fcz8vfhkuKQNgm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE0NyBTYWx0ZWRfXyDAuf8uZbPDm
 GsxbTYo0WpNtTzhFPnT4oGT0C1r3XlX2yMbewB9ISRosre0UHGqC/Z4UgKFmjlMO1NJcOqo615s
 oFWKduUj268VrznJOoa9o8UhApebnmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE0NyBTYWx0ZWRfX/C+qhtkhxc+b
 TEUdXPWtjVwSYohKD3vjqI1x7ySVk+9zurGXS46wx3p+AApBs+oz/hev6PuyrlWj24z3klrBegT
 ajwmR3CS5sNMMJkYHfXfAfM6JhGYrTUNVYUOvRUIogtC4E+mXif8jEiZ1MnDC9SdbWlm0MiL1VF
 cKJcqVhmQ7KpQ0mmaAljGcWLMEjLiJ8sWbUnWgSprrPcCuK/Y9DYF6L4MYmG3uq91CWofBQwMZB
 TusgqINbuoT9OI6Y5UKMuE9hdfYj3WebHn2XOaUp/i29ykvoDwuaxElKoFS6Hr/NAGQ4Zrl8xGD
 WAkUrUyhi32egkqNCY3vmvm3D64KnYhX1qc82wf3q2dz6dFueSlZ8GLN2Vf0FxvrOCCsym+T5X+
 pfOf49MfKqjMfntyAljFmgdiFTOrHi46/VxAjkyTpnzzKfU8anERdoeXAV+RcxQsPzwBRT19Ytl
 V5WKso89DjP3htDkzAQ==
X-Proofpoint-GUID: Jc58XpFtax8GZnjxH2fcz8vfhkuKQNgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030147

On August  6, 2026 thus sayeth Judith Mendez:
> eMMC is soldered on to AM625 SK and AM625 SIP SK boards, add non-removable
> flag to prevent kernel from attempting hot-plug detection.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
> index 9c83626826453..a5922bd746d86 100644
> --- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
> @@ -198,6 +198,7 @@ exp1: gpio@22 {
>  
>  &sdhci0 {
>  	bootph-all;
> +	non-removable;

I can confirm the embedded MMC is indeed embedded ;)

Thanks Judith

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
