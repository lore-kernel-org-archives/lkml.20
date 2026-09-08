Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7E059B68D;
	Tue,  8 Sep 2026 18:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891217; cv=fail; b=StSvRSdAp5iww8PdG+PP1eZ0LeqFwQ1+T/NE3z9vyLGSthNaUSuja3VJHAGAjMpYpdGYiPjYe6Sni3ddTaUlJgWNgEEQcdacUVWqOY++FPTAQmMZJp7CxFBVu1ac0qgJ33blDmeHOC8m6wbJRu6slUI6X/91/x35ydBKY0wFh5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891217; c=relaxed/simple;
	bh=uttqMzrtBz1f4QnDW1v5R+AbSqllp2EodxU2gPZwS7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gKnDPfDA0Ds+A1Hvl3d1ymebkgTC7wa92qLCSC45025NL325B8xp5RgQj+YgB/tEYSRgiTfzdXSSSI/1oc9cjNlLdZDvA8MdSybNjRjtJ3UjQlA97ExL766UmGrBMorTy0RcNXKr0a5SLUqVTb584y65E8we2rFegdnmJipeyN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=m/Z4JtBe; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pQ8Ju8fN; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="m/Z4JtBe";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pQ8Ju8fN"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688HOIoG2220460;
	Tue, 8 Sep 2026 13:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nZPQiTA10qQIsr1+FaXcoQBKlMR9SLEgynPg4YI/N
	Xc=; b=m/Z4JtBehTDvmvtAElG3PaBndus9CUaAWwJWOJbn/Za4LOTJUQpYG5ppm
	HKcIH+TKGFliZYucV/OFHwCm3yMWqa3hZMZAj8fmqKRqe4s8+0cpbJqhMgHRyFhD
	RVA4nPR/lesqCMRPxSdlyWdUyZDfyJH7eA+GTAeXkfC83TKvuLJZKJj/Rw/nX32Y
	K9V2buOT9uF6009JcE1ANWADkXuG+VU1c618c1ONej/167ySfELrVAMXc8MC7waE
	1iVH4WTIXh+/IuLS9wZ+1QGOadZI/T+XQ6Czp+tEh2TWz8AdHTdNrW9aIutmKZlg
	jnLuXvBcLAyqF5RowTo93SvxUIGwQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj940pstp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 13:13:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xt17e2cDJrMf5yAdL4zP/tj5d1FXQdYsAOdLW6oiLi6itYnUwW1aVBVE0giP2TWY5yOWXnZceM2y9rt53+tH8x9fKmkxjoQKfVpz8+PYgSm06DUSroKtskNchEXAHhGcqT92im5HqHxo+iSKBgkuIxL/9W3w0w6ParJuejAYpRjJmf070bKKufHOb2or5fdFbuilfgJ7OKrVagLsX1cbfZDrblHBZ+A5ztXaqG8ApKuen/HfIT0/eWTeJ9WhWXHd2JJ3es1y5B5Pj/3LhNNr+53pS/gtQGLITCG8LaJ8794j7MQx1QjckzJzho+lB9SLD5vxuk+fcgDqCg/9XtGafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZPQiTA10qQIsr1+FaXcoQBKlMR9SLEgynPg4YI/NXc=;
 b=QC8euqKHIDhhr1Dg2OqL4XFyls0wTE1jmYP8QstPoJsFWMqo5YjZGV3wH7II9q9eI49cH4EE8noEPil3UJtTlH1inNQjnJQQ92Emv99LYBaoF0enELYxiA9+bCvxRG082jOu6CkuyU8imtLEdG3cciFHjvhRqW9CWijGogbSjYHKQiWu3PNdg4dwkyV/XkW2X69CmAwYvYMQUqgiTqVjuRxB9ayL3w8BozAmkQKZL+C3CzHf6wr4A6OulQ9ydHPAj0xuMRD0zB3puACYN0DhdHCN69sz4Lavjimk7sbaj5E5hXw7Npiny1E5DaTluTw89/xBHm/fGmoI2ITuob6jsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZPQiTA10qQIsr1+FaXcoQBKlMR9SLEgynPg4YI/NXc=;
 b=pQ8Ju8fNc1qMIz+vK9d62Eh7d9xk1L3IqJBdNBcUN4z9hl6b+RsXUfynhnXfjEIXP14Bf9f1NPal5LWSSULOo8lCtVB9eczlR2CCqxYukO/bLF7yDUyTKlTCG9nBGsSkXjADj/ebeGGDJWmxpF416Yx7imsNUzaqvRzYji8fM1A=
