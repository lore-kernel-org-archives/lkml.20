Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222790;
	b=m+ot9fwhNMVg/66tqpstas279y247C3XKSt5cORHmoSwxmbm1ayoeOU66wK9OlXFo/f8
	 Fo1BKR2Wq6yhSSK6uy/Mfy5AML/pz0qYtO8bbL0VSKUZQivbMj4yEsClNbW+n6azv+aof
	 7vwMWxXeyuTnM9QK4YptqWULRbNsKmRRTqTfv/WQ4cOV02XfgXYXJcfcxkW6bSmwyzSm4
	 67ynaYbpycN2czVfwTWssZdu9Zn6H/WvoLmaobqI32I9QKq5d3yspaQY3tRCpHo9F1oXf
	 UvLyPIuzs8yWlgAOhp+WMCWUUcuS4NxqMq72ecgWWro8IPMNDIiKh51FNZEy0FMDEsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222790;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=fe9jI/I5NQTv47AndM06YuiUXQbxrzPLf7HsZ4YnlQo=;
	b=0tBOgCsHInjXhvKjoFQEptg/sjyxh7Tu3DpQHcaoeVtNtUi2CFAB+vOdwzP7g+1q3qOF
	 j/DqNjO2Pp9jWHKhE0+a73IJH9KD5y69lXPFBt+f3Ap2fWcDORf1UpoDoEsFaWPhl7n8e
	 qtiLajlJh5d5jm35kwTwdhXZemTbKJIEMSouQTv/yBTMQp+AV/yWn4vgMt4rMyzylhNn4
	 I8BebiVL55+e4ny36pqaqh25GXrPFjewYhzxvWUg9rgiABsCMHZci8i/fcRCbRf7r2s2z
	 f+duFiW7A5PLDwMm0MnTLzBDwvLosITV25ysq94OTJs7TAhFE65IyFdgR33oJnmrMvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="gD/2csad";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="b/2sGs4+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8C606A321;
	Mon,  9 Nov 2026 11:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F8C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=gD/2csad;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=b/2sGs4+
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99wCQs2092928;
	Mon, 9 Nov 2026 05:12:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=fe9jI/I5NQTv47AndM06YuiUXQbxrzPLf7HsZ4YnlQo=; b=
	gD/2csad1aiew5HyDG18RpN3es09lLFqer5EUkjetwpvKn8V8RS+zDd8GbZG2YhF
	RbSzpUR9dAKhNserWAKU0FE7YcXaDowQ5G2vpqliUUnq/FGYsjnOcb2YvwQSAMIS
	P0jYUrrus2ts0vp5CpGfyrlyFMELCetykcz7vc9UZz4cXR02v5HWA5DUxgxHzu3A
	E1JJSBcaje5XfMI8ZNzPStfVQPsTvPcrY8eLi4MZcXIiC+nn8sx4CMN9MbvyZ2om
	05O+x/g70mOgh5LiU5r1pvRwRn9GHMgaSsjuCQ70xpv6ZTndsuf6BFAUXjHccTZ6
	NCdH5eAebux4tqbTLU5FIw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020106.outbound.protection.outlook.com [52.101.46.106])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29h9vnw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 05:12:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/ZaSvILG0pnFHrNCE+e4rf8WO8/CBgK+HKw5mVa2dsIGpuic9XFYS7zLvuKVJM6zQr05hsSbcLWSzxEerwRdltOB0HTEj2UlTFqt0W4eCyeCxG4iJ3VZAJuv8JZZSWt+3EfHyaETzgPtCpp48bMxMOeyqBTh20yb/zZxEHgq13Yz05BfqzgQh8O0bKHTwob4QU/NfbZNhUD8ml4DBxrW+j3k9qZRmMUbk1zB/1uUoOrhVnHbCs6F3Mj22fHl+W6MwXWLjHenLVHiP4rE7mYAZGuopyQsxJ2zhx4xJNEIftPUI7pp0DblGiHTm3Y/gr13+rCEobxYdvcikKHByGI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fe9jI/I5NQTv47AndM06YuiUXQbxrzPLf7HsZ4YnlQo=;
 b=v39q3eqMKn7vSStdnEh4N9wVjcywfKURAoZksvO1ChN8+OQj3pIXlS+yzAl28XPscftigqPc6MxpXigriT2bOEIIWwNxekc481djAv7fBJFq9BkNYhFO3to3TjG8y8j0ZnDZcxbs5aIN0ZRzD3ylvwhYi91G2MyD6UEh2O0ExPuseCVf2xU5ER8LFBJiPk8+gU8W8MRdMUfnrx8l79rLY3d230X9Z353tOrPkJ/3gxAQJ8L8Bejfc87IuqdYBk18bagJA/qXlpVsfFeHntwjiIcslUp5I/aKH+tCuN1Sv9pVVmGaflXKOEm5PH+tbMcla3RVxl6GMFu5euPdmTSDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fe9jI/I5NQTv47AndM06YuiUXQbxrzPLf7HsZ4YnlQo=;
 b=b/2sGs4+n1fL2V6F+Rnc7HFOlxdr1IgbD9aYG99Jyzb/RO906KqFywXxNXKZi9CBhlqfnVu9F+SlFf+RGiJZYG68zsshvj0aRnrck+5GkGnQv9FYJPUPwJSaMcY6R/WtjWRtByouYJoY7zr1+tUfbaI7Zq8Uhhw9CiAhX5NqUFg=
