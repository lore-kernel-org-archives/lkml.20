Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715555;
	b=EcthPxU/y8yS3WqTRZR0IfI2wrugOQ29ed7wrUEk/QMK4kv6L4uwsvmgcyo+Rmk+3xR8
	 5rOpEz/G9I/BJ+KiAm8WJooOCnjQjak7cfzD71ll+MM0VTLcQi18Qz7wkVkECZCcGOO+c
	 xg7MSPh0vpdQrich/cR6mOYh4H29sSQ6DUHhEca6+Nb+Nx1Kv3JjIFKD+NDI8w6Ka8XKl
	 LjyV39P7NBVCbCV0weuyFy74Zi8IBdUuVRTOL61Zgb9lutExoGX5WZAPaL21Dvdo4Pmby
	 slegpTDjUkL0EUt/KW7cQVJa7eqvxhSIyX4iL8BJxQpOsd5CGIz3yLtl5euKaUggU8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715555;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=yeaiagY+A1eG8SRzkigLRik5LHtOohy6O4fCNy7n2Ss=;
	b=eC/wfgU3i9ntoAY3YvQNhGFwPpcY5Bu/SIvcIGXRuqUWyGb3dGBnJv7XBpxO6THYR3iF
	 saTOdVDCwm1bRDB2NoUTEZ+K4vBMGjViBOf2zLfgaWPJ7IqZscrOtqjkZ4tGS8fClCBbm
	 5v24eINSxwen/6Zy8xhh7sOy9V0CYlBIrbzY/kBc0OPJQ3cVm8LKYYQKP7mdNIHoUkIzU
	 XsimANO38AyQ/DZgunHTJvxu83K3hDp1jNofAeuPRDPlMUppfzRImi06J1u51odUTyZoF
	 QDO+ZWHnfXdD8BzK93epaR9L8DK1vqgG+wcIUpEMxjcfLO9BUCnPIL/mrYED+gHZMKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fmz0JV3w;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=F++yyDZw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D44606D81D;
	Tue,  3 Nov 2026 14:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D44606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=fmz0JV3w;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=F++yyDZw
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E59Pi1102799;
	Tue, 3 Nov 2026 08:19:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yeaiagY+A1eG8SRzkigLRik5LHtOohy6O4fCNy7n2Ss=; b=
	fmz0JV3whYZqckwjNB4032+e+VPOfueMDL9BvU+DNH+VrIfryvSEAoV/rLE+arOI
	WT59t0RsYsRrqPBtwo0d2/5yv0PxCJH+QM2RrharEFPAvYzcejhFxP0HOYMjx38g
	0fVfahq9gioxJFlwy4zbo992pU11yhBq3Pj/f/YRfk7WDx5V49vBgzYVhARIIc8T
	peZp3zZU6V8+ZfnwzcP2SS8KtREWBd/twnt6sISJrfpq3M2I+S0hsR8iKTZnEXb4
	OGf0h3276NNx0sJFcZ1Ewq/u3FeJ4EAqlnkVPQxHyYolQyIpRSzHZKGYwy2sXbuY
	WKc6NxO5uly4WbK45n+cdg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021107.outbound.protection.outlook.com [52.101.52.107])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfuu64-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:19:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAytJl6dwhiYhwXOyrfHhPYa8W8XJzH+JmZGVWnw3mq1n3Al7F8EiSLAFCx8DZ2Xd4XT5FcPTpxh4MiY5DOMuXwvz/lI0iwEymL0mspMY4TBouxiJWilsGBp5PA3SRdC6wknoKGWLc7NVo6MB6YDnj+E9vC1yifbfPMJI5R9fF6qH4etX976Bu+D01f6pRgwgpUqhS8SzJYE+QusYAkfhchBNmgKhvWbzkc4mwxO78Ddz3zvbnqKODFIFReDEIdl0doWmaGBlkqaWfcybs4XTI+stO7Ool1JfomPFoHZrJpB7KZxFbvuOsNLamlUNuEkqiFsGWV6eqTDpffvpjQjfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeaiagY+A1eG8SRzkigLRik5LHtOohy6O4fCNy7n2Ss=;
 b=yk/aZxG/zttF8UziKy+sVWaGuPJqcm3gJE+Av7XWeUHLf3HmddUvFJNfR4SWQnmBcSq/vGE5WhDq24AOt4GCdd6/jsYhz/lHGIW1EtxUaPLPIDT2TgcMhNqL8y/838IH5qoQkqLYX4o0EixotIATS2p31rX3K8GkAPEpp1H/RdJBb/LLsoCxiBDZ4Zjk3fe6trD2ooDT5PyEM0xOnVfKNQoT/YPY7N26iGgCfY3twpgZqK8kRHzi+Nz/2mQ0k4aBdkugCfluyCFdFMktUU+rxeNtVTvWPrmE08kMFWPTpFWX5yBMM4QOgOU9OPqmkEmP1Ju5DkrV+vpNCS075iAQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeaiagY+A1eG8SRzkigLRik5LHtOohy6O4fCNy7n2Ss=;
 b=F++yyDZwpkjw4/bVp7gorwilu1a1WMjHgL5g5TWmSG0bpUFozzZyBD8+8FiEGoxxzWL1z3vcOvKlxzUQ5H8fznUlUz3qf681kUAyLu4q3CRzK0J2g/+/l/0rYOLP+4rFYzRw9cpt9biPcHTaO4IR0ceegwR/i2YJ//OlB/jj1LU=
