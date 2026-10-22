Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646051;
	b=e8nyYWCUjOVyD3evef3n4zRufme4r48vXKXmHsKnzBagIe2jW3vO0/hggkOxWWeYxkGv
	 rrtWF9rIueYyE0uj7ds/XT3omfgXOOctNtsUnhrD+0bPGrQSxqOwKMRrZi1TZ9NR8fVfo
	 vTcspuVbPLuotKOxNY2Xm4bBvMTu5RgHNQjN3xa1cYM4eXRwF2PKjCxjuNPjLm6FjPfoR
	 qKO6JAPlaASyy959nkTOeJnuwXC9g6Kxfj+C3acKHGpOQBXFhp9PfE266S0BROkBQxKBU
	 aE+frHEbPF9VYmPfOIi1ro0+DubhlJCqwDYhKbrir64mMxan6hyn7xwPBNmus9vyQ5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646051;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RQ7IGcVrKb0N/CaWCdY6nCwTG7a0sFHMi1qhS+cakIA=;
	b=N0Ve+ucKFe9Nrqf/AsxT0fUSlJrjxOIjjfkhx5PGYy0zLxZdUbyldKLOuWCidnSsXMWH
	 8Cl3A99CUudpvVMlgAGpbYxE0nwXK4hkBGJaSzqib6LTBZWdFjZP+KNcGUM5SZyoVp6al
	 oMJNkwdcNzIyNndCZEC8Sc1uZHz8bH6tzZBMUWcl+8AO94YFcJn8yBWzgFXZeEqax64FU
	 8mseYXov/KbQeowz7Py8jfgbxEcDy0nHvimf/28MyNIqbNU6s0FBK7zR0s9G2Tg6/7D7I
	 2kNX2MMcH+CWbeeNOFlbNKFZIKvpvKovjopdtrVPqdgom7JLR9gJCmAegnCp3RiJIuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.128
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020128.outbound.protection.outlook.com [52.101.227.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B021606A319;
	Thu, 22 Oct 2026 05:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B021606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyNmGjJbETbOWLVBnUhSrQvf8vJVC+1lt8U8TyNCUsaTON3HOVYoUE9OViGZKCNHa+Ya1SPf3DeNFZznIgWbNMAtF1EcwI52NSWmKhGrcod1S2C8Ck8KNoNxgOVA8DXMs1haneE+XgPPMZ/rPdYgDNEi+q6ZDhtMonjJeaMcJkxJggrCP6FXVht3Pmxc1fU8kQRA/OMC0ZIxOJzU2RvRHHdL+E21xzYBMErbTPBNN7VE/RhvzgJSNAY11ylbyN1m27kEf7OJ3gXwNhZG72ecEf62n2cl5g6sEs3KTjWwjHwBNHbNQZisGLnyvMveMvZDzyIgzs0Pah40ZeoYjkF2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ7IGcVrKb0N/CaWCdY6nCwTG7a0sFHMi1qhS+cakIA=;
 b=NQbyTyM6Jah446WGv7nA+saBE0LRiLdVVZNqTE6XPlhZ/hHbGXEZwPv1P4bo1OSFhsTgBy5RVigSC7ihI+P2g2uhRrabyC+UP8TEnAsVRdt0jhzXQwHVQiz0sF4GpNb/WrkO+Ic00pEMgb1+PxotDyVw8M7b6olwhoNhv+z9kyMilnu6kCL93QP5K/DF15O3hXi2OAxtGXK1ZX0f+WeHck9pzr4BHu8OoPwFU5rFPk57ZKn2qcdHJW9h0p7UAnusIMc1cx88TNmPegoLnvfm/MOSleUmBlybu7fkbEewGtHjiSnOdTVqPLvFhcl8q8aoLRdyI2j17ruB+5Q/7eZwdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN3P287MB1480.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:194::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Thu, 22 Oct
 2026 05:14:05 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 05:14:05 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH v6 0/4] media: qcom: camss: rebase fixes and SC7280 enablement for the streams API
