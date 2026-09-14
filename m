Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021088.outbound.protection.outlook.com [40.107.57.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B232E4078CA;
	Mon, 14 Sep 2026 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392871; cv=fail; b=LFFcN+rvfFtlNuuNmMwaT9WoUEG1yZbZgiGCrhYo1RkB10DtDBt6qix9LuhIBJ42+e7ESr6X89FA2PDCTZURpUkD3EytxNpn+Zc8YMPwFXXgpqh6/FpSESHFiIZn9pylfZoA3GXzQfOqwyBZwbZO9MK4F5mmgFacCJ+RTDcec1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392871; c=relaxed/simple;
	bh=zeGJvV/FMer28fCwH5yi//PvwreaqnMtX9qvFyL05hs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tpS5tFv+iIHTx7jvZSOSgcgmSW4iavyRG/gWuNOFUDWyD08tCrEq7ptw8uzW06a2qlglfBYliA+64WdqtPcT8pOnw1s9H6U8J111jGiMIEZBwBtr0DRXvKaFAoYLkkyrI+HQj9W81Bx4pdlu11fsN1rxvfwVdSdS3HLDXS1fPSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.57.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DM1KC3qPR4WMEgTEGy7kCEaD13Hj+IQJlOR9buizz+9zYGNb+TLXbSCAPHMDlFkeIbYHuNYsnyi8zoeoZa7K6YOYYaaUZb2zij9qHsqI47fnKSBTh+FxFIHhGgkksw6rHP9hNCfsGyODpB+vGlrL4AS6fPjNO2tBQHscEY6bKaxPcSTfWZ303yPwC2RhlV6IkNREUcBcfBoM82Iya3blEfJ+4DvNR2rUBZjktkPaC0AYO9OktcYJhvPrBcb5sVzYgcX07RlYul2RvxinL87IXGVFjcoWU/wdKJgWWV6Lyx+9L0FyL/0RiH6X9Tt4Q9hby7IO56XkhEE2Z1C2/8CS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrI4tHlHaqIHovHO2lCQWB8CJz6nfvI6xO0HsyuX9iw=;
 b=J9XcfgnJgFoohoiE34JvFxZNAld3l5dnnKBVjXg/RCmUVOXXYApon0W2LrIxutoiWWHtoCD1eAbJAFJbt2OLTNKhwb2zhzsGCOzi28LUGWA7qoEut6E1HN+ueYTZmNBK3orfdxxfnBP7T+ZsPIEx76cWQk5Bs/fVFQKcWFJStQBIjymmDR0DwT+u6Ef2er0Pu9BOSnPN4YPLyvRsWTsKdfqvLDL2InU3rwiQ5CCUNkqhWuTSCVR/TaMlw/Y7XKKbpilrFuU9Bsk1VDgNqpa1j8tR96A3qPaD9G4NOSJD2CVcckrqAhVS5qeKPTyP9adrpt2LMA8RHLf5I2tXBZLeoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB1360.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:25 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:25 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH 0/8] media: qcom: camss: support several cameras behind a CSI-2 bridge
