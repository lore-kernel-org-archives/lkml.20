Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791030;
	b=2edGftvoZm5hzqxayEkgF2tKpZ8X7Gfdv4bT60EltTYHLIUYdKusJPsnt9NEz8c6Ps/N
	 SI0jYnovb63yNrPYiqJhMg33uPE858f9y5JJ6uWpXHcjafP74VUHMrubLBaNUeYJyPkR0
	 JZjoyOKAGCyNweTjUYM0j9iHof+hyDGaESeglp8aJbDlkqT6mk2MjmGHW90tumkJn13xa
	 HoGPFNqzWnmrh7nQh/qvyh6hjBexzSLAzoUM9g8ba7SrAuPZR2mHQIYmLmuG768vxhLrk
	 4G2VWh/wwAoBNBTPDLeZRZwhsxqypDBNDvNF0fQJw1CrwrrmCuJU2pqxV0SMRMa0LAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791030;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Reason;
	bh=cToXL6RqGQhwqyIDdZk3JckusThEz1d56DZ8Lg/O7tc=;
	b=ml3rO+uUdLBXl//0guy5GxVRyjzfWf2QXxAMVK1sQ9dlb5uGeVDSx7eLvgYFWXr1Gvp9
	 HltjzCSy4iBAE23ctD1MkDDfdFCTsI6eR9xA3EOyT1TqwP6/7hPb5h0lDJNIVwATZS2rf
	 O/38dSMjlJpuH3VeUCCz9kGtj2hyAPXmXqp02ft4tN+7/ikegUPCs3mCOfCigGbYGPyWY
	 QayGYwazjABoan5p46pf4EjfYzNl7Uqm2blrH8xK0k10mUeUXINEICF05P7/3A6iy22+X
	 JnOrYLi07F9ygC1iI3pDe5+RrqWp0VS7fsl/UmFfwPjt3Dm1M5/jD7fFBuCFEVJHd5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KvfzkJsu;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=scKRdIol;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF70606A32C;
	Wed,  4 Nov 2026 11:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF70606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=KvfzkJsu;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=scKRdIol
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A49wojv3106919;
	Wed, 4 Nov 2026 05:17:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cToXL6RqGQhwqyIDdZk3JckusThEz1d56DZ8Lg/O7tc=; b=
	KvfzkJsutqCLoiP3fjW5OtWZp/fSGs2bU3s9xpilhborudpkC182Wtrlar2J27Q/
	3LXKpl9Cm+oqyY7KKflfS0DoRviNer9qZy3pK5dsGt6vpEb6g20kOQttKZWj/sPt
	OWezz8K1EVG3HPu9eS8YjULhTxatghnQHGMHLcsYQiBknV86+GGnLti3KQbTDb0Z
	XvHzQOo2x39c6B+wWKrGSQ0jEL4gYfVzaVwnoCjc8W7bD+db5dO5yfGGzA8uKabW
	Q70rl+1tDfk4z9wwDVORuLWOvYXvz2syebPsIgx1WTRvXFN+Qp917U1m09+KiMhZ
	x9RX8wUf+ME3Gs0vBllnTw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020092.outbound.protection.outlook.com [40.93.198.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hndrfd2pc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 05:17:06 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVLimKaBkwcuT0TLalE8lQN35J/kTJsplyzjr3bzSA6ueBbpZzInHrM8lHn4ZThEjFM6D3iqgr90FFJtJlUNW/EduDQyXxqN1rGb6xwmnLxcvUos+LjFx509G5VkCzXCXIouzAgavd4nZ0tUB7Txl8G3SoC/j8DJVKUAvTGR0Ffv6D9ZA2OMbPOBXvrSiJlMnDd9jdr9T+/jNNLnrR6df0017AhovpVhP38bbE2tDMJwLg8OKVbWbv5wz+1+HykoagK6WKSylEXZEsIke85S0+kpQBYs2OPOZHzoB2QcF6tkvdv5yszL+LQVGIfOrPP9M46nhjbSfyE8/RhhYrEE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cToXL6RqGQhwqyIDdZk3JckusThEz1d56DZ8Lg/O7tc=;
 b=S21FAEMbgiitUGQCNPn4nCB890eheD5llyk57Fic0PkrrU6GECniWv8b+QJZ8Be9OU3N11c3YsZ4w06XDPhT43YWbEk5I6mlMwb3045WJVeEUuTv/8zktyUwURe3YqiGsWH8aZOuryPS3wNXv8ehIBLIiP0oDxQFjeODhvLcKodD0Ub30jJ0ipoKCNIv8QzkLMEtKxlEVk/GeMf7tnkTelBGT/lqDyJoSuxU+V2H7SNLEX3UGM61qUF1+zwlt2iRsLx87DvsStYFciXlzRGRwYJnY5BGc8ynw9yMfw2JcjXO6wiWFBY4WupPa6JXuzxgQqNn/BKIut/8MfHgHIsoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cToXL6RqGQhwqyIDdZk3JckusThEz1d56DZ8Lg/O7tc=;
 b=scKRdIolRVTc2i2Tci+LIpuSOkEWa3jPSGHba5/HxlfTnHhw8PGBxPKrzMkWkKrJVNQrna09M14euPs2ttN03rMoctlJvAD6MD86aFmPOHHQ095g8sz660Z9+TJuS76mhRr8JjRoqqJd3l+NXSarZW44fucgVascR6errjm4/x4=
Received: from CY5PR18CA0047.namprd18.prod.outlook.com (2603:10b6:930:13::11)
 by DS3PR19MB9606.namprd19.prod.outlook.com (2603:10b6:8:2e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:16:57 +0000
Received: from CY4PEPF000392D6.namprd03.prod.outlook.com
 (2603:10b6:930:13:cafe::74) by CY5PR18CA0047.outlook.office365.com
 (2603:10b6:930:13::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 11:16:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF000392D6.mail.protection.outlook.com (10.167.247.116) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Wed, 4 Nov 2026 11:16:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1A72140654F;
	Wed,  4 Nov 2026 11:16:54 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 03139822563;
	Wed,  4 Nov 2026 11:16:54 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 3/3] ASoC: cs42l43: Improve pop performance of the input power up
Date: Wed,  4 Nov 2026 11:16:50 +0000
Message-ID: <20261104111650.1079215-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
References: <20261104111650.1079215-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D6:EE_|DS3PR19MB9606:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bcdaf182-da72-4a19-f8ab-08df3a65228f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|61400799027|16102099003|22082099003|18002099003|11063799006|56012099006|261021121427099003|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261102123227099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+y3ZP//wtYMhBeHDXx2NfVoj+ssLlWs0FIhY0Huh12RfCIAmiu6WR/ilGCVxRfPeVZTT0JDNVk8NdhfrmMb67WUSIvmlHLbWC9zsWbZYN84nFVBH1drsW5wC4/GQti7vy8QrxHqwbH4UzIOJGMsKSvQiixZBZk879TNVJjlKf95RTOVqgt4Gd1W+iXvmHt/51lesMfC89Nqw0+8B595iwaKFG0OCsmJifnXdT8jJPcvj6Ia9ZdqWf/DfuJzaiB8P84Ek/gmo+E5Db3IJHIREHSsT6OTOaA92UXdnSUBIrmgMNsJNCACSKw+XteK/9i+H3Dvpna8/XiSN7NRqLkR5QFHtLaI2nVQq2j4Q+jznkAyRsGVtetJC0An/Fu2ZHIFVzE7yi3g3krK0kEh9PBhlDsAqumDom8qz8Wwlzb2sTsBv+ko7bAe7ba1sMVWPHhp/hRQxlMUFSt4hIQvl0/Ze8E6eEvFk+BDpDRfdTFV5SzzJ39RyKMywAhQ7pGTRePIl07v4ZRu9kogF4leZJTNlY63FWRpF6YQFli32f4w7xDXbQgk25rOLLZWnh71F55ln28rjn7/lN/yVyPEHrou/ktywU8fUJwaI3XDogaGnz+gyW/yvirW3yKHu5ztHEW0qyEaI9XOsrcW4G5YC7Qx0uXaznoBdBTjK7NQTFv3vWbZHnDzUj/tcDQYTJ/3RDMPYuY80WV69oDbaZPb4k4F7QQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(61400799027)(16102099003)(22082099003)(18002099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261102123227099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BTmafztUTVZQDwS7J1DtiCpveZ49grSlFhzelmIkrJzWY9pOsnJVe8DeXm4K6XsQU0g8UthrXrYigeh6FMVVXQ2lLk2UPMcJePupBNaBN6oh4ijauQN6lBGyIycqtAOI5Kk1J5e7/+M8oHthFj3VW9PdS3qIGHEpG/MNY0rFwf0jnTr8S5l8y5VGddkpcJ4ICkZ1VQFBQ72URTAFfCI2nu1uXku7nfXZUJlnnQzxftDVNstpblqtaZXVrsn5vcknPiFhQV0Ry4VVd59et163IlSlextMsq63GGpr6Jcf/4i2d4HGwyjHwA5M7Aytp6O6hBj56X8zt+CTAhnnIkPzzdEUmSddy0U+my8+Qt+p6LAipBO+nTyehI+cxi39D3iVd9l4QHcHxCrCrTv9oM9nJAJ/SuQCRytUCMgb56fTt3mDfbf6LORh0gqs+qSJ5hPj
X-Exchange-RoutingPolicyChecked:
	Tjbrx/YMca1P8TWXVVH64AXIBExpNNdFYlRyUAEkRDhRiqXaFJV1OFw9rsyLLnB3fp1DxMQ6DUNpXExlvqVXSWcXkWpiURVHBLLNIVczFaNMfUJFIpsePBQ5BwrZ9m3KnTN/2twvc1C61pG6282IOF4nrRiyRigzw08J5CNcthB67+5sQQRRFFxY++Z09hxIlPucVgiYoI+Icvk7hfE0H+QqAAZ0i+gdZUqv+d+Q5HKfUapDxU5+FkTbJeQHL0/ZA/MVIJVRkIlm4pAE24dBry+Ec+6GYJqv5MIIzuumU7bWO8vGLjrHCR6ZbWNj02f27j+CJbEVdphs3TCNlpG7Dg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:16:55.2919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdaf182-da72-4a19-f8ab-08df3a65228f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF000392D6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR19MB9606
X-Proofpoint-GUID: 4u-ANoJbQz4t_kI-OQItYZYo2v2ia098
X-Authority-Analysis: v=2.4 cv=HMRWhYtv c=1 sm=1 tr=0 ts=6aeb1432 cx=c_pps
 a=o952g1rkoyfyBKhMC2IAFw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=zJRp6_cAMcgA:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22 a=w1d2syhTAAAA:8
 a=gBu3Oe9Nl4xCV89B3DYA:9
X-Proofpoint-ORIG-GUID: 4u-ANoJbQz4t_kI-OQItYZYo2v2ia098
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX0yl0hZYbI5My
 hnLxUg+5JxvaqkenizNUFl1Ckn9qCkkEUsMKN/OyGEweFrrgttOZdklkpLbtEFg/4SEeL+flkP/
 tGkUpjL0t7aGyypBsO//cLi5kiW9ZT3CaCzvY1IaQmhdXBW0FwnED6okk1gi7+kKEKtNdgnvjQE
 eBdWe6gl7zewyNcaMdpnqBDM52UwVrgH8lCcX3STl130GBJea09wl7/fmHSmG1qFhwCdIqKoBJ0
 CnxwLjh+ZFMLi+RtZHl5UpjNxB5cCHGqiSPXh06xjMbU3Gf2RRiTxDD/xPUfvpxO+ScKhJU6tzd
 J3jUBM5Nbmqx7apsTH1JXXXFRthsi8yqpuS8rh2bwgl20CvfZixKIDc+o67MkOJQMHENuHMMi44
 TNGbB74fIRjbYJQWySX8QEVFhPfu83uglN+Y6+rH3pfCJaJjY/g7BaSle9KDDAXAOz43xKJprjJ
 uoJFJSZUcem7FIOqiPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NCBTYWx0ZWRfX123rT8ervGz+
 ag33OiyQPgLHovfkdDfFlv7HHtSxsVgggibkVPU4EeWLuHtcWWJW1sXRl5qusdssgrHF8bYLlgV
 p8Ov4PsFfNGbA4lbuKou4ZyiE0Kj4Rw=
X-Proofpoint-Spam-Reason: safe

cs42l43's decimator is particularly susceptible to discontinuities
during startup. To help reduce the pop noises adjust the high
pass filter settings whilst powering up the microphones and add
a sizable delay to let that filter settle, then restore the user
settings.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Added dapm locking to Decimator 5/6 controls.

 sound/soc/codecs/cs42l43.c | 87 +++++++++++++++++++++++++++++---------
 sound/soc/codecs/cs42l43.h |  3 +-
 2 files changed, 68 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 8fccddf7a1b22..f31f448484d65 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1345,19 +1345,27 @@ static const struct snd_kcontrol_new cs42l43_controls[] = {
 	SOC_ENUM("Decimator 3 WNF Corner Frequency", cs42l43_dec3_wnf_corner),
 	SOC_ENUM("Decimator 4 WNF Corner Frequency", cs42l43_dec4_wnf_corner),
 
-	SOC_SINGLE("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-	SOC_SINGLE("Decimator 2 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL2,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-	SOC_SINGLE("Decimator 3 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL3,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-	SOC_SINGLE("Decimator 4 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL4,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-
-	SOC_ENUM("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corner),
-	SOC_ENUM("Decimator 2 HPF Corner Frequency", cs42l43_dec2_hpf_corner),
-	SOC_ENUM("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner),
-	SOC_ENUM("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner),
+	SOC_SINGLE_EXT("Decimator 1 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL1,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_EXT("Decimator 2 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL2,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_EXT("Decimator 3 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL3,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_EXT("Decimator 4 HPF Switch", CS42L43_DECIM_HPF_WNF_CTRL4,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+
+	SOC_ENUM_EXT("Decimator 1 HPF Corner Frequency", cs42l43_dec1_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 2 HPF Corner Frequency", cs42l43_dec2_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 3 HPF Corner Frequency", cs42l43_dec3_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 4 HPF Corner Frequency", cs42l43_dec4_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
 
 	SOC_DOUBLE_R_EXT("Speaker Digital Switch",
 			 CS42L43_INTP_VOLUME_CTRL1, CS42L43_INTP_VOLUME_CTRL2,
@@ -1737,32 +1745,39 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 }
 
 struct decim_info {
+	unsigned int freg;
 	unsigned int vreg;
 	unsigned int vmask;
 };
 
 static const struct decim_info cs42l43_decim_info[] = {
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL3,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL4,
 		.vreg = CS42L43_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
 	}
@@ -1770,26 +1785,32 @@ static const struct decim_info cs42l43_decim_info[] = {
 
 static const struct decim_info cs42l43b_decim_info[] = {
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH1_CH2,
 		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL3,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM3_VD_RAMP_MASK | CS42L43_DECIM3_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43_DECIM_HPF_WNF_CTRL4,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH3_CH4,
 		.vmask = CS42L43_DECIM4_VD_RAMP_MASK | CS42L43_DECIM4_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43B_DECIM_HPF_WNF_CTRL5,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
 		.vmask = CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM5_MUTE_MASK,
 	},
 	{
+		.freg = CS42L43B_DECIM_HPF_WNF_CTRL6,
 		.vreg = CS42L43B_DECIM_VOL_CTRL_CH5_CH6,
 		.vmask = CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK | CS42L43B_DECIM6_MUTE_MASK,
 	}
@@ -1802,6 +1823,8 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	const struct decim_info *info = &cs42l43_decim_info[w->shift];
 	struct cs42l43 *cs42l43 = priv->core;
+	unsigned int fmask = CS42L43_DECIM_HPF_EN_MASK | CS42L43_DECIM_HPF_CF_MASK;
+	unsigned int fval = CS42L43_DECIM_HPF_EN_MASK | 3 << CS42L43_DECIM_HPF_CF_SHIFT;
 	unsigned int vval = CS42L43_DECIM1_MUTE_MASK | CS42L43_DECIM2_MUTE_MASK;
 	int ret;
 
@@ -1810,8 +1833,10 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		priv->decim_pre_pmu = true;
+
 		ret = regmap_read(cs42l43->regmap, info->vreg,
-				  &priv->decim_cache[w->shift]);
+				  &priv->decim_cache[w->shift][0]);
 		if (ret) {
 			dev_err(priv->dev,
 				"Failed to cache decimator settings: %d\n",
@@ -1819,11 +1844,27 @@ static int cs42l43_mic_ev(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 
+		ret = regmap_read(cs42l43->regmap, info->freg,
+				  &priv->decim_cache[w->shift][1]);
+		if (ret) {
+			dev_err(priv->dev,
+				"Failed to cache decimator filter settings: %d\n", ret);
+			return ret;
+		}
+
 		regmap_update_bits(cs42l43->regmap, info->vreg,  info->vmask, vval);
+		regmap_update_bits(cs42l43->regmap, info->freg, fmask, fval);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
+		if (priv->decim_pre_pmu) {
+			msleep(150);
+			priv->decim_pre_pmu = false;
+		}
+
+		regmap_update_bits(cs42l43->regmap, info->freg, fmask,
+				   priv->decim_cache[w->shift][1]);
 		regmap_update_bits(cs42l43->regmap, info->vreg, info->vmask,
-				   priv->decim_cache[w->shift]);
+				   priv->decim_cache[w->shift][0]);
 		break;
 	default:
 		break;
@@ -2282,13 +2323,17 @@ static const struct snd_kcontrol_new cs42l43_b_controls[] = {
 	SOC_ENUM("Decimator 5 WNF Corner Frequency", cs42l43b_dec5_wnf_corner),
 	SOC_ENUM("Decimator 6 WNF Corner Frequency", cs42l43b_dec6_wnf_corner),
 
-	SOC_SINGLE("Decimator 5 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
-	SOC_SINGLE("Decimator 6 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
-		   CS42L43_DECIM_HPF_EN_SHIFT, 1, 0),
+	SOC_SINGLE_EXT("Decimator 5 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL5,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
+	SOC_SINGLE_EXT("Decimator 6 HPF Switch", CS42L43B_DECIM_HPF_WNF_CTRL6,
+		       CS42L43_DECIM_HPF_EN_SHIFT, 1, 0,
+		       cs42l43_dapm_get_volsw, cs42l43_dapm_put_volsw),
 
-	SOC_ENUM("Decimator 5 HPF Corner Frequency", cs42l43b_dec5_hpf_corner),
-	SOC_ENUM("Decimator 6 HPF Corner Frequency", cs42l43b_dec6_hpf_corner),
+	SOC_ENUM_EXT("Decimator 5 HPF Corner Frequency", cs42l43b_dec5_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
+	SOC_ENUM_EXT("Decimator 6 HPF Corner Frequency", cs42l43b_dec6_hpf_corner,
+		     cs42l43_dapm_get_enum, cs42l43_dapm_put_enum),
 };
 
 static const struct snd_soc_dapm_widget cs42l43_a_widgets[] = {
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index fd50feb26ae99..2dc8d530a1fc0 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -61,7 +61,8 @@ struct cs42l43_codec {
 	unsigned int refclk_freq;
 	struct completion pll_ready;
 
-	unsigned int decim_cache[6];
+	bool decim_pre_pmu;
+	unsigned int decim_cache[6][2];
 	unsigned int adc_ena;
 	unsigned int hp_ena;
 
-- 
2.47.3

