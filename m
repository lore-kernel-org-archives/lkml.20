Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715554;
	b=bPZSaSkrdJGyaLHyi3JVUc0Gz3YlHT7QlRbvEC/admCQV8ZvD6sEVsl5FX0MB2CcvS5I
	 7KaDy7nu6HhDBJoGyYqiDDTYPo7vYDC1dga4cULmeigxMjux3l2ZgL0o4Yy1khdHUist2
	 IAlv+MGuyPmfo86ocxYHfp9iNsC5xchept1jgDdZACEDsmbFEe9Xu3wcyvIz6G4oyBBex
	 jAGuMFNRvfi66f8JwQVmB6qN7KYVBGRgBq8Hz1qPqfevy2SiWJFNC5x7w/HKpuAfFp8Xs
	 mq8FCJXJbbX5tmubDlV+ZxqzL2lsUniIxyEW0moiQXZ4NIq+I3PPu/HBoPRAaF8za+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715554;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=ggQa9clEsThpK7bCIuJK63IAKNPCBUZmwC+RVffZKzc=;
	b=iuSq/exbP5UQc0mciOVuiFhj6oj2K1cA7X9UrEZj848rBvBDixp9yMVX67Jpa+UHVvkP
	 dy+nNiC8AOyfhBo/FuXHM8gJqRDWD7bA8p+OAxkvR7fZ0kBBvCalXuXjudUGNkqff9HKP
	 7U1Yrf1R+7pPznXz905WvSUYm/lTBbdfv0K5FyiZVS/8grt0mYP0OYWm3L/Lnoc2ZKwD2
	 oXqpkkoEWu44Z0abPHBfHXHQtoM0Fz4erQqfWQN+dWdpiVDABsUUP2mQAu2AOxxO95vfF
	 xsQtyQ1nXnZnH2WbZt1lFNawMC4oHt1KPZU/ILeNuP5UrsnjOJb4PzMjd/Vd2Gp2JbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=R5HTRXyO;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=SbzJT2Ph;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F47606D815;
	Tue,  3 Nov 2026 14:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F47606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=R5HTRXyO;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=SbzJT2Ph
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E5FG91102867;
	Tue, 3 Nov 2026 08:19:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ggQa9clEsThpK7bC
	IuJK63IAKNPCBUZmwC+RVffZKzc=; b=R5HTRXyO774unagmknq/on59kip3E63q
	FfdCMATDvmn6jYLZ9yYxA60gQUIcfWpi8s15e6FQE//GYmvxB+focnLxCDTXzSzh
	iWTbbruDwWlDa4kIMZQdzmNkcJc7taWiFjfK30/qhGxDZOZBADRtVWYGWfhSNjXn
	FYExn0GHLMFNF3uUIrl/XqbWGJSb2bzy+I3rqdQ6xETGGilqCm3Nev0MIEeV++zM
	Wmxpi1Xr0XQvQRu/tNVvmNH6C7PYEgNr6mIZ++NU+ybXUbOdidev9VG0pXDYR4+2
	+fm4ixQoGXT84v/aDkGXNBULZlUCIIjYL1HmdpwlUfKYUdIlxlr1pA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021127.outbound.protection.outlook.com [40.107.208.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfuu5y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 08:19:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5y5T6k4ZV4/dqcJr8uWEGj+MkV06FTqE5SwI+ZfO8pBmb4fCv+NnQo9CJXItvoMqe83wwapqDYg+hX0Sd3mVOnMycVF3YxjsVUFG6AqOiuRjjHfZhB/eC3LqZaKZbqftH+h/kEXj5yhHqY3s6MeUxFOCamYQOroau+w+MhJSF+JH39yuU1s+fsxDlc1CO3Wg4JFShf5NhIAluM0h8s6Kl/KpQLaFnnOunxFR4920b8N7S/msCGIO1gYQz1N5kmJAN2WFFGlH1LbvehLoGCKdbgwhdcecgPU9+5Jzea5HxaDCrAZsmCKiOUvIjKh+sGWYhbXI4BT+LE8UwSXkzrTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggQa9clEsThpK7bCIuJK63IAKNPCBUZmwC+RVffZKzc=;
 b=GWXIeRirEuIIweIw8sHuVn6To3/WExipTMpbokLeXBGTYz8SztVWVUvS73/woPjX96L+/3Bm6xu9dGCtTOsiE7XlmA511tCM8z0CzpbOYBvx8lpiWoWd8yT0N10wPRHX3M8Ga7CyZByZolacUeRcRLLknxeLw0WxMk948E6G6lvNDu8/uQLOYi7Ik8k9JqLKhewfZfDQ1C4IaP2TODv4ZVZ9ugg9++PqcSVVerh/Eh9WT1tCaoyG5p1IJLVBpq4LgRNkbCn1MHJva6KX/b+bIYPcYwp+IcUeNXEafEIqTINp9JkWWAzAhgKkFHnbJeXlJLN3jT4Zh3NIDrnOTa36lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggQa9clEsThpK7bCIuJK63IAKNPCBUZmwC+RVffZKzc=;
 b=SbzJT2PheyHH11uswLDcDLbsY1tjK7nbM5Mr5wTQXss3zyJxGcQ4oJWLX9FkdR9bi52BTBXv+DN4KTHOaAtl0vJoJzD0vuN9YsgUVP0SADmDThCeuAbQ21l487rHvPby85/K7FI4u/0XIPc8Ng3EeCOR6ZNiRtwh1AZPIqnObfg=
Received: from BN9PR03CA0942.namprd03.prod.outlook.com (2603:10b6:408:108::17)
 by PH7PR19MB5776.namprd19.prod.outlook.com (2603:10b6:510:1d4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 14:19:05 +0000
Received: from LV8PEPF00000067.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::77) by BN9PR03CA0942.outlook.office365.com
 (2603:10b6:408:108::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Tue, 3
 Nov 2026 14:19:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 LV8PEPF00000067.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Tue, 3 Nov 2026 14:19:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EDAD4406544;
	Tue,  3 Nov 2026 14:19:03 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C977982026C;
	Tue,  3 Nov 2026 14:19:03 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 0/3] Improve pop performance of cs42l43 input path
Date: Tue,  3 Nov 2026 14:18:54 +0000
Message-ID: <20261103141857.672537-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF00000067:EE_|PH7PR19MB5776:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a272faf1-aa3d-44ef-2efe-08df39b56ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|36860700016|61400799027|261021121427099003|261021123027099003|10067099003|11063799006|261009223027099003|261102123227099003|18002099003|16102099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AiIXPOomC7Ihsohos7nmPCV36jwk0w6rq3qIUZqirH2TJAzAVH/2eM0FCasXXMYnTy4N6hNRPC3AXkW7N/eGqNSBSz82ORK/uvi2rHS11Q3ZKkx6mqhUQyB4HUHypYZSqSrA9np2TmiLeiClXdYjx/C0Dkm2N1PB02wnZqijYcTn3o5lpG7mGBz0StvVvhxHYyPNRYS68YMF5F2o8wGskZOe0HRsgaU7IjAkC3xhhCbhu6EVexFFvYunrcoLWgUDHD/GtVBw8U87PrHj7RP9yLYwdpYZtnWFJi0BzwN9NAgJb7g7A5n4rFc1d0Y4Jau9i7R7Eoxn0f1pXdwgip0qjJYgQrzmiBbT8zji6pTGkITf0l7xMFH0vg3yaM16HM940BfI/7Yd/g33tTIaxIa+g7sYS2jgUlJaBKmwpsA1fz6Y877rvjATLvqvhN/seRfcVQ0vb+da0lpo7Z9mXT48+hBaX0Z0eUbbIKJqXSQ7+y41N6pnXWXxS/36/Qnr5SE8UDmfO0dzwhtMqXkMZmZJ/xF6vNiGodjNMuuDqge7Ku/hmFoQr/yRldbGObf7Dzo/4ENtSkzuTCh8Pz0PG7xC4ONRcfHl5BNcUVsMQz85wlqMRTmgMdoKKiOS/zn7vsFJnJy1cbG4V7ZWrJ3mznCzWGGQRbGgTMvGnLEGBIQW8/3UzBwF9/9zwID78yzjckvr2iahQpBKrQBAeuq5MeYLBQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(261021121427099003)(261021123027099003)(10067099003)(11063799006)(261009223027099003)(261102123227099003)(18002099003)(16102099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FbrP8k1FlU15BeMASge2XbqG6aZwnxM++CF61bxQF+D5tCb/+7/etof445LD8ZBR1KZsXsdLEmz/naVpNibj1aFJydEy6gsUw90zpUFt4zuaHQDG/PpOCTqaB7PgHtyJvZGiYm3qrT1Ks5dCZy/uKOiX0lhNsCNH0XSVzH366OC7V1o2K74ztor//O1G2v6S2rAWFlQFOzq+SSy/ME+grFp4kfojxcwVaTBJ23LNXS33h23cXd1Ik7GgHWxeWpL1m9y+d9KWRYX8BuYecW0oP4VyjVcQIBaoGvLk82cni0ncqlUT4/ghZxYm9zQNQhCGkaDOKWNi/m/e96TUu/z0phP0jGj1BP33SyrRpi/GTWYtK52UyytVEXTwnsiX37KINNSuG140hy4Oc0of/tGOcQA7sZVbUcR4tMMa+Hiz+nLWW6BkVoFBiJS+DzOFs6rr
X-Exchange-RoutingPolicyChecked:
	2XyMOog1RCm79UvdRdHVZsNyipt9rVGY6OwY3iM4ZbbqKjkVkQB3gT81c/hIdWhTEEXN7Se6yh4TJOlnqolVN2gZ4+TYIbM9JCAprQajlH0+YDdZvhpLt1ksTpYqXKTMTswnfnokZgQfRPjVYXS2cj9UF41wEYGv7ZoQ+ZtfpDgndpUyB1RJHldxIxW+dH7nrdvRomkIOgkgENgpizDYfmjyLWzasBbT+lpNJR1HeraU2QWQUP2+D95ZtLVFkHftB1EmyE7JjPLrkKsHVHkj4sY6zyfnpLdcRIBluO2DbPpY2PrZQGGGOSFKyUcavYMWG8FmhSgi0jOceaZGCT/usA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 14:19:05.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a272faf1-aa3d-44ef-2efe-08df39b56ae5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-LV8PEPF00000067.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5776
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX55GVQC0qXj7X
 oFDU084CZG3RRjW/U8TK2Sp+aPpwwyZGlyIUj5tz1PaIHS/JDJvdRS45+2F0x+DRsu0csbl4yGp
 E/KSr01amuG6W+PY8PFdeRR+AKZoJT2tnx2gxDeBHiTRVAukLmrhSxjYQzBclMN+FyOCeh64/Qy
 cgKkz+oSQUhItwe1Vyl7cMcnsy2i/fMNWa5Ij8FnZuB/84vv1yovI1WMQHskkDl7HxVMYkhy1IE
 qp4kSOlC0/fttF4woqbjB34gedzOHiRyYbrjPSuTbcxQSKfTMBs+z8p3CNopObLHq7O2WUReKyC
 yBvFM0E/ubvQtUrg52WqKMqgI1SWuBUD5s72R+/ztm4PPT5WMDii5op5fRqgzxhOlOU6I4N8eDA
 qEm3QzrLogOWgul5T47k10quPFjbhhCDyWZ6cXCco1hnk5iCR1kUxvIArv0gaQkuYy+ep1gY+p6
 PW2YCV68/S+TvxwA0lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NSBTYWx0ZWRfX/SMIbQvMSiu8
 l1TnXWQHCdOP53gtJ8U1NlRkV45wdO7vhaUzOPBsk9QuDzl41DKKXez/L6TGd4pRi+6Z0FGxpze
 L8F/M0o8CLrS5JXX1M5zst7iOCFRRJA=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae9ed5d cx=c_pps
 a=TSVcXIYLINIUQqCwOqgFvg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c52L210Bym4mdPEIlocA:9
X-Proofpoint-GUID: aC70CysY6q1bQllbevf6Z9J1hE3rSxos
X-Proofpoint-ORIG-GUID: aC70CysY6q1bQllbevf6Z9J1hE3rSxos
X-Proofpoint-Spam-Reason: safe

Some rework to improve the pop noises associated with bring up of both
the analogue and the digital input paths on cs42l43. As part of that
there is also a little refactoring of the DAPM mic event handler to
switch over to look tables rather than switch statements.

Changes since v1:
 - Added static const to decim_info arrays
 - Corrected order of a couple registers in the decim_info array
 - Added missing dapm lock around affected controls from new workaround

Charles Keepax (3):
  ASoC: cs42l43: Improve analogue mic pop performance
  ASoC: cs42l43: Factor out decimator startup data to an array
  ASoC: cs42l43: Improve pop performance of the input power up

 sound/soc/codecs/cs42l43.c | 219 +++++++++++++++++++++----------------
 sound/soc/codecs/cs42l43.h |   3 +-
 2 files changed, 127 insertions(+), 95 deletions(-)

-- 
2.47.3

