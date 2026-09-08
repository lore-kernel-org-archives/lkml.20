Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B84A3ACEF7;
	Tue,  8 Sep 2026 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899365; cv=fail; b=aixEpC8Iu3bCe+Sj3+Km7W2I85ExTrHjyBBkNqaaTOxx3uNzdfUNUpdCWVwBqfLhMqyEskXBkjK38Y+VF+41sFrz+PNFF5Z3vLQ4Iw7licorLk+vKUYEpBSbxv6jzb0QrkJjN35mo4kfQOW2+3BZ1U5Klz7st8suw3ya/Q17iBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899365; c=relaxed/simple;
	bh=iltVyAj37zsQporlSBJ5mqHaN8MxXJM1YEQXp2Xtp4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qYFPKCGzNG4ZSMm6ib1b6b9u/e+/NB4WQJxDDP0ZNUiSoKE2yCOEopoajO3fYqdst63KSxh35bigwWZpWSRESOMcDMq2d/sRecZwYYl/QqsrYTnyYPr0LqVtcPJZCegTTNWsV6Y8RcxQ5LAbgb6FgzC22mQgF3AJIdlKOd92GBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=glN+Tcji; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tiXRtdwt; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="glN+Tcji";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tiXRtdwt"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 688HNHPJ2336778;
	Tue, 8 Sep 2026 15:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=p3CXav/sbAVJSkzaQLNuwr0QSC/C42P6uyGJUGH1j
	MM=; b=glN+Tcji9foeXMpNYllZHvw8nptxO1usR8DQsj3fAFQ54pxd92Q4/5l8J
	CoYXe54WY9RE5PgUBY8krK/H85T1pLeSgxs/KVxj8GaYMgGdBf3ZXPdLBRRPSc6R
	7GBQHh+gIfrUf25r23jRqxUcS24RMYhro0aa19YrqglNYVw0y8VvSQLyjT2Ln2to
	3IKg7BfcL7arudnAttNThT/0z029KlOzWLx4Bp2mHQx+GE0Jj9z40bTffS5+XFFM
	Wnfcb/CX0r3Uv2Zp084GMhdC8rDhauZKw3uI2cXMg7pAnFxE0THAgIaOM+PI+Nvx
	pV8RPjoYfoTzkikhp1btLQVofQAJA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gjffmv47k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 15:29:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0DsXWhBIVZgrinXqV7aoqrzvZUN8+5KM/RCk9XOIXy6QJTVN3K6vIS7tf68nnOrspvWnT4iLWL+St/KBzXgmLBGzRQW583rpKYFhcqTjP08t5/Grz2pn3pBtX9QCE6BiAXjk7KUV5EhEc9lpgp0/mLyEHfUfhl5W0a6cQrLO9szIoElobtEbSKoJFs3dgQJfGd5gfS0WYCyk/wmRJGeJ/nZ30JNodRWamif3G0SOjrXNfLK4QDtJtvEISZO7vwgVSo6U3iOo5j4qyUjVxb85DdnC09f3U8PW2GwtqcJHpc5mUUX4eRx3cQBSIIQWH20sGGnCn5hVSQZ7MDBlhFGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3CXav/sbAVJSkzaQLNuwr0QSC/C42P6uyGJUGH1jMM=;
 b=Xx9Ug7hbPXtKP8NkYYscR/AsorZTs4LjKdrHWVBaiwwmB97t0BhuQ7GDIwguYB/G594b6cm+lOIPjoP8bBOx7EUbbtpgCWjbwz7NJw2SzQVm+ClmeDsWSDKc5l/6Fa6pxgICM/20Ugs/1Kvaa97pYGiTKv+k1OM/p+qPaij2MGCE03Pzu3zKEtkzHLFPRD6ZLmG+RBpoAnsbDyf49PyRP/G8dm1nCciJwHPX7fyik+3foxs1RH391wYWiOzoTgJPGKSLfa20AisdfHUSLP7SSDSK02bBvxHVS4/q9ONkFzVSPFhsNRuZUIpf0jp43p4Nw2W5x6C5hQ0WoKyCeaGS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3CXav/sbAVJSkzaQLNuwr0QSC/C42P6uyGJUGH1jMM=;
 b=tiXRtdwtwhf8MiN8v9Rw4fQ1fRaSPH4upBkU/mrzyO3iho6aIGqlV6PihuynqZBVozjjjgjJJC2g3AVWQbZMZ74s1+9M3kxmaYmriBhEASsclagbD6UXVzucQgFSowBhO7mszqygtiLoQndR0gzIHBjsSwZYDC+bqS3xmFXA0rQ=
