Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951F34AF168
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007588; cv=fail; b=sCb3TCLiRN4svxa0KrDcbzcJlPKOuV789QgT2s44n2GvpBfESIoQ033ZHdCqChQxcY7LvYvYJD69y6ipZZT2DW1V54QtO/AlRcUTlgC9QBkm9LPgH9n5ns3pi73ZIT9zI9kchD9oMnwC6YB1flr8RNMEkBhuNjU2WMsFE01ggw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007588; c=relaxed/simple;
	bh=b9RhfIX/A1gywZ4JkazmgbtD1Pw/qG/61lC5j4Bjis8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RH1n9Acuicb9iMlc1dTZ6lUjC0fQ1rnH0Gr4MDywY5J2P4KGyN1mnOYfkhl7Fe0cAj9UlSvSccbL/Lto7yQRH+YSRb712K1JNlKRxLHd0OBikV59n2hzIBfg93zjDaQYzPsJ7LntH7WNdCil1NR+pQUvL3BMcj8q6hKONISIOhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bwfXN7jH; arc=fail smtp.client-ip=52.101.53.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bwfXN7jH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdI9j9RbDHAGLA/6mXdXVIN9M2TTWFewuXErpszxJ2HtEpowEFVN2Mp0V3ee9X/qXbOKkAab3s5nBbEYAldJWEjjXa9NCWJv4+nyoDskj0YeM+SqVEad7eSz4bKbHTvl8HIaE2VuAmZkokLR9Ln05kDR6d0avqG2n1PuNe2sp0ZbuSlm5dFS0Dz0hJDbSnTJnhjmaSNDJCsplUje2ES0jTPtykxoWJOVBAnoHaIE9XyDCRobqshITwwHE1FU10IiggLJ59X5ai+xLjlS7YanpI3DD2I6uCQmQV0DKLWN0zbFCZ2UdfgsSNQbhNs8rTtfgCF5YpVJ5UT8bK5KkIBLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cmj3HFSGIt5veDrm3r4UBj39wqPdDmY5QQ6fnO2LSPo=;
 b=YqrphF4JHQDaJY6vdCg5/DcN9DuFRw98DM1U6p9KLSlMUktyKZq4wmAelMPdcFyWVQbHFu+e3ZRzmfSZDvwv7rWvhXMvwJHeohdB1pv9B5KpsQilVtqIKtFZipfkSlI7mvCxPlupn1uqubaa94fvAPiJMbdPnSex6uQ4FFoz96NcDd0S7Sz35op+MM4B8eZdCpfA/5RJSkSWuWNFLhvpNJaRXR2OmkA1vCjmu19C0RJOamDZ3yl9qt+2Tjjvprsq+UBsaa4iuKpWuuYQlZ+fG3nDBWVA2gH+knQBDYppsakvwPHGDpQzHgqX/7TcElhN/SxR4H9Zlk/8y+894+trEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cmj3HFSGIt5veDrm3r4UBj39wqPdDmY5QQ6fnO2LSPo=;
 b=bwfXN7jHFz/Ax6i240f5tZBgjdublFz4AUq5C9H2e2MueFc6o0vcu6ubESCwwWeiyNfF71FyT0cJ7bvxc8gL5o51sFF7Lu/103Wfpp7TsApwZs6rCAK5/1bziYf//ZZepKma8paDJ07ZISiNKyM4unCM12RXsAali+jDXgCccgA6q5qtmrBejcQ89YFeWxwJluSMNPrs8KCIUHlABnuFiqFFl1uZNsbm/j7ogWNAwrdiGYVEd2PoXzK7VpffuUwjKwjv3dx0YWQXJ4ThymNhmxtUtW5WqLY1eMy+bXTKKgBTkX3oBp2mlLW+82O2yaSoKvb06QYhE9pNAVAS83ZjMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:19:42 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:19:42 +0000
Date: Mon, 21 Sep 2026 12:19:39 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jakub Kicinski <kuba@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	David Laight <david.laight.linux@gmail.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH] bitfield: get rid of __MAKE_OP machinery
Message-ID: <arFZG0FW6SExCKqt@yury>
References: <20260914204929.240310-1-ynorov@nvidia.com>
 <81212a6d-7244-4426-a385-5a76429d34aa@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81212a6d-7244-4426-a385-5a76429d34aa@rsg.ci.i.u-tokyo.ac.jp>
