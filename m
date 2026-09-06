Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21C83BBFCA;
	Sun,  6 Sep 2026 17:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715115; cv=fail; b=u+/etJAM/IfJmuQvDgvDHDL4zSKbONgJO442DXY0qcIonYHcCE/PVxznGgDGRlFtWz53qxionhALixk5RNyIvH581mQFFJT80bQLYAgBvm9gFTgvR01wqqrBwIdxiGQu1GPzjdzN62UqvRf+Rbtsa1dHuSKaEw9xXze8AoYlCjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715115; c=relaxed/simple;
	bh=5AAoO5vnZ/q7WSzXIR5VoC/jplrhWbgg2UWbq7nogBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pe4KJeLnpcpGD4wOuDkzJRq4IeloEWsig/j5gncMyOQPVSDFk4taHfuJ20RMdNZVY1e4uTjPNKrNBVaNgrPWbD2WGA77dyhe2WXo6VaJNFR6dqFawSY+ZfyJVmvY3Gd9FjV00s3U6bY1lKVrN5QWZOiSlgX4HVQz6SsASjBQphU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=MbYCrd6B; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gqyhvX1k; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="MbYCrd6B";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gqyhvX1k"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EXnYx584907;
	Sun, 6 Sep 2026 12:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Omk3ndBSQNYbjWRxxhlueZigu2eUZEGH+sF3TvXyA
	kw=; b=MbYCrd6BJ4lthQm0tjoMkxH7NyiZgd72VdUQ7V31caPjjD4teZEa1fYZ8
	yf1q+D/gY/F44SoU8nNE5UgJ6dmINLBVT8rRtEwpHuimvpVAvHkUjDKltOngBK4+
	N50gxJQQIwxznsrpR/TmIiFu1BCKYVgNHLs5INA5crGnHrs1xv6xmTKoAPZmb/Pm
	V+/vzh9K2qt93xcw1yMwjfNBNc6jk1eEXP1jQJiZen5iDC+tYqN6otVu3M4bM1dS
	83o6rB5mgywkU2F7NRvvQ+b3+aNnwR9XPUS9ZTKv0wZb56jtC+XCHvatCXaL/3pV
	lsi0gJgRNB8W0tJBSSFzqZmetUjTA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013036.outbound.protection.outlook.com [40.107.201.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh27q1j7h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 12:18:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+b30JVr/Qr+MstZlE9QGFo1Xr6AU7MhNShRIMRnAQaFV/qfqu/QnAOhX4p4WnKY6iUGHn87eu57ZTqif9DDQR1TrOtrPahp1Mc3Tf6KZ7Xxz1SkIQE9BCcSB+vqf1TC2RpJkSqpYJncf8CO6jnrJkWSzdWmCo1qvFuvFA7T1AbIDdB4HcQRxUQEqumHXR7fRDXd0azat4mCJ3pB05QhrncCuxhh4T2oxb9ty6k5cb/1e3CjQQB2dvcgPB49bBaB5Vuu/oD4MwbK50kZyYSp1Y5M7XiYkJDVffv2paYn+AsBkIf/S/YfP5zeS1WYtRqT/UUDT3oIbW+rvWrR4kXCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omk3ndBSQNYbjWRxxhlueZigu2eUZEGH+sF3TvXyAkw=;
 b=cGOhuAR8kFEE7CqWqXJs59iDzijNleqPb1yHzZWtbzbtqqcE3jeRRzveYRKTBOHk4tK1me369UBmZ/e5YJq7hKLwtrgiJwyevA6NEIbe3OPhyg8mxxqTKGG3Gw9hakQFeFmOmJN+SccxSX0yMHfOr5Obk6IttxEyaOMAI8TktC2VTYvudNrrYFg2JlafVgZOWhBhr+9QbPS9rt48CSk9Qrhj8/raS5yn+HAp1FwX2h8L1WxOx4A8l0yIuv9NJ0qLldArE8mjP4CPCA741jrx4zlJck4MrwwWO6IwFmMNsd1m8r1p75WYSIdSQZ5MGvc8h1Nzo2Lgmmt+Q00DVenzeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omk3ndBSQNYbjWRxxhlueZigu2eUZEGH+sF3TvXyAkw=;
 b=gqyhvX1k+pWr34o/8vd4t4in79ghjbBk0p8HcQJ5iwP0teml/5WRMjoXA04JexQwGmfSWK8d6DQD3H0+s3dx/bqdg6OULgg7LyIh2A/h41fT5Sn/qK4uSp8An33kY8o5mIQGgHvqY6Ywka7GmhCBmEws4shZVrmRPBZ+UuECwKw=
Received: from MW4PR04CA0083.namprd04.prod.outlook.com (2603:10b6:303:6b::28)
 by IA1PR10MB6027.namprd10.prod.outlook.com (2603:10b6:208:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Sun, 6 Sep 2026
 17:18:09 +0000
Received: from SJ1PEPF000037B9.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::82) by MW4PR04CA0083.outlook.office365.com
 (2603:10b6:303:6b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Sun, 6
 Sep 2026 17:18:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000037B9.mail.protection.outlook.com (10.167.244.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Sun, 6 Sep 2026 17:18:08 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 12:18:04 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 12:18:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 12:18:04 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 686HHxgl4171789;
	Sun, 6 Sep 2026 12:18:00 -0500
Message-ID: <5db751f9-4bc8-470d-b397-b3c285c5f032@ti.com>
Date: Sun, 6 Sep 2026 22:47:58 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-am62-lp-sk: add out-band-wakeup
 property to m_can devices
To: Kendall Willis <k-willis@ti.com>, Nishanth Menon <nm@ti.com>,
        "Vignesh
 Raghavendra" <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <s-kochidanadu@ti.com>, <a-kaur@ti.com>, <s-tripathi1@ti.com>,
        <vishalm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260820-smth-v1-0-e1738a38d58e@ti.com>
 <20260820-smth-v1-1-e1738a38d58e@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260820-smth-v1-1-e1738a38d58e@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B9:EE_|IA1PR10MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: eda1205f-3c12-439e-eaf1-08df0c3ad25e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|4143699003|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	k949ma2SwzXl7WcNaYipLEMMJLe3g8+er+mi9YrEYf0ojD1QW//7AI5p4n7PNZWm1Mgu7IQjZv7reEiFDRN2Cbpo0im9zMJVFG25UqD6yAuLD+fyhES+T02TFXisi/5yY6CD5wZ+zrHYsl7mcZizVj/mDuCWsyvkcOocO+dKeWVO5IW5UWqV2TQuNOb4kpaVHObQLNSP3gY7dTV6Sf1zOnSp48QMZqlOCfUmTdeH93bi1IsJW17O9HblkiPtRRvQQtVq6qPgKfNhpop+gfkXTKhzrmhWxI3mDPIv8hu38GdSK/bjK9oEpOl9h2CDsYFKdHSSXImorsRI81wyRV0eSIx7iq3Sbr6Hs8OF+VTFL2u6NoxuVd42E7RPti4rRrZVDCeo18bJjjp9G1cq4D1k1ipJ772w3t3DBeiaui09JHicEMBZhEgSrb2gmDcJNU/PowjxnLCYHrJ5ZriKeV7zh46W1QlUo7RCZY+TRWwt00gbXqt4LyxbXVjAN18toqSMigyz/pCDhWEvjRuGsST6W3W7ICuCOP8o5fzdgj3g0s7GowbTAvULdjTTHGuCCtvGDgT0Rne4AlJu+CEQXvcFEYRS7WSsKRVRzHS8Rz9dalOjUvxkgrY+QMnAGAZPRuMigDLsHeoCU1/4XlTARanIq91ZpMfuXurPjH4kthaCaYMcROztdrPdJQwmgNbzcixLh0M2iPRUD7DiHCqoILrtuw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/TodcPeMIUYvDSipJ+hrlvyCUpVhBk8dEVQlNwKUL1gWRPzd5frUs4Dzaupqbs80z6nGxUnsZ2ymin3GnD71EjDe7x6ssJLFosB/mT3yMY6w5LU5ry4hvO18wGRWL+kPP3h2JgnERDZKm5o/p9XoszpN5IU4AvIfbqGlx6L80uDnGmgjhY5Uxdugx15ffD2KomTLTBIGEsWrvuMguKwUWtHBlrgea6tO+mmVc5BXA4WAedkgMhAT46jSyxDPHV8A15bvrSqh/1PW6c7i6RvFc1vpDQDBEKsT4SHRE0KnRKg1F62+f4BxGLssFgfH3XSPSAQeP4zNZDe5xFu1p/l7EPHvq+TG0V8nVPwv2jVBDoNX3PwbCuPee0Ldy4ps3GqVTpGviKt/imPkjENxUQAHaOIi26gno0+9ECjyhSUWTGSWNcYsfoMJ6cn32BFpLRRY
X-Exchange-RoutingPolicyChecked:
	iHvdlUboRAI5oppuHtOYcEbNEVf1pptIlaHEVHwJEzaFEicPjAPlnXP/vIPbL6OBGyKna4mzmlK30csEngD2uCTUzlgZdR4P8LaPRHFT8gkQ5BIqkfw0PRH535P/yF6syV2vb/UPF2gMW4h0aDQldAdm6dXP/jWs+IpWFTbAXVAKekYUczV7VWJZ0+d2rqYRn5Vwql2Q2ql16yHWuuhCUj/ncHZKXQYO4WI/cNJ9MCNdH4gVKG8+M4SZsdy8O8PGFTsd/n6Sa27dZr3ET2wQSh1Dv3CpmfxhBZHCYxioPgbKy6Zg+pHj593hbY21jBULcUzLtTPvzLWvazMIygkgDQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2026 17:18:08.5723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eda1205f-3c12-439e-eaf1-08df0c3ad25e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6027
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE5MSBTYWx0ZWRfX/Iovgf56T1cy
 26xIKoqEF6KIYTx/XMdySWXe7gZ9SEZFNKGs4RrC1KhLhcJgMEwaPSMOaQM3+CxCTykmglRqIc/
 g8fYFYyRSYC7y+/R2oXkk14VxRTy6yZXuvj4y78QJzu4Vgu9IKDwpHo+E+WL6XIQjYEDVTtFLIh
 f5/MWNZGSN6b+GkPDiIkvMQaY50a9tdgpvbUEaqAy7aDQf1rZ2Go1WaAPmyNhMYBMGztfyDp1X5
 BfrwmfXdY+4Ld/lotlb+9MnFWo1Tvo9G9VpMpM7+oFPu94aM7wFI0RpNJLTOX1eOgBmN6KV6+OT
 bfhUibtXr7Lu9k1fVhVDGxw/Q9RoGcH1Euz6F7k/dcaevTVkpQw6Y2kxcgdAOzalZggPIsrqRE1
 j6zS5mtJHZ3tYpXUEVWY1rXoEpBGAttQVMACFSKTYMdyROPlXp7L69xFSzmVg9HDkZ7hsoIMrpU
 yH7D0KC0w83Uyq4dUgA==
X-Proofpoint-GUID: qWQLvTLtuTWPZQNGjSEytOfO7SUEYXxV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE5MSBTYWx0ZWRfXxZWbZ5NbEi5B
 7ndKu0AIH3C3PhE4zPDfA0AQkttwFw6d5lXwMi8HkwJI3ZkFzvgjYscYHNS20bcApwSM/lNJ/T3
 yCqvBaZisg+5ghDXIWGo4GeiLWAoWSQ=
X-Authority-Analysis: v=2.4 cv=e/82j6p/ c=1 sm=1 tr=0 ts=6a9da054 cx=c_pps
 a=0RQO2klDQ5fyV1VIsLBujQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=kBHiI2z7KOFT40Uz-ScA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: qWQLvTLtuTWPZQNGjSEytOfO7SUEYXxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060191

Hello Kendall

On 8/21/2026 3:38 AM, Kendall Willis wrote:
> The m_can pins can be a wakeup source in the deepest low power states,
> despite being in the MCU domain which is OFF during deeper low power
> states. Add the out-band-wakeup property to allow the out_band_wakeup flag
> to be enabled during suspend for m_can devices.
> 
> Signed-off-by: Kendall Willis <k-willis@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> index dfd65c00f5b95bca9e3a447f3ca14ad40631e1c2..011f2f37037553d1dd8ef68d2ecad36c4e93b130 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
> @@ -283,6 +283,7 @@ &gpmc0 {
>  };
>  
>  &mcu_mcan0 {
> +	out-band-wakeup;

In updated series of mcan[0]
LTM, you want to decide out-band-wakeup by compatible.
If so then, this series can be dropped.

[0] https://lore.kernel.org/all/20260902-temp-v4-0-3896f7d16ce8@ti.com/
>  	pinctrl-names = "default", "wakeup";
>  	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
>  	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
> @@ -294,6 +295,7 @@ &mcu_mcan0 {
>  };
>  
>  &mcu_mcan1 {
> +	out-band-wakeup;
>  	pinctrl-names = "default", "wakeup";
>  	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
>  	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
> 

