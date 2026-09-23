Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA5329E55
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168660; cv=fail; b=okFqPBD7koqWkBTzxEtktfXXLcnWlCKgRAW9sYT2uOHAG1/ieYwjehhZI00zdvilaZDz+ljqNjyL1Ga4sOKB7+2ULqO1BHuUhNTt8tgjElS8LJuh64IFh0BDOHEIyzMl0Ky9/JrlZZ8UlZdleFbn5lpCti4rBTTaH5zbtO/SIoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168660; c=relaxed/simple;
	bh=Y0N/dm13r/eCjRpS2YrJPXAX8baEvlvZGexCf0hmwT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m6134MZNYxh+S7I55v/nFkzFP9f0Z8ajXe0M7yTSEMQPZKI6FQuDDGOiNtrncHbLAZXzROxQOYrCt1fP82voHmHIj689iaKVQAbIF3XjSYPbB7Idb1sRDmpDiz4FKZ/W6I/q0wa22i4Eb9RvZtLgJL8b34CU3ZyDAYcME6mJA0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=SvVu6SZJ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=a52slzO0; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="SvVu6SZJ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a52slzO0"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68N8NKCf1611932;
	Wed, 23 Sep 2026 08:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=f0qmYubF5OdLr7LCf9Vlw2hfhLZFldczMSa1lkoUI
	3g=; b=SvVu6SZJ5tBJfx57QB20eHlPOuBd15GzOKsvDg0I0Cy/55pasqfblndyc
	46yJrV5n4dnx41mD6K8p1Vx/EGNAXuUGaFzJLg3lJ6PMZp413wNlN5ez3TpDxMjL
	6ymOWF9IRidf22Ej9FB6Wsorv4M3c/JRkJRd1BZp6zbQwRCbnax0w0xR0psZnYWW
	33KAtwt8BVU5HtTCYyRRo8hLRNvVKm5slmG74utaz3xThBcKAZ/3SWIcKXifSYB/
	+d40Frzc1QFaxVew6LlP0h7tkTqu6m3DiiqZbjy9shhGajUoOUail/eFuMp6gCsz
	w8BYa+gfCXesVEW8Dmyla5ffh47+A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010005.outbound.protection.outlook.com [52.101.193.5])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gvb77sftb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:04:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYGTl0YD9gj3HKljm5k5zSPCOhzGcMaj2At2cDptnGyAdsOtM7DOx5KmtUUGo9aECCYABRIcs9bdMdMVbQyESQPVX72spgDrIkbrN1P7+60w0oMv4djQNj7QP0cuKjO4Ewx25al+9UdUaB5W/LPyN6INju3/nmsCARUJJlPKvi+IN+A/164c0IqmeWatNKn3ObUc/dcP9RjNuiBwwT5uCBhRhBnPvzkyyQY4f5dJeyYVH0kdMHyWhQq25UvDAApZQxkSWx4jOTc9uvK3LgSp8NYyliTE7mLhkexxXWBpJbk0ExWKt4SH/eKiJ+B7+eBbXWvlbhv+RDnwRJlYzupgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0qmYubF5OdLr7LCf9Vlw2hfhLZFldczMSa1lkoUI3g=;
 b=B7trpsuMshg5IJLspddHNLb6RnSfhMAIHlK8ZWZwuL4EGeWaQFm9Rl1Otr9Diagi1vgMKNJYP2bZZWA/JFSVbTqYzJKAvGJzJzeIGrIbBwl/ExPY10XlzPaZf8CVmLOi8l3ydzjtNYo0DzjyTRv6f3T2QE5GV4npA8NmqD96hC//sMvsTGTI9ep/+W6yDlgpz06jdImZU1pP/aqVtTOMQCv3KfXKkJZcJkKR3qtd0dVGlWhHBfcIb0DP2gi5bbUGpkgJZa9dmfFp9vxFROmPCErmBcpZSRk4sUEDXtmsk9cqPHOql8Qdw603p23F1/DYHWKvXZRYU2Fv7zac4Ec5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0qmYubF5OdLr7LCf9Vlw2hfhLZFldczMSa1lkoUI3g=;
 b=a52slzO0wFN6K0N+e812fJnpV4jDNyTXlOX9xWMiwRw/UP9UB8Gt5G4HSyCPwio50a8QUZc15+pRSTG5rdjIlAsXvnDz0Gldu6j0r4LEUrR+oC9i7JBrpdXL2a8ZrpQoZMCfLURvD1kL+ttSPDYFdgSMscFNvzNtMi6yI2Hzhjs=