Received: from CH0P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::21)
 by PH8PR19MB6738.namprd19.prod.outlook.com (2603:10b6:510:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 11:12:41 +0000
Received: from CH3PEPF0002457E.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::88) by CH0P220CA0027.outlook.office365.com
 (2603:10b6:610:ef::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 11:12:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0002457E.mail.protection.outlook.com (10.167.252.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 11:12:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 422B440654E;
	Mon,  9 Nov 2026 11:12:39 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 27055820273;
	Mon,  9 Nov 2026 11:12:39 +0000 (UTC)
Message-ID: <68f4c2c6-bb73-4610-9975-d093989f9ceb@opensource.cirrus.com>
Date: Mon, 9 Nov 2026 11:12:38 +0000
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
Subject: Re: [PATCH] ASoC: wm_adsp_fw_find_test: Replace strlcat() with
 seq_buf
To: Andrey Zakharov <dedemorow@gmail.com>, broonie@kernel.org,
        lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261107152338.77837-1-dedemorow@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20261107152338.77837-1-dedemorow@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457E:EE_|PH8PR19MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bc50bc-ad5f-4963-5219-08df3e525e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|61400799027|376014|22082099003|16102099003|18002099003|10067099003|11063799006|56012099006|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	QmmkA7rtQNVqcYDDAKKMjWN822MkMOUmSCHtykyIYaoFUaisvCOvzhUxukt6Vrw+Vr9fvYM3hAtvtpo0wmruPPAA1l7rvg6DVKpahLfqGwE1swmk6sd027EnxV32VNw3gN9UmJD0rnjVi/sDYZRpOynakKWiXXTxeDcxuxDGpUbvI2/CDRnHalMwmA2HwMJDxB15S9sfk0tVUu2dF0cL1Ca1bkz4RYKrQ0wunzlMurwujH2G2hbKwDesDLlX9bvhz3fv0tsbLzZ3HHURdfQa97xIWI3VpNm6lsVDZJNgiKdXTnzE7TDikiWK7vOAaveMM5+5gJNX98PcSJM4v6gM5a35hKiLCcDoYqNR52gsoE4AZS0vLB4OuD9VhWOc1gyq37LGB6sCQDh5SyS5/Dr368AvsQ57dAVGbwVKDtJyG1k5fc2mkSdGgWmDnlVAcGCIKWjYid4rOYl6jnumuREo+Q18g4Mt3ch3UV1a/LokAt91UG1WDhGov+R8sPFqeGq/A9ptbbwSLZoxWFhzNDE50shThNY4f1qsdIdgT4H8oanevNepoQS8/kmO+tvCY39hl1EjjoO3ki+JljLxsBFSOohKu0VZ5sNFlLuwdDhyUJs+F4JxWSqkaclU5AzpaQ6gng5oYP6PUAlVFmpJJTFldseDhjyNlnH8tQ/lyRQh0m+yIZ1dhQ5QetC9FaYvDRyCCoposd9iiXPaQidIrpPB+w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(61400799027)(376014)(22082099003)(16102099003)(18002099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J6RvXXSaw5rYoyEY/UJW31ZcRNx0jT1GTMo5RVxq6/y5fjpUkzZZz97IXrEw4tA/pUxWZgkND6EbYeP28jW+RD8JiKcf4I+4Yrh382fdlzVjkWzcFKJGn45rMejWaCgEdHT8XlHxhXO6LFhp+KIqhY4zfgCRwk7fv15uo9B4WEhktrtKKPhS+pHXpCPPsI7mcbxkfR1VT6HEUApNDi1FBPuKUwWvz86RQpcFRm475Afc32Sye2BswmCZJgA2fo+SAZm8jDGaR5WPoZpslDcyIHfp/fnoe+jTJ2TqsUssleENQ8S1FVmcqQympj66Adsl8QaiHA5bm0fhFWDg0aBP9A3bqckQpYbUyuAj+1H3vdMxpFltPB2F5aySOknF4yMk/Lu2K7Vv3Q2nwk2PxXIYw6ufJQbJbmOZE3UJMXXw/MWeCTf4vaBO3gLUC/OygAeZ
X-Exchange-RoutingPolicyChecked:
	IV+OcQeOB/3zF/N1nFIWKmBtyPBfbENzSyNU5ozzc9IKjkeyEssUcFJnmOiC6+zT5ASLWIB5N2U56NW2OlhtHgY3rA6twnNUqPjp39toH2sSSWMaSNrQaW8n9JHv5TPKECObQcivx6C4EEfiaXi6IMueB+RlilRSM8nNZk42x9OouY6Zpi+BbeOBpL8Bgjj1oP5fsMWpHJja0mBL+5oPxskXiwIp+8SgN1LyO5XMX04RI6Yw21+xWUZkxpFv++uEwnWYVzkkAM6xhp4aYxOZ7wyh3YIutxwqug3LB9sGS7DqJJeFIAzvx5zc4xWQVWhBPW4jDC9EeeOfh5egE9+b1g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 11:12:40.3144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bc50bc-ad5f-4963-5219-08df3e525e9f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0002457E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6738
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af1aaad cx=c_pps
 a=WvD7+ME5cHBMa06ZrkM6Lg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=hI7SJAwvX4m87Qk9KnMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX5QQzeNLyeLiW
 GWu4kPaWJO/QNMOVNGYA4CiFfEMJsdLtXhZpAI4r1OEqDJF4Kbn4nRJiiMjmGIz2ZJFa/I8JQiy
 3kxHTDnA+mDSFRB5Gj8gx2jpVQ0OUXk=
X-Proofpoint-GUID: PSVQskIkvUMoJZSNg-dYEiAHYYebjE23
X-Proofpoint-ORIG-GUID: PSVQskIkvUMoJZSNg-dYEiAHYYebjE23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX5huG60qIVTA7
 n0TFtw/ihKdOYNg6/fZgAzw746hepxwD0Dhthk42nIIsDFZmHaIo+ZofR6zaH6vtsQgkM51DiYa
 krBNME8MvOzNv35Ay1yeFp9y7QfrOCbSRVIz10n5K9q4/O1DFxD+l+fBmLw9MjGAwDvf5UvETjr
 MRtAApJ6gR/HwEy9BxJkQhJ6UGsfjxAwdGUjNs4pbUfkqAlTLrLDCAZ5ccXchEHzN7jLisugsC+
 a+2RojhBmfaHnYpf4gtrioymysi4dPjkmmZgVLBvTYXK+lKP1vW80CaeydHLaXsOiFOU79JqO9k
 9kW4ZQ+5pTeQ2IsjDEah92eIa5sbKRyCbfObbwnK/2IlDkN93xerSd9kAkZsSEfNkn59e5kMPcU
 v91q3FyTRFVDYgF+SuWiw6Nen+WMsvOsaTuQkj4wHCqS/zlx+SKbphYzn8+3nOysUqDzv2tLW0w
 27knmJOdlBwm+mj5Wwg==
X-Proofpoint-Spam-Reason: safe

On 07/11/2026 3:23 pm, Andrey Zakharov wrote:
> strlcat() is being removed from the kernel. It runs an unbounded
> strlen() on the destination, and its size argument is not tied to
> the real buffer, see the issue below.
> 
> The test builds the searched_fw_files string by appending to a fixed
> size buffer in two places. Use seq_buf_init_append() and
> seq_buf_puts() instead. seq_buf_init_append() keeps the NUL-terminated
> content already in the buffer, and seq_buf_puts() copies as much as
> fits and keeps the buffer NUL-terminated if it overflows.

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
