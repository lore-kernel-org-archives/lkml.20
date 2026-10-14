Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB82E4F0544;
	Wed, 14 Oct 2026 09:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970775; cv=fail; b=I72MnskWH39meqZRp/zIXi9E+iGNMSk35lkgEOh4HUn7GV4OlaEkzo+IKd6Ch12tmIV+8u6IF06vyS6mOyJbQN7bj79BVtGGFHGU4myBHjIwOdohI+IbanO146KIzr5lwNf/ZHc0bP9vPua9NK6983eBTrCqjtqGpIq/a7tjQlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970775; c=relaxed/simple;
	bh=D53otAurYf+gelrDzpPTISpyx92xX4YauhOAaiDr7dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRenymU97mj2m+bWUZ3O8soYPIuL8zo3AO5nR6flohZRehoqUtDyhhET3fKYcOgCrQd3DXfLub06KpPMK1RNEN3XH2FlD18dW9wkSqPqTEUjH4PL8EW79QvtV6hyGh4ZfbrduL4upn+CwsZ2b2VovEUw1ArCt8DjWI9luOAfApg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=K1P/5hG2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jb/gKslp; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="K1P/5hG2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jb/gKslp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9c5Vx369481;
	Wed, 14 Oct 2026 04:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=bffJC4gfa24q2BN+yb
	UUBxkH1Awj7/ejKj3LiagK2oY=; b=K1P/5hG20i3yPfV2pGVIuht9b0ndE9t/el
	+ajyqbGDCiDHuYYS3iCiufxRkQCb2HbYq2QFqGyVuIRjlytjqnzlP4byzmOHOch4
	xzqO6ZJ4airrXeDjLI+q5yX4sAe5acvASpMKEzG/DUrUvAk8zsN1MLvzPw+iNCGw
	MQDzAKncYBF/Dl2rG5xaqdJB2qnzChaR202z6BUZxa8ydFlO9XIVPZAWfMPKEZCm
	ueaTq7+10wuYmgHDmhBAJMXyoGNvFXIeIAEZ7McAu11msc93yeU0L6L8xEfxznOv
	rkIAbqjwfnbsPkShlH96tht8KBgg1oPpldJ/krO+TtY/qD+qWxRA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020143.outbound.protection.outlook.com [52.101.201.143])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4h7jrxdcb6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:39:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OweI79AvJLwlboL1kUkRhWmnrBQGGMmAhOJr4GFYFdhU70g+tvL1a0LOeUH8UGSFV/iFNxlQe2u15agmajzm48bfUOMPqTNgGs+ZTpgRI3/10fjH4vh0LyWy9A/KAFPHrGbLjKqxm5FEzI8h18q9qIbg0xTNM3IxagQiq/h2VAUxa8rYq9Ub6/Gxpk4yiGT6sEzJd4E4NPRV2LcaTR+Dv1WqlTRyrGKfmvIGgolILC6ky82JONH8TcfCFxZwGwCeyfuNUjDsN1w+zvWi6xjGHx9csLdMjzueW+PGOp4eGDdOMTLRbEP8DBtHYwYf5qgip2TgNdDZV64LY3Rxyvb1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bffJC4gfa24q2BN+ybUUBxkH1Awj7/ejKj3LiagK2oY=;
 b=Ya6n9UonFYyvS3GuGfkIGDujTkyP0PCoJrLfa2aLtOZssG3lEB0ytKQaVa2xb32po89hfGWZ9tQL1iVDe3/ASQhVbWYG7BZv+dXR/s9oIc/aMlmfiCzJXhGZh6Zx68hJwHzQedxSr1Qx2izyCUQJcVoB9rdISuwdJ+twMu1YHZ6fBgIVKjLjEPE0Uu25TexWizwS+NlQ7XVILVEOJUxJMd/ryg+SfL+PODNq8lNBVxr2ku9YyJD2XZRRIhux2YVRWowYYbQihg5CV2ZuVEb+Co4UZTHFpUekwJiIFUoZ0DgDEY2vNGNVuV8rhoZzhRKcetkYGxCByjRuc3Sh0AyIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bffJC4gfa24q2BN+ybUUBxkH1Awj7/ejKj3LiagK2oY=;
 b=jb/gKslpN+boZ9+kiUq+OXWNGjelpi6ax3IwSuSZaKUKzEqcYXxzSg3kh2X5qVvV33HSEY9BR4UGbL3Cv/GaRQp//E7EQR/gOhJOtN5w2dQQf4gAxeaLmgooz20hx+YEYyf269hzoDPNyUY9GeJ2KWvVcS9AhvVgRl8v0ymeKsk=
