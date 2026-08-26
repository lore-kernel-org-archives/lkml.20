Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013060.outbound.protection.outlook.com [40.107.159.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE33EBF04;
	Wed, 26 Aug 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750687; cv=fail; b=L1WiJigp9i5NzErTQ41Wpws8/uuYhWFAEARlWfT6r2J+kmKtiQhqy44m9ybYx725TtzlIBTS5rspNDoGrKV5mf80LlfZ0dL+fP6eM8P6SjMlgn8OEMidgonHVKzP1YckeVXJ/CY7/16WbnvKMzqy3AlI9gomjzFz1dlqGT/JuLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750687; c=relaxed/simple;
	bh=fowx9Doeas1XScCTFhSEUH30lD4fhIRFRrG/IP1LV3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UwoZuVsHLTLpXlu5HH+HgUR3Tl3FYO+1LIVbpd9XvRcuQQuh7uAjPUOBcPlznrf34rRK2mMkvq7xjrmbYFYS/S0xCubJYR0RXytuiWkIUFUsqJNT3u1L32Txm2GT1sdzuSwiUEe84HKXMRbbZ673A03nOG+nA7gbMhj0XMjLf5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SVE18XNz; arc=fail smtp.client-ip=40.107.159.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SVE18XNz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfCas3Z7zRISzhNSFoxpSyQilgmo1RGjZxT+HkWsMgU3T4CciohwFOySttu/3x5baWgQzxO/spcEw0vWoMcRBPZFAvn/mKEYtveVrQJl34VTsfdGWSunxyXHd/ywcjKnucEMuhYKdiCOaCnoG3Dmhl7SXLdfXmf01sDu7MUeTRC84cl4r1KTUsQU0FNBHz+Y9yusz9+J3zy5Syp3+NzGCEZlr9LxbR+RjvO132GtbwvLQnbme3c+rG6qFF6VQMMKdI2mI3EYVSj/ZUm8mSMwMsTel2bk4+1i9NvGs4yRZWoD0W0ZTiToB7xWIG6gJnzzXW4lWhyQ11Xj6vYNSTNbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Scoq2PWNqrbBzHPnJ6j4uRZ93geFy4MJFtk30NC1+4I=;
 b=kpoGJ8SPCaC8YdjQS2DbSEG7nup5mF65Vqp2HJtON14Tbke3fF2Iwb7L9dn9603vDYIW9nmlvc/1UMa4eDXbSzPER3QWXXKJoZOX4oxnpfeYsE44pQFkIg10UagZtJOvOj/6fBJTjlmxqTOvAMIUczRPWynVbr0TztHlpVv4lud0Dwzs8W4z3c1E9wp+elTURWN4DDaoUBhdKdsQPjCUMjRcYwbBY8iFa342ftXs2QP9mAGoVnS97d8b4D142NKvm3cDJI1UzpdSeaURuzjDVYVjXpylIn07fowaHe0FYJybnArgtpf6nzvHgCQvV0HWNqGxn+4+l2OGWcvl3nAbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Scoq2PWNqrbBzHPnJ6j4uRZ93geFy4MJFtk30NC1+4I=;
 b=SVE18XNz5DToEl2eAg34Ip0tsH4GIR9NvbV+F6N67bCtKi9LVaOjWtyXzsTfpogzCbFa6HPh1ma2PS+1y79l/D8axJvnNFBPKeezuPl3EJ/VFfclE1Iwmz1oNXGdxQjgqIUfBNlBMPyeQKYQ4i1lpm/LL3hZ7eEgKHB734GvU2YPlOLclH42s1002JNClob5ZBlyPdG46zrDvpAx+nAeKRzJnOUX7P9iA3ik5lohdpZHJGK5Pr2dgMa7V4RN2erfij28xAKvtJyYz1LA69BtqfXhknYwvKLBdrAu8uJvoUfs2aSqUNY2lFzvwH+B3KneskrAxqAhQm27K4cxf38Dxg==
Received: from DUZP191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::8) by
 BESPR10MB992179.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:b10:109::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 13:24:39 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::6) by DUZP191CA0048.outlook.office365.com
 (2603:10a6:10:4f8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.9 via Frontend Transport; Wed, 26
 Aug 2026 13:24:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 13:24:39 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 15:29:58 +0200
Received: from [10.252.23.181] (10.252.23.181) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 15:24:37 +0200
Message-ID: <42bb4c3c-1dbd-4902-9765-01687b74cb39@foss.st.com>
Date: Wed, 26 Aug 2026 15:24:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
To: Marek Vasut <marex@nabladev.com>, <linux-usb@vger.kernel.org>
CC: Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley
	<conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Rob
 Herring" <robh@kernel.org>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260819163410.119755-1-marex@nabladev.com>
 <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
 <225f1704-399d-47d0-8bca-73a27a59bbd4@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <225f1704-399d-47d0-8bca-73a27a59bbd4@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D12:EE_|BESPR10MB992179:EE_
X-MS-Office365-Filtering-Correlation-Id: 596c24f0-c23e-4908-dcdf-08df0375617a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|6133799003|10067099003|4143699003|11063799006|56012099006|5023799004|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	j9agtvI9vK6uh7XX6vI+ChyGl9pDdjIyERBWLqp9Apdz0CgNdJWS9B+Xt/X2PWCb6oqw4locQOq94b2j2vVcvXnZ67RttvgnHqKZL36r5nLAv/6KctiFLade8moih86okrIT2hSbGsIFHG0Ez22peKOoobOBOrbJVmXiNbMcZpVPgpNx0Rn6fpjGaxXgWLGhpOnHx4jsQJim5n6/KB5eqrDO9VLu4aN2K90rDpYWjh/CjfMq1FS928z7KUUQ3UFuhhNb7JNUDK4jn9gx/pLmiQyk6jG2oCG9hQru7ycN1B48HDXsNs9TrSrnmx2l3VneVBcdlScgnfCpIEZIv32PmGD0vQjUidJb2Zj3uozoTJeGTka8xh8E5Ihb2T3JqGgZL+qxoPRli6mNwFKAJCIP6/iFxYBi5pLOoCU7F0PnbUfP1Iw/mYkM53SO5FCTn6F36KFOrUFuv8cJ8ucSJhfbgTIThvXlnfOBIX4cEFI/v/elf/pIu9+Z0ZTRRgiTnB7wOkIMcDg0d9+Q8Fv1qdfH5kgaepwoCeMnimV6gJ02BciW/ntRh3b78yTWedtHMeVOhY0AvOsBmYoSlpKRrGrVibABHgWkq2hZuAnEznfmUYeeUqSxnb6ZhFKkdHhByyLLkAi8Qrh55DPyLf/xZz6N9f9ICdGcLMlXZSqjwihJzquxLYVubB/39hc7FOsvI9oHEieAjuQoSPMG8s7/EHG5vQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(5023799004)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tHlwY3T6RUbHFPTF1g/bJCUqUwxOp+R3o13b7ZhhnOaXu64K+GLmAUUKmBkXhLfoCjIk91Mxuvc0eDQ8ySITPQ9GJS/4mx4ro/ZyEu8ftDNcXv/z7/8aRjVeoSWh+hK4+0Vyv1bqprT2AeRSLAV7hhVQx8VZ009HYbseI2rwzYB+706RIzueP+bG+3xywZhJUy+BwEfRvmvru2gzJV8512hVaA30xCGMN4tETbbmNJudW54FsMQQEcV0lZrmWYzsaiAaI5LDqJqM36eIH6CffUBQwF5kiZ3UZ1kcJpXkdHa2jNfZawYJvCpJblLQJ9cHQ8Z9r/vo72aEBum1NwUozgKm4IGjq284BRXVJkDYuEsiYOcVKJ7QFasvF+4sIoN7iNUzjTSq0woNcBEfAVFJaQuyUCQmUT9MrApFQJqBIzfDH5OYFiP+QoWBy0zLO4my
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:24:39.0276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 596c24f0-c23e-4908-dcdf-08df0375617a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB992179

On 8/22/26 06:51, Marek Vasut wrote:
> On 8/21/26 6:27 PM, Fabrice Gasnier wrote:
>> On 8/19/26 18:33, Marek Vasut wrote:
>>> Document ST UCPD Type-C block. The UCPD integrates the physical
>>> layer of the Power Delivery (PD), with CC signaling method, for
>>> operation with Type-C cables. Vbus and Vconn control is performed
>>> using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
>>
>> Hi Marek, All,
>>
>> I've sent a series for the complete case. Please check and review here:
>> https://lore.kernel.org/linux-usb/20260821-ucpd-host-fusb340-v7-2-rfc-
>> v1-0-c5e27cbc0795@foss.st.com/
> 
> What is the difference between this driver and the ^ driver ?
> 

Hello Marek,

That includes the TCCP I2C driver (and an example on ST boards).

> Why is this driver not covering "the complete case" , what is missing
> here and not missing there ?

I intended to show a complete case, e.g. UCPD controller driver and
external TCPP I2C protection chip driver. The TCPP is a companion,
complementary, e.g. provider/consumer relationship.

You've pointed some "horribleness" there. I guess you talk about the
straight forward approach e.g. EXPORT_SYMBOL() macros. That's an
on-going work, a prototype. I could have sent as an RFC.
I wanted to be transparent, so the correct level of APIs gets used.

You propose to turn the TCPP into a GPIO chip ?
That seems smart, at least for the CC lines switches.
What about Vbus and Vconn, it could also fit regulator API ?

There are various functions, the bindings should be extensible enough
for later use of additional functions. I'm thinking of:
- Over-current events for Vbus & Vconn
  Could be represented as interrupt controller ?
  Or could benefit from a regulator notifier (if used) ?
- Vbus sensing

My point is that, that can impact the dt-bindings or functionality.
Sending UCPD driver only, without the TCCP binding & driver, I find it
is a bit hard to review or test at my end without having a more complete
view.

I'm not sure which way you'd like to proceed ?

Best Regards,
Fabrice
