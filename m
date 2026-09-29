Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF883D0903;
	Tue, 29 Sep 2026 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696355; cv=fail; b=oE9mpFsQn/Hfw+0R7CezBhnNPYU7p8FqyaInEG3bZovkkP376CNcbTsZZYegURGRyFmrPC3ZCMpPmvnjp/JvHAoTxIPz3LKqNaUmAXuulFu3XT0LLJ2BYjglc44JP7hvFfaOK30/KKcn1GHp0GfgFSZAU9u24RMcK2ADQUhvlsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696355; c=relaxed/simple;
	bh=8teatub8gvRDteQZ3PRQqPOoo6jM0n2kGYebGlheVHM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xy6xWuK/mvw6CABbOC0MqkO0x1A+IFGS9C2xl/IjgkhDkOvftwoPNGdDyk08XTmmw6td6mVVdLMiV2DNgKjkSs0yB34KSPqtvHMt12fbaM1mCFeg/TTlY3QIPkUdbR6cbui63CdT8dWLyhq+VzyaPHCZZ7IMeFbN7G1G6QTFcOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=QphwfDkG; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Sb9HCXQN; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="QphwfDkG";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Sb9HCXQN"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68TAjVAv152296;
	Tue, 29 Sep 2026 10:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=yz30mbbA37hVdpU
	3nuYvEDDKT9sf2Jy+RenUY4k9Zi8=; b=QphwfDkGlI++Qad8kS/1G060XvHf8Mf
	qkwmgvYTDfcx12405IX0zhLf8xFuRsqQMPAI32T2+6dp5IEzg2DUSfnX6HfnIk34
	tYjsPw0Qa4MCm+BGvSDBqlkGrxOHGTn8/d2cR4cUGLDu01Icvmd+veYqrccM4Vu3
	YXw2fyioFJn4+IRXJ/pgFAdkp900MpzNkdKdD83/qQVLq/nmcPnX/2wlFX4fuyo4
	oypOQW4OeIpmIXg3ahwjvt4dJPZgXVnwW8t4d47LfddgYIt9+IS3J676GDchcJiU
	eI3zbRnwEln1TPq9oY6PWJxISnuDsBzmpu+XUcN+Y47DNaF2NQjZCXA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h099y2js9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 10:39:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI5417QC8QXI6vGCwXZMGs+XeqZP5e4KN0HEwGHo7A35vvjD9P0OrSb3DWwpjL8x7mL1BzYD2lUubW/51dQiHXGKpbuZeknn0vUS6LI+Hoe8XLN6p219sITBFQSUEVNauqBj98ovvgCAQn1ld7atucUGNSnj7fJft9wdeZVqu35k9+BTDdskcw5GWdTujx9tfdGhLNfAMjIV6m7qT6M6W1yWpbQbdcNp52KQ9NJcEt8bfeIfcMf6PgX5ye5kmrRw8gl9ljW1qDHPUDOx5ch0QLNXaXnBSVX8MarYaAcwpqIbr9kzf9gsQuE4sNT4ioLSttMEiVqUykknLg0phwfzUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz30mbbA37hVdpU3nuYvEDDKT9sf2Jy+RenUY4k9Zi8=;
 b=GG9YlNU1SVWXEbeehTC6DvhYnSisC8QovCdLWXFTvMaLJGaaE9lrQw5n8RaA+YWoTedLczLhDso4mpfRUDgVWNriN3i1+6WklLVVQgoaKv3AmloVU0/CtebreHw3qfdfu6+ffUDwe/l2HphQxE5A4YOjgwgSwfeJQzuw2jkx5fe0ru9kW2PCwUm2CMtBcCnth+vVs0212GjNfaNY+NAkhva2ewLA6b7ytgxMEZMyuk0fFt/TW8Uz3xafyc4l9N/hkEDDNU9h/40JT93ktiHRXaTPRZh0dKIuJVTPraRBURWRBxiJwdHnkutZ13y3HGtAmBKIlvapzWLtAmHhnHQDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yz30mbbA37hVdpU3nuYvEDDKT9sf2Jy+RenUY4k9Zi8=;
 b=Sb9HCXQNFvMDbmy058yAWisC4y1oh17J3Qq9FVyC/camCiJ+LOzXfO6oFX6xPkwJOk8UOLlwdV5RpyaQ1yRHNzSCWgWX6j/SK4/LTnKxxFQFo+hpFGam/KbrK4at7GxwnOr+yIpy1KAIvviLtkDTN2cK5NEKoIP6NyFKctZUkKQ=
