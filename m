Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D343B9DBB;
	Thu,  3 Sep 2026 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465690; cv=fail; b=QC+xnKH8c69KDsCvTI3jJHH4pbIU0I+jV9tpblzzPDIJIwuZ79laJNZ03k1ZvB1xSNnRpbKk792IbU6tgY4JsVbaEFaVRNthyBgCD9APbDK2MCQZPu5VOQGjV6W3zTTNstDND+yzVITmi5rFkBZjmaRzavRpKEObo3rJBq4heIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465690; c=relaxed/simple;
	bh=0NJ19D23iXHMHJa+YJNnKtqmcaRRCTZdVcKQ4yS9HwY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddgGgJyw3+ET/HuSS0YYJ7z9lsf2e/FS6QI8iNQ2Ru+Gru0Nn6i6iqRV6xZ469gisMvZwu7KviPeKhRFCSc0Cv4XIfhVkGW5EtKg3aUx9cgUGmZvm0sl4lgs3uok+U/lX0wbE3Cxx9ko/JQfHZzTe2r3Rkr3yaApYeA3NEAb2CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=JCYolLle; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Hqf0E5lp; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="JCYolLle";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Hqf0E5lp"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683JpH0q1572519;
	Thu, 3 Sep 2026 15:01:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=wlkbmFAj85uulAI
	ImLy6bOph9by3PjynNMBRqMTCPes=; b=JCYolLleZx2Pcz+D9lEPvvkKu2/zCLJ
	oKAM63z5IfaU1Ar4sKU7v3+GtefO0D7nGuMwMFhG0ZuYMarqiV2KgtUds1QC4wRr
	adZoXJGxR7RsrUz7fatF53twy9kcJkKJMJ2QoFg5psIyvZvzzKGQMK2hC8Mmp36L
	XQAjcM4epa+6VRdbyhhiIFx9Fl9II23JweN4M4Lh+GDQsNt0W8bdSWCmXam8UECe
	QYCG4D3lIfvXt0+WNbiTygu1Z5Mj7x4bsP/xRY8Ek7f2Hj8Ac0m/kTMRwtTA2J0a
	Rmi/jE9ZEuRt/G7bY7im4NqvNy1tKiNmw+e3hIJ1MAREjIAwMFhNeOg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010042.outbound.protection.outlook.com [52.101.193.42])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gf68jcb7f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 15:01:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pb0GsFcliZ1l0DO+y4e9aIv+JaMfI8JKJma2OuHvPUDwgjw1sY/xKOf8DNnW6iZSkwxB1wKuTCfNjDRll4SYnP18u7gtGqltbO5dwvjwan3R3/b4LIbVHXpVKns4C9zMAi1zQcQsGO6Ix1ldCSWqzhPnmR7zrhdPHmBA4zp1WVQ56omwLy5J0q67sjohAdyPhe2xPJ9ZzLatmoBeukHncruqcIqpPh9Hk6G6H/P3eXsH05JmPwJBwjgu7JUO9U1iMOERnZlvFoR62tt0zB5/41BUu+N2lAr4xmZKBCdIcZCrMu5fFYuvduw0p/pSaUzYgWK14B1HYrbVOaRsMMZsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlkbmFAj85uulAIImLy6bOph9by3PjynNMBRqMTCPes=;
 b=nzGDpN/Ra7GQ6/t4FDmLo4nOfuIn6fMKHE7BjQGclWrmYo1Icgb0P8XGmUwfnxNfM+Rmqi0lSGBN3dk+VRnkhfADbtsZo2TBmtVW7Vj2J97gGUSAp3dzKR3oFVs5QmC31YmYdQ0livz9KDw877jHPexTqXsE6HhTt5zaIIwQIncLrgEjdzSq8jX/DiPPM7aDuHonXjf+vcRvmfqQlv7horWzFBloQi6z0MjlQlO+LPbinTdCdFwuoNr8eHbtqByHX93q1Dp7g/gQPdKceW5gj/AZtMreiOvYbv385OvKb36yxbzfUrILnehDwE1A+ip1wJS+YZjrWSKgXWHJpuaLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlkbmFAj85uulAIImLy6bOph9by3PjynNMBRqMTCPes=;
 b=Hqf0E5lpd/5wWq8yfZSnFjTvn9SYlhQr2qACM0ewv7hbyC+YX+8bW4Y8/fsppomvptSZYr3u629cWFB70luCdBLraMx5VV+nmbIxBXE2XOIDuFtjghYiKBGJDTTdPmcgvOWEgzoRlH28iuDszuyVFfLOE/Yc1jGLtIZhO/v2atg=
