Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794245940;
	b=aClSYRAyieIBQUBk/yC+dSHlxlCEBT4MYq2oYVc0J8nqJIFfE58N9FehM8P2Kv/uDa+X
	 2kwDZBVuFqegzGCGrwYSmlZ1FXi1ESSWuoOzrSfjVVMxNZ+jEtrGFnS2lTDVwbx/dVSis
	 WWWlQ/+FLs0wqsAeKlK+ghotjCuVgAdwGTgSH+oQysKHYvUCMeThoCGz9Kh5/kkw+wlSb
	 gcppIZB83NpKcmZNolQ47SOaUsNyehPYpWyCvsZWCs8wrSYYC3heTDziZ9m2kCFlLdVFZ
	 zBmwz/ppP/Bzxn7Lu1Pgy8dMj/bT7eRe2fMdnk/1SZ5BUQuycvn8sQTSPzy5I9jShOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245940;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=76SWmjCqHXYb8gqQxvZlxnjzMNtTKINiPjqqMSJKTTY=;
	b=g53HYPuCc86NPShTmNNHdQTfrTdFiYYtzdgd8oUtQV7ZfDmZ86zlDTvXw8KE6a9yp4sb
	 VBDLX5x5p3bXzyqYLgGVV2xrJ0yZgh9wAKT6zpxH2K/zYvudoQ7cNB81059NUJhlJaQcm
	 ecemamyBzzQckZVZEi7liDz8dMRfgzbQUiuhk1tRK+/6rYPm9Q6N6coI+RASupeDsGaph
	 831Owyc7R4TmOnlXUvHm2wdSC/J1l6h7Zp2nFcMkMKSD3r6Hek8rClfFBF8MYlc+2BoDD
	 NkjIJJrhbZ6dLJaSWqT85Zu6wCQ8hEP1JxjkgLgUZC8nAPdGbETqWXraan3JPthVOcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=pgD7N9M3;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PR6Rri9V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEAE606EE8B;
	Mon,  9 Nov 2026 17:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EEAE606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=pgD7N9M3;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=PR6Rri9V
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HYlrh3530291;
	Mon, 9 Nov 2026 11:38:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=76SWmjCqHXYb8gqQxvZlxnjzMNtTKINiPjqqMSJKTTY=; b=
	pgD7N9M3gr5iUbDK8WsajGpBd2Qsec00Gw+SerVNLGMVJPta+y399kFwEa7oGYRg
	Dvyj+WpGI2avfQfTdT5wFIJAKC4bDuYHRg7BATEE7oQelxy/WoM+bhc1t6ij28R4
	aDnrvEzp3sxr5sjfkrXbz6F0M5N9LqKv9KehIV0Ks9QPFuXSOrRB/jSEJpF7oVJ2
	bfgczNShbkvefgJ7TUKQc1HQLjAtPG/d/21D78Z1aDOu0DfWncrJitSC4VNgnRn2
	ru97Z9JyBmZ4t48WN1rhjOloXZiEH1YP0Lp4rSfwPv8b7A0Tc8aCazbNzRysZbfW
	hPx+qOJw/n4oP/djJwx4nA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022105.outbound.protection.outlook.com [52.101.53.105])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ht19pahx1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 11:38:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhbkE7Q2kz5b8DFa49pj2z2fnEq1vQ/M9YLFiGpgIgi9TjmdVbI76YuTfSnQWEYJTrcUQGMllDWJpE/zZVwOXY6PkqXC4GbAXUuqtEB+T8/i43Ve2x166C62FWeggXAwc3nXB49y0c8ZGTZNWRV1z3GdUs2riycB7G0VBK8zWWozRlmG5aCKSVGuVlZ8Dx+jE66P/NkTp64AS3TRQEGlEVzcW+g0ubn2MtXnAT2OblzePiK9wjc+rt3NEBOgSuyCVyogcRzttCEZwjTjzQB2M98aXNCZxwgnAmwMchC5EJFxA5fWED4uoCwzahxyKu4d4GfgwaM7DDOj3ZyyVFPSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76SWmjCqHXYb8gqQxvZlxnjzMNtTKINiPjqqMSJKTTY=;
 b=s6Bk2FETDLVutSHNQVZo3hXL0JFsUMie77Rpw6501741LII0WyoKWU/FHjWf9y2DQ1dWFmlh9hWsH8Xxj9AjUoQRT2vlbxtBTItH79u3H5bPjOsql1LVd5Sip225isnFSIhwEYKZdXEAkTVOpIsrmu2KSZH+/8jV0m+yghZ2QjtWnFD2Nq+kIASpeGV5qfHjT0V/De1J5rB+JhuJD5jIuIxV1mZ2gCgUA4uXss9eO77aiTHrIzRjrb/q5EZHgRqYQLlNfa7lI8+K5Y59k1y5W9p4veFqZmwXgkgQrNPeMlgwbuEMa6GnviQEAOEu4Xw0jM/l20D/zbAmlpTv+49BOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76SWmjCqHXYb8gqQxvZlxnjzMNtTKINiPjqqMSJKTTY=;
 b=PR6Rri9VasKhXeJ5NKkv9oLU0GlASrzYgu9kTMZ9AKDyXuNCBfUoVxEQRQvNCCZDXKfMA0Jt0+6LGbYDtXzLGaSagXVC/+irkVQt1WkAQTZJAFmQQP0lbs01E+wGjDgZKUSkkqzO0B0MOcvkhi331UrnOyAJaTepsKfccBeZ43o=
