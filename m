Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4CE4908C4;
	Mon,  5 Oct 2026 17:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222149; cv=fail; b=ISGzQPMWpg6omBRmRifPGZSunBbJsxNjYnTPiE+Kjvq1wkNRU0+SFFEmCgTVtDATPmp1nGZbGNEu8jtrYGkcNeyP4sPsrROTM8/zLjiFdauRgFos8bcVlnS8diz2Xtgl1T0mTBnP3A33GGQ2kmk5Trc6n2czZsj9lnDl9CsNnsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222149; c=relaxed/simple;
	bh=TfdpyT2WJlwmtjxFStIKhY1AWRUsPRHOxRBvmYb1aJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QvGuYHkF3XXPpvbxDsPrXMmTenRImVfdU3I0fo3hUVO1t4cmKQUZJNAofHiZI5cxyrSHniNrVsbL9daHzNlNTARCv/L8ZMljefRvC59ndbhdMbrm41IynB/a0Nkq2wtNtrsCgGmEtcpQykMptufqxWnxJpz6M8ZABmSEUGeUgJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CujzMJsH; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CujzMJsH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNXgI2jek7Zvje+ELD9vbs5OmIfZPRKK+pmkqR/kokBWQX4RIWWpgqYLA498XdgWaRrhOvuiuqSWLWnhGXLiL9HrOGWHqC0ezhDhaJu5/AxA7sSJOeR8AjYyRXUmfw/AhX4avqdHfJQv+98PyNZGlPiosrgB+pt9jwLHQP4uTj/8XtURwPTDPbQOEEPqV0NuzskWEN+SzHYLp85GBANIDkiKhERWxnj3Wo8ZMuErMePbvLHmKIqLtLYy11a/Bcm3XcOs+wIcfw0c+ZDNL+Cbddwl3Kgv4BuAVRxReX4q3+j8LOkYIZiDQOP2Or/bWIPqeYPnws6Or3uK4NBH5kQLTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RogP0gaL/uaYTMSt/XQ8+9MLLKOQ4Beo/ThOuwmp7oo=;
 b=GZCS0cEBolvehZUaO+RJ2XKM+IdKWs/zId5NeMxCc8PV/lSUnH6r90KYZU5VrmKpzwuu29K59/zYexnR93WHNYGMfTBVuSn4Oiea0gb20GZ7KbVzD/1Ry+GzL/RqE+HlWTT5OvhgPSQbIwrlgQiRptbB7Ijvor+ZPFPlEWPjM+MaKwKNh1gqVEJuaJv8CaPI5/EHbE7nE69mAq4JJmXkRl+lWdHLOXfH+p1TXa3/wpXQsTtyH+JJXaXbAia7VqvvG7gTUy7l6Vzxiem7B6pQoOl7Ss2PPGW0QJIKGB5RvuB8lbLTqnGnzmHGCfdJbnnBsZkV5Wqj9rCiGomxspC5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RogP0gaL/uaYTMSt/XQ8+9MLLKOQ4Beo/ThOuwmp7oo=;
 b=CujzMJsHCFyAcG5arwvTy7h0dbrXFvF5WP5gd+mZBPlxZhTbszLeIXDPwcVDbG1jnW+FeCaEHt6Hg6tV5/9+JQSEowGj4GbjJe5bPcP+/aR5ireXz1n4rzgglgtKufnBGAatoAk3vp87YY6q7MQhAPE/jPdGiEcEOwyvJpckEQM+5Pn9ZIbE+hKiEC/XmVowqIx2ZfX+yq6RmQM4LERVBIh25YfNxIuk1DiN419WSKmEkAVbLmW8+oEFxcnGx6168hl8MPQtGIpzei31+y2SFnhw5j0Hqmaa7fTMrEO9Tnq5ZCALZHYj/Xjg5WttxLO8k4BM1/JaZQrxabTShs6+dQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 5 Oct
 2026 17:42:19 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:42:19 +0000
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
Subject: [PATCH v5 2/4] media: ox05b1s: Add omnivision OX05B1S raw sensor driver
Date: Mon,  5 Oct 2026 20:51:00 +0300
Message-ID: <20261005175102.2358881-3-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
References: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::22) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 98aa5b46-a15e-4c36-2128-08df230800c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|23010399003|260925021911599003|260925021311599003|6133799003|56012099006|10067099003|11063799006|260925022911599003|3023799007|22082099003|18002099003|18092099006|921020;
X-Microsoft-Antispam-Message-Info:
	dsc/HtCY+0jPrz5I9g5v8uak7Cq9cdBzW/ne1LAg0HM1S+HQypiOrTbo1q/eLMwZPtfThdflRC6YCPuuX6vqw+0aIhh094KTPCqxzQA/g+v9OPnoXnu84NKAtRGXWYj16BtZdhIohfVvaCihL7HeJ/5GaEpMXrwL3zeTDJJzWVdIX61vLQwgvCAdmwD4k2kKiAu+FcDplar90R5WDjmILOwbStDrNFtShALFFTSr9WC5TgOz9m+tgI5OE+AgbFjFOOZ2f5h+AbaR6MjSZTNqMfajJb/wjqsPPkacOwjoMje6IC3EwDpNVvsroBqS+3K9iPCP2ixPnfPw6HQnDdwOLfDUlTtuZ0OCdAwGUlVjHWzn3foITRlGkNpmfD1JifomzoipC0fnnOBpLa39s09neWo9z90dEH+YPHz1J8bOAynhVWeLYmcrKn+czLXopUxr23AxaJiSBEAtmyCJfXyPR006fqNA+SxwSQ54Hw0Ol3sj9HwTLwRGGzmmzp6/wvHH3DIimcDKGMng73FyQfmzGpYuATfYt72huhXKo4NXdNnlXRMyZTN2xvWbYBr2s9MBzG0WnotIOoAiosyUSHz8vtlAOFWsHDQQgAlLxrgJligDMJEWpiN7TnSLwoA2NtorpzPGfJtW3HmbTP/LHSS1UhMrkilYTPLcd0xCkU7nyCus7qQaye7tApQBhwVe9vAliTSVNb+C4Q7ukWZsSZVT0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(23010399003)(260925021911599003)(260925021311599003)(6133799003)(56012099006)(10067099003)(11063799006)(260925022911599003)(3023799007)(22082099003)(18002099003)(18092099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qkoh84fb9Gun5VD8JHaB9cHdqCjHkEPmYx1n0e+ZLDYR7gPgE1iWfVnQHRQL?=
 =?us-ascii?Q?MILmiiN0dVmi2yvtkqABPMGG8L/RdQqCSLIZW+LONG6tzEk1GrQRQ4Goo2nM?=
 =?us-ascii?Q?fcYAYeO4UWh0zBFiCGUx/b6aMamRx26KzD1uk8SdwxaDlHBeCgrTBbQBmhBG?=
 =?us-ascii?Q?xfPzNeLK5+0CUdfGdSgDXHWcgWURPqRfUs9UutUswAPjHfFVAmODkGvEoTdl?=
 =?us-ascii?Q?m7+SNSGCLmIozN2f4hbMkLxtR8Qt+4n4Y4ojA7vttmCwIwHJxceeZzxetlz+?=
 =?us-ascii?Q?K2wvkDafw5c7+osOfrGnHnEht807x508e/ZaxnQfCSi7pwTKRkljXP8G8rv+?=
 =?us-ascii?Q?L5dRXFQlaw1jfArhy0pVI+J4TeNih3tW60ID2mE+8Fsr57OEG+AcmeaW49i4?=
 =?us-ascii?Q?LO5kklvX9X7A7p+AlBTs9kCT9SIgVnzLMOQb71XptCThpgGZEXYmXbsSb4Wk?=
 =?us-ascii?Q?shwLUYTqFdnEDdxxvC+KqB8yusdMaL9lXJ8Zy75Sni2uPtPZDioee5JvgrwF?=
 =?us-ascii?Q?yUghhkeVS2C1NCviyzRz5jZ9YKa+2YEZ6Qi6ZISziwmedPAs0bBOk+76BMcD?=
 =?us-ascii?Q?7/j5WPq3bDDtj8B9g1b0bsWWxR+RYY92audMJaDYMczG4qKwJvouxiYXNTgw?=
 =?us-ascii?Q?mueAMJK847jzwBGAG+S7W3bamGRYfaput8mXb+EwTm/j3jTV2vtAfg2Ak3tq?=
 =?us-ascii?Q?17nVrzlvBI17gN7ZxO7j390junTiARNs8RFGxcR/0Wp7WqlqrlqyuwZDqXmo?=
 =?us-ascii?Q?U2IfVeyL55UbBhH0gTv8luK6sKUl9KdSs9Mpgld4fcTJOQ9GOrYASuUVHVYR?=
 =?us-ascii?Q?HBp3PpW++uds5swX+oWAS/ab83ywAQRzFJfP+W2zQH/9y4ZL24b2zwBPOCzk?=
 =?us-ascii?Q?yTfhTDi/tD7I4lWDTocUA6KQNiT2m5rsQtPUawrIGT0sVHJ7LB6fXHRja2DD?=
 =?us-ascii?Q?EkppCOBMwVbLiGvLhJNGl7ijkzltNgOy44vjeiMlApP8kZlO3QTZjbhEnJLI?=
 =?us-ascii?Q?59GtvtC2KNMe+TbvsturbiqQ3mi9a1J/hRRAiHxNEBD65xMuksTt09m81G+U?=
 =?us-ascii?Q?LQfAlbZhIP4bU+5VkxRDHa5MqJrGPDh04Zm/lXQsIxADeWnaDlq8OWzKf7vy?=
 =?us-ascii?Q?lYn25VuC3L7IsjyYTDrV/Ycxiulb7/tMSgcK/14xkzGkSDXefasZOuZR66Ad?=
 =?us-ascii?Q?GpSSupclp5pM8NQ/1FjIned3wyKgyN95rw8DXTcmd0fZL49H6o7USlXRNN/9?=
 =?us-ascii?Q?InkaR+SsW9Nlw5kGyU25Pe/SBVmU4B1LufWngCZhGTiFXY0AbBEdCMRLtvlg?=
 =?us-ascii?Q?x3Zw6CCpTVvEf5cS8LpAHV2nQ4hD3Njk3apJOzRKRL8nkBNvS82AF0E7dyZu?=
 =?us-ascii?Q?XBViJmP3xau+mTYrfUbmSvd40Dn/Js0TKW81yz1arw1/1EWCKnSErUGlZokr?=
 =?us-ascii?Q?BL+jPsVbBaQG7/qAVz4CoeXVkF1NS7vMmCUNZIgiilvlb50/+UjUWV30odGJ?=
 =?us-ascii?Q?i4FKUKgIg+TA1siFxUdOkaUDBuDweVE6CBaMhI8dIoL0mvzHr0rL5KKhB47P?=
 =?us-ascii?Q?j2fZwST3XwXlt5ixX00VRbmeY7vz5/MNTlwFSLDrEMlC+Z+KnItAdCt/ybFh?=
 =?us-ascii?Q?0icnV90HLn7a0h3r1GRL+k8WkVTd5NpgbZO7/YupIfjOn26/qKmBUNB4eELD?=
 =?us-ascii?Q?0TqtDUQ6BdZAKTx5D+y2paCqOekjtpSldn23YBbhsOljKX9HEDTD7MYztkQg?=
 =?us-ascii?Q?eMrKYQ1jlw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98aa5b46-a15e-4c36-2128-08df230800c3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 17:42:19.1818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f2d9kmLkY9vRv3jYYGYgd9inqddgTiHd+g4zS2ImkID1aznbGzld7aJ283z7pGVSmquXgOtQKG5p3Ls8z/EGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

Add a v4l2 subdevice driver for the Omnivision OX05B1S RGB-IR sensor.

The Omnivision OX05B1S is a 1/2.5-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported for OX05B1S:
- Manual exposure an gain control support
- vblank/hblank control support
- Supported resolution: 2592 x 1944 @ 30fps (SGRBG10)

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v5:
	- Use cci_reg_sequence and CCI_REG8/16/24 macros all over (remove ox05b1s_reg).
	- Add a register count member in struct ox05b1s_reglist, in order to
	be able to use cci_multi_reg_write, remove ox05b1s_write_reg_array
	which is not needed anymore.
	- Use cci_update_bits instead of regmap_update_bits
	- Change to lowercase the regulator supply names to match the bindings
	- Remove one unneeded argument from ox05b1s_update_pad_format()
	- Do not use spaces near brackets {}, inside,  in register init lists.
	- Update copyright
	- Add back the commas after the last field of a structure (except for sentinels)
	- Add some blank lines
	- More reflows to 80 columns
	- Arrange some local variables in reverse Christmas tree order
	- Use dev_err_probe for cci regmap init failure
	- Adopt a consistent coding style for register initializer lists,
	instead of }, {, use:
		},
		{
	- Fix segmentation fault in ox05b1s_find_code, at set_fmt with unsupported
	mbus code(issue introduced in v4), also simplify ox05b1s_find_code 
	- Remove GPIOLIB dependency from Kconfig, since the reset gpio is optional,
	rely on stub/no-op implementations when absent
	- Add COMPILE_TEST for OF dependency in Kconfig
	- Use V4L2_CCI_I2C instead of REGMAP_I2C in Kconfig
	- Fix ox05b1s_s_stream to propagate the error, it was always returning 0,
	this was causing a runtime PM usage count underflow in the case ox05b1s_apply_current_mode fails
	- Add back some registers in the initial configuration lists that were cleaned up
	in v2 and later on found it was causing various problems
		0x5001 (ISP_REG01) - red line at top of image on ox05b1s
	- Update some comments
	- In ox05b1s_update_controls, use .exp from sensor mode structure as max exposure,
	let min exposure be 1; when mode changes, preserve exposure value, just clamp it,
	rather than using the default.
	- Add .enable_streams/.disable_streams and use v4l2_subdev_s_stream_helper for .s_stream
	- In probe, move ox05b1s_update_controls before v4l2_async_register_subdev_sensor;
	after device registration, concurrent userspace access is possible, lockdep warning on debug kernels,
	potential race on on sensor->ctrls
	- Use default_mode_index only to index intofor supported_modes, not for supported_codes
	- Fix comments for DVDD DOVDD (voltage was reversed)
	- Allow probe to fail on errors when getting the optional reset GPIO via
	devm_gpiod_get_optional, other than the case when the GPIO is genuinly optional an no
	GPIO has been assigned, for example -EPROBE_DEFER when the GPIO provider is not yet ready.
	- In power on sequence, move clock enable before reset release,
	wait t1+t2 as stabilization window before the first SCCB, add more comments
	- In power off sequence, adjust the 512 cycles after last SCCB transaction,
	to account for the min clock(6MHz)
	- In ox05b1s_set_fmt, propagate the error from ox05b1s_update_controls
	- Call v4l2_async_unregister_subdev() before disable runtime PM,
	to stop new callers from reaching the driver
	- Added a comment, to emphasize ox05b1s_nearest_size() cannot return NULL
	- Set sensor->stream_status = enable only if sensor was successfully initialized
	- Use lock for ox05b1s_update_controls in probe (warning with CONFIG_LOCKDEP)
	- Add define for OX05B1S_CHIP_ID
	- Switch back to BGGR, until generic raw formats are merged, this is the closest available mbus fmt
	- Fix usage of pm_runtime_get_if_in_use(), consider it may return an error (<0), 
	consider also the case when CONFIG_PM=n (returns -EINVAL)
		Reference: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
	- Propagate ox05b1s_update_controls return value in probe
	- Add pm_runtime_dont_use_autosuspend to ox05b1s_remove and ox05b1s_probe error path
	- Get the number of MIPI data lanes from DT, since this is a board configuration property,
	and program the sensor registers accordingly, before streaming. Restrict to 4 datalanes for now,
	as not all modes are possible with 2 datalanes, at current data rates.
	- For OX05B1S, apply VTS-30 limit for both exposures
	- Do not hardcode one link_frequency, add one per mode
	    HBLANK control's unit is in number of pixels, but the sensor's HTS register
	    is is number of sensor array cycles.
	    The datasheet provides sensor array clock in MHz, mipi datarate per lane in Mbps, HTS in cycles.
	    For each mode:
	    - add pixel_rate, sa1_clk (sensor timing clock, Hz) and link_freq (MIPI per-lane frequency, Hz).
	    - remove h_bin
	    
	    Add a common array, ox05b1s_csi2_link_freqs[], with all supported link frequencies
	    
	    ox05b1s_update_controls() now derives
	    pixel_rate = link_freq * 2 * num_data_lanes / bpp
	    and hblank = HTS * pixel_rate / sa1_clk
	    and sets the link_freq control index via ox05b1s_find_link_freq_idx().
	    
	    ox05b1s_s_ctrl() HBLANK case converts pixel-domain hblank back to SA1_CLK cycles:
	    hts = (width + hblank) * sa1_clk / pixel_rate
	- Drop ox05b1s_s_stream, disperse it's content into ox05b1s_enable_streams/ox05b1s_disable_streams
	- Remove stream_status from struct ox05b1s, enabled_source_streams can serve the same purpose
	- Add +2 for orientation and rotation at v4l2_ctrl_handler_init
	- Initialize the pixel_rate control with the default mode value
	- Add v4l2_subdev_client_info to ox05b1s_set_fmt and ox05b1s_get_selection
	- Remove pm_runtime_dont_use_autosuspend and add pm_runtime_set_suspended
	to probe probe_err_pm_runtime

Changes in v4:
	Switch to Y media bus codes. The CFA pattern control will be implemented when patches get merged, or maybe separatelly as RFC?
	Add pixel_rate member to mode struct, remove fps member. We do not have information how to calculate the pixel rate from the PLL parameters that can be made public.
	Use register macros for the registers that are documented. User register group macros, where individual registers are not documented
	Remove some uneeded local variable initialisations
	Fix extra/missing spaces
	Add missing ending \n
	Use return -ENODEV & return 0 to ease reading
	Rename retval to ret in probe for consistency
	Use devm_mutex_init instead of mutex_init
	Replace more dev_err's with dev_err_probe
	Constify more structs
	Remove some unneded ending commas after a terminator
	Fix smatch error in ox05b1s_s_ctrl: error: typename in expression
	Fix a seeries of smatch warnings like: warning: symbol 'ovx5b_init_setting_2592x1944' was not declared. Should it be static?
	Shorten some more lines to 80 columns

Changes in v3:
	Use helpers from v4l2-cci.h (drop ox05b1s_write_reg, ox05b1s_read_reg, ox05b1s_set_hts/vts/exp/analog_gain, ox05b1s_regmap_config)
	Don't hardcode timing registers: remove timing registers x_output_size/y_output_size from register configuration list, add them to ox05b1s_apply_current_mode
	Remove HTS,VTS from register config list as they are written by HBLANK and VBLANK controls through __v4l2_ctrl_handler_setup
	ox05b1s register config cleaning (remove all registers that were at their default value, and more, keep only what seems mandatory to be able to stream)
	Use const for ox05b1s_supported_modes
	Device should be silent on success, use dev_dbg.
	Drop unneeded {}
	Fixed an error introduced in v2 in ox05b1s_nearest_size (set_fmt for 4k BGGR12 mode was stuck)
	Fix an issue in ox05b1s_set_fmt, the format was saved in subdev state only for _TRY, save it also for _ACTIVE

Changes in v2:
	Use dev_err_probe for missing clock, since it is now required property, and use NULL for devm_clk_get (no name for single clock), remove check for non NULL sensor->sensor_clk
	Remove dev_err message for devm_regmap_init_i2c allocation error
	Added spaces inside brackets, wrap lines to 80
	Remove some redundant initializations
	Add regulators
	Make "sizes" a pointer
		Use struct v4l2_area instead of u32[2] array
		Remove the count for supported_modes[] and supported_codes[], instead use sentinel element at the end
		Consequently, update ox05b1s_enum_mbus_code, ox05b1s_enum_frame_size, ox05b1s_nearest_size, ox05b1s_find_code, to not use the count
	Remove .h files for modes, however did not move this code in the driver file but added a separate c file for all supported modes
	Refactor register lists to allow multiple register arrays per mode
	Use GPL-2.0-only instead of GPL-2.0

 drivers/media/i2c/Kconfig                 |    1 +
 drivers/media/i2c/Makefile                |    1 +
 drivers/media/i2c/ox05b1s/Kconfig         |    9 +
 drivers/media/i2c/ox05b1s/Makefile        |    2 +
 drivers/media/i2c/ox05b1s/ox05b1s.h       |   19 +
 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c  | 1117 +++++++++++++++++++++
 drivers/media/i2c/ox05b1s/ox05b1s_modes.c |   77 ++
 7 files changed, 1226 insertions(+)
 create mode 100644 drivers/media/i2c/ox05b1s/Kconfig
 create mode 100644 drivers/media/i2c/ox05b1s/Makefile
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s.h
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
 create mode 100644 drivers/media/i2c/ox05b1s/ox05b1s_modes.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 4d9946479160..9e91cac3c166 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -891,6 +891,7 @@ config VIDEO_VGXY61
 
 source "drivers/media/i2c/ccs/Kconfig"
 source "drivers/media/i2c/et8ek8/Kconfig"
+source "drivers/media/i2c/ox05b1s/Kconfig"
 
 endif
 
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fd1cb25718c0..a5e8ec75602c 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_VIDEO_OV9282) += ov9282.o
 obj-$(CONFIG_VIDEO_OV9640) += ov9640.o
 obj-$(CONFIG_VIDEO_OV9650) += ov9650.o
 obj-$(CONFIG_VIDEO_OV9734) += ov9734.o
