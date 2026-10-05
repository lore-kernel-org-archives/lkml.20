Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B9E79CD;
	Mon,  5 Oct 2026 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222158; cv=fail; b=NsFYlDYrg6VJHWxkQZJBYbWFlRZ56jZ0B2PbV1YazPX7b0Ys6HrmHjNsmmf6p4ijNpWjzYUYh0Fr0J+6PIdBeW1BBqlc5kULV36YvImai+AVg5DUMj5fhLgvIqfjhPN2xcj5Y54oZ4fpeNho+0eWDOaDcXoBaTa5Jj/B6fep23w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222158; c=relaxed/simple;
	bh=HjdhEfmRnt7Q4/UZrLeMCzqWI9C8/fl2CUrU3UNxp0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O+PL989GQN5ZkPcrC0qzZX1U9s6v5IQObaCtawNvs5dXeTskeDOJoSjOap3ggGG+kycczd+zZr6ERVJhXqVDpQQ+aJa0IsrmhdWLCH3mZngNIhYeJcVWTRtZ11KPdbCKkuor4Q0dbI3cSfzL8VQ2/MhHihGYR0m606a6JABOsew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CAqV0Pyj; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CAqV0Pyj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sE6IMVtvwRiPqt/da3vhNcNLzckiWh90EYYOd7NZ4BirMbu8mxzl3kjst/GTSFZ0i+9//YGPnaKwXC09cvaj8jRQCTDKObZU4PlhBAaLF/G13VvsB/b17kGm/aNE/RY93yIGNRN5wXy+8ZBBFAeuBSYSbVOCxUHEkmjOpqVqmSkuvLfYwKCvZWWbw3DnTWmWB+YETZIdjLF8Dic9qwP6PJVl6X4LoACZxc/RAicih4OXwMxa4EJ3RfR/oH4DOiosGYrkaFYovWgFswjZSxDNK3EthZCgkB242npOqS4XmgEAdakgWuZhg/C9eZPMQj7qnCTAN9ltUHbR3xc6AepRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cwteUwZ6OxVnrkuKoc2HTYA38NP+dnrbZ6cFOHUmBQ=;
 b=Bt3/GqnGgpR8vpdx+ILVqGr3mUILwv77H48arDRqIQNZv02Xv5EAlVvYCiM3n/DxFEw/Sh4zu1bz1z3+0to17uj/1r/UHn9P2KRtqkfvDmwAMDL6uAj3qbNa9xx65kbdYKpWbH2/JzCjLMCvP5KWPYJMjLiuPEjeu1pXttPS0sqFKny+WflSk/FO9QdYgeffNL1BQ5VUeZkALBr/DP+dhnZTdZbFVCQC408zRdEBkedJrbLh30CDxjQI1tq97xjM7QSbJrEm+bxEEAK0a+p5sxYke3QPBBWz6UrWKhndb3FxgxvUoB2Y1ZE6xhDKwrJAsU2jgwpfQBCHLIx16YLtrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cwteUwZ6OxVnrkuKoc2HTYA38NP+dnrbZ6cFOHUmBQ=;
 b=CAqV0PyjySMkUqnjYVb83SETKcr3Fsnforyl1vhlEETHtakAlC/zZ+Yo+nx9gK/YC5VXw8Bczkur/WLF/1EpxLmnpch5PcXmWJam8OqUtBochTc97B3W4UcOx3Y32tffMhVKpMiHqyu77TEg+ogrGP4Egbyd+lOv+u420blg5Bz9UtqmldIEnJBZJp7UgSP2ds1JHbcv+hB2ieSmvOXe2JY9dBedn+Mz13mtc0UJh6S6d4eMS9NdJx8ReDRj1RzVP6YvhKSVHmBUEbf1AkJWP/XAF1gG7Ny0dhqLfJCpFzYEjoqkaGIMxeUBlQyKb6HRWV7c/uIp2Vh+KK58Zi2mcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 5 Oct
 2026 17:42:22 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:42:22 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	r-donadkar@ti.com,
	jai.luthra@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	johannes.goede@oss.qualcomm.com,
	dave.stevenson@raspberrypi.com,
	devicetree@vger.kernel.org,
	robert.chiras@nxp.com,
	tomas.babinec@nxp.com,
	daniel.baluta@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v5 4/4] media: ox05b1s: Add support for Omnivision OS08A20 raw sensor
