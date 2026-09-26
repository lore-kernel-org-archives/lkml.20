Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A59F3A3E78
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432303; cv=fail; b=B3l52uw/7E2cLEtCc/D54A5sls3abHTyv4h6e0RqNDAAeBLWGwqz2by5rNSVr08AvqxJ5a6aYrMR2FfuwJQs/cAQsT+38FljuFDyTpmNIN5i770eBUodYczf15H+7Gu52EoMoBhi73tw6SjIg6EEN90nI//ShfKRKxSpTt7Tsgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432303; c=relaxed/simple;
	bh=8/rcBqy9IIuI7go74pbX/pr56li+8DD1Ov+2Q+083Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gwQorfrmuflqcgkRzjViypYebvvbImUs6aZJmfhnd7GvKMW7wESN1EOup0ZBoyADLQPP9e497b1flp5g4kyUe87fzdc489oCSFQ13GcRQEp6CKGSGbe5IaFCJB9M2sBoYG7lazhKCP6pcg9gowH2VhnOORdC3j+J/sFjzjihZls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NPxNcdq4; arc=fail smtp.client-ip=52.101.48.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NPxNcdq4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qV7D8+1jDKepvlLG8VmIVGvwDtcqCi+w3xpJS1kBRZttETJaYTdiGybnqLFMC886mrVSLq2NzvZRlU6BN/5vm/i0KMA+/FAulqK4HPOqWq5NQx/5M2mQHOASGg8rqXU6QSzxmNyyJx0MUSZ8dWXzGTIy+w38tnywj1OBFdz3RKZKrP/lTXn6P61DSKdjQj2enoe35rwXQXfEsrbph0noXtW/+fsk3/Kc4YjIRl7++u2Zn8PVvl4gR4kQxNJ0/nccb6NGgEqu5CrxXJYbSgldKplGcl9WKck2QKaRPd/78xz4S+WZi4TzsO5qOUTBfdAXrtFiG4IZiNpaC5m+xnxT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLbmrtFoU1+OtccYVw4kkpzcgwhMkNhc3LhsuxZMzgk=;
 b=Fy3X/7qYt+Mi2WCMumhD5gH1CGcVxu3DH95Cjn3I2V16+K21U46T5U0cCTx7l6uIls/41Azn3068vxqkeXsvGA8/YQ+q2EDAweUCzusAE6C2AD4gcikAlB+lnP99gaFzj7cI2f3bKQS2ri8wHMFKGDMD3WfZm50eGfLYsnUHbRL+74Ja8xyHMzOpIYzT++BFdm4S7oTKwKh1dhnyK/UZQ8I1jZcTTlejvXtvpmpFKQnLUdM0NQVpt5pzTOtSkBX8tfq2HnsklfkVY3BpeTG/j36GY0IqZw0OLenpp906eHXq/3SzArx//QbAJj3C4q4Fmd1ANJOGiT2Tsk9zQ2vlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLbmrtFoU1+OtccYVw4kkpzcgwhMkNhc3LhsuxZMzgk=;
 b=NPxNcdq4n6WNe9g+iJXe6WL26JIeoeIA8cHNxHzWc46gbwNer3PuG0r9YOSfT+45HVzFtioVP+K25dNYlO5tPi+vK/ldpabNe/OZLKZ99CVmpg2jx28ZUFVmbOVPMbzazzACtTudGeKyITiQtT6x2dOK8FaXz14vIOYyzB46futnTjDmefTjT38ysN+VfbTI/ZJZ6vz1xx0mTp/mwMuE2rxDcGxa3z/1GEReqmdxCE5UUaI7AZS70b9724qhH5Izj7MP0+/BvecZZvqmP2dPA5I1CMKcIhfTDwM1Nht4xagOLEXpHApJ78qr4LTWfQqfDwH8kGXbR6jevta1wwR1/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 14:18:14 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 14:18:14 +0000
Date: Sat, 26 Sep 2026 10:18:12 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Shashank Mohan Jain <jain.sm@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] bitmap: fix three parsing bugs in bitmap_parse()
 and bitmap_parselist()
