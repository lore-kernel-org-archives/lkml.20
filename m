Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020084.outbound.protection.outlook.com [52.101.225.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9833BB13F;
	Tue, 13 Oct 2026 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880411; cv=fail; b=dQCUrLF78xrTSruLbpRMuhZVSQ4ivOFAaPAbwhFMuQMFNX7OTJgzIMgk3bbrK4pByype9PYoErAYud9C+5wIjWV9trjKKvy1rWOQX1xdNe5aoFth95QG7Hq1e0rwQABA9cTVNwwrQTA1rEQ7akwCb01RDhy11D+PCFM5hfr6vv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880411; c=relaxed/simple;
	bh=CzpcgKrgxbJMWmObGMkT92nKjmTQ+jrcNCioXz2sPBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ELw2r9EKAUVpu6RgA8ypyHj8Vl4xxuR2Wayk57Qqy9pkjjpkh6Zdhc12QSJCZuHI4ra94TQ096N/nIduUM4XFEbS8AS/yUKlAQJxyrFdjCEaulnLZWdlIcZf0RuIH9nxBuGxEihecv5JB9rj0cP2HtP7TQkoRPf6zFUUiFV3kzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L19HxqGbfkNUzW4gf/81JdKavdhmjLUw+GLN8rbtreK4pqr8jidQ1xN/R6qNRyWvDbkxrne9uXp+lTS6/6jDtYOBwnYWahHt6aRHAsoB6lY6Id5Dth31NZgqz5hbCbLHeze37yo9xmFQjruXGH0eA54TiEvIY2/7UWoxnGdpXOVO29pd/B5kA+4U+Ak/Qwsg6ngvrCm5jvF3SAeBmfPnupt1hNM4teJI3iMgiE4eBufz6ozjvpdLV3TVrtUazqS4dMrsOSEw/072mf2h23KSxOgfNGPl84vyNPnIzpygN/JuhplHTVMrJx6dfnCnKyQUW7hpjCcrVkjwQ5hDZlKeOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvFfR2URAFIUF/lV+6LIrgRLtDwMCAVp1KWThQLN6qg=;
 b=YZR9hjfZr5St+VrUSZKVr7yTb3v3vtG38vbVH52UHtZQu5Z0fYTyBms6o1Vax60HtWn0spRD2S2q3wOcPeGZBYN0KODf9WAXKiN96bN5ABWLfEmOn/h4DB0O4m0lWuxQAkIV7K27SJj1Xw7nSne/EQgd/q39wiTlaguE7or/12+DY2i81C8KtECdj4t63+sUCaFGK8guALqxlBYYmzwuXzJoJ8I4ZU5R6Y2Erjqh7kLyf8yZyRUMHgg/8g39owj5RHOFPqmkMLym5LiC5ts461dES4+yyIbAhESJYBuq/Vq4HrVAMM1wO0LA6U0CT+9U5cb1A17I+ochUPcADsNDuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4631.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 08:33:23 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 08:33:23 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	atanas.filipov@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v5 4/4] media: qcom: camss: Do not link CSID source pads the CSID does not have
