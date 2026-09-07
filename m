Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315CC466B5D;
	Mon,  7 Sep 2026 10:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778163; cv=fail; b=pMIVmDe4LebcMv75Ev/zxKka0/NNmuLYEx5k1xQ8jaW4/QMzrHGGCqW9zFPy+IAfK7ySS+EtwqZY6F8kU4jxWPVSECm0/ZMLHuxeKuLsrIa1k7ekM27RdYIPSNkXxy1SPFe45CSVANTgdcH30DW5kzwE55m2+4F1yZae5Y8lZYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778163; c=relaxed/simple;
	bh=2KBqSyZmXJoGtAL97MwW0MfzdRMaJkukg784K12ozcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEZ6hlhXK1aUfXauV67dqi7IrbfnZdsuytXzus5w+pWATnpLqxjel2Dj37HBXQIB+GsPyEWXrr8QfpDJH0IyYe4U5dneQpiR59J7LLeKarnmi6GdFQwbruOaA0KhtaAisikzzU+K7H9s9Ct1OItQ4OiFUduUjeBh1/h3GEKX7o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cHIpQqP5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xYlF3YpH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cHIpQqP5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xYlF3YpH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6872KmRk3945280;
	Mon, 7 Sep 2026 05:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=JPdQEAKba4S670c1zW
	WjNfdniE7YcUQICGztV0u8M34=; b=cHIpQqP5JIlJfCIGpSgdRCiNnh8YknjVIC
	/HKdUwwkJ/MAr7WZ3M6Rv6/fy17V7djIQpzEHuvxt9N1UeHVvWHrmol2FGWqGLEm
	kdlHKGLF/t6gyirHx3aRzKWvqhte8b8Ot5D41ygNNtXT9P4Qtnmx59FSuGJa8NtQ
	eq6YrJP2c6TNnnzBJYZCKh/Oee9DdxztXh6cGelzdgyy1V9rB/p3nT97UNRnd3Cs
	hQQwlQqjLr3dDk22AbohGg+4oV1rbwC4qWsrZurqVE7a8IOniOq85hs+Il7BxsEJ
	dh9VNczT2mLC9A5S9viuiHOAL8tJUMd9CJv3UXn9dJcXYIysY/Mw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazhn15012043.outbound.protection.outlook.com [52.102.146.43])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjsv69-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 05:49:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2G26nk/1U2r6JBMCfcMDeLuwjyP8XYSoiYvFoeewi+KP7qKUVxkCUGUMd7oE+KEm+rrO/Wk5EUXeXHsSwwF59yNFQDDnVERCqw36Q7CCXDNEOCHCIUmuneG7OV24X2qsaOBG6CDAIzHVTWLeYeiy/UvbrwhVQBp6uJddJYzopzV0AhQaP7oW0dtOm6aYDE+zvBs9d3ip3wyEKmjq6JJhC7d0zJ2U9TFEGPjDmOflrHj+S+Rk0NVZxXOfncXaBZxAY7zeiQn6lrAj5ck2+rp7ZbnutoZWVrTwpfU5M77Wb7c3b4veIYUBZFtemKGHIBrae5ViITy7xpxa2fH20Rb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPdQEAKba4S670c1zWWjNfdniE7YcUQICGztV0u8M34=;
 b=A/7Mi/ilUENc0pEhf8tNjRPT36X0sZ9Daq4EUzFjWG4lJPAVlrAW0uk78hfhHnn7vJuhQ1zlZXCXFpnPemv/vUXHaj4O6BLIm6WQtNghuYlOTga8CjXktRaWyiMn4idjMLnpOpR8hIUx9MuO0CVAvyWbo751kOV0SIGQ4F9b+0hsxsx4n6DIHv6axvMxBupK3tAPTJ4U6+jsQySuztazOVz0RXbEWFZzLyMRed6ved3YzpbDaM1NHQf/eItBBXu7IvCmxGaVqmOuu2SEr9JViGYt0NtNP6mER3mn/j5/P///mInWyQoTjJ7xZyRbznsRI7S4zbtI6GBpXsNHVvAJzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPdQEAKba4S670c1zWWjNfdniE7YcUQICGztV0u8M34=;
 b=xYlF3YpHgnMVdLVc8R4giEKaar93WpbgJf7RaJ0YfoWrjmXpcDYoXVasa9OvA9QkXrG4ILVX1csUoL9uxnwC5NB5FOKDpKvW5AUvmF5U9iD07UqCPk+Ac4lOMnt1rk497//nP/xrUVPOnOs0iwmlneXCvYMYuaLvWkAyUPeAy4o=
