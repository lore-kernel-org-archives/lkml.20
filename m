Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239574;
	b=lrF/a6NcG2TD/CgBCqg7YkaTFJF6fUgqFQ/ojhxzLax2PgE9w/KzP2g/tosN2gj1/cgq
	 Hym+/C90ml+lY7CTbaC/RUgPzcQMbJyfb8uiPUV6vizCewoC5hoWwxWI56ilQcjGBkhCz
	 IFy/IKIXlpNA7xdIaHNMSWL7FeN8oDx5UJ8xU5sNaVDfHkJ4xXw0exIBgw6e0cvcdJmiM
	 KgX17iGKvjtAEbC/MHn3loY6048LH1ObCXjhzE8hgFIaXPdIQM/Cw5/V7xyyW46ppSeii
	 OtB1BdroTbVNjQYfzqJdP3pERI2Iz+g3xqmbUoGYoo/ybbNhTU32gAJnILLUgXP/Wzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239574;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=xUzYZ2jtlY5pWXdQOR6BDZYx85Tt2y86J5I0J4OH6WM=;
	b=YSNk/SUbw8ks65QelFEYUmlFg8I6XpCOWNfnywovh+YtrqbHr3pT/19g72u+FQJzrhpq
	 Xr9+7GgHFGS/lrBhLOwfsSiJ41+YTUbH/tTyGU4q3FjFuVXpphHlmEiX8ZjDeGqAgHPiD
	 Pp6CSNt1uJhzcUnmLMGTwAnhjHX1JS9lWhWdbE+4JjmsjtbHe4Cghe1ZzlVqZO16MuJV7
	 zJEdpxWr8WfeBRDAZcpHRINJ35Yzo6hAYRWjpMqWJfit4jNrL1Gv7ANjHsXOAr4uul3Jy
	 oWwBhvcvaUFPh9bmQjNOzaE1oe3icMencmpVDqJUzc7RvxHAnh0gpD1bs5E1NHZiVVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=prn1lmDa;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QCemjPp5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0D606A31C;
	Mon,  9 Nov 2026 15:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=prn1lmDa;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=QCemjPp5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9FbxAI2645932;
	Mon, 9 Nov 2026 09:52:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xUzYZ2jtlY5pWXdQOR6BDZYx85Tt2y86J5I0J4OH6WM=; b=
	prn1lmDabeueJKL7IXFFrcF/vHgRvX3cgukncVxRv0h9fJriaaXmrWyk1Sec0qGi
	+XlEaT7/xHcLtc9zpOd1G5UxRXA/gZ6wmj8pz4MB19zBrnEPAEDq+5LOMTc8R55N
	WjoOfaUGI3o5q8efenLL2qxbfI7UzEZYmz1a7GV+HVR2Z4oRkaP/swe54L+5Um5C
	gRRGbuPBn8RXG2RBPJphUSnF8rLzojaZHeh9lZwmH4f96nPa20Xc/4bygMzi+FQL
	srUjB2lsb8ZkxZkEwcoSKY9qBJB+z9dmwM6N+mYPnQw5kkQU3y6gue35Vw8XI6HZ
	iN47NfbNFhq8CK8evI5E7A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021088.outbound.protection.outlook.com [52.101.52.88])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4ht29ha85x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 09:52:48 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiaIMdhzmgle3Tz7g9j7MWfSM453YOiwntNPYW5F5rjQe4rcseWqOiSTddtaaMLTIxni/uNwT/aZ+/GY7vpk2eCC04BrKxiGg/eul8l0V4uO5C9UBvmxHLI32hbRkbDlGO2OlLxUtBTLwVbmsv0yWFAjioHCAnP2RKH6o8XHKrsdFJ75kwokf/MOzE5iy1Q2tcBFzOZ4ErMyQrp4DhVzfylGxH9aylL1QzQo8c3Y0OzL73Ap52/ApYRESvj7YnAR9jCogMPjC+tw0ChTeTilmIBQzQu8gqKCUx90fwvjKwqFLXyTOzMh97LETjyzxhyRJePsxzhnUFm1aX+sAD+66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUzYZ2jtlY5pWXdQOR6BDZYx85Tt2y86J5I0J4OH6WM=;
 b=QHRRuW2pX6AtpUwVwds7DuuWe5s/Y2qIQaKKmQJEtJM6v6ZxeVmpdMK3yB25K3p5e29ukMPAiYoR/334ouCThyD4XQ3c8zdomuu7OLdgL/dEONTXipPYlg9ndxNoMihvUETYtE0JcwwmcMXdBTr9aStqct9UbzLJe4uI39yll6hhCjOBQ103vS6rXRTz/1QDhiRt5MdycP3rP1J0N9uHOXUPTj9kPvySAOlZh8n+REyKRxvVmcbzGuxegTVeL+IzqY8K92R9V1giT5ymmoos7h5sG/yzSWGMC4yMSX5w9GbxeR297pwXjswdyd11cxoE7I+t7WUf508He07a+psu3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUzYZ2jtlY5pWXdQOR6BDZYx85Tt2y86J5I0J4OH6WM=;
 b=QCemjPp5E00gg4HtxqcrYuxuPnnC2beX/ZE+txDsCkyeGKoCC4f6EgDGfYKtkkdLqipkixKROl77ej2B85kpHdIRw/edpBCWfQfSGQ/jw9ZuTmY2DfGiiw0gflHwNIG7BF3aI1FrZ0urassi7usUiMNvFXiETLwE2G5sdk0NQOM=