Received: from MN2PR20CA0054.namprd20.prod.outlook.com (2603:10b6:208:235::23)
 by IA0PR10MB6819.namprd10.prod.outlook.com (2603:10b6:208:438::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.5; Wed, 23 Sep
 2026 13:04:09 +0000
Received: from BN7PEPF000000A6.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::28) by MN2PR20CA0054.outlook.office365.com
 (2603:10b6:208:235::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 13:04:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF000000A6.mail.protection.outlook.com (10.167.245.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 13:04:06 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 08:03:19 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 08:03:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 08:03:19 -0500
Received: from [10.249.135.178] ([10.249.135.178])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68ND3F5i2961458;
	Wed, 23 Sep 2026 08:03:16 -0500
Message-ID: <40b6706d-fa68-43d3-8abd-bd8b70e4cb89@ti.com>
Date: Wed, 23 Sep 2026 18:33:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: ti: k3-ringacc: Fix DMA ring initialization
 kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>, Nishanth Menon <nm@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC: Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi
	<peter.ujfalusi@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
References: <20260923061658.20140-1-kmehltretter@gmail.com>
 <20260923061658.20140-2-kmehltretter@gmail.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260923061658.20140-2-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A6:EE_|IA0PR10MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 8591745d-3727-42e8-09f9-08df1973264b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	wEVhTAYrElFLghn+QSDjim+QHtpcWzxGZn3k1jXGkLwkaZPRRrxzeJJ67DdNZMr29b/npyOkDCRx8Uo6bIJPoQiZaiIsfO7sIcD63fd1A7Pvo/W+qq9bIdTCyl9YnMnE9boYiunGcqm3Afi0h98PTsuDzwBO2b4OZxCdBnJT+1ayy6KoSz20F7w0dSrpRDniO09xJj1D7Cfp27aMmEhYDlbPK25B5Kvwe7w4J8v0jSl/UA1M1odDHR7PU9T01Y6BPnjsiBpv7TwFLu62UxSxyZlNL1SwZ3iNsez5ypX6aNJnDnLxHQJoV48ub6JEictty07UkCs1vo9nm0jX+Li0vS4aJPszoQu6I+JR60vUK7qDp4BIwCxvj8YyLg6HkHWwKJzRHgn8lGUyOfhpavO/NBTKUi7BzPYCrmKEtkDoZRmFQsEHcodFm8A0edWI/U7ebk6FmCagbk98WtspCx26gd36n9gse9KpT0ONyACFnI/hHDoyylDxYj+fJnrPkq7uyaxhgsgs6lLnnyGiuIogmD4kaPQlVlpeyhbXIhrD4noWtY44ODoh+EwvIKp9Ek3Qz+AzY5A5HpM3KeNuFs9ZUUzjBgIKvN1Xgecz/jop0iDgywisrtYJyvoJZcavSkL6cqaU5H8tvSPOST4KT1MEo0Za5LB+05z/SAjmp7/wSXg=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H22Qh/Qiv2eCRobCalmrNZPFjRtr/hv6PaevMOMdFCS1WrAP08+Xys3fqBFD43/Wusqj/ehXeR3/Ekwd2OYRno6Ffwq/jKj4LxSznH6tdViHcLHOs6fGy/tIzlLjchrbJeni452mf32jnayWFztmUDwhwQukX9hPwJqfLybTSITPCxyGkOeqU7ITk/gt+bnNnLzqpcMpyqRE429kUET6bS4gJQt6mz19YVlJLMMM4Fp+O/j05SHz1Vq3TsCtaQwnhXFsHXdwJbvXMG66IH8oCFjaQ78H5uFlvipwzsTDul/QemfIbuE7E3uE5HRcELCHjCwAUJr0MVxxVs/HuSA4AWLSTmQSdLG1XmCvROAcZ8dNcIc9sFDhYvL1LO3l9/MvqeaXejqs28Hr+SMbeie+JMffLnD/jJ3NzRxZBpl1pD2kcMWlEc1CtJI9WVJelCyU
X-Exchange-RoutingPolicyChecked:
	JQ6AWiH3E+NYqSF6elIvEIQt3VyCRxtuCFVWjvHOJuSF5yXZsqRYvWe7g9DwQhdrJZZ3wzkfpbFKJpBc0/aU9BRD+jHRe3UCYykD2fsIsbkUZKcjIRZFn3MmiiQU8PjuGknxB6PdZGFPrOC0AjnTWiOCxBD6hHLYqZ8jvPv0VlA4Nqx/lYSGJusg33/zyW1m0WWZXNq92EAdKFhXCPfZJ/AAYp6vgCxcYAcIdalhlX+J9S4p25YEHX7RusHoL1yJHYUSPy4k3DyQvCcW+hrRz1glw4w8sbOyEP5Csmki2+GLNAdZ+B9NhWVWbegzlv/VtX2gE8e39N144I3ive+duA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:04:06.3046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8591745d-3727-42e8-09f9-08df1973264b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6819
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX1/Y+it1FkQgk
 Z5zv38+9CdbARJyhphJ6RzLjDtZiHLvx5qGR48C15CgufW6s3IeU0UyBJuVi31ZqW93Rdtx9boU
 jpMCvN8vZd6cXOeMq6PfBfzAwTmNQPfB/bAIDHM5KbepStBORrShv2A92gQ3vrou2ezCdk+ISDh
 p+bEgtI437GB1Qx8No1FlJEq9+TeIm7Y8YBlI32+qSVQ94hNb9PwEDXS2vtTHFkWUAEmefvV2nL
 DtMdfgCdm7/q5b1VVelt7N4UdcrzSxPxDhalFMN56+3fMu2QRIRbnYWQyfVWFCrtkdqq9DLX0Zq
 Omgh46HvZoXPJsvld4EMv2YmDRK72a2eKTDWyGewzhBTcfSIdf2TX9o5Ll74eTfISqiQk5S+/hk
 foJ7EfzerW+r736iuKL69/Z0h4wased8rKkuXudQyu7+9J5drJVqg51nQIlcODYOLkg7V/9pjrU
 8X/iltGyq+r4n0U9Tyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX1bNCy0+AG9AW
 hOKox8etmbeI5ZsY/hEL6Yg3K/ixDyRfSThHbRViVv4Tnpy3ftso07DVES8QAbpjeKrSI7ySmU1
 HemLGDcCEgU33uB4tlloN3len9CFj0Y=
X-Proofpoint-GUID: 6bq6vaeGijii3OD7EzTf9XHaO7V67Tex
X-Proofpoint-ORIG-GUID: 6bq6vaeGijii3OD7EzTf9XHaO7V67Tex
X-Authority-Analysis: v=2.4 cv=cPt1IVeN c=1 sm=1 tr=0 ts=6ab3ce4c cx=c_pps
 a=v0elvT+g34jhj2ItdigShQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=sozttTNsAAAA:8
 a=zHeEaGkxK0QNAutOGoIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230051



On 9/23/2026 11:46 AM, Karl Mehltretter wrote:
> The heading for k3_ringacc_init_data repeats struct, so kernel-doc
> cannot match it to the declaration. Its three fields are also missing
> descriptions.
> 
> Use the structure name and describe the firmware handle, device ID,
> and total number of available rings used during DMA ring initialization.
> 
> Fixes: d782298c6f6b ("soc: ti: k3-ringacc: add AM64 DMA rings support.")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> 
> Notes (ti-ringacc-v2):
>     Changes in v2:
>     - Describe num_rings as the total number of available rings in the
>       comment and commit message, as pointed out by Udit Kumar.
>     
>     Patch 1 is unchanged.
>     
>     v1: https://lore.kernel.org/r/20260919163721.89044-1-kmehltretter@gmail.com/
> 
>  include/linux/soc/ti/k3-ringacc.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
> index 2de6031b9424..7b7fc237c08f 100644
> --- a/include/linux/soc/ti/k3-ringacc.h
> +++ b/include/linux/soc/ti/k3-ringacc.h
> @@ -254,7 +254,10 @@ u32 k3_ringacc_get_tisci_dev_id(struct k3_ring *ring);
>  struct ti_sci_handle;
>  
>  /**
> - * struct struct k3_ringacc_init_data - Initialization data for DMA rings
> + * struct k3_ringacc_init_data - Initialization data for DMA rings
> + * @tisci: TI SCI firmware handle
> + * @tisci_dev_id: TI SCI device ID of the DMA controller
> + * @num_rings: Total number of available rings
>   */

Reviewed-by: Udit Kumar <u-kumar1@ti.com>

>  struct k3_ringacc_init_data {
>  	const struct ti_sci_handle *tisci;