Received: from PH0PR07CA0083.namprd07.prod.outlook.com (2603:10b6:510:f::28)
 by MW4PR19MB6887.namprd19.prod.outlook.com (2603:10b6:303:1ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 09:39:24 +0000
Received: from CY7PEPF000000F4.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::16) by PH0PR07CA0083.outlook.office365.com
 (2603:10b6:510:f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 09:39:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY7PEPF000000F4.mail.protection.outlook.com (10.167.247.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:39:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 88D79406540;
	Wed, 14 Oct 2026 09:39:22 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7242A822551;
	Wed, 14 Oct 2026 09:39:22 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:39:21 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/13] ASoC: codecs: wm8983: Fix definition of ADC 128x
 Oversampling control
Message-ID: <as9NybNEfYZCIb1y@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <d6a5bbab35e1fd2bec5b13d30951546080d493a8.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6a5bbab35e1fd2bec5b13d30951546080d493a8.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F4:EE_|MW4PR19MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0b3b94-1b61-4447-1687-08df29d70827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700016|23010399003|10067099003|22082099003|16102099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9CfueE/nnsEbNzvnvWWCRWPlTOEI1CMgaFk42G9c5vcAm8JfBXt1IjNxQWh+WTQgvvOlKIThAyMbUiqwL1sWXUlyvSppxB8kx/qaCs20Y1/abEmCl+PNak9qRkqYyHRNH6qktyd0IBprxWE8B8FfX5+KL3ZtOJGn9sx9lwBjjpZowXSCFGbhRN4RaYclpwE/heRq6k/DI53fuDquKHhXk7KVNRuLFlcLNlxUKxJOGX8TJSZ3yZe2SUrdIupwgIWEIlc4O5Guq5394i6wvCogotdYWYZ9AWwmfs0c9ih6JJ2je5PiiJJH1CiwOWe9yJusQFvk/jOCZJnlH+8G4A8kchMQfqyzRmXaFhvv86rej7cs1hbvpEZZGlYeC8mPH1O+xqoozpk8BikkykR6V2np6OwxBNejsTIZMQEzS1CIC3RJZmD7alWmBLwMySBo55rMaMU4pFyfbMqUEYlz+/2P5HOEATjhR2QAp/cVVFzRWzXdbBSpxZSx41MwT7RQWwPiccY1LY3O3a4eBMTOtLdbp0fRHYRZnwgTbCcG0775jpvIAwwecPP8Y+2L5RoPEVgSTRfLKqZ2ftlt7OwOuXIa+xFwncEtup7z1+ybRtt9tGXSax77LJPL3T+45+32oUFEna5Ddli/eoealqdpIWuufnqsWjpqngNR3+/9+Mkgcl41xzQx9YV0tnILtJDKOcUfadoJ5Zc0+46GzrbWpuSWtQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700016)(23010399003)(10067099003)(22082099003)(16102099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WMOR8LtbV0FbqprO/nxM314Nxcw2ajyfsAiS6P4Pn8YOWRgl6pVcRz4QjcjW+r5IJ8A2jluurE+4dt032XqPcvJBJB8gJgKNYIdlEt1bt7E8iSu7qnhrtVeOLofOYu26HvZ/i1pcsXHXTSXeWfMCuQ5nNfUvt2C8bwN4yEBqKSIIImVILZncH7cuhSOIU9y2fAX0O7q3vvyA1uzu6yA3B7XjG9nTxOubDrJg+LQRoKL2mlEz/gkFsVmhqXB+7zfS39+LHR1SiE+s1ZvPG9kgXU8g7/bcO9//R4RUk5oNVhdaofeuiEK6XXkDWUAGK9kh5Q5ApKDRlNYmdJUv2wfZZdZqy7D99kqyyqG9M7TqQChSNftBRTVyfc83UFM2Md69om+qH1eCjMSXV/hdJdoZw5E50XOvD/QrjEscHcD4MR6LH0VdHimTZNEqD3db7QBt
X-Exchange-RoutingPolicyChecked:
	XE89xxENVVqRgJN7C7tHKeAaQR+4fpcVRjqh+MA6lDodWdjdSv8Y7YEyanqtMCV+r55b5dOcJLMR0PpXbY67iygBtjtOrwfGo/xqmjPj2WeHqeTQmqSgzVfrERTkcvZKPmf7nJB1r46ZwBTLcnv9pLToJEunxPAJdq7pu2AcN4dj4xDXkO/UyMwBLubXpy1Lit+6ZpZ0hu/d8+EFiew39Hzg9JJQ3DVyMsPVlSXEyzv9iAU2JyR4OKMzkqXVf15vYu6QtgjvBWpP9WuVJdM7VsJNgdjeZ0emKNmSHAYeyVMTVXLvbhjKCsLhwExLh+lDHGIlVRNInU9QyBMxp87zLA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:39:23.8437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0b3b94-1b61-4447-1687-08df29d70827
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY7PEPF000000F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6887
X-Authority-Analysis: v=2.4 cv=A/n5rKWG c=1 sm=1 tr=0 ts=6acf4dd3 cx=c_pps
 a=BHs4Y4KwHPdQvdroJDo5uQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=-Q5W2co_tndbuQ5UaFUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: dRsN38iHpKOqt7y0a4q_Yczk8pVbjIrO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX6eUUqSkfqt3Q
 KciFw83Wi6diL95ZCV0cuNf9AuXqAbialzhLSvHonRvffdEA8EHnqRZyi79Ed9hkAwt1MmVoWbp
 IlIEI+NCjbOvbnDPHfExIllsFELQvxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOCBTYWx0ZWRfX1UA3CbPhepEq
 vdkOyHsDsLiXx7Ux6jmClEEQQR23X+lN3hTQc/M99owuB8PBS9GQt+QL4va+QCtAMPi/qwUhrbX
 MYDmQBdfIUIiilvRrByNss9YpSvROVzxkRJtiN/P1tvHsgrCArFzZAq7f9GPlVBKYgjV8h/rUNO
 VPejnaWYzDZUSh2mFVF6L0CjUOlSBlANSC8CVLtawnfEHYB6NI71Bf6cfIkqVLqBTUiz8nVgJdn
 fK/xxGHnQ5i0O2dAtK0knYkR9IEaRlorelZOQZ2saWiirZlPEeJ4ddfVk/co4bwUutcTWX9GhbD
 O5FbopczG5ZdGNRvccSPBmW22ZQYQU7upwF35iL6KU5Zrz8oQAnX3LywwIFgGOzN6j2ZGLOubuL
 pQe9NAuGUXA3gqEX/2ZXLgIYWjOmfBzmsiu1tfxnzSG5KPctrBf/evfiCCLOHI7OURKwwhZEEtZ
 Hh4SiASov3xQagC7dsg==
X-Proofpoint-ORIG-GUID: dRsN38iHpKOqt7y0a4q_Yczk8pVbjIrO
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:32PM +0900, HyeongJun An wrote:
> ADC 128x oversampling (ADCOSR128) is at bit 3 of ADC Control, not at
> bit 8, which is the high pass filter enable (HPFEN).
> 
> Fixes: 6b3860b0a20a ("ASoC: WM8983: Initial driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
