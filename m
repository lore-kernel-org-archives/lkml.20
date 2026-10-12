Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021131.outbound.protection.outlook.com [40.107.51.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27A3C276E;
	Mon, 12 Oct 2026 10:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791802496; cv=fail; b=VmVD5hDKus35rWUiRpWiCG0BV1SKM8ZBaowI/KDd84t2qHi84GPYVVxrgRuBntgLXa+OF1X2uLWi+xA+E859yFh+ONVVf/o+MdrgPydQ8emH/Ln6EvkWXm4qRWapCfLwvKezTHkA1uac/26MvUOMSb/3jyBAYxjYX35dtxE4DiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791802496; c=relaxed/simple;
	bh=sWn0NAZnmEHZzCr+PIQvAM3pUmohzv4s18ijCDUBF9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cEnBuc8vGKRj1g5ZovdaMfRkVb7FRLY7ZXiQX/xuDDR11j4k8aWN1NEIPJdafUQOZcBhzh31gGEu24eIYCX2eV/jAfDrqBIzZeJO+Utf6V2FU6yxR/dGwnIPJMgqRa2J09LMhZOgA8+nVos/m2P6kY7FeCD32QDaEYSJer8xatU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iy3UoHCGXg7EfJYIW7WouB0zTQEfcAvNLAXc8P6vJ5Di8HTWazKMFEW9Z2Whhxr40w9wSJ1H3uooVhrr6sQLKRqec+2eUjVdDLEoC46ztM4soOe4EgUroI2n6VtzUZlS++0QWzPLucqRZOa/vUCh/IMJaeOSl3HqL7Cot7R0Ee9NdAPgKTvSf3/m0b6V6J2RCskehNHVKPoWM+VnkTZ1N3Ef/8Ynml/bs96Q4hNUSx6zOH8b0iNO/Gj7TgN+jpFW6BXbS4pEKCZFCsIfm4lvZoIsdDVdQcUfiYahD0PN11kirtMLwpQk0J+lxqiXlgS/dNCUbWnodVk0TuEY1b8AvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLHmvNgsrgzA3NFbiwGkWfCq8b2QbyVfwaSvOGb5cyA=;
 b=KFtAIxEdZvRq7/+EeDDNINi4e4w+pyU6kANS+wZVzETYNvj1ZpgFfCtUclbdna1HkQTE5fDrfMpoUXkhHkriHkKfj3Gy0RhTNrrm6S2NYe7AUDap+5MYO/eaCGlpIklG5Iwv4QsI5zM3nFsLD3W+OAIeUoPuBc2Fyqb39vjUowar/AqIZsYW43P/5DVPyOUnb8Q2rrKQyya7bbIctqp0IJYPLXFldAn6RiHl5GXjUOiNrJVsJALn6hoY+f9J476t1TSSvGkIa9q8W4K7IVlpevRaoY/NfcG8Smk7gbklEnpJrWWJ6M11FTnvg0jMwqhkFGWLtREBP5/Rt3xmtZN30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB5203.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 10:54:50 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 10:54:50 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: gjorgji.rosikopulos@oss.qualcomm.com,
	bryan.odonoghue@linaro.org
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
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
Date: Mon, 12 Oct 2026 16:24:42 +0530
Message-ID: <20261012105442.788513-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e8be3176-e2df-482f-ae84-bcab3d2f9fa7@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com> <e8be3176-e2df-482f-ae84-bcab3d2f9fa7@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:261::15) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB5203:EE_
X-MS-Office365-Filtering-Correlation-Id: 41309569-9d72-4077-3c6e-08df284f3d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|10070799003|52116014|7416014|366016|10067099003|18002099003|22082099003|5023799004|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IR4c5JSFspXBy3lMbq6U+6VR72H1ksTtbPzB8VrrlBShEvsOevufbf1Q1l5rcWiyjIUHIx1zP6QF6u/myk7z4Y7X15tbHjijWoFLXwuLCmBHK+I4oeXDD/fkKImUvf+4sWrao2zXO6Mndnh1YFBAYosM0FQ7wFEVuwfMpd8Zdbb0F7NQUuLu0IDqAvn6cT4NnDYb4KW5SF/ackUODM4BgN7teFSP2ESUXEn0jLdPD5/4HiSKkYu5rDGkiChKcJHEtz/mTuWNLKESSuoGGFqS9/52brpqI0PuM6OQxVnNmV7yrFTprE6nlo9py89chh03AWcD5mpMOiHiAJSobVW3ol3jKvDXT41Em7Xpd5lNUbPHoxfC7M6BMxs7t4NizEXdL0Z3gWOL3oFNcUAKx+XvMMolW1GrnCKnCEmk3kDAqCj6XBsubgRIRImZodWuxMhjUZEdBC0ZiFgNOL7re7NtGfmGp03mVv8zKDzFw+PZAgkUNMEatz3GubhABrlM49HwhET3nIdBJhFamu0CBgFtnppJqPqyePGBIOsN/VUZkFZxxDB8aouhWFV272Z3C98dLxRuE8uvJu1aDeLUCdUiLy/M8XQGmy+YZRs69YtRpGZRZT7Q5FTy/lGJ9+NdAdNE/HV6TpwZUxfrAo0BrrPGFgVQ2QPt7NBrC6JHjWOspiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(10070799003)(52116014)(7416014)(366016)(10067099003)(18002099003)(22082099003)(5023799004)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A2/owIbPCYihoAbCIOvhuWkwQghSJXFB0ysW8LkfH1HZzoBN5mUwHCfIMfGb?=
 =?us-ascii?Q?4rAkgJIst3K5a8iOJQQw3QQu4XG6zgWRoc6gPQX2Pb/HHP0BCWYiyP6sY205?=
 =?us-ascii?Q?VeQBrsnHcMmmAEP6T4P3W5y7ALwODfcC8tMWIdJUf1NK602uXa48b+HuKfwF?=
 =?us-ascii?Q?rnym7MJIumF5j3RUpqJ/CjpL3kZAIekiIRzARuY/pmf4Qb3kskOo2zTGsSJw?=
 =?us-ascii?Q?VimNX5eKSVWcmT3mT47PhjjncJNJUaM9OelKKEG1jB0s2E4RzMwMTwI9TfFS?=
 =?us-ascii?Q?ZQqJ8BqI25AMmO71XjoJNpXQHKclDUN/im3Eko4yaTwcdmfzcmORHhAAPUTq?=
 =?us-ascii?Q?ZH47wCDxeTgAQmqfvVHr11+tQCBVyCtBMVk1SSvTq4WYbGS45gpLFApd23/R?=
 =?us-ascii?Q?60g06E+EQhljImiM1fSd2491ssf9VeBFSx6ebuKbiPoEtJYtxgw2PKM+to2d?=
 =?us-ascii?Q?PIIL9Z8YVHiydxQIM7OTIkjTwNYF41VRp+FtxySV+O+4B9LwKp7k80NlrVX5?=
 =?us-ascii?Q?PWW5IMdHRx3C28o/X06A+scbltFJbx56HwIEQ9TMGlTFl4e5a/pZDS9Yoq5c?=
 =?us-ascii?Q?Ow9zg/4yTJRrKnMUlAbVG3JlhMfowzuuN4dSArDICth+EKjwz4iT3IHnHQoP?=
 =?us-ascii?Q?4DI8QZBIlra7zh7saJdYCQYKzfdcJDfSasPrCLmLn98mKNBXDF4kqOIE6Ofy?=
 =?us-ascii?Q?d2KnUWedwk55HPNf3pZrcp7xMQmWWrI6b3ZFhabWb2Fw+QJEm1BJDKC7r+Y/?=
 =?us-ascii?Q?XZmvu1xGaQUQ8NwTYAqrF4u/dAwfMurZCXvNT/ABKCeeZxW+VEJEtHvxEyLs?=
 =?us-ascii?Q?sJF5eMC0zh/kaiHDwC5B3f/P6/Uv/RV0R9EFE0OTMT9Gr0nvQkVvTBfheUSG?=
 =?us-ascii?Q?r91I4mLgGmNaQ3n41/vWl1cGt9TM9jYy9PBB7C1qHGnvLOwNND6L7IRFf0Qi?=
 =?us-ascii?Q?flpHT8lYJ6cFgfjW8AEXj7AsSGkpvhoWprWZWAGOiT/gmsk4bkJH/7fkA0R0?=
 =?us-ascii?Q?EiVqFzTS9n7VYC7XuApVM+Bq7gky1cBgTrhfLp2vyFEDrRkIP0unhqY+CNDU?=
 =?us-ascii?Q?CzjSj7OE/pXDPgm6okP/jRiAydEWMzDbOA8/1mPExbPnoFQ4w9PcKqdbt7SX?=
 =?us-ascii?Q?8GJOZJ4CZjo4TBjWgWl0pjuEgMR4iO+HFtimm101X7cQOBRoIiE8M+eY8Obn?=
 =?us-ascii?Q?K4YVnrvg9BQh/txT9g3k4w5UxXw5rlFNjVHcR0y7jhBlamK1RzZuErzVwayS?=
 =?us-ascii?Q?mk+9mnP+IM++LzSLcYACzGN4Dy48Yrnx17kH3/UGnU+gngWxXpNauHjR7p6G?=
 =?us-ascii?Q?P+Ebo4mmyLWRckkDosg/M52HvcRfM32NpqvB+MBU0ZMKgptJ0wDlsBs7ChIs?=
 =?us-ascii?Q?KZHqWHDuxbCIZynjUev55c01OjrU3dpU1Hk1prKijU5P8MidIgyqC91+Q+uB?=
 =?us-ascii?Q?fpkkP7As2TnYsJLtnYRKiHuwm03iMGBLktyCiunFxmEYi6Jpze1BH2WHZYJ8?=
 =?us-ascii?Q?AFBOK1qlepBo69/pbDULsxvoRHiaff9cL9xf8IQknWGK8vESwPviIMjlghNs?=
 =?us-ascii?Q?qwAu2udAELf0ofRX6PD6LD725fGjBNmwvKR24GRe16hi0bzW5vO1b2k/9sai?=
 =?us-ascii?Q?XoNF56eAaIPzsi4royn7gX58Ums7I19rQfNVg+2Ib9whbkLZnIwB2jtiEmbJ?=
 =?us-ascii?Q?2VA3K/AkDFlxRJl27c2wT57fgOpF5U/Yy2k9c2L9206+ToOIjVW1dmJfkcfa?=
 =?us-ascii?Q?qk5kf6s6cmPSRucssn6n56P+koZrqugvBHZjDBdNbEp/ogkBULGW0LqkjE51?=
