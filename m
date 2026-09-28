Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012040.outbound.protection.outlook.com [40.107.209.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264384E50A2;
	Mon, 28 Sep 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608384; cv=fail; b=osSVPt1A6PFpxuzgpKUUpt1WBMS9SeL8/JP3atsKil06weyHvjIZ0csQNaZYcW5kPzb0WbQYIzlXcKc7Y6311qIER9d4NGUsnxgYBHEiuwwRINFEIL/p+dh6OFKF62rHHOt/iXri6++FuQFBbFjoG8zLV58R4o7fP7JDwK7BEFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608384; c=relaxed/simple;
	bh=QIU7Lh2lJC6C4IHZJ2Y7JHzS3kY6b1oN6bLyUDNWsbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UW8ZQHGAdCeYJtRL4FV0mP9TZRf2vb5hNWps4eXBf1m+OwkbFR1rMne2CtER4QZXTjSOCDgww2cjznV0Q6ETLVtmyfjyM8J8zwKcrSBWAvmjae4Elz6iePDI53nUy5EL2vjnVWzqqAwv0SkkA1S2/mJhClmMBiKmKpol5knxvP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iDI8aYqO; arc=fail smtp.client-ip=40.107.209.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iDI8aYqO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nihENweLbWmOj9l6F4L96jvjjQsPylfyim/HeBZDHPQE/LbUddTWyIfVZoGxBbjElsaImiBJYpFzVvjhtUwEEvwFn2R4NAhEQu9fFJt0LHXiB0C1VodTnge8x/cQ+b18o9lQpgmMbPd33w0FVo/1mz9nAhnWqHWTzazK6IiUwR/LZMgGl1HWf1F+RD8PAMunWnsl05J/99/tcP0LTpx1hFU1dgqhCJrJ6us36Md6//lzgYuqAa6SCKfVH7GfgsVmY6A+qWftr9PFhAibKKNi6nqu+c+puem5hNDEzO2o+hppzEAOw6/o5kQ3W4ZK9PNKqpAnNCKrzNA5xpqvK9IBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP8WyhMHgKm3R3HMeytLID2j1EGX78sfcFFJ7mw77NA=;
 b=gFMrgMBWorvcwuqqjoJsKLaxr2uXvc2SaLz8kk7Bc7KnZ1NVxyRydGLjQRLU1E6f3eLgPwbX2Z7tBbRT2+kSn/kCqbQsjIv7clXY5qHHqJ2m1L5V7snKsakZoFEFNaTPHAADPdeFNTRzqaCGA8JFK9h7PCXnsq9PhW6yd0V5wlLHcy/r/+Oey0hNwgC4ztrjP/8T9ArKzTJ+ey2rdLOAOrNRq1YBDQp4QOf0dklj8+P/O9Gx6frzl8y9a25X3XBiktukK3SYgZVrwMod04e1UdwBVavYno6T8YpOl/4PuPPdW6AAY8NtqKYeZmDhmEtxqdnMqo4qiH6FTlfyYc/yJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP8WyhMHgKm3R3HMeytLID2j1EGX78sfcFFJ7mw77NA=;
 b=iDI8aYqOWO2nnUBQPzELv7wfFULeHhOpJtaITk8GLfybLcgXdV9mEOzT8SRyDZ5z+nVK4O+70ob6vdDqvogSjpTUlhMLCzvYrBXULXUQqZTkxDtZoTSA8xmLrZ4h2xkn7GIKBI1BPLSKqa8PFaJiQ294mydyxjU89FUKz42pZRI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 15:12:59 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:12:59 +0000
Date: Mon, 28 Sep 2026 11:12:51 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/7] Incorporate DRAM address in EDAC messages
Message-ID: <20260928151251.GC2289128@yaz-khff2.amd.com>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
 <20260928053040.GCarn7gHIDY6qPkZNi@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928053040.GCarn7gHIDY6qPkZNi@fat_crate.local>