Received: from PH8P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::16)
 by IA4PR10MB8304.namprd10.prod.outlook.com (2603:10b6:208:566::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 20:29:12 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:510:348:cafe::45) by PH8P220CA0036.outlook.office365.com
 (2603:10b6:510:348::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 20:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 20:29:12 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 15:28:47 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 15:28:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 15:28:47 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688KSlkC3121731;
	Tue, 8 Sep 2026 15:28:47 -0500
Message-ID: <9e72a269-1b19-4c60-a32d-8f93c499f205@ti.com>
Date: Tue, 8 Sep 2026 15:28:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
To: Conor Dooley <conor@kernel.org>
CC: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-2-jm@ti.com>
 <20260903-sandfish-likewise-820d64daae2b@spud>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260903-sandfish-likewise-820d64daae2b@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|IA4PR10MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: 40044acb-786f-4142-d1d8-08df0de7d82c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|7416014|10067099003|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	jfcgbTEDSFK9s027DIzIVegCZkgwL/9MkNlGX0JZ6MjzNamcIHhT7UQUlea7r9Asnj2L50tiGkFsUHTlI2P+17Iv31XdZbAun2F255BQXzrOMdXNPoisBCS8/E4McGqeL8QgjXv5hmh74x+cFBewlh9y1iEHr6kSea4NQ5cGJn3hh2mOGtjUA++WrgNDil8mzTmiLUmb0NWi10hh5FgbMyDg0jbSS25MF2hMknxkSLEWRDctRqyU/RWb4ErOwQJyKdaPqY1RhRTmiz+hZGKjn938r5E8/dfpsGcqIWmOtAtsNd7rrUjfW09eNScfPZqbt68ICVjKDnwZuWT6ZxI5/hCeGAS68552T3DL8hT1BGg0nsp3Hz+/S/YRgJOkBPI8gU/WHmN3/9wHQZXEpO03TCwMYW3GN3I3EvN0wnUFp39gQ7Ks8XCwsRfjG238tt5B9iLFq9vWjZ/JM2r/YpLQAF7aBkDGCKBLpBm2H0lXlxvw4tDVmy9qpGn8qWGuUjIIOfipUG5VR3zTEXUKS6ceIxCEM2h77gal2ZPmQd3EfhVckNEUKOL7rd4xZvxGw38hAEZoWAuQRbXxge6DA0W/LfRVauq32TsyJIGWppkLEaVbMSqxVBfcYRGexNmOXmboL0PgwI/pV5m4nQ+4TIA14NJis8vKtMRzTCpwfgQn/tsrJvN3rFYoFwCjkCkJHWlI1KC3ueTgfpkA8dm7B1dmAQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(7416014)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	P5QUmTjk/UpbrchZDXeg3usZUXiX7lt6pInPnatf7xOJHUsy6OsoE4le7pH0Ip3Duq0K1FZdfoRskx0sd2kDuahozeJT1gpDilrYMpRG2cErt4aN+Hkq0L02WPWIRg22Tf7FsjKTHZYSOfph9VShc7Pp9ET/5QPk7ROpue6BGIl9YZzBgqTRKWB9hhCvbjltjxs4jhGfg2+MaUXfPvP6OJXqv6gTcs/u1zsMcHoj7DeeJEe7XRSgIieqJ4qIu5tN1DmNpAinEWkbdZvWKERFuI59jmrUIdpnldiOi3ZQ7b8F0fZTzjlcARWqfmV+hAVANLx4tA7ZpiwWqlSzc0QKfWyaaY/QpRsjdKOwDUvtBAcxarcPrGHVHovhqWNFRFPSP/UMMp0+txkbIJUklq6V+7/y882rXdlTM0mmQcYXm6Lb2blrugBB4mHiZpqGjXqX
X-Exchange-RoutingPolicyChecked:
	VWF5lkt0NAA7rEjtc7IE4zerZ+GmSIZUNxWqfOn1OTYiopRgqbc75/eQNhnwHZYPg3mHsEG1be9z01WngbykHvzRNakDZ4RI4NIiIKwFcLCKJwlAq3G/13VClKWYxuWDbYKgrkuhiQj9xgxWQ8wn+3DbU/j/BYtynohB9rChTRJnCmQQncdIIVcOXHhk7zIAFpJ+aVgbj5ilALB2dvYjzolACceycNqZuM6qh1fwFuUpYd7WyKZF0zRIqoar/OyI0s98J8lNcfoFzkMZlxBwPL7vUuMUIv005nJJWzkIm1Yd7FpvofknBtewbe/aIR++s798XATJvzOft2LNkz50sw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 20:29:12.3963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40044acb-786f-4142-d1d8-08df0de7d82c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8304
X-Authority-Analysis: v=2.4 cv=FewHAp+6 c=1 sm=1 tr=0 ts=6aa0701d cx=c_pps
 a=F5APu9G2MQgGAPAZFPwQAQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=g_alAQRnIdwcReUzd10A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CAKl8tQmiXziyTeRK48Zlowaa8uKgRTw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIyMyBTYWx0ZWRfX2G4N+qwSug7S
 la/UXUyVkpKlkZK0xwyXsKghvDHPkULCttXeUozpZSph7sPgVc47gLShtHcW1Gv07rEXlnfuErQ
 KcFtOn8I8aIMhRUXquu/sPOAxCcnO0sxJK+uNRAmgW9YquP4HaauGumhgKmQcG0vnZ2hWpSgP1d
 wcaTSO3ApOFz7d3IwIaTnX5M4FFoVfw0JDwWtzUkImHNrG+r6sGP32PZ/8x5kvevpg/OYAR9pe/
 JvdvSENfS2jA9TPhfY50huR/WIyK4fJ45Nv63wSqAQcp0CItDRUmClif5dE7zi+yw1CPtQDPvYA
 rlJYQAjK+99W2RUntDk+cOrXb5Hs6x+mUG2cGC0GMvT02eq3FRljidM483jSDdOSytFt0CvhyX/
 H3NpLvfghPCf3QPhTlDviGk3+zzvR67HJifUR4Znedb+Wqyty5MU1Ok/G8d2FPWhs6FpogwfKMh
 I55HGGkU/fZXHIkpn2w==
X-Proofpoint-GUID: CAKl8tQmiXziyTeRK48Zlowaa8uKgRTw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIyMyBTYWx0ZWRfX6/Egqth6Eblb
 W6Q+FmRyWU7B0yd2Mom7iUm9AIcm8hj2hsjDvFwYMR+IA9Qj+N461iaVCO7937ljdOHkpCzXX7m
 qbqiJa3iHIvQBwQuC6FgyHlz4EQi5Z0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1011 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080223

Hi Conor,

On 9/3/26 13:00, Conor Dooley wrote:
> On Wed, Sep 02, 2026 at 05:27:57PM -0500, Judith Mendez wrote:
>> Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
>> The uniphier-efuse driver can be used to read AM62P efuse registers as
>> well for GP_SW silicon revision detection.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
> 
> Why is a fallback compatible not suitable here?
> Either it is, and you should add one, or you need to explain in hte
> commit message why it is not.

Do you mean the following? :

compatible:
     oneOf:
         - const: socionext,uniphier-efuse
         - items:
             - const: ti,am62p-efuse
             - const: socionext,uniphier-efuse



~ Judith
