Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85584A8436;
	Wed, 14 Oct 2026 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970692; cv=fail; b=cnidGff2+fdofu6Npzh0I5uXm8Z3ZJa7MPen14/ZyGz46bpS/3MbG5rlnJP9Ssa3P+mAlWtr6+YdHY1KOY9kNntkiM9S08FMIdI8LHckaxN3E+iHWw7fqBW/ZEbgKatMLbua98JCbz+T9hhqnJhNwVN3eg/145opvhHsTilr/YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970692; c=relaxed/simple;
	bh=NKe7Sn3x87ZvZwwryHsPKey7LHD2JSuCSrFKZMkeAJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZRj4iUD/+oN4J3W5g3/BIpmlxIPUAtssYItiGfCjKwdV5r15WAzNK0+66huiQ0A/Ib8gFhFqtU8TW2vhg9/D1QETApK+VnGXhJSd93W49PBLzar25qmE70QHUMHe2KR5TJB9xr+cMU/fu/PVdoWAKCk8bCVd8iCx4GCJNWJL40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZFN7hB+V; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cyAJSrsa; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZFN7hB+V";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cyAJSrsa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4lC2g1843566;
	Wed, 14 Oct 2026 04:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=YU8kIK94qghnSytLgq
	o0l6jQdKsB07VK0/k6j4MPQfU=; b=ZFN7hB+VCcvm+szzzRekcp1noCHzDui0P7
	3yXJi1rey0vB7RZHMY3mbutoW/MPBdd8VMwTww9fult+jZz1XncTHmVIo6JGIxv+
	wxVb7pKXzqXbUyWXVhk2tZhR+WJQ9BucPstZ4PUgli/397vw27IDSAUEZXPHbVD5
	m2dCkRghnHD1ZewJfr7PJlFaR1IUa/pZLZ0/A9X231hbbDZkb9pcvxSPgbZK12f2
	3d91nV8NCKJoEqqRsK1dTEt7ktXPm1tG7hw284FQS/9AwqjBN+Lu1NxF2o4o/XtF
	mO7YCxHSIvy4vGJgtjiyjQAD/Bchm+sTmyGE+4rwSCSMd5v6oanQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023077.outbound.protection.outlook.com [40.107.201.77])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4h7hsg5fqx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 04:38:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdbvtK9j8XTKz6FXz2JcIScE8Oqh6pcRjor2tPi2gGUzlp1IDFjwpLebx+ciFrR0O8ma+BeAxTA6CngooTrTgjzru+BSRud7KLS9ym3nv4W4FpKRbQ7chqfx65HC1W/+RAx029kBbIjclFH0Apo9hOlqWj5PDDIZg/aHzaf7FhzejnKPWu3k96Q8rlTpBQ9jZr4JO2DopKn9gcdwKz1qlx3muisiLpOKP8cyKDBnUBr0B3OI2aR4m1ypncj3ayRc23ZFdw2RsgFJPxOw1mjX/wBBoul8Q0S3lHyDJgbe9fngcNTvWQ3/CDwcN2P44Vg6qK9oIHfpNSQem6db3S3BMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YU8kIK94qghnSytLgqo0l6jQdKsB07VK0/k6j4MPQfU=;
 b=GCDSZ5xBc8XEZWrzF6V8OcM824J42RJ6uqfwLUXg0hn3QilMODZeEzE0Oy9+uA/BFwL1xjnEyHQ5o5wMpmm6DxA8sst3fa4F+huPlRtJ6YSPSShbS67B5bVvSqVdmdjplN5e8ZcKp+4cNl6jjJvf6XfbJ2AexStB56kQ0ibaMOIhiPCgGE9ICE5tZny+KdGziOcVR1t55Pn4fhEdmdJaaTHxQFBUhSY9UHO1q4ygLtRY1a75h3jrJg93w28b2Kjrf90GvNDS3oPsozkIFJ5yyvAYWx+uBGqWpuB+gis84zet9f47IhiieyNxSDG/fyuBLUHdb51XsqqXQU88zC0FJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YU8kIK94qghnSytLgqo0l6jQdKsB07VK0/k6j4MPQfU=;
 b=cyAJSrsar/I4bcRq//NfhiWlnMscs8djPSR8tvldvTAl2lhJ1ulmGZlMwQ87/2cGH0/qAfGbrFfQnZEaxI72PD1nWU17MMu+/M5OvIjs0egn/AozLQEZeE2JaUorRwkqdYIkZ5+kq+bg3R/AJSzC7zE38jjSHC8ANjkFG9uU2kQ=
