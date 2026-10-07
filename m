Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0726C4BD36E;
	Wed,  7 Oct 2026 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389850; cv=fail; b=B8Rk6IoeiFDJtnpwyzbRB+sat0eXqfYNB7ZoFsUjhw/WwuBGm5uH5IXC6qFbBbVhp7WcapfLTSUwzBsVhlqOjK5cc2qlwGSFnPopnw9K5F1IPIm+82rh8nIcTd1LHrxvYXV0Em5OZGbuEIyJfrIAO42PqIJkj5DKivjgaWanZws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389850; c=relaxed/simple;
	bh=BsdQ945l5/lrChSctGNd7YeFdqw6+ekqT7ZOysnv1oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tT4NmtWhj7tWwhbxrcp2hhNIhtDcLdK2wf0CJkg4nLcjFJo05MfS4VMiVISvUxcqnm8YQsLP7WikTw0fxSMVY+pjaZq8C9qvsrt00dXM/rr4BYDYw9uPThBKoyXdJ7SDpEHlczz5tfKIX0gcEEf55d1v3SZ8RB/KpQaD+eg9sFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IRBoWRyr; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=lxYXY/Ld; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IRBoWRyr";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="lxYXY/Ld"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697Ewq9C1587989;
	Wed, 7 Oct 2026 11:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zlMIijXg4iz/VjoqoLtJH7VuKTZAs1I1kQSEBn3X8
	VY=; b=IRBoWRyriHI4Rj0rAGSDKHSWiAKX4j3iq+2JIftVZ8qyeW+glOkaOvBX9
	JFSeH6wrC5n2kEgr4J9BcB98pk/aLHd0o4HGIseC2yYJD61Mnw7VvLijkjUj0RFj
	iFyhmkopRLEiBTfgNc7Rxg1bhUaxKPUIxwvUqF5ScGNrQHU30SSdgtC7fzqNpXOG
	0wmsZ6DjMrBoH0JlmO17gs13MXGmXhSseMgW7zMgJCeh4+IrqeFtwDTn2FL5sY+0
	9H1aUK6HwEcQ9UHAj35QdPyC2TlAbHj3i2qI02L8iYnprE4ZmjlAZ/xZP2j1FTQX
	kvGZzw6I3W0kzKbaU1vJ3aCNoHSZA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw7anf9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 11:17:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+5Q6YpCQ3sS9W3srb+x7QkGqZ0mE5n+eql1lBpbmi/ayD1IdUecBZzzBTJoHdqpn6cAQtNJJ4y5fcfgNRRdkAzhWxs+YvnGsQyQkX8yvORmjOJLmCDWAXrXIt7InE6+mnDG18GQUzZmoVfH9zvCJlIcNnQy2JEtB1D3ecGdm9wmiA4pCDQVsLKDc3VN0piT7JPAcjvcO+RH7pCk1v4UXOtTyHRNl55iQFa+Qr9YvHh6X0QC/xpMART74hS/48DMUqaDtV3Z7+ZQGKzHt/4skHIA0zwEsb87i9xO9jffziDvBTN2EFEMTPf1i0zrd+RpRLNineTF6Dja7NirU+babw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlMIijXg4iz/VjoqoLtJH7VuKTZAs1I1kQSEBn3X8VY=;
 b=XiUKv1EcwH4du3IjBBpvfQ76+m9JYx4COOthCCJhMM1agz6ENklWydlpoO+OfUnLVkwU5efHHBIlXH5TCLaHGwrcK3iJrWHmKK+tUNIAV9uP1sqN5f2t14InmNcTtsyu0XNL7JbjnUaZkDF7QSTFXTnCjYW8C2eOBiBZyUjoj8lNIJxkZHQLjKppTQkuhkdrsydi/kuz60MmSBnXXBRjzg1fCQUfH7RWdRV7W86i2BY4OzQS0ArLAZUn8aU2gOShCKvDSMv4KGDLak/JB/56GOR8gdAlfMM8ajkQ2LbiVVAP8AD3vuA6xdny1jTM937nZDeURDlEh6GKCUD5zw9bFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlMIijXg4iz/VjoqoLtJH7VuKTZAs1I1kQSEBn3X8VY=;
 b=lxYXY/LdMA8TTXnB2cjFfKF6od9DVH+/pAm2SeWi8oEmigH8AQ/KgM15pslULjSX/zAKkVWAKKNp81brTrYYNkcnZJRxofm68RQ9FErNQ83o8ULFWhll56NQtaXfdW/5tcncv64flpMm70FuQCpqyOvw3HJJkJCM8L84LCi6Dds=
