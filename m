Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D2489895;
	Wed, 14 Oct 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971946; cv=fail; b=KMzNyTJiEQd8pg7jh3wyc9UiuHeRv6MhuN2ZvTA6076opGK4Tl0u43hqSBjOmeUHvY3RbDx9jrClEQ0cakq0YqFvPGDd/d1hhPzSLzRu54XESWXliabWGzJoDrsawspScCWux4vaChNiUTmYlJQtvQep9AJHTXYFRu5Vvw74v1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971946; c=relaxed/simple;
	bh=fuKhKNyfqv0dKyOu86r857Xnp6QIa9rYool3ZkM1Z8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwexXCglfbCZkax9Fm0HohSEMXUGg1+R4v0UUspb7RSmLqMeY8+G/eoGIQWHFJ9B3kUJCgjy/OuvvLGTC2fXA6jwqV5rc4MIf+qeB/S7yANui8LDaCC3IsldSTH/kJ8rwsMuZLJjc0qdgHCXgE8W60j096/uCfxBoPEeb9g4LL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ClISheKX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZLrc95J9; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ClISheKX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZLrc95J9"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8R0lI253412;
	Wed, 14 Oct 2026 04:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=yDN0XGtijj0mn/0O+V
	o62JEbPyWecgvnhI4baiZ3bxE=; b=ClISheKXuNTzXkOwUGz4VlM/RzBHY3o/81
	Qz7FJpHhSx935u6TfArYY8x7MWvvoijx8t84m5Q+8MnunDKE9s06oIhcR66R2sNR
	2g0PZ0JNLfzyJNfMltoRhtMi9xBeYXBzm0UOhPqwhzxHJOh9yqEUjbP+ptwMQiFN
	Cm6HLzAqfSkCnoCu05v3WLDQC4nfP5gJV3st54kmYE1S4yUZRxvbnMwr/qfbce4S
	sl3/awDhSuTgCg0/xbmu1CIQndc5GYrcUT23R5Dw3wE0BtuEFt20rqIxo3/nKWiv
	4nmglSLajJX2SJsC+ejpRB3owG6jhtKxq6UcAcFy+WS3w8Hm679A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021121.outbound.protection.outlook.com [40.93.194.121])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxdd1d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:59:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuFfKCYCDLFfokYZkfZsRozWsKJLK3+PMTo78IoD6Nvw7KwEYNpL8StQhW64S21YWRHG0vwxvegPkGrPQCa8IfLzxRL8VxJzBxVgsLsxJCNgyA2IRqZO9LtUl64gzQXZMor+RDPQh2dEOhhWERgnhMuz6FL/YV6n1UNRWmTdh8qr9FV/25K0QxiZ8vtCUQxcl83cA9hQRei6p+llGta27qZ6mOxoxqY71s7qPRGFCdu2XsgZ/toF1d4gIF+XHPErGwDd/9CPJ0G30+eKXK9+wvh/2uL6fEf8E8Lqmd4/t+su1jUZAWlSoYR6kwizgqhzKsLu+vkGEuRXUSL5vSGApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDN0XGtijj0mn/0O+Vo62JEbPyWecgvnhI4baiZ3bxE=;
 b=MFEBsyhpAyph48v7yi5ObWRpfZsmXGcw2jthAj7Y4iI+UmIUdBc6tAZL/3cBKuRReeeLqpW1y8iUwoqFfcnSj0lXYYUMjfeZ2nyhVdCwsUtrbNOUOVVFMyzkh6kmLPnKP0x6siDhrc9V53sTxZgeSJS1YifmjL3g20fOPfeNQ/1/PQy34IBHh7ft2VJH10WEVpjPiEbdeYmsqf8IdqWYONKuIycJigGgDf6CUAxglyX2qbpUa3HeBZ7mM5Tv06qrqCrOqRmJBa1X9hF83NTcj86i+wvPU28tQh+gu9qCMruLmPxwy2dZ9SkPZG50RnbYrvY7uyNrhkuBRmC8tXeBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDN0XGtijj0mn/0O+Vo62JEbPyWecgvnhI4baiZ3bxE=;
 b=ZLrc95J9AVdx/Ac/tzfT3YlyE8ACWI7rxAK78HKxmwuvM4l/PgKwTSdy0vWres3QZc1bKTZfBhjs1F56zU+xut/eCNmNChWZ5pd2CkxortHnYJEX7HQ+/ECskDHPnOW+UC2WJpYKPfjoXLaIu7XRl3+L/CYF42I+Aw7NTYWWyhg=
Received: from CH2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:52::15)
 by CH6PR19MB109024.namprd19.prod.outlook.com (2603:10b6:610:303::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 09:58:57 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::a4) by CH2PR04CA0005.outlook.office365.com
 (2603:10b6:610:52::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:58:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:58:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A1656406540;
	Wed, 14 Oct 2026 09:58:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8A8A0822551;
	Wed, 14 Oct 2026 09:58:55 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:58:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/13] ASoC: codecs: wm8737: Fix definition of zero cross
 switches
