Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794930455;
	b=t05RX08S+8j63JvW4c8osZtFEnhnjF0y4tcQZBmLznQx9YVo7PRJ4TYYcSKRJaBt7fsi
	 Vf89zDRGhSI8ibgGmPAVyN+sxUjUn6w5AfyvwmyIg6xBQGDN25YerP8gVT2ogKYmEgiD8
	 MTWNkv/MvLJEi730tma2ahwbzn2wwA9wM7KXIF/q5/QHK0erj5RvHJB9G3/TLPo/CwkfO
	 GAZ0DT96tsBIsUIw4J/t+m9WNjQMbMZX35B5Yj7G0/X/vpYdKErEEi/D07MX8zlAMt1R0
	 08eI1qWMTN8bTuHm6bH2HUkqzmevjy5mSt67jmJ+7O3ZbXPxdDnnr67a2AVEdwkCkig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930455;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=gxxqCKrE8tOsEtYMwTbqSKH9fgkXWjyOHDOjh+mf/tg=;
	b=wFr7/9FWKkMifzixuhHiUT6hW6RLhxmI///0xmxlsiI35KZaFMy2uj1PV4EQO+aSU9hU
	 pe0k0V/+37F1f1l/psYcvCXAoGpJBT0DZ6LlNMzucJDhHh8FvLtNLEh5Ox5cIe4KMGhIj
	 ZF5TMQCGTYtAjjy/yjcIGbzaWYmq3QhoxGRAdD3vDZsGMRz64ETQYCqUm+Hrcx1CNfyfP
	 RfgSJqjUZg2R2BMmh2yjaS6K83UiTsKQSr0FJlRS/gegoMPLjDAMqLQy6qdkX+NhqhiBd
	 JxWvBMdgGI3jBq0ocnQ3P+DIAF+BqqgCP6nBP6wR8wWoepxsuYjGTVfI6K0creaTZyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=eMOR9Qyk;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qGs9M77U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6F4606A31C;
	Tue, 17 Nov 2026 15:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C6F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=eMOR9Qyk;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=qGs9M77U
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHEVxMK1769784;
	Tue, 17 Nov 2026 09:47:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=gxxqCKrE8tOsEtYM
	wTbqSKH9fgkXWjyOHDOjh+mf/tg=; b=eMOR9QykPiCaQxTIF7p6ZntXSDO9KcAn
	c4d7OT6SEirxdFRf+Al3dM84XdeopjkbPsvLDT7r3jodYifH27cRcAvBc7Usum4G
	+ima5SevBDky5yi98vv7sdpd2n4orO7386p/0O25I8PjsmOpuAMhFZRU+JipmB0P
	HXAfDbmASU/nd4bczy7G616WCyg1mkjbCKlj6wKeTqdZSuESksBSPX9lfynGtD4l
	1fLwJBv+5bf3rILPoSDq5+IQwvkVC0t9MiGLtpsoQVW+l1aiU00Ug4Ase+XUZGki
	exoQg+BrPYbqfnTuRfYwee5C6t237jLTMorja1MYA/C8UjcQbKcRAA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022119.outbound.protection.outlook.com [52.101.53.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hxmxs4gh4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 09:47:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3stEVrjZBR5zYBKSpUSkHnG9N81arEJKIsnj4p7nOIifjDZnHygCxmzhzxk13d7ehVdGVgwarJmoUaMklJ6VIuo5z+WuFJjD1ObqB2gnw0CogDmDtwAItCPbfjWcH9MMVNoz5H9o7m5PHQGL99hJ2AMDPwjEK/LOmEtjcKM8FdB42HLastlwd/UX4tR5QgXG3B1Gwm+oF+lXSQVIxW0um12pbd76g/DBtCSX8GdlIIF1LOZnHWmI6kYLiMzYDRNWUm5yxZzHIU4n1SWM6DWwTIVLr/BupWNNpPMVl120nlebDSz/2Mj4bo0i/cJ4IshqQQdY46XkDIbk3oCLdfiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxxqCKrE8tOsEtYMwTbqSKH9fgkXWjyOHDOjh+mf/tg=;
 b=cSWeARoc2IF4htAk8OMsyjm1ZJ5MTe9h8JBMQoj26YjKrlk21Olr5xvOp3rjEWynaGvOnD7BDQEUYzk5MNdi+6tavKXZwKxRM3XRr8KFFUc2a90tkzfC6+/RucpCItos+RgBKlRX6f90rgP9vQjNkdXY0tGEwG7uXRtW/OqBZybWwct6mHM43+v+dSCqXDuT2g3Up4NqEmXyLvHeVSc8xxRoWvNeaaxJtFKBnMW8nx2Kt5w/ptz9NmoEUycamjkIl3u56B54iGqSngExRSJTXO+eiQXpp7fPyqnCrJ5cTkbvZqH2Nkrx8v0AC/gystS3LC09wHf9rl5fawloZ7a+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxxqCKrE8tOsEtYMwTbqSKH9fgkXWjyOHDOjh+mf/tg=;
 b=qGs9M77UVQjoFJWKcAe5k0ti06qXjZ9VFtJaSoCqjBzBJopc4MfCdqy4lJtKz/rgqO8plokagEGm+S9ux48MYuRcq5ZY7VeXg3G1iAcMva50VzUXfe7NziOQ/nD7+IvgeH18ekCbWZA/durqI5TcNugeuvtM/Z7Vc+LrE8wnXss=
Received: from PH0PR07CA0118.namprd07.prod.outlook.com (2603:10b6:510:4::33)
 by DM3PPF7901E5E8B.namprd19.prod.outlook.com (2603:10b6:f:fc00::739) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 15:47:25 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:510:4:cafe::9a) by PH0PR07CA0118.outlook.office365.com
 (2603:10b6:510:4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 15:47:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 17 Nov 2026 15:47:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 74017406540;
	Tue, 17 Nov 2026 15:47:00 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5A98C82025A;
	Tue, 17 Nov 2026 15:47:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] ASoC: cs35l56: KUnit tests for ASP register write blocking