Received: from CH2PR18CA0006.namprd18.prod.outlook.com (2603:10b6:610:4f::16)
 by CH0PR10MB7437.namprd10.prod.outlook.com (2603:10b6:610:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Wed, 7 Oct
 2026 16:17:06 +0000
Received: from CH01EPF000BE943.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::10) by CH2PR18CA0006.outlook.office365.com
 (2603:10b6:610:4f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 16:17:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH01EPF000BE943.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 16:17:02 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:16:34 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 11:16:34 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 11:16:34 -0500
Received: from [10.249.32.48] ([10.249.32.48])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697GGXGW532431;
	Wed, 7 Oct 2026 11:16:34 -0500
Message-ID: <e3806199-9c9f-4cb5-99c3-25e9518853f5@ti.com>
Date: Wed, 7 Oct 2026 11:16:33 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62-mcu: Add power-domains property
 for M4FSS
To: Sidd <sid9.karanam@gmail.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260922171942.201947-1-sid9.karanam@gmail.com>
 <8cb23b44-027d-4d81-b342-7eaca0248f63@ti.com>
 <CABM86pxDca--BxNFUjdZy3Z_t7qpd8a9A8FpnYc9r=VGag9bXQ@mail.gmail.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CABM86pxDca--BxNFUjdZy3Z_t7qpd8a9A8FpnYc9r=VGag9bXQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE943:EE_|CH0PR10MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cc698c-0ad1-4d2a-f5ca-08df248e6c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|56012099006|4143699003|6133799003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GQuiBGMGvF6j9JSmTuwuPuQJwzkt5qEpzKwfwbzFXunMS7GXlyr7+L30IjM54Wc1HTOYTJWvRQY2DJFrPVVKxjcUo2RqOLRhPvOohB9CMNnHSzvNrhTt/psvbKGAVG/06cG65MmmbcTAkJrmIUfzEWgpl9wDw7RUnI0UlbPJD+0CjHUDOCO7sNZgpSKxapVE36me4eYmnPmmqIRkObUErtQuO3jc4mYXfuT4yTSb0SDttpopI4gg9J3qWPl26sMiVlvRFZow0TM/y1nE0eRPGVvcS4222PeLtyWrhdIOdzrVPkdRAerrF8GVyAocLrkoic8/sjqt10gwD5kVmQZ8FHH+sU2G3Qip4urqQfKZRpR+ZZfD0e4kjIWuuoHXMikFVjK4ZUUnkvHIhPW6rfvoqrUrD//JZhfluo4GsLQPwljjAAmUu9krtHMzkiwrHUABrV0YRJQ5yCj+0JPzsYlkKEkLnw9c/MYL42WIZth8gmRWA/306QmeVo574EkQnoPKRpSb9NMBNJ9XxpNMde7zpywehUVqGn2uipIkPkv/99VaPb7Cdr7TB4UeSWQQEHWE1jfLg7sC2e/UvDes+Pe0ZI5+mMoRGvakhdyHszPbAGhdApfj5T0sY5Scujvt09FMKNK4Ne9ao8ogfHrxytF6gg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(4143699003)(6133799003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	abamYXFsLKlWH8GiVmF9OM7XLMkVNej4JjzDn7zXvxzX6Vs3nfRhdWDC+LrAUSSNn3ORnm1o0R7ZgPt7d1DCjAPRPDvAIqwcMQlMAp8t9gCQJqCE3Z3WPwAW0sqpGamxNVuzydCyui19bRGGMv9ySmk/Zq32O2KoeesA5QUo1GRb1FLlwUJWIbTokocu/M3AU4w5+sboi0LSp0ejV6VNV1UIynEBDi1P0L1ZGWynGZpyFKFX1hQ+pEiJfmUkX/cpykcSxoXKbhTR+8iIjJh6T7hvbiRE1jxkY/0rB4pbVp31BhGuuerMR2lqvA0/MfExWErU2oBrViUANUQcDMJLWh+Z8G4zZ2q380U7ZKGbl3updKpp3EJKDTSMct0iGgOynfisKn5zR+yslv0XyWVoprIP0iIpYjaQoHIG/IImSOlXMSvxa7s57MilCQ+h26RU
X-Exchange-RoutingPolicyChecked:
	PHDthqwop/rv3zP0GDCaSB4xWoNDHgp+1pJB4L4SHNZhrhtLSJxlHjca1ZqYEzmDP3Hwy2Sw8LwOt8/bzsBenVwh04ch61nHnllR2WU0H5SkyRmA+7p7UlLVfITl6q5Kx86WAPaygiCvLyeNuSMhsYe9WSmY2TBJdPk5lyy0vnpPqh73+ojSL8/ZYRNGE6X+DeZ8XyPtWtfukyvH9Vi46T63b4R37iC1nuxuFaDwzRR8negoO+0fealY3uZe3C8xtwXpRMvc6HTW8V08bPpvbR0dV0l409+R6oM8bZdjKc7BEvZ9l9xfmmCnGui6LEwMD7qC7O4a92Q2gYzdd67Opg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:17:02.5137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cc698c-0ad1-4d2a-f5ca-08df248e6c04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE943.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7437
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac6708c cx=c_pps
 a=vwzr6GK/qOZR+/kkcyjBFA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=9AdMxfjQAAAA:20
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=vYBDPz2uy0ReE4h6JmsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NCBTYWx0ZWRfX0gHUvBdzFRCL
 23K+1K5kkYpHV9MAmBR41BqEagyq3QvRPieqrUX7V484Hh0TTjvdoh+bd0wJ7IjXZERw8DnjBnE
 M4eFqCWB4744CsJmDWfERi1f30reJt8=
X-Proofpoint-ORIG-GUID: hSfS5IiDVPfmHrf-wdTphxyMs0bAobEn
X-Proofpoint-GUID: hSfS5IiDVPfmHrf-wdTphxyMs0bAobEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NCBTYWx0ZWRfX/t2ukLZBhy2Z
 cwNlVoYQ9WgBMiTaxHC6UQJVmDtZc9QyIiTu9m6+/zPhtxChQPFESMhrXRHIUaIE20/5A5YnVZu
 2gZEEb5say6EETyR6V/zZXB+5vCzSLhEeO/+Ykdi9cFMTjEFZBjYdnTvXQ99mxyp9f5Ury17J6F
 cjL3KBfqLxlBCcfBsXNAMbArTByoY63uaGuL/kKjXleMY43dRCwuGpXNLh/BhmG+hlwOW96KL0v
 l+m35NMGYADOEKCttqWQ7+pqb9ZXdDOqXILyuFqY7vxtGofpA6r1W84P30xCeA9XA95tW0xq3Bx
 VrJwGZwx/hdfYFS+FsxqhsJq/NnITFowzmDVms5OHk3SniGzUoF87zdw8yOfoXcvtar1yHx3hmT
 f4lUb1dvS2j3fdEO/ZW7Jja5EV+g88U1I/LADDqcTsZQMRCv6LxkPG6ivHyXIC2jyJKtM2PISaR
 ZBcIlySWnnLIDN3W90A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070064

On 10/4/26 10:39 AM, Sidd wrote:
>> Anyway, the reason we don't use the normal "power-domains", and instead manage
>> the power using `ti,sci-dev-id`, is because the normal power domain framework
>> has a nasty habit of unconditionally powering up devices before the driver can
>> probe. Which in the case of remoteprocs can cause the core to start running
>> and executing random data.
> 
> Oh I was not aware of this issue, seemed logical and a straightforward
> issue to me, I'll drop this patch then.
> I also figured this would in turn nicely move into wrapping all ti sci
> handle's device ops through pmruntime (such as get_device and
> put_device functions) but I believe that won't work as well.