Received: from CH2PR14CA0045.namprd14.prod.outlook.com (2603:10b6:610:56::25)
 by DS2PR19MB9626.namprd19.prod.outlook.com (2603:10b6:8:2d3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 14:19:06 +0000
Received: from BN7PEPF000000A3.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::3f) by CH2PR14CA0045.outlook.office365.com
 (2603:10b6:610:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 14:19:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF000000A3.mail.protection.outlook.com (10.167.248.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Tue, 3 Nov 2026 14:19:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 0639E40654F;
	Tue,  3 Nov 2026 14:19:04 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DAC02822563;
	Tue,  3 Nov 2026 14:19:03 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 3/3] ASoC: cs42l43: Improve pop performance of the input power up
Date: Tue,  3 Nov 2026 14:18:57 +0000
Message-ID: <20261103141857.672537-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
References: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A3:EE_|DS2PR19MB9626:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8b0c5944-9dcb-4332-fdb2-08df39b56af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|376014|36860700016|82310400026|11063799006|56012099006|261009223027099003|261028144727099003|261022105027099003|261021121427099003|261022075727099003|261021123027099003|261026140227099003|261026121527099003|261102123227099003|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZZPk2l7XsSa9zHRmhq2cRR9gkOMv1FI3cse6R306Xd5/RoF8KvXtzzF1pPtq4bs7GOobBBwLRLVZjseAMCsmUnnv8QcEn0TEXYjvSwR8QZEWHIdWrHXX33hD7KOqThUm7uM1jXmYoUW17CvKZYlGv3BwjXG8DT7wG0YI5H3bXJ0uDVWisb3lTOOuGfT64PDwU9Dnq5ia1BpNSSeO2auMwDURt2yKvNy3yj/xFJ2qIA8rJbo/gAN7TcEWANZ6ap1zW/vpwQohHYRvQ92C71TlVvW+UFnjxrMT/2+dUXWVg10nV4bwzYGWVg9yLYsV0gLm8V/9sznLI7sL/7iLBAivzbm1rPn/zZyHbCr2t/fj0Si28Fn2s/NA/HUQKtaOS3+4pSajmmfck4I5u5GZoPOz85XgedaADxGvQnvE5SEyPWs4w5QaDkJTZJBcG5Jpy5JLYjuqyEIw/O6pdqrI/cOX7OSAbs6i8TRv1ahEK0Hq0zQPx4sIL3iWxQBgKXDuSnxd+9cTzQIiRJHK8dDz66t/9olnlZDNyqKdudiaaw35LNpbIDFCJ/SttUYRRjQDZvWvsn7mFGUXD3ZZcbvV/VuKcAORcGpZnUFTI7jEI3eI0bp6EH6Cu5LSkkCERnGUHxK1lfY8IZed9f/YFeLywgE6cM7GrR4Hv/yUqmwsnk5Hf0invgu7XmbKZxqulqmO2iNLH1cgQ+DLYw+EQcKqv7UJFA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(376014)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022105027099003)(261021121427099003)(261022075727099003)(261021123027099003)(261026140227099003)(261026121527099003)(261102123227099003)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	blL5EDxGuC/apXrAvGMXWFuuoYQ3gvMCVq2TjLeXPNk6yZchDcWVCkxvw/PhWbbcm4wUfY+K3n7eM8kjYd4a6Tmv9mn/A85+nYTVvtfGsGfKVDXO8hzvud0DcSGyhPDWetctyZnQaDvIc1wFTm5ty+Ady9d5D8IWGL2uWRSQLD624tkD9MgcpGAlg8GiswVwY8gZFI8C7XFBTYIs325CF9xZWf2ft+Zch/CmPm0RrYsuqc5SPN5Ejwn/JR5PdIITlRqGeSAP8MaATN0AxJRMonJwLZ6Z27Eiyp9AxWsqXE8aO5+Df2fcILJYmZSN0SySqxxtiqLbsBKZSwkIu97+1Qyleqil6JxWMmkTYSZKUiwgsC15dD4IOp0Xp7K8scoECUIIGjOp4q2v6vc51qkGbTytifrTJRreHHABIMdpS/sxohBLH6+fxQejsl8bY6Zw
X-Exchange-RoutingPolicyChecked:
	bXdCFMza8m7o7DNX3lUiHLQu188OUzIoAJ2LjJjXypJUmkkBqt422WH0bgAAc2Zssap3DO/KoFp3s0C/dV5mH634E6zncgDGtHAOK8wBg+ghgI8uF0zApKoTVdKWs4GnUzwIhac5MeQgKlqCeaf4pUekAwdPG8exelpCxxC76YgLwcjnN41GZpsld275KJofhNC2A2sCFagLDuf9yXmEcO4+7cUHszVwvSwDmTXScdbP/hdz6UYe584tXOLHNV5o2FvOpqGZGPrnoKvIki9kaeOvCYzLtTizqJIXOAiEaFd3kmVnCdlb1DRYHLEjM82Bizrsv4wMpYO5HiDrG0esow==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:19:05.3945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b0c5944-9dcb-4332-fdb2-08df39b56af4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF000000A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9626
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX3wUfXHhDBqho
 xyWT+Cq/5IwXgtzN6YVSBMzGQCJfDN/Yagg+fC4xU5QxQrEyPdiy6SnAXdG3gp1bOAb/CiK6W5l
 K1xmDpRI+y0hgyQAiwzsOGeFjMNir0TPaHpQcehCJlpvhpdLWG0AHDv1i2LtBbAdMPKoOm+22hL
 H3rq5D8x+LOyc/ZjOuePl0UjYqsGVZc2bIUcItynmDuS0eWrGdsfNV/pcKiYV1IQ6JNzjONkv2S
 ktOwNtPcFxla3ewl0vGFMHFOBZUU4GXecL33b9pfWPHopJpkbfuVNZv2nIoc1NpWdfcrfzMbjbn
 peVo5BHiA/ZSDZZjjQIlgssZSyMBIVpJl11QJVSq6K+EU/jOOIoG4JKMtU2xC3vLCjlYgKikHUx
 N3cKEqs3tBGTa5+tpMm/yrFEceE/YTEoYOvvUBeWDNRPLeUXrMJI06NTmglR2Sy+0jpBROzEioB
 GmXoUjC3xcoYZlwcRcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfXxA96eyCjzsXd
 1UmBeuxT6BOta6fTWfVwy+WaCxr1yl2GuBSmdbR2JlCZZL24+4RSUOA7HHHl67xJPSAaDkyM+gM
 w9WqepYv3uWR9oKPqpfx6t5CSbcCF4U=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae9ed5f cx=c_pps
 a=xX5bFixAAzgdQQ8ihQiE1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=wcy3V9cfQUtsiWUJA5YA:9
