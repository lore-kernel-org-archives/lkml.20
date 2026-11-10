Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794303675;
	b=oM85s5C3ji3gEvzUor8COE2qlL6fXucqAJrs0a7v5mFs6EUatvl8Ssz+u5ZUML56fbYY
	 iLhYUC/9wJabenEufSD5kSdAPO3g6BHo6xBupqeeFMCp6KFO93B7bYbP3ld2t5r+odK//
	 DoD5XHTrTovJVu+ZnALCggIhxXwZR2k1x277gDX4nrVyLifs2rMMyhKxALjenNYALgV2B
	 UqkXB28uBMDgcHjcMofq/Kac50C4uz71hnxTzPJ9ov9mqk/MBkYvCk0TQcy6UcOR+2rpj
	 pStHEa6ZGGHZNoyIia4506P8PO4mgEO8nZu7umJfXPF/D6IDgRL1u2nmaQavNOreVYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303675;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=zvkNILpa3PXHPlT3VbLn5DXuEPh1NFrJ/HqAd78aLM4=;
	b=dyT8yMQpDkjVd3GDdrfFQBXUC9gjBE89ILYe8q5x4bo1DYXK0ldTfdXpsBnSku8AreaZ
	 S1da1vhpbk7F1NgO4SPzOXn1D332gZZkg2VaCaiOJtT0I8074fmOtF2rXLG00DOhux1/7
	 FAUR8Q+0+ehIh6eaWvIT/gCxIcSLXZ29jq17NJkPNjPEPTz0k4yJ8WEbC8ABPgoqpRMnt
	 Ma1+2zY9sI2/mW05YPkXhRoV3fMPmt9VqGJxoSlByyMiMupRrvShJXfKc04lFutAH59eu
	 BC95YVJVuG2GuhImHTIoXlBrgD6cLhoAwkVVLatdvhtcpvFhQNZe6FTiOlxX1po5AVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Gfx9icfR;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UIu3akaW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88174606A933;
	Tue, 10 Nov 2026 09:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88174606A933
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Gfx9icfR;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=UIu3akaW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7M8Hb4172608;
	Tue, 10 Nov 2026 03:41:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=zvkNILpa3PXHPlT3Vb
	Ln5DXuEPh1NFrJ/HqAd78aLM4=; b=Gfx9icfREjDJoXiKmrAC7AEKpg6Ssw1aLd
	0Uhm/OVQFz7rvM1M0/XeapmG4lFZKYtXRFmDBuux17tgVFYn1JTllfuhCDul1Ahs
	kENe+fuWI83LE7VaC5LPZoiCuuRwGTZDbZR+x5OVQYn40a+FuVTFFgP6LMOsHCQR
	d/dTnuwYaEOIgVOXlLKHBqdMjG0gNIKu2sdIiK75HSBmi+bXMe5tuLRAnIoPdbDJ
	rFiPonJnNFOA42DXlnLwRLZyhB2XIC8qTmwqm8HU13e4z0X536laHQJr1ME2/D37
	R+ZL9+yR1n7XlLGozSGU2R+E92x0MbHAWImp2/96JNn5iKwMCs0w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020084.outbound.protection.outlook.com [52.101.61.84])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hbbu1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 03:41:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYop5rBWSMm3a6b9KsK/RYhoSz9rWcafUeXZ3kwq9H/eBwzMSXr3oWUBhQCrCfGSgx4HLH30iQUmHM267RYh94Icj0h6nfklVX0kf3AaIY3YsbLPKcVGMNhS/f+od9YZTv6mMw7ZNOXziGnx3848oG0BK7wtucXuogtPPbapfG8bnP1F+2PP6uOGnxZN0IB6frdA/LJ0j578Yvg9xRMDPtBUVln9BhqFRJBjjBFvIm8nIAZV4u+qOpLm5OCI+DlB9QpZthg0v4GVqwyZEAJrxlJVlqVyVCZDGiuElNY/E3tvGzrJgwgqnvt9Kaxt5rQmDzFCTmYNNqij/eOpLR1SKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvkNILpa3PXHPlT3VbLn5DXuEPh1NFrJ/HqAd78aLM4=;
 b=ThA4GzrhJ40w49EvumjGDgTkH/d0H5lEYAyOr+ybaP6g7xYJVKWrRi07hL0IDG9oqyv5hLlPQZAErbNoeIVrXMksRE1PFQsOA3ELoSOKfMCKnTYi5kuSxghZlhUehK/Ev5Zw4z3q/wtzc5AeOvSlN3g3j5+QHRzvNMkLwpeu+SYLz4/ZH//oKVMWBGMzMwk3PriMDoyMlvjufy3Sv/dZPjbr+OesWgI7FADwBipZ6+GfhX9NV/5dCTnErHs9S7PSXbVM86cAuskBnw9Jlo/aFavP8DI/Lf09lrqObIDgEAXb2VE04Bey0YA2OcMU0M8Bsjw+fHxigf38bb8Q+cUZLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvkNILpa3PXHPlT3VbLn5DXuEPh1NFrJ/HqAd78aLM4=;
 b=UIu3akaWcbI5jI7gZCF1txgBb4MBfwxd0r/ihDUA8fKaNOyAJOXWRE8m5T5HNupzI2GQ20XpPp5d7y18MXYFeNWANzJBz02fobNDEtMP3yXDbt4dw0AMCzGg5TJhT5UA4fDzcMKNve8iF6Q+4IU9kuLvMtTIgnWN1YIIWW9JjP0=
