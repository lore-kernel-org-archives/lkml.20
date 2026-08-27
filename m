Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349A13F107D;
	Thu, 27 Aug 2026 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867855; cv=fail; b=Ccxkb17YmVFkKuGnFozm0nAPuPX3JTzRlTTMuUFHTa/sExXUfQZ3JGuoWQuPoBLPZuxLClJMgl2ALDyQ3JcZPvk0Q7Ew2sk0VEH5w4xFGnpX0pGSY7i5vuV0dioIVc1S8OvWP5cfChOQ/iaQQMZUFNSIfZkH7bt9UMlc0d30Awg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867855; c=relaxed/simple;
	bh=i/cEyIz1SyKu+wh9Ymlk8HLs5KpdAzQkU644bhUw9bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Selc2hmq4v267smKck5o9ofCJRdCAvtGJZvp3eC/IvNWO7StA71aFyEdkT22aI/QYlzqms20jaI4PZMNIIR3yIN7IR8gBjhHz/sWQAkLApu/2u3s+kU/wX+LjLrfwIL4gjNU3jbnjQiOcMRUrMzhI1fb/8aOBPJHCkUXQWsyW1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fizLLo5X; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BVoKlMkb; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fizLLo5X";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BVoKlMkb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67REWUL23597158;
	Thu, 27 Aug 2026 16:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7hFtmJgmt/50kKFwKYT4SVYKzxiuBzNBHj8MzupoG5c=; b=
	fizLLo5Xo1ir/S+L3mBE85lVBJL+v1iijXZ/MqcruJivxskGoZ7hIKKdM9CpS2fC
	gfR44w4DcH0VUsCv1Sn13TZxs7oavvog/Xpv9q+U3mNgPnXpCoe2tCes/4dQZcZN
	i4kyxJznwaQYS9aVNSbX1XpFd8WAAxIKgbZ7Nj1YyO6x2hQb2UBgcP2vyYJkMrf+
	qL6L2LcaqRJ/TqBc+ChQ13v1IOxZlMg3P/f8MJveUoUUbcKUea43mDvlEq3GuuMm
	4avtgC5Vfy0+Jsv/04zytjLXiBsmgn7DyXh0iQHkMEK5YdVIIli3nDEEvC2Meo+m
	LXDp3ZO+yJPycsndotd78w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021097.outbound.protection.outlook.com [52.101.62.97])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ga4qh1xn0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 16:57:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pepyz+TLhT3wAZJPozynUg8T9/Dm9DMoUzWyf2Nw/uCsAwCvvPmWAPm2iSF0qv5Vb7kTmH1e+ACIZg3I3OrQI9deLX92ofrbTkvpfkn3RvHREBIw3dwrZhxZE3COgcFpXs0EcrI8KYhstfigCQqtlI9RMBtdTEOla6FOo2J6s7tpLRaTDRTxC1/UlV0FoGhIVjQukUz27DNz5bY0pUKqE60c8MtkopUVnXTYzluSQsT2AftC4FvknMdvMXgGp6OFdPslZBaFC0302MjatoP8eMnfpH0Zz0DX5QVm8gmyt1/UKiKse8ssvukoMVJZUG1woNGln1SS0EZOy2aIOgtZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hFtmJgmt/50kKFwKYT4SVYKzxiuBzNBHj8MzupoG5c=;
 b=SmZ8Y+MzSdhMPAfix3ShrOKeoFQMVPcSNOlQ37cR0WYbe/fB1AfBuXMzdFvU4fptU7wWQs9pYbLQUDUsj/gYet27ElUL0UQiPK50EjJK8GpGVU8vWHMl9rBtSjb1kTABsDK57GAOXaKKjXUn7aCGycjfw2dsXwsGG2EuvoUKU3h28r9VHTQXFtLR91oyuGQbsfPcsJpFocPHaZhmvukOZt6zef3cYA7r1uD2g5wDtYaTCKB3SOs87NAdNj3f0ZAzgqwfOhBCtVl+poFcI16KFMJSescm5O9eO5HuAeE28qgxmgCplWJ3bDkuGaYpPkm/TrIXvNYr26KGnQenB4EeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hFtmJgmt/50kKFwKYT4SVYKzxiuBzNBHj8MzupoG5c=;
 b=BVoKlMkbhspjqfDq74307waTph9EF7yH6AdSOKj6mQZtj2Izl/EFqisEy/u7M5dj8xGzKac0wMzN15mlBMSXzm3MnyjkA8D8z2WqEPfK36Tj55V6E68aovMyfGtwy5Q3mwRU0fQMLwDi1IuRwSZXh/DavglU17axOYIQpnhjQeM=
