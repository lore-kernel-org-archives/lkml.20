Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020137.outbound.protection.outlook.com [52.101.225.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999564B0CB2;
	Tue, 15 Sep 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474571; cv=fail; b=JMvZUAPLeO1pe2GXKf5gK8HMBnrbD+E4qMMNVSJXr2ZasWpl3Lm3oQ4m3oSx42OBhpM3zlUA+TMhe4SUX6Ov1Zre9AQRle+ypJcwTox2a2f5+u9OarpUYGWrEGdWR0Du9SWQP93wqx6R2QYRbW6RnRJS3H0QWeeZjDKZL73lpeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474571; c=relaxed/simple;
	bh=gg/MbxX1CmeT2ufUYBUJXQ67ud6Adw04qknYFVHy17A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mx25LN6MNSC3s4fZvQFsYtbldqANYHepNJqLS7YJM3WYzDR570dJJdkIQmy6E2IxtFLkc/tyPZMjTICebLUW/yVRcs+h/jiwcl4Z6TYGw5JbI4O9x/z1+G/46nbelUDgPD2zGdSBsHrpsPlCMAo1sDYrE4H3hjMSIgcE9FgN378=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWNb6QjOgWgYcaYo5m8VWra2bKdRcwT9hmJ7yYEeF9yDvd1IP/jI8+OBGA0Qm/kktaaP0InfB3SMUgcQu9zXasaZBVo6XPGTlH9oatd7KhugAuFJ1deSce0FeR+PS14gvmfMu9SXYdFZKYR3omxFVU/4LfpjQ4FuXuB6ta9rVKGmAyFqL8CibWpYadzEHjfgx3f2HhVb/ZcYnPIJ2TLmPyQXD64jkz/CBJKhvMHWJSjHqUx7cFyioW1QSm1gufPMfrG43nz9nAycgFOMg5MAbg7tgNcdn9x7TGQRn+YjQmIfTxQ6+EEByrmQ4Q0RHzHeXsmv7ivbpP4mL2hwKeVLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8qXYYAQt/OVhGKA9y6YE/xH2UOO4IHYSYji0xTXP+8=;
 b=LVkwJBkPsiqOe8Epcss4FZ3N0U76++397NTO+68nw248H0HOHJgiEMnrCGnGGusEF5z/FqkLLz2SbfhTWXZ2PnfUSwawPq3AMePE1eNIiEfBVVUqgrUYvyMDujbs47SKRvlh4gvmsuwda60pN7YE+SgJzYtF81qIO0KFkT2xsPBAdP9Fiu/b3kk2hcqRVyy6VsDZhVqD7OhzFibRVIFLkOE4PYtWfyzqfpxN31gcB2ge4jjMKQKLDEtFF3j/YA9KHGMi5dJaelkVQZGDa2MrbUwAZj/i7wuJ0yPC+RFxCvanFx0SwJ11jA3W/cZcBcCErI2Z8m2HIIGK7lDKmkxwIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:16:06 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:16:06 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v2 0/5] media: qcom: camss: fixes for several cameras behind a CSI-2 bridge
