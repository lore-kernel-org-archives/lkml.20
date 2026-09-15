Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021143.outbound.protection.outlook.com [40.107.57.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816014AEBCF;
	Tue, 15 Sep 2026 12:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474531; cv=fail; b=kqbY3L9xGwxnKbbig7VKVGYBsctOMKWX2O7voRYqP5PBJZx8Jyir7awyGvgxqstfC4eoK1BE8u1eFU8FVVitAaGYTtVoU2Vj0AJen51AlKkEGJSLlCbYbFJ1lwZyEdOabdaWtUa/hu6UKwp/oWiTnPNVfA5Q7TNXEOuJUFg+2ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474531; c=relaxed/simple;
	bh=BvRzJXXdIS2rQSCLfoY43fS9wowVYX0TkpNb6ha3n70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DfTiy8GZNRBxXF+xSUK4L5PHD2Sgj7BDxsndAi0EJkNkuf05R5L7O7QlH9eCX1KKPTMaxEl1JOdU06u+bKyZIngX0jEr39RcX23TBXhnzrn3DcAqZfktfzFQf0fudYc10vUTDpC9O0bn+mzNS42+T0I1uAPF4MJ+JgmemYufZ2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.57.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEGOSIke7x3IA/JMWvC7Lapw4B8vuA/YIlyBk31A9sPxvJEyfOLKcS4mRU14gqSQIktl0fCQ8V95434WniTWahd0wZ2ZU0CyKqUDXBqXd0u5f+r180vdWLnL6TzBQQKmwA5MN3Q+evLGDkpqe1Iod8MhYumSYQuVls9duCL6nLxU5BPOU/Wfw19OM8QYstS4j/uKtm9wBk7cyMZxuxlp+I3y2L64v9V8DTSHozLhS7UumTyKMSQkmRm5irCdA0Vyoik6xXtVW3c1Lp4VfxHAbVql+og05WWJQzLIBrprDt/jUFj7DxMypdurvPOXUsMAkzCkzQFHXMhqmN48eeDsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHFKFLzWsbxnuu29PBrC/9R/dLq1FhGw76qzFMNIqMY=;
 b=LbQi9NShTYN6DQRwrbvXhgB4pkaDl1EDqdPKNucUPQWhIavteGjLHRVrW9o6sGmzceA8lGsK/uNvtNTMTbncleRdoVavKbh+uVd6rAs0sqvYA6+My/om+l7h4nxu+joxOzWqxzaPfVdi6ntH2UsUbDrWmSTKsX1WNYAWIyzHwA42GXedpVc7L06ATDsX9g404FcEj92MeK2ImnN3seJT1PcKxZ7qxM1iPF3yABgKsnK9Dt2tcJ7WqZ0AsPoVyiarBtW5QrY87af5NwTOX950gujc8n68lEaoCAv0nFrrDTr+CB75qge1aOhfCvUNNFjr5lj2tHmLK3t7hsBCOvz0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0566.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:119::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:15:24 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:15:24 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
Date: Tue, 15 Sep 2026 17:45:12 +0530
Message-ID: <20260915121515.17207-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB0566:EE_
X-MS-Office365-Filtering-Correlation-Id: 814fcb76-85f8-4941-302a-08df1323052e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|52116014|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N9DjjQ4dffe3wvyogCaD/obygBtUh86/86bRAmy4PD83dcYBZZBor1m207MxJUbl4o/vvN2hh94fTdCUIapOBltnTBscWrDGn31aIkWzllgwr2o6klj3A8+9ZTQ+1nplXvmH820+3pfjd2QRmajf/pJRv6CBPgmz51oPgOvO4Xlqz5cFoe8XEzOM3Vcj0pNZK5XmtyR8RIZP1EF0OND3aoBy3uPrW10eL2v5J/gL9FgJwIDK54EFmOULe4n4qZy2PeIh+aDUfVs+dHuwwcPB3rNQVxxWt4WKwjNcPnMCA6K40lNpA0uvT24Leytca1a3I1Q2to62A5WivkAcXV9WTX75TsSD5h6kCVfIyPj2tF3Qg6jz7urx01+uiL+qpH5fhPzcaT7pEWrkLrYnXjIpU+DPGbO14q7QoBulksMijYyeAHzIjHAEGwtS6AiNWTeMPxSzQDDtaShW49PngqCgy5Z/lGYH6xjT+D6d+4SU1gUBXhJkqkBpm/fbXMxHU00hi8lerZmxSOgtTTZcE+zKtvvjlkfVwuxFjIGZjnYhm/DSgRl00RiJYCIbZsLoFv9nbFSugj+iCLogfj3tZzozKqbKoSE3Eix7YT0x81gtl5exX1354dP0EIFxPSgbiW/UXBr3uV6EsBb77Q9vcwk+Yq8sfZV5+63KruHlZJuDHLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(52116014)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H/gcxvIC7vLDcr9pVDuQiM1KdsC/Z3UJ1+y1eVxhWwi2OM18j1ai941k1ZlZ?=
 =?us-ascii?Q?I5fr2S/g0DkYOWXUpll9zuvNkuuRVUtilzi2gVNddQjPwb2R5dPJPNhbZuTo?=
 =?us-ascii?Q?zJ9oTK/F4ZskxNFjH4YHTDzwPLcM2vYZ/sWsO7w8aBAoPzZojxrqvld/BC0S?=
 =?us-ascii?Q?xiVnnmcn6K52cavN82Nz4koGm5QemQbMcI1OeElBgCaa9RF44DE+V7tEUH7Y?=
 =?us-ascii?Q?3WKMWtBz4wbu78g+IK7qKxwan//4fhkBd2DOAwE0TmG9ksKCGkPLHwbtmjwy?=
 =?us-ascii?Q?UmPr5A5Ylgy+C2nxvyAgywH+t6pVkvMheDcsj8p0ajH9cvG8AVQczY0itVoD?=
 =?us-ascii?Q?vWUMsw46yOEBhlBMasZssay5PYeBz8xTu1YfJiNrrEHl9BV/9s/Py7iM05xU?=
 =?us-ascii?Q?hlx6rxjImsJWZIXzeAZznOIhbVV+6jjAWEoi35NTUAR8N9RxkkBWY0wjj6wa?=
 =?us-ascii?Q?gPVysGbs14uKqrRDfW1YmU/wLUxJFlgxp0voVCyyyzgXidzutgRicY6czcAB?=
 =?us-ascii?Q?Jgkg6zpvfB76856JOluXfBqsjAaHZxto3a8WKmQ6W3bG8SwYnWPhJ+CldJe/?=
 =?us-ascii?Q?TsDHST9ncM93KpfmG/BdMpycswnOzCCg/F0zB219/tCOQHnIGPS4PsP12EQ8?=
 =?us-ascii?Q?zzS3gJvLoagxntAfJFfs5CkeEKAnz+c6r3jHQvHxUfRAIo5e24XkjRqxDhbj?=
 =?us-ascii?Q?MFSk8FUY7DYjzUK9xLtZ8+ddw2orMAqULXmDZp9WB0ubi4nUNLNVSQr3yg2e?=
 =?us-ascii?Q?ffawmqkAVh0ueghQA3/5LWLkKwED23AtBunVBvvB5UXAlX+NczJOy3ah78P/?=
 =?us-ascii?Q?HYebQ5eo5eksZMc09jw64XZX7OltgPt5xNWBUg1TYABlVG7ARQcDiY6Ksh17?=
 =?us-ascii?Q?xR4NO+21PbB1CCqwp3n1hwFmtd+8/dg/A8Y6ALEK7ddknXZjVMMIyPvTa9oG?=
 =?us-ascii?Q?Z8z6cDbIzLJWZ7/QEc1mL6C7GI6+9m4R1XtgdsJaVsfsRV0ESn8LSwZER+ZL?=
 =?us-ascii?Q?W3Hx5iizjEzdYVrZHuyHCQHIF9x99BoQOGLBScOt61ffRMiT81mp5q7TUyaR?=
 =?us-ascii?Q?AIwLYoy1OXhpxkccxQNZ2+uc0Ff2z+m0P5oWCr66O5wgaw9j6kPJwo6bBN0r?=
 =?us-ascii?Q?HHvpuktVufOX1i7k3X80SHXFCrPcDHWDyRlGsAAMH3YzjAHAIh5adcabAAbS?=
 =?us-ascii?Q?wWAvfcHkOiIMP/DGAx27Z4v2hqKJLH2GHLfWYh4ZksijDoDcLHikbF3Pa+O8?=
 =?us-ascii?Q?a7Obw1r/6YrcbP51Dd/6qVNUdCboABvpNjoxOB2qoeL/PKeRleJgPs9JZ2Gj?=
 =?us-ascii?Q?iSwy+1GoV78lAjFyN2xNfVcsB1xnd+D6hJQq+T171igHt9lBI+4WO+iEBnzo?=
 =?us-ascii?Q?E8hVyONLVWw2Ja2uTHEH5hJXqkmtZBTkSQW4BPdy05R7P66vybvRR7a9KQXZ?=
 =?us-ascii?Q?nBCT/gbWZ3tsmssbodK4aru53xSDtmkwNbLm8Y2m2Mi5paZSFTHkn09U2R9t?=
 =?us-ascii?Q?uRFXqhsDUW3LTStfvEqyG+iUYvPywm8Qd9VdZzEtj/yPmrVXBbbF5s058bDE?=
 =?us-ascii?Q?bmbAcjnb8611Qlte8B4MoSjxtJDPGrYJ0wg8HleVA89Lhs4UfTRegaeU3+G9?=
 =?us-ascii?Q?ajW7l5W+W9WoNgUOw+OWl1J7jGISF3FzIRuD5zlB2nyhUG5uq4fJ3bI5HIlc?=
 =?us-ascii?Q?ypIWcMch3kuijBq5KC2/2XzdJlIAleqgWXr53WpYvnoXbwqKYEhYTrH52qJD?=
 =?us-ascii?Q?ffCEpTydQZJoJKMBsFFKStP3BzMNFKjrzTUaRUIapUjGIJiC78E95FZViMK/?=
X-MS-Exchange-AntiSpam-MessageData-1: /Y7irYi8tF1+0w==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814fcb76-85f8-4941-302a-08df1323052e
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:15:24.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zy10fw2FRtC8izV4tbN012UvYKBVm6Ybgfe0faAKEaYwQTkhsjg030PRZk4azK5qQ+DGZriycsTJ9DlQDU9JAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0566

Hi Gjorgji,

I tested this series on RB3 Gen2 (QCS6490 / SC7280) with two GMSL
cameras behind a MAX9296A deserializer, one camera per CSI-2 port, so
that the deserializer subdev heads two independent camss pipelines.
That is the case my own series [1] patches 6-8 tried to handle in
camss-video; with your series enabled on SC7280 they are not needed,
and I have dropped them from v2 of that series.

Results with streams_enable set on the SC7280 CSIPHY/CSID/VFE
resources (patch below):

- each camera alone, repeated start/stop: 5/5 and 5/5
- both cameras streaming at the same time: works
- the second camera started and stopped 8 times while the first one
  keeps streaming: 7/8, the first camera never disturbed. The one miss
  is a sensor/serializer settling issue we see on every kernel when
  the second camera is started within ~2 s of the first, unrelated to
  camss.
- CSID test pattern generator still works.

One problem found, fixed by the first patch below: with the streams
API a non-lite CSID registers 4 pads, but camss_link_entities() still
links CSID source pad MSM_CSID_PAD_FIRST_SRC + j to line j of every
VFE. On SC7280 the non-lite csid0 is linked to vfe_lite0, which has
four lines, so it asks for source pad 4 and the driver fails to probe:

  WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
  qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22

SM8250 does not see it because of csid_vfe_fixed_pairing. You may
prefer to fold the guard into patch 4, or keep all MSM_CSID_PADS_NUM
pads for the non-lite CSID; either works for me.

A note on the test tree: the series applies cleanly to next-20260911,
but our board runs the qualcomm-linux qcom-next branch (v7.2), whose
camss-csiphy.c has a legacy/generic-PHY ops split that yours does not
know about. I ported the CSIPHY part by hand there (a second
csiphy_streams_v4l2_ops carrying the legacy core ops, and the
enable/disable_streams helpers calling csiphy_set_stream_legacy() when
csiphy->phy is not available). Worth keeping in mind if this series
is meant to land in qcom-next as well.

The three VFE fixes in [1] (buffer done gating, write master
selection on 17x, VFE reset with another line streaming) are needed
on top of your series too for two RDI lines on one VFE; they are
independent and I have kept them in v2.

[1] https://lore.kernel.org/linux-media/20260914133416.1030231-1-hitesh@ebytelogic.com/

Tested-by: Hitesh Patel <hitesh@ebytelogic.com>

Hitesh Patel (2):
  media: qcom: camss: Do not link CSID source pads the CSID does not have
  media: qcom: camss: Enable the streams API on SC7280

(the two patches follow as replies to this mail)
