Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634895;
	b=tfLDLvTYdYs8MU3/zF5bmA2NTF/RyvnrUbvtlb6vZ+dq+x7Z7uZVQ90JUa0B2Y8/S385
	 Zg4smv0eUsGoYGaRPDeqlPqVpSBucpr58BcWx/Wrhdk26SuABU6OGoJFm9i51Ukey2wa3
	 VT4v7xMFzzncMDoDA1hRSegWM77w/ee8Zv3CCbnRfDNWm2VamDisrHl0JueRCKPcxPGDz
	 XyDhWrjht/NR5+ZVgyfgYhhttpx0jSqNp1lf08QObqoqbwWWs4Au0IYY3YRapOF+DgxQS
	 +1BO9wQH4UvLyf6/8heWTS6befHENTfuVOk4fHlnOG6qDOs0p2dipcoFFK7tNw7Q74g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634895;
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
	bh=EViff1kjWnZrLxhg8YLtfU0VoYV072V254qvP9x9O4c=;
	b=X6+X5km5nYrhbtAAqoDdKD/3geDkW7QRANdJ8TmFQr8NWFVkw6RYFzsvr5ByVPEe/mGV
	 2GADME1Gw5h7oj7sdFVADlp8g87q4McRx5M3YOSDCG6ai9zGa+gjeHhTwtasTBJcX7Cfa
	 GrZYDelCtpzgms52+XXv+XivBil2uf0fINOkM+vDJTN7C3xmgzRd6ge3Q92sdFQ8raZUT
	 rNK2kZOR2JVqaNZe2DSrDccE7iLtEPZFqnBPIFxRgFy/nYdjtABXjrGTpzcHtlObrQWmE
	 jNx6H48hXvk/zkqbmUbUud1IAQIl2DySYMnmAoniazYprEVvITzQw9LNNLMctPkCIww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fyFgtmMl;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=AZAsc1f4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B21A60AAB63;
	Mon,  2 Nov 2026 15:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B21A60AAB63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fyFgtmMl;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=AZAsc1f4
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2Es2VF3102418;
	Mon, 2 Nov 2026 09:54:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=EViff1kjWnZrLxhg8YLtfU0VoYV072V254qvP9x9O4c=; b=
	fyFgtmMlOVsfGlIdqczC3ccd69PHIiLecZekTMPrDv4ojK1bVo0Yi/3keSw+smOT
	VnBNGGSqvZc8mmLuQz//Fjl4ZnrGwb4PSGbkCg0r6sqZSDcxFVXNy29WQjywHG5Y
	U+cAR/iCwkxc4LY+I3ye0OcUnQS49DdcpCs8QWSUMVV8oZao9n0Gmzf7Bq2NalQy
	+NsWoupf3wmz1472n1YCl/4g9vDZphohBKxYZZcWuV8WzaJp43kQ/RyTxGGp1de4
	bigFILGmCTxyt5fLyPgu8XkrUfijzX1epsM64cgQzsS8hSE24ag2glOczin/0h6f
	6jsP9eOEmShR2WaWViyDXg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022090.outbound.protection.outlook.com [52.101.43.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfa2y1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 09:54:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHMDdEMV5LaWOh6klAL8ciuaFpIuFXmcXn//Pvxct4CZ/q0eMiuzxKrpzxcV4xGYhEfrnGfUwKsak1OnpjGbDp4go2y2XPfOCQEzJeiWMX+rk5dpbcFecpIIigCCltnba/FGZ6KlXmzCrC0Vhb21twh3Rv0zqr80xJjJ1M93i6Q+TtNIBPD1GrkgNZXmWOdLBJEC/sNOksPG0lHtIWA03W5sxg8h/seiKP3WFOABcqG7rh9K78XDQDuMM9JgncDoetzm7FT+r7P30d3TqJCw+f3zjk2xZnWeB32gUHk9tWl+WFljKHcoxKQmbyxG4E1egcntJemwh4N14XU6X6S7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EViff1kjWnZrLxhg8YLtfU0VoYV072V254qvP9x9O4c=;
 b=e8f55n6b84/1zcvnZ3obWfNnO5cD7xseQAEBTymOj/SuF2gnE8afZ2wmujoilxCYZNqYx8me0kEFJz1UAtxj3sxQX2J51bW4j+ZI9w9WlNLs70IydvA+vbYncPaVHiuXtuBTZWyVjQwgpzkJgCZQ3A2b9INHpl8kePukkRwJPt2DqTx6UMRzMAGObpFBMvC/u9vXnV8OpcXzvWH9p4dunAaDZEAS51Z6P0W5SasLDjWSSyzETUiJ1k1s8BxsAQo3Ffn1i+zeNj3nkrJ7GHZleEDGoqzh3JhRjdYRFQIHrBW7m/nRdGNndND9WSk+SOMhJBlUdQWDzwoN81NbFDjokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EViff1kjWnZrLxhg8YLtfU0VoYV072V254qvP9x9O4c=;
 b=AZAsc1f4OOJImoL5HjITxRos39yS4LyFwEMKGqFFHcu3Tzx2L5Dfq/VZBUq0WG3FIkeq6cJWvWwtzWNFhMHKP67zrnTeaczAsxiumqMmZgWS3d998tzvko/hi+2sRQB05Ay2/1q80184NSWeCQQTI6XSE34W6WZ7EsRAeHNiXt8=
Received: from SJ0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:a03:2c2::19)
 by CO1PR19MB4934.namprd19.prod.outlook.com (2603:10b6:303:f9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 15:54:47 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::98) by SJ0PR13CA0044.outlook.office365.com
 (2603:10b6:a03:2c2::19) with Microsoft SMTP Server (version=TLS1_3,
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
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5EE8A40654F;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3AD9D822540;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 2/3] ASoC: cs42l43: Factor out decimator startup data to an array
Date: Mon,  2 Nov 2026 15:54:39 +0000
Message-ID: <20261102155440.3995136-3-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|CO1PR19MB4934:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 61dd8a59-8c02-4713-7bc0-08df38f99e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|261102123227099003|11063799006|261009223027099003|261028144727099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|56012099006|10067099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	l0SOkInmP42jLQV9QdW88fvXY+wr0oQ2ckW8KCt9KFyseMC3u6bpt8JtfZce0MJdgdh8X61ztAHUdunp/JSlaQPpn7O/c7pFCAJuN1h38NRo/e3JUMEv2ViP9EAvrJnqzYVLcxhBXmcHDexKD5b2dPeOn4wYvXMHph0yulhaTcwLV/u2B6JfHh06AJIXdUmOCEG1/HQccVnTxVQuSlKa5+dapioWLXEMYFxirELQzB4pDxqFKPDkBoARViJskawnWxmbg0JkmxbdFvIRuhShX0KNaWtqoJSnoJ+V7b57LtJwQXMwm0MQqJBV51TCSf5k8mxbOjoPPgck0rZnLBmm36TWlvSgIHRfDLlUtnDi7Y6aurXNmascmqsHLgTPNQlDWDsLJFXA3TyHl0q4K3nqrbH2m2G0hzh0zLDlAqd6gOhK9zqlYh67Bu53Pd3+aJnUPE8USR1EEjlZbWOhMn2ukanSqTMmtaSB3Flu2Jkc7pCByqiHZR4f5WAdPqkzAKo3gDspajCHlhISIY+HlkBDzBLWmLiVBw2lLrycGo4C/8ZP7ahuO9l8EZH3reEz7iAHLmOdwBzCQ11gUOoeqiwBRHs4FASFVchHqygN07paK0Dt7vZHW2ehPEUtfcfhyGSRzOBauWeqZLGLbslqRukJEGVJN+7KMdk/LJiesYeZHpN3iU2c1UCuKJGMyplUnsnkILwaArSgqPCcZ8L677DF3A==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(261102123227099003)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(56012099006)(10067099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mc4dEwkEOwA5DUTnwBwxXLmyVO4Pnx/sWCToS6X0OkUIN+a7FcxDMowfM5PqSt2pHqIv7oc6V0SR+izRiv6hbfv0/vYQwikb6aAE1Tu3hbVkM29QBR4UiDl+3spemU9V+c39rQeuJOuSrC13lv0XZICT27fgmhOmV4+Yo0hV4n3e/0BJSEgHUXtlDsDc4ecgo5UZpls5L4/dpJZtsha1/ubhhxgq6i1OEFh5O6gJaogDCh4eAr3AxP/Tn9kCKtpgcClSU63/ysnBNH7aihkgElMW/0E0phLWRK2a4znf1v0/MsZIxemHX48oNrsxtbQ5kayRAydeAiMv8HSfkMwERug2lZKYuxrejHzFXKzlvUCCo+CpkehMX2KFZFbN51neIMrW8eNqtUG2LwTSRijQG3j2A05QjTfTDAbfOIsHrp2aPf/+hNcCTladDJNfO0J2
X-Exchange-RoutingPolicyChecked:
	kFFc5LWI+mTT1RCS7rBkgxDtbIVOhV6CUETE5wDqHqEKanZnhcwMrxBSlMPyN6XpoRaCqZaVccn7aGrPx90YMR9WGvOFpOmhj9BWexhZiRULNNvfRyUS5yaX8ZU6XgvhnjNKwfC0s+0vXDG4sxfN+uF4/aqE1Abb+nlrwZxJQF5/gfBD1mb/Q5Y8yZ5A/6/lCyMrS/+VD9cShFdhTinL2WlmkVX3VTxl1WR8QCYHA9bELEH1oxQroMn2uH+NxBRc8wH91jyuFchT53GUH5TiDNYiUm+Z4BkaBM0nm7GnHQKKz0iMS73Xpba4wD19wNtpbONdirlI1HLnfw4+0x+8Eg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 15:54:46.1113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61dd8a59-8c02-4713-7bc0-08df38f99e54
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4934
X-Proofpoint-GUID: x51b1rLeNcn-2huKVugb_bUmqUhMVDYM
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae8b24b cx=c_pps
 a=ybF/z1spmW4Yh6p7z4QQKQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=OYnTXKH6LEPfpXWJz2MA:9
X-Proofpoint-ORIG-GUID: x51b1rLeNcn-2huKVugb_bUmqUhMVDYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX0vG97l0lQ/dt
 jjroRic+NOgFnh+qFo3GPql18A1ZpPtdadjLi93JrSsqBqARPCjKWdkmYRl00m7brMWv2vCA9te
 TjipkDvbzG+OyGirUySue2msNwI9OBxL23vHPMJaf2je5d5ys5LLtZ0zL+JXf+hOM4NGTGlpNDV
 MFHgdkr9PKP3HnWc9+5iAyZKJTjAjz1XHQfFH2LICNdnsfDFas16OvQpnpGn97pqSlAWmTZgd2Z
 DTaAu3fIq+dPzVMRW3xN5FXRkTvp5bGygcNDweJ1W6g6/aXt9+QdVdQZRYCbj0EqifZqnvRANDz
 jzq9wmrD5TxgkLBmJoalFUEl9M8mogzBZp7C3Z63FA/mm1YH34XTlvwVHjFbyN9WJnH8ghYT3Kn
 cvWnttk46iPU6DzN8dK9VXEsRqhSeWPBV6nYoSudS2GhIx0pch79nloMUfL3GYzDazQvtsPYBKY
 a+Y2Z7rfBNKo2wynIbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX4HB411ZGL7xt
 zuheNEYe1zCFQXCa/TuWz0LoLMYXbFo3ERGBlmnzQ4k+Wokba5acgsHEZozG1QTvJgHySEQRVeR
 tufI8NvEWS3gjFrm0C9UegIwyzbaDSQ=
X-Proofpoint-Spam-Reason: safe

Rather than large switches factor out an array with all the data
necessary for the decimator startup. This makes the code slightly more
readable and prepares for some incoming improvements.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 150 +++++++++++++++++--------------------
 1 file changed, 68 insertions(+), 82 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 90c83bb33d69b..17d55a3de9de3 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1736,97 +1736,82 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+struct decim_info {
+	unsigned int vreg;
+	unsigned int vmask;
+};
+
+struct decim_info cs42l43_decim_info[] = {
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
+	}
+};
+
+struct decim_info cs42l43b_decim_info[] = {
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
+		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
+		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		.vmask = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_MUTE_MASK,
+	},
+	{
+		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
+		.vmask = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_MUTE_MASK,
+	}
+};
+
 static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			  struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	struct decim_info *info = &cs42l43_decim_info[w->shift];
 	struct cs42l43 *cs42l43 = priv->core;
