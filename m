Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29313A4F2C;
	Wed, 14 Oct 2026 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971513; cv=fail; b=R6DnNhbLVMMYMNmDuNuoCvCca3G8gbZOhHpp/Y21uBMUy7HjtGXEE7/QHbauYRthXL3+TIBthM6mWqceaGX8g0GmhzL7HWvJulMeb63W98/8BTITAYSeLvrhVc5Wf1QkhxPnrEh8qVf1p/GcZWbm68uZqv8ubNnLyRfgM8kjJ0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971513; c=relaxed/simple;
	bh=BFeNLZ7sBVGOPV01lKG4NcB1QuPTB98agUNskO+OQQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sZl5QqTwWFkcpvzWSYn2xxIT5T1U6DqPZWXuu/mWbLmJyWWW/DiN7sg6ZzfI0VbMmw1nBLKMYiX4JN9yDcZsvt6OFisZ/CpH6IrdUvvEbEvE3RGslB9dr050I+dI9rtwVu7Lasdjwbj4j5KUIomPpS9d0KfdLfVAaEzut7z7Aq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AjU4OeQt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Q3r86I4T; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AjU4OeQt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Q3r86I4T"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHvi7V746135;
	Wed, 14 Oct 2026 04:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=eZQPvchIs3ishyheLI
	Y9BRLospa/ASzvXWTJ8Tr2L6w=; b=AjU4OeQtBijrWyr0ATPK5pE85r0neWNWp4
	4G+ZTonq6MQJR+pY7GNw+hvcJQqu8CxcJudJOBpezyhK+8GdVytCDcwB7rvxMTMT
	jMXTa+lRWhGpsZjt5ANxRd7/mHCfflnP11WruH24CHWR/f+K99MFytLecozIj1em
	CHSsMB0H7mbKqqM6Y8h7PEQ+GZuN3HaYg/uka9mYAGaKFPEpNn9wB/8OB8EKQhBM
	CSyU4EyHqNQmtvoTRq1W+Sky+M3lmCid1WCJ95xhI4LX73qfzgSfpB0hrMEiXRoe
	3tGM4F56p5TXw70CdMcD6mIeSErl8+NAEv7dKjv2DgphVDSiP/gQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023109.outbound.protection.outlook.com [40.93.196.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5g4n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:51:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOAsMPwF6Fh50Ro4YhFjubzP7lOGGwkTaOcVEVM8M6HV+mtlNlmM9dQr8Fi647O5g9BacRcMtyzyE4CUXleObDPWtECYmD1lUoB3SIbhK1291K5p14wX9DC/d2aS1f5LBj9drDwwURowb9mLJ2KlEClddye0/RZsHs7o41t4b2+yLhWC+pW5bgSMP91AOjJpYslqP5/FtSurTBM+Gv3Fi3bcHdJ4TzSKgSRFXZevOQCdFSjpX4XsSo9Bc6hjZ0uqlPCFbKaxB4a1aTiBmpTtXES5Bm6etBbj4Vo0eWRmhf58avYpQKJJwnNuaD3WfCMmXPsJzbB14RdmON0kthITBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZQPvchIs3ishyheLIY9BRLospa/ASzvXWTJ8Tr2L6w=;
 b=Ocpg/4x8aBI9sWEVgMQJ0LsstB5oVMxbyvp/z+jI6ylgA2rQgHO3AO8CtQMuH0Fbhc3mjbuPHGNZ/mu7CU/gJzBNbkVCOqMS/jDhbBU8j2xGvupatKA0l6/WQPbg9dsWDvxTXZ4ZtonDA0/nyH4dqTo9/ZTpqDizBdjVRpcMFO1Yah4FKRzK3UwS995gkJosdHNjX8k91JbgEM5DFTNfvK0Fo+yF7A+BgGRNPldsljaLEEaLpEgMRXm2YNHOzr0D3uBrxI1o0+oItXTyQNF8AHyHprpaTe5l48JTBeh/BSrrOtexnXVUUqn+4vZDWmYxIBgo7Cf+AGXmDOZXmm72HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZQPvchIs3ishyheLIY9BRLospa/ASzvXWTJ8Tr2L6w=;
 b=Q3r86I4THRUr7qneTQYMV+k9mkAnIbKSOKC3QSuk+7juRLIHACmF0ujlEv/vibpqWoDvdopQDaeVgHPEwED4wfrEIAeOfUNXiVJ20FUR1DI7JOu/kyOI/dfkVkLptnl1AML6Sd+goQfNmRm9bPk/Va3xLeiU6ayf2VUx6Kyn/YU=
Received: from MN2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:208:1a0::14)
 by BY1PR19MB7776.namprd19.prod.outlook.com (2603:10b6:a03:52b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 09:51:43 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::84) by MN2PR07CA0004.outlook.office365.com
 (2603:10b6:208:1a0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:51:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:51:43 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 59005406540;
	Wed, 14 Oct 2026 09:51:42 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 42973822551;
	Wed, 14 Oct 2026 09:51:42 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:51:41 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] ASoC: codecs: wm8955: Fix definition of Treble
 Cutoff control
