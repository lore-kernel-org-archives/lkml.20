Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096794CA79B;
	Thu,  3 Sep 2026 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466228; cv=fail; b=uxctL1qgSNrwyjMvY4mqAlVLh/IhgvZmUkvZIjAyLJptfx8PFM37c19zun9oTBjWphpxWo6k5JLI62HaeYJJrH8CHIQFbUkSn1eIkpl/V204EKg2OiAcZCw1GpcnF+LTRgR5it/EFEBg3lfMh+qRVrH36wXUdPoFqgSB5igcTYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466228; c=relaxed/simple;
	bh=ZL5Vnx3AE63AnVCFeyxo5M/x+5PdjKVSuL5CHo13QQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cxK8UEmC+kF67UlRnwObGThK2wxGv2/7LAbuE4BVxZBE/emux7JF64WHcU60NRrcSKhb8Hmy+O3tk3RF/5AjIw9HE/UkbKD2HD7jplhuuACUuFrHBr8teSFZIkgQ3VA7cUSDSnH9uGbgzayK/V2IHUHB9b6Dp08KC1bRKmotvbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XluPEZ68; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mhBV+xgR; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="XluPEZ68";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mhBV+xgR"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683JpELA321836;
	Thu, 3 Sep 2026 15:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=svtA8q/DfF687mwOjouzxG8MkweyvzRxIrb0Ez5Jf
	bc=; b=XluPEZ68QRkMaXkNJMR1GEMVdlBCMf+BbXbWRhUoEnViXy1lotY0Yeojz
	YigZ0Tmv9h9po51LeameCZJmQy0eVVx9SdJ3AcXweQvgkQ7Ml1hlAUVFKdmNNI84
	O4alwHJXL1BHxnpDq36ENB4FDTM75D49XziY2SXrxI8yDeCV+5oCaINr4RsC5XeH
	0WFiri6N2ARVEPkqitOs1UdrM7blj5wYA+gQKdWNJvzek5rQ3MrZj2nEld50nv1C
	3DDCaXuIk+2THymguIudvGQH3NyJtAA7BN1qHHkgkpqzmIvdGWL9kF6VDdlFfg90
	+t1ijvltdfdmuQmeZkccwcYIozUPA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv63py-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 15:10:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCoae8TQY/8kEj2biHgf3xGdqFiYZxJPjfHJML7y2oi5lvJZytrnes+WxQ33kveYgS+LBqRLb37RIKy+VT3yPoQ0draQTfngxgpAkJfEH3hfnoovGAUiu1ETbpiqOBeH1ZiOmik19p21BdlEWCnY5i/0tquEJfjupehOJWHgINX4ZQYLeY1aIwea54wiW6jqCChK2uP1BEsX1JE1YWwokATsLFb7O0C/tTz5fv4Dyi+4WfsBlU0qCW3f05ysNSmtCKHYQrCrsPiZI5hnf5ajRAkARcWoB/Htg8+87NFBeBND85rx8C/A3DfVKAI6WRxDRQ8Io7YMR4HppLSvGBalxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svtA8q/DfF687mwOjouzxG8MkweyvzRxIrb0Ez5Jfbc=;
 b=BhVd0KqTNjU1glqllRG5QceWMjdUA3mmpGFg4UoEgXPPkyvwF8nAHodUMGo6DC0BHvuGLNyLZjqWe0szxVDekSFJOS3BLJdjMpdgnawC3JY39a1lUr3ljaZIrggAXZv5jOW34p6eUBWGyLSrY3b7/qxBLzbQ0/f1sR/9kMiGwZtsrO2utCrxyGCNWfqCDYwtI77oKD88TrqNQ904zlPREkOws9M/pg9gcLru3sMsP41nyoMSiIGiqwPc5RXR1U7I2xSS404LTp6MsBCTqQ17OrEEoJmpu18b5WBeqP8TiUeY8eMhwTFuoaVBmrbHbbAv79VUIEI4fXEo68GQgh81ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svtA8q/DfF687mwOjouzxG8MkweyvzRxIrb0Ez5Jfbc=;
 b=mhBV+xgRVdumhC5zMRAI1oPCSG8vwVrRYMHSgZp1rLzk0qCRDZxdlgMgpzsvieWtk8cy/vRlSoh08x7qUu1+5meNPixjDVHc4zljQeoeU/osEp5lGH6eZ49/TayxoJ3eG7sZPmHAJKEhfSV+zqKwp2Yd2wc/JWjv134iyDpBgJY=
