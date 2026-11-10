Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310751;
	b=fF+YCVvIq9nUY9/LcovMqrtiDSjhFEHo2bQxWg5iqFKLa/6i/BUY+eJFKiry8z9cP3w9
	 sVOSl851sT5O6dw9EkVDQVRylyhSeI7EsZ7y3Lc6eYecKXxsLk/LKdyhSZHoP6nA1Tx5B
	 VB4CRzVJB1L0LctZKuzlVc0rLdeosH36O4VoyyqGL3vxpUz4kxPkNIvz75+g5hldnnqOk
	 3Dofcf1dL/kbKtr7lWvqByyz/Ed/lUA4Anr7NOz2SAKO/2FN/wyI2KaubtqFcT8Pd3UyH
	 oLHLi2oH3X8SQ0GOSWpfcWjC9Q5uTCquPpdKo4sMuyI1y2pJirMghOh9VMd+Fvi3QxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310751;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=Xo94zxdstlQtAtVSCnWte37f7+LXSv1ZnYTKDLaTuLg=;
	b=FmTeTFP4wOcCzD6800Z4jsid5EgAJzEHOJoDENg20cEfTZHAbLoU/qK4JrFd1PACPpuf
	 6O2k04dnRMGuQsp43cNuYRjcmZX6NEHpFdygJu1BQKFZeSj0v+aKY+CeMlq+X0xwm/9az
	 MPCAUcNJdqlJWs2bVS62BKml9IXAatwGhSA5YAMq5pSd4e8Ut9pRh4rcaeqtUgGgZDX0K
	 bn4xORo9B+oZVf4fjkZ5kXVory7qQVyFM7k042fWJV3Yu/DoHXGSMFaKqGuX9h6+E2ytN
	 E/PGb4dPQXjrBsWD2tievRjj+D3GtaUBzimqwz+51xN7RLZoken8ZB/KIrv4wev27fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=B4VYThwN;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cyBYKVBB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772AA606A31C;
	Tue, 10 Nov 2026 11:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=B4VYThwN;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=cyBYKVBB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABJmCJ360847;
	Tue, 10 Nov 2026 05:38:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=Xo94zxdstlQtAtVS
	CnWte37f7+LXSv1ZnYTKDLaTuLg=; b=B4VYThwNLceESeRd4zrKAEYV2hwBGKtr
	OFTI2cIxzWZfynjJ4jq3g3YzO49uiIPbK4UgNjHdQCHRtwhomK3V9ZPAhfjOTzHq
	OkZXttBfZJAebpipRJe79/Bi5ONqsnXnqNqtonXgd+ZK6cpru00VeNcv9ImuboEY
	oaine8x230qYmyB6lzE6PBYtkNzJSylAKv93T7ve3wQPDWOi3GLsfY2FavreZbU+
	tUDwkd9vC+YwNjOzPMxjjvWArhCoynCimduCJqGlQFn6QehWv4YbPor3hpxFZy8m
	yp9hU5rvh92OPXog3NlfWimHVRG83ZUBnO98wclzii7YMQ3Y6tTxxg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021123.outbound.protection.outlook.com [52.101.57.123])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29hbga3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:38:51 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKEWB0qBsxMhv335/ns0l0PzwJ3AY0lkaRcncQYhDCShbJ+GyO1CxAIGmf7P68WNTAmaT4iTjBY7+x3b7Uik0WBW4MBA/dSyx8px2B06kDuJ5EIJfZsMBGWpdCFr3uSZfOyla6S5lBfs3nn1HB/lTkr+seVeRJpuMd/oBGNFvgJ5RoM9nlqWt8kOPqTBzKd+XH7n51Qh/wwuTGsofGT33pfn0gtmcO58tzu966gQHOJJqGLFjIS00gPjCjRna9odFrs7G3MNt3NEnFra/AfnaemrnayElqQC5icewZG6sjP7dgHauWJSuQc5/sVU86k5jB3fJ7Tce87gPHivk36cDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo94zxdstlQtAtVSCnWte37f7+LXSv1ZnYTKDLaTuLg=;
 b=gh0Y9pJTruwgM/Jz6Am4VHYBM/L5iz2tqakHeTr9+L07v9/Ut7RadkFWCJGvutWvbs8V+senWToQwuiCwtGm6xUtgsji9NfUx5vLrw5M9DtfAHt/bhZk9L6dBZRkoMdIEhUGrGYSbRc77u9u++gmbb1Fvt72Iz3NPnTIXeNLaV4T2S7dH9kQntLCBk6eCb6zMRu5HM4uLxdggstbudB8fsCD3ueoOY5ESIJQkxYCZAI9ZDNlGnX+ypBXMKMnelv+yK6e+Q/W8YJ3e0h6LUpa8aS0erQihn0I2AQkSGMJG01G/Ge/ta9mha49qfWLS7s/pAFd8R44mWOBus3Mc92IYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xo94zxdstlQtAtVSCnWte37f7+LXSv1ZnYTKDLaTuLg=;
 b=cyBYKVBByexqpprDKQGJ8ZhTOTO7v9qJyVpEalC+PcuRGTWfLw05xkWaRpynfBrI41KSIDTBVuAuDeBrS8C1z8UgdQdW1//BQZr4uPmBJpoBSp+aEIh8qhdkO9wyUESGPJHPYl1AcYgcbUtBtedUrHE6n7TuTQmU8yI8bTO56hY=
