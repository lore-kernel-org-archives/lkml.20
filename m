Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8C347C0E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898703; cv=fail; b=Z1zliHxrrp62FrHWHIp0tCxhsnWNhQW/GmaSoza7F1oZKZ2a/DocVgidBEtyuDa1ewEY+9AGhSnd9FInX5/sJouRyueeYxv4Q9bKt0xu1Fo9qbHAMqfx3HW7qUhTM/W4GuSxa8sIBvDBO5YWy5JbPmAU6q5nPC41H1/oB7QYSAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898703; c=relaxed/simple;
	bh=jpyPqIailBzuRQdXvAKxgbK+TGVstp8OO4SVMqdaPes=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=R5af+7avl/VWSE9g2IIAm+B1Zu2Gc3egfSj2KMRrQoPPbdfHabxbNT8n2N6tw0Wi1tVZL1nQ5Yuhws2UIjRlRgou0TcygDv5NeoFj+VB1/CySORGInK24vNtHQtk89TdDlG6qtKzOxEpC8zqAn4QE7V8NNpqlmAAp+vyROyzSnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LgECEOka; arc=fail smtp.client-ip=52.101.46.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LgECEOka"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LU3PxKBji7BN6ZpM6VdNCyYWqj8WDMW6Yg4Wa+64eEHitskEO13ET7aOg7sOLhJCrxJxYeCztJXCPVpyJB8KaxzsNiIsjmOBYV493/rnfb87pFTZj1dOnhvrzPqOKgHRr0x9MM+Tk05+eYMbXcop5dJAhGfB8SpkIc7zjRJEJ/h+JabkeKlyXl809lH5BXtCUDkgLVUpK1Ba5PLKkVmQ+xlUP1tw8DVcobjOH0uFl+bqnbs3ssGa/QSuG7hs+QFkBlOHVEuB1x3ZEQBONWz0I2MTnK+Pf+z2QRGQlUy3akxgZaPyD8so3f/qSAEdHXyKRXJCLL76pwUY0xj5Dm9Syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVLEX88j89AWlCSlLw28PBygd742eQWLZsqOgzSU+4Y=;
 b=Pp+ztTuTitsf+96DE6RNcOExHWH8SwPZkUsWqwyZjMDldBglnmI77pWFhxDeF/YrylKD+dt3Ym5vkBtLoKyvF9Qq7A6oZz0crviIssp/emMaYJfF18OBKIMPdcSAL/3FkUBp9jhxBNz0dOy9V2XFeebyaefG1VH4WIJjAHFwCnSacY1lt36ZB9ZakMP35XuuoyTaDzQtg6Quqq/THewTMbXpQsqgs8kCTDKOGpraJLkq47GmkAhN5d+rGJNJqPrvHXnSyhqSU60qFmIKGa9wV9cwIhEVAjds1Roch4st8JWLhgNHlostXlrPoX/DOsPskwpdGMNXknNRFfQW87AIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVLEX88j89AWlCSlLw28PBygd742eQWLZsqOgzSU+4Y=;
 b=LgECEOkaWWar1CZQmHw4reWoMm38QTK0fF+duR+YB5drDEU0vHQXd4YcBVJvGw2AGwXxYMCKMkK6W4IAtuaz2FqJheu496f2RFfIfUpxC1xVhnFMeF7pIFmxTiWGBW0zRr3iY2+VQfuKWz4f9juDa0twnT9uLzfnkpRqqMMzCNgBSDT9ovzUUpNnH2a6/D91Ct2TdQ2hIFoRJLeU+HtNStfnDA/s3NTcBPiTya0yBHcGYFtD9vvmSvsqSLbsJuZexlMFAoGzbMjBgbbMs+WkAlWLhhw5543C9p/J+7uPER7nsR/yzPGSIadXETkakI+pME/c9AiX3pGq2ogj4Wialg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 20:18:14 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 20:18:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 16:18:13 -0400
