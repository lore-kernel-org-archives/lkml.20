Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982934;
	b=SjVCkY/p0shFH1LApvRSkQh0trzEve3n4PdhO3cOCAqw3J9hazZixNj33VccMq2QDKqn
	 5nBdT6UWyUZDR0TtDOx7rUvqH3JpLTlwHCmbORAw3apHmk2zVZiHFxdO5hMv7mzb9nbed
	 qyHveCueMCqZJKEwDwTAsSrp0nBIAolbOw55IDaSbuHmk0xzIwbnCly+Enm9wOMLGAPfy
	 n+IPCxeVZX4DsRMRFU7sOrvhKsLWvw1LzHQTctydCQEok7a47JpjFTg1oDPvyqumcKh+W
	 uv9R9CsMvrJmik5hA0a50oUlU2idONNEyq7Cog1HQ9UtGmyQIhcnSEeemfl0bqivUog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982934;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=iHN8GXKgFACKykBMdE902xgD4fmPFhJo2PcAS0f75OI=;
	b=ROwIlS+gnaRWih322teewdMiJ5HaZOLZXJX6lu8NiyeC6zpNo7hAwzzLKNN59MwNN4iA
	 Jzwv1bCkaIBFjDTZKkmoeDy94HBgZRYTjKZuFcDDKkQRC4apB+ycq7pjTqYbEDXLnlc4t
	 ttmDL7Bcof3gybOOuIcOPGLdM40IgGq+DnhJOfp90NlcMQdhLj3d8JmLicMJ1QMJ/m46y
	 GrScGPLSc/k3ezuwIMwI2stcXNMoSqQtI2ENex6gSa3awl0FlL0LqR2/xqIYBJBf2BNlT
	 wMQm3i6BYNKHoU4JleakrRCSG1gw8IGXhfnUPUF2fLcFA7dMHZj4j4r2PdsKQ0UwgyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=cdJD6MRK;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=HU7HlwfT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8BC606A333;
	Fri,  6 Nov 2026 16:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8BC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=cdJD6MRK;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=HU7HlwfT
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6G2N234159532;
	Fri, 6 Nov 2026 10:35:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=iHN8GXKgFACKykBMdE
	902xgD4fmPFhJo2PcAS0f75OI=; b=cdJD6MRKKSLfZizVmv1c3LbAUu8u0aoZOp
	6PbK2D4j4pKIT7BFKia7yvp5+wyC/OY8GHPP3NjtZWsgCOjooYuAKP0uyHi19Ouf
	ibATUEGVwQwne/qMEpgLU9XdUFL8p2R2BJN4lYuRBBqk3gjcm6DgLn/nFnVdgiPX
	RxNRYRUY46goxRSX3uvqFx/850yTBA4KeGpVKSAL+lZ2qg2NRnnu1Zlz6G4/uM7I
	NVs+hvrzaTCjOtfyUPOUDaUj2KFvb+9czgG7KHUwi9sG6YrqLotDqt7iQASztuUJ
	a52gdS9zAym36RdHK/TqXo/g2i8lqgtk1v71lXN2SypYnFhEKtSg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021090.outbound.protection.outlook.com [52.101.62.90])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hs3rb1481-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 06 Nov 2026 10:35:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBcq/w2N0maWibtppRio030qa0b4OsnOcnPHzPERFRuFLGzY/Es/OheUWqYaizaApmhTkPEcTjlKewH1ptp1bqvGL/Jm8SiqR5ElLD9IT5GVveAsZ60ycM/AhKTySURVxLzZYmyrFyHzP5EBO/oDba3ASt3/fuLouCzZRu4LFAd+cK1HjwmOTk6xP0AS2HH4iTFtMaMkiiQQs9Qo3bPdKJQvmRKS4DUcyExpF6KUPeOu6/XpSxTbMfarkCFmfQ7YN4mOdmn3Wot2WFVB5IjMfeqhmZobSMNrXoUkkvaE6KjLQbo+lMJnkz5j72c3F5RSA2YqHY4JNnGDHOWFjESn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHN8GXKgFACKykBMdE902xgD4fmPFhJo2PcAS0f75OI=;
 b=s94mVVb70f380WhuiRVKUyLX7PeqRoPXqMhKKLycGBWdBcONIwVgcLSVb3rrI4Ot8FMhMyG6HFHTtPRk5+OkzrJKz2upTRkzpP0orKnq38R5UNt/seysJA7b7hO4gkDHaiMU/+8Jmiy7MFBli9QlowH56e7sqXvGh8HT8y/M5lHODdXdE3S86ONplOch8AxZ0Dez1D5fC/S11d/XX0lQ9zOxKNY7SshDBnTGsJQJqPC/iBClnzUQLztMfuZYc2vp5n3OYIwIcdmJh/zo5x7H1wA88lanpl2olsT6lxodcxZlZtD8zheym5DMFXCVLj7ufVp0Tmr5ZzYW9EudKfDJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHN8GXKgFACKykBMdE902xgD4fmPFhJo2PcAS0f75OI=;
 b=HU7HlwfTCzYl1N87cV19YMO7va+9VWftfLF8lvGL4Seyt4yTapVo+r7g+8lJF+1lnF0HyPImV95c1pk8xs8y9TyCupxTuTBrk84IKH2GKfOvt0wOZOwMIW4BHwlG6wxCdE2oHgF4XQUBmSmdfjPno+MumpauB1cchPtzIkkujyc=
