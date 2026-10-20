Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792502628;
	b=M7CUk0n4StzO+pm0wwlT0K1JepqPVkBzp4Jj4Mv9u3axQTLcDACrUTM43y/MgQmT9NcP
	 YXUQB1k0Nwkpi71rgIdUdd3EzW/7oyPwieZrtumag+SZlf6cm1YPhNqvIjv0/rUR5NAiU
	 Omnh19+sG3AECyefQaIIr5IXQllgQGwz3hCaauOP9zRyxo1LfXlIzwSPnD30Buwlcan22
	 j5sagIYTTIGHIyn37z2ZwRuCbIEfMZQ74tEX6POYjw5cJSh/G/jvt3GGoOSfyiMxp2hx/
	 nJYO6A/R9cLZDAPU7espivlIfthToqHdMZfyA5ul5ytL5Rw9OFOUC5J7GNE6/UoCnEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=Yw9yGQ5N+krWMG8waeGPNo1nxp/SQbLsFdCa73jtz6s=;
	b=ylxQHm0DBEU3TgxteBBZNhjWosZ8DsXumcK8qdXRB8qav1h5PYhYKE4lMO45lSyxbbfx
	 Ui8e6dxKuJ2RZz3NCqWydepvV4/IV4SmXnQPYzXl6z2MzZO6K9T9F5MxzgIbtJEVona05
	 kseicHvDmV8JJSttMDVPTLWLN6krrp0LR9K0tgfhm/YZnlKbnwSvdlZEckH156KL+/3CS
	 NQcZdw11k343jLboPCdCSKeW3tko7t8wkDuGupr64KjZhCeXo8k8hZO+C85haw5NOnQzL
	 wXssM6Kye88DWm8gIVF+Mwcp9AlpwOY6H/GKjwaJlWqTcx21bcATgKxsuYjCDRApaXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hACxKV5a;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=EzCHxPUH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5C8606A31A;
	Tue, 20 Oct 2026 13:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B5C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=hACxKV5a;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=EzCHxPUH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K4fnXV3824225;
	Tue, 20 Oct 2026 08:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Yw9yGQ5N+krWMG8waeGPNo1nxp/SQbLsFdCa73jtz6s=; b=
	hACxKV5a12ZhaGEk1QaP53t3F0dK/cktvAqEKriv3ma08/aHpWOjrgfvrEf6WtRb
	+5gO6+CH1wbpRaE+UEykY2sByeo3a0zcKLfXHh3oU6uH8WX0NnU/1Gw2prOXKz/d
	Cy2jg19QXoSTx8kN8DvSyFdnMFlg7cmcpYxn4RfSazd5Nn3fy1PBeh6933wix0g4
	87grWpW8qUZ9pK+oj/CDy+Cmck/357k0uJ/0u/hoUrWLYLqDe8zsgxISpxPVLoC9
	KAMHz+3GxYH4jwNMVkHYFhYM9/q/TwDjF2umWhXBFWMFFk8orWRSetIPLu4AtBwc
	Ctf5nVecAB1T/3ZNNnftNA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023108.outbound.protection.outlook.com [40.107.201.108])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw4vrv5y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 08:23:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDI8xNAVzgmPUcTR3HDUyy5vR9vpr8lJl27Yrkyx0zeCNQ0TByEJRA4xpAlpkIo8OQJx0SUzUzMHiC7DUk/X1IeW75s+RlShh6ORLAOKc+erkuLw09bvd0U61OccfQXt0qWOyfr98SiUVzKZyz98Ha3o9oOBvw7AUqTl1RTndewaLAd4mAwTKZycDPVKLDlKbQCwlD0jOgx8SrQjQK2AqLXsVkeoWQ7SNsVzuuSTT0d72gsNENs9uS2OXzHLcoJpI6jsQNGDUuAbWxg5x9FOONskY0xVGGREPcIAlWNvabOh1KTunPNGzKDeMVZCj8dVZkpqU3HvbWfs1ri7YH5kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw9yGQ5N+krWMG8waeGPNo1nxp/SQbLsFdCa73jtz6s=;
 b=HsAGTGM1MZLMWCt1a0el6Vxj89C+jOyc6WXryJJlgx6OeiikhiSBH+19Bd9vP7GA3tMKOzxOBXmM6dPMnXeInQCVI+ei27suPCTTTKaJe4Go2Ds8s9a1aBKg5hajRQnH3cjWhh6BpLeaPL16i0RCaRO4KtC+A+ztcH/gF/UPTHToMC0dVtls4VAMV2d+4wxO/Hw/yiMSc2FmExgKy2WNotUmPsFugJkxKjVasfUWC6GnlzLt9SgI0z6ypTHJBfvrtFZSnQqU3fza5zrzjAxqEVKWbVBWgxOy9VfanWb/LzNHtgb1aihPgYxcy9pk+PS+o9z42c4f2UMpst65j90TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw9yGQ5N+krWMG8waeGPNo1nxp/SQbLsFdCa73jtz6s=;
 b=EzCHxPUHaJ6Vx53F1bRDrCDSQ1LyQHjeEpXOel2SK68Q6mwDZ8Vd3igK1EGiDVdkKMHg1e7j03TI/qB9l8lOwqSOff+G56lBiGnBv6lmSlkkxi7zaYy+0oMJn0WbRhtXofPZZxP3PtSatJ1++/J35nWdb7RSA8d3BhR7QlplQ4U=
