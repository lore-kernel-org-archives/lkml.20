Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580002931E9;
	Mon, 28 Sep 2026 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590974; cv=fail; b=HkoJG5s6MKXabV5RC0/uyZLVcuNi2pemoi2p5S+EBMC4FZDb+WH8A8wzMf9rPgaQfl/KzOf+61z7MwHtJD2SkVvG7RCGpxKigUpmxHG35SWDRlENRlsdNCz28FxKTSOdjHbbcjswcclIOJqqZ8wvAU1Vgz3WXJKBI5rfc1FLyao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590974; c=relaxed/simple;
	bh=TdwMiHJ9bsNHeRcGjkbG/E31IpTS7LPAUn/XaErKfnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QJnKdLepDugfNJalxqJZaN50T1nlArKA0g4bjE0fDot0bqLo0sjSLOdiQRB+MgBescYn8ly367gMsvLaUE03GUI5EsElLjlRAfkOJMj+JgTsD8Jn/kb6LjbVelrVXplbjzGkA31MtpW2a/T1mkbvFDiCm606F6Hemru7pfBZQ/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT8OV70QfiWMcUNZPCebQ+nHVoDS0Mb6CV/Wa/XDzYu+8D7IrDHXhzt5BCg7NlpEbDizh+s8/qrXBitovrKy65obSRn/CcMrlaUe4lg2LWSzNUbj++VSk2GcKwoMQpKLbjPJLMZwlhfaQ4Ok7iT+61JX2rCaAMsZAoJ9vFziroeRCQ4OcYXC/FE1aylTtYwq+D71ITYiFRcp2IxMkdaJeHuqGdyAoW4zRDRFvUCFuBk2I+GdhwU3ic2nRIY6jMiLg92ioEmenXCa/x61BsW9wAWM58+X7uYpbL4VuBF7zJwtVVTVPKus8hQJLN/468n3HfSPX8GyW8DsGpXJg/BSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISF/t0rRQcEmUlZCv2zU4JhdoNHVRCfLtJDZ+ccb6BE=;
 b=SMdsX3BT8T0+3sCRhLwJy9k3nlhpbCF6J+jlW3tsokkvkQIln1IV6QlUz6VwknLBZWCf2N9joXANwkM/JNraK0itdbVASa7Cqmo1Fmo+jr14MCpdbJusPfoamYIkTL3/WKH5HUhnfVWnIhGXcVgAj7VZWZplxxTxiNmb5rJjNTFjDHYRkUxR+fImuLJ4XAVT9/QBJMMlaFO4O4Lwh8GCcqy2h3kiS/xu2ZmoRmnDJhl+C8rj/0aW//7VImaqESsBRiGNKvWOBaLyWZYkK/rTOH0Mx0vIbiyDPIk5juGvouh0FikuEzN6jIAMfz71OmFLj348ezOr2iogn9LzmyWzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB6171.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:226::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 10:22:47 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:22:47 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 0/5] media: qcom: camss: fixes for several cameras behind a CSI-2 bridge