Date: Mon, 14 Sep 2026 19:04:08 +0530
Message-ID: <20260914133416.1030231-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:262::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN2P287MB1360:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a992282-7b4d-4d70-c3a8-08df1264e492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	gjSRTNheUQJznwfIrATB3TO+mDqn6NwUjJC9M1IOyudHYqpRo81AifoQ3HrKB7DebHoBGe+qAf+oP3UzffEX0rS95k53a4Mj8o9ItgtY4kkKACimN+2FFj+bR83wPdUpxXjdsTkLDHP8I3EInMhsnfOYdmDqWgadDDr9PBFphJE9DmOqEfXxxVo+QAvwRxf2/JLm2zRwvpUy6d0kpqzvVpUGQ1HAyxrRPZeoXlet92F2jEjV/uqrh6P/vqAyG1ybJ0ANC/LsKB8x0e9y4ZOVwE28GuBnkHKYmlmC5uw0Pw/SuYmUsHCH1IKotgOvWND1Xfh7/zbtJE85IUjuCJ9PeZa/NhowhT0XhJBh5pI04O4EW/KZAmoMvWTl0edYGd4iuSwemxiPS038BTtIm74AjkYfnluk64Mc/UAUiidQCaH7IyV52F1vWQtIz6AKIs0wHZdDHzwd0vV7kq/kdmn/QvPWLADs7FUkjLHjdh99lUezY/12apreAKqW+5C0wBp/EKJUAqX6LBbQppzxVJUZOBicAujXxuo0KrKieyOlQMPS+CS4WXwm0kUjMYuCc3rhmJz//UdHitaRSkI3q4GLitr7Yf5VqW2P1igEOUCDxeCzeE0bAreJXOlY/G4vNLmo+7AMYevP3LVL4ES0BnVBxVvEuWEMAfWxekpuPLgWoeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bp7CdPXKWT7pHf0qDW/FDZK9/ozCLbMdEhHCk7Df5svgZThnnVgCeuXwO81P?=
 =?us-ascii?Q?t3XUUvEpQByhNhXT9W/L2BL9BJ2/jenW1RzbmhCtd4qbXVzpJ+JkyLM/4rN7?=
 =?us-ascii?Q?bFDr0ZdADrSRzAL+WbKwB725yCLf4D2B61yCEw1po412/YDVD296Jl3za7tu?=
 =?us-ascii?Q?UTtYV+aNn+nQJOB0GT8xijJtTChc6NRF4GHKWl3vGKzZaU0srIFgUqbB5G+A?=
 =?us-ascii?Q?Y8Cfi8rHsIXw+aX24QT+PW4+7aeuEe5tulWI+67h3dYkxxceVqFoP2nMh3sf?=
 =?us-ascii?Q?N9LFSF0B7P2dSoh4AegyilAu2Vz11Irv8Z7cz7RQCUnC7lpUv0S8CVAFD925?=
 =?us-ascii?Q?FZuYGEALss45RiARUhGuWxTxK+LUdTvNntkyx+H+uGHWCC568JXJcDoZ34Ua?=
 =?us-ascii?Q?mVmyRVp00ZuW5zSP8DV2AelJxxPvzCsBuhsBUeqYYZmYiGEiCjCf2CjRkqBo?=
 =?us-ascii?Q?sUnfWfMrxZ4W9Y0gJD2KpUy8lVoqZZAq1tAI5XBA/HqVOjiRH7hWxAmx7nZj?=
 =?us-ascii?Q?BRd9pKmaC8dHETWAPh7vNXRxxtY6kWuPqN4fhFBy8d7z9tVBnAKxnp754d7o?=
 =?us-ascii?Q?3UNXu1lLkNgeu0J75trP1+G40VtjP9oONDOirdtkH1aitdaKsaPKWKjhQhsS?=
 =?us-ascii?Q?JtaULONvJRorgPnCMiGns0h9aEkdF1n9agmJ7wnFDInVfbL45BtI1s2/t9cG?=
 =?us-ascii?Q?jA1BTOmT7aA0Hodtpjx2BAM6WyNR4Nuh2C/1gLvUh6Rlav7PFejqvpEk5ZPp?=
 =?us-ascii?Q?K8JSP6PiQNxSzSLRk6CyCDI9v25aZED6jxIpZPvqUvgXCzDCJ8m8ifNi0Kyx?=
 =?us-ascii?Q?dpv+FrkQQuK5mOnzafq49uQ9VuZotXduzjsW4I7mETBbC2l0hc0gSvzX0hus?=
 =?us-ascii?Q?xMeIFI9YcR+eGJaf91WcTj2hWTl3ISYIqfMDLWxOIKLGXOFw5JrInFPwyUXa?=
 =?us-ascii?Q?LhxepUFauwCndkejCGxb4gK8k0KrC1owCO8cUAnLqrfezzGxfC7h/hpg/Hmj?=
 =?us-ascii?Q?gEPlm1FYOvpgDNzzRcWaoWF6GmTXlUqAFOJt14R9F6oQR1zONVoMfqAikTX+?=
 =?us-ascii?Q?urNQZKzdRV5mYzXtRTRO2DLROeZfFU6tNXmQwhOEoyMTmQHAtW/6sP06ZUL1?=
 =?us-ascii?Q?uy7KcIMec6TDpZoyhfZnkF5BCqEuyi3f34Vm+SAXx1/4qh7U1LRzG7CyyNUM?=
 =?us-ascii?Q?KuNgANisiFVgt4C//8W2OYFBsGHT765nPmRU4yNnUNu+M1JRS92rikfzRyyp?=
 =?us-ascii?Q?1RX6qS9jdASfoHWbBy7tHTeuQq1MuBsW43szxTrZiUHokOwW5yOM7JCJjTSR?=
 =?us-ascii?Q?foWiuv0TB9vLydiAayfpwnrtKUnw6Ic37pU7A3RzskZFTHiNfuooaUUOnJXj?=
 =?us-ascii?Q?W8hcmmuTmTN1OsLAHx7ECSRWw2KtnOYHTYvDlOpJ1JNVbQBkV1kHYlgxL0i9?=
 =?us-ascii?Q?voQMVuU2JXHC9JJLYj8FTayEJeraJoat/x2ofJ5yqdg9ZLzIYFUu/XpuGWN9?=
 =?us-ascii?Q?ntPpG867BiAhDzURUNpLPe5cY1oLVWwQPjD1Hw9Z14G4zYtWVOiI9XDgqNQ8?=
 =?us-ascii?Q?qH/5YEaID4Xs93YszUfBKvV0YOCwwLm2Ww7pNWAiLdUxyA5UtZe/yCO5hT6k?=
 =?us-ascii?Q?6Iu1QGDz3ij/64oH1N1gDy6HjYx5mmCvT/eqvQftxqHBOdiM1OGlb1ygkXLz?=
 =?us-ascii?Q?9+ZUvotcDIl/0XVR7Vb7h4uwrs+wpH4XXklycXS0hGG2sV3Ppmd1a/opgMkZ?=
 =?us-ascii?Q?P41ugaleftVv7nLtgyjCJAaO2THZ+igMJaCIqy6jmYz+U/4GCnFVualAwzWa?=
