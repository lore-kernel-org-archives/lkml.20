Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792491523;
	b=qV4WVnczq2np5CvLFaBeZuw61IeeuHU+OosJxInxSGK5nAcP/CEaPcEO4sj+0kDqwj+W
	 9eKzlMkZhx07Gxs6lKb/dFUbsU29+toqY2B35yZdCFzah2kiBW4xkYM8aqX0uHrMPlXRq
	 FVFqBYyUIolmclRz6ttSvaiDtJ5jE/MehuGb0n0ijIPVSFGKEoE+PpCW/Okvewgsb883F
	 3/sIsxjL5j7IiB0/TMbQ4yHhhdEQuwPp0Ia1DZEkgHw8y3sPn6I3LNSVDIjWN7YRSDKrb
	 LPb+6SD8H+GMUlbNCjZU0jOVrLBNyzzr7C0ezjWYYQf8SzwzUGPxMgSKbesKLu5B2Dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491523;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Reason;
	bh=sUK3PIVSGfzFH6L++GWJ3b4b5TDyBBwNzOPcRi1VmUE=;
	b=hN/DkUMyiLTUYAUWq69GfNE4afpBu1r84AtaJa90t6Bxlhfs2rI27hHuO5BP0yVZDSeH
	 6wi6G+Pv37+M0CBttC8YZkzhy0Zw2JfpqzM6J1GIL+4IqeiLf3EfQ+xmz/2bUFXX072AO
	 iMOFXHYUOnHBiuEkKzsqdz3VnXyPG1o3/U6hucrMsfJaXXYf4lIxGKN3zAPD7y3ZW2/ux
	 tRuDdZSlYnq7DSyvQIaaVZtdEipjMpvcZLuUmfLUuiIkkbRCdwD4DxMhPsOonyLjLsJS0
	 w9ww6w5IixI5CRPSH3gfOzAvDhjeLia0AO/vlUc/MokYXvYE/7HbAUwfLQmWbIj3X1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZdQUu9g7;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=bdnkD1Cq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EAD606A31A;
	Tue, 20 Oct 2026 10:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=ZdQUu9g7;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=bdnkD1Cq
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K597543871095;
	Tue, 20 Oct 2026 05:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sUK3PIVSGfzFH6L++G
	WJ3b4b5TDyBBwNzOPcRi1VmUE=; b=ZdQUu9g7sKSCD2YXlxAFhqYX5s37rNg1UT
	XDB45JQwQapETSXHchtF7sBcScGvTnJ87hgxXNLGE30grhueymPKTP28lyXxbY3i
	pwTsdd+HQvw81hgjK/j/FzHCmyTwzt4p4GCe+6S3F1H4uP8koGqiTQklMD2/+A/9
	5qDg4Nf7IlJYTsgs4NvM40XbpAQQTBjadhFxqApqJvsR2ai/gGjgzo7H5joM1hSh
	7zY1yRSvqtIBH3vsW5UiUk2NwbX0TpsRLNITTTw9pAbr95q3Ojs1LdY83UrcY/WL
	eEwNPHEpYVYLORrC8WH+SFjeSxeWlq74G4kEE57sYtS8nMf7u1Yw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022141.outbound.protection.outlook.com [52.101.53.141])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hdw4vrn0m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 05:17:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riJKl9ruF/ZLyooNx8zu/RW0LxKfszoE6/fgMDtagAug+bteJk6j+DG4vfDfAgf0Qo9Ya0ExvHHOC5vQ6l9C1/GFclCms6jDBwfhURj+x0xET7XeklqXYKVRIlpeiBRFvFm73l4UHNYJ78UGTMEZDh/nYyeJk73RB9fUvbX70FOzIX4u8NcMETP0k46LdgwymkuTq9qhx5Gir3XP8FHuI2flkwoGYRqUuqXcp1iDOusFFSDftCZgVQkvfJEEo1JAffAKSnf/WiYMSBGWhZvjwCHCKu/hWkS+uCZZbCvVR6qqKFlSpNvdAuU2Wg85wwNBxzp0R8LkmMZCvVx910Fagw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUK3PIVSGfzFH6L++GWJ3b4b5TDyBBwNzOPcRi1VmUE=;
 b=UTpolcWipIUFBrwoUqsrdaLVjsOE+z5iqd8iC+TK6JV9Juxx5Jc1v/nRpuvXwA/RZ+d1K1Bd4dhCLerWifWUcbyk4VXFOrFQQkYwAWhg3oVz/up+dHOGkDEAqoGwaXUf3tRBIA/J/tn7qn+Fu7epbmzZjgfjBB6B8wpA1+3mui/tZmeM3B4vzBoFC2BRBqcZg65gRQZGSgynpA22tayOG2ffya0eEqUjXN+z5ylqFiy8c//K+xr8LCxmbUq75SbAC6KrzZOZ/PVGVOHSYTUTLbOBg01dCanyOyXG14o80dd4YhYrUnhocsdCW31JRNtI/XwC1okwaWceUBpZMrXyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUK3PIVSGfzFH6L++GWJ3b4b5TDyBBwNzOPcRi1VmUE=;
 b=bdnkD1CqW3k+pC6KAYkMFMisl/MV7+84mIdTavuTOxpRFgQmDh6l1FCNQv6S54qVZ2aJLaFEPECngpj9JCm396OhEjSlAKVmS5AvlxEVfigGycW+2GMvzC1dCqslyqBWyKi30hpSZyWlXDxaKtAw0DJefCO4r7pjHKHpd7V3Skw=