Received: from CH2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:610:50::18)
 by PH7PR10MB7036.namprd10.prod.outlook.com (2603:10b6:510:274::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 15:39:01 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::b) by CH2PR16CA0008.outlook.office365.com
 (2603:10b6:610:50::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 15:39:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:39:00 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 10:38:42 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 10:38:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 10:38:42 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TFcgTF1272535;
	Tue, 29 Sep 2026 10:38:42 -0500
Date: Tue, 29 Sep 2026 10:38:42 -0500
From: Nishanth Menon <nm@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: Swamil Jain <s-jain1@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>,
        <sebin.francis@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
Message-ID: <20260929153842.cypdrm6re7zmcgtj@pectin>
References: <20260923192643.1362891-1-s-jain1@ti.com>
 <20260923192643.1362891-3-s-jain1@ti.com>
 <d50d1f8f-29a0-4bd2-8c56-d111eed46c91@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d50d1f8f-29a0-4bd2-8c56-d111eed46c91@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|PH7PR10MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d60e578-28ef-4010-aa72-08df1e3fc8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|13003099007|22082099003|18002099003|3023799007|6133799003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	trqctnsJomK4EzI7Lbsu+u1qXRhU5ChRWYVExs70cRhaA9m363gUJ2lJgwMsRKroF/io+lqSl8R3H1ptOcOt7BWyTgZEmlH0CnYcyHwluXRndz3l1Cn5eKMcjYMDLWo1mGnDbTep/JviLTldNK1h9hA8y6N2UxPs+sIKxljR/wdejhHbMYks93xbjPj8CgMP3WAO13GlcqHVqpQHkIFcJsSK8TgASrzI7W9qxoY3dpkpqsnwsZCd9UdYE2NP6hd8Guk5TAHTWEuRYcDJilZFyLyCSRJQTZxDlazqKObFfy0NKRXwxnCSQS5myOw6u5+kmB6DLndFRX32SLw4OYx5m3jRxvRHh/+ZCpHzqcfDE0Zz7uNgjQqs4ePkAFkBaFxXaIp+vXuDvpc418f+STUCSWxNnqhAzFZqI8by8m255FrEnXTY6g723oQPnkj8VMH8mue6aMKj1wnUL4Ino+tm0HvJJkJEAH5cllbkC2JZmDy68Kfg+4EAw2N4hNunp3ULLX8LcaBTssx1j5F/5Q8UW5DWjCMd06q4EQDzl53zxdGBoKCQaqtFdD9uYNJQnrO9dKye6p5qfcgNk3zJZY2dCbMWV5cbesEUCjdrKucGUwyuS2pOsq3TNATZN2aVRpI/xIQWiu0CEd2PTEl6i33+HA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(22082099003)(18002099003)(3023799007)(6133799003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z6tVDo+74i/E4nnTYCwsznd7HTPgen3U042LIJiFAGm6vt9Ep5U5I4Ka/84aUx/TuzR/tSMcpu5ToR9RZ51Y13zbh/FrCF+Jt72P5nf1YXMdtFx81ih7M4Dd3+dYLJsNiXJ6tClBFp10owTnao6n5XsZKVtNXpsbwaFm7r01V7zV/ikduFj6DFT+xz1KhFrj1zYNVuYWkkVw2pc4chnH+IzujGFyFc0UcXomefnmUsPu3uW5gMF+X/mKnZgOGz2p9iUENuRyQyIBLZAGCSZILDODzPpCNDO+LNFkxBvx8RG7kR7yd11B/6Rb4IjE8yuigq8cJJ2Gyd0QkA7wnL0BF1NZhb9xltoOzMFbb2gbnib+f+o8O4wVHQZzhO2OFWVQofCVjX8dLasVXfLF3WajZMzvGcvaDwqnqRTXEiawIP259yYGai67Lb6Dnn6RajF/
X-Exchange-RoutingPolicyChecked:
	0MlnHtrm2Ja5M/YgBIfthHosrEVw76XRw7NiiFEjN+fVqT6AgUZWY/W3A4t0SpaeOLHUvIx9yuVSO9aovFpNriwZKz7THWbN5B/i8w0T6wSEHoAMgvEJcT1uNO0+6OqqgIPM3mczXGj0ARWYbSL3f9C15OXooIzGj0BPhji4Z15b1rCX0nKKvd1FKKnhV5pmQPn6s1/D9hbfhRK122YVVTdAZe/3OWEI1V5oSKITpaaD4sqpUAw8CMVNmZfYUIH/apAj/cTWSNbfb1DbhprQIxV+q2Em9WDL2E6QHedXDRTWq/Kzf2hPpSridS4BEeHUBEnIQ2Y6VxjfVFnT54wotQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:39:00.8407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d60e578-28ef-4010-aa72-08df1e3fc8bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7036
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfX6a16XjPDlTQe
 jgIu5g66yXfwxVEcAbKIG6WNBCYMF87OiVhnWuSGnb8qHMSAGwMp9zIRmgpFaZocIm91tf/a+GM
 euFKAOHIIxheu4d2top0XDl6Z1zX6dMyWSOIL8Y4XqJPPkm8j0dT3Itbxz4hfLlhX+duNN7nSqP
 oq4m12lLxWDLQOsIonZVcv9kAIpT4TH9yHD+7Rqe5RMVDmDL/bKv4yA6uMOHZ1ki5swTWD0uEvQ
 6RlhQacF8uUkh5w9nnjTb1QqyffjLcQrMdVmbhT/0ACtSE23HGvLQuzyk4qtX2h0MSzMoD1bB4F
 xhWqNT0gFkJjqmpc852GF31MrQVDbsjuqKVORnTFILIe8fQ1hb0XDKI/2ihYBQD5A+4Euyg+H4V
 4AytE6UiOxfhLmuxHuYzVscUVJ0BDIX7cV3tpdoylHuS6FSNyXzILb/AgQnewYqNfpORK7FhGcD
 c/inKA2iWS1m/9vNURA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MiBTYWx0ZWRfXx8t/CsD68TYC
 3n1HjvQqUMVMQOtjGgfvTHeyYjVihiFvBhedBEb5OJKc5Et1pX15FGhgcfeqHZtcIN4SIZYANAm
 7nKSqCzVD/5PtqFBrX/OO1RkQ5i0Hhw=
X-Authority-Analysis: v=2.4 cv=GdGCDgXL c=1 sm=1 tr=0 ts=6abbdb99 cx=c_pps
 a=JgVaYur/QNM9XUS2zzqRTA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=P1BnusSwAAAA:8 a=vblFRDuhxZ3NONKHSBUA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: jnOcLwUXDU51tjB9rMcLWzCmSdNbja0F
X-Proofpoint-ORIG-GUID: jnOcLwUXDU51tjB9rMcLWzCmSdNbja0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290062

On 15:13-20260924, Kumar, Udit wrote:
> 
> 
> On 9/24/2026 12:56 AM, Swamil Jain wrote:
> > From: Devarsh Thakkar <devarsht@ti.com>
> > 
> > Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
> > DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
> > and hook up its DPI output port to the SII9022 bridge input, and the
> > bridge output to the HDMI connector.
> > 
> > Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > Signed-off-by: Swamil Jain <s-jain1@ti.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 106 +++++++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> > 
> > [..]>  
> > +&dss {
> > +	status = "okay";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&dpi_pins_default>;
> > +	bootph-all;
> 
> nit pick : child node's bootph property is carried forward to parent.

drop the property please.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
