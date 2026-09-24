Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D73486B86;
	Thu, 24 Sep 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263670; cv=fail; b=LqhyrSQ0A5BhZH9sY7AqBTmJM7OBgFMdm7ycPcCbkBMXTDWTPTcammDkzClsS5JTUEYR57nuZtleTassETUvCQKoPnDp9MGzhzL/kBks2F7xPVyXDriPN8TzbtXVunAabJH+tq3qyB2Wu68MHZ8LDBAizRD3LDutyJAffjao4Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263670; c=relaxed/simple;
	bh=AH0JeFKJ5eihuyGxzuO0jJWoMcfyWwk8EX9hqLc2t5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KwGg/V7lu2rcPTDnl9InVsMXrlRzFas8eM72px5u+2IsAcVfiO1EPn04xW36MV3AgRgfgIoCUFdK1tbq4hsrVuYO2x7Q9D418QW1lPwhOm/4/dHW5xuhomRJWI/hbZdlPSPuQd0Q2rjXChLAP3u6r7xmQh2A/fFn16JDRl3nToI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=um+2z+bE; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="um+2z+bE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCmBztgYjgvq3Xo+itL1S11ydcp3zbSUhb5caPmPXawWDujnL7VvsgyIpinDM+vSU54T8VPrGvLZpyXmKZvEgt2n8KJXukFlnkVNOsJdhFF8791x51WRIy0woGeOPFNDP8fK9yhfS/m9Ryv9ZGE6KAQleDvKQavO2xZnM9BKmEGXPnxKBbdC7BnxFKA062B6BkwK1zAM2tKizh+7/sMboADIRYUWK1JjdLfzltGa5kamQkHBm2tLTgAbSpcHNnKxU90onJD8XEhyag4EMKlLF2AQ82pO+LlTNQcSoGUnhnGvlE7Osoxk/6Ij3q3hv8q1raptTJxWFrAI6a8UpkVFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1NJ3AEmqfqRDtLKd6NKC57jF8HYJ1IG4W3j5qSiGdY=;
 b=Z4Ce55B/sA6i2qk8+eSNc9LaGFqnIZfzokb+fc8B7Mr1svjcmTcFAnnzKTjN5z7TdFRGrQNNDgWV6S7bDB273c1CXcAyUAZwtQLDmDLHEqo6QYG6WkFaMoSqceNtuAJVZTuU5RC/KFHrNs0u8AHSq0kH9dL8zTf6v3DnMKcOZGba3eN0DZDztVnltLATyH0hpHsPh5yZ/uFuaGs/SM/h/FN8hwQq15xqA1RZVF82gsvoc9tB8bIlgQF15uL9aXiAaYGj0TJuTi4Tpu2Ix1fRoP738U1IEtRHmTV5myv6S0DrVnAh1C7qijT8+zNEcJCWu7bISJL+07hObonzFlvNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1NJ3AEmqfqRDtLKd6NKC57jF8HYJ1IG4W3j5qSiGdY=;
 b=um+2z+bEAKMnrsK6awxNLpEuTgIyGZwA/BFe+q2NXQ+HNeI5NYXRZiI+iE32jIaHyN+J/Jj5+tKCPyU0rxqJcbpJFk4jU2dW+NUQ7bD56BfzmVDA9ClP9ciOPc+WvRNqReLnCNDkmj/E+31RR6+frTxdTJg9U30pwEd/vOSTZfrsKGqY86gdhm+l9HcrMz41uTssdMN9Mjyf7hfk+WHV4FsBsE8/cLFO40JZAh6yZxzbxSUiJKYunRPwWxCCN57zOaZYFDdwEGWYmGiBXxbKuBRwNxUeGg0EVW+lTJnqB/DmEKAj2k+B7lPZQcSUDHNsHdBfJMcYSFk5mcsRH3o1Kw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB11027.eurprd04.prod.outlook.com (2603:10a6:800:276::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:27:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 15:27:42 +0000
Date: Thu, 24 Sep 2026 11:27:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: "Patil, Shubham Sanjay" <shubpati@amd.com>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	meaganlloyd@linux.microsoft.com, git@amd.com
Subject: Re: [PATCH] i3c: master: dw: Clamp GETMRL/GETMWL to controller FIFO
 limits
Message-ID: <arVBZ0j2noe0g0Wi@lizhi-Precision-Tower-5810>
References: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
 <aqL4HaQ1gjeaJYUQ@lizhi-Precision-Tower-5810>
 <eff031f6-e212-43a8-98c0-5f52a4b9317b@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eff031f6-e212-43a8-98c0-5f52a4b9317b@amd.com>
X-ClientProxiedBy: CY5PR19CA0042.namprd19.prod.outlook.com
 (2603:10b6:930:1a::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: 49f256fe-f4ff-4558-903c-08df1a506035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|4143699003|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	Zs4cOza+9FSla96bwear256PoyP+0RXzUi0h5Ol6sjxQ+lhtwB4GO65KYg/xQqqtIOMaK+5hhx0vl6ZRlKPPg5sLnRGOuL233NzvOiash9Nn7T9jZqjzALGzIXNKF6w2a4AaWqbJlAK4qQF0Vd1aPO2bv7TSrGUYptTglanAavAs7gwFZu6pjIsB8URjx9ZLB2jKNFcne6MrLezo+VQyvpp/ROF51d3hvX4Igi9B7dA5/uykriifTckN4eF9jflrxt1a+s5JN2aVeJ5SY+myZwYjZZQ3jTHtj1VenWc3+BSf5APB64/ZUyY0sZ1w2PXkqbyoACBXRW4zD7nqQJIlDu1DtRAgwkd/lJcyK/XFmctxC8nkgY05PuaoDEP2Z/kEoWeqR4qmqgTYiGCmbTgGfD6S12f5EgnLlRBbfq4DU+Nj6aOMkpvunCqGBXBEozH+1xSZAI8wxgPe96rHVoPHNAsrXC4gdTAPPZyyXZN3hqAA7whf8j3YptVP5ZHBXP2DRnwZQPY38Woe3ONBA1SftjWtP3ygeyR+6CWEXCQ1f1OrZcnYJuv0Hm1Nt55Kh25yvb6XuLRM3xBgvI/qC+2J96oOPi9eH8KEfz1yaHuuf617q04qxisRhaHSUYaxnOAyKyvrQxoEp4dnML0s1klzDSpnFhou7AUjA4ILZxTwxSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S8coz309MOxiS/iW2uhPnouh+ykeEDlpoWZbMlExd2rp1tAdMYswKRGy/zyw?=
 =?us-ascii?Q?tYNGt46rUJ9u3zjkHlmIHmXsNrrJQq9PjL2hcXdBzAV2jakfYjVs7hkh6CJS?=
 =?us-ascii?Q?Z2yNMfJymq6YgEIXuhtD5/zWIg/aX9/lkRsLn99/1x9lzS0s5oHFNQVIm97l?=
 =?us-ascii?Q?KBvEwMzATWix+JOVxpxEF8wA6dl9wPpeVvQEsN6VUC4uX8hgRt/BeOpGYU6G?=
 =?us-ascii?Q?sK3FSAcxqK6iwfzsYpIszULX8ko2Dp+JdRneAF5WUJUSmIy5NlPvfDXltm9C?=
 =?us-ascii?Q?uwF50aUnbZQXL4ThnulPqtYdfq7N9BwfDiVLsZA9r03knfvDmy1nPwSsGkwd?=
 =?us-ascii?Q?ZxqDnxJH8krcqGtgXR6r1CpXeplR6wHp+nOv+DorFyMGzowwOuIDrrQHlu3U?=
 =?us-ascii?Q?8z58ADwxmNHrOMvC3P9Y1R7ATd1WqL2l6iW/krD9J8qWzlahRBZhZlkV9psY?=
 =?us-ascii?Q?0GhZYZ6ZqpZb3J4JkP2XiO0xtcBS+LVXiHz23tIYWUhFGnclM7PZbQWU4LGo?=
 =?us-ascii?Q?wiH/9PYeE3XunxTaYWRAwpNL9Rh3OoWKDLYhre5rtM9P4dFcvlQRPj49GHcC?=
 =?us-ascii?Q?7/U0Gl1kRxHcmzn56JfYtGEOvhU80y2HRh7blR2S6twSNo9p2cigyhgwtqlx?=
 =?us-ascii?Q?RETxuTe5xX+4NOttlragGYJs6Gnwt/HZw813TaepAzdHbgz7BbO7THTZXS2B?=
 =?us-ascii?Q?V0pFgb32vw9Zm5MhmlQWoctlJKoRIRZ65y2DQ4Bxxbq8yc3wax27Ff96Lh5I?=
 =?us-ascii?Q?9Jrgu5yRKXLmnf5T00rL5oTKxo4c3ZrnMZSc6QISfH+swPhKF2VN5qZUtM8d?=
 =?us-ascii?Q?6LSGLsYZrIfg3Nu56msAvQVgPK4lmqaHWHUBxE/Y4DGPGc741yOwNXoIR207?=
 =?us-ascii?Q?uSvtnyEhsdnCIjMMuFaeFJrhfAkIDHyP8G+Qupob5W6eaWjVG7xmi1yihZOD?=
 =?us-ascii?Q?raadHdZNxhxtaLm4tUkvDKCMa9ojG9dbbgusJThYQ+Hr9/kMsLJ0pZP/jXq2?=
 =?us-ascii?Q?WqCGst9TKqdP//FDW3IG2wQgRXRttAjs8dcbFutUUUhiriYDmxyY2DnYLzvz?=
 =?us-ascii?Q?zmJXNVHv2bLU1bg5OsAehPtAfsKbYU+CJUn2NoC49lXzGbYiDQ+/mVbF+xnd?=
 =?us-ascii?Q?2l8Dl0RI1T4Ndc09Z2Kh5/XgTCnH4+yXAuh37xFhIhUgyE+QvITHuP2Y20xw?=
 =?us-ascii?Q?rIBSTYjejaxYKugKACbDZ36TFeAEpYEB9au738FAVRW+Pkq2W0IUvW3gw/k0?=
 =?us-ascii?Q?+CvjbMhdWTlQWP94GD47doHOUylWjbYpy5UWNVE5P/cnbsfj2w9snQZhGUGE?=
 =?us-ascii?Q?mnc0zFPUpimF8JNT1cAPO5JAFt7ktJeibLW2kKCmkqJrT00Vi8s9vTXYozre?=
 =?us-ascii?Q?qlBv7Vtpcg5spWpUhe1vNifm/xofO19DIml3x0Eo8Ygu5i9TlFZHaleazIWt?=
 =?us-ascii?Q?jEiTzmJlhjOaVdD5uJiYq8M3zJif+l37uXvDedwe/nN15xm3k2Yh2YTYmmIF?=
 =?us-ascii?Q?F94sWYVAB1rF9Y1rZXrJlzYsY5eFUw6g7oV4aKQxwWIl33rQu2anl1RamsM8?=
 =?us-ascii?Q?SuY1IVkRvffkNaA+CjvBhS63xB1E0cvL8mKhWIvDqhCioZPNXrD5/qjreFvf?=
 =?us-ascii?Q?UPwwM7BiJKRpYkgQAUJAyzcspmR4pNxheGd061QXnF/pBYhhXfqw4Ubmpp8A?=
 =?us-ascii?Q?p5ahJmKrOQOEIN7W2gJgXwNvVb+KFLM8C+yY1z6joekBsfklVTr4avM5MadN?=
 =?us-ascii?Q?W/0+1U8k0dtBNESuDpTas849AZXsofzFCTprEzBFmtxLT7ZMY3pc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f256fe-f4ff-4558-903c-08df1a506035
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:27:42.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FerLtsYV/B+e80+rcCqfAVDbAelhJex7bICEk9sArBc2kJPYpe2ICAxD2o60et4Rzo79d9v8k9gi2d84IGFz78PBluvxfArjkQayjM+CPmdWKrTmeLS0eeQ7urtbQowF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11027

On Thu, Sep 24, 2026 at 10:25:44AM +0530, Patil, Shubham Sanjay wrote:
>
>
> On 9/11/2026 12:04 AM, Frank Li wrote:
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> >
> >
> > On Tue, Sep 08, 2026 at 03:57:24PM +0530, Shubham Patil wrote:
> > > The DW master rejects private SDR transfers larger than
> > > caps.datafifodepth with -EOPNOTSUPP. Targets often report MRL/MWL
> > > values larger than that FIFO, so the core stores limits the controller
> > > cannot meet.
> > >
> > > After a successful GETMRL/GETMWL, issue Direct SETMRL/SETMWL to the
> > > same target with lengths capped to the data FIFO (in bytes), then
> > > rewrite the GET payload so the core keeps the same values. Only update
> > > the GET buffer once SET is acked, so a failed SET does not leave the
> > > core and the target disagreeing.
> >
> > I think i3c device driver should know these information choose
> > min value dring each xfer. even though you set devcie's MRL/MXL, device
> > driver still issue a longer transfer.
> >
> > Frank
>
> Understood - I will drop the SETMRL/SETMWL and stop rewriting the GET
> payload, and instead expose the controller limit so the min is taken
> per transfer. Two questions on how you want that done:
> 1) Where should the min be taken?
>    a) In the core: the controller driver sets max_read_len /
>       max_write_len / max_ibi_len in struct i3c_master_controller, and
>       the core caps i3c_device_info to min(target, controller) after
>       GETMRL/GETMWL. Device drivers then use i3c_device_get_info()
>       as-is and cannot forget.
>    b) In each device driver: the core keeps reporting the raw target
>       values, and drivers do the min themselves.

