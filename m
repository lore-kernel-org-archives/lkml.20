Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BD4D8D9B;
	Mon,  7 Sep 2026 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787047; cv=fail; b=kg1T+ELeeQ7OiR21GyGFkU2c9Iv2rWv0ZTFhe9uiYiiP9GkCVv0ziA4MRrInoAcrfRH3V5C/XeTXgKAOHUEmTBgIe9R3r4EQSt4EgOO7gWZ37DYSCHu7IjuI8tYcnMkNnYz4Inl7hJ5F2nWPaZsNsBbC8u44An6EecPRuhnop+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787047; c=relaxed/simple;
	bh=dNmLH8DeZVJ+iCsH+2IagOnd/OnyjVEoCG7moFE0VAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfGwt2KiEanzGPwhqSkyQmh0f5rUk6OzM1pybw5aCDQ9g2W1bHUn8eijJiD2qGklmoCgFuGFN8IcQScbWSCl7FV8PiikXNgjXcmDQtUoO//QJImQfjPYDelWxD6tqjmKC2uiyuJSE8TlvwcQRVhaI05INzFs7/aiBGhYSErtLf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=BXXcQoav; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=YjMJ9VuE; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="BXXcQoav";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="YjMJ9VuE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873fvZ51040447;
	Mon, 7 Sep 2026 08:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=rfUlNwA4jWtDMjmX7r
	8vsKvqTFu1pyBErKKzjKh+y6E=; b=BXXcQoavAV/a4h/L/D7piu2LNN52CEpBUy
	nr+JgASM39otQ1J03gJ9vFHtxAna8dSTNLsSsjUmE+YhrENCrNq2fdoKBFbvpYky
	pS4PoPohdmixygc11nP3LLuITCd9XNqckEdR2mTMC53pmj5ABNe4xVhQgtnWJRoX
	nR6lDBaFC4hyi5hy75v18pYwTKYSVy4zDXvbtV+A0fUeyMa7fLTST9RMguXeJHP2
	16DHkqxKocVybbrm/E3NJt7VW3BFEsc3uIl9TMAkX6XUIZP0MHrLBL+MeGqTBUB9
	gQeeO40vi32PZEMhSUvRHBaNm29UKhPBYw8kO1/H+g5Bx8WCqMng==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azhn15011001.outbound.protection.outlook.com [52.102.149.1])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gggfwj32u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 08:17:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmedZuB9rAccm/J3H6vKeMV5/OLf0sk1bak49jQdqR8UhraDNn79cnyPR7vD4J2A63Y6eSNe3d4KXe79VNJnTM+Pwt0KvD0smWYiPbQmjqmveGgODvs+EH4OieFz6p53oNLf0JYx5vcsxYyNTuPm2NN1et7muDCcvJTs9komhtG81afSVIHjDH5MFzOcaJBQfTm/p1YjTThgrDcl2lJ68O7vFTLJMiEpefnU0G6D+EZ8+hoBjw0Mb8EZ7jYXa54khMLPF54GJwc0sC5A/PvgVH0tp04gy5bxFo63DE7ARWv/vtnJQymYBz/2eVQY2YbcbHq+CsY6Qbzblc5GjQL6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfUlNwA4jWtDMjmX7r8vsKvqTFu1pyBErKKzjKh+y6E=;
 b=cgDf89szN+Gh+6mxoCZEJoMe2O8k94OgfbOuElIkl6a5Wht4jgxUEA+THBMVeHfsSCy2zPuG2eYNIpGQqTttVExEmw3jVjNO65qho+O6r83WZlZM2ItnW/EnDRWtBivCWj37k+uE7UONe1PEHK9bsBlssGF+ne0GZmtJEmibOXnvcWt4W4+FH/f/YiX0lkIP5MPhBuRXjG9pWL/NET0rDBb92BjD34mHq1zScVMGKUFgmMiLltN3e9SCin/a4Dkkr4flBi7IOhrC0EvV+aq48k7yijuncm3o+5gr954/BAsAUcQPyIAAkOQHwDnhcumDGXY6orBJCFIG2QqR642uhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfUlNwA4jWtDMjmX7r8vsKvqTFu1pyBErKKzjKh+y6E=;
 b=YjMJ9VuEUgVBtNjSBQMwUVAqyfRsQ9F6IJBD+qLf8sFvMdsSFnqOKdhWIsltXKrkx4kixudGOx996cTVeafywZ/hAE3+l/oR3scSdnbnCO8kWKCQwL3XDvPmCqHOGsDORKpNJJOyp8F+DUnbAWDAXlFT5VKqs+JwkF2F1qL6IQE=