X-ClientProxiedBy: PH7PR17CA0040.namprd17.prod.outlook.com
 (2603:10b6:510:323::26) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DM4PR12MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c64426-c96f-4add-e15c-08df17fc2462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10070799003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/5b3cajZ7s0nFLmo1dJTwGNWPYkw6KSdiFNxPy/Zhak4PO1GCFO60P89Cgqi4IhLz5t5OxXeyP/ZiBSCVqr+AHmp43Q/T2U1M3xbGdcovhukt0Xnwn4km/+Luj2NmOkYmpw8ccJkK+ElNz1r9uSzIzlExT9qkiKcgE+EnnGwrCYnt/OuF5dD0f3mYhsaFdf2xhDyQP5zhey7jPA8vftLGroRUqEDIAjgCCDG7MTl1Hxjn2Lbh9uswLO3wXgNrDz7WqJeCj660JAb77qUaPN1USCe/QZ18kzadLN3/PZrzvfg3L0daR7YfvqRNKnr6d0goqVr3mCfibE173mi9kZv1AL2JV3JTDzb6Uk7QU0Or78hQjPoeA4G2mdhyD2ipylWw5wenauxQm9hVg8S1h6sPt33g4nbTPHEieSvDbOx8P6vAE5d/re1VoNPE7dmMfTz/QULAWQLgdNNE5XrXnJkHOKLLaepSkMb0Yv7Kjm90+g4/mbz2OcFw89GDrztXniyJeg/1x9foNhpg84HYUlpCzs4wYHWwbEbOUZUbpQK/M0HAs11ljKJbA9yjP4iRO04xUfUdr4KFtRsJuwDRrCkEyQQ65aReAWrT3uVs9DMjbehNw2jEbsya4NrC2g43qWFHloqp61xFy+HpAIz525RjnXdZc9D3FgEPxf3AgUu9Gw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10070799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t1AP9KJhcdvgJs75zErZ39oMXEt2nhcHAz/KJ9Ueypaf95jIJUu1DUSKMEKO?=
 =?us-ascii?Q?fotr4I4NSCJL/Wi14EwAxDGrASRf9qkCw/cxWGyI/V/VRxp46j4hkagcuglu?=
 =?us-ascii?Q?dHM+g5MDNHkhdEYeQbL7hDpKjZrF7bXP3jyuzrDMlmMw1CvGsUMowb5OhdYg?=
 =?us-ascii?Q?RP3w5n7z9YInPjp0LXeTUtZEqjnZ1r+sPpR9VMblxKiefXuHSQOhBlwEEc6L?=
 =?us-ascii?Q?kuQ2T+Vrq1efSrLya3iu3VhNWymkVPXBbK6YUixxc4R44aDAEQl63ZtjCgYf?=
 =?us-ascii?Q?UQUpEL2cf5MyddhQMkDSWWzWZSBGdHU262Ij+XQwT8aFQyisCIqNzL1tTrC4?=
 =?us-ascii?Q?OGaUSCUi3/mmAU7T4Zw/NZF9/qo+4R5YE2arHl12DzTEvC83OQNBIgHS9aJo?=
 =?us-ascii?Q?FtzfVqQSFTwkxLdL4CUbXBx/flr3zpGvLyIlRLfiqWcvj/HZI95sWMvp+qJX?=
 =?us-ascii?Q?dStSxOPd49NcurScbqUshFkVIPI5O9mOH0FqfOnD+UZaE6JCibTv7TdGJ5ax?=
 =?us-ascii?Q?xhyWSDDDXkHTFF8mnQzFm8wVzTlaUEMvGPmIPdUyhAKcd5MtNxo2FdBU/Az4?=
 =?us-ascii?Q?kiEkb84NbIEUGxDeHF16QDwZGuhFS1ZVU+fCAjseDQSosMPXIxEQL1m8ePLU?=
 =?us-ascii?Q?CjEVwTGxQGyEi9boe7Q0wTAyrP7Q/QOwY2yvjh/MBCwJr5KtWQMWsetxb+Mu?=
 =?us-ascii?Q?luVOd8Okt8fcMn/q5e12pJcpFuR0iglUnEhQRoENDTY3DA4G+n9CihMfObqU?=
 =?us-ascii?Q?ANP4P/jjciSNoaM0c1b/4cBOrVhGUwWGs7Wd1CvdeWtqQ9mwyZT0YF23Uxoa?=
 =?us-ascii?Q?+6b8HzYmv2kIZkaKQbr0YXdy7XDTETdNMceSFkG2strm2hLhdL5q4DD5VOx5?=
 =?us-ascii?Q?GKaOjRS86O6J3miS0gQJXw5f9W6Ab9fIZhI0pRs52NtxedYL9rpBRaoiekyx?=
 =?us-ascii?Q?RbWFfrC19fNGIj6p+LVr2XPzfrENsv07c272/NcBdbSa9zbpEZoQH3GqFv2U?=
 =?us-ascii?Q?vvyvI6PsGkm3qzZM/nVwq8Z5eCQcjaVUxglfHuJQOFqcBi7G3op7/6oVDNFS?=
 =?us-ascii?Q?isXgfJmdZGpU7XRccbg95Y/iW65mGP/4PIa4J6sDBXXnSL5hcxUC2TnpBMMR?=
 =?us-ascii?Q?Qh+yxsLnZ8HrJRZY/4cWWrRKmE2Phuirxt/RPLSv18nIt/OqEWmxMW+sj6Lj?=
 =?us-ascii?Q?1Bo+w2QlREt/Knv6+B6pi/VrpH6pn2J5oanJdfT9AIDzvEc/5eiRrQ1bYYLd?=
 =?us-ascii?Q?K9NJH0sE0l9LkBlhL1BvDdHB2yrz1n2eDgLfCecOKHW/xg6IQ9wekj7FtL53?=
 =?us-ascii?Q?DQR9VldQFxt7KWt/B/cIJmSj+HevIEY/MCns7+Vz8hi0Tczpr9XHRTBwnz2v?=
 =?us-ascii?Q?8LBu2h0Hqj32JcHdci7HJbbxauKMekFYt2urK2rrs0wSMJNZMj61OPmE/ynB?=
 =?us-ascii?Q?ojxCHIdcXXkOluHlJAUb0UItgo9VKle5KQ+MaKw98xba9cKOUx+xMZ+V+2S6?=
 =?us-ascii?Q?bq7pFLgD64T2cqE708kuC5aVzzRgC50zuNC2gWT4NOA2FsUR0YulrtJIux9r?=
 =?us-ascii?Q?u+lc58MW0Nn5c5vzMdUijsC0h0Ad8V4cblQHe0dpaGRHNwR+t2QyglGBOqef?=
 =?us-ascii?Q?v1eWciZ1JlnHbYs14X4N4xqFLfePihkK3vIqn/XHpUH+Tldz/L4y4A0s10/G?=
 =?us-ascii?Q?0EI9C+WAkMp3t/98z0Nly/6eOrxjPhUNsVgVs3xGjDqajI/m60FXnzC81yI+?=
 =?us-ascii?Q?49WN43sDIS5ReqEcYq90KvOk6/kENpyJYIeJxrbR8bNrhzu8Dd3h7VioIKGQ?=
X-MS-Exchange-AntiSpam-MessageData-1: XT0UkPjGYpkSwQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c64426-c96f-4add-e15c-08df17fc2462
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:19:42.1131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKi8TM6glwvwh8auKUTmcZLo2I2+MA5R1l62VYUbDiSlW3qmjX7I7hFEiAeD6viOiEg5FZY7llVUTY0SzAbehw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940

On Tue, Sep 15, 2026 at 01:55:41PM +0900, Akihiko Odaki wrote:

> I'm for this change. At first glance the repetition looked awkward, but I do
> see practical benefit of this patch.
> 
> Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> 
> Regards,
> Akihiko Odaki

OK, thanks to you and Jakub for review. Taking it in bitmap-for-next.
