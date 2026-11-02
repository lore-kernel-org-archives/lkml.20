Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634894;
	b=cm1LQpKNDB22w5urFMwhJWpsjNqzmUZZbtsKxS0f0F0oM+PMJk2d3frauC/YgMNzC2zG
	 zAdqdueetQQS+Hec/XtbqNFLMH29usiPb8qgKcKVQkUA0ENCj0czH2/d+U4EO5EIs3AgP
	 /2ut3ACllC5ifEYk78F4hmliGHMUpSN1conFBt6anIsz//pwMeeQMuKgqvFlLkfHim2ek
	 VTHyl11S0zdD3Y8fVQYyGvsTcXlaIhSJuyo7s4wTUAeE+SrCGRtAPL+z5eUB2KmjfP+KO
	 RzGNnqBTLKngppvhBN6ipwX+Hymfst4WKjPIlqrNiS8DgR/LZKWIcB8S9bjHjroSGiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=ksa5c7Q6rBbpaJ42bUuGO9SuI9QsQgNw9aKSmi8qxyo=;
	b=gnnhcHKlNEdfxgiSQ9nqU7Q0RtNIIVKJ3JOk9FA9PKiB3NRh9XoP8mChOPhgZnGjWWzb
	 Gycy2ZMaWnuDv8yFfB2KhTOyOcCdlee8W4JYrdYTaVo/op23IW1krPCrGo4qs4xSe+Z3l
	 pFbc0lBiYs2HMBN7LHC1UTHJOkrTMau0kmvbb3yJ1+105s5qjcPjmubILjMVdEqyvzV1X
	 YCVrRNxhtSY9AABoVfyvW5IAUmScU4QbARHJms4HkltIN3hLXfrw6nTrk5qUUFXHPOZWi
	 qLIR7hqoCtpnxfHm5g4abcrEcKPiuZmJFeyo8BkxMnyci493IXqgCJvHGSmbzDEDQGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ExVUF2+9;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=C4IGlMJo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3F607BD00;
	Mon,  2 Nov 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D3F607BD00
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ExVUF2+9;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=C4IGlMJo
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2FYPl83168405;
	Mon, 2 Nov 2026 09:54:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ksa5c7Q6rBbpaJ42bUuGO9SuI9QsQgNw9aKSmi8qxyo=; b=
	ExVUF2+9wV3U6WJvYW/9qvAcQixxDSGzpFCvLx0ugDF3jr7ex3VRXUhgVHrPhmED
	2nA+1WLksWtJdV3njBqAvpjNIhvNovOpYE4EwbLmhGiA+AjOoIPXYrY7CixJSv05
	zciM0m7GHvnpqu3kyOyzzZW7Zj0UpDaz36n2wLfwha1nSWcdzVnOxySx8xNHQFfE
	F5mOJY5M8xEXqgR5IZQc2deOH1TX7VtJsMQ+EQXKxcOpPdaiysz2edTHzBz2XDvI
	r+ahYf177Oxllpo6snZWA5WYXUJJlEf22skw1RMJfSyYA4KHUN6A3lPQ2Sg7Qjwu
	gHSVyp7CY47ac7DLFhnlGw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021123.outbound.protection.outlook.com [40.93.194.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfa2xy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 09:54:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXxn2PLQL56SFB0+T8bVDZAql1r67cjKGWVd8ufBRJKsquXDGV9bakNld5oyN7NyaThcmbkv2DKc6mDZbNVk4iy+VB4S2aq/6IMJum12k5WeHDWg54379ssGV0Tm1l5QoF7XksAlVdOW8SjnAlR4rq74EI3hH1kT02XpmJQxTYZMRfDgK9kDQmGq5HkECMsSceNRnJPlk3ZNUB486+I05eVBD7NDoOiQChT1oYXhhlDOtoKaz69qdB3fLLFwIXXk5FflB0w68iE74Cwrx+uTXLmiTxVWwsr5uAwEhVMJ5zZbdLNLQ8lHN+wqacPsPLUuBxTxgfXEJ10vBQgT/GoKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksa5c7Q6rBbpaJ42bUuGO9SuI9QsQgNw9aKSmi8qxyo=;
 b=QE/It2TAbm8LnL1Bb0VJGzAg2A5Ol9t1vy0T+9BSXnNGnvkr6J/OnlE2g8+qqcjMCf+6o3KnHqHbky8tH2Ewg6HoU3QHTCtxSdNsyxue1Bki+j3fgelmCKicK/l7KskzbJTGE6ESPFPTQUNUsr59jwxEcnZQVy5VJqMwkq7vAKBb6j6flO8dry9O7Ek5uy8z04r0e1R48kf3dGisw38W/Qjftm/Nw2bqEzi4CLTR/DH+XhdcJ5TZ4NdvqfSyw4FFUUqohlujDduFsETCqJg9h5bl4UlSKeLNlT/4zBUJ86A0581/DoII8YTSCDElnRPCYLiykMTgEIMTIbHU2VET/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksa5c7Q6rBbpaJ42bUuGO9SuI9QsQgNw9aKSmi8qxyo=;
 b=C4IGlMJoUQrD1nBK5/fFatRIgLncsyQaC4BPVNUFJA8eqqc+PlY9wiWjjlQkqTy/0TTMI4Vf0gLcC6E8Ho716DEPEdSHJVDhi2sXkSrHPjEPf4XdwO3KsYJwc6Z4Jm0AB5DsCsk1ubAmK0JDyiQ39oD0AbCz2/BcAAnk1ZTUO+8=
Received: from SJ0PR13CA0056.namprd13.prod.outlook.com (2603:10b6:a03:2c2::31)
 by DM4PR19MB5881.namprd19.prod.outlook.com (2603:10b6:8:67::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 15:54:47 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::34) by SJ0PR13CA0056.outlook.office365.com
 (2603:10b6:a03:2c2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 15:54:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 15:54:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 586EC40654E;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 37EF4820273;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/3] ASoC: cs42l43: Improve analogue mic pop performance
Date: Mon,  2 Nov 2026 15:54:38 +0000
Message-ID: <20261102155440.3995136-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|DM4PR19MB5881:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7ca52336-0c8c-47a3-6bc1-08df38f99e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|23010399003|36860700016|16102099003|22082099003|10067099003|56012099006|261102123227099003|18002099003|261009223027099003|261021121427099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	67JawZ1yabjyAc+2ho+P27YJXYD4kIyJPYzwCpM15p7INLMYvtCW7YGjaFu3KntAWWHuKZKE9TDorVpaV90ZYTnqOSOeNQ3V1ypkL2wK02tvq1aScsVWWsbxe5s/bM7yZfVpfvlU6310t/w9bFow/Ynqmpd03+d13do0mOvp+6GrYwdnr9DkTobHJcje94+O3hrZ7yAcThZKWJb/ucxkrItFSUMEyFrPMMHZYhgjgT7A7YQa6emK8mLP5+gnxkkkqpPg0DglBfbWtXQ55oZuX+3whpc5F4W/ITAIu8LrhPCNjeXEUfidn1fOHl72cAR0mVLEARIsPKJTFwbkk5D864y3/guF6K1kibk+gIDhWjdLRnmVtb8hQYqRCaEtAI2J8VOxS08+3lecwEc43ultRp7G52mRLMZEHuDjyK5DKvmW9GCppCL+a8OIwoM2QxekkKVeH1MmfK367WJjt940NWgP6ZttL2BO8KZSzH+fA3Jwn+q5ZBWnm3r0mYzOCmPRjMt3WKL4ZbXMWuhuDxgY4NKEIFmgjQPJbtCPVl4TNIet0VZDBViokvXoeMKXzGqfvkl97XtjYP0IgASrVtEeUser5sG2/EZ1UgVNQrxvZ5A5NJZFM5bVcx1qHJr+JtxC73hN1XK9XjAf165Kn6QA4H+nECOF4PkD8gkKlZr8qycB+/RIoDIB4nqpipOCRN34U7/lmmsYv/CS26qkNxQn8w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(23010399003)(36860700016)(16102099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(18002099003)(261009223027099003)(261021121427099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pgu3d72MEVbS8OpfOksY2Q+0t1DBBjjkDW/6FEXUBN4GCLVNvrqmPtGvAkgnjwLyOrFxqPBH2r0fk45tkUEpJrF2FauPfxt5WaKNLjA8c3r5kaqB8DO32au06tKgNWqqDPzm0FI5fKMdhnYHd4JWcq+wlflLefRuUkWLrFdxTxuygG5niXtqAV8Ig3iRUxEvMRZWTurDCRANEmz0xy4D1e97WAFN5zsw0Rvrl+WfMauBoOx4YFHiHhQOUDTREZNm7djSfqd6xgaqGe1CH16SL8beZ3cDDoOgVVv9K5SHawpphP0ymGEKOhu2S34lby0NBOO/Jgq1yB3Xv6xITmwYVeDwZrG/VMUEI9+JmNbh22uB/f4FwbJ9VtvgBCtlQGdoD9s+1or3lF1lQsLmzotvEDoAiCM3lnflXVP4tRE3tUZdpn6Ad+pRHLTI2eSo6OC9
X-Exchange-RoutingPolicyChecked:
	Lv4Ha35+I4RVjTrVhRGst0YclEG0GYTJITpCA3EmZwwmenBnuxLirFT9pl7ot04rxJk1+p32B/WOpdjKlkh/xDu2P11uKt3S0gRHngr0bRcAZ7m696rzQtZuLNFAtA5LZy5AsNovbIzA0qzIqil6qjVlD2N8LsPOft1PnwKjfUWK3TRkL7TiMiim0vHMP16xEAgh5P1/5xagFQMgaokZpuxQf9u0XX89eY2sHeVezYAg2+D0hjqG0YmZFWYB5EomSZ5NAHhNdsujb0lmaGhn2RjG8QtA3izbkm6uj6yvudiO8r5BANKnJ9TwjPMLl5jNgtxvvRTxFrdfW/NeEXDr0w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 15:54:46.1114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca52336-0c8c-47a3-6bc1-08df38f99e56
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5881
X-Proofpoint-GUID: jM4VwxdWlNvlvpQKLB94T4j7n5YGwogD
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae8b24b cx=c_pps
 a=1pmWRJemPF16E+bttNzokw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=gyOt_VSXOeQFJU7EemAA:9
X-Proofpoint-ORIG-GUID: jM4VwxdWlNvlvpQKLB94T4j7n5YGwogD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX/T3M34elzXqc
 vbLlDecyDVDHHn9pttxRrHHeqaVPmj8qEGcURHPnqBVFAu+Z/ydKBppFJmlm30YSVV3Fwx0x037
 oY5lpK9u3Tx0WiwZPuXb6qznf/ULTpfhadcQj1cUrDpq/V3sVgQVYkq6a8RDncqJyq6a+Lpbs6E
 YxGmMScPKSLlYIyEzkC/5JNs1yEnHWzFNPFVJGwkT4W/M+D/Rxxg8yPgwc/M47tn4ReQsM8bvZn
 aja7XL6Oa4Etgzsnt7woaMS8MHRIrRPpI9joCl9R586wT2mrg6qqYhd4yutXEOc+pBE0ll7A+2z
 Q49O6dCqRG6ZcW5bkOr9iqAQLPS49LkCiVI616uaRJzzbJHF8VlyDvFJGTLGEdmypEKxtfKzu0t
 uWIVRpZGVEYejegAEBHh29gD1Ipz7QOY1tvoE15d68/lpizIb7we9Ek23KtiaovC2eyAlv9aEIN
 6nDJ/HR/YPQKPIb0HNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX9kLBFew1mhpM
 SHWifhMDKa3BfMuYicAeZSOjCoEVlSc4WZD+nFqM9jXOWHFvk40cc5Ek9jKaxUnGlPw5FhQmvck
 pbbu0Sa/6vAqLhmAwwWoSwNuMQzQHnY=
X-Proofpoint-Spam-Reason: safe

Enable the quick charge feature of the micbias to ensure the bias is
more likely to be up to voltage before the recording starts. This
greatly improves the startup pop of the analogue microphones.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index b6238f89c789c..90c83bb33d69b 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2822,6 +2822,10 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm;
 
+	// Enable quick charge to improve analogue microphone startup
+	regmap_update_bits(cs42l43->regmap, CS42L43_ADC_B_CTRL1, 0x20, 0x20);
+	regmap_update_bits(cs42l43->regmap, CS42L43_ADC_B_CTRL2, 0x20, 0x20);
+
 	for (i = 0; i < ARRAY_SIZE(cs42l43_irqs); i++) {
 		ret = cs42l43_request_irq(priv, cs42l43_irqs[i].name,
 					  cs42l43_irqs[i].irq,
-- 
2.47.3

