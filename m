Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112264E532F;
	Wed, 14 Oct 2026 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972279; cv=fail; b=BS1BFXDpKgZFJoWT9G7ucsRnC7mpIZFz73mjO+WH6sbzP2wWh3G8GFAyn3nJRPYRajM3HGEZbGukz8EMMZIGiT07GZrMGcV/RQR30kXY7oBJm1rY4RiBGg/UlOy0ENGtJ9DfQRuw1YTp7xpLPQMNvtlgwYyh0m2jIBzOBynMQiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972279; c=relaxed/simple;
	bh=0XExULXrqOoqdYe+vaM9wWgLUvv4U5TzxNcFQ9MdHYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugta+8/C1xs0Vb0vGP3O9GTXOyfhB7r+PZ6GYtT/BtBlqw4vzoAsE39TOubb8AK2xi31+Map5XzhPO3K9TeXghywNYi+SHlRr8l03pdTpglOvwCJGnxsk7j5pRzgAFk8a+f1vX4+CztG9Lqhy4AJnWTIAZK+ctL+X1I/khvhMnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VRCqcR2z; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HtYD9uZP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VRCqcR2z";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HtYD9uZP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4lC4H1843566;
	Wed, 14 Oct 2026 05:04:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=11MZsse5MlafrjVbLu
	BbkJBXLEmgzPFt7wHz8jLlPIw=; b=VRCqcR2zjt3+CY7PhS1f45Ld0j1DEfiVom
	oH3ZKDLO/H7OgkGCY42nWIzGRwXNB4zqy7AX0M2X23w70ON6kFIxMTxQ4pBBQzYQ
	VikQUagPcD8+0tnNFKRt1WQMTLEiaqZncHzHN6CUXdmffss7WOykr0USmm+jfS1I
	KE/irTfj6HCuro82cZfWse32GVGURMYpbVrf6cSTX8b89J+oZVppLxtOiYVwAn8q
	pouat78RNOhPL5l165jJ7cBsSQNwTRbbqwzSG6wIisH+gD4ueNq0QMWyR4Q/NBxO
	L7VwI3SjuER/swm4wWVS/91lujMRGTA5oG52aE47p8aISY9qD6zA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021101.outbound.protection.outlook.com [52.101.57.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5gmv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 05:04:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OV8UZ6GIK+hyaknu4C66kRRCevZLC1zz6/bK2QistHyhqvNfc6zH8BNSL0wgdUIEBQIdzPv/GcyyyW8WXmmAxg5IFE+e82l69JQdg1lV7XtQ1nYNPsP0BNRkZTfGJxFFPhct+G6M0dG3VlzUaulxUqMfAHjXmk4/9ENfBIc01I7sz6709eB5Ye3aShYhkp3/sSIekraP+Y2tvSuTekyYmgf56ZlQo6QalR/OCYGiUXZUBXi7R5tlp736wjxstUzD04zpl79PbYzriUQD2PEHZ4Chb9h2sCnRVutcP/i3q66XlIR4k5P/aaGKt9LvDy7255nZBzWp16pXpBSeIVlywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11MZsse5MlafrjVbLuBbkJBXLEmgzPFt7wHz8jLlPIw=;
 b=hGGxIypqNJvHROBiBeDQdEVaIzOz7Hb23IbjTmuWKNoLVhfNHgDTXMo1TD8SUQp/sFgmKrob8F78fT65s196UHibUxBos7Q0SogmaC/hVp0UT96ICmBMfNDJt31GcFIuhJbRyN+4btpdwBdQk/y5RgkdcHPNQOuSEbHM0qN7RKDOp2df/o0F2S+r04PA+fz1DTfrCQbDFdjTcNbWPfzutyzBwf2UfQ4Bmpye51Wq6PDte8HXpDeWPCfH8JgpCwSIMWmXQq0H1htkgCETd/Gi454Br8RGYHq2n1cDbJy74j6CpUKstF/tX2W+FPYxXDnENL8baRy5vJvC0jwpvR2vqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11MZsse5MlafrjVbLuBbkJBXLEmgzPFt7wHz8jLlPIw=;
 b=HtYD9uZPneMv0wBWQBKsMq6noL3KvPbYL77LLN0xkSipRQ56yNycqG4B3Q6rRCUtK/tKgRdsO5W0Ynii8JhWpkmcxl08TVHlO9u2AxqaWNRRl+Don2y5o6v9WNxPXeZg6V+K9B+gEEIC3G3H/3CbCuxOubrlEI8dmTaS79W18CE=
Received: from SJ0PR13CA0182.namprd13.prod.outlook.com (2603:10b6:a03:2c3::7)
 by MN2PR19MB3807.namprd19.prod.outlook.com (2603:10b6:208:1e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 14 Oct
 2026 10:04:30 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::25) by SJ0PR13CA0182.outlook.office365.com
 (2603:10b6:a03:2c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 10:04:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 10:04:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A639F406540;
	Wed, 14 Oct 2026 10:04:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 900D2822551;
	Wed, 14 Oct 2026 10:04:27 +0000 (UTC)
Date: Wed, 14 Oct 2026 11:04:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] ASoC: codecs: wm8510: Fix definition of ADC
 Inversion Switch control
Message-ID: <as9TqhMCGdUkpkgC@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <6ada61df8c8fc97ffb1623e74f6742ca498032fa.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ada61df8c8fc97ffb1623e74f6742ca498032fa.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|MN2PR19MB3807:EE_
X-MS-Office365-Filtering-Correlation-Id: 886a0ec7-4152-46a1-4a2c-08df29da8947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|61400799027|36860700016|22082099003|10067099003|16102099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	klcUUi1Kr+yW/Gvvw6z7vZQSk8obStoEHkcnfl96Arc//IfexyMjaLwZOpTIE0FT1LWa//rS8eEi8SUeZ3jYVuuk7++UkKHqBFeE0AlpCbRc1vrXUtyEXGzhuXeDW9CbFQF3K3tQcgxEIAZ8baozgULlilTlSqsdyYr2IpOsfh7jMYe9BOWUVQDfM+7n06jIucSWUF6TWEpctGYqr6o7sPLGn4otaSsWDJtqbov8KjrPewLy+UX9YvHy5+lzCAswqxmFhizixgyiV/I4ncEcGENdC1qCGu9fOgMTxmiUEltTdzdP5mDtCf5gcXjkE68b/Mdtc+YWy/3FScZDszExcQCjo+f4jZEg9P/5lX/y6PZUAhAF93qFUJnuQGKrpNpoUsf/R3VDu3wjXmwvwS4ZIkqkYZWapSjVaPSTzPLdqIcg+HXX+m1fRMWv5rE5MGg0n31den38XKYuLUEbrJP8P7NXw7c7UDQjDVQeQlM65/+UaQlfBoVb85iMBXNJlh1ygla01wXlLNyIMLQtcqsa0RSW0UbXbhrfCgwYVU4L3f7oO86FUVUbf7jEzFJDOCV/yqYYOCpqn7J9KpzrEXLjtKF/OExYhiNLxK31ALcmb2gPkANUxxEm7qzkujLefxWaFo+qf6/whumh/YT5eE70o+2/9sc0GUuBRsxBD7zvWHh4c9DrP/+fFse2DBJf0Hp4tlVYhnrgcv0ROuNqV39AOQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(61400799027)(36860700016)(22082099003)(10067099003)(16102099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M+3EKECBUL5H575OvRPaj2l1aufciA4m5UwtMTT6aKMmIrh+E7TXuBZ5MyZsshi6hBbUl3Owd5Hs7ceN3f49CCPHYg48DBIrudZ9k6ECJsso7unvPS18UW7ts9TE8olkBW8VHUZJ/sUfdti9hoUzKV7LnIBNGaW2EfIKWDhiJeQ1NogjyKYbQ0rL6QzjZeNKuQECyfjsW4k+VJndfHa75YkP4EvAgugAX5gdK/94oVk3p9zPHguXZx1TSsIOvwCWYzJMr0Dx17RxETEqkZNNO0IRuFsOTspzhgt+MmBNU27Jjj1V0rGmxJxZBgHwuQ4vlDWdxxqGmby28uThh5ysrh5MXWGJnYsFHgneLaEMc0AbSF3jAG47Cz4rVXEw7ynPRHfHTZ4Vzj4JTRnnJ+BAQA+KV7WY43QOXRvzcC0/Am5CTTIlwMK2MRn/gsVYTCdl
X-Exchange-RoutingPolicyChecked:
	nM86n7dRfSS0PuhlPWacve7cjuCfjFbQUC1Fc44W11i5kqfwicCKG2CEiUJBzMHVQD4g8n+FsTEp2xysfVxE1wR6irlmHecZnd6y/Qt97Isf+IYHIslq+BwtVJdSLf3uN9tQTyWTLDor0AYG9D9FBHSWigWEcFqvlFVKdx6G6ai8Hf5NEwDQATd2nTv1LCmwDtxpDpwsb6HxW9sqKpcGsAGsCtd0Oid1kNaKZsPLS4xVrN17Ul2t0YTiRl3KVtbc0DDR1uJMuZggvSMqL6ucLr/sGnl/QN1sO7GDmG85IOfPO61u1OiZ4gDbBKbjeKm1U4+EAh/HbvCPO+ulRNcyEg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:04:28.9495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 886a0ec7-4152-46a1-4a2c-08df29da8947
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3807
X-Proofpoint-ORIG-GUID: NofFz7TynLt9p8-7fum8dfgnkyr7RLhN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX83UAGQczdhxl
 orM+xT+4vG6oyp1lkDlDn1YbuRQdk7WcoK0TEjLhL5YN5IhsX2bxZ3aeTeZdq1ZG2g9cf/cBt0o
 S+OK4toejMlUvJOjjgDW4Og1Cybc+5c=
X-Proofpoint-GUID: NofFz7TynLt9p8-7fum8dfgnkyr7RLhN
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acf53b2 cx=c_pps
 a=fvxyH4qKXv1/d2JvU+h8LA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=G-g73vmNBXLAAM08dCEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX3+vzS09VPzBk
 SF0k6vUDm9CcV1b4bahUF0LLyO93E8lNiHVU/IyVQpjW0aKzIrySIbxhjK/LqYjSz7Vhdh8/NmQ
 F9UvPJnVLzOg4BUAkGz5HgbYfiA7Nb0ASer5Xm+FBfwH7JTL3TMawr/PiuX03wLJHoYfbey5phi
 KZLaj7Yol5xUThF4Ciy3AaPEw7eQWIF2VnqxupH2PMofBr36A1LX36oNL4681MRKicODXGlixWk
 CRbPzKu2Goys0/N/CWyYbfqpihJUkRizvqPOuWHmV7x96zjwdJP7KbBByggGWoFleTlLYf8/wPq
 2XKW/dvki85tok8P9CCkph527MfGWrwfnHdkokuTlg4G66n6nx3fVYKTK46qPiR5AfTJ95bEEOs
 97woccuX/WSOXkGFsxQ8wQnp0Spdj1eS3Sd28I8bCDH0fo71FX2nlX6AefHs5D3++efOl22wMMq
 a9TOhz+vy374Cc/YLhA==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:40PM +0900, HyeongJun An wrote:
> ADC polarity is bit 0 of WM8510_ADC, not bit 0 of WM8510_COMP, which
> is the loopback enable. wm8974, which has the same register layout,
> already uses WM8974_ADC for this control.
> 
> Fixes: 5d421516670e ("[ALSA] ASoC: Add WM8510 driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
