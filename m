Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155B649BD83;
	Fri,  9 Oct 2026 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538974; cv=fail; b=u8hbkM4ua5blMu7bshKO+BigK8to1zZOtY8uvAhmlAw6ef5oJ0kH9pU2T+/UzJpwpP9wjNZO05a+PECxvQWG+HjPmmI3RIAgVyxLeBqfvkXKJfQybYbAqRoCldEfPcOXbbjYsmyF9893/AxaPl23st9TGsOAF4ohxsGMrG8bujw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538974; c=relaxed/simple;
	bh=SrkNwwVMOPEgZh6a9teDyGzKQyEdNXs2R+7ykyPyA7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HUU2QrKSYqv53H8suJaeMDw6dGV9kVovvUv6wgiKNcNpkctGxheYaCZgDubY+Q6vqSap0yU7OFBQux0WZIABYx4EmAn2KQ3GjJSr08WcRWBcBYwcVeUX86opzyEihIAv6Tnjs7sjZKMJQi03+QAsckOf4awaOhtl3BeaIYWKvTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ISEeciHd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yigXpHuX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ISEeciHd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yigXpHuX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6990e4771864460;
	Fri, 9 Oct 2026 04:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=PLxxIZyI9xSpQ8X3x1
	y8CvkAuvYjQFkbRcOa40k3hXA=; b=ISEeciHdUNOdbR7s/r9xlcAi3PK1Eg3vs7
	QYGLdU5eylIa2HXnO9Uz6VeotsY4D+edTPaa/iHbEPJ0MohxUcxJDWNU2jycwY8I
	beo2kCM4ez4T1AuctCDSZ9nn/tDl1yg/00rBxipaM2h9s9EagZTYE/KP8XmNTInq
	vR9xlvCGKUc7BzC4uaQZ1G3shThcHH3N1w8qO9ARr/dc2AgSkZXB0pUubKIf7Tmr
	GPUrgd1H957ruYBfrFFn43c23cqW//TjDqns3Oixc4zlWLT5Dqzej8ZBM/xyESsI
	hQpCgfC4LTtxTUR+l7h6V7em49CyDSpwPwb6I/9lFTD+f7iUR8rg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020132.outbound.protection.outlook.com [52.101.201.132])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h5xd7aeq8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 04:42:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Juhe84gpGpIS2upm6ymAygQOUvkUYVItawliA2NSm8mesCLlw7Is8RqnHjGu9wEYc+O1yszGa0X7rqMggXHtqx79FAdyjeKPT9KmliVCkMYnKBakS4/nZH8jQGbPylXjRzD67gCEyu8vprfh7C2JywqA9KJY6cO7VpMit1Bry34PMeLcSyl5EkwQ7M0LJ9lWSxjqTLceDfD7qYnJQZpMaz0slwtnCHpyrzs5txU/624IGLiuoW8ZUqCbuDO2VZk1XZk1xRZMjKLt+bpnQCC1W7wf4ejUfAKWzUvBCvxTyJTBGwxdZYtdcqz+W9y1sm4POgdQ9jX6mkBjcgMJX0isEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLxxIZyI9xSpQ8X3x1y8CvkAuvYjQFkbRcOa40k3hXA=;
 b=DodWRI2uNHMNq3o0UaJAEshXhxQVMydVbMMvqqReQZXqmR6ClqXlDAa+eeOnlmiEjuPrDYjImNa0Su6/jBFzfMaEnCHXGVpN994ZjjwuUfH4aV/zYCgJtf0iaf7tGctTHq84QP8gd+zZ6k1Wvu5WjL5D9tH/LssCOm8MOk995wVq7ulju7Qb66KIZ/GKq9YV+a8hRQ/fPkHuHP7PZYsSzXkzhNubXZZ5xgkAWIPdxAIgxGOEi3aNOmvPuXELb4+f1k8x/6oqc1In1MQX6KU/NJlh1suCSbKNY0R+jFg7lBYyUNZcJW67JbG7SQUSyKjs9IyMRBxbVHaEb6eGiOTgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLxxIZyI9xSpQ8X3x1y8CvkAuvYjQFkbRcOa40k3hXA=;
 b=yigXpHuX8E5bXhZnISTwNRdce0nJPOZ7APzOUbAu4O7FNL3osJFsq67NdUdxqeahfpZb6ovtpvfPxvqq97T9x3DzqbmGkzPl1nxSrmWpG815T5qHQzG5Vwvf1pG4ss/SFTLxrMK70nJEonR6g++u2OpW4Jy9lAeewuMuOdxy9JA=
