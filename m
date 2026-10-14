Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B5A361946;
	Wed, 14 Oct 2026 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970545; cv=fail; b=jqUpPIRV3QYpqc9CwZcJAWZTqTGKq7Ao3lgY8O68d+GOsjNkAzXMVIS9HhM0+MeucISDloCyTDjej5VQvhWmPNgd9Tf1e10Ak2OXfylmqkYoTuT2TAFShuKrfn8p0vZa/wbvL28ktD9HllflLNbV4OK4bOhxEHKf4yim+nWTZ5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970545; c=relaxed/simple;
	bh=yCoxuJvxOqHYMyx5NxyX0jVy0aUPgWtEk5h9nLeGlBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkX0s+IdOO5xv2+bcmMyYu1j/P6O/jmwpnGNHRSe1mjBzehA9XgOvtRc7lJCEV6EJSu31loZoYkGMGY0gjMRBWo/L1caTVny9+T4C2NLRwJq0Dm1HsGf1CbkJiH7J8WRP6IFDlUaE2iwKh1uyqfHZ41juGzSq9aa/LgS/r2expw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gOjvPKn4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RcKdvzrP; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gOjvPKn4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RcKdvzrP"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4cgm31830137;
	Wed, 14 Oct 2026 04:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ufOcjEyp6iShY3F1qs
	+pgsI8D4OgOZKHTlfxK9AtRME=; b=gOjvPKn4aWsQxDWxYKp744Hxch7sujOWhX
	0eyxuLvuczTIIKwoqgo4NYQn7sP+f5HME7f0dCh2gbNlnR/UcagC3PgUTMAbrcZi
	KgxPoTlxR6InTnNhnR+LpfJbIjdRjC/ZZovZlXHpl6OHZ/LD5zUtcZzioUq12FEm
	QuhSmqUbZouRrMa1zG1yNDWcrJw2JhQndMF48hcP3tZAyOn5nV8IxypABzKY0ZXE
	KjyZfqVEAotVMiU6M+l1xkEQEArgGmbTXamTtFQkVAXgqF/EI/hw1kWuHvakNrwm
	Rc6fdm/DXE1kL6/PXVOIh3dG1nVmOlIUzXMt03J4ApEqK0qpbSBg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020072.outbound.protection.outlook.com [52.101.56.72])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5fn9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:35:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjYADTEkrjON/VQ+DZUENi8ntSddL6pKBoYOEfeFJ5YW0bMxazR7s8avC8oiLH3TTXle1Qp96ycKOmkD5G4Ly+kWMBO6XMC4wyDALzLmsoX+NyrKoSWwXh1M3xlGlDof5c72fy4lc2nSlMb1jGEz0zPoj6DHXyTc3ZvaBFS8fLmsHoGe12RgRu5NSGq5IIOb2+N0pxG2cA6yFy+ZnvI83EmPR/WniwWwhgyOoruACAOHxl0us0iJ45sF63ouRj/VnBc5kITVL6l3LSLcxsllORy8tmuz5ZQsPUsY4cXw2RHH6ZrMoBrnQvHuV9gsKYXlMOKtL5lRLEfxWzrTz31Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufOcjEyp6iShY3F1qs+pgsI8D4OgOZKHTlfxK9AtRME=;
 b=MITBLANe/8Fc3//hmPmg2b+bjtH0y6QnvLRdzQc2CUrzhfZMTkTjaqExNTR1idNVu5a0Hhr+lnUz/VEjY4P+cgyx4a4syQrewE65GzBDeKqYCBTd2oYl6oiaGeClKosIfgEdmj2jrm5HK/dcXpLw/bfNosP3NAts4E+lwTgRcu074tnQ9IeImxWxdgvNpJn9nV7hkooHv4jxrzg7Sgoha69hHZyr6aZxkYARNhN16aK/ORsQkR9/lbykFX/hUIyHFbIOEwqdqJm8pbhdOCu9rvYtcTjz1slMlYuyyvo714LqRu6Y4UvTIgWQhhB3yVxIsXoKBcFpGNcLj7YPRlYMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufOcjEyp6iShY3F1qs+pgsI8D4OgOZKHTlfxK9AtRME=;
 b=RcKdvzrPlj8eAnaWIztVjAOPy7KF8lHiTILnKvaFWoW9ELwejGgl3UtagiRwO3rkyBZQG4si9F8sj77qC/OH1xWD9mbKdaxXeyauvgMtT6MGtkOZ57HX1ZqOSff1Hl9XRtHrKw2Q1Z8XXVo4fFuC30756EfA9hhAsY3rV3WxQ6E=