X-Proofpoint-GUID: 5dwjY9Is1K25Nhj5TVQlvKJhYw60emTt
X-Proofpoint-ORIG-GUID: 5dwjY9Is1K25Nhj5TVQlvKJhYw60emTt
X-Proofpoint-Spam-Reason: safe

cs42l43's decimator is particularly susceptible to discontinuities
during startup. To help reduce the pop noises adjust the high
pass filter settings whilst powering up the microphones and add
a sizable delay to let that filter settle, then restore the user
settings.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added DAPM lock to affected control handlers
 - Corrected order on new registers in the decim_info array

 sound/soc/codecs/cs42l43.c | 69 ++++++++++++++++++++++++++++++--------
 sound/soc/codecs/cs42l43.h |  3 +-
 2 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 8fccddf7a1b22..43758f790cb0f 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1345,19 +1345,27 @@ static const struct snd_kcontrol_new cs42l43_controls[] = {
 	SOC_ENUM("Decimator 3 WNF Corner Frequency", cs42l43_dec3_wnf_corner),
 	SOC_ENUM("Decimator 4 WNF Corner Frequency", cs42l43_dec4_wnf_corner),
 
-	SOC_SINGLE("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-	SOC_SINGLE("Decimator 2 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL2,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-	SOC_SINGLE("Decimator 3 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL3,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-	SOC_SINGLE("Decimator 4 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL4,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+	SOC_SINGLE_EXT("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_EXT("Decimator 2 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL2,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_EXT("Decimator 3 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL3,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_EXT("Decimator 4 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL4,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
 
-	SOC_ENUM("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corner),
-	SOC_ENUM("Decimator 2 HPF Corner Frequency", cs42l43_dec2_hpf_corner),
-	SOC_ENUM("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner),
-	SOC_ENUM("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner),
+	SOC_ENUM_EXT("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 HPF Corner Frequency", cs42l43_dec2_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
 
 	SOC_DOUBLE_R_EXT("Speaker Digital Switch",
 			 CS42L43_INTP_VOLUME_CTRL1, CS42L43_INTP_VOLUME_CTRL2,
@@ -1737,32 +1745,39 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 }
 
 struct decim_info {
+	unsigned int freg;
 	unsigned int vreg;
 	unsigned int vmask;
 };
 
 static const struct decim_info cs42l43_decim_info[] = {
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL3,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL4,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
 	}
@@ -1770,26 +1785,32 @@ static const struct decim_info cs42l43_decim_info[] = {
 
 static const struct decim_info cs42l43b_decim_info[] = {
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL3,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL4,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43B_DECIM_HPF_WNF_CTRL5,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
 		.vmask = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43B_DECIM_HPF_WNF_CTRL6,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
 		.vmask = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_MUTE_MASK,
 	}
@@ -1802,6 +1823,8 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	const struct decim_info *info = &cs42l43_decim_info[w->shift];
 	struct cs42l43 *cs42l43 = priv->core;
+	unsigned int fmask = CS42L43_DECIM_HPF_EN_MASK | CS42L43_DECIM_HPF_CF_MASK;
+	unsigned int fval = CS42L43_DECIM_HPF_EN_MASK | 3 << CS42L43_DECIM_HPF_CF_SHIFT;
 	unsigned int vval = CS42L43_DECIM1_MUTE_MASK | CS42L43_DECIM2_MUTE_MASK;
 	int ret;
 
@@ -1810,8 +1833,10 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		priv->decim_pre_pmu = true;
+
 		ret = regmap_read(cs42l43->regmap, info->vreg,
-				  &priv->decim_cache[w->shift]);
+				  &priv->decim_cache[w->shift][0]);
 		if (ret) {
 			dev_err(priv->dev,
 				"Failed to cache decimator settings: %d\n",
@@ -1819,11 +1844,27 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
+		ret = regmap_read(cs42l43->regmap, info->freg,
+				  &priv->decim_cache[w->shift][1]);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to cache decimator filter settings: %d\n", ret);
+			return ret;
+		}
+
 		regmap_update_bits(cs42l43->regmap, info->vreg,  info->vmask, vval);
+		regmap_update_bits(cs42l43->regmap, info->freg, fmask, fval);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (priv->decim_pre_pmu) {
+			msleep(150);
+			priv->decim_pre_pmu = false;
+		}
+
+		regmap_update_bits(cs42l43->regmap, info->freg, fmask,
+				   priv->decim_cache[w->shift][1]);
 		regmap_update_bits(cs42l43->regmap, info->vreg, info->vmask,
-				   priv->decim_cache[w->shift]);
+				   priv->decim_cache[w->shift][0]);
 		break;
 	default:
 		break;
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index fd50feb26ae99..2dc8d530a1fc0 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -61,7 +61,8 @@ struct cs42l43_codec {
 	unsigned int refclk_freq;
 	struct completion pll_ready;
 
-	unsigned int decim_cache[6];
+	bool decim_pre_pmu;
+	unsigned int decim_cache[6][2];
 	unsigned int adc_ena;
 	unsigned int hp_ena;
 
-- 
2.47.3

