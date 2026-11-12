Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794479784;
	b=NxAP56wpP0vLj9YcsiQM3dJWOJXlky6cT3hQtjnD9l+qOpvMEHFIMU278n08+jUL3kkO
	 vAdhnDIGcfBapwE6+w5cUcKCYUuOgFFVxGsKBVRuSkhsVuI3Z4IzBwY2hTAzVMskt0kF8
	 MUH46NCbf9J0lvvtNEsC6kRDU7AY4vAbvWWqinTSdduzfQQXcCyICEthBsi4jPn1KRQMS
	 iYW8a75vNey4V7wkF90Gto6LYC7JYzlkGgpNWzfyZJJNuULhE/aMIGUNgk6mxpu58q7Jo
	 A+FRgcEuzgsy4HTxuJyb1yx4RX17OYq5iyrLDGfoHM9NKFOCK11g+N3pRCNmmbgUBWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479784;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ftYYhz0F1xYWCp+ZyInzOrwbrwgilJKW80j5+GyzcNU=;
	b=oQ4qb73mJ0sfL/L4JVysrA+DMnZjS4aVM2CHUAoCHwmgbpa02ht1iSrshuZXZNgKyFpy
	 LlmquyWHN8I1+ujmKnTMFkR/efCvzp8MVcsgQWO32ATeWZ1cT4+MVIBnShJ3eQRVVej8Z
	 qciiYIOS15S/r7dRohEqP3bLLu7FOUzoKDTg9NXqr6BpgvxZM9kfERT7vXfXOsmBMP53u
	 lzaSWz1RaYb0CuqC30KPx0jURFpJiZzOfiVTWD8i6LySKm8wTFVLPFPDLH0AvXnQypS15
	 0OaLLZfi9CSJSI3b6+eMYjeW4JmV4dnm7m57vMxV8jGQeX7rDrDuVQLlNcNQtE5UKBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=FaX951dm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.17
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B23606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B23606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=FaX951dm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOqo6QhOb3HxFxAefo5yrtcGgv/EO7EUGtTLN1fCANNP/z3h2h3YE5qQPth6P1tGGKMO15LBq/5HXp09kJeUtMNbF0pICURYxoCkNqsAxunX4VVayEctnQwYP1Fi2Rd7cc+5ZxVGcvzG3+xWjDhMscC5ZUcp7XcTa8p/XdD0yYGkpupaPA/Z7lkMjAvS4n6L0Cp7CGbLVJm2rCrJqpUP54mV36H/fo8yuyIVPonlYvO79D89SZerDVbPl+gnH2vaAKWYTgB2G0fZFk5mR9Ho1/o78Y3/NL+XIOC3At8FsMBhOgoWXIvZXWKACO3y2ukN9KXtA7v/1MGsHfLVstiv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftYYhz0F1xYWCp+ZyInzOrwbrwgilJKW80j5+GyzcNU=;
 b=BbKgMulgsqg3/lokqukmKOvdVJeq1jEGBAlryZhjaOoYmq+SrEY3NEHNzQS+WljtkKQGwNA53nK28GLzel4CbJTtPIuj0VAT7r9Lm4KAUEzqMXoys9C+iSODLx9nkGu+DoHx6MxjPHtHrG3c0jjYjLal+k8kE+fmGhuOvxfGGxbQecODApxsMkQdfbBa306yjskt9XDln19UdU7Cs11Sg11sPPOO1gpbOdAzAeTthTIEmLNOOavl4zH2NtQMiKkiiuwIsODbUq4rcCLs8s5QGjsaBnTvlrDhwYdd/qnIVm1SmHMkz+KTrvb/cxu95PWJF8FLdBerVnkqxcykom4voQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftYYhz0F1xYWCp+ZyInzOrwbrwgilJKW80j5+GyzcNU=;
 b=FaX951dm2iw0oA7oRxJf/g67Riq/tlKa074n74/aiRcypVSqYos/CAxlwPPCsCzrWZyvsR721DrkMnO9ngpQXnE7AFTKNrSQ6/YpOqPn1zCg6rLlhPAHnMzeAjZ2ThoooMIF/NDoLVBLHY9pHTGd0yakPZv5CWYaIvJHfCUTWdw8ghTLsqaxM9XANYcqKUQGh7UTFODafZazStyV73rp3xvRM2TVv+lT4t9zxxuA5UYV9wirsBYUByyR/Ih/gHdY5iqug9sddPAoGVExXTZ/p+qNOCT9uzvQonEq7V0rZJo3nldXKK0WcRxx0TZ2W/RgwRZ+Fl8YgJceFIog/0848w==