X-MS-Exchange-AntiSpam-MessageData-1: xj5oh16zitQwAA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41309569-9d72-4077-3c6e-08df284f3d03
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 10:54:50.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3kRg7fzuggS6Nx2vDvoNO+Cy9sgfwMNXPuU1yk1B1MTAMiWjic7cvuaobH1knIIBhXi4dhwVL3obtk51sLozA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5203

Hi Gjorgji, Bryan,

I have now run this series on RB3 Gen2 (QCS6490 / SC7280) against
next-20261009 rather than our vendor branch, so these results apply to
the tree you are submitting against. Four findings, two of them things
you cannot see without this hardware.

1) Only 1/8 needs rebasing; 2/8 to 8/8 apply unchanged.

   The CSIPHY ops split is the conflict Bryan reported. Resolution as in
   my earlier reply: a second ops table carrying the legacy core ops, and
   the lane enable/disable dispatched on camss->legacy_phy.

   This is not optional for SC7280. With a debug print at probe:

     qcom-camss acb3000.isp: streams_enable=1 legacy_phy=1 version=4

   SC7280 has no camss child node named "phy", so
   camss_detect_legacy_phy() puts it in legacy mode. Without the
   dispatch the lanes are driven through the generic PHY path that this
   platform does not have.

2) 4/8 no longer builds. v4l2_subdev_pad_ops::set_fmt has gained a
   const struct v4l2_subdev_client_info * parameter, so
   csid_streams_set_format() fails with
   -Werror=incompatible-pointer-types.

