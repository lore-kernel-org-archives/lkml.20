Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A1D440627;
	Fri,  4 Sep 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513856; cv=fail; b=az7dWTnD2HR5vtbAIqxo5xR5VUXdp3fq58T7VxqdWWx8PMvdVYpmupQyWCZJhZ6NNrChfnJ1jDcTag6YTROwVKsEyVBIlVDsw2Q+uAgHtFwA4PL9IG8C2cfbZsG1ZHUuCHaNPf65w4isqVraPWxmoXxQvw4hM7pfjOe3bU4MJfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513856; c=relaxed/simple;
	bh=6AvzzSrYn5Db9zuYV0u37mBCtDNbbbXAwe+qGvtt0vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgrEwYPjNUX5IfHzEbnvwd4/VBZ50i1bJrMZch5fbIW61Flv11WGfswfzy9T1nDctBAPEEg4mZrf3fELaq47SOp7OBs4g48tlp7xoSFMPQk/QsjYbeDkcIPeZEgy4444iAXvn07b/dQrm4gTmrNKHeHZgntmqks9B0jttF5/Y8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O7uaKcV6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ZOp1qDZa; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O7uaKcV6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ZOp1qDZa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683MtDKE1954541;
	Fri, 4 Sep 2026 04:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=0zAwEyDKTozun8HO5G
	n2RuxY1SMx0IyAa7J7kKsZdew=; b=O7uaKcV6XqKvOkQvtY4MsWtYfFCtISYc1c
	aZFXYo28MqbceEwfx4MTUv8ZttH2ygNnkOMAFIQXq2mF3fvzmbuvwmLurI2VFPg7
	+p4iMRI31cvOK2D46sNCEHHHm/q/PX48qACH7uV6ZZt3wzLzMI7klvC9amg84Szq
	p0CWDlGm5e9/+yCzBXa4jjz2XI66zkTxIXaEQyO2xT4o/7tcGEv6vloEnnYSEBY1
	sc51tkzJEgabsGGEqD+bjisYkvJnvWqkYJQay5s01NI2PFjhzOLJRNcxiBlGO84e
	nxXApCVyXled9wPXV0HLdkiAoaYyIvoARxjy3+XVe5Ac9MoQdX0Q==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazhn15010018.outbound.protection.outlook.com [52.102.139.18])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4geyrqj3jt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 04:23:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFWdG4VaCxE9UWEJdlX/JdgEUM6L8uv16j51nBbpb4Pma92+UodUVOKg+jrA2A6lTqO43fThID2D7Sqltbot0fFsfMW36eeyHJHRR2OQu4umrp6gUO8UebToXR7SLsAbn+W+Z4XyPk7CFzMJECUm8BonvdgbDw5f4yAEF+xkcB2v+UKKTYUpAR8v0/XFlkiL3omCSnLyUiAHo+oj6MUH256xpicrtS2uY3Fq33+JE0NCJ+RewD2R6/W3j9FJ2s4XjfYV6vd3KPj2t5VPT4bxAJsFvf/duBFeH4NorB1ruCNao2Z4/c7mlQOdrhC6OPtxznmdb/WaLgLxSLFvyIk+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zAwEyDKTozun8HO5Gn2RuxY1SMx0IyAa7J7kKsZdew=;
 b=rDwOcTAYk+BRUnTyTK0O8Iw7UZsZr/hSVn94fOYiedF6NE6WFzy3DDiHqftPEDWZieYB/hDEC1MmOVp3nlKIhHpWk/vEvs5+6SpXSs+esVK1EvN0ovoQqTePg1UhyCUHEwZXcIF6/f1Hru0Dw9pHf8np2Pk1BDLMJYU5FuPW7uGbuqH8fg7wqNqa+dSw6fFxmPMEFz2CijryHLKyvcKr1BibqYADns76A6PhR4jYFyygIo/2nQanveb/VCKD6F4ISzx3YhkXEA4Y0/C1/r60Jqrno6+9l8vOENBiujBufBZYAnbV85t2pp8jFFljcntVTFlylDXVfI333oBmqGTK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zAwEyDKTozun8HO5Gn2RuxY1SMx0IyAa7J7kKsZdew=;
 b=ZOp1qDZaM10UslpcZxuU1/vW0IG8Gvx284hfV3k3cEqpqmBkfcZ5cGWRb+/JMsBB6H16cnT4yaxQSkFuGeLacsTqfl4sQE4JjiTqKatPwOdLUSLWkx5EbdgrqRBX/E0/c1tRszzY9WHbcLjWoLsNaO7v3SGdONVHLPL2TXNAVpg=
