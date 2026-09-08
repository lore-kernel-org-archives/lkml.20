Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A61B59221D;
	Tue,  8 Sep 2026 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888630; cv=fail; b=fjAnS/bGOjVoofeDAoL5sTtpOvgcQs485Lnbw1ZrRc9Z6vD0Qt4bujypXmNzxC0HlzPBpMWCxHB3zwZQgjyvKmNnyI7EA5bvGn/LrUJJIYUeot+a0RUFMbS5frweRkJjkT83PNpqFGufYA+HJOYxYc+i2x+w0cvDS5HCkJy/FvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888630; c=relaxed/simple;
	bh=aTMq/UShetUGINS1W3xIqSJiYF2iFwOqUIZ0I9eJ8ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=klFYIsqWyI6RLVPx/4Zl1Y2BTX0/Je2uVrkKRqXk03No+jnPU2x416RD/5LStU2LIQugTOV6ocaPlmL99tKcqbWLRWZvLizifk7+MM8VORJBCJiVD7ocHGVQfonhxD5ND/HbEu6lQbod5lsPCeij+Pj/uSd1rW/td9EEWk+0F4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=J/JRQmRN; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hVIrwLpe; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="J/JRQmRN";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hVIrwLpe"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688HOGnu2220205;
	Tue, 8 Sep 2026 12:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ANgQNfMobpQqXxox4Smv8byGjdXD23dQQZ5q6GDM6
	Fc=; b=J/JRQmRNlXGyLeRLoEQGtxAR1MyDj8bcVGMrejKeEu+K6AnRLwGtC1cZq
	1I8mG0s3XjPhNJLtyZrU16FO5enidjHYaNaUrImQSrptk1VoGGULs4/WM5rhwY5i
	jcFglMstk6Nzr/MY4b3cLAf/Y/fxwwAg/ilYzndYko5mXfG8GxB21xcQac17HK7C
	y0pdvVdzqOpRwa2wKsyGQ7/8W5h7K7aAlM2RAKM0ukklr6+l81BHcuwccJ4+/yGO
	2a2CIqU6oXXpeRvwVHyBojUEKqGNnge6CtqSYI/uYIUvq1oDOYWYlwXyIBHa382O
	Q8iIZ0RCy0KeyTnwxeIlwjhYLg/hw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012006.outbound.protection.outlook.com [40.107.200.6])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj940pbes-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 12:30:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=be8RDfRDKYPd8588yjtGnwpDDu7R5AgfZQdxLPjqGi9371u7L5mLpW7TZpgjxIOS4aQM3DgW3nyM98w4pJJwakA4Z7V0N2qDW4vJf0LsxuSrb4LOgxwafg9QvC5ieNTR2WA65TJyMRNf/JvYHh4whbkje74Omc+96ctV7Nj6KRaIHmjEdTkQhd/2p8OMK3y3+UzTNua4lUOWXTvMZYRdErOUYWodVD8PXVezjXm6JzSBx4mzyVqUhKuyHARnuEHf/r7q/rB/FrT+6wt3ilFN+uTwnjFq+N7d7SqPIKCK/5TmxZkdVTNwOtKswMJHzwGUkx9dVJLP3zB8aZL5e7ldhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANgQNfMobpQqXxox4Smv8byGjdXD23dQQZ5q6GDM6Fc=;
 b=fNQMRmwBhBFqDFESO/zQR7ze0D+jg5NlYb8Oerr7RVpmBK7637PlWre3U4xSqF4SvXAa6nB//6yI4guxhbP05uFyt5WLHU46nEujgCXiRwgE/6en/5xBSWN4F4GKS82o9G7yQM1BuIrD8OaSNI4Vkiha1scxYRggk+pT4KXfYxk5cgWtwOROr3t4niMkR8zmU5Zf1iQF2/RBriENeT1n+GAexZK0f4TUonio4R8xD0zaOTTrNnu0Gg1JvEqgaiGmzk5HTmQ6x0gpcO2sbUH/f3N9Tp6DwToC2pzC8yTewjL190DLLS/7eudmizu/F4NYqNyx3qnyzKr2nToxSuYKSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANgQNfMobpQqXxox4Smv8byGjdXD23dQQZ5q6GDM6Fc=;
 b=hVIrwLpeH54xkmIqFEvew3qlxZW66iQag19h8yRemUIFTjPoZMQvKTInJsAosA1gtpDcPxe+/iL6Dl7Q58v5HRQqJrbYz0v7fHGsXCYU1pbo2tRUxWb0WEwhQxr1OqadjSkNewTgKUk4IAEkcu0cPwN4Qr5Q0bs1cYMcCom9nH0=
