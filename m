Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020073.outbound.protection.outlook.com [52.101.225.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C166345EB4;
	Tue, 15 Sep 2026 09:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463386; cv=fail; b=SWLuvoAEcLnixIRso+O5C6pmYNprOzsYPC46uKLj1aL6poU9VOAXJYS9UveMbuMS/zbvkZjpghVJmTWiqIY4y5newvExlONTEiBPFW+H0A3LvAkEMwtGreQ+eitMjxERPIf/iz3DJuSmD4ulOpFOI8dVIEZStHwU0ZNaTwqkwt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463386; c=relaxed/simple;
	bh=nOLeRLBB0qQi/maCeFMCC1E828SykBpix2j9nI9WkJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opUspxw4wscTpic20sDS9FdOqZRzxCk5aaAFMpDWPIPUAC+MsbBKHdWBEBp9hF0MzjkGDS6OtVQC75/W1yoaDGSBuhdfecEGju2sMwzbTnO4ygUmT3NSecqnz+7zwymRki8dmkNk5F2WTOJGn4gvB+7lUQPc7RynpgxvogWdPcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSgNUefY45LHqALxLWxTGJIHRkC6dIT6qT2ksTOIvF4EOu496EkGpjmCq/bCEug0G3hWgv8Y+5x/tuxSPUVjEehqf9rzyd/F4VZRZhkP1Vy3H4G6gzpp/UVFsltBJgPwZ2dt2FMVDBEouLSAlM/W/7SuT9296ltDMnE0STaBnxnJpW3+lVsykwC9f10wlZ7hHkHzqHVyiExasYf+FPVV+aUGlp7RGo2hz3FNXXDAHI+x2MZ5rh1ZwI7VoZRYr3RbcnGVF1g+ad56MFlPSkhta3znUg3OufykwfNX4xP3DPSr/9rn5QW6qILS+gDK13YxnpqNZHM0K3v23n+G5/rWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOLeRLBB0qQi/maCeFMCC1E828SykBpix2j9nI9WkJE=;
 b=sl0sHZ7PYXuU7Svln9/q9Al2c7HTg2yltCUZhMZ2pWlHhEoONKebGk6NEqOSdatN/lK4bDrPBF8g/6VQALOfcX8QJLlFbGi4EeFkjp07Ho+/EoUzSv/Uqk2ld/5MBkcygDE2T7u1iJnOom+BKK87gVeEC5KDMhe3J8W8pqXWM3UMoH3GMX8qo9PcuVBPH4j6vmDpHMBcjvtvdsOzvroh416hTlMlLMSogmkItK4vsjeQ3ujnpNU5XhOFPZZ2sgBerQFrW4KCy4D5K6US4cgJaCICrOEP0c6V8vDgpDCrxugbUOClLxTvhELVZBB40j9/MmMW+C4BrdcWMRQbbQ4eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB5156.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 09:09:40 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 09:09:39 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH 1/8] media: qcom: camss: take the link frequency from the CSI-2 transmitter