Date: Thu, 22 Oct 2026 10:43:53 +0530
Message-ID: <20261022051354.256645-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021134959.2599575-1-hitesh@ebytelogic.com>
References: <20261021134959.2599575-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::19) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN3P287MB1480:EE_
X-MS-Office365-Filtering-Correlation-Id: aeebbd94-b5d9-4f6e-a612-08df2ffb4ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|52116014|366016|376014|1800799024|23010399003|56012099006|5023799004|261009223027099003|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	vCl0XeG8x0/I26dyU/naxarzH7MZiUR5E4NG3SaTDGeT/SiKGGeJFBN49AfDOo5FRKXhqt6GwvJz3l4YESIvc4YfypBN5kKP0omnbWoI++Mw5X9sh3OIrw4WFK9U3+GCzL5YObjSPF1fH4tFgxyYYkNMWR35UZOFuRo81VInmAnPBeP7p5PUzOuWijTtyUz2DovumzSjKCHUZvrGb0McXKke2WxpmqdjYF/UQUXndcpVgar1qd//V/xA30BBjEKhJa2TQUlguWAJ0TIb1uOFAIa3DUV40NbkxQSQLJVMTdVveQ0lnsl4mWQEUUom5IvCGaEk/eEciPsteHANGF3evkQLHK3mbB0FfmOj5BHWHJWZyw6o0Z68TlzsvI6MnURIty9iSxTOMWFDB9PxR56BYxtyes5IXTNadsc1baDj4CwH3U/P9RqDhVDKp5cznBtafjVN7atZvBWsvviacgsV1nBb8solnvD6pxtTAhXo4QLxEggRLdjvu3CYVUnJsNRJIGBjjWRg0Cnon50EAcRvvo00KpnqxsWCgC42rBy0JBGLyQQ+Hp1yYPpj/K3uKiBvgBmEGY4DkNDjmGmfsF9YaA3cCC9GB9U3eGSsx3ORIczDrGWW0VY3BD6v9Q5r/kcWdx9ajsjs4u6pOf+v7PTyrnw3lfUufsqD8TJVKYIgOM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(366016)(376014)(1800799024)(23010399003)(56012099006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?twRQcfLjF5sj5JmjeckrudGsN44q71fSePm7ZU7KyWKJa3q3iWySYDFy0/zD?=
 =?us-ascii?Q?L7b17cq7WN5X8x3Gn14j7TJa6qsOK4C5a1L0AiSF4Ks06CKrClU2SDIqdrsD?=
 =?us-ascii?Q?qMPV7iUaqnKoMcyQbEEHNK8MfCIjnEc5UAt4yWYvXPWtJXk4YB9xpM4OyjAo?=
 =?us-ascii?Q?2wp90SrhV0+SjoZyKWu1uJXbeoGvXtbSsirNnJbVa06ux6GJFQ54EIVPbyOm?=
 =?us-ascii?Q?SmisIa3ccDuTXiioaLE2KbSJAw//1ABNaufuUsaRGKAZiBwGDEcPH5ElR8ao?=
 =?us-ascii?Q?MVOFaETx2aICddPbks99qpdBd1VuA4+WEUcqDnan0QreimqFxzgtcfvfgw2C?=
 =?us-ascii?Q?71Uet5MeLoqA+SUqklZ2mQfnu0SZHvtxmY7EVQuaaA+STSMC2AC51hPd8T1r?=
 =?us-ascii?Q?am1tYgsP/99SjmogQuO18wene5Cm2+DzXRI3FlEGbFCIBiXDOzfknEh6XpS+?=
 =?us-ascii?Q?p1GdJGpSQO3/0f2f5zYTuhs0rhVtwJ+1ujLyHnBWDjS2b/Zd6BluXi/+P79e?=
 =?us-ascii?Q?G/Hk5g0ry2EzkSLXqfE1MbC1z/IEs4rsfTUH56n4cHyJ6ibeXQlsJ/To080k?=
 =?us-ascii?Q?bwOrHizMo6Urg9NVjXsodOWuzVt2RV+55YOinufFMV+D+XPKaGFFV+ERn3eO?=
 =?us-ascii?Q?yKe6goaOltzSQZU2/BHOThHLBaaTTqpcjc6RmGh+xY+ODVD0kZz0I1Qs5ehA?=
 =?us-ascii?Q?4Gc4wMOPyuktBAQ165xRrZfiUnqYj//6ZoS3OILWakX5qmsb6a3/K64GylT1?=
 =?us-ascii?Q?ytnV8bIwvA/6pIhf7VmLUt2JqFwOMNJlJ0CtmEtMlfzUdCjHvjmF0Te3rbHU?=
 =?us-ascii?Q?rbKxZ9rlVk3zxT7xm02PeK7/PtkGTtiKTCrVP2uwIxBDeSmMk8rhhx9CeIim?=
 =?us-ascii?Q?4GZVLfG8VO7MT0i9SWmW4IaZKZqrZ3xn7mK/x6HaeZBxMScw1o8qfIz53N/j?=
 =?us-ascii?Q?KADIvWP9QTt4ihiVfTNwt7bud5WKr+VhNMRuF5bT68aep5PqRtuL9vrGLwv7?=
 =?us-ascii?Q?Npt/iLWZ3opY95CNFPrPGuc5yMMolhNpaktqT8ULMBVeAeLiW3JzBqUrgQmV?=
 =?us-ascii?Q?QwWdvG2ox4RMUVjGIQFKyUv9DNeVTa+nKjY+ImEvhwnjsEwfulQHAEEaF3Dg?=
 =?us-ascii?Q?NQ7hccOitjFgV1wGhuBXvlLY+A4zPJsCZvgaY2q+/fEjzPuhxS2CwcbsGyzY?=
 =?us-ascii?Q?xlMmHcJ0BQufLFYdGdbLxP6uaAg21Lty0x5JXczwjdKDOglh/a5ttX4HsIDt?=
 =?us-ascii?Q?g07ayy6BAV/geOYkYCAJrW/Kjc2jRFqF2udbLjg7IaJGMx9dTKos9wTSupPv?=
 =?us-ascii?Q?KxRG5PD8OR31hHavLDDRU/C6rYMvYwNuLEzWhJDR8O7j5HOtYoYGrPe0cVEL?=
 =?us-ascii?Q?yMFFZujClqbWyTmkYEvAtH826rq68rVItNRYpQjaxXJ+EEg2/7ITWRTSs4B7?=
 =?us-ascii?Q?PNTUfaBH+b3gBExTlYKDlzUHtShgkaN/HnZkwHQ3yQvFoWaVD+D0B7/NGmqg?=
 =?us-ascii?Q?VKSROBbZzadv5ToKUjjCRDOyp5HedClYdTufz7qbiN+YexWo0o994XJlqgw9?=
 =?us-ascii?Q?LE+5Qad57Na/SVf457Eo7FrckbDXlqq+NrD/B2oOruI1SK/Eg1MMpr6UJ4MS?=
 =?us-ascii?Q?/fhjmszZan+KdI3UCO0cyRUpwpuYIVqCGuQaD8wXw5XFqXr6azR+KH4xKexe?=
 =?us-ascii?Q?OgT5SPuAY5+Qcee5Vum7/l3bZ3mnAzVfBUWFF28fDxIpVaBLLG+tmN0McyCB?=
 =?us-ascii?Q?lSzaWimkYSFREa+dTT4NtlIkju2Vnd6WcjppnCXTyBdl0J4AMoQqyw9T5qOT?=
