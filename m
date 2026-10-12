Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020074.outbound.protection.outlook.com [52.101.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B994146C4BD;
	Mon, 12 Oct 2026 09:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797006; cv=fail; b=DTE82oh2X1J8HKTuHii9o12oVk1l5JeyIromo7D73YgCd6Ml9JIaJx5aGiHTnORizq2DceP6s7mSYTnVXyq57haiRBhtL8rhnn+dNer21aY1H5i0lrmttm3iC55WXh4QMh2Y5ngkRuSAx99KSfEPLufT7iDJpGYfU7Sdfeq4unM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797006; c=relaxed/simple;
	bh=TQGbWmU8jMewnvF6A/3dkXSYFsTTU4EYdyniK8n2rGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rigO8rxIuvy3MZ23bCqYJtOeAltpburxXJFXK5U6BbMrZGe+oEr0lnJOk9GqUW8puxaRusnmMwAlXfH+7cSGni9URB5fyINfeqYBY1wHDArDhXSspWlZwDHPgm8pl01jaHFRklb2OMTNjH2nuj4C3PeD94Ojnkow0g5eaPEyrww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sw592U/ibzkwLUyL/Fzki4E27JtE93MqedeSENArjvjoYdg4rB4BeHoDHesjXA1LzXkCou/yVNoqx3EpEhnAFtOtvD5JnglESqkQIqK0mKk5aVtq7O2G5cBJw9IWSaHbae5qC5EZZDTGDiyLMAieRy3bFv9WGbSsYeGBqe0MY1SepEgcyK30binhsMwDgsOgEZ8S7WM/QLrWNDO4NLSHk/hIKZkQULu+5JSMYRlOWnYs6IzyzQHGyTBJ3ggqahjulz5k2oXfhEuTtT9/7bzNxjyz1oeyP+ruAnhIOZtlMF1ZVvPp9Q1G44nMERU9QTsYLJPSZvXHGtvrf+BAwfmbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQlupJC5FkgbH146Haxfj5z3FDIEsWENpahvrReXOYA=;
 b=kNb7cogZlbbkFWxWMARCFhP7hYbvcJVZV0oc8UKMe2suSihTsuB5MgXF0l5Jb8K8vWPeoF7nRZ4ON9885j0FsgOxnUqmUH0QUdbxIALpodRMY7qZt+yKCX2AdGzicXENDeaRgAJR3o5+k+au494khsC51klhyMYgSj9vs0tPV95k5FR0/23peCVBo7Z6qn1xqDUxKf4j84sF1xR6FJ4cZBItBLDEscgaGE6jzJ0x3O8+iEVVxYYGWkeoLYs0ek1C8HYfuEX9pQ4mXhxTaNN9yIWsrODJlswrryHNoSfwN8cB9iQDmE82XgfP1iFpGiKPJBNJhHgt/1+598WapivnyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB5040.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:23:18 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:23:18 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: bryan.odonoghue@linaro.org,
	gjorgji.rosikopulos@oss.qualcomm.com
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] media: qcom: camss: Add streams API support for CSIPHY
Date: Mon, 12 Oct 2026 14:53:02 +0530
Message-ID: <20261012092302.118764-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com> <20260911062213.195007-2-gjorgji.rosikopulos@oss.qualcomm.com> <5f238c7a-c17e-4127-afad-38eb2cea9c34@linaro.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::33) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: de0290a7-0500-4a19-b2db-08df28427368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|10070799003|23010399003|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gPb+nnZmyRIfq8iVEJ4uvYVbevXgLZGGyUcZQ5uGqNSBzC6PaBDnjgWSMyJv5ghPHwXsKa9qQW5q1UiBwK8xbYWHqOLWYIVihVTIzMZg1Gca5bQwbrhin4dNbqR9KCziSYnhvZsLfby7TYNnCMDXQfXubYOwDwLRlzilGidV+DRyESS4dyanK8K867jFkjvOuNzSGMDmp47hqDd1XD9ocqSlq/Kf09Hc+bvpx/XRE4tvr0k7dpamfqdpe6r6FsoM6Bna5rJw+dgGN9cBfNLZ9DOJuJXAhc2TzyjeSkXyg35Eann8AutfYIa8MFex6jmr30umwiF1ImBtFEM6iHYEERtvolB8A6psH8G3T4uOtAIimsNDr1BEqVwkpIgrA/Ydujkl0pTLUqh9MEZc8ExsQurx9IUkqH22PUfV9HWmhRzzcIHj+bPGxSKvGdUB2/W9dOV2s/zw4kzerDDT5cDs/d+WEnlmd8YXXHVXh40f7ygxrfLUfQNeROuan/9wAP2LNr0SVW+nh8LpSZptdm2wUZQgxNB1ZG1JE9otzp0nXU0dtxVViGZIQxXT91Qg75mkRAUEWI2VAq3ZUgt71cyEZo3wS8AzlllR+l2tkJHjMM6A9aZv4m++srBxzgHjXSIksRrSVI11B/6uehvHoOGkFK9WwtXDFVZ1Db9bQJ288JU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vhq0SP8DS3dbzjXEtIpfwuD8RZb8hU8noBySdeYXpaL+FWeWvNottMwo2doB?=
 =?us-ascii?Q?hrrePNL0TromoqT5WUB7rYBHp3laLJ0GmZYHJZAJeRIbPC0x55ituLl2ua49?=
 =?us-ascii?Q?tTmkpNMqnKyZxGxbXeYuFseoF/qF2ld4h6+D+v2Q6AMLV2UzPKXleNOt9r12?=
 =?us-ascii?Q?WP0Qq911BZNgxb1B32HWWInr1eIRtRpaksUKH3NmORMS5Xzh/cYJwtmWA1TZ?=
 =?us-ascii?Q?krPcb+AdrYgJMLsCzasgy/crqiMTDhXK0joyseITm05CTZYaclFoK0oElwL9?=
 =?us-ascii?Q?J1FDFKkpw+NtQ/irRYNAfIJNB1cj62/nxTqmmoAeHBpm51u+rPNybKrYqnWy?=
 =?us-ascii?Q?TKrQR35VDlQ/DteAtKeh5dJomlGuQeNJQZShYFqkjpjlWyjQ4L9PY1/DGAhM?=
 =?us-ascii?Q?HuVrIcvsViM/qawKFHvMGc3oiKQvN78W27f18P0oxx94VpU3NHQe5O78p58X?=
 =?us-ascii?Q?VR50r/H9lPZI+7jhMC/F1u5xht0ZgJ5mOCajbd1Lh59ZsUSHoasF+M48PPOm?=
 =?us-ascii?Q?4p5ZOAM/zMWIrCJ0w+bZW1I7BXWtgHptxe1olObvjD44U3IOI1QHj0IVpWiC?=
 =?us-ascii?Q?mAd90GmKaiQzvZPcCLR+QytIUIdYydSJHY6mr32wy7NRYvJVddsu7bk3dRPc?=
 =?us-ascii?Q?VBUryKnbjtcdrOR9DkstdB/fqzyF19GX3rJgnwOxASoCLDwTxitXwE3ChNb0?=
 =?us-ascii?Q?zphxJCWP4MF6K47fu5tnd9k6KefKAHlwXlylkCZ42DdK4HlA2qv7T5mrGbdq?=
 =?us-ascii?Q?5PKfP1huVcmWK88nfPxyqiprCLkwJEJnoGYdu2+mvbhU4C1alGylU+Rguen1?=
 =?us-ascii?Q?FWGzryIRQUl8fAewRMnbvqNgw8KYunC0lwyiJ1rA7fmarGZeAJiqOsUoN9yr?=
 =?us-ascii?Q?PiLUn9ObhCD4TS3pq00u2ucUeaSESQwHsWLhf5SKY0xTpGyyXHXbTdh8+Nc9?=
 =?us-ascii?Q?PjVV5iKlt4SRoL0kNKFzKFLA9exBcNXF5O6+mwxYNG2y3DYc8Hu1XXBAX9GZ?=
 =?us-ascii?Q?ScCEd6yB91vJmUTIL5voXd84/hl16BpjqF5jTAaBc5lU76P2fFu77I+GNHPE?=
 =?us-ascii?Q?JCniNAe+rs2ozuNNTPYH/wSrSJVM5+RajGhkmOvV9iUvX1/AnTSoqSNakT1O?=
 =?us-ascii?Q?F9QAaIeOW9ep7QxFj8K3MF+CkB2MoQ3V30QROVqEJ8LayKjuWrXgSHafo+4/?=
 =?us-ascii?Q?oA+JYqdG8jHLt/J1NT/aukFnt5FBMBEJhxVNIbDczd0CH/LHA2YkE4NAjZH2?=
 =?us-ascii?Q?43zKvFosJ7rM7MmEAElY3YA/3z8Bq56YGxnyIdn5wpE6pN41T6WZ4HzgtznK?=
 =?us-ascii?Q?rwuVqkiXE2J/HMWLWrcibC6r0jqp0uJBdJ2+Ezuh8UpEh98Tm2Yap8bOuMZm?=
 =?us-ascii?Q?Y//oap4yEE9nUju/zNgu6bhIAsoeNEnK7JsQmnr29P3pM2WNW2gPFxyRG0U6?=
 =?us-ascii?Q?GtxrVoqlUtUWdADHzCRhrOEyxsHwFMlk5f2OWv7iN2EvMAOgUhFUD1ohpTn8?=
 =?us-ascii?Q?1lvBaaSfoLXoJg3Vrqv670m3EuQc8IEENfqAA0NDnEWlcDN2GVX/3rBVwbSI?=
 =?us-ascii?Q?AwX3pksySL8Ac51MCBe/F2QeQJrP68na9si52nr+lllUiFXUdvif17AKoZJF?=
 =?us-ascii?Q?Wlzsm7p1qhuJXCGfTTGJ4KC1UdlcRai7CR9RXdNG+Fq7csCE9zEquqN2/GJa?=
 =?us-ascii?Q?D8fnLt173mfgcSoEfMu21yZHc9Ir8MWaxOSydOjh7dTNwO4pDMcuczqPCHAx?=
 =?us-ascii?Q?vFcxycB1XmkowCFu4DxVLSqo4QzKgB+eW1Owo9VQCvC5alpkZ3I4nwXiqyk5?=