X-ClientProxiedBy: BN0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:408:e6::33) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c240fc-d334-4f7a-c693-08df1d72fb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|4143699003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	TGcufGIqy5fcJq0/kawsT/ANm7+1FByC36RjoRuf1GqNzEmzKaqPbrDGb+bArcEhFRqm5AFIcnlU0oTaN8h7VW4rxLfI5en1RlKezbqSnnOZZypJwYAxu+fIzNzBMihYDC92i8CS0EqdMaAvOTYfs5r1NljUllzTo3vfxB5emdgGid5id6VWHMLQKAfWjWstE2sitpCqsfW7zMM1tQ9ySFerglwcX13N2eNZe/zSWT7HAxHEw1kVX47WaZcuFE2KAWkqj6V+Fc8jkQoYa3CgCC1OOYTUtkvhI+/KYlDBI2O4W0PEnH3BHykyfDLTGkHyviFTfEH8iA36+LAuSxTyLJtj757q/USJ9Xcn0UcLf8TGeQKabzIZqx9R1Kkf81rlD2BTGHs4Y6QlUX0IQAcpPovq0qlEAH3nYR+KmEr2/7/ce3ismBjUqn/BHkAZn4z8CU3p1bKBOZE2re2UnrL3IVmsDLUS6JY2lUDeiUUtAt78ccY3qqCNOOhLacKohPhG3ms98yElrnQlBlIE2GRPiVWEOFmvSp6icjCZO4LG+NS6Fzq3Fa23k+Bp+EzEHfJ0LhMoDC1i057N425I/orahnrYw7esg2FIYLlKbroZfKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(4143699003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dwYtRKtceHgggz/y3XictRdVBJIRrAYyk3mvOb/RkYBfmlpQUvRnRrPN/FcW?=
 =?us-ascii?Q?Bac2l8gGQD7bwcgCJ93XGgq9UDjCOOMiL3/dQZSGse7jSCTlTQMu13EUc55x?=
 =?us-ascii?Q?GoYc1A7zYg5cXUKCCavcXmr8MaYvVwozdUVvOeXrojBQXZFmk5Zp5b7wugOJ?=
 =?us-ascii?Q?N8vFNJghCCmjYCTFVOd3lDkbbcNDF7Jmm3owmseIePM8M1AHSV/F38MGaOr8?=
 =?us-ascii?Q?eTZtD3kiTR0ReCjHIvuLfaYyI4ktmlq4Ae7N5o39YAyw5amuXo/blgwbiVAr?=
 =?us-ascii?Q?Vth1nyJVAGdPlAPp8vzsTV4cvk9xIKF/XAT/WTGB3tDrorXBrkMV9wHh2vSO?=
 =?us-ascii?Q?V79scKHzsTbtza74s+2g4yaljcJSM6lSmgMeEZn38zHEs74P0yHTHKxupSkp?=
 =?us-ascii?Q?9neMxeC011zuo9qkXyGqa4Z4828ubh2mgEdD+26bTvJbXX9GRvECfAlUkjfy?=
 =?us-ascii?Q?5sdF5GfuNpw5gTCTf+piX3Ui8+YsPXqXSMk4yELP14pX0QOHejeAg6NVuB2/?=
 =?us-ascii?Q?PHIjj3cpMTLANQkcxm81X6RVaDXHJWCQoLy9ohCo4MdIKS73Lnj9/FB54q0l?=
 =?us-ascii?Q?rmIhy4AhiVOirQD5LcNnMA7pgoMy2K8fvIW9yAzVZJzsgzQuMmdZUkbQbSxP?=
 =?us-ascii?Q?ivFHzejzMmrWG/oD+xhPujzIDs25JOjaSwF47opR2HnUMkAUMzPZxLnG5gvw?=
 =?us-ascii?Q?79GauqqLRRnQp6RHF09xjW2M69y1qbFiI3KEwNUn8MVtJhAhFWb20Jmgfrt+?=
 =?us-ascii?Q?RSUx+XJU6qkywtEy7em+rcL9jhcgxFXyZuYRlfOeQZ5IgqiSnOwZ/yLWFjPE?=
 =?us-ascii?Q?zFHKZaHeY0QJckbG975PpPJXd0v9WK5o4EeQs6cdhBV0NEFGVtjBCXzZzgBp?=
 =?us-ascii?Q?hYC0TQMV+uKLMPrdEyFaND8RvTGCOlh/zTQICFe5PMF1pzDUWkzu/N6uL900?=
 =?us-ascii?Q?ngW1/z06Tzub0iKHUHOLnn+nk3EB593Tog/urXt9LLhbSPmVE8b9yeKFGNvz?=
 =?us-ascii?Q?Hbrvh40SNfqoAnaAUwxOBQ8QxLU+0jCHlLgGptpDZAOUUFDFLzAhmJo40NGr?=
 =?us-ascii?Q?i0dlU+RVa5dFXjCj4FAum3kL1VhGMQ0rH7tJy4Bl0FwwB+usqDb2cf71MceT?=
 =?us-ascii?Q?uv1RA+6MDp+uVTvNuZ9OPWR0Ay5+rSOKpMdTVBwy8xjiOhU7irvJSwfKIhwn?=
 =?us-ascii?Q?WprVrvmzcJzaqwALc/yPofhima5EphkDx34w0s0uqtekF4BK3GBp7ap5I9jY?=
 =?us-ascii?Q?LxnhrkyskeseT3OD+s6YHJ3HDojDN5SH0ZbVHYiklaGJb7OkHAsF2t9cNWIw?=
 =?us-ascii?Q?JENdHE75ssFraCjf0X7qWMg+BiInnrukRnVFnSco87d+pVXB7Zz1YcPsvS+4?=
 =?us-ascii?Q?sDrhzJY8DcwwQJO5byYwNCsZ5z8xDsrN84f2YIvD0TH4dsoO0o8kRhn1hDM0?=
 =?us-ascii?Q?iJbcBlLOVffafC/L0ES1GRRLhQXUOPRN9BHw0p4t3XYrcTsubMUB8ZECVL8C?=
 =?us-ascii?Q?8KyUNK05cg8MpYiEkiaoHXg5sZubpa8TaIl9ln1K2qU1vOaZRGcYRUUZSGW/?=
 =?us-ascii?Q?s0U+yVtc0TQW+Nqciyhr1AD4LKLuYIsSylNSJcoIBARjDMivQPlAI/A/dNUL?=
 =?us-ascii?Q?B8vacRU/upnWsFykmVRLOcajnwOuZF6f9kxEw0bhZWe2xozxw783RVjlkeAS?=
 =?us-ascii?Q?cEeuYcN5GY3gUhMsv3Rh9jVHJRE8Vnbpetm70h55594eH5U8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c240fc-d334-4f7a-c693-08df1d72fb65
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:12:59.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rr1717O4KfsVI3wRzwCUyGt2UDOMhAtxMBx6fkcfCXDtAgMJaZIAl2G8vZMIYWQ+mrMdzIGCBZGDCrqS1kBo5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138

On Sun, Sep 27, 2026 at 10:30:40PM -0700, Borislav Petkov wrote:
> On Tue, Sep 22, 2026 at 03:23:10PM -0500, Yazen Ghannam wrote:
> > This revision addresses a couple comments from Boris. Also, the couple
> > of patches originally by Avadhut have gone through a few revisions. So I
> > updated the attributions.
> 
> One Sashiko question here:
> 
> https://sashiko.dev/#/patchset/20260922202318.4079080-1-yazen.ghannam%40amd.com
> 

Looks like a false positive.

The question is on a struct that was added in patch 3. And that patch
was reviewed as good.

Also, pahole shows that the nested struct is packed. Sashiko said is
isn't.

Nested struct => struct atl_umc_addr

 $ pahole build/drivers/ras/amd/atl/prm.o
struct atl_umc_addr {
        u64                        addr;                 /*     0     8 */
        u8                         socket_id;            /*     8     1 */
        u64                        ipid;                 /*     9     8 */

        /* size: 17, cachelines: 1, members: 3 */
        /* last cacheline: 17 bytes */
} __attribute__((__packed__));
struct param_buf {
        struct atl_umc_addr        addr;                 /*     0    17 */
        void *                     out_buf;              /*    17     8 */

        /* size: 25, cachelines: 1, members: 2 */
        /* last cacheline: 25 bytes */
} __attribute__((__packed__));

Thanks,
Yazen