Date: Mon, 28 Sep 2026 15:52:32 +0530
Message-ID: <20260928102237.533341-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0060.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::6) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f32888-8ca3-45d9-554f-08df1d4a7115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|10070799003|23010399003|1800799024|3023799007|6133799003|10067099003|5023799004|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	oIUIkGPvzY5EROhYH3risJfNHIpIbyUBD7Roo0zLW+IteH3JngZPjdGwhoZLSHHqD8Sm+F6yaBRbBfyGWHI6N1AIw6puLerq6EUUBTV9UYzqapAYQoZwMFFKI/gle6Q/hjubNZY5vyY5j13slzNCuIczAaJEHt0ll3Dd8J6iT/cKOC3bhE85U+qO3urTSLkVw88zfGP9lzSSN2J1IYJQ9KW+5oUVk7EG2uuNbdHZELPVepZiT3WNcsMPfQD7AAKyrR4rDM2B7jx0e7bF19Y3EQpUVivYg0yQp2v9v01ZYAay1w8DP6/mluOzE/ZfgvCnupAYXqtufqVV0uNt0YPQb0LgdN/I38I1h8VwxHtIYTRRr9UcJIUVqAeDGOn74t+u8czH9SKHSGg5j4HXyIqx48PQLwcEf9LDZcDTMN07FA7fm0/ubLmtBJfyf9sQHdAdqEGysFBvCzHlNi+0CTvRqag/v2qwl5yypuGnr8znBaDzSmPXUj3hXaDARGCusew/NCAc4fyhjwuxsfhNULdVIQ6azK+LH4LmXRmhm5eC3OqoDg+gXYk52orxW0/1GaHUEKdBQc1DZ+dmD+ftSvbjTkgTXk2t6y7Nq4Rfqw6ax1nmmUS8dzApkwlBbWyQMhzr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(10070799003)(23010399003)(1800799024)(3023799007)(6133799003)(10067099003)(5023799004)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mB3w/KeZnYggaPoMqBpgxD8JcPA9mKpRsWAMY8c1dKaay8/khVQnUm2dM2YK?=
 =?us-ascii?Q?H5Y/aI3qQbgxmsvrmRR888kqE2ySGlAsjhCpTZJWULp3ZJYQ+NX1M+jQc3tg?=
 =?us-ascii?Q?bjrYdZCzRLWUnzB1C8qoNGE184+93PumevzdDBfNBvNMSofsoZ46oJ6zbedo?=
 =?us-ascii?Q?WYxVLrBzjr3O5EA0gQ0/ETz8cFOECjvQoNGXw6+HvIum9VJ/+5HVmyJm3p0A?=
 =?us-ascii?Q?sI78dwOUTlrE9Cvr6mb48AvVHp4gLdY716uo/bPq5mhg/v113gylsVgWrIGz?=
 =?us-ascii?Q?BGRVbJ8NCQcBqS7U7LLxBMi00zHi/pvQcCu4kT6GJK+HH106yFlBlQhsf8sn?=
 =?us-ascii?Q?DBbpDBoQmi2TpU1BFCSACQG7peP4OUwtV6Kvdmodpla1rs8eWLhnXvDSp0JH?=
 =?us-ascii?Q?xRhyu3Hz5F1ku9mtfWacXgAoQ00EWt16xDIPZPRv+ieEXqL9vp/tPqtA/1eT?=
 =?us-ascii?Q?i+wCen/xmffUdawS2zyyoM9C4+9H8raVduEOAoyzBnddQcBj9jvdnZ3UlogM?=
 =?us-ascii?Q?Mu6UbX+5mYtYvlmuureaxNwCGBJneEe6rS1A9Tvb60z9lekl+wQV483k+DdW?=
 =?us-ascii?Q?pp+7SVflzobcNL94Yg0gE+NCkbrMG/NJwDF2wTNLeFutvvU7VOde9buJFRdT?=
 =?us-ascii?Q?/mr1/KtXvSUHLQnnS/GrrEB9EEp8CztyuoDiVBwgcpdQoLLcBDuYI7I7VRaw?=
 =?us-ascii?Q?vqvjCBpmcuv+K9SSIkhnwkBBpv8Ous8jthMWTePu6NSINkVFt4FO/nJP4tFL?=
 =?us-ascii?Q?UucO29BnaoC1afXpPRQrPeUuelYXTs9o15nVLUoV0RE4aiImgf/oZJexlIr/?=
 =?us-ascii?Q?tO+CNX5qDoMC6JVe6SWS9AOblpkwPKQ12q0/zuovi6fFQmC1OLEuI/ZXU0K6?=
 =?us-ascii?Q?rLq+M2AocPLkomrvf6nqqbWW1ud+E6f0HNP3rlHn8i5WcrsxyQEdFNEx0uOf?=
 =?us-ascii?Q?yQZsT5tjr/6bf9yxkBtgZ3Ypqug2ph1JWWVWwCD/QovqsPEmzVsyzimGlcLN?=
 =?us-ascii?Q?XfNBSLDTVP/yrvSMrwN6GGCKt9HC6Z3yvwPPW1L/iZAquzK2IuDWl3Rd3DQV?=
 =?us-ascii?Q?WtzMvzh1zyadAltiCADnRgNUHzvDVboIszKONx10fnT45vxOM3574XAV0+Vn?=
 =?us-ascii?Q?o2U7XuDcTl+TiofB/Op7BSITpZtut9JJzsgGeHTntdZSjrN17N/LFoT6PuKs?=
 =?us-ascii?Q?WnCshp/xUUJz8VkeOkFscfW9TAOf5f5sLivVJQZk/UutSwDyPBhl7eBFSr/l?=
 =?us-ascii?Q?v0P1MthqbDUWdjuW3R/O8ArxECmHTozXt/Wz7uzwIDjdEvgRSrfqOPEsR+zd?=
 =?us-ascii?Q?NEXmPUcYUgO3jy+kIv/XKXy8nhdIRD4lBx331ODA8fkD3qzZYk+LY7K6+gbW?=
 =?us-ascii?Q?M+4qyF39BB1gtrFQB7+dsM+h5DdZAvu8hbCyn6A4PqDMYko7JmDh1tHr7Ti+?=
 =?us-ascii?Q?IFmj/RJsPjji76YnGjRoSPJsVoM/v3Eo7zYEGHyGX1xAEXaUFI+jcbGQCmeU?=
 =?us-ascii?Q?QJCiQ9UI0ijTkJ3VaVpKpkl3xbXPIDLmg5Srd8pUJ/3AHiQPgtztYcS104ff?=
 =?us-ascii?Q?VLRp0gKH5VOgM4+gOLl0RmGAm0txYvprCRnrpW0rwD1s26MZcoRpOZuq401I?=
 =?us-ascii?Q?vlBeFoh6oi3FeoOm53rV686NtOWjqkl2Mf4kYjJpFl3i2Ydq5gBkxCqdaYZ+?=
 =?us-ascii?Q?w63uZG8QLJScl/VV6K38SPrlN/STpcucyKP68Wwh2Wkxtr5MG9tXRqJ5Gy9X?=
 =?us-ascii?Q?t9AWQ1sG6Er/a5aPV01AC6VRjOG1lSyMdkezwQEkIgSM3xs+Vu8QKpHOMn7C?=
