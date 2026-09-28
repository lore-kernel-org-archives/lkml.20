Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047EE4B95C1;
	Mon, 28 Sep 2026 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790601901; cv=fail; b=Ehn6Wlf35nmwiqumH1/nYE749CJ5kWvkvs2ESiwxJozCji5DiP4H7W0o0iQpX5oxSbJtWxgRJA+ll9Y47xghnA0jtnBCjlO3tQLOtt9eemlulkxDs1yLnzB2AYVaNlQmB2vp9xqItD6cBOiW+DV3s3JSAKC8ScESJ1n/F/QN9Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790601901; c=relaxed/simple;
	bh=Y4trrTwXBPqMBrUQU5mGZHu2DEr1043shARVHQJ96vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OAU3G7xbzzmTllJKsSsGMljQw8LQeBGBBbRMVPqph83OcHUmx8z9FcTyP8ywkDobCOD3LukyMDdyiQQpe2X0OTY54Dd3PglziW5Jmw+IML9mrLYmR/urXbHmPiC3VCcGzLUfkjAidAQxbJaKcMCK16vk2jX31vIDLqUBFXUbccw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=AaDNSWvz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uRUQX8cp; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="AaDNSWvz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uRUQX8cp"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBBNUa1341314;
	Mon, 28 Sep 2026 08:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Cs/BvGB9UkZL8Ld1I7DJ2gidFwYGRVOS5GNoUU09k
	ek=; b=AaDNSWvzkBHEJPo8b0pztwTjUpqncJ+jYtX0vhOfWZE4gpRo2yolhp7Yb
	xrxmruzacyfol4PFoTkyZ++oz5zexp4PD3/nVlC49sBTr2bpJ4YCeaUMZ0pb9DKK
	BQ42EVl2Fr3Tv2NjnBV1n+V0EKdcbFe6jLfVCsQDY5vV0w5gdJnGWt2mD0ye+lFG
	LA3xLwbtW/IQNlRFC2iwZFJN0M1NDiUogAso8cTBgoHA/+/4lnZn5PRdHsG35Xis
	5IYb/HgxC6zrCgj3RxmDoiIgP63bpDrL8iaO4jLu42KCl0DZAWqrgWrzjr4/CEAt
	BeVtCoFbudydCp16PzItlUkSdyD4w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxw6nx6kr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 08:24:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHAYVgCsVAnzCoSSeEgfpG7sfATCXcNItCcLl8pUU8lg+7wkV8fmOUkBrfraOp5ZoHZf76Hp1RrbrlRFaTorVwD8hmZRQCBQ1vfoB0N5B97Jj6ANhnwSv4Y+gpXgRdDLQfO06Am+Vpuvf0ydCQruH1f+OSPaalbdzGd4FSk0dYItkH9bWsirMuHE09slF6RvIBtCXS11ck0UtzvC12p/aI21+qm+UUoEQZj3ktIexGGm7G25Ne6T0pG67B2FMYTDCLlAa4c3/Jac6+BKvi5ogdH4raxbcPQJGvz1xQKTIIM3mK1CK5xMVr47wqWQPAUic1/26eeKZBUik1HAZaE26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cs/BvGB9UkZL8Ld1I7DJ2gidFwYGRVOS5GNoUU09kek=;
 b=SORplnLA53sQ2xaPHAZh6ACKOsS7TItkbCQe0q/dZd6CDXpa2c4o92WyL3Xd48x/zvAqqz5QagIIT2hpSxyMQu0L/rjCwBd4GVwDtOgEqPORpvdvvw10/338MaiaQNRSpWHqrnNHiq8Yfgs943dN8wJyN+uPeT34pG27IqfWS9WQXxUB0aLXdmTvzDIAUo891ivJvMCEid/f3lvRjxYqwHvy5Zb0CZVBVxYDp7T7VTfRli1kn7ic125ODJA0xD03w6fElr1KxkRh0HNamDvIux/0kinTNq5UmQh++wDovne31IMR8pyR0EQLJsLoA5wO8OeyKZRAWewYRj6ohOA9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cs/BvGB9UkZL8Ld1I7DJ2gidFwYGRVOS5GNoUU09kek=;
 b=uRUQX8cpT8BizBE5imy4nt88HAQGW21T8ggc3k8USwN44Tp4hRc6QDlxLgzl9VroUUE3W4MOe7ytGFE+qyVIhetrl1/c3r6iDvOjXqKLIPK4asNVa4ZUTHwjgDNHqTkWUIM2NtPn3KdpL1owmMQm+qcr338o2fsw8G+5ylgMkg4=
