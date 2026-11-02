Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634893;
	b=0BupI7Xo4QgHKu3LxGU6d+M8zljahLwY8iE9WlVdTyWf90KEvCUmPMvwkv6zMhAtOEZT
	 Y3gMNsdaLcAzmDSoNtGP+0tLCJ3gDGhqdUG5jNylH2y0SB3pJSQRt4kAr4SoQXPz9fiBJ
	 UUtq5egw1D6qS3Ljjr9zeYGoOhN9t2YcNBU0DAPfaoSrK1ByguSLGQjcl/ez9Pw0/YKRi
	 yfEvuk7+gElJSg+yrCqrXBmeIPfWDUDfSevDMMKfA0bwW+JAicrUjCDP8tZAYI5FgAy2v
	 PEJPQf0mwy4Gwg2XupQZnA1tE7NzuhTFaHaacL98vzCStKA9zH2ppJ+FGaDmPj6MgVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=dwiP4pcsoIYcOKX9mSO1tfUOBMP4SXlCLPEwfsHDw40=;
	b=p9bFa/fp+7iqBvU7bJE0na5dCsxCY5XahExkhWdMpYZOGVY2zp0hILGYJewNarJn7voz
	 edFsf8z0pC0XE9IO39QdwgRMkgAB+CUtS3iAxIQfKJjBRtsaEn03h7iPQ89YYOYOfJw4E
	 unJ7KtQ5kum3vh6RCBWJ/1qi762E3p+bWl4cxO9IFMc7Ld2WX7DSJ0/MUzgyb9RIThYJQ
	 c7cfD1IruSsmWNINzGev7SnptHSnx4735YjxAfXEHflQODr+mKK2J9LwftcN+geMuniI8
	 PZkzac1VeMteEnLjyCXYYPiGMGaTglD7A9+O03xDDNqmIIwV/o9zJHbewYR2TCcllsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=U7h4zXbp;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nEPp5Vyn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B910607B477;
	Mon,  2 Nov 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B910607B477
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=U7h4zXbp;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=nEPp5Vyn
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2FYPl73168405;
	Mon, 2 Nov 2026 09:54:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dwiP4pcsoIYcOKX9
	mSO1tfUOBMP4SXlCLPEwfsHDw40=; b=U7h4zXbpuACdDn4mvLzjca1uX4BKLysq
	calR5wMT20WRrKNee89oq4SMTiWaBIuVrhN7aJGQ5cTD35lyf3N220SJKu4a/pWg
	ieMfQx2lYjPs3brvxBwlc2/dxrNaBeJhXTf7iWQur6X3E2PWI+rWz9BT9tcAZAl+
	PVylg4f5Ib73Yq3xAXFK9ZoqN+CREEgPH5cmN/4raQNYruwyOt8wA+yKuQtn94yU
	SAaRy99ogIg5vMkPf9+cU6ImeY80/yHY0otkmEJ8Hc8DWnB2Jt+rtctddQS8Yn4R
	i8zQtkFjBVPoMRT2QZTauau3lbn1ES9rH09dGuV65px8uLysrVKXcA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021140.outbound.protection.outlook.com [40.93.194.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfa2xx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 09:54:50 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hT6ixpveh8aMHiOVXDFRr2TPmLfiTWGxmGImoOapGHfADZ115CMwoo/PR3kVQuwVkLAeZFUBGuCYhKRHd5mmpNhYgv6mingFfz8GXk4jPdKSYt79jWBcfeBUb5yorB/iOjR3JHvqf55NuYbXLhAKc+O9S6dJvaHwUUNYWvVyPDzrMb0HDR08LuVjWKXpbzdq4QgiTpJxO9xtCSPYO+UM+oaOFD3/ilHOa2awiLhUXBhGDTRQxhB+CotOmPeM1XHsPhCcJKIBM7TYqxIsIis5cMnhrkXtiEdNqJLNL0nxnihdki2lI3+l4oLAuGOl2852j7c4wFP3j+7OXdNklZc8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwiP4pcsoIYcOKX9mSO1tfUOBMP4SXlCLPEwfsHDw40=;
 b=K9jOFz11S8jKgta++SNzRYdRwbOSfFkqxG8vFhLECQBCgGCUIj4XGgM4mzw2QVljXituhDcm+ghUiDHUYujjiGkwnpO+vnV5x1Kmna2uyBDP/BEovtj0jpskCpu+zNX3GJD/tA8a3UxMRKUzAICBInc4cVj9Bq/4WUnBClTp7x0hA4sgBXY7qbyR1w7SM2UwYBLgDMOpv5r/XbgM10C+xS6rhWpMApr2D1Os+Gbrof+XxyOXeUleBLgubozg6krxDvQlficAlPDNHoiwTFBPMd8HNL9pW3BNh2K4He7gjWy4UJRmsBHWqjFppXU7VQQSALLYn9FrlSSSAgqigAawXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwiP4pcsoIYcOKX9mSO1tfUOBMP4SXlCLPEwfsHDw40=;
 b=nEPp5Vyn/mWDUssIUfKgvktXmKBgCRzaEjpIrriBxtY9XgVM/cDed7YnbuYJ15VR5TMEJU1ktsn26wyioWzGy35IqrILtjaEHdUGXdN353PXREAR4lc/zeBvhXX9/kvuPfiOZYdjFU3laVHxflDEbPFEKi8okhSpB45V8hOuEIA=
Received: from BN9PR03CA0239.namprd03.prod.outlook.com (2603:10b6:408:f8::34)
 by SADPR19MB275144.namprd19.prod.outlook.com (2603:10b6:802:103::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 15:54:45 +0000
Received: from BL2PEPF000352D2.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::5d) by BN9PR03CA0239.outlook.office365.com
 (2603:10b6:408:f8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Mon, 2
 Nov 2026 15:54:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL2PEPF000352D2.mail.protection.outlook.com (10.167.254.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Mon, 2 Nov 2026 15:54:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 51EDF40654B;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2AAA382026C;
	Mon,  2 Nov 2026 15:54:44 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 0/3] Improve pop performance of cs42l43 input path
Date: Mon,  2 Nov 2026 15:54:37 +0000
Message-ID: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D2:EE_|SADPR19MB275144:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56213cd7-359d-4283-75df-08df38f99da4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|61400799027|10067099003|18002099003|16102099003|261102123227099003|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	GlWCjL3lbCDpSlFIXAB2c5JS3UGSey/6OFFZRBbyikuos0tC97/jNcv/qiuphgZWr7tIWiAlfNlv42ZKd61rTwMKvjOy8ZwRqw3SrRC1SOxgeFTiclmCds+v5vuT/5Um7ILhxTxlHfboO/XHFXMaO302wPLVgGwMEn7/N7J3wR6MaGaUntAGEaY2N0rp7b+wEEWahJsiu7HpEPynAD0HICPFmMI0P83kB3PIa6CERD5EnYBQST0/54uG0dh/FuA+A4HMHBd5aM3/VaZFI5DiHegziKSbb+8kKixyRZ3mRH/haPOYB3KABoh4OcvjztujTdZWMHWNZ33rM76rhuQNVrrABDFzXH95LfvRAYIEG4Da26JD2vi8OpUH3l/C0g28d2BZAu0jTCaWrAPB3opVOczCK8oiX+HztN+PyvaF5MPjAl2cmVhdeR2+IYIsupaHwB0Obi1tenyVx/zdCZjxV7wlFRj6EvePUJN3DS0PbjCOiky2XmfS+VJY2Bdmihlb4IxJ03AUs3LFkA/C/YYEfBWP8o/ZQurtHion6DLyy+Q5PkeWQllKXWC/SdIegLDDQs5fQWaPyM3WqBLuEBYlOMcIxoFPhTzaMiKLnlHd/2hHHW2fQXs6MrtDzV/G2mfdxNR8dSrRzT2VBpuzXJWWwdfRU5nIp4m6CywLdvS1OWGY9Tkr/qKoW4blVsVmhgOa+SXJMfX1FGommFBjKJ/sfA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(61400799027)(10067099003)(18002099003)(16102099003)(261102123227099003)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Y9dUZaQ7fuzl5weVCoA68gYPU7Efmw+t8MSs2mcmdUbagwXcHJ8vtyvCi+Tx+PaXvAQTBAsWNdFl+gk8whQaAZJ++WSD8cBDJgIMgUTeik6fklApJ4J9Rp+XzFXXZ1f85M3nm6EmBDbpqTJH68Quy8HCC0KlmVrgArpQu+qFqL6wy2ZYr/gaG8vvXH3zgmfTU3Tuv65aQ1rwtZkXlSPFn7grTkYh2YXxsOipbmhfTXBqYi4uLa+y8TORw9+sm8nJ0LuTCXiZPPv7Iw+mugWlTS0L0/TY5GoSeutUZTmOsZW62W72G8GTKgr+SquuS4vJqIK9Fdfuo8uzt3mIsWts8WiBhuuJcqOJm22yhx8xeVpIrSp1ic8uyEp6i3J0B6JewFyDx0nI8DxDtq7wUjn5qBmuPoAawMjqo5PagzgZsziwHNvTHBXqryNzx9c3Xq5
X-Exchange-RoutingPolicyChecked:
	jMMy4iJ9j9CCq0rwbT+FKQzADTWlw4MOxlR0gjJJ6FHIP6KVRrtgh9vUHYAfICnz3xD9wk/r0b222N7OzCD4PTrxwhHQYO8kO5txlGhTWDhBOcA5CpL5Lq2RxmcPKvDJmVpwUV4+6AIAUKiEeE6q3MeXGbNTWGURjt+6qxmzLFlcQ1GJsFMDX0OzZThKZ9g8U2p2ChA+sFHWW9ECNJVlGAySIO9MGkRAwwmNTgXQ6iyYRI4m82hG8LfCEmHzUgGLitlzXBIFqCqoOxxEiHWgx+EXyuc2uh8XDZUb7raOsI4GGVH/AlkTCJLq3ic/7KMp5eCt37wwR3nq6gLEYl2H3g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 15:54:45.0649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56213cd7-359d-4283-75df-08df38f99da4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL2PEPF000352D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SADPR19MB275144
X-Proofpoint-GUID: 4cg-v6P980qqGvft3rtYQWroVJZn39U3
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6ae8b24a cx=c_pps
 a=9413hkbT0mE/MGYjVs5kYg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=c52L210Bym4mdPEIlocA:9
X-Proofpoint-ORIG-GUID: 4cg-v6P980qqGvft3rtYQWroVJZn39U3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXz9yqJeOSiGFn
 YrWBnd0LWSfQ/6Pm4EMyujlC9zQQvFpdHbjpGwfVqZkNjtwiGUq3D9BFXMHj3mgJoX0J8J/22+O
 qBHKLtoqTq19Fb5dkaxiJiTyLwv7iz51ujLOAxdEh+ScGUX0j04v/eG2jT8oqU5RgOtrwV1p7P4
 Y3+Lmm2Y4V/1xqWD2GkblvOJphcZNaaNpQxQCvH2pgw1UVSD5Ta9MWy+TqIBmY1caeDH8H2ijDu
 rm1JL5HYl705oyYqYNSh7CjFEOb5TpQ5Nd07VyN8whXnnV+EmIUgHEOnFCUdRDSRNl9xn3kBaHT
 NX3VHxHZJ45TUJsiF2/yrfGo8xFlY20KhPlHkZCbD+ADdEYFyH6eBEo3754vLKXZGsXwFG8xnHT
 oK6tc+SlKPFOwylZRhKmQyYB6EBTc5m7hv8+vEOkvD0UpSuyO4LFiwfErNfYuqgaxVyJuZ8vJTa
 2cbvVoV6yo+l1ECuXTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX5gWYpvLWYP8A
 K9SHi6d+QeMoDvMR3dIuL8r5HdVeQNanw7dpgTRN+CpUUv40uQ+4N2669Fsi/cGbmqsdaKGaWxa
 AzyYWk8ERK5gYDCwHORjtk1ApLkNHds=
X-Proofpoint-Spam-Reason: safe

Some rework to improve the pop noises associated with bring up of both
the analogue and the digital input paths on cs42l43. As part of that
there is also a little refactoring of the DAPM mic event handler to
switch over to look tables rather than switch statements.

Charles Keepax (3):
  ASoC: cs42l43: Improve analogue mic pop performance
  ASoC: cs42l43: Factor out decimator startup data to an array
  ASoC: cs42l43: Improve pop performance of the input power up

 sound/soc/codecs/cs42l43.c | 187 +++++++++++++++++++++----------------
 sound/soc/codecs/cs42l43.h |   3 +-
 2 files changed, 107 insertions(+), 83 deletions(-)

-- 
2.47.3

