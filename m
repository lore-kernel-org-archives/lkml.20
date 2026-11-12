Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794501261;
	b=wix8YtzXa8qsjrT+mQ+RhlHTzthOTTrtXtPIljifWHv56PbTsNRs/jNGrd45YHGqJk35
	 1l7vtFvYsVr0darTdfBjlilHv2IhiZlMPmU95UkNJYiMxFCAhPNNhisjMog4eqJYjmi8X
	 R2D2/ksmfI8uYLa9GA/MWycvJDqpjCutPvhWa6rAj+omPE9gV49GGQxZjhy/ExqEzPqac
	 7J/DDGqVrJqsxNHpC3FXxf2wSc+lwu+lijhgBRb+8OIqsYE1F3nfJ4o43LaRw+rqVm0b1
	 uBiSufq/TXy45lnJwV7YKP9CAMtpw9WhqmAPdxJaRmPErNurVMLxVvVOTJzB5Rs56Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501261;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:CC:
	 References:Content-Language:In-Reply-To:Content-Type:
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
	bh=67O3Kv9GxmQvXDo03HPXJ4aw6OZ8A4VmfYlF/5snj90=;
	b=hzJCgh0h9vqkdTuqEBSyXnl0ya19bydf6nJQKQvor62Kjxc3UIJY3edOKb30Xk2tidvp
	 xInbYd77A5rtBNtx72U/w8EIdOjeCpds8UXMYBXPYEUIUf/Y1itX38Y3zxw7Ip3EGwz6w
	 UBLRVWMDjNkg3gqcRcs9l08JxzpiOV9MCNExLjvEgCGk2/JjDMS6nzhRJODrnhrujOAPk
	 plJXYT/6KUin0/+qHp+eaSYW49EbYykkVn60TPU9jWqV/La4T7vulLpxhoJk0nP9wrqdU
	 f7eLUApmjlz1MBz4r0DcE4NdTiU/1kMtickGrWa9UFWAZbeS8CjMxKQKjftHRK8kZ3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=L+9woj8T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.39
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD8A606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD8A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=L+9woj8T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTROlTOzd5nhuP0tBZPwHPHbSeP+biNQ3iKgMV9crQMGPXgA0LpdZ3FSGBQozmXchTxjHttIguH3R+2vBWttih7XFGKBy5Eu1OmnnR/ifUHYvqqunXqckutILuwooMifE73Bhuo+Lb90e8KY4ci6A/RL/2eug5QFYnJCwjwLEkfBdkIbx9i4potyrWrrK6OqSEuTCnkxudpR3Lcj2kdxnRJt2I+GkcD2sk0o6o+3KMEIJxL4ZCAYD+yHrrJRmsoI0MY+HCUlbxK4IzfgDmqqrTxBrUbOF8EhAiJYfM92R0EkTforIhK2uiGBRVYN66OYBxn0mbKJUl4ii4g7MeZWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67O3Kv9GxmQvXDo03HPXJ4aw6OZ8A4VmfYlF/5snj90=;
 b=Rp6f7W7FhCSq0HvK/uMA1QV+N46ZwdD43Wzm3eZELDAzXoDRFpI9AvMd3pag425rQJmtRoz1B6081bz9Fgk4ODISup3xX4b39wdDWedhsqinH59ymPk/SFezM8wkUkguU+HGHGJi6MEOfchinpoYykbA5fGhrA4pd7Ps1/GuviWJHDS3cLGPVtG54f/k+SFWOahdr0g91rQrNel9n27SK7yEf8vqsdwzgKsxl6UTQtUtXnEGnckMVDPWfBvMSyYlPjezmf1Oi4XGvW7EeG6iikdjJVnoxuxWvKzpw+jczj+dcJ7V5OlOk69Wne80hDy3kHR3KWy91Sjbe0dfJBxljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67O3Kv9GxmQvXDo03HPXJ4aw6OZ8A4VmfYlF/5snj90=;
 b=L+9woj8TNFRSEZ5Q12Af6S8w5ih1tPXvgn2mRh/VyySXkXNjxpS2ghW82UfMC7hKD60x17gDakWfUSWPyapT3+i+EBv7J4gvPXwhCJiiDGbrtNfXVlGsiCzeWtu9iD8WxVmrkARoKmERT9i/X4AORihApWvbv7IQyOmx0wmMJwlZGWRy0x9KPSqHfb+Ccig6+y8iaRHXwzVYpHxfEQ7HN6vs2TOKBu2XbN3iZgig6Db9BOVezbmDP0gGSG/osCN3VyT2mopV91j8g7+Uu2o4nTT7Ux+9RBQc2me42AnZ2PQOEC+GcSFldjUBZcuzvPQgGJCk+2Gzr91YKGqv/OaSZw==