Received: from BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::7)
 by SJ0PR10MB4768.namprd10.prod.outlook.com (2603:10b6:a03:2d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 13:24:49 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::30) by BY1P220CA0020.outlook.office365.com
 (2603:10b6:a03:5c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 13:24:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 13:24:49 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 08:24:22 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 08:24:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 08:24:22 -0500
Received: from [10.24.51.87] (devarsh-precision-tower-3620.dhcp.ti.com [10.24.51.87])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SDOJc73212014;
	Mon, 28 Sep 2026 08:24:20 -0500
Message-ID: <3d2aa77c-66d3-4ea3-9bc1-34aa14507d01@ti.com>
Date: Mon, 28 Sep 2026 18:54:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: imagination: e5010: Enable autosuspend for
 runtime PM
To: Brandon Brnich <b-brnich@ti.com>, <mchehab@kernel.org>,
        <hverkuil@kernel.org>, <sebastian.fricke@collabora.com>,
        <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260831213231.2125544-1-b-brnich@ti.com>
 <20260831213231.2125544-5-b-brnich@ti.com>
 <b6994778-7e69-435d-9f41-e46795397726@ti.com>
 <077ed9e4-51f5-46c1-8a9d-eb3c4d945c9e@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <077ed9e4-51f5-46c1-8a9d-eb3c4d945c9e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|SJ0PR10MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcab8a0-984a-4c54-4e06-08df1d63df71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|4143699003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	EEVPfEZpMmwtRq1N1PaKxFxpB5DUjnCb2jqpZkZIndPM20oFkrjF391J8qO3NMW0uLrCZwYCl2NsVW81DwnVdr1n79Dyijx58m0QNUc1O8hV8WpUSL14YFDEp5ym79YCnMDGHpIc0j4rv9KQT0Kwuxc6QsKsAh2vgxEOlueQ3csrVi3ZMtZnXFy/H4MpxfXq/KduB4633HvIKydqBRNzztET7mUsDQY+JA0d5U6HIEafOW/OTOtvCSQjtgxno5dZb2bInwYm8vogeR1otj7MBFqtycQZdBhlc1sAAHIBZGvddZSoK8ObVdRKMKVUiSDgWXsZDunmkEB8TltSO0BVdmcgJID8pwARUev8sSfIfpfZcARlhsrbaoEgKmh780+11jyHdkLCmtGRxdEXhL20x+NPvxpdkpIpEjTLuU4ZbL3XP+6ZexLsXkrSSz3SVvSnoUuXiL111o6pQefgZgllpFKV8ukXi2fDvk4F0rCog2+Y3LUal5SqeeYnLxBQxMOpAy6pJ26lzzlZc70VnIqjWJo+JHQAiT2J7UtCQuRHHqSCZudh/N8hIcERPHsLvyuqGfW2Df2r2UzkXOvktL+uZEdKqs1+0FgA4wCfqDWsP04ybkQrHp9ke0jo1kxf69og7rZaA6UYUBxWkx0e3uzxzAqutkaqHnTyLhw5q59S+pHyAI+dA9aWVHiEcjV1ah8wjxEiQkjvgFVL8C4wW7YJmQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oxQYq63WXsQZELHoXlpP5goSk0h9SCzfIstTY1Q4FI03D1zsKLaXH/FHM4ZeW2VeB+NWFbNdeE6o/RlxHvi0lX2zz0AG201cfH9xXAjvP17Up7hUEOrvpPj8I68d0wAsueJnfpyEclenTDFE1kSiKs8vzR2p2U6TDk7YqKIA/gOunVT+ye6Obxwh9lGYRHTqEuIPWkDd0LiJ3x7YsQadoyM6XlIZCJcsOjA0FhjcFDYtVIMvyQfhleiL9zB+Lv+VMzUX0Ne8nmKFhw2yOc41vdB0WEAo1KvHrHmA2wCTfIk7klVt9Q2avkLTczlDQITtVXQonwbl2xrSeRRs+AgTDBJIueyQqOtmoHiLbYx9lDYqV6bXaXaqMA1Gre1aNtGmDY01yKLoZuoX61hYbBt3fHb8SDtB4eqvBtGu2A2i33oXmbPhBiZoaI9AJDEZUulC
X-Exchange-RoutingPolicyChecked:
	UpUG+jFpi5JHlit9pah4aFRIGTgL5Q6fa5/7PWD1kV3SZG3Iu9CCRc6W2WLRwe6N5ckMaQJZ36Q8leooVM7pzrwtnoBT+QC8Wzd25gK0yZSul892WEZRAGqbtqcvFb8KRLQO4nIayPCngXZByRb3ikBm0vvDNc8/zJsc2MXMAQVOMGhMLHM+R7dfkG2qNM/KdTvlrorWrq8mHuCWW7USurAheq3Vq6Ewo1qdth0k7JyWuyMs1wADno7Fkh+LqdSuCrbZjFjYzJ/g45A6oIMCdYBOkq/Cys4KWD4oedcyrP43oXv6+32ALLPUXzy3EOAtYm7iYtCi6DzcIjr9E8c6rw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 13:24:49.6284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcab8a0-984a-4c54-4e06-08df1d63df71
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4768
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MyBTYWx0ZWRfXwC4EcdCFiP6O
 qeRkTvjvMgHw2IW6jdOHrdIQ3kLgLBB/vpnfIf+eMr2znCz0GtdKzvpAE7uJVFu7uduOzNK13ID
 n+bq1qEVBav35vuFKAoPvg6gFPznuck=
X-Authority-Analysis: v=2.4 cv=dbkVTnXe c=1 sm=1 tr=0 ts=6aba6aa5 cx=c_pps
 a=fVVZRgaqDuj868rfKEvgUg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=snmTj8jLnZ3jX6kwngEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wInIuH2RdBNpeHAZf4sjD9O4XN2hz7Lu
X-Proofpoint-GUID: wInIuH2RdBNpeHAZf4sjD9O4XN2hz7Lu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MyBTYWx0ZWRfX74dZFGBkbYYX
 RlohMNS7lFu6X9IRZUf+cHnGpM4YJPhXmiLmPR4/w59lvx6erPgx83cBVpCJFUkUomZ5IQebeZ5
 FnV2vhFxpe1E/IVKMtsN2gq2Y8lhxKEhC9Zw6MeOcQTGULyzDwqn2wYDFuGBeMl2JtBbTk1aa4s
 sZOaI6AH9O/i31Zc4OZltZcCO6p26Hk/JSeoDn08gFrmGiW/fProSHtVEE6qy62XPS9m+YbYoAG
 ur94GenqidCGqNms0VSPy/VOFaMz3Z58uV1q6I/ZrUCchC+WPn4EyjsN/BxIFSrvjq6skltpVcZ
 R1zje/QWppeCDdGmTm9Tai/LkGErBJnjd/DTaZtobI5s7goMbGgCtrcvHMmOtqAuie4oIi5krL9
 VzsD8dL/UD4SvCcuQ9xV/eFfxRyrfMLSgBrCVMwuNKBxx/OB/mKN1qLnr0dYrXAliTgcCnOi5QP
 lYuHoG4AvO9ylXZJsGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280053

Hi Brandon,

On 25/09/26 00:55, Brandon Brnich wrote:
> Hi Devarsh,
> 
> Thanks for the review.
> 
> On 9/18/26 10:55, Devarsh Thakkar wrote:
>> Hi Brandon,
>>
>> Thanks for the patch.
>>
>> On 01/09/26 03:02, Brandon Brnich wrote:
>>> Current implementation only has one call to turn the device on -
>>> start_streaming. This can waste power of device as the device can be in
>>> STREAM_ON state, but no buffers are actually being submitted.
>>>
>>> Need to set last_context_run to NULL in resume hook. This will trigger
>>> QP value updates during next call to device_run.
>>>
>>> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
>>> ---
>>>   .../platform/imagination/e5010-jpeg-enc.c     | 41 ++++++++++---------
>>>   1 file changed, 21 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/ 
>>> drivers/media/platform/imagination/e5010-jpeg-enc.c
>>> index 488f5d7e4c9d5..79347014562bd 100644
>>> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
>>> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
>>> @@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
>>>       v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>>>       dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
>>> +    pm_runtime_put_autosuspend(e5010->dev);
>>>   job_unlock:
>>>       spin_unlock(&e5010->hw_lock);
>>> @@ -1105,6 +1106,11 @@ static int e5010_probe(struct platform_device 
>>> *pdev)
>>>           goto fail_after_video_register_device;
>>>       }
>>> +    ret = e5010_init_device(e5010);
>>> +    if (ret) {
>>> +        dev_err_probe(dev, ret, "failed to init device\n");
>>> +        goto fail_after_clock_enable;
>>> +    }
>>
>>
>> I think we already do e5010_init_device(e5010) in runtime_resume,
>>
>> I understand your goal here is to handle for scenario where PM is not 
>> enabled but it's kind of duplication for the scenario where PM is 
>> enabled already. I would suggest to wrap this (and also the clk_enable 
>> from previous patch) with a check :
>>
>> I think in probe itself have a check :
>>
>> if (!pm_runtime_enabled(dev)) {
>>
>> // do clock enable
>> // do init device
>>
>> }
> 
> I will update v5 to move this check to after pm_runtime_enable is made.
> 
>>
>>
>>>       ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
>>>       if (ret) {
>>> @@ -1112,7 +1118,11 @@ static int e5010_probe(struct platform_device 
>>> *pdev)
>>>           goto fail_after_clock_enable;
>>>       }
>>> +    pm_runtime_set_autosuspend_delay(dev, 100);
>>
>> Better to use a macro for the timeout delay.
> 
> Adding a macro. Do you see any issues with the delay period or is 100ms 
> sufficient?
> 
>>
>>> +    pm_runtime_use_autosuspend(dev);
>>> +    pm_runtime_set_active(dev);
>>>       pm_runtime_enable(dev);
>>> +    pm_runtime_idle(dev);
> 
> If I add the conditional for enabling clock and doing init_device, then 
> I will remove the set_active and runtime_idle calls. 