3) The CSID pad-link guard cannot be dropped.

   Gjorgji, you suggested my "Do not link CSID source pads the CSID does
   not have" would probably go away in v2. It cannot: without it camss
   does not probe at all on SC7280.

     WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
     qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
     qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

   Note the pad count in 4/8 is

     num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;

   which depends on lite-ness, not on streams_enable. So this hits every
   platform that links all CSIDs to all VFEs as soon as the series is
   applied, whether or not the streams API is enabled for it. My own
   commit message was wrong to describe it as a streams-API consequence.
   Confirmed on the board: csid0-2 register 4 pads, csid3-4 (lite) 5.

4) With the guard applied, the series works.

     msm_csiphy0-4: flags=0x14  (FL_STREAMS | FL_HAS_DEVNODE)
     msm_csid0-4:   flags=0x1c  (FL_STREAMS | FL_HAS_EVENTS | FL_HAS_DEVNODE)

   Routing through the streams API, imx577 -> csiphy3 -> csid0 ->
   vfe0_rdi0, all SRGGB10_1X10/4056x3040:

     msm_csiphy3  routes: 0/0 -> 1/0 [ACTIVE]
     msm_csid0    routes: 0/0 -> 1/0 [ACTIVE]

   and 10 frames captured off /dev/video0 at 4056x3040 pRAA
   (15418880 bytes each, 5072 bytes per line), with real sensor content.

One thing worth flagging for anyone else testing this: the streams uAPI
is gated at compile time by

  static bool v4l2_subdev_enable_streams_api;

in drivers/media/v4l2-core/v4l2-subdev.c. Until that is set to true,
VIDIOC_SUBDEV_QUERYCAP strips V4L2_SUBDEV_CAP_STREAMS and the routing
ioctls return early, so media-ctl reports no routes and v4l2-ctl says
"Streams API not supported" even though the subdevs have
V4L2_SUBDEV_FL_STREAMS set. I lost a while to that before realising the
driver was fine and only the uAPI was hidden.

Bryan, the SoC-level change you asked for is in and tested: streams_enable
on struct camss_resources, read as camss->res->streams_enable by the
three subdevs. SM8250 goes from fourteen assignments to one, SC7280 to a
single line.

I can post the four patches (set_fmt fix, SoC-level flag, SC7280 enable,
CSID pad guard) on top of this series, or Gjorgji can fold them into v2 -
whichever you prefer.

Still to do on my side: the two-camera case with the MAX9296A, which needs
our GMSL board DT ported onto the upstream rb3gen2 files; the result above
is the on-board IMX577 only. I will follow up with that.

Tested-by: Hitesh Patel <hitesh@ebytelogic.com>  # SC7280, single camera

---
Hitesh