X-MS-Exchange-AntiSpam-MessageData-1: moe/nF2eY4ndeg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a992282-7b4d-4d70-c3a8-08df1264e492
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:25.2579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5yiVKsoMCeZs1viB68LhWPw3t94+O0FdqdNhA4KQavsky0w+ZOW3VxccVrdBqM6uWmi8ya6SkT4J89UilgN7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1360

This series contains the CAMSS changes needed to run two GMSL cameras
on the RB3 Gen2 (QCS6490 / SC7280) vision mezzanine, where a MAX9296A
deserializer sits between the sensors and the SoC. The deserializer and
serializer drivers (the out-of-tree maxim-serdes work for MAX9296A and
MAX96717) and the AR0234/IMX900 sensor drivers are out of tree and not
part of this submission; only the SoC side is here.

Everything CAMSS has seen so far is one sensor wired straight to one
CSIPHY. A CSI-2 to CSI-2 bridge breaks several assumptions that follow
from that, and both bridge topologies were exercised:

 - two cameras aggregated on ONE CSI-2 port as two virtual channels,
   demultiplexed by the CSID to RDI0/RDI1 of the same VFE. The CSIPHY
   and CSID are then shared by two pipelines (patches 5, 6, 8) and the
   VFE 17x has two write masters active (patches 3, 4);

 - two cameras on the deserializer's TWO CSI-2 ports, wired to two
   CSIPHYs. The same subdev then binds for two endpoints (patch 2) and
   heads two independent pipelines (patch 7).

Patch 1 addresses the assumption that the sensor is the CSI-2
transmitter: the rate the receiver has to be programmed for belongs to
whatever drives the bus, and v4l2_get_link_freq() already knows how to
ask it.

Patches 3, 4 and 5 are bug fixes in their own right and are not
specific to a bridge: they are hit by any configuration where two RDI
lines of one VFE stream at the same time.

A CCI fix found during the same bring-up, enabling SCL clock stretching
in standard mode so a sensor reached through the bridge's I2C tunnel
can hold the clock, has been sent separately to linux-i2c. It is
independent of this series.

Tested on RB3 Gen2 with AR0234 and IMX900 cameras on MAX96717
serializers, on the vendor 6.18 tree and on the qualcomm-linux qcom-next
branch (v7.2 based): both cameras streaming concurrently on the two
CSI-2 ports, and each camera started and stopped repeatedly while the
other keeps streaming, without interference. The single-port
virtual-channel aggregation topology is what the original out-of-tree
work targeted; it could not be re-validated in the current state of the
out-of-tree serializer and sensor drivers, so patches 6-8 should be
read with that in mind. Each patch builds and was bisected against
next-20260911 for arm64.


Hitesh Patel (8):
  media: qcom: camss: take the link frequency from the CSI-2 transmitter
  media: qcom: camss: create the source to CSIPHY link per endpoint
  media: qcom: camss: vfe-17x: do not gate write master done on
    IRQ_STATUS_0
  media: qcom: camss: vfe-17x: use the write master matching the RDI
    line
  media: qcom: camss: vfe: only reset the VFE when its last line stops
  media: qcom: camss: refcount streaming on the shared CSIPHY and CSID
  media: qcom: camss: drive streams-aware transmitters through the
    streams API
  media: qcom: camss: enable only the stream of the pipeline's virtual
    channel

 .../media/platform/qcom/camss/camss-csid.c    |   2 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +
 .../media/platform/qcom/camss/camss-csiphy.c  |   6 +-
 .../media/platform/qcom/camss/camss-csiphy.h  |   2 +
 .../media/platform/qcom/camss/camss-vfe-17x.c |  33 ++--
 drivers/media/platform/qcom/camss/camss-vfe.c |   8 +
 .../media/platform/qcom/camss/camss-video.c   | 141 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.c     | 167 +++++++++++++-----
 drivers/media/platform/qcom/camss/camss.h     |   8 +-
 9 files changed, 310 insertions(+), 59 deletions(-)


base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
-- 
2.43.0