Received: from MW4PR03CA0352.namprd03.prod.outlook.com (2603:10b6:303:dc::27)
 by DM4PR19MB7953.namprd19.prod.outlook.com (2603:10b6:8:18a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 09:39:56 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::5f) by MW4PR03CA0352.outlook.office365.com
 (2603:10b6:303:dc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 09:39:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 09:39:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B8230406641;
	Tue, 10 Nov 2026 09:39:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9DC00820273;
	Tue, 10 Nov 2026 09:39:52 +0000 (UTC)
Date: Tue, 10 Nov 2026 09:39:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] soundwire: Improve channel min/max comments
Message-ID: <avLmZ64jIfSy6Kl8@opensource.cirrus.com>
References: <20261109173843.4184154-1-ckeepax@opensource.cirrus.com>
 <20261109173843.4184154-2-ckeepax@opensource.cirrus.com>
 <42f25327-cb1e-4e16-a302-b9d367f30087@linux.dev>
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
In-Reply-To: <42f25327-cb1e-4e16-a302-b9d367f30087@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|DM4PR19MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: fffafae5-eb0f-42b7-51d9-08df3f0e9398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|61400799027|376014|18002099003|22082099003|16102099003|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	DCgN2VXUesk4t8e15n14xiWVsEEGvtIFtej0VcrB9yFRfkabfYrn2SyhRRDM+RgSgCA/WU3g8PtxE6HNPxLPhHul+Q2wrH8lfSDiDyyQ2DPjdLNPjhoPQ5KROgZyusxVutXSrT05rF3sywlaBNxx5+D5ees+By/nB5QA9XlpQJgXnyfr3TMTV/PvjCPhwfG9J7pnPeveaVaYM06zx2kxgNUx6Svim5ozPnf+CZUWywx7I7AkL7Tba3InywjB0+igTXc0MqnNaRN7DB26ElQ9r28JEoaFGrPQq/44MVGr0C1KwSyRs3s0NAugI7ha6AFMhXEfmA2ZI39cKF+1TXcrIDIFKpxAc1dpQk0NEk48O76faFiencthI9LdjWBSNQLSIbF9XnZnKBkcb76u9l2L8LoWN5ZHPQNiVUD/y/dNzLIGtnIoa81qe7Q+8KyaA40UefpIOwmEf8RStaoa3dF2jucHQCbtntSqZJYiNehSr7YOAbBLQb9ImHlpY74zQ8n7aojd84xROL6YGwfGeXdiLdw4wADhOQITq64V9TS2d1G5ojtfep4yB8mQJuXUlIyGtJvSlePuE7UBnnPxegd0aWpDZ2hP4k3goGeMDOwEYezBbGnrXaGTKdmxLhoSBvV8nGBWZDcj/pwLFXBqrfp15irb4eoFXlzkiu3N8BWQepNu2BzXcEdRmdrVvvGmzwy85rTeX/o0Sxk2Znif0uj3Xw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(61400799027)(376014)(18002099003)(22082099003)(16102099003)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RKFOJevyDgW9DdBho15XRP7/mwemvYljYebllgYm8taEpxB1cQ4LXr+nZEmP1Ib2Q5GQlsk3/mGvO7hfY7XoRzyNFoyHymWT/ODJP1bV/H9N/qwIUiT3QhdMPOJa4C/wINMnh4apNgJFMaFsAHp8bMpUJaHGEvyQai5ZZNfQPHteahdTGdhB55QE9qaf2htk584x9KAh3It44X7mlZfYpmcygPTtNer4HYRWYA+tFVNNWidMmz5VrkAzUdjqgHPJy6DULPe2p10JlnQq2c4oQbGwWhVNpVeb7+v669oYvxRF7SjLCIFkY5qiuB1P1angVWiCYE9uuu/xHexrupxlLw7L4+w8HqJHzvQ3BYIRjz6qU2NwyO0v3rVdkwD5dhVh0ofIcjW8JFebKWYaVAPvsOe/BKaOKZyrtjSlo5JPJI01WU6e6YM1H1YYEMcB4VWo
X-Exchange-RoutingPolicyChecked:
	jgNKBXWm5Jl3LRy+Wm1bpnYs+UjZE48r6xMBQItDS+mETgK9H3XRDCvo7Qahqca2R8LeEzIxrr6Ea5c7F3f11UeBCNvOUq22jfECjTj+ldThVPq2NFhR1/teroN4uqRnYT9eS00H20ElTdzEUqcplM4bWKWn3PyWpxXd74/1po1QGZ78qGxJ2HG7MCJklCl9Jhl6pIJQK+VaNDpWyH3+YfQevOlvQOUiWLJqup5JwkdkHuYBq7uid6JFbOi6/FSqT5nTz8ZYzrXI5bTZERMhVZuC2Y/i0oY6dM2Rl4SjdHazO3AS6knovoIP+6uf0Ug7D+At55V/NIxBxVwDlrOxqg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:39:54.5059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fffafae5-eb0f-42b7-51d9-08df3f0e9398
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB7953
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af2e6b4 cx=c_pps
 a=n/INy9n90Tzyn9GwErGIDg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=WhjvBm8WhNmsT_08JEQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX6QN1YwBELGeG
 ElYN1mYJPp0Pl7Eb53pXQ1ygP5vw8mvAXrPbqUznKWDuHKWxivbG1S2sgfl9VKjaylF0g5m6WYI
 i79JhW70BJ1NBSxVDm3/M5NEG2EN8Kw=