Received: from BN9PR03CA0586.namprd03.prod.outlook.com (2603:10b6:408:10d::21)
 by LV2PR19MB696206.namprd19.prod.outlook.com (2603:10b6:408:416::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:38:49 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:10d:cafe::63) by BN9PR03CA0586.outlook.office365.com
 (2603:10b6:408:10d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Mon, 9
 Nov 2026 17:38:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 17:38:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 13AD8406552;
	Mon,  9 Nov 2026 17:38:47 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id F180A822561;
	Mon,  9 Nov 2026 17:38:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/2] soundwire: Assume default maximum valid channel if not specified
Date: Mon,  9 Nov 2026 17:38:43 +0000
Message-ID: <20261109173843.4184154-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
References: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|LV2PR19MB696206:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a5789644-99be-4d8a-f558-08df3e884fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uTG2Batef5kdvmdopSl/viiaSnwSb5k6sT1O0D0wX71tO1tAotSdMWKkUhpEvCrZ7CiCZz3Octyl0SnnAG9ZsyRbTcoe8AN0Ne5LJkwEIuURJcmfwmIHqHQgbH0nZw4+J2W3m+IXaOJRRTANJKD5JXkFal0FGgPVtgzCN6d0dEDLXrLmNwNqTa0Mw6nMo4irTEWIdoalLChOsOfuHHcE0gK5UrVPnV+cnUrN9oAosOkWO70DzqplYAohU4z4eWMDtOt7VOpUtECaMUXYnOOG+uJ33jBVD+Lzdl98XPEjKvBHKZj/zctL9VGWLb7ARYHQj91PvLqUWRhD5bvV+AT8rQnyvwQToLD84hQ6yt4Kn3L+VQ5xqp97ECLtjkL7eunBUq4FUXWSyTEQAQyphkKxrBL/IArQKxGblAoaON6onkDthaYZJDbCUpqCsZUBKnx3fbjANm86oKgYDrEJSA2O8O0u0f/tuhp44CWXs9S5Js/YVWa1PCOgoTreZtSonywYap4TvzcvQI1YIGtJzC5FqJ7KUBuXWqq3GFwjByheeE7JBbvJy3Amn9ZP28jnsAG57SZuiSF+z9Aq6zQMWpNgnaKaA5cpJkoKB3/geh/stAGtHB9Jasl6eQvin1uxulkJBpft3CYkfcIsCdQMQHcEx8pPRhibj2b6BlkYpPKK0J1kFEG6yRL61+tJs290cp5ZaNvfEj4qs53ABXnwMcPIoA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0Oyc9nE8j2Tu/tc2ac6Dx42IISBUoGwnP6T8iwCyjcE71uHnPojRhRdhHh+OPJuFTb+yJjXW1B57V617JNXD//vI2Q5/m6e3CqOWiGNS7gv4z/oi/6+C+Szct3Em/tuj9Uhgo2cCCRQbXw0obu6M6YjlDvhw1LSNbWLDiBxbMlhvvCqZiPmcbSJSswZpaLeN4cTnqdcKStEIb60GgFG70xnmp7rNq+Fs1IRzC0NyKX/CuxyUU9WB4PLaOSQ59RHWWT/YdrQz6QdMZ4R3GJJvz6D89vQfjaK3KwYFU1ZKl0qc6E3D0+206IxSAPQIeVnkVMujRC2wMGK3xczH4iRFYj6j/GymDA8cWiMPLXM7jXMMH+S+EfKGXc1bB6HdeTNR/pibCFGK/lQZbWJ73shhLSUXhebfjCQd+xhFlrpdV7WGdI/mTHRegtXkD60BR/hy
X-Exchange-RoutingPolicyChecked:
	t/f8T3EZ1VItUc4aup2/5ZXL4iGa0W1cVBeDLTkpbryBh0K3lygGKxTUjmtfXp7fEZorOHnVc0iKpsxrzdYHvxhnWjO82h9NFBdaue+P605Iv9GaYRKzwfvNb3N2QmZsmaC90NercUfF16W/cCMHC6uOH9GN4nWPgu5c/wX8n7Vq7tbyL7WAl6qGLBFFfUVluNz9gL/DSYxuZuRr+8gGZ3uFbkL3DujLYT70Tpf3nFIrN5AE0VFnDrkVVn+A7AEpFf7qyvNXgm4EYgTfO6E53NrDwIWKwnDjJVXzRVxtmRtUyBK4n6+wfn2309AqA5WNmPDdg1wbGSzgYf2JTi/YBw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:38:48.0912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5789644-99be-4d8a-f558-08df3e884fb0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB696206