Received: from MW4PR03CA0327.namprd03.prod.outlook.com (2603:10b6:303:dd::32)
 by CH0PR10MB5002.namprd10.prod.outlook.com (2603:10b6:610:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.8; Thu, 3 Sep 2026
 20:10:09 +0000
Received: from BY1PEPF00026969.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::a6) by MW4PR03CA0327.outlook.office365.com
 (2603:10b6:303:dd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Thu, 3
 Sep 2026 20:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026969.mail.protection.outlook.com (10.167.244.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 20:10:08 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:09:44 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 15:09:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 15:09:44 -0500
Received: from [128.247.81.65] (uda0499903.dhcp.ti.com [128.247.81.65])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683K9iTB3185067;
	Thu, 3 Sep 2026 15:09:44 -0500
Message-ID: <3ee0f8db-b844-4148-b484-64bcb329824d@ti.com>
Date: Thu, 3 Sep 2026 15:09:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: ti: k3-j722s-evm: Switch audio codec
 clock from audio_refclk1 to external clock
To: Nishanth Menon <nm@ti.com>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Sen Wang <sen@ti.com>, Moteen Shah
	<m-shah@ti.com>
References: <20260804210558.1455777-1-j-mcarthur@ti.com>
 <20260903200040.yxufreslq3ahsx74@buddhist>
Content-Language: en-US
From: Jared McArthur <j-mcarthur@ti.com>
In-Reply-To: <20260903200040.yxufreslq3ahsx74@buddhist>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026969:EE_|CH0PR10MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c77f31b-f191-475d-6923-08df09f75a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|4143699003|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	iswbgTlyw1QlNH++UkkTPRkx2uR263SKhodJ1virCk65g809zTp2/TneWs1ivm8CL/N5JzK7zpJc75POfP9xKyfKR8de6AP+Q8KpOOgzeaybK2wvpGBVEZAmX8jwkRuflVexe45x3C0We7K0DB6G7Z5JfiI3hFsuBURZflorf2cP+YRQ3FKZEqMrY1tvJcctnoKEWsGAhmcKZhlmZVmytRzW/Ohzb4HYbEoz7pnbfAUDxdSMvktt3Ovk8DZcG1w0LbWRlKsYETo4AzA7Pi3WJwYxwA7/4Lyj9x8UTclBQsERfi7GeoEa2MinbFd1/T8HntJI+WakcCTU3S0FNb9jQ8nFE07q0L/xGHkTKIq0qsIgOYMXRLleirPwmIhqpD86zuRdvwBaGbacilFvGi8iXxc2NJ6v2XVgLJxTSJQEE7rc56abQGbrNhss4jZ8yWIxHuIgVhCMiM7FcFm4WznOpwNxnOvcNJU++X9+X5AAOw9P5JcgVAU9EWvIMrVQjxXx936Q0yltMP0r7pu9d+toxvLnDH8FZegDJAzdSUz8OqZzpEmArPMjodwGpg6snyC+KwBg4TVBdDm0fUDoUfwoLPLiU69rKamyjZiJxzzXonAuGHP1GxYvwB1jVgqSfKQaz+lN+jO0EbybJzrFo2sRPQQmEJht14le2UI7JtP1bqRXZZSB8En1JhHKyC58ggQQJ/GknGYqwFFjFSknMpX2IQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	alov/Y2BmMoZ53l/cTKk+9EDJ2B51wVaTwVw2HyXWlzCl8KL4N/seRwkLAeiNvFoDadElcFn39VTCqMHOcG80XHb1ckrMMChSK+fZ/h19zPDwCcRIpJLngAzGV/eny6ooEGV259ALo0rhLtM7DK2m7dYOFGUycmJe0ZRv/gLFXrBsQQVNq8T9Z4azVDxbklTVirPEWrvBAlcmJLv+D2K5tNWNYTuwcYocvbU27zLhxv1y/6c7OwK2/UcD/kmvmQLfyM37mdjv3DahzYodhsvKlFMWn/lB+Sl1wQ3sJcSs3NkD++YDa8Zt46C/rmLOn5OpEnPx3B69/Q5Xr5t2GtWpGz5WHT/fq8Ogn9iI9Djr7ySvYVRNBxCCiibaGnZPyR0USwkQKmJbbv2PEKl4z8xCDqS9lUrj8foWHSrdL3LXDhJswdTdvbhtnu28hntpMpa
X-Exchange-RoutingPolicyChecked:
	l9uHEU+0CcDxlF1ezkGWWysqjWY13NOJ1DYRlCDiM0Ol9E69r+UAAA6FRWtInAPKiomiI8kziI/02O8ZmM4S//7Cz5s59ZIdYOFi6Iq7v6M5N7abMuvibLUN29QUAdoM/DxSBIDBxeJY/QgHXf9FvRvsVWs0jRLJTOaWB+/MElu/1M2z0aXGpvqZ0W7JQXdj5OJBA1nTFdNpYH49Vdv6h2hVoEPpeLsAtOl2/aIR+4oTCnKr3oCv8lSsHn207ARpDKfTqtvk0nlLGa1ki+InvxRd76BRxTua6C+zOvFrZs5J48W75BY+MhB9QMLf+SuXX+xMqvu9NcwhqPAJkb38ug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 20:10:08.9358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c77f31b-f191-475d-6923-08df09f75a8d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026969.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5002
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE3NiBTYWx0ZWRfX9nV+H3Ikb8+n
 5VhyIr0YO9OSw2zdZU7F+JZX/w3cXj847ftq4ws9qi0NzhSokAWeeozudzwknWUL+tRMYaefBY4
 SfycSZMy4955Rn0sT1uclMevCB2wjcw=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a99d426 cx=c_pps
 a=WIVU+UPliRI2+OFOdf1Qsw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=ppTM4cNvFsq7fglAeiEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: SvD4n85Dqn0Ab6wU7JxJgOsOQ53THwij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE3NiBTYWx0ZWRfX5YhNHOU24Swn
 lehPAwPGwfdFEkpsJXpkQjYMGtrVhmKHbtWSHrS5m3vnyEIC6BYe1AUkgc3V22gL5cElGBkhmy4
 X7mSPKtzRXkAuE33m1Xf8V+Ovd6QZKo5Rq2FRgyHfwJ4sj79m96j6ogmfGyQ8Yx2uuUN8XOJtrm
 Vr6RaPzmaht57hHD+D/6htJUUIluMS1M4XEkPDEMsWdXndCKoaiE2gWX5cfzlWdGv2kiBZ8+3Qs
 GSAbN5j3jae3WMQmVkmck/mHFuUv/f3OCYXnWlnTYqXOi8eKEXHed4eXNZkaoKZynTTnaUD2g8p
 9IlPErBaZJB3OpswoX9ey0c0oYJEa0Ib+cQT3U60MuHlS4cmrE6CiL/MJSkFB2x53wZvIcpKfFS
 bERELlLXf/da2DnMzBIVCknJRwBrt+IIAG3vj4gqHRXUJWBN/0uCiYebI7T0CQfAG2vEO/VuEUa
 hawkPdXHhEcXl6Had9g==
X-Proofpoint-ORIG-GUID: SvD4n85Dqn0Ab6wU7JxJgOsOQ53THwij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030176

On 9/3/26 15:00, Nishanth Menon wrote:
> On 16:05-20260804, Jared McArthur wrote:
>> In revision PROC170E1 of the J722SXH01EVM [0], the audio codec's
>> (TLV320AIC3106IRGZT [1]) MCLK was provided by the AUDIO_EXT_REFCLK1
>> (96MHz). Revisions PROC170E2 and later switched the MCLK's source
>> to an external LMK6CE012288CDLFT [2] oscillator (12.288MHz). The
>> PROC170E1 revision of the board is not publicly available.
>>
>> Fix the audio codec's clock by creating a new fixed clock node with
>> a frequency of 12.288MHz, and switch the audio codec's clock from
>> the audio_refclk1 to the new fixed clock. Remove pinmuxing and clock
>> muxing for the audio_refclk1.
>>
>> [0] https://www.ti.com/lit/zip/SPRR495
>> [1] https://www.ti.com/lit/gpn/TLV320AIC3106
>> [2] https://www.ti.com/lit/gpn/lmk6c
>>
> 
> Do we need:
> Fixes: 3a36c535dfd2 ("arm64: dts: ti: k3-j722s-evm: Enable analog audio support")
> 
> ?
> 

Thank you for the comment.

I can add the fixes tag. I was unsure about adding it originally,
because the commit did work for the original revision. To me,
it's debatable whether the commit introduced a bug, because the
bug is due to a hardware change.

-- 
Best,
Jared McArthur