Yes basically, we don't power on the device and clock on probe. We only 
do it when application actually needs the hardware to be ON.

My goal here was to
> cover the case where pm was enabled at kernel level and we had just set 
> clock to enabled state. With the conditional you are suggesting it 
> should just be:
> 
> pm_runtime_set_autosuspend_delay
> pm_runtime_use_autosuspend
> pm_runtime_enable
> 
> if (!pm_runtime_enabled(dev)) {
>      ...
> }
> 
> 
> 
>>>       v4l2_info(&e5010->v4l2_dev, "Device registered as /dev/video%d\n",
>>>             e5010->vdev->num);
>>> @@ -1299,31 +1309,13 @@ static int e5010_encoder_cmd(struct file 
>>> *file, void *priv,
>>>   static int e5010_start_streaming(struct vb2_queue *q, unsigned int 
>>> count)
>>>   {
>>>       struct e5010_context *ctx = vb2_get_drv_priv(q);
>>> -    int ret;
>>>       struct e5010_q_data *queue = get_queue(ctx, q->type);
>>>       v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
>>>       queue->sequence = 0;
>>> -    ret = pm_runtime_resume_and_get(ctx->e5010->dev);
>>> -    if (ret < 0) {
>>> -        v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
>>> -        goto fail;
>>> -    }
>>> -
>>> -    ret = e5010_init_device(ctx->e5010);
>>> -    if (ret) {
>>> -        v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 
>>> device\n");
>>> -        goto fail;
>>> -    }
>>> -
>>>       return 0;
>>> -
>>> -fail:
>>> -    e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
>>> -
>>> -    return ret;
>>>   }
>>>   static void e5010_stop_streaming(struct vb2_queue *q)
>>> @@ -1339,8 +1331,6 @@ static void e5010_stop_streaming(struct 
>>> vb2_queue *q)
>>>           v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
>>>           v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>>>       }
>>> -
>>> -    pm_runtime_put_sync(ctx->e5010->dev);
>>>   }
>>>   static void e5010_device_run(void *priv)
>>> @@ -1353,7 +1343,15 @@ static void e5010_device_run(void *priv)
>>>       unsigned long flags;
>>>       int num_planes = ctx->out_queue.fmt->num_planes;
>>> +    ret = pm_runtime_resume_and_get(e5010->dev);
>>
>>> +    if (ret < 0) {
>>> +        dev_err(e5010->dev, "Device failed to turn on\n");
>>> +        v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>>
>> You also need to remove buffers from queue and return back as 
>> VB2_BUF_ERROR I think you should do this after the initial check in 
>> driver, something like below should work :
>>
>>      if (!s_vb || !d_vb) {
>>          /* Buffers aren't even ready; end the job immediately without 
>> touching power */
>>          v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>>          return;
>>      }
>>
>>      ret = pm_runtime_resume_and_get(e5010->dev);
>>      if (ret < 0) {
>>          dev_err(e5010->dev, "Device failed to turn on\n");
>>          /* Jump directly to the clean-up path that skips unlocking 
>> the unheld spinlock */
>>          goto device_turn_on_fail;
>>      }
>>
>>      spin_lock_irqsave(&e5010->hw_lock, flags);
>>
>> ...
>> ...
>>
>> device_busy_err:
>>      e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
>>      spin_unlock_irqrestore(&e5010->hw_lock, flags);
>>
>> device_turn_on_fail:
>>      pm_runtime_put_autosuspend(e5010->dev);
>>      if (s_vb) {
>>          v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
>>          v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
>>      }
>>
>>      if (d_vb) {
>>          v4l2_m2m_dst_buf_remove_by_buf(ctx->fh.m2m_ctx, d_vb);
>>          /* Payload set to 1 since 0 payload can trigger EOS */
>>          vb2_set_plane_payload(&d_vb->vb2_buf, 0, 1);
>>          v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
>>      }
>>      v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
> 
> Agreed with above code block and I add this in v5 of the series.
> 

Thanks, also in v5 please put up a summary and changelong in the cover 
letter for reference.

Regards
Devarsh

> Best,
> Brandon
> 
>>
>> Regards
>> Devarsh
> 
> 