Message-ID: <as9SXupAtIXQGEUV@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <36cab58287bd24955e73bfe3a6fb24cae8fad7b8.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36cab58287bd24955e73bfe3a6fb24cae8fad7b8.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|CH6PR19MB109024:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf52a16-f99b-422e-6e24-08df29d9c36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|61400799027|23010399003|10067099003|18002099003|16102099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	fIMcqJIAjGLlTqvltnxbCIxLXtgyuY0yzw7liRTKkDc+GLJ8i+vu607XCYj7tn4Lm5of4JVlsIAJU0mP72CkGbWHCDVnYtrxoqhCnggRwPcRjImUXJ5mK0WNwIrqAzhRALMS7Q0/gaCKbLX/wDe3NhCkmRNE2FsDfsXI8PkoVq7dyEHl7FtVTyRBtdlKRreH+Hdp6hhdxAkkQtg0gh7CIkxRbXC922Ys9HSRVzsf8eyvhmiGLJMq3ZDed2b3WCEdt9ouuD86FQVyc9CzH46ff7Y+GzR5r1Kf+waqygzZ7DzUi7GGmI4X56HAf8HacUVGwGZ6RAeETbVTIEjhLH/7ktDSc4H+aoXOeLwQScct340039nLjsTuPqdZVdLRrWWFAVWvjLrolfshUrSriksKo4Y+EgBQPxy7ZTep7xU4NLgmMFUPS8LIJGlD6xKSqWmYVDtguIJExukeKH67dnfjcd0Jzfa8/89hpdLQhJ6z6PGw1aPa9F/ty1cHfyYXdd5rq3YmKR0OTR/SAXrfJ4GDUtSCiuHvmL8l8sWBJhN2C3it3t99OFGCEV2YtjsMkYW/+i7nvaktMuDvMogSZyTavC7EtyxT/6w6x0pnTv6AhnjiUpaXs/l3SyovJ+4eEZCAAOKqriGv90halxq8OFNCofdYS3ICfPAThw5JD/GfTAd75y5xUfTxwqBNfeBkv1JtVujFtL4UHl3yzQzEG7RHdw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(61400799027)(23010399003)(10067099003)(18002099003)(16102099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uZeMG/Ooh0Sw3JNLP+14Bx7wg3JjFYSuC7N46q+OrB/dvRxLrSWmPT2vxeEMUskyjTS4eBSUKMlNx4AA/AmyGAwmxW43wPL8YyKcyDKt0u5sVYyVv2rSIRQ8v6YmVrJNaRfosKCdSZjGt1Ms61pkNKgganJjGUX+9j1sAxl1b5CilSQSUs/ewqMUWHiHD2wUJ41MGeH3uefpsjyPcX8JnqPDp1cVYZavXuJhcXx5+SoZD4H5NEKlaZZHr8agt4JrMlR6nK4Yhh9F090yQNDAtyWdmTbgd3elHqojLXnrXFGD1YqIBxneUJCQjDd+LFJkZL+EpqaboZl+W+mCoszcJvBc1cnW50930jKISVP+9Iu4Unos23+SIzPlwiK/DSmFJDgE4nkRiGIM984SBBAIL8Ng+vXCJJUXxGkyK14/8L6DqrJ3AEMWL7yzJhI2O41v
X-Exchange-RoutingPolicyChecked:
	keeSsy85oQrpXHrT+bZjRbVHKO2XnVG4dzJN+KcRla3079UX3BknO46qTKgluJAIn9i5NCpFXOsCmTl7A0bQxrYY3rDcbWjCRKgaEfYurUdvSudYYqOItL9VWAtQHSZ9xEOP1KEnUGPbwDkyNpKJ23RtAW8cM5EALtnTmMsNobOtVYf5S92GqcHUiMa4UJtqfpFGyOHjbfld31eA7+WbDfk1blbn8fdqpOO+aZMxPBPFkFwRkQEdjjVfHORcCPanGZb4TBWFX6j9ULHII+J6cF1I7+XO71wjKZvdZZq5w3yGYi17BlB+RMwAHXzSb6H4ILjorwOkMPcGxEyFsQZrJQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:58:57.0442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf52a16-f99b-422e-6e24-08df29d9c36c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH6PR19MB109024
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6acf5265 cx=c_pps
 a=GRNSBXvNJw0HWouCR8jgEQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=iWQr62SoCQHEdrejGBsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: NRSDk3gJFvdhRrsrvXphVoBYmzplwdVI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX3BboSOldLUKS
 3WsDixsdpwFSTRRYUlIV6G7O855G86HSTtrJHJ4vWZ7PX6II9iHYkORO4tYXzwgZMeh+7j4V6wY
 4ECHEweKUBtt3sjyZufJWMpE/wBvXH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX1TClW8aGAKmn
 jmQODyUV8Xhhk5UBo2a4xbKfA/ciJE5CJjv2ZmT7q2fpb7iZUIlLHmCGJRtN+aS4AuBcZ6glU5C
 slfw/yl9YG/EYp949TJhEKgqoAk2THsPdY1P1gD8XVncxn6+ph/DZtCFDTQuC79m7uLxI6WG3Lg
 tAhEupYyIwyqn3ghbXzYX6kSiYYrhhcS2ANRW3B9vhZpqmNBy67SiaLB7nGD9gtQgJ/2J9Pb7M0
 gSWG+1OhiUwID/MfsnuvmQPI8NkVyH5nkG77f7zTBoRWeycLCV6q2YAVWnI4eEadoZHCSKQbwYs
 1C5AUXHX3Wfm9uzo+yeD0xUo+aYjOPNCS1tSTXw8SCoIgjA5ljdM3pmK9Plm8kwCHFUqYp5KXzC
 LAseKPNbfOzWtB4dHbQH0UwG5/pG9OoY7HY6MFWLTMJZccq+kCsnqysmI5eDlYhnSAPvHcmeeQD
 jLzIAku9gQG0guRVZPw==
X-Proofpoint-ORIG-GUID: NRSDk3gJFvdhRrsrvXphVoBYmzplwdVI
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:37PM +0900, HyeongJun An wrote:
> The mic (xMZC) and PGA (xPZC) zero cross bits are bits 3 and 2 of each
> channel's Audio Path register. SOC_DOUBLE takes one register and two
> shifts, so both controls only write the left register. Use
> SOC_DOUBLE_R, as the Mic Boost Switch next to them does.
> 
> Fixes: 2a9ae13a2641 ("ASoC: Add initial WM8737 driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
