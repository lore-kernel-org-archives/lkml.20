Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794329418;
	b=Zzg23p4kmrSne+iqulK1FCfstmfOVoEG4Mkc7fgMHVKJnPQx5hOuee8yX7Siz9ENPdhX
	 FOqog1O1arprNRMql3kevCvC5u2nG8GnzgkgzFDgtxqvniZkFGFUiFUkrxk7wl0tqwYWE
	 LfGny24Bj7pkJmBVpPzW4/uIpLwlnyEGYc60r9s90Zo1IBaeEkyV0GMBlQ6Y5rWYoU7rr
	 MjxZ9n6k7oxFro73NqtZO/HR/s7E9oZPLZ5+tvoV/GiFfLPkX0ToJOAAWb8ii2ZJCXG77
	 TwIL0QGZawVStFYnS0cXM2K6QGZ8HYjBK6YKcNxF75jBKxisgHaVG2ctWmKXLogcexg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329418;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=vsS2hSW5kBEulMdLOWrouGYkAq4mpjghTWWcZ2t9jxk=;
	b=LMDk179tZzfnqpkmY/hLzK7theIFpFE/l4Z7YIpoVfcx79+Ki3EQjWpVir8Wv3DNM59T
	 CZK8rJmixaGTHUWUAQ9ZWFEBS+a09ZhUD6gBdWjUqEgEQAJsZRHYP23XwCNVux47ZObzV
	 2yS7r18ImsLgmSap2bfC9/WaHdAoWdYFIPXqV+iMAPoocrFe0zm+sZPiAviAqPA9FH38H
	 v1fY+vpBh5BIY3nzCH1K0fk87+3wXAexMMIZRrq87SsFmI6OMmTEtZjHXIwlUmpqWiOv5
	 uqElqXLWeFw9j01j10xubKElf7XmmUXgeoR+tub/lrW/cHuhCLeKHat7qoPlbIZ4y6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GMFh8GfD;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PuxZH2MM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB7606A320;
	Tue, 10 Nov 2026 16:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DB7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=GMFh8GfD;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PuxZH2MM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAGiYpX1707290;
	Tue, 10 Nov 2026 10:50:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vsS2hSW5kBEulMdL
	OWrouGYkAq4mpjghTWWcZ2t9jxk=; b=GMFh8GfDc/+gVgYeZSLi1X27lMCZZRD+
	YzYZrNgFmAffc2+6VPX+klPLSmHD2OSsEkhCxkf8n4Km0reU8vkneqGh+gU/gMLa
	GxBtcGmxZL3PSJ/kM9cjEPNVMn0HvE7ntYnvRnis9OzL8QIoRnaHMykXCaAPDT77
	1Va0riTbkdDgIQBtylz9AEBZzzYcf+uLkMcd47j68Mmay742KSccFjeDUBl5uhqy
	4x6HZ/9C6BSXiuJgsfuuw9a0psScednmF8thfFFSz8MVeeCgYIHr416kiZKrl8nP
	1Hmqwd8K7xFddh9PxEOv4hZE48FlriBuiztX9bBFMOD6dP9JUGkx+Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021130.outbound.protection.outlook.com [52.101.62.130])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19pcaj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 10:50:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnTYfoOM6gY4JMupGjAtqHIcaxU7SXbMm+Om7tmB/i9HA5vS4S6MOFauqQKwmMdquFgz0VeFEFvIXepTJgbGUDK7c9jY9YNH9R883V0oULfLTp/MwZIcqNYEKuRDzaySRHx5xYK05CGQL7fRicvCHaEVW/NEbEohXfj9a1wgbZFYGQUiPRmeHnXLTV05uVsAtqGspuYsCBDkhuAiiXgo0aN8p0mncT5s/zH3eFUuEafTS+dAClzD11KPOFWFBE3qXmbO3MljlOrFwI+XbpTAmZz6QGsKglVNFa8aE0wmf84MLQpoEnIUGWjy2u6sCRbY0gnVk/4DBR13xM1W0O221Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsS2hSW5kBEulMdLOWrouGYkAq4mpjghTWWcZ2t9jxk=;
 b=xkZbgADjbEt2TidaAucL13s5e3jmNDfZ4PsYMw+F8G2mm1p2ChdBYYplDHl/lMv/Pukl7YSdf078jjY9Lx+31DMNKOnvosIT30HnJ5FYDwpYoXlO8VaWuKyAgwbIftfI5Jop58n+65PqhVKhNzb7+Qm0gh8D73aSHmdCKD8wWGNLqij2KvGoKOf9R5z7C8SDGuqsyM4IUrhI8VjOC8lFTcQr03/Z64m3Zj3EkYfMunnAOqNF+vMCzSSYb15BGcCIcmeKVBHX9usCwAon5XFGCjZdn02UitTJC2eW6KCrkfBAS7WWZ4ycfwT+oBjOfV7ezNDM5bi8d5VJ/Je5RI6oIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsS2hSW5kBEulMdLOWrouGYkAq4mpjghTWWcZ2t9jxk=;
 b=PuxZH2MMJWAzZlyl4Abe/PhKR7nseVJuRksSQLSX465KIOa/Sd4BcUNWo+fOSk7wXYxP/qNDwo24d5Na0Q94Xy6063cQeQpBPAa+Tt8KGsdcuNVyxiNjISKDPlg/kLthNt9L3qpyxsaf5l7ka0GOZ5/3JP3LjFFXQE/qizzW+zY=
