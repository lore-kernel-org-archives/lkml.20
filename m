Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793886615;
	b=1/vsrK8Z7XEzzDaXWOJyN3F90uwd618+N6KCwLF/GlY+XEy2lqYWBclPWOLDl0ZMXbRx
	 urig21duLg6hoacj0CVffHZa0LjxYA05N5kwvd1Wdf0WMqiz3Q5dRJIfVvlrI8CNPbBDB
	 chZVPm067x5Ha2KQ8vJPKJxrBMJHlQeHYsx1nzDtSj+vyw42IWBsRYCVhR5i1AWrcgzrp
	 3Q+JC8ROVToxfHyBqJb0J5TLdCu7Cj0ksq5pGSIWsFbFJdc1u59foGM26IKkQSg3n1ilI
	 qj5cl2JV0+ZApaaemlN8HNin4Tr6iFRg47HA7oT4aXBzFdk6UP25DfnMYK6zDWNTGnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886615;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Reason;
	bh=H9szsZXAI/3n2BI9gZFYZmlGpbZlYgX4HtIQlHHSWf0=;
	b=uvGtY7kQZ9/gt5ttuBHqarvugXXcA8bli5/8v45lgadQngeBl0pwJ7cMyabv/FCO64N5
	 DG+jYJgh82fXX+UQEp/Isc2Gb7/R2MsIQXY5tZ8z1M2vaTAKW/9IddDA5woW4mgksO2q5
	 MvZ+JbtDUIt++bKwuPEBoy9SWJORfDSix09fQul0rxrgKMRuLzN8hxqRaRFh8dGrXNWsX
	 cWXxHtOpvzGu+aaV2yQxrJRm05sKRYebr95d9abXErmqm9LZOECBGk/X5GRH61W/lTdsX
	 Z/0ew5JCg/6ytS63c/Ptq50WOookzGJKIgUrHoRayZ4YxxQitlCt8QIJM643ck8ROaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="mvv7/MKn";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Lbfc0R8I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF49A606A31B;
	Thu,  5 Nov 2026 13:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF49A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=mvv7/MKn;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=Lbfc0R8I
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5DIWY81741904;
	Thu, 5 Nov 2026 07:50:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=H9szsZXAI/3n2BI9gZFYZmlGpbZlYgX4HtIQlHHSWf0=; b=
	mvv7/MKnRBay37VJsaAvrjt94NIx4OIZHMCqf2UIo9k3yEoXVQaSqKLp5h+IzW1Y
	xGLPbtPr1eeV5YSDfrg+aGnQglYzbrTGx80YzDYjv69s1RHf1jJPK7DZYTPPbjnH
	fREUBW9+bD8UgCKtaB7emwPms1Q3A5/1NNvFVgX9e4PfiHkv9ipqhTczPjRVy0AR
	71elNuO9lMU+Tg7j7Pm4HzJeO84YVDxzey6IOFRiZdvR/qBRWaiedomhtV4YFNKB
	RvFIH0pFliKdCgWii03W/HDbM1Lz/myZU0g0F+U2eoANBVUYEWj3qxUdwLgrNp/u
	1WXdUfdzO2myF9PPkpyshw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021143.outbound.protection.outlook.com [52.101.52.143])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hr73fhvsq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 07:50:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mljWGmrOMLZtnjwMKGEtbi+sxr37f9nspc8fVuN1XjO1XqE4gcmAosgReHFDbb4AWlv8IN/YReqJ+3DfB0wq3h1wSc95YgijeyWlBtp+g8huqpHUhXGIhqEcFJUJRUV/uziQZjvyIJgygHVvphity8Lx24ncWa3bv0inlsPVemPLUuDaFw+2cn0Yk4xBJoFpvvZSyB+sLW2LUyzU55A5gmNXt/kWwePztpwE7vhGvHCkWOOb2tuXldUaW4B3hMeNYWMJUaEk8/zaEvMXcyovleeIn7sNT0JKkJhHr0Y4x3tdAroJWnv+zME6GzRGtLGnU9jELI4hypTNm+hjhE/j5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9szsZXAI/3n2BI9gZFYZmlGpbZlYgX4HtIQlHHSWf0=;
 b=Ny0RRkKbH+dBO9KO8A2rX3sep7jtXHTgYaFo0ic32BQ4T20AnVmLo86h8XlhF3fmFs/jKV+EstypYAPwkj52f3zHjBz4xJG30Gccnw2UynAXGVQ/US8aFzWglwhvJ8BNJhgfbdLsGPSp7MHnfYkdhYtHQQBA+EPwN2vGKy0ecwIJj+8MrhUcAAD8H6q1k18iK3v0Nu/itbiRYaEqPtVJV/9UtsgZlnAWewWUNyoEoTqAu4Cz/YDGxPy7r2K+6mox2ZlCaa3DwwIyRjEjNN5JPxQWiQTw6OtavhA7kxZ0sE9iM82nnxNzLNKzcf3rBHB5FLnprlKJjl9muff478Z55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9szsZXAI/3n2BI9gZFYZmlGpbZlYgX4HtIQlHHSWf0=;
 b=Lbfc0R8IMwODWeXNGCRBWrMbZS8mr5y6nhSgm2gJcJ6CULt5kZvCopcrHHykiGgTIQ0J0DaClsu9iy9NrqQXheVR152HtBsn9o383obsUR4fYZTu2wSHAGjbDUaQ1FYYrR/WlrKv7PzO88zn4uLbzE9AzB2/3fuAVt4k6j3yj2I=