+obj-$(CONFIG_VIDEO_OX05B1S) += ox05b1s/
 obj-$(CONFIG_VIDEO_RDACM20) += rdacm20.o
 obj-$(CONFIG_VIDEO_RDACM21) += rdacm21.o
 obj-$(CONFIG_VIDEO_RJ54N1) += rj54n1cb0c.o
diff --git a/drivers/media/i2c/ox05b1s/Kconfig b/drivers/media/i2c/ox05b1s/Kconfig
new file mode 100644
index 000000000000..58799386ff63
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/Kconfig
@@ -0,0 +1,9 @@
+config VIDEO_OX05B1S
+	tristate "OmniVision raw sensor support OX05B1S"
+	depends on OF || COMPILE_TEST
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Omnivision OX05B1S RGB-IR sensor.
+	  This is a 1/2.5-Inch CMOS image sensor with an active array size of 2592 x 1944.
+	  It is programmable through I2C interface.
+	  The output is on MIPI CSI-2 interface.
diff --git a/drivers/media/i2c/ox05b1s/Makefile b/drivers/media/i2c/ox05b1s/Makefile
new file mode 100644
index 000000000000..0b38dbf98bcd
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/Makefile
@@ -0,0 +1,2 @@
+ox05b1s-objs := ox05b1s_modes.o ox05b1s_mipi.o
+obj-$(CONFIG_VIDEO_OX05B1S) += ox05b1s.o
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s.h b/drivers/media/i2c/ox05b1s/ox05b1s.h
new file mode 100644
index 000000000000..f00ee1f2e78b
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2024-2025, NXP
+ */
+
+#ifndef OX05B1S_H
+#define OX05B1S_H
+
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct ox05b1s_reglist {
+	const struct cci_reg_sequence *regs;
+	unsigned int count;
+};
+
+extern const struct ox05b1s_reglist ox05b1s_reglist_2592x1944[];
+
+#endif /* OX05B1S_H */
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
new file mode 100644
index 000000000000..45d38dc836e6
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_mipi.c
@@ -0,0 +1,1117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A V4L2 driver for Omnivision OX05B1S RGB-IR camera.
+ * Copyright 2024-2026 NXP
+ *
+ * Inspired from Sony imx219, imx290, imx214 and imx334 camera drivers
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#include "ox05b1s.h"
+
+#define OX05B1S_SENS_PAD_SOURCE	0
+#define OX05B1S_SENS_PADS_NUM	1
+#define OX05B1S_CHIP_ID 0x580542
+
+#define OX05B1S_REG_SW_STB		CCI_REG8(0x0100)
+#define OX05B1S_REG_SW_RST		CCI_REG8(0x0103)
+#define OX05B1S_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OX05B1S_REG_SC_CMMN_REG10	CCI_REG8(0x3010)
+#define OX05B1S_MIPI_NLANE_MASK		GENMASK(7, 4)
+#define OX05B1S_MIPI_NLANE_SHIFT	4
+#define OX05B1S_REG_TIMING_HTS		CCI_REG16(0x380c)
+#define OX05B1S_REG_TIMING_VTS		CCI_REG16(0x380e)
+#define OX05B1S_REG_EXPOSURE		CCI_REG16(0x3501)
+#define OX05B1S_REG_GAIN		CCI_REG16(0x3508)
+#define OX05B1S_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OX05B1S_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
+
+#define client_to_ox05b1s(client)\
+	container_of(i2c_get_clientdata(client), struct ox05b1s, subdev)
+
+struct ox05b1s_sizes {
+	u32	code;
+	const struct v4l2_area *sizes;
+};
+
+struct ox05b1s_plat_data {
+	char				name[20];
+	u32				chip_id;
+	u32				native_width;
+	u32				native_height;
+	u32				active_top;
+	u32				active_left;
+	u32				active_width;
+	u32				active_height;
+	const struct ox05b1s_mode	*supported_modes;
+	u32				default_mode_index;
+	const struct ox05b1s_sizes	*supported_codes;
+};
+
+struct ox05b1s_ctrls {
+	struct v4l2_ctrl_handler handler;
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *gain;
+	struct v4l2_ctrl *exposure;
+};
+
+struct ox05b1s_mode {
+	u32 index;
+	u32 width;
+	u32 height;
+	u32 code;
+	u32 bpp;
+	u32 vts; /* default VTS, in lines */
+	u32 hts; /* default HTS, in SA1_CLK cycles */
+	u32 exp; /* max exposure, in lines */
+	u32 sa1_clk; /* sensor array timing clock, Hz */
+	s64 link_freq; /* MIPI CSI-2 link frequency per lane, Hz */
+	const struct ox05b1s_reglist *reg_data;
+};
+
+/* regulator supplies */
+static const char * const ox05b1s_supply_name[] = {
+	"avdd",  /* Analog voltage supply, 2.8 volts */
+	"dovdd", /* Digital I/O voltage supply, 1.8 volts */
+	"dvdd",  /* Digital voltage supply, 1.2 volts */
+};
+
+#define OX05B1S_NUM_SUPPLIES ARRAY_SIZE(ox05b1s_supply_name)
+
+struct ox05b1s {
+	struct i2c_client *i2c_client;
+	struct regmap *regmap;
+	struct gpio_desc *rst_gpio;
+	struct regulator_bulk_data supplies[OX05B1S_NUM_SUPPLIES];
+	struct clk *sensor_clk;
+	const struct ox05b1s_plat_data *model;
+	struct v4l2_subdev subdev;
+	struct media_pad pads[OX05B1S_SENS_PADS_NUM];
+	const struct ox05b1s_mode *mode;
+	struct mutex lock; /* sensor lock */
+	struct ox05b1s_ctrls ctrls;
+	u64 enabled_source_streams;
+	u32 num_data_lanes; /* number of MIPI CSI-2 data lanes */
+};
+
+static const struct ox05b1s_mode ox05b1s_supported_modes[] = {
+	{
+		/* 5Mp GRBG10, 30fps
+		 * SA1_CLK=48MHz, link_freq=320MHz (640 Mbps/lane), 4 lanes
+		 * pixel_rate = 320M*2*4/10 = 256 MHz
+		 * hblank = HTS*pixel_rate/SA1_CLK - width = 752*256M/48M - 2592 = 1419
+		 */
+		.index		= 0,
+		.width		= 2592,
+		.height		= 1944,
+		.code		= MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp		= 10,
+		.vts		= 0x850,
+		.hts		= 0x2f0,
+		.exp		= 0x850 - 30,
+		.sa1_clk	= 48000000,
+		.link_freq	= 320000000,
+		.reg_data	= ox05b1s_reglist_2592x1944,
+	},
+	{
+		/* sentinel */
+	}
+};
+
+/* keep in sync with ox05b1s_supported_modes */
+static const struct v4l2_area ox05b1s_sgrbg10_sizes[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+	},
+	{
+		/* sentinel */
+	}
+};
+
+static const struct ox05b1s_sizes ox05b1s_supported_codes[] = {
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.sizes = ox05b1s_sgrbg10_sizes,
+	},
+	{
+		/* sentinel */
+	}
+};
+
+static int ox05b1s_power_on(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	int ret;
+
+	ret = regulator_bulk_enable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators\n");
+		return ret;
+	}
+
+	/*
+	 * t1 = from XSHUTDOWN rise to system ready
+	 * t2 = from system ready to first SCCB transaction
+	 * XVCLK may be gated or free running before XSHUTDOWN rise & during t1
+	 * XVCLK must be active during t2
+	 */
+
+	ret = clk_prepare_enable(sensor->sensor_clk);
+	if (ret < 0) {
+		dev_err(dev, "Enable sensor clk fail ret=%d\n", ret);
+		goto reg_off;
+	}
+
+	/* get out of powerdown and reset */
+	gpiod_set_value_cansleep(sensor->rst_gpio, 0);
+
+	/*
+	 * wait t1 + t2
+	 * t1 = 0.5 ms, t2 = 0.25 * XVCLK (6ms @24MHz) for OX05B1S
+	 */
+	fsleep(6500);
+
+	return 0;
+
+reg_off:
+	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+
+	return ret;
+}
+
+static int ox05b1s_power_off(struct ox05b1s *sensor)
+{
+	gpiod_set_value_cansleep(sensor->rst_gpio, 1);
+
+	/* XVCLK must be active for 512 cycles after last SCCB transaction
+	 * 512 cycles = 0.0213 ms @24MHz or 0.0853 ms @6Mhz
+	 */
+	fsleep(90);
+	clk_disable_unprepare(sensor->sensor_clk);
+
+	regulator_bulk_disable(OX05B1S_NUM_SUPPLIES, sensor->supplies);
+
+	return 0;
+}
+
+static int ox05b1s_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	return ox05b1s_power_off(sensor);
+}
+
+static int ox05b1s_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	return ox05b1s_power_on(sensor);
+}
+
+static inline struct v4l2_subdev *ctrl_to_sd(struct v4l2_ctrl *ctrl)
+{
+	return &container_of(ctrl->handler, struct ox05b1s,
+			     ctrls.handler)->subdev;
+}
+
+static int ox05b1s_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	u32 w = sensor->mode->width;
+	u32 h = sensor->mode->height;
+	u64 pixel_rate;
+	int ret = 0;
+	u32 hts;
+
+	/* apply V4L2 controls values only if power is already up */
+	if (IS_ENABLED(CONFIG_PM)) {
+		ret = pm_runtime_get_if_in_use(&client->dev);
+		if (ret <= 0)
+			return 0;
+	}
+
+	/* s_ctrl holds sensor lock */
+	switch (ctrl->id) {
+	case V4L2_CID_VBLANK:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_TIMING_VTS,
+				h + ctrl->val, NULL);
+		break;
+	case V4L2_CID_HBLANK:
+		/*
+		 * Convert pixel-domain hblank back to SA1_CLK cycles for HTS.
+		 * pixel_rate = link_freq * 2 * num_data_lanes / bpp
+		 * hts_cycles = (width + hblank) * sa1_clk / pixel_rate
+		 */
+		pixel_rate = div_u64((u64)sensor->mode->link_freq * 2 *
+				     sensor->num_data_lanes,
+				     sensor->mode->bpp);
+		hts = (u32)div_u64((u64)(w + ctrl->val) * sensor->mode->sa1_clk,
+				   pixel_rate);
+		ret = cci_write(sensor->regmap, OX05B1S_REG_TIMING_HTS,
+				hts, NULL);
+		break;
+	case V4L2_CID_PIXEL_RATE:
+		/* Read-only, but we adjust it based on mode. */
+		break;
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_GAIN,
+				ctrl->val, NULL);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = cci_write(sensor->regmap, OX05B1S_REG_EXPOSURE,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (IS_ENABLED(CONFIG_PM))
+		pm_runtime_put(&client->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ox05b1s_ctrl_ops = {
+	.s_ctrl = ox05b1s_s_ctrl,
+};
+
+/*
+ * MIPI CSI-2 link frequencies, shared across all sensor modes.
+ * pixel_rate = link_freq * 2 * num_data_lanes / bpp
+ */
+static const s64 ox05b1s_csi2_link_freqs[] = {
+	320000000, /* OX05B1S 2592x1944 10b @30fps:  640 Mbps/lane */
+};
+
+static int ox05b1s_init_controls(struct ox05b1s *sensor)
+{
+	const struct v4l2_ctrl_ops *ops = &ox05b1s_ctrl_ops;
+	struct ox05b1s_ctrls *ctrls = &sensor->ctrls;
+	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
+	struct device *dev = &sensor->i2c_client->dev;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
+
+	/* +2 for orientation and rotation */
+	v4l2_ctrl_handler_init(hdl, 7 + 2);
+
+	/* we can use our own mutex for the ctrl lock */
+	hdl->lock = &sensor->lock;
+
+	/* Clock related controls */
+	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops,
+						  V4L2_CID_LINK_FREQ,
+						  ARRAY_SIZE(ox05b1s_csi2_link_freqs) - 1,
+						  0,
+						  ox05b1s_csi2_link_freqs);
+
+	/*
+	 * pixel_rate is mode-dependent; initialize with the default mode value
+	 * so that __v4l2_ctrl_modify_range finds no value change and does not
+	 * call set_ctrl (which would fail for a READ_ONLY control while the
+	 * device is active during probe). Actual range is narrowed per mode in
+	 * ox05b1s_update_controls.
+	 */
+	{
+		const struct ox05b1s_mode *def_mode =
+			&sensor->model->supported_modes[sensor->model->default_mode_index];
+		u64 init_pixel_rate = div_u64((u64)def_mode->link_freq * 2 *
+					      sensor->num_data_lanes, def_mode->bpp);
+
+		ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
+						      1, init_pixel_rate, 1,
+						      init_pixel_rate);
+	}
+
+	ctrls->hblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HBLANK,
+					  0, 0, 1, 0);
+
+	ctrls->vblank = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_VBLANK,
+					  0, 0, 1, 0);
+
+	ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE,
+					    0, 0xFFFF, 1, 0x400);
+
+	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
+					0, 0xFFFF, 1, 0x80);
+
+	if (hdl->error) {
+		ret = hdl->error;
+		goto free_ctrls;
+	}
+
+	ctrls->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ret = v4l2_fwnode_device_parse(dev, &props);
+	if (ret)
+		goto free_ctrls;
+
+	ret = v4l2_ctrl_new_fwnode_properties(hdl, ops, &props);
+	if (ret)
+		goto free_ctrls;
+
+	sensor->subdev.ctrl_handler = hdl;
+	return 0;
+
+free_ctrls:
+	dev_err(dev, "Failed to init controls\n");
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
+}
+
+static void ox05b1s_update_pad_format(const struct ox05b1s_mode *mode,
+				      struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->code = mode->code;
+	fmt->width = mode->width;
+	fmt->height = mode->height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int ox05b1s_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct v4l2_mbus_framefmt *format;
+
+	/* Initialize the format. */
+	format = v4l2_subdev_state_get_format(state, 0);
+	ox05b1s_update_pad_format(&sensor->model->supported_modes[0],
+				  format);
+
+	return 0;
+}
+
+static int ox05b1s_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	const struct ox05b1s_sizes *codes = sensor->model->supported_codes;
+	int i = 0;
+
+	while (i++ < code->index && codes->code)
+		codes++;
+
+	if (!codes->code) /* code->index outside supported_codes[] */
+		return -EINVAL;
+
+	code->code = codes->code;
+
+	return 0;
+}
+
+static int ox05b1s_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	const struct ox05b1s_sizes *codes = sensor->model->supported_codes;
+	const struct v4l2_area *sizes;
+	int i = 0;
+
+	if (fse->pad != 0)
+		return -EINVAL;
+
+	while (codes->code) {
+		if (codes->code == fse->code)
+			break;
+		codes++;
+	}
+
+	if (!codes->code) /* fse->code not in supported_codes[] */
+		return -EINVAL;
+
+	sizes = codes->sizes;
+	while (i++ < fse->index && sizes->width)
+		sizes++;
+
+	if (!sizes->width) /* fse->index outside sizes[] */
+		return -EINVAL;
+
+	fse->min_width = sizes->width;
+	fse->max_width = fse->min_width;
+	fse->min_height = sizes->height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+/* Find the index of link_freq in ox05b1s_csi2_link_freqs[] */
+static int ox05b1s_find_link_freq_idx(s64 link_freq)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(ox05b1s_csi2_link_freqs); i++) {
+		if (ox05b1s_csi2_link_freqs[i] == link_freq)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+/* Update control ranges based on current streaming mode, needs sensor lock */
+static int ox05b1s_update_controls(struct ox05b1s *sensor)
+{
+	struct v4l2_ctrl *exp = sensor->ctrls.exposure;
+	struct device *dev = &sensor->i2c_client->dev;
+	u32 hts = sensor->mode->hts;
+	u32 hblank;
+	u32 vts = sensor->mode->vts;
+	u32 vblank = vts - sensor->mode->height;
+	int link_freq_idx;
+	u64 pixel_rate;
+	u32 min_exp = 1;
+	u32 max_exp = sensor->mode->exp;
+	int ret;
+
+	/*
+	 * pixel_rate = link_freq * 2 * num_data_lanes / bpp
+	 * This is the pixel throughput on the sensor output bus.
+	 */
+	pixel_rate = div_u64((u64)sensor->mode->link_freq * 2 *
+			     sensor->num_data_lanes,
+			     sensor->mode->bpp);
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.pixel_rate, pixel_rate,
+				       pixel_rate, 1, pixel_rate);
+	if (ret) {
+		dev_err(dev, "Modify range for pixel_rate %llu-%llu failed\n",
+			pixel_rate, pixel_rate);
+		goto out;
+	}
+
+	link_freq_idx = ox05b1s_find_link_freq_idx(sensor->mode->link_freq);
+	if (link_freq_idx < 0) {
+		dev_err(dev, "link_freq %lld not in link_freqs table\n",
+			sensor->mode->link_freq);
+		ret = link_freq_idx;
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.link_freq, link_freq_idx);
+
+	/*
+	 * hblank in pixels = HTS_cycles * pixel_rate / sa1_clk - width
+	 * Computed as u64 to avoid overflow, then truncated to u32.
+	 */
+	hblank = (u32)div_u64((u64)hts * pixel_rate,
+			      sensor->mode->sa1_clk) - sensor->mode->width;
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.hblank, hblank, hblank,
+				       1, hblank);
+	if (ret) {
+		dev_err(dev, "Modify range for hblank %u-%u failed\n",
+			hblank, hblank);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.hblank,
+			   sensor->ctrls.hblank->default_value);
+
+	ret = __v4l2_ctrl_modify_range(sensor->ctrls.vblank, 0, vblank * 4,
+				       1, vblank);
+	if (ret) {
+		dev_err(dev, "Modify range for vblank %u-%u failed\n",
+			vblank, vblank);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.vblank,
+			   sensor->ctrls.vblank->default_value);
+
+	ret = __v4l2_ctrl_modify_range(exp, min_exp, max_exp,
+				       1, max_exp / 2);
+	if (ret) {
+		dev_err(dev, "Modify range for exposure %u-%u failed\n",
+			min_exp, max_exp);
+		goto out;
+	}
+	__v4l2_ctrl_s_ctrl(sensor->ctrls.exposure,
+			   clamp((u32)exp->val, min_exp, max_exp));
+
+out:
+	return ret;
+}
+
+static int ox05b1s_apply_mipi_num_lanes(struct ox05b1s *sensor)
+{
+	int ret = 0;
+	u32 reg;
+
+	switch (sensor->model->chip_id) {
+	case OX05B1S_CHIP_ID:
+		reg = OX05B1S_REG_SC_CMMN_REG10;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Update only the lane count field */
+	return cci_update_bits(sensor->regmap, reg,
+			       OX05B1S_MIPI_NLANE_MASK,
+			       sensor->num_data_lanes << OX05B1S_MIPI_NLANE_SHIFT,
+			       &ret);
+}
+
+/* needs sensor lock and power on */
+static int ox05b1s_apply_current_mode(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	const struct ox05b1s_reglist *reg_data = sensor->mode->reg_data;
+	u32 w = sensor->mode->width;
+	u32 h = sensor->mode->height;
+	int ret = 0;
+
+	cci_write(sensor->regmap, OX05B1S_REG_SW_RST, 0x01, &ret);
+
+	while (reg_data->regs) {
+		cci_multi_reg_write(sensor->regmap, reg_data->regs,
+				    reg_data->count, &ret);
+		if (ret)
+			goto out;
+		reg_data++;
+	}
+
+	cci_write(sensor->regmap, OX05B1S_REG_X_OUTPUT_SIZE, w, &ret);
+	cci_write(sensor->regmap, OX05B1S_REG_Y_OUTPUT_SIZE, h, &ret);
+
+	if (ret)
+		goto out;
+
+	ret = ox05b1s_apply_mipi_num_lanes(sensor);
+	dev_dbg(dev, "Mipi num lanes applied: %d\n", sensor->num_data_lanes);
+
+	if (ret)
+		goto out;
+
+	/* setup handler will write actual controls into sensor registers */
+	ret = __v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
+
+out:
+	if (ret < 0)
+		dev_err(dev, "Failed to apply mode %dx%d,bpp=%d\n", w, h,
+			sensor->mode->bpp);
+
+	return ret;
+}
+
+/* similar with v4l2_find_nearest_size but filter for mbus code, needs sensor lock */
+static const struct ox05b1s_mode *ox05b1s_nearest_size(const struct ox05b1s_mode *supported_modes,
+						       struct v4l2_subdev_format *fmt)
+{
+	u32 err, min_error = U32_MAX;
+	const struct ox05b1s_mode *best = NULL;
+
+	/* supported_modes should never be NULL, at least 1 mode supported */
+
+	for (; supported_modes->width; supported_modes++) {
+		const u32 w = supported_modes->width;
+		const u32 h = supported_modes->height;
+
+		if (supported_modes->code != fmt->format.code)
+			continue;
+
+		err = abs(w - fmt->format.width) + abs(h - fmt->format.height);
+		if (err > min_error)
+			continue;
+
+		min_error = err;
+		best = supported_modes;
+		if (!err)
+			break;
+	}
+
+	return best;
+}
+
+/* get a valid mbus code, either the requested one or the default one */
+static u32 ox05b1s_find_code(const struct ox05b1s_plat_data *model, u32 code)
+{
+	const struct ox05b1s_sizes *supported_codes = model->supported_codes;
+
+	while (supported_codes->code) {
+		if (supported_codes->code == code)
+			return code;
+		supported_codes++;
+	}
+
+	/* code not in supported_codes[] */
+	return model->supported_modes[model->default_mode_index].code;
+}
+
+static int ox05b1s_set_fmt(struct v4l2_subdev *sd,
+			   const struct v4l2_subdev_client_info *client_info,
+			   struct v4l2_subdev_state *state,
+			   struct v4l2_subdev_format *fmt)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &sensor->i2c_client->dev;
+	struct v4l2_mbus_framefmt *format;
+	const struct ox05b1s_mode *mode;
+	int ret;
+
+	/* if no matching mbus code found, use the one from the default mode */
+	fmt->format.code = ox05b1s_find_code(sensor->model, fmt->format.code);
+	/* mode cannot be NULL, as the above mbus code is valid */
+	mode = ox05b1s_nearest_size(sensor->model->supported_modes, fmt);
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.field = V4L2_FIELD_NONE;
+
+	format = v4l2_subdev_state_get_format(state, 0);
+	*format = fmt->format;
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
+		return 0;
+
+	sensor->mode = mode;
+
+	/* update controls that depend on current mode */
+	ret = ox05b1s_update_controls(sensor);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "Set mode index=%d, %d x %d, code=0x%x\n",
+		sensor->mode->index,
+		fmt->format.width, fmt->format.height, fmt->format.code);
+
+	return 0;
+}
+
+static u8 ox05b1s_code2dt(const u32 code)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+		return MIPI_CSI2_DT_RAW10;
+	default:
+		return MIPI_CSI2_DT_RAW10;
+	}
+}
+
+static int ox05b1s_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	/* get sensor current code */
+	mutex_lock(&sensor->lock);
+	fd->entry[0].pixelcode = sensor->mode->code;
+	mutex_unlock(&sensor->lock);
+
+	fd->entry[0].bus.csi2.vc = 0;
+	fd->entry[0].bus.csi2.dt = ox05b1s_code2dt(fd->entry[0].pixelcode);
+
+	return 0;
+}
+
+static int ox05b1s_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *client_info,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+
+	switch (sel->target) {
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = sensor->model->native_width;
+		sel->r.height = sensor->model->native_height;
+		return 0;
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.top = sensor->model->active_top;
+		sel->r.left = sensor->model->active_left;
+		sel->r.width = sensor->model->active_width;
+		sel->r.height = sensor->model->active_height;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int ox05b1s_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 src_pad, u64 streams_mask)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &sensor->i2c_client->dev;
+	int ret;
+
+	dev_dbg(dev, "Enable streams with mask %llx\n", streams_mask);
+	if (!sensor->enabled_source_streams) {
+		/* start the sensor on the first enabled stream */
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
+			return ret;
+		ret = ox05b1s_apply_current_mode(sensor);
+		if (!ret)
+			ret = cci_write(sensor->regmap, OX05B1S_REG_SW_STB,
+					0x01, NULL);
+		if (ret) {
+			pm_runtime_mark_last_busy(&client->dev);
+			pm_runtime_put_autosuspend(&client->dev);
+			return ret;
+		}
+	}
+	sensor->enabled_source_streams |= streams_mask;
+
+	return 0;
+}
+
+static int ox05b1s_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 src_pad, u64 streams_mask)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &sensor->i2c_client->dev;
+	int ret = 0;
+
+	dev_dbg(dev, "Disable streams with mask %llx\n", streams_mask);
+	sensor->enabled_source_streams &= ~streams_mask;
+	/* stop the sensor when no more streams are enabled */
+	if (!sensor->enabled_source_streams) {
+		ret = cci_write(sensor->regmap, OX05B1S_REG_SW_STB, 0x00, NULL);
+		pm_runtime_mark_last_busy(&client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_video_ops ox05b1s_subdev_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops ox05b1s_subdev_pad_ops = {
+	.set_fmt		= ox05b1s_set_fmt,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.get_frame_desc		= ox05b1s_get_frame_desc,
+	.enum_mbus_code		= ox05b1s_enum_mbus_code,
+	.enum_frame_size	= ox05b1s_enum_frame_size,
+	.get_selection		= ox05b1s_get_selection,
+	.enable_streams		= ox05b1s_enable_streams,
+	.disable_streams	= ox05b1s_disable_streams,
+};
+
+static const struct v4l2_subdev_ops ox05b1s_subdev_ops = {
+	.video = &ox05b1s_subdev_video_ops,
+	.pad   = &ox05b1s_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops ox05b1s_internal_ops = {
+	.init_state = ox05b1s_init_state,
+};
+
+static void ox05b1s_get_gpios(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+
+	sensor->rst_gpio = devm_gpiod_get_optional(dev, "reset",
+						   GPIOD_OUT_HIGH);
+	if (!sensor->rst_gpio)
+		dev_warn(dev, "Optional sensor reset pin not available\n");
+}
+
+static int ox05b1s_get_regulators(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	unsigned int i;
+
+	for (i = 0; i < OX05B1S_NUM_SUPPLIES; i++)
+		sensor->supplies[i].supply = ox05b1s_supply_name[i];
+
+	return devm_regulator_bulk_get(dev, OX05B1S_NUM_SUPPLIES,
+				       sensor->supplies);
+}
+
+static int ox05b1s_read_chip_id(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	u64 chip_id;
+	char *camera_name;
+	int ret;
+
+	ret = cci_read(sensor->regmap, OX05B1S_REG_CHIP_ID, &chip_id, NULL);
+	if (ret) {
+		dev_err(dev, "Camera chip_id read error\n");
+		return -ENODEV;
+	}
+
+	switch (chip_id) {
+	case OX05B1S_CHIP_ID:
+		camera_name = "ox05b1s";
+		break;
+	default:
+		camera_name = "unknown";
+		break;
+	}
+
+	if (chip_id == sensor->model->chip_id) {
+		dev_dbg(dev, "Camera %s detected, chip_id=%llx\n",
+			camera_name, chip_id);
+	} else {
+		dev_err(dev, "Detected %s camera (chip_id=%llx), but expected %s (chip_id=%x)\n",
+			camera_name, chip_id,
+			sensor->model->name, sensor->model->chip_id);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int ox05b1s_get_num_data_lanes(struct ox05b1s *sensor)
+{
+	struct device *dev = &sensor->i2c_client->dev;
+	struct fwnode_handle *endpoint;
+	struct v4l2_fwnode_endpoint ep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	int ret;
+
+	/* Find the first sink endpoint of the sensor */
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "No endpoint found in graph\n");
+		return -ENODEV;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(endpoint, &ep);
+	fwnode_handle_put(endpoint);
+	if (ret) {
+		dev_err(dev, "Failed to parse endpoint: %d\n", ret);
+		return ret;
+	}
+
+	if (ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "Unsupported bus type %u\n", ep.bus_type);
+		return -EINVAL;
+	}
+
+	sensor->num_data_lanes = ep.bus.mipi_csi2.num_data_lanes;
+	/*
+	 * Restrict the configuration to 4 CSI-2 data lanes until support for
+	 * additional lane configurations is implemented and validated.
+	 */
+	if (sensor->num_data_lanes != 4) {
+		dev_err(dev, "Only 4 CSI-2 data lanes are supported\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ox05b1s_probe(struct i2c_client *client)
+{
+	int ret;
+	struct device *dev = &client->dev;
+	struct v4l2_subdev *sd;
+	struct ox05b1s *sensor;
+
+	sensor = devm_kzalloc(dev, sizeof(*sensor), GFP_KERNEL);
+	if (!sensor)
+		return -ENOMEM;
+
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap))
+		return dev_err_probe(dev, PTR_ERR(sensor->regmap),
+				     "Failed to allocate sensor register map\n");
+
+	sensor->i2c_client = client;
+
+	sensor->model = of_device_get_match_data(dev);
+
+	ox05b1s_get_gpios(sensor);
+	if (IS_ERR(sensor->rst_gpio))
+		return dev_err_probe(dev, PTR_ERR(sensor->rst_gpio),
+				     "Failed to get reset GPIO\n");
+
+	/* Get system clock, xvclk */
+	sensor->sensor_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(sensor->sensor_clk))
+		return dev_err_probe(dev, PTR_ERR(sensor->sensor_clk),
+				     "Failed to get xvclk\n");
+
+	ret = ox05b1s_get_regulators(sensor);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulators\n");
+
+	ret = ox05b1s_get_num_data_lanes(sensor);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get number of MIPI data lanes\n");
+
+	sd = &sensor->subdev;
+	v4l2_i2c_subdev_init(sd, client, &ox05b1s_subdev_ops);
+	sd->internal_ops = &ox05b1s_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->dev = &client->dev;
+	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	sensor->pads[OX05B1S_SENS_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, OX05B1S_SENS_PADS_NUM,
+				     sensor->pads);
+	if (ret)
+		goto probe_out;
+
+	ret = devm_mutex_init(dev, &sensor->lock);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to initialize lock\n");
+		goto probe_err_entity_cleanup;
+	}
+
+	ret = ox05b1s_init_controls(sensor);
+	if (ret)
+		goto probe_err_entity_cleanup;
+
+	/* power on manually */
+	ret = ox05b1s_power_on(sensor);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to power on\n");
+		goto probe_err_free_ctrls;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_get_noresume(dev);
+	pm_runtime_enable(dev);
+
+	ret = ox05b1s_read_chip_id(sensor);
+	if (ret)
+		goto probe_err_pm_runtime;
+
+	v4l2_i2c_subdev_set_name(sd, client, sensor->model->name, NULL);
+
+	mutex_lock(&sensor->lock);
+	sensor->mode = &sensor->model->supported_modes[0];
+	ret = ox05b1s_update_controls(sensor);
+	mutex_unlock(&sensor->lock);
+	if (ret)
+		goto probe_err_pm_runtime;
+
+	/* Centrally managed subdev active state */
+	sd->state_lock = &sensor->lock;
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Subdev init error: %d\n", ret);
+		goto probe_err_pm_runtime;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(sd);
+	if (ret < 0) {
+		dev_err_probe(&client->dev, ret,
+			      "Async register failed, ret=%d\n", ret);
+		goto probe_err_subdev_cleanup;
+	}
+
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+
+probe_err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+probe_err_pm_runtime:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
+	ox05b1s_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+probe_err_free_ctrls:
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+probe_err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+probe_out:
+	return ret;
+}
+
+static void ox05b1s_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ox05b1s *sensor = client_to_ox05b1s(client);
+	struct device *dev = &client->dev;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		ox05b1s_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ox05b1s_pm_ops, ox05b1s_runtime_suspend,
+				 ox05b1s_runtime_resume, NULL);
+
+static const struct ox05b1s_plat_data ox05b1s_data = {
+	.name			= "ox05b1s",
+	.chip_id		= 0x580542,
+	.native_width		= 2608, /* 8 dummy + 2592 active + 8 dummy */
+	.native_height		= 1960, /* 8 dummy + 1944 active + 8 dummy */
+	.active_top		= 8,
+	.active_left		= 8,
+	.active_width		= 2592,
+	.active_height		= 1944,
+	.supported_modes	= ox05b1s_supported_modes,
+	.default_mode_index	= 0,
+	.supported_codes	= ox05b1s_supported_codes,
+};
+
+static const struct of_device_id ox05b1s_of_match[] = {
+	{
+		.compatible = "ovti,ox05b1s",
+		.data = &ox05b1s_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ox05b1s_of_match);
+
+static struct i2c_driver ox05b1s_i2c_driver = {
+	.driver = {
+		.name = "ox05b1s",
+		.pm = pm_ptr(&ox05b1s_pm_ops),
+		.of_match_table	= ox05b1s_of_match,
+	},
+	.probe	= ox05b1s_probe,
+	.remove = ox05b1s_remove,
+};
+
+module_i2c_driver(ox05b1s_i2c_driver);
+MODULE_DESCRIPTION("Omnivision OX05B1S MIPI Camera Subdev Driver");
+MODULE_AUTHOR("Mirela Rabulea <mirela.rabulea@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/i2c/ox05b1s/ox05b1s_modes.c b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
new file mode 100644
index 000000000000..c7371418bbd0
--- /dev/null
+++ b/drivers/media/i2c/ox05b1s/ox05b1s_modes.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Register configurations for all sensor supported modes
+ * Copyright 2024-2025, NXP
+ * Copyright 2024, Omnivision
+ * Copyright 2024, Verisilicon
+ *
+ */
+
+#include <media/v4l2-cci.h>
+#include "ox05b1s.h"
+
+#define OX05B1S_REG_PLL1_CTRL_REG07	CCI_REG8(0x0307)
+#define OX05B1S_REG_PLL3_CTRL_REG4A	CCI_REG8(0x034a)
+#define OX05B1S_REG_PLL_MONITOR_REG0B	CCI_REG8(0x040b)
+#define OX05B1S_REG_PLL_MONITOR_REG0C	CCI_REG8(0x040c)
+#define OX05B1S_REG_SC_CMMN_REG09	CCI_REG8(0x3009)
+#define OX05B1S_REG_GROUP_HLD_REG19	CCI_REG8(0x3219)
+#define OX05B1S_REG_ANA_REG		CCI_REG8(0x3600)
+#define OX05B1S_REG_SENSOR_CTRL02	CCI_REG8(0x3702)
+#define OX05B1S_REG_TIMING_CTRL		CCI_REG8(0x3800)
+#define OX05B1S_REG_MIPI_CORE_REG02	CCI_REG8(0x4802)
+#define OX05B1S_REG_MIPI_CORE_REG1B	CCI_REG8(0x481b)
+#define OX05B1S_REG_PCLK_PERIOD		CCI_REG8(0x4837)
+#define OX05B1S_REG_ISP_REG01		CCI_REG8(0x5001)
+
+/* OX05B1S 2592 x 1944 @30fps GRBG10 */
+static const struct cci_reg_sequence ovx5b_init_setting_2592x1944[] = {
+	{CCI_REG8(0x0107), 0x01}, /* Reserved */
+	{OX05B1S_REG_PLL1_CTRL_REG07, 0x02},
+	{OX05B1S_REG_PLL3_CTRL_REG4A, 0x05},
+	{OX05B1S_REG_PLL_MONITOR_REG0B, 0x5c},
+	{OX05B1S_REG_PLL_MONITOR_REG0C, 0xcd},
+	{OX05B1S_REG_SC_CMMN_REG09, 0x2e},
+	{OX05B1S_REG_GROUP_HLD_REG19, 0x08},
+	{OX05B1S_REG_ANA_REG + 0x84, 0x6d},
+	{OX05B1S_REG_ANA_REG + 0x85, 0x6d},
+	{OX05B1S_REG_ANA_REG + 0x86, 0x6d},
+	{OX05B1S_REG_ANA_REG + 0x87, 0x6d},
+	{OX05B1S_REG_ANA_REG + 0x8c, 0x07},
+	{OX05B1S_REG_ANA_REG + 0x8d, 0x07},
+	{OX05B1S_REG_ANA_REG + 0x8e, 0x07},
+	{OX05B1S_REG_ANA_REG + 0x8f, 0x00},
+	{OX05B1S_REG_ANA_REG + 0x90, 0x04},
+	{OX05B1S_REG_ANA_REG + 0x91, 0x04},
+	{OX05B1S_REG_ANA_REG + 0x92, 0x04},
+	{OX05B1S_REG_ANA_REG + 0x93, 0x04},
+	{OX05B1S_REG_ANA_REG + 0x98, 0x00},
+	{OX05B1S_REG_ANA_REG + 0xa0, 0x05},
+	{OX05B1S_REG_ANA_REG + 0xa2, 0x16},
+	{OX05B1S_REG_ANA_REG + 0xa3, 0x03},
+	{OX05B1S_REG_ANA_REG + 0xa4, 0x07},
+	{OX05B1S_REG_ANA_REG + 0xa5, 0x24},
+	{OX05B1S_REG_ANA_REG + 0xe3, 0x09},
+	{OX05B1S_REG_SENSOR_CTRL02, 0x0a},
+	{OX05B1S_REG_TIMING_CTRL + 0x21, 0x04}, /* mirror */
+	{OX05B1S_REG_TIMING_CTRL + 0x22, 0x10},
+	{OX05B1S_REG_TIMING_CTRL + 0x2b, 0x03},
+	{OX05B1S_REG_TIMING_CTRL + 0x66, 0x10},
+	{OX05B1S_REG_TIMING_CTRL + 0x6c, 0x46},
+	{OX05B1S_REG_TIMING_CTRL + 0x6d, 0x08},
+	{OX05B1S_REG_TIMING_CTRL + 0x6e, 0x7b},
+	{OX05B1S_REG_MIPI_CORE_REG02, 0x00},
+	{OX05B1S_REG_MIPI_CORE_REG1B, 0x3c},
+	{OX05B1S_REG_PCLK_PERIOD, 0x19},
+	{OX05B1S_REG_ISP_REG01, 0x00},
+};
+
+const struct ox05b1s_reglist ox05b1s_reglist_2592x1944[] = {
+	{
+		.regs = ovx5b_init_setting_2592x1944,
+		.count = ARRAY_SIZE(ovx5b_init_setting_2592x1944),
+	},
+	{
+		/* sentinel */
+	}
+};
-- 
2.43.0