Message-Id: <DLA7NUL95SKS.GFI7EC61O3WL@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH v4 0/2] mm: improve folio refcount scalability
Cc: <ivgorbunov@me.com>, <Liam.Howlett@oracle.com>, <apopple@nvidia.com>,
 <artem.kuzin@huawei.com>, <baolin.wang@linux.alibaba.com>,
 <foxido@foxido.dev>, <harry.yoo@oracle.com>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <lorenzo.stoakes@oracle.com>, <mhocko@suse.com>, <muchun.song@linux.dev>,
 <rppt@kernel.org>, <surenb@google.com>, <torvalds@linuxfoundation.org>,
 <vbabka@suse.cz>, <willy@infradead.org>, <yuzhao@google.com>,
 <pfalcato@suse.de>, <kirill@shutemov.name>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 <ilya.gladyshev@linux.dev>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.22.0
References: <df26082871b4c65b2bd38d409026237c08572836@linux.dev>
 <20260608154734.8e4115fde4e2e14a3b6892fb@linux-foundation.org>
 <fe53d9a75f776a5e002a3375d086c5714f558547@linux.dev>
 <DJECF2107V6T.23HGJJJ8ECKJ9@nvidia.com>
 <6d576c2a-af34-493c-bccb-cf2e035e6506@kernel.org>