Received: from CH5P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::22)
 by CH8PR19MB9168.namprd19.prod.outlook.com (2603:10b6:610:261::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 13:49:58 +0000
Received: from CH3PEPF0002457F.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::23) by CH5P222CA0002.outlook.office365.com
 (2603:10b6:610:1ee::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 13:49:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH3PEPF0002457F.mail.protection.outlook.com (10.167.252.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Thu, 5 Nov 2026 13:49:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B58F1406544;
	Thu,  5 Nov 2026 13:49:55 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9DAA7822540;
	Thu,  5 Nov 2026 13:49:55 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/2] ASoC: SDCA: Factor out helper for creating mask of Cluster channels
Date: Thu,  5 Nov 2026 13:49:51 +0000
Message-ID: <20261105134952.1728147-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
References: <20261105134952.1728147-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457F:EE_|CH8PR19MB9168:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 233cad1f-925b-426b-8dce-08df3b43adcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|16102099003|22082099003|18002099003|10067099003|3023799007|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261102130727099003|261021121427099003|261021123027099003|261022105027099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	zApwZeA0+lkbzPik2e5K2RHLeiTsf7j2+fX0eiyz1m3z5pJypYLM/WVbmKpG6xDiDTRRSl2EacPuTVrtGGjZIPu0b0sgIqszCVshRNRlafoBkuoEvs0I/dn9hhiwbkRJ4LM17F0sjh5l7a85OCXqutsLGPjwOYmIHz5JjAzz6l81Ro2+b0ehDKrQWikI2T29dBzP/8Tm8TJS9K6Xg7TnJvQN1iS0ROxYa4kRkWQUR8ZrS97D4KplK8nNW02KieQ0AXtnykrk2VhBQnnGdPHVXjIsu8BnrQ0KdfoSpz3O2uWbBuFFhd/47ZjQrWqDa8XHc8JCgZuoBT1/8gnZOWwxz4hu3V8vCBjLdGwVTj+M944HrDqVl55lpL1jtNVyiXNaq5GVkTiEQ4okcgB/82oYcL16/buCnkoA+qlefS78yWDTjQs1M4aR4xvvJXySna04s53MyMNCKwg+2Vt/ySA3sdI6uvlRrD4pa06bizV0BiQKm6DB0dXcNTJILqXmFZZSqutHg5jMZ5fntbIKM2o+CH3qsKFDxn7z+d+rgUasZbzhtYwS6+pL9/f36fBs2/fzj56ss5cjE5jkYIPoWkBL5Age26usEg1Ja84PU6Ayj/n2lfa3MhIe8nqO20itR3NnOK2cKYt+3wnZ23p7H6p99ZyI3NCDFaGyqQzD1Kfd73lS/4T8imz6wDKUSD+D0UK4SK2hAnJCH9W3Uq1Sz5eDJA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(16102099003)(22082099003)(18002099003)(10067099003)(3023799007)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261102130727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E8E2QtOL/eAZZOA9d1Xzfv0ptYJl7dtAoEYJtHiQty8xZeUvoR/xCKcmrOpoOIuvwOYLsNE3TrgcGDbfilk4qPYEKs1oLtLHXgYwODAIIrIfPBN5L3U0dWlW7qBpPZNoJOu8x3YyJp/8M7pckDFq3UuqWu3dWiLC7A4pFdNmKzzJlSIV6peCLxxBny6MiZJw7vTVg+G/txwXi32D/idKs9/YbaPoPPrvWmGh/kuJU/cWjZMLEiCHFMCVYCTKot+RyhyxylQP/R/Sc1McxoFrplpKMdxVClTg+tszUjbjUiZsqLDPQVYP7tcPSXK70X2JEtwnxE3AxhJYY60RV1UhPfOZdp7BgoEUzwuZzTJ8HntgJrvtR7bG1Hm/WoZRRz4vydRhubmtxRKHscjNOjC+KLlMb28JDWUMbS2jDRn+wCAa/XTtNGLSr2owk5+xFo0f
X-Exchange-RoutingPolicyChecked:
	c7Ff5XOD4NkU4LQy/Ks0nOMGNqZ5BYh66RNHbDeQ/Ucqa36lHSdUMJTodrvK4XsFIJYjRdmRtALdlknXorzJMDVpO+kh3oSMXRiX4ClT80ck21H4wT/1XOuejCTWtD1Rx+zfANvnewEOIBYjlQ1t+D3VD1+/UNAwUG6gShbB0rkaBAGYOznbHlHbrDMQ+rWi5Q3rO6U2A/0C3rRioaXVGV3P/jO22Exb7dbY2G1eAMNu6LOGH1zr+8pWPJljuQeI7C9EiXHpeT2xjuTiOC5WidvAcmDDjAsfPRwcIEGyiktsK4pirYYh13a9dn0zjdVD9cj78hTFXv+bxLRPPc+Uyg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 13:49:57.2183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 233cad1f-925b-426b-8dce-08df3b43adcb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH3PEPF0002457F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR19MB9168
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX1Vi8U/FWhfIp
 u4fWVnvSvkNxV9db3ijcWXzTp3Fl6066EyHQoTSzFx3nkjg7rr1sCjRnNbsgoxVvMFxpD7MkCOu
 bEVvX4tcYjtlKtYP7FBM1j+o2WjV+so=
X-Proofpoint-GUID: ThJAKM0oqjL5dY6nroN6rXyQay83cmj-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NSBTYWx0ZWRfX1WQ26w0dCrp2
 1h4hWhGeB6rA/3zEYMftnNstPz25q389VYWuckdN6MR64C/6IDa3a/CDZwXcQHL4RZrnIH/sVtO
 Tlgpo6N+b+eHttTTFJvHpzuaccb2do8TtLcjfuuM9WX8zjnWKz2ohV0YVEWInA2mGKLUrfnI+ld
 +kg+DowV/HHhVoIrFHXSYEVJ2uO4TAzttALx5VF6S2tvSiIK3Fickk2vcN9wcjoealfp7z4jr3J
 a8swu2qJ+7cDk3do7rbSlYnkJ4sW0SnidLkmbJx8xEnGgnT91sYX7c2guNALrAhHmpoa47lYcdL
 UNEH6J29bT/mWH1r2KIU+6V6ZJcKC3fFowAGycQMxVLpNkx/1bIi8HqJefWpemjAtKMnumxWYMY
 UDOC+1Y3SlwjOks+e0gk+xC1pKOqofdo8BpHKNknk+pE2JGNIxwLlYjThdG2gHRqboQsPtjJnii
 WE/nET+pIgdzzqg12qw==
X-Proofpoint-ORIG-GUID: ThJAKM0oqjL5dY6nroN6rXyQay83cmj-
X-Authority-Analysis: v=2.4 cv=K6S3jCWI c=1 sm=1 tr=0 ts=6aec898b cx=c_pps
 a=/cdxYPoEIjFnUsMTEY5PDA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22 a=w1d2syhTAAAA:8
 a=aFt80_-w5_0SQ9BATu8A:9
X-Proofpoint-Spam-Reason: safe

Factor out the code that builds a mask of the allowed channels from the
Cluster information. This is slightly cleaner and prepares for
additional constraints to be added to sdca_asoc_set_constraints().

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 64 +++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index ccc579f878ff1..b801cb92cc3db 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -1434,6 +1434,37 @@ int sdca_asoc_populate_component(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
 
+static int get_cluster_mask(struct device *dev, struct sdca_function_data *function,
+			    struct sdca_entity *entity, unsigned int *ch_mask)
+{
+	struct sdca_control_range *range;
+	struct sdca_control *control;
+	int i;
+
+	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
+	if (!control)
+		return -EINVAL;
+
+	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	*ch_mask = 0;
+
+	for (i = 0; i < range->rows; i++) {
+		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
+		struct sdca_cluster *cluster;
+
+		cluster = sdca_id_find_cluster(dev, function, clusterid);
+		if (!cluster)
+			return -ENODEV;
+
+		*ch_mask |= (1 << (cluster->num_channels - 1));
+	}
+
+	return 0;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
@@ -1457,38 +1488,21 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 	};
 	struct sdca_entity *entity = &function->entities[dai->id];
 	struct snd_pcm_hw_constraint_list *constraint;
-	struct sdca_control_range *range;
-	struct sdca_control *control;
-	unsigned int channel_mask = 0;
-	int i, ret;
+	unsigned int cluster_ch_mask;
+	int ret;
 
 	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
-	static_assert(sizeof(channel_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
+	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
 	if (entity->type != SDCA_ENTITY_TYPE_IT)
 		return 0;
 
-	control = sdca_selector_find_control(dev, entity, SDCA_CTL_IT_CLUSTERINDEX);
-	if (!control)
-		return -EINVAL;
-
-	range = sdca_control_find_range(dev, entity, control, SDCA_CLUSTER_NCOLS, 0);
-	if (!range)
-		return -EINVAL;
-
-	for (i = 0; i < range->rows; i++) {
-		int clusterid = sdca_range(range, SDCA_CLUSTER_CLUSTERID, i);
-		struct sdca_cluster *cluster;
-
-		cluster = sdca_id_find_cluster(dev, function, clusterid);
-		if (!cluster)
-			return -ENODEV;
-
-		channel_mask |= (1 << (cluster->num_channels - 1));
-	}
+	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+	if (ret)
+		return ret;
 
 	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, channel_mask);
+		entity->label, cluster_ch_mask);
 
 	constraint = kzalloc_obj(*constraint);
 	if (!constraint)
@@ -1496,7 +1510,7 @@ int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
 
 	constraint->count = ARRAY_SIZE(channel_list);
 	constraint->list = channel_list;
-	constraint->mask = channel_mask;
+	constraint->mask = cluster_ch_mask;
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
-- 
2.47.3