Received: from DS7PR05CA0075.namprd05.prod.outlook.com (2603:10b6:8:57::16) by
 DS2PR19MB9602.namprd19.prod.outlook.com (2603:10b6:8:2d3::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Tue, 20 Oct 2026 13:21:39 +0000
Received: from DM3PEPF000265BC.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::8) by DS7PR05CA0075.outlook.office365.com
 (2603:10b6:8:57::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Tue,
 20 Oct 2026 13:21:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM3PEPF000265BC.mail.protection.outlook.com (10.167.23.249) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 13:21:38 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DCF10406540;
	Tue, 20 Oct 2026 13:21:37 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C8A2A82024C;
	Tue, 20 Oct 2026 13:21:37 +0000 (UTC)
Message-ID: <f3af6d37-abb4-4641-99e5-b9554f0e64ad@opensource.cirrus.com>
Date: Tue, 20 Oct 2026 14:21:37 +0100
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
Subject: Re: [PATCH] ASoC: cs35l56: Wait for firmware timer expiry before
 system suspend
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260915102110.3276924-1-rf@opensource.cirrus.com>
 <178948311377.151760.13181956545960061223.b4-ty@b4>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <178948311377.151760.13181956545960061223.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BC:EE_|DS2PR19MB9602:EE_
X-MS-Office365-Filtering-Correlation-Id: a3c22aa2-f24c-4d46-2191-08df2ead12f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|61400799027|261009223027099003|10067099003|56012099006|16102099003|18002099003|22082099003|13003099007|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FVu2LjivGXSUmvmen73D2TSioKrTIk3qLwSwpE5OXd3i3zRejtwKGPBWI1qJ6PMfaiKcA+NFFm4HBwbYj73zYAseNRrTa64LZelNAJ8E96hUhblpoXq6D383Os58sPJx9AWciKBWzOXyWdYqTY53Z9nCTSGZbGVC69Et7ZncY0n0m+2X/JW8zxk7evbPcswlIz+XaeT/pSl0ZhVX0j1JmkY5C7tbNYn7m7eQfrqV0AkM1/kHkxo25JLGk9qI+sMPaJ6Z3P30fVK9zIijiQDasu7dxzectbDKDwV3XG5tLj1ltU1+cp85jJ7p1AhH5XRepe7Jcue0ef8xhJ0mx9CEraLo0VKSHm+H2JEFcbZwIqx/AiA+wIQFPrVGuWvV5oiCAZtpvLFbdqtqD35YrU5XK4MBn4MPfn4zgqsFrQqlI3ABojwUVTBx3IHdhil+a6yL4LD9wawyGojDQTJm5u1piCiMI4ngCwlTuW8+wpb0QMNfS3eSuTVxRLLasq6KM9nE1jrikhkfZRcJ09E2zJNJOdkjvJO59YztkFm55BeJDK7d9X54FahBF9l58GLo1kJ3Lj/fgAvMx6Lt175h1nvC2c82jAXwFrQ0s4ZYKidmV4QHhLu8BKb86uAyYEw0qT5cXk+pSuvPAY8Dsovf8lVzWA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(61400799027)(261009223027099003)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003)(13003099007)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZfLr79BsO73477IVVFlGzr6LElcFLKS7BnDCdbP4w1ZllqErtyTERbiLLfd0GVrckSHKutfMaQS4NQah95nhp6S+Kjfi6oLh+B3BaebGbxs1rsj4aoMMoRmhDimO30EzQC8+D69CafX4xRDA8EdL37X4kViJvruiIjEdLLWvE/QXWS6gXV3c+LRWvdKypktKUoR76gU5orMpJczOd01gpTK8UDsKV+KU47eRiqfEi6+OutWxJPbaVyF1Y+IvuX1hWTRuRKqaB/m+W5eV77HZIAr1Tb1tuShJAS0twRFZ6dLMnBx5hnOZLETaOBrqPaGS5HFUTOW8kMbTHyyKwaAM07V6ft12dZgll9bHUp+cPxcFIIkTWFXRs0Ngte2tFFYTv4jqKzk7pThTcY2GEYzQfafI1DEKh/hPLaoDqpsU2eaIgtykU/xU+I8y2GFSFWaF
X-Exchange-RoutingPolicyChecked:
	vdAHHlOxLHACkyVsmCKvz0K2TM0jlkbbBKQkJgD653XlquwFkImMj9mPnggQxOBKVVGY9eZ+FKAsPX+o+4V8x8mcpjpeL2KhF18P4s0V0CCQJk8+q0y545omuXYz7RZnXvmltHlm6pnZvkaL/lNa/8KqH8L7sL+T8Cvq6GiGq+i7w5emCU9Iw93c1b/SQkzBaFnnBcZuwMzxRgLMQL9vR/SqrrCBTv5Htncy4IkYtt64shlJwTvwsyR6R7PvG98b/Lcu0igy2toinKTRHpvSpWlPvlH3CF3y1b5LM4hU8gBtzYsYfWJRCIC/K12zlXwyCpe+bNO0NztIPYOLmoEtLw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:21:38.9822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c22aa2-f24c-4d46-2191-08df2ead12f9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM3PEPF000265BC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9602
