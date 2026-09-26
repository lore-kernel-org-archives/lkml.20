Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F524746B7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431357; cv=fail; b=TXw6MTY20EYFt/+GSKyFEc/6qfohVZMMGlj/KwvfFZ3mVvBZmLPPesxOhZtw0LuyaCYBtCf0nHiUVQv70MntjzUpbNR2EXSUG1g0R+G26dMlZOJz2fgp24IYRCkoM4Vp3Meo2UIJLRplNQXi5/ti+2nKJYzqnk0emOKlE23nHfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431357; c=relaxed/simple;
	bh=gr1WxiS8lKJNaaVH5JGLtQRoS60zzrSBRI/xSNmYo7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZYEv1v/30nuJ43oB8T5xkqAW43aeHANBExMPwA0Xp6jNFHJ6freQE1uZIAIeoiYe4Jd5CpXLlf7022CxQierXWfG4hCdhmaL3l8EsJMX179fHSIvkUaoOwlcFzS4fIHfG+x+cbA3HW8CH4UJ/3xIgmRJgv5WkY7JglKuQmxJR9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nT5AWNxY; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nT5AWNxY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R483gecDsIqbk/ehoTzyrHpH1ZWarl4tlAX0X7ltioW2AKMypJqkCbJdj1abVFlogSHAyE7aCiClxL7D9XfzRtktRl03IFAt1nuR0trkQzobNhLqEsokTl+tmQCb2cyHVisWH9RTwtkCYmP07lKXxPhMVhL7jvEPBxqwIIw88HqkvmPdXqgh6XWiQggbAyznRA+XiZkWDPmgfAsub3B65b1IWDJc38baCw4dKGzPX+oByNEK58lGx0Nr7m69ijNM/z6NeDDszp2Wc8bLej4dELVgpxyQGM0fwigWKuCM+LhoTWy0PUrqfmHlspHd5lUsBSBrfOWDA/vzSdYHTb9fAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxsRCKoJ7YkZZsIg/3pXvZ1NPy7u7YIN3fFFnAWy4vQ=;
 b=iTZ32s2SJr99spgRJIxuOaHxJcjxC28sZZrhxanKShGsCln/t6ZhVfaT0r/ppgDxt1Ra0j+7WhhgMjmbzpStWCSaACzwrTzJpgx6JnqXDOws+NeRamMKNHZDM4tXAkS9gRzy2tCgJK4dzQ4+jdn1YPgE46HhvocFA/u5CD73L90fx241+wY+1V7xgiDRKSvtaT9J9bs0F+ZZtI6aPwwnEefkY4eioahZZzXzrrHGT6dhWijZAWZLrLbwqnvKhZHcQQOt2pG9xq+vbvPfUMGDwfOw5gAiG0F1P8koNkL4k5jcefUBXfgHFKBqoCkCcWkJhjMRuzBfT00sl0N0awTthg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxsRCKoJ7YkZZsIg/3pXvZ1NPy7u7YIN3fFFnAWy4vQ=;
 b=nT5AWNxY515Z1iZQSkGzzI1IUTqMGO1ISb9DiqOV0DtJLNhm1cMUtNJO8UiJ3Gnlw5tE8W28U17tS66dIk34/8OZTC/TL2GE4QfxUYpz57mwOkfVQ7/CwNmHSNgE3DmKck3vHGuiWLC602bLV+3zJ1ocwjAkNO41plqoCvHj8nQxGjR8wddrSV37pOLdErAWr7WyvREpGrJbY5/kalj9ZhVoqyVoDiJqtTeLjbZSTR/iiswNj5PsfJL5ih7oPdJGeWO2VIzlxBNBjEEcxRsrzp4JISD/74mVESEMIQFzvOZa6Q/gjUXT0PQdxrQHwjC2xUout/AFIV+1AFnz7Hs+Cw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by MW4PR12MB7484.namprd12.prod.outlook.com (2603:10b6:303:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sat, 26 Sep
 2026 14:02:26 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 14:02:26 +0000
Date: Sat, 26 Sep 2026 10:02:25 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: shashank <jain.sm@gmail.com>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 0/6] bitmap: fix three parsing bugs in bitmap_parse() and
 bitmap_parselist()
