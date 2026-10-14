Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56B3C09FA;
	Wed, 14 Oct 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971980; cv=fail; b=npPMo3j0D1tYZZkOYyFM22xrHWddxFScYy9awviPRnVpQxaQxRuqhwSm2e26ShQcWegasC88WsUlp5mPG60PMHzYANLRD/dsYTcr6CLTXGr9BbOlExYtMc8iCoYjdEfW3cqlZYc2enGnBQDD3gu+nfreat7+85ICKXLGeW4V32s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971980; c=relaxed/simple;
	bh=xcn90NQyENFukUyToeDQ7umFtWJ5KcaQpk8ap/qbtrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swUK2n5uc1j4Z9SkBNKSO+hIoGPxYe7C+1MOQuycx7ecR11RdAtzWWbIZjAxVCSQViLv/dB551cOxVT2u9226TTTyf3iHgOkYKx4xFXDZli2KjXpvfeoAGNqhNhQOH5wqfc12wsIPAlg7AcEJqmivvmVbVjG4KKBsPZVqJGp7Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JCxYoed4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bb8VPdGV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JCxYoed4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bb8VPdGV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9oun3388619;
	Wed, 14 Oct 2026 04:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=EEKC7BqxrhTScJorJC
	zj/1zCfP5wiWM6HqyzI3a0k4o=; b=JCxYoed43JtKut/hbc6CyuIhC3ImcKQboY
	JyJPc17YVKpuF46wshV+J6vdZJzdkTTlET7CPv/qWHZfPMAZ8GBbD2SAzIO5/XMA
	qmUbxEcjtbi2ZWBo3QEnmD28PQx9RKUvDnD08LSzngVJepXI5T7phlIWHW/oqIov
	I1Q4bJHSVpebRok8u0I6118oLRRIWTcxvwBAefJRLpi0e1Pj6tCWaCvzmWwOsDqZ
	msyIFguO6KWZBEidZq/ByNyZ9yFrZpos3ecSE1n+WfxP7XPkKVDatWsDymjrGtv3
	xkHaWAupOHzizXE75hNnVTk5Zlm9lX5Fra5lmy4g8wuoPN5oVnZw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020125.outbound.protection.outlook.com [52.101.193.125])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxdd1y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:59:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AIwbabVdx59mzJqp3XU8I3QQ8w3eVaqc+Y1x6VN5CnA2MdTaqk+Xn+JDiId0Eg4rFaHQs21g8xR+N8l5veaVBa/Itgl3GRMVpk5sLk2NDbT5UmRuKIeXg83rq4BVBNX/Z60KHOqKKotzB+m3kNIvdSB0oKxONyCJ/5cDP9vCNDW9IOrinbtyYnO7eTWKwLuh2kMxH4axIMnaEvsm04nIrwgYmbanzsS+KZ8M/q+Qmv5N51gYmGh5trFgOmg3odEgqNiUOcXdYrm7CTBOVexxa1enOZvUdpzu2/TiZsiWZhECeqiX0EKoW2f12DIdcSK5SDXx42tDo42jv80EssYNeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEKC7BqxrhTScJorJCzj/1zCfP5wiWM6HqyzI3a0k4o=;
 b=eQkiqdda4CkwwmamVomM6RF7wNN88KvODqYwN1EeVHjkS/HVUgXhVMmwrzpsMQZJE/qePyYKLvCbu38h3symvhRRqmwPObzMNMTnnMY3A5o+aJ9S+HPc01UUq9vyo6+7H/CO3qjDjqJ0gZwN39fdTMA17UdKnIiadvZHv1ssNuc8TjJDZ7JRksQoxguDf0PrNWLwm7WkUikr2MWi7BjRDzGdhzMT1NDxizathBwrL3GZ8GK383nZuhOsapAuWvLH37htVq4DiWwrgBL92bvs68osVMLgQVNEXbhXUROttu6OGla4LxwmJ87MTwtmagY+YF0yI3rS62S1bEmAsDwEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEKC7BqxrhTScJorJCzj/1zCfP5wiWM6HqyzI3a0k4o=;
 b=bb8VPdGVrDIV6CmAafpSKzP0Ymm9kk82Kflbk3duXRGWhQL8bpY2LfmUvGFbEJr5Z7pPrgVuN2iyZiP2pFXI2QVnCr6xZywF8gug6oAtcDQ/eFNBbQdW+XjI/4LW0KRQI7Nucu6hJ9VYjsM+Aou7CIka9CS+QA28GCRggoUBMmQ=
Received: from MN0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:52f::16)
 by SJ0PR19MB4624.namprd19.prod.outlook.com (2603:10b6:a03:282::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Wed, 14 Oct
 2026 09:59:32 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:52f:cafe::12) by MN0PR03CA0028.outlook.office365.com
 (2603:10b6:208:52f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:59:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.0
 via Frontend Transport; Wed, 14 Oct 2026 09:59:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 01FD7406540;
	Wed, 14 Oct 2026 09:59:30 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DC030822551;
	Wed, 14 Oct 2026 09:59:29 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:59:28 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/13] ASoC: codecs: wm5100: Fix definition of EQ3 Band 1
 Volume control
