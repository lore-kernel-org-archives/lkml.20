Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321BB46F4A4;
	Mon, 19 Oct 2026 07:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396168; cv=fail; b=TTT3v3wdk65h+91/DaqA7L7DUbRWXc1SUBhCooOn8AOEDtr5NQavhQY1VZfTT6Oajf6nX6ohmQUE4364e7wdV/tDvWxqHmyJQdzzTnpsELCQRnhGgrHO+YoU9NBewbFZaLU6iMnA45rPucBgxXCk28PVauLxkgn2WILy7P07mQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396168; c=relaxed/simple;
	bh=gshe/0ztyemx3BYmj7FJaCxVN1t6bRNxb0J3fyu+Klk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ru7k0y62P4bmcW6rh4refrVv64dJ3gGRZP7IzjXXXoO+bSA3PTY4pOe63J6mCHpyMLfYEDPAVaeS02OcAkvxdDs4EORgHJrqkz23kGwDedzyFehaQf++N2Z+ccDCM+Zbq3hepKjdQJz5jQR/vx0TYALwyDIbmSrqGy0NtC3OXm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=oeDdUaSh; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="oeDdUaSh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urjyv+UB1IB+thoHVa9EI9l2UyzzHLim+SKXl+rvyACMJXTvyW2URVx/NW3aiCPgwXt+Rp11+5g85pyzC6iAxFuppp4Vcr7nbbExeKBRn4nSUdhsVydVHvKJwCKP6VEAPwudc4e+4FT+bcCUnduRA1whygp8CM6CnOk/UfChhUJzHU+GAqYCd3BbAAikccMrr+nmoH/m16OilH+cniUenz3BoVVuIz4x5WwZp3A2ylqoshs1iB2enCWCQkedva1A3CvttYw66kypgDUOBpXkZq10BmJpLa6J+Zl4NhBvUEws63enm7IhdiNkm4YcnPKTSLzbTJuhJ0UxJERcnsVwcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld+zTAOHD/rbwuWaPwGxU5r8NwC8vHbt7mPYvDpN+GE=;
 b=vH4IWhg5RSTm84MndlqvPWlDnSkiHN1R3pHFMTTgWt58jS21pUeBhjciwr2CuC8x5ZndZvhFEyqyAAJinFi39WQ1VGgW2uORLSTEB2wsHf/bPuDmAXnN7PFcWJOtSYa8RrCcdaQtl+tSdMte2gWPUUrHmzmoMa7UUxJie3LD7hZK1GrkLE2eguU7843rCulZQUS67EdcsIR3ISg1xQGuM5lTuN0ZxQzYl+4NUCDBitrPneD2P0iyE0qLG2qWyUJSfF+ZNYbn547E3/RomF0uCx9yDD97I0qklxRVLO9CtmdydycsWjoDhWoqxPjDbryZKY9AbW1yXFCGMOu9yBEvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ld+zTAOHD/rbwuWaPwGxU5r8NwC8vHbt7mPYvDpN+GE=;
 b=oeDdUaShxPqOGpz2znsCIPnKEJ2cOoqidsrIb12bTYzshwEGapWKXnA8Aa5yBc4+/jDy83rCEvUiSCKLieOo7uu/4WXlI2H4xPG0BYxg5dfOUXT8ll9CCaMfuEmnxb9+LepXr8T+DnYsWC8Oa+tO6pHKxj6umJJZ6uZc4VmYxy+iPyJLQ4k9doQ9h9Py1ktyhvsOh0Lgs3qVJXiOy1YieLhsmJFxYw4tuxza2HzAtzOieIomTQ9QdIpdtlJfDsROf4TLxSas9prWT1uhRy0gfOU9BP9EX1XAQK6JveYWofUdDyukoaZtbQLpRpxiTyNR5M7aWzKXdresDAz9HW6/Vg==
Received: from PAZP264CA0040.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::22)
 by MMZPR10MB979095.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:190:4e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 07:49:23 +0000