Message-ID: <arfQcR_iUru_HQYh@yury>
References: <20260925102307.49513-1-jain.sm@gmail.com>
 <arapwjg4cp25e3br@yury>
 <20260925133951.a80670af112718d9b9c271fd@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925133951.a80670af112718d9b9c271fd@linux-foundation.org>
X-ClientProxiedBy: BN1PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:408:e0::33) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|MW4PR12MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: acaccb3e-151e-4b87-ab1e-08df1bd6cbbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lZDVjPE7khbYmb+fLjqNcJD3YMg76XQ4tu5b54aZVcdCM+ExBp1tSn/1Wd5vJ4xXuWSM+FQPaecsRUpm3XYzfQu5VsbXWHP7YKP2Bx6Te0iliSqVW6ndulFAlC7rbxJGr3JTW4iDoyUeBpBP7G9xqV8QFmqg4mpeeqYFleNUXirR2Cs5doGnNqw8wcOqHPfQjbkeKPGU8e23cKH2X290qHUL8qNqaWmGN2PpBjGXxVr4HLOGRUSlcQ2CcGK94/gQPtIqQIRmRwreSNoUkKl4EIcLcE9LYNno7PQOT0m0OYyjV2DM4xvbbtwVSr5w08pbv2U34C57ug76SwOCIIpBdvGTA0iVqLYyH4payFuNFN52vjumWIEUJBBCL+e+111jWQ4AsQvXh5OMEk09yN3WCPq9n9e1WO4RkGWf8lgiol5OgdIvzJLvrPgpKxZ769pl4cIyURNEH1lXJwm+Mnte/NGh29Bss/TVZkHlTrVo9/83TMtwzEDMph9MEoKsX0cK8j3XEnqUQT4uXlAYewVKDamlwazAk8dBX0v44Jf10MwqG0sVPe2XdbovQ45GqP13pb0X8Lesy6Y0/GyPQNkjb+bfTUYGSlwZm+JUxH28EfKJ/Diwiu70F4g9Q3P7tGBsSYs9ld+BVWBk8JdbFnXkrVh6Zf5ua+rIbjSzJac7VNo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?516ae+Dy445tTFykc+gOvkKz+aEqYCRpJ09ZqV+HJfZZG1UO3mXwtuGvK5CO?=
 =?us-ascii?Q?PQlBewaAPTMjDZ6DAgyexgy0C16s6f5rcMytjhy1gjt4fmmboJFzrKVl/21l?=
 =?us-ascii?Q?SY2/xQ8M12QsHwe8H6W2ZC6H2ZZFO8OIFGBiiLcveeLXkBkxKJ7NQtNIj4cj?=
 =?us-ascii?Q?OJwMyScdJe6kXEI8RGauenQyZVB5ZLCNTE8i7azfLSRc1POVF59cW+eIfHGM?=
 =?us-ascii?Q?86kv4Gk4KP5INbpCnQm5s4g1+NJmei95Jz7+CJGUz8NKaDw0lEzeBzNnSgIU?=
 =?us-ascii?Q?Ot542VE4u/0z1t9XFhY5iiN9vqBvIo2JYyLZ6fmdQEEpEMHdAfqHSli6m4hE?=
 =?us-ascii?Q?lRmHSJB7QHx42sKFVRr0zTrHgwBYhgKReR2Fqpu8rBWU+y2+2pLVJzgBwuFJ?=
 =?us-ascii?Q?ZQ+TyMa3PFwykaws00yG8ZyrDo29+0pX0upyCO/T/nrns3zpDN4KzisTi4ds?=
 =?us-ascii?Q?ewryOdp5LOySVZzHd6GIunVk/Ol6KNa1Lt4/Bf43yfYY3EC93fEemi8zHVHN?=
 =?us-ascii?Q?ORLEtchOCzRboyOTXcHG+2lHQPxbJYSZszyotNTB4z/oVGsIIqwB+acM+LaW?=
 =?us-ascii?Q?WDMAvTeoUOPv8kZEWgY3V9L5dKD7B4I5TnExOkDlfhPSdGI4iVM9I2SeMTn4?=
 =?us-ascii?Q?EJqWZ/LvLar49zei8S4ppU3q0D2m9MVEheoOnYJzpSdyGAmrpOceTNtY6Q7S?=
 =?us-ascii?Q?ZQ5Cc+zZMi9+lME2qzAKm5A6aLHpvwYbrC8EsCuOKZmcGvvlr4v1E3AMaKI+?=
 =?us-ascii?Q?aoufVmKc9syg8Lc23a/AeVnHH0ovW0RyIMZV3FEi+6UfFixsNCRjuzzg6nZz?=
 =?us-ascii?Q?7F8I7fzx5YjFItQLG8hQS2LVeOfpB8UcH3U/xVMNzEtPDdzLWXj8iX+UPbSn?=
 =?us-ascii?Q?5pbo8bpoB2oiMFvkqJdpoy9tWiHZQaaVuU7v1Xm2N93LXuqBDF/InFbzm/IW?=
 =?us-ascii?Q?8jdH0yWBI+6t8+m1RnCpMb2VQejapO4+SeBleH6GQZ0M3KjuGE5M2xifhvIW?=
 =?us-ascii?Q?TeGB9p8zXWslYx8+x/4Vm5q06WnMZQS+Ec8Y9eBcVFxrlrBaObmasG5YwoZx?=
 =?us-ascii?Q?SGFQEFkWE7GxHzOHCyt72bcfmsWaNmv22+2XWThUpj0308KbT2oKPCOp0qJU?=
 =?us-ascii?Q?FMvSvub/pr2/XnIva8EnnqprjcuyB/I5gcmZkJXxeBIw6QEBdXXcOz843IxA?=
 =?us-ascii?Q?4AhK9mUeooZURDaR5YDAaWW4izS3Gbbs0kJ849ubS4SMdMYtYnXsr8C7tsMv?=
 =?us-ascii?Q?iSS0+Jd0hyubSWDFB/+EAGIGZbSzNB7TisDN+VeHORLnBqWd6Pk1GS012u0z?=
 =?us-ascii?Q?bfO2WBhwJLz7GIn7qW9dWBaxQlT37XuZsaBuJf9jh0b5Cpy7C9rrI1SxafDc?=
 =?us-ascii?Q?L5IZh9x8EJVdgqVHSd4IxpHsj8t+sEXQY/Sv52vsVeMpknUO7aeTL43yjpZN?=
 =?us-ascii?Q?9Mh3FJ+6rgBBFUSwVvWl3rzrI3YOMpO0wg/+NR78yxIo5i918nwqeMh3HqFD?=
 =?us-ascii?Q?wJdwN/pqyKsyFYUEChXJ2jazSRa3o22SI0a7RLqM4fnBap/0gwMrGCBMV6IX?=
 =?us-ascii?Q?/RtLYz+EK7yP2H3ooVybJcSaUaokK18FBm22qYZ3ejnu80AuNSQplj8AmdDS?=
 =?us-ascii?Q?rWpIiX50DAFnxIn2StiEU7FotdyZEPhsiJM6IC2e20379R19OX81UeenpXz1?=
 =?us-ascii?Q?4YOLwEJsl41g3NVWN4YrNN/2yZ2u8GIqcCkjrUl+hoT6+gKM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaccb3e-151e-4b87-ab1e-08df1bd6cbbc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 14:02:26.6532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAcePGIIReep3a02CxcRPaOXU9HzzY0IrcijNObcd0fDqJtHjzi4psMughv7mtwincHPp5cAIyhvtSAcuOlx4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7484

+ people from 816d9992d9ed

On Fri, Sep 25, 2026 at 01:39:51PM -0700, Andrew Morton wrote:
> On Fri, 25 Sep 2026 13:05:06 -0400 Yury Norov <ynorov@nvidia.com> wrote:

...

> > That looks reasonable, but please resend the series with your full
> > real name, and also specify the version of LLM you've used to prepare
> > the series. I'm uncomfortable taking anonymous commitments.
> 
> fyi, this was changed by 816d9992d9ed ("coding-assistants: simplify
> attribution") - see latest Documentation/process/coding-assistants.rst.
> 
> So now everything is supposed to say only "Assisted-by: LLM".  I find
> this regrettable - I'm interested in seeing what people are using.  Oh
> well.

Huh... The commit says: "provides free advertising to proprietary
software companies", and that makes no sense to me. My email does
exactly the same thing, together with the emails of the  vast
majority of the community.

Can we please somehow revert this "simplification"? If people use
some wonder tool, and it helps - I want to know the latest best
practices. I want to know MORE rather than LESS.

Thanks,
Yury