In-Reply-To: <6d576c2a-af34-493c-bccb-cf2e035e6506@kernel.org>
X-ClientProxiedBy: MN0P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::22) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 9938151c-89d3-4fd0-752f-08df0de65017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Har9qm0SE2ks3PtVieYS5ceKr5vrsfmLkQrSkYCdUppuD6zIlO8LBOpq47ZXmqkBiKl8DKsJBBAlYY49SuIDOeGH4YcNEFJO4A9fHSUPnnwWSy+5Dy9gfHfeSdSZxHHWhTj4SjNumOj7OVr3axtkoDY5UH5NaAsv1cNg2VFbJcAHxpbIsrcC5zbLCCx/6ZpabeZAwamW5V6jT5YP4wgdvtpLO7d4j+yfyyl16zqVHbMyUDP7PezLMVJKs0+3QqqZwbb79gFqRgXU8jV97AjDxVjom7jZCAKZ95gD5sOxexLE5jTJfctWqkrKrxGtitvb49ePs9zYswGtgHUVgK7mBEZInEKVRLQSHu0+24HR0gCYXJyxlx7TEnv9FdhNIRJvitl5NvgExTMCJMbftHSfmNgNbS1oL99QMf8HEwXcxmrNbJPM6oWkPs3Spw6y7aE2AjdWyJ8Gi8nT9gT4++us+hicPuVGVB6do3SAPgia4caFZY12reHg/ar3bwsYxALQfYUd8gXTNGr57NEDhKbFx6waG2HGfC556/9R66Da7hfj6wG0k6GyY3TfT+ZovBCH3Gn+rZAsQ+SBNp+8OPeG8HsXACA2lawAt7EtQMv9Iw3eRQzg4/IrAZsLVDoEyjWjlAetcPfPn/m478c8G2bKhCoOQA2NpkTTNoSmf8+GTM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym8wSnNBSUV2bUdEMEJSdXpFNTdoWC9HQXBnMUY4K0lFZUN2SWp4ZGhyRyth?=
 =?utf-8?B?c3Y2dWR0SjJjaXlCS3lyT0kyV1Z0S0RCOE90R082djRFTUx1TlhqR1EwTDNI?=
 =?utf-8?B?aWxmOVJoWFB5NXJTZGlMR1VpNVJMMnhxRWJKZll0U2VoeVYvbm1rQkpTNEhy?=
 =?utf-8?B?TmRxYXRmdStrMDJVOFdpNXpXR1NUK0Nib2tOMmszMWhLNDNJZWErTzNkRVFU?=
 =?utf-8?B?YitUNDF1TDZ3OTZhaWpPcnhKTTBveVhramVhVFhKTFVSeDRXMVVuaTR4TTg5?=
 =?utf-8?B?MDh1ZWI4dW9ZK2RLbVc5bHhKN1lpbHBrc0lLUjM2bS90MTRRcWhxQWEvcTdE?=
 =?utf-8?B?RUY0elY5N1JPK0s4Y0t5WlNKaE5RbmhieHR4aGFxNEV0SWQvRlhtYXZhbS9p?=
 =?utf-8?B?NC9OUVc0QjlyaXVIaldtVzZmVVNlazVRdkV1RjBLUlpUcll2bVNRSjBPL1dF?=
 =?utf-8?B?VlRiWU84dDRXZlRZaUtOOGNyS0tQNURLTCs5b2xnVi90QVA0eEtZRUtEUWtH?=
 =?utf-8?B?TVU2bGczaTNzbVU4amFvVnZPS1FWamdrbGFtbFRGYWhuTU1ub29kaGdLTGxy?=
 =?utf-8?B?R3JuOFF3bFZVRDk1ZXlqdU1BWVBJdzA5bE5zWjZ1M0h1MFZuVWJDM0Rzbm9v?=
 =?utf-8?B?SGVxMTEyaW9tOThVYjVYem9JcWFGNmdFem5McjFTWnh6L0FjditiemdmdmRv?=
 =?utf-8?B?TG40RWlvTW1YTmF5VTY4TytZZ2JhYXN3a3JKbkFsdzJsbzZLZk9CZjdkR09n?=
 =?utf-8?B?YzBMQWJ3TXhUMUxnQjREUFZBQitRRE1aVmFOZ0V2NXRrZExITThYb1N6Uzc3?=
 =?utf-8?B?SVU4OW5HM3dndlNzcDBjdXdyd0ExS1VQUDlOWW1FOHJZTlpDVDFnQjhVKzNI?=
 =?utf-8?B?Y0djdDJNYnY0emhWVVB4Nkk1TnI1T2IwalZqa09NMDJqUFV1a2JReldlc3U5?=
 =?utf-8?B?QXpKQVNaMXc5RTM1Q0F3a1N5SHpnSmQ0TE1wNHJDdGNqR0d2S0sreGxZcjJI?=
 =?utf-8?B?d2oveHJjWWYycDJFbGpVMENFa2NtZDlyTGUrM3VNSDhCZkdwdzNteWU4Ulk5?=
 =?utf-8?B?QmFEcnM0eGZyZEQ3WnRuci9Yb3NLK0FnT2plTFBMWTcyR2hrWWk3MG1Cdmto?=
 =?utf-8?B?eWtIVkJhNUdpNVd5WVFaL283RTRTeFkwYThHOTUrZStaY08vNkZtNlQrWnE4?=
 =?utf-8?B?RW40ZjAzTDViUlpIY3RyZXRQa29Cd0VDZ2lVbWc4UUVjTjVHUUgySTVSNVYv?=
 =?utf-8?B?aXlJRXpERnF1eFlCT3lIMW1ScWIrNXYrbWY4b1NJcE9CRjhhWVpqNlBLU0x5?=
 =?utf-8?B?bWhXb1NqL0pNbnhjV3NQSG9tK29lazlMQ0I0NGZqOWI4TFVPOUJ3aVlxL1dn?=
 =?utf-8?B?WXdaTVhnWEpySGZuZGkzYWllZ0Z4KzZTcUlWRTVCbllla0E3VWRsc0FpOGRV?=
 =?utf-8?B?b2lTay90OStWUGQxQkJCaGpNWE94ODBoY3lkZk4yMm9URlRObk9KcmpjNDdQ?=
 =?utf-8?B?L0EzQ3owS2c3Ty9WTTl1NEIrVitFbHZOOWJBeGUvbmpzWktLcUV1NHVjK0h4?=
 =?utf-8?B?dU52ZXo4R2tycXFVbVluWThscER4cVZ5dVh1QStRbmFSbFhZT2gwVlNtK1lz?=
 =?utf-8?B?c2FLVTJPSHpDTUlMTGtxRitCTlRidW5uWUg4bjFoYnppMXhkaE5qMFhibkVB?=
 =?utf-8?B?QWZ6VTZCUEpNMXpKMGJGQk83NUM4bHQrWDRTUEIzbU9NT01mSkEzck9mbWlj?=
 =?utf-8?B?OVJnSms5Y0hpM0lKNndnS2NJcU1ITGtqenhtc0lqT1dXNWowYy9VcFhtQjNh?=
 =?utf-8?B?SDF1cHhlVWpQM3JORlEyRXROUnhoR0lBdGM1WklMcW5iUklXdG56Y28rYU40?=
 =?utf-8?B?QUl6SDNPU2FZWGFLbkpIRFp6YlZWNnMyZlEzQXVuV2hvK00xMG9Ubi9BVUx5?=
 =?utf-8?B?ZUwvUXJPUUJmNG1aRkdMTElQVDFoTXd2TEtNQmd2clg1TEJkZkkyUStHT3BZ?=
 =?utf-8?B?a2x1VGViNlJRTThNWGFZb2xFaU12S1hTcm81cUZEclM2L0M0NGFENTZhaGRR?=
 =?utf-8?B?ZVMyUmlXck51TkZWdkY4Nk9BYmJQYUtxZVczWUxHSEJJVUhBTzFacTRrOHAr?=
 =?utf-8?B?YlMrVEtiTk1LVE9BSHd3MGRsZGttZWNsRDM5MklUWTdNSlNTWkIvK0pnMElU?=
 =?utf-8?B?YTVET0I3aUdaMFNsQ0t0S01FbzJLb0JlbTIxS2t4ejNLRlJzalpQTVN2M1dE?=
 =?utf-8?B?RkVvb2JFcFl0dk5GRlIycVVEMFlIV1RZaU5ZWW5lOU5Fb1BLSFpFTElKSXJC?=
 =?utf-8?Q?IJvompsNsnFHLuNirV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9938151c-89d3-4fd0-752f-08df0de65017
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 20:18:14.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PMWtIS3CJiSHU2PFPy0JCEa3iAhADH9jl4Ltd68eTxrEKRaXqawN/CsxExNwSAt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088

