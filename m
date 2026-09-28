Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A5C48C8B9;
	Mon, 28 Sep 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587996; cv=fail; b=lRq/7jITE6mFF3x1GAuUhvlTCkVwR7mLZMFKIzYOF8MIqu2Uy6ntv62H+SUHAnOHYHtW7oQknCB0RPzBWbqL24Fa5yQhQK+9dL1ulLcf7w8GPWCf9JnlA/3q1gIUN5Jpp2WmPd4eBn5Rzw7pxN+FDaEpzSlW2BuQhZ8yJyhm2Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587996; c=relaxed/simple;
	bh=gFd7kldKUZmBXz9yrnjk9hfiNng1FtLMvtQO8Md0tLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz29vHNqEB+XLLNmgYkl8uXBUhIXrOV+GTdePOo/JS+I0dI9smD1bIymCIc/aFMxCMRyK/VlyqjNkHRkZIgdcTegveKPhHcBADVOZQtlwLsjTl3Iq3ynIu6U/a7n7lhVqhcYcxRStRb67HbAeDZrcBPqfxXhLO8PpdsrcsxTxzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mUU67voY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=lEuO/sBk; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mUU67voY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="lEuO/sBk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S829Fu476852;
	Mon, 28 Sep 2026 04:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=P4Z1QsqBvUwHbNlPiB
	K9fXJb/b/0tgQX6BhuWrcS7x0=; b=mUU67voYzUn7RMzKnnFJ8FRVvLhClVcLDn
	cSbE4wpQV/J+uXZO8cg59T5RQKe0Xi5QnkXT3WlWFCtC/j4CaUmLuOTY/ahhhAmS
	vgTfII7uAidxLJd2t1dGfXRXzbIB+sTdeXWmJpTGhXdOpGIGuG5MYr7KF8fzDCfq
	/mVhZpte4oYEqdH8a2FBDrGLXsYn2QjFCa6KveteB7KJC1gz0+5Ui7DyXrX2+LZO
	noL65K9ORjI9lR2CkxR+50mMOlX7A3n0LKztR5x2BUAD53ZNCa1ug2oD2aykkqvJ
	AqFkL3ULUA5I0dbnrN8ssQUamxypI/dCc6pYz3cTUa4dC/XmY4hQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023081.outbound.protection.outlook.com [40.93.201.81])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gxbf0htf7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 04:33:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X06JGg1uGgelnmi1Aw2VvcdUysof2WwWVFKceTRHLG62GtUd1Cqh5Hlvff0u1b63h9OPIaTcTEMzHv7xB+LIwgNhDlU1zPBMwjWZBC/AsUqlaFydZ3HFW/sJwS5aRkTUMtZ5Xn45BbZhaexZ8xghCIIJoGZ0HLz4+Zidwq0D1HKoPR9uORfU1OJXelasp4IYje88ze4v0ONaOE/f1hLLOHTFoPYAYRKN0JTtuUDJh2b6KKaq2lJzTucJz1XAKSs3inKa8A7HBC4WkzSydYO3Rl+ve1CXoTYHmiKOa31VKCBIlvh6pkh+02b7fqlzR1f6Jd8T13Rt68qKQ6TJv5F9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4Z1QsqBvUwHbNlPiBK9fXJb/b/0tgQX6BhuWrcS7x0=;
 b=mKZ3ch70hGXN2OjDY0kKn48eeywvWCHV7pQgfPW7HVXK9DyzIG5gHyjlAuS8u7ISepCJ1wU5PF5I6Qu3TL+jMRvSv2qQFKwNmnNp/SC6OwYj3qrdJ+0fQTwyAH1dBawgZd1NJ63Xb9En4YLVcoPMnSxir59ayCBO1t0kGMOsieujeF2V0q/AD0eQNUvDVroPAniiAatJ8fTxsaE5vJG2xoVsL2FCncgUyPsEAY4n0lUaOd3/5gZtqURW03nBREyTw/JQ3/r4+rGhIJdL4YOl6DE5w7ZQibFMKUMbCbINmxqZJWTvVnNs4Mj4lzAY9Z4mVTwr34r2VjVl/i8+ilx+Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4Z1QsqBvUwHbNlPiBK9fXJb/b/0tgQX6BhuWrcS7x0=;
 b=lEuO/sBkL8f4KtJ1MbIzsIOjNFdlsc028WaIYunsu/IjAgYhw48+Q/WVi9tFdR83B1gcD8l6CsE/sWBZ9MTF6ta7wIRk4GyxX8zUqsL7DRH5uKP/g1VI56nf1jGsU/asIxdCv0doWZH0K8YQfIoqGAe8ksAShrokL8lER9M3mzY=