Date: Tue, 15 Sep 2026 14:38:37 +0530
Message-ID: <20260915090929.1284112-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <bd3fa7ab-9c60-4697-a0bc-92877e8a2885@linaro.org>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com> <20260914133416.1030231-2-hitesh@ebytelogic.com> <bd3fa7ab-9c60-4697-a0bc-92877e8a2885@linaro.org>
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
X-MS-Office365-Filtering-Correlation-Id: 549cc6a1-2945-4081-006b-08df13091257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|52116014|23010399003|1800799024|376014|10067099003|4143699003|18002099003|22082099003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	57zZ+5fF2omvMbW5z2tTwiANQIDjB9mzLi6Ci4ZOg0OipJmocDVTsXm+TWRRGmAgFn+lmgNA7snpksx7y9f9v2B0cSOVPGCcbDQMLq6OSx46rmAUj4UwCz6QYUCpE73jlxRLLyvFNSr8qGjG0TIaezLNOlCnsixGI4Qmb2X1d9MTXObtNxEkgSnhcH9uUWlnc0et8NcCY/4PoqPHP2Ga528fxA4APk7d84NZTgJtE7uIz33n5yQKx0kCsdpDjmgkVmGVQLxKjTq1/DKQg01LnRcImkinpm77N3gxMjdWB2BSw6QtqymEqB7itiuY5GdzMxS3LlNcqQio4QKyhmTIswVIDRE5ZbahxSquu/sjcdbYRExCGQTpjYKWTz5St+9alxAHP6uU88tm4z0UwvXSdm/qM7bjwXNoTfeXFCFWF3VY6p6EDFy+yZoPuG40fE6VAns1AfpmAzVIokGFYbJi8KMnG7l/pZj0zq7MJms4opGUcuvTAEMiX97aX19yTxW9Y4L7ApRAYo3qc6YAYs1RanCgHCff/ssaKzHtv3/gARcz3hsWG7a9fq/hNdNtsgr6ZZ9X4HbV32vKMKMycThxaBKr2VJbhwguciVHNxKOPGuwXJp1FXx1mJk+hgvU1z1qYQFW9LSm94/Cx5u1/Y0HCYCYpoqPzJ+Un7kymel/GhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(23010399003)(1800799024)(376014)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qIBNfGC9KO9C5E4MXlCEi7VmWuE6IMjIfw0xaKtY2focdw2GdGYMpblvQKUB?=
 =?us-ascii?Q?du0yYRZfXlU9QhCrMeGCxNIaRW3V2B4g3jk6F+FHIaEgPGrnuX7N0Ffmy4RD?=
 =?us-ascii?Q?Bd+JGagTbBcxjq1XKTQAnW52olKcy8t2izbymiR8RFiNVGaVJDI+LXW0tXBL?=
 =?us-ascii?Q?gvyT4YWmFQMHeuwZ2GEvEc5at36x+J15fCA7b77HVC61aGFuWFWa/8xhanGW?=
 =?us-ascii?Q?FTNaJruD4qhW1nyi9gKjFIhqu7Be1Ilr3MtssovNx86+Fv2mSZ3uaTweDb/M?=
 =?us-ascii?Q?sQxYwp7EUF4P2Eu1pNHdvVxIPHZotvdkFTpNksCN0gAClWnBj0tNOzExFbmK?=
 =?us-ascii?Q?v5tUM2EhShV7FefSgVOlwUiZmlFV/QlQ2i8TRBMgKqzfjReOLmMhx1Az9YCr?=
 =?us-ascii?Q?DppA2HzNedd+aULgm2TYcXU077eiVBlXWmmyiMDJo1RkyMcswzKlCgVezTt/?=
 =?us-ascii?Q?vMNM/5CVY6IyizKqkcITGsgl1h89xiMoUaDlSpbue51Wk4pXXKxeI2uaosIo?=
 =?us-ascii?Q?71M3RnK4iEsRb5MMwseL9jSchaWIMG/FlcrPUTPqCCwMSs0eP3n3JhD5kLbL?=
 =?us-ascii?Q?pi3Do0mZTF95hLHJ2H8mbjUGY0e4B7YqrhQPHNxipzayk4mt2BKq4gFttkOh?=
 =?us-ascii?Q?1zgENbt0zwAz19I2laf2F6n5u7cotSqMmqNygJMet/w7ALLh+Fnu7/EE7Y15?=
 =?us-ascii?Q?CziDM5/2rjRVWkvNFmiaatyQw3+5NzAmMbqIriw0qjooh9+ptFjTXdmmhM45?=
 =?us-ascii?Q?a2X5P0t3yaTEvFmsBeQeXFy6N5FQJcdibEDTXH+qMgJqt5VmixBaso9Cn55o?=
 =?us-ascii?Q?p1T3C+Xl5QP/gIETkdm8vHRh/ylPOsD5FpHCx/dhq17+XvrsXxW8LX/Amixz?=
 =?us-ascii?Q?s43AXzAT3zajOdfNLuLSwXEkTrlvjidJML2nmTQB52xOFHGOlUu3rEN7vpWu?=
 =?us-ascii?Q?XwV2nJycfwkDsJbO0Lo/px5A8Co1UjxmPhvRADzW/5gJBxZyLTXNseyoJ++P?=
 =?us-ascii?Q?mUSXLN2wgpAQIC0FAygy0oMEIHz3i8tztylocGEbjVxAT8R5nW9Q7NWomNcx?=
 =?us-ascii?Q?tpgj/siPH0yCnI1fRUOTqcfHnTls+zw8qU5m3V99PMCh/j86mUhaXCBCohDr?=
 =?us-ascii?Q?pUkrmPuOZH4fXveoHTTs0J4xkurxiOnusLeP9cisvmX2KVBbpXTViwnK3tgy?=
 =?us-ascii?Q?8lLVqBAvT3SnR7MoguucFZtpGVupeJIugBQdGay5J3SS52+hfxsbwldgyTZQ?=
 =?us-ascii?Q?puHokWasFXxIYrSdXv95HrE2iImXnayLh6OITGZSJHKeud2dOGz4zIFKaCeG?=
 =?us-ascii?Q?l38PZTRNGXwpcu9WlPUKi4ke1nSgDnhvQyLffQrJa+aSarSZ6v8z5vhRP4FC?=
 =?us-ascii?Q?Wrdk3ewisqtn+OWoHE7rDX7q7HL3iGvWgGHuICdyJGc3d1iDQIc3e/rQ9p6s?=
 =?us-ascii?Q?qnERWkD3fDjqmGLJcfHpFEmvJWur4CbDooOsX08EgG7uUPByn/Sk2kbLvcqT?=
 =?us-ascii?Q?B90UOXI4A0fsP0KMPbQVTV1OST6rubMhbuMgqjjELIMO/sFxL5FUUwVrqE9Z?=
 =?us-ascii?Q?kRSW4CBrvLeDdRA9JJGrmJM3ekMwTr2JU4IhkewKv9mTNYxoNL97zi77xWoG?=
 =?us-ascii?Q?kKmV6YccXcDzmLt9ae0MmQBrs0i8Zp38d94Sp5JBrE/E35BMvrLqcdk2HIsA?=
 =?us-ascii?Q?P61lN/Vefa4g3HWl3LTzOb4uoSzz918v63csDw95o0v6SdZV4ekteWM9N/pb?=
 =?us-ascii?Q?PWlSNIEK7DYZN/t5IaPzVRmjkW2VxdyI21JsTpEfbKnXRXFKYTPI3F5I/6Bw?=
