Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.95
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590616;
	b=gC517MggI5DjM31/YvQQVPFEOvuAUczdbs3nYTOn+s5Jhf0PZNBBy1Ak5qTUThGAhJDE
	 Q8dFrKd7xNRKUGUuXllOujIjbO7j6LqhYQbrlYGMsMXfxNCtmE44ZmixHHOpiiCtc7Fd5
	 vfA+mBbNp+F163J0ptHgaRoakjptznwGnmxcBnFA2I+SFjOTeS4OyLNZ4voaVfimJQbQs
	 Oj+jpOOGEuPbmUrtexxqWJlKfqg/+9hzYn2Ld2kjg7VkpKLcMUp0PjH8pBZ3iFFLNK8QA
	 pE3u7rs0DPz1vZGSUjlBw9M51tm6O555AeHA3W4zMCXQuAfhq3bumVEB5Hdv9KraLwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590616;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
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
	bh=SHE/3vQx5z7osyfKjB5MHvcPAtkF4ZG+iyv2y48AVLs=;
	b=fb/WR8MDCHkgAVZrGKc5GJ6vMr/6czH3PIWxHWkjk9E1iKsaAkizDNq9AvblkN+piWwK
	 ZL4WQXLd4WAI0pbZsxfpn8cRn/xwe/TnxhguR2nEjrRrzk2oDjIwFsfz0J4D5U/2rIJnf
	 RI/Rta3RyPn0k0qf7iGWMa6XE4R+kHe489ahrh/KMExPD6xw5khFUEcirtf79OjCKWPnJ
	 LVpX4PQwzmWaFM2xzPiMe+MNwmfqLINE8IEGIPNi+t8B6Z8KB9cEinckeMgfsi+77ygTI
	 FzB6ru+ee2/j20pJLwE6VA2Chv9L1mBz3c9OpjY/v8mjjIGaWWLBLMsHjEUEuGug3LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.95
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021095.outbound.protection.outlook.com [40.107.57.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF6606A320;
	Wed, 21 Oct 2026 13:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2BF6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCpDaoA+VdcLbx++k0FEW4XhbzaWaSzSloUXJkI29awTUqBI1Jedz61pg/V7y9JyQ5MyKDL0lzVuEjPHqWgdMmHCnNjyhrK2NjBy1GrToRtLa0IJZ6KAI617zdTTDUNju/Nx0ANo4sVKBLbErH4M8QZYgs65KG9LKR1GHwaif67sEMpnSvNPZ7s6nzF1CWf3XG+a7DQ2phpmd1X4N8VvAHUjWczDOMsbtBD2poGPO5jOxrLLXtQegfloB099olSh/52WEase8mLTfZWvtwYuDWciwZZt29DtUIZX0ctYcEhiSjsPhLD839mb48oFiI8J0qfqD6yt+7ZQoWdKEq/Rqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHE/3vQx5z7osyfKjB5MHvcPAtkF4ZG+iyv2y48AVLs=;
 b=PtM30YZPLcf7bPFsmAn0c+V6jjoeKM45RJT4zCluyOxoLCw47Bdr+VdiiPvez4YJnHblXyGSS/A2kZ2lFKwDKxHcXQkPPTyPvZbKFYsu3WkrqHYsDlljJoO0/jhkCyxoBWQ0YzRq1KEYlWTUi/EERauKAvnqk7wwyRrWSPw7+DmlDvuG0B7w+MubhAX2IyRCZUGANBLQkxhz4iEIeNmMMXWKUaiRIRECs3alHjVAcWoxUnQtU60XShMZW2lIGh8n+ZIdrl1XXtcHgmMALUth5Wz6vef9UtiY8rTme7REOxXdDam0E30PIzewYkW9mF8PyIJ4ghVpM1kCbekBNHXgDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4699.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:196::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.20; Wed, 21 Oct
 2026 13:50:11 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 13:50:10 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v6 0/4] media: qcom: camss: rebase fixes and SC7280 enablement for the streams API