I think factoring out the TI-SCI handle ops is still a good idea,
just not using pmruntime functions yet. We are discussing internally
about how we might enhance the PM framework to allow for marking
these devices so they are not auto-started but still allow manually
powering them using the normal PM functions. Will keep you posted,
or feel free to think up and suggest any better ideas.

Andrew

> 
>    > * Power up subsystem
>    > * Set reset line for core
>    > * Power up the core
>    > * Setup the core (load firmware and set boot address)
>    > * Release reset line for core to start it running
> 
> Right, I see, thanks for the input :)
> 
> Thanks,
> Siddharth Karanam
> 
> On Tue, Sep 29, 2026 at 10:09 PM Andrew Davis <afd@ti.com> wrote:
>>
>> On 9/22/26 12:19 PM, Siddharth Karanam wrote:
>>> Assign the power domain to the MCU M4FSS (Cortex-M4F) node by following
>>> the device ids info published in TI-SCI public documentation.
>>>
>>> This will be useful in future patches that will attempt at abstracting
>>> ti_sci_dev_ops's calls such as get_device and put_device via pm_runtime
>>> calls.
>>>
>>> Signed-off-by: Siddharth Karanam <sid9.karanam@gmail.com>
>>> ---
>>>    arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
>>> index 68e906796aefe..1ae0870893c16 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62-mcu.dtsi
>>> @@ -181,6 +181,7 @@ mcu_m4fss: m4fss@5000000 {
>>>                      <0x00 0x5040000 0x00 0x10000>;
>>>                reg-names = "iram", "dram";
>>>                resets = <&k3_reset 9 1>;
>>> +             power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>
>> The surrounding M4 subsystem's power domain is 7, but the core's power domain number
>> is 9 (see below in `ti,sci-dev-id`). Enabling 9 should also enable 7 as it is a
>> dependency. We probably should have modeled the M4 in DT the way we did the R5[0].
>> With the core being a subnode of the subsystem. Then 7 goes in subsystem and 9
>> goes in the core's subnode.
>>
>> Anyway, the reason we don't use the normal "power-domains", and instead manage
>> the power using `ti,sci-dev-id`, is because the normal power domain framework
>> has a nasty habit of unconditionally powering up devices before the driver can
>> probe. Which in the case of remoteprocs can cause the core to start running
>> and executing random data. We have to do things in order,
>>
>>    * Power up subsystem
>>    * Set reset line for core
>>    * Power up the core
>>    * Setup the core (load firmware and set boot address)
>>    * Release reset line for core to start it running
>>
>> Andrew
>>
>> [0] https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi#L178
>>
>>>                firmware-name = "am62-mcu-m4f0_0-fw";
>>>                ti,sci = <&dmsc>;
>>>                ti,sci-dev-id = <9>;
>>