Date: Mon,  5 Oct 2026 20:51:02 +0300
Message-ID: <20261005175102.2358881-5-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
References: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0115.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::12) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ce7584-0e73-4ac0-673c-08df230802f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|23010399003|6133799003|56012099006|10067099003|11063799006|3023799007|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Nbw3kzsZXSh5nM97g9T27LV1PCHvwJe4bDZwE57YDrx0Xae2AcpbrIMWolTfpwgiF8An4UOT9Uj+FqGKjuotxtt2xewdxYS36rt/3ARi1hyU00Qt35aZqv7DPQPR7lcEYHR8Q3lqiOaTz9L5c1AHDU6pDZH1tJ1NS6Yt2vXFAcDjjLJ8SarzeDCPG3xcoICjk/11Tl7BXjRrGvfRKDUMhkjZv1rsisszvQ21//4QYKHfALqHTgfM6s+iwE3PkEWnTDAhjTmk1NQB0zizb3Cu9T46yjGCqh2raNC4lvTpY0tNnMhK9LQtUqJaBtJMxwpp5VJkCwY+1bEDQEeJSX7Gkzsu5P15axwtPy1s0YjGlG5TNEdz+CLAM3pSfFY7wi1Qtc+lXbGFWrwQH+280hYlKgJbGz7qStJpY3kYk8Q19GKA5qm11tYFJwzoufZMcyAkdKvfmacugDRxZxAHNwdtBB5P2V9yWVtirzh8NRLdHtKCm6TetC2nEa1juigNZ9Btb1307xTDgsmgJVzprYqmRbyZ5ludRKu920hSe0dut1cJQHs0zodwwoRB0ocmADmSfl5C0zc2KK2oqQI8YEFu8ezLE5JbINFNfC6AOdX5ZjWSG9eLdtxB1uvmKdS8wbEC0O/jA845Wm04Ho+dW1d4ksUsvO7gwiTa4Ew5dngG80a2uZ7PDnD6KehJiCxk4KVreDHG4opkk9Mj9QuhikIA9Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p+fLEEKm6VTKM/hCqMWbPC+yAXrqAjXoHsi0cgzCo+2lTmGiOpWoz4tRRahf?=
 =?us-ascii?Q?QX0/eW+4rURk/bk4XKPrqeZfj2l52HIejcZ03D5mHXPmmfxFAIC+tg3dM1tZ?=
 =?us-ascii?Q?50EwFLZvz2Kjg44xQUwm9vY8LbfWZe4pLRlFhk14hrcOD1o9VVQDx3BIcOWV?=
 =?us-ascii?Q?UT0WLBOQcD4X2khRRxiOZLwk/EiEaaXsl6UWL4SYgbwOuH0ebsOnUzLNm6Ws?=
 =?us-ascii?Q?c8UGaRf4on+xxwiCa1U3IRrHDtMChzOE93VSFB9X40QoL99k+MRDrsy6sVSc?=
 =?us-ascii?Q?/9nkfJZsZ4pYtoIHk5KZQEBNgL93DgwD3DGOZNJmhCtKLLrcpWlvfrVWh63r?=
 =?us-ascii?Q?ZV5yceT1e0T0EFt4KyxSA95QpZOogfcbUob5H5Z2pTa04132Qz666lMNcJmf?=
 =?us-ascii?Q?DrVd+NIE6sNf3jlN/vLqF46VSqEuITgp63dq4BUQCROvzsLapIC90fAXtAKQ?=
 =?us-ascii?Q?QpnTEiwoodl+xrSBS2h0O3aQFGO2ruK+txHXSrkGQ3d0vKwnHD4g3sRNlShi?=
 =?us-ascii?Q?je4mycT5YEHch01seq7NwMzT1LbnPuzkq+FNWneTe62M8Nnz2jPjO8gcwa2r?=
 =?us-ascii?Q?psx2SfOpIjvUSUlpcj3tHsI8L5IiNl2ipgPnhbOD5SQ7+Zb25/kmq/Or94OO?=
 =?us-ascii?Q?iVBaRu0hRAvgSGd3+e27F951FK6p1SBz8dPkEjutAf1jEom/tQguk16QYdqx?=
 =?us-ascii?Q?yJSq/CNT+zBBwk6crdDZt/efr1W9rfYI3dFQSofXsvdnqM1U6xJziXuvtVsr?=
 =?us-ascii?Q?095IAf3avX0DW/TsI+nb4X7NWeQvdIPgrJ5SOzC/q4EGb16j8Ni5hLx0HpcP?=
 =?us-ascii?Q?2JGrdY90ZOK1FMAIR4a1ovkgQdOnUzLMtbG3PDjvkRgKKhqsk6HcrNpHURUi?=
 =?us-ascii?Q?YKoGVTbHGWNsd9Bl/UCQHlPWyOSX28cVwibWVNHwmQg2kE4XoMqKQqouxtPW?=
 =?us-ascii?Q?RlZLnsStGPYkGFVLXCRLKNO8gmno4teR2nJJHxvK8OWaBJ2K+h1WpUOp5ooq?=
 =?us-ascii?Q?445K4+nCw+xrzycYgDdGmLmXXbnarmZFvMxPzalXuiGCgLmYtCg5aPmlqG2u?=
 =?us-ascii?Q?FKMQpSB2ZwDSSGiSuMUmKKVkFlcdSlk8d1VhANub7odaS1GsWvKBoBktWDlZ?=
 =?us-ascii?Q?r2tpp51hBnQMzFwLb2+nG7pCtwwWcZeroPP2p67N0VOdoBmIPPdzhLeypSm1?=
 =?us-ascii?Q?Ex6VrsZ6du1EqidzBam1AJJgs7g422QJPX88bZQQQ77UXdGnlU3xR/vzQ68B?=
 =?us-ascii?Q?g6qHGp8JbdoCBnbSueCVmf7dga8BG7sTYlCWBa8w0Suo0ZLUkW6/Q4DPhCBT?=
 =?us-ascii?Q?JiKeel5QmByWNY9I6MILnZwBi1HKgeLOQDB4Yzmx8z2gWdHk0cl1MYa2Tw+X?=
 =?us-ascii?Q?H/hRapSPQ/G6YYEiybXczajbsKTd3uZRxHhNK12M79SDuCd59/Q21wr3cLkU?=
 =?us-ascii?Q?/6wuVsQJFZwDx1u2cre6Ruk+djUyY7+/VRzW44daHKiPY+oITUVOIiORst6o?=
 =?us-ascii?Q?NNopI2G+lP9eHGYDIyf5xaIpnfXzTy786/HO+WPqQ/CF1GlpDHKwHxwkSKae?=
 =?us-ascii?Q?BXQ0kjigXTpWFGXlvHtGb4KKyh/+x//EiiH5LLHRuFEJw033xXK1U89XUOYI?=
 =?us-ascii?Q?am225MsX2smpg2fE08vVuWPv8ZDeo3OBP+YmbyvGp1QU0yRJ6kQQDF6sFgfX?=
 =?us-ascii?Q?/X4uzD3Ihx8gTx4fQ7XNJ4fFw9k0gzkVPu05haXDYnRbLWd6qrYm5Ofc3IHu?=
 =?us-ascii?Q?TuDWKfd2Qg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ce7584-0e73-4ac0-673c-08df230802f3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 17:42:22.7976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlZFIATRfLWB48knKhDa+RbUIr1EilpHpjS3O2Y4cSanswhIfO9qJ+hq9gjBOrut+l3Nk55GKuW16WsoQYVxew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

