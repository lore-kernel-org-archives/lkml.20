Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021078.outbound.protection.outlook.com [40.107.51.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F1D1419A4;
	Mon, 28 Sep 2026 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597724; cv=fail; b=YGWX2AGcp4a9DxKomuTdBd4DpQseRjSUYToOWSizgvisdfeISL3VAJ9bpyKCSF09H/j2Nx4k3Uq8JuADxExqVtJu3EXvf6kA7nkiPDNbhEVd8YPlrTi4dqIWCmOSb3agwbPwDUvSdTyOu0S7OmfA22gRCmWJwbLvmAxq14Zniu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597724; c=relaxed/simple;
	bh=JFgvSBkkYifedeGd67atR8ST3+eQLdZO0+0Dl+rgIcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AVwK1xK+aT6qkKWSvN65NULVvY6Od7yaXwpezxSsDCX9F5fhpy67k6S9jwj6eda1AxwMAzNXX6b/Jz94Xz+hwECDZ1hcL0DRa0r+knWbgUGn+6d5lu/Cl11LRILXmpt29NzCeDcsTxno3B62FqnLj2YRV16OZpR6LuJqcsvGvC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nfk0GT8snataOlCrjxEYe/dkBgZWa04jtAirRsQyWBv/MwG15jeYePVpnX+XVAH8C+omv6+K/P7rEihP5OZ16Kj87JyrdHK9efPV2A2ZefafJzyi6rmA5sVMfP/stnCzED39Aw9Pd45eHkZ5pa/qYVYAzqbO8GEwcd2FKD2J2L1blIc7cWYbHLkf8juBkppq2zDO2DXf6edEu4qynk3++bmGNI5inRQtZ5Z1iCzn3OUknKctxB7XWjFRHAazTeiniyXE4cUl3/im6/FoDOXqCXDkAtK53T7SQh6JAHCgavBp3abZ2d2s/TCWSBcaK0EMe/jqVUn+SaHloWt3jozDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+y01dYRfO0eqg1ZEuL+d3mdfA33B+7irZ0ddOKhPs4=;
 b=BWB/FS5m13qMOhxBg3wKHCu4q+IItitBn9RlLgYRTwZZ8q397w5itnZoPNE/dZGmjBqpPAT1j4YJII2h/TuXa8LsSNFNYf8X13BRd+maNu950sMEYL4nCI6zoSdx42w6p6R3R2l/i2IcaJ30b5nWCxdqiVVd3UFl7txUYgAgFFdcjRGpikdos5nECz3HtAcHnNAAuJ/TgaUxGrTKdoVmJL+NMSc2jqbTClwe1tr1TLU4ijjWAHHbgzWJ9Nl1HMEXCqgTRQ0RgHaoYO2ab0brZnUjYRS15d/GAniyuyPW0b5FCfhu0ljKYblVEaC/AXPNSYNPZ8sBUkQx31rcbqIv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PNXP287MB4178.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:28a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:15:18 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:15:17 +0000
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
Subject: [PATCH v5 0/6] media: qcom: camss: fixes for several cameras behind a CSI-2 bridge
Date: Mon, 28 Sep 2026 17:45:02 +0530
Message-ID: <20260928121508.1404808-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PNXP287MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aeabb26-c95a-452d-b2a5-08df1d5a28a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|10070799003|6133799003|18002099003|10067099003|3023799007|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	n4eM0BbjMEXWrLGjf6ihYcZMtM9TzXWn1LP9HUnmTTZiUHsvYNnm0yP8UW3z71gpfSehB4A++m0EjAmzJKJNR5+PiwH16yYITfrSWXDhDZ3qKHrxh08UcdLsIj3whPRaCjXdR0ea7zFU3wcf0XNEX+jwPtZgTj0CbexdV/+gxrxRqYN6jqmYD2X0pwDnwXuGb9Z8HvVwI0HEnydHLjuDx8pQQvH7Gyq9jiqr6SPPkinKiW/c9pARBONgL6cMuVyP9PEVqD1t2GWJFn7TBodlLoNLYVViAC6BTcYzocq6DhBPY7H1RL0NlvpVMZGpII9GHrSIvWMMnkne+Bd7PNpwNzw914Yyr/OzW2YLW1e7OdXJ/2Ni+7fcH+9IetcnX1yH9607UmsRgbmIH+yO+4Arg9m1FO+LVT0NqVfcuQcwCNYSzyIcCdBciZ1Df7pmjWfkgsmwffYM+IitfgNvAeKq4kBeRlxTWa62SRv++336QW+NhcsCz0DTBjhVBqt+dpnhCMXkYBkQB/2Sba8zntflfd4XG6fvwr9+ZvTCsJzHVa5+T//lNRKXenz1iEnrOmvWe5SSi0Ji387zfTbDKD/43hPhi5j5/CDaOdjQnR9Dtq5hpAhePoMcc0qJiRbZ4Zcs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(10070799003)(6133799003)(18002099003)(10067099003)(3023799007)(56012099006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2JZ1k/7QtilJU1hgjmTjXRx9N4gAdq6TFqG8xNZAltLuLezBhTvar4WT7oN?=
 =?us-ascii?Q?OSU/XaqARiQdVUhHXZ3xsNsH/7yPMTGxGhXMs1JPJdvu1xV0jyVdlxUJNUL8?=
 =?us-ascii?Q?srGF14QObLeVOsRVbe/kji69scuCRvhqGvTdAK/ArWRWBUQvDpdWo5AiRcCx?=
 =?us-ascii?Q?VVSqtM2tdAfK1K7kbDFHHJloNBUm5C6OYWJCRiOeo/6iFpCwmuvXOzeXi2Ke?=
 =?us-ascii?Q?AtM4/F3Gi/OFtJT4VUffgS7+99czIKo+GMZEQ/fG1lT4Utiqu7wk4K3pIeWb?=
 =?us-ascii?Q?Eee8C/3M4y1cSLSKmZxH2l9EQu6qp0IOmTKuspoQ5BlXN6Gl5jXp2c7RUmgh?=
 =?us-ascii?Q?O4nbMtHY3PxvH/fIgqf94O3NFk2I8i/eQ8pMWPbIvmSLKoEyJaNt7IM9O3IF?=
 =?us-ascii?Q?P+Up/nfiVB65K2F6JFGLqBJskPnhKMAjh+gYZgeMY26VXX8hIuABg/C4nRi0?=
 =?us-ascii?Q?K9UWLkzy2XnQWrnMjy9uV3kdpvna6K7TtLCvSZdtbtjs/3iKV9NoGuWbROSm?=
 =?us-ascii?Q?XbOw3OCH1xKpkq9vqAaFM0XFvviwbYWCeKd+Gvp9NryToGfderygXdryJ3zD?=
 =?us-ascii?Q?kznpKEh0bzo2VeCZxhGprgIohnqhAzZ1NmlmDKVUlMzevVzSevYeTXG2VBc8?=
 =?us-ascii?Q?tyCBAQjSEJ4rjnr5vasBaLWxLB3gzrqe8jNWpMfr9UgLgS9U078UETCo3fts?=
 =?us-ascii?Q?pNoGu/w9ELF4zdll/3//RU/ghtjiDSZTHrGDG9CPwPWaMzsgbGxYuWJtQmhJ?=
 =?us-ascii?Q?MSyawEWfVDxWSUHCzrd0QwY4yrY8Fn5aT4/KVnDNIueqjCBgtHaNweoLFcOb?=
 =?us-ascii?Q?DUxRDk9iX3+RSgurffRbhanW/pufVd3cADhlbaqqtnECzFrSGUXStNvY45ej?=
 =?us-ascii?Q?P+80tKsyQ0pyq4+JDE+hHBzNXx5WIoliV+AVGKvEJGrF4Iw257ZLcVGl1uXA?=
 =?us-ascii?Q?6CS+xgX7XaXFftmzPHo22KHOukIirHjXAbx+tlBkYrU87H1tPhbTWT57X3oG?=
 =?us-ascii?Q?V9ZQzl+MMnvTDA5H7NJ+j+At6r6RGM6zJF+C6jhg/GLN57e9tm+zMisowJhu?=
 =?us-ascii?Q?BJCjJ0jLhgCoeERgVdFfABmz2pSlQPG/ZgXKIXfx/ci/xO8pXrlaVrrqI5ze?=
 =?us-ascii?Q?6QWHL3vXQpGTNdBjayNlUTXSfciekwT3txKeWKGf/4fdIBTy5coLpbVy5H8w?=
 =?us-ascii?Q?LQ84YHcVtUfHl1UjliBebnCM7ZQ0HmfDqRC8q2+UVSU0xntdAPj9V/GBzWNY?=
 =?us-ascii?Q?76ABpYY1YL1vFcZgx/QOHZRBJG4NElnqELEgYnMjCI50SDmR7/FTU5EtrtK9?=
 =?us-ascii?Q?QUDO4Fzf5npa5F1V+dhu7lOh8twGFtTJuXIKiN4Y9nY4BUvC2TaGQIjyTlz0?=
 =?us-ascii?Q?mNu1MBpR6YTnOHW432eIoFm9n17ahRu5t9PqwS5LaMd+KQPAjx5LdNBZGwi0?=
 =?us-ascii?Q?diTxb6OFyAK3yLRfUmnjkVuF/mktZXiqcNYsYMSgmqKDvoUiQXIPccVoQDxd?=
 =?us-ascii?Q?jYtF9PQQKNbS/WIFuisQ9tGLKmMXEACjlp3m+8yPs3gCqyjkf9CtBNoSemWR?=
 =?us-ascii?Q?NB2nJ9keYHhcjthm3FP5ii8LGoctILwgPSpDwGk+rn6mY/SpW3+vfD5dAwsj?=
 =?us-ascii?Q?qfw6sNkB0A2HJSFRl4Nan4STuImcBmhnOW3WuD3R+ufkHv4dhagSrABzIMT5?=
 =?us-ascii?Q?U4fOfBXJrplAlAR0Zc6/hyCmcAK6fTmiqht8LJasDgQP4z12Aj9/S8fm2eaF?=
 =?us-ascii?Q?5jRptvupJLuAOi+urXP8gEAlyl+3FE00BhPzdNTrz6AVZghdJjWUag4cgaEk?=
X-MS-Exchange-AntiSpam-MessageData-1: KdQZLCB3P3WX1Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aeabb26-c95a-452d-b2a5-08df1d5a28a0
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:15:17.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSZjQcf4fidtXkV5BBeYHUkZdaX//Faige6fOvyg2DOZ5YQLmyocA+ujDfwPKqat9keL48ACvtapurftNRokXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4178

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

Patch 4 is Loic's removal of the unused gen2 frame skip lookup [1],
carried here because patch 5 would otherwise have to decide what that
lookup should ask. Patch 5 addresses the assumption that the sensor is
the CSI-2 transmitter: the rate the receiver has to be programmed for belongs to
whatever drives the bus, and v4l2_get_link_freq() already knows how to
ask it. Patch 6 lets one transmitter with several CSI-2 outputs link
each output to its own CSIPHY.

The v1 patches 6-8 (shared CSIPHY/CSID refcount and the streams API
handling in camss-video) remain dropped. Gjorgji's "add V4L2 subdev
streams API support" series [2] covers that ground properly: tested on
RB3 Gen2 with streams enabled for SC7280, both cameras stream and start
and stop independently without them.

A CCI fix found during the same bring-up, enabling SCL clock stretching,
has been sent separately to linux-i2c [3]. It is independent of this
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

Changes in v5:
- 4/6: carry Loic's "vfe: Remove unused frame-skip" [1] ahead of the
  link frequency patch, at his suggestion
- 5/6: with the gen2 frame skip lookup gone, only camss_get_link_freq()
  and camss_get_pixel_clock() move to the transmitter pad and
  camss_find_transmitter_pad() can stay static. camss_find_sensor_pad()
  stays for the gen1 VFE, whose frame skip query is a genuine sensor
  operation and whose result it does program into the hardware
- 1/6, 2/6, 6/6 unchanged

Changes in v4:
- 3/5: move the reset into vfe_disable() and do it under stream_lock as
  part of the decrement that reaches zero, instead of sampling
  stream_count in vfe_disable_output(), which raced with a concurrent
  disable and could skip the reset entirely (Bryan, Loic)
- 4/5: use camss_find_transmitter_pad() for the pixel clock as well
  (Loic)
- 1/5, 2/5: Reviewed-by added (Bryan, Loic); 5/5 unchanged

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
- v1 6-8 dropped in favour of [2] (Loic, Bryan)

[1] https://lore.kernel.org/all/20260928-camss-misc-fixes-v1-1-3e0155af6df5@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/
[3] https://lore.kernel.org/linux-i2c/20260921131954.1690578-1-hitesh@ebytelogic.com/

Hitesh Patel (5):
  media: qcom: camss: vfe-17x: Fix write master buffer done being
    dropped
  media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
  media: qcom: camss: vfe: Fix VFE reset while another line is streaming
  media: qcom: camss: Take the link frequency from the CSI-2 transmitter
  media: qcom: camss: Create the source to CSIPHY link per endpoint

Loic Poulain (1):
  media: qcom: camss: vfe: Remove unused frame-skip

 .../media/platform/qcom/camss/camss-vfe-17x.c |  46 +-----
 drivers/media/platform/qcom/camss/camss-vfe.c |  18 +--
 drivers/media/platform/qcom/camss/camss.c     | 131 ++++++++++++------
 3 files changed, 93 insertions(+), 102 deletions(-)


base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.43.0

