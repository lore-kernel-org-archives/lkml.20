Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010092.outbound.protection.outlook.com [52.103.10.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCF4248880;
	Thu, 15 Oct 2026 01:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792026651; cv=fail; b=YzWat4KEt0b8Vqwu0HkfpSacPOSGwtqMKsOaIRctvTZ8msXcQDWD4qhFkPoypOg9S5EGGWeQDyu98ff/zWdFxeRVGEByWayFpoBtm46eE8vBlzl7vsDfDo739crfOrZSbWosM4/nFjGzQmI8erW7D74Q2f8VXywpiUs8iYUJKVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792026651; c=relaxed/simple;
	bh=dhKBWHNGihR/Zuawj72BVkIv23+yqzIYW1wFm0E8jHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hFqatERPSh3r8dmjQUGorxB9w3UgaS94pjBjVtEPcapNtXw54zjy1XaIYg3pUsJzzD/ZAwS/vBPmH/HckV8NW/oyGhZAJtq+5jMBwPpS1g/3yv4lsRzXVSd5BgM1pk5HkXrAvRcZh2ZWXtphS2jPUbMAioZ7jBEaSblcAdXf3Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mt/0+cUi; arc=fail smtp.client-ip=52.103.10.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mt/0+cUi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAr5qMngqKK2nQwiqkUN/OY66wHnpcjX26DD9U6Gle8G0sKSYJtNBfI1qbGLHG1jAdDajTm7aCzD79+4P1vnRvjymIyun0zMvR9B2men8lDQLFVqg03WCji9CZmQj2nY90oDyg6phTcSx/rXvc0rQZfhRWvyrd1qiiFr0RVEUqyl2SKxcKJxPOJuEchMEQc8EsPXTiYm9oKnz9NEP+iNOSY40QIGRyMFVzV0L4berOgXiLE+46H1mj9WdvFCHfSQzVvPt3ErGW/ZBWuRtkqPuEU6TVFrez5O625zkmoTU60hdSYjhPFTPg6kqpYpIDJLcwPUEOuE4894c6PaEjSqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DszBMlaF6m6TEid/o+MbJ/AgGt4sAWOa74n8j8T64w=;
 b=Fyx7VXwT5q3Ry/lsdiyk6Flc8yhAcZKOrBZLwjjcDnIs1DGFyhYbKVhNtWHOvau3jKz2A1YrDYldIEwqEMAOw4FMLKIX1Rhz8+UMssSGCwQbCuiKphMGzTuao6SpcVrAmjxGuK7fJn9fzF0A3AqeFvFEhj5cGUKmMSzdb57eAuIBItULnQmocuhUbTA9sVXRD9oEoEi94/gD71+BPKsAhYF2hBBLKdttpLHEaaoeJi4ynkX9rZQcAdNvnfKqtDcXeIvXX1OVedt9nJRE++BZbuDznHZKIWF9i0YhqP/iO/uHxXAbWnExA0ipE7XiEgubBr3X8SNm9KHTN/dVU4ZsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DszBMlaF6m6TEid/o+MbJ/AgGt4sAWOa74n8j8T64w=;
 b=mt/0+cUicenPwlb7Wh8dszk1nrjCXXstY2DZeOhooLq4BuuGF1KMLio4v0uUQ5vFmmpO7/qgem3P6bK0w8fixd3j6eEl+X/bEKJcouQhgXCiJAqPAH2zM54pOKf4kHEyBrDsC3w+9OXGWVvpoHG5XLugDokkDmrE0JD3Ae/rJ9/Azr7X5aMbiz+Fr8Gavp1VTRx03/FyndAEkiUO2tCeBL766ra5eLkBleGqtGJCkd2hLAamaWW8VRCZGMaWOSS87kUGqXWbeU/MX4Nx3u5ZkVVEldnPxCtUrw7LlbhJpwwBFxaBBDgyiGQJgQ6cxmXNpC5dmlOSSGojZ0Nga+z3XQ==
Received: from LV8PR04MB9007.namprd04.prod.outlook.com (2603:10b6:408:192::17)
 by DM6PR04MB7084.namprd04.prod.outlook.com (2603:10b6:5:242::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 01:10:49 +0000
Received: from LV8PR04MB9007.namprd04.prod.outlook.com
 ([fe80::eaf2:5da7:6815:452f]) by LV8PR04MB9007.namprd04.prod.outlook.com
 ([fe80::eaf2:5da7:6815:452f%2]) with mapi id 15.21.0522.011; Thu, 15 Oct 2026
 01:10:49 +0000
Date: Wed, 14 Oct 2026 18:10:42 -0700
From: Eric Argishti <eric.argishti@outlook.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: admin-guide: fix typo and punctuation
Message-ID:
 <LV8PR04MB9007BBDC769FDAC3B6FD0946F49C2@LV8PR04MB9007.namprd04.prod.outlook.com>
References: <LV8PR04MB9007F44F1F989D9D95D1A386F49D2@LV8PR04MB9007.namprd04.prod.outlook.com>
 <87wlrkwixt.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlrkwixt.fsf@trenco.lwn.net>
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To LV8PR04MB9007.namprd04.prod.outlook.com
 (2603:10b6:408:192::17)
X-Microsoft-Original-Message-ID: <atAgjS2NArcEAj5B@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR04MB9007:EE_|DM6PR04MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bfab0bc-93ec-424e-a5da-08df2a5925c5
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19101099003|5072599009|8060799015|23021999003|6090799003|15080799012|51005399006|19110799012|25010399006|3412199025|440099028|2607281247196008|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yzH96hkngMjR6RMUfiZoZbXtBJ66zIqaIbRnR1Z71QqMqZUttlGO0ZAlucDV?=
 =?us-ascii?Q?5o/ck8oVmipZCz/cc6bRpfIzT/v5AMc2+ofGuDJQkj6GIm3vV+Pj86Kv9YuF?=
 =?us-ascii?Q?BfAn8Tg1Romrr86CQslpCUA1O+YwwboIfYNPsqSa17MZbWtOctknD/LjHsPK?=
 =?us-ascii?Q?qQV7wKb79dob0Mrgl7y6Hvi0mHtdhlmvJ+nMCbkNj/CJGVXgaAtQ5xNuJ+2n?=
 =?us-ascii?Q?MqAq9eqU6lWQtSVqcg2BcK8LjiVY9UYdUROJ0Z/E8qZ6k2bgp/Ch4Yvf05c3?=
 =?us-ascii?Q?oVLDYgRa3uLr7vPLi8PlGN1M3Y+W7q8QPxh5R4bGKQgE8AKIDPFwEblokWIY?=
 =?us-ascii?Q?4BBxp3Swk/K1ZbYbUEgorDMgECdxSTnse9FcZZadG5c5RsDgDYbe1Wb+FGk3?=
 =?us-ascii?Q?oQuFLbB9Y9E+vmKU7dozxO+tWioSh60tIw6o/Z38czFrKB6SGKnHWa0Jv39d?=
 =?us-ascii?Q?WK2tsOqinQ3cbzp5NV15kw9K6qvrazQIwQuKoQAcGO/Dn4McM63kcHkdNV62?=
 =?us-ascii?Q?4+HqPj/kW+hN4vb2ARtnFhnkUEKPW4xHnNDhCtaBiMeennHFacDPfZvunWrV?=
 =?us-ascii?Q?ZSfdC90GcP1M5Cb08FniiDgtwlkOEnjuVJyA0Cx2ECOWo9AOZqfej0cZp01v?=
 =?us-ascii?Q?mbJg7bHItLfneAmFOSnxMQVah7JyyvNTEGOT61LL/XsfyjRQpk0FLVO+DvfP?=
 =?us-ascii?Q?8PeMBfNzQsZx4CY0dGVHtDqdpkFwXG2Mq+MdMXN6y01WlyR+JoSPZ0a8fW/X?=
 =?us-ascii?Q?2EPYtAJDwe6GU5tBWekNRC0nJSDz+6ML0x2YmFu87PrajXpokdiD0A2tTW07?=
 =?us-ascii?Q?BRL8Q7Et0dwV0aRPkhtirqjfn3h325zooE2z54trLCF8T8CJFmbADY/ffLbn?=
 =?us-ascii?Q?+t727URD83vMii6n0cCGyVkx9xXmeK+jQP0ck9G8Uf3GGGBqSYVajya+yqNY?=
 =?us-ascii?Q?VZt2WB/mteDnI/v5tWdh6Q=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x+yBExjpWaiLUoc359VH6gUbwwhXXwkch+GLJ1m1roB/kerH9hAD/IFLRhZK?=
 =?us-ascii?Q?pkCP/rGUZPEyJj6QGfie7RaA6zRbseaeBj8xv2WWKj/1oFvyjeZdDBlyeyl2?=
 =?us-ascii?Q?hTHTgYwRx99ygOilbXdcEYCjhfdStbJdSBtCC5q3FWPJjAdfKS3Ttdn4cI5R?=
 =?us-ascii?Q?oUKWYJ5Q1LL7lXp+1ohf2GgR7fGTODg94qDr/nHL2yfsgYHP03bsstyFDJZh?=
 =?us-ascii?Q?0F+SOS+OP7wRgfkt8NFCix8f1qW0U80rWN/JNrk/DmtSvDqoOc27szykzy6f?=
 =?us-ascii?Q?VV8DWIHFIhUvcMjFtNlgrYMkZCgH84YTm2KkVsHLwqo3EGCN6oyR9PMPbpAg?=
 =?us-ascii?Q?N64XERdfCjQDJ5t30hxbleloy2Wybj6O9pv9RzKyBTJ2+owjX3vnPAD130fO?=
 =?us-ascii?Q?VnMgkADikin/6rtgbiIvVNE+9f8wt0OZlobb2tXkR2So5kQtVUwdgK0ODOxy?=
 =?us-ascii?Q?EhyBgjfGMB9aKq/B79T22WyeIylsgjQhOCNq27HNKwRhua330ZfPx/H+ZSJK?=
 =?us-ascii?Q?sG9Ut8oANUKYCIiD7CtwwwTS6w858qjmTGGNL4E+bS3cbD10S/5ZXROWstoc?=
 =?us-ascii?Q?bc1kodgcOIhPz98VlSmjYe2ue6bGTKmcTaOgQNw3WC8PYJpJZiAMKAfUct9O?=
 =?us-ascii?Q?l8ikNrXoGsw/9wBlnuR3LtQVUPEF/KwQDoYoGU+i2GNiztinDHR+ej2j4nxT?=
 =?us-ascii?Q?y9ZJxrcxbrd3RDmGoHC/qHEKij93TuM+KgOGQg89nAQ+ePU5nodoLG45SDK7?=
 =?us-ascii?Q?kkz1ZTA1dbPqo3vo4qDkuV4r5J5sl4Z68OTQuvsX3IVpiNRvVGV8pDrpZPB9?=
 =?us-ascii?Q?KTFOeO/bO+rRIe7NoUnq/FhQeAkt+5v9VvolJf+f0yGBM0wEwrKEu4dgLDaB?=
 =?us-ascii?Q?Vc4+4VIsEPDdpP5sLDH9W4HSDk4EcmOSRzXCvxPBmsnbGMGAB/3y0IXH4aCN?=
 =?us-ascii?Q?vkCQrStGrTV/rUHeGWiUNnzGqR5kDlE1TLz14rxoSzzifRGDz0qqQkTQvkcv?=
 =?us-ascii?Q?Exzon7X6tSnPLveS/SDg1QqzxvjYbCO+preI2H/WGwePIki7rAyFqWpJYJ56?=
 =?us-ascii?Q?hLWKbdtj5waigcdWwPC9qPKujL3INsuivkslQc2iA8L2jE6qvOkrqmB3BIYd?=
 =?us-ascii?Q?JfG98IvVKZUD6sqYPrhBIZfxEB3+tqEo+ZlJIOe4/XnQB2A1Kem1oeTpeJtj?=
 =?us-ascii?Q?PKbplQZpdiVn+1IW/kGUWCP2Y9AWSd0PEL79zIU8KlzoSrEkczB5mf6ehl2k?=
 =?us-ascii?Q?OiFbZHeRo+UoknCxVOZNhCsvMszHAz5bYyLURIC6M/S8LQsMJIsSuB6lL9DD?=
 =?us-ascii?Q?2VMTIvUED+n4baFVzRelH/tgnt+sDhu1RucrJ6vA5UaesDUpiE2QChZ1X7iX?=
 =?us-ascii?Q?JM11yhi8fB71uUPExMhXwt4iahv4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfab0bc-93ec-424e-a5da-08df2a5925c5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR04MB9007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 01:10:48.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB7084

On Wed, Oct 14, 2026 at 06:44:14AM -0600, Jonathan Corbet wrote:
> Eric Argishti <eric.argishti@outlook.com> writes:
> 
> > There was a typo inside of the admin-guide index in the docs.
> >
> > Signed-off-by: Eric Argishti <eric.argishti@outlook.com>
> > ---
> >  Documentation/admin-guide/index.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> > index cd28dfe91b06..f87e9bbcc458 100644
> > --- a/Documentation/admin-guide/index.rst
> > +++ b/Documentation/admin-guide/index.rst
> > @@ -23,7 +23,7 @@ etc.
> >     features
> >  
> >  A big part of the kernel's administrative interface is the /proc and sysfs
> > -virtual filesystems; these documents describe how to interact with tem
> > +virtual filesystems. These documents describe how to interact with them.
> 
> The typo fix is fine, but why do you feel the need to mess with the
> sentence structure as well?
> 
> jon

In my opinion, it feels more natural to split that up into two
sentences, but I can send a v2 with just the typo fix.

Eric Argishti