Received: from DS1P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::18) by
 CO6PR19MB4786.namprd19.prod.outlook.com (2603:10b6:5:34b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.17; Fri, 9 Oct 2026 09:42:26 +0000
Received: from MW1PEPF0001888E.namprd03.prod.outlook.com
 (2603:10b6:8:455:cafe::2f) by DS1P220CA0014.outlook.office365.com
 (2603:10b6:8:455::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 09:42:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW1PEPF0001888E.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Fri, 9 Oct 2026 09:42:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id F39EA406544;
	Fri,  9 Oct 2026 09:42:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DB0A982024B;
	Fri,  9 Oct 2026 09:42:22 +0000 (UTC)
Date: Fri, 9 Oct 2026 10:42:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Patel <ripatel@wii.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] soundwire: intel_auxdevice: Don't disable IRQs
 before removing children
Message-ID: <asi2/benDDdJosVi@opensource.cirrus.com>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-4-ckeepax@opensource.cirrus.com>
 <asJGxhij4OzWNYn9@wii.dev>
 <asN8pXcsRRRrwp58@opensource.cirrus.com>
 <asOiEwRp77ETKznr@opensource.cirrus.com>
 <asePYrXFHxHNssgK@opensource.cirrus.com>
 <asgjJLeH12OAlYai@wii.dev>
 <asit3WWNt0/iRnyc@opensource.cirrus.com>
 <asiygFiibqjVL1AD@wii.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asiygFiibqjVL1AD@wii.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888E:EE_|CO6PR19MB4786:EE_
X-MS-Office365-Filtering-Correlation-Id: b9fb11b4-561d-480e-5cce-08df25e99fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|61400799027|30052699003|23010399003|16102099003|18002099003|22082099003|10067099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	pbtt4kyy6byjQd+3K++OXR8r95iHHEibsSO9vEFbAf24X0/oryZHeKvBqNPcS4pmWkrPHy77dTNJHne2lavXVek2NSwi6VWAAojg+IKFCkCdSZHKOSTBSyTFPQdXeUn2JX9LH/Fxt3Ecp0fEIFoED/+u/1SWki54ZnAagkAYXgLw2qNTmEcWZEUxp65qqYNV2h+3IgY6Dy7O9wihlLGo5tlBKIIwoBpEA4j2b0T920mjf5lEdQQu56qhuV3D2nhPI151m7qIl35EvG/VkDgPqEGIbRFs4tiUGnfx9yIS7cUhoZfS4oitamGelwF4E4H77UkSqYAw/NI8nHpS1IVabH/we8HrP9W4H4YHfxKdWz1uapyHRIEsqTNpJJCUnoWW9e6ssxiQFO0yJlD6DS5369cLsnVHaRGDcyaUnhfY7xFZOxHuyZmAZp1Hc+Qp1OXWVxAjXoh/f6OQyJOl2LZzoygv8Uz3pYfQnjjKbYGdhjFAqInG+kqw+ZwHQRRK6B7ZXx/nL3bUBH+aqIx8pmg7WmbWkJulv21rUfZHd6M70PojbNvNdCKnDEcM4iNEJjnQsm+o4hdjHSpprwXhCjnHTECFRdb8FiIEUoTb6RuMADSSN1W92Z2OdIRI+Hg9ms4WHWvSjWILmyWN/Utv3e9TNpbU1Fc8aqD/qRxDCB4FJBUiS+RpS5WjAzmujIrkPkLYBfGlFhVuYl5JIh/p+MfkcQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(61400799027)(30052699003)(23010399003)(16102099003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yFv6KoViJ3nrF0RC0NomZ+cmuxUWt8ibii0m51KnomxfXsBODPOcywGXu16l3MUoc4hkflUfz34kIySUA8CUBhweah7timy7cllcD1HSEAr5ngbXNE962bHuHp22X12qYNioecQU8/I0s2Kbco6mbr+M2dfdngW2olnLAFIytuf4JwDZrzPv2wo6ac/QwRC+21VGIpVNj/n4i278Pd8wCxqeE3AYtfF3Y1mETdV1MTssrg8Fk8NdknoDrS6ihksXdU/TvWefBEw4aXrILW2mlJ3//XMCCBVH3moCN8dpyrZFFmigDhAAvjgS9pml4nmTvedIix1JwNWVuzU+YdoLBYttmxv0VwafonwTSyr3em0fnUvMqFJvZJfghKfR1ZL0GisDOrTdZTT4gdpdcA3/a1ezC7xpmQQtYAHNHI+xRbju3/FLXtMILJ9kQ9EToo+e
X-Exchange-RoutingPolicyChecked:
	OeBad8ZstTArEcJT2KMZPMPlb9b6PLf+uWRg5IjpyKVu1IzxF3q9+kg2tqG8tWdTVwsb0LHiEiWUUayHUEExcOQejcRLBsEpy3h8OxZo93qhkO71XJoGXlOx8+sSZLzKS7z0VSh7WvTmg3RaFGJqC0xrS38iKLGi0P3fVvieH2kUXHKgb2Kc1aH62537OfoTwaSwgaDsOdMvFur3YWDeg9mLY1uT3YYqiNXh2ugvBzT1cT22nle0drRK++CqGIi0w57Wq+wIEdUwpD0b/T2eu2OGp8qjku7FS+t0mXMYfhH8d+Q4NbdcfbE81ZN1IVxUPzItfVgJp2kCXqoitNKW7A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 09:42:24.3759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fb11b4-561d-480e-5cce-08df25e99fb5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW1PEPF0001888E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4786
X-Authority-Analysis: v=2.4 cv=OK+yTiaB c=1 sm=1 tr=0 ts=6ac8b707 cx=c_pps
 a=h0UhqkblQSf2I4YTj9MQng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=9XEnJ5pHo4h_zyAULegA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOCBTYWx0ZWRfX643h+Qke70Zd
 LaUQjcnQZCXLVKuluDmj6FKBelvApYkAGca1EUSMmmfx0g9jorJg9ssSZTwdnDD5ErLnf1ualfA
 HzRukEChN8CTpazyiIXr7ERZnl7xzrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOCBTYWx0ZWRfXzTC64HSxnAfJ
 RlvlMLjP97Br73Mm1cnaADy+siMmAP4GhnnebKgm7JIhxd7jsqpw2slgUiYNfV1gZ6gGoYji5Aj
 0M84HWLK/XxeCDCMcLGSMYhoPfYDY2bhVRY/9S9mHnaioCtWN9yz80bb/O9xo4ZJC93ZX9pyl3F
 GE7Z/X8uSWlLs3dRL+go3ipnlHnvfDNg1cVYh4PKlhf7WWXlaIUI4PDKz+UuwH04e21OQRjOP99
 GXeMAxyKSixlDPya9ECRPtqoHFt+qbbU8L2lao89K8ul5r4ACMkKeQbIv57axCMVr0ORJTFDwyf
 QQNR8MY+TKGFPieX8PBgm49KRmuYm0N2s+yqguoKcFlDZsTmK2Hyyu5BZnOX8vw91Hk1RFwu1ya
 LIYTGmyB8Hp58FQycwlOK3ZAUkaHaGX5pJinPZ9E+WgsiO3RNtyPqj3OS1EODdWYdHurBEdm1ds
 +n12dutKyPxRVq2+jLQ==
X-Proofpoint-GUID: YD10n0-4YVej6cZcIqk5iqqBEYHwuErV
X-Proofpoint-ORIG-GUID: YD10n0-4YVej6cZcIqk5iqqBEYHwuErV
X-Proofpoint-Spam-Reason: safe

On Fri, Oct 09, 2026 at 09:23:17AM +0000, Richard Patel wrote:
> On Fri, Oct 09, 2026 at 10:03:25AM +0100, Charles Keepax wrote:
> > On Thu, Oct 08, 2026 at 11:11:32PM +0000, Richard Patel wrote:
> > > On Thu, Oct 08, 2026 at 01:41:06PM +0100, Charles Keepax wrote:
> > > > On Mon, Oct 05, 2026 at 02:11:47PM +0100, Charles Keepax wrote:
> > > > > On Mon, Oct 05, 2026 at 11:32:05AM +0100, Charles Keepax wrote:
> > > > > > On Sun, Oct 04, 2026 at 12:29:58PM +0000, Richard Patel wrote:
> > > > > > > On Fri, Sep 25, 2026 at 04:42:16PM +0100, Charles Keepax wrote:
> > > > Ok found some time to look at this properly I think this is all
> > > > fine. sdw_intel_exit() first calls sdw_intel_cleanup() which will
> > > > eventually call sdw_cdns_enable_interrupt(..., false), which
> > > > should disable the SoundWire IRQs. Then sdw_intel_exit() frees
> > > > the ctx, whilst at that point whilst the IRQ is still registered
> > > > one should no longer be able to see soundwire IRQs, so you shouldn't
> > > > get a dereferencing of ctx.
> > >
> > > On my Galaxy Book6, I was able to get a ctx UAF with your v2 patch set
> > > by adding a sleep.
> > Hmm... yeah, I guess the masking ensures a new IRQ can't come in
> > but nothing ensures a currently running IRQ is synchronised in.
> > Well assuming the masking does actually prevent an IRQ coming in.
> > 
> > That is a little awkward, normally freeing the IRQ would
> > synchronise it but as the "IRQ" here is done as a pile of
> > callbacks that doesn't happen. We could do a manual sync on the
> > IRQ but that feels like a bit of a layering violation, since
> > the actually IRQ is several layers away in another part of the
> > code. We could add some flags/completions such that we can wait
> > for the current IRQ to finish but feels a bit like adding code
> > that shouldn't exist. I think the correct solution is probably
> > to switch the handling over to the IRQ framework.
> > 
> > I am going to go for the theory this is not directly a problem
> > with this series since the problem exists unchanged before and
> > after the series. So lets not block this stuff on it, but I will
> 
> Yep, sounds good :-) Thanks again for the fixes. 
> 
> > try to find time to start porting more of the handling over to
> > the IRQ framework, or happy to help review if you would rather
> > take a run at it.
> 
> I was going to defer kfree(ctx) via RCU, what do you think?

My slight concern would be it is tackling the UAF directly, but
really the problem here is the IRQ handler is still running after
the link device has been destroyed. It seems quite likely you can
end up with other problems, which we may have to add other
mitigations for later. So doing something to ensure the IRQ
thread has completed (or at least the SoundWire part there of) in
intel_link_remove after the IRQ is disabled feels more robust.

However, that said if the changes are small and neat then it
certainly improves the current situation, so I am not totally
against the idea.

Thanks,
Charles