X-MS-Exchange-AntiSpam-MessageData-1: 1JT1n3lj1lsVDw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8f32888-8ca3-45d9-554f-08df1d4a7115
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:22:47.4052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXzC3xBVFkvb95uIiWXwKg5FXQzyxwLN341CTFH/Rml3DFu5ZXMp76QyNUtlraeN8QQTeGs7WFnO2z0mZCR9yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6171

This series contains the CAMSS changes needed to run two GMSL cameras
on the RB3 Gen2 (QCS6490 / SC7280) vision mezzanine, where a MAX9296A
deserializer sits between the sensors and the SoC. The deserializer and
serializer drivers (the out-of-tree maxim-serdes work for MAX9296A and
MAX96717) and the AR0234/IMX900 sensor drivers are out of tree and not
part of this submission; only the SoC side is here.

Patches 1-3 are fixes for two RDI lines streaming on the same VFE, hit
by any configuration in which the CSID demultiplexes several virtual
channels, not only by a bridge: the VFE 17x interrupt handler drops
write master buffer done events, VFE 17x hands the second line the
wrong write master, and stopping one line resets the VFE underneath
the other.

Patch 4 addresses the assumption that the sensor is the CSI-2
transmitter: the rate the receiver has to be programmed for belongs to
whatever drives the bus, and v4l2_get_link_freq() already knows how to
ask it. Patch 5 lets one transmitter with several CSI-2 outputs link
each output to its own CSIPHY.

