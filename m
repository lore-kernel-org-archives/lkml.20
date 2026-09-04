Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020140.outbound.protection.outlook.com [52.101.156.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6943B813D;
	Fri,  4 Sep 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504414; cv=fail; b=peb8+2j7e2NeDF5tSLaKQUU+rPZ99OYjFNfbLqW2TNzR3MKOZJgqpC/KSi/wOHUCiRvd/jA+HObdBog2BBqEFDHWJGhhOhXo2MRPcXfRCScwgPOfUy0jF6pwsoqC2G64MP5R0hRStWcejrqeincTdWS1jeEtsH9hdLRiiH26HqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504414; c=relaxed/simple;
	bh=+DZZeVHM6f6qHC4dBplBdCdmpMmI6jvIdqH1Ik7iS9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=e+LslL4MkmELUfUzx7gYT3Wc8FVCzwqO2Q0RjDOB6vhooJDEnXqRgnPBBoD0vyHvxLcsb/h7CUOib1gkx2jiZHRTFP9+tCHBigOGsGtRpW98kyYpdwkoJ4pDmsMMldNwo35gWoTY9SV8nZdLZfpYM6siih9X//P1+6K4gM+pPRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iA7tdz2T; arc=fail smtp.client-ip=52.101.156.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iA7tdz2T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUxIRA1fpJXPV0gYXk+Ay9Z6dFpdGv62h8ySb2XD3ga6Gxr0r6QIui1apKzNAF0mze4nzzFuwfayCoHgeJH3r3AfOPa6C/t8ra7qU8BS75+PmhPdEt0HWzqlhUr9KQqWp6TgiWeLYiXBaMjSDnGJZDNhzVDohwMUAFPYIA+pzrfL6C9yoeh+u+0uW9Bpzj0LaiDE782LvEWAk3R2TCxO7TcDxw+tRkcv7LUZXARCZDCw1cXxnYEkriGsD17tE+vejhEmumaGN5z4g3G/QxjlIlRJvMGTbNUg8xdCpKhJ7D967YZZn8PJLX+3KXh1UxfTEtgh7rczePHuGY4ETUT9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn16a1cumiNtthlHdpERoaZCfsBycJyZDEApqGnQujs=;
 b=TMFXd9tnvnXoy7ZP1aMx2e41n1UFSnZM68R0cWcrrEf+Yz3lqfxX76XHmYBkZmbNefoEufRE24dtOfTqQvG/GVZHLLdue1Zgxo14NrkQzECYTeFQGnZFLIeVkTmoO1EHsjuX/QXYMAC6nUtBGxnJPVVxq30xvxVsddRkbKp/MedH70LupsNZY2R/JdYh56GJ2xZuGv0ueCb1GgE8AWh57K9s3xpJrc5Qr1tTdOq8+CA393mqb4/bDWjbPkkxkVzCRfUsy5W9rq0fNKUcrbqv7K9hkX8hfvvK6TenYzefnr6vrbb625diEV1h3FZN0MlhIJOug6AGAtKFSTl3pTQ6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn16a1cumiNtthlHdpERoaZCfsBycJyZDEApqGnQujs=;
 b=iA7tdz2TEFymme3c6vAo6iuFXAro2RJ0qfdNIzBRSOS7oKI69XkPLXtZKrF33cU+8ZosW0ZwNsxXSwX9VG9lYstGsSECKe/mNUn26arcXCasRvo2bBFq29I6l1jC0BmbvBTGLiQgfOMbIXHnlinYHvdpVj76Y+U4KpfBH3rzY5i5wYYC65GrmQ8ELasY+S5dnCFnnwiliT2teqzqHP2uu/lpiC2zEFfarDBuTE1ou/S8B7qzeJfX9zIYZxdKJRfg7Yu/20OJbUi7HDpydHNu+t0Q3rd5MP+PRjl1XDv1NBy/ZQZ5v10FpURtfOM3qKUSdokCTxekmkROPjsiLDTDIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SEWP216MB2979.KORP216.PROD.OUTLOOK.COM (2603:1096:101:296::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 06:46:44 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:46:44 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v7 0/9] Add support for Wave6 video codec driver
Date: Fri,  4 Sep 2026 15:46:26 +0900
Message-Id: <cover.1788496816.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SEWP216MB2979:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e3358a-8f5f-4dbb-ce7b-08df0a50487c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|52116014|366016|38350700014|6133799003|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dKpjt7z0SJu7m0yLsAuO6zbBpxbLaHLjqFwMaCzwBmFb7UOS4q18MxvAvw1DQwqj6IXYn5XnOQmSWbYNhwhEnXHPotXiuOGKhoXpkSvWPinPpMFJL2Lh5KgeqNnyUnFNSycUx7encjeVS6wpEV8/8mArQOMevLqe3TkQdymMcWksUcPeNXd4jcNxycFZwNshwEzyP8lT/eWSB4j65st9PFZh/8DIr4eXjt4EBJWYJ7/lFoJpeosy5QnU4uK3p7AxTyt1tsnpI2ute/5CCs/VHwtwCxdfr3tGkPEuS0FYG8z42WaEUnQ3/uMr5/PwrtY7KycNzGlcAjahd2VAdZrngpHn2erEGHvYILGh/ETCXr7R1mzY5ylB8i4Tpe4oT7qcRSyWAERqVHWCd6mnQxos3KW8JPl/N9gzFIFCCUia1IkrOLSUKjXbrDZbf47aRYfYdfapJgPETwVVIjpTdOI+YWDh/ZNttoc32njEzQFKrunv9r2I0PFhidiUSoefkZmCWsWAd+TdrAobntLWXB/Xt/AMskH/I6PMRlfF742Jwu3MVc4/hTL46+cELHh1+Xe2/cf6FtNljBBR/OthGF9rXn7ztsoTkdZSFsk9SfpeXe1mt7NQ51XHRQBHbkY21cOzh8Oc1nFc3nOu7dQPIFqdmrLlqj7y7M0k2v7G2rG6LH8HN1ptVzT9/cMtB1pOsajAqFggtOpRTaRgWfkro1uvegPVJmJitY6yUUykZQOz3YM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(52116014)(366016)(38350700014)(6133799003)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gsyHczDKtnSfsAlUFKTYwT4+8+0HfXBv4g0WgDpYFgkrDNwsWAcA1sDST5s+?=
 =?us-ascii?Q?/p5U6NxEVo9gky0FSHLySYwLZObI/haKO6jPTie73aABcx6UfZ3WYiEGV/gK?=
 =?us-ascii?Q?AMFPvfy0DqSU46NNjeq8zgmczGzXUq/BWGiU+w/2hoTM8xk2eDXKEORH4T1l?=
 =?us-ascii?Q?imJmp7LNIc9CgMV3lesgErxhVqF9bRPjt2TJGWPKFNfE5sB+F8OEGxpHmnty?=
 =?us-ascii?Q?1OtpIwUNDT9jiiHOP8/fvdAEk8ZenvLZ70Z0wunF5UNclaOvbgwooBmmDTDp?=
 =?us-ascii?Q?Ty8OwxPsfS/J1Igojtgxl2qutok6SuCWR/elptvH7RWHkF4swA0APQtNHdHz?=
 =?us-ascii?Q?ryPaXBMXB1uomr60aZbFON0MnjIWGK8319YhVUswqpCF37KCEsP2YrXjQ2uo?=
 =?us-ascii?Q?tcOWJJSUGyvb/Fd7/kH8y1a63RRT5uNE7Nq2uNX1htCEwydp10VL5/cI/vhr?=
 =?us-ascii?Q?Id+RSD3zAVsi+Fu2Eyrb6BxUJDZ7vMoU8OoD0VrNAMUsP84viBy8+odUlM5L?=
 =?us-ascii?Q?+413EbzG1XgB8cpaLOorxRe/vdz34lqv1knLnkC/1xolwgYoPklNWzL3u+N2?=
 =?us-ascii?Q?v6yi3uH/RNnMaUZ1fctogSZLSTbv5GXXRIB4HxqJtYoNsbhdFdT9nG83B0bz?=
 =?us-ascii?Q?vAEtHN1h0tdN95ibMa84nQr6CLPfoL81nysG18CYP+S47MWNewpFO6Tmb4C0?=
 =?us-ascii?Q?yCUblrnr9la/95+QpPiraA26JcNF2erT+sZlT/uQ55sOkBVHTMPyJo8tx5F1?=
 =?us-ascii?Q?7J0IIq9pDGA9KGphkvGFqdy6gGmbFjaBB2d8FgOD4ONHrQxJrgll8ov3Mypk?=
 =?us-ascii?Q?NSJkUrVr7MLkQuw64Xi5ghwjvqCUn2XIcc/abALbuweyhLZYi6WXFIr1kOF0?=
 =?us-ascii?Q?E8bLCj5wmXIq3z9AWMV4xMY+QnZPAlLUvS/kpQz6IpBCu7/qOJVllNm+Osfh?=
 =?us-ascii?Q?EDT9NYf8rQr3ZVWeYkjbzq/Q77wx7jwu7ltIXpekbHikeN9OmuBTWh05bp3E?=
 =?us-ascii?Q?rH5Qzh5wZF/0DchC4P8dpzFC61ZqXj3vG+BMvrBYVKIWGZEeILWlP5yGfxxy?=
 =?us-ascii?Q?gR5NipzOl9nhULKBjsXJmJfYm1ueGAyjP14WwBC/pYCfPXjmACsuiaWYG9bJ?=
 =?us-ascii?Q?WP3z6zwV9wZdtQn4wC33O1IghwjrRKuWQvijLN+kpt4NbPBV/9OqKxw5Z04Y?=
 =?us-ascii?Q?5mrOMAbOKOy+a/PpyFV822XzOVVw+yaVVkRejgsliY5TpxYUBzMVMm973Tes?=
 =?us-ascii?Q?/BN+tD8VRDtmtPiYuUHp0FqlJZMTdNPw9rrPVzpHuv2GoXPsPQ4XFHR6S2Cz?=
 =?us-ascii?Q?sq6m1ISB5YuTOJ5tBA2sbx/b+0eA7GYPqgJfSMaPul/a0g34eaiRwTpBQOZp?=
 =?us-ascii?Q?qwuas3eHKo+deKaOw+iBRMYc77yQDcHlx9MlS9lKOv7nBZs8cU/SdzeWrhhb?=
 =?us-ascii?Q?10Xy5b2KmEj1NMzlR6hENNsSZ5zrhb+63qqbQQsgpQLQy3uXwKMplj+OadQy?=
 =?us-ascii?Q?FulcRxN+HMVDuXfQjx3rROrLRlEzDb/pjK7vPrdBn9SIF7QQkgmvyAW1JhkF?=
 =?us-ascii?Q?Z75wYYZvR3yUKjXjOUUNO+56vBi4ohsxkJbmjRyKESXH5d/rRXDNGJQX8kTH?=
 =?us-ascii?Q?/dJxbm95Hbwyd1iFtCsO2fBMfiEtxpI0ci//i9AnEqgXe4YGFm6IyMlwkgbO?=
 =?us-ascii?Q?Tx4IsinO88uUdVUx7NFW+/PM09xRXLZa6ww2BfzBcElEGjGDtIujDBdblANF?=
 =?us-ascii?Q?XHjCvapHjFZE4PPw/2STi/cUcfRqXZY=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e3358a-8f5f-4dbb-ce7b-08df0a50487c
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:46:44.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keGrCJsL/MwcSpMYUcA/ge8+IL0chTYoGp5P7BSjxESv9Epfz3X1EF+Wi4tr5NGHBwNClOVHgfr7EH2sfyF1Br+stOPl+7zyPZiqfyLxa/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB2979

This patch series introduces support for the Chips&Media Wave6 video
codec IP, a completely different hardware architecture compared to Wave5.

The wave6 driver is a M2M stateful encoder/decoder driver.
It supports various video formats, including H.264 and H.265, for both encoding
and decoding.
While other versions of the Wave6 IP may support VP9 decoding and AV1 decoding
and encoding those formats are not implemented or validated in this driver at
this time.

On NXP i.MX SoCs, the Wave6 hardware exposes one control register region and
four interface register regions for one shared video processing engine.
VPU Control region, Manages shared resources such as firmware memory.
VPU Core region, Provides encoding and decoding capabilities.
The control and interface regions are distinct DMA requesters and can be
associated with separate IOMMU stream IDs, allowing DMA isolation between them.

The interface regions are described as child nodes of the VPU node rather
than folded into the parent with reg-names/interrupt-names, because each
one is a separate DMA requester. This follows the same structure already
accepted for the Qualcomm video codec bindings, and was mentioned on the v6
thread.

The firmware tested by this driver has been upstreamed in linux-firmware:
- Path: cnm/wave633c_imx9_codec_fw.bin

This driver has been tested with GStreamer on:
- NXP i.MX95 board
- pre-silicon FPGA environment

Test results for decoder fluster with -j2 option:
- JVT-AVC_V1, Ran 77/135 tests successfully              in 24.180 secs
- JVT-FR-EXT, Ran 25/69 tests successfully               in 11.157 secs
- JCT-VC-HEVC_V1, Ran 132/147 tests successfully         in 45.534 secs
- All failures are due to unsupported hardware features:
-- 10bit, Resolutions higher than 4K, FMO, MBAFF
-- Extended profile, Field encoding and High422 sreams.

Test results for v4l2-compliance:
v4l2-compliance 1.31.0-5386, 64 bits, 64-bit time_t
v4l2-compliance SHA: 48316b8a20aa 2025-08-12 12:44:56

Compliance test for wave6-dec device /dev/video0:
                fail: v4l2-test-controls.cpp(1204): !have_source_change || !have_eos
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-dec device /dev/video0: 48, Succeeded: 47, Failed: 1, Warnings: 0

Compliance test for wave6-enc device /dev/video1:
                fail: v4l2-test-controls.cpp(1193): node->codec_mask & STATEFUL_ENCODER
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
Total for wave6-enc device /dev/video1: 48, Succeeded: 47, Failed: 1, Warnings: 0

Note: the failures are all related with the eos event.

Changelog:

v7:
- Moved the sram property from imx95-19x19-evk.dts to imx95.dtsi
- Simplified the sram binding property to maxItems: 1
- Fixed the issues reported by the sashiko-bot review of v6:
  - Bounded frame buffer and aux buffer counts before indexing
  - Added vb2_is_busy() checks to the decoder S_FMT handlers
  - Fixed video_device lifetime and driver teardown ordering
  - Propagated hardware init, runtime PM and thermal failures upward
  - Fixed tracepoint field widths and debugfs handling
- Balanced the VPU reference on the core activation error path

v6:
- Fixed the existing P010 format_info entry
- Moved all encoder parameter validation from the HW layer into the V4L2 layer
- Removed redundant HW-abstraction wrappers from the VPU API layer
- Computed frame stride and sizeimage in the V4L2 layer
- Added explicit instance lifecycle helpers to the core driver
- Enabled the VPU only on the tested imx95-19x19-evk board

RFC v5:
- Move all shared resources to the parent node
- Drop child compatible and use data-only interface child nodes
- Update the VPU driver to create child devices and load the core driver

v4:
- Fixed build issues reported by CI tools
- Updated commit messages to use imperative mood
- Avoided using the same name for both nodes and labels in devicetree
- Removed unused labels from YAML examples
- Added description for child(vpu-core) node
- Added iommus property to both parent(vpu) and child(vpu-core) nodes
- Updated probe() functions to use dev_err_probe() when returning -EPROBE_DEFER
- Added wave6_vpu prefix to trace functions
- Updated HEVC decoder profile control to report MAIN_STILL profile
- Fixed bug in multiple instance creation by pre-allocating work buffer
- Fixed interrupt handling by checking INSTANCE_INFO register and instance list

v3:
- Removed ambiguous SUPPORT_FOLLOWER feature
- Used WARN_ON() for unexpected programming errors
- Split thermal device code into wave6-vpu-thermal.c/h
- Dropped wave6_cooling_disable module parameter
- Replaced mutex_lock() with guard()
- Added lockdep_assert_held() to clarify locking regions
- Removed exported function due to dual-license and used function pointer
- Added documentation and validation for state transitions
- Added documentation for device structures
- Added patch to enable VPU device in imx95 DTS
- Updated DT bindings and driver to align with parent(vpu) and child(vpu-core)
- Replaced magic numbers with mask and offset macros when accessing registers
- Placed goto statements after an empty line
- Printed HW info (e.g. product_code) via dev_dbg() for debugging
- Replaced wave6_vpu_dec_give_command() with dedicated functions

v2:
- Refined DT bindings to better represent the hardware
- Reworked driver to align with the parent(VPU) and child(CTRL, CORE)
- Fixed build issues reported by CI tools (Smatch, Sparse, TRACE)
- Improved commit messages with clearer descriptions
- Added kernel-doc for exported functions
- Removed redundant print statements and unused code
- Reordered patches to prevent build failures

Nas Chung (9):
  media: v4l2-common: Fix P010 format info
  dt-bindings: media: nxp: Add Wave6 video codec device
  media: chips-media: wave6: Add Wave6 VPU interface
  media: chips-media: wave6: Add v4l2 m2m driver support
  media: chips-media: wave6: Add Wave6 core driver
  media: chips-media: wave6: Improve debugging capabilities
  media: chips-media: wave6: Add Wave6 thermal cooling device
  media: chips-media: wave6: Add Wave6 control driver
  arm64: dts: freescale: imx95: Add video codec node

 .../bindings/media/nxp,imx95-vpu.yaml         |  162 +
 MAINTAINERS                                   |    8 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |   10 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   37 +
 drivers/media/platform/chips-media/Kconfig    |    1 +
 drivers/media/platform/chips-media/Makefile   |    1 +
 .../media/platform/chips-media/wave6/Kconfig  |   17 +
 .../media/platform/chips-media/wave6/Makefile |   17 +
 .../platform/chips-media/wave6/wave6-hw.c     | 2030 ++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   56 +
 .../chips-media/wave6/wave6-regdefine.h       |  649 ++++
 .../platform/chips-media/wave6/wave6-trace.h  |  289 ++
 .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
 .../chips-media/wave6/wave6-vpu-core.c        |  448 +++
 .../chips-media/wave6/wave6-vpu-core.h        |  126 +
 .../chips-media/wave6/wave6-vpu-dbg.c         |  183 ++
 .../chips-media/wave6/wave6-vpu-dbg.h         |   14 +
 .../chips-media/wave6/wave6-vpu-dec.c         | 1843 +++++++++++
 .../chips-media/wave6/wave6-vpu-enc.c         | 2764 +++++++++++++++++
 .../chips-media/wave6/wave6-vpu-thermal.c     |  143 +
 .../chips-media/wave6/wave6-vpu-thermal.h     |   24 +
 .../chips-media/wave6/wave6-vpu-v4l2.c        |  516 +++
 .../platform/chips-media/wave6/wave6-vpu.c    |  826 +++++
 .../platform/chips-media/wave6/wave6-vpu.h    |  143 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  336 ++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 1007 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   72 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 drivers/media/v4l2-core/v4l2-common.c         |    2 +-
 29 files changed, 12077 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-trace.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

-- 
2.31.1

