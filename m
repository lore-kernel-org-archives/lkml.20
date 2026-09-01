Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398FC3D5C0B;
	Tue,  1 Sep 2026 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277126; cv=fail; b=tFDnq8g6tv6KoS883w6ohQH9FHN+hoqgwjtwQVzbdfOi6IZ/TSsPmr8QS3KyUAAVYj5PVKeJBB8ppNrgCne4raggiFmdX6gPVGbWQQoSdqZnlRZA1/ReozpAivcXzLq52JB2YVdND+h/8IVNMqYhX7Lqp5RYu558KliYoO59cZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277126; c=relaxed/simple;
	bh=3+rE/Miqx6fSqxU9ApG8L6hGywQFXzqk2BS4Eb8ZONU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1QFd4VIu/+ya2v/GxvNEVlsQ9d1lVMQwrAt18t1Ewji/7JT1OShZjLf6ox1w+Ju0NtLof8uxQnl83yFOPRkWYFP5pzaBPhvpFSRyIyuBYBoR1XKNMApJj8VdBOTuaaGQ+peMxZ41OeyeRIrETUG9iRLPLPXH11F2MYbGPsfALE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p3YV8/2b; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CBfM+AmH; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p3YV8/2b";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CBfM+AmH"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681ER85j575586;
	Tue, 1 Sep 2026 10:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Myo/M9y4WZ0oJ/ylXR7+dN38hO0oQcqzrreyUY6kxM4=; b=
	p3YV8/2bk8oX71GXZZy4QpxCDWdXOEGaXHyRcVNwl73aVXRA+DMT4znZGpgEpFLy
	6lo4VdLWYfNMeChStvzmYcbefu8BEWsvUhQQktUk1NTu2+XMjtBQP9s8U36G2MFV
	Zok1Q1CxKYG7z7umvFnTDZvB3UmSzGcemiTqL3Ns3i/0h/2ioWH1l39F/pg9Hjz9
	PkJeiwDz+w5AWrNkUvkbhi7VsaI5O9eHHT7HLAjtQ04Zukyhb5TWvZpa492z8e3t
	mfSGOmLNvud9BW3/Udu1crB0cCzDJydHGa2I592ep+IUsHNF4BfhVCsoAbAYLP0s
	u1g6qZIz6NXrya9pEZfZ/A==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022115.outbound.protection.outlook.com [40.107.209.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtyv27c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 10:38:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWGvml4U/2i46cRSd01KFecQJAmzUkO/w8IhxFoTCRGYZcrzEDn6y5CD0zj4V2XgzfoX0vK366oxhmgQH4h5HEtWv789wKeyoJ7hQ4Oz7Z+EXvRuFYOWpSurJpVnLzoyKmnQtI4KWOKgBU6qtpr22B7QPsxuge9v6dXOLRN9UOojqCpWowTIKZ9nsHBZxMSIuGqfPVq5EZTRukaxFamnOTF4d4pS+mD5vLWh+hkpsSYDNlfkgmbLEeqfsmyK7h5RS3HokcwjXIuZm/uJTdSPjQzzTEno4ubG+WGKRXNvJYzlpI43ep1SVbA+1xxtYlxR8aVvxGLM9yoe8Dg+KDHTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Myo/M9y4WZ0oJ/ylXR7+dN38hO0oQcqzrreyUY6kxM4=;
 b=gvMiR+wQrU76FbX3hmC4Jy4mbveybY2AglZUYYmxlfUkODaRB6Vkf98cZHB/LKQebj+7fqlSNx7qqgpeK0ZJAYQjQ6MhpaYfffBOCGifI6Ev17Xrn2sgqlkE1xMaDv0DUW1bbgBpZrzs/lqBAcTiqZZRV2Xmzr0Ia6S8fGfx+4a3FDjevZ/+51E7iOy/d7y/KB8G117XUrIFss73hWgiGoQJPteAQejaWbbfL6SkN2vNfE6pXkCCGC6/gOAHp1P31jtvTN2/VTmAYwCqbH/X0zH/H5827isWODzX0ic5YLjFmiPAOnFmU+kZ+aQgCOFs8zWrVQZcYtGkPvQJ89NB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Myo/M9y4WZ0oJ/ylXR7+dN38hO0oQcqzrreyUY6kxM4=;
 b=CBfM+AmHJWsd0E/cjjD96C/05m9zWZYOCeKXXYlIfJfxhjw/N02RNgQxc591zpomHmJ8KYo4X87gKqk2VTbA8TAdRPKTft+7IqqH/uQxmgf3YaD4VdDT+cacBFJmdcDEyP0Ha8I5M7ahnpqSEhXf8tW2oQRYNWAF3vgFZZ8VMYw=
Received: from MN2PR15CA0038.namprd15.prod.outlook.com (2603:10b6:208:237::7)
 by LV2PR19MB5790.namprd19.prod.outlook.com (2603:10b6:408:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:38:39 +0000
Received: from LV8PEPF0000006B.namprd03.prod.outlook.com
 (2603:10b6:208:237:cafe::5d) by MN2PR15CA0038.outlook.office365.com
 (2603:10b6:208:237::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 15:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 LV8PEPF0000006B.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Tue, 1 Sep 2026 15:38:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B7DE406547;
	Tue,  1 Sep 2026 15:38:37 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8C668820247;
	Tue,  1 Sep 2026 15:38:37 +0000 (UTC)
Message-ID: <ff3602a0-f1c4-4b84-b1a7-c815e48eccb5@opensource.cirrus.com>
Date: Tue, 1 Sep 2026 16:38:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: cs35l56: Fix probe deadlock waiting for
 SoundWire enumeration
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260901122644.634494-1-rf@opensource.cirrus.com>
 <7feebecc-66f7-4ac2-8c1f-0b8bf55cb528@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <7feebecc-66f7-4ac2-8c1f-0b8bf55cb528@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000006B:EE_|LV2PR19MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: e8eca984-819b-432b-2ee1-08df083f17e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|61400799027|376014|23010399003|36860700016|16102099003|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	1iWnZwMxKZ4RCT6jHd6vnf5S801UfsN3qEET/4xE3reqGjinahzWWVJEK8Fu78S3PmulLIx1cfHnGxFzoY0tubOGEMHi0tU2nl2hEcmss4mUPjZQ6cjDBUb0lA6r1NNHPHsC2E7MmLmpORz6VEoCLb4yfWdObnpKMg0FRh36ekspqU133JHrqv62yw0n8fTE6Kqn+UNaUjovP23KvgoEiAbyj2epC5pYJTVfL+9lPATnkBTaaYJSdfoNin2bh2WIYJHQK02MS/j942ywO/JLZF3+tsrwFbgSOSgouXSwBt0wCL26T6SbIPlOIrNxmr/rlU6+IZ29zhlY5cPgnzk9wJBP26KigqL5L9sjSZBsGTmSXyicJ228489ezpe+mBnn59dDn9/Am5EFAxkYlGSJSY7gUOZd0o1n0rH8k8ptDG14cLQJu1NygB1PiIkWLVqHfNZuqZPOjM8Csg1uJ+a1UmPFc0L3I6opqYKCPdR6vO8MkFthYhDq46dCAKuDiioEIpJwrPfz2Z78EfN2ETn+N6xMws5nKU1R/8kY02lFRSia0BKTqhA/tBH/NEIpGk8NkOuovDGGD0LYENnJ1pLN9eO9+jPaqbRhiPJEziy1uZRoOMVoTCSv/I2npmSntQC2GF0RcdXUvUm3IWtjDpM/1eGG0d7K9++BzZpNcWRndtFncllHjtE7fp5XyahnuVNRQuQ/3542Sl9E7L2kWt+dcg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(61400799027)(376014)(23010399003)(36860700016)(16102099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PjsiX1f6lQtagVTm0NY9vV7jnk429hJY2B3IeDtOKLTcLsrcqPCEnPUDXC6SPX3ntSLL3x/aCdEM0JEPLbCYN7N7v2DrzUUlvXuLGno/DJXP+T6VWTs0og9qsqI2IwzInePsj4QHPvN6f2dSS1SnM4+i5l89CvwCBdM8lkaAQ3hPJ5Dwr1d/G0wxfaZqJQWw1foLX+XBzzEFv56Q+b9mRD2GY7xOwpQoc2frFsUUeyzq2uTu9vvEJsmvWuRnJ5IIyjV8BNaZJSBPBflPYL42N+YGSZSwS9rPbIQtx5P2Nwk859AHcxAp4X+tCky9MErkAwtXMCJw+GmLmvCgbjFsb7l7vV5myqgco+jqUpQxGCOixNS7P5x94GfdulWguYn8V/X/QZSV9V05Ze/UUM184dvcOOdcvdNHAWLKAAM++mGOhs2sd0OjwF1o2W9A2KcA
X-Exchange-RoutingPolicyChecked:
	O91w7zitYy6rwVqsFhcmbhHAImuVZTMH6pcjKHuptTizpcorBEe7siPcyopK9W0Xq6InwXbZ9r6ntpZw110FeDInZll53fn/IVwJvt3pvIKCca1grTv9WhnOVquebFZGKjXq54fut5PFPJ7elScZK5IoRMm4Zw4lE5WBHtHF2lo5wVxxNvPy0Up8LUNi2hh8bj7WlDEekJxyiF4zVj1lakjLtxQwyEyz9T7DcYNrywGBePJ1VdTRXdKxVBUl0C7IQ/IqrRIgwI49MqE5ijRnWN3eWOc8XIQnZ2WaqCFu6I+i067yRcc/W2CbXe3L/aCQuCc6eAR64PNKIIHPlfm0ZQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:38:38.4358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8eca984-819b-432b-2ee1-08df083f17e1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-LV8PEPF0000006B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB5790
X-Proofpoint-GUID: nJRrez73i4nHIuF4zobxTF-rUqjHi_ww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOCBTYWx0ZWRfX1JN4WnVU7ew7
 gRjQxRAKMO7HPMa/UvUObxLZ7fZXGMqtJvkJm8dDwraIhP4vdA3kifIOGJHZISMrNIToDIH8q5c
 ztuJbdPeIqY9etyHprpej4jiaCFVY1fNBdl+4GW1m13XGefitR1T7izTOTNjdsqJCfl0st4xXr+
 XcUlYhtyhVGeIgfTkXoFvlrs00AcpmHqYncwfkn4K//2UQvXKlUwUhuy8ul66hw6Tgs00hCuFuV
 ifJXXKHSeXrWpp2cc6H07OBSUZQwJeHCXaCGCI/DwKFJ722Mghr6jGDMH5Q/INlnYbwMuG3cm6E
 GArhkC8xgT3VjGWRURZ3dYdTpUJBPelu8KmfneO1aoeJRtvApgr/sK7pUP1Nq2IlqphiOdmHmr9
 h6FhFfll84Mswa7NUN7Icyr3+8SkEgbsNFpsNgPbhYJMyTOiQVtNoFviDmHqaTZdPHDU7xhzpOX
 mzHN5JpH2TSDmqlZQLg==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a96f182 cx=c_pps
 a=ckbzw8NX8UamirBUBM1bcg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=sizZBpgRcknlThNDukoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nJRrez73i4nHIuF4zobxTF-rUqjHi_ww
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOCBTYWx0ZWRfX2Edzl9HbP7il
 +8hpOnFV0NlHdvr0ttP80mcK2PhNW5gkUOzkTDloKH7iyJec0xI1MoBm3SpBY9SvZU2Yrt96QF+
 DCH7bNOqHiuZL/pL9EPTjMeCAVVjqRE=
X-Proofpoint-Spam-Reason: safe

On 01/09/2026 4:18 pm, Mark Brown wrote:
> On Tue, Sep 01, 2026 at 01:26:44PM +0100, Richard Fitzgerald wrote:
> 
>> The work item is queued on a freezable workqueue to prevent a race between
>> the work item and system_suspend of another instance. If the workqueue
>> were not frozen it would be possible for the work item of one driver
>> instance to call snd_soc_register_component() which then calls
>> cs35l56_component_probe() of another instance while that instance is
>> already executing its system suspend functions.
> 
> I'll apply this since it's very much a corner case and there's a real
> problem but you should probably check out the kexec case - it looks like
> it misses freeze_kernel_threads().  TBH I'm not sure the issue there
> isn't on the kexec side, it's not exactly a common case and having a
> difference like that feels like asking for trouble.

I think you are asking for a shutdown() handler that cancels the
work.... ?

If I've got that right, this isn't so urgent that I can't do a V4 with
that change.