We can provide APIs for device driver to get whole data path required
max_read/write_len.

> 2) Either way, a driver that ignores these limits still gets
>    -EOPNOTSUPP from dw_i3c_master_i3c_xfers() when the transfer does
>    not fit the data FIFO. Should the driver keep returning that, or
>    would you consider splitting an oversized private SDR transfer into
>    FIFO-sized chunks in the controller driver? My understanding is
>    no - splitting changes what the target sees on the bus - but I
>    want to be sure before v2.

the decision about split transfer should be decided by device drivers.
Not all device treat two continue repeat START as continue write/read.

Frank
>
> Thanks,
> Shubham>
> > >
> > > GETMRL is variable length: the optional third byte is max IBI payload
> > > and is only present if the target returned it. Clamp that IBI byte to
> > > the IBI queue depth from QUEUE_SIZE_CAPABILITY.IBI_BUF_SIZE (bits 19:16
> > > at 0xe8, encoded as 2^(n+1) dwords).
> > >
> > > Rename the unused EXTENDED_CAPABILITY macro at 0xe8 to the databook
> > > name QUEUE_SIZE_CAPABILITY.
> > >
> > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > ---
> > >   drivers/i3c/master/dw-i3c-master.c | 149 ++++++++++++++++++++++++++++-
> > >   drivers/i3c/master/dw-i3c-master.h |   1 +
> > >   2 files changed, 149 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > > index 4563d8761ba0..51defcb57761 100644
> > > --- a/drivers/i3c/master/dw-i3c-master.c
> > > +++ b/drivers/i3c/master/dw-i3c-master.c
> > > @@ -203,7 +203,13 @@
> > >   #define BUS_IDLE_TIMING                      0xd8
> > >   #define I3C_VER_ID                   0xe0
> > >   #define I3C_VER_TYPE                 0xe4
> > > -#define EXTENDED_CAPABILITY          0xe8
> > > +#define QUEUE_SIZE_CAPABILITY                0xe8
> > > +#define QUEUE_SIZE_CAPABILITY_IBI_BUF(x)     (((x) & GENMASK(19, 16)) >> 16)
> > > +/*
> > > + * IBI_BUF_SIZE is encoded as 2^(field + 1) dwords: the smallest buffer is
> > > + * 2 dwords and each increment of the field doubles the depth.
> > > + */
> > > +#define QUEUE_SIZE_IBI_BUF_MIN_DWORDS        2
> > >   #define SLAVE_CONFIG                 0xec
> > >
> > >   #define DYN_ADDR_LO_MASK GENMASK(4, 0)
> > > @@ -844,6 +850,130 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
> > >        return ret;
> > >   }
> > >
> > > +/*
> > > + * Cap the limits a target reported through GETMRL to what this controller can
> > > + * actually transfer, so the core never asks for a private read the data FIFO
> > > + * cannot hold. The optional IBI payload byte is capped to the IBI queue depth
> > > + * instead; since that byte is a u8, the IBI cap only ever applies to
> > > + * controllers whose IBI queue is smaller than 255 bytes.
> > > + *
> > > + * Direct SETMRL is optional, so a target may implement GETMRL and NACK the SET.
> > > + * Clamp the values handed back to the core either way: a failed SET only means
> > > + * the target keeps its own larger limit, which is harmless as long as the core
> > > + * stays within ours.
> > > + */
> > > +static int dw_i3c_master_clamp_mrl(struct dw_i3c_master *master,
> > > +                                struct i3c_ccc_cmd *ccc)
> > > +{
> > > +     u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
> > > +     u32 max_ibi_bytes = master->caps.ibififodepth * sizeof(u32);
> > > +     u16 actual_len = ccc->dests[0].payload.actual_len;
> > > +     struct i3c_ccc_cmd_dest set_dest = { };
> > > +     struct i3c_ccc_cmd set_cmd = { };
> > > +     struct i3c_ccc_mrl set_mrl;
> > > +     struct i3c_ccc_mrl *mrl;
> > > +     bool clamp_ibi = false;
> > > +     bool clamp_read;
> > > +     u8 ibi_len = 0;
> > > +     u16 read_len;
> > > +     int ret;
> > > +
> > > +     /* Need at least the 2-byte max read length field to act on. */
> > > +     if (actual_len < 2)
> > > +             return 0;
> > > +
> > > +     mrl = ccc->dests[0].payload.data;
> > > +     read_len = be16_to_cpu(mrl->read_len);
> > > +     clamp_read = read_len > max_fifo_bytes;
> > > +
> > > +     /* Optional third byte is valid only if the target returned it. */
> > > +     if (actual_len > 2) {
> > > +             ibi_len = mrl->ibi_len;
> > > +             clamp_ibi = max_ibi_bytes && ibi_len > max_ibi_bytes;
> > > +     }
> > > +
> > > +     if (!clamp_read && !clamp_ibi)
> > > +             return 0;
> > > +
> > > +     set_mrl.read_len = cpu_to_be16(clamp_read ? max_fifo_bytes : read_len);
> > > +     if (actual_len > 2)
> > > +             set_mrl.ibi_len = clamp_ibi ? max_ibi_bytes : ibi_len;
> > > +
> > > +     set_dest.addr = ccc->dests[0].addr;
> > > +     set_dest.payload.data = &set_mrl;
> > > +     set_dest.payload.len = actual_len;
> > > +
> > > +     set_cmd.rnw = 0;
> > > +     set_cmd.id = I3C_CCC_SETMRL(false);
> > > +     set_cmd.ndests = 1;
> > > +     set_cmd.dests = &set_dest;
> > > +
> > > +     ret = dw_i3c_ccc_set(master, &set_cmd);
> > > +     if (ret)
> > > +             dev_dbg(&master->base.dev,
> > > +                     "SETMRL not accepted by target: %d\n", ret);
> > > +
> > > +     if (clamp_read) {
> > > +             mrl->read_len = cpu_to_be16(max_fifo_bytes);
> > > +             dev_dbg(&master->base.dev,
> > > +                     "clamped target MRL from %u to %u bytes (FIFO depth limit)\n",
> > > +                     read_len, max_fifo_bytes);
> > > +     }
> > > +     if (clamp_ibi) {
> > > +             mrl->ibi_len = max_ibi_bytes;
> > > +             dev_dbg(&master->base.dev,
> > > +                     "clamped target IBI len from %u to %u bytes (IBI buffer limit)\n",
> > > +                     ibi_len, max_ibi_bytes);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +/* Same contract as dw_i3c_master_clamp_mrl(), for the write direction. */
> > > +static int dw_i3c_master_clamp_mwl(struct dw_i3c_master *master,
> > > +                                struct i3c_ccc_cmd *ccc)
> > > +{
> > > +     u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
> > > +     struct i3c_ccc_cmd_dest set_dest = { };
> > > +     struct i3c_ccc_cmd set_cmd = { };
> > > +     struct i3c_ccc_mwl set_mwl;
> > > +     struct i3c_ccc_mwl *mwl;
> > > +     u16 write_len;
> > > +     int ret;
> > > +
> > > +     if (ccc->dests[0].payload.actual_len < 2)
> > > +             return 0;
> > > +
> > > +     mwl = ccc->dests[0].payload.data;
> > > +     write_len = be16_to_cpu(mwl->len);
> > > +
> > > +     if (write_len <= max_fifo_bytes)
> > > +             return 0;
> > > +
> > > +     set_mwl.len = cpu_to_be16(max_fifo_bytes);
> > > +
> > > +     set_dest.addr = ccc->dests[0].addr;
> > > +     set_dest.payload.data = &set_mwl;
> > > +     set_dest.payload.len = sizeof(set_mwl);
> > > +
> > > +     set_cmd.rnw = 0;
> > > +     set_cmd.id = I3C_CCC_SETMWL(false);
> > > +     set_cmd.ndests = 1;
> > > +     set_cmd.dests = &set_dest;
> > > +
> > > +     ret = dw_i3c_ccc_set(master, &set_cmd);
> > > +     if (ret)
> > > +             dev_dbg(&master->base.dev,
> > > +                     "SETMWL not accepted by target: %d\n", ret);
> > > +
> > > +     mwl->len = cpu_to_be16(max_fifo_bytes);
> > > +     dev_dbg(&master->base.dev,
> > > +             "clamped target MWL from %u to %u bytes (FIFO depth limit)\n",
> > > +             write_len, max_fifo_bytes);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >   static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> > >                                      struct i3c_ccc_cmd *ccc)
> > >   {
> > > @@ -866,6 +996,18 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> > >        else
> > >                ret = dw_i3c_ccc_set(master, ccc);
> > >
> > > +     /*
> > > +      * Clamp GETMRL/GETMWL responses to the data FIFO depth, and the
> > > +      * optional GETMRL IBI byte to the IBI queue depth. The GET itself has
> > > +      * already succeeded, so its result is never overridden here.
> > > +      */
> > > +     if (!ret && ccc->rnw) {
> > > +             if (ccc->id == I3C_CCC_GETMRL)
> > > +                     dw_i3c_master_clamp_mrl(master, ccc);
> > > +             else if (ccc->id == I3C_CCC_GETMWL)
> > > +                     dw_i3c_master_clamp_mwl(master, ccc);
> > > +     }
> > > +
> > >        pm_runtime_put_autosuspend(master->dev);
> > >        return ret;
> > >   }
> > > @@ -1728,6 +1870,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
> > >        ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
> > >        master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
> > >
> > > +     /* Read the IBI data buffer size advertised by the controller. */
> > > +     ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
> > > +     master->caps.ibififodepth = QUEUE_SIZE_IBI_BUF_MIN_DWORDS <<
> > > +                                 QUEUE_SIZE_CAPABILITY_IBI_BUF(ret);
> > > +
> > >        ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
> > >        master->datstartaddr = ret;
> > >        master->maxdevs = ret >> 16;
> > > diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
> > > index 17ad817d1f8e..54c3912374c8 100644
> > > --- a/drivers/i3c/master/dw-i3c-master.h
> > > +++ b/drivers/i3c/master/dw-i3c-master.h
> > > @@ -15,6 +15,7 @@
> > >   struct dw_i3c_master_caps {
> > >        u8 cmdfifodepth;
> > >        u8 datafifodepth;
> > > +     u32 ibififodepth;
> > >   };
> > >
> > >   struct dw_i3c_dat_entry {
> > > --
> > > 2.34.1
> > >
>
