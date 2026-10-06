Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8CD39D6FA;
	Tue,  6 Oct 2026 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280437; cv=fail; b=Kih0nMysaTar/NBa4kLHYk2ozmLl6Xtm2UIj1N/Bu7/9r3iB84utbcKo1yNzEYy4g59GcUA1p5/c4u18A7T2apgMxUzRHTfaZy0dQ76NaOc2fqdb3QrORIdKXRfNMOzbsrAEzhp8ccY9W9uHqYLZ20twWbKUkxJ16M4a5GN3XlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280437; c=relaxed/simple;
	bh=ix96NjRYcA9JMK6eO9KvdC0/7F4/zNTLxPKbzInGGzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FvksCl4VnpEE+oU5fdCRrf+hE3Dh1NnNot08sHNXJ8x9Y0OZn2hwwJJVMbZWXzRFu0M/vr4gbroPyF1gXRLXz/HjJUnKVTd4aP/j/4cTbJODFdbEfeB8RQXOQxuSlT6ZqD6t+q8feEIWQlEhV11CZKrm6huatlkV7vCekv9A0UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=c3JFbexu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=buWsd3N8; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="c3JFbexu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="buWsd3N8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6965Hplv3392737;
	Tue, 6 Oct 2026 04:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Zji8A2987OWPIOdeb7f8U2mOH/9315CEu/mVY0H0WX0=; b=
	c3JFbexuCPLdLEKNR+BWPr5jn6Zb5aaZnLkxUwIgObR0aDq+ka7Ms/Qk6Kxaw1IE
	//W8CTnC01P104F5ypqZZeTchIqpSmXU/CR4PCpU4xntToabbz60HZafeIq4pKw4
	g5qV5OVge8bRdxiln+fT+ED9fIX7DKAnfEfGFyIAZo0M0FtiukcX39LdIHon9x2C
	VAGTFma6xTGYbv3s1Avuo/JxFK957rE/3inc93Kt9eycZguBqpp5TWl+ESAErCTC
	nwx4t3FjB9h7tGAlSjX4lujV3q8DNipC52MBwEbUcTWk/1scaj2IGtxEo+q1IfPW
	FKb3IKf2YSx0K+jaNi0r8w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020113.outbound.protection.outlook.com [40.93.198.113])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h2x4hbd8a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 04:53:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UX6slRYRBPuFovmn9euDbf4K4u37PuRl3vcLpO8p9AYH9cjDBUO5wrYLkuFY99QlYHMqL7tjGety+L6cGZhUKFzL2FfnxzNhXM91ScEyHmnafMxz3zMfQG4IskvvQ6QgkQBzsP66Bwht5Slnm7k8cKQ9h6bKOI5a3F7uKHfIIGtZghql2I2bFyfeqr+nEeECWz1/m4o9Etkz9/KMfvL3T77RGKlenzSgXxDEBp0kpzQm0Vt/1PUfAvvvo59N7NwenXMqtVDIXAXpN1ZdYaETE2RwF0TLeJ2PfCHw6O/N1G2gfppAQQXKrsIxXmi5sfbW3hdoVQ0Oj1cuSoPIJN7srQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zji8A2987OWPIOdeb7f8U2mOH/9315CEu/mVY0H0WX0=;
 b=FxxUNMR4JYMHkIbNUF3/Cvo2qivHq2F2g0KzE4CJqfo3TzD5aaj4IYxj6C31Xji3JYrr+MwFJsi/K0SdJlhTdRv2iRHwlY/IdaMz6vvgtq92K7jR+vCGV2PxmMyKcTKlgsC7dWvCnvQDGd8DfUilURbloOln5xkik2vnSRxpAbNxW5Xz7B6PKuTuqoHC0uSKvmGxSuoiQDxNx9pdoUflWNh7v8M2NQbHUzY2PS2Kqkhn7cijWyX75zZsLfc+jEWZN+tMJUvapspXU/t02eTRqm9+wr6nwkmpyAWk0clKc3jCAd7E/SiP4wdUKWHEw2bdLw7qnZ8mRlNFisMiBFyX+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zji8A2987OWPIOdeb7f8U2mOH/9315CEu/mVY0H0WX0=;
 b=buWsd3N8kjH99kSEiM8/HZ4eFNJa4c1Sf+8lBixsGNt6vwMKoR4zT1aSLSvkKa75+hGlOyhFqj9cgxXOzE4OluzxydjhIxurB21f50RWSW4GBSw38un9aNljdq6h1z6VU7820j4S4YoWYoz4gbdO52Hwax+PKKV2aDvmv2uziWg=