Message-ID: <as9QremeOZOirgeN@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <b398bc6dcf8dc2b93504608cdf952823ca238cd5.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b398bc6dcf8dc2b93504608cdf952823ca238cd5.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|BY1PR19MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e9acd7f-9e38-4c22-ef61-08df29d8c0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|61400799027|10067099003|22082099003|16102099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wXezzB7QjBciMKQtSP8E+oTsz/wF155NFhN3UwVtyHGqRgC4dHKJuXhngBbqerR9bySaV04LNLwWpekgC0OtjMw+4oGV8VUrZ7pzSmLSUIP8uOY4qbnPMqZuiiBhg6S1DLY1Ct/nrWxQyvXdQIG9nVAZ9qXrOyBScSpjgClVcm1APNlq1IB3u5Pc8sqCzHwudccnE+bq3bfAjgDBA4h5/b/mlJgyYX6VP/czC67+JFq/dRRSzXaCIti565PwpEtBV57DSBrlW3wqSHXPKSqR5K4wR6XT0uZU6/BqI8oYtYqll3nhkJmSFfafUGIpGYRI7rPPzkusymDq2SuwBT4pLSjfikRieOeJvfI8RpSUpibvsQ+SKJs+zes/gh1IZIAA04gKRtFkmKR4X2jupsF5q4XnHFf8b6jd2ijvLNcXnUSHlz6gF93dSPo2uAx8vsd3hG8at/NuKmSqhrT6Ht2ptkt/Uc9n90BAdErnIGYv4bkV36kjwgTWopcP9rPmAGRKIOxJkNl0S0QzFcZCJZxmFvvJtXCm+w1w/sI9HdlXViRw0F2uShuu0IE/zHZe/GxE+Haka67okqouEwcS0mXggSMm79GRvvsg3XU7TeXHGTfETSff/HCue2eCBliFeGTnY/W70WIKkHq+pAnwZSofaZnJ+oxtoRuAZv4BmAV2OE7+C6J9pC/oLPM0b/ntP6hCesyAGD5JA+PJi/crITW94w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(61400799027)(10067099003)(22082099003)(16102099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8Qdtl7SKOHIBIW8ngK8YnoN0GgYKUYQA6VfyY3EzDkEfv6kHFmrg+8y/bygtEd1uv8IDqinWRNHQTdnzKxF/+L9mQg7iGiFPFkS8cUXslLKykY2LRqZGaR3ASFwI1hqMX0Q3WX3GNyuZV1/ejS3nZ5/e7oOT+HDmPlA7fivn/n0cLKIS+7mHFqFH6zcwTh/fuxpK+ZxE5/QD/Dtmna/yGpsU2r8OENmlnn67FiN8B68ZObybWGe2SRt+/+k0+7EoGpDf7jVkR5IxwWgl92F/Cuq0XRIYVT6YWaUdsAmnq0WDQMijwl19BFlCWT16/xqidd5HiqJqxPpxxi3FQR5J8WI30uBYsP8vqk9i58YXGvmJEZmOV5bXLkl0YGejKHI7ZLDgdZVK9MOHCuakvI42XqPqjczGcKcKs4/bffGCldP3VZhr53JD7bpNiz4KVeQi
X-Exchange-RoutingPolicyChecked:
	iUGkmisaBxM/A6hPtBTcp1t8J5kqXUp2WogqYT+J6+GwOUzBGM9Q+i5pjkOja3hAgbx/2n8awULbGbUPz16Ptuq3wpu8I7pLOaWvah0BCYov5p1J/Nhq3p1ATPHsy8sFKb83IjRTrK8ZDXY5XmRCFfuNSH8hnnmz7qrAmsXh/dq7yO5BRChcBrLjJJ75G9jspjJ4rMDlZQy7SXHC64JSFUn2RzX4TrT3gRwPtRYXNIkEPSKxV6MPVFzofSdW1IcdlgtkmBNCohdaxx7qOnD19DGB7+ChUmeWFZVWrcJBV2rIIUnemIMBmGLoS6cdWpT9r9BXg7Zr/fBUDFGgNX9e5Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:51:43.1836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9acd7f-9e38-4c22-ef61-08df29d8c0c7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7776
X-Proofpoint-ORIG-GUID: VGE7rWAcpbhXgAoQs-QweprtJGZ4-GGm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX4k99M/Yvdkeg
 X8SsJudjlMseNLzsblfapF6R4Kmb/Bt8dJbjjMEDLuU6DsZxwRAOZplAbylJVrYgH1GFL4Th5Sg
 UgDKDabnMFbpzh9x8Pv8zfGLVa7QbtI=
X-Proofpoint-GUID: VGE7rWAcpbhXgAoQs-QweprtJGZ4-GGm
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acf50b4 cx=c_pps
 a=V25D3nnXj/TfbbJZ4owJgQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=zW0s003Dgfadz7j2gYUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX979yUnAbg2KZ
 SD6FduKwCcFSTlxvb8LM3aa9nNiQbxrdmWSG2b6nHuo/pQE9Km0Kzfk8rME0RbUfp3z9jHNLpge
 1cqI3QpgMvxQXySd8q5vYZmMLmNSwbD0Kbg1YCpBbLb71jg2x9M31ZhkbC8XiY2hBD2Hu0v/6ko
 KEdfIev2v5oZBYx+g9mZ2y/nCqrIKuIVcLyaOk2CEekHlKxz0/J6u4ha99Qh7vYc+MiN99Thrba
 +7LCMN5Rm8MDwaBT0o3LiJB/FvqmgUd1HvDaq/ICGLI/aooswW0zOmSKUWh0EJseqKEQhMZWqIN
 GgxI0Kro4i8u1twWExpDStRlX2/7sQMjZnwW+mgxy6zc1lPQ0P1ccN6ZrvmW3jx5/GA9jHCWcvh
 ylB+oHm+tJsCv5NPH5abFYbHDMbwURvlCnkFzyYWUjDWP9JMV1I3f/Z8Kdgf4ww4Ib2fODKdT6K
 yoUSR8eUHOLfG77Fy6g==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:35PM +0900, HyeongJun An wrote:
> Treble cutoff (TC) is at bit 6 of Treble Control, not at bit 2, which
> is part of the treble volume (TRBL[3:0]).
> 
> Fixes: 54db41c116c3 ("ASoC: wm8955: Use SOC_ENUM_SINGLE_DECL()")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Also struggling to find the datasheet for this one, but looks
probably good from the headers, certainly the current value looks
wrong :-)

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