Date: Wed, 21 Oct 2026 19:19:55 +0530
Message-ID: <20261021134959.2599575-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: 9815342b-dd55-4907-d9fe-08df2f7a395b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|52116014|376014|260925021911599003|260925021311599003|260925022911599003|56012099006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JDezSUXK/xNu7jRmM5HpjZqAja0MWoEnTCQaGFyJy8GuMYAMSjz0KWqqZVui50e0MArZG2kbp/QZFxujQ+Xjr+cWhTO3PFQiXJZdISmXNOrlRt8lYbmRtOm2maAgJPt0nbyZGFKyKe/cdKPgjqz7E1tdW69eUOe8BXXBLIRzVUSxTd2X41Q+xg2IdUkqBnryQvlVyC0TSV4Y/xyqjVWZsymoLmXxFkcWLPFVvuqBeA1hfnLFG/Iie/My9OlQtgsUIoJsH3HcjUhKKOLMvNd+omzF/IfqHSLwJoauVn/+3yf5tgZTqf3KuZGRJtmo+m0jBA39G+p2+gKxk3G+OdTylfv8fVk/YegooGRl1YpVrbrqtxmLhLmu72pSSg6E0tb1bPX12VJseBmUPRAyxqsJbT7cqQdRYsWhP4T3p7eM/2hi0TyeVQUkWw5XVpifLO0/Cx5ddUdWJ2fGFbhq61t9pZ1LrkNE2hm57PMEckmkr4wKFFoSRvM2U+0duRm6hyTXEHsOrrXKeJ0CIYUB9FKac+Yu3G9rqK7BgDx5hthH+gUvcwC1LpdA7xOP+oX339YxP6JskIAIVbhDlwwu/2209nt/m3MAKr586GmSHGuVPPC2ti7a8GUtKv+IjOkBPKDd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(52116014)(376014)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O2GSQwfzCbiDqWdwUJOpeIJW56uMevW/XGdbmWt/JsA/lp3yXW3FBmuQExdf?=
 =?us-ascii?Q?vGOs5RgtcsbvCP8FXr4VL5PwPGA3z27DgfaxsMMbexVqFTZ5RY0f+ivI6Wuz?=
 =?us-ascii?Q?m9tp+KJJRQXlLeGeacbA21oPWfjCgTu7R6BQnOsi0Fhxuz13Wv6nA4zOiRE1?=
 =?us-ascii?Q?iGKQLRSzf/9D83uKzOFup2dkSdU5ZycAM90ZyhoNrzbZX49w2LXMDyRuLMaf?=
 =?us-ascii?Q?dnamaCftFziLg293/7W9tAswywo84aBTuFBpuzjXwFX/aZdmPmmOGwQxR61e?=
 =?us-ascii?Q?bRcheS0w5QZt6F7bW9NVS+BhgJjo01iNnGLBqg26TZ9i67AKH9ZuzHEDv7+w?=
 =?us-ascii?Q?aeLY1TNPoJQaFf3Xmf9TgRipjQOVEvIVbqltWCxZeAZlR7+E0Qyfqs0gFWk8?=
 =?us-ascii?Q?Url+0Kap5MOilGyzjWBdWP/T9uHi0xxedyadnYCnxZi+rqlzBuLNVMevTnvG?=
 =?us-ascii?Q?Ea1ADQOlpEowopRb7yxblCaRvYUi4zoFqihpjRPFnOJsOYNks6x+hIioRQst?=
 =?us-ascii?Q?PDuer8kStYULDZEGyebGW6JnCCUV9IFd9usI2qipuI5OXmRDFbFCUCaHI1p3?=
 =?us-ascii?Q?HUD8/DCgtXcXEEWGrOvqruMwEEr0U3JisGz7pHAGeqyFAPKKeMQBzcsqlxO9?=
 =?us-ascii?Q?2LzEtwQt/qvSaS1qQ8i9UeTKEYlWgkKRu0da/JZQ3LpnZzkzMNeyJySGs809?=
 =?us-ascii?Q?gGhbxMw/X+wYrMJFlacAd3e9JqJ338OHNYavU73P/lLvbPiIH7rjHYzD9INJ?=
 =?us-ascii?Q?VT3Sl6+iKPCV9ZzkfO1gGauQlWnh8DUOnKqhH2p1v3P0tZvP1rBCHbzj1X8Z?=
 =?us-ascii?Q?/5etoNkpYxOZaI8EvQbccPOYpcllzxg8nfB6DAo/1svCLCbR9HIkzFqW7OJg?=
 =?us-ascii?Q?27jEoQOZMMDQK5i6crzTkU65tEGl5XWYajW7u3PsBBJ4STPa3ZTvYT+4C2Ux?=
 =?us-ascii?Q?3bHW9F/wU6acmt4AuqKkGWGShYA1fhxRS9ksRUIrdKTsst29TRMTiOKT2HWS?=
 =?us-ascii?Q?YbbrtMORXQmFg7eHa0N84G6i06LtH2/KtwaXwvOlkFn+r2JqR3x+T9q1EBWo?=
 =?us-ascii?Q?aQqYG2kyCpbFVvXOSHFlNB/9IUD3RSSbngfNbovnzf75xX1ge/H7m+f/T1IO?=
 =?us-ascii?Q?a/8dcU90M74F4tZjD9fNXCpg6JaOdaBqtwdtdJqmgvRHfYfLJuWXrbVp3Uvt?=
 =?us-ascii?Q?/TQbNDv7szmQu8NtPVp4eagMEdElLcyAP9OBbUaYjYnORwPGiG4HzW9CMffi?=
 =?us-ascii?Q?38oqtuBMWa948XKsCTB6JMJQqrtdS4+r3H9cOfpHNwib4NqnDm0DomUco0ex?=
 =?us-ascii?Q?AUh8sTYT6GO8HLN0irup5JB31rdPprlvH+YRnmT61GkQvJPrrT7MXOLQb1/1?=
 =?us-ascii?Q?8y6TfYAyM5tXXDZWDhhLg7bWahrVSebibhkKHtKc2T4lk2vQH3DwQPjDn2Y7?=
 =?us-ascii?Q?0QJ2OicazWHco0fjvrvDOVQNb3+DJTU7TLD9IO+g8/uooB1KayoCc4kc46kD?=
 =?us-ascii?Q?0HUlEaRVVluvultroQG3UhWzq3KOyGd523y/2fGYGv72XX0AkYYcgEzpRqUE?=
 =?us-ascii?Q?kDLerxDM2m2x0cNtgCYexIem3RIm9yPBkCYkS23er4FG4MVBM8N53+7vXNBJ?=
 =?us-ascii?Q?lzKGoInM6lZ7vtWlMadxHZoD40BBFEwWJ+S3t+cX7UD8ZhY76BJY6ntA6oT2?=
 =?us-ascii?Q?g17kBjdQ50Ggzo+dhXXH4WwNHRK3039D7nUDL1dE3tm5wIRCM3yL4Gcuu/DQ?=
 =?us-ascii?Q?+ZcQFpP3ICIUDxOL4OPwOvzELshL36dUYTaAaeV+Z42YlR91fdqQMSadXO6K?=