X-MS-Exchange-AntiSpam-MessageData-1: ZhDU6gHDnQjDjg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeebbd94-b5d9-4f6e-a612-08df2ffb4ab0
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 05:14:05.0924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktltnMdRMJVlQFm2filVuqqIwKI9m/bptT47YMXlzULZINLTUkuTXp3JRfZ8WWghc2woCR03E6f9yYMgCMxWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1480

The CI cannot apply this series, and the reason is on my side rather
than the robot's. Details below for anyone who hits the same thing.

v6 restored the base-commit and prerequisite-patch-id trailers that v5
had lost, and those did work: b4 located the dependency series and
applied six of its eight patches. It could not match two of them,

  [PATCH 1/8] media: qcom: camss: Add streams API support for CSIPHY
  [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID interface

so camss-csiphy.c and camss-csiphy.h are missing the code that 2/4 of
this series then patches, and the apply stops there:

  Applying: media: qcom: camss: Set the streams API flag per SoC
  Patch failed at 0008
  error: patch failed: drivers/media/platform/qcom/camss/camss-csiphy.c:1157
  error: patch failed: drivers/media/platform/qcom/camss/camss-csiphy.h:86

Those two patch-ids do not match what is on the list because my copy of
1/8 carries the CSIPHY rebase I described in my reply on Gjorgji's
thread - SC7280 has no camss child node named "phy", so the lane enable
has to dispatch on camss->legacy_phy. That changes the patch, so it
changes its patch-id, and prerequisite-patch-id can no longer find it.
The trailer mechanism is working exactly as designed; I am advertising
an id for a patch that was never posted in that form.

The base-commit is a second, smaller mismatch: I generate against
linux-next, and the CI builds media-committers next, so it reports

  Base: base-commit 8f7df005a756... not known, ignoring

and falls back to its own branch. The series does rebase cleanly onto
media-committers next, so that part is straightforward to fix.

I am not going to repost to chase this. Gjorgji has asked to fold these
four into his v2, and once 1/8 is settled there the dependency becomes
reconstructible and the CI will be able to build the result. If a
standalone revision is wanted in the meantime, say so and I will send
one generated against media-committers next, with the CSIPHY amendment
included explicitly so that the series is self-contained.

---
Hitesh