Received: from SJ0PR03CA0107.namprd03.prod.outlook.com (2603:10b6:a03:333::22)
 by PH8PR19MB6857.namprd19.prod.outlook.com (2603:10b6:510:1bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 09:35:57 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::58) by SJ0PR03CA0107.outlook.office365.com
 (2603:10b6:a03:333::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Wed,
 14 Oct 2026 09:35:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Wed, 14 Oct 2026 09:35:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 67D7F406540;
	Wed, 14 Oct 2026 09:35:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 57C26822551;
	Wed, 14 Oct 2026 09:35:55 +0000 (UTC)
Date: Wed, 14 Oct 2026 10:35:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/13] ASoC: codecs: wm8991: Fix definition of LOMIX
 AINLMUX Bypass Volume control
Message-ID: <as9M+qtBR6FVm4IK@opensource.cirrus.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
 <c6e230b0e7d7e3db2136cc751e0b563030dbc16d.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6e230b0e7d7e3db2136cc751e0b563030dbc16d.1791959026.git.sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|PH8PR19MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: 746a334f-d7ab-43ae-aee0-08df29d68cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|61400799027|376014|23010399003|82310400026|3023799007|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	RfNdp/uz+FNgiiCU1SYsNIT2uS3rvaoqUBxfMwAp89aGxLqE6omgC/7AQYU+NdpS8uMlwzSMljdx5L+39EbkYhmrGl5P+BDG6vIqFY2YFueIa7a9epcSOzCEb54xe86zpUU5fjVMPfpi1sang8bwnOltx7BzC0rkvbQnuOGPN0YS9DE8tRdpUdscts6h+AS2iAT8Rimq/pK65vv9saRUSesxkkmgGhKUm5qg098BZBzYYNfI1Oh3l0JJ0sZyt4+iLhK6KxFhps4bq28x0wE2uXQgT9y6Z9usw9Zu6nOIp2hsI8hc6GSFO0j6kQgyFppZeQ3DbncNapYD3C/CRi/XhHNqKbg8uP1OUR91FAK0qJftBkayusq93aLNha5IK4TVGXySovQDaPz2v2c6BDUd7zAunCRylGQzUVnbE9rNt4E30i9/sKHvttBnwppClhyLMOEClTRqc6malaa041rc64o9syfJoAhCJ02bFeNbLqObr9h7h9A+1bdxYJTasaTZAENFLMCADubwmQ5OE1xOqdtc4UUwiBqCSuhBfEYFenP6thhPucI+FYrB/yQ8C7Gl/Ltp7m9e9Gi9z77JvEMyoxf/sEQTGjHPDvvXAvP2WILm6gZGxsGSFYp/E7oYrt+DlTACyr8uGHc7K8EKUlWZHmpzqF0r1FzA/ZdJJuKF0AfRbqWpVdv9CXSJtNNcsMa8fq62ngGObXzBiYiu0D1vuQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(61400799027)(376014)(23010399003)(82310400026)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AtTZX6gLLafevYkoJBqdOLJ2kR8OecGjewvGFi+v+SovzHzx5Rt/payrKgRiiz0v90ahRPHgL5eiGhG+b/3frZrG/h+0lsU57BGj/Vo+/2L93ZnF9ptNbdq1r4XkVr0GF7psjrVsI72BNlpeHhJFWWOfieDtTlz0GaKjCZmPE7IESd6SpqMVzdAEKWzuZQhjyBdPfyldw2u1CDfIV/jTP9lj7aF9q/KL9NgNE65vxRgczcTVujdhymF8PN7QuRqeoUl21eEoZ8j7yRsT4FqZK7lBDUPHmc8Ls1VcUlbOysSUtmH+SHTjhwgXjfA53uw23WaloA3Klilo2DAbdCuEd/qbVk2aFztml+Qcy1R/lzHrYK5zKNYPfiLU5h9OSY9OA3Yx8GzKI0mq2oE3g38lbeA+VVZnQjRnVDC9CailFc+71+dzeXjPrQGmgTN8qUoX