Date: Tue, 15 Sep 2026 17:45:52 +0530
Message-ID: <20260915121557.20910-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914133416.1030231-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4fde02-d467-46c5-6281-08df13231e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|5023799004|3023799007|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qKX5ucHfeSvPrVl8ZIsv27jAzUf9u9a3aP7ZwV0PDAmqG08PQFuYka98mJHkoOwVGIRoBuatMXasb3FLya9FzAw+U1UA6c8WbhCxOh0lNt6CaamsS3x7UZg5Jyiig7OC4xiWWcb36+h/4Ba3T3RKg0KacOUnOC3njGnher7Rwmyd2evDQebkwE17gmshvpEY+whxSDBEijPC8j7zRi3mVZJjNZI5/wQL4KTmHoi88u/0TiiLUla0w+AxyLPqs/G7NQcK/TlPqMGz/Ph/zdV/F8QGx5kjdRfWiiWQ2rAuJfYvxnj9+4rasPANVzXT1+kVbSD5hqm/7yrE7EgrRU0tjxkQd9d9bor3ElN4XgDASXS72zv5PXhtXAifhNsi1YF1tyY/ysMkWK4AhLjJ6McqltvgW//ZvJ4Mp1LY7XbvzOvY11/EMPF5Jhti6+X6rzY8Jo2bjsbc/uXi1iXFJuojS1xEgDqfIdVdgI6qNXQJCiaMLeCUhIPPs9k+wRtgtX4Ku55Dp/KNECmS/68vYDZcPvQvGmy72tjfB2AHzh0VBKug85CLj09RQSee4fsjXBvyxN7zMEiEpdQp391W88cxap7ljMBITyLYRB2VBr/FGInyp9wS5YdTvIStNLshhG1Y78xHXF2JlDtZaEqW141U7YVatUn3DKGsnomQqgjr/O0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(5023799004)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BjFmI3fxqdNuwi2lh6kedUldqpECc+6CBPQ5eBr3KASiYvmnW6YITQrRBn2s?=
 =?us-ascii?Q?7oUSYlJQkGrBXo9uwf1SXlzP77WClp2SNu+3Tp0G3fZjdnnVB9ZBZB7ieFYA?=
 =?us-ascii?Q?NDi2jofN4RKN9vCAWDpjIxLrb5zhawvSbqVmmI8vOsrusoMM9dL/QggKhlfA?=
 =?us-ascii?Q?OzOCjFOAYAzgMpPSehcd+diIvNRO4L17xPHD+4TljvyGLr45GLi6FVvGToOC?=
 =?us-ascii?Q?M+vwzmjTg/UFc753NWCUoQFA7GDVDDGJ6LxtbpMPKi+pqgjp8xIyteSey1P5?=
 =?us-ascii?Q?O1HByVDCH8KppIYEIotHyNR6Z/2PgxYTOL/WHmIKMGPvoShCzBHKnD1/Q3Ox?=
 =?us-ascii?Q?pA8b7wJlR0dAjSe5yG+jSaPIAoXnivTtZNgZOQVeTwVRA+8DE+hvGaUbDkuN?=
 =?us-ascii?Q?ZN69NTQvJejbSk0ccROJowcP83h3LnSqVkjIbzJYovpiB/X1WJkywxR0/7Ld?=
 =?us-ascii?Q?sw9QW9JkMLhlKF22+hWkZ8AVQSdH1a1ftYAe3Jc2qXKk74ycSRgnasRu3q7U?=
 =?us-ascii?Q?hCuSzneIqubjDehQL/vw+Kcw1RYTSoTRgvnyx7y4/cq1lkE8RS6wvKvYEzJ/?=
 =?us-ascii?Q?mM1KeaoUPkKQN1omVDewrpicYFJpp5zWT7+gEVvR2sUnD/F3tAMTqhGbWCoQ?=
 =?us-ascii?Q?axyJ8i97sYdIf486Yu5rUWSzFlELj0uSgTCIAbPIf6TGH3IOkZ6itJ39g713?=
 =?us-ascii?Q?T86vgDbAjE8vJnIsOEH3TGxVq5UKJy2OMm8pvA5yEryOG+wZgSBRk9A3WUaw?=
 =?us-ascii?Q?CCHmHJ+59cd4QVHDoK1DGBQrYyrzI4UCDCf45/jxbjDL1RGs89GOUTRsPtAA?=
 =?us-ascii?Q?AIQd1oimjPlN9If2xufExE7C0XO5EH0d/1j0DAWgXGiyRIOTQ34jphYPWoU9?=
 =?us-ascii?Q?+S4ufLHL6U2LSZcNTmvr63ha6La13HFzoz8of+RLyRZF0XHFAy1RAFGbpCTT?=
 =?us-ascii?Q?TI/KR3AS4s+TBAqSXHe7HFrmAMy1gauLx30s8uruGvDMkTuFTjjtgUv+Af4a?=
 =?us-ascii?Q?SCvgvIHZE4mCLOmj7OoUrzqJPvuNL2ccn1gLWB57XcdiMNaYpfRo7jkFpXej?=
 =?us-ascii?Q?BG9waI8vvpZCx2iuune3UB+vjPgte88K9VEobB32WkQdhJk/D31wut4/KCWM?=
 =?us-ascii?Q?D2e/G1nBYJCT1b8+Vf6R8doGunOxUUbwkS7BP+gm6oRVGitoxXQepTf85yeP?=
 =?us-ascii?Q?Vsuql9TVxsoFRHosexCAS8YTeV+eO393cHKc0aGkFoeeVulNzMFXPXb5o2/L?=
 =?us-ascii?Q?lRM+lYn/4/LDz7Ed2a/unVlKNi/edkfI8cq2S2vZcvHMIWZRPZs+nz7ovC+n?=
 =?us-ascii?Q?5F6P0KvESrNQoXi3t5tmJLGghoUOqbkEm0zmIHXTT4Ktx3dGUZT/YavdT7sf?=
 =?us-ascii?Q?aCUG/9ESjHoO8XhCa+eVzjYfIOj+YywMr+MixtEcjbkiW+yTBGYkoiZlW5F1?=
 =?us-ascii?Q?Y8zPkxmiu2rM9qd3++rhO6XNg4GF4LZlnW3S8EclILtXHdINdc6+x+OXLj3H?=
 =?us-ascii?Q?oXbajwe7ZCYOF25w3o+Q19ibdy5ITQqK5x7y3m+irHEpa1OJVmJy+omMvUui?=
 =?us-ascii?Q?8uNA280L96noHoLEVYGemz03GTK57FvXgOYk6ew7W0OUYTCjzeLZb9+aE+jV?=
 =?us-ascii?Q?4++wGFLQkVQDwsqeeaiuH45Pux8FSsainRa3I/v77bjJ01MseUUNIutQ77aF?=
 =?us-ascii?Q?gifKxRaL+qItnXVyaur3hL9WlG6ommo6QG17YXD3PwMJB62MSsamlWmbpH24?=
 =?us-ascii?Q?3Uv6sX3lSIrfXQzyn0MKb+QRLE4mpiEg7Zbw5W5KXpmgvtxh3ujLAURCQObh?=
