Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC69843802B;
	Mon,  5 Oct 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205923; cv=fail; b=jEBirRKaLVSRtHORQrq6mx9npmIAVOWzkLv2MnyIN4EYaMEbXo7SC6/Ulf+lnDpRIwYyuApA1p47c7zTdolDNPrurGRYSB0jcNohGvxqb1t4bR5o/shVGPe7tbleBcwkazutKJumgDU7jTNxHFXPxxRF41vmuKe9+2Bp787IBLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205923; c=relaxed/simple;
	bh=ATlw4fz749PVMLwSOWLmH4y6E2F8Cbjrlo9KAPfAuKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6TXaRfPFrA1UezjkuDl1l2wI0FsOkty4/HVxa8qeUmOF9M1BvJMvExKBk23XHyZ8EsJKe1JckQfnARkz3rTmffmoYPS6Z9/Wijb8rQjqdzbdxqQYRs3xpiRI74HCPKVL5H7sdxmmQeG79C4Qt/EMzU8UGJWi13zLw7BJg/RRf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ce6Gjd+N; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=OiU9ox6c; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ce6Gjd+N";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="OiU9ox6c"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6956Sal94143472;
	Mon, 5 Oct 2026 08:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=/lJ9aOxZLaew1ADqeg
	2h43jrxIwzWKjecAsy74DGE7U=; b=Ce6Gjd+Nmk32mmDA98Z3s9pm+xxXzZwxv2
	TeG9aofY4RIWHSTXGc/7zbqCdneHYOLqgFfMsD/Zsbly30yGOZDWrD3HyTTDA4s3
	kw5LmlGKosgfOQqU4X/3JuzPqOLqyd4T1TMUuo7s8g5SnLhJXaj+sWNCPU66/3dC
	hFg7LKTBYzn6qPYuWFYekW0YDKnb3hZ5hln4HlXYwEjeSPcBnBtPAntbXlBbs/mP
	Li26YSvv13DWydi8U4dQqQ7O12bUqsonBLYAM7jFx5EDzBKpUR78Mr2TgPVsz3am
	LvZh/I45NY3XZPTnhA5WywF3++MVQYhtl9bscwLYOW8vbzQURNPw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020140.outbound.protection.outlook.com [52.101.85.140])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h2y3w9x11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 08:11:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dg+6UNkOHc5dE70VwIQqhoqlP+0nE7+BZU7hMboc/a/9rABQ//HZLj+e2Dc41WSrvd1bFLpidISrWUYqacVJbcumB5jMYToThBDMGFpcoEkgp9lQA38luPYbugB77nauDxFSm1Bd2THJD8OKYzPd8PZMx7uxx23tpQfi4rjFNg2v9lncyDp4IzPVhPXNuEab5CF/CH40ao63GvknnZceXUW2jOZH7bOPPkBJ4A9h9mY8h7rrsPomEcQcPzoeYFoDCMX102484v3ujFWiuTF3ZVy68cw7p/7NdzIbSi7Kl9eEHoxx9W8Hrqy1uQuSj2tiUZpllqXwTFx7UXwE136qvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lJ9aOxZLaew1ADqeg2h43jrxIwzWKjecAsy74DGE7U=;
 b=wH0vQJbQuxJS+sWcSIrkoP9lX9SrIPEflA7qjn6pXKYr341rL87hf452BJokgjyLfTsZqXHUvZtKKdAUd5Hikv8E9SqJnmcD5ymkuCT8DLMoLzfFNYdIByRbuYJNeb1xYuAbzSglWOHKXuXgggb8djoYTBH2z/93zo/4Uu87vG256JEU+T5CJmF1XSJGnYza9MsfCeQtEgpOUETkXYKTJ60TqhHWY7mwSZrXr18KXl3XV0R8mJZSKOZEsbOGKawjZtLHmUXXPAC+rzdnCn1dz1VnFYaAVBuu4xAmFolmMIYkh+5SDmrR7AEZ1HfKHwpwHYC5VQlgS1fR8nc1nkP1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lJ9aOxZLaew1ADqeg2h43jrxIwzWKjecAsy74DGE7U=;
 b=OiU9ox6chk8z+bZ+HWjk1os9/ufhJ3RhqgLFXikdl1dkTS+Z+Xt2dm+J8yQekPj5LS+5wOxkDUx42Dei/ufQ6WZY2ZvdZwX2GtCX/Gs0OW/WZXhyUcos1GWDkb7Q2eSv9JFo/YbcGGJ0txf+fQ/eEOyUG+ZyNGh+h6k0sc36EPU=