X-Proofpoint-ORIG-GUID: 9-5XCBkvrvNg2WMDZpSPRySJI-Mi61kk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX6GJwg+DPfFIp
 V98XkrZli1bYQVnjD0/g+IeK/TeJL/25pmyptAi2pWaWV6cJI9UrJBEsPqKt4GdOaYs4VgkkJyl
 /pT9LQXSNjvuIW7LyAno9/cgAco/QzA=
X-Authority-Analysis: v=2.4 cv=H7tOUOYi c=1 sm=1 tr=0 ts=6ad76b61 cx=c_pps
 a=ZLXFQchnQ28/TEUTaBYKyg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=FkAB82hyczsrFNE2tb4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9-5XCBkvrvNg2WMDZpSPRySJI-Mi61kk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfXweNfZdE7/6+k
 vQZx7lTVlflK0yxlQIyI9PMig8Hy0wMjRP+Kh6maGLDtwdFtU+1ADfBcVgYLmslUBG4cJ++ucCr
 rLKm+MHwjd0bKXMsLTlc+eNMf8BvakZ9rSLRf8/VPlSdaIzfMIHl8EPo+aKPrSB32D1xqr/9EBl
 yP99Pxw2frRYcq59g9723bn7Mvfo38tvGxDzD2AksnNUkKJrdHRgROmW9cosPZm0Hpu3deHOLqH
 GYKrdOTQIGUWE3BH+PbINLtpP06B3sQInpT9lU0VSaT72HcQg/fRI/K/7cLz9FK+7E7izP/Tw1g
 VYponpAfdO3JwJ49jDOguWdKQASqqH33mZ68YG/HtdjckW1M8xVTlmRFEGuBUk1iI3hWg4qu49g
 VIaAPFmmuj1Qicdc2qzJwamjjosYzP2ZUp90ioHbfMofAyZqvh+uPJ7ayRwBz8fJJkPyXUh109R
 86GjFxlageAbQeMlfBg==
X-Proofpoint-Spam-Reason: safe

On 15/09/2026 3:38 pm, Mark Brown wrote:
> On Tue, 15 Sep 2026 11:21:10 +0100, Richard Fitzgerald wrote:
>> ASoC: cs35l56: Wait for firmware timer expiry before system suspend
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3
> 
> Thanks!

This commit seems to have got lost somehow. I can't see it in any of
your branches.

Does it need a resend?