Received: from MW4PR03CA0358.namprd03.prod.outlook.com (2603:10b6:303:dc::33)
 by BL1PPF920702E81.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ec0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 09:35:30 +0000
Received: from MWH0EPF000C6193.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::6b) by MW4PR03CA0358.outlook.office365.com
 (2603:10b6:303:dc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 09:35:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000C6193.mail.protection.outlook.com (10.167.249.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:35:29 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EE008406540;
	Wed, 14 Oct 2026 09:35:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D7E9D822551;
	Wed, 14 Oct 2026 09:35:27 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:35:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/13] ASoC: codecs: wm8991: Fix definition of right
 input PGA controls
Message-ID: <as9M3j6wBu5ZT2Ck@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <5c0196e45dff1769682d885fc26e613648e05436.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c0196e45dff1769682d885fc26e613648e05436.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6193:EE_|BL1PPF920702E81:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9cc25e-6807-49a5-c59a-08df29d67ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|61400799027|23010399003|82310400026|56012099006|11063799006|4143699003|22082099003|18002099003|16102099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	mfryHyrYwGmz5xsj2NyzJdLEXrj1RMtdYPm04R7jx6VFUiMmYH/+T5dUaZGvgpRPpFaWQONd1O3dYmkvbndJWDKxwOREuNQSK9D7TCqcU4ZvYHRCkBZB1mTbXRtvUME6PjdcX6OfCrc8GYNHUWerDVcyOFvDiSfgkuKd//NVduBEjYebbWcl4PJ0z4c3iPSLdt4b2pjkeOgH0wkg3gQtkNiUfBVEzR48EIrD3t0/9xqP40ZEasCg614Z0IgGOh94mq5Mv3wQHEz0sdx9XDIn5RVeLH8CKW+OVZFV1R1ZdowiwVuqK0lwx7F+v1hB2/wQeqG4xVoWSvxCz6BnPKpg+g9OwVTOdtmx3id/liwF+F7AJdD3SSsisu6Y0Wg4gWvDQRFArcszNXUfKT629LsLDnm3MwhfxeggnjDv2vH6MHoRZMXRL1862jhHGVRau2HBP/U9cl5PoBRG9T9m+T5Ss0dlKB7LQKqNadS3nR01nFm5ru8Dqcd4rctwXOiV+TF3nOiUl+lGVfkKQaUDxKYeyTS0Yyd4DhuIvOl6HxnnTz9lGz4cQcnf36lFT5qQL2DOWuSpIEFUHYSExsKH1H3zJ0Zsb6mf6uAQgyQ6EJIIaowSaJJHqeQLBFLhE+jsmBnzlYHqSR18drWwpXU6XRT85GHH3iy1c2BrJEN3p6/Ml161EGD+gb1igWnQQ7C1yu27DX5qDx/0mWT/glaSDL1yFg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(61400799027)(23010399003)(82310400026)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(16102099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c7vyU+/+cCYzL+Us8balhCmvGTK1CoZ0IZQpH+NCefzswjoArqvBrHzsnICo19wUnEv6UewwpT8RBLd7Uhhr8qRRHLh2k6VarU/9Tk0nX70mexvzNRI1CJw2eJXRcEdBdnQgA9dLJod18li+U51k78Hc5tMoBlu16V4fg4QHR6VaqXYItU/YmzYsSl+Z8vyNluHTueHJqxvR41szkcovqD/fxyrmDRN+juR6wKDbJXFExEVFUAKzcuG5h+7qN1caksWyUon3wVt199wLuN+kqlad1oOvPtanzvomCDLQzYs1JrY6T5xP60Wvvx0vojCW+A25G8wN/Csqc36NZXyrsYjGcv4bG3IJiqFlrTRXHo6X1DyznRh23+sVL71YEezrOg6NSEWDUZXAily49UnNnN5DQaBg5sWpqHM3k0/f6e5r4isT0g/BTx2yKltYQEYi
X-Exchange-RoutingPolicyChecked:
	g9eU2alRL2fBLfOtnIR6cDmdjOdWtvNxz/7u1iAAyl8P4OKJLdPu/+FqqGDNKypyrdSCKVclTLCOwPsVJctJTlqoa5pbqUCB2jCxH2NPgPrZoapXWinHF4Rvj8lmbNGAIbCBRzNGW/k4IjD7Xtz8K++chZK0duOIC+iAb4Io6hnoOqMO3x+d9WeLuZLfsPFuHS0fgH6SBGhesShLJJw3Vmo/CQhRJxJm3dFcgZQhZtYRkJyoCQzDGNeomgR8fMGh3BgD0H38iY4L3HE0KzCo18TAzmvEdotvKyBUxeQi0Odp2V52UXRE69mIcBfya6TiZf4vlfHmwJUxRjRD4b9T5A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:35:29.7864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9cc25e-6807-49a5-c59a-08df29d67ca7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000C6193.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF920702E81
X-Proofpoint-ORIG-GUID: DCblBVMWr7RGMLFHTR5Gk5f-JfPTVFbp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfXw/A5Xcaz0Q14
 yU4htyFrsPnUQxUbX5iVefDnTP4QQIKUMHOlVLIFnUziEGk2MK6gpSmyNPNG9er90TVRBnLqGCC
 ZJsfBOSV4zti836s5fq94cjEtkZvHls=
X-Proofpoint-GUID: DCblBVMWr7RGMLFHTR5Gk5f-JfPTVFbp
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acf4ce6 cx=c_pps
 a=EuzLu2ZwJ/NCzAOim5xawA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=jlZpQnmUusKwRLR8YW8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfX7KXy+U6HTYrE
 0DDXprS8+C9aiYyfMVxjWU5hA9rkDCAjofNzcv6h20HjmmOdGbyjORplLEJflorOqeuE9I15mqu
 t2Juz/34TnisRJGz4wfENsZyWycNnu09soFHmuJL/ZZQgguG8YkLMJs9B4puYTNPH5BoJs6tAjB
 iDtWuK2F+SGc69C1U3GiQ4r2eyNRobBxV7DhP7/lO7yaWWkkHtFGsjlRNGqmFLvEaSOSnlgOuCH
 aDCu1WOsRbCuJEwu8Q2qjl5FajIIWuSJGfCcdHsA3iwMKt/5uEyPXxhy9du7duRvJ3aV5Vr1G9p
 Min8QRI9wt/jxK0ICz1IHKPb28w8L7J3So90n4txvKgLQFas4q7AFJC3c7Hjotr5BjipuaMFVIf
 IdD8D1C7cBJa4ACpzkTSbvM/ffp7djy3RrPhEt7zQBDR1BPheEj1PEWJ9shlNJ1bA6qBOR8hD3D
 4BA9vhtjLysxJ3BYoCw==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:30PM +0900, HyeongJun An wrote:
> The right input PGA boost (R12MNBST, R34MNBST) and routing (R12MNB,
> R34MNB) bits are in Input Mixer4 (R42), not in Input Mixer3 (R41),
> where these controls write the left channel bits.
> 
> Fixes: 203db220718c ("ASoC: WM8991: Add initial WM8991 driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Again makes sense as per the headers.

Thanks,
Charles