Received: from CH5PR02CA0014.namprd02.prod.outlook.com (2603:10b6:610:1ed::18)
 by DS4PPF879E7CA97.namprd19.prod.outlook.com (2603:10b6:f:fc00::a2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:23:33 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::1a) by CH5PR02CA0014.outlook.office365.com
 (2603:10b6:610:1ed::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 09:23:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 09:23:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 675CE406543;
	Fri,  4 Sep 2026 09:23:31 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4A6A4820247;
	Fri,  4 Sep 2026 09:23:31 +0000 (UTC)
Date: Fri, 4 Sep 2026 10:23:30 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: david@ixit.cz
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC v2 5/6] ASoC: cs35l36: Implement set_tdm_slot to
 program RX and TX slots
Message-ID: <apqOEqXX0Pwrinl7@opensource.cirrus.com>
References: <20260903-pixel3-audio-v2-0-7c22ed915291@ixit.cz>
 <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-pixel3-audio-v2-5-7c22ed915291@ixit.cz>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS4PPF879E7CA97:EE_
X-MS-Office365-Filtering-Correlation-Id: a3526b9b-d5c9-4eb0-1cb8-08df0a663088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|34020700016|376014|7416014|61400799027|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|16102099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	SMRJgO+nm+LjLtMgxpamYXZZUkTsgj1Z43KcA9HN0paMm5KaQb18nK0moF9mVVdsXuMCByS8d1f3m8EFDhGpOT/gdjRlJoIfJ/ULvp5U7NELb0aZU7ooxP0cPjTIB+rzYId7Jh+UOtD+1jVJTh+IrIpFeOpqJT/mMJmxnqrfpKZwiOjhGMK23RJ4BIIr/SNLW8MWH7ex74xBu8TLJ7Qo9ayp7u4sP6LtkukJtNYkQKWkQm3fQjqQiKaaxKTbv6l2Vhwg91WGv/I0iEUQtzBsw3iKw3qXdHgIao23kEF+swLbziGN/ZOiu9i5iXisGeBieEOWXS0+Vvo2oH+T2u6a2Bykg1lVEQg5CDQjpweKwDYncCSYNNyhGUkrzkaVcxIdI6MeXDVm/ppFFevJv/1vpTtpwRYKpN1j+rPar1CicGxO1Qkx9sMOYEoHapONbeDYFZ2cyymS/RNqM0niAfoi/vx9qAXVwClu9oXSkRKX2Dvz1di4o7iL06yeAgHwlKD9mHRdoX10iafIS21nGty7iQVdJWq9uVVvxo2z7ZWOlp2h4xnSyz7WOZy8U1+hqrP/HB6xTyiwyGUpZ3xfYP0CHpq7eXcdJ6k0G8F+V4CATewijWaTCJcVx1OcAuCRNv9lAJPJOlUsunbwcPVua+Pg5ZhgPmBFq//q2eM3T1I4bfWZYLA+85wq5nFyT8E9vWTL7nzRZQmcC2BvMIFtS05Jig==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(34020700016)(376014)(7416014)(61400799027)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(16102099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l04/iNxsKrInyOaqoA17l4LMH6ccd0wpvE/uE6dBfRsvttfgq0nfOCCZ+c/Vdfu5TLi6UxQrTHgRhbulDhjKOuI2urrsulCVhomIznxnY8N5ZM+ZFE9wPGYyBA3ftdVgZ031AU/mLA/rOhRNXIJQk/XwwKYl8COGlGjA2guN6HsMVO6EYk3KpbSyuMkTVRNuruT5H0ccuTG5lcQM3Sf/OMeFEc3XPXs3hoXgJHTzwDrG6sbLNICG7ur4VpGK25H5d54R/S77sRx8r1hoPxag4g9AJWfpe/v0wmzLH2IU6Waz57Om+DwVaUwbcTrI0Ob9engpTJeuyS4hPCoT5XXx44d7nMlpd71vnMw+C4gjeCb4/WLZ1fK6QfuB/Tjun8EmsivFB42sLrbSjfhR4lVjjbUmJwBkye+ANX3n1LX1bKX+azwyhDQ7b67g1R6p81Tk
X-Exchange-RoutingPolicyChecked:
	fmziq1tx7ZlFAfzVk1+Bm/C4sshuMVms5Mlq3uMSuIBUoiyjQOx89kWFeTDWVzTfkfx5XDEKfERTSamDv0y3hneoaOKZ8Y+cLIkdFr7+zd6a3BRmaNSSkGEflJlBI2eiOyqaeWGAgGj/2J9Nr0m2qjqJGuqPKt4gbX2eoCZhaawSOrmdGu9/CqxfTSbAUBVouHG0Inyjac7y5oGaWkl15iKhjHoeR6Wf/jcPwnVHajOhaIR+YKSDSi8/I2KTaS4+Jf4hz8eWft0puIRObfHAn3wboJrajhxphFHAAljIPgMaHgcdztSi4MXcKMXPTSl3tqKSeaof/WywVCZAoscxMA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:23:32.4719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3526b9b-d5c9-4eb0-1cb8-08df0a663088
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF879E7CA97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4NSBTYWx0ZWRfX6SqRpn0NE0fm
 RQB5hDrIXONOO+HF8A53yjHbn0G1govcRHkD9tHMVuqa+3XBqgMenWj5lVrp9zRkVs1nAq6zxr3
 j+vJjf+6PgE6KROHcX6nJ98rImLDgd4hUgksbL4GEZiimoS5p1CvuP/wCj/YRVo/3pSJ0O60sTx
 jm/X7sxEyYg7L0yNw6VBuT3ElOTFFvW8aQzjoFIWMewomUqAepIUzucMeNdJ2q1Byi7cfSw6HOa
 i1wNM8lxsZxDF3t4WoamZ/LuF+MOsBMZQG+5c2AkCOBjLmt4F8wDHZy5rHyK2dOEIc8YlYOZWOv
 ybQJvmY8TTKOFSfiZbqJ0zoz8DFTqWGO1tD2qv6dL/SkuLWEairJF5Xgw3xg9btVxyzpeoG0tng
 vsMx/Smt2JVa0OVm7FQO7OHQyf2d+kuA7x19l8h66IE+2X/I3RsZhxWsGWr5o98MoiE24Sx/MKs
 j4rodt4AYZ+lMiWKSZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4NSBTYWx0ZWRfXzJDBvVsmrscw
 /vp2I/CGtaKap5rsaFvpCr9kDO3jCYq02j2H6R3z6He2T98UzPagtnOC+jIFS2AWByz8QI9w6I3
 WTmkMQ54/L68WnCbzTkgP1Qq+B8eXbo=