Date: Tue, 17 Nov 2026 15:46:58 +0000
Message-ID: <20261117154700.840631-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|DM3PPF7901E5E8B:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: babbe97a-091a-451d-fd83-08df44c21177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|61400799027|18002099003|16102099003|261009223027099003|11063799006|56012099006|261102123227099003|261026121527099003|10067099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	faJ0zfQe2u4KYXdj6BBpHelq9/Gkc/oSTPZVcxRbLQqi68U7OQi5cJ3snewafQ4s+jxa5YvAw0J92f112DYB4NCL5wUZmn0TYUSxtL/0SBqvVHO/rjEjCRT8AQNm7h8QfAuZjhqW+poIll7vKQ2IaD2+tUsRf6MEeyOC3WhG520kDO9R12aYLfpKIeZxsAR31attZmi9ruw2CPnSgzDYnBakO7JeOzjHHWuSxkwVMm4VTKTsLac5LRUo3mDXuOi+5ZxaLnD9SW+zUfOM2xme6Yc/MV3ZrNe/UQFL9hmlHXrwtY0Bkr1Na/HqW1iq1zWkgU0nZ4Zybh/V+d3f9aUULbBlzWOtTx5CuVXi6YaFp+c9QLd+IDqO/ZX7+a3cgbEgkfG0d2f5Iod/22HtsSIrKz+Qm9jQQMjiOS7+7M1KUPFJre0N3mLByZdwyPAWCgxhOgZ6XJwYbUc+OaZvX+6JIvq/ZCTxzkb7E++/3TY8pepGnnkvLYCOisegsRmKU49Lv6g5Wq0LCxxQfd1PEfDU2EmmlMgofwoolehOROF07NilwX0Lb/5+0Jyf/RHEsBkt32ZEbvi6udJa2mNDX7PMvJBiqUeyzDkUucaSWoQaAdofrC4wth4RK/M3/VasJxpKgLf9eTNKakvSKPDDAXgiHiikATFhxZnQyy1ZZ2PHc9GcCoyBI6kxsCuMm8aaCr1qNXGRt9qTCR/NB69p3JVyFQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(61400799027)(18002099003)(16102099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(10067099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CbdZBfr7aJ1SPazAxjh1GE3J24vAnwVMIhQYHRRFofS4vaYLDnUAX5vX8ZcrpU6pKs+pnZzqyWxIe9+Jck/ep0vDRKyuhgs2JH/ld1ZKYlOUd4uTi7vGtJpP6jHPgNZIDjgQM1MDqkU+0ZINS/y3cn9CnVckxI4S7v4H9uO1YrABKhGgPAeB3tay5U0+mojkbyXCTNMqsgCNNzviSkVx909/gKAsm1PV5ruYA0GzKjScg/t4Bmqxh2w++EfxSj8NhR3OZSkHcFO9SPynsR8+sQv68TfSHxt4WAJgtvYrVZuVZMADfFvIAO/mqOQ5FI0FVeG83QX8fIV1FptYuN4qdnhc4U2f3n4iuNbtmZR5xTE3i5KRvk/0Q/uvk2xpozfRpWpBxSFVg2wGj1dQaA63UhzDizPYAb8X/yzA0P481W/xff4lqgkEGRkqT8LE56D9
X-Exchange-RoutingPolicyChecked:
	aF6NdImvxCdpkpLck8HJ9dzYm72lkCryUiPs2jXbz4rnQ5lxjoCEdmFeIbR6EzmLRj3zgqgu+tqZ/5DMVzArioHF72FYapRFAyMCtWIeiZ+5kRsIzkr6YPVEJ+1/Hf9q+CTPBMsKLVQebkF6RWjTRRr2E6zsJLiG5X23cqa2nCgXLf8frkhLUBNVsDAQJS56NnXIfLis6Gr63VJkSrxvZIVMgP/jcED1LBPrAaxG1QHiab9ZS+vF16z75yJiShKDlV7JHLvd6pEJ8UDY+RT91JO+EBd70NQFvx36IwLO7/6k6rGr5lUdSvJPxbe4XqlgIdlJ9/YafigyG7X6dn1p2A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 15:47:21.4110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: babbe97a-091a-451d-fd83-08df44c21177
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7901E5E8B
X-Authority-Analysis: v=2.4 cv=bbX+w+PB c=1 sm=1 tr=0 ts=6afc7715 cx=c_pps
 a=3pEbTsiE5+CWpS/p3ZrWzA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IOOPN34d_85y0lwINIAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfXzw8uB99obez3
 IymJSaIuruYo3OSZRg3LmbFBtCqtGsGnOVaJriKonF5PuexiQgvEMtaFJjrYTijrpfZp/5BWev/
 9Urhm9anMWjfZgTu0kok9lICRx1UmVM=
X-Proofpoint-ORIG-GUID: dOciOS1Avyh426iW3qv3lg2wcWB5E48m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MiBTYWx0ZWRfX2Z2HnFSDwqUo
 zKmw46Gs+Lux73qU+Q9yt76xHLANGNYP/W0+Sa1DE/7IBSdCkPk5Onz7A3UMC90AuKpz3hakexK
 yYfGc777EzRiudP85w4vFVByT0etdBxQA0Xd0dMP8FzMfxL2oG2z9edvZ19Q7mxEz+xjHjv5Hjd
 rll37DYpOX9USugnz6Taf1JOk3BS+QUcTYXMa+UdvF7f+2gicWkr82LCepuVY2rLk9I9nGQiA8V
 q6BTSRyuzX/2oU1qRsm0d1MEJ4Hk1LTjCeVgomDnQ9FKR24Pqb/EWhVdKc6XpaAYsJYYAFMThmW
 ZHCylO/Wn/5dE188WevhZyxlbiw2JdJu8zYy86LnoKhDu0fgHrxiKY0kS+xnXohcIE6jChbzs5l
 uh7WAuTyMZFRb2Uh0uwemK0XvhT/2A==
X-Proofpoint-GUID: dOciOS1Avyh426iW3qv3lg2wcWB5E48m
X-Proofpoint-Spam-Reason: safe

These two patches are correctness/regression tests for the fixes made by
the previous commits:

commit 0085428e834c ("ASoC: cs35l56: Only write ASP1TXn registers when
widget is powered-up")

commit 396c5d8075f3 ("ASoC: cs35l56: Fix unwanted writes to ASP config
registers")

Richard Fitzgerald (2):
  ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP
    registers
  ASoC: cs35l56-shared: Add KUnit test cases for ASP config register
    writes
    
Changes in V2:
- Populate ASP register values in the mock regmap.
- Don't use KUNIT_ASSERT_*() in the mock regmap read/write callbacks.

Richard Fitzgerald (2):
  ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP
    registers
  ASoC: cs35l56-shared: Add KUnit test cases for ASP config register
    writes

 sound/soc/codecs/cs35l56-shared-test.c | 144 +++++++++++
 sound/soc/codecs/cs35l56-test.c        | 342 ++++++++++++++++++++++++-
 2 files changed, 481 insertions(+), 5 deletions(-)

-- 
2.47.3