Received: from CH2PR16CA0018.namprd16.prod.outlook.com (2603:10b6:610:50::28)
 by DM4PR10MB7476.namprd10.prod.outlook.com (2603:10b6:8:17d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 17:30:16 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::4a) by CH2PR16CA0018.outlook.office365.com
 (2603:10b6:610:50::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 17:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 17:30:14 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:29:26 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 12:29:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 12:29:25 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688HTQXR2890034;
	Tue, 8 Sep 2026 12:29:26 -0500
Message-ID: <e8abc328-578e-48cb-a469-1e3edec6780a@ti.com>
Date: Tue, 8 Sep 2026 12:29:26 -0500
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
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260908171613.bpd6eo53cjtlrztr@macaw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|DM4PR10MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 8572992b-f3aa-4863-1db9-08df0dced7e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DPhl8C8TOmQvDbzQgLyEjmvxcC9pVKw+3peAVfZZV9SfyHmAvYEn/Ptkzvc/+f7G7qWDLjAS2quiywvNFYk8UfS5TOeFLzgRAdP0w9s5RJCpk7cbSMMWK4L7L+rZO7uCQoPVxqfyZS3RpSI0KtxU3IRCPXQnjzKLSEBc5sMlEIVU/RrRmPRm70XJSw1jHCe2Pnm7bOSfFpPzaBFqcQjcwmKbJo2RZfYKrdjdqWRaWRp/dIEke3Owoh+ZJbAmp6dCmHeszOdB0OUxAgUUbfQkYlJfM1GcdckBBTcH21qQ7FRihwBhQVUjzb+9oOyXsPdKkiqk5yU3x7ij3DAqfEAZZTjPpZy4bdIGGYbpAndPBV9CJXxyH1WOx9doGMEs0fKxCUaDL7a9aYrMcGYtBU7/bVvkHosJtXJNHwbVW78OscsxrF4SLW57waqikRyJaANUoWsjb4f2v5bPznr0LpYXjJ85+lsCq5cCW04snP15sR9OY2+YPBR7R6HQwDSG/pfBQeslQ1uAEdNxkYJkh9bhuXsMabrMxi9fosCV30lmTFlpk5enXPO0ifx+mkBc8iLKBz4GZ9eWvC6Dlva9Vz4+qzkqCQgp3syGpEggNmbaFG1UDM8guZTcUUbl8qDXlSpCsIABLaqnNSVGkKz03Hz4cnieXArWK9L7Nm6a9FnUd6iWAihZBQv4JfmS4pJqoXZUk67W6Z03a6fnuMGQGqDKaA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e6PtZUV4zVzjZTPuI2wDKziH+guMSj09ynnYLzCDV4SMfJbw8q6lx/yUYmoyR2TMN0XIjBc0ilsuL6jmuINpjYl/w6kXuI4kzKtVtC7YQ48v7vjQZoY1CpbB9v6kRG+feTPgn4OS7Vo7RMFxlUc16xn2o9oVC5Jp2uBX920Sr6RwaiqQPYr+mv3uI+fWM88UkkNiePcZVWUPpg1aSxOJW7wsIN4c7GrQMFeL/8M+5KzmbtEq9E0Fv2yTQo6RQysadRiLalExF9zON5yq6cGLu6z3leon6UuX++FS7J58k/TszMfaGgrBEy0/+uQS6Y9DRjyeTxOj1t+AtrvtWkz/T9ehXAo8tEZCigEmWOx3iMnF2sh4tgvPjJnBIxf301YaAjCzEcm+6lOV2L0voz/adggbSwt2mrUVpPIKHnwblj2daOxuDrB8ym3ZvKvdW5Wv
X-Exchange-RoutingPolicyChecked:
	uK/kp6YuIZz5aad2C9A79vrZue+RcliWKqHfAArAAnQZ3aV7li1TSunSg301tlnaMz3FgC9+J6oqU5+WOm4Sazxm33kZaMfItieoeKWoskE/aCS+FWWTIKDzZlc07t5qAuvlhpBmLCI6Gj58YOv04xcGh0LPX4WXn7/0qwM75DRxQpokf4QdDlhZHDxsdrG+Yf0Yi2WhiYLrcktVMEaKDz9xg3nZOt6/NwDlK73UOElCmvzHtWfHANefG5HWfVWBboq8eOzyqoJQof/REDWumRJk+q36v+y9EN5BN6ERlDMEEHQnZPNAVGnPCrLaFmW0sBuNQBQgUNTbclXQOcx1Pg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:30:14.4955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8572992b-f3aa-4863-1db9-08df0dced7e0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7476
X-Proofpoint-ORIG-GUID: bALia-mhsCCI9D9TSTfzmT2n1bAjjqeX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4OSBTYWx0ZWRfX1M4jugJEjBGL
 OotuI+DCkBCD4ddeqHFK4lHTzftz2WqYjWNq/2Y9+//0WiUVBMXI/MLLJ4XIJ1JGC+hbuyCNmji
 GaHqid4hg5HRO2BBwgaOBaffDApV2XsNzLRP6IHASAqbkHsq8Ecn7prO4qPixD9FLjS+V1yaCc9
 SkDuWTq7Kd99uFDbNeKJcob1D8nrfdHS+7Fxk0P9LvEytGLHUUFszX9Unaz6Mzfv4fHEhibhaV6
 i8awsjWQkJDkXBXVRuxvuwe5nItYXtgR744l6gJ05FxqqWfC8f+LxnYZta4Y+VgSdWYDcqcfLLW
 WGHvlZ7m0pQHhgYDsFPPJrQrYxdwuE/wdtwYhhsqoRzvNDc9Bi4P97eY86Q2Xp5Sk1GuLyFCvMA
 9Ho5PbEsAva8h2lGYyqQ6hSfFwp4d9VfE3IVzMJURwxkQpLmRSVHWfw7A25kpbadDYXL1IzFFBc
 ab+U+5AZ1T5RBwR+0Mw==
X-Authority-Analysis: v=2.4 cv=UrNT8ewB c=1 sm=1 tr=0 ts=6aa0462e cx=c_pps
 a=wcVwjJSTJ+Ev3TLsT0vURw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=Ej_rWwzPPZ0Nua4SC0UA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bALia-mhsCCI9D9TSTfzmT2n1bAjjqeX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4OSBTYWx0ZWRfX360RbXYsdUDq
 ERAWrs5maVAONqpTc4FJsVb9W+0XRAL5yPjqs5GIjLgEXOF3+LCBpCMWxmbKxOB0YKC8QmZAFLZ
 lLFMNsvfRWq3D5ojf1WM8pTw8mcQ4ho=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080189

Hi Nishanth,

On 9/8/26 12:16, Nishanth Menon wrote:
> On 12:06-20260908, Judith Mendez wrote:
>> The AM65x EVM MMC1 VDD rail discharges slowly through RC circuit.
>> SD spec (section 6.4.1.3) requires VDD < 0.5V for minimum 1ms during
>> power cycle. Measured discharge time on this board is ~632.97ms to
>> reach < 0.5V threshold.
>>
>> During boot, MMC power cycles between boot stages. Without power off
>> delay, VDD doesn't fully discharge. Card retains 1.8V signaling state
>> from previous stages. When U-Boot initializes, card no longer asserts
>> S18A in ACMD41 response (already switched to 1.8V). Host misinterprets
>> card state and forces 1.8V anyway, falling into a bad state and causing
>> a boot failure.
>>
>> Add power-off-delay-us = 650000 (650ms) to ensure proper VDD discharge
>> during power cycles, allowing card to fully reset state between boot
>> stages.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
> 
> Fixes ?

Fix is really for u-boot, don't think I can point to a u-boot
commit here can I?

~ Judith

> 
>> ---
>>   arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
>> index ca1300e130936..edcf039ccfbd0 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
>> @@ -460,6 +460,7 @@ &sdhci0 {
>>   &sdhci1 {
>>   	status = "okay";
>>   	vmmc-supply = <&vdd_mmc1_sd>;
>> +	power-off-delay-us = <650000>;
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&main_mmc1_pins_default>;
>>   	ti,driver-strength-ohm = <50>;
>> -- 
>> 2.34.1
>>
> 