Date: Tue, 13 Oct 2026 14:03:06 +0530
Message-ID: <20261013083306.1132036-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083306.1132036-1-hitesh@ebytelogic.com>
References: <20261013083306.1132036-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYPR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25b::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: fd055732-f7dc-443e-01a9-08df2904a4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|10070799003|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x73kOnRfLLfFTwJf4YRfuablfVK2Iz+KTppAwywue2YEZmbX6qqvbmmTc6LMKDJVo5V9FU6uW3JiyQVSPAueX8DS6PxDVPKHn+0FKWgajUeeJ+1MTuxS4Y2ZWLW4tGF1b5HuRGiYgBb+ap990YdRgNeecxQBNuhbb0lIV0VkgfHfdhj2pGkn4PcPk0J4kpAgQ1rez1xY1b/Qryd1iKKt+1bwQqpeVPuTJK4V7GM0Ov31uz6K3Rx9Fz3htqkr71n1Lj/52UtaJyBMXF/D1n5ccEDFsqjTRNrwIO7DNaX8qeo09Ivpns4+El4JdxQpzfvWJMOeB4uwu6nZWy2A/zZ5SX1N4TBJ3Qrk+nIA8t1TdCRLdL3qQqUhYqpOFoiNzS1UgHYG+IsfUVgrzW2lP2HEn8Uf86itYT6q62oSwY9qBQKjZGrLFRPIpb85DFscpqxJH2FKvh4xi3W19W0cMIq62ziXuzg0x43x2CJQdIi8s08INY2mngdLommMbiwuEhGoyWDQ18wKKFAi9dO0y6VN+RnzXW4/Gkrhjm96QVYBTemHToqH0TTh8wgCP8LM45BfD9HEryeZnYrYo1AjtEJk2KQfz56eQ5yuxAFRiXm/01K2RrbNP9hxv18sQXpy5oPCZKjgkzdOaHfb7qJ1dOIMGTAkXTk6y2NRI2sVacHMH88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(10070799003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nU54FgyoPjtC7+4HO80LqEk+chuQl+6P2RIo3pxKNVJKXbDjedaxfRfODKRQ?=
 =?us-ascii?Q?ucKlMbEbPlya66B6FGJggWNAkudcqPptyp6xQ+DYeTYnuRPp4Q3QL9RQE/aX?=
 =?us-ascii?Q?JGilpcwVIoJJmi25KXlMEc8r2Q/C5oYe8G0qfl7599A4RqcVe0QYGX/49Lb9?=
 =?us-ascii?Q?XQiklaYvsow0FHHxmom8ZHmowSBj+JtzmogYHexpf6Q6P9KcFBo/7tqpsYyU?=
 =?us-ascii?Q?Q1WA9U3+jJHqmR0Kj9p2bjhk75UXAc2gyUwrwyt1jT7uP914SgZQPniDj2aV?=
 =?us-ascii?Q?SqiQQaJyBJpCRNpX3AUvZcgSc8wz49MtCnT4MD1S6Gn+PW4Q8EqTbDo81em0?=
 =?us-ascii?Q?n3WMjOki/ZOzLZgmR/pV8NKzU0o1JEjSxdwgJkdEd1vZ6nX6E7wp9e1wodY4?=
 =?us-ascii?Q?ABnuKuL4jnCQu5mdHDOqz0FsdOyzBC1SInUGRHo7rOS2nxYFqt0p0hrMyDEM?=
 =?us-ascii?Q?e9DhAPMHSi4Yjq0EH9t+/lksQLqP4nelWWWZXIV2nfT8dSBCzZ4YvjUNu8yW?=
 =?us-ascii?Q?7MFmZoM29EImW9A006xpKw3oPRr5vD4kX5U94LvUm/pOP93LLkYjgV/BNA0n?=
 =?us-ascii?Q?7vh1UBXxO9rOVn4+L9vbPVBey5D5z/p/UOK/fqnAVinHkEIlGn0PidQD1qi2?=
 =?us-ascii?Q?IxyS6h/SF02gVjSCkWI7JDob7/wrY0x2LwQSwxPgUciagVpzSV5QRgd99e7e?=
 =?us-ascii?Q?faz8C5RgH6LhaAsLT6CmF94xIfOFfxflrzEAwOvaSLcR1v7IZ4lkqox0TTZg?=
 =?us-ascii?Q?1cU4ufdUXxMSWzUsyqWtnn0pAwM2ABE+RZSe7cgWogw5eRktFx+bNmQmZHWj?=
 =?us-ascii?Q?SqyeZ910Lwy9otER6flnKioiLTR/2IuqiT6SL6cpSf8RXmOdKXecBMeTcB86?=
 =?us-ascii?Q?XEPxzrWBtgZGETnut3sf5Oi2hZCFXtRLlpQa2/gz/cwGXTvN1/NjMyb67qVi?=
 =?us-ascii?Q?KSlqnksACsUSQCC6QDpgQvjBCCtW4IO4xM33tk6cWUVIwoZDPg1lgKZQnUMW?=
 =?us-ascii?Q?Gwi08ae/2tS4ecNju5JhvjdDiDGC1TctZh1eRXosJrbJabJd0Gym/aRD1YN1?=
 =?us-ascii?Q?809axU+pcWfEVKAK4qQaMgYn8EWOTzn3I1tWIvYOACBq+YvO9w33pCXr+Rup?=
 =?us-ascii?Q?xefqPnNprM/DoAPZ8wt4VcXxW6TWPHB1uEZGl+PSAxC5vs8UYnMsJ+ZNxQOj?=
 =?us-ascii?Q?E81YqHz1XqJuI6f8RbDMlc0OyrDY57qnKyHTnI61G+h9J9mc2kwQCApUj8Ao?=
 =?us-ascii?Q?qnpGKNLH/Uh8VgCK6DBrh6fD4Ys4g+Qt4QTeXCfLFyqrM+XzWDUxBtQCtR/O?=
 =?us-ascii?Q?wkK44fnomLH5jk8b/brSspWi1yavS80KPqgAcvaU7hlikfrTr03oB2+Zlwt3?=
 =?us-ascii?Q?3rnedzj4/SsNruU1vClXwulsiLisNLyB5lMrRrsOkxkzCtHofx9EL3GRWwQn?=
 =?us-ascii?Q?9JqXggWVS1gHHuer4shqkYyrEciLZGct/ot4GxQl7O/2fXTOhs5weDnK2i/D?=
 =?us-ascii?Q?+lU3Wm6bmekxf5ibNDEBm9Du+uSwSBacgB9xxjsv9BA9cSK7bz/OiBJ5XBR6?=
 =?us-ascii?Q?zeK7OSK/HSVPzrv2zUCfHcDiHu5s2Ab2SEqyjFriNQKzjtTkQqHxcBPLi1Vc?=
 =?us-ascii?Q?k5NTOFZxR4Y/agibTjhQdggvfIsDTX/fqT17aUe3KX7ZI2roz8Rqww/fREXm?=
 =?us-ascii?Q?Nu04opqwy1hDesy+71nnYBvzXnlP1zuyqCZOUcFncFEbvo3PnxoHVJgMblk7?=
 =?us-ascii?Q?v2nfUJDjGLeiIXNxp0xXSrtCXalWbI+A2Y0UXo48gagO9tUtx8dlhDdAttOO?=
X-MS-Exchange-AntiSpam-MessageData-1: mSFtOYzHZT6USA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd055732-f7dc-443e-01a9-08df2904a4a4
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:33:23.0712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfW3n9n0gnoBPeLAoCzGT2z0tSXTcA3wLwsptIvTk016vj4gqYVlDmYdC2LQe3IrIcvlCAmH7vYZoMTgrvXl1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4631

A non-lite CSID registers MSM_CSID_PADS_NUM - 1 pads, one source pad per
RDI0..2, while a lite CSID keeps all MSM_CSID_PADS_NUM pads:

  num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;

camss_link_entities() still links source pad MSM_CSID_PAD_FIRST_SRC + j
of every CSID to line j of every VFE. On SC7280 the non-lite csid0 is
linked to vfe_lite0, which has four lines, so the loop asks for csid0
source pad 4 and the driver fails to probe:

  WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
  qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
  qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

The pad count depends on lite-ness, not on streams_enable, so every
platform that links all CSIDs to all VFEs fails to probe as soon as the
CSID streams support is applied, whether or not the streams API is
enabled for that platform. SM8250 escapes it only because
csid_vfe_fixed_pairing links csid[i] to vfe[i] alone.

Skip the VFE lines for which the CSID has no source pad.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a9bd79ca3..4b73f8862 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5028,6 +5028,9 @@ static int camss_link_entities(struct camss *camss)
 					struct v4l2_subdev *csid = &camss->csid[i].subdev;
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
 
+					if (MSM_CSID_PAD_FIRST_SRC + j >= csid->entity.num_pads)
+						continue;
+
 					ret = media_create_pad_link(&csid->entity,
 								    MSM_CSID_PAD_FIRST_SRC + j,
 								    &vfe->entity,
-- 
2.43.0