X-Proofpoint-GUID: otphLa6BA0coEt31X5dCgsKtdI_VYGXD
X-Proofpoint-ORIG-GUID: otphLa6BA0coEt31X5dCgsKtdI_VYGXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX14EAaYIgi4L3
 pxUSB5MVcflOdzttBSldAxe/9xQjdUhQnYvOisJLEog50YxHe6nz46YPHZiu+H3Wz7oSFFW7LzT
 uptOPTMAbpViKENKXX4AVyMOr4A0grVb/bwkxiwBDfI42///GD7hl5Da/+VOnE/MjHSu5X/t2BR
 tsMfk8f46Gx3itmsHGEUiAonXtHYeNO9ctzxkGSl4WkVcZ8EHDsMjpiEkiZTgB5sDUQVm/7jAAn
 3zNOLsSvY66aIMQj1GKe+V/0/JS8mA4I8FzPGZtKESdXyNGfYF9EU7pe6N/O0WskyOi2SUZqbNx
 ER9MmmbgqdfTJRiXrskWzLdLxHuJAAjD+yAeCLCCjyBnlHVU+MDjY2SDnyg1EgLRreAZQnXNTt7
 7NU5zpt8OfW+dt9CcqadSD7XOMReMDnBPh2dQgck+PvoIxjlj4tjwjYyRsbPq5xvoro/HTMqyUt
 Y5QOkcGm9k+44LfjPIg==
X-Proofpoint-Spam-Reason: safe

On Tue, Nov 10, 2026 at 09:29:00AM +0100, Pierre-Louis Bossart wrote:
> On 11/9/26 18:38, Charles Keepax wrote:
> > Presently, the comments for the minimum and maximum channels are
> > misleading. In the SDCA specification these are actually channel
> > indexes not a count of the number of channels. So for example
> > min_ch=4 and max_ch=5 means that 1 or 2 channels are supported.
> > Update the comments associated with the structure to make this
> > more clear.
> 
> It's the DisCo spec, not SDCA.

Ooops yeah thank you, I will fix.

> > + * @max_ch: Index of the maximum channel supported
> > + * @min_ch: Index of the minimum channel supported
> 
> that's also ambiguous.
> 
> Maybe just use the spec definition "minimum Channel Number of this Audio
> Port"

Yeah I am happy with that wording will update for the spin.

Thanks,
Charles