Received: from BN0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:408:e7::12)
 by EA3PR19MB9278.namprd19.prod.outlook.com (2603:10b6:303:2b7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 11:38:48 +0000
Received: from BN3PEPF00022BD9.namprd03.prod.outlook.com
 (2603:10b6:408:e7:cafe::12) by BN0PR03CA0037.outlook.office365.com
 (2603:10b6:408:e7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 11:38:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BD9.mail.protection.outlook.com (10.167.248.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Tue, 10 Nov 2026 11:38:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1C8F406643;
	Tue, 10 Nov 2026 11:38:45 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C6AC2820273;
	Tue, 10 Nov 2026 11:38:45 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 0/2] Update handling of min and max channel in DisCo
Date: Tue, 10 Nov 2026 11:38:40 +0000
Message-ID: <20261110113842.347883-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD9:EE_|EA3PR19MB9278:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1ffcdb1c-f4b0-40c2-fbc1-08df3f1f2ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|61400799027|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261102123227099003|10067099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	Ly79JQ3zhGP7wa1lDuKAUfO4332BUlmeF7df4GSMpUdesTs3mt/fphnqavIbLejLn5t6lGEc1XpvwTkSReXwrc/h0zGqx+f+HQa4zt2T6y8mxI3CiWyo+A1Fjyvy4zZsb2mCC3J/E3kk2BBBvKmrM1OAeI4gIiirWMFCsKdV5RI978SZbtZ5cGxOG1sJEFYqMbqCV+BTZtxnR4G5+AqWmQ7aZncIZ/zfDeDOrmqypglVsI2sigYwo9Okv/WCw36bN6YH6Q+MD9YCTKU9JjognnRIRjwax80DwdgAYt/4jTDwCD2/OWKqTPwr95B8YgVuPsI7nlTSiH2I2VRJY+lq+H1q6t2WrZv1x9v7//SlbMoTpogHbTCzHgh0pbfYnYUYOc8uw/kpE0n5kur7KW54ISj9H6bblsp5PU8qJyHIF3cCUmXXYP3aNe1x7Wh76MRl0A8opJHwSVtbWqkK1aQpw3RBtZttA6V7QkD+46KMIJB2xW5U+Nov1r/hLWd0k8gmi/BnGMIs8ufgKQI80CXjFN3EJg/sY1KEvdDwafud01tZYglFWzsjHbekHxWP5KrhzW8yfCzO4Zq0GMbqjfsdeRV7KXs2ZO3kMRb266Tfh8B9QRM0rPzbIpX+M1h+2VU2x+rfj7Eq9vcvdUTxKonqENlppQdhFm2t6Z55VTLNeEmWD+bH1GSySeGHYmt/6yyFfntOSauSLm647g5WM60+iw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(61400799027)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261102123227099003)(10067099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sm8WYrLK4LNZqr94xl7/SEt5j/phSrLcfryzxC8V/GwnVf9LLSN0pZFaff/a88PtIdsJ2nhO3CnChu8bpiv2FLAxLXBzmAvcdmYxFqtdqO9Z3nCzS/Be35KqJ3kcLwnkbYIHdoGGL0NEAmUa999wTggbT7esTrjLBw/pZw6nJaQF0UXC0M/IF1lVRU1TO/+RLLH2e83Ez5L4Ez/QiJt2k8c0WfpnEg3UNLJVns8K8IufkbmEQgnTLnpcWY00BVNvf9We6PHG2SVxeEZgbegiQKrhsoYl/tVzHk+WxNVRcPe0MHsNGrULJsudolRFV9tgp2C9dsqiCLzuHnqDGKAsO+2jvm++cvWOO1I2549yQroFqNaFBRAO0gxkkoZ1MNaGv/QMJrOJPfn6PRaNCDbKUyGw9aiRIMAsM45QysEvovqEOQCj/vxudp8YRJcCUVHV
X-Exchange-RoutingPolicyChecked:
	cVQ3C5SCEJkK0DwSfTqEDbtE8pi0eIjPkl17JXsfE3uFH0Y0BKe7l6TGMye1FVGS3wHi9hOnt7j4V/nECahGnhVxoUS6csfkjmoFRtD3pQcAFGXkYeFDr32WJD8v6J8FvKoZq+P4QrXOco0isn0tNz3LqMtrmsGI6TEWlNQzRZuSKDSY5CAnUCd0+C8MrS58MCeQch2XrSZcUiJa6wfKovlo2gBZsFkbqTLMcEkv/Hu7ks1GIzxMirf9cZWRSIyKt6vd0kR+OSN9JRIyVOgS1CPaSSXhJZ1qtcU8pS7FuMUH0ZkMtrPUYhgormmfmREbC9NV/L7KWpwMvwfvanN9cQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 11:38:46.6858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffcdb1c-f4b0-40c2-fbc1-08df3f1f2ea4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BD9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR19MB9278
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af3024b cx=c_pps
 a=ffxAIQPz1en3uIgdmftvlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=Ex7ijrhSia6b-u4GVK8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NiBTYWx0ZWRfXyHUkSh1CkiCy
 6rRspKoyVjvJ4MZnw5MwLWK/MeDDL3cmgcCiGpLMjia0nZxqjxAclf7ruvKxfurwX98sm1I7CJm
 V8BwYtij+1aMI81SF3Pmp6YpqT9M0cI=
X-Proofpoint-GUID: tZPD7TVhMaR2p2FIa8NZzXES0KgTrp_S
X-Proofpoint-ORIG-GUID: tZPD7TVhMaR2p2FIa8NZzXES0KgTrp_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NiBTYWx0ZWRfX9TquTBoc3qVR
 8e4NICQJzsU5SFKAaUgalmaJbIXQtWGJ2cqZPepCs+qRmaG3x9xDvf5PFLtsDR9LpWfl1U1nevA
 UpgQkstc6rEMUyfwu2epbklNJUFWJ/yuvKmYHPakg1HbmXb7dEjwF3m4iXVFG9kQcjU2Ajy9VnK
 LnqYsbmb011IW2J7p3SjoBKYqq3Dj0X7F04FfzxbM9T4QB6ZFGRZxIpLSIrHt4lgzfWDf1db0DW
 I/7V+/GCm8D+g13+KTjRfQhQ5Ks3XlDiIkR0nQ4ZARAkUkFDTh9dffftb2jnKesRgsTiimaHCjy
 olJUiaRGR32G9WkUzpTkCaU1Ab7AYA0u8PNCYzh+n8oSCEVmsab7VSBKRPPB9tNfl3eq5fS3gJQ
 erDWT2g9jrYebzGbfW0lShT6fAhUm2lA0aLNVI9gXYGuZoTmqdtZ6BWueCEpcxzVCBnp47gxNs3
 KffOkW+uyF3ebpdIwGQ==
X-Proofpoint-Spam-Reason: safe

The DisCo properties "mipi-sdw-min-channel-number" and
"mipi-sdw-max-channel-number" are both channel indexes rather than
counts. Update the kernel code to more accurately reflect this.

There are a few Qualcomm drivers that likely specify these incorrect,
min_ch=1, max_ch=X, rather than min_ch=0, max_ch=X-1, however these
should work fine as the number of supported channels is equivalent.
If people feel strongly I can send another series to fix those up.

Changes since v1:
 - Update wording on min_ch/max_ch comments

Charles Keepax (2):
  soundwire: Improve channel min/max comments
  soundwire: Assume default maximum valid channel if not specified

 drivers/soundwire/mipi_disco.c | 14 ++++++++------
 include/linux/soundwire/sdw.h  |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.47.3