Received: from DS1PR04CA0013.namprd04.prod.outlook.com (2603:10b6:8:44f::18)
 by SN4PR19MB5358.namprd19.prod.outlook.com (2603:10b6:806:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:48:10 +0000
Received: from CH7PEPF00000019.namprd21.prod.outlook.com
 (2603:10b6:8:44f:cafe::8d) by DS1PR04CA0013.outlook.office365.com
 (2603:10b6:8:44f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:48:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH7PEPF00000019.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.0
 via Frontend Transport; Tue, 10 Nov 2026 16:48:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B34CF406559;
	Tue, 10 Nov 2026 16:48:07 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 89F1D820273;
	Tue, 10 Nov 2026 16:48:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] ASoC: cs35l56: Consider SDCA FunctionExtension ID/Version for firmware name
Date: Tue, 10 Nov 2026 16:48:05 +0000
Message-ID: <20261110164807.1671681-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH7PEPF00000019:EE_|SN4PR19MB5358:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 793238ac-9594-4082-f822-08df3f4a667a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|61400799027|376014|16102099003|18002099003|11063799006|56012099006|10067099003|261102123227099003|261009223027099003|261021123027099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	IjeacGWfKqPTzRKlUAQOx4tc1pWuO8m9uSsAQx1M/cLNZZDDVb+nAi4a7HuYdwCwk9rzul98ztLA6/jq0wN1drZBKGbP1IOM7QNHkB4gWOVCVimBh72+gf1jJpzA6v5V2s4jZoOq987q2kj3G7jlaEw3Eh1m6bBAeUO2PBQaY2PSymsrG9+GDYSmYxZTKR0BDPAarkBo6LomqBP+F3wyOFexV5bELMjtbhQ8TRjlrI33mbv0af91HF6NIDuX8x6j02O+RNf+yiS+sJaqTxKUrshB5c8B1ThJjVzPwC06BblYHxnz3pcA+jQtyhk1wjSPAnk3qKozWbRxKLE/ZMjn5p5RTpUw5pTkssWoNcT9Eu+e8fOdXIabrFEsQEdmK9r8oI80WP/wAnGyaZFovgCnejcFmZrIlrbXSbTr9lzHUuQCCBDK0SGX5SrQ+Qj6zNp1jsnwOuxqT976eNsNWtunOZJ8LnP8Fbqi++1nMkBE/G8zhVKb7dLQl1+Hovov5J4YyjaTRt3eNErmyEcuiohRRHFkRXHBXJZzQfUp7bKaTRP3bt9T9j2c3xBOxBv+rQzQZGUWiO6StJ3TZtFg5aeHdNpz8iMzfDiGhCkDh8rxpVioJHJOAmRBhDmLujoHEc6hOfa+QFQ6ZFpKjox40QIlfT9Ao4AcmLfJSxq5M/KyAWqqU6WZcWpUoMf43WAJnmZsSexQfEYRJiemnQMOGzL34w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(61400799027)(376014)(16102099003)(18002099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MHcLuM4JHXYD/1vnbr/tJ9eZZ6dFYbBGz9amKJkYm40d0JzwuJ2R+BCEWPE0c1MTneZrastXfp2bDcTznQY56LIYbJNjtoNJLFf/jNAWUbf503IHj8LGpQjODTP/sKiVlmI86VMy3s4DUk3HP5NGvZL8vBk+tzUPu8gl0BOAYhzaWovkih5u5kvmQLe15waNLjAHugfKMXUewgDmDPkRr774ZQGQ82UHVMl3BwVIRyhU7lBEsJYab2vlDal/m2mWgnRzujSQNrYwuSbM6CQ5axr0GtS/ebtp0gG2nNwRIJlmD0QC5fmeH812ZQ52LS+DDnO0d6d0KfiT+h9jN7dYizTwYRvrJX6CM9wMUH3R4So9eaILjx72Kwf6mpHP2Cw3mmaYvyVBczB+7hlzWF2D25lBh5pjPiz+FiKT9FseddUO5s6PjGkiJO2lun9nlHCA
X-Exchange-RoutingPolicyChecked:
	isalVAM5YresZV2ciMOV/mP5KKlk0i5L0GZkKMrCssfxSK0oX8xmM0Za9tf6mxj4i/KIPYaOOg8yrjjNZToB4tV2fPVqQz+6aP3dEEDM90Z0p3e3UW42EaqBSjjglLHQEnyFckyvd3y1FvbtYxxcvh4h9RZbhtsvjaJoUzxeZy6NyscUchuYcYt9+VkxMCTzH4g1R3o8Rct+g7UIPk9vCsTchStabiILfb8OliWji2+EMVakrjVYOKIGqq6BFCGafHn5N9sIWVPSM/i0PN0qXz5xHuqJhk6yflbLgHwySFqOrGUacU0e31Qh5C2XLL7MI6PmwPlYyyam/kBVR1jAsQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:48:08.6989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793238ac-9594-4082-f822-08df3f4a667a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH7PEPF00000019.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB5358
X-Proofpoint-GUID: 1MpVBB6MECSiHWqD7QXxHl76TwSqRKXG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfXwHMU5jIzQQY4
 Pce6IrPxkslCU2HKVzrcVHf+CuZr9BEQSrjHADBGqiKqxGTyIuKhxuHUH+dYP1Mfog7vIZzq5+j
 ITPF0z9aEwkNe2RPxISjLwuzDudc4Ug=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2NiBTYWx0ZWRfX3NG4FRYYBzdm
 HX0fVJAjQI7HqdTJRYpnGOP+WM10TQqzOSYdX6s5992wqZszUX9RiT40XH8SxjhNTMnCYZEp4q8
 kjccMQIpi52zqnGVEjf4FN1Y5ESSWYIu1YA1jXmS+WSfpXYzAyUu+kMJmc6ePaL7zY22wQrRTnf
 SGUMxxd+R07sH4SkkaFcBHwJHjrsvspePKGg7opmIW7/n49sY4Wl9ewajWEfhpIQFuQbAQpKSLP
 elGrEEmS9hiu8k9CJMhMb6E8ERLgSQqlYMxWipoyTFujTVSAQTm75mKHp1GSQdIT1+iGrWrm+5x
 CpCCUTngEp87MZVXVp0/5aXn6A/d+SoULxpGDlVdb7eLpGVy690pUsR84YT5IuIn6ahMgRcvxEZ
 3EcWsKnAG4Ja4AiyrlWqOS/E0AOvy5KeZPlNmCk4SGhcqXTeEdPEUc5h5PDHfVX31bzkgcCQiqx
 fUOQbvIq4BSLpeAQiAA==
X-Proofpoint-ORIG-GUID: 1MpVBB6MECSiHWqD7QXxHl76TwSqRKXG
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af34b44 cx=c_pps
 a=7kgNGXaSmB15KJ6u7rEBag==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=B2sW-GJ4AbV7Ane1J7AA:9
X-Proofpoint-Spam-Reason: safe

This series is a change to the cs35l56 driver with corresponding KUnit
test code. It considers the SDCA FunctionExtension ID/Version as variant
identification when searching for a suitable firmware. The intepretation
of these values matches the way Windows interprets them for the same
available set of hardware identifiers, to ensure compatible firmware
identification.

Richard Fitzgerald (2):
  ASoC: cs35l56: Use Disco FEID and FEV to qualify firmware filenames
  ASoC: cs35l56: Add KUnit tests for FEID and FEV firmware names

 sound/soc/codecs/cs35l56-test.c | 229 +++++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l56.c      | 163 ++++++++++++++++++++---
 sound/soc/codecs/cs35l56.h      |   3 +
 3 files changed, 370 insertions(+), 25 deletions(-)

-- 
2.47.3

