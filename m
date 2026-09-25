Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7704D5990;
	Fri, 25 Sep 2026 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350898; cv=fail; b=qKn3x4XhQwXEqSrSu5Rtf8fr7MctSgl2oBi/P6CzsKTr8g+h1GabZBzR0nUhv7MIzThh6vFTtwDw6feSgp+zu8JIkKfialKAjSp4yNbpozqsrDyGDDuFi5vsdA9uu68guuTH4BDJo8MI7UuF02fypw/F+HnRdS5CxLIEIqa2x3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350898; c=relaxed/simple;
	bh=gYWgOwrR5AEMp8y1/Hg9p0jMegG0jTDFGpH0zbFiomk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T1oJ630zyO+NoViEYrqD7gy/fdJQCptxdhwDf7+kI2osdGAIsbF7C3uVUnRbNZSev18P9aNyfnVmzmqARGNQ0egpGLmZp4H+7xeM3joiiy56zfZfrXbE2mb3mCD8wwOQU8Dmkml0jRxaFUSZkFG+uViKRI+yKssYt1ZG59HFlSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YX6wQwpM; arc=fail smtp.client-ip=52.101.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YX6wQwpM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnVQ+U6Y5JrAPNEvIekbMjaJZT4J3Wwpoc7hvR2yyfvIriWA2pEVoSGD1rk45V8eEJB2tW8vm1zTg0y4OvMUnNN9BMRR/+9WKiuqwbc5PmkplJ91NsW9SemQSnCraumt0It23p74Zux8UUcCv7hSScgbLu/+OFYjHogErCr0bMJOROV7FUFM6xhMqUm3gezxKdUMVDycT0rPiz6pVja+SI3aXH3bIMJ3fM9vf00uXlg7JWai9RQlv3iLju3SY3adw7rhOdVfbsizUSpTMHaM9ugQ09+E5FzQQMVrgHnRsjYrJSvFHK9WC45X3T290aSyylXCRPG7JM7J4v4TOFjTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N55dui14bf6AhWR6LjXjktGb/pARiHJI6cLSxuMsbHc=;
 b=e76YZhxib/szh9nUSQv1s44Hz6ckhhie9aTB11RYaQcu4Bb8Rz2lOLyvgQeo69WVBj5SNzjZYUHx4z2Ke4YV3oTFDzWhgJCTS1SsHsjvdEgunduHQ20PzG+0yqjHxnjAb94FnTYWII8toswx+qIf3Vl8Sjlwp7kwBf0qo7JF9N2JzsNflH8PVAULz87T+1hOhhZ5bWAgf2nUxo/kQ5mwi3aHYIidbKQIN15sxTgmIww8+iD+TWUciof3j4XgS2umtckx75RqVsNWsahbblIxECi+S+B3WS+qOPX6iKeM+qcM/PIoiPY6vQYVMiL0egrQtlWCNIMcgBtfG8rPXmIIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N55dui14bf6AhWR6LjXjktGb/pARiHJI6cLSxuMsbHc=;
 b=YX6wQwpMags0ZYvkmh8D2bjiUgLYGQzMpnpXFC7+6ZaVlgBoEAOQ+KARUW9V/mLxapg9flBzlBwVHmsL3qmeaCkIdssErnNO+aQ8PaVJYhkwfemvZqYp3RYQsgh3gM3r4Kwn+kZ3LajMad+BNc0ZVW3J+dAIiMT836zI9sX6xEk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 LV9PR12MB9807.namprd12.prod.outlook.com (2603:10b6:408:2eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 15:41:27 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 15:41:27 +0000
Date: Fri, 25 Sep 2026 11:41:19 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH Intenal 1/2] EDAC/amd64: Add support for AMD family 1Ah
 models 80h-8Fh
Message-ID: <20260925154119.GB1859103@yaz-khff2.amd.com>
References: <20260923112003.3677719-1-Vishal.Badole@amd.com>
 <20260923112003.3677719-2-Vishal.Badole@amd.com>
 <20260924141146.GD1080284@yaz-khff2.amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924141146.GD1080284@yaz-khff2.amd.com>