Received: from AM9P193CA0015.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::20)
 by PRAPR10MB5446.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 16:34:07 +0000
Received: from AM7PEPF00000054.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21e:cafe::55) by AM9P193CA0015.outlook.office365.com
 (2603:10a6:20b:21e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Thu, 12
 Nov 2026 16:34:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM7PEPF00000054.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Thu, 12 Nov 2026 16:34:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 17:35:04 +0100
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 12 Nov
 2026 17:34:06 +0100
Message-ID: <c1a68f83-d511-4a61-9362-22eb1390ad6b@foss.st.com>
Date: Thu, 12 Nov 2026 17:34:05 +0100
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
Subject: Re: [Linux-stm32] [PATCH] firmware: psci: handle unsupported
 SET_SUSPEND_MODE in PC mode
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
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
 <a1f17bcd-e67e-45bb-9c06-9e7d213b7e98@foss.st.com>
Content-Language: en-US
In-Reply-To: <a1f17bcd-e67e-45bb-9c06-9e7d213b7e98@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000054:EE_|PRAPR10MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c35f9b4-9dde-4764-250d-08df40dac59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|18092099006|22082099003|6133799003|10067099003|18002099003|13003099007|261026121527099003|56012099006|4143699003|11063799006|261009223027099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	9oTV0yZes1ox6sr+PNnF80BVFTVnnOp8oDz/26Z0AwXdQ78CH/HN/gD9+yBaLuaSdK/Nw+5q8+5B5KoLqaaMrUgMeLoIuTEaQwfnIgMnAOZ9SCjnnE8UlbEHFJESGDl41IUILEa29B31jdO5qWpOGyLcNILvKIV6cnTNyoQRVEOihBIhbwhXf28BP+5SDo5bVf5uS2MOVrKjHz0OUfsS6i1AWVXJTzzXQLr0Fcin8sjG0Y/vs5VZ+gD63gYp/o5NAxkpKDy6V9WzFTnEMo9Db7QN08JiROPs5km225VOrC7Wj9b2DdyqsjnBXD6BYrdzAut2fU7WQN2ZL746ElPgAcjRI0yYCRFM38myyn81T5Qos2TryCpvl+FPpuyI9sWqne4pXdjX1xyDdI4xnO0dcVplVSAjTD1020/rR0jREi5QFGLj5bWoFokfuPdCSJIBjwQK+DaWtmFILhRPvUIPuQQ4ZaUKlZhhG2VN64tm/msocximCFeHzQjRsn8YS5/GsQ6hQKvwFWoTwNn+mmLkFvWt/FfDsldFELtQRt0uFzd2oqU2fnj0y130Lolj8XAB7KhsQti77yzwQrt31QA1h8RW4gDnI3FVp8d05odt21u/hUTk+ai3AbmiIWFqAWx2WDuqVWgV51k/fx73TpXvlnBkYuiQej/zo/mC82N3WTA=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(18092099006)(22082099003)(6133799003)(10067099003)(18002099003)(13003099007)(261026121527099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xyn9c4TCBu36LXuogFOe2LItyH4m1yn1tAyxdApDcmVIdlu+HLssmqsNqfKeEQAXTKbuv5ede/5Tgglx9p6h3g9UbMiukFx+Yj5FhiEKD+0BJp3/NjDWqMCmEXFTBbUFrTRJJ1lNf15CXGnTz0Ictt+kpU4KgYY1XuEWcFFVADrce7WhBBVZnCoVkfMMcZNMyqWfs1pVuASC8kSAa8+5gThntTf7z60bLkFk01m0iF6VEiC5B3j7rCgVPrjo0ozWyYoEP4Uqna5nfXB9bwWpbEbIR3uKZXl6SFgjOegvo19eIJhzZP2YbcveP73vqHM3MkXP8v3EgH4OCumc8buqIdJDDp0Hp/28qAGXFUJ2N5jUvQ6Ar8HB3LXCPnvO8wTLJb9vA/BnS5BvGt2kxZXlyN6+sfQYe0S7oAVnedVsldQg/AJ3do9ke10LUa3l0HFS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 16:34:07.1563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c35f9b4-9dde-4764-250d-08df40dac59e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000054.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5446

Hi,

On 11/12/26 11:36, Patrick DELAUNAY wrote:
> Hi,
>
> On 11/12/26 11:06, Sudeep Holla wrote:
>> On Fri, Oct 30, 2026 at 11:04:51AM +0100, Patrick DELAUNAY wrote:
>>> Hi,
>>>
>>> On 10/30/26 09:32, Sudeep Holla wrote:
>>>> On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
>>>>> The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
>>>>> returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
>>>>> mode, Linux can assume that PC mode is in effect. Treat this response
>>>>> as success so PSCI power-domain providers can initialize when 
>>>>> firmware
>>>>> does not support OS-initiated (OSI) mode.
>>>>>
>>>>> Continue to report an error when OSI mode is requested but
>>>>> SET_SUSPEND_MODE is not supported.
>>>>>
>>>> So, your platform advertises the presence/support for OSI mode and yet
>>>> opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
>>>> firmware bug as reported.
>>>>
>>> I think it is no realy a platform bug but a too strict management in 
>>> Linux
>>> kernel, for PSCI power domain.
>>> The OSI mode is not yet supported by the STM32MP25 platform in Linux at
>>> upstream but I introduce PSCI domains in device tree (but without 
>>> idle power
>>> domain) just to prepare this activation in next steps.
>>>
>> Fair enough, that shouldn't be a problem.
>>
>>> As the PSCI support is not activated in Firmware (TF-A BL31), the 
>>> firmware
>>> correctly expose its capacities (PSCI_OS_INIT_MODE =0) => PSCI feature
>>> indicate that OSI is not supported (FF_SUPPORTS_OS_INIT_MODE = 0) =>
>>> PSCI_SET_SUSPEND_MODE function is not supported (optional when OSI
>>> is not supported)
>>>
>>> in Linux side, the power domain driver
>>> (drivers/cpuidle/cpuidle-psci-domain.c)
>>>
>>> correctly check the support of OSI:
>>>      bool use_osi = psci_has_osi_support();
>>>
>>> in STM32MP25 platform use_osi = false, so the driver request
>>> Plafrom Cooordinated mode (PC mode) as expected
>>> But here  the GENPD driver try to use optional function to set mode:
>>>
>>>      /* let's try to enable OSI. */
>>>      ret = psci_set_osi_mode(use_osi);
>>>      if (ret)
>>>          goto remove_pd;
>>>
>> IMO we should make this psci_set_osi_mode() call only when use_osi == 
>> true
>> above. If it is passing false, it is setting PC mode but as comments 
>> states
>> it may be assuming OSI mode and proceeding further which is 
>> completely wrong.
>> I would bail out of psci_cpuidle_domain_probe() early if use_osi is 
>> false.
>>
>>> And the problem occurs here because the optional function is called 
>>> but the
>>> normal use case is not handled (OSI mode not supported / 
>>> PSCI_SET_SUSPEND_MODE
>>> not supported)
>>>
>> Agreed, but I would check before calling here. The proposed fix hides
>> PSCI_RET_NOT_SUPPORTED error for PC-mode setting. So clear NACK for 
>> that.
>>
>>> With the proposed patch, the Linux kernel can have PSCI domain in 
>>> device
>>> tree even when PSCI OSI support is deactivated in PSCI firmware (or 
>>> not yet
>>> activated): the domain are always ON (GENPD_FLAG_ALWAYS_ON).
>>>
>> Do you see any issue failing in psci_cpuidle_domain_probe() instead ?
>>
>>> NB: I hesitate between the current patch and a patch in PSCI power 
>>> domain
>>> driver:
>>>
>>>      /* let's try to enable OSI. */
>>>      ret = psci_set_osi_mode(use_osi);
>>> + if (ret == -EOPNOTSUPP && !use_osi)
>>> +    ret = 0;
>>>
>>>      if (ret)
>>>          goto remove_pd;
>>>
>> See above, if the driver is assuming OSI mode is set after the call 
>> like the
>> comment states, it better check if use_osi = true.
>>
>>> but I patch PSCI firmware driver because I think it is a more 
>>> generic place
>>> to handle optional PSCI function.
>>>
>> If we have to handle it in the psci, I would rather not make a call 
>> to the
>> firmware if PSCI_FEATURES(PSCI_1_0_FN_SET_SUSPEND_MODE) returns not 
>> supported.
>> That is the expectation for any ABI the firmware said it doesn't 
>> support.
>> Making unsupported ABI call to the firmware may result in unexpected 
>> behaviour
>> and must be avoided.
>>
>
> Ok, it is clear
>
> Thanks for the review
>
> you can drop this patch and I will propose an other patch in PCSI CPU 
> idle
>
> driver to no more request "PC mode" with psci_set_osi_mode()
>
> when use_osi= false
>
>
> Patrick


Patch replaced by PSCI CPUIdle domain patch:

[PATCH] cpuidle: psci: Skip SET_SUSPEND_MODE when OSI is unsupported

https://lore.kernel.org/all/20261112172241.1.Ibe6dddf06a4b7e5b24af24dc85d053e36f940549@changeid/#r

https://patchwork.kernel.org/project/linux-arm-kernel/patch/20261112172241.1.Ibe6dddf06a4b7e5b24af24dc85d053e36f940549@changeid/


>
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
