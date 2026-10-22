Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684319;
	b=OKtzDVS3/hZnI2Pgzel4193WwS55wBcmKm8Z1Kytzd9XE7yk9zA+PKeilNEAs6NvhFTV
	 TIl9OAR/nGqjJsPGbk1qOlYhpMyBnB9Hf2ecuKtSFzIvckr9jUvT14hym3nUfe66WXHoF
	 xjOk2gW1d/U5fMPzTPTjYSSoatEcdOxjGTUnsXRdHWgLz82Wq/JyR+F43XJ1R3Me10qGR
	 YF6MZIbA+W8ZoyB4WWV5ww01AWkVljY3wQ6v+DOhMWh6a1BOVH8cDkfizgSh0llGfye8F
	 YySqho8AahzwA6Mm9Rq/wEqrJVtCIMuOiLeZyfdTqUCVUX1++1TqCitESV2NaW/zDTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684319;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HVXdOq3NPHLRStcnE0pX5nZfd+8jDlcmqhfC5kCPye4=;
	b=JmXlAzODppaq0aFX4S6shNiYgpJL8tkOgk76AK1BglvARWoHovaMHaIgO2yWRaMUKm4u
	 s9SKwYig+4JSXervCYNqmjMNSatzeaKH4uH+SabI14WpgilJbtC/vYqvYO/RV9DZXgE9O
	 fjaWo0+oOM6xhbdmlaAaM4kw8iiTxr0Nbk+j9kgItqj/XN4zGa+k3tVdD94xD6kz3gVDZ
	 Hf0y0wO4FLeQHeBr3E/D51jzdgQ8nbrqqEys4twM1TWahY3liaGjEcgvVfpvyfFibWz/n
	 YahSo3A3GU5zDX9A9v1lqDP5vDpUOB7C9IvDKxuAhmtv7smt6kkAinMN0J+uoJZQ05g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fH2ichbr;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=giLpDXr4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8282606A325;
	Thu, 22 Oct 2026 15:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8282606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fH2ichbr;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=giLpDXr4
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69MEghub3288591;
	Thu, 22 Oct 2026 10:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HVXdOq3NPHLRStcnE0pX5nZfd+8jDlcmqhfC5kCPy
	e4=; b=fH2ichbr5RMuclJTpMc5gOAUbgTrTwICkQXlAuyRLfzegQ+ANU0+EHzcp
	ZY9+PaTKekTY65zcZufrdAlRqVLbm0pIPnBeHyaDd/KBwF4rH/MY3MlkzzEJuUzM
	11ouY+XVdWBKBu+TWNky1d6VPkHkSGHN9/y/+5fBoc167YCaisBbaz0Ovu2QSNc/
	ZOn5a5wpHorRLUqVpn1LrW9uJ4wsLWPON1wtMDAdpIKXKxRwy+odMR3RhDeEtbnN
	DijqiT3rG96WMW4ZbvQYUhcBj8oR/yYdDQGCHnA/aGBHQR5z823QMsMngOD4YfSN
	07+l6V3sEC89Em1zgBjWMEx26KuAA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hfmg80f9w-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 10:51:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUIgc3wdvEaz10BqlVmr7LR9RMyZIToFKCem+vcSvhxDhfsQhhyNZzfN0+FDdS0eo5bFp2MOUKrNJr5kRKEefX3nOhzp/X7MFFLYd78vrQ49wFD/8zqVVrUKKvcih8CHMZTCsW1Fw8FkO64go7Jn4H/ezLvSfM7DbXfOpEmMmVlZ1uAqTIUYSSySLjBBmkaBWpPwnGiUqWNgZbzPOUg3R7PRxmiR/20d6gbyeHI2fAAtGYVoaNFf29Agpk+W/U5twZS5INAq86AdCTOIb+XTGxODmZBxvoI7/jykTjYjIfR+GoUAAzX2/XY4szh1F3Y/ZiEIxDZInmj9RxBGbJH88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVXdOq3NPHLRStcnE0pX5nZfd+8jDlcmqhfC5kCPye4=;
 b=jTL0sozASWLiIURMMLrUCtHZZ58JY+9QsN97MIz3H54E9teSAe75Do6TBsbW4pRJtsqR44WWQ8wzeO6ys3BOm1WXYLHLs2ESM8rUTGK9WN13vXcQAlAgQb/kOKY1UYVoGxzCfjOHxFQ/9ZY9fYuWKw+MSNUvkf2gsM6gw6iXIqjyT5JrzT4lItyzi7uOsi/fi+bls566II//14MYFntBZ4Rw+3ZmKQF0BG47DcKKmJVrfPBKxspvdHXwwaBVS5omeBVMoqvwSwvVErMzjIyokl1GCfktHYJ4sI99LF7TTxBWz4TDsuBVOZvN6DJbGNGCK4eIBajCZQhW4ScdKN/sIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVXdOq3NPHLRStcnE0pX5nZfd+8jDlcmqhfC5kCPye4=;
 b=giLpDXr4waFP0eM7mEZBWSmm7sG6XfAiLrEaOBXEtIOXx1T21cVipmA2HNkDmgmPKqy8n1oX7RbfxqVppTNfBbQoY7Qy4rs6b8hj05wXUHBAe7ibKCaqgBvtsWG7FKgrANDLaGOcWcaopwIPan5mEWH/FQu4hLm+L9JFW/HT51E=
