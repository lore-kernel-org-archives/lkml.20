Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020077.outbound.protection.outlook.com [52.101.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6D3AE1BC;
	Tue, 15 Sep 2026 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463406; cv=fail; b=rm6sy4iYI73FZECSY6WaJJwnbn1a+Ts99qnbSNbS30GL+6Ow3DDuN+i7ZMLW2sf540ef4aOwRiq763HJcg4/dnHPXGGLIpl2OlaGbPqWdOBe4PTaopK46L+Qn1rBb4uSRa83GVThkYmjttVwpau5EYDGKpDEbETjttrtkLB701g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463406; c=relaxed/simple;
	bh=0Tr7SaYKSqxGTu6tpatzoxs0cn355t6hglDEunyfKcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sXY61yRNNzPTX07Kb3Td0v8JzVPwCkfoHNR5pym5xv08vKxx2REO5ts6MrQDi5c2pY5I10zzmYXzMWYa79Ck/8mG3sNwVhndn7wi24GzRE12j4D2qTjNW90exQ4OYI67mgdilU0mVO6QiBkuAPve5qnaLrDPvSexoaWLuGW15ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RACeuD5CvDmofAClDPf03Bt8rX/3VopP9Bk+VAf+iI/kWhBBRXFzw7kI6G+0sexcJUHnhE/5FRPFZ8YxWdFlApVB/3oq87S9Xko125BoI99tmWtOrNCHhMA5yrRni5kDQlZt4QIf8aLV4tSYdi42Zj40uA6AA7P92cwLO6WSSI7L4cHDU7FgNF+x0hAZdlu/QAMdRzqIuYOUdEBULIUn3kxPp5zeg/5larLDO5wDExsLEbJkjsouMrneEJ5ZbEwH9sLO2M6GwSMQly5GAKfkoMObyjbzGhtRFyy+lEJYZYfFb6M9qJOW+V/CtosmNpWnne7h0wAfSgzY/dKP2u2PNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPfheZx5xAv/NUBDdhU8JPo3OlfGCPgyAB11zM7hdPI=;
 b=YhMfYMaGD2xIOak/7+Uezl9dsrnybLByWjk9mlgsb78hm2isiyQulq39wUGnivBkXZH0Y4abbUJg4MMAd1+hi4z9nPHja1d5639g+TKJYxqCv2SeFcHKOTkVibO7+yPRz9TKEg4vDvobCAL8IMJu788i4DytHiVvUoqomRWwflx2OTDykGfn8Og0DD0KbetdCvQQ58XuwBsojkjTpbBvJF0Tbe2QcF/2iss3S8nvyP1Wr7PHt5ZyqJtkr+//RH7ue6kfxd8AdaL2YkKJ+b8Y65N3uf2bABOmbHLWB4dGHVnnsDHIJSei7sZoyHbav+4hfAAa/xn0I77YwWdX66p+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5156.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:10:01 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:10:01 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: Re: [PATCH 7/8] media: qcom: camss: drive streams-aware transmitters through the streams API
Date: Tue, 15 Sep 2026 14:38:43 +0530
Message-ID: <20260915090929.1284112-7-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-8-hitesh@ebytelogic.com> <CAFEp6-1yTw+p6B_dOPAtidiNvuYXqAq3PxwWiEkCp-G7ZtVhdg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::9) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: af19c9db-2414-499f-c40d-08df13091f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|23010399003|1800799024|376014|10067099003|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	g64aXCpoQ6JzIOoiXs3wR7OyuKtGmzCF/bgCJfNclsRbbDKi8dBRXGnHFbiGR0EVRQP9wTWVCq5RcUkxclSjD+OsmCkGT1peaAph5jh/rpqvzDdhhS7FSf3Q/csnllSzCsntC7aGCYfVF3yCGi4DcL28SYqPSTACkdRjddLa7JA9PaVT9n59C6IW4gjFO9IfGp4ldqjROLzksGoFANq26GWc66gjk4352c465RTonTqr5BLL7WEtmBBgl9D5A0h5hnDYwzwTvtf/delQwrJ+8TwjFrhDqjQalSQ4ghryKgz2GpExdOUe7T0Jp1wm+NfjlRzL8fnVAS+VZhlM1Tx5BZZZCloblacxnbcXN6miQEjCKbueA4xmgMXLSnNUKeRiBt8stA9d7Ea7g+UfdAXZLpjGY18X044isb4MQtuhrO6O/5fojb105aCG47BZasU12qrtqzndSxc90oTuPI62TXmG/XM/bsVLuqq8DPhxlrk7zZtLuTJToPb9zdQjyxrcsFA4LiScKHInLLfcQhGQgyBA0F8rCEY6OFPZa5L4QhHOKR+xgi+zb5l81droIUuQYEH61lEvT9hK2M7klHbZBoII/LSodLcTPJdpqOSYj1KdiXiqjoWnou/pjHEVUReTBVNiCoOXm2vDu/rqTxCSA/9n09e+0MfyncjeIhP9EPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?59a8AgQ+GLZI3udB43bwrxnJZULPjCnsYBS7Q3YkKXlTvQ7zfpzIwm/ToV18?=
 =?us-ascii?Q?Fe8/wtDnBjTR39a6OjfEA7a7ssZVQGigu4f0H0nFCFpKkDFldIzJvUGphUvr?=
 =?us-ascii?Q?+L49ZC/g0IP1kZGOy2EOcnbKC5Lwnm/x0qtcaNW46TxJStqlEE5tOgvf+iHj?=
 =?us-ascii?Q?CpNkMmUNnLIhlg7KCUh7RlYCignv+H5+aeCIwK74Acm+zCzCiX3rSN0YSzbb?=
 =?us-ascii?Q?Otu8L6F2NsMZeniStCtTvtB+l+Yk8Cm/x/k6iwD9e1k+XiogGbMs7sCsmaGB?=
 =?us-ascii?Q?KLQ/sKosSahnHjELE7OIHswhri24yx3+Owy8Ea5YOnVTqi84RFofcBjdhqv7?=
 =?us-ascii?Q?hekx4YILzdop4inV00x6SvB3mT6W6vPz6mKuPExj8YGAZ6OmyH79If4YKgV5?=
 =?us-ascii?Q?3eu61TXEO31A3k84rRRVS19qmXI+kF2xvtFUIMCrQ/xe6gT/as7kNTrKAdoL?=
 =?us-ascii?Q?nSyNqWIDILFZfAugziMPkyE/UiAOhlMpW8YyNPHVUXybZ/ThyHTV3ra8WvO6?=
 =?us-ascii?Q?Xl1N8MdwnS7WroxDemwZNsF0qSnK28PGxNojaWy9ukJCJDAW6WFYZdAidNYa?=
 =?us-ascii?Q?AhsfHqtVkw26o8wZ1ICf08pKO0ywfP4x1MS6LWWLa9qlVCEy9zaYDHkcD7UM?=
 =?us-ascii?Q?1UOT9Ksv3o0bHLeZsGhGxjver97YbTdkqOr+5tcstxeeS8R2l0pOI1TTIFFz?=
 =?us-ascii?Q?VWl5nMqplJUsGK/0K3K1n/WSV/o5HktncigtLo5kUGLnlq7MV0ocEemrGbf5?=
 =?us-ascii?Q?nIFhvfNsxyVCSDBhuYP7+JYqpdD43vKBsPInp60CeXE1gGYHdzXk1f8yJJNI?=
 =?us-ascii?Q?2cTr1v2a9PSrcR48xhkTA31pyHSDQln3FkWDwaihBlazhWpriVq7BDjiEmuY?=
 =?us-ascii?Q?vT9ajpOx0c6xur8VQEYHiC0/pCMGrLZPmOMdZ/bQhfWnW13NeoR5YAt1D0QJ?=
 =?us-ascii?Q?teaDh6BNJKPUEi4dSPKvAOOlX8MY/72qtK9v9TIOgzdB+sIJANL0w2n/Oics?=
 =?us-ascii?Q?cEn7CyB9UrIbkJQKYYxX6UX3wvCEqi62YOlig42SFFLIvyOuAifI8gQuUm8i?=
 =?us-ascii?Q?9o9yezKPimKmUk9IEp3mYCGCL+4r5UQEVD5eWc5aL8jDam4l8jQGzBZGr/Fq?=
 =?us-ascii?Q?ttpetfgUFCV1BfoRtmdjML08s4OmhRwa0/o/da+9j6tCKsogeTHgYksTdyge?=
 =?us-ascii?Q?T3jULwdTIrc2u/2sOIrVzILGOJIzlcjWc9wFydkMJ++9GSKcb117VwBpJl2/?=
 =?us-ascii?Q?eQ3FRYxGz9r5epnBbSbLdPQ6nWA03GjeEiHnHfr8qL4Pf9D/9oLelz9alVCg?=
 =?us-ascii?Q?0qlz+3AlqMBiDtE4HEEMIJuSWnNSqBeGVmShRtUg+2Mucp0yZdQbpESHnMzD?=
 =?us-ascii?Q?a7oKRC7iiCjD5nHJatgY3PWR8fIpNT/bYWfeW+qG2b3E8zscCH6RJ2V9o5Xi?=
 =?us-ascii?Q?Nje8PCDFtQFBqO46UmtAsh1J2953cujspZ3PoZWpE4TWmosnmru5EdZ/1hiT?=
 =?us-ascii?Q?PKrNJzUrO6TVO8iOzUZ4xlWEuUNmGGStyxtrJ/rNDSGQuGZFZC0UAGhpN3uI?=
 =?us-ascii?Q?+RTcTnBYMqGxFbePQNzf8x6ZbKjLNSTFNh3+cqJekkloUsN+dRKUNqoHRuM1?=
 =?us-ascii?Q?cUviwlGQZwAEPhaVMh6CXsXwgcH6OmwOGzgqWf82iPAerCaeHHL2C0Xh00Ga?=
 =?us-ascii?Q?0MFaniDIlr47QKDCrxI8IJL+ErI+VlD7E+HdD9IVeDShuKMPSiBLGwmueApp?=
 =?us-ascii?Q?48rB0oSFSKsY81mXkDdKtTzjApbJJL3dixUpZNOz9g0EFtFvjeOuPGfyKsDd?=