This is an 8 megapixel raw10/raw12 sensor with HDR capabilities.
HDR mode control is supported, with one HDR mode: staggered HDR
with 2 exposures on separate virtual channels. However, for now,
only one exposure (VC 0) is accessible via get_frame_desc.

Supported resolutions:
   - 1920 x 1080 SBGGR10 (@60fps with no HDR)
   - 3840 x 2160 SBGGR12 (@30fps with no HDR)
   - 3840 x 2160 SBGGR10 (@30fps with no HDR)

When HDR mode is enabled, fps drops to half.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v5:
	- Use cci_reg_sequence and CCI_REG8/16/24 macros all over (remove ox05b1s_reg).
	- Use cci_update_bits instead of regmap_update_bits
	- Go back to previous vts/hts settings for os08a20 1080p mode (changed in a
	previous version to get exactly 60 fps for this mode), instead restore
	another pll register that was removed, also in an earlier cleanup, in the end
	fps remains at 60 fps.
	- Also restore 0x3797 register setting, long to short distance mode due to
	regression, dark frames without it
	- Add back the commas after the last field of a structure (except for sentinels)
	- Add back some registers in the initial configuration lists that were
	cleaned up in v2 and later on found it was causing various problems
		BLC_CTRL08 and BLC_CTRL09 - washed out image in os08a20 1080p mode
		0x305 - image flickering and distortion only on some os08a20 sensors
		0x4050(zl_start), 0x4051(zl_end) - distorted colors on some OS08A20 sensors
	- Add define for OS08A20_CHIP_ID
	- Switch back to BGGR, until generic raw formats are merged
	- Add t1+t2 timing info for os08a20
	- Fix "bining" typo
	- Fix os08a20 4k 12bit HDR mode, only first frames were captured correctly for
	both VC0 and VC1). Use the same HTS and VTS values as for 4k 10bit mode, which works
	well even with HDR enabled
	- Get the number of MIPI data lanes from DT, since this is a board configuration property,
	and program the sensor registers accordingly, before streaming. Restrict to 4 datalanes for now,
	as not all modes are possible with 2 datalanes, at current data rates.
	- Do not hardcode one link_frequency, add one per mode