Received: from BY3PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:217::29)
 by SA0PR19MB4410.namprd19.prod.outlook.com (2603:10b6:806:c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:49:10 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::7d) by BY3PR04CA0024.outlook.office365.com
 (2603:10b6:a03:217::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 10:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 10:49:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 66628406545;
	Mon,  7 Sep 2026 10:49:08 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 57556820247;
	Mon,  7 Sep 2026 10:49:08 +0000 (UTC)
Date: Mon, 7 Sep 2026 11:49:07 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: fix repeated words in log messages
Message-ID: <ap6Wo7ef9/qlCOzl@opensource.cirrus.com>
References: <20260907062930.18120-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907062930.18120-1-hemanth.selam@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|SA0PR19MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 35702650-7704-472f-05b0-08df0ccda5df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|82310400026|23010399003|376014|36860700016|61400799027|10067099003|16102099003|18002099003|22082099003|56012099006|11063799006|12100799066;
X-Microsoft-Antispam-Message-Info:
	EWgDcgskwceB9lnSs9+h3VhoH5heKSiR5m6LRuO5efNwsXP3ZfI244+1tyvm96+IBn/WKS40wrIFYr6PJklMKgOVGfjLbgOkIvj4jsQkLQJvgStNX1DImEkfLCzdwyNc1vV+NNC7yEpX2RrX3s0MUhTUQOhIwmozHfUHabfQ5S1JqFiq3kDxH0kPO6DBqGjV46vBlmBt6vVwK1S+EY/V7KaOrIeiv+Le2xdahLpimH9Vo2p8UjrNNW18xDBQvmW6OV43frgUdB7ymeN3ryTt4yp17uiAusBV/peKx/7KrBO2eGnZ2v+i/lCqFHIRlfHqGrdYjgegi36idjjcRjcUpJke5Q/ZtIjQWS+tBkdIhqJ3tRpgO1bOhvNgWDxqmLevKdqr1lwcK/ew0AYe+ZZqf87pshPY9HYZLoQsqbfdmISdMpJAoltuWkEI3rJAQq52woR6WRXwuX5ybumrGZhDXS+QhgiZi7ORu4OlUjdQ2gS0Q5ZLiLjFEdWisJdY+8N1O5mOMe5gDqyWowsoCfA1AygrAulgz3FY0mksm/XgwDMk7q3C555laJ2DO4XW6z3PcBN+7+leij4tGHbdwLAXW8y/sw4Km1K4QpDVwCsEC94h+BoqcYs4Jc2r7r7NlC7D7DbuVJ/ZV3PCSqa1aExfQ02yJ6Hf46rBQjMHyWO07MQLiQAHMMaBnjojBCsViuyQY0bwAAJjZp8FtRROtnnTSw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(23010399003)(376014)(36860700016)(61400799027)(10067099003)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lFeIs/UAeIWGsvzuU8TwGtysWIZ1brblwa+hYK1H3AChtDf1qK63OeCbbzYwA5BihDS/oaUfYAqmbVzpJypZ4ALBrwSLQYPjX/J1lvjLctnaNmWkDMZwpO511jl31VI0BshmHJ5xczOz+NBIik8VSDf8xfV3XkV4CC8nNAyr7popHRv1araRCXa8EJjrFmepuNoKvVATfL0Tdx4dvNYD6BuQfBy292uFKXYaAt2ie92moLwF/6GHVquxHD3H+Qbz1aaziCiQz2QIkzKG7mEM1QVJuLWYadtjyF3pDN6LkIy4DGod5IkeMSkKLDloYmm7fzt74fPShY31ajM8Nus3J6eZzoYhemrflMgRXHcGAN4H+0uY06wYX3MVZ2n1ywi+EA8CBKVdlNd7bWUNFjzwmbT6A2k/CQfKWC0Hzv2lRVtZvE9ZqqQWo09e9ntdl4YU
X-Exchange-RoutingPolicyChecked:
	Odja+lQbdUuwjF/EYAt8e0marF7SIG4+41bWR97bKDoslwm6ppelqeMULWsIUeL/L+O3xf52PozJ0G+Vfmki0AoJlUPOj8e0vh8Q6K2FRmw2qTUzCkZn1S9n0kGgnXHuHZ8TagEygzGU1JWNriJIgxlvXABA4o/8hHTz/Z8md/SkVByjHJVPyM41BWwLfwGhKrLp0sPiUh2uRYChTBUE6xdQQRJzdMg/GUPRgYbLhi1uqiHpom7poBIbGSVBveW4tXi4V1RZieBBa5IRDjMVoZfwpKyuRqAuBSSSuydU7UqikJYJrfLQ8IY5whwaG1wRofdwdMj5YoQKsSQmGdxYOw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:49:09.7345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35702650-7704-472f-05b0-08df0ccda5df
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4410
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9e96a9 cx=c_pps
 a=5OqKuH/+Tmw8yUm/lLEepA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=vQhEbaIsDyojaiSJrZwA:9 a=CjuIK1q_8ugA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX6aXKQPioZUFC
 r8lJEMJoGrHxOqjWYM5fM9yrOPUHuTKZtHlT85mNfrThJLi0V/QHFUGRCbbVw8TvLeVchOe5iNr
 Kj6xYNz7oI0ZCzH1kMx8zVKQ0yXvXr/i6Uy0wG7mELbFezXc6AjTsX0P84JG5BSeZwgsJUxRDxS
 C4jki8AdOspVv87NQaHHA4Ku/ahUE8gF9hqumd80FyePB4+W/uCmrpzg8SJriWYgmD6dRGYCtu0
 EtAzmdLRetQdxu05zKoWkRxqKc0t99IrJZ2fiM+ER2kaQr9vKhWSUQDoCQCVe0uK7faSmWGJkbr
 0YwRACekJcKkH1JimNUWqxblXfNohSGHAt5npRtdWmVKK56yAJVTzFjlNieEUamULIkRciJK7vH
 Lk/FeXCRoA015XIqflDjkbXzKcF+vERqrrmfXNEIqT7+kxQsci0B+UtzB0fX8MVmLkIm+rMEWrQ
 cFB72xgtZdzJVd1GMTw==
X-Proofpoint-ORIG-GUID: mmU-X96ns9eOeBEa-ntw6siAyN0s69wf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX+DVJor7yZ61r
 f9Ea3UobsfWXeuKj0enjKnnKUVNA1zBxEE8Kas7VAOOQk+r5iuiyACtVa0U6dXvQu05/XVmebT9
 E3SD2BBGykktlosoDIi011ne3oEbSic=
X-Proofpoint-GUID: mmU-X96ns9eOeBEa-ntw6siAyN0s69wf
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 11:59:30AM +0530, Hemanth Selam wrote:
> Drop the words written twice, reported by checkpatch.pl as a possible
> repeated word.
> 
> Only the message text changes, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