X-Proofpoint-GUID: tOLCrLzQVe0oXSHLZROpBX6Ur2WtWxUw
X-Authority-Analysis: v=2.4 cv=A8Nc+aWG c=1 sm=1 tr=0 ts=6a9a8e19 cx=c_pps
 a=SGQLlLndXmGkGWTBDvOvVw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=eQdwgN877wg5-oCETW4A:9 a=CjuIK1q_8ugA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: tOLCrLzQVe0oXSHLZROpBX6Ur2WtWxUw
X-Proofpoint-Spam-Reason: safe

On Thu, Sep 03, 2026 at 08:26:41PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Program the ASP RX and TX slot registers from the TDM masks passed by
> the machine driver. Each set bit in a mask names a slot; codec channels
> are assigned to those slots in order, ASPRX1 taking the first RX slot
> and ASPTX1..TX8 the first eight TX slots, with a warning if the mask
> names more slots than the device has channels.
> 
> Passing slots == 0 or an empty mask restores the hardware defaults,
> ASPRX1 in slot 0 and ASPTX1..TX8 in slots 0..7.
> 
> This lets a machine driver with several amplifiers on one bus, such as
> sdm845 with two CS35L36, put each amplifier on its own RX slot and keep
> their TX slots from colliding.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

This patch looks good to me.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
