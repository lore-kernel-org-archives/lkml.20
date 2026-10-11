Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472883C0A17
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719965; cv=fail; b=LT/jC3E10JDJqvdr15OU0vX06Os7hek+ec6EH+zmbRluG2ZSuA6dXpgJHOgnt6BK9i5bhOMVmyRjIciR0HUcl9TH/6d8l5nxnufXJQ7jWMNh46E7lsIrbOBdKuwbKTNVXqxummcX/sBSUXji7Muxnu2a1/gB0cojuM5fBYP/br8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719965; c=relaxed/simple;
	bh=f3Xj9OTWZmGahLmlANXV6aCaKkL75dPiuUjNLr4JaVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XeEeKZvbliQSb7ePrXpYVLUxZ5ZfKxxiWf41hZi0JdzLcrS+JpwKB+QOeSdjimxmv30cZSRY3x8PDrb2XP/lC51FuaeJWFgltuEbn+Rk3ZJzBt5tYTmUammmq8KG1tsHnxLp1xDzfLjnw4MucznEOUDdMyY13vLjeqXVjW7G4N8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZTtibzSe reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZTtibzSe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyjUG3KGroc1e4v6aVfPK9S3Klohi5ZEhwb9o2Q1lSD5tXihu3XE1EOSVl0AG3CjMaM2UtwF7spb1GMHfPZSVm/eSOHnJBBQScUwGEnR/cXsLozKMrDYHkIczKRU17JWqXMnw320xQtHdxzoS+LHGoVnBz50jOnLG+odOEJbuptIoj68G6Fl108XJDlPQMoILv+r0DoYwJCBgHsEcapoGu2KPi5L9mWm+Sgj/ElHX/XHwkTm68AQoqoeOSH32u5XcRLoFwyXj26BIT5i+fA0fS5tJ1V81AQr5z/f+zd7TAq5XO205GcavUUZyfLzdNS1zDqzYpgQWY7irNsVBdp0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCGa9KEqfhw08HwV+COSTBryYrbhnQC6AwCdt8bAek0=;
 b=ZYtcKSqK0kGOGRwdVgzF8rVSDXeEaEoxS3oWA4LDvwXlIxWy0cTZj8ZZu6DknbLno9d34KCvGAcRjquubHLANNe0msrDW54NOZYRySABTJsSwq0TBkW1mVeDmDjBow5cqhYuDMQefKiesEjha9pg6i5DYNXh/jKwC+Zmvz1TX313ib7HUPM5UyGPJm71WwtcBAFdx+8Tqr/z5WPXORZGa+hB60HBBbyb+sO6fpyJEIzttV5obroisG4iUsXVtQxNpm/aLT04hNzn/rLwdnlT3f0vsx6MlYc10STcTIubXGHidk+hTm/UeePaU48D6daAcC8TlJvKnieRNshyXJ5BGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCGa9KEqfhw08HwV+COSTBryYrbhnQC6AwCdt8bAek0=;
 b=ZTtibzSezgj+U+D97BoaVakeCTXBNmIrM8bMaoCOW6RvAH3Z0npcHD3/pFl/b/4I9HYdP4W4gT1y1QogMKRl2flkS6wti1GRQ839CpA91z1bXsfhfLIRaddk8TwQPi1HSCQNekWGsj8yaUqBtGiN5LTRe9OH6mLCYmOi1ssyKsyghYXNii+PHLMDRg3+/YDaFasyVtQ/pgleCDLFrFt0T5JfZx7WF+bacEIpLYT7saWenU3BYlbEkR4HM/Mgl4MC9VNo2YT4B5hP5i6vmeK7ZHi3yadi4rrzbezhkdPVrhUAFk9w16OX7pL84ei9cFxSrvfmuYhg4+XpiIW95RZ4Gw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:59:16 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:59:16 +0000
Date: Sun, 11 Oct 2026 20:03:50 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] mailbox: Provide devm variants for
 mbox_request_channel{,_byname}()