X-ClientProxiedBy: MN0P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::11) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|LV9PR12MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a83b79-40db-4a02-5781-08df1b1b7655
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z9eLjG98qC2V9bLsK+ngD91D2SotY3u94w81tkI0UuK0zjuHeGYf2T8h1XgUfFmql9elDn+iMU2RwJoNFvzEvX9u9oXbevgRTw9AijFrUttb3CFDb+bKEchbyGPTHsTRS012XXROqyFOe22OEvOFrJIUIUfoJRR1cBAGOYnPLcwoG1Dqombswt5mX48uhoYclm8ES7AlF3BRLqo5Ksx1eXPRJvmuzOjBA6eVwJ1GyxKyT3C0ABivi8uwQxT6zK1eTx5yIpeHG7NH650BM+vJuK8369sjYDX1STn5F15UDC0w7zFPE78sdizmDc/qOOWPSiFXhFw/ge6wsMjW3nPwIzZ6xRxXUga+ycgZIn5Z2zQozx0BsO2yND6U6wJu+ZXC2i4JsSRzU/zZ1bRMEHHdlw27SaWpiyOsvrIcoF/8Pq3T5y9vvQyoPIidZkoFFjvXVwbYr/Jm1eg2sLEE9qau3rFF7iMrlp14d3j1g6VMFjxl0BJ96Ds/Heh7BiE9wiTUsm+T/RcSFAj5LVg4b5go8doAOh6NkLW6rEjueUZp69Zmhc507IkM9YSHuHvQP3s0pMj+PA2iNgfRkq8eiUJIaNkmQgudrf1GMy+FKVnDHtY0A0W660kW9PmvAgpxb9fXLO06GILqp6aDZgFR1xnJ3AD4j1wgyAmjv19Z9WIMMvY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rtzb0f5G6ftkpTfprxJylgddfe4Sp3md3qmrFDv317+29aOcUoOMVMDRrg10?=
 =?us-ascii?Q?lY4GK5mAz2mgVrsttPXMs+xhU6PsLKzUfQ2+++7XHjHWS2GZszuzqQKR90lX?=
 =?us-ascii?Q?07ecpEjR9YfaZc9xqwRYE4i+NbRZtKQjeFEHJk1khtd9nHNObK0SKXuqDRXx?=
 =?us-ascii?Q?i0RifrvvSWugcatpzNB3s/CPXo6cu6/zHhpGgLzWe8LRq56xdHoHYIPqiH2t?=
 =?us-ascii?Q?P7ZHfa3NRkZRTTGdTTeQ2LblWBEssAbw2+MCcouF85keJEPpPTolBFmaKPj/?=
 =?us-ascii?Q?TxjT/KBO+TxuD9mDNMUhsORJMLS/KFomaYXW1sEhQVfUbjM8xrmhqzw+No5q?=
 =?us-ascii?Q?JkDf0Dcwy2OZBiT+YSYeQwWmjEkUaWXIhgDLb8kf/cl3Xj0FVsv7RbyW2NCi?=
 =?us-ascii?Q?T6x0KHyfgu4orl/zpFKNlxxBjD85Wjt6EEWwIw7dLS9nebzTD8AZTXCyUID1?=
 =?us-ascii?Q?ywyf1VcwxxMaLabeN5hy63Q+J4oOjm84SH7/JvBuSDlRr64qz8BWuut9tMdH?=
 =?us-ascii?Q?jJ/KwmRAkjlr7IXBMHLBt3k9nqu1ZS8Pc80wDCdOSXExT70seHDWe30EGVjW?=
 =?us-ascii?Q?pmQqA9S9CVtUlradkgxgYPH20c5sICMZJOtHNkadHeWNMde2U1XyCw7vDxzW?=
 =?us-ascii?Q?hgVZeGgZA+00q31OTuaLmNCO1nMsZBJtSZD/GYOrvO1XH35/H4afmZPwtHmR?=
 =?us-ascii?Q?UYAv+rtrLfyXyNrQLKLQWVdg2GiPTfQn312ArP3ED/CgzEVknmtwxhs3495B?=
 =?us-ascii?Q?P9g0nAHTptDztWupaGRzbEA6t0wzmlbqTWfEt3SRqt+hFQwKL0mtzmGTlfXS?=
 =?us-ascii?Q?FBVR4HFsAsI2+nskz4xOb46y6Bu3j+xPwEpMnhLcz0rGY0LEZDgIqttQxyaG?=
 =?us-ascii?Q?ezV73WMgJVj4B9rE7spOXpTd+x7Z0BlpXEFhfRQSNb6RyP7TH2a1kM0gZHxN?=
 =?us-ascii?Q?mI8dUBLAUFaA9RaFNwwEJKh3/AO6kEPQsO98YgMWvH5E42+m8JHQNdkf+as8?=
 =?us-ascii?Q?6zjoU0E7piLW5i37wjZ0Zcn7jC0FIUIe426FJcwOWxkbWkbXif0jN77+T7gu?=
 =?us-ascii?Q?3H0VfRfZAl9aM5SifyvJsf7EDu2isN400pW4SGMbbjg+RFkLPrbupwpq9bKY?=
 =?us-ascii?Q?qY6MzdvbIocew8czgZbZcSJCkNGDEVl5T5O4XDGlUoTU7qxNlZFXKs/dmFKE?=
 =?us-ascii?Q?MOoGdXxiNilHcpzMhD/odFtVzEav7Hf5V3K02mexsI5uWgey8xUoE/5ASKrG?=
 =?us-ascii?Q?MyBrzEn7Y+AIqZ9iZqAS57E331tzon+X04CcZo3yQXfDrUOaTYe+MHJf7xsb?=
 =?us-ascii?Q?ltYiDVV6+lDmMjJv2ZMseXAtQB6hAxeWFYmtUfYpSbQNKEVVnrSiOvk9sDcj?=
 =?us-ascii?Q?3x12IkV7QInR2Y+INnO2KjU3nzve4XmyvrXoXLvmiSxVQtZJioly2lLEsm/2?=
 =?us-ascii?Q?OxJES/k3xymPiEZqAx8yf2W1oIAwDSwVsUmwJ9Yv49XfdLUGfeWFmu4czRfC?=
 =?us-ascii?Q?sDtRUgf3Z6+yduRMKI/HwG1LGbXXz1vW5XfUSTVCagMPN7ICDIdQktlfeHUZ?=
 =?us-ascii?Q?ObFpt3y596jaR1hFvrYj7+EqAQ7YEnThiDvnym4uk+W9fbvCOh3WWDJ9nSK4?=
 =?us-ascii?Q?mRxCL1KMTVGggOFD0e8uXwCfvsZWDnZAOVmIvvv1gzeNxSQue108EKMZPfqJ?=
 =?us-ascii?Q?hHJBSmSimm0aG9De94xfpFTE+alwhP+XphO8kkIhY9j0FpDd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a83b79-40db-4a02-5781-08df1b1b7655
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 15:41:27.5355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1x+s4Ufz40Hs1FcavmqiBjfIM5jO4DNh0EkN3TJEmeQflOT2OjUgdCflNavouKuuOUm4GQsF61ksjCun+0I2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9807

On Thu, Sep 24, 2026 at 10:11:46AM -0400, Yazen Ghannam wrote:
> On Wed, Sep 23, 2026 at 04:50:02PM +0530, Vishal Badole wrote:
> > Add support for family 1Ah-based models 80h-8Fh.
> > 
> > Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
> > ---
> >  drivers/edac/amd64_edac.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> > index c6aa69dbd9fb..ff0ebc8e15f6 100644
> > --- a/drivers/edac/amd64_edac.c
> > +++ b/drivers/edac/amd64_edac.c
> > @@ -3900,6 +3900,10 @@ static int per_family_init(struct amd64_pvt *pvt)
> >  			pvt->max_mcs            = 16;
> >  			pvt->flags.zn_regs_v2   = 1;
> >  			break;
> > +		case 0x80 ... 0x8f:
> > +			pvt->max_mcs            = 2;
> 
> Should this be '4'?
> 
> In documentation, I see 4 UMC MCA banks, and the UMC register
> definitions list UMC0-UMC3 instances.
> 

Correction: 2 and 4 are both correct. But the models numbers are wrong.

0x80-0x87 => 4 UMCs
0x88-0x8F => 2 UMCs

Vishal is working on a patch using a different approach.

Thanks,
Yazen
