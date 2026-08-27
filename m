Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6E3F1052;
	Thu, 27 Aug 2026 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861269; cv=fail; b=h4lSL7hj2E/YFop/BFMg2fzlwAEUwMoWeNiTS0V5TlcBgX3Rp+z/caae6gaJq4GiJrBQmr5gjs8vUrBkgNKP84wAkA8nZzGSTtBIeH+WWUM8WWIfXnrXkZTn3SA4pB598KW5ps36PfmyHQ0CiwfwLDqjhMLlsiRqst79cNrdmX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861269; c=relaxed/simple;
	bh=4L7WJsAtqX9Ph0Y5x2OONMGrKb2lj4EAsssoZLO4nfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Md9lbpzjU5nS7lUUtoVrJ6I0LDfTU+9GF2gc5H7StRdZYSbsLrbOx3OShMHL8VPr0Gr/jUu4z7AH1JagC4JYKzYMbWlrfInoWCbdIk71Qqcx4cK/oeC8xdEQCuhWZl0U9zCqWBhh3iHy82Ffdyi/f2oor5obuhS7EImfJHS9jRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ktAx7ggo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=w/woaVcX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ktAx7ggo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="w/woaVcX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67REWVjW3597208;
	Thu, 27 Aug 2026 15:07:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=0+fnAGhreg25LE8MUBg4la5k2QtOpwOJfV7ll5dCqr4=; b=
	ktAx7ggoGHwk4tLWB70EaASm2kWDuxQ8zt8wtU6AYYEFK3oqbv0QL26ZFZUOCJGz
	G3IeES4ip65TynqSwTM8ntOigtrJNwClu8A3V+8TVZVvvbyPmb5NJqaR9L+D3E7i
	XbWRMXGoJMIQMDMdAH5JC0Uvm2Sha2OOtgUj1e0EdFCTyFE3u6HuzF7+4IP8f4fs
	A5yeRfZB4/2Q/DLVEWqP02fD16UWFKcph7ngVpWQ+cO/wBeZgGPLtj6ZlEdSChGh
	hS86iXb78zQw92+4lX+QgfOEi6x9BMnunnzWTE1vqTgsc/tkfENqjRztdHTvJmqy
	QkHnyO9eI6CZYKTbQZh/Kg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020122.outbound.protection.outlook.com [52.101.201.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ga4qh1u9b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 15:07:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsOBcGSfWACQmfUg/R6MSukjR+5WCLCt3oKC6SUWKeVumxCGddnEA/DpS5obge7WMUZYzBfKMiSLzRElpt9cdHgOUhws+RCTuh10cbRzg1ZRj0105blQJSxvAUNEvsV3IiytzihDx4DmBcX5rAXf6bYvfqNP5CWUoxcJ0wk7PuBFxt511Pfrwg+dcAQ8mPK49CzsL378wub8wZQUwUaJeJ3rDYj0tuGFU8kPQZufsSWdc53ghiD9QzFFSTKQjCFdjn4DTFGz7xzhNO47/Nq5Dp1Fca2zFB/1yvSFcMyMqtczp5t+ohRnKjywDpXU0CewJ3+BacmwKvQ6S58vEpGvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+fnAGhreg25LE8MUBg4la5k2QtOpwOJfV7ll5dCqr4=;
 b=rSNtJfF5XBBhuUTXdqw8RKhsRC1sbcQoJ/0IDfvgLHn3wcuiBKEVULl0eMD6ODWP/Ws1pIv98GibDLTQzPkFYrglHzcm8V8n4tRE/YvzkRUAzXGJjhzuJiORChRbXiNsIEXh/BXgt4jLUn9M9QRsdZ3GLnuU1PDX2q8db2CKv0qna2qPy/PXPwIQNxJlF44A3f+UmfpDJc03mAVxHye3tTe23HNMZzpWLhBhNDF+2vHUuw5ijZo8zrVUx+5/L6JKXZo+EHpJGlYtPOytq9UaWECZDGBe4ewaZ9ZB4yThOePIKuU/ayHYecia+A7YURZ0wlbsryJXKbdFDAIsQ0rGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+fnAGhreg25LE8MUBg4la5k2QtOpwOJfV7ll5dCqr4=;
 b=w/woaVcX248PZaM0a2XeYB3He6+lbJLNJLULxJAUIYAvsY2pZ4GQUBG7b3yHmkPy3eJmoXZrRIZYaxVYdAxkPMsBciBQ4vEoprNfm2ajDy6BDbAw4Xfetm1rZgqs5G8pPDs0cJ6XjQmzcxLK73epxuDwRT9oDo7o2hiUj7y5Ymo=
Received: from SJ0PR13CA0054.namprd13.prod.outlook.com (2603:10b6:a03:2c2::29)
 by PH3PPFD6D301256.namprd19.prod.outlook.com (2603:10b6:518:1::c54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 20:07:18 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::8) by SJ0PR13CA0054.outlook.office365.com
 (2603:10b6:a03:2c2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.7 via Frontend Transport; Thu, 27
 Aug 2026 20:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Thu, 27 Aug 2026 20:07:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AE828406541;
	Thu, 27 Aug 2026 20:07:15 +0000 (UTC)
Received: from [141.131.156.229] (unknown [141.131.156.229])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B712C82024B;
	Thu, 27 Aug 2026 20:07:13 +0000 (UTC)
Message-ID: <6f621efb-c7ba-45e4-a700-45844b89b8ef@opensource.cirrus.com>
Date: Thu, 27 Aug 2026 15:07:07 -0500
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
Content-Language: en-US
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
In-Reply-To: <12761d4c-3f06-43ac-9f22-5d13e95e935e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|PH3PPFD6D301256:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a633e5-bd54-468d-f8db-08df0476cba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|82310400026|376014|7416014|36860700016|6133799003|10067099003|921020|11063799006|4143699003|56012099006|16102099003|22082099003|18002099003|4076005;
X-Microsoft-Antispam-Message-Info:
	B0BH52f9ZuA7/mQ7y6uOHfQvkyBR1sOHjaRBowxIKz/Dl31ewY0G2X3lp/WA8JNrAhKVoLH4YPjf55RbC+C76/GaiJXC5TsISGFkaRDx66E0oGGlALZkK0eGcehzFZN4FXkqpyFKSNINhMB4MBWDEzmjyQmVV+JR7+hyLZtY+Pn7MwLVypkdFTJc3EJ/In5lD2KmctrRlNtJchoy1O96XoSukbcq8qSoUD/M6EX5/z1FoxJRNU6qmezDEgdyf61F42V1yzLofJh44SE1AxhBkNQLrsAX6EslXUBvCAzzp5Gvsb46gF209YHYF9D3czG7u3LfCzkgpzQPf0bFKbqbeznLnrovF/Ze/adk4mlAKrc4LWyrUeXd+TD6mc/qu5MVWBbQf9oXqc/4kwQ47kuGyH4joNNFAqQs3JQ0hH0x5IZdrOuiaX0x4FAx+bl8CRsVs5UKzf+lHJ4gbXMbP27SXgDIjL26Ya+D99wku0DZHva7Q32JYJ2HRAQ2cDMR2TzQLs+3UPH0BtKmRf99hCdfVWiUpqje0ti0wDKISfOv+c5HT/98DtmumAHX64r3yFhkMh3ho6ii4I4MXnW7UJRqBdEZK80BCXqokpWXbH7UkcXHf1NTMOWcGW5vs3CZVPYWpDK3J2biqGVWnpZwe8fPGX9GGYPQ6I/eLpmJHfe22G4tIRVdkr9l06vebxtAEc11NC24tJ2sozqmGZiGTvfoh6R4fg74hc12rJi9cRu7bnBW9v6Og3Vcus6GoVRCUbhQLDLtFdWEYndvVeez/bHMTA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(82310400026)(376014)(7416014)(36860700016)(6133799003)(10067099003)(921020)(11063799006)(4143699003)(56012099006)(16102099003)(22082099003)(18002099003)(4076005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hYGnFjkyGXG+HTZChco40i10Bx6xGrAA4n8khCvkKiLnwUNVuNrNbW9Lf7TzbIj38YVMotwP5evcRJcrYy0L7WibGE2rTM6b0bWS8xqVwUOAWvJha+ZtW5ILqFXEANc2q5GungBJx1/Bmhem6psrY2c2dBHtNmh0IxizLnV0Dp6PB232Ji1AUWpWQETlZRVArxwltYMquPLV2j9MdHEEDyZM5VJa7hSB/n0U97qSzZW5A5Us2N425i3z6caqiGjOVPM3IpL3+Nd/ZfxKOloux6Fov7x8sc20brgnDPnfNBJ8kXTTO77dQFsJcUKGVME+rEijEScAN5g3a8vi5okzHhKbuykM4qb5coR7gnWI0ObFta0JCSsXUYkeTzr6CNoJZZXVtt7i/wRpQV+Tt9cvCP7yz/edff2NSW7ZUyxOZv4izxNi78UEwELBJnAWvgTc
X-Exchange-RoutingPolicyChecked:
	bbyZMjC1ZWmre7hLN7YuBjdrskZqvoubD3AEdgerhMqbi0Yt8u9Ba1zsYLnoPnWcx9bzF+Z0NiNTVt034cRnkz7qUOMuVdT5Pbbu6K5JsJSCvdTNRm22band0tvHnvUpcc71ug4t/qex+/DDUeSPtTsNdUWsVnIakhBcCNLYRfBfL1mM3DJP16VOPC8t9dBwvB903IK/jQ1RcdOdXJcHWee3LVC5RXLep7M6zN6htWSe0pSYMFxMNGF2fHGUXzxaDp6O7Wbd0+N8QGVHv5BbGOpq4d8gJou41DC9jyLluFOwLdUiG1PeZP3A5ma6IZn0zOKlhnEoOPHfJBRNsNRbeA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 20:07:17.6081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a633e5-bd54-468d-f8db-08df0476cba7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6D301256
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE3MCBTYWx0ZWRfXz+ugyADjwxHb
 XYyei5mOx+QOpnOHwTn/L4hn8mVvwunPzEBhWjIDyob+n2ZJ9D2XsZDH47b7Lmg+0WU1S7KmEJs
 1H7md43RVy+UVS77vVDxhentc64pM/eZs10fSFmMkRVwptCye/qCvZuQoZEJEY0w+tk4h3PnlOJ
 6UXlNc69P10vsBe6H4zYzmfMLUZaIcr5P46Ya7QOz7T2F0ZpHIjIN9Xq846sI9lRMnNAdcfbiV3
 yX0FbmJE2lb0Ag++Bts0C0wL0fzHPn14QjJr9pu+hzxAAMABRsXlIi+1vrbMK6hhYR/Bx4FhFeu
 JJFvTeeoi5kl/O0wGPUH4f9UhudWWp9KBhZQ5yZCfAB1yioXfGymQKfkYPFMmxMuKBz8CYnqhuS
 aL8fVaLBSIWmteLc4/WwnAGiLIzjqBN1ct7o9TnjBuGzj61ta/PVAf/35Ae2olJ2hS9RX2Z8MYb
 uBE2GQ+Qu09pdlFyxHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE3MCBTYWx0ZWRfXxevdOh+wEI9l
 A3l4u08rFi6y3VxyjQvwsDvLPkpZVtd693vhBQ6Q701JTsVdslf2TBoknYhC9c7ksmqnifaGuPW
 vBaA9nPNIIJq1bBgtKmyVBjqBlp3C2I=
X-Proofpoint-ORIG-GUID: YcvDpGRhugKzCYeW0OdamrutaqF-47rn
X-Proofpoint-GUID: YcvDpGRhugKzCYeW0OdamrutaqF-47rn
X-Authority-Analysis: v=2.4 cv=VoYTxe2n c=1 sm=1 tr=0 ts=6a9098fc cx=c_pps
 a=sTZbCbQesDggSpYbwUb/cw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=gRarUAPjLaUzCu7U7ewA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe



On 8/27/26 7:31 AM, Krzysztof Kozlowski wrote:
> On 22/08/2026 00:41, Ricardo Rivera-Matos wrote:
>> Introduces support for the multidevice synchronization (SYNC)
>> bus. The properties introduced allow for the configuration
>> of the device's transmitter IDs.
>>
>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>> ---
>>   .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> index 70f6c62aedca..20d758dc442f 100644
>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
>> @@ -53,6 +53,29 @@ properties:
>>       maximum: 3
>>       default: 2
>>   
>> +  sync:
> 
> Same comment. You did not respond to Sashiko report because "it
> contradicts itself" is pointless. It did not... unless you meant
> irrelevant part about example. But that is just irrelevant to the binding.

I will explain the contradiction again. Pay close attention to the word bus.

Sashiko says "This commit introduces support for the multidevice 
synchronization (SYNC) bus".

Sashiko and I agree, it is a bus.

Sashiko then complains "Is it necessary to use a child node here just to 
group configuration properties? In Device Tree design, child nodes 
usually represent distinct hardware components, sub-devices, buses, or 
standardized structural elements rather than serving as logical folders 
to group related configuration properties."

I am confused, do buses merit a child node or not? This is a 
contradiction without additional context. Do certain kinds of buses get 
child nodes and others do not?

Sashiko is an automated review tool that is being ambiguous. I need a 
human maintainer decision made here. Does a bus merit a child node, yes 
or no?

> 
> Best regards,
> Krzysztof

Ricardo