Received: from PH7P220CA0137.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::22)
 by BY5PR10MB4355.namprd10.prod.outlook.com (2603:10b6:a03:20a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 20:01:02 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::1f) by PH7P220CA0137.outlook.office365.com
 (2603:10b6:510:327::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 20:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 20:01:00 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:00:41 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:00:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 15:00:40 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683K0eLb3173189;
	Thu, 3 Sep 2026 15:00:40 -0500
Date: Thu, 3 Sep 2026 15:00:40 -0500
From: Nishanth Menon <nm@ti.com>
To: Jared McArthur <j-mcarthur@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Sen Wang <sen@ti.com>, Moteen Shah
	<m-shah@ti.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec
 clock from audio_refclk1 to external clock
Message-ID: <20260903200040.yxufreslq3ahsx74@buddhist>
References: <20260804210558.1455777-1-j-mcarthur@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260804210558.1455777-1-j-mcarthur@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|BY5PR10MB4355:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3301d5-339a-4a9f-19e3-08df09f613e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	osZRNIH0KYAbORt0uT7oqRwKV4eNT/j6XKNM8LXbaJ7Y873qlHSdC0s3JpcbTx1pw3l/fItoxxglRQjfONt3b9Xl3DvRln/mekkRoZ3+ZJT2jbYP5Wqs/QoGIHf1bPt6/h7KomOt6FxrGP8Ju1MOhBdjSl9NFHPev0216DAhk8Z0NmNuLheRW3NKczIUGFP24716yTjiZLO8XJDNAzZq8EUjmj/trUd/Q8T+NG+jqv8ZEiofd0o2fpMJavreQBdT/wKKoNGtTiV3D680LeCf6t3Myn57B3nOxurtxrd5vuMcAv0AbtRcA757DoYIWDCp3Oq9a9qKPB6/Z7NJpWvZFAvhF5J5Yzemadw6pM8MZhJOu+qqTqiMx0z5AHwq9WxYtDCStg3HCchlm3LGlrYC6/Nl0dCcRKP4vR9AH7pbHo/Gphx/5QIlKppv7nur4nR/chDD1eNQlWy0RRU9GuLb4AJHchYL978+ZMlquCxCJUsoeSvOVtLqmegF6ux4Ncu1zvOvhsSk5kQpRPHqOixaOhJvcFooUFPhRVSyIcf/+s1VX+raiX570p8NLeJW7103mCOxV2bbgbV+JWk61xYAofzPK+bu2iVMZDetUse/+HiAr+bF3ngyifSSEQ5q2997wcN/y99e+9WwV10dQy362BlAKwi9cdLhk5ia+ujKkh571i/1DjSAvHfOtHsIXwcHwDJprGQfytuEVuH5xQxubw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hXBNgKI2xrrYeHn+UW09cFGejC1cVjnZOIBxG6NxLbQwWZqrxnSmtezuHR6sAblsf3ThOg/4ZW+Ov5H0gejlhevIyi4PG5ZsZiXDgI+uTXSb1f8PFmoCe9XQ9dQk+hZEj7nkQq0jA/NQhQmWdayY2bho2RkMnjtSzcxConEKYsSc87wOPdaZiUbOY/ciOYYAUKCOo2aRY2XzzOYjwRifOQMjzuCRWF1qa06sP/1ohJ0fcb0Me3rbwnHgPPEj2VzL4t5Mzm1vwKQRl7z0IT/8DyV3gKtE+/P5K20Ut6/kD4pJHLjQt5ZV+UgRRsRAUALjmRVtYiUYnOVAxZQsiNX2ZPhgS6938KHANTW4ZFhvODAgpFL5agQ27EqgA6YNtErtliZDVEMG/1HATQVAfIJ7qXU+6ki7TOmXiTv48IquagX/H0uf9Au+oVhczmlBUZ7P
X-Exchange-RoutingPolicyChecked:
	dqDMG3vIPEQ/7dfNekg6zaguprsym0dFrHxqRkoc5/aIxd92AEosUVWJXsIcJMulCdcgaWfvpjp7y09q5rLxq6nVQhmwJii5hdw5ivlZKEzik3UL5DE/Yg+fo8pK9fziXfVGh+tqo2WqF9Z+bVNQD6C56/Nac2aGUVz7dzPOC5xr9QlHSHVbEdAlcAVw50A82yqW6b8b1/WnSQlgfZmiYgLRpbQjDdusNu6g6BY43PypK5R7wF7C+g79piCL+YpfccWmsJsJzo3wmV+o/kNgH+UcPhFuffL2WkxddFB8UbR7mMxg4b7SDxxOwj1lPbCpktQmDjnlNy9ItBYUwRKmwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:01:00.9212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3301d5-339a-4a9f-19e3-08df09f613e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4355
X-Authority-Analysis: v=2.4 cv=MvBiLWae c=1 sm=1 tr=0 ts=6a99d203 cx=c_pps
 a=qId4hgiKfVM5Ptks7FQs9w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=iRONcHeMQSG4BGV_9HcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: eu3Ow0cWJY9FYyxS0WqpZ7SclDVKQDhB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE3NSBTYWx0ZWRfX6C2BAOIbkdGD
 YnH2Dp16PbMiXWG98UjdP9YTBt2nZr+pdGQQwA8yafeA48ZCnpKoT1VaGuxkM6N3d1RmAqMKUu4
 cBiwCRXC1G013XiLp1PX5fTodFxiKI/S1jRJyRgc9IXZAV55yOR7/b/RHy2pYiHz6UgfZ/r/yt+
 popMFtLLJiDnrlJ/f1E5uWgoU7ahzxBccNFWADf0m4Be8cVDD7N704+SNP9eSKzOr7R0mfzF2Pm
 8/wsr8VQdUif3eaFS9fheAiAMpKkDmxHqOJ+CiVaJmZ7zZzLPAI+NQdYSkQ0gVbkgo0ZuaY1HeG
 YQBcpqMtRYx3Pe1iUGu6DXmAryORjpdTvrdLgODRMtoV/n3jJkSR6Onb29v+bYVG5IVbdtgYdvw
 +E2UgtaFfdAtCYcj2IzaLYL0UTGcxb+p/u4MBGg/81nJWKZblpd4fUHDuaowShpbfEbZtERgbU8
 4PYEdCkEIezJZmbwsZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE3NSBTYWx0ZWRfX/a6TxCCKAfl2
 GbL+9NpXdHaybAo/j2vwyR3esZvMYoiorYrXFzr+egI3VvrkZ4q8XZK5q/cfYjv2uSBVtOL98ff
 pVy5Us0UrOLanBEnCjRmEu8VZOkwrtg=
X-Proofpoint-GUID: eu3Ow0cWJY9FYyxS0WqpZ7SclDVKQDhB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030175

On 16:05-20260804, Jared McArthur wrote:
> In revision PROC170E1 of the J722SXH01EVM [0], the audio codec's
> (TLV320AIC3106IRGZT [1]) MCLK was provided by the AUDIO_EXT_REFCLK1
> (96MHz). Revisions PROC170E2 and later switched the MCLK's source
> to an external LMK6CE012288CDLFT [2] oscillator (12.288MHz). The
> PROC170E1 revision of the board is not publicly available.
> 
> Fix the audio codec's clock by creating a new fixed clock node with
> a frequency of 12.288MHz, and switch the audio codec's clock from
> the audio_refclk1 to the new fixed clock. Remove pinmuxing and clock
> muxing for the audio_refclk1.
> 
> [0] https://www.ti.com/lit/zip/SPRR495
> [1] https://www.ti.com/lit/gpn/TLV320AIC3106
> [2] https://www.ti.com/lit/gpn/lmk6c
> 

Do we need:
Fixes: 3a36c535dfd2 ("arm64: dts: ti: k3-j722s-evm: Enable analog audio support")

?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
