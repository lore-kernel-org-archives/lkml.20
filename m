Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793698796;
	b=UDq8/HhlnsMiPjNoQVDTn48lso75wQsMK7bZjFwQxWsYbX6IDSpVA9D9tZJiM544wOjd
	 vloYoWcbDCZmYcSJdlcDyHVn+kNe6h4ZjkpYNPL0ks5jf5cGyKXciXEKRyZfvZm5shFIp
	 8gznNwoh2XzmVtLEnfmwpgCJAWj1iDkpIg4YYWBVb+mOAOem6Df5GB8EmS3Yt1/E6Yrde
	 JT0YqbnICRd9ypOVZ97ivZqgf6sfdqQyAAz8CaeuZreX/lRqgRkOHS84ThE3fhO2v3ruq
	 xhW6fdPvU2P38GHrejIBbxj4kBgkZkZIbHNy4l00+gLRkAbIiswyTdkLYu1xwX44u+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698796;
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
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Reason;
	bh=t+NE1VYCxEgaIhwSOd4nwoN8rgc55nwjPvlNQFCRH1Y=;
	b=GF2mhhTbyLQMoirahhRIxizWOPtwd0Z0VrsKVTp5uOBgdBDRPQLG3GMC5Ya/yXPNCTte
	 93yfo0JIODhWCEOAsOvI5ITURzbja17Mvb/+pLbHFuIFVZfYExqt50QMW1bFRvqsxVsix
	 VLTOSkJ2DFdEkWQNDlgKK0PFiSbhVn3SYXKZIskj5ljjkxdTZHrfs1fXa0vKepx/WxT4+
	 ST3KOT2qszmBsYDt1jAo1eMb4hebt8TYTjhN5dcdOU705QyVWJXdGus4XlnjRgmn/x1I8
	 gYZ4n8xdxBsKTYbXuiqPRbyakWqhPDWEtq5jnXhZypiy4dzrO1JkJc5Od5vUSe8mHqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UmCIsUXT;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=oLWGgJAM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.152.168
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF69B606D80A;
	Tue,  3 Nov 2026 09:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF69B606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=UmCIsUXT;
	dkim=pass (1024-bit key, unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=oLWGgJAM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31MJnj2776587;
	Tue, 3 Nov 2026 03:39:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=t+NE1VYCxEgaIhwSOd
	4nwoN8rgc55nwjPvlNQFCRH1Y=; b=UmCIsUXT/bWVDpjhjaozQxFeVMPZf4D7lg
	sIGdb+x0ZRPbRqJHO4x4deUMu5rN7eO3EBCa9Euz0QcaWVobv9QImJHnojUneZC4
	3tfwiXDwzCD9JcCDRB0zlLJfrQ0AJm4YJrPGSQj/4e52JpINdsltP+P0wYjPrAXk
	OxRhzk7ux9sWXQgZl9TeaJFhKJOdUiBb3z+0u7NAYFiAWSIBmf0F+7lLbyQjG5jZ
	WFTmvrMNXeDTxUe5owbEVKG/aVf0B3gzh1Xa6mHBlB1Du7O5XkAKCRspf0A10FrP
	fQYKVEKb/+Gnlr8liSJIsUKukXi3kzVcw1YkCjEOVxVcxPabS/mg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020080.outbound.protection.outlook.com [52.101.46.80])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hncrfudur-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 03:39:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOvZcAJdErgcV9FbMV4ztJgyq5Z38KCdMJLh+0FCr6uBqqYgWUWXDKiKAYD8PwjBP+nuVjKqOVigQ78OWsHaKHRT+MOfYOAs/Rz40cpCcXM7n7Byr78wSsbDRGpx6OkYZr0bNJkxDp75quYHldmD2ExLfWdjevtQLZtG8MNyDM0dp5giHkN8rWrm9Z37eqVQwXpLhk7GZK2EWP0ew15UkYjjInClHOvV9KAhb1QJo3p9dO1nTRb0vSxYp1WetABWAtfHqqsqmulml6HDijoqkXb+QPiphiPzF/r2+E5a73FHQLShQiIFQG8FKqw89nrT8W9PpgLgPaFY2KQwfYoa+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+NE1VYCxEgaIhwSOd4nwoN8rgc55nwjPvlNQFCRH1Y=;
 b=TXhwt4YsEmnX4hRLT/8FQIeA/5XX2Dzzlv/OEZf5M5JAdbq8D94ur0uJDit5hiHXVvBdDjvVaE8Ogy+Oxf8mBdLrhlNiJD5YcqCaHb0H4N8ko2EK9kxxxvfi4pRkO70pIRoIYWcxxHNUPOL/B53JGoxD+8rTvLhn4Ze5+VtpMCRUU/+zMiUtlD2lShijvIG72ticnPjwEaHXBgrwqcXm04ultKxyeJjSzA275vqAa7bsRcnPEQARtJrZ4Ry3XbAg7WlvQPY6fM83IkN2IUc+jnjFmuyDUllYuNRmJWr22nw0PfY/Ga2UlQug2hS2UCzKxrs3iaXNSEn9SwKHymPoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+NE1VYCxEgaIhwSOd4nwoN8rgc55nwjPvlNQFCRH1Y=;
 b=oLWGgJAML6v6/nKP9KRyl46L74sK2AQVjvMW+1tTvYZI21i1JvsE66qXcxgG4N5AJj1gxGrotSm2Ad9HLF4JAycdLVYhrGnvsKdtxqlIVdJVLY6aK3v/mXC2VSmUnF1AoMrhSV30ehp9h5Uzt8xJSJw4GoQAe6kI9r7RO4M3cy8=
