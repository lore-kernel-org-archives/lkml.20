Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793957504;
	b=S6rys/W/fmkCMYmujyo5fBTSqhxs03pE18Wgaxb0CaMcthYP6uBTF2SOB5OnBR2RipIV
	 wrbHMoezSi9wKy+WiZ3zGy3d8PRxa9rGM0fSBi5xQkECiGHIAwjYpfuXL8xJbOrd02E7F
	 KwbFZWkHX1dDsjhmBvFglUfxYBGcY0N1h3EBPZxYUJKXC9+7jHAwmZX0XfCFOiYLEUWrz
	 HmsSXJcbQYvgiPA2dY12aGcEHKkdI66Kmb6TyYOwII1anO6PwoR6qzYzQqdVQCbIRvzMF
	 sCpSZIwy+6KHr2M9jXk2j3mdex7CYH3MBw3Vgu2ekz+XZcpQ7OprBKp9a9JFcgB2y+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=Pf9llb4DWhFDSEr+orSoHb1DNQYj2MjaNFAAOPR10rw=;
	b=bmFzCAdnsTkunSwSDb0U5e3BCsrfCcsJH5dU6Veo9L4FfdpMVdnmKxe55rhg40oPqC4L
	 lAwt3YtOKaTdtuyh0X0U2fnHMXQrzCrGAypGB/FmSUxxamwwi/Jj5TVQjVV7tdPNXW33u
	 VvUZj1gNhzm/h/l+APh5bd/HiY9dZkwB7/34RDO6O+Y++iu9jDnIoMTx8kO0+lPUPUPD7
	 qkPLdiG/76/Dzn8y2CSeBgSWFohPjJ3nZC/UCdGMaUh3Q219soBnILN4GVvjYU3TuS1/G
	 Obvy53pgg2hauTVnuaDQtsX5G/3WoUujTlNkM5to6K+9ewXNH9+CmbVe66wo27/KPaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=j8RJsjTX;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GDTwYNyv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDEB606A33E;
	Fri,  6 Nov 2026 09:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDEB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=j8RJsjTX;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GDTwYNyv
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A69Sdd63516785;
	Fri, 6 Nov 2026 03:31:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Pf9llb4DWhFDSEr+or
	SoHb1DNQYj2MjaNFAAOPR10rw=; b=j8RJsjTXWNM9GheLBB2ul1r3YW/gMTM9OM
	rNHbgLL73TlPBigPpuJjSDem/e/9DU94CIq1lijCjPY03DSXvfnznUe9CSQ0Q/nO
	sLZK5V2h+DXQV5woZCDAXWHCobZC+qFlx6tcoRZWBY/60v4A7eo8N8A0RSCBEq5M
	L6YCKqSqxfqtn3cHs4r+qtefxgRTaMjyI9Rab7642TnkHBsKRPluwtvnTQm+zzRW
	LFWyaeISfnW3XVmth230b9zy7zWk6U97pMOkt8/sHA1X4ULvCjtvivMS0MU/x45R
	l2/P53Cjl9UJfFGaPUw7m8iKafird4+p+ti7O8GHoWEbrMr4sOVA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023078.outbound.protection.outlook.com [40.93.196.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3rb0gg4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 03:31:29 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZninJDLqeMSTFEYC3PZJVemP2roI9rxByX8LHRBzMvnsy0DjNlrUq0SCEUMfYHa2+XZQyuJA5uwKsbIlkiHmRhKlOfFU6ZMOg6uZTOubTOu4OuQtDCa+K2hH9FnJ5lkFpLh9/ywtLPStC1V83Z6yIFumQyHRgUrQEm5AFd1hXmUc00DB2B6Qh0wGuVjxUEFF0apeDqG29Kik+8v3WULVLmO5y392c8CbBlF3MvL0yKDAJrRDXn3z5roLt4qx5n12I7sVDM2g1YNZ5kEnGfL09AZ30CPcZmERzv9woaR6F7PsiBA5TP4jfI/AFFHTShGuAnRpDkGNYOcXCud9xygr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf9llb4DWhFDSEr+orSoHb1DNQYj2MjaNFAAOPR10rw=;
 b=tDwM13Iqp8Lkh5uN578haAxEaMILgUgcLpGxaOGEagO/RUGxCA5SLqI9qi9R79Eh6TwXL+DeDv+Jehe5Bl49DBZ2m3ck8YcccZfI8IFyUeygIiDBu/E0ipGLUXzT0a3ewSHcmaRCX4vyNsVeE5iLW4BLXj0xMcCLxa+Z5hgx2oWVKEcT+YqpgoxNa4GG2fsXcT1H3q5Q1UqNYPSOyqnoneAJh25pgc/QFZ+U4SiXYMapupL7qVg4G+hT/n7WPOPM/kLE2TgR7INSCbNUcGKqiio+LqPd1wvoXl5qr5rbtAEzQShpuTZVP7E60zAU1hS24hURLIYbfZHEgePq4uaItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf9llb4DWhFDSEr+orSoHb1DNQYj2MjaNFAAOPR10rw=;
 b=GDTwYNyvNr3231AvpJ0Q22Z2v4c/g4XhgTmMCmqY9CYVBEm2TAxPXmXRCa4aw/WkNl8uIvGwZGwOduu2DYT6UFLj9Cb1uW4WHRBYKzMneghEWKNINjMJ0/hXYCV8k3P7ElJ0K9xNF+W0bPNSk8+F6b5gPBS41lLgXRN+ItxmIWU=
Received: from CH2PR14CA0003.namprd14.prod.outlook.com (2603:10b6:610:60::13)
 by SA3PR19MB315803.namprd19.prod.outlook.com (2603:10b6:806:590::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 09:28:42 +0000
Received: from CH01EPF000BE943.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::71) by CH2PR14CA0003.outlook.office365.com
 (2603:10b6:610:60::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 09:28:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH01EPF000BE943.mail.protection.outlook.com (10.167.244.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 09:28:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5A8B740654B;
	Fri,  6 Nov 2026 09:28:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 37A6D822540;
	Fri,  6 Nov 2026 09:28:39 +0000 (UTC)
Date: Fri, 6 Nov 2026 09:28:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 2/2] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Message-ID: <au2dxajs3ua9M61q@opensource.cirrus.com>
References: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
 <20261105134952.1728147-3-ckeepax@opensource.cirrus.com>
 <1cae1b17-4c49-4a10-922e-c552e90593c4@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cae1b17-4c49-4a10-922e-c552e90593c4@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE943:EE_|SA3PR19MB315803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fba6c09-3b5e-4858-2c2e-08df3be85844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|23010399003|82310400026|36860700016|11063799006|4143699003|56012099006|261022075727099003|261022105027099003|261009223027099003|261102123227099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|16102099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ITrNU4ka1OkNVifXl+gQ8BX3G2En8Qto7Xz/1nsRksAiptJc5rz9VJjuzrBgNDbqz6VHo28B9QAjpApuW9V+IKce6PDy7BgztFgc1dxH/Y3CtIRz/Ioa+acbUBRrctcx+LysbYGzYV/pA1SbASWmxY7qvTCF6dwpF7xtbPlqbExLioA6Hpxpa2AGRUJi5zY78mH6lvwz0BdQw+YDjip743O5fjsbnpWbH8AJga3oW0ikXDRPpGW0fo7lwQNIp9XglLvL4gVXHN/ioRI/yZIZ5zTawB4sCfVHGNRLffeMlBE9pJLdFPupr/PEEOJ7BV/IB3wo2pRw8tWK51HIDmrTiTM0VarBQklZegqgUGkdytWn66uHtzzcxO6jisJLg1CUfJHDpLg56aFdTKa8gtxxPnOoQA8Dke6VCnSNP3o75MTXJzpSooWk0LA6gGoaUCBNaKEQrMabH0ZYLsM6CNqEcIZvh+zdfCJXwttcy5M26gFgHUTSMeSz0u6Gem7Opu+32Z27BkGalcK40VEhs7NgwMaYk3T2dcG+d1ILH2a+m8sv8lGuAoXCwKMHiCXTS6MhKdvTLunmiiEiFcgGdRmxf4+0bgZw16bdFwRlWNxQmhvzrvFld9zrSZUc6dYZJCOSo48v7AQhUFpCn7tm6b4IeZRaXNfHkIBapgccFGLk3jpzmEEqbjFQE44Ioq53Xg23CMOlPPkrEyW8bMr0IBki4A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(23010399003)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(261022075727099003)(261022105027099003)(261009223027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(16102099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wWCRWRCoLEzuhXaoM03dODkgTd1Xjs1boU7x9PJlKz73zOG80CmvK7kGAbaXJ8Yc66QKj7w+fImu75lcrAFIJz1GKQHhbN71o0JbdAX1RWyXWvccGXtajYaPpLdMe/zu4NIUZqjLkDhM3I7Eaof+w/NTJoHLm15wkHcTDtu4nJT/I5b86NpVdIDFjgcMF5agukiVQa3rFzxe7fFfkyBvhoMgtLVHv6Gfq2us5d1A3lrppv5SCVKEZuue5TVikcASyE6HgOiV9Vw5W9Sex5LU/Yktczx6aCJckZSX3/0Wx3evjT3o71TSHsI98a/nkL+V86hTcuS4blaP6bCSeMTIOvrrnBdA1HW/gZZ4Yjv2Tw5oHbb7W++FcQ3rG2ir9cOFQLXQ2h13w1I0VhNCzHgnXLvy9G1q0NwKRslBf7dpPpWZwB0BYvnIuq4Crr56FY0s
X-Exchange-RoutingPolicyChecked:
	E7Vma6waEhpgllILNk90YwarTDX+9U6//F1xBsw0IFnb79JlA1/thszzlDn3dmysZ53svwrzZPrsXDZNHTI1U/7sHnYsvQ5ynMyyehzHaTBt8iN7jgWOLzPDbrIe2pDY/+eQvROrE/VvSOxXqEKkqKMfTPxfn3xY+W4qSSdyfDB5qYKbNedyIUFLbaKadIrpCSvKLcFwd1LzODAwxgPXQcE0xzkCK1oVa+KK7W9YeRfyHSn1S9eNZIWbU4Dbbk08KC2TXErQokN3rOnY23TBzG9shA1+PQ8QMwRXsO7zsLGn84UKMZxIySt7bnnMgZXHUCwJnhLhDmaTX2i7Se9vIQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:28:40.6941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fba6c09-3b5e-4858-2c2e-08df3be85844
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH01EPF000BE943.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB315803
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6aed9e71 cx=c_pps
 a=qh32Q7XyPXPg99od4CZmAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=aO_fQNLWTdoY6usaTh0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: YotugdzgdJJP_r8bk-2vQWxmd_kz0Fqs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX2n+L1F7GPG18
 d48t50H+FON60sCCTS0sDXYCqxztGaAxZf6cR56YnVD8rFiUOJwuWoKVHn2T3O09Snc/4LRlA66
 zCWcd4okAS8FK+NDyXUef+9E9nMKx0LIxKr/6GCSKurz4ufdj1YhzEW9CyjmY7Es1N/bhKEy9+F
 MGbutd2MzLbcxWGNjDBKOBhDyewYzW+L71xFy7yf6AIZ3XPQvb+dp4CbNnwLmPPJY6eONPvyh1b
 pc+7MU6Zr/5Wx2dn5REuhWfQTOHuieKQew2B4uFHQYN6co1PFuVubw/URx7tlGdi3UV56eWcUxm
 TS2EEojhrIN53CrCdCw60C6HdKClJR2JX9cmgjfJjLEZ52AS+nyUedky1lqnkyF5g03J6di+7fQ
 j/L531ii/h4ovsRI2KsILILoOEj62bBF4cVkjtwgZf8ZHDRSjwyWgDKMYEhOWHAxm9ER0hSsrX5
 0FY9HPBpd1nXSSTgyeg==
X-Proofpoint-ORIG-GUID: YotugdzgdJJP_r8bk-2vQWxmd_kz0Fqs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX7Wi37pHQd+u8
 DhcXCtDXO66VgROKpW8tUdCzOCQd0DHE1BmNqVwZ+AFjzSEvI7xsRNa0nWpJCnNpwBp1v4XV97W
 Xlgl9WWEvX8AHAgbNpE9MQX+8O+fV6c=
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 05, 2026 at 08:49:43PM +0100, Pierre-Louis Bossart wrote:
> 
> > +static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
> > +			  struct snd_pcm_substream *substream,
> > +			  unsigned int *word_mask, unsigned int *ch_mask)
> > +{
> > +	struct sdw_dpn_prop *prop;
> > +	unsigned int nprop;
> > +	int i, j;
> > +
> > +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> > +		prop = sdw->prop.sink_dpn_prop;
> > +		nprop = hweight32(sdw->prop.sink_ports);
> > +	} else {
> > +		prop = sdw->prop.src_dpn_prop;
> > +		nprop = hweight32(sdw->prop.source_ports);
> > +	}
> 
> The definition of those DisCo properties was done with separate masks
> for source and sinks, but it's allowed to have the same bit set for
> source and sink if the port supports bi-directional transfers.
> 
> I don't think it impacts the way the constraints are added, since you
> use substream->stream direction to disambiguate, but I thought I'd ask
> the question.

Yeah I think this mostly all works out. ALSA separates the capture
and playback streams, and this stuff is called from the DAI ops.

> 
> > -	if (entity->type != SDCA_ENTITY_TYPE_IT)
> > -		return 0;
> > +	/* FIXME: Currently only a single unshared port is supported */
> 
> I must admit I have no idea how we'd handle ports that can be connected
> to multiple terminals. It's allowed in the spec, even between Functions
> which are then no longer independent, and I was told it was due to
> hardware restrictions, but still I hope we never have to deal with this...

lol yeah me too. For now I am mostly just putting these FIXME's
in at all the places where this is going to become relevant. I
must confess I haven't reviewed this part of the spec in detail.
It feels like sharing a couple of ports for a single terminal is
probably tractable if a little annoying. But yeah, if we got as
far as sharing a port across functions that seems like a total
nightmare. We would probably need to do a bit of re-architecting
and add a port abstraction at the device level, but hopefully
people are wise enough to not build hardware like that.

Thanks,
Charles