Received: from BN1PR10CA0015.namprd10.prod.outlook.com (2603:10b6:408:e0::20)
 by LVUPR19MB997322.namprd19.prod.outlook.com (2603:10b6:408:3a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 10:15:24 +0000
Received: from BN2PEPF0000A993.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::4) by BN1PR10CA0015.outlook.office365.com
 (2603:10b6:408:e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 10:15:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000A993.mail.protection.outlook.com (10.167.248.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Tue, 20 Oct 2026 10:15:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4F4A5406540;
	Tue, 20 Oct 2026 10:15:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3EE7082024C;
	Tue, 20 Oct 2026 10:15:21 +0000 (UTC)
Date: Tue, 20 Oct 2026 11:15:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ASoC: SDCA: class_function: mark PDM data-port
 terminals
Message-ID: <atc/OElmZHeq7SbX@opensource.cirrus.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261020073856.1177749-7-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261020073856.1177749-7-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A993:EE_|LVUPR19MB997322:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bf2d0d-7162-4369-90e8-08df2e930d68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|61400799027|23010399003|82310400026|261009223027099003|10067099003|56012099006|22082099003|16102099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TXfZlK6mxhFW2u4KX+JjvAankhg1PmYk2+/WLTMyT1ImsqXHjfrpm2ZUHUO8zwxSTsZNcJ5vft4fzRN6uiSXH9uvm9xHvugIMtAZygpcOlQfvGwbqXy48Z22Jo3tNpoTUJLOif1lV/mhxz4uBJ5GtId1OiAqr3lTba+DWeHbOcxSKMR3jMvUm9SNbXsrh6AubWczpyf8K4+4YDzHomKocNMyjEaUce/tYUw+0lEMZbQmwaqoj/UhN1dCQWbPBviqE0CrEqYD0oypvmbUUz7XK4KUVKbjndddkb+pv+PsGP7wJFPLYSH1sxP5MPdiOL0yIwgTit6NvPPs1fSECWwT7emRoBxpsgFFx6eaCWwVKC2BmoB2ntoKMiTK7LcX1LvADSmGSIUHswJZYo5FO4uVdL0Cb219fI6zvGYemAzWRHjygQvsSJgGAe2qynqqJYyJ0AdF80WLStaVBV6oeLjrThVwHXPwejd/9kg0LYktP4KC3wHMiRC0Q1pInY2MWsQNtdMIMAsNXIXWYb+3afbhTBwYhhWqmciVorKtbHCvBvFG7xZ/7mLH4N/5gBZm1KpnZZraXLWzkalSEbkakjMJ121AkqnBtNo7Of4E9Z6tv+4XOi1Fzb/0UVs5v0iIZW7E4cw4puARgdQlfQkvTYK27UyofhRYYqf8c1glHcGWVcwvKFkrPnoH5tOOEwWo0tnEviQn8fiASGGoy1Q6gFaAsg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(61400799027)(23010399003)(82310400026)(261009223027099003)(10067099003)(56012099006)(22082099003)(16102099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fqDw1mkEk1IanJ3MzhIt3hrdQMDcOY44DBEaPFw1WSnbs/rst8Tv5lIgsDRVQYcCWBi856k2X/Nv1ViSGXGcIUWk1JW6aGJcsAxEE76sn1VVycLO+pLZpOISt/KGtzXrMIMyNxh/JsLQ7eSNCeCA/s+erI9WbFeBnNIvk/hGrDhAqPvV0N4ISx14OghNX1sg9w6fqPfBv3SEwVnrHacT9n8B7VLxrQ9vz1Ifk7G5ZN3Nw4JP7xfQUAYeY3bHVhwUkMtceM1M/OOMOaD4Ak/ZllCkR795cPEGWI3TvycbYVYZN5riD3988JI+M+zRTMQ3uO+j21hhpcOZ/hBry2lr2gOd1+ebFvCNd5pLtzUe18zQsWyEmP6SLRYoVEDIfgf41lFhOcnRTGvHtedAiD6YwHyRVjAI7pXhQ57IP3EsMaiP7GioXAvl+BWPfYiwxJiT
X-Exchange-RoutingPolicyChecked:
	rH2NT8rlh0n55VIAyKmTO4EowlgUh2dgdUyD368C2CioUzJTqObFNHmLwiovf0PzW85k3wc8pNDRn8eHaNB0aVFvcxOWsdbf7R4ptjaRDXiDw442+4iFjts4VR9/MQb6bxN9WAMfjaCdXd8CHY3FZ6x9uQoXdoeb43gVPcVsG42zGjAyIuaMKq77eGfKLiwNICcD3DNyoZEa88xYeO2lHTh8W0chtikV2Na570v62KBzWNXeHh+QcLc9ZUwBtU1wDzWlrZS9y5m2gs7xHhHTJgu/CY/b7V4JyJ908k7nCNAkoBPUlPWY/2XmTOgXrS/3bFB+mUSamtrFuN57xs9jDQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 10:15:22.7667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bf2d0d-7162-4369-90e8-08df2e930d68
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000A993.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR19MB997322
X-Proofpoint-ORIG-GUID: QTn16Z_NiWC1Kt6MB5nFUqiikosH_w1O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX04rLA41Y7cQG
 QGdzJ8mQQO7k1krlkc5VoN/C7HpDsrp6j9ySe34XoHmSzpibI0FagWvtLJs/YIKD3XCaQRo7fBZ
 KAT2sMqapo1BbmPvwMMACbzN9ylPxfc=
X-Authority-Analysis: v=2.4 cv=H7tOUOYi c=1 sm=1 tr=0 ts=6ad73fb8 cx=c_pps
 a=wck1Q1pII696GML7qL2HzQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=TSVlg5FyD961pMgYlTkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: QTn16Z_NiWC1Kt6MB5nFUqiikosH_w1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX6ptY01GM362Y
 dGpXB7MR5YV5iho01FWZUt2EgYuB3hsBDfo40boHREryFM396Sq/k3vl3LXqaI6ncsWiJokKuEy
 N1J/XzRG+8mNI1mK1cPEg8vYzq7oLiBcM6riIhYsOb9T3yDmTZPtgIyqfSVwvZH/sf7G/cxcRZp
 59bhgF44oHGLWrZucFctmc1i8jcqhfkFX5+PFghArNd6DqEfyEhWHYx8p8as1OLMohF6GNp5OY/
 51VUjLTTgDYMrCVMXOSGe4PRellnusoJySuaO2xRXeZB8owXlPn7SRCa9wVMe3R8afGeRKVPa2N
 c2Zq409Kg7dOdH2/C2WoDTkGMhrk2wNV1w1JbzvEkxY3Am0StSyPxJyUhSw41AwSmoFlT/FIAJr
 g5SySw0ztMFgzekZ9JTsUTlD5CWEU6JAjEGptehCVCrXgmuzBo0CSBNchjm8cQiukcCD4O0+MJw
 UcyqWKlF4sjTSCBZ0mg==
X-Proofpoint-Spam-Reason: safe

On Tue, Oct 20, 2026 at 08:38:56AM +0100, Srinivas Kandagatla wrote:
> snd_sdw_params_to_config() leaves sconfig.type at SDW_STREAM_PCM,
> which is wrong when the DAI is routed to a PDM data-port terminal.
> 
> Set sconfig.type to SDW_STREAM_PDM for PDM terminals so the SoundWire
> core sees the right type and does not enforce bps match against the
> PCM-container-width value stamped by the helper.
> 
> Assisted-by: LLM
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
