Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10183DDDD2;
	Mon, 19 Oct 2026 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414456; cv=fail; b=vDYHy73IoNLOfTuGURrzkm84t4In/rWJXjCHV8kISw/Dl4VoawnGi8ARAHzCV1pp5qidbnTMCaSdGOS7j6184eFLvf0cTg6xndDyyuSqSAxSEnSRZ9P9OL58uCMnf/mZvBaaOk/3OfO73fpVbvjMQ00CbH5rDptHGnzhWMvWT5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414456; c=relaxed/simple;
	bh=5Vh6tq92Kzt7M+au+bedpum4P591xu2zrUWWtqUemAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoqfwUjJD/MKFbTjc1aoWgrOq3E4zgNmKqS91gI9gLNpN2gIptanAUuHk94Y4uStYWhKrpzjznvFLIh+sY67h8mFTV+b++NN+cmSXqyMgvUek4r61TICv/pcy+9zyf3nvbV6TcP0DbZnmfMhYF5X+5Ta8O6tnodj00E4aIZGjYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b4hxj6IZ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SnsZegkX; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b4hxj6IZ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SnsZegkX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JCLED93843786;
	Mon, 19 Oct 2026 07:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=pDbBYtd2K/tY/2Ospb
	g2UdAooVx+aJVn+vKFYM4go/M=; b=b4hxj6IZ6SrtE2Xc8n2zUZ4q1jv5mxzRKi
	Mtvld2dzGqDdYuoAs9lBDDJvZW5EpwcGJanaE9TbK/GVO3nTpuQbV7+PSCbRrgzx
	drhfZjpdggMgeSf3y/KBTP0JMKYr2Tqe3FXX0oFOQN90cuvbPWVZdxLcpvWEvE0m
	CwKZ76Niaauy2/CbtT8Bvt7DMERY/lQ8w5El3PHpZ47zZLRV86aelhN+aez1KOWi
	gFSINvfwhzjol8t8EGzPidNlEdKW5s7j3ZZ0zWbnZghrnGXlEAPybBhhsy2zmYxP
	PDJ0s2TrmhF7RjtDuw8Ou7iXhCOYS9MAjUa+isNSFSSFRsgDMIHw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020079.outbound.protection.outlook.com [52.101.46.79])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4hcpts1bjn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 07:54:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiFo5bYniZRJf14p37R4Dw/iEemve2QWPS34tRmj4tGmywLeLrs75p4qHRhjEqM/fqS2IZ6+pKik2CwHYUq9q8aL6pWxLxhDy2f4MDchmimVu21Z/93IExqGHUjjsyQIAARoF1JL/3pbpLrJWBbrW0ykfwHtqotxXhq6t6x0FfLLaxggxYveMPokb4Y4kA4bhiCmMyTnK483JjvozNHQwp4ZrjDSf8nbpl+lKdL/J6DqL0inB1TagzzEpcC5wwyvCMP6fyLMWQRg8O7IRKqC8QHk99B0awfht3ZYSaKl4cwSOxXg/lvH6zMzqRPphQ/6ShmPRR2OKwmR+KAcGOwLTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDbBYtd2K/tY/2Ospbg2UdAooVx+aJVn+vKFYM4go/M=;
 b=ukkEuPM08K1mlwm5fHpX93fkjYT0VkLUzsCrjFuVOn7+ghUYezn8nCxBALHLwQbuiZ35ToH5OHoBQeroY1ofEABWw04TTVOtGMdXdZlx9ILD1xfcwoKltiaB9LMUHbfloA3NhiyMbrFv1NtIDrVj6LtvStPqT3mdVpChBarUEoCfM08xjV0qOKNqhVWa3Gbr9J98Wq/NZNDwkfeD2mP+dZbULtg7Vmn5+KPrT7HYTAAxExrOrkeXR8IRP5y1xAaQWjXUh2VbhnxKTKdmR71EYxCIesV3brsyAFQMtEKPRv9uQF36yxpId7tcu0yWWxbIVFiDDYfO0eNciFpQkQWbRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDbBYtd2K/tY/2Ospbg2UdAooVx+aJVn+vKFYM4go/M=;
 b=SnsZegkXLq7jbjmxJd78vIXWt7V1h/LmaorIelBimv0+JRim3p/vw8FUnz6vusw5OFQBvI5W0x/X3hGiBYxUqn7R5AfMc8c+C5LHbAVw+Miqa5aoRo5DBzYk9xnOhKGjHSNUZEQWRlMeEMj0y0b+2i2eO9Ee6jVv6o1lwyrNx94=