Received: from ZR1PEPF0000E6B3.eurprd05.prod.outlook.com
 (2603:10a6:102:1fc:cafe::19) by PAZP264CA0040.outlook.office365.com
 (2603:10a6:102:1fc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 07:49:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E6B3.mail.protection.outlook.com (10.167.241.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 07:49:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 19 Oct
 2026 09:49:40 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 19 Oct
 2026 09:49:22 +0200
Message-ID: <7247f5b5-5eba-4afe-8287-19731e71d4b9@foss.st.com>
Date: Mon, 19 Oct 2026 09:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: vd55g1: Register as a sensor sub-device
To: George Neacsu <geocausa@gmail.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com>
 <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
 <20261016145542.37322-1-geocausa@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261016145542.37322-1-geocausa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B3:EE_|MMZPR10MB979095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8829114a-5088-4114-aaac-08df2db57dc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	XUYRM2T7ZIjWsdu+fWtwPWazfTU+IbwabtqxIbDMg8RtNdphSrWfj7ZBFS406D+dDGfrnupujUB/Cgtmwm5Pmqc0Ik3ka0wBVjRut/1N92hrFtkblFSs3pN0knwA4MHfHuO4ETCA1MN5dH0ENoVlyDwK7w8Q4FfrWKodVukSxz7Q2c2TViZSVj8oo24LrPNGf6imC6pt4dSJTx8gNHkbm+uIZwVxdTM5I+SzmadBf5NtD5aTXQIax+yo8aRNQZRn/hl5Ll+hlMA6Kz38kmivc5LmdW2BD2+GzWT5kS2xe94XUyL9fNVM3SaHIe/MDp7BZVb1hYQyzpPdXLqGBlva2JA0N0KBqu8wByuldj4Qc5fLzt77cqmIgio9NVjqZG0eLvdFGAM/HAyc4LQLlUq6bRqCPAUKvOKSHyCwS97ZEAz99VFwWBH/YWqU4edXSbI9lqcQzcPphSRSdhVjx4mcrEdkosWzaYIsPVsXjIsGTNrnmT7UmoAYdgeqrS7voxxnXAoxsQXWS4wOhUBeFSR5LeAIaxHOVuVG5AUbT/lHdnoZWUad/vrRs7Tf5f3/rBD1hgsnn8it5W9hotMpvW18OrDSIlg2IewlVcd1SYS39BvRBj4BnrlYdWSIPnuLQ5Rcvdu2XCkeMBXdG+JIEMg4etoyJDsWcWko9PEnc4eZoMSMvRc4f4MjoI2/nPvXbKadDwlFEk35QsUCYxR7g23Ylg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zVXIDPf3EX7EyO+6ov3LiKQsp0UXFh9qdthUibKpt2osnj6pg49+dhZP5BHMsWH6FdnKCCkg8Glg3ijM85KPXdZmKJGBxkT+rAgcX2JGg/cmvNCy0UNqwWt3yDVxEHTfsa6TkGzZY/J1IVWrDlrkG7+AS/gDV4gU2lBsoIWWCakAE+Py7i9fy9rHbRxCkJFeaxKSpPEROzDnq4Gm4642cl25Idqv2idN35//hZIEa5z6sWr+Aw/EwW9AD32N8ZjkGc8NcSAzrlavndq1ZEY/SD+iAmL8i/DpKa9ZOWEUsPIGa77f7UfDQLu1r3WQKV9hdvkVxlA/CnvRcgUZ9OZ/Q4JmavcnwUShp2EDXMGd2hEVKl49rNM1LPuqG21KLd13dgQBZVQzCQELRpuw21TTmgQlZR4DM14VA8on2gVf6Q7x3VPX0GeNSlZSzEB2rVj/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 07:49:23.1632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8829114a-5088-4114-aaac-08df2db57dc4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR10MB979095

Hi George,

Le 16/10/2026 à 16:55, George Neacsu a écrit :
> Hi Benjamin,
> 
> On 16/10/2026 12:04, Benjamin Mugnier wrote:
>> Signed-off-by: Benjamin Mugnier <benjamin.mgunier@foss.st.com>
> 
> Thank you for looking at it. Did you mean Reviewed-by or Acked-by here?
> The address in the tag also reads "mgunier" rather than "mugnier", so
> the tools would pick it up as written.

Of course, I apologise. Here is the correct tag :

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

I think you'll need to manually remove the wrong tag for your tool.

> 
> Thanks,
> George

-- 
Regards,
Benjamin