Received: from FR0P281CA0244.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:af::13)
 by AM0PR10MB3473.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:151::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Thu, 12 Nov
 2026 10:36:18 +0000
Received: from ZR1PEPF0000E464.eurprd04.prod.outlook.com
 (2603:10a6:d10:af:cafe::f) by FR0P281CA0244.outlook.office365.com
 (2603:10a6:d10:af::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Thu, 12
 Nov 2026 10:36:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E464.mail.protection.outlook.com (10.167.241.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 10:36:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 11:37:15 +0100
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 12 Nov
 2026 11:36:17 +0100
Message-ID: <a1f17bcd-e67e-45bb-9c06-9e7d213b7e98@foss.st.com>
Date: Thu, 12 Nov 2026 11:36:16 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in PC
 mode
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	<dario.binacchi@amarulasolutions.com>, Linux STM32
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
 <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
 <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
 <20261112-illegal-slick-rottweiler-bdc9ea@sudeepholla>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20261112-illegal-slick-rottweiler-bdc9ea@sudeepholla>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E464:EE_|AM0PR10MB3473:EE_
X-MS-Office365-Filtering-Correlation-Id: d01130db-794d-42c9-068e-08df40a8c90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18092099006|18002099003|22082099003|6133799003|261009223027099003|4143699003|261021121427099003|11063799006|261102123227099003|261028144727099003|56012099006|261022105027099003|261026140227099003|261022075727099003|10067099003|261021123027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	8434FnhkMXorYnhqtbupb1vWq/yS5NvSjL/spnebC5jhn01aFi3+Tbk8dv1tirUo+9wycm0f81GeprFcI/SH1ddo5rY/nchq/RyF1iog9S/zxhLdgZZnZ5+l4ybDs8Xc0DZ0BhXX3RkolSJonMWd8tBfo7JdnW5+JP6SaHl/XWVBwhEdnROmqBCNoKvdDixYU7aVxZkXhlX9ZMBYr1SMTJrMbQIdjmnR06iE6SpNXHeIpuN8qnC1VJs70OK2z1aKwEKCPiKryXxIdE2kcets8lgEypw00YXKGKPKr4X5YE/FM4Hqzni/UKXoNvjay0w+PK8ox9jelnypt+vHryzSLKxkU/s+tYiInAKifgcD+U6VYOGjECZKf24smfhpASTN5eq3Zh7ZgPOvWUkpvJJrGxcghShU5M7L+xeG5HAw4rmfo2cFzd6wI6E3+qfp+/xieVgMXQ+d/16/wThlvz9xRGXG+6h7UlA3zu7zdh5KkQI85B8icuxWBF3V4lU5xnIoOSi0I2if9Jh2f/kBZL7/ceitJ84vR/H4Prt+4KwfwRo3lsR86hRgvKT1l+xDASQSlKYez4LtPqp8DkyjP0EnBEekvGAj//w6NZ9kSE63B9ez7UnDMgXE0zKXFpVE52xrEYY4ZwFK7vVcKM4exo8xo4CK+N8VE1JmJJ8At7OeS07oP5tA3fQJmsXplhG0R5u4iK0RJcyBCI+3z9JijUzo+g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18092099006)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(261021121427099003)(11063799006)(261102123227099003)(261028144727099003)(56012099006)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(261021123027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NZxN1H+i6VjaxoEsthUi+Zdv+1sJgnirfrh4jY88U/MP77IZl1m7yvtMh2r2VH1OL2R5F9IQ1WjxYflwBq/xU4ns4GEYqAVIHzCDGE2RETCobL/I9OxXafqPZCBl0SksZTLV7+tku0dNKUG0RcCx3LV6qpgBdyvWylu1WocxnQviaX4iT7SwcVW3KrIBWWxfmh1qGe8AKqgxyB1YK9HPxdzea37t0pMH8e2bgszGZo0bFJtpbAzqVj+r6QbsV/lg8itBUhOm5ITIK13B0xGuxc3/cnV/b3+wrkJzLK4SZUzPzwpGXf7gsZqSDfDR+Lb9rFr38IaQlcXEn9mt9wuAPfBDk1/nPt7N3S/VMoV8fELurfQDQZdbyfzvUIDii4JC/O/rFUNVfiy5bCzLlROV8bS1ZZFYrC7X1vWSiB2wdXnxqjt9Vfz33l0yUazc5xlf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:36:18.1218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d01130db-794d-42c9-068e-08df40a8c90c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E464.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3473

Hi,

On 11/12/26 11:06, Sudeep Holla wrote:
> On Fri, Oct 30, 2026 at 11:04:51AM +0100, Patrick DELAUNAY wrote:
>> Hi,
>>
>> On 10/30/26 09:32, Sudeep Holla wrote:
>>> On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
>>>> The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
>>>> returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
>>>> mode, Linux can assume that PC mode is in effect. Treat this response
>>>> as success so PSCI power-domain providers can initialize when firmware
>>>> does not support OS-initiated (OSI) mode.
>>>>
>>>> Continue to report an error when OSI mode is requested but
>>>> SET_SUSPEND_MODE is not supported.
>>>>
>>> So, your platform advertises the presence/support for OSI mode and yet
>>> opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
>>> firmware bug as reported.
>>>
>> I think it is no realy a platform bug but a too strict management in Linux
>> kernel, for PSCI power domain.
>> The OSI mode is not yet supported by the STM32MP25 platform in Linux at
>> upstream but I introduce PSCI domains in device tree (but without idle power
>> domain) just to prepare this activation in next steps.
>>
> Fair enough, that shouldn't be a problem.
>
>> As the PSCI support is not activated in Firmware (TF-A BL31), the firmware
>> correctly expose its capacities (PSCI_OS_INIT_MODE =0) => PSCI feature
>> indicate that OSI is not supported (FF_SUPPORTS_OS_INIT_MODE = 0) =>
>> PSCI_SET_SUSPEND_MODE function is not supported (optional when OSI
>> is not supported)
>>
>> in Linux side, the power domain driver
>> (drivers/cpuidle/cpuidle-psci-domain.c)
>>
>> correctly check the support of OSI:
>>      bool use_osi = psci_has_osi_support();
>>
>> in STM32MP25 platform use_osi = false, so the driver request
>> Plafrom Cooordinated mode (PC mode) as expected
>> But here  the GENPD driver try to use optional function to set mode:
>>
>>      /* let's try to enable OSI. */
>>      ret = psci_set_osi_mode(use_osi);
>>      if (ret)
>>          goto remove_pd;
>>
> IMO we should make this psci_set_osi_mode() call only when use_osi == true
> above. If it is passing false, it is setting PC mode but as comments states
> it may be assuming OSI mode and proceeding further which is completely wrong.
> I would bail out of psci_cpuidle_domain_probe() early if use_osi is false.
>
>> And the problem occurs here because the optional function is called but the
>> normal use case is not handled (OSI mode not supported / PSCI_SET_SUSPEND_MODE
>> not supported)
>>
> Agreed, but I would check before calling here. The proposed fix hides
> PSCI_RET_NOT_SUPPORTED error for PC-mode setting. So clear NACK for that.
>
>> With the proposed patch, the Linux kernel can have PSCI domain in device
>> tree even when PSCI OSI support is deactivated in PSCI firmware (or not yet
>> activated): the domain are always ON (GENPD_FLAG_ALWAYS_ON).
>>
> Do you see any issue failing in psci_cpuidle_domain_probe() instead ?
>
>> NB: I hesitate between the current patch and a patch in PSCI power domain
>> driver:
>>
>>      /* let's try to enable OSI. */
>>      ret = psci_set_osi_mode(use_osi);
>> + if (ret == -EOPNOTSUPP && !use_osi)
>> +    ret = 0;
>>
>>      if (ret)
>>          goto remove_pd;
>>
> See above, if the driver is assuming OSI mode is set after the call like the
> comment states, it better check if use_osi = true.
>
>> but I patch PSCI firmware driver because I think it is a more generic place
>> to handle optional PSCI function.
>>
> If we have to handle it in the psci, I would rather not make a call to the
> firmware if PSCI_FEATURES(PSCI_1_0_FN_SET_SUSPEND_MODE) returns not supported.
> That is the expectation for any ABI the firmware said it doesn't support.
> Making unsupported ABI call to the firmware may result in unexpected behaviour
> and must be avoided.
>

Ok, it is clear

Thanks for the review

you can drop this patch and I will propose an other patch in PCSI CPU idle

driver to no more request "PC mode" with psci_set_osi_mode()

when use_osi= false


Patrick