X-MS-Exchange-AntiSpam-MessageData-1: weIwXDlldk9JVw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549cc6a1-2945-4081-006b-08df13091257
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:09:39.4997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7iMpTlQwMHNk5Jto57HaoPCdgAWbLKKZ+NycWBe8gtqXEt4JpHSMlMdfRjqCUxJahTkNcYswRbFdK67SucuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5156

> Its redundant to pass csiphy->camss and &csiphy->subdev.entity
> Just pass struct camss_csiphy *csiphy once and then extract the pointers
> you need in the routine.

The same helper is called from the CSID as well, so a csiphy argument
would not fit both callers. The camss pointer is reachable from the
entity itself though: container_of(entity->graph_obj.mdev, struct camss,
media_dev). I will use that in v2 and drop the extra parameter, which
also leaves the callers untouched. Does that work for you?

> This seems fine. I wonder how it works with the TPG, probably fine,
> needs testing.

With the CSID TPG there is no link on the CSID sink pad, so the walk
returns NULL and camss_get_link_freq() returns -ENODEV, exactly as
camss_find_sensor_pad() did before. I will run the TPG on RB3 Gen2
before sending v2 and mention the result in the cover letter.

> Please fix up that clause a bit so its not spralling multi-line

Will do.

Thanks for the review,
Hitesh