The v1 patches 6-8 (shared CSIPHY/CSID refcount and the streams API
handling in camss-video) remain dropped. Gjorgji's "add V4L2 subdev
streams API support" series [1] covers that ground properly: tested on
RB3 Gen2 with streams enabled for SC7280, both cameras stream and start
and stop independently without them.

A CCI fix found during the same bring-up, enabling SCL clock stretching,
has been sent separately to linux-i2c [2]. It is independent of this
series.

Tested on RB3 Gen2 with AR0234 and IMX900 cameras on MAX96717
serializers, on the vendor 6.18 tree and on the qualcomm-linux qcom-next
branch (v7.2 based): both cameras streaming concurrently on the two
CSI-2 ports, and each camera started and stopped repeatedly while the
other keeps streaming, without interference. The CSID test pattern
generator was exercised after patch 4 as well.

v4 was re-tested on the RB3 Gen2 with the reworked 3/5 and 4/5 in place,
including the case patches 1-3 address: with both cameras aggregated as
VC0 and VC1 on one CSIPHY, so that CSID0 feeds RDI0 and RDI1 of the same
VFE, the two of them stream concurrently and one can be restarted five
times out of five while the other keeps streaming without losing a
frame. Dual-port streaming, the per-camera captures and the resulting
IFE and CSID clock rates are unchanged from before the series.

Re-checked against next-20260925: the series applies cleanly, every
patch builds on its own with W=1 for arm64 (defconfig plus
CONFIG_VIDEO_QCOM_CAMSS=m) and checkpatch --strict is clean.

Changes in v4:
- 3/5: move the reset into vfe_disable() and do it under stream_lock as
  part of the decrement that reaches zero, instead of sampling
  stream_count in vfe_disable_output(), which raced with a concurrent
  disable and could skip the reset entirely (Bryan, Loic)
- 4/5: replace camss_find_sensor_pad() with camss_find_transmitter_pad()
  rather than keeping both; camss_get_pixel_clock() and the g_skip_frames
  query use it too, and the commit log spells out what that changes
  (Loic)
- 1/5, 2/5: Reviewed-by added (Bryan, Loic); 5/5 unchanged
- Rebased on next-20260925

Changes in v3:
- Resend as a standalone series rather than a reply to the v1 thread
  (Bryan); no code changes

Changes in v2:
- Fixes first, with Fixes: tags and "Fix" titles, commit logs rewritten
  (Bryan)
- 1/5: no PIX special case, plain removal of the IRQ_STATUS_0 gate
  (Bryan)
- 2/5: use vfe_get_output_v2() on 17x like the other gen2 VFEs instead
  of a 17x-only mapping; no PIX special case (Bryan)
- 3/5: commit log rewritten without part names and with the affected
  line spelled out (Bryan)
- 4/5: camss taken from the entity's media device instead of an extra
  argument, so the callers are unchanged; multi-line clause split
  (Bryan)
- 5/5: Reviewed-by added (Bryan)
- v1 6-8 dropped in favour of [1] (Loic, Bryan)

[1] https://lore.kernel.org/all/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/
[2] https://lore.kernel.org/linux-i2c/20260921131954.1690578-1-hitesh@ebytelogic.com/

Hitesh Patel (5):
  media: qcom: camss: vfe-17x: Fix write master buffer done being
    dropped
  media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
  media: qcom: camss: vfe: Fix VFE reset while another line is streaming
  media: qcom: camss: Take the link frequency from the CSI-2 transmitter
  media: qcom: camss: Create the source to CSIPHY link per endpoint

 .../media/platform/qcom/camss/camss-vfe-17x.c |  46 +------
 .../platform/qcom/camss/camss-vfe-gen1.c      |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  15 ++-
 drivers/media/platform/qcom/camss/camss.c     | 115 ++++++++++--------
 drivers/media/platform/qcom/camss/camss.h     |   2 +-
 5 files changed, 84 insertions(+), 102 deletions(-)


base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.43.0

