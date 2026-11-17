Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794927098;
	b=oVH/YQcx2j/2yvdXH3Gt3eganJ/Av07qtIWm8jMpu0dUVR2XKdOCgHtd3MVSeJq/NDee
	 UA9h2GrmFDQCxJGyVmxv+1ssTbhp75BnjUIrTWWsco84Snb13ZZbm21zARKgYX2QP0NaT
	 bo83NgBuOwR8Fy8EO17z5h77lpJI7dcRABMkcBE6Cb2xiDvYV4abdy3xkvkpazN0TCeZi
	 nXMKYP0lsnmpZsJfmbgV5VRHEXo2JnFACvC2bS84QYVPJeoJfxT5MZ0MHUTgPTHy6OIvw
	 oo+IETpQuiMRaxtJWjFE9AKgDACGLDXYwnrueNJM7KEiFOqUFO/89Wqo4/GXBm5U3rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794927098;
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
	bh=90LUwYEK/6kajrxjGb1G5xFylXWZLiuwxlF1vZr0TBA=;
	b=OUrmlSH7BnTcWAyOSy3lX33QlBsjWlWFaG2vkzJyljeDd3eLalChGa6UPWw0pOc/Nmqe
	 pc2N0e9LSetiSEzyNq3x1cIindPBsQnD1DHg8BXCfYmXiJtuVceuEpsz4WenOEcrwS26g
	 ZpOc5q52CC8Qufr488cBF8BsZ1/uv0MV4C9MydjZfIdBgqC1zlP/uqO5zhxA1yzt43XPo
	 rNfP7kUnDyqsnWvq4Wy2CRmUha70Lb7/opvfbutdc3+NlpU39PUQXAsEDsKtUn68ULBO4
	 lbWz+o2BneRGhNakAj+8NVgvMD7HuQ4ZE8uPmXBxflcGrnGyspn2h20jNLZGBm5WQww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Yojbqcd+;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=wJ9IvwbW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3572C606A323;
	Tue, 17 Nov 2026 14:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3572C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=Yojbqcd+;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=wJ9IvwbW
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHEetvB1785682;
	Tue, 17 Nov 2026 08:51:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=90LUwYEK/6kajrxj
	Gb1G5xFylXWZLiuwxlF1vZr0TBA=; b=Yojbqcd+YcSIRAjLrwlPnXOIFGI2fngY
	ixk/aFxn9MKU8HNG+Kch5+NKFMGITSCbnumJNQNZTlv01N49M/5e45A4oS5lcDuG
	r9wQKQa0IQIFS2EEFG592JwMf8bW8lfiUUEfsh8qJpHUya3lQYnkT3hi546CVnv6
	LwK7zH3gPO5ik9/mQmX2wJ61QBB5uCTrDeBfHiFjOdynmiJcaY6L4YAESMFnVbDh
	KO72zZpvT3vO6BuoazxWwnwbNnfdYCqNq3aMy2W+WVlOOIP6JjuGFND0E2AzV8mg
	lAKEfKvZxAdGxkJS5Wp6LHA9VR7dtOeeGLSNbh0RAx5OVK89jIMkbw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022091.outbound.protection.outlook.com [52.101.43.91])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hxmxs4br7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 08:51:19 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl+zVoRrzKGfU+Q4Vn8iXUil9lzj82Cm/yR1a+nM5e4ea2MjnrclWpmJohGanZWUVeG3c2wxPj1KYhM/tZOALNMwzg0WGcTgJ1bmfj78LlZ0BmyM9YeLRY67f59BMmTW3DmpVlEhnhXjwh2WpvPaKJHwd2ODb1TI5YbJS1GJN+MRyWz5P9s/dn4uszH29vxT3IyAeY/ziBtufOjBxKM86udb8O4Jmzr5zW1nILPZSj4JFAdSXYrDrWDCo2Tqr3bWfGCvlAWW/5W269nyzsJ7S0JAi4K4whIGh+dQu3Vff3LsiysI7SPHnLtsvVz2n6rScs6vbkJ08e2b4I9RluoGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90LUwYEK/6kajrxjGb1G5xFylXWZLiuwxlF1vZr0TBA=;
 b=Sy0yvqklJBph5JT0O8ePdMHhUbWlZKCOG3aUCczTVZLhhHYVoj4xtG9v0pXAGO8xgZz56kIvf8DxNLecr0IvEI0OCC94b/czbyCu9Db/K+EvzVDsejs23Lox/xXMYKYSodP5Qgue+IoCn2BHc7K0fNzXQZCaskjhrZAaeE9dCHG1MKEkErAp9i3FeomA78pnKGgsdsA3jZjQwkcUDgAwI2x2truelxGKd7pWqBVGGkskr65rLwOgFZ1+5iK17CTaGs7a1hYg+7iUR6eZj0tDnwphCc3YhRGthvJRv5e7vMAk+X9ckG08d+fWjd1aTgdK4R+2xZrNY8gG/F9+84gi9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90LUwYEK/6kajrxjGb1G5xFylXWZLiuwxlF1vZr0TBA=;
 b=wJ9IvwbWVJnB+VRWFhu49MMlQhh2kv0V1lFZ3eoTtkkdh48iM+s4oIhxY3MEJd/5xEGmDyrbpZcFwod/mzetus6x6dZLThyq1tw2pn0Un3mqg9Y/wOhMkQBkczo71f0FcSBWpMFXoS5zSAOmkER9pOiDp50cTMPYeaZpdYDp5bg=