Received: from SJ0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:a03:33a::30)
 by CH3PR19MB7706.namprd19.prod.outlook.com (2603:10b6:610:132::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:32:58 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::36) by SJ0PR03CA0025.outlook.office365.com
 (2603:10b6:a03:33a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 09:32:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 09:32:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 84F98406540;
	Mon, 28 Sep 2026 09:32:56 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 703E682254B;
	Mon, 28 Sep 2026 09:32:56 +0000 (UTC)
Date: Mon, 28 Sep 2026 10:32:55 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v5 2/7] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
Message-ID: <aro0Rz3c2udowXqn@opensource.cirrus.com>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925161049.758913-3-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|CH3PR19MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c00e9d-ba2d-4949-1722-08df1d437bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|36860700016|61400799027|10067099003|11063799006|56012099006|4143699003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fxET54R2scaNT2Uerua0JHKVwzoA0NGX+mz4lyEdc8f3FpZa7xfwH5LwbfRn1LG8ZMkMvmCaPuDPBROXbUTlnhAam3iWXcRDCAcChBCOcg1+orfM+gZyOqy/yc7K0f1OsZUvzVvQ0dgBKEG8HIge2t99ViLNuAUz+pjyHu83+p5nSd6XXNmPyIq4m1Hjp4IE0WLDQXD528HHi7JLDq2N7L/tVe67hh07rFNWwCc9GNr/Vk6Ul3dtXePckSVEj48zHslS7sEDTsjZlhDtL4lMCXEJiUui640Y89ZMUZMgLqVTYG4nJGQ3hSX77jn7wjyAHVLOzmmYhu1IcPcMTgDmQG47F/SWLrlD/iU6mq1c1dr2rDG66sdJtw3/vXJn3fLY4Y6KEKVrAfgecbnUht7DPIizHBmNEWsaR5n0Ao5zN+B7sAuOSe16rRHffD+pBFgZc4e8oPxUHmb/1LGYxdx6IGbF/gaqJZzmMj+//u7XN2kVqq7Ly2vCNAoM5y2itSgcTJaDdPYiKxVqWOxsPJ5tR4pzGtN1+kti5hAEWSnG1v4yQcZIe4sgfFFPKuici4FKIooUrIcJe0NlBY4VioXacjy6yPyrixo/IpfTlBOSmOPbIOt3JcLs0n3H4HCwBIsce4UrZ4aXY5ZtXhjxq6UoC2MEaJKxaekXpAd8xe3TLYKBNrWzb0rEBDh+d7EUj4OG3elxVSgRBKHqwTzpBtzohw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(36860700016)(61400799027)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oig/8//Hb4jkDkdsOeCouMmeoeQtVwdTf7uubhi6+XNYftcKS9VU2yes+7I6Qr7gLMiy4BoU7Yuja2+LZ1kiCQ5HpId+HTLze6rjaQh+1VrA6fm1SKGc/tBaqqByHqL3WV5i/s7yOU15jsGNBSobi3ZKy1XeEnoOeImYIybtAKkRZGjlSWuUXsbQW+iy5R4ngSL4/vd/kd0MvIDi+cZ4zM9WAKUQd05UWj0CHSFV9BPc4rliNc34fy7J0rSQOnuDHy8ED/HZRuHL7zAUiuJDeR3W+c4l+AIvr3DYzjC6+tRVtAzjGcKJFH9bRDyXTQuGzTGB1dkIUIXXRKcDsRblM3B27AVveetvgH03PnGBS0xjUcqE+D2imHbldjohq3ypmmNEsSTIIpSdHdU7OUlOKD4gkfLSiT+QXVl89JoEpfP91l5cyBsAfx9DP4pd2y1A
X-Exchange-RoutingPolicyChecked:
	eKh96lN85Xn9FsOotTIl9CW5XTSksrJ9cpdtfot8R+pBcVdLv210xpv1A1jtpvxNwoJZL7ly3kJIyZ8JhBLsRR4La0fXSNf+9jB3TJF4qm8b4dI0HrkJogIsIqaO3/odsc3tRWV4TRyaS4Go1IMYYqgH32nhzH1P4YmuD06vKiyrXUF7DwCpkTpO3Z/LDWdVWuF54tngxPos+NMC2KYPIxJWwAG2J9qrXPJjLXgIanCXkyEgcWkOtrxFW7TRTxQYMNQz0jzkZMw6w030ZF+CS9gTfsk+HA11wh0TR8qEZPN2lTlNYo3jdEv7n6XbvQ/NomkYvkfMiC1ut2bz2YvitA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:32:58.3439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c00e9d-ba2d-4949-1722-08df1d437bc8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7706