-	unsigned int reg, ramp, mute;
-	unsigned int *val;
+	unsigned int vval = CS42L43_DECIM1_MUTE_MASK | CS42L43_DECIM2_MUTE_MASK;
 	int ret;
 
-	if (cs42l43->variant_id == CS42L43_DEVID_VAL) {
-		switch (w->shift) {
-		case CS42L43_ADC1_EN_SHIFT:
-		case CS42L43_PDM1_DIN_L_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-			mute = CS42L43_DECIM1_MUTE_MASK;
-			val = &priv->decim_cache[0];
-			break;
-		case CS42L43_ADC2_EN_SHIFT:
-		case CS42L43_PDM1_DIN_R_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-			mute = CS42L43_DECIM2_MUTE_MASK;
-			val = &priv->decim_cache[1];
-			break;
-		case CS42L43_PDM2_DIN_L_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-			mute = CS42L43_DECIM3_MUTE_MASK;
-			val = &priv->decim_cache[2];
-			break;
-		case CS42L43_PDM2_DIN_R_EN_SHIFT:
-			reg = CS42L43_DECIM_VOL_CTRL_CH3_CH4;
-			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-			mute = CS42L43_DECIM4_MUTE_MASK;
-			val = &priv->decim_cache[3];
-			break;
-		default:
-			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
-			return -EINVAL;
-		}
-	} else if (cs42l43->variant_id == CS42L43B_DEVID_VAL) {
-		switch (w->shift) {
-		case CS42L43_ADC1_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM1_VD_RAMP_MASK;
-			mute = CS42L43_DECIM1_MUTE_MASK;
-			val = &priv->decim_cache[0];
-			break;
-		case CS42L43_ADC2_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2;
-			ramp = CS42L43_DECIM2_VD_RAMP_MASK;
-			mute = CS42L43_DECIM2_MUTE_MASK;
-			val = &priv->decim_cache[1];
-			break;
-		case CS42L43_PDM1_DIN_L_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
-			ramp  = CS42L43_DECIM3_VD_RAMP_MASK;
-			mute = CS42L43_DECIM3_MUTE_MASK;
-			val = &priv->decim_cache[2];
-			break;
-		case CS42L43_PDM1_DIN_R_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4;
-			ramp = CS42L43_DECIM4_VD_RAMP_MASK;
-			mute = CS42L43_DECIM4_MUTE_MASK;
-			val = &priv->decim_cache[3];
-			break;
-		case CS42L43_PDM2_DIN_L_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
-			ramp  = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK;
-			mute = CS42L43B_DECIM5_MUTE_MASK;
-			val = &priv->decim_cache[4];
-			break;
-		case CS42L43_PDM2_DIN_R_EN_SHIFT:
-			reg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6;
-			ramp = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK;
-			mute = CS42L43B_DECIM6_MUTE_MASK;
-			val = &priv->decim_cache[5];
-			break;
-		default:
-			dev_err(priv->dev, "Invalid microphone shift: %d\n", w->shift);
-			return -EINVAL;
-		}
-	} else {
-		return -EINVAL;
-	}
+	if (cs42l43->variant_id == CS42L43B_DEVID_VAL)
+		info = &cs42l43b_decim_info[w->shift];
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		ret = regmap_read(cs42l43->regmap, reg, val);
+		ret = regmap_read(cs42l43->regmap, info->vreg,
+				  &priv->decim_cache[w->shift]);
 		if (ret) {
 			dev_err(priv->dev,
 				"Failed to cache decimator settings: %d\n",
@@ -1834,10 +1819,11 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
-		regmap_update_bits(cs42l43->regmap, reg, mute | ramp, mute);
+		regmap_update_bits(cs42l43->regmap, info->vreg,  info->vmask, vval);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
-		regmap_update_bits(cs42l43->regmap, reg, mute | ramp, *val);
+		regmap_update_bits(cs42l43->regmap, info->vreg, info->vmask,
+				   priv->decim_cache[w->shift]);
 		break;
 	default:
 		break;
-- 
2.47.3

