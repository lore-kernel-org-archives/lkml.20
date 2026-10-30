Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380290;
	b=aaosOlIVrUbT5ozO2QxbfHmsaELOXhZ0l5cdAFfHEfI6ByD1ML+L90GOLPLKuWKd+HUs
	 qS9UoG1O8Q5mACpZukQzCYzgjy5rVdn6dr1Y3ELoh7OtTXogSUznXDH+R1pdRxymreWCV
	 vTtJFUnmep97PL7NKk4c5bS5CD2GUU2AJFox5Smc6vxQ57ME+ArnBHGDCfBWHdtJB8JND
	 hJEgZAznXQnd3pwn7emWrexAW9S4kSt4FjR3y2BCEOd8WhE+K1e9NSqyzwA/it7djO6hm
	 bdJFzUc0Q1qJ3/GDhb4BhmTtEUy0eqeUxjMkRQBiYzjJ9lOW8dBR7l9k/isb7K0Qp+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380290;
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
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=+hr79/twAgodgiK/WPlRNUy8W+XeeMzbKtX9Kn2ddVU=;
	b=qaLz/HGykWMcrG4EmEw0Lrza6WvQ4BsnvWz8jXHvTzFgSv+QqokM5dPb0kV9aZFYUOw4
	 CaEZGm9BbZw5zlrjyfQrzEY+zHDSk1y2BfioQ1hqAW9ebFCNhtUX29MwCwLu9XmIMwyiF
	 y+ZgIDg/YZNGEnQtGJK3M+So1tCk5OejJnZD1TfyYLU35MDuvKTZL0QJTnbECeqF4n432
	 l21sUh8WeLg/v9YJEI6MFH4aMKeYgZB0iQbOA9EOaHsBv/0Xto6SLyOcaISRs/RHtJqv4
	 QuIedY4qMfawmelrU6815KcQABKsZE4cXmvaZxuL6paViVWKTfVYVnw/XU5CwTILnTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bJ9+cG02;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=A6x2pFCt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3A606A324;
	Fri, 30 Oct 2026 17:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B3A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=bJ9+cG02;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=A6x2pFCt
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UGKHps549884;
	Fri, 30 Oct 2026 12:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+hr79/twAgodgiK/WPlRNUy8W+XeeMzbKtX9Kn2ddVU=; b=
	bJ9+cG02mMaix8+GMGMBSZ257amBVcJL2Ep8FL6BvBipaIc0L0/SESkMjnMd9bnI
	RnokRImpz6BPCq+sBqOyPxz7jBQj1PRtuEeZ3S6VNb3lwOMmWPzDEdGV13FDJ9wT
	3P8EHgYwHQyO1foYZCBgQ3DUF7PSsmIAn/bo63AoFgwf6tXGJ2N5j+CvDNJF6DLU
	4KnnRDnb41wT0/7unxcvBpH+51Me1kP+OVJgtBsizNhbei+zYNENEa8gDRRmOjoV
	r4V9771yu6PGZt/JTA4oD+vcqFyP4sWo2o13uX2Hy0CD4D+d5a3szXZuvkWcJZXp
	pEsUrcFNHo82B8QXYc8gyA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022111.outbound.protection.outlook.com [40.107.209.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hme6ns4wx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 12:11:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl41OHc/0EOkV6qYVYQA/WiIgyoZ7HLfTI5voKoNL2yTD+ptK0m42GDVden3c9cObREVmVSdWmNISzjnhd+XVXKux30p7tLEawXS6p180qNViHmAUAXEv70xSyzGsT9XrDQWPl7YK7aKN58LgEcRhkLHCwwrhQUmLZVa5acQw6qFRxes80E9wki4v2Oyid57SBCCougbD9BnIKggcMHOKq8SJY1dp3J88OroK4YiiEfoiek2K1x/JUEPC6AqVMATn9C9aPJys7OHHKsxKAn1GPigZ2lRv4A1cCLn24SUCdfe+5HbWFttSbVKOfBe5AeTMKZJZqHNTABQTkI0nzcAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hr79/twAgodgiK/WPlRNUy8W+XeeMzbKtX9Kn2ddVU=;
 b=Fvwbk6JU22vUrXqlcrG60EFELa4XPPWY5wkRsSP0A0yl2hp9ZmrD9XJOG0h/MZHk//dzuFzJAwB63NFqIsji63deuOR5k/iK95XY26ahIZonXJ3kw+9iQcSGfDLhalu+RL5ZL/HjZd7KVC5x7ka7RJVXT8jSN3P7RFSLaSruCpDowZ5CQAM6cS2/z98sRhNAi3EEy1rjcFsJFWq6BMzR4komu8ut6IB3ocNZewjjq+xNycz/9ledMZ9EHY/T6g42Z0FQoFWO06PFohNT/wJQliDfyv8CKLMSASsLg5dLtN0s4OElaKPKV1b0LpQeKXdBSr70nAb8aH2w0TwqLtGGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hr79/twAgodgiK/WPlRNUy8W+XeeMzbKtX9Kn2ddVU=;
 b=A6x2pFCtZMTUCwBaZEhhoQq1RQsG99sWxRqqN0fgG7k9rwkVOUGDlVW6KBv9+BgI8Jh6KqtYSC0TXdqU9L9j/6XRvVLIcrW9Da30SyvvEAGvmKZxm2lFpS4nqJdQvt4U/qKWOLpZTaTe8DZ5kazVMQU8y78bC/eq1li7C08mEh0=
Received: from SJ0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:a03:33b::17)
 by CY8PR19MB7009.namprd19.prod.outlook.com (2603:10b6:930:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 17:11:04 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::6e) by SJ0PR05CA0012.outlook.office365.com
 (2603:10b6:a03:33b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.3 via Frontend Transport; Fri, 30
 Oct 2026 17:11:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 17:11:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C921240654E;
	Fri, 30 Oct 2026 17:11:01 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9A9BA822561;
	Fri, 30 Oct 2026 17:11:01 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ASoC: cs35l41: Use common wait_for_boot and reset_and_boot apis
Date: Fri, 30 Oct 2026 17:10:15 +0000
Message-ID: <20261030171045.469944-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
References: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|CY8PR19MB7009:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 400bc02b-865e-4f8c-c6f5-08df36a8c730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|61400799027|6133799003|22082099003|18002099003|16102099003|56012099006|11063799006|261028144727099003|261026130827099003|10067099003|261021130227099003|261021123027099003|261021121427099003|261021135927099003|261022115727099003|261022113327099003|261026121527099003|261022075727099003|261022105027099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	wvHJdLODpUjMWU6EIeZvnEwX02FkUD4I4hPgWBKSBg0zODQXGpxCQ08i4lTLsXESooBsgFUfMziksr3gMw6C46hCsAs4RNN3+R6rlsttPThNSvzBXo76OqD+yXnPNJByZWjb+aapyGut2s8n2fUZU1dleOmM1TUNaQ0oaNlPaM6hptmeDGjtTD/hOqndLy49XbTaDs9ZNHLTa3SOX7sDC0x1fpHp3AurphcrlpoWmJFEI848dvsDP9oqPYkEg3fdqbDMLMcR62YH4aQgWh4twA6XH46pIk4ljSks/gC+SCxA0Etkl0jhYDDc6GGKTbEQJTqD+W/Chga9mMttyHpk10CYjFqfZVCFTW6G90X4PIaaaU/gYGIYEtYoka34DkKXuQ5CGUnGp/qQVyPMwDhIiOoF+8Zf7Y/itBB38qDT03BqRhWgVnO+PzxJQnQ9cFmqGWrshjlIQajceyN9sTtZ/mraE1dw8fl8eRhpUjsg9nLEc6oi1NM2AYka0DwxPZcANnjTDG/xK10/e+2kggJ6KkKHWi3Uk1dfcrqyGuw5yO8jPDVLSKRPyqoQ8dodvyzHd4VF2wvOpO+KpkZeCUSwLJ6B4TklHE6dZ5XunDEDDGi7D1MhA0AXKDX9c9zIYKQhe2ph99FvPtP8Ghpx7hUYAoufu3dMG/D6yBHV7XHcmb+KTlD2oc0V1qP3JqagZLLfkIRNYH4YFqZjgPn/1Fll4w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(61400799027)(6133799003)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(261028144727099003)(261026130827099003)(10067099003)(261021130227099003)(261021123027099003)(261021121427099003)(261021135927099003)(261022115727099003)(261022113327099003)(261026121527099003)(261022075727099003)(261022105027099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7eHcVwyIuVo4xdLl+oYPf1SRimryTpv5Ib+rD8qjBUZU2C00yR/RZs5ylFNov8wrCGWcNEKjIq8ANZtlDYsTShHyX/3mi6hDG1B0c5g/kyFIarl4QtipTLnA+80TE7rG9qbGw53T2CpVyMzKLJM/EflM3f+WvFAOZUjX9pSIRVzp/j3KfeNXDxcAQsUzuCSPXLZmGhYhel77WAkxbgdev/vUd2YAndwJFTguGfY3t84Rc4Bvq4hPi9ilxhsM34zQLM4iL5OhREIvIv0DmDaMfmyqz62wlBlauHWGl7ecUz6NxVUhSlkk7/dOMeIjbWr75G/TZExl+c57BTdKpjBfd0SwlPdfN9wMQiM2E5ep2MyybsY8sHlNro25S3G9PoN309Zp4lBo9yfvihwXvyc7bKmksTxj2DFWyPLE7IoKBd/RlDverph5bWnThVundGNt
X-Exchange-RoutingPolicyChecked:
	mmzaXWqA7H8OrpE6dGJvWhNrVA0E+DJHfTj/jKHrs7DPZMKEMgBb9zQClVX7KV+6nfNW/Df29jSoIUzplaEMw9PNxIO8APpLfflHT1e6tPOWpX+AcfXJu8BieyefL1h8ydXud+AnlPkI0svdypXKeeaNrSuhNvoo4j80moBbGtrjdNJYAmXl8VHCQoqhGMRAJSGlclHQH54tOEgc8xPZ9kDNqex3DN+fDIxlwx26E+crKzXjy/8C1ex/tjxKG8CpIlpqrMlERAsLaL8Z2TYspAB0qKXV1scQqQC5yXmzf/0lBiEuLm7plBBJMvooDTA3E1iZp4JegsHwBmvbsp7pVg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:11:03.1001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 400bc02b-865e-4f8c-c6f5-08df36a8c730
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7009
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX1NLA6x1YQWbd
 Uf734un8pieCCz62zjP8KEdom8w743u1MeMBSnZegy1HjfbD9QFA0nycLvXR2EOGeaucMzwUMTs
 Dyd7B9HyA5bedWsyIgG8/ISRPt+RhRE=
X-Authority-Analysis: v=2.4 cv=PdhqFShd c=1 sm=1 tr=0 ts=6ae4cfab cx=c_pps
 a=J7ZdHMUHR0uI/sEcOv84ig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=p6hE-JTL49e0YbEB3nUA:9
X-Proofpoint-ORIG-GUID: _EeFVEtn9m3oNA-ZqSqNWhaE5qZcSQeZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX1ZjDBq3a57Qn
 aY4VjrpdJctu5JV8amYQcBo7DxeVFcBq2Gae9nyMP0fpXmhwO+ixWc8+kufLNqHGhMj1tQv3i38
 EEBsCp+0FthbPmSHe83JNnEKjdj+XGq75s6oTCaGikdX5F5VHvNWnnIOr74CBssgxZovCXXv5Gv
 jQHouVVL8TdXPHDpcAbzyQTyg40nQb3/H19qCg3NJc88DYGbDLJXgpy2VspjcAeL/h1Tevh+wUI
 ylycWK0eDO8R9SEmkImhIxsxt9bt+wO5/HDVPqOFpO5A5NQL5XlIgPld/sFKq3rDq4Zj5bEjoXC
 flx6VDSgugDxAE9x3QoGOYWxdKGbds3B2CZc4yXmPlmSC99/iph7ASSzJ2nR/l70mXexd5mVOJM
 7xGj6Al23HhuRwED9d8WjgMsTmhNzsCUCJlUTamrSJzILfGXkwVlEWLrPUNmZfkjwpH0Cavfj8h
 ncwcQ5wPCaicIIVBTVQ==
X-Proofpoint-GUID: _EeFVEtn9m3oNA-ZqSqNWhaE5qZcSQeZ
X-Proofpoint-Spam-Reason: safe

Use the newly added common wait_for_boot and reset_and_boot apis on
probe.

This should prevent issues occurring if the chip is not ready on
before it starts reading and writing to it.

In addition, the driver now ensures the chip is reset using a software
reset, when calling reset_and_boot().

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index d286025183f4..0e40444a1003 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1211,7 +1211,7 @@ static int cs35l41_get_system_name(struct cs35l41_private *cs35l41)
 
 int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
 {
-	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
+	u32 regid, reg_revid, i, mtl_revid, chipid_match;
 	int irq_pol = 0;
 	int ret;
 
@@ -1260,21 +1260,9 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 
 	usleep_range(2000, 2100);
 
-	ret = regmap_read_poll_timeout(cs35l41->regmap, CS35L41_IRQ1_STATUS4,
-				       int_status, int_status & CS35L41_OTP_BOOT_DONE,
-				       1000, 100000);
-	if (ret) {
-		dev_err_probe(cs35l41->dev, ret,
-			      "Failed waiting for OTP_BOOT_DONE\n");
-		goto err;
-	}
-
-	regmap_read(cs35l41->regmap, CS35L41_IRQ1_STATUS3, &int_status);
-	if (int_status & CS35L41_OTP_BOOT_ERR) {
-		dev_err(cs35l41->dev, "OTP Boot error\n");
-		ret = -EINVAL;
+	ret = cs35l41_reset_and_boot(cs35l41->dev, cs35l41->regmap);
+	if (ret)
 		goto err;
-	}
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
 	if (ret < 0) {
-- 
2.43.0