X-MS-Exchange-AntiSpam-MessageData-1: ti1O262qin1+5w==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9815342b-dd55-4907-d9fe-08df2f7a395b
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:50:10.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSuLGN1aTy0U3Y3JkFdrM6vcCoVNccjfZ4Oy1eEyFieL4o1fHxGPj2e3jW+NXQvPYah1Kgr3myOgu8J70EqOfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4699

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

Tested on RB3 Gen 2 (QCS6490 / SC7280) against next-20261009 (the v5
base). The v6 rebase onto next-20261020 leaves all four patches
byte-identical and has not been re-run on hardware:

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

v6: No code change from v5. Reposted carrying base-commit and
    prerequisite-patch-id trailers, which v4 and v5 lost, so that b4
    and the Media CI can apply the series on top of Gjorgji's eight
    patches instead of failing against a plain linux-next. Rebased
    onto next-20261020; all four patches are unchanged by the rebase.
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
  media: qcom: camss: Do not link CSID source pads the CSID does not
    have

 .../media/platform/qcom/camss/camss-csid.c    |  3 ++-
 .../media/platform/qcom/camss/camss-csid.h    |  1 -
 .../media/platform/qcom/camss/camss-csiphy.c  |  6 ++++--
 .../media/platform/qcom/camss/camss-csiphy.h  |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c | 14 ++++++++------
 drivers/media/platform/qcom/camss/camss-vfe.h |  1 -
 drivers/media/platform/qcom/camss/camss.c     | 19 +++++--------------
 drivers/media/platform/qcom/camss/camss.h     |  2 ++
 8 files changed, 21 insertions(+), 26 deletions(-)


base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
prerequisite-patch-id: 4214ff31c7bfc998d477ae38e7bca2dbc5060b5c
prerequisite-patch-id: 5bc4256f5642555995e05c50f38edbb41d4d3212
prerequisite-patch-id: d0bf82158d99863344c206a543d3e381b24a3b51
prerequisite-patch-id: ddffbfdffba948a608fc556a5ca81b9dabae7e00
prerequisite-patch-id: dca159c5eecf280ea7ce7c67f5da2364c8449759
prerequisite-patch-id: 220ee607579892058879cad0ed9344f6696313c8
prerequisite-patch-id: d7665451d090c8d4684c79736ac517d6c7ddc1fc
prerequisite-patch-id: f297c801f0254862e4fc8440dbd27473a8b78159
-- 
2.43.0