X-MS-Exchange-AntiSpam-MessageData-1: 2nogY7u4Ip1FAA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af19c9db-2414-499f-c40d-08df13091f46
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:10:01.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYJGnI1Ef8kW+ae4kdwQ8q82EC5gX6k1ERvn5bCaZdCPn3cNCOls7kumw5eXYzohoMqSATKaR3afA6nCSo4m4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5156

Hi Loic, Bryan,

> I would like to point out that Gjorgji has recently posted a CAMSS
> stream API series [1]. Would that series address your use case, or are
> there requirements that it does not cover?

Thanks for the pointer, I had missed it. From the cover letter it
covers what patches 6-8 here do, and does it in the right place: the
first/last-stream handling inside the CSID instead of a refcount in
camss-video, and CSID routing for multi-VC sources. Our use case is two
cameras behind a GMSL deserializer on SC7280, both as two virtual
channels on one CSIPHY and as one camera per CSIPHY, with the cameras
started and stopped independently.

Plan from my side:

- I will apply Gjorgji's series on our tree, enable streams for the
  SC7280 resources and run our two-camera tests on RB3 Gen2. I will
  report the results on his thread, including anything that does not
  work, and review the CSID/CSIPHY parts while at it.

- If it covers the use case, v2 of this series will be only the three
  VFE fixes plus the link frequency and CSIPHY link patches, and I will
  send the SC7280 enablement and any fixes on top of his series rather
  than keep 6-8.

> It'd be great if you and Gjorgji could cross-review each other's
> contributions.

Yes, will do. Gjorgji, if you want to try the fixes on SM8250, the
three VFE ones (3/8, 4/8, 5/8) are independent of everything else and
are the ones that matter for two RDIs streaming on one VFE.

Regards,
Hitesh
