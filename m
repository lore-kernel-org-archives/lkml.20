Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D36342CB3;
	Mon, 31 Aug 2026 11:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177103; cv=fail; b=oFwptmBZ57V2yixlPNWZzbHb2ePN/Erq3yW/LiVsWOezvn0G0vJu50zGmbkfwq0JfPsOW/28pxqZiKc35cnyP1xwndkkg0cbk7jc2MIlPAyNyNzCZ8jfCR4oldajackh2MkKtNyGyimcViz6OWnmo54IKzIHtFcC+g5Zjod6LcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177103; c=relaxed/simple;
	bh=i+X5fwZztrbZT07mHm3tqdeKTW++x5n7UtGnRomNZfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0m86pcfv3Ua/GzZjy0d47U2mYwDxtr/wnDOUO4ZWzl86hbF74s9844K/YTuIe6N5dXz2prucMJoULS8LQQZwevUuNM7fPcaGpWKn74M/QJztlfNI6GBhj1CkQhjWEfOs0n2V5GJP3GcEQhm3XqShAJGjUIiidA//wpPV9TFMns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LOhBYfeC; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=z4GbDjSG; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LOhBYfeC";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="z4GbDjSG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V5RRIB1516251;
	Mon, 31 Aug 2026 06:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=kVvFcoZpBTK7XL/MyX
	4h1V0ueZBhqqW/bVMmyUZxTP0=; b=LOhBYfeCH/lJx2q0DIqWo0gt+UYlgYJDid
	gloc6Qx2RvmBfaz+pwpBKfcx+Lgcll0+YlIBqsJu9UmyBJpj4uWwKUN0QkiZoOGU
	/J5fpoIn40isvq5sc+zq43iPuKgWwShYoNOMq1Gx+BgFygkB2EWKO0s7+kfctrpk
	tcMX507+vcTmISqOmep/3e2ApuhH9WetNvVeiJ9g7Bz8EHR3ZCKdX/sl+kJ7rnjY
	FVXxVtqsH1bSJy+6JMTGTjoHh2CXsieB7uY0pUNrw47PrSG1R55dWph4XmLGI5jA
	h1IhGCr67bUNFSHB9np9a5qZtNVP/TGIdUG2RxeWUTo4nuAdWjKQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020094.outbound.protection.outlook.com [52.101.46.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtysy3q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:51:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xy6plx25A2ZnIBy9pT/BlaQ8v7tkdmg93nsojbfJNPNw/KXSEz5qU8u8u/JrrAvwrDhQzLhY8O/QvNstP8y9+fLJwlKUZXmoNl4R4CWVv/ja1ec9mdXIjbl61V9c9nWnsKuZdRIhpdfrNDcN1oBLjMZLg3xuCFGg/W/6L+hadyO14GIbpZCDk8lA/h9kDo1FWBcTKClg8cZXYxcWDWUUtz2lWo9vsg+4JqWkB3UrIMwwg9hysM5rnLYZpgeGG7sxb53WUsbzmdWaSxIjSwhlLudpsa/TxJ9enz6MWbXg+dhEZns1qHwZPgNi+DfAeFApR2n1Da0WoO7rCgbDhFZdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVvFcoZpBTK7XL/MyX4h1V0ueZBhqqW/bVMmyUZxTP0=;
 b=Zc77KNCxivmtlK6KfU8bzGdsYhX2kidVZIlSCiTLjbQJ56VLx4SSPcdnW6iydSGdjCFjan82oP7wGNIP2Df07jqR940hbe01HIn7bFhsZkd0QXbkHZ3umoiIX7SW1xpSlHAn7XPhMjRXO9P5Wrpc3uvCQOToqasZCIOhIxGU1RoO6t8e57IlDWJAiYXxye3pzb8bckg9QX/gVMJuR2RinM6VkaeHxS1UWdegQ3Vq/XlvCSgJyPJ4S11knb5d4dHDmP/xxXfy7dX2+4DYUwjfW7XnGahXrXiS2U5L2zeoSEmuB0GG9SE3c+hieUlP+ls8Zx97/+4i+bzs+NS0VXjCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVvFcoZpBTK7XL/MyX4h1V0ueZBhqqW/bVMmyUZxTP0=;
 b=z4GbDjSGE53OQtibSJmhwDZU12TPH+OMYCMqIh3uUC3/JHaz9aNiQmMr2PHvM0dZl3DTESGM2RR04Djh7wdDJA5ZlRCnZqGvyxPUVI5PGF0n8ybXesipcm/2QaCsKGg0EeOVB6N6SKATPZXlzwFvLxtVASKl8lM2fdCoCnTLe8I=
Received: from BN0PR04CA0107.namprd04.prod.outlook.com (2603:10b6:408:ec::22)
 by BY3PR19MB4867.namprd19.prod.outlook.com (2603:10b6:a03:367::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Mon, 31 Aug
 2026 11:51:36 +0000
Received: from BN7PEPF00000096.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::6f) by BN0PR04CA0107.outlook.office365.com
 (2603:10b6:408:ec::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 11:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN7PEPF00000096.mail.protection.outlook.com (10.167.245.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 11:51:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3483B406544;
	Mon, 31 Aug 2026 11:51:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 23AEF820247;
	Mon, 31 Aug 2026 11:51:34 +0000 (UTC)
Date: Mon, 31 Aug 2026 12:51:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: vkoul@kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] soundwire: bus_type: Use devres to free slave IDA
Message-ID: <apVqxTUmZRU6SYpZ@opensource.cirrus.com>
References: <20260831112939.126708-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831112939.126708-1-rf@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000096:EE_|BY3PR19MB4867:EE_
X-MS-Office365-Filtering-Correlation-Id: 232b5d32-26a3-4530-77d9-08df0756358b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|34020700016|82310400026|61400799027|23010399003|376014|10067099003|56012099006|16102099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ygtZIclvyzeBP6MeJ5YFLkSmlSNkxxzrYFJQcjxXPgEAEvnOngPy6togRsJywPUH4fg5zgsuEP3TFlZdvvj2Y7BOOYvAv2pI1V6j1fLjl+usPJ7YRCA9ILCUYiK5kPQ23tQrniddc5OjAa6TzeobjVhoQbDkDhyx7dk/ksFV1sorW77nuAAfHDCM0+3OtQ1Sd3JMJF5JbnT/v7GUApq1LXXkNSRaRklUSy/sKLX9me7ovUELU106YzyADTC4XM0oaR7cgQojENHnJQdRgOCrA7pP7On580Wc7naAFAemC0LYy8utEjJNazgbb96G55IOad2YE30F5hly1xdxJlsW/tuJJs2vYW/cmokjCDtX6150jON6pFXIJTatFTfsHovamEEwc8R/xltVyhbv/dqQO70KwRXYmTor5AoxDPHQDmhg6xbC7szxrdNYXoDi1qOpo0vtjdEFP+sheg/CjT2DpCbB0TiFi2Lbat4itVfow0zc+1wQy9EJm69vxQfUUBS/ZAfC9cATGyNHy+LbzqSE0DR7fNNmcXvAq5iV+xDpq4aMnoNqfZbYHFvi3ESyXEbfchi/FVD7H9nwF8TlcJSDvhmoQbV7BJAimi6Z5kmoGdpHtae29ZqrpsSw2I4OeNDXnrccD+Dr+aiGL+5JbR1yrZxjTVzT3/cEO8sN4Xx/9RBW6U1qPYR5lOyDncJlEDpDxuKbWJTQy3tNLZVZOFvODQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(82310400026)(61400799027)(23010399003)(376014)(10067099003)(56012099006)(16102099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LEqhz9bosl2ygFnvmn9pIw2PlWAsdxvGvEsb00ZgeMqYmiaoKQ0nplmBkWcwGfVCf7o8tP2zRDFvVMAIXZOv2MsNJNVHWkFkNpgrWEV4sDIqyrb9Dcr+WYj+z+w0KcCgBDJqBGnIl1QRjR2PHNXDTg1w/Dvsw8l5RQRKR4GQ4ne/i+tbRJpPieMUEKhLyNEirz2Hi3Bl2iwJHYnq3NtoQLsO6j7NIIPaoAoIv4BAK3yQWaooIvUnNDkJQfOeKtZyQYfhjtAEVx2kcZxS0X7pGTUERhcrPCy+rMoYX49K3bRFZsr2SfIt+ez7+plF14Sc19CHKzkK02wZ/npobUtsHjSwslD1o6mQq3PIcyebfkbnvvdiLbL+cfMzUHacUi0YVqUjTQZ8EklG8rhGHP0da3/HtmSier6IUb/Rassz90XQnYKpiUQ574uCS9msnkNy
X-Exchange-RoutingPolicyChecked:
	InVsANFX6j4KdFxPS+oo9rlJ0Nf9lACDGJHGDY5AvOwD6T81cjEY/iO/DTLbccduDqwlb0IjYd0qCiAbwQ7cNuTy5EP0B90JIpnG/zjcCueSi90fJWua4N5gl9UxsQQcJELRkl3L+yGYMb/8JYy6NM/31K2ShD9RlCQVM+W9cBI7y2tKy639LJ0GMbuTsUTvJqrJ9ta7cejdZU2L4L697Lw0D9C6wwkqv3SwZDDgcpFKORvml3UVAEuJsNtROyJd/kadnBxDmcWlyxmKEu328cqARSnOvRqfNkKdFaiiaeEmOaPUjyTTX4Cp7+iGPu+Ok68FQbjwbUZnZTKKRqiw1Q==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:51:35.4298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 232b5d32-26a3-4530-77d9-08df0756358b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF00000096.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB4867
X-Proofpoint-GUID: 4xrBuNb-PnTUtHdb_wgAHLD5HGX9eaJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfX+JboWtwTQ856
 FOAQWWH+1kM0S5vR/hq48pEnmYZNv5lNf559a9GLWPZIZ6YnLO3o60UsYVZIXEWeYmHLd6EUTzp
 2hYYq90LaXCUh+68jT99YH5SzdhA42H5CLniYu8QD2MQGXk8UifVTvghrjGlQUVFqPN0ej4vv0J
 GNxb+1MDvLT2tB1MGMB3CpToS5dQC8jL9tLtuP44GWHqFy9Kby+EGi9bH8KNToRfTe6WuA5fTak
 xo3okvDvmsUemTZDdvq5gzVDOMDLeigqrG2Pl5sCdKxwPsvs8ADNt+ZG9ov22V7H6zG2vXXSX/R
 RKZYbbtps5xSFHp9JdkNOZpzCk8XrGKOm61NMArf12qAV1dpk4dNEhrS/BZrZqw6F4GO8PccoOO
 ngUvkT9xpbOx1lP+xGNHxp2nKbh5biI6RdbsNLu4sDAP5Lkt0E+Y+1xxTbRUYMr+TepCJBRQqoI
 vhblnNdGWytJjyfS/bw==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a956acb cx=c_pps
 a=aWGlcXfvBePkFyJsMZzBEg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=PfW5EjoWN5gT8xGAWSYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 4xrBuNb-PnTUtHdb_wgAHLD5HGX9eaJ_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwMiBTYWx0ZWRfXw6ryenm3XPNZ
 ERh7qU/c3pfPeCg3z3589/r76OyJLOcQVKv93pQw/gGFITUmTLUJfv9A3vrX0lNkfq7ckdkOxBx
 ZVjfZmnPR1ceChTTSSO+6JQHx9iuCAY=
X-Proofpoint-Spam-Reason: safe

On Mon, Aug 31, 2026 at 12:29:39PM +0100, Richard Fitzgerald wrote:
> Create a devres cleanup action to call ida_free(). This ensures that it
> is freed after anything that is cleaned up by devres and might have been
> using the allocated ID. It also avoids mixing devres and manual cleanup
> during sdw_bus_probe().
> 
> Fixes: aab12022b076f ("soundwire: bus: Add internal slave ID and use for IRQs")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