Received: from CH2PR20CA0010.namprd20.prod.outlook.com (2603:10b6:610:58::20)
 by DS0PR19MB588744.namprd19.prod.outlook.com (2603:10b6:8:42f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:35:04 +0000
Received: from BN1PEPF00018547.namprd05.prod.outlook.com
 (2603:10b6:610:58:cafe::6e) by CH2PR20CA0010.outlook.office365.com
 (2603:10b6:610:58::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:35:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00018547.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 16:35:03 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CCC2A40654B;
	Fri,  6 Nov 2026 16:35:02 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B418882026C;
	Fri,  6 Nov 2026 16:35:02 +0000 (UTC)
Date: Fri, 6 Nov 2026 16:35:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 3/3] ASoC: SDCA: Add port constraints into
 sdca_asoc_set_constraints()
Message-ID: <au4BtWqV+5FKGQv+@opensource.cirrus.com>
References: <20261106150926.2587108-1-ckeepax@opensource.cirrus.com>
 <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
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
In-Reply-To: <20261106150926.2587108-4-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018547:EE_|DS0PR19MB588744:EE_
X-MS-Office365-Filtering-Correlation-Id: e0044c9a-d4fd-4f35-49c6-08df3c23e8eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|82310400026|36860700016|4143699003|11063799006|56012099006|261022105027099003|261021121427099003|261009223027099003|261022075727099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|16102099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	csLFmNSZpPpPONXMVj1CWz4EscmiagQl3cYqctjrpGivyedlfahx1Ss9HxCoev3UtOXwrJuTDHS01nEXYJa0vE6d6eKNLaPec03rwqghUBf1x+fgNQ5xiiL9RL+RNHPF1TgaFYEVSytwHwTGP7vGCea1j2rTm4DpVYI13cL1FO/icI2Ow1gtSx+7PjcfDfQMBI25R48QI1TgXp4Ffb1uLJbIvMEhFPcw5MYoRvcFJzQkkR7aHs2w1vlDy6wNXumB7kTQus/WYE7qpmuf7XV6ZvsoarPnLYc3VaDmtO52F7KS8i5eBQM+Ekn6T4FXJT46CPafiG6SY89z+NUe0bt67UN+OoEkt3tj28RBRoKLvylKOEbHRwX8EpzOjAeoJ4b8kzXGJc/lqfCNMK5BeDl3p8hubZjCmttiCe1BD5iawmBqzljGdAWWsTOKkVXWRYw+5lwy0agnFsr3q0u6/vT2dU/ULyMkBA44zqCENyqA/ZLvGEakvyn82MCtTpxoWt+S3dI82ITyrv59urnthXaxUNOTz681xK0UQ1blPc+LJOuToLvwQPLQ/SoTAIhuiuJItqUEHZFXKrqxKPJy7P5I6uzv9P6yzHOQBhz2tQFiwZx202+Sw+oB7QqaYyoKQ5noS86FwFMWWka0iae5BOogDwfjPFcH7s1NtYtJh2a3QkPQdfDLpyV4tKo+o+3VGgmE8pJ792Kkb1OxPpMgA3eYkQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(82310400026)(36860700016)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(16102099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UezJK/xGKzdRL8XtHaGuuZ2zJw4bGb53e4baK4DawPxQIqvWe6s0ywRh4VPdHfZT5K/Ikd08tROHYGUCd4774eojSPnwagI1yzfJky3Llj28Xq2OIfwQvXOUoknuJ2wysgN4A+62/7sC5NbKCHTzKDZ2Y3cFUbkRi+oyBX4Nwl9wlhd6TpOXGcxGI59m49Ufzp46FpkCs67l1406mOZK+AhYA9e597xYIkjuNeH0bgWVK4+y/KueSjEsIsxyPXE8V7QY8WHXzchjCE+GGIlWjTpUFznv9Zypc6Vt47hEYSnzsctmtPM/jGhLCvNWGkumjIePwm8CD3e1xoCISvAnrTIfQztklbtdJIz/836ALSnsxPCajc+TIiDLHiGdZCJNpokuEEIgPdIXaB4pm9yRtly7MQXwRi+DuxwWXRzjoYTHHEV/KwOZuwGV/RiCcMGB
X-Exchange-RoutingPolicyChecked:
	1bgq4K1lxJ8FnxBJU3sD1ROV+hXw6gvUTZEkVq210OCjKpKkLghry+IygIC1AZIVQg8B/4cLpJqnmcXwJT8WnRYB3IQ7gFbcPkxcBlHTp+1uksdIMr8mRc77yxkQ8H1uZz3ju8Ea7yxrhvpgChgTvj5YW8JoDakV0ABolfVvy5cpKKTWyBu43q5rhsLefle07dmQoYn/g8mz65M4jMhMIGEKzQSbjlFleyaOFottT/sijDycVFtuSv7xrYNKq0FP22BI00TAy9ecIWX3GMRw9klZqXxjpAyW0eVgvb0YfM7q9MP3F9eIqqR8mHKQz6eWDbf1BLS202sziQO9OUpKkQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:35:03.7014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0044c9a-d4fd-4f35-49c6-08df3c23e8eb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00018547.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB588744
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6aee01cf cx=c_pps
 a=pMj1vk9pV3S8wB1vsTRRtw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=DCMt6d8Whoa9EdSmCvkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: zQGqI6BVZ0Ny9_gpaN6NPebiZt5nkpEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2NSBTYWx0ZWRfX8oF15eHAIK7+
 g4ibjB6p+01TiYXAxvzCcslkYl8gSKnOlnEJqiNeXWr0tr4+KvH9r/6OUw8BA/xpj47jFQPQ3Mk
 rZW5duQDK0S1F96u7kWW+9Kz2KBzGrT5SLyHa7xSh4CnLkzf+O7oUQlWAYjD1yWKBnAunI8lYh7
 BmYX0nrhF98vuCYpHrAkhsMOZCGGppVYOm/gTN0ZeH+kcMtnp4LCytPw5KBB4wd8j5i/9D4uos9
 O4eLfei+ClFjobDriV9CwE4p1vTqI7CA4MHgIPcPK9naR2qQ+e9nl6TlbWTleALVBWOzknAXxaD
 YUSUncy8jbPQKLRPqx+lnOeG1nZOJOiIAiWBxD04mSg1r2M9zEfDctv6K5g7lrnzUObSW/eU1c4
 nbBeDxtiqvWmkU8L+EenutpzAm+YGS/34iZgT6SDkaEYjkmchRAAWH6A3LIaRUzajkeQ74foZIF
 pB2JL9TIHNK2BGTsY9w==
X-Proofpoint-ORIG-GUID: zQGqI6BVZ0Ny9_gpaN6NPebiZt5nkpEj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2NSBTYWx0ZWRfX+upQnSNE/uNY
 MZUI1pbGc0XWy8CmxA07/tR6RboGX9RWyKQe6GkpTrn+QJZUlR0KTc+uT0kKVjujvkiNG5oqsJd
 RPFtVFZQVUd0S6daN4aVjRvhy+r6LnY=
X-Proofpoint-Spam-Reason: safe

On Fri, Nov 06, 2026 at 03:09:26PM +0000, Charles Keepax wrote:
> Currently the SDCA code constrains the params based on the DisCo for
> the SDCA Terminal used. However, it ignores the properties of the
> SoundWire port, which in some cases may further constrain the allowed
> params. Add additional constraints to apply these restrictions.
> 
> Some minor additional refactoring is required since port constraints
> should be applied for both Input and Output Terminals, whereas
> currently Cluster constraints are only handled for Input Terminals.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> +	constraints->channels.count = ARRAY_SIZE(constraint_list);
> +	constraints->channels.list = constraint_list;
> +	constraints->channels.mask = cluster_ch_mask & port_ch_mask;

Sashiko is still concerned about if these two masks don't
overlap, resulting in a mask of 0 which allows all the options. I
think that seems valid so will add a check to fail here if there
is no overlap.

> +	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
> +					 &constraints->width);

Sashiko is also concerned that SAMPLE_BITS is actually the
physical width (ie. memory size) of the sample which feels
sub-optimally named but does look like it checks out. So I
think we have to switch this to using HW_PARAM_FORMAT, but
will think it over.

Will do a spin for these updates early next week, unless I
hear any more by then.

Thanks,
Charles