Received: from CYZPR14CA0021.namprd14.prod.outlook.com (2603:10b6:930:8f::22)
 by DS7PR19MB8881.namprd19.prod.outlook.com (2603:10b6:8:254::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Tue, 17 Nov
 2026 14:49:06 +0000
Received: from CY5PEPF00000E82.namprd05.prod.outlook.com
 (2603:10b6:930:8f:cafe::a9) by CYZPR14CA0021.outlook.office365.com
 (2603:10b6:930:8f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 14:49:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY5PEPF00000E82.mail.protection.outlook.com (10.167.247.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Tue, 17 Nov 2026 14:49:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8E551406540;
	Tue, 17 Nov 2026 14:49:03 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com [198.90.251.17])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 738CC82025A;
	Tue, 17 Nov 2026 14:49:03 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH] ASoC: SDCA: Use Function Extension info for FDL
Date: Tue, 17 Nov 2026 14:48:53 +0000
Message-ID: <20261117144853.2357660-1-mstrozek@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E82:EE_|DS7PR19MB8881:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0915f6bc-a449-4e13-d651-08df44b9ed9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|61400799027|376014|16102099003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261102130727099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PzdFncGeRSEjS0L7sCIPRhkoemvuABZpk8R/klouGEl5MDpfPWdr+cFzmmMbaT0rXL6t6DdE+AxEtw9go84ZLd9T06shwo9haK8jaG61XGgM0om/UtU2nI6wV/hQENCwVcQLRa7z6vrPs3Imx58ddO78ckesfzuGStyZBzXwuACdTnJ8Zk0PlSjJBqSxhgd+BPaMQEIbzpqrl5uIJJt0RrM1IsPSYTsuNph+8u8YKUxC3i1DHg5m5jXX8VrqecVtIP+YGux11mXGgzg+ORY8kl3PnVdpKBhloh6RWr1d+yFC3DSnmZqh/loVR1SeK7QFzAMQzDuZpOTKYiA0Q+SXifoDfrI6oJXShzMbsE+x5CcXcpV4fj2f/PtveekYVwYD1y8EFwF5C98OaQhZOFYbyGFGAJ+BMYgMMM7tPjyx5x4jFy63iZICiErJLOKws2iXSJL9UcDmiZxZaqz8oVBqqtucf+CPOX8xQHCgezTvW3n7cqetRlOX1DuxMlqLQnXL/m48proE60MlzGYbujVnWpBafnbAuYFjkRFIAD/kyXrZ9/VLGr1oAcL1M+bfD6QDsxF2a9qvuqCkZ9QOgn8EAeGwW4+5BqxdDN78wfN8dWPxPukPUeKtaUsyslzD2lsaJh2dNHFLAtyv2K+XG+bfZlYI1yvvIPDklio1qnLUuws32833OT/BhxGQzdwM3CTH2h4Hf7xBZsG/Vz8e3AWEbA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(61400799027)(376014)(16102099003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FWJ79/MZBmIoWcrRQfwRktmJDrzC7S3qkVPUNK3mWyStp3Dkl/ZjW2yxxIZz57pZ3wKPvxvoyKhyn1MIzVwv7sXcLDK9TTWGTup0ReRerSTBHTuWlmKe9sP7rwSn2/SkA6LuVfFxYXkF7pIrCsbaKuG1BRNmnx75vk0tj8ikZ0TV7aU2QIXUf2UA4Wimd8c3McFP/yy5wmJicjA63hNWHNpaLy9lqI32fL4OrOwCRPnq+bwjMiREZa29fGJm5JHeqUU9EBrDNKbA/9jWPrWKQSom01Q2crtvx8DWBndfeST9PGgJj5xo568EeCJNC511w/zJDcz3oxY83tTsfZqMDid6SvMYRzoNhsJLsnxP15uosvQv5P8eoIDBkFT/hw+IOIvxvl7AsdcTErjYrusWVRsxtx3LAI9kFcTnqKBnUwPbTaGC1clTf2mfk2/81hpW
X-Exchange-RoutingPolicyChecked:
	bR3Z9h4WOUwoU9dtNaJunTy7dj56ifjCLV9WQSDRcHsWX0sg6k/MIfkzkwHTfhtskLohvwTAMe3DzulUTr6sZkWmuzHSdEf5MEFwu8Y+/ay6JHQkcx6dXxK+iiM1k0EOHmGYvCyHhNbRhlfKndJWR7bgnCpG307dJUgQrPq42kdDWr6WG8LUNSarIgNbYqK/dWp1WNAHjvufUZVzVUtSd1Q7YdYUiPuEQn9KxWGbLJR9iCSfjojYdzTJBmm9pZ1EZCONgWUQZT4O8KY5+SObY8BkWKMGBColrzWJZpHZMzi06+reAr/JtY5Z0lLnnQ1hZfF2Am5ZXgZfmTpyIiErjQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:49:05.2946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0915f6bc-a449-4e13-d651-08df44b9ed9a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY5PEPF00000E82.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8881
X-Authority-Analysis: v=2.4 cv=bbX+w+PB c=1 sm=1 tr=0 ts=6afc69e7 cx=c_pps
 a=Dm0nEerhk2+Yr7xs+kkSBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=NI2tKjdqt5RRJgUe-90A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1OCBTYWx0ZWRfX2gd/CVJwM5ZD
 OhHGnJTHKXvu5O8FVgRjS9d43tpNmeZWfmyZDERp2MlAStPMLKRgtv33VFbzdqPX06+mnmC0fxe
 QkGkv3nkCuQxVtazfdtwu6yE2/0Xa/s=
X-Proofpoint-ORIG-GUID: TmcmT65btow8nOSeICAlPhWqWITW7PrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1OCBTYWx0ZWRfX1elQvObKKIkM
 k9VvB7oRr4vav4wqFWTYXgaOMjxfn07y17Ql2zs/lSVGiahpQ5kptwylusePysBKmytiohUvXHR
 zpuB2+gWmPcqYenaMb+0NptiWmxR6k/wy16LhL1ZzBF47THrxAka8NcQsaEYI/t5f6xfT6y3wx/
 H8QUXXRFDOrFLUikzINGJV3QOj1uWsI2VOSaLQHCRtsFOsW4/bEjrCaRpvo7I3dEN0nEIKD27NS
 8XE3O7x3Yt28rwUmdCqw6RDHdOWAa5t4NREIXCfuZ1m0wv2Cqgo03AlFhMnTDkKCxRbRKdsNrjk
 hYyqSV1bb2Cl9I2sUjZ2KNxB9pDqx+rywZGQZKcrr8Yh9bMyLezPn42o97YUxFaN7ArzRXjUMps
 CCUfRy9XkqvheoOug4IQothq7jK3UkhF3b5RilyUSHEVHEd7F51qfWHaFnXUp4RkL/OzJl5z3cP
 MZrY4A1HnRgRFdhVfXw==
X-Proofpoint-GUID: TmcmT65btow8nOSeICAlPhWqWITW7PrW
X-Proofpoint-Spam-Reason: safe

Add additional way of selecting files for FDL using Function Extension
ID and Function Extension Version, following Windows' SDCA driver usage
of those controls for FDL.
Make sure the introduced FEID/FEV search path is separate from the
'legacy' SSID-only search path in case some vendors choose to re-use
SSIDs for different SKUs and identify them by Function Extension
controls instead.

Change-Id: I6ac1a5e5c85b67c2e9e0eaff930bfefd5e89afaf
Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_fdl.c | 130 ++++++++++++++++++++++++--------------
 1 file changed, 82 insertions(+), 48 deletions(-)

diff --git a/sound/soc/sdca/sdca_fdl.c b/sound/soc/sdca/sdca_fdl.c
index 7fc809707944d..a6f58c7e6a64c 100644
--- a/sound/soc/sdca/sdca_fdl.c
+++ b/sound/soc/sdca/sdca_fdl.c
@@ -147,47 +147,77 @@ int sdca_fdl_sync(struct device *dev, struct sdca_function_data *function,
 }
 EXPORT_SYMBOL_NS_GPL(sdca_fdl_sync, "SND_SOC_SDCA");
 
-static char *fdl_get_sku_filename(struct device *dev,
-				  struct sdca_fdl_file *fdl_file)
+static int fdl_get_sku_filename(struct sdca_interrupt *interrupt,
+				struct sdca_fdl_file *fdl_file,
+				char **disk_filename,
+				char **fallback_filename)
 {
-	struct device *parent = dev;
+	unsigned int adr = interrupt->function->desc->adr;
+	char extension[sizeof("fe0000v00/")] = "";
+	struct device *parent = interrupt->dev;
 	const char *product_vendor;
 	const char *product_sku;
+	unsigned int id = 0, version = 0;
+
+	regmap_read(interrupt->function_regmap,
+		    SDW_SDCA_CTL(adr, SDCA_ENTITY_TYPE_ENTITY_0,
+				 SDCA_CTL_ENTITY_0_FUNCTION_EXTENSION_ID, 0),
+		    &id);
+	regmap_read(interrupt->function_regmap,
+		    SDW_SDCA_CTL(adr, SDCA_ENTITY_TYPE_ENTITY_0,
+				 SDCA_CTL_ENTITY_0_FUNCTION_EXTENSION_VERSION, 0),
+		    &version);
+
+	if (id || version)
+		snprintf(extension, sizeof(extension), "fe%xv%x/", id, version);
 
 	/*
 	 * Try to find pci_dev manually because the card may not be ready to be
 	 * used for snd_soc_card_get_pci_ssid yet
 	 */
-	while (parent) {
-		if (dev_is_pci(parent)) {
-			struct pci_dev *pci_dev = to_pci_dev(parent);
-
-			return kasprintf(GFP_KERNEL, "sdca/%x/%x/%x/%x.bin",
-					 fdl_file->vendor_id,
-					 pci_dev->subsystem_vendor,
-					 pci_dev->subsystem_device,
-					 fdl_file->file_id);
-		} else {
-			parent = parent->parent;
-		}
+	while (parent && !dev_is_pci(parent))
+		parent = parent->parent;
+
+	if (parent) {
+		struct pci_dev *pci_dev = to_pci_dev(parent);
+
+		*disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%x/%x/%s%x.bin",
+					   fdl_file->vendor_id,
+					   pci_dev->subsystem_vendor,
+					   pci_dev->subsystem_device,
+					   extension, fdl_file->file_id);
+	} else {
+		product_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+		if (!product_vendor || !strcmp(product_vendor, "Default string"))
+			product_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
+		if (!product_vendor || !strcmp(product_vendor, "Default string"))
+			product_vendor = dmi_get_system_info(DMI_CHASSIS_VENDOR);
+		if (!product_vendor)
+			product_vendor = "unknown";
+
+		product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
+		if (!product_sku || !strcmp(product_sku, "Default string"))
+			product_sku = dmi_get_system_info(DMI_PRODUCT_NAME);
+		if (!product_sku)
+			product_sku = "unknown";
+
+		*disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%s/%s/%s%x.bin",
+					   fdl_file->vendor_id, product_vendor,
+					   product_sku, extension,
+					   fdl_file->file_id);
+	}
+
+	*fallback_filename = kasprintf(GFP_KERNEL, "sdca/%x/%s%x.bin",
+				       fdl_file->vendor_id, extension,
+				       fdl_file->file_id);
+
+	if (!*disk_filename || !*fallback_filename) {
+		kfree(*disk_filename);
+		kfree(*fallback_filename);
+		return -ENOMEM;
 	}
 
-	product_vendor = dmi_get_system_info(DMI_SYS_VENDOR);
-	if (!product_vendor || !strcmp(product_vendor, "Default string"))
-		product_vendor = dmi_get_system_info(DMI_BOARD_VENDOR);
-	if (!product_vendor || !strcmp(product_vendor, "Default string"))
-		product_vendor = dmi_get_system_info(DMI_CHASSIS_VENDOR);
-	if (!product_vendor)
-		product_vendor = "unknown";
-
-	product_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
-	if (!product_sku || !strcmp(product_sku, "Default string"))
-		product_sku = dmi_get_system_info(DMI_PRODUCT_NAME);
-	if (!product_sku)
-		product_sku = "unknown";
-
-	return kasprintf(GFP_KERNEL, "sdca/%x/%s/%s/%x.bin", fdl_file->vendor_id,
-			 product_vendor, product_sku, fdl_file->file_id);
+	return 0;
 }
 
 static int fdl_load_file(struct sdca_interrupt *interrupt,
@@ -197,7 +227,9 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 	struct sdca_fdl_data *fdl_data = &interrupt->function->fdl_data;
 	struct acpi_sw_file *swf = NULL, *tmp;
 	struct sdca_fdl_file *fdl_file;
-	char *disk_filename;
+	const char *source = "ACPI SWFT";
+	const char *disk_source;
+	char *disk_filename, *fallback_filename;
 	int ret;
 
 	if (!set) {
@@ -231,25 +263,21 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 		}
 	}
 
-	disk_filename = fdl_get_sku_filename(dev, fdl_file);
-	if (!disk_filename)
-		return -ENOMEM;
+	ret = fdl_get_sku_filename(interrupt, fdl_file,
+				   &disk_filename, &fallback_filename);
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
 
 	const struct firmware *firmware __free(firmware) = NULL;
+	disk_source = disk_filename;
 	ret = firmware_request_nowarn(&firmware, disk_filename, dev);
-	kfree(disk_filename);
 	if (ret) {
-		disk_filename = kasprintf(GFP_KERNEL, "sdca/%x/%x.bin",
-					  fdl_file->vendor_id, fdl_file->file_id);
-		if (!disk_filename)
-			return -ENOMEM;
+		dev_dbg(dev, "FDL disk filename: %s\n", fallback_filename);
 
-		dev_dbg(dev, "FDL disk filename: %s\n", disk_filename);
-
-		ret = firmware_request_nowarn(&firmware, disk_filename, dev);
-		kfree(disk_filename);
+		disk_source = fallback_filename;
+		ret = firmware_request_nowarn(&firmware, fallback_filename, dev);
 	}
 
 	if (!ret) {
@@ -259,18 +287,19 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 		    tmp->file_length != firmware->size) {
 			dev_err(dev, "bad disk SWF size\n");
 		} else if (!swf || swf->file_version <= tmp->file_version) {
-			dev_dbg(dev, "using SWF from disk\n");
 			swf = tmp;
+			source = disk_source;
 		}
 	}
 
 	if (!swf) {
 		dev_err(dev, "failed to locate SWF\n");
-		return -ENOENT;
+		ret = -ENOENT;
+		goto out_free;
 	}
 
-	dev_info(dev, "loading SWF: %x-%x-%x\n",
-		 swf->vendor_id, swf->file_id, swf->file_version);
+	dev_info(dev, "loading SWF: %x-%x-%x from %s\n",
+		 swf->vendor_id, swf->file_id, swf->file_version, source);
 
 	ret = sdca_ump_write_message(dev, interrupt->device_regmap,
 				     interrupt->function_regmap,
@@ -278,6 +307,11 @@ static int fdl_load_file(struct sdca_interrupt *interrupt,
 				     SDCA_CTL_XU_FDL_MESSAGEOFFSET, fdl_file->fdl_offset,
 				     SDCA_CTL_XU_FDL_MESSAGELENGTH, swf->data,
 				     swf->file_length - offsetof(struct acpi_sw_file, data));
+
+out_free:
+	kfree(disk_filename);
+	kfree(fallback_filename);
+
 	return ret;
 }
 
-- 
2.47.3