Received: from DS7P220CA0095.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::11) by
 SJ0PR19MB4748.namprd19.prod.outlook.com (2603:10b6:a03:2c8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:39:47 +0000
Received: from DS1PEPF00053450.namprd04.prod.outlook.com
 (2603:10b6:8:25a:cafe::41) by DS7P220CA0095.outlook.office365.com
 (2603:10b6:8:25a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Tue, 3
 Nov 2026 09:39:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS1PEPF00053450.mail.protection.outlook.com (10.167.23.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Tue, 3 Nov 2026 09:39:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 30AD640654E;
	Tue,  3 Nov 2026 09:39:45 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 12774820273;
	Tue,  3 Nov 2026 09:39:45 +0000 (UTC)
Date: Tue, 3 Nov 2026 09:39:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] ASoC: cs42l43: Improve pop performance of the input
 power up
Message-ID: <aumr31DImHpXqwxm@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
 <20261102155440.3995136-4-ckeepax@opensource.cirrus.com>
 <179363922126.2092401.5458739879351265933.b4-review@b4>
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
In-Reply-To: <179363922126.2092401.5458739879351265933.b4-review@b4>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053450:EE_|SJ0PR19MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 590a6199-0e10-4495-7c3c-08df398e65cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|261021123027099003|11063799006|4143699003|56012099006|261022075727099003|261009223027099003|10067099003|16102099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	MFy79Jg18gbbCfQ8P/1rKc2c4BGfupiwyddJIEyjNBAbBS7P3bXU3DluLO7g+IrsJNW8W6mGDxXgjDZs/2PqwKxMq3mcWU3YW+DgqZ4THtwDtZYBoIAZWfLj7pTZ/9e3PVRcnsL7CmjEvheKkJYdg8Y6INk0L9ahCSQiRDDxJdoh2fnTwbZ6IDJKzMUr18SR3ADc0NjzCthQnlU0H8oSOfyNOnotl0wIB3L59+tzb68o4JNuOXRGwLQ0Oiu1yeuGjogr72f4tzYd7v7JBOVkTNUiiycVoqQlkOgAaXhc26cM5LetJUkn3Y/fn7fPrS8w78G1J62ihBs8CuiaeiZbzyPmQnXLIxR7GW+kylsrt1v4uF5GLhoQ0v61qrh516Qpqw6R9PkDM/7k5r+XPJPvTCquOTjBURf32RJWmIyex1vNLjw7PICESflwEh3bLtUF6kfqtyT3saEXbh8xiG73ezhl7lHxmbkndYqNKrnSfWLH0y4BuFo1EAUL/94+1gSZpywJFux/qfHeX1toR9WLbMWXfTFp6pH8jiF9TaE9WgMLhOPoNWqsUS42OTuBGnS1GS6Gs2Ww6EHhloVdxF/gTkDDjN9Y1mwCjM2GYrDlRCwTrC/uDAeENuv36FN582fx0fQtskhpimmAYDVcMrDk2w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(261021123027099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261009223027099003)(10067099003)(16102099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jqTz4YpybX2Ep+GTEfn62yh25smQx+ZFb/8ZzPQt1gzCbynGVbqgefxKiJPMFo0SigiTKb0DUc3yBd480b/AufJj3deJvVHpVg3pJVrfYTWsM7eKLoqIGugPHoKcf8pau0OxpXtrlleQM5OcQkW1meU4cJScNDUeDnyqI3AJfq3u6IfHecVodX0x9xGPayPpX3SSjeKX2ujhm3NHLer6gPHQepGAn+726sPWqJJLRRBOzSO3b/j7WNL8FmSU76axQkWg1VlAtdw/WryqVrQSbu7usbpHPLBbdbVVRsLcygRr/wPDx05jKZTTCjKSn600IoOiUIAmbptqOXWwtrekkMgyIJU4EzFJHiy/MIP2hZQwsDfI2xhF60imsT/Zye5S6VdazThkSI428z62OfSIVQkTl2fGGuByCSDZaDagOTNOC6sL0pj/ZgW6xCLUmNtr
X-Exchange-RoutingPolicyChecked:
	G09KSIhsYQNck+XXOBbkx7120gbxNDp+0653lTR3hiTn+nprA+6VzL+a5hPnHBB5rSOID4L9I7g/xbb1ePoqttAr/rURG2WvJpKKBBmMPRBenh93W9OD81VinUpPpSUgW+/aWdH9ELId2oZJFxHbISN79R1jy4PHcTtuMiN72onwFrhSG+RhTQ2yhMVGpCZ9cexXVU0hqR6UKEvlByj9Rn5hg8oHKs9gQl/bXQp7+teTlAyXDXCDeJk9vshuj9IDcbW6tJZg9Ilk9wAULkb9C3E34aL6favJi8reWfwlNkT4R87DZ7past/WkL+eypr9yy5MAkeSmAJmRJlT61X5Fw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:39:46.3358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 590a6199-0e10-4495-7c3c-08df398e65cf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF00053450.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4748
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX898RPDgwsgru
 Yf94zMSHLq2iX0lyBjaTVyLdp/l1R/yJ8lT+GVBMSUuAKIWA7XNvvVC42Z01UJ67webst8MI3KW
 AzVyF9HptyXZLc0ZdFEi8mHSbrQoLDuDEKG2VbKJH4onwik84RkynzMNDD6y6tDBRmoxVlvAz7j
 Yy9Kr45g6MQzmuSqzeDwrFPJyGZRoLqWPFYqJaD6jUamMkPVV6eU92gevYRyTwWVgyh3p71YGpq
 sEoe49NPL4N1Mp3Hy+AW6PQXJEHTz23G+vWA6FbEHFXFTlSlLReytT6gR/AtwC2w8ugveFVbi4t
 mwlfF1wjvV2qQ9VGIeVc/nlHshA90F53x7p7I7sjZevsreH231gW5bTbnvXN1RJ9e4SRK9z+2WL
 4ZctHU1GiQ6cYHwxS2OglavdZnigGQcE+k0lRdQgyMJ9NFvzf/0EEeS9SUAbitqgHZ6/zwC+S+6
 SZoHLNpp3VjE+EqULqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX6/ELnsW/pJpq
 ftKJWkQzXw+eFJN5IS5Aa7oReb5Lui+8g+168cU3S/OgCKEcIJv33JIPtAOeGixxvrJI+XcjDnl
 CsPPqIK/ei69EbFmNTuAm6xbgpQIzsM=
X-Authority-Analysis: v=2.4 cv=LtgHWXdc c=1 sm=1 tr=0 ts=6ae9abe8 cx=c_pps
 a=mPoTjFGc+mEQF3C7Fih31Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=c92rfblmAAAA:8 a=w1d2syhTAAAA:8 a=OuECfoOYgVqOEiZ_cD0A:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: -qAs83xp03dqmskcRFeCcEkuO-7TZ3mH
X-Proofpoint-ORIG-GUID: -qAs83xp03dqmskcRFeCcEkuO-7TZ3mH
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 02, 2026 at 05:07:01PM +0000, Mark Brown wrote:
> > cs42l43's decimator is particularly susceptible to discontinuities
> > during startup. To help reduce the pop noises adjust the high
> > pass filter settings whilst powering up the microphones and add
> > a sizable delay to let that filter settle, then restore the user
> > settings.
> 
> >  struct decim_info cs42l43_decim_info[] = {
> >  	{
> > +		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
> >  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> >  		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
> >  	},
> >  	{
> > +		.freg = CS42L43_DECIM_HPF_WNF_CTRL1,
> >  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> >  		.vmask = CS42L43_DECIM2_VD_RAMP_MASK | CS42L43_DECIM2_MUTE_MASK,
> >  	},
> >  	{
> > +		.freg = CS42L43_DECIM_HPF_WNF_CTRL2,
> >  		.vreg = CS42L43_DECIM_VOL_CTRL_CH1_CH2,
> >  		.vmask = CS42L43_DECIM1_VD_RAMP_MASK | CS42L43_DECIM1_MUTE_MASK,
> >  	},
> 
> Sashiko is flagging a bunch of concerns about the accuracy of this
> table:
> 
>    https://sashiko.dev/#/patchset/20261102155440.3995136-1-ckeepax%40opensource.cirrus.com

Yeah replied on the list about that, the table is fine, as the
input is muxed. But the other two comments are good so will send
a v2 with those fixed up shortly.

Thanks,
Charles