X-Authority-Analysis: v=2.4 cv=GvLXaU1C c=1 sm=1 tr=0 ts=6aba344f cx=c_pps
 a=gzzuIk5df1nbVuvZt/rakw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=6wxo5-rGnncr3unX3eYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 1wjLzoKN8f0O1_QYu1ufetbja9SSsgg-
X-Proofpoint-ORIG-GUID: 1wjLzoKN8f0O1_QYu1ufetbja9SSsgg-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX4zUdPf8l9u+0
 b3AnwNsvwXRTn+sW9p1NebSqYLWVf5JW0ErZyFaG0szHRV5/yL837YuKwRHGmEWMpo2qhe32WwX
 VlfKh60JfP3pxCb/DzyilsofyLi//so=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNyBTYWx0ZWRfX7QCrW6OhL/9Q
 ADiAehoAFhms6HrEmCuW0M0BTCg6IeWIL5TKhWq9ulAWdwduKmka+6ib5fpvhhP9QdIh50Z+bD0
 oPDMuOH8m8to1BDKK3fUUfZ7JxzBq4OSJH26/hGSRiJpAuQZBsKxQGZf1uyraE4dS58Yi18sKRs
 T45/y7Pn8rEtbcEU2AR27RRgWePG/cbD7hrbcF+HrTPm2LkPOzaBCD3SMSRqiJdR2iT95Zh2/bo
 gJPWBJvm5j8qLtpNjjkNpNoiCkWEEtDYwd33Ske9Hn3akkEq+Uhures/irN4Sm+Xz1vGslYK8Ym
 nnw1RgvgDyRQwSuwurgpU6dUE8gPIOHd0/xNCwfiH+lPXDXfTpnujADeL1EkeddEkSyhGK+rewz
 kb0BZ3sJeezOlYQAgARHece3gmxWMXX2eAyB8q0wQvxDBkI50UYMAIe8LOKTOOeVFYNW8xpQItw
 jEj4QEH840ywbSVjYfA==
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 25, 2026 at 05:10:43PM +0100, Srinivas Kandagatla wrote:
> The class PM callbacks pull sdca_class_drv out of drvdata, so the
> built-in class_sdw_driver owns the drvdata slot. That works for the
> generic case but blocks codec drivers that want to embed
> sdca_class_drv in their own private struct -- they need drvdata for
> their codec priv.
> 
> Split the four callbacks into exported helpers that take a
> struct sdca_class_drv * directly:
> 
>   sdca_class_system_suspend()
>   sdca_class_system_resume()
>   sdca_class_runtime_suspend()
>   sdca_class_runtime_resume()
> 
> Codec drivers can now compose these into their own dev_pm_ops without
> going through drvdata.
> 
> For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
> fetch drv from drvdata and wire them into sdca_class_pm_ops. The ops
> struct itself stays private to this file; codec drivers build their
> own dev_pm_ops from the four exported helpers above.
> 
> No functional change: the built-in class_sdw_driver keeps the same PM
> semantics; only the internal plumbing shifts to operate on
> sdca_class_drv instead of struct device *dev.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