Received: from MN2PR08CA0020.namprd08.prod.outlook.com (2603:10b6:208:239::25)
 by SA2PR10MB4524.namprd10.prod.outlook.com (2603:10b6:806:118::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 15:51:47 +0000
Received: from BN7PEPF00000097.namprd03.prod.outlook.com
 (2603:10b6:208:239:cafe::2) by MN2PR08CA0020.outlook.office365.com
 (2603:10b6:208:239::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 15:51:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN7PEPF00000097.mail.protection.outlook.com (10.167.245.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 15:51:44 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 10:51:08 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 10:51:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 10:51:08 -0500
Received: from [128.247.75.1] (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MFp81o1663479;
	Thu, 22 Oct 2026 10:51:08 -0500
Message-ID: <924f3dad-b552-4ee7-b90e-8212c3f3f3a3@ti.com>
Date: Thu, 22 Oct 2026 10:51:08 -0500
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
Subject: Re: [PATCH v3 2/4] media: wave5: use m2m buffer completion helper
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
        Jackson Lee <jackson.lee@chipsnmedia.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261021151552.428590-1-yaojiale02@163.com>
 <20261021151552.428590-3-yaojiale02@163.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20261021151552.428590-3-yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000097:EE_|SA2PR10MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: 185f4a1e-e21e-4e20-c3a6-08df30545fa0
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|22082099003|10067099003|18002099003|261021121427099003|261021135927099003|261021123027099003|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 PweqwZ7qpcu8wyS1BCWSuKkB/a7AZ1MtlvRHWvNL5d7mptLeRHFK2mhEpjybfpLR0GMak918L8Yev+W2AYqBg9czd9NU3z2XyhkgWWdMVsVbV518G1SR2JvoQHbWmjZrQblmqMBupgq0Sqe3e1AH9zJH4mx2EmyIQVM17m+djTkKc3srSXA2wMoJ83IIowx6pBBZIEsAB/zVj0O91PSHFp+U8mJVh2JRaDFZSsl04lAaetts7ffMbQJFf5/bBTn9VE9527LltBdTWeTsfWKAlYQwkh6e6EeKw+bQ9Hst4mn4RBMSQ3PJIVHi11jduV1R1FoRPL1NUIN8Xeh6AHQ+VMRNi7Ho7HM9JQnLXnjiXEELplt2FEean9s3lsqlJKbKAkO3QcQGm01XcSr1BYNKC78kzIl27pc9wYCP+LpMECcbvzx8E9/nBSocu5vuWyljzLrNaI8xCGF+XEs8mpzP1+hAkXP4Kuf0FtEsOawhAjIRXYVbkNvDvH/LW5vjoJ0G3hkTF8bsKemBEKWA1VfiwQ8CHI3kMnXVT4kJHkE+5x9wFH5sHls4gLT9/6fXoYV1xH3dJ1qItnTs2gl3A4s/l1TUFDQlfRxB3h37gmdB0OlF+6nK3dBO2Nx9AFmEHRu1xf0oLPmi+JKqWCvXuoEPE0rQ+4HQgIGiJ2PqwQiqGKkFPvNQLII1jwFmNiCIp3Bjc0Plu8hv8MZ48TJ42SqJ5g==
X-Forefront-Antispam-Report:
 CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(10067099003)(18002099003)(261021121427099003)(261021135927099003)(261021123027099003)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 k0L58M0R46+r9BiA6zl72ValfiTgwGPb9B3U6gHKFkPuGi1Q6FQ57Hjht86wo3RN079885ri6sD68FklWnM3ZApR8WjIVMmo8Ag8aYWrWR5D2gmAszF45MJSkyvTsTXFHZBl2rMxeSFLVBNWKooEkiG8bYNS+DTbabgqpVmSt8W59u3OKEgVtX4+oc1c3fnLEgdvXheqZDF0R47F2j3sWYt7ooj3XssQkZ8I6dGD4baX9moaonEAcsWPyI0x7ks8HtSYLPnedd1PyxezmPzNHTo7/XQWf1LDl9UGeIBMz/cRvDP8uETQEQck+oBvhAfnShRcNZwY1WF77p5putmOTNTNGKw8ILIqzTeE8jz/Hv3wpV1RAsPzOgcEBwFqALFDqDw04YYPG30g2DYI9E79t5iRjWZRFY3haBmq3pRX84zCjT/bS1W8iRfz84BTQIUN
X-Exchange-RoutingPolicyChecked:
	lx2WzYmTNcovJeAUCq8QRg45JMe7bjZ8XC7GiMrbSl++nlsg6kAEYyFb6vDccitBJmRhg1ldw0EOlEPUE/3wWf9q9k+rDVc0RMHbY3BcEGIOrG0XBg+RIB4Oyvgmk/Rc2vd0/UuavaTsvnAkV1uqvotizA0fvYWJIxc6YhQbGm3zsrnEpNCEiEWjf+p6DHXC4DbbTal83n1c88syDtzEqv21bIraNBw/dcCwkDZqlMmrmPC2ddjmrIufn7XuhH1goHELyUcTHLXmQ6Bub+5xhVnlCy5d1VfUckIe0A2KYBHgyasi7yn8bGpxqy6rRb4ZeFlJxCPzcxlZ6/tWQjdtsg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 15:51:44.8534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 185f4a1e-e21e-4e20-c3a6-08df30545fa0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF00000097.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4524
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2MiBTYWx0ZWRfX6fz7BVEZjwLa
 fQX80WWWM68YIMVtVn9h7/owTONPl2N1woXNDPJwwsx+h/+oYdSXtiUD1aGZvMgiY1ThA8Vcnlp
 DASUJThgz2x9WhziC/W3Vp0F8vrE6s8=
X-Proofpoint-ORIG-GUID: tZoW1uAOQJnpEH4SR7FGOmUw3H3b74K6
X-Proofpoint-GUID: tZoW1uAOQJnpEH4SR7FGOmUw3H3b74K6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2MiBTYWx0ZWRfX5/exmO7OGF9t
 kYgXtmd+TS6d0DKJ2bCcY7TuQAxnh8NoL+bGuJsTo3hdi40aqUIYnyg/ZpDLIzIOhPf48t3VzVa
 0+UOhB8Z9Wm7U/3L5bgeUZKQ5mSjXxDLlFPsmLJqbcUkvTipqUh99/syidOuAZwpMxnelvdnpN8
 NLUSw4IyEQAsCquZ2mFDhEpNGKv/qKTezJtgpPgCNbZQb4r7sOaSH7vqJhaG+0KjQVgMbCuqYh8
 mpaGYnNqn9yAvTYlxaSZVdvLL6WZkyc8SmnWks8ZSzLWJh3no4LfdmvyXF/ASuY7p/Dw6QbhW4W
 3L5fv+q1yOjdIyjjgoBy+G7D5HzOGpph8oHdZeHgFDtQ2ukPAWWQ8pIYwccdSuUcdLS6EfxZju9
 aV1mSKW5VNWhpKB++ZPdpEqfHjkF9ePm6fuSRiiF9Hw4RRohOv+XXMjwBQ+6cC9P9E7RzLKcxAO
 tMmXRF9/KDnbqcOqe8g==
X-Authority-Analysis: v=2.4 cv=H/1OUOYi c=1 sm=1 tr=0 ts=6ada3118 cx=c_pps
 a=cvmpvQQCsZncHh92cDAFKQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=Byx-y9mGAAAA:8
 a=M7hMUET98u_V3CnZE6MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220062

Hi Jiale,

Thanks for the patch.

On 10/21/26 10:15, Jiale Yao wrote:
> The decoder destination queue handles a runtime resume failure by
> completing the queued buffer. The driver is a mem2mem driver, so use
> v4l2_m2m_buf_done() to preserve mem2mem queue bookkeeping instead of
> calling vb2_buffer_done() directly.
> 

You can add fixes here. 158b39a0f7d198 is the commit-sha

Tested-by: Brandon Brnich <b-brnich@ti.com>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 320b40581b..467c68931e 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1309,7 +1309,7 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
>   
>   	ret = pm_runtime_resume_and_get(inst->dev->dev);
>   	if (ret < 0) {
> -		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
> +		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>   		return;
>   	}
>   