Received: from MW4PR03CA0114.namprd03.prod.outlook.com (2603:10b6:303:b7::29)
 by SJ2PR19MB7596.namprd19.prod.outlook.com (2603:10b6:a03:4c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 15:51:13 +0000
Received: from CO1PEPF00018862.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::87) by MW4PR03CA0114.outlook.office365.com
 (2603:10b6:303:b7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 15:51:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF00018862.mail.protection.outlook.com (10.167.249.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 9 Nov 2026 15:51:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AE43D406552;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 93272822561;
	Mon,  9 Nov 2026 15:51:10 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 1/3] ASoC: SDCA: Move DAI constraint allocation
Date: Mon,  9 Nov 2026 15:51:04 +0000
Message-ID: <20261109155106.3727597-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
References: <20261109155106.3727597-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018862:EE_|SJ2PR19MB7596:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 01244b59-b363-48d4-9e85-08df3e79479e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|61400799027|376014|22082099003|16102099003|18002099003|3023799007|10067099003|11063799006|261102130727099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|56012099006|261021121427099003|261021123027099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	uW2T6eMRpPJMfjUtBNKqxTGu8jP8N9J5YqloOl08eeg/cEDBEwjI3uDLd1l8Pl2AeC98+AnqmZgH9cyptwY1ujPonJa1SlVv+S9FhrlPEuWzQegdUkY23AlYXoGIcF22cSNpqk2m/Jq4g1pLLf+fIHXOJFR/DQHplsGJMp5Xe99fwUrIw5wfm3n+klhmLe3H0V4PBubnPEitUsP+UTqdzB9yVMnZJrGqsvsXrfvEWw1Mtg+NjlEKe7KeX0GjoFRL3sRVRPRX7sokEOr1Ga3hfzwFd8yZzdGHO16E2oGwgtWx63a1qhv6MnhrRccPNjiLoXXAlpEOL+DXY8hv9bsh9Yx73Ibg1BImfb8lV3gPqyw/L8KlqpZFec89v+mGr04jZ4dL4uhRZAnmRTMylepx/+12yq6H5dubuq+eO8KfoVyFRofVy3z5BmvkmGeeyXNsobyZxgUGDfLNbOMSp/PsqORs8EHX3mFHrLoVmEo30SNJ2C1Eq39w+wsAwDQmGJGi/ccpOnPYFclJ/PArqKeU2wmxC18sz5NoEEBxsF5tFV3hemFwkX3xeVFWwH4AWao4qO03P1iwya/k013WDaQtsNoxDbL5LkWkTV7imbxsJgB+GpSNCfaWK38cMjOq5Ed/r/R27AUa0ZtySoQk5IHgW2lLvz7dNXrZzGKht713E5tWm+MgDNcmG6rlM0Mpf+OA2pQ2cuU7SmEAZVwdwD/wJQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(61400799027)(376014)(22082099003)(16102099003)(18002099003)(3023799007)(10067099003)(11063799006)(261102130727099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(56012099006)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zK11Cte8QyhYcoHowAwGiB7ZHZw4nmnHHKVn4l/UYuKJ6wBVOfmpIZTezkRz/NJzULWRJh/qm+Rt/3q2hJK7Nrm+gzmLxEFAFWkFQezsXueIRhy3NlnT3HZs+/BGJh+qA0Jw4UNbuRSXp3nlx8cSI3GiilC15P9bZZV5vjC2IivbCsZri6zULbr4sEYSWQuXZ6s4SwbekcQZNh61JqAA9Ia2ypoM2YQYOogemzNAtLR4zh6+NzBhRZZ2+ZsX0Aw+gZLK0o5Apk3PdQcglcYu4pKqfxGcqCfRUJcMhGFTwcB+3xtgWbVy3Ncp7RNqEhh1+F18Vf2v0pSXZtNKXD7NpNaxYuWdxLT3qVx56KKlqsTllMlbSpkIHqypM8YnbMi3YCXpgNLk0G9B5g7IcbrfDi7P/nHrQpLbq6X+4uVG61KJSKiUh1mOPQAqbpo4EUsA
X-Exchange-RoutingPolicyChecked:
	KBFS+p7hHRthtbgAJFXaCouH3txEjS3NYKbK9LaaOnghGlxx9g3M+O+9KAJc51dzOIPaMZlwgAf4lS5J9IP9hIXBK/LhlQ73/fMXPT0/H885LYaZ7K+20flCashLBWJG/wSwPKV44EQwFfbk1lJA4eFOtf5z2iBFWB1QDkxKT+20jUVSr6MH0/jt3PqyqxearKmgJzv6FoErKtYTMlM60691b8RcTEBhpqcnpU2tF1RL1bWuS3i3a2Xz8hjnR9BsGoioY0Wl5cuyFOIAcbmJjd1r5eRvQV9yko380ujK58SNvnjUbK0fijOglKEUh5YtKq3T0088BS6I8FDZvpTnMw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:51:12.0278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01244b59-b363-48d4-9e85-08df3e79479e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00018862.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7596
X-Authority-Analysis: v=2.4 cv=PO2aavqC c=1 sm=1 tr=0 ts=6af1ec50 cx=c_pps
 a=iWUa97dvZcywjWCZh5/f9A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=P9r7sxRW47Isc9G4scAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX96uZurgJGo4D
 kEK1KivT2yMZns+vvLvHqsIPiJ9S1lH7L7w3l/mjL7fRclzfvPAn+Z5Xovr1cgx6aMumRRkauLK
 OwCompymRL0flXvFzEywDxifqI4iNrA=
X-Proofpoint-GUID: wKITzttlMPvYqWo0H7qYuCiOli6fBXn7
X-Proofpoint-ORIG-GUID: wKITzttlMPvYqWo0H7qYuCiOli6fBXn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfXyK0JzbXOVW2f
 vehJ0q35EfVzEbhFbgJuDNE3xFbW+OCKmEw7mZiUOWUP7nEMeUlgLJEqaQO1me/6hEJUVki64DO
 UafANSqPo3cJ0AcKkHP+bGcstaku/MSd3EYKI8q2bGOGlpN+4ugGrMgKNvaKI4XQymWV1b21FYA
 s1la/s/NsBq9aXelJAFRyPo2PlC2gX3XESEafXsw0aITADKUlP5Vd4dT8XLoCQIoUrHBngeaU79
 LONvjXIh5nvBHCu3TVJOQli6Wx4gsx8d9PkykNHT8sJDv2JfyphDeg+u/XgwUdnEe9OFBRujRb2
 zgLLrfEpVngSMjeGDunXAmzc4/HxJE++qqxRaCt5Xq00vTvgzLZAxd3O+GiAHfyAm0wdqGowhrf
 gHvq5Sm+M0l7Em4qYM46t0JygDUONhiE4LQvUbswcz6wklVroDTy8t8g8jmix32Fr9bQe96sspn
 IjQhIe14Ak9fhjSO9qA==
X-Proofpoint-Spam-Reason: safe

It isn't necessary to allocate memory for constraints every time a DAI
link is opened. It is faster to allocate them once when the DAI link
is probed, update the SDCA code to do so.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v2.

 include/sound/sdca_asoc.h            |  5 +-
 sound/soc/sdca/sdca_asoc.c           | 75 +++++++++++++++++-----------
 sound/soc/sdca/sdca_class_function.c |  3 +-
 3 files changed, 52 insertions(+), 31 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 599a72f335153..236a441ec9d89 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -89,12 +89,13 @@ int sdca_asoc_populate_rate_format(struct device *dev,
 				struct sdca_entity *entity,
 				struct snd_soc_pcm_stream *stream);
 
+int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai);
+int sdca_asoc_free_constraints(struct snd_soc_dai *dai);
 int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai);