On Mon Jun 22, 2026 at 3:55 AM EDT, David Hildenbrand (Arm) wrote:
> On 6/21/26 03:40, Zi Yan wrote:
>> On Sat Jun 20, 2026 at 2:19 PM EDT,  wrote:
>>>>
>>>> Thanks. Nice numbers.
>>>>
>>>> AI review had some things to say:
>>>>  https://sashiko.dev/#/patchset/df26082871b4c65b2bd38d409026237c085728=
36@linux.dev
>>>

<snip>

>
>>=20
>> For your patch, is it because of the separation of refcount-0 and
>> frozen? The page goes refcount-0 before it is frozen?=20
>
> Exactly that. Refcount 0 is only transitional.
>
>> Will it work if
>> the page is frozen first then gets its refcount to 0? Basically, the
>> frozen state prevents anyone else messing up with your refcount.
>>=20
>
> Let me comment the original sequence:
>
<snip>

>
> T1: BUG: calls dtor of type X on page of type Y
>

Since Ilya restarted working on this[1], I would like to get this issue
sorted out first.

[1] https://lore.kernel.org/all/85b0e3c5f328e2c3779fda986fa19530ae9c77d5@li=
nux.dev/

>
> I am confused about the "dtor of type X vs. type Y". We have the page in =
our
> hand, once we won (2) we can lookup the type and do the right thing.
>
>
> I guess the interesting part is where the destructor is called from the o=
utside:
>
> static inline void folio_put(struct folio *folio)
> {
> 	if (folio_put_testzero(folio))
> 		__folio_put(folio);
> }
>
> Where we keep operating on it as if it were a folio, although it might no=
w be a
> non-folio thing.
>
> So if T1 is doing a folio_put(), we'd call into page_cache_release() etc =
with
> a non-folio thing.

Right.

>
> But IIUC, that can happen today already when we do
> folio_try_get(folio)+folio_put(folio) and it wasn't a folio in the first =
place?

Yes, it can happen today. But it is safe, because 1) __folio_put() can
handle non-folios, 2) page_frag_free() will not see a folio as it
holds a reference to the page. It is an important asymmetry.

After the patchset, both can see a changing page type. This means we
will need a generic page/folio free function to avoid calling the wrong
page dtor. In addition, when a to-be-put page is freed and reallocated
by another thread, its order can change. I am not sure how a generic
free function can handle it. For folios and compound pages, the order is
stored in struct folio/struct page. But some users allocate high-order
non-compound pages (not passing __GFP_COMP), so only the owner knows the
exact page order. Unless we convert all of them to use __GFP_COMP (we
will do that on the way to memdesc).

This issue needs to be sorted out first.

>
> I'd assume that will all change once the refcount moves into
> separately-allocated "struct folios".




--=20
Best Regards,
Yan, Zi