Message-ID: <as9SgDYOLguBs7sX@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <d7f690e391feda7a6d8f38d0b238b165bc1f4fe2.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f690e391feda7a6d8f38d0b238b165bc1f4fe2.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|SJ0PR19MB4624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca2280a-098c-4324-132f-08df29d9d793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|56012099006|4143699003|11063799006|16102099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fdllz0MZb9ih3vkTOBzD9FziDzhYIW+s9hSD79USdEX6xUvYVWpIMClV+ve2sEv4iaA1j1LSxih3QxCDE/UWyfvOrBYHNBRvQr+9CcjbfSVFUWrxrvY+hJVjGcH/H/YQFybWFR7kHcXwF+4Hbqe6ARv9Y0GGX92vTdSsdBv+CXsmJooOQwfP7wQwP3sKhxwwidAzHf5OvGNHVnzFn1wiJaYjW6vznTQJGB+cT4CJU8q1Z6immfI7XcgPem5EOCW1reXyf4XEPJkuXpbXncgmk/Gucudv2oJzvwTHfw0WLz9G7Hrt3B+bNhntihsr1SgbKNUfrPE9d4crp4u2uvxfUdsSluKPSvV4S/jUhUdQiYzJTAjhWQAVKpXYiFq/v+mmje1vCmzBU4Aihqz42wKKi9PYuIdJdM6yp5lcc+RDx/ugD7u8arA45moF3JU8RPA5NNT5mo8Iqvnns9W1ZoxIMOPWNIcTnMWaK40giMeGX0Sp812bHeQZj9Sjwb5pTUcYP4WD4Qkg0Gx0NMeKK0qNOnCRex67WDjPKn1QONjuGhWvTfYIGwSJsZXQNYma08XEOqBBFouAKu39fm3vSOvRxE+SYkp8HlCCKm6RxsvurMWximOtm6R8hNDaw9JR0etSIVj/zDlCeI713htbaRdt7J2lbKb/oI2FVb+JlGWvu+gc/o2tIdQmh6H0M9fGRjvhfB7cAw7+qjFjDEWxrdTAuA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(56012099006)(4143699003)(11063799006)(16102099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/8rP5aR4A1g6H4n0xOOmPBaZqGMWgQmLCmmq3n6BN82P2P3waHnjqN8OsET+iA08CrkPwJQq0+Mez5sC4wnbCpGrflcTj065HJ7zO8sh/H+yvbSrwgdf1krm4Q9bhqC9RooIgpeqpooNnuxtN/w/y1c+slWQA+uWNwZcCdY+No94T62MoK56ChB7xtSfSZWsXiZ0E4WPlnM4AvyIPovHYGe689r17KlHCiJcHggBBiJFjrYvVZ+dEazW+JKyFQ8z05NOmF9Hthmvh/Ny6DsuRrKXp9jCq9Fuj1is/qgUljb56Aj6Lr44hUnAb49lEG9s5JmO8KHJVdn8qAnz/pxZVhypltsddudek87OqrAoeHp9uwKwtWx5au2M2bSRTt/G08vBeCpQh2+vAW7BiO+BcX+yCOjlMitGlaiXIBu1dLT0ObLZB9rYARaru8w7GTy+
X-Exchange-RoutingPolicyChecked:
	aAsKrf2ck3uvp1WVR8JcHDiUkSOEpXA9wRVKehOw0AFRLQ0lO7HnfnskFsDi61loPVB3iXTjfDe3udvpsRCAWVgze0cOzMm1N2moXaIEJMV4pkMuST8SHDqu1t5Vavk4OXD8iM1CnxRTPDptZthW2L00IULEX2iy+JC6vegRtbFLeY8GoQVtVrs/cPLw+7ZOHgl8BXN5SZum83yM5vTjoxrnAZ6vcIwZ2RpD/PxOoGHaqduzsu+rUIlnaGBZuoxQNaRUemQ/G3SfyDjXC1702nlzkyzvfAhI3UBEz2uALyQstTu0a3HE0tlwRfqwMP3HYVYrCKghXaDz3JpRgeWuwA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:59:30.9147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca2280a-098c-4324-132f-08df29d9d793
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4624
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6acf5288 cx=c_pps
 a=bwebfZLPylI8eKm9xdhY/Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=5BaI5pJLSwOFNK2hHz0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ZvX0PUoV-kEUkcCN0-YrL7QxT4c-u_W8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX2n35VpaxeggI
 Ky+S6XHqAyOusDxgYI9xSunsemuNza6jmtkvOvRgYPL96Sm2d/u/POaXMPM07UJ4IOCJA4bcYBy
 s/NH+501Yg2+PDKsxv9vMcQmFtgvYy0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX8CDfd6YmoBM2
 Gg2DKQUumoo4FG+zvh/7xmtcx5Jeq+06apOCFVIxZ/U7RKZk4nx5FVAd9mHEfy4sv0XRIIyx6D+
 1dob/Ia/9GA/0DZ0v6UYurJKHFm6EIp9igkdnd2qGRa0fkWBgwID1XQKxUHqhnI/aOqtOTiMG2r
 8M78pi11sGM8VJewmFN5wik4bo9CHJ63k5qvAA39bUXs0avIFXORuNkuePHb9c22jcLHiEEh9BS
 gyqASHQEnVJz+Qu7P4h0RgNO9O7X8dGzNAwI6S+gmWLmx8ryCwwcKtNW9p6knYnKAgEQt6+strv
 9sMPaDXxvVfsAAxY0G0UBOIUZXqfLi6or0XMjRijRhmtQOyMniVPJ6oiQoaDPQa6BYC7STGjX8R
 bsi60+gTg5GDw5M22e8SUpjHHyjydlPF5YEK8oLSh+Yd3oalvFsi90H4hdRX7CwDKJubj5Qx3Up
 VMTKZY/qWy8pa8/gcOw==
X-Proofpoint-ORIG-GUID: ZvX0PUoV-kEUkcCN0-YrL7QxT4c-u_W8
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:38PM +0900, HyeongJun An wrote:
> The EQ3 band 1 gain is in WM5100_EQ3_1, not in WM5100_EQ1_1, which
> holds the EQ1 band 1 gain.
> 
> Fixes: 6d4baf084f4d ("ASoC: Add WM5100 driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