-void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai);
+
 int sdca_asoc_get_port(struct device *dev, struct regmap *regmap,
 		       struct sdca_function_data *function,
 		       struct snd_soc_dai *dai);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ccc579f878ff1..b8bde56298706 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1434,6 +1434,48 @@ int sdca_asoc_populate_component(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
 
+struct sdca_asoc_constraints {
+	struct snd_pcm_hw_constraint_list channels;
+};
+
+/**
+ * sdca_asoc_alloc_constraints - allocate a constraint structure on the DAI
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from DAI probe().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai)
+{
+	struct sdca_asoc_constraints *constraints;
+
+	constraints = kzalloc_obj(*constraints);
+	if (!constraints)
+		return -ENOMEM;
+
+	snd_soc_dai_set_priv(dai, constraints);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_alloc_constraints, "SND_SOC_SDCA");
+
+/**
+ * sdca_asoc_free_constraints - free constraint allocations
+ * @dai: Pointer to the ASoC DAI.
+ *
+ * Typically called from DAI remove().
+ *
+ * Return: Returns zero on success, and a negative error code on failure.
+ */
+int sdca_asoc_free_constraints(struct snd_soc_dai *dai)
+{
+	kfree(snd_soc_dai_to_priv(dai));
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
@@ -1455,8 +1497,8 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
 		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
 	};
+	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
-	struct snd_pcm_hw_constraint_list *constraint;
 	struct sdca_control_range *range;
 	struct sdca_control *control;
 	unsigned int channel_mask = 0;
@@ -1490,45 +1532,22 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
 		entity->label, channel_mask);
 
