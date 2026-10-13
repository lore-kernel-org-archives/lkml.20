Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020084.outbound.protection.outlook.com [52.101.225.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DD13B19B4;
	Tue, 13 Oct 2026 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880406; cv=fail; b=BnjfgB6iGzlPNfWrSJ9uNGPeBctN6X05Ekj4Xva8wT293i2sV5uJvCaVoOUhvzAsSgTMBGnH2Hq+lLiOMWudWZSxfaF03+KcZ+qW7EMy45zIFfzpXOpLok3j04kF/cwsCTLLM/bsytx4TFm4lBnMAlX6ZvyUxK0WgyCaOh69s8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880406; c=relaxed/simple;
	bh=ng88VT8YEVxFtuAiQ+zQ+Caj7JZazj9q2W/RAp94iXo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nkrUsmBg6nANuUuU+obNEZzP+lmWTlBpJ+QlKByTBB0RqBhf+Q7VbMCYZD0FyKYcIImhVxwT0vODDLVhVODw3cqHSAoEsHZCmUTp7AnCo65658GhTDMQJH2/d3OgNJxE7dPDb6U7YJ4ZaZ4kVPlLM/TH7dD7aEwBgVmll+44VPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlPl+BwzTwm62YKLnIE4Kyz+feaL6aGV1omWjOwKLQ7bWvlC0ioOL1fchtjVmZv71bUEqQtCq6Xl4837jUl0Rb+VCXu3ji+krtJYYm5UDB4doZYobyBFxATUnOiArY4sh/geL7Oka5EQNTi0gPOceYxuXSxZfQFS0IRiw8Kh+BP3+N+tfdhzlGQP9RT9FUlglKeIkbA5VlU23AkFJUNRu8aDOqG975+lDM9xn4zg73ki89nyH9jwFb+xjE7rwct7WpTxTGcs8GEFXmgY0cEhhUT/SecJjg4Str9TCyk4XMk+jPDhJEZxf0a/7pcoOUzoHoX6T8efEXtzn0JWAOjBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7swTJ6MCZR8m6P3xzK0Z+poEgmwMVqi5GuDj9D0CJYQ=;
 b=cwIMZ5OEDw9fH8tu6qH/X2FpDLWcdxCS3NY0ZWlJ/ytAKwVcAzmP74oiBeWRFXwNkjuX7I1mgNYL7P5m22x1VxH64D16UPsHBDz2WnWSAqlT9OB4qqILyqzRZXqiZZGcRNQCcBwhNnOf2HmaEVAcPIilxhDLucHgLUP9FSA9GxGWdh+HSizkErViPGZpPOrPqf5essfxRG8oIABSxSipCkxTrz5ART9OVwZe6cguk3KbbUelu//l3m6RSi7pTTC4UG9T7PQ+Its5u3tVvfGuinkWeFW7QAPl5tnLdFEIT/PGjL0A/5xGGPCAaE0UG+9ImmlF8QyiEbiiyPA7FZKTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4631.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 08:33:17 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 08:33:17 +0000
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
Subject: [PATCH v5 0/4] media: qcom: camss: rebase fixes and SC7280 enablement for the streams API
Date: Tue, 13 Oct 2026 14:03:02 +0530
Message-ID: <20261013083306.1132036-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: 6b412a68-8587-4706-402e-08df2904a10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|10070799003|56012099006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9Zl8mOYD7Nkn9gXCO9ANvdQB/Xsbuk4KfntvkSiy0IMY/a0LcPKzmSSZqIPSUj20K+FOgB/b1wtKBay0Fs/ChHSjN1w9DzMbP81eRJOm6VE3N6SyvgxJ8VgKgZbCYGZ9XUKmjhyLGYN0FYkaxTVGIUXALg3VlsaumCnq4vbVV/JF3xFM1AVg2bhEF7Q0cCOJ5LZiB3kpHohW6DJszaaD7MRcXxbePqRXKyOZmDkc6Lm0tpWViBf067XLTiQbtifqKxDn5TBDPs5hwhJiXQh6vp1U32gvnCmhOkj/+7GaQXaP39cs0EDwL37aJ4GUVYYXtcolWuIAC4muaGlmTxTsYxnAJE/GH8DvYd2b/le4MSFLRT331k1DVyFT+yiwRz6d7rKYj0elNwYQTkBxqZkusc3gIPmwVIWkj9j1HqlAci/YjhEInxa75doBgqri+w0jigPJNb7zKLfFu6ljIh/Eu6F2sLIG67O0JvMDGJ7UqnFM+genfVoNC8iKdznQN6dlWsg4OIDj0W/mWEVVezQh+e079DuHsjTTK8kI0Ldz4lTvF1vMTfsNgT5xsyo9JsouYzh4o5/j/OFJ1RYNv9X/H+SojoZK25+/Oy/cqz7JzIe4F1Kz2y4sy7bkxvQFriMnqL5C0mtXWLXrk/cmlZKiFgMYEWScaW+Ad49GMmH8QJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(10070799003)(56012099006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RK260Kvpln0K699erx1xufU5pDIQbA/7C8Ay+4UUDRgXp6nubyHnlCDzDIkI?=
 =?us-ascii?Q?NAG5kCfNhwWnpjUtzlZ+Abum1HFFQ040HJ38iY6P7mbQyukdaTJa5aoTdFKO?=
 =?us-ascii?Q?RLzYzs7233OqS5/K89CKl3ebahGJ/qKF46WDxRV9TuciTOJ+WFPhpVvaTX+C?=
 =?us-ascii?Q?kgr8K7pmB1rp1wDX0f7064h8Tr+WKZ1Z/R32utswOvRBG7KtBEExc2y4R+AL?=
 =?us-ascii?Q?pxXPmyKYGSS86IekdQOtsjbybyZoa1ujhhOGkC4IhZRJS23z67a0io675kW4?=
 =?us-ascii?Q?aPtZ+N2GAhx4w61Ru0OEpjm7xYGdwpe2wmUEFsszmg15ZdsKdwWIts+aNTqF?=
 =?us-ascii?Q?EsdMOjERxcwRvTZfhrOpjodLUAUtW05z+D90O8iuy39NdQ6qLeO71MTtTbzS?=
 =?us-ascii?Q?HtzNM8aagAt6cbRLwmQXr/Cq2AhsN9VKjzHGGnNNVRO0E/ipiubRL/y3Z4Fz?=
 =?us-ascii?Q?uo4NibM8gR986+LARLjyqZJMDINlOmg9sWpfj8lTN4dQhuv/PtKGp0AwDoF9?=
 =?us-ascii?Q?lM3lfiSOpjo0cRgGHvxXI6sDJGtkaKAFsImwB7WiSZC+LMjdfEDuTK9tUhln?=
 =?us-ascii?Q?3yf7/hxAoOAZ07ko/98aJooJDwNb9pYRj8nbo/JIMY6GWq/iL1gGvSXpbTuX?=
 =?us-ascii?Q?hxxW+Zyu6IahtU8CdaufhvKVHpqi16b798kLEl5Z/b8zq+k5RpgeVKg9mHZ9?=
 =?us-ascii?Q?po9B9cKqWB9eN1XlrjxtIckHeHLnKug/oiFzKXXxGTBzXW3yZInxlsA4GPOi?=
 =?us-ascii?Q?IslY5nOszokGqjMcXC8nvc9ADU5DMdOWhKd9v/Lfc4II0yZUd7DlLe0T7E/c?=
 =?us-ascii?Q?48ywS42WFWzEj8ISvOJvHOO+V1hfzOd2wKbgulyyPqRELfucQbG7DDtsY02o?=
 =?us-ascii?Q?Z1MlFy9Boepciny7vx5qowPyY6FHrasxVnv4p1lQgE14sdh1CJPJy9LTokWv?=
 =?us-ascii?Q?ZxZ/ZcUcfL4vsBuG97W70fyv7vu8KGBxsMJtWXU9Xjyjm3znH6wh5bB01O45?=
 =?us-ascii?Q?S33xQcM44f+PkPo7MjR7cixBjsia3HVncEkS0aMtBsQLC0lAxpwGSy9yHVyi?=
 =?us-ascii?Q?aVtY1Hq3kI/Mti1uImiAxOnX3y6/T6bCNBOPHz21MzA9/6ntfbgcC2sXQ+6B?=
 =?us-ascii?Q?X6lcDapQjLDqGS1lcOP2VFIAyx/jnFx5wrhLptpxxIFZi5/8M1w47mLMrmnP?=
 =?us-ascii?Q?GPzO9t/rbwkzTqeVOaghkUdjdLI/Fg/gt1ulHBAWhW1Fsv/N0+6zPUuI1Xvd?=
 =?us-ascii?Q?qv3mXP1sKRi/isLuvrUL48GDv8702wNGVmn28+2QPPBy+/tTN5rsYxM3uXBV?=
 =?us-ascii?Q?bSJFKOsGWo1IgunScvPg4/EaBksISjGlbhk6LgOz94hYP2M4yxXtPMmvDioS?=
 =?us-ascii?Q?B6d7beE7Xr3FKD6QmYD757dcsPJkriNkLjLRCpp6X4MTjly2gOv3hCbi4eSE?=
 =?us-ascii?Q?S2q+npZdKkbCUDaFxe2KTYysZqN3Sxrvmsyq9LfYC2+to/QBRujZ2ctYm4Yo?=
 =?us-ascii?Q?fm+Q0x84NwKOZqTOfIk+CA312G5IxGSUSZ48IneoO2P5f2haiRt7ajqtOAKG?=
 =?us-ascii?Q?I1hPXYt77S0XGAHy1NoOJlodIZRt6tViml+mXdezXwHn8u7mKPkKQDjKeaIX?=
 =?us-ascii?Q?MLpbIeZ/OSLiigjZm4Z3lLoGGE0nojCXJTizTstbWC73jmPyscu0Qgs5xskV?=
 =?us-ascii?Q?zgJAeAEyy0WgovsFvQuuvrvV/murm0oLIh/RUBCeSX47Pwuczi0p/7Oxql2d?=
 =?us-ascii?Q?GaAJMI1UAZhgCqKxarvbpUiUt7Xareo6z2G4JP2VLDhJFGPsMd5eLTynFbSK?=
X-MS-Exchange-AntiSpam-MessageData-1: 7F2+TlWqCTVIEA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b412a68-8587-4706-402e-08df2904a10c
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:33:17.2464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jlk8oJj/bDRiSZNHIpkH+S5h5qoefpUz4aOgVOkvvlzdhmLFiI43+ug/63QoBoXovftF2GBNX26kve+AsvlEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4631

These four patches apply on top of Gjorgji's

  [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
  https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com

and do not build without it. Gjorgji has asked for them so he can fold
them into his v2.

1/4  set_fmt has gained a const struct v4l2_subdev_client_info *
     parameter, so csid_streams_set_format() no longer matches the op it
     is assigned to.

2/4  The flag at the SoC rather than on each CSIPHY and CSID, as Bryan
     asked. struct camss_resources is already the per-SoC descriptor, so
     declaring streams_enable there takes SM8250 from fourteen
     assignments to one.

3/4  SC7280 enablement, a single line thanks to 2/4.

4/4  Without this, camss does not probe at all once the series is
     applied:

       WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
       qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
       qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

     The pad count in Gjorgji's 4/8 is

       num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;

     which depends on lite-ness rather than on streams_enable, so any
     platform that links all CSIDs to all VFEs fails to probe whether or
     not the streams API is enabled for it. Gjorgji has since clarified
     that the pad counts converge once the non-lite IFE pixel path lands,
     at which point this guard changes shape rather than disappearing.

The CSIPHY rebase for Gjorgji's 1/8 is not included here, as that is his
patch to amend; the resolution is in my reply on that thread. SC7280 has
no camss child node named "phy", so camss_detect_legacy_phy() puts it in
legacy mode and the lane enable/disable has to dispatch on
camss->legacy_phy rather than assume the generic PHY path.

Tested on RB3 Gen 2 (QCS6490 / SC7280) against next-20261009:

  qcom-camss acb3000.isp: streams_enable=1 legacy_phy=1 version=4
  msm_csiphy0-4: flags=0x14  (FL_STREAMS | FL_HAS_DEVNODE)
  msm_csid0-4:   flags=0x1c  (FL_STREAMS | FL_HAS_EVENTS | FL_HAS_DEVNODE)
  msm_csid0-2: 4 pads, msm_csid3-4 (lite): 5 pads

  imx577 -> csiphy3 -> csid0 -> vfe0_rdi0, SRGGB10_1X10/4056x3040
  msm_csiphy3 routes: 0/0 -> 1/0 [ACTIVE]
  msm_csid0   routes: 0/0 -> 1/0 [ACTIVE]

  10 frames captured off /dev/video0, 4056x3040 pRAA, 5072 bytes per
  line, with real sensor content.

Scope: that capture is the on-board IMX577. The upstream qcs6490-rb3gen2
files describe only that sensor and our GMSL mezzanine DT is not
upstream, so the two-camera MAX9296A case cannot be exercised on a plain
next-20261009. The concurrent two-pipeline result I reported in September
stands on the qualcomm-linux qcom-next branch, which sets
v4l2_subdev_enable_streams_api = true by default so it did go through the
streams API. I can retest there if SER/DES behaviour matters for a future
revision.

Note for anyone else testing this series: the streams uAPI is gated at
compile time by

  static bool v4l2_subdev_enable_streams_api;

in drivers/media/v4l2-core/v4l2-subdev.c. Until that is true,
VIDIOC_SUBDEV_QUERYCAP strips V4L2_SUBDEV_CAP_STREAMS and the routing
ioctls return early, so media-ctl reports no routes and v4l2-ctl says
"Streams API not supported" even though the subdevs have
V4L2_SUBDEV_FL_STREAMS set.

v5: 2/4 reads the flag through a local streams_api bool in every
    function that uses it, rather than a local in CSIPHY and CSID but
    the expression inlined at each VFE call site (Bryan). Two locals
    added in camss-vfe.c and one in msm_csiphy_unregister_entity(); no
    functional change. Rebuilt and rechecked on the board.
v4: Posted as a series at Gjorgji's request. Added 1/4 (set_fmt
    signature) and 2/4 (SoC-level flag, per Bryan). 3/4 became a single
    line. 4/4 unchanged, but its commit message no longer claims the pad
    count depends on the streams API. Tested on next-20261009 rather
    than our vendor branch.
v3: Referenced the prerequisite series with a Link: tag.
v2: Added the dependency to the commit message and as base-commit.

Hitesh Patel (4):
  media: qcom: camss: csid: Match the current set_fmt pad op signature
  media: qcom: camss: Set the streams API flag per SoC
  media: qcom: camss: Enable the streams API on SC7280
  media: qcom: camss: Do not link CSID source pads the CSID does not have

 drivers/media/platform/qcom/camss/camss-csid.c   |  3 ++-
 drivers/media/platform/qcom/camss/camss-csid.h   |  1 -
 drivers/media/platform/qcom/camss/camss-csiphy.c |  6 ++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c    | 14 ++++++++------
 drivers/media/platform/qcom/camss/camss-vfe.h    |  1 -
 drivers/media/platform/qcom/camss/camss.c        | 19 +++++--------------
 drivers/media/platform/qcom/camss/camss.h        |  2 ++
 8 files changed, 21 insertions(+), 26 deletions(-)

-- 
2.43.0