Received: from MW4PR03CA0011.namprd03.prod.outlook.com (2603:10b6:303:8f::16)
 by CC6PR19MB668824.namprd19.prod.outlook.com (2603:10b6:170:207::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 13:16:57 +0000
Received: from BY1PEPF0002696B.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::85) by MW4PR03CA0011.outlook.office365.com
 (2603:10b6:303:8f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Mon, 7
 Sep 2026 13:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BY1PEPF0002696B.mail.protection.outlook.com (10.167.244.155) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 13:16:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A440406545;
	Mon,  7 Sep 2026 13:16:54 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 877E5820247;
	Mon,  7 Sep 2026 13:16:54 +0000 (UTC)
Date: Mon, 7 Sep 2026 14:16:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT
 function data
Message-ID: <ap65RazbqWZfjRpd@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
 <8403dfc5-858f-4212-ad13-7c00b3f7ee63@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8403dfc5-858f-4212-ad13-7c00b3f7ee63@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696B:EE_|CC6PR19MB668824:EE_
X-MS-Office365-Filtering-Correlation-Id: d006e2ae-6790-4393-5d66-08df0ce24a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|34020700016|23010399003|7416014|376014|61400799027|36860700016|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|16102099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	9J7xBGpLewbpZSqPCgX+mJfxS95MesK8FCWacsUCTt8g3Z74dR3lw9lZlRKGHzbYMSz5fXMhhTS6HBz43/cqrv2THL9+piKq3AKieorMCMEWwrHLsfL+0ebASO9I2ldbJVOGoDobZmIMTikImx53WjZVhVd+TVrs/Vc77nrplsT+RCHruvtUfHaZewdW+fyaV4heufZL6UtQ4ZyqjumNDLdI0FuxN7CmiLZqOkAhYNP+afJa6zvWPgNBoFIIkqMCMzRjGI1AN+r/iCugmjAKx0g7R/jBJg3zOa446b5jhQ1UPKtt8qYEr+sQQP3e3L73rXiG+Rt0XWihm482fzvuHfDuZ0tJ9n1Jqkt3yOFf3J9rnI0seozXY/ecy9UbvtsmuYhkx0QrDSUivi15bIZEkHQmRl9QLsVQ7Xsf4YD9ePThSESNTQyYEn3vJrkyHQEAFwQ/s1CFM6Sp8wjf6glVatgv+ujbAxwS/FXWFqvHreMKTO+SPYUcio26pfvj/gPKXwg3fQbTNCOyyG58G92reJTt+DXContSdi148g+Gq9VaRzs5FcXh8zr5BHiC1093SSzcJVT+ZO+yqngnYCbqy2B4XqKZK6f73SsQEZTquGCFLECfEaxs32U1Die+i996R53ozR9/Tkq2LKVm890OgBrAqFCxMDIVw35lzCXdcg4XDvHSoGwrU2OXh1HHd4Z0wapaLRctcrc8x5sAi/RqIA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(23010399003)(7416014)(376014)(61400799027)(36860700016)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(16102099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SeCQwYv08pBpzCd5a82x3wZTfjtGhFKxUDKxvGX8VBiRhoRK8bXDaTh/lh1++Lkm16fy5INIvGe0TttLCA7FDbkFyv38lEGM27Cbe20XLm/TFEyJc5OYg2a/bbScJwqyXdPFg4Ba044IEvL0kH48acECumHylOCM+cSycBvWaKCXptHiPDYLiW0aMSWENStw4xkV83Y3mS3EmnRxQ8VOf1ql/v9k7bQwVRvB1rejhXFvqGTUkR8UPcrhIkCPU+CGdPWpQYrYW45zfvlKHXSgL6HHVb4mzWpIq6MzxN795HQtLecvwjo0quAJOnwgkGbuZaGaW4hp6hGTgl/T/fEas+J+khhVDkV+IemIJQvDIWUs0N+5PBFX5XhiX6IAxH4sJrBRw5+xOdNJ5h4zqX8y+06ZuCMx7no1pjZmqKPTbsBPBYu7EdbsN+yJgISUaeep
X-Exchange-RoutingPolicyChecked:
	JfR0wqEI0AZXSqm6QCm3Kj2RnDCasBbpcsP2KlMQ5bUWKcQojNGYVBHtkNPZFh1lYLd1SBSqaDnO8b4+6vKXeSycT/l5kciPF8JylKlhD2a/1OCOBcmS+2Euv+qB1hr3EuFQYUU1ngbmvF+0/5MfI0srZdV+177hEvVY5CscYyQkyXoGwrpevRpnPiryn17Z/5u3fI8aw2j+GMAKp/OQtZ3ylLbEFif7revR9MQ42Xget+GnOngjS3EcoU1DCX5tPCB0x/c1/S4wKultlxgscRaLkLdDE2xcBnTlydQenaSh58Xp7lecbNASqIUc1tOIlhU2eFSHrO5x7RNHlrGXVg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 13:16:56.0512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d006e2ae-6790-4393-5d66-08df0ce24a9b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0002696B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR19MB668824
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NSBTYWx0ZWRfX9SlaEXdAI84Z
 ViWMTT2qk9HnYIRdrQ7zn8sbTIKwIC70tUxYboHSibYg4Ycv7Whc60Vg0edlipjp170W7xwQac/
 DcvadHjR9aj0OJRvRvcVKgwxiRE97ZA=
X-Proofpoint-ORIG-GUID: Ws2sMbhCtDtbP1q3jwNnmBcwmP9aSDBx
X-Proofpoint-GUID: Ws2sMbhCtDtbP1q3jwNnmBcwmP9aSDBx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NSBTYWx0ZWRfX3s4bBppNQT5K
 QfIngTpFynF7ncqb08NfbkNABvQsgBqOQbrBIbc9daeDVRAWV/pctjRGevVwqa6JN+tzEULnUu+
 GxO44D2dyZuMg2F8PK/juy5EuBYA9610sy9vYLF9y1Wc1yMfuj5LAm/3ilRHQG5dgtWTb9jTO66
 yESPKzTxeTA0ielVWP+N0DodO/S1fTBeEMWCnlvJ5sUFQmTAvfyobVQj1D2D4V/Qy6BQ+eM9AD2
 f8/NDMAF6aa/xvTJx3U4YeYOwCR68xklG7RWHze/bbtUCModB67ejimkIh/+E559emt16NrT9Ce
 jKh9hHWgBDmMYxLnBU/gxC2mYtutlDqKTHpX7kgcC0Udggh4WpIWGPWM/Wn31HVKMyNH8A/wFjj
 q/xP83XYaCoOzNstNKKKcAjvv3jCyj5izFFYyR5zZdTH9NJKMsFqUQmR68EWYyOMmwUQRdP1tQf
 9yfXZw0tMLyG6b5yyGA==
X-Authority-Analysis: v=2.4 cv=fK4JG5ae c=1 sm=1 tr=0 ts=6a9eb94e cx=c_pps
 a=N2BrI/clB5LUZLLH+1P39A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=38RZNepb8yr8UG9RvGYA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 01:28:42PM +0200, Pierre-Louis Bossart wrote:
> On 9/7/26 10:37, Srinivas Kandagatla wrote:
> > sdca_parse_function() walks a firmware node, but on DT there is no
> > DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
> > function descriptors come with a NULL fwnode.
> 
> It'd be good to have a link to an example set of DT properties for SDCA.
> The way the functions were organized in ACPI is based on a DT-inspired
> _DSD mechanism to have nested blocks.

There was one in the last chain discussing this, let me know if
you can't find it and I will try to dig it out my inbox.

> edit: After reaching the last patch I realized there are no such
> properties. The main problem is how to deal with board-specific
> initialization data, the suggestion to encode all the tables in C seems
> limited to me.

Yeah unfortunately the DT maintainers seem to have put a hard
NAK on putting SDCA properties in DT (again see previous chain
for the discussion), so we are basically left with the choices
of C tables as in the patch chain or using software nodes. Both
will end up with the same issue of drivers eventually being
fully of little quirks to tweak the tables to match the current
hardware.

Using software nodes is possibly more "correct" and would
let us re-use the parsing, but will end up significantly more
verbose. I am not sure I have a strong opinion one way or the
other, apart from putting things actually in the DT would be
the clearly best option.

> > Add a populate_function hw_op that the class function driver falls
> > back to when @function->desc->node is NULL: it fills the caller-owned
> > sdca_function_data (entities, clusters, init_table, delays) from the
> > codec's static tables, matching by function type.  Leave
> > @function->desc alone -- the framework owns the per-instance
> > descriptor, so devices with more than one function of the same type
> > keep their per-instance SoundWire address.
> 
> I wasn't able to understand that last sentence - and I don't remember
> seeing a case with different functions of the same type. It's permitted
> by the spec but it'd be fun to manage...

We have some systems that are starting to do that :-)

Thanks,
Charles
