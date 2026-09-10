Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D98388E72;
	Thu, 10 Sep 2026 20:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070461; cv=fail; b=n62KEOQ7iNFYXeaxdW7aSl2CayGb79S/TfS6KZycpCWJ50Nq6fraL03rYNc3mqnMCrTB8VeOTciGQdqze9ilzXSQM7J8CPnz3vftRv8ra9seGCkxBOf4SFIg/SW7ZHOYmufUlrpZtqS/d+UL8pXFR+dp8uljaPAfgq5eTgkd8ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070461; c=relaxed/simple;
	bh=YoDAxxmRKDVuXgQxPJ0/0P4cVR4tz9BvxoLLFoqvN8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gkzsgjCMZPQ2kF326d/fA5Asb38fknqYMobIPqrtvTgutnRYKF4qUfwQJqdW1vv8ihF6GID6S3nKjqbGO+wChWLhwYvTeMAzybW5NEuXQdP/6VvppRJChPrjVZtHm/Hiu8uLR065xPST+U4JXYLANCZFV09KBoi4PyZFIcLe8jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dLiJFZWW; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dLiJFZWW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5DAa4eatw0ZujFPE2zNAAbfmJQ2slY6X0Hd/4DKk0tVjO16wHXpL3Hg1kAW2E3L68FJkJVP9OmVBOEzSp/2svVRpSwC69qq3ne/9JccQhLEVk2pkVHNqu2gu8pI5phXBPbreSrKtXnhIKcjgOklswgRZKZRLfLMX6foHtXmp1SCdzk+gjLtfWwHTxsB8ColWLiVSn0VcmpKYFebWCQiwRpukmQ2if3gn0GDUTejn5MkVZhVszyutL5AEQcVEpBsSfqIPyqXefhXfZ5h4OPDyjWgm/UcBg4NH5fJIgj+u2pfs9JffzXuTbWF/GPjOQkzxsKxZoSIsTtLu9BVcNIIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXk0qLzumkeWHKGn2E4m00nTu6We02N0NBhHR8mYOJQ=;
 b=Aj6TG4U2M+BFftjNAa0vFU22d0reYqnyH1kLlEpNST9q4fkNZkf0x8973/t8TEN6WF+hjtirLEa2xHuVhcFEYrIorihUyrYfXnVwamrDHLYKLwPE85LgrCmWpKSuFzS4Oe6jpNdZSveuU9b6wXtylt/MPipAVhrzBzFgnator1rjVgW6f4VfgZcF7lIBtXlbS4GJ6cIcGBm4mNLjvLjoxLr5pjCYGgqSLMhI1e7BP5PQaEvfB1WTHBeOVIkzrswNDAErKlyA/EGwb0aVtLJ1pdEnUv489UuSR+OuKDQjtI6yhuNIiCJ8uQi5Qmmzittvg7Hf9H4S1gPzgjlhh5BzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXk0qLzumkeWHKGn2E4m00nTu6We02N0NBhHR8mYOJQ=;
 b=dLiJFZWWTuZVqJPgMguw64gsmMnQG+YJ/jg/vJ7CdsnCznckXUP0cFJeD0+8wtsNK8oQUVHWHORcdJtckbGys8pDzlUYLzXc7G1wlBIOww8peGrm63rZu7WbmOqvbltGxStLcRIGDY34W/P6S8Q8kW2/C1VprQhLv/mVO7HrKU2Zr5QwHkt45v8GbSdv6SBlidARt4PjtU0wWZ0wh9UQltmVwSntiPzgiuQvtraS+TSxFLsSylM6wUzza/TEjBqwOp4uX3kUReJy5GjPRXUHT6apgfntImcjtojNYEcLkpcmpie1W0uAPDN/HF+SM/EIGsl9C/vVIdAqG2Emy6lAvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB9091.eurprd04.prod.outlook.com (2603:10a6:102:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 20:00:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 20:00:51 +0000
Date: Thu, 10 Sep 2026 16:00:42 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com, lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org
Subject: Re: [PATCH v7 0/9] Add support for Wave6 video codec driver
Message-ID: <aqMMap6NHllxh1st@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788496816.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH7P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d7ec78-fc33-4b62-a8f7-08df0f7636c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|7416014|376014|366016|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5BhybztGiAbriC4ZkbQc4hshTAuhmCYm1VjHnEmaXKNaiWSpZ0wvsoDxbHbXDwfKBg27a7K0IlNhqBiNcsuRhKBGW6BioBlebiCNSQdFynQpgWWVZPsj2FAHFCUBwnag0QTxRhARr1MF99ZlKLjCDLhvRxDP8bSD9zZe+eGlYFsVlRYqXmCwDLzlWAjwqHkxu6nYlsn9/BEJv4Dc7ZJUPIApiRKnlXyt/t+bIzFEDh2HTm/F6UuHKA1uFsLwUOFG42reQ1s53i1ca1hS6+ZRKpgGe/K4yPvLny5apUfsgKZJxHn+noQewVMAQAKv+fPu5RTBqWgxVXQC6bK8FdPYZcHHNw5hjH+0548Y8QSV8PyqZ8ltLfEL7wv/4ztUzFnk4XEOAWtabDELQo2dggSjnOoVDs5QBBflmmUYAO87VOcCvQVK2/SvKegV6iFoAv9KikB7B5An6bu2gwfZz26Mort55oX9goX/T8BSKb7w+NvG1Chwpev7B87QrGKdsH1U6X8py60hh0u4qjK4ANFbEf4wLJqnEAWue94mc+C7tqaEcszZgorBGJH25BZh89AjlZpELHLzLgfgvMbmMMV1VOQS9yLZGFez5D/ole4TAkEoaX3VfzQ121DvyrFm43b21NLLq59nrGuD4bk0ALTsBE1R3KXBtXJMqbzYE+ExcLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(7416014)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c+8mEBPKfCVF/KotcP9Lmo0jGXjz4tflH8LRcL2wa6w1kskMwID+lDpkrp5i?=
 =?us-ascii?Q?7Bdr3NrlMfnhbN319YS14tRpNmp5e5WXdpYNrJS6Q0vn+6E+TFJ16iiEBzy+?=
 =?us-ascii?Q?7/DKr1Z18mucfhqO2pFUyPb0vjDvwc3yD6AlzKUoo33EsJtIiaUUMaQLnqWn?=
 =?us-ascii?Q?fNX14eN8l4GBueSYM2sAtEhFEsrpY8wFUVs2T41wsAISovma7QsOf7OIIvcu?=
 =?us-ascii?Q?4Ho/0y6ik+3mmcULHKzeKipN62l75X16Z7jcitv90m5Czm2eolhSMbbNAFU8?=
 =?us-ascii?Q?DSExowNQyGH8bO5Wix6p2JnEH8qrKYHGAUpdNRmkbgorhViwjwwB17XM9hW0?=
 =?us-ascii?Q?pGlvBKbGYkEbSiwHZEUaAYXdeiWmYy/EbwH+WbVZaG7ikYgpKcaMPKR6Fe3p?=
 =?us-ascii?Q?64OrtDm44XTLziOdc/ZhTKRU9Bl0V+2jzdneBcquo2Psg+j+2PpJlPkdIoGy?=
 =?us-ascii?Q?w8PVUuAsEwTRJZveYGn6PpxG4gQ8Xlu7MceamIdG89qnHd0DKg6LdN4ujyzI?=
 =?us-ascii?Q?lkqwKWZ3Nyn8T+Eg6M/8Bro1GP30Sw9kYzpQ+T8f8pOxC3VhiIvO/dHgZNxi?=
 =?us-ascii?Q?lmPaThKqVPvxjtROFFMZqDwA/oalX+dZ7GxJQr516I/jLy6VV22I0iwDn+ah?=
 =?us-ascii?Q?L5HAm//pnG1/TANmw8r8NLbtydXJUOoCr6dIUZ5nPmeYyjAK4RtrQM6Y+Qlb?=
 =?us-ascii?Q?VKqQFe33Nnvh9c/7lL0LL2fJozmkNkFBAaTYT321po+w/9neXBqCG70Enp6d?=
 =?us-ascii?Q?8plcHn3SztfqYJ6HcUUz6s3fVbcT6BwS4xfoG1pICbGMUfl8GYDRtub2ApsZ?=
 =?us-ascii?Q?UeL1FkKUlURUjg5tABl7SzqhvQZJ6EfKxp4li3pTtFK8MAG1zFlc1+JHbOeY?=
 =?us-ascii?Q?fYIIePnDJWGRLgDg8D870fy5DFN3umCm5yctbSXnwywWxJWzSPOiYpE2JOpz?=
 =?us-ascii?Q?0Aqt2vJkrE9jwoVxZp83rjMCjhhA62vvHR4gjKLmrPtYgI4ElTSl2XsFIB4X?=
 =?us-ascii?Q?/7YXBRJaDC8SeInPkYaJ606XDxVgv2iDE6MhWIKjPCmLCTFTHzwb0wOhsME4?=
 =?us-ascii?Q?WaXqk5gTzv1/aD9e65+LqX3oIqshuiThwS9slMG+t+D7TgDrJTBCXxeuNCpa?=
 =?us-ascii?Q?+cg/D2AVs/WWdb4t2bnEJsX4QCgLHxUdWbzR2U6RrbJ2dU7fH993k95t5buQ?=
 =?us-ascii?Q?+7AXefr1SKtsbWWv8FcbfzQA0AIZ/ZhNfM4ir/YLwXwRFhq79vye3Jj78puT?=
 =?us-ascii?Q?PqFETnayWMCgmfrUgnrvx5b5tsoQ1Bq8pTbXAZGdnsTTnxVsSzPJ86b4fW9G?=
 =?us-ascii?Q?7yZbdJMdO1ughJZShfPP6ZRvFXvn0FhmUX9gGURGvn7Va1/+ZCXAvZgnAyqT?=
 =?us-ascii?Q?fxdNzrEVBjoDNLoxJAEgTYMUzeGo+P7JItvNPnG9jgRUdE+NHAKtvao0hvc8?=
 =?us-ascii?Q?sn7+3LcMyd1OCYC7Okcl+m527sLA1eXyQjJstOylih1P4+AMiKqsX/u52c5B?=
 =?us-ascii?Q?jd9ArjeaDUEV3sjOlW9rts5+vN6yNh+6QfiRMgaEwX5YIpanI0phLie8zWto?=
 =?us-ascii?Q?Vccfhu3sAwjZo4gJ55/b+SojLuy8SBIkBdmXygIbjqdLUNIB+tYqBaF5s3M7?=
 =?us-ascii?Q?GV3DoUtdR3+0+OWfAPtcxSz++AZe8NiGlw73DWTI9WbOXVvE1cKpOcVy9vmK?=
 =?us-ascii?Q?L+eqdrGj+HOeBAHS+lC4c4eyUetbD3Cn3v3RZwwN66OI3dGX4Kjyb8Te2zVu?=
 =?us-ascii?Q?pLbtVBhmSMWLN4zJunDOpKFQEwq/ZhqkwiU12QU5E8QOAJxQD6aY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d7ec78-fc33-4b62-a8f7-08df0f7636c6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 20:00:51.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmkIjnTMADovvo5ebAfimGDUrI5BygY70DtHWvWu4DB7uwMDtxX9AnsjJ/jcSEV7x91fluMu5l66xtHKpBks4I5aETJJKChHMEw/GXpKuUEIPSNynZywIFCHmFpynsFx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9091

On Fri, Sep 04, 2026 at 03:46:26PM +0900, Nas Chung wrote:
> This patch series introduces support for the Chips&Media Wave6 video
> codec IP, a completely different hardware architecture compared to Wave5.
>
> The wave6 driver is a M2M stateful encoder/decoder driver.
> It supports various video formats, including H.264 and H.265, for both encoding
> and decoding.
> While other versions of the Wave6 IP may support VP9 decoding and AV1 decoding
> and encoding those formats are not implemented or validated in this driver at
> this time.
>
> On NXP i.MX SoCs, the Wave6 hardware exposes one control register region and
> four interface register regions for one shared video processing engine.
> VPU Control region, Manages shared resources such as firmware memory.
> VPU Core region, Provides encoding and decoding capabilities.
> The control and interface regions are distinct DMA requesters and can be
> associated with separate IOMMU stream IDs, allowing DMA isolation between them.
>
> The interface regions are described as child nodes of the VPU node rather
> than folded into the parent with reg-names/interrupt-names, because each
> one is a separate DMA requester. This follows the same structure already
> accepted for the Qualcomm video codec bindings, and was mentioned on the v6
> thread.
>
> The firmware tested by this driver has been upstreamed in linux-firmware:
> - Path: cnm/wave633c_imx9_codec_fw.bin
>
> This driver has been tested with GStreamer on:
> - NXP i.MX95 board
> - pre-silicon FPGA environment
>
> Test results for decoder fluster with -j2 option:
> - JVT-AVC_V1, Ran 77/135 tests successfully              in 24.180 secs
> - JVT-FR-EXT, Ran 25/69 tests successfully               in 11.157 secs
> - JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 45.534 secs
> - All failures are due to unsupported hardware features:
> -- 10bit, Resolutions higher than 4K, FMO, MBAFF
> -- Extended profile, Field encoding and High422 sreams.
>
> Test results for v4l2-compliance:
> v4l2-compliance 1.31.0-5386, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 48316b8a20aa 2025-08-12 12:44:56
>
> Compliance test for wave6-dec device /dev/video0:
>                 fail: v4l2-test-controls.cpp(1204): !have_source_change || !have_eos
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0
>
> Compliance test for wave6-enc device /dev/video1:
>                 fail: v4l2-test-controls.cpp(1193): node->codec_mask & STATEFUL_ENCODER
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0
>
> Note: the failures are all related with the eos event.
>
> Changelog:
>
> v7:
> - Moved the sram property from imx95-19x19-evk.dts to imx95.dtsi
> - Simplified the sram binding property to maxItems: 1
> - Fixed the issues reported by the sashiko-bot review of v6:
>   - Bounded frame buffer and aux buffer counts before indexing
>   - Added vb2_is_busy() checks to the decoder S_FMT handlers
>   - Fixed video_device lifetime and driver teardown ordering
>   - Propagated hardware init, runtime PM and thermal failures upward
>   - Fixed tracepoint field widths and debugfs handling
> - Balanced the VPU reference on the core activation error path
>
> v6:
> - Fixed the existing P010 format_info entry
> - Moved all encoder parameter validation from the HW layer into the V4L2 layer
> - Removed redundant HW-abstraction wrappers from the VPU API layer
> - Computed frame stride and sizeimage in the V4L2 layer
> - Added explicit instance lifecycle helpers to the core driver
> - Enabled the VPU only on the tested imx95-19x19-evk board
>
> RFC v5:
> - Move all shared resources to the parent node
> - Drop child compatible and use data-only interface child nodes
> - Update the VPU driver to create child devices and load the core driver
>
> v4:
> - Fixed build issues reported by CI tools
> - Updated commit messages to use imperative mood
> - Avoided using the same name for both nodes and labels in devicetree
> - Removed unused labels from YAML examples
> - Added description for child(vpu-core) node
> - Added iommus property to both parent(vpu) and child(vpu-core) nodes
> - Updated probe() functions to use dev_err_probe() when returning -EPROBE_DEFER
> - Added wave6_vpu prefix to trace functions
> - Updated HEVC decoder profile control to report MAIN_STILL profile
> - Fixed bug in multiple instance creation by pre-allocating work buffer
> - Fixed interrupt handling by checking INSTANCE_INFO register and instance list
>
> v3:
> - Removed ambiguous SUPPORT_FOLLOWER feature
> - Used WARN_ON() for unexpected programming errors
> - Split thermal device code into wave6-vpu-thermal.c/h
> - Dropped wave6_cooling_disable module parameter
> - Replaced mutex_lock() with guard()
> - Added lockdep_assert_held() to clarify locking regions
> - Removed exported function due to dual-license and used function pointer
> - Added documentation and validation for state transitions
> - Added documentation for device structures
> - Added patch to enable VPU device in imx95 DTS
> - Updated DT bindings and driver to align with parent(vpu) and child(vpu-core)
> - Replaced magic numbers with mask and offset macros when accessing registers
> - Placed goto statements after an empty line
> - Printed HW info (e.g. product_code) via dev_dbg() for debugging
> - Replaced wave6_vpu_dec_give_command() with dedicated functions
>
> v2:
> - Refined DT bindings to better represent the hardware
> - Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
> - Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
> - Improved commit messages with clearer descriptions
> - Added kernel-doc for exported functions
> - Removed redundant print statements and unused code
> - Reordered patches to prevent build failures
>
> Nas Chung (9):
>   media: v4l2-common: Fix P010 format info
>   dt-bindings: media: nxp: Add Wave6 video codec device
>   media: chips-media: wave6: Add Wave6 VPU interface
>   media: chips-media: wave6: Add v4l2 m2m driver support
>   media: chips-media: wave6: Add Wave6 core driver
>   media: chips-media: wave6: Improve debugging capabilities
>   media: chips-media: wave6: Add Wave6 thermal cooling device
>   media: chips-media: wave6: Add Wave6 control driver

This is quite big drivers. You enable build at finial patches, it is not
good. Each patch expect built-able.

I suggest split

1. core part with simplest decode driver. "You use git add -p to choose
which trunk to add"
2. Add encode part
3. Add m2m part
4. add debug and tracing
5. add performance profile
6. add thermal cooling device

Maintainer may pick subset.

binding + simplest decode + dts can be merged firstly.

Then gradulately add encode, m2m and other advance features.

Frank

>   arm64: dts: freescale: imx95: Add video codec node
>
>  .../bindings/media/nxp,imx95-vpu.yaml         |  162 +
>  MAINTAINERS                                   |    8 +
>  .../boot/dts/freescale/imx95-19x19-evk.dts    |   10 +
>  arch/arm64/boot/dts/freescale/imx95.dtsi      |   37 +
>  drivers/media/platform/chips-media/Kconfig    |    1 +
>  drivers/media/platform/chips-media/Makefile   |    1 +
>  .../media/platform/chips-media/wave6/Kconfig  |   17 +
>  .../media/platform/chips-media/wave6/Makefile |   17 +
>  .../platform/chips-media/wave6/wave6-hw.c     | 2030 ++++++++++++
>  .../platform/chips-media/wave6/wave6-hw.h     |   56 +
>  .../chips-media/wave6/wave6-regdefine.h       |  649 ++++
>  .../platform/chips-media/wave6/wave6-trace.h  |  289 ++
>  .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
>  .../chips-media/wave6/wave6-vpu-core.c        |  448 +++
>  .../chips-media/wave6/wave6-vpu-core.h        |  126 +
>  .../chips-media/wave6/wave6-vpu-dbg.c         |  183 ++
>  .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
>  .../chips-media/wave6/wave6-vpu-dec.c         | 1843 +++++++++++
>  .../chips-media/wave6/wave6-vpu-enc.c         | 2764 +++++++++++++++++
>  .../chips-media/wave6/wave6-vpu-thermal.c     |  143 +
>  .../chips-media/wave6/wave6-vpu-thermal.h     |   24 +
>  .../chips-media/wave6/wave6-vpu-v4l2.c        |  516 +++
>  .../platform/chips-media/wave6/wave6-vpu.c    |  826 +++++
>  .../platform/chips-media/wave6/wave6-vpu.h    |  143 +
>  .../platform/chips-media/wave6/wave6-vpuapi.c |  336 ++
>  .../platform/chips-media/wave6/wave6-vpuapi.h | 1007 ++++++
>  .../chips-media/wave6/wave6-vpuconfig.h       |   72 +
>  .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
>  drivers/media/v4l2-core/v4l2-common.c         |    2 +-
>  29 files changed, 12077 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
>  create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
>  create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h
>
> --
> 2.31.1
>