Received: from BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::17)
 by PH7PR19MB5584.namprd19.prod.outlook.com (2603:10b6:510:137::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:54:00 +0000
Received: from SJ1PEPF000037AD.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::22) by BY1P220CA0026.outlook.office365.com
 (2603:10b6:a03:5c3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 12:54:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037AD.mail.protection.outlook.com (10.167.244.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 12:53:59 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4D38B406540;
	Mon, 19 Oct 2026 12:53:58 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3991082024C;
	Mon, 19 Oct 2026 12:53:58 +0000 (UTC)
Date: Mon, 19 Oct 2026 13:53:57 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42l56: Remove the ADC Mute Switch control
Message-ID: <atYS5WUcE5NAIA/4@opensource.cirrus.com>
References: <20261019124022.3410793-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019124022.3410793-1-sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AD:EE_|PH7PR19MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: 551bf577-8bc9-4162-ff4c-08df2de00b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|61400799027|22082099003|18002099003|16102099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Z6OQZLK/jvpxW4PEwqB0i30bVi9VBQj9w4ms9xSNNkWs4Gy7cDah4XL1WFVo4nwBOdryfQQFCRBGufFIDcTiEtk95ZmAxPAMhGDQjnS5Fk4fdrZkX2TXY9YzcVqzLl40PDyvLQZMGpm7PSJ4v4EL9tZWj9pmH8SYLFImA09wb+HvPxofFOo8PbW/daU8Iv4lbfXto5wflTiarfh/LrfCKTNyB3jOgOBzuljeB1LI0o9x/tMa5ic1BZfTrgQiqzsC2uNpXjD3ZuPkYUBOVQFrJ6kmqBrPZli1b+mjwfzYoKkaHpS9sz1Q/0XLtUK5l0E0GiMih0gG/YHRHJuXMLklCq40iwt0doHStZRVPAeQeptmUs4iNZTc/EKaA0WZ9xwhhf0LJmklT+j2+OTS4DEy6ZOzUZMiXSyxj0eZwGKKzSU5WfmhQOBj/MdvPvmvxZG1mcC2DTgfRLCuS97IWpYm2z/EyMEDSoO5Il6MmSSOHJgbrx89KtmwC65qmxKfw8jYX+WH5Dy7yrskZdZyBUuj//rLyHc7Pe6gkoqjGq+dnJ+tA3RvZuNrlcHeyoDPIAW2YSEk04Aza68IT1cL1ZZGZcg8IjPCxnDzO7N8MJPijgaMRenLTibeSKH48nEWt1retcSAbFpYYf4ACW0i0ST3mp1tenaaJN5S8XMHvvCalPA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(61400799027)(22082099003)(18002099003)(16102099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ix/fPJF1uudsP9+CpB3TJIiEXYMrlAB454I4uE3X6NyfUQagIFbBxLlMo+HZJ3/mSjP35gdq8Kj4dZeIPdpphVzFQUoGgTIIAtsP6lQmlOpXf/RohUtOnq2E/1yVPfldH0+DstJLbcOn+/nDFCUjjGUyS8jmnDopzaUB8SdW4ebsSwIv8YZJJ6wNlne0vBbDUtCjZg9l+v95snhsCXGsHNib67GZ5yla7AW+Tv3J4GL1taF2vFuBeRdumK27LbQ01/87yHQrAEFmy5wzhw8vxENK+ECgzuPNjz+ztc/zNOsWJvFgLuqFIZ0ho7Hqgn5sTEWarcjNMYVPdUl0CBDOKsNld5Qnb2m7zUkFyD//CgO13A0BbATw/0qCT+dEaRzEJIyaf2N58nN3BS+4ql+zqG5RpmeGEragCMMfd8s98MWHg0RUzofYGoDsvBAESU1W
X-Exchange-RoutingPolicyChecked:
	pxA1Le3JWS5dUH+WiA4iNZGC6klkfomj/PSMOlGCwb88sC36I1V6ao2ZAVDcoGLb/KryckysrejsGejQ6FyXzB4PaO6LQYQ+6SILxt3e6vnpUyXdG4WHD3H6yAVZ/U4XtWMuc+VmzAuxszm0vMB/QiDADT4bYB8wJOGCUfZrB/AIMJkmo3C/ArIGptBYV4vVupSfYYvuelXDjW7k+wYRMyx2sCoY59QdBCxg21I+nXy5QnBdGa14nP57FYOw/W71PchhtlNFeyltPZkB5xo9VCTt19mwzVm5yv7ENhODMn+cdmgT9LpAlbK3bPIbQ5FGdCPNofYZ/T+22oeaMFYXfA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:53:59.6773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 551bf577-8bc9-4162-ff4c-08df2de00b91
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5584
X-Authority-Analysis: v=2.4 cv=QM391QLL c=1 sm=1 tr=0 ts=6ad612ed cx=c_pps
 a=8R92SGvJzS8WgIKP7Y8NHg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=E7YxcUSN0Hr-C67LuioA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: oUAKw1mDBujMfVbLrXt9Sn4RdGWYA25w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MSBTYWx0ZWRfX93ZIR6L5yKKf
 D3IKKO4AhjmfteTYMb4OgM5IK4nkNbiyVJFyozzRvvYt3P5BqfVCGONN0epq4hP3ayQ5sgzRaIN
 FKp38YYDIq88ul+Qk+YVwB1kFtSo978=
X-Proofpoint-GUID: oUAKw1mDBujMfVbLrXt9Sn4RdGWYA25w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MSBTYWx0ZWRfX+to2mdiQWuW4
 04pgih3S5pZSJIWy1q0R7iw/e21ne8cTOpHHFPzL8KV78PlUrIIKNoF26VZPiwgJJ16VsR8M60e
 YhPT42ql0mICSBcME5QbA2MqDnNh5jf8//vM1xudCA0nV3FHkPnG6xvxGEU5FoYNHZR8ynLms+m
 oFkgwe7xifw7v5ArZLJQiU5leP6gFBkLPrdfD8embJpH4B9BbdO13VG8Dfql6oZ9P98IMCI6fln
 Nq+Qv/ithRHS+VHRAJMQA/NhHN38e57MxQALdxd0OSjnM3hxs2XYQsQR3qRJ0XcFh2dx1I60zZK
 GFh9XNNFTmLh08wTWEQKeMmG8PmdOqV9hyDsSa1vYRL7ZJxKm0Wbkb9JO4I+LuPARotgxeUI52L
 WkjkQ+p6FmpoW2SA7PI4gtujoLyGgXBefw78AvIMz4erhMWTgCT217UQ74mvXaf4oZsHgPm1618
 LaO0nxqB4ocjl5ghiVw==
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 19, 2026 at 09:40:22PM +0900, HyeongJun An wrote:
> The ADC Mute Switch control writes bits 2 and 3 of the Misc ADC Control
> register. These are the ADCA Invert and ADCB Invert bits, which have
> their own controls. The ADC mute bits are bits 0 and 1, and the DAI mute
> callback already sets them.
> 
> So the control has never muted the ADCs, and nobody can be relying on
> it. Remove it rather than point it at the mute bits, so the ADCs are
> muted in one place only.
> 
> Fixes: 272b5edd3b8f ("ASoC: Add support for CS42L56 CODEC")
> Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Link: https://lore.kernel.org/all/atXh3Br+fuH83S0q@opensource.cirrus.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