Received: from MW4PR04CA0142.namprd04.prod.outlook.com (2603:10b6:303:84::27)
 by PH7PR19MB6592.namprd19.prod.outlook.com (2603:10b6:510:1b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Tue, 6 Oct
 2026 09:53:45 +0000
Received: from EA8PEPF00000009.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::88) by MW4PR04CA0142.outlook.office365.com
 (2603:10b6:303:84::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 09:53:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 EA8PEPF00000009.mail.protection.outlook.com (10.167.249.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.14
 via Frontend Transport; Tue, 6 Oct 2026 09:53:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 04920406544;
	Tue,  6 Oct 2026 09:53:42 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E085E820244;
	Tue,  6 Oct 2026 09:53:41 +0000 (UTC)
Message-ID: <d510a866-86c8-467a-8831-b373636874bf@opensource.cirrus.com>
Date: Tue, 6 Oct 2026 10:53:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: cs35l56/57/62/63: Use the correct SoundWire DP
 for feedback
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20261005155235.1386525-1-rf@opensource.cirrus.com>
 <32e25f8c-9c96-4385-9f5f-a7cf8b11ef57@linux.dev>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <32e25f8c-9c96-4385-9f5f-a7cf8b11ef57@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000009:EE_|PH7PR19MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 9698baac-134b-4497-971c-08df238fb5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|10067099003|4143699003|11063799006|5023799004|56012099006|3023799007|6133799003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	agWJFqqzUgz9HgCN0DedvctsbTeKbzk/xGVCav8NQTy0wExQAIdXY7VFbMIVqYj97zVL8FMevUD+wKtqsGhLSbrOO7diuxJp+tVBkKZms+zlLDyyJmBjjX/PX8BpF6fh7b4bgA++mf5t3LUCtaq+yB7MvN+g0slE//x8dFzdXPfz4jKktRCWoBfa41umGIvZimZvW4fIOlUs5CHg0LdKD8ZlC/hC9VZ4qKNwQs0oTXPIuwjmJVP/GixuRPbce4RbFnoK93kkPYZO4S3iZsfbmqmPqSQedG2KA6kNWy0EBnm64w0aVIPie6vzBhrANZCHejlnN6yK0SBfNbxnDtoFBNSZp97F+22ydrORC/tnR+XziodDjryVqqYzs/W4vOLXAIWvPX7CTIyo0AakL0LejHrzfh7QgAjjeT++NGt7A4bgPdEG69f5bH6c9YvV6/gJIKyAX3DMM5gynw8le7MpSpBFjCPMm85rTiLIBENTAycrr6iACGEhCNUzZdFHLq1nEdMQCvCZ15UASXYmB64Uj1OPDPWNkU5OZ7DMc8u+HmKfwYijqHYELtFLyjdaacNaYQwtuVZaQEjG60oJZNrgstb4J3R5hjWkY++BWoq86lQE9Q867XwXLResNtBcStyTYQ8Y/5AyMTUKs2RnHXiXBfNoIC4Dxo3L0EzgdOpmSPND22XSv0E81ZWTfFQ42tkVrdT4nuQB0zkUFjs+1KYBmA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(3023799007)(6133799003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3KPiBSCaExLs1vQPE0B0+6Moo+C52N9SNE4fh/0NkAwcQwzDlYzGx2PuSQOCcGt0SkHf56Ogj/UQ+s293tF/XMO2dWzsSlQXZWyrljpj5uSPYXxyTSRDAT299MPSoSLGsT9I4STkDcORqOwTyBRmWBQ7cKKHPdNEKhw32RK9FVeG/55gIM+s7U6zlCXdUpCagDyF06wMBa84IzX1xgfQ348HNRScBzkvBNkVGI5WT6MnqADmK5p6767MNz97DmQnxO1kBPH/1y7sKK0sr0u4hABzp4BdaIWbt0Dt+lJrtoD5b70N+/VbpyCUkrHWGqE3r4s5o9DCynJrBTdFiW6PwUDcHM2XppmF3IwNx3jsD00FwMpaFcNtBwLMqsrIWUCRf7lQBrr2GEqjr4kMansU++Dhw6yd96Q7BLisMg0XNifKXDPbD0CUAAtymCTOA+Zy
X-Exchange-RoutingPolicyChecked:
	x67Vagl8F+lLge5ujqtM1qza1vO6PXDo09Tq3dzagbPAHjylNDVh7GnZgf3p03GcufVFJ0n91FQulCK0Pgb1MVhUMHwdRBaiC/rd68IISPGGZa3DfFPc7ZkopzhHzvka7ViYWDQ8kDaIFGn/n/6brG8CR6VaWLg/9EShJapo40qhBHL1onHr0Fhxcf6khU+EVFB8hhFqWWxi68UGTTtvW6BzGrNsWOSVRyPGGeIpNr1nVJvjswcqIicWMQLKU9ATObq1l9l7yV7xWgv8hAZAaTtPvKYGNw7t1tHMK7TakaBZp3jALypkDvReXAjwDPpCyi/3+EeJKUEbyiDdIGjezQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 09:53:44.2885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9698baac-134b-4497-971c-08df238fb5bc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-EA8PEPF00000009.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6592
X-Authority-Analysis: v=2.4 cv=DuLDa2/+ c=1 sm=1 tr=0 ts=6ac4c52f cx=c_pps
 a=H30LXO4bGSsCHJ4yv39IxA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=Kl8oUV6wqCJAPYVHgv8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXy/4PVDLYnBqP
 Xre63o3t8WT2/rzl3q1Ewe5gvk3kxSt0fYkQ95YraZjs4lgWnrqGJJTFWaf62MQWklkNVF5oyfb
 2YMhPQrwoLoHrPniZN0ecL7d09CflE/kJ4neah1nwSJq4p/4m6rlrh0z5x41YV1qvZOdbP7rtXD
 6ICKP98uEPof79xI3mLvBrjwLQ3CEQSSnZyAshirVim1ygIplenUkbU/0bVHfnW12LaKpjuYtYr
 EpxFY6lkkdkjtKJ/0dJONcH/Sz+5yll7nXpm3uviSgxqNywiP5qBiL5RICcj5ea627FQygVWVBV
 NRB/ZtREygytPBe5bF8cJldkWdaaRmFCKAb48f7O07xfIK2PtFtweBMha+Wh6Ihh66jBBB1jqwg
 DTV48flfzxTRkAgKVVQHPeclrzQysX2Eq20PF45TWdF2TsmYAritDc4uLNxCainV37IO4cX7u5q
 odAHje3sMHC9qMKNEcA==
X-Proofpoint-ORIG-GUID: hkn6N2kftS7Wb4oWqs0kLer8L4xovSYD
X-Proofpoint-GUID: hkn6N2kftS7Wb4oWqs0kLer8L4xovSYD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX/Oo3+0NVDjAC
 i0u7PkxuB5ClfR78rmj8i+xw3pZtTMH2zTVf6FLNnCDh5C5aAO8ZGWJWykNHzKoMiYK6Z1Eclrn
 +QJX2DJzBGvCj/LgX9wGNbcKkuxZ6nI=
X-Proofpoint-Spam-Reason: safe

On 05/10/2026 7:33 pm, Pierre-Louis Bossart wrote:
> On 10/5/26 17:52, Richard Fitzgerald wrote:
>> The amp feedback path (AEC) was incorrectly using SoundWire DP3.
>> The firmware outputs SDCA OT25 feedback on DP4. DP3 is reserved for
>> SDCA companion amp.
>>
>> This series adds a DAI for OT25 and switches the sdw machine driver
>> to use the new DAI for the feedback path.
> 
> Is there any merit in keeping this DP3 exposed as a capture DAI, if
> indeed it's intended to be a side connection for a companion chip?

I kept this patch to a minimum because it is a Fixes: so it must apply
to older kernels.

However, you are correct. DP3 isn't used now. Not even on companion amp. 
DP3 is a companion output from the amp (SDCA OT127), but Cirrus
companion amp goes codec->amp so uses DP1 on the amp.

When the driver was being written the SDCA spec and firmware behavior
were not fully defined so pairing of the symmetrical DP1+DP3
(for play+capture) was carried forward from previous amps. But SDCA
doesn't provide any sort of UCM capability - widgets on the device have
defined, fixed functionality that has to be preconfigured by the
firmware to match what SDCA needs. Ultimately DP4 was more suitable for
OT25. DP4 also works for loopback testing.

Removing DP3 would also solve some other problems that the driver and
firmware are both "owning" the registers. We originally attempted to
sync this up, then gave up on that complexity and overwrite the register
settings the firmware made.