Changes in v4:
	Switch to Y media bus codes. The CFA pattern control will be implemented when patches get merged, or maybe separatelly as RFC?
	Add pixel_rate member to mode struct, remove fps member. We do not have information how to calculate the pixel rate from the PLL parameters that can be made public.
	Use register macros for the registers that are documented. User register group macros, where individual registers are not documented
	Constify more structs
	Remove some unneded ending commas after a terminator
	Fix a seeries of smatch warnings like: warning: symbol 'os08a20_init_setting_common' was not declared. Should it be static?
	Shorten some more lines to 80 columns

Changes in v3:
	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
	Use const for os08a20_supported_modes	
	os08a20 register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
	Let the 4k 10bit mode by default without hdr, all 3 modes are now by default without hdr, staggered hdr may be enabled via v4l2-ctl for any of them.
	Separate the 10/12 bit register settings into separate lists: os08a20_init_setting_10bit, os08a20_init_setting_12bit
	Update commit description: rearrange supported resolutions and remove 1 duplicate line, state HDR limitation
	Increase a bit the default vts for 1080p, to get exactly 60fps, it was 62.61
	Use regmap_update_bits() directly and remove ox05b1s_regmap_update_bits()

Changes in v2:
	Add spaces inside brackets, wrap lines to 80
	Remove some redundant initialization
	Use a loop in os08a20_enable_staggered_hdr/os08a20_disable_staggered_hdr, for that, add a register settings array for HDR enabling/disabling
	Make "sizes" a pointer
	Remove mode headers, add supported modes in the dedicated c file, ox05b1s_modes.c 
	Refactor register lists, for os08a20 use a common list for all modes, and also specific lists per mode

 drivers/media/i2c/ox05b1s/ox05b1s.h       |   4 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 214 +++++++++++++++++++++-
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c | 136 ++++++++++++++
 3 files changed, 353 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05b1s/ox05b1s.h
index f00ee1f2e78b..c4d3d1f435bf 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s.h
+++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
@@ -14,6 +14,10 @@ struct ox05b1s_reglist {
 	unsigned int count;
 };
 
+extern const struct ox05b1s_reglist os08a20_reglist_4k_10b[];
+extern const struct ox05b1s_reglist os08a20_reglist_4k_12b[];
+extern const struct ox05b1s_reglist os08a20_reglist_1080p_10b[];
+
 extern const struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
 
 #endif /* OX05B1S_H */
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
index 45d38dc836e6..d2ddda62e095 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
@@ -22,6 +22,7 @@
 #define OX05B1S_SENS_PAD_SOURCE	0
 #define OX05B1S_SENS_PADS_NUM	1
 #define OX05B1S_CHIP_ID 0x580542
+#define OS08A20_CHIP_ID 0x530841
 
 #define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
 #define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
@@ -36,6 +37,8 @@
 #define OX05B1S_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
 #define OX05B1S_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
 
+#define OS08A20_REG_MIPI_SC		CCI_REG8(0x3012)
+
 #define client_to_ox05b1s(client)\
 	container_of(i2c_get_clientdata(client), struct ox05b1s, subdev)
 
@@ -44,6 +47,7 @@ struct ox05b1s_sizes {
 	const struct v4l2_area *sizes;
 };
 