Message-ID: <ast7Jrb5BlLuq+3R@shlinux89>
References: <cover.1786547950.git.u.kleine-koenig@baylibre.com>
 <986b6e23bb2008ee9a45e678b6a56e44d11683d1.1786547950.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <986b6e23bb2008ee9a45e678b6a56e44d11683d1.1786547950.git.u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: MA5PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: aad7c091-ce63-4a95-f616-08df278f12e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|4143699003|11063799006|56012099006|18002099003|22082099003|6133799003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	LClnXuuVfAo0fq31yVJQUOySaWClTHhF3z1pRw/YzLKPRbvYmq9gKOvVoPjhMG278GmBVcNylDmWxejze4QMyk7t22HMIc+W3DZCKl9dfBjTzp7ZdW6Qwj0q503TM6JiB/oSlJSyuaB+ZkGLWtnAy/3tUKByF2ve1rs+Sn9UEI6nHmlfonnp8BPaSPK6IRune1E52UDSV4mHvvmk8RSkOtn5VFGxkgmU3Q5odRonQjJtcDyBnWJ6XwipWAc0eH2rmnjx4U8WGpllEGjxP9nPgkuY8GtU1O6iJ0lTipe+XdRMD5+FOlKMzy+NpG67Q/SOUJFRtiSIoRFWkw5HtS1qECLh4QJOHHUVM7b/SJzy3bRD2yeKiFRqva164CUGBAQOQHrbNV/50Yxi6UXKb1l6Wu0MbfHHSgziEz9V05bHFVfolj+M/abuw/OffoJfVdH2JaLpS5tMsWUv7ztn6g+lGCYoFAU4lj3ezXUBgdTcvUmNj0MGpbeQYyJC1QFVarzrQikRPDrhlcttl3xYtw3u74LCWnulkkX6q2unyO8v5JJ8WNnm6Yr+J3dY7KEgIlQC1rY8qWd4wCPX3AFSs5rvQsv0WIVULIAAQjo9JIfZ9GF/dr/+wQvBjTqPM9BWnhTGhjAb3KSR7NMkB7FyAGvmtZIU5k4FNeUx7DIx/PwZ+k0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?XOMhXzMdsNdxkIj+pocaCQ1pl/kHqRkgBMyjaGaAT/wG+It0xhvQXz+L3d?=
 =?iso-8859-1?Q?P740rtGHW5PpdwfVjUdxr0YeMb/k6l98GjOg1PqNvvrkxQ7G6rP0DyztSx?=
 =?iso-8859-1?Q?Px2dO+ZnV6dsRUHKsSDKsQGE2pa3tYiSigPmTCP+76vA+DS8EtNXd/cUEI?=
 =?iso-8859-1?Q?GGT9SGnNVuFMNt0J4dLn0n8vVGk/kLlRIP+VtHOfZOVlUEJ8wZc+eSFICj?=
 =?iso-8859-1?Q?IwwoNHd6lHfAMMtDSAiaphuHXgfMpRjFCn0mb5SVyoNgh+ppif9lKkfv6L?=
 =?iso-8859-1?Q?w+ukobjwdRqVeZeLxAPqNGux8M7It1BxN8vibohWydccRRrzJDNYvj8Tjz?=
 =?iso-8859-1?Q?WMq2qodVMVr7zgOcKOZnzWnfvnYneGu4tEqKyJhof3dkPhOQUcuTW+msqG?=
 =?iso-8859-1?Q?k9YdcX3CWd/9NQ3jfA0JJfG3FwjTuAY5lSHy2hOg0tbL70MoYomXeK5UBB?=
 =?iso-8859-1?Q?bUQ1ETfD6krq6v5/nt3N7JuX8dWAEpnOYMk3cqEP138KpwNYSb4ZfYqB/v?=
 =?iso-8859-1?Q?gxqXUFLxkUDsi+WVcyGK4UcTaziq26Dy/I9/TNbcVCtFUCfpRHT0czrFNr?=
 =?iso-8859-1?Q?9Fp1N6zdjmIbTiw/J9fBBVBBplOWm7H1LaYmsR4NrxJNVvAiwR6qmPqaZH?=
 =?iso-8859-1?Q?8OMdfsSmireNYhC+rQ1+RPMAJvUbvHOeBnjqtt80CK0Uo3ZeNjdrk+byTS?=
 =?iso-8859-1?Q?+voMypfrTAa8JFIDlqdl0o5yYDwhtr5+5IDO5TqNPWkOMt9YYPApvDPC5Z?=
 =?iso-8859-1?Q?jjazhV0yT5GHzSFSL9ocGqgzSpK50A66x3Q962JmN/BcpTdeCppRHFU3YZ?=
 =?iso-8859-1?Q?Wk9boJjbmORTB8wVF0p5/dZNgmMKewyegSyWMiZy6uiUAV2ynk0h45OIEI?=
 =?iso-8859-1?Q?ibXGN1rGUep4iMrVyDsoXxL9WwUnDcyDRF/4Q9wJd/o1L2XXHXXXgRyhv2?=
 =?iso-8859-1?Q?samHX6SE/yTDI2r7YSBHNn16cAUM6pOKXVZZqL/UjPxWMy/zZPjX0ZbEir?=
 =?iso-8859-1?Q?mWtGir5XfS1EjoOJ5rlMXWMRGA9Ffq/ZzuIYll3N2gOVBpLuzVDtDKv45G?=
 =?iso-8859-1?Q?nuwwP/6WC4GNe5QTK5peBX5oKeI8pbGYiJk1jdk/77bXn06xUduE9jbhNG?=
 =?iso-8859-1?Q?8HMu5REpCBkmh3tJT+QWzX0cTR9+f6RuD53c9ddLAsbpvuIAirYQgMuAmn?=
 =?iso-8859-1?Q?2SRaaFAJtv0pm/Q+NMvkSUR9FaQuHW7QBPqzQNX/mWLsvvZnP6BWHHR3Ct?=
 =?iso-8859-1?Q?rmFp3G8KiFJZDaqfSUryEuQv2RSMTwRHMPo4ZfAnqWtFuZm3b+zEyWuWO+?=
 =?iso-8859-1?Q?9yZ7qALvhO4czwpteL9INMZ9k6ljpKLBkQkBJYtrXVdouSlMQjwLfWLAuB?=
 =?iso-8859-1?Q?C2/RaUBevPYfNte6viIlUxuwL6JaXdiNuZ8hcn2nyyPhC/+oesDFUiYQ3B?=
 =?iso-8859-1?Q?b7gIACUfYNGVyymgC+mN+soA/jgmxGgs3mf/3vxxmRQNOOQbTzDek8ihCX?=
 =?iso-8859-1?Q?uqZZ2ceL5CTz5Rb6tfLy0pOI9UAYaKJM2+J94MsY/wV5HTjZ+g1JiExM7k?=
 =?iso-8859-1?Q?zAMOM7c7FUN9KkcYB/gtYHwofdDNV4qXkbarYTUJ89xCSHnkhoCcoH5kk0?=
 =?iso-8859-1?Q?GZ72wLKZe/znKMS2iIXZXi6SNItW/1QMteyHfP4P83SftUQlE3bATYBarf?=
 =?iso-8859-1?Q?4LXlasBMk92U0kah5qGl1lgRvIVhc8/37mpOZj1fJuJts5Y6aQq3X/RXWt?=
 =?iso-8859-1?Q?rsb8JD/zCld5BBFVQokbtCop04MQc8Pa1ZcVMZnUJXcFD/YCYbhUnLTiiX?=
 =?iso-8859-1?Q?wshsNYJHx2b8XhPI39OvOdhJTszlBuo5gIhMgDPk1JuT66bHa90r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad7c091-ce63-4a95-f616-08df278f12e5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:59:16.2401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZ7rCB+t3yFjCZRqLsB69VI/0lhgfmbAwtrI2bY5m+c3fKtEa0yO04QnJaIuPB9pLVoINmpkw025iu4fvnDDQUbBB7C2wHMnbDYB37XXhnLWWH0RqDO4WF9DN00M5unT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389

On Wed, Aug 12, 2026 at 05:25:52PM +0200, Uwe Kleine-König wrote:
>The new functions devm_mbox_request_channel() and
>devm_mbox_request_channel_byname() allow to simplify resource management
>for callers in their .probe() and .remove() functions.
>
>Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

I planned to add similar API, and find there is already one in list :)
Thanks Uwe.

LGTM:
Reviewed-by: Peng Fan <peng.fan@nxp.com>

BTW: will this be picked up for 7.4?

Thanks
Peng
