Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD81188596;
	Thu, 10 Sep 2026 03:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011074; cv=fail; b=MUjpExtvGvATwmZp7nIRd3qvRfhW2U1KukLr9V7coRbJTEwfnRWMfPbmeNnzsnhp4sFa1JcBu64Z+hW5Sqb/6wuskmf8sU0iEKX3QTRz32NUN7kzBRq88A+WvYHHR3YeLqC3B8Ed9n9SJjd9oMnbUM2mALCK/HES3I+HvybEVZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011074; c=relaxed/simple;
	bh=5FlWD7+7j5btg5cnzacPCttaojTopsK8jiY3oJ4dpS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sYH9uU8sCHKayUlVcA+TKuu7riaPKlxRUutkMFCHBxjC3Fl+zjJ8DEX38/018DiV3UhbhzgLjKuK+Tv5RAStdV/djMSHbgKk0Oejea9x+oxHl5nW24BvfN1ZLnSUGHmLJOTXfXRYSvqrg7TvhyCZCySX67rU4DkoRv2yVRrRsiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nUtAs2c6; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=scJUIHlf; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nUtAs2c6";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="scJUIHlf"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68A1jCIe4093863;
	Wed, 9 Sep 2026 22:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8q+pKCGrgLBSsKLvIAo/8C/O9EopWiQ9c6cjvkDoF
	Kw=; b=nUtAs2c6C7Zsid/sM67Uxqqi+0bINK/p6lmLqja0/IUERZJ7ZMGraSe3e
	CDwZ9bA5dUQWyj4kYPguRDoNBTyaMSK1zIy/frF9P59Q74I4OVrwXq8ajlQ980a1
	RqT5UaznmcWq2rG8U7Y4A4yz+lOHEeE5PltlpXeXUyYC+0yOf5qcJCozEwQwZVCb
	Tlg9WijCjqgKI+KcbhnNQckQ91YVyl0cfjNg6rJB7e7Dl8Jc8ImVb10Zz7DaFaFq
	+RtRe85BjNxgiCVBFkn8QP4dKkyKBa5tfkKxALD7vZ1a2jG0GuVjVWhzaI6jMi4p
	q2FDnTcwb0YkytDXsfjSt3HjvtUwA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010000.outbound.protection.outlook.com [52.101.193.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxgaq6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 22:30:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbu4l/3rGMzEudildsQtFUK2ioD1N7RyJWcg2aZqrERpG1S24cgRff0KYRMOXmd/hyXpQ4cmY/6wlN2aw+koK4nBNsGIannGLBge7BkIWUxXeYj7ciQMTTm+vcc12Ta9RbEY6IuMNhHfd7QPxyITEfXHgLw06BO+t1zqGvcMqSuyGTjS1U3u3bkkzEI6jBGz6uI6gsCxu69tVrU4ZWBJt+fZalhBBYSqZrlnnzPQZOKwDwGAmBEUgW57IXBngDByB93XyL5Wz7raJ6vTqyH19FR+AehajXX9cILE8YU2ASQcxpYwEebW0nVBHNUoTg6bR5bdVxT44u4Yfq4Ez1tCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q+pKCGrgLBSsKLvIAo/8C/O9EopWiQ9c6cjvkDoFKw=;
 b=Q2Qua6770/rcJ2eWgvmsKqtkpYImtflIzVFXOkOwrNPuMNMrlZT4wjpYXHCm5a5NjbRscX37+uxO5zqnoPjGzV7IV0I+31Hk5qNVyx44Dweyi2BH/ssZG+d/3hb5IZebMn8ccBceTn5g0ILZPgjFmguSCIS8dsHwMFke3FZqNV/FdapBh36WeCwYkX3R5DhvyBh7qz82OphDZjVID/qJ+JJDMSqiGK1CjE/5Vs/tapZMNEO/RVhBIFdY8pu3ud59mwY1z2FbiM4EyNTVHmgnVVXKpGTQR6se/Mu7com+Eeiy6h0ZchRKv4TjD6h7TuzWKVi7Os6IhpM5Aj2SULBX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q+pKCGrgLBSsKLvIAo/8C/O9EopWiQ9c6cjvkDoFKw=;
 b=scJUIHlf6DeXD8GiVCZJmTde1TxOufwyXqXmbVxdtrBI82Evd5FTXHDuGq/enH9Z1551IyKwQ5hodXFR4sowUSVC2ErsWVuk+L6kV0oav1VZhraGeVC6UkDf8BOisA0R9HKnlZPHSG7+5MaJrLrRz8evN0GJxRNxwgz+lnhOSvk=
Received: from SJ0PR13CA0183.namprd13.prod.outlook.com (2603:10b6:a03:2c3::8)
 by SA2PR10MB4540.namprd10.prod.outlook.com (2603:10b6:806:110::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Thu, 10 Sep
 2026 03:30:55 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::35) by SJ0PR13CA0183.outlook.office365.com
 (2603:10b6:a03:2c3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.4 via Frontend Transport; Thu, 10
 Sep 2026 03:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 03:30:54 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 22:30:14 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 22:30:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 22:30:14 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A3U9El1527390;
	Wed, 9 Sep 2026 22:30:10 -0500
Message-ID: <d55bb0db-4f9e-4938-8e37-5cc7a0b59b09@ti.com>
Date: Thu, 10 Sep 2026 09:00:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to
 LVDS adapter with the 10.1" V2 display
To: Leonardo Costa <leoreis.costa@gmail.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <leonardo.costa@toradex.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260909181332.1081552-1-leoreis.costa@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260909181332.1081552-1-leoreis.costa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|SA2PR10MB4540:EE_
X-MS-Office365-Filtering-Correlation-Id: ebec6616-cdfd-46ef-30d5-08df0eebeba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|10067099003|3023799007|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OSxo7RWjOHIgxTfCRiShTY4hqmUqFnw452vbq8HphS7h96VxwkEdIFiWt7nsZsEpjVtlbsCS5JJVibF6p8eD+wdRfuap4mxANuYH4YvVjQvMRGLMBFTwcmTDn2UeS2ZvMAX1vUdFCImgGaIPV8/u25ItipNAtK9GD/H/E3Z2VZ9JswNmPKvXxNPhCMdkom+tizQYZkudi/Dcbxh5N74XafUcVdUp87Xr/vaUyOf9zY0PYywyJR4grW830JylzrUDsL3GjnNxGUWaBljEkOxBNiQqrCwuRuk8HtO5p+ogVG/mkLEexPHSsUP36+csAXlqXQgI95i1h9usbOdqy2CEz+XKo4JwOHbnqdnmOJ+Vhno4/l0SM7Qg/nMp7zikliwMoJWrxhmjsQ31B7twmTh4aGp9hUPKoGaFwAUH+DgCspegkLvlDkvD9Kwkblk3ftmLl0QlEICYNhek1x/pjF7BfaqatBv4WqIN0H5OwY3nJRGQw7vMnaVuowmsCpdxruRDTVEOo84gsIDprK/hdE2g41E/WgA9qlE+B3QxkqMy8uq5K+uipIrw01Pf0jXKZmc+bMhvim4ok8xqsrDhFmh0PAf4ea2tP8GEXULBBfcqPSNxkhln6Q9GDE59kKzKMqzn5B48seBQ/51fojHTU/Y9ow==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(3023799007)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qneA0KuFMj1j9zLUyEuW8o6yfj54GY19AB88+w39DOyv2vgRmhV8iekbB1HeXpTG6ezEtWMhFW+K1ScoI252W3Wz6gW62T2haSi/GxwNkHftvvoFMvv9DmgmQlQVZYOgVGxNRrs51/6DWyYNO+kpDN8hqelTZVIUDaa/h5TA+fMD97e+9kLgwd+4Zfapdndte0SDu1MkofyL7au7oH006BOkdP1JQWvWD9TfLAzj6u8O4pLS48FmGHm8WfVgcY5OvS9niFPTXz2C9V64HypbTYWVngY6pqkffuFrF9gVVghsrl7XKvOSXVLJqZs8CGjZu1Odw5ODMw81PKBEIR/S4lpPijT7pAuQqDsg83PAUXCfy73XqPNYO16xuWNayA1idFSop39lAG6OCK68izDmlxjm4hHuepPFdTppb4XLnn9NdwqX/b9bgPOoO/9vrkjB
X-Exchange-RoutingPolicyChecked:
	Dor/wQbRFhWSUAXIr0Tupvai6TyzSAAC4wFaHB9e1/PnqOGWXp0ppJatm921IiYapBHvFGSF4EkhVuWxed5gF9m5+EVeU6vsFNix7+nX/WrSBVBGhDtUpgpJ6J5UZtydsj4AMgQM8W+WmghkkU/1nAcIG4Js1ZgQMOpt8E1b3zF63SKi2b9AwL9vgkN0nUW5Ookdhr8XSdkROcxUPIGCa9a/Q3R3C20eZNC8ms08D6XUNy3ZSYcpSxKgrdFFK9Dkr5u6Y7vkkqhvcto5HiwM66zevc0Izle6+I/FbQHGVIxlbIltuyX6F2qFYtpG4yCElBsetDG/ohT6A+NtLoecEA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 03:30:54.1808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebec6616-cdfd-46ef-30d5-08df0eebeba0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4540
X-Proofpoint-ORIG-GUID: OfPoLLrRaFg5NlTokMfd5mhxab77hvsP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAzNCBTYWx0ZWRfX8NHxnLKp9RRS
 ORysxoMMXVkVcbu7Dctphl1rWvERBAU9VaL9I3cQ5KRtoTA64LIvhUQllT7HawQwNbp2kXdLpsB
 LFIppQvkq2a6FvahzVzIH3fJnfjV06k=
X-Proofpoint-GUID: OfPoLLrRaFg5NlTokMfd5mhxab77hvsP
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa22472 cx=c_pps
 a=ucUdQIQ8V72PEv2waZrxmA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=m8ToADvmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=sozttTNsAAAA:8 a=B-mgoQtNYrljblGFZysA:9 a=QEXdDO2ut3YA:10
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAzNCBTYWx0ZWRfX2Up00oT8NSZM
 ibO1TsXCEyJLS93+GyogHPRbJP6HRGssTMzmOC1dg4eGYLPtcTUgx6PgU4l62e2lDZUS3Gyl0RK
 RWsVUY389GcJrEz+YzDkTMTdzUWAxe4SNrxLwUEhD5daWwejCrpt6zYFA8UFN0WFmB0fLS+PBkx
 d1vJR7SO0MAbJVYrS/gf1amQ6Cdel1xaKQLCPjQqUqipEdxtQQ7nkuEnXz0nsTzTqZaUyTs9cJp
 qTednS98m+nU/lxrOwkyS5T+d5DTU2TTteyBJ0ahKCHTMs+f7tH9nGkJOwrICaA4AB9eOv/uh7k
 wjX3pnUx33SWE6xFlVCsw9oeJYIQ6SFJn9UC3A0fPqdr9UvvrqdW+VIgxkU7yTPBsRoFyLTteZn
 szzZiBHgVsKcSiTNizVyKxeeuMHM0/M/a/Zr2RRM0f53w6J8PfoJViJ0c7P+Pd5zdhSi897ED93
 ZlUR9pz6j5zEi8a9YqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100034

Thanks Leonardo  for v2

On 9/9/2026 11:42 PM, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add a device tree overlay for the Toradex DSI to LVDS Adapter with the
> Toradex Capacitive Touch Display 10.1" LVDS V2. The adapter connects to the
> Aquila DSI_1 interface. It is based on the Texas Instruments SN65DSI84
> DSI-to-LVDS bridge and drives an Opto Logic SCX1001511GGC49 10.1" WXGA TFT
> LCD LVDS panel. Touch input is provided by an ILITEK ILI251x capacitive
> touch controller.
> 
> Link: https://developer.toradex.com/hardware/accessories/add-ons/dsi-lvds-adapter
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
> Changes in v2:
> - Add comment explaining the panel timings difference between this
>   overlay and the ones for the native LVDS interface (without the DSI to
>   LVDS bridge).
> - Add information in the hardware pin comments about which signals in
>   the DSI to LVDS bridge each pin connects to.
> - Add comment explaining why the rising edge is used on the TOUCH_INT#
>   signal.
> - Link to v1: https://lore.kernel.org/all/20260803173705.2268792-1-leoreis.costa@gmail.com/T/#
> ---

Acked-by: Udit Kumar <u-kumar1@ti.com>

>[..]