Received: from MN2PR03CA0004.namprd03.prod.outlook.com (2603:10b6:208:23a::9)
 by DS3PR10MB997750.namprd10.prod.outlook.com (2603:10b6:8:347::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 18:13:25 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::d) by MN2PR03CA0004.outlook.office365.com
 (2603:10b6:208:23a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 18:13:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 18:13:24 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 13:13:08 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 13:13:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 13:13:08 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688ID8q12948711;
	Tue, 8 Sep 2026 13:13:08 -0500
Message-ID: <f99dff87-6fcb-4a19-ba3b-4d31e3835726@ti.com>
Date: Tue, 8 Sep 2026 13:13:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: dts: am654: Add 650ms power off delay for proper MMC
 power cycle
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260908170635.238775-1-jm@ti.com>
 <20260908171613.bpd6eo53cjtlrztr@macaw>
 <e8abc328-578e-48cb-a469-1e3edec6780a@ti.com>
 <20260908174934.pbbvtrfhlnjinipu@constable>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260908174934.pbbvtrfhlnjinipu@constable>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DS3PR10MB997750:EE_
X-MS-Office365-Filtering-Correlation-Id: 690848a5-814d-44c0-9878-08df0dd4dfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|10067099003|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Aur5/gs+sVnrhEnkWOOY83xWopJmY/JkVH12hCNN43PrLjz58/7OmPam/pzTBtqVJgnJdfEtDG80l3eK8r2QMD1IQi7lDN3HNLh7El3LjV3mdhmxIYXO2hkPy4Ik/DEpP5hxmG7YPeVr0EmcnV1HXsP6P+zLbC9NQ8f4lVaIDbH3fI89nhuv6MH+foxx8BHv4YP3+JqNGP0dFLG2XokZ0pnn54ME/r4HoZe4FbuxwVIoYF/uAPVyL+zy+WrlsBQEsP3WfXezo0ZqP9EoQuoumz+xQ6bYCsa9LzH7Y6PeX//Uc8wF+zCULdJudy1QpvbRhuW8GfUeeWYrG37Cte0HREZKhn6KsOEE1x99H1/1jojMWPFvoMD4UWJWEgzoh1soyrNKLuqw87TydLQju9nbJ6dzBGargl6RUVvyc41Sc+uFaOjxufB23lv7pkOgBfuHWy14CKpILLlzjJ9XpqrX6YL5ZXDUKQYtKFMqaJVMAzhNVWHYQUrlHayBNWVB7b2NSIfBesUyXrKcOXaV8tmcO3GNdhfH2MDYjJ5A9bRx6ugW1uo5FZSbeseMfhve3vZSVkVVfl6qvPYYCXO9m5cVAf9o9wx5ItMngYgJm6S546H2STk0jCsTtQcVB/q2vCW+5p6ACTPxycX+8GopI5wHrxjkksBsHF5YaPx6TTtMumnfrWREnw7axO1VkILbTavW3yfE5LWh0Z79jlQsKveSNw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(10067099003)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zSUsoNA6at1ycmRp+nM9dwdHbpb2QoBo8ZFRA7wWaLfJ26/TQZ0HBvbYzfv38GKXpRPvGfoMvPyZ3sicw8ZeSiB1noKymM9S3xU6ZQSdDApz7AVp0iolAzoI+6xxPEszLNXN70StB7XxCz706ySeZV2AgQTUJlcLx5Zwpm9FdV9fi/ourpgn81o5XrMXWWhPzirW0groGpskv9OKvmikf6iz8oq8otLp1syBvC1grMqrzouOBoxOgDyDk5yH95qH8tUO+oQtuKFyPkacM6w6ERJ05+ICG56pOVEuTIVOD/QUI1cNFET3E9kmVYhHd4KBHAydZ8dkdUDsApIQPvv35DK2v0vErxadkwiG9rFQZJj1DdF97aiURe8p57peHJnm8guL+nLBNAd3AYzSqHI0Q0dI+7SctRhB6cFwvt2gXoBYYeaXAjgYasc8aAw3a+EN
X-Exchange-RoutingPolicyChecked:
	sG7ARhET9OT6/lfFnZTFAR854Gt+QU727AyUoi+nlIMTejc9RvGTFR/oBw1NPJaLKKl1TebTd+aQQewjoSx4W3CEO6+/TtWBYoKJeHv9C2zB/5IgHv5ZH5eypXVItnVduOjDfxAMMoOxe+oBBzw6UOG6xneyljo8lMBxpAYmPnCkc+LiroXhUh/mvvwATXax7FqTQnhU9pzuGldOtHo2Rog9lkJJURGJIMWqQB6ZjolT5Psgft1/vZi7RIlMGr+j2aIKty7Sx2KD06gYYe/tekB5Eor6IUUt4bUmrz0x5PePOoWUUf2OceFo+r1qRzA+aL1FnyxJ8qmG5Yj/98DdrQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 18:13:24.6328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 690848a5-814d-44c0-9878-08df0dd4dfb7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997750
X-Proofpoint-ORIG-GUID: v6u0SWWZN8je3pMxrn8siRroIA1tBy8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5NyBTYWx0ZWRfX5PomuTQ+hgCC
 4VbqLOLeR4cMEv/2m/qOTYd1YT0d2zHBReOCyS+jbwpu6mnHZv3mHvHB9hB2w+AzsmsKDq7Z5IZ
 Deh7iNl1/m+eCRXQ8OlfXw9QeerCfa7SFck0qJcbANeKEfNSYTxHYYuYs+YDOlJIRPsOn3xsjZX
 NkeWGs7FN8c9Zd3acGAG4a7kqGepsqRVgjURxCyKjNWmT3emPIC3CZnElfUGotfhXFkqAUid/P8
 R88rHfoK5wzGFNF2IvUYFjWm87vuru5LHteOoUxPQoVetogLde/GeutSbZqgLiOG+fA+vpFC3ak
 qnyfwx+jrEN2Wuf9+l+/eXTynQNz8zOUgDkVzhQgyjeJMMEr9N4zLZjmBiH+1ZxB7yhprWng/XY
 79SEtZv3MktRvU1giCCfyv3YqB7FkiK8UuV+YDPABJrDz9YfCpk1+GEDMOQBiKexpb5gyXAPfLt
 ApwmxIAmkI+XNdEigWA==
X-Authority-Analysis: v=2.4 cv=UrNT8ewB c=1 sm=1 tr=0 ts=6aa05048 cx=c_pps
 a=kRgXGWC4h8N5Zk8PQP6WEw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=ojPeTAFbRUxHvCUH5WUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: v6u0SWWZN8je3pMxrn8siRroIA1tBy8v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5NyBTYWx0ZWRfXwAcU46ndrItp
 /9oVHKmA/6zBOQNPBbFWHOG0Y9TymiUZz1oTGA2LhnXnqDAVj522eUB91p7tCfTuz2szry+I4cB
 jgozsG3js7Bt4+h+WHnFi0lqjaTiuQo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080197

Hi Nishanth,

On 9/8/26 12:49, Nishanth Menon wrote:
> On 12:29-20260908, Judith Mendez wrote:
>> Hi Nishanth,
>>
>> On 9/8/26 12:16, Nishanth Menon wrote:
>>> On 12:06-20260908, Judith Mendez wrote:
>>>> The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
>>>> SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
>>>> power cycle. Measured discharge time on this board is ~632.97ms to
>>>> reach < 0.5V threshold.
>>>>
>>>> During boot, MMC power cycles between boot stages. Without power off
>>>> delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
>>>> from previous stages. When U-Boot initializes, card no longer asserts
>>>> S18A in ACMD41 response (already switched to 1.8V). Host misinterprets
>>>> card state and forces 1.8V anyway, falling into a bad state and causing
>>>> a boot failure.
>>>>
>>>> Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
>>>> during power cycles, allowing card to fully reset state between boot
>>>> stages.
>>>>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>
>>> Fixes ?
>>
>> Fix is really for u-boot, don't think I can point to a u-boot
>> commit here can I?
> 
> You'd face the same problem if you are starting from a different boot
> media and then enable MMC in linux kernel, right? what was described in
> the patch sounds like a discharge latency of the evm. This was missed in
> the original commit?
> 

Not exactly. The failure is only seen at u-boot specifically with
SD card boot. Very specifically due to the MMC driver in u-boot and
commit [0] which is not reverted since it is technically correct.
The commit just happened to expose our EVM's issue first. According to
the discussion, mirror Linux patch may be coming soon, which we are
now prepared for with this patch and [1].

[0] 
https://lore.kernel.org/u-boot/d17a810c-e2db-4a24-a37d-2d7e02466ce9@ti.com/
[1] https://lore.kernel.org/linux-mmc/20260806162202.657512-1-jm@ti.com/

~ Judith