+struct ox05b1s;
 struct ox05b1s_plat_data {
 	char				name[20];
 	u32				chip_id;
@@ -56,6 +60,9 @@ struct ox05b1s_plat_data {
 	const struct ox05b1s_mode	*supported_modes;
 	u32				default_mode_index;
 	const struct ox05b1s_sizes	*supported_codes;
+	const char * const		*hdr_modes;
+	u32				hdr_modes_count;
+	int (*set_hdr_mode)(struct ox05b1s *sensor, u32 hdr_mode);
 };
 
 struct ox05b1s_ctrls {
@@ -66,6 +73,7 @@ struct ox05b1s_ctrls {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hdr_mode;
 };
 
 struct ox05b1s_mode {
@@ -107,6 +115,105 @@ struct ox05b1s {
 	u32 num_data_lanes; /* number of MIPI CSI-2 data lanes */
 };
 
+static const struct ox05b1s_mode os08a20_supported_modes[] = {
+	{
+		/* 1080p BGGR10, no hdr, 60fps
+		 * SA1_CLK=138MHz, link_freq=360MHz (720 Mbps/lane), 4 lanes
+		 * pixel_rate = 360M*2*4/10 = 288 MHz
+		 * hblank = HTS*pixel_rate/SA1_CLK - width = 1936*288M/138M - 1920 = 2120
+		 */
+		.index		= 0,
+		.width		= 1920,
+		.height		= 1080,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+		.vts		= 0x4a4,
+		.hts		= 0x790,
+		.exp		= 0x4a4 - 8,
+		.sa1_clk	= 138000000,
+		.link_freq	= 360000000,
+		.reg_data	= os08a20_reglist_1080p_10b,
+	},
+	{
+		/* 4k BGGR10, no hdr, 30fps
+		 * SA1_CLK=144MHz, link_freq=480MHz (960 Mbps/lane), 4 lanes
+		 * pixel_rate = 480M*2*4/10 = 384 MHz
+		 * hblank = HTS*pixel_rate/SA1_CLK - width = 2072*384M/144M - 3840 = 1685
+		 */
+		.index		= 1,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp		= 10,
+		.vts		= 0x90a,
+		.hts		= 0x818,
+		.exp		= 0x90a - 8,
+		.sa1_clk	= 144000000,
+		.link_freq	= 480000000,
+		.reg_data	= os08a20_reglist_4k_10b,
+	},
+	{
+		/* 4k BGGR12, no hdr, 30fps
+		 * SA1_CLK=142MHz, link_freq=480MHz (960 Mbps/lane), 4 lanes
+		 * pixel_rate = 480M*2*4/12 = 320 MHz
+		 * hblank = HTS*pixel_rate/SA1_CLK - width = 2072*320M/142M - 3840 = 829
+		 */
+		.index		= 2,
+		.width		= 3840,
+		.height		= 2160,
+		.code		= MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp		= 12,
+		.vts		= 0x90a,
+		.hts		= 0x818,
+		.exp		= 0x90a - 8,
+		.sa1_clk	= 142000000,
+		.link_freq	= 480000000,
+		.reg_data	= os08a20_reglist_4k_12b,
+	},
+	{
+		/* sentinel */
+	}
+};
+
+/* keep in sync with os08a20_supported_modes */
+static const struct v4l2_area os08a20_sbggr10_sizes[] = {
+	{
+		.width = 1920,
+		.height = 1080,
+	},
+	{
+		.width = 3840,
+		.height = 2160,
+	},
+	{
+		/* sentinel */
+	}
+};
+
+static const struct v4l2_area os08a20_sbggr12_sizes[] = {
+	{
+		.width = 3840,
+		.height = 2160,
+	},
+	{
+		/* sentinel */
+	}
+};
+
+static const struct ox05b1s_sizes os08a20_supported_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.sizes = os08a20_sbggr10_sizes,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.sizes = os08a20_sbggr12_sizes,
+	},
+	{
+		/* sentinel */
+	}
+};
+
 static const struct ox05b1s_mode ox05b1s_supported_modes[] = {
 	{
 		/* 5Mp GRBG10, 30fps
@@ -182,6 +289,7 @@ static int ox05b1s_power_on(struct ox05b1s *sensor)
 	/*
 	 * wait t1 + t2
 	 * t1 = 0.5 ms, t2 = 0.25 * XVCLK (6ms @24MHz) for OX05B1S
+	 * t1 = 5 ms, t2 = 8192 cycles (1.36 ms @6Mhz) for OS08A20
 	 */
 	fsleep(6500);
 
@@ -226,6 +334,58 @@ static int ox05b1s_runtime_resume(struct device *dev)
 	return ox05b1s_power_on(sensor);
 }
 
+static const char * const os08a20_hdr_modes[] = {
+	"NO HDR", /* No HDR, single exposure */
+	"HDR Staggered", /* Staggered HDR mode, 2 exposures on separate VC */
+};
+
+static const struct cci_reg_sequence os08a20_init_setting_hdr_en[] = {
+	{CCI_REG8(0x3661), BIT(0)}, /* CORE1[0] STG_HDR_ALIGN_EN */
+	{CCI_REG8(0x3821), BIT(5)}, /* FORMAT2[5] STG_HDR_EN */
+	{CCI_REG8(0x4813), BIT(3)}, /* MIPI_CTRL_13[3] */
+	{CCI_REG8(0x486e), BIT(2)}, /* MIPI_CTRL_6E[2] MIPI_VC_ENABLE */
+};
+
+static int os08a20_enable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		cci_update_bits(sensor->regmap,
+				os08a20_init_setting_hdr_en[i].reg,
+				os08a20_init_setting_hdr_en[i].val,
+				os08a20_init_setting_hdr_en[i].val, &ret);
+	}
+
+	return ret;
+}
+
+static int os08a20_disable_staggered_hdr(struct ox05b1s *sensor)
+{
+	int ret = 0;
+
+	for (int i = 0; i < ARRAY_SIZE(os08a20_init_setting_hdr_en); i++) {
+		cci_update_bits(sensor->regmap,
+				os08a20_init_setting_hdr_en[i].reg,
+				os08a20_init_setting_hdr_en[i].val,
+				0, &ret);
+	}
+
+	return ret;
+}
+
+static int os08a20_set_hdr_mode(struct ox05b1s *sensor, u32 hdr_mode)
+{
+	switch (hdr_mode) {
+	case 0:
+		return os08a20_disable_staggered_hdr(sensor);
+	case 1:
+		return os08a20_enable_staggered_hdr(sensor);
+	default:
+		return -EINVAL;
+	}
+}
+
 static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
 {
 	return &container_of(ctrl->handler, struct ox05b1s,
@@ -281,6 +441,12 @@ static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(sensor->regmap, OX05B1S_REG_EXPOSURE,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_HDR_SENSOR_MODE:
+		if (sensor->model->set_hdr_mode)
+			ret = sensor->model->set_hdr_mode(sensor, ctrl->val);
+		else
+			ret = -EINVAL;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -302,6 +468,8 @@ static const struct v4l2_ctrl_ops ox05b1s_ctrl_ops = {
  */
 static const s64 ox05b1s_csi2_link_freqs[] = {
 	320000000, /* OX05B1S 2592x1944 10b @30fps:  640 Mbps/lane */
+	360000000, /* OS08A20 1080p 10b @60fps:       720 Mbps/lane */
+	480000000, /* OS08A20 4K 10b @30fps, 4K 12b:  960 Mbps/lane */
 };
 
 static int ox05b1s_init_controls(struct ox05b1s *sensor)
@@ -356,6 +524,13 @@ static int ox05b1s_init_controls(struct ox05b1s *sensor)
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
 					0, 0xFFFF, 1, 0x80);
 
+	if (sensor->model->hdr_modes)
+		ctrls->hdr_mode = v4l2_ctrl_new_std_menu_items(hdl, ops, V4L2_CID_HDR_SENSOR_MODE,
+							       sensor->model->hdr_modes_count - 1,
+								0, 0, sensor->model->hdr_modes);
+	else
+		ctrls->hdr_mode = NULL;
+
 	if (hdl->error) {
 		ret = hdl->error;
 		goto free_ctrls;
@@ -565,6 +740,9 @@ static int ox05b1s_apply_mipi_num_lanes(struct ox05b1s *sensor)
 	u32 reg;
 
 	switch (sensor->model->chip_id) {
+	case OS08A20_CHIP_ID:
+		reg = OS08A20_REG_MIPI_SC;
+		break;
 	case OX05B1S_CHIP_ID:
 		reg = OX05B1S_REG_SC_CMMN_REG10;
 		break;
@@ -572,7 +750,7 @@ static int ox05b1s_apply_mipi_num_lanes(struct ox05b1s *sensor)
 		return -EINVAL;
 	}
 
-	/* Update only the lane count field */
+	/* Update only the lane count field, same position for OX05B1S/OS08A20 */
 	return cci_update_bits(sensor->regmap, reg,
 			       OX05B1S_MIPI_NLANE_MASK,
 			       sensor->num_data_lanes << OX05B1S_MIPI_NLANE_SHIFT,
@@ -709,7 +887,10 @@ static u8 ox05b1s_code2dt(const u32 code)
 {
 	switch (code) {
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
 		return MIPI_CSI2_DT_RAW10;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+		return MIPI_CSI2_DT_RAW12;
 	default:
 		return MIPI_CSI2_DT_RAW10;
 	}
@@ -729,6 +910,10 @@ static int ox05b1s_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 	fd->entry[0].pixelcode = sensor->mode->code;
 	mutex_unlock(&sensor->lock);
 
+	/*
+	 * expose only VC0, to be updated to expose also VC1 (for hdr mode)
+	 * when it will be possible to add routes and internal pads
+	 */
 	fd->entry[0].bus.csi2.vc = 0;
 	fd->entry[0].bus.csi2.dt = ox05b1s_code2dt(fd->entry[0].pixelcode);
 
@@ -874,6 +1059,9 @@ static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
 	}
 
 	switch (chip_id) {
+	case OS08A20_CHIP_ID:
+		camera_name = "os08a20";
+		break;
 	case OX05B1S_CHIP_ID:
 		camera_name = "ox05b1s";
 		break;
@@ -1078,6 +1266,23 @@ static void ox05b1s_remove(struct i2c_client *client)
 static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
 				 ox05b1s_runtime_resume, NULL);
 
+static const struct ox05b1s_plat_data os08a20_data = {
+	.name			= "os08a20",
+	.chip_id		= 0x530841,
+	.native_width		= 3872, /* 16 dummy + 3840 active + 16 dummy */
+	.native_height		= 2192, /* 16 dummy + 2160 active + 16 dummy */
+	.active_top		= 16,
+	.active_left		= 16,
+	.active_width		= 3840,
+	.active_height		= 2160,
+	.supported_modes	= os08a20_supported_modes,
+	.default_mode_index	= 0,
+	.supported_codes	= os08a20_supported_codes,
+	.hdr_modes		= os08a20_hdr_modes,
+	.hdr_modes_count	= ARRAY_SIZE(os08a20_hdr_modes),
+	.set_hdr_mode		= os08a20_set_hdr_mode,
+};
+
 static const struct ox05b1s_plat_data ox05b1s_data = {
 	.name			= "ox05b1s",
 	.chip_id		= 0x580542,
@@ -1090,9 +1295,16 @@ static const struct ox05b1s_plat_data ox05b1s_data = {
 	.supported_modes	= ox05b1s_supported_modes,
 	.default_mode_index	= 0,
 	.supported_codes	= ox05b1s_supported_codes,
+	.hdr_modes		= NULL,
+	.hdr_modes_count	= 0,
+	.set_hdr_mode		= NULL,
 };
 
 static const struct of_device_id ox05b1s_of_match[] = {
+	{
+		.compatible = "ovti,os08a20",
+		.data = &os08a20_data,
+	},
 	{
 		.compatible = "ovti,ox05b1s",
 		.data = &ox05b1s_data,
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
index c7371418bbd0..e30851ecd94a 100644
--- a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
@@ -10,6 +10,142 @@
 #include <media/v4l2-cci.h>
 #include "ox05b1s.h"
 
+#define OS08A20_REG_PLL_CTRL_05		CCI_REG8(0x0305)
+#define OS08A20_REG_PLL_CTRL_25		CCI_REG8(0x0325)
+#define OS08A20_REG_MIPI_BIT_10_12	CCI_REG8(0x031e)
+/* Analog Control Registers 0x3600-0x3637 */
+#define OS08A20_REG_ANA_CTRL		CCI_REG8(0x3600)
+#define OS08A20_REG_CORE_0		CCI_REG8(0x3660)
+/* Sensor Timing Control Registers 0x3700-0x37ff */
+#define OS08A20_REG_SENSOR_TIMING_CTRL	CCI_REG8(0x3700)
+#define OS08A20_REG_L2S_MODE		CCI_REG8(0x3797)
+#define OS08A20_REG_X_ODD_INC		CCI_REG8(0x3814)
+#define OS08A20_REG_Y_ODD_INC		CCI_REG8(0x3816)
+#define OS08A20_REG_FORMAT1		CCI_REG8(0x3820)
+#define OS08A20_REG_FORMAT2		CCI_REG8(0x3821)
+#define OS08A20_REG_BLC_CTRL08		CCI_REG8(0x4008)
+#define OS08A20_REG_BLC_CTRL09		CCI_REG8(0x4009)
+#define OS08A20_REG_BLC_CTRL50		CCI_REG8(0x4050)
+#define OS08A20_REG_BLC_CTRL51		CCI_REG8(0x4051)
+#define OS08A20_REG_PCLK_PERIOD		CCI_REG8(0x4837)
+#define OS08A20_REG_ISP_CTRL_1		CCI_REG8(0x5001)
+#define OS08A20_REG_ISP_CTRL_5		CCI_REG8(0x5005)
+
+/* Common register configuration for Omnivision OS08A20 raw camera */
+static const struct cci_reg_sequence os08a20_init_setting_common[] = {
+	{OS08A20_REG_ANA_CTRL + 0x05, 0x50},
+	{OS08A20_REG_ANA_CTRL + 0x10, 0x39},
+	{OS08A20_REG_SENSOR_TIMING_CTRL + 0x5e, 0x0b},
+	{OS08A20_REG_L2S_MODE, 0x04},
+	{OS08A20_REG_BLC_CTRL08, 0x02},
+	{OS08A20_REG_BLC_CTRL09, 0x0d},
+	{OS08A20_REG_BLC_CTRL50, 0x00},
+	{OS08A20_REG_BLC_CTRL51, 0x01},
+	{OS08A20_REG_ISP_CTRL_1, 0x42},
+	{OS08A20_REG_ISP_CTRL_5, 0x00},
+};
+
+/* Common register configuration for Omnivision OS08A20 10 bit */
+static const struct cci_reg_sequence os08a20_init_setting_10bit[] = {
+	{OS08A20_REG_MIPI_BIT_10_12, 0x09},
+	{OS08A20_REG_ANA_CTRL + 0x09, 0xb5},
+	{OS08A20_REG_CORE_0, 0x43},
+	{OS08A20_REG_SENSOR_TIMING_CTRL + 0x06, 0x35},
+	{CCI_REG24(0x3709), 0x490098},
+};
+
+/* Common register configuration for Omnivision OS08A20 12 bit */
+static const struct cci_reg_sequence os08a20_init_setting_12bit[] = {
+	{OS08A20_REG_MIPI_BIT_10_12, 0x0a},
+	{OS08A20_REG_ANA_CTRL + 0x09, 0xdb},
+	{OS08A20_REG_CORE_0, 0xd3},
+	{OS08A20_REG_SENSOR_TIMING_CTRL + 0x06, 0x6a},
+	{CCI_REG24(0x3709), 0x480130},
+};
+
+/* Mode specific register configurations for Omnivision OS08A20 raw camera */
+
+/* OS08A20 3840 x 2160 @30fps BGGR10 */
+static const struct cci_reg_sequence os08a20_init_setting_4k_10b[] = {
+	{OS08A20_REG_PLL_CTRL_05, 0x3c},
+	{OS08A20_REG_FORMAT2, 0x04}, /* mirror */
+	{OS08A20_REG_PCLK_PERIOD, 0x10},
+};
+
+/* OS08A20 3840 x 2160 @30fps BGGR12 */
+static const struct cci_reg_sequence os08a20_init_setting_4k_12b[] = {
+	{OS08A20_REG_PLL_CTRL_05, 0x3c},
+	{OS08A20_REG_PLL_CTRL_25, 0x47},
+	{OS08A20_REG_FORMAT2, 0x04}, /* mirror */
+	{OS08A20_REG_PCLK_PERIOD, 0x10},
+};
+
+/* OS08A20 1920 x 1080 @60fps BGGR10 */
+static const struct cci_reg_sequence os08a20_init_setting_1080p_10b[] = {
+	{OS08A20_REG_PLL_CTRL_05, 0x2d},
+	{OS08A20_REG_PLL_CTRL_25, 0x45},
+	{OS08A20_REG_X_ODD_INC, 0x03},
+	{OS08A20_REG_Y_ODD_INC, 0x03},
+	{OS08A20_REG_FORMAT1, 0x01}, /* vertical binning */
+	{OS08A20_REG_FORMAT2, 0x05}, /* mirror, horizontal binning */
+	{OS08A20_REG_BLC_CTRL09, 0x05},
+	{OS08A20_REG_PCLK_PERIOD, 0x16},
+};
+
+const struct ox05b1s_reglist os08a20_reglist_4k_10b[] = {
+	{
+		.regs = os08a20_init_setting_common,
+		.count = ARRAY_SIZE(os08a20_init_setting_common),
+	},
+	{
+		.regs = os08a20_init_setting_10bit,
+		.count = ARRAY_SIZE(os08a20_init_setting_10bit),
+	},
+	{
+		.regs = os08a20_init_setting_4k_10b,
+		.count = ARRAY_SIZE(os08a20_init_setting_4k_10b),
+	},
+	{
+		/* sentinel */
+	}
+};
+
+const struct ox05b1s_reglist os08a20_reglist_4k_12b[] = {
+	{
+		.regs = os08a20_init_setting_common,
+		.count = ARRAY_SIZE(os08a20_init_setting_common),
+	},
+	{
+		.regs = os08a20_init_setting_12bit,
+		.count = ARRAY_SIZE(os08a20_init_setting_12bit),
+	},
+	{
+		.regs = os08a20_init_setting_4k_12b,
+		.count = ARRAY_SIZE(os08a20_init_setting_4k_12b),
+	},
+	{
+		/* sentinel */
+	}
+};
+
+const struct ox05b1s_reglist os08a20_reglist_1080p_10b[] = {
+	{
+		.regs = os08a20_init_setting_common,
+		.count = ARRAY_SIZE(os08a20_init_setting_common),
+	},
+	{
+		.regs = os08a20_init_setting_10bit,
+		.count = ARRAY_SIZE(os08a20_init_setting_10bit),
+	},
+	{
+		.regs = os08a20_init_setting_1080p_10b,
+		.count = ARRAY_SIZE(os08a20_init_setting_1080p_10b),
+	},
+	{
+		/* sentinel */
+	}
+};
+
 #define OX05B1S_REG_PLL1_CTRL_REG07	CCI_REG8(0x0307)
 #define OX05B1S_REG_PLL3_CTRL_REG4A	CCI_REG8(0x034a)
 #define OX05B1S_REG_PLL_MONITOR_REG0B	CCI_REG8(0x040b)
-- 
2.43.0