X-MS-Exchange-AntiSpam-MessageData-1: F5wfqd2q82xv/Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4fde02-d467-46c5-6281-08df13231e1f
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:16:06.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQ6S5DMb7WxhiwbMTFsaJAblsKo8reLiiwLoifDOOI1W6iUEw2L2vjlZmjwMe+L2IfzuxQekrEhi6dC6XqBbIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

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
handling in camss-video) are dropped. Gjorgji's "add V4L2 subdev streams
API support" series [1] covers that ground properly: tested on RB3 Gen2
with streams enabled for SC7280, both cameras stream and start/stop
independently without them. The SC7280 enablement and one fix for that
series are posted on its thread.

A CCI fix found during the same bring-up, enabling SCL clock stretching
in standard mode, has been sent separately to linux-i2c [2]. It is
independent of this series.

Tested on RB3 Gen2 with AR0234 and IMX900 cameras on MAX96717
serializers, on the vendor 6.18 tree and on the qualcomm-linux qcom-next
branch (v7.2 based): both cameras streaming concurrently on the two
CSI-2 ports, and each camera started and stopped repeatedly while the
other keeps streaming, without interference. v2 was re-run on the
qcom-next tree, including the CSID test pattern generator after patch
4. Each patch builds and was bisected against next-20260911 for arm64.

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
[2] https://lore.kernel.org/linux-i2c/20260914132328.976902-1-hitesh@ebytelogic.com/


Hitesh Patel (5):
  media: qcom: camss: vfe-17x: Fix write master buffer done being
    dropped
  media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
  media: qcom: camss: vfe: Fix VFE reset while another line is streaming
  media: qcom: camss: Take the link frequency from the CSI-2 transmitter
  media: qcom: camss: Create the source to CSIPHY link per endpoint

 .../media/platform/qcom/camss/camss-vfe-17x.c |  46 +------
 drivers/media/platform/qcom/camss/camss-vfe.c |   8 ++
 drivers/media/platform/qcom/camss/camss.c     | 121 ++++++++++++------
 3 files changed, 93 insertions(+), 82 deletions(-)


base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
-- 
2.43.0