Received: from CH0PR03CA0103.namprd03.prod.outlook.com (2603:10b6:610:cd::18)
 by LV2PR19MB582539.namprd19.prod.outlook.com (2603:10b6:408:422::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 13:11:50 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::1e) by CH0PR03CA0103.outlook.office365.com
 (2603:10b6:610:cd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:11:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 5 Oct 2026 13:11:49 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8839B406544;
	Mon,  5 Oct 2026 13:11:48 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6F31B82024C;
	Mon,  5 Oct 2026 13:11:48 +0000 (UTC)
Date: Mon, 5 Oct 2026 14:11:47 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Patel <ripatel@wii.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asOiEwRp77ETKznr@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <asJGxhij4OzWNYn9@wii.dev>
 <asN8pXcsRRRrwp58@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asN8pXcsRRRrwp58@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|LV2PR19MB582539:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6eec57-e99f-4762-bc9e-08df22e23769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|61400799027|6133799003|18002099003|22082099003|16102099003|10067099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	hiRD2Ezih9eKWq7qbUHk6coN4Tc4RoWY16+W7AFRXTbROrrDyXdT7fDUg1Lxse37GMIQyDQGlObdU8tR3snuhnYmIg6QQs805If0gKXiYr+4wfImfQeAexliqq4Di1+aM07/V2szmcK6BClAoOXANiuPSlxrlrht8pGsbH+9VR96rlPjOSpWkH7JEi90W+O+YLOSbHzooSWSKuOZJFf4nuf8+KRnQzm1KZcwCqk/tP9hSlDymxN6hRp5u434l0mD5fvwQ7GccI4FYCZi6c8mxl+Zq9Al2MmM4wfBMW8RNWjN28WCqZxevQa2CdEGcdeT4sOE94cf2f/y4hdvvFJrYKiXrlaP4p9TnINQJiOeqE0OnIpaQpvravsxDpzjYiwnyawNK8s2Oy/oAEoYloJ6DdD/A2HdlEqzdMYxB5qd1G3wqu5NpTMC987bk6nCIg2iDFlxrhVw2ujax2Djq5BjeQsuaAGdVFcLvqLYYAtHNBXg+mlVqDJmqvZjAwjXg2Z69CjG9lmIoTOBUtQS1kQvIOH39cY21+LVLDApFtQN8/yPcFjdz/Ki9jYUFho9UV+H/69BTUCQhMc9LfoL3uEzt/yFObwdQeQptc/JoItGLvjMOxvYclmDK+sS1TmXgG2Je+J5tkbgKIMe6A5uMMblOjxlUOp3UNiYX5DG2z9Dfz//zH4Im8wWq1u3HBDjHw3d4sjTHWihGC8NN8JZY+m/fA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(61400799027)(6133799003)(18002099003)(22082099003)(16102099003)(10067099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eoDIrK23pMZ3rEHti7QU//CEjuLBeZSn7FPUzobUPGwSs+5+Y9C70NjMTYOFrRgU7YUJU/2tgySgMEU0qDvLZ3MC/EaL1Sak+foph3izR5S0EungD9UGnBIEUwB1aBTQEB9NZ73PASm9wOiW5Nc+fl1h/Yjur+pYRoz4Ntn/fTJWSc6R8I6QPq0tTCfAhJc8raj/y5nNMNEzCUL8TQsf6UyvQIPFlJPcEr/Ckh9FLGaMZ7x2XE/3spD/bRN5WIQDiQW4odhZICOTaicbTXc9OiFpyup1CKPZsdsd1aIU1IiHIiiP17K8dQ2x0+pGtdvmnwgL6cAU7iqpxFSg1+VVARojVAvykXqA86GZQlZiuD6fKJyj14DQQZ3yitOHo5Hk8MGOcuJaowjgzrczo8b8P2DpHb6wv8jIL19i57gpwLxUqbyMejpVOzK1hN3HwikM
X-Exchange-RoutingPolicyChecked:
	0IPOmmpR+jEDSk7nmqos19DF6UW4Eb+aQZeXcnd53VVm+Q4odSXVQIJoR7QudyrIj3zLUHqgzs3FLC/Mhu/QkMCZrDbL5nhsZ4uvhjjX85H8w8LHcpCTz1aR4MY6PTcceV2Ad+VBez8nkZCKX7ReIPQ+j0qcugkB+yY/Yt48lzUa27QB+Xcv4Gnewfs3a7nVGI1nOx/BYjsSyJqe0wC+m2ZKaz1YYzZJBISFQL0Is5nK0+uvTdk0/R0WWqbJK1vNRseMyrwTG9ayAHXbfsbt1GaY+meEEGf6+96a26RQ/1pE5D8lt86d7OXA6TAwPPKz143V10Uo1Dba2NY4OVYrdw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:11:49.5110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6eec57-e99f-4762-bc9e-08df22e23769
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR19MB582539
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfX34XYFlJwycRn
 c+AcqQVD1ryKLZ/6NtuAL/sMTH4rZ0sohacIdRg9rFmdidLdRjxYel0X34DvpO8N++MGJKhRSA4
 KXdSTQ/HkRb2DS4LlsfNGXlNpCVVuH3icv7am96is2aas7yM08HKCTjPer4M6tDkKk0IRslGRUY
 lnFrPiNKuEL2m2xpIdrecvTokCMxbNq4KQV3/k8nKlxJtB2Xf26c6J1TX+qUbzLh2K6V2ht7pqf
 /G4dlFMH0o4EjumNTJz5JYRb9Kb5CVHAR31hmwI3hN8EvqE5rw4ojpkqUam8QTESXViG+gzuK2o
 qyZYAa89w+4fKWeavcsc+c6S5PlDpYoS6WClGd4iCCJUCpUfkYT1zE1PDj8M/Tv5c+GsLJBBte1
 WneS11tp8SlMHtI1QSGy9ClmXo71+V6gDaBAfzhCzXcGDuXqQDVBjDj+quCrijKASO6g9eTeHZr
 xZaaCwTCjxTnSHwLNyg==
X-Proofpoint-GUID: LEUwY0_swf8dKi66409qUKT31bnrwppi
X-Authority-Analysis: v=2.4 cv=XuFvqlF9 c=1 sm=1 tr=0 ts=6ac3a219 cx=c_pps
 a=qT2ADiACooojDGKohgXUBA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=cPi-fgIWLLl5mz0p7eUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MSBTYWx0ZWRfXydkxgClEOoEm
 vwbycijpn9Hq2pmBsvUW+9prfO2BswyLB4OCJICkbpS/edg2qAJ4fJ+K0BxkWD48+WUSfogQSfr
 pGDfOJzXtmAVfOfbIjkp17fAHUkI1Ls=
X-Proofpoint-ORIG-GUID: LEUwY0_swf8dKi66409qUKT31bnrwppi
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 05, 2026 at 11:32:05AM +0100, Charles Keepax wrote:
> On Sun, Oct 04, 2026 at 12:29:58PM +0000, Richard Patel wrote:
> > On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:
> > I don't understand the code very well, but isn't there a second UAF
> > with the ctx object getting freed?  kfree(ctx) in sdw_intel_exit()
> > runs well before the IRQ is unregistered.
> 
> This situation is unfortunately fairly complex, the IRQ is shared
> between many different functions and only the SoundWire function
> relies on ctx. I will do some more poking, but I believe the
> free order is such that the soundwire stuff is shutdown before
> ctx is freed. I am not 100% certain if that will prevent the
> SoundWire IRQ path from getting called, although I would like
> to believe it does :-)

Hmm... ok so poking this a little more looks like I do see just
see these freed in hard the wrong order so we should probably
fix that up too. Thanks for spotting that I will have a bit of
a think.

Thanks,
Charles