Message-ID: <arfUJGFJklqNnpGH@yury>
References: <20260926012651.15524-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926012651.15524-1-jain.sm@gmail.com>
X-ClientProxiedBy: DS7PR05CA0090.namprd05.prod.outlook.com
 (2603:10b6:8:56::13) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c7f8e3-f0b5-45a8-19f9-08df1bd90093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HUzpq26vlWvA/nYzVmSKEFr/X99xCR4pcAPGdtuTkbmDVslmo4rpMU9HkpS9aaXYv3M1Z1ey9L7vg9quqgo3OLWlg8xtOmLQAUBlBg5Is8anQGZ/5DgAPrEi9cTkboMybLa1lj+bjMf4Rdr67vzea7+R/dvWQ/LmfM6G855eTCVX/DZECcfFrZmuliobCj9cxNixPh20Kqb8xHoHF7XFVdoxrjBQ18JPdZ8OAA+pK/57+AJ8FBnx5QF7rf2qNwN01xWPW/3/Q5/eZJmCwyiR8dqeTaiBF2Vsd5DZmHbcYlDYGM1VlTRFBUwcxpM3khVdYTb8ernWkkKXqIoKqoXu62MWEemEJRtB/bx/+8WByRmPjI9zr0UgbNSP+sIgH5PifUgMl0tvD19xCaq8X+nsJREn1R/g+oyVblpGqk8xTCgNeTlx+kDBo+kbi1sG+O2kUQEK9WMjg3aqGr5DvP3Y8+Y+F4jiG34Ay2VRbvn0GtHnOl4GUDPclwAqoS31rFfxE5Yg/IvBXuHAbNPBjGWJPn6CC2CADNyOUEQlNeTeEomltdz4Z1pibt2vo/azf0ErbKE/3CiQnua5J0Fd7xMPsDISmYnnPUi794y0TOzNWebt73xMaqp2ynbSjlIsfJRGPGdQbfa+WUiyeVclysumZ2p6O9cQgqN0+ok+2HwrqKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TM6wxzVoJ8lOiXfJrJe3Ut5QdzHlou+PxCy7HAVmZUB5hphTjvMvMB2yFqpV?=
 =?us-ascii?Q?HpMMK2LnDEo3e0zXqSSv8uOaiavEdGwWq2lxK82m6G1FQdLVjcpMaif/yiz1?=
 =?us-ascii?Q?bRsy//PL9zyM0SibdBPRe86VdZDtqj5oPCTh34a4tCMso2ZH6fD5vRSlwwL4?=
 =?us-ascii?Q?VvX7WeIKT1QYVxA7WFeV8BsP4QN+gnpBW09LTNmXbra0VlKjVApkN1/bcD7h?=
 =?us-ascii?Q?BDcOB6jcHld/CPKohDHGY6ECx+IgUOP9Mp3S1btcj3cfRMCu8dYCcQrcqIdG?=
 =?us-ascii?Q?3nYDYiqDWfMsu10U54qyDAbTtai0q4XFgeBgs5YdP/KOTJ+fHsWiet10oqbR?=
 =?us-ascii?Q?NslMuIy2xhUaycFdjFlgFZmO+xronDGZUBoN/E583thmhYgm3DjSsEAPEIbL?=
 =?us-ascii?Q?lcmPGgK88LYxYt93lgPc9HNKAqQzY0cXuu903GutVoITid5k6eLlZy5od0oZ?=
 =?us-ascii?Q?Ox17m+FP+21o79UQv5GWLZ/JIC27XiH/BCllICLxiDZNgmFKVg/IvKxdmIvo?=
 =?us-ascii?Q?w4nVyuizUCtzRWtjUKvfC26YjxrgrFKyesJlL24toPQplPcLYqpfxCNEPXR+?=
 =?us-ascii?Q?YmeHholvz8aFiBw6vXED4uu91JtHtOsRy5fMetH/mVSJ5U+AWTbaKZuFFRmJ?=
 =?us-ascii?Q?3M7Qi8hJS3PBCOcM006AoilGeeOYh3zhP8YDg43epWbqVxKZ0jgjXgg84SMR?=
 =?us-ascii?Q?Kw0znFO39ZdZxRlm17HbVVWQXiYHADbcP6IB69E3SNfULIncyKTWc9RzPIlT?=
 =?us-ascii?Q?zwaJSNEFI89xJ9zcH4P3KOoCM1SBM4vvHH2YW9S6SK4bvjhIoJ3QXSYcLr+G?=
 =?us-ascii?Q?6F298Tk93lcTVghLDxGGLFGOrK8ZiyzbBzx3Bu4oqfEDDxDAlm6Opf3hGOF4?=
 =?us-ascii?Q?PfJdcdL4ymH+V/dMv86NML9aoJ1BNZ9UF0mTau16tBIOTeAPv5y6JauIwW3q?=
 =?us-ascii?Q?PUscNMHuGUHiJ8b4aKQZBawP623+MgIJw6nyTN192sW2u81U6Bwt0efYwTe4?=
 =?us-ascii?Q?NpBy4+X7VE6SpOMCdl9e26Kzp+BESrZW40AQJobftAwONI7f+vYsSfEjzFyX?=
 =?us-ascii?Q?BKyhLNbP7IS5Wo+K74uYBog6D5kE56nZozLD0cvzbkAUc4KCiZsRNHoi/wWj?=
 =?us-ascii?Q?qNatzm91t3G7o8c8V3TC4zSTDql3rre6J71VRFC+B7OBInY1GwAD73QExs00?=
 =?us-ascii?Q?RE65FEjx1iusnFbU3LirSgzPlNRuikfCTTETTCgTQeNizVO9JF31hylyieOH?=
 =?us-ascii?Q?nZA+7czz7C04rSgSOmkp5enKcH88v19MyyYZdqdqXz9q8jt/t0VQvcqJkTTK?=
 =?us-ascii?Q?y9k9Rx449K+Yp71bTY1I4XxgLfBEjDoBDelb3bPOUxXiKKirUJnEI6qpn+by?=
 =?us-ascii?Q?Kx4X68T8Q82rYzCjxfB7NuFkRsQ5UIjbKDt9SO46ItpXTVPBeHt+Bap00A08?=
 =?us-ascii?Q?EIGciItwbf1qEUdEBlyl+sCvYBZDyuaMBJr7bLcmdq/egOGRJ7LQPxXWlqvJ?=
 =?us-ascii?Q?TIlf5QrxTYjdZRjwGbLcNREPqTE/TMcxbcd3mtu2gxJ6wgjWApvDyL8TlcQg?=
 =?us-ascii?Q?yeJ0TvMZmaUSXpTy2mzWSzK5MeK+T4wEJv/ip29BVFd5jYgliwGyuNf41R/7?=
 =?us-ascii?Q?IprMs867E1se7MPeVl7ccW2DnsaVaELR0yBgko5jFRjhATr6bXw8sVLE5tFA?=
 =?us-ascii?Q?yIleoyIB4g1f5192X7H6N8p7HJSdq3nO1PGeO8iBALc5gHRy2h1mafpmSvWW?=
 =?us-ascii?Q?FygL39u3XA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c7f8e3-f0b5-45a8-19f9-08df1bd90093
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 14:18:14.2370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iq8kQglGAl+FKuei/Qeip5G2XKkjBZBm+psFc2agWpZjBGcs5LSRT9PmTBeoy8POpoqpza2X1rYa9ki2Kp/tCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714