X-MS-Exchange-AntiSpam-MessageData-1: fhQCT9hU0Ue4Ew==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0290a7-0500-4a19-b2db-08df28427368
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:23:18.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zl9Gd3oEJtluL1nAs1wHcyWu18f0moThUmzw/UuqQtSJLf1hUJXZ0amfOyy8Jgr3RmqpYHir/3XRjCVcsu4jjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5040

On 11/10/2026 23:39, Bryan O'Donoghue wrote:
> ++<<<<<<< HEAD
>   +      if (camss->legacy_phy)
>   +              v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
>   +      else
>   +              v4l2_subdev_init(sd, &csiphy_v4l2_ops);

That conflict is the legacy/generic-PHY ops split in camss-csiphy.c, which
landed after this series was written. I hit the same thing when I tested the
series on RB3 Gen2, because our board runs qualcomm-linux qcom-next (v7.2),
whose camss-csiphy.c already carries that split.

I resolved it there as follows, in case it saves someone the work:

 - a second ops table, csiphy_streams_v4l2_ops_legacy, carrying the legacy
   core ops alongside the streams pad ops, so the selection becomes a 2x2
   of (legacy_phy, streams_enable) rather than an either/or;

 - csiphy_enable_streams()/csiphy_disable_streams() call
   csiphy_set_stream_legacy() when csiphy->phy is not available, so the
   lane enable/disable on the 0 -> 1 and 1 -> 0 stream transitions goes
   through whichever of the two paths the platform actually has.

With that, the streams API and the legacy PHY path coexist and both
continue to work on SC7280.

I am happy to post that as a patch on top of the series, or to hand the
hunks to Gjorgji for folding into v2 - whichever you prefer. I have the
hardware set up and can re-verify either way.

On the wider point from the SC7280 thread:

> Set it @ the SoC not for each csiphy and csid.

Agreed, and legacy_phy itself is the precedent - it is a field on
struct camss_resources, set once per SoC. Moving streams_enable there
makes the two flags consistent and removes the per-subdev repetition my
own patch was adding. Gjorgji, if you would rather I prepare that part,
say so; otherwise I will leave it to v2 and verify the result.

---
Hitesh
