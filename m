Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC95C306779;
	Mon, 31 Aug 2026 13:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181652; cv=fail; b=HiU0ZBjyB2MyuW+F8rjf1nR2TVa0KYd2u0eVR+vaGeK6kR7L+XPHkjiIhcwNIvrW1vYTqZXl6gIL0B/wHoxzXBH2J2I7KH0NZMSmHCWKL+cAilL8Ry9JBc6YNWShaAkAqBbgLV8Rx2/tj+ugp/9+Q/yF83BYiXgHd3vHyMyAzaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181652; c=relaxed/simple;
	bh=Wb9N28xhNE8g9adn9NPgIzu35pjiEOUIHV9fPBl/7a8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CihrNmAIH7jnbZFz9IOLDCA8tnYRkQ4YmK5fROEkMCF8/wzyvO/fwelPkyz2dDVPBRRj28LZ+VQYbF7Sm2FtdRnlkWNKRFgwVSTTgxi3OKFhvrviW0fLkCY25c0/5sYRA57SGeyfbyyKotmWQLAd7rvVhBasYyRuiEsIREActxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AFPyuyAP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=nc7+Wx9s; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AFPyuyAP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="nc7+Wx9s"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V41kLY1377116;
	Mon, 31 Aug 2026 08:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8IpIThbnDztDWeDyTRP2hpo+1wK0BG1yT6iycRB7lBw=; b=
	AFPyuyAPT3V747tD846yGG5LETFg60bc+8g0XoTV0ycB7063lZBK7q1YLMB9dlzL
	Fzvh0EIIKvpHrelTU7nMl9fG50etjr73S/DEmm7FYuhu7iVoDLvuH0J03xPAAPTM
	05+CquDx8dzN5JFzM4iuyiPzP1G1pwYt0L0fDqDKjmv/TgVJC7ogHDtw3bfaOHDS
	LK7vBiK7rUNZmncuesBKZwiEVppBtsOeQqKaeqS30PGnsFWISg2Q7JHKAXK3htVD
	wV1Ukyrssy8tN616i7lt9wiIxQ53/bnuFYu8En3HC8fH4cXL9DT571wB0ypMTsuQ
	jWpnyust+Pp3Ug2xsyMQMA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023097.outbound.protection.outlook.com [40.107.201.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyt3nw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 08:07:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yz8vsep+kOifIArU3yV8aReHi9+l5OGYltmnDoCxPqta5KKCytP1H9nCgoRwbKHjHSnFCuzpR8tkBY/FbUQj4rgRo5KWtvRMRTxQxRvebKFDWFr+76O2GE6XU3mx3bti7lirD+5tGIcDZK42SZLsw8k4RGe39fncmzRIkcomBcSaWDK4tu4qpLzAyb2uHS0AMcGZ7R6+s2jx+WUgxqN68Tw5zru7zjW54wRbFOMLtqyixRXjPZa9fQVJP5UJciYZbmw4jmZwcT4xWFMmt8F0BjKHNNtrpsFR9mRVPwQ64BZs5pmjuRQEvZtaug+EYWp2P/ZcxjPR/DofLv+Ccb3n+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IpIThbnDztDWeDyTRP2hpo+1wK0BG1yT6iycRB7lBw=;
 b=zBHN8GqfK7b10/XbnFMGNRbXVHUg7LU8OGEkKQK3PU64wBKedQd7OtXdTcAG5Z+h0NbD+XLv6Qcpv+DWOEoMjz3FQljN87FLEdDBmm6czUDCLzyK7uVFRnRHLcOkqRfupza51Ll1arCI6y2Ydk2OQYG6kp5yywGOBdUgU9TIbTjQjSF7pd+gBzuonK1ufFeGSq7Axdp+Xc7Tnn9NR5VRTLNsworRikIJw38Dgh4bxJWTRfLfJvRjwue6MVPgvODj5FCm4R+rDjotm61Vtyiskoic5CpaVs0EpMAU72l2kVg6IAriWlyR5bbiPSOYWwIt3gJMsWAvqxxJ33s3b78GjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IpIThbnDztDWeDyTRP2hpo+1wK0BG1yT6iycRB7lBw=;
 b=nc7+Wx9sbR1ZMeOOlAhq4c5fURKpDCGfBtR7Puf2AZLQtV88CB67w1QNt/Fs0t/DBcKpn2U57s/VwyqnnjfevdWwt7UwsROxtlzItb+Coa4XVM0fBj6XHiECshSxY41cbEt/xtvO96ZTYYSv8IikLNMgUPI8MekN6E+EK5faaYU=
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by SN4PR19MB997529.namprd19.prod.outlook.com (2603:10b6:806:504::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:07:25 +0000
Received: from BN3PEPF0000B06A.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::3a) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 13:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B06A.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.0
 via Frontend Transport; Mon, 31 Aug 2026 13:07:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B0A8B40654B;
	Mon, 31 Aug 2026 13:07:21 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A1352820247;
	Mon, 31 Aug 2026 13:07:21 +0000 (UTC)
Message-ID: <d7761226-31b0-4d0f-bc56-9c4d5e42bfba@opensource.cirrus.com>
Date: Mon, 31 Aug 2026 14:07:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: irq: Invalidate slave->irq before disposing
 the mapping
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260831115724.135619-1-rf@opensource.cirrus.com>
Content-Language: en-GB
In-Reply-To: <20260831115724.135619-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06A:EE_|SN4PR19MB997529:EE_
X-MS-Office365-Filtering-Correlation-Id: 2188a85f-646b-4950-ffc1-08df0760cbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|34020700016|61400799027|23010399003|376014|10067099003|56012099006|11063799006|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nMS7HpmKSqWb1GJWdWbBzvr17AhDss7mLhtWABn5vAaVStrOJFRaBuu/Gih+yAOOQBR2y+2gsGuG4G9pdj+Xo+L8vipAIrq2uVFW03HOWVHJIpsobXcjqmoZPEbNxpBW0yamX2KN6jk+z42/B/2q8Jj2nRuPlZJ1SRwiRPGsm1kVrk8kJpWj1i38d9mGLyJxym0GHLEMN0qvfa1eiHJwnskjhUsAuFWISSLWJ0j5LXFU6qfFrhkWsDMQh5ji8ROit54vNONReZrfs3y53NcFcB5nwarL9rbKBUeFAs1yrUSR9XojoYSs9sxU2vols3Jjt/bm/bmTdVUDHhzmAQCMw9obtngYjlk1rAesTTqd8H2gx9gH8h0e6DT5cO4LtuWkiGk9WmitDMZlImcyNSJMWpv5ryDGl0oSGlxDwL0sARrwlWRm8SFG/JzzWFv9P078kFSUUo7HregJweVJ/8Du84JHd4Ibw0QhRv0qPD8p8T36O7HJaONULWsa9vaOJLGD3p6OiMGiynD2D4SFudFYibZx9F2Ixy586y57JL0NkdgMNE1P4QnextdYPdQjOufAFDsHKdVBiD2NQOKVANg3CxpbrxPG67fHr7jz9DOzOhHahxhA67kTimpY9yH2zeL7UHo6+uXBiy0ofT0BuqTs7wbaNBkwunfqRYKQhQMeyyMM7rWGOCE8bLco0jInZQFERR47JsIX4O7gHVpOz0oyTw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(34020700016)(61400799027)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x+qVw2CKrWSW4XcspGw5dVRupcvEDgPjEWu07XDcRgc5yVlqp3X8WJ0xRx7J/RZ9wUtn+xbzk4kYRUATTyfL+LRJMPKMB6JzEGhWUy1lGLzd3eZqkf8mLhI4xPKmdhzDCznBSq1/FwXeD5muEAzqJUPtY6FyfhtwFo/h3qequmr+OllZ8e9+G5g7LjT0oteqVLn9SbLhp2cdyHOzun0hnAjFlSb2jWD/089Vqd+i8raej3IkVKKJvOu1GH4aqlKjfSOrtnUyaYqQXa9CELK02q/sJmxxwCzCeMl8ovNKbjJ9STahFgONSNL+2SfOpRVdy7GUqEZs9ItUzotUOgBeYrqWdtSiqm3dPFLKGz+5NFV9R5AzXHBXprm8mJNk9U+nmunbFk/4h8bn5SFnZ82hLXBIJAWIqpE/L1TxqahmzV+X4dJZ+vyTwV1P0yKwB9hG
X-Exchange-RoutingPolicyChecked:
	q2X7G8KI07CSEyAQQ3wF6IyJ2uP/CYBPtY/JOrSs8B0/JG9KaOLdk9mOPGk5BzdyY6EozmQYjLqYAzW7Q72NgYHH9jicdpzC2KBvV9jfcqA4fuLu6qxmRcxIehm9OzVEW+1Ti9FoND20z2Gp5WnEWsP1Z08KSWonOEP/fJgn/0+UlKZSCdg1keXVIIZ/oQM9gDhwGT3TMXGD6UJtdiuTwddymrW1/u2WBJKriTTySb9eewPTunhXN5baj9Hfrp5/9s+3zZTn26ErfDJdPqkYrw2lMocLO3j1luBno1rYRUVMXupb/ah+hFZZ3nJCUuh8yLs3ytGLaRCLHYFUcvtBBg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 13:07:22.6283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2188a85f-646b-4950-ffc1-08df0760cbdc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06A.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB997529
X-Proofpoint-GUID: 2GK2QQG8ripIeQ06e2JcDKIaIRAXho_G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExMyBTYWx0ZWRfXy3O/PQgmeqGC
 9HdYY8qSE9ODuY6mH5gnlhY+uMbCv8OW1Vv3JdhbDa8DQ1r5WtYKDdABrrRWpTxBq5Ig318EpXq
 eZYmYjrDoNEJIjnnKF7k72W0AMCa7zp0ArzsZhTd4+8FPvxtTw7oWprMmt+i0DvhPQWqAzmV5WP
 x/0eIVumhzuBl+3kWT0eVth5hwUddr1S0SlyQ275ipxjev9uDETsEZlQLCRH5Wxm3G0tnKcUtOO
 tdYVNMkzVFS+IghRMqeouCWHtCsLtkelcHnRyJwalt1BIe9JHEGn2sDqsBsTYvtUBqXeNPHx1oG
 VR1uZo0Hw2QjFShGbzYnbUpAjdL6NTvQpO5he/5A86xKxPrfSUMWmAlknsrtO25CA43DM4I01Z4
 IFxvdlS4ZrS8fyniDQd8B4zK/GL91wLIZsD4iNh7lY7vlyxADseIssYjZMLePunyCztan+v41I3
 UgPUS1+j659+uj9hwqw==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a957c8f cx=c_pps
 a=XVr+MSEQQxWnM56OsALW2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=f5IPyWp951kalIJ5LUQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 2GK2QQG8ripIeQ06e2JcDKIaIRAXho_G
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExMyBTYWx0ZWRfX94OwiHy206l+
 NtneGJb0LUDkGwo094nscoZ5pbZ9yyiD/Qol53S4CEssmG+Ymr3eQ0kEZi4utdw1sgJiCcVjelf
 Rjcd3w+48eb39CT61jnSh42im+PWR5w=
X-Proofpoint-Spam-Reason: safe

On 31/08/2026 12:57 pm, Richard Fitzgerald wrote:
> In sdw_irq_dispose_mapping() invalidate the value in slave->irq before
> calling irq_dispose_mapping().
> 
> This fixes the potential problem with the original code that slave->irq
> was left with the value of the disposed mapping, so it looked like it
> was still a valid IRQ.

Actually, ignore this patch.
There are more problems with the validity of slave->irq and this isn't
really tackling it fully.