X-Exchange-RoutingPolicyChecked:
	Vu8rJvOAytZIY0O40c8A6bpOEUkcR5rCFNQYLrpgp0zarQkOGdmwmEWWpJHFbG6s1Uz0tb1uM8aLplU3hcnhDVg/d1lDcI4n4Ga/NIg010tccId0ehucYbnmekk2vhieZV5v/04Z2h9uKXaAjlWFYjmusKTE1MxjjjEpdUyehEusOmw6mDMQfclOf+B3uQ+cKr6J4oL/ZqFZghfQY/chCjhuKqyENKNOiFXGKpJMEzMKzPmXNzmOAm3vLB8nBPJXJV3RCROXSuPIFL8gEnIqgx8L9g2t2J0VwkKy5UXK3yq8PHSjj46UgrYzAK5ZqO9fvTjafyEeQzikTmKsuwjSBw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:35:56.7581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746a334f-d7ab-43ae-aee0-08df29d68cbb
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6857
X-Proofpoint-ORIG-GUID: 2lR703al7gqcZXfG99TcVniinqOI20SZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfXxbWcMeY/sxi8
 yxydlmGF1jxpzfb97cJso+ERdL/DdwNL8aI4YrCZhwDrg7MU6QivwgKdB1wW+V0/Nt88CjNVJBA
 UpF53XbS8E8jrZBGwsCPTxiZ0x1MJAI=
X-Proofpoint-GUID: 2lR703al7gqcZXfG99TcVniinqOI20SZ
X-Authority-Analysis: v=2.4 cv=QufLTlyd c=1 sm=1 tr=0 ts=6acf4d7b cx=c_pps
 a=xM6D3SEWvNmiLvDWDyWGGg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=5BaI5pJLSwOFNK2hHz0A:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNyBTYWx0ZWRfX72QNzqtI4950
 mHXGTCuSQzRHW051OmmRrFA7jawL12MCcL4UPrCf9Mbb3x2EidxQrf69UQzvX6mnOtD6d9lYkDO
 rYSBfUQKKaCQlC3HvUNCzE1mvfNWpj4DGp0hMUHmOtumHfIXt2S2Lq2CNTQlfDplYyx4K5jxu3o
 F5CKh5UAUVNOha1ZbFZHnUW2bgIbNFfpFJrItuV01qXb4ZgTDC0//aBwsqsYFbcG8Mt4uUwXp8S
 L8Yix+/c3cniWYo0d3qe+DqlaQvmbJE8sxcjJx6+XNCVz/wrRJYYAziTANxvF5j/6V2vJECGcSQ
 pIXDy4pvJbu4/01PQ49sjoT3LjNxeCDt+/pNNGlLztECLoiMp44go3f0h5/rcjB117B7uy9xgV4
 f9SR+5t/iHIt5HcmH+AYhxhUt2cGCpzko8CAwv9J0lOc4OW6KzBy9Ui4fD1Hhszh766KzLXlD9A
 Afk1D5yZIbeWMrKcKTw==
X-Proofpoint-Spam-Reason: safe

On Wed, Oct 14, 2026 at 03:32:31PM +0900, HyeongJun An wrote:
> The LOMIX AINLMUX bypass volume (LLBLOVOL) is at bits 2:0 of Output
> Mixer5, not at bits 5:3, which hold the AINRMUX bypass volume
> (LRBLOVOL).
> 
> Fixes: 203db220718c ("ASoC: WM8991: Add initial WM8991 driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