Received: from BN0PR04CA0190.namprd04.prod.outlook.com (2603:10b6:408:e9::15)
 by LV8PR19MB8654.namprd19.prod.outlook.com (2603:10b6:408:25c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 21:57:22 +0000
Received: from BN2PEPF0000A88E.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::9f) by BN0PR04CA0190.outlook.office365.com
 (2603:10b6:408:e9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Thu,
 27 Aug 2026 21:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A88E.mail.protection.outlook.com (10.167.248.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 27 Aug 2026 21:57:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3AFFC406541;
	Thu, 27 Aug 2026 21:57:20 +0000 (UTC)
Received: from [141.131.156.229] (unknown [141.131.156.229])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4886F82024B;
	Thu, 27 Aug 2026 21:57:18 +0000 (UTC)
Message-ID: <c71b70e7-7f06-4406-ac3c-13c89f3261e6@opensource.cirrus.com>
Date: Thu, 27 Aug 2026 16:57:16 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
 <20260821-sound-for-next-cs35l45-sync-v4-v4-1-20d3a07c3b8d@opensource.cirrus.com>
 <12761d4c-3f06-43ac-9f22-5d13e95e935e@kernel.org>
 <6f621efb-c7ba-45e4-a700-45844b89b8ef@opensource.cirrus.com>
 <fb86b050-c03a-483f-a4c8-cb71d8b2adac@kernel.org>
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <fb86b050-c03a-483f-a4c8-cb71d8b2adac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A88E:EE_|LV8PR19MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb7dfa7-bd94-4cd2-20bf-08df04862bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|61400799027|7416014|10067099003|6133799003|18002099003|22082099003|16102099003|11063799006|4143699003|56012099006|921020|4076005;
X-Microsoft-Antispam-Message-Info:
	LSEoE54U1Nx9hVLGGj0+0euts8kKTMHbBBOxbrb7gY2GufghsuoYvXT8tHdQ7saP7JLnK9l2thlW4HPnp8/ZMmT/hJUtoWuf9psryhUqc7qgg2iVoFWuTpbRcaVBRH7NciRn5+WM0N2ZxTBTy9y4niyYy+VLvghO5Wj1e72UYuXOIaYxfgC3jnl9JURZ7dZkn6v2h01miQvznNiguBLbm81D7gQH6IIjfi/U0aQlI64ZFbzwQqsRG0Yq7gGvenOD+S6GLqxzk0H9mXRKKy+DPpWw6GoZWxGdLnOOl5g0MKjvw4xrzMEF7PFNoUnIRfcJKQzlzfGHx/H823M8Cx3ZS1hS8fOJBPmcovL1sUYv7Ry5KBQj2iJI6cHQIVuO80pM8NYx+sRg0fSPHrWLJpLvEhkBN0mke9JfCpTuIhv1/jafd5gBt9naQNvTuCz9aYzl2ahal00WvE0PPPOclkczMwySB3zvY2CIbzYy21a9VgaK9ReKMJbOD/rjEXhCNuRKpxUZ0DEx0KyGRxeR7wZq4i4GYWnCCS0BHXWz/VtvEAf3/AlRaYDk0YmWjrFPiVgmk1ol7vuHGhYElzarfVL5O2+uJScfMPpTaoktXDGBG26Oy0VPfVJSCy/CGJyNhRrGkGICy5FMY153B+rGTeb8EJvaiEblTEDVWIH/6mdIlDq4VjKL0F4hAqI/2dD23XurfZjGiaOio4TRLJwSTlqket6mT+nBbjo7qhoU2LQVS5+k8WlNRRk7CG/msXSdu58J2wHXEhBRtAls70nARMwNhw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(61400799027)(7416014)(10067099003)(6133799003)(18002099003)(22082099003)(16102099003)(11063799006)(4143699003)(56012099006)(921020)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	O+Mfr2Eg3YK2LDEPC4RWlz0bNIaT8SXBI6dNdLDgA7ppEaL7tjFJoiAqMFo8vvc4XWv+3T2p6PVe41j7khSwkyZK39SR1kWBDglW+xPTseDiomZOWLS7aUkAoe4dXsVv0FGlMntS9mSfdTGvJIc8M8uFpsUy156pw29NvKpVF0v2/mK8WyDLQEvC6h8S9Q/mP9HE2v/K/jalBaYivxjAvNg8Gi71uXnTW543+1mXhhKB+OK5ot8Q46GSTonBlYAqc/y3iqzAsiIL78QbsHVe+NOAA2Jx4FBQXfqncUSejnERVr/+/bh3RwFwAVW5JAXPNqn9WrBx2aRk1kJUpgnIh2UVFMPzYztG1U9i7Me4c3VWjTsShAlVa4g3atEHe2Ob6jwDRzpA97G0a/wctu5ph2m6mgTD+fLraYzH8x4zepCyetwDIZ/RpmbKOt0mAYJl
X-Exchange-RoutingPolicyChecked:
	yd10SP1eZsOiR12MgWD0wf5ayViajUdyNqWefTGcqLON2nE55Vna1Zax4krmfcXIjnLQvYh2QVgeZu7QwIoHA5pWBB2yk8u13HA4bdLTINGpm/Uj4XhCZJSXEitThMt5Fl6HqtmD9AfJMGNXUF0lm672bfBc4WD++mWL7P/5oElHll04GHs8b7gC+YyNyM2U6NwFzVd/yJXUHluO0vm6j4MxsXdg6DVmSNLeo/vSd59Nlv3aWcgEBGGOhEqW4cbmsKn/3WaLmNEueY5z86Ua5w5gav/jgkZpXvs/29jjux8tTUgfmDOeTnZgWSjmymGbI1yGd5Wayce8XBnpYhXDMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 21:57:21.5940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb7dfa7-bd94-4cd2-20bf-08df04862bdf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A88E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE4NiBTYWx0ZWRfX02qMtaEMTtX/
 R02XdgIa2yf+hU09lOByRv3+SiFo3mG6+maRoXQRPYgGm6e7MnPMJLQgsyma4IdYz06wd1cTXoq
 Qj+v/OjyhOSiuDrNkBJjMBmtXeNCXXKalCxDhW0pbszux55GsPXOI3+TzwDSZ3j9qK/mQZ2zS6a
 rH2hdjG2ttdMT078VoMMGvk/NqLNsj/2CZfwt84M8sihN7xut9o60eBjpmYbq2vt28GzPUoAFzt
 KY0cUup8XHj3rH8hVRktpgFL/57N3dZe49tqKe/uM7QsMlQVLgtPSS6Xb8m+YJ7FUST7lKMW+Iz
 QqkQ385iBHkSSyUqlF+PBnDs04R5aiMlixu+n12wBzsY6EhXlaOiCVHDwVU5AwGAJU3Yz3lXRf2
 aBB2ApTC2ddjjsBqOQ4QHAe9W8SiA2IvaeNYGXRD40EFQ93QN8RGMGUxC4yPciEeOmed5KcpslS
 AiIVdS756JrsYhOKsjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE4NiBTYWx0ZWRfXznNe3+CiNVCp
 rwGkkpn0wmhwyJ5my9iPD1Djre/XVguoeSpmJa0NkSVdZI+wqh2cX94gK8/yzR8niIqLQcWth66
 EVksBJ4EC9Gsp9WkzGeUuLJ/xstwhQA=
X-Proofpoint-ORIG-GUID: ZMO2IlYEJFdjscY1c812F3wiP58wch0X
X-Proofpoint-GUID: ZMO2IlYEJFdjscY1c812F3wiP58wch0X
X-Authority-Analysis: v=2.4 cv=VoYTxe2n c=1 sm=1 tr=0 ts=6a90b2c5 cx=c_pps
 a=NYXyQfpeTqPs5I5uLp4fKw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=23KzbrH8ZnfIZZA6FxQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe



On 8/27/26 4:26 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 22:07, Ricardo Rivera-Matos wrote:
>>
>>
>> On 8/27/26 7:31 AM, Krzysztof Kozlowski wrote:
>>> On 22/08/2026 00:41, Ricardo Rivera-Matos wrote:
>>>> Introduces support for the multidevice synchronization (SYNC)
>>>> bus. The properties introduced allow for the configuration
>>>> of the device's transmitter IDs.
>>>>
>>>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>>>> ---
>>>>    .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 27 ++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>>>> index 70f6c62aedca..20d758dc442f 100644
>>>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>>>> @@ -53,6 +53,29 @@ properties:
>>>>        maximum: 3
>>>>        default: 2
>>>>    
>>>> +  sync:
>>>
>>> Same comment. You did not respond to Sashiko report because "it
>>> contradicts itself" is pointless. It did not... unless you meant
>>> irrelevant part about example. But that is just irrelevant to the binding.
>>
>> I will explain the contradiction again. Pay close attention to the word bus.
>>
>> Sashiko says "This commit introduces support for the multidevice
>> synchronization (SYNC) bus".
>>
>> Sashiko and I agree, it is a bus.
>>
>> Sashiko then complains "Is it necessary to use a child node here just to
>> group configuration properties? In Device Tree design, child nodes
>> usually represent distinct hardware components, sub-devices, buses, or
>> standardized structural elements rather than serving as logical folders
>> to group related configuration properties."
>>
>> I am confused, do buses merit a child node or not? This is a
>> contradiction without additional context. Do certain kinds of buses get
>> child nodes and others do not?
>>
>> Sashiko is an automated review tool that is being ambiguous. I need a
>> human maintainer decision made here. Does a bus merit a child node, yes
>> or no?
>>
> 
> I understand now your judgment.
> 
> Skipping then whatever Sashiko invented, I do not see there a bus
> represented by that "sync" node. Bus in DT comes with children, thus
> sync would have children. Or your DEVICE is a bus, then sync would be a
> child of that bus.
> 
> But your description clearly says it is not a bus. It is a "bus
> configuration". Configuration is not a bus and configuration does not
> receive separate device nodes.

Ack, will fix in v5. Thank you for taking the time to clarify.

> 
> Best regards,
> Krzysztof

Ricardo