On Sat, Sep 26, 2026 at 06:56:45AM +0530, Shashank Mohan Jain wrote:
> This series fixes three cases where the bitmap string parsers accept
> input they are documented to reject, or produce a different mask than
> the one requested.  Each fix is followed by a patch adding the failing
> cases to lib/test_bitmap.c.
> 
>  1-2: bitmap_parse() treats a non-hex character directly before a chunk
>       of exactly eight hex digits as a separator, so "x12345678" and
>       "0x0000000f" are accepted while "0xf" is rejected.  This is a
>       regression from the bitmap_parse() rework; the old __bitmap_parse()
>       rejected all of them.
> 
>  3-4: bitmap_parselist() does not check for the end of the region after
>       the group size of a "range:used/group" region, so since N and
>       all became valid region starts, "0-7:1/2N" or "0-7:1/2all" are
>       silently parsed as two regions.
> 
>  5-6: bitmap_parselist() walks a "range:used/group" region with an
>       unsigned int that wraps around when the group size is close to
>       UINT_MAX, setting bits below the requested range.  This needs an
>       absurd group size and never writes out of bounds.
> 
> With the series applied, test_bitmap reports "all 391544 tests passed"
> (UML, x86_64).  The three fixes are independent and can be applied in
> any order.

Thanks, taking in bitmap-for-next for testing.
 
> These patches were prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5): the analysis, the Lean models used to find and check the bugs,
> the fixes and the tests. I reviewed them and take responsibility for them. The
> trailer only says "Assisted-by: LLM", as Documentation/process/coding-assistants.rst
> requires since commit 816d9992d9ed ("coding-assistants: simplify attribution").

Thanks, that helps. I use codex on daily basis. I asked it to review
your series, and it found no issues. I'll try Clause one day, for
sure.

If you send a material to me, and want share more details in the
Assisted-by line, feel free to do that.

Thanks,
Yury
