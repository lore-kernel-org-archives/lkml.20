Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793977783;
	b=lkktacKstH9Cbit9u1+fHeSySC/WATjnogEHkg6DvABfftScXTfWNjHP3CqG0z25dbxC
	 u8K3PsjVgifH9QYzpUuZesN494FKt2mT5GsJpEWBiCvOEjfcWz2HCbUDYAsRpFAkYHqVd
	 ToJ9VGpfxqW/cAvBt0y5jc/1EDLizbaaMdMtzTKF5GnkexhylYkdlukFYt9T/Mjo7Bm8S
	 eEIGrNvDzhbmxD8GJpLbORlWpdjzRGjtzxJcbjOTkDiR36Tcvr31P1shO70mPbGZS2UA3
	 9tQ9m/h09s47U9Z3qAIghqqJkwlCsGOyJCZuzKOlTHXwd8WPlQce3HLzIiej5QwFrJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977783;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=xD9aRM6CFL2OMib+y/X4yEuXauAXDI8a6ZcKH1PvJXI=;
	b=NQJRus7OBAl0pCF/SJAB79rVFweNP3LubjP67ozCa6nmpYjRtegvtypEvkcMBAAcsQky
	 hOOyPQun4uQSUY8mR+KjGMAo9kqYgNuwq1TdAvxTgQcGxS0ndatE2PhkAgSkebpk3bGbC
	 vac2sEntyxSCMJFoRjY40S24mCVkETXkSiW2kVr6ZBVWK/Qq7VAFfPNFKETalBm0xmJ22
	 JnIscd5IftFD7k4etN5TfRSYBzhq/rzp6dORSYBbMDDYTHc6zFqO7VYuyW6SbqtLI5lzs
	 Kd18fb63aMrIZrrG86fFV0C2Ss9vVEv+VGNrAlsvXVg7UFKSG9KYXkpgSgXu73PXEgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b="rFGnRtO/";
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GKtDS3Yt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C97606A326;
	Fri,  6 Nov 2026 15:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C97606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=rFGnRtO/;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=GKtDS3Yt
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6CweYm3855554;
	Fri, 6 Nov 2026 09:09:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=xD9aRM6CFL2OMib+y/X4yEuXauAXDI8a6ZcKH1PvJXI=; b=
	rFGnRtO/oYQ9Eli8xkH9P6C+cLw42akX4yIV2Am/JUp3CyRN4MUe8PecK634Wt1C
	hymmNoKaUtj5mHE8yQOyQZC4N8Dvmh4g8eVB5o5ls78/Hx/2rNkabt2Ht1hLGqyv
	ylCnBffRrKcgrfEwYuYb/vDlQLSoIVpt3dHXKV1yt9Ckov8xTYGwPx1p6UyAY/s5
	MotcUbWFjR78rapwzGU1wBQ3GQo/zMdiacrPJzxLiNaWTjyoQ9+FZcpHOQK695ZO
	cLWgNfp6l3j/hKhc5kWlJW4pz1etjWxUDe5xVh2mI3ZtMQLo8iIv4ZQK8v5PpLD8
	9QpkaiPjQeEAsK3LtVE9ag==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022113.outbound.protection.outlook.com [52.101.48.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3rb0xgu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 09:09:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy3PPomY9YnGNQyoyPDi0ucjBGci9xgJ3uhkOkhT8jq2RlhpOj6+XStZ+Q2lRXBm7ifKHgIZPvNsqc81sKu285RD5o+oSkZwtz1m3cvz3eLLZF7nxbR6pdHyNwMufiu4I8YoETDaJKWZCOXlbiav+JnWjVt1XWFTYvDShDCHHOr/bIzijAmZ0xce4NtMz2HI6qzUqFwQYK2xApiiVb5c0Sbhx/+48OUkHq2qq45a340igMnfc8rYQLH41t5689ycJoPwpRhEbfjJ6eBKJ2aWTozH5X7DZem6D2pWwjPWXdtTjtZ1UnK/cyJYD1WsUhmxBA17S791Q4mtEYvdyMC3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xD9aRM6CFL2OMib+y/X4yEuXauAXDI8a6ZcKH1PvJXI=;
 b=c9RwfwtQuCctxKoyXhpEkj12NdswY5Lya/Q294fpu3JzLvUv1OonD+zuvj9eJxR4/MJq3XufP9+r9MoV29V3d0k0NHEXOXeZaAbWJCKa+CMqZFYXE99DRlmQgAGr3cuDN7P6m2ZuEK4xHxytryItIZw8FXnZwQ7qJ6JnVlzs4eKbcCUv3HZp1eE78uJuaozG9nfPymEf/rkm8DrQEXsghDolq+IV9r8hmCxhFTSx4cpiNPqmTgtDZI8FSrIdyUOn8D9K5AvM+A5I7tEEorTewoDfMg9cFX34YKc0pFyjVWh52uEE5TYqHYbpHxzYzSOuILR0t9FMHtFXz+f16hZYrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xD9aRM6CFL2OMib+y/X4yEuXauAXDI8a6ZcKH1PvJXI=;
 b=GKtDS3YtGXzX0mq4ay26CgMnPuJiGbLd3ftqr36hNbPI5RWhiiYpux3KJgwhhxZn4kAbEFtOuKvBU/4BDgDKas5YCQQ6wcpEHnYzuf030pX/OOILKHV6KMk1ZS4wbKXEthhcuFO3IQoXcXx0IWSQ8EXoDy5G3q2CdAYsdBedw7k=
Received: from BN9PR03CA0691.namprd03.prod.outlook.com (2603:10b6:408:ef::6)
 by DM6PR19MB4327.namprd19.prod.outlook.com (2603:10b6:5:2b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 15:09:31 +0000
Received: from BN2PEPF0000A891.namprd04.prod.outlook.com
 (2603:10b6:408:ef:cafe::74) by BN9PR03CA0691.outlook.office365.com
 (2603:10b6:408:ef::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 15:09:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A891.mail.protection.outlook.com (10.167.248.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 15:09:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AC13940654F;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 903F9822563;
	Fri,  6 Nov 2026 15:09:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 3/3] ASoC: SDCA: Add port constraints into sdca_asoc_set_constraints()
Date: Fri,  6 Nov 2026 15:09:26 +0000
Message-ID: <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A891:EE_|DM6PR19MB4327:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5bb230cd-418f-40a0-3e42-08df3c17f556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|23010399003|10067099003|22082099003|18002099003|16102099003|3023799007|56012099006|11063799006|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261102130727099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	nlHABqmICXUKXgChtLpxpcB7QaiDjc8I/BvsQ0+ZhiRx/4MGbcFG424srsesd0KwEhrlaMFY9nubq5WZ0qntb/mAJZByWgOfVLLuvrjoHksXmvWUsnV9+NyTppqQYiLHHq56VOBpw2NLJ3SKO5Q3BshuCr6FqADDaMJqstrHbdyZsWW7xDCln3rG3QodxUtw7Qy61i1wis6vwrBeCusiMJegwZNFCH8vSst65QGlcb6o8rUkLUxBh01T2GMepbUm5p/GZSfJhipt86GQepRmremPCjT6eQTGp8ZQwRXhJVaNBD6LbaLItHwr7z9m/9qSJeLrsr/i/LS70rqgwipzMnMl+Dzp6kbE8B1aQRCgBqgIYFIrc9IlefVFGGvEehUmS0DJDFRujuU4e3k3uf5yZuNWPPyJ33cUfyIwBKKz6Y543Bp2e4cPksnD2nhkD78eO87aEdo8/NJ2SU/UHclSpgepXZ8kmCxZiE1lqjiUUZ70ev9C/witxCj9XvOmT432uzxOg2cXBVbCDb8HpIfhU9Dkiw5gctqQ47xfEGE3qHo+5D7+CBpPjeQauEfVprjF1IoA5mu/f9YHyVlv7tbzQIiIqUtRvlZ9/V9DKIpBZ0n4lid8aZeiwDHDxsWkrIRq9b5m0eQZ1jNzEbgpDv59ATE2vG9wa5YtjDcRltLd+MPtD40xZlCnKp2JHild9aIQMJJgPu9GOI1kttkFhuXBag==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(23010399003)(10067099003)(22082099003)(18002099003)(16102099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261102130727099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nVXJUKorc/V40Tm1l1ZHLWpwlxMeiavqCEIPMSAzqz85QOHeLCfq9YzPaDP5lmLJ+L6s7eQPwt5YkkAxTYvJvDQSuOE+MWMvTaDFIMuk72w6SGBjhQj57bTncwmOzgtk0vbDsjqdW8NO/8pSIKL6UzA2Pk9zEEoA7slNFTMtnJwvhihGc4gp12/iiTbhQ4tmax7qVN2hGN001YIMLepcECgM06oWNud5t27pyno9JBH0d76UQ4Aa8p7R+9QsWaBJ2ikmKcFkN0yidx4WVlJ3NWdKL3tcW57ADr++Sd3oHXIstw7pAwWlGWvJv0qtzj29zYqqtCULRqqyi0syiRkYXlUIKcAvcPJoBBSdBLnB7Hhu2zvqFXcCUJoACm/c0vLTfDPIXTSe6y+pZzrz6xIZkNGntj/W3taDHlgEPX64t3LBtdcbsCLs/cnnxTweIPpp
X-Exchange-RoutingPolicyChecked:
	cp1C+aUZbEg7IXEY19QqIqSXcsMacKz433YS9iYJS07zwIIAjD9UfD8q/9z9Gx3ayiHa8Ov1zr5Wy9KYma/e1/Rt/OLCNvG/p3O9eNZ9+Uf0AdQWTVGOyrOeLIOVZeMczJD0D5zOVAtZ3URNpeHSR0aNshqsncAFj+tazJFBeneFHKUghuj2edgTlqT2ujAVrsS2X4tPNV8baSvLYzP8I90QmJ/smfAgCHK28cQ4MxbeYfMvPyzJag938OE8a3nj4RumbaRMdSy7edI6eqJgg558VcY2T4/Oqx3eVrezW82U9XJKhM+x7ncMCgxLJ/1jEzBN1PK6JZ6j8FEbHHudSA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:09:30.5745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb230cd-418f-40a0-3e42-08df3c17f556
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A891.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4327
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6aededaf cx=c_pps
 a=Q5kcJUpSFGSGPQA8zxlsBw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=0CIt3v3Qbn6U-oxLpCMA:9
X-Proofpoint-GUID: Hq5lvcmwwX6TMiE9Gutbt9wrht0oP28k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfX3Q28wLZsgN6n
 fz/DYrWTnDYBJ1u5w/MwZ+cy+/F+4Q9hWNB0P7gRYiR7J06m7b7Yh6C4sGnudurv9W/+xw7O5M5
 xdTWBcQZ3clLQsSsyQRDjrW6imQHAtJ7uJ8D/ygqyC6vzobRf8vYeIB++izfyn7PfpxnE3DELrc
 /icTEPnR3eSIhmH7dAG1FSoYxYpu4ZAH1zFFLlvfntKgaEb5pGpxPOh4xndDuqTn8JKl0H+31qE
 M+9+II8YuyYMqFlNgksNWW6g1R7RLVJhkfIUudjlzW+8amZ0rZEjiczdA9/Am8vRR90M5irSCUB
 TcfwmZM65il83bqJ9lYv8dtvHiFVYgcWNHdJk/zF56G5JSji0gr+a9ne2Roa5znBN27h/YyQ8sf
 xjYZmUNH4ZUS/D4jru3tXhvNYzlJngksJkqDhkilLaXKBx6r8W+UJJHmqbjkFCSUTksRmohNLjn
 s1l/bEohtNHlJOFs9tg==
X-Proofpoint-ORIG-GUID: Hq5lvcmwwX6TMiE9Gutbt9wrht0oP28k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MCBTYWx0ZWRfX/esZo9xbJGR0
 au4DA7xUwM1zFA08X8WR/XDlpkGKAX0DrAS/nEzmrSdZeYbIo1MbEf0POr0QHB+n8KNEFBGDq+0
 7vTMF/gCz6x95i1KMcgMy+HhwDY8ytw=
X-Proofpoint-Spam-Reason: safe

Currently the SDCA code constrains the params based on the DisCo for
the SDCA Terminal used. However, it ignores the properties of the
SoundWire port, which in some cases may further constrain the allowed
params. Add additional constraints to apply these restrictions.

Some minor additional refactoring is required since port constraints
should be applied for both Input and Output Terminals, whereas
currently Cluster constraints are only handled for Input Terminals.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Change since v1:
 - Use BIT macro where appropriate
 - Correct GENMASK usage
 - Add missing array indexing
 - Correct channel masking, SDCA uses indexes not a count of channels
 - Reorder the priority of SDCA properties, it makes sense to
   consistently move from most specific to least specific
 - Handle the case of the word length not being specified, as it is
   optional the SDCA specification
 - Add a static_assert to check the constraint array is large enough for
   the word length mask
 - Some knock on changes from the new first patch in the series

 include/sound/sdca_asoc.h            |   4 +-
 sound/soc/sdca/sdca_asoc.c           | 108 +++++++++++++++++++++++----
 sound/soc/sdca/sdca_class_function.c |   3 +-
 3 files changed, 100 insertions(+), 15 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index 236a441ec9d89..26740f69f2bee 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -12,6 +12,7 @@
 
 struct device;
 struct regmap;
+struct sdw_slave;
 struct sdca_function_data;
 struct sdca_pde_delay;
 struct snd_ctl_elem_value;
@@ -91,7 +92,8 @@ int sdca_asoc_populate_rate_format(struct device *dev,
 
 int sdca_asoc_alloc_constraints(struct snd_soc_dai *dai);
 int sdca_asoc_free_constraints(struct snd_soc_dai *dai);
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai);
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index be1b4c0075796..d1b40c6ccae2b 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -13,11 +13,13 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/device.h>
+#include <linux/limits.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/string_helpers.h>
 #include <linux/types.h>
@@ -1435,6 +1437,7 @@ int sdca_asoc_populate_component(struct device *dev,
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
 
 struct sdca_asoc_constraints {
+	struct snd_pcm_hw_constraint_list width;
 	struct snd_pcm_hw_constraint_list channels;
 };
 
@@ -1507,9 +1510,57 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
 	return 0;
 }
 
+static int get_port_masks(struct sdw_slave *sdw, unsigned int port,
+			  struct snd_pcm_substream *substream,
+			  unsigned int *word_mask, unsigned int *ch_mask)
+{
+	struct sdw_dpn_prop *prop;
+	unsigned int nprop;
+	int i, j;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		prop = sdw->prop.sink_dpn_prop;
+		nprop = hweight32(sdw->prop.sink_ports);
+	} else {
+		prop = sdw->prop.src_dpn_prop;
+		nprop = hweight32(sdw->prop.source_ports);
+	}
+
+	*word_mask = 0;
+	*ch_mask = 0;
+
+	for (i = 0; i < nprop; i++) {
+		if (prop[i].num != port)
+			continue;
+
+		if (prop[i].num_words) {
+			for (j = 0; j < prop[i].num_words; j++)
+				*word_mask |= BIT(prop[i].words[j] - 1);
+		} else {
+			*word_mask = GENMASK(MIN(31, prop[i].max_word - 1),
+					     MAX(1, prop[i].min_word) - 1);
+		}
+
+		/* Only handle the number of channels for constraints. */
+		if (prop[i].num_ch_combinations) {
+			for (j = 0; j < prop[i].num_ch_combinations; j++)
+				*ch_mask |= BIT(hweight32(prop[i].ch_combinations[j]) - 1);
+		} else if (prop[i].num_channels) {
+			*ch_mask = GENMASK(prop[i].num_channels - 1, 0);
+		} else {
+			*ch_mask = GENMASK(prop[i].max_ch - prop[i].min_ch, 0);
+		}
+
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 /**
  * sdca_asoc_set_constraints - constrain channels available on a DAI
  * @dev: Pointer to the device, used for error messages.
+ * @sdw: Pointer to the SoundWire peripheral device.
  * @regmap: Pointer to the Function register map.
  * @function: Pointer to the Function information.
  * @substream: Pointer to the PCM substream.
@@ -1519,42 +1570,73 @@ static int get_cluster_mask(struct device *dev, struct sdca_function_data *funct
  *
  * Return: Returns zero on success, and a negative error code on failure.
  */
-int sdca_asoc_set_constraints(struct device *dev, struct regmap *regmap,
+int sdca_asoc_set_constraints(struct device *dev, struct sdw_slave *sdw,
+			      struct regmap *regmap,
 			      struct sdca_function_data *function,
 			      struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
-	static const unsigned int channel_list[] = {
+	static const unsigned int constraint_list[] = {
 		 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
 		17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
 	};
 	struct sdca_asoc_constraints *constraints = snd_soc_dai_to_priv(dai);
 	struct sdca_entity *entity = &function->entities[dai->id];
+	unsigned int port_ch_mask, port_width_mask;
 	unsigned int cluster_ch_mask;
+	int port;
 	int ret;
 
-	static_assert(ARRAY_SIZE(channel_list) == SDCA_MAX_CHANNEL_COUNT);
+	static_assert(ARRAY_SIZE(constraint_list) <= sizeof(port_width_mask) * BITS_PER_BYTE);
+	static_assert(ARRAY_SIZE(constraint_list) == SDCA_MAX_CHANNEL_COUNT);
 	static_assert(sizeof(cluster_ch_mask) * BITS_PER_BYTE >= SDCA_MAX_CHANNEL_COUNT);
 
-	if (entity->type != SDCA_ENTITY_TYPE_IT)
-		return 0;
+	/* FIXME: Currently only a single unshared port is supported */
+	port = sdca_asoc_get_port(dev, regmap, function, dai);
+	if (port < 0)
+		return port;
 
-	ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
-	if (ret)
+	ret = get_port_masks(sdw, port, substream, &port_width_mask, &port_ch_mask);
+	if (ret < 0) {
+		dev_err(dev, "%s: no properties for port %d\n", entity->label, port);
 		return ret;
+	}
+
+	/* FIXME: OTs should inherit cluster information */
+	if (entity->type == SDCA_ENTITY_TYPE_IT) {
+		ret = get_cluster_mask(dev, function, entity, &cluster_ch_mask);
+		if (ret)
+			return ret;
+	} else {
+		cluster_ch_mask = UINT_MAX;
+	}
+
+	constraints->channels.count = ARRAY_SIZE(constraint_list);
+	constraints->channels.list = constraint_list;
+	constraints->channels.mask = cluster_ch_mask & port_ch_mask;
 
-	dev_dbg(dev, "%s: set channel constraint mask: %#x\n",
-		entity->label, cluster_ch_mask);
+	constraints->width.count = ARRAY_SIZE(constraint_list);
+	constraints->width.list = constraint_list;
+	constraints->width.mask = port_width_mask;
 
-	constraints->channels.count = ARRAY_SIZE(channel_list);
-	constraints->channels.list = channel_list;
-	constraints->channels.mask = cluster_ch_mask;
+	dev_dbg(dev, "%s: set constraint masks, channel: %#x, width: %#x\n",
+		entity->label, constraints->channels.mask, constraints->width.mask);
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_CHANNELS,
 					 &constraints->channels);
 	if (ret) {
-		dev_err(dev, "%s: failed to add constraint: %d\n", entity->label, ret);
+		dev_err(dev, "%s: failed to add channel constraint: %d\n",
+			entity->label, ret);
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+					 &constraints->width);
+	if (ret) {
+		dev_err(dev, "%s: failed to add word constraint: %d\n",
+			entity->label, ret);
 		return ret;
 	}
 
diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 6406c9d0f6119..abccc63640c68 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -121,8 +121,9 @@ static int class_function_startup(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
+	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
 
-	return sdca_asoc_set_constraints(drv->dev, drv->regmap, drv->function,
+	return sdca_asoc_set_constraints(drv->dev, sdw, drv->regmap, drv->function,
 					 substream, dai);
 }
 
-- 
2.47.3