X-Proofpoint-GUID: fEt0V9-MoGzFzRXrHcbH2QXY3pYsa1T6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX/K6MiGqgK8CI
 AgBClcfLNQC5c5EgwidJUSrfnqJ3/e6yxcL3aokYTM25JBpYBOo7yHaY0HTzUL3F+x1qjaiYVgF
 oeK//qzYvczHj/zVyi0v1OlffC+qV4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3MCBTYWx0ZWRfX46VCAcg+8+Nq
 MAM5ilpvSYKbj+DzTK2rVw4F0FNG4ZNtP6MJNd6nFAMG7RDw8hsbicg3eXHmZHmQeDy+dGZ2DKL
 ERoFDievHWWZ+k8utvVBSbEFI1nLjrZc0BWfAiDjtqYk9SPqi4f4vGewczngJblwPQxcZaSzcHz
 yYp38WNWQfp/op3xKcckqI1ydj567peJ5ss3/3qoIGaC729XJF1BZ8cN3FMcmMc+CY/w5koAKkT
 +5pv8JXcwqcjF0wfwwvAFw01vC50Fi/MCoa/g/mlLevrtd5g9c9z/E8m6bpNMRkMRL5a7Wqq0Mz
 28JxaoutU9f7ckNebdz71nnawR6p5GJ7G4Eh4hmf6EECmVketuWjTyBxNirTfaOpICwtdUSJyue
 idJLtzHgRFX5R140GRFPw66HA6EbiF2MdNgp0xpMEUJ/XQHDbxBSJrcqBdO3ugTyy3Q7W8HSMR+
 +e2EqGIDqHnI0AhCqZg==
X-Proofpoint-ORIG-GUID: fEt0V9-MoGzFzRXrHcbH2QXY3pYsa1T6
X-Authority-Analysis: v=2.4 cv=NK5AaE6g c=1 sm=1 tr=0 ts=6af2052c cx=c_pps
 a=+zE/vu+0lv1VjxPw05mSug==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=PMFnPxJB3WFXUYLKLW4A:9
X-Proofpoint-Spam-Reason: safe

The SDCA specification defines all the supported channel properties
as optional and states that in the case none are specified defaults
of min_ch=0 and max_ch=7 should be used. If both properties are
not present in the DisCo the current code results in min_ch=0 and
max_ch=0. As min_ch and max_ch are both channel indexes, users can't
discern if they should interpret this as the default case (1-8
channels supported) or the DisCo specified a single valid channel of
0 (1 channel supported).

In the case there are no valid supported channel properties populate
max_ch with 7 as the specification suggests, to avoid the ambiguity.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/mipi_disco.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 259ad98b5b7a9..eadbda55f377f 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -284,12 +284,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 				"mipi-sdw-imp-def-dpn-interrupts-supported",
 				&dpn[i].imp_def_interrupts);
 
-		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
-					 &dpn[i].min_ch);
-
-		fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
-					 &dpn[i].max_ch);
-
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-number-list");
 		if (nval > 0) {
 			dpn[i].num_channels = nval;
@@ -309,6 +303,14 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 				return ret;
 		}
 
+		fwnode_property_read_u32(node, "mipi-sdw-min-channel-number",
+					 &dpn[i].min_ch);
+
+		ret = fwnode_property_read_u32(node, "mipi-sdw-max-channel-number",
+					       &dpn[i].max_ch);
+		if (ret && !dpn[i].num_channels)
+			dpn[i].max_ch = 7;
+
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
 		if (nval > 0) {
 			dpn[i].num_ch_combinations = nval;
-- 
2.47.3