-	constraint = kzalloc_obj(*constraint);
-	if (!constraint)
-		return -ENOMEM;
-
-	constraint->count = ARRAY_SIZE(channel_list);
-	constraint->list = channel_list;
-	constraint->mask = channel_mask;
+	constraints->channels.count = ARRAY_SIZE(channel_list);
+	constraints->channels.list = channel_list;
+	constraints->channels.mask = channel_mask;
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 constraint);
+					 &constraints->channels);
 	if (ret) {
 		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
-		kfree(constraint);
 		return ret;
 	}
 
-	snd_soc_dai_set_priv(dai, constraint);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_set_constraints, "SND_SOC_SDCA");
 
-/**
- * sdca_asoc_free_constraints - free constraint allocations
- * @substream: Pointer to the PCM substream.
- * @dai: Pointer to the ASoC DAI.
- *
- * Typically called from shutdown().
- */
-void sdca_asoc_free_constraints(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
-{
-	struct snd_pcm_hw_constraint_list *constraint = snd_soc_dai_to_priv(dai);
-
-	kfree(constraint);
-}
-EXPORT_SYMBOL_NS(sdca_asoc_free_constraints, "SND_SOC_SDCA");
-
 /**
  * sdca_asoc_get_port - return SoundWire port for a DAI
  * @dev: Pointer to the device, used for error messages.
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf7..6406c9d0f6119 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -184,8 +184,9 @@ static int class_function_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stre
 }
 
 static const struct snd_soc_dai_ops class_function_sdw_ops = {
+	.probe		= sdca_asoc_alloc_constraints,
+	.remove		= sdca_asoc_free_constraints,
 	.startup	= class_function_startup,
-	.shutdown	= sdca_asoc_free_constraints,
 	.set_stream	= class_function_sdw_set_stream,
 	.hw_params	= class_function_sdw_add_peripheral,
 	.hw_free	= class_function_sdw_remove_peripheral,
-- 
2.47.3

