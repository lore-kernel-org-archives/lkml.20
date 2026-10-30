Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.125
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793340944;
	b=tKGWijDdTcDruoRF93DuNHEt808W8ErrtaAJ6Q2CoAiAxRJO2GAt1j5h8ZCZFGGZYh7J
	 p/bTAMnKFsVNuWCwSYUUtMQ/3KO25rwTP4ws/XKuzxjy/4+OJgUKPVVPOutCVCLPlXgY5
	 DnRt95dDqvEhMvV1u//21azpkS3F2i2zDpvVXG2UylkWbSupuy9Adsm7nUHSY/MopCZBg
	 6ovDAASu/TIkSF083AxVuiXYdqT9yfd0WguEwLdbHNcl3QR81L8zlXoLBfQ4wl9wGSonK
	 XZHGOIzLzkfDVz+y/60saoDVQZwjmPT/r+/8F7qidV4iIjkxRwNqvXoI7vBqzfby0Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340944;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qfUdzRqsqtWFcnLUlTJ+GGaqkRFA2DEW0ZUTfMFl27k=;
	b=BTGcjJ7t55D5Q8GDNw6teYQexPdfcHsRnlBBlEihC5lBLxER2MA4yidCtBhPWUlRNTjr
	 2PylKoUzCWZZtArmbZ2c+7KP/m0/YqhURVnKuLd98l1/NLSZNsvgnTgv+/sHu3OKcDHbU
	 RSrz0z1Wae0GTKYnl5Ui2pdk+zBf03mROIp8f2Cmncrfbw28BxdnP2WL11fXF5lorNmM5
	 EZF47GLlBAKWH49U2ygD2SO14KvH9Z4o7Fqrse7p8MRDL4JHbU1wTD4XUUBTDMIE5yn1y
	 9Q6yI4yCxXflxkEG3NP6+f3cOLdpUS1Pc64E5VA/zImF0IQqALYWrvHh1XeK3PPMXwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.125
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2125.outbound.protection.partner.outlook.cn [139.219.146.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B27606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0B27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmJexDpfJumU0MIZhM1S+3kYy9V752i/JiUxfTytk7s/cU0tkXP3SK1xuuPDtCe8DlJMe/R4Fg7HbrfRaUe0oINlYMgYm2eAmLc7mJALuY+BZx9VjzAxNEm/j0t05GApcw7S6C+ofcJQVY2bN7aCWaMDt9cEDoHM1EeAvxG+Dtil4T6RfZdoJHmeJ0js9+TQCDKvFx9EZnf9oXKG+mxZ3FdzsrmiM2FCxHIOHu0x0ebbhk7AckpozJTr7Ma+UB0qy3fRhSVZq7xarYsBuvF0j6BpNE/90z02z1wLQGIIwjvZDcy07zc02hIUW8oRnIQzQDHvLDfi1B2dpXGyUNMQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfUdzRqsqtWFcnLUlTJ+GGaqkRFA2DEW0ZUTfMFl27k=;
 b=gdfktCTvb1qvSb38wTvtncsqr8jmiijPsqDFFNyhK6+o3pv+HSPi1EXRCPy+Lo7Co7j0V94doIEDVVHPgZ90pJbiwzgRdbuR+pb2I957DIVEYqfaU0l9M6CkNCjljjZcB5NXoFz6HxPyOrjX8QDSr9t2FYH0+Ctw4bQck6F3Qhc0MtsEFv2OAVYEZyK0l6J76WmDGxhCQmK0uorNetk0t83N2WP1b6E10YsAfsJDZlzJP6c8FfHbL7zxsmXcxuFXtwYDPvxltBHYLt2VLAfvQJTXwLI4IGc/fOgIln2Ow9QYC36ubBzW10IW4c+9SESQUiUoGgcnYnLPdA8f2VZYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::11) by BJSPR01MB0881.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 06:15:27 +0000
Received: from BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn
 ([fe80::1ba8:1433:8771:d206]) by
 BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn ([fe80::1ba8:1433:8771:d206%6])
 with mapi id 15.21.0569.007; Fri, 30 Oct 2026 06:15:27 +0000
From: "shanlong.li" <shanlong.li@starfivetech.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	Shanlong Li <shanlong.li@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	ChangHuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1] drm/verisilicon: add StarFive PCIe-attached DC8000 driver
Date: Fri, 30 Oct 2026 14:15:20 +0800
Message-ID: <20261030061521.4117-1-shanlong.li@starfivetech.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::22) To BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1c::11)
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
X-MS-TrafficTypeDiagnostic: BJSPR01MB0675:EE_|BJSPR01MB0881:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df9c252-727a-4f9b-504a-08df364d310e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|261026140227099003|261026135527099003|6133799003|18002099003|261028144727099003|3023799007|13003099007|261026130827099003|56012099006|261009223027099003|10067099003|261021133027099003|261021121427099003|261022105027099003|261022075727099003|261022113327099003|261021135927099003|261009220027099003|261022115727099003|261009221727099003|261009223327099003|261009221227099003|261021123027099003|261026121527099003|38350700014|261021130227099003;
X-Microsoft-Antispam-Message-Info:
	FcOWSjr3a4ydbqRfqTLZBZEAnUWACdv8kTeAovEBYPGFEH0pOrAaHJwkgeI8K3pCObi3cUuLYvWkKX5P86J1/l4DNBitvlbC7mdcmyYDZ0gv6zIvjHD9VkA8eElkHrEOaWfO6w+QhBGyBR+6O0sFA4HnIxUG2p0Iw9xkc6I5CjIGXTPvtyyH/Xj+5Gq7z5QZNkIuLKYY2emEewUXvfwjxDxph3rha9XjQyEGz6xpWC7IRQT5F16yoNTScQpUOa1CPqA9LUQPz19tYFMi3J2e7shBWK0JSwS0F1FTM7Oxm6AXIWhubPdBJGCxwEQGYInolDMDWXdp3/xhxvEJfhfL3FHSpzjhRMlBc+657xBhjYbnxPyBsu/oxSGSOPSBykCBNW2NZGrGh29a32NyukkUVEmqeF78izBHZolB+GLk56GP3vFoJ/pHwktHdC95f/vgZru1rEXAv9O8vpycvF1Ezc+wihY0CF9fWP2PnENPQyjmd7mVYtPb8DHMjWPxucznNcKRq8ckDOWZAX4LdpeI0ri3HlYL48aj9A2d6g33G/jiUAQZoULyZScyXgJEKfcd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(261026140227099003)(261026135527099003)(6133799003)(18002099003)(261028144727099003)(3023799007)(13003099007)(261026130827099003)(56012099006)(261009223027099003)(10067099003)(261021133027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022113327099003)(261021135927099003)(261009220027099003)(261022115727099003)(261009221727099003)(261009223327099003)(261009221227099003)(261021123027099003)(261026121527099003)(38350700014)(261021130227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UACeOTblzgq6R2iyXNtKo6njrYyJMaPx1eMj7Mk2SRSY0uq+AWWlMMi9eYFQ?=
 =?us-ascii?Q?hVEuhDOBun4e2hGcvFrWG+wu3H7xHS9xDfYsKk2yaYzRs3tSi7TQIsCjmbZz?=
 =?us-ascii?Q?Vc7nZgDZ7CJRTgPxYonfjPCCMaAp+ZM4tvzvRI+bpcSwIFDlM/gkoBn4mWak?=
 =?us-ascii?Q?cLEuNaIWFNxh8pCli5EC1TlAh8zKiULbgxxBK0OFAWDsB5uwj0uagjlMxhYp?=
 =?us-ascii?Q?ns1NFECn26DTN5WY+vyxUROu5OjRDuQk1y2ZhXayYZ2pqahEJw0H/VRPSZTC?=
 =?us-ascii?Q?izOW5OrOzsQTXKKlGClAC86PVw7ma+m0Om9ofnrEWspzkTE4PFWzo/bOpIeH?=
 =?us-ascii?Q?N808uZHwFe0ch5wRfw9+z5iXubHRXk5qiB5R3/MK7NlNIkNaQ4l3hcWlpen/?=
 =?us-ascii?Q?mLrGEcHY9h1z8Pf9NJTvdgftzf7xpo88V1vNmAUyFqXENv/uG4lAKM9V7A9x?=
 =?us-ascii?Q?Vex7AtXsxq1gGSbu6NK9LqE23MK4u5nGTydedG182YbLwDyUzXbI6BonziFz?=
 =?us-ascii?Q?BrRgOrtFdeyEPiblrOeDUNgpcMd49s5unajYdk84HteCPQuZQD1b8eO6TtkF?=
 =?us-ascii?Q?0jSIL+mVyUeqq8Ctb5oB2GtDhn5T9V8j6z5Bzai4fabzcLPyDym+a6diSU9o?=
 =?us-ascii?Q?DGPCDcGXoyQP0TusQa3OPhi3+ty/fsTAqQR8XwZo8/P5iqRqcW0b7i2p0rSW?=
 =?us-ascii?Q?SV69P2E48sJLHZ/+j5Z7HOrKfKILqdR8gK6ZT+4WtY4PyiYKgjKJWurv5Imk?=
 =?us-ascii?Q?98M79pYlpT5TisuKUZu/2YHcIKR3A6lh24tR/DTWf3NNEpBlBwwMBC4g7aWp?=
 =?us-ascii?Q?oI7eHLl2LdOIffhkS1o2oKpBzsQcL8zUrRtRzlcnjkHmF0qbrka9wOZ5SOFW?=
 =?us-ascii?Q?bdzuloh25gE9+xIGS9LMXkAUQG4XbfwdVNyH1tg3UGE5kxciL9/wmJrZybSt?=
 =?us-ascii?Q?5kVQsrSMzGsvJ8Q1lEntTIQqZ9mGLiE6z5JD16xQsdhWkXfLwDNI9syYNITH?=
 =?us-ascii?Q?aEBG9aIMQfQLcm7f1k2uus+Hr0fa1Sk/CJUQMujqitZrPSrvyJp/1ZhV8mKR?=
 =?us-ascii?Q?8Zvr9dG3jBSDZ87hm5qlK9c/0EhH2yuff5WElUKWYlgVDudeM8Xd9Vsk2/ra?=
 =?us-ascii?Q?Jb8uDvfz6SEDfqOcD14Qf9tOc7yvxWpFYztr5khfd6lv+ItZ9wRQlb/qOOz3?=
 =?us-ascii?Q?KAvTCwChsEth6RvAHEhjfMPW/ZIFBDhpFbMa3PfdhVIZ+QZG4Ypc1890Bawu?=
 =?us-ascii?Q?4Lm58joCaOitw/RxU1s/C55FuOqM5I51ETe+ylNqWZcVO+AjAqwbYiemJcFN?=
 =?us-ascii?Q?Btl0rpg0QbLGmrog1/XAfBYP6L459QbwfFaETMVUyi2avsvW+PolsYeksPc3?=
 =?us-ascii?Q?WZKm8WOFou9iFyA2+OiW40G5GgRPEkBJn+sG+3ZU4p4gsLa3bY67lZhzQEIs?=
 =?us-ascii?Q?GWxsiTXJ9neyO9mmr9m6j+K4XdrCwf3b1c9NDtucf0M+Wropp8okguPvzXCF?=
 =?us-ascii?Q?Wf0DadqeSuOlyrdPymSmSrXBTQ9Czef1amdfsYHkmygHvZMPKLExYVB/fCiw?=
 =?us-ascii?Q?4cH4EAw5rr6U7Y60/+4ysLfbCzSRkbi49Dya6Tm+9QKuu9ELRxkjZAteIsZk?=
 =?us-ascii?Q?GZQ3xMVRyq1G9QBm6o3ckjvGhptXUA5uNutju9oPRC3d/9/7zPtEqKkOJVYK?=
 =?us-ascii?Q?iHmqgE+yW9FVBfMnA/YTJeNALot1oIKwAqp5FLcPSWrGAjkiyzKglrPFT57V?=
 =?us-ascii?Q?9phawI+NWoNrbaiJ1iEuU1bzcMfycKU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df9c252-727a-4f9b-504a-08df364d310e
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0675.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 06:15:27.6911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFwEFwc/UGz75Idi2OP8kfRItGs7Jko8RyEmveoOuKaCp6PFMSHty/W9f4SI74Pdly/K+RytABBW8OjjAqRIhZbknotOFQcMeFrFPRUE4js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0881

From: Shanlong Li <shanlong.li@starfivetech.com>

StarFive BMC SoCs contain a Verisilicon DC8000 display controller which
is exposed to the host over PCIe, much like the VGA of ASPEED BMCs. The
host owns the display pipeline (primary, overlay and cursor planes,
CRTC, gamma), scans out of the PCIe memory BAR of the device and relays
EDID, hotplug, mode and pixel clock requests to the BMC firmware through
a mailbox located in the CSR BAR.

The DC8000 and the two-pipeline DC8200 served by the existing
verisilicon-dc platform driver share a common register layout, but the
PCIe variant needs a different GEM backend (VRAM/TTM instead of GEM
DMA), a BMC-backed virtual connector instead of OF graph bridges and a
different plane set with scaling, blending, gamma and de-gamma. Keep the
two front ends separate: the SoC platform driver stays where it is and
the PCIe driver goes into a new pci sub-directory. Each is
selectable through its own Kconfig symbol, so a kernel can be built for
either or both platforms, and the two drivers do not share any global
symbol so they can also both be built in.

Signed-off-by: Shanlong Li <shanlong.li@starfivetech.com>
---
 MAINTAINERS                                  |    7 +
 drivers/gpu/drm/Makefile                     |    1 +
 drivers/gpu/drm/verisilicon/Kconfig          |    2 +
 drivers/gpu/drm/verisilicon/Makefile         |    2 +
 drivers/gpu/drm/verisilicon/pci/Kconfig      |   30 +
 drivers/gpu/drm/verisilicon/pci/Makefile     |    6 +
 drivers/gpu/drm/verisilicon/pci/vs_crtc.c    |  393 +++++
 drivers/gpu/drm/verisilicon/pci/vs_crtc.h    |   65 +
 drivers/gpu/drm/verisilicon/pci/vs_dc.c      |  895 +++++++++++
 drivers/gpu/drm/verisilicon/pci/vs_dc.h      |  138 ++
 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c   | 1502 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h   |  426 +++++
 drivers/gpu/drm/verisilicon/pci/vs_drv.c     |  264 +++
 drivers/gpu/drm/verisilicon/pci/vs_drv.h     |   79 +
 drivers/gpu/drm/verisilicon/pci/vs_plane.c   |  379 +++++
 drivers/gpu/drm/verisilicon/pci/vs_plane.h   |   62 +
 drivers/gpu/drm/verisilicon/pci/vs_type.h    |   70 +
 drivers/gpu/drm/verisilicon/pci/vs_virtual.c |  531 +++++++
 drivers/gpu/drm/verisilicon/pci/vs_virtual.h |   47 +
 19 files changed, 4899 insertions(+)
 create mode 100644 drivers/gpu/drm/verisilicon/pci/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/pci/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_drv.c
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_drv.h
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_type.h
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_virtual.c
 create mode 100644 drivers/gpu/drm/verisilicon/pci/vs_virtual.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..4a1b5b211bf9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8568,6 +8568,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/ste,mcde.yaml
 F:	drivers/gpu/drm/mcde/
 
+DRM DRIVER FOR STARFIVE PCIE ATTACHED VERISILICON DC8000
+M:	Shanlong Li <shanlong.li@starfivetech.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/verisilicon/pci/
+
 DRM DRIVER FOR SYNAPTICS R63353 PANELS
 M:	Michael Trimarchi <michael@amarulasolutions.com>
 S:	Maintained
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index e635fcffd379..28d251a62067 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -238,6 +238,7 @@ obj-$(CONFIG_DRM_SPRD) += sprd/
 obj-$(CONFIG_DRM_LOONGSON) += loongson/
 obj-$(CONFIG_DRM_POWERVR) += imagination/
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon/
+obj-$(CONFIG_DRM_VERISILICON_DC8000_PCI) += verisilicon/
 
 # Ensure drm headers are self-contained and pass kernel-doc
 hdrtest-files := \
diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603..1af4932fc72a 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -14,3 +14,5 @@ config DRM_VERISILICON_DC
 	  Choose this option if you have a SoC with Verisilicon DC-series
 	  display controllers. If M is selected, the module will be called
 	  verisilicon-dc.
+
+source "drivers/gpu/drm/verisilicon/pci/Kconfig"
diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
index 426f4bcaa834..f7b6821a6e66 100644
--- a/drivers/gpu/drm/verisilicon/Makefile
+++ b/drivers/gpu/drm/verisilicon/Makefile
@@ -4,3 +4,5 @@ verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o \
 	vs_plane.o vs_primary_plane.o vs_cursor_plane.o
 
 obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
+
+obj-y += pci/
diff --git a/drivers/gpu/drm/verisilicon/pci/Kconfig b/drivers/gpu/drm/verisilicon/pci/Kconfig
new file mode 100644
index 000000000000..00f6e0f25dba
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/Kconfig
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# PCI front ends for Verisilicon display controllers
+#
+
+config DRM_VERISILICON_DC8000_PCI
+	tristate "DRM support for StarFive PCIe attached Verisilicon DC8000"
+	depends on DRM && PCI
+	select DRM_CLIENT_SELECTION
+	select DRM_KMS_HELPER
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	select DRM_VRAM_HELPER
+	help
+	  Choose this option if you have a StarFive BMC SoC whose Verisilicon
+	  DC8000 display controller is exposed to the host over PCIe. The host
+	  owns the display pipeline, the frame buffer lives in the PCIe memory
+	  BAR of the device and EDID, mode and pixel clock requests are relayed
+	  to the BMC firmware through a mailbox in the CSR BAR.
+
+	  If M is selected, the module will be called verisilicon-dc8000-pci.
+
+config DRM_VERISILICON_DC8000_VCE
+	bool "Forward frame buffer information to the BMC video capture engine"
+	depends on DRM_VERISILICON_DC8000_PCI
+	help
+	  Periodically send the geometry, format and location of the current
+	  primary plane frame buffer to the BMC video capture engine (VCE) so
+	  the BMC can encode the host screen for remote KVM. Only XRGB8888,
+	  NV12 and NV16 frame buffers are exposed when this is enabled.
diff --git a/drivers/gpu/drm/verisilicon/pci/Makefile b/drivers/gpu/drm/verisilicon/pci/Makefile
new file mode 100644
index 000000000000..b765951233c9
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+verisilicon-dc8000-pci-y := vs_crtc.o vs_dc.o vs_dc_hw.o vs_drv.o vs_plane.o \
+			    vs_virtual.o
+
+obj-$(CONFIG_DRM_VERISILICON_DC8000_PCI) += verisilicon-dc8000-pci.o
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_crtc.c b/drivers/gpu/drm/verisilicon/pci/vs_crtc.c
new file mode 100644
index 000000000000..32d29c93f6b0
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_crtc.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+#include <linux/debugfs.h>
+#include <linux/media-bus-format.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_color_mgmt.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_vblank.h>
+
+#include "vs_crtc.h"
+#include "vs_dc.h"
+#include "vs_drv.h"
+
+void vs_crtc_destroy(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+
+	drm_crtc_cleanup(crtc);
+	kfree(vs_crtc);
+}
+
+/* Called during init and reset to allocate the CRTC's atomic state. */
+static struct drm_crtc_state *vs_crtc_create_state(struct drm_crtc *crtc)
+{
+	struct vs_crtc_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_crtc_state_init(&state->base, crtc);
+
+	state->sync_mode = VS_SINGLE_DC;
+	state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+	state->encoder_type = DRM_MODE_ENCODER_NONE;
+
+	return &state->base;
+}
+
+static struct drm_crtc_state *
+vs_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct vs_crtc_state *ori_state;
+	struct vs_crtc_state *state;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	ori_state = to_vs_crtc_state(crtc->state);
+	state = kzalloc_obj(*state);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &state->base);
+
+	state->sync_mode = ori_state->sync_mode;
+	state->output_fmt = ori_state->output_fmt;
+	state->encoder_type = ori_state->encoder_type;
+	state->bpp = ori_state->bpp;
+	state->dither_enable = ori_state->dither_enable;
+	state->underflow = ori_state->underflow;
+
+	return &state->base;
+}
+
+static void vs_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					 struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_vs_crtc_state(state));
+}
+
+static int vs_crtc_atomic_set_property(struct drm_crtc *crtc,
+				       struct drm_crtc_state *state,
+				       struct drm_property *property,
+				       uint64_t val)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(state);
+
+	if (property == vs_crtc->sync_mode)
+		vs_crtc_state->sync_mode = val;
+	else if (property == vs_crtc->dither)
+		vs_crtc_state->dither_enable = val;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int vs_crtc_atomic_get_property(struct drm_crtc *crtc,
+				       const struct drm_crtc_state *state,
+				       struct drm_property *property,
+				       uint64_t *val)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+	const struct vs_crtc_state *vs_crtc_state =
+		container_of(state, const struct vs_crtc_state, base);
+
+	if (property == vs_crtc->sync_mode)
+		*val = vs_crtc_state->sync_mode;
+	else if (property == vs_crtc->dither)
+		*val = vs_crtc_state->dither_enable;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int vs_crtc_debugfs_show(struct seq_file *s, void *data)
+{
+	struct drm_crtc *crtc = s->private;
+	struct vs_crtc_state *crtc_state = to_vs_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+
+	seq_printf(s, "crtc[%u]: %s\n", crtc->base.id, crtc->name);
+	seq_printf(s, "\tactive = %d\n", crtc->state->active);
+	seq_printf(s, "\tsize = %dx%d\n", mode->hdisplay, mode->vdisplay);
+	seq_printf(s, "\tbpp = %u\n", crtc_state->bpp);
+	seq_printf(s, "\tunderflow = %d\n", crtc_state->underflow);
+
+	return 0;
+}
+
+static int vs_crtc_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, vs_crtc_debugfs_show, inode->i_private);
+}
+
+static const struct file_operations vs_crtc_debugfs_fops = {
+	.open		= vs_crtc_debugfs_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
+static int vs_crtc_debugfs_init(struct drm_crtc *crtc)
+{
+	debugfs_create_file("status", 0444, crtc->debugfs_entry,
+			    crtc, &vs_crtc_debugfs_fops);
+
+	return 0;
+}
+#else
+static int vs_crtc_debugfs_init(struct drm_crtc *crtc)
+{
+	return 0;
+}
+#endif /* CONFIG_DEBUG_FS */
+
+static int vs_crtc_late_register(struct drm_crtc *crtc)
+{
+	return vs_crtc_debugfs_init(crtc);
+}
+
+static int vs_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+
+	vs_crtc->funcs->enable_vblank(vs_crtc->dev, true);
+
+	return 0;
+}
+
+static void vs_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+
+	vs_crtc->funcs->enable_vblank(vs_crtc->dev, false);
+}
+
+static const struct drm_crtc_funcs vs_crtc_funcs = {
+	.set_config		= drm_atomic_helper_set_config,
+	.destroy		= vs_crtc_destroy,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.atomic_create_state	= vs_crtc_create_state,
+	.atomic_duplicate_state = vs_crtc_atomic_duplicate_state,
+	.atomic_destroy_state	= vs_crtc_atomic_destroy_state,
+	.atomic_set_property	= vs_crtc_atomic_set_property,
+	.atomic_get_property	= vs_crtc_atomic_get_property,
+	.late_register		= vs_crtc_late_register,
+	.enable_vblank		= vs_crtc_enable_vblank,
+	.disable_vblank		= vs_crtc_disable_vblank,
+};
+
+static u8 cal_pixel_bits(u32 bus_format)
+{
+	u8 bpp;
+
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		bpp = 16;
+		break;
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+		bpp = 18;
+		break;
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		bpp = 20;
+		break;
+	case MEDIA_BUS_FMT_BGR888_1X24:
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_YUV8_1X24:
+		bpp = 24;
+		break;
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		bpp = 30;
+		break;
+	default:
+		bpp = 24;
+		break;
+	}
+
+	return bpp;
+}
+
+static bool vs_crtc_mode_fixup(struct drm_crtc *crtc,
+			       const struct drm_display_mode *mode,
+			       struct drm_display_mode *adjusted_mode)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+
+	return vs_crtc->funcs->mode_fixup(vs_crtc->dev, mode, adjusted_mode);
+}
+
+static void vs_crtc_atomic_enable(struct drm_crtc *crtc,
+				  struct drm_atomic_commit *state)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc->state);
+
+	vs_crtc_state->bpp = cal_pixel_bits(vs_crtc_state->output_fmt);
+
+	vs_crtc->funcs->enable(vs_crtc->dev, crtc);
+
+	drm_crtc_vblank_on(crtc);
+}
+
+static void vs_crtc_atomic_disable(struct drm_crtc *crtc,
+				   struct drm_atomic_commit *state)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+
+	drm_crtc_vblank_off(crtc);
+
+	vs_crtc->funcs->disable(vs_crtc->dev);
+
+	if (crtc->state->event && !crtc->state->active) {
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+
+		crtc->state->event = NULL;
+	}
+}
+
+static void vs_crtc_atomic_begin(struct drm_crtc *crtc,
+				 struct drm_atomic_commit *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+	struct device *dev = vs_crtc->dev;
+	struct drm_property_blob *blob = crtc->state->gamma_lut;
+	struct drm_color_lut *lut;
+
+	if (crtc_state->color_mgmt_changed) {
+		if (blob  &&  blob->length) {
+			lut = blob->data;
+			vs_crtc->funcs->set_gamma(dev, lut,
+						  blob->length / sizeof(*lut));
+			vs_crtc->funcs->enable_gamma(dev, true);
+		} else {
+			vs_crtc->funcs->enable_gamma(dev, false);
+		}
+	}
+}
+
+static void vs_crtc_atomic_flush(struct drm_crtc *crtc,
+				 struct drm_atomic_commit *state)
+{
+	struct vs_crtc *vs_crtc = to_vs_crtc(crtc);
+	struct drm_pending_vblank_event *event = crtc->state->event;
+
+	vs_crtc->funcs->commit(vs_crtc->dev);
+
+	if (event) {
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_arm_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+		crtc->state->event = NULL;
+	}
+}
+
+static const struct drm_crtc_helper_funcs vs_crtc_helper_funcs = {
+	.mode_fixup	= vs_crtc_mode_fixup,
+	.atomic_enable	= vs_crtc_atomic_enable,
+	.atomic_disable = vs_crtc_atomic_disable,
+	.atomic_begin	= vs_crtc_atomic_begin,
+	.atomic_flush	= vs_crtc_atomic_flush,
+};
+
+static const struct drm_prop_enum_list vs_sync_mode_enum_list[] = {
+	{ VS_SINGLE_DC,			"single dc mode" },
+	{ VS_MULTI_DC_PRIMARY,		"primary dc for multi dc mode" },
+	{ VS_MULTI_DC_SECONDARY,	"secondary dc for multi dc mode" },
+};
+
+struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
+			       const struct vs_dc_info *info)
+{
+	struct vs_crtc *crtc;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	crtc = kzalloc_obj(*crtc);
+	if (!crtc)
+		return NULL;
+
+	ret = drm_crtc_init_with_planes(drm_dev, &crtc->base,
+					NULL, NULL, &vs_crtc_funcs,
+					info->name ? info->name : NULL);
+	if (ret)
+		goto err_free_crtc;
+
+	drm_crtc_helper_add(&crtc->base, &vs_crtc_helper_funcs);
+
+	/* Set up the crtc properties */
+	if (info->pipe_sync) {
+		crtc->sync_mode = drm_property_create_enum(drm_dev, 0,
+							   "SYNC_MODE",
+							   vs_sync_mode_enum_list,
+							   ARRAY_SIZE(vs_sync_mode_enum_list));
+
+		if (!crtc->sync_mode)
+			goto err_cleanup_crts;
+
+		drm_object_attach_property(&crtc->base.base,
+					   crtc->sync_mode,
+					   VS_SINGLE_DC);
+	}
+
+	if (info->gamma_size) {
+		ret = drm_mode_crtc_set_gamma_size(&crtc->base,
+						   info->gamma_size);
+		if (ret)
+			goto err_cleanup_crts;
+
+		drm_crtc_enable_color_mgmt(&crtc->base, 0, false,
+					   info->gamma_size);
+	}
+
+	crtc->dither = drm_property_create_bool(drm_dev, 0, "DITHER_ENABLED");
+	if (!crtc->dither)
+		goto err_cleanup_crts;
+
+	drm_object_attach_property(&crtc->base.base, crtc->dither, 0);
+
+	crtc->max_bpc = info->max_bpc;
+	crtc->color_formats = info->color_formats;
+	return crtc;
+
+err_cleanup_crts:
+	drm_crtc_cleanup(&crtc->base);
+
+err_free_crtc:
+	kfree(crtc);
+	return NULL;
+}
+
+void vs_crtc_handle_vblank(struct drm_crtc *crtc, bool underflow)
+{
+	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc->state);
+
+	drm_crtc_handle_vblank(crtc);
+
+	vs_crtc_state->underflow = underflow;
+}
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_crtc.h b/drivers/gpu/drm/verisilicon/pci/vs_crtc.h
new file mode 100644
index 000000000000..ffb897d2875d
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_crtc.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+#ifndef __VS_CRTC_H__
+#define __VS_CRTC_H__
+
+#include <drm/drm_crtc.h>
+
+#include "vs_type.h"
+
+struct vs_crtc_funcs {
+	void (*enable)(struct device *dev, struct drm_crtc *crtc);
+	void (*disable)(struct device *dev);
+	bool (*mode_fixup)(struct device *dev,
+			   const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+	void (*set_gamma)(struct device *dev, struct drm_color_lut *lut,
+			  unsigned int size);
+	void (*enable_gamma)(struct device *dev, bool enable);
+	void (*enable_vblank)(struct device *dev, bool enable);
+	void (*commit)(struct device *dev);
+};
+
+struct vs_crtc_state {
+	struct drm_crtc_state base;
+
+	u32 sync_mode;
+	u32 output_fmt;
+	u8 encoder_type;
+	u8 bpp;
+	bool dither_enable;
+	bool underflow;
+};
+
+struct vs_crtc {
+	struct drm_crtc base;
+	struct device *dev;
+	unsigned int max_bpc;
+	unsigned int color_formats; /* supported color format */
+
+	struct drm_property *sync_mode;
+	struct drm_property *dither;
+
+	const struct vs_crtc_funcs *funcs;
+};
+
+void vs_crtc_destroy(struct drm_crtc *crtc);
+
+struct vs_crtc *vs_crtc_create(struct drm_device *drm_dev,
+			       const struct vs_dc_info *info);
+void vs_crtc_handle_vblank(struct drm_crtc *crtc, bool underflow);
+
+static inline struct vs_crtc *to_vs_crtc(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct vs_crtc, base);
+}
+
+static inline struct vs_crtc_state *
+to_vs_crtc_state(struct drm_crtc_state *state)
+{
+	return container_of(state, struct vs_crtc_state, base);
+}
+#endif /* __VS_CRTC_H__ */
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_dc.c b/drivers/gpu/drm/verisilicon/pci/vs_dc.c
new file mode 100644
index 000000000000..0551bdd7cbce
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_dc.c
@@ -0,0 +1,895 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/lockdep.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_color_mgmt.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#include "vs_crtc.h"
+#include "vs_dc_hw.h"
+#include "vs_dc.h"
+#include "vs_drv.h"
+#include "vs_type.h"
+
+static bool vs_h2b_wait_ack(struct vs_drm_private *priv, u32 event_type)
+{
+	int retry = 0;
+	u32 val;
+
+	do {
+		mdelay(10);
+		val = vs_dc_read_reg(priv->comm_h2b, H2B_DONE);
+	} while ((val) && (retry++ < COMM_TRY_CONT));
+
+	dev_info(priv->base.dev, "event type:0x%x set retry:%d\n",
+		 event_type, retry);
+	if (retry < COMM_TRY_CONT)
+		return true;
+
+	return false;
+}
+
+static inline void update_format(u32 format, struct dc_hw_fb *fb)
+{
+	u8 f;
+
+	switch (format) {
+	case DRM_FORMAT_XRGB4444:
+		f = FORMAT_X4R4G4B4;
+		break;
+	case DRM_FORMAT_ARGB4444:
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_BGRA4444:
+		f = FORMAT_A4R4G4B4;
+		break;
+	case DRM_FORMAT_XRGB1555:
+		f = FORMAT_X1R5G5B5;
+		break;
+	case DRM_FORMAT_ARGB1555:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGRA5551:
+		f = FORMAT_A1R5G5B5;
+		break;
+	case DRM_FORMAT_BGR565:
+	case DRM_FORMAT_RGB565:
+		f = FORMAT_R5G6B5;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		f = FORMAT_X8R8G8B8;
+		break;
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_BGRA8888:
+		f = FORMAT_A8R8G8B8;
+		break;
+	case DRM_FORMAT_YUYV:
+	case DRM_FORMAT_YVYU:
+		f = FORMAT_YUY2;
+		break;
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_VYUY:
+		f = FORMAT_UYVY;
+		break;
+	case DRM_FORMAT_YVU420:
+	case DRM_FORMAT_YUV420:
+		f = FORMAT_YV12;
+		break;
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_NV21:
+		f = FORMAT_NV12;
+		break;
+	case DRM_FORMAT_NV16:
+	case DRM_FORMAT_NV61:
+		f = FORMAT_NV16;
+		break;
+	case DRM_FORMAT_P010:
+		f = FORMAT_P010;
+		break;
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRA1010102:
+		f = FORMAT_A2R10G10B10;
+		break;
+	default:
+		f = FORMAT_A8R8G8B8;
+		break;
+	}
+
+	fb->format = f;
+}
+
+static inline void update_swizzle(u32 format, struct dc_hw_fb *fb)
+{
+	fb->swizzle = SWIZZLE_ARGB;
+	fb->uv_swizzle = 0;
+
+	switch (format) {
+	case DRM_FORMAT_RGBA4444:
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBA1010102:
+		fb->swizzle = SWIZZLE_RGBA;
+		break;
+	case DRM_FORMAT_ABGR4444:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_BGR565:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_ABGR2101010:
+		fb->swizzle = SWIZZLE_ABGR;
+		break;
+	case DRM_FORMAT_BGRA4444:
+	case DRM_FORMAT_BGRA5551:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
+		fb->swizzle = SWIZZLE_BGRA;
+		break;
+	case DRM_FORMAT_YVYU:
+	case DRM_FORMAT_VYUY:
+	case DRM_FORMAT_NV21:
+	case DRM_FORMAT_NV61:
+		fb->uv_swizzle = 1;
+		break;
+	default:
+		break;
+	}
+}
+
+static inline u8 to_vs_rotation(unsigned int rotation)
+{
+	u8 rot;
+
+	switch (rotation & DRM_MODE_REFLECT_MASK) {
+	case DRM_MODE_REFLECT_X:
+		rot = FLIP_X;
+		return rot;
+	case DRM_MODE_REFLECT_Y:
+		rot = FLIP_Y;
+		return rot;
+	case DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y:
+		rot = FLIP_XY;
+		return rot;
+	default:
+		break;
+	}
+
+	switch (rotation & DRM_MODE_ROTATE_MASK) {
+	case DRM_MODE_ROTATE_0:
+		rot = ROT_0;
+		break;
+	case DRM_MODE_ROTATE_90:
+		rot = ROT_90;
+		break;
+	case DRM_MODE_ROTATE_180:
+		rot = ROT_180;
+		break;
+	case DRM_MODE_ROTATE_270:
+		rot = ROT_270;
+		break;
+	default:
+		rot = ROT_0;
+		break;
+	}
+
+	return rot;
+}
+
+static inline u8 to_vs_yuv_color_space(u32 color_space)
+{
+	u8 cs;
+
+	switch (color_space) {
+	case DRM_COLOR_YCBCR_BT601:
+		cs = COLOR_SPACE_601;
+		break;
+	case DRM_COLOR_YCBCR_BT709:
+		cs = COLOR_SPACE_709;
+		break;
+	case DRM_COLOR_YCBCR_BT2020:
+		cs = COLOR_SPACE_2020;
+		break;
+	default:
+		cs = COLOR_SPACE_601;
+		break;
+	}
+
+	return cs;
+}
+
+static void dc_deinit(struct device *dev)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+
+	dc_hw_enable_interrupt(&dc->hw, 0);
+	dc_hw_deinit(&dc->hw);
+}
+
+static int dc_init(struct device *dev)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+	int ret;
+
+	dc->first_frame = true;
+
+	dc_hw_enable_interrupt(&dc->hw, false);
+
+	ret = dc_hw_init(&dc->hw);
+	if (ret) {
+		dev_err(dev, "failed to init DC HW\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void vs_dc_enable(struct device *dev, struct drm_crtc *crtc)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+	struct vs_crtc_state *crtc_state = to_vs_crtc_state(crtc->state);
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	struct dc_hw_display display;
+	struct vs_drm_private *priv = to_vs_priv(crtc->dev);
+	int ret;
+
+	display.bus_format = crtc_state->output_fmt;
+	display.h_active = mode->hdisplay;
+	display.h_total = mode->htotal;
+	display.h_sync_start = mode->hsync_start;
+	display.h_sync_end = mode->hsync_end;
+	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
+		display.h_sync_polarity = true;
+	else
+		display.h_sync_polarity = false;
+
+	display.v_active = mode->vdisplay;
+	display.v_total = mode->vtotal;
+	display.v_sync_start = mode->vsync_start;
+	display.v_sync_end = mode->vsync_end;
+
+	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
+		display.v_sync_polarity = true;
+	else
+		display.v_sync_polarity = false;
+
+	display.sync_mode = crtc_state->sync_mode;
+	display.dither_enable = crtc_state->dither_enable;
+
+	display.enable = true;
+
+	/* The pixel clock PLL is owned by the BMC */
+	if (dc->pix_clk_rate != mode->clock)
+		vs_dc_h2b_assign_task(priv, PIXEL_BIT, mode);
+
+	ret = dc_hw_init(&dc->hw);
+	if (ret)
+		dev_err(dev, "failed to init DC HW\n");
+
+	if (crtc_state->encoder_type == DRM_MODE_ENCODER_DSI)
+		dc_hw_set_out(&dc->hw, OUT_DPI);
+	else
+		dc_hw_set_out(&dc->hw, OUT_DP);
+
+	dc_hw_setup_display(&dc->hw, &display);
+	vs_dc_h2b_assign_task(priv, DC_CRTC_ON, NULL);
+}
+
+static void vs_dc_disable(struct device *dev)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+	struct vs_drm_private *priv = vs_dc_to_priv(dc);
+	struct dc_hw_display display;
+
+	display.enable = false;
+
+	dc_hw_setup_display(&dc->hw, &display);
+	vs_dc_h2b_assign_task(priv, DC_CRTC_OFF, NULL);
+}
+
+static bool vs_dc_mode_fixup(struct device *dev,
+			     const struct drm_display_mode *mode,
+			     struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void vs_dc_set_gamma(struct device *dev, struct drm_color_lut *lut,
+			    unsigned int size)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+	u16 i, r, g, b;
+	u8 bits;
+
+	if (size != dc->hw.info->gamma_size) {
+		dev_err(dev, "gamma size does not match!\n");
+		return;
+	}
+
+	bits = dc->hw.info->gamma_bits;
+	for (i = 0; i < size; i++) {
+		r = drm_color_lut_extract(lut[i].red, bits);
+		g = drm_color_lut_extract(lut[i].green, bits);
+		b = drm_color_lut_extract(lut[i].blue, bits);
+		dc_hw_update_gamma(&dc->hw, i, r, g, b);
+	}
+}
+
+static void vs_dc_enable_gamma(struct device *dev, bool enable)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+
+	dc_hw_enable_gamma(&dc->hw, enable);
+}
+
+static void vs_dc_enable_vblank(struct device *dev, bool enable)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+
+	dc_hw_enable_interrupt(&dc->hw, enable);
+}
+
+static u32 calc_factor(u32 src, u32 dest)
+{
+	u32 factor = 1 << 16;
+
+	if (src > 1  &&  dest > 1)
+		factor = ((src - 1) << 16) / (dest - 1);
+
+	return factor;
+}
+
+static void update_scale(struct dc_hw_scale *scale, int src_w, int src_h,
+			 int dst_w, int dst_h, unsigned int rotation)
+{
+	int temp = 0;
+
+	scale->enable = false;
+
+	if (drm_rotation_90_or_270(rotation)) {
+		temp = src_w;
+		src_w = src_h;
+		src_h = temp;
+	}
+
+	if (src_w != dst_w) {
+		scale->scale_factor_x = calc_factor(src_w, dst_w);
+		scale->enable = true;
+	} else {
+		scale->scale_factor_x = 1 << 16;
+	}
+	if (src_h != dst_h) {
+		scale->scale_factor_y = calc_factor(src_h, dst_h);
+		scale->enable = true;
+	} else {
+		scale->scale_factor_y = 1 << 16;
+	}
+}
+
+static void update_fb(struct vs_plane *plane, struct dc_hw_fb *fb,
+		      struct drm_plane_state *state)
+{
+	struct drm_framebuffer *drm_fb = state->fb;
+	struct drm_rect *src = &state->src;
+
+	fb->y_address = plane->dma_addr[0];
+	fb->y_stride = drm_fb->pitches[0];
+	if (drm_fb->format->format == DRM_FORMAT_YVU420) {
+		fb->u_address = plane->dma_addr[2];
+		fb->v_address = plane->dma_addr[1];
+		fb->u_stride = drm_fb->pitches[2];
+		fb->v_stride = drm_fb->pitches[1];
+	} else {
+		fb->u_address = plane->dma_addr[1];
+		fb->v_address = plane->dma_addr[2];
+		fb->u_stride = drm_fb->pitches[1];
+		fb->v_stride = drm_fb->pitches[2];
+	}
+
+	fb->width = drm_rect_width(src) >> 16;
+	fb->height = drm_rect_height(src) >> 16;
+	/* Only linear buffers are supported */
+	fb->tile_mode = 0;
+	fb->rotation = to_vs_rotation(state->rotation);
+	fb->yuv_color_space = to_vs_yuv_color_space(state->color_encoding);
+	fb->enable = state->visible;
+	update_format(drm_fb->format->format, fb);
+	update_swizzle(drm_fb->format->format, fb);
+}
+
+static void update_degamma(struct vs_dc *dc, struct vs_plane *plane,
+			   struct vs_plane_state *plane_state)
+{
+	dc_hw_update_degamma(&dc->hw, plane->id, plane_state->degamma);
+	plane_state->degamma_changed = false;
+}
+
+static void update_primary_plane(struct vs_dc *dc, struct vs_plane *plane,
+				 struct drm_plane *drm_plane,
+				 struct drm_atomic_commit *drm_state)
+{
+	struct dc_hw_fb fb = { 0 };
+	struct dc_hw_scale scale;
+	struct drm_plane_state *state =
+		 drm_atomic_get_new_plane_state(drm_state, drm_plane);
+
+	struct vs_plane_state *plane_state = to_vs_plane_state(state);
+	struct drm_crtc *crtc = state->crtc;
+	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+
+	update_fb(plane, &fb, state);
+
+	update_scale(&scale, fb.width, fb.height,
+		     mode->hdisplay, mode->vdisplay, state->rotation);
+
+	if (plane_state->degamma_changed)
+		update_degamma(dc, plane, plane_state);
+
+	dc_hw_update_plane(&dc->hw, plane->id, &fb, &scale);
+}
+
+static void update_overlay_plane(struct vs_dc *dc, struct vs_plane *plane,
+				 struct drm_plane *drm_plane,
+				 struct drm_atomic_commit *drm_state)
+{
+	struct dc_hw_fb fb = {0};
+	struct dc_hw_scale scale;
+	struct dc_hw_position pos;
+	struct dc_hw_blend blend;
+	struct drm_plane_state *state =
+		 drm_atomic_get_new_plane_state(drm_state, drm_plane);
+
+	struct vs_plane_state *plane_state = to_vs_plane_state(state);
+	struct drm_rect *dest = &state->dst;
+
+	update_fb(plane, &fb, state);
+
+	update_scale(&scale, fb.width, fb.height,
+		     drm_rect_width(dest), drm_rect_height(dest),
+		     state->rotation);
+
+	if (plane_state->degamma_changed)
+		update_degamma(dc, plane, plane_state);
+
+	dc_hw_update_plane(&dc->hw, plane->id, &fb, &scale);
+	pos.start_x = dest->x1;
+	pos.start_y = dest->y1;
+	pos.end_x = dest->x2;
+	pos.end_y = dest->y2;
+	dc_hw_set_position(&dc->hw, &pos);
+
+	blend.alpha = (u8)(state->alpha >> 8);
+	blend.blend_mode = (u8)(state->pixel_blend_mode);
+	dc_hw_set_blend(&dc->hw, &blend);
+}
+
+static void update_cursor_plane(struct vs_dc *dc, struct vs_plane *plane,
+				struct drm_plane *drm_plane,
+				struct drm_atomic_commit *drm_state)
+{
+	struct drm_plane_state *state =
+		 drm_atomic_get_new_plane_state(drm_state, drm_plane);
+	struct dc_hw_cursor cursor;
+
+	cursor.address = plane->dma_addr[0];
+	cursor.x = state->crtc_x;
+	cursor.y = state->crtc_y;
+	cursor.hot_x = state->hotspot_x;
+	cursor.hot_y = state->hotspot_y;
+	cursor.enable = true;
+
+	dc_hw_update_cursor(&dc->hw, &cursor);
+}
+
+static void vs_dc_update_plane(struct device *dev, struct vs_plane *plane,
+			       struct drm_plane *drm_plane,
+			       struct drm_atomic_commit *drm_state)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+	enum drm_plane_type type = plane->base.type;
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		update_primary_plane(dc, plane, drm_plane, drm_state);
+		break;
+	case DRM_PLANE_TYPE_OVERLAY:
+		update_overlay_plane(dc, plane, drm_plane, drm_state);
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		update_cursor_plane(dc, plane, drm_plane, drm_state);
+		break;
+	default:
+		break;
+	}
+}
+
+static void vs_dc_disable_plane(struct device *dev, struct vs_plane *plane)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+	enum drm_plane_type type = plane->base.type;
+	struct dc_hw_fb fb = {0};
+	struct dc_hw_cursor cursor = {0};
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+	case DRM_PLANE_TYPE_OVERLAY:
+		fb.enable = false;
+		dc_hw_update_plane(&dc->hw, plane->id, &fb, NULL);
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		cursor.enable = false;
+		dc_hw_update_cursor(&dc->hw, &cursor);
+		break;
+	default:
+		break;
+	}
+}
+
+static bool vs_dc_mod_supported(const struct vs_plane_info *plane_info,
+				u64 modifier)
+{
+	const u64 *mods;
+
+	if (!plane_info->modifiers)
+		return false;
+
+	for (mods = plane_info->modifiers; *mods != DRM_FORMAT_MOD_INVALID; mods++) {
+		if (*mods == modifier)
+			return true;
+	}
+
+	return false;
+}
+
+static int vs_dc_check_plane(struct device *dev, struct vs_plane *plane,
+			     struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *new_plane_state =
+			 drm_atomic_get_new_plane_state(state, &plane->base);
+
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	const struct vs_plane_info *plane_info;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_crtc_state *crtc_state;
+
+	plane_info = &dc->hw.info->planes[plane->id];
+
+	if (fb->width < plane_info->min_width ||
+	    fb->width > plane_info->max_width ||
+	    fb->height < plane_info->min_height ||
+	    fb->height > plane_info->max_height)
+		dev_err_once(dev, "buffer size may not support on plane%d.\n",
+			     plane->id);
+
+	if (plane->base.type != DRM_PLANE_TYPE_CURSOR &&
+	    !vs_dc_mod_supported(plane_info, fb->modifier)) {
+		dev_err(dev, "unsupported modifier on plane%d.\n", plane->id);
+		return -EINVAL;
+	}
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!crtc_state)
+		return -EINVAL;
+
+	return drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  plane_info->min_scale,
+						  plane_info->max_scale,
+						  true, true);
+}
+
+static irqreturn_t dc_isr(int irq, void *data)
+{
+	struct vs_dc *dc = data;
+
+	if (!dc->crtc)
+		return IRQ_HANDLED;
+
+	if (!dc->crtc->base.state)
+		return IRQ_HANDLED;
+
+	dc_hw_get_interrupt(&dc->hw);
+
+	vs_crtc_handle_vblank(&dc->crtc->base,
+			      dc_hw_check_underflow(&dc->hw));
+
+	return IRQ_HANDLED;
+}
+
+static void vs_dc_commit(struct device *dev)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+
+	if (!dc->first_frame) {
+		if (dc_hw_flip_in_progress(&dc->hw))
+			udelay(100);
+
+		dc_hw_enable_shadow_register(&dc->hw, false);
+	}
+
+	dc_hw_commit(&dc->hw);
+
+	if (dc->first_frame)
+		dc->first_frame = false;
+
+	dc_hw_enable_shadow_register(&dc->hw, true);
+}
+
+static const struct vs_crtc_funcs dc_crtc_funcs = {
+	.enable			= vs_dc_enable,
+	.disable		= vs_dc_disable,
+	.mode_fixup		= vs_dc_mode_fixup,
+	.set_gamma		= vs_dc_set_gamma,
+	.enable_gamma		= vs_dc_enable_gamma,
+	.enable_vblank		= vs_dc_enable_vblank,
+	.commit			= vs_dc_commit,
+};
+
+static const struct vs_plane_funcs dc_plane_funcs = {
+	.update			= vs_dc_update_plane,
+	.disable		= vs_dc_disable_plane,
+	.check			= vs_dc_check_plane,
+};
+
+static int dc_get_bmc_comm_csr(struct device *dev, struct drm_device *drm_dev)
+{
+	struct vs_drm_private *priv = to_vs_priv(drm_dev);
+	struct pci_dev *pdev = to_pci_dev(drm_dev->dev);
+	resource_size_t addr[2];
+
+	addr[0] = pci_resource_start(pdev, VS_CSR_BAR);
+
+	if (priv->flags == VS_DC_FLAG_IS_HOST0) {
+		addr[1] = addr[0] + H2B_BASE_OFF;
+	} else {
+		addr[0] = addr[0] + B2H_SIZE;
+		addr[1] = addr[0] + B2H_SIZE + H2B_SIZE;
+	}
+
+	priv->comm_b2h = devm_ioremap(dev, addr[0], B2H_SIZE);
+	priv->comm_h2b = devm_ioremap(dev, addr[1], H2B_SIZE);
+	if (!priv->comm_b2h || !priv->comm_h2b)
+		return -ENOMEM;
+
+	priv->node_type = vs_dc_read_reg(priv->comm_h2b, VS_NODE_TYPE);
+
+	return 0;
+}
+
+/*
+ * Post an event to the BMC firmware. PIXEL_BIT carries the pixel clock of
+ * @content (a struct drm_display_mode), MODE_BIT carries the whole mode.
+ *
+ * The mailbox is a single set of registers, so only one transaction may be
+ * in flight: the caller must hold priv->bmc_lock.
+ */
+void __vs_dc_h2b_assign_task(struct vs_drm_private *priv, u32 event_type,
+			     void *content)
+{
+	struct vs_dc *dc = &priv->dc;
+	struct drm_display_mode *mode = content;
+	u32 val = 0, i;
+
+	lockdep_assert_held(&priv->bmc_lock);
+
+	val |= event_type;
+	for (i = 0; i < COMM_TRY_CONT; i++) {
+		if (!vs_dc_read_reg(priv->comm_h2b, H2B_DONE)) {
+			if (event_type == PIXEL_BIT) {
+				vs_dc_write_reg(priv->comm_h2b, mode->clock,
+						H2B_PIXEL);
+				dc->pix_clk_rate = mode->clock;
+			} else if (event_type == MODE_BIT) {
+				memcpy_toio(priv->comm_h2b + H2B_DATA, mode,
+					    sizeof(struct drm_display_mode));
+			}
+			vs_dc_write_reg(priv->comm_h2b, val, H2B_TYPE);
+			vs_dc_write_reg(priv->comm_h2b, 1, H2B_DONE);
+			break;
+		}
+
+		if (event_type == PIXEL_BIT)
+			dc->pix_clk_rate = 0;
+
+		dev_dbg(priv->base.dev, "retry set event: 0x%x\n", event_type);
+		usleep_range(100, 200);
+	}
+
+	if (!vs_h2b_wait_ack(priv, event_type)) {
+		vs_dc_write_reg(priv->comm_h2b, 0, H2B_DONE);
+		if (event_type == PIXEL_BIT)
+			dc->pix_clk_rate = 0;
+		dev_err(priv->base.dev, "failed to set 0x%x, step 1\n",
+			event_type);
+	}
+}
+
+void vs_dc_h2b_assign_task(struct vs_drm_private *priv, u32 event_type,
+			   void *content)
+{
+	mutex_lock(&priv->bmc_lock);
+	__vs_dc_h2b_assign_task(priv, event_type, content);
+	mutex_unlock(&priv->bmc_lock);
+}
+
+static int dc_bind(struct device *dev, struct drm_device *drm_dev)
+{
+	struct vs_drm_private *priv = to_vs_priv(drm_dev);
+	struct vs_dc *dc = &priv->dc;
+	struct vs_crtc *crtc;
+	const struct vs_dc_info *dc_info;
+	const struct vs_plane_info *plane_info;
+	struct vs_plane *plane;
+	struct drm_plane *drm_plane, *tmp;
+	int i, ret;
+
+	ret = dc_init(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to initialize DC hardware.\n");
+		return ret;
+	}
+
+	dc_info = dc->hw.info;
+
+	crtc = vs_crtc_create(drm_dev, dc_info);
+	if (!crtc) {
+		dev_err(dev, "Failed to create CRTC.\n");
+		ret = -ENOMEM;
+		goto err_clean_dc;
+	}
+
+	crtc->dev = dev;
+	crtc->funcs = &dc_crtc_funcs;
+
+	for (i = 0; i < dc_info->plane_num; i++) {
+		plane_info = &dc_info->planes[i];
+
+		plane = vs_plane_create(drm_dev, plane_info,
+					drm_crtc_mask(&crtc->base));
+		if (!plane) {
+			ret = -ENOMEM;
+			goto err_cleanup_planes;
+		}
+
+		plane->funcs = &dc_plane_funcs;
+
+		if (plane_info->type == DRM_PLANE_TYPE_PRIMARY) {
+			crtc->base.primary = &plane->base;
+			drm_dev->mode_config.min_width = plane_info->min_width;
+			drm_dev->mode_config.min_height =
+						plane_info->min_height;
+			drm_dev->mode_config.max_width = plane_info->max_width;
+			drm_dev->mode_config.max_height =
+						plane_info->max_height;
+		}
+
+		if (plane_info->type == DRM_PLANE_TYPE_CURSOR) {
+			crtc->base.cursor = &plane->base;
+			drm_dev->mode_config.cursor_width =
+						plane_info->max_width;
+			drm_dev->mode_config.cursor_height =
+						plane_info->max_height;
+		}
+	}
+
+	dc->crtc = crtc;
+
+	if (dc_info->pitch_alignment > priv->pitch_alignment)
+		priv->pitch_alignment = dc_info->pitch_alignment;
+
+	return 0;
+
+err_cleanup_planes:
+	list_for_each_entry_safe(drm_plane, tmp,
+				 &drm_dev->mode_config.plane_list, head)
+		if (drm_plane->possible_crtcs == drm_crtc_mask(&crtc->base))
+			vs_plane_destroy(drm_plane);
+
+	vs_crtc_destroy(&crtc->base);
+err_clean_dc:
+	dc_deinit(dev);
+	return ret;
+}
+
+static void dc_unbind(struct device *dev)
+{
+	struct vs_dc *dc = dev_to_vs_dc(dev);
+
+	dc_deinit(dev);
+	pci_free_irq(to_pci_dev(dev), VS_DC_IRQ, dc);
+}
+
+static int dc_request_irq(struct pci_dev *pdev, struct vs_dc *dc)
+{
+	struct device *dev = &pdev->dev;
+	int ret, nr_irqs;
+
+	nr_irqs = pci_alloc_irq_vectors(pdev, VS_MIN_VECS, VS_MAX_VECS,
+					PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	if (nr_irqs < 0) {
+		dev_err(dev, "Failed to allocate msi irqs: %d\n", nr_irqs);
+		return nr_irqs;
+	}
+
+	dev_dbg(dev, "dc irq: %d, %d vectors\n",
+		pci_irq_vector(pdev, VS_DC_IRQ), nr_irqs);
+
+	ret = pci_request_irq(pdev, VS_DC_IRQ, dc_isr, NULL, dc, "%s-dc",
+			      dev_name(dev));
+	if (ret < 0) {
+		dev_err(dev, "Failed to request dc irq: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int vs_dc_pci_init(struct drm_device *drm_dev)
+{
+	struct pci_dev *pdev = to_pci_dev(drm_dev->dev);
+	struct device *dev = &pdev->dev;
+	struct vs_drm_private *priv = to_vs_priv(drm_dev);
+	struct vs_dc *dc = &priv->dc;
+	resource_size_t addr;
+	int ret;
+	unsigned int chip_id, chip_revision, chip_patch_revision;
+	unsigned int chip_info, product_id;
+
+	ret = dc_request_irq(pdev, dc);
+	if (ret)
+		return ret;
+
+	addr = pci_resource_start(pdev, VS_DC_BAR);
+	dev_dbg(dev, "dc csr: %pa, len: %pa\n", &addr,
+		&pdev->resource[VS_DC_BAR].end);
+
+	dc->hw.hi_base = devm_ioremap(dev, addr, HI_BASE_SIZE);
+	dc->hw.reg_base = devm_ioremap(dev, addr + DC_REG_BASE, DC_REG_RANGE);
+	if (!dc->hw.hi_base || !dc->hw.reg_base)
+		return -ENOMEM;
+
+	dc->flags = priv->flags;
+
+	ret = dc_get_bmc_comm_csr(dev, drm_dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to map the BMC mailboxes.\n");
+		return ret;
+	}
+
+	chip_id = hi_read(&dc->hw, 0x0020);
+	chip_revision = hi_read(&dc->hw, 0x0024);
+	chip_patch_revision = hi_read(&dc->hw, 0x0098);
+	chip_info = hi_read(&dc->hw, 0x00A4);
+	product_id = hi_read(&dc->hw, 0x00A8);
+
+	dev_info(dev, "DC hardware: chip id 0x%08x, revision 0x%08x, patch revision 0x%08x, info 0x%08x, product id 0x%08x\n",
+		 chip_id, chip_revision, chip_patch_revision, chip_info,
+		 product_id);
+
+	return dc_bind(dev, drm_dev);
+}
+
+void vs_dc_pci_deinit(struct drm_device *drm_dev)
+{
+	struct device *dev = drm_dev->dev;
+	struct vs_drm_private *priv = to_vs_priv(drm_dev);
+
+	vs_dc_write_reg(priv->comm_b2h, 0x1, BMC_DC_REMOVE_STATUS);
+	vs_dc_write_reg(priv->comm_h2b, 0, H2B_VCE_MODE);
+	dc_unbind(dev);
+}
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_dc.h b/drivers/gpu/drm/verisilicon/pci/vs_dc.h
new file mode 100644
index 000000000000..00f01e89a9bf
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_dc.h
@@ -0,0 +1,138 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+#ifndef __VS_DC_H__
+#define __VS_DC_H__
+
+#include <linux/io.h>
+#include <linux/types.h>
+
+#include "vs_crtc.h"
+#include "vs_dc_hw.h"
+#include "vs_plane.h"
+
+struct device;
+struct drm_device;
+struct vs_drm_private;
+struct vs_virtual_display;
+
+/* Which of the two host slots of the BMC this device is plugged into */
+#define VS_DC_FLAG_IS_HOST0		(0)
+#define VS_DC_FLAG_IS_HOST1		(1)
+
+#define MAX_EDID_LEN			(256 + 128)
+#define HI_BASE_SIZE			0x100
+
+/*
+ * Host to BMC (H2B) and BMC to host (B2H) mailboxes, located in the CSR BAR.
+ * The layout is shared with the BMC firmware.
+ */
+#define H2B_SIZE			0x100
+#define H2B_DONE			0xfc
+#define H2B_TYPE			0xf8
+#define H2B_PIXEL			0xf4
+#define H2B_VCE_STATUS			0xf0
+#define H2B_VCE				0x88
+#define H2B_DATA			0x10
+#define H2B_BASE_OFF			0x400
+#define H2B_VCE_MODE			0xec
+
+#define B2H_SIZE			0x200
+#define B2H_DONE			0x1fc
+#define B2H_DATA			0x10
+#define B2H_CONNECT			0x4
+#define B2H_VCE_UPDATE			0x1f4
+#define BMC_DC_REMOVE_STATUS		0x1f8
+
+/* H2B_TYPE event bits */
+#define VCE_BIT				BIT(0)
+#define MODE_BIT			BIT(1)
+#define PIXEL_BIT			BIT(2)
+#define CONNECT_POWER_OFF		BIT(3)
+#define DC_POWER_LOW			BIT(4)
+#define DYNSW_OFF			BIT(5)
+#define DYNSW_ON			BIT(6)
+#define DC_POWER_ON			BIT(7)
+#define DC_CRTC_ON			BIT(9)
+#define DC_CRTC_OFF			BIT(10)
+
+#define EDID_BIT			BIT(2)
+#define HOTPLUG_BIT			BIT(2)
+
+#define BMC_VGA_STATUS			BIT(1)
+#define BMC_DP_STATUS			BIT(0)
+
+#define COMM_TRY_CONT			15
+
+#define VS_MAX_VECS			4
+#define VS_MIN_VECS			1
+
+/* MSI vector usage */
+#define VS_DC_IRQ			0
+#define VS_B2H_IRQ			1
+
+/* All BARs are 64-bit, hence they occupy even BAR slots only */
+#define VS_CSR_BAR			0
+#define VS_DC_BAR			2
+#define VS_MEM_BAR			4
+
+/* Address of the memory BAR as seen by the DC DMA engine, per host slot */
+#define VS_MEMORY_ADDR0			0x408000000ULL
+#define VS_MEMORY_ADDR1			0x41c000000ULL
+#define VS_NODE_TYPE			0x4
+
+struct vs_dc {
+	struct vs_crtc		*crtc;
+	struct dc_hw		hw;
+
+	unsigned int		flags;
+	unsigned int		pix_clk_rate; /* in KHz */
+
+	bool			first_frame;
+
+	struct vs_virtual_display *vd;
+};
+
+#ifdef CONFIG_DRM_VERISILICON_DC8000_VCE
+enum vce_buf_format {
+	VIDEO_FMT_YUV444 = 0,
+	VIDEO_FMT_NV16,
+	VIDEO_FMT_NV12,
+	VIDEO_FMT_XRGB8888,
+	VIDEO_FMT_BUF_MAX
+};
+
+/* Frame buffer description handed to the BMC video capture engine */
+struct video_timing {
+	__u32 offset;        /* Frame buffer offset relative to base */
+	__u32 width;         /* Frame width in pixels */
+	__u32 height;        /* Frame height in pixels */
+	__u32 format;        /* enum vce_buf_format */
+	__u32 stride;        /* Bytes per line in framebuffer */
+
+	__u8  dc_v_pol;      /* Vertical sync polarity (reserved) */
+	__u8  dc_h_pol;      /* Horizontal sync polarity (reserved) */
+	__u16 reserved;      /* Explicit padding for 4-byte alignment */
+} __packed __aligned(4);
+#endif
+
+int vs_dc_pci_init(struct drm_device *drm_dev);
+void vs_dc_pci_deinit(struct drm_device *drm_dev);
+void __vs_dc_h2b_assign_task(struct vs_drm_private *priv, u32 event_type,
+			     void *content);
+void vs_dc_h2b_assign_task(struct vs_drm_private *priv, u32 event_type,
+			   void *content);
+
+static inline void vs_dc_write_reg(void __iomem *addr, u32 val, u32 offset)
+{
+	writel(val, addr + offset);
+}
+
+static inline u32 vs_dc_read_reg(void __iomem *addr, u32 reg)
+{
+	return readl(addr + reg);
+}
+
+#endif /* __VS_DC_H__ */
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c b/drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c
new file mode 100644
index 000000000000..519f54f5ebd2
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_dc_hw.c
@@ -0,0 +1,1502 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_fourcc.h>
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/media-bus-format.h>
+
+#include "vs_dc_hw.h"
+#include "vs_type.h"
+
+static const u32 horKernel[] = {
+	0x00000000, 0x20000000, 0x00002000, 0x00000000,
+	0x00000000, 0x00000000, 0x23fd1c03, 0x00000000,
+	0x00000000, 0x00000000, 0x181f0000, 0x000027e1,
+	0x00000000, 0x00000000, 0x00000000, 0x2b981468,
+	0x00000000, 0x00000000, 0x00000000, 0x10f00000,
+	0x00002f10, 0x00000000, 0x00000000, 0x00000000,
+	0x32390dc7, 0x00000000, 0x00000000, 0x00000000,
+	0x0af50000, 0x0000350b, 0x00000000, 0x00000000,
+	0x00000000, 0x3781087f, 0x00000000, 0x00000000,
+	0x00000000, 0x06660000, 0x0000399a, 0x00000000,
+	0x00000000, 0x00000000, 0x3b5904a7, 0x00000000,
+	0x00000000, 0x00000000, 0x033c0000, 0x00003cc4,
+	0x00000000, 0x00000000, 0x00000000, 0x3de1021f,
+	0x00000000, 0x00000000, 0x00000000, 0x01470000,
+	0x00003eb9, 0x00000000, 0x00000000, 0x00000000,
+	0x3f5300ad, 0x00000000, 0x00000000, 0x00000000,
+	0x00480000, 0x00003fb8, 0x00000000, 0x00000000,
+	0x00000000, 0x3fef0011, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00004000, 0x00000000,
+	0x00000000, 0x00000000, 0x20002000, 0x00000000,
+	0x00000000, 0x00000000, 0x1c030000, 0x000023fd,
+	0x00000000, 0x00000000, 0x00000000, 0x27e1181f,
+	0x00000000, 0x00000000, 0x00000000, 0x14680000,
+	0x00002b98, 0x00000000, 0x00000000, 0x00000000,
+	0x2f1010f0, 0x00000000, 0x00000000, 0x00000000,
+	0x0dc70000, 0x00003239, 0x00000000, 0x00000000,
+	0x00000000, 0x350b0af5, 0x00000000, 0x00000000,
+	0x00000000, 0x087f0000, 0x00003781, 0x00000000,
+	0x00000000, 0x00000000, 0x399a0666, 0x00000000,
+	0x00000000, 0x00000000, 0x04a70000, 0x00003b59,
+	0x00000000, 0x00000000, 0x00000000, 0x3cc4033c,
+	0x00000000, 0x00000000, 0x00000000, 0x021f0000,
+};
+
+#define H_COEF_SIZE (sizeof(horKernel) / sizeof(u32))
+
+static const u32 verKernel[] = {
+	0x00000000, 0x20000000, 0x00002000, 0x00000000,
+	0x00000000, 0x00000000, 0x23fd1c03, 0x00000000,
+	0x00000000, 0x00000000, 0x181f0000, 0x000027e1,
+	0x00000000, 0x00000000, 0x00000000, 0x2b981468,
+	0x00000000, 0x00000000, 0x00000000, 0x10f00000,
+	0x00002f10, 0x00000000, 0x00000000, 0x00000000,
+	0x32390dc7, 0x00000000, 0x00000000, 0x00000000,
+	0x0af50000, 0x0000350b, 0x00000000, 0x00000000,
+	0x00000000, 0x3781087f, 0x00000000, 0x00000000,
+	0x00000000, 0x06660000, 0x0000399a, 0x00000000,
+	0x00000000, 0x00000000, 0x3b5904a7, 0x00000000,
+	0x00000000, 0x00000000, 0x033c0000, 0x00003cc4,
+	0x00000000, 0x00000000, 0x00000000, 0x3de1021f,
+	0x00000000, 0x00000000, 0x00000000, 0x01470000,
+	0x00003eb9, 0x00000000, 0x00000000, 0x00000000,
+	0x3f5300ad, 0x00000000, 0x00000000, 0x00000000,
+	0x00480000, 0x00003fb8, 0x00000000, 0x00000000,
+	0x00000000, 0x3fef0011, 0x00000000, 0x00000000,
+	0x00000000, 0x00000000, 0x00004000, 0x00000000,
+	0xcdcd0000, 0xfdfdfdfd, 0xabababab, 0xabababab,
+	0x00000000, 0x00000000, 0x5ff5f456, 0x000f5f58,
+	0x02cc6c78, 0x02cc0c28, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+	0xfeeefeee, 0xfeeefeee, 0xfeeefeee, 0xfeeefeee,
+};
+
+#define V_COEF_SIZE (sizeof(verKernel) / sizeof(u32))
+
+/*
+ * RGB 709->2020 conversion parameters
+ */
+static u16 RGB2RGB[RGB_TO_RGB_TABLE_SIZE] = {
+	10279,	5395,	709,
+	1132,	15065,	187,
+	269,	1442,	14674
+};
+
+/*
+ * YUV601 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV601_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196,	 0,		1640,	1196,
+	-404,	-836,		1196,	2076,
+	0,	-916224,	558336, -1202944,
+	64,	940,		64,	960
+};
+
+/*
+ * YUV709 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV709_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196,	 0,		1844,	1196,
+	-220,	-548,		1196,	2172,
+	0,	-1020672,	316672,	-1188608,
+	64,	940,		64,	960
+};
+
+/*
+ * YUV2020 to RGB conversion parameters
+ * YUV2RGB[0]  - [8] : C0 - C8;
+ * YUV2RGB[9]  - [11]: D0 - D2;
+ * YUV2RGB[12] - [13]: Y clamp min & max calue;
+ * YUV2RGB[14] - [15]: UV clamp min & max calue;
+ */
+static s32 YUV2020_2RGB[YUV_TO_RGB_TABLE_SIZE] = {
+	1196,	0,		1724,	1196,
+	-192,	-668,		1196,	2200,
+	0,	-959232,	363776,	-1202944,
+	64,	940,		64,	960
+};
+
+/*
+ * RGB to YUV2020 conversion parameters
+ * RGB2YUV[0] - [8] : C0 - C8;
+ * RGB2YUV[9] - [11]: D0 - D2;
+ */
+static s16 RGB2YUV[RGB_TO_YUV_TABLE_SIZE] = {
+	230,	594,	52,
+	-125,	-323,	448,
+	448,	-412,	-36,
+	64,	512,	512
+};
+
+/*
+ * Degamma table for 709 color space data.
+ */
+static u16 DEGAMMA_709[DEGAMMA_SIZE] = {
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0001, 0x0002, 0x0004, 0x0005,
+	0x0007, 0x000a, 0x000d, 0x0011, 0x0015, 0x0019, 0x001e, 0x0024,
+	0x002a, 0x0030, 0x0038, 0x003f, 0x0048, 0x0051, 0x005a, 0x0064,
+	0x006f, 0x007b, 0x0087, 0x0094, 0x00a1, 0x00af, 0x00be, 0x00ce,
+	0x00de, 0x00ef, 0x0101, 0x0114, 0x0127, 0x013b, 0x0150, 0x0166,
+	0x017c, 0x0193, 0x01ac, 0x01c4, 0x01de, 0x01f9, 0x0214, 0x0230,
+	0x024d, 0x026b, 0x028a, 0x02aa, 0x02ca, 0x02ec, 0x030e, 0x0331,
+	0x0355, 0x037a, 0x03a0, 0x03c7, 0x03ef, 0x0418, 0x0441, 0x046c,
+	0x0498, 0x04c4, 0x04f2, 0x0520, 0x0550, 0x0581, 0x05b2, 0x05e5,
+	0x0618, 0x064d, 0x0682, 0x06b9, 0x06f0, 0x0729, 0x0763, 0x079d,
+	0x07d9, 0x0816, 0x0854, 0x0893, 0x08d3, 0x0914, 0x0956, 0x0999,
+	0x09dd, 0x0a23, 0x0a69, 0x0ab1, 0x0afa, 0x0b44, 0x0b8f, 0x0bdb,
+	0x0c28, 0x0c76, 0x0cc6, 0x0d17, 0x0d69, 0x0dbb, 0x0e10, 0x0e65,
+	0x0ebb, 0x0f13, 0x0f6c, 0x0fc6, 0x1021, 0x107d, 0x10db, 0x113a,
+	0x119a, 0x11fb, 0x125d, 0x12c1, 0x1325, 0x138c, 0x13f3, 0x145b,
+	0x14c5, 0x1530, 0x159c, 0x160a, 0x1678, 0x16e8, 0x175a, 0x17cc,
+	0x1840, 0x18b5, 0x192b, 0x19a3, 0x1a1c, 0x1a96, 0x1b11, 0x1b8e,
+	0x1c0c, 0x1c8c, 0x1d0c, 0x1d8e, 0x1e12, 0x1e96, 0x1f1c, 0x1fa3,
+	0x202c, 0x20b6, 0x2141, 0x21ce, 0x225c, 0x22eb, 0x237c, 0x240e,
+	0x24a1, 0x2536, 0x25cc, 0x2664, 0x26fc, 0x2797, 0x2832, 0x28cf,
+	0x296e, 0x2a0e, 0x2aaf, 0x2b51, 0x2bf5, 0x2c9b, 0x2d41, 0x2dea,
+	0x2e93, 0x2f3e, 0x2feb, 0x3099, 0x3148, 0x31f9, 0x32ab, 0x335f,
+	0x3414, 0x34ca, 0x3582, 0x363c, 0x36f7, 0x37b3, 0x3871, 0x3930,
+	0x39f1, 0x3ab3, 0x3b77, 0x3c3c, 0x3d02, 0x3dcb, 0x3e94, 0x3f5f,
+	0x402c, 0x40fa, 0x41ca, 0x429b, 0x436d, 0x4442, 0x4517, 0x45ee,
+	0x46c7, 0x47a1, 0x487d, 0x495a, 0x4a39, 0x4b19, 0x4bfb, 0x4cde,
+	0x4dc3, 0x4eaa, 0x4f92, 0x507c, 0x5167, 0x5253, 0x5342, 0x5431,
+	0x5523, 0x5616, 0x570a, 0x5800, 0x58f8, 0x59f1, 0x5aec, 0x5be9,
+	0x5ce7, 0x5de6, 0x5ee7, 0x5fea, 0x60ef, 0x61f5, 0x62fc, 0x6406,
+	0x6510, 0x661d, 0x672b, 0x683b, 0x694c, 0x6a5f, 0x6b73, 0x6c8a,
+	0x6da2, 0x6ebb, 0x6fd6, 0x70f3, 0x7211, 0x7331, 0x7453, 0x7576,
+	0x769b, 0x77c2, 0x78ea, 0x7a14, 0x7b40, 0x7c6d, 0x7d9c, 0x7ecd,
+	0x3f65, 0x3f8c, 0x3fb2, 0x3fd8
+};
+
+/*
+ * Degamma table for 2020 color space data.
+ */
+static u16 DEGAMMA_2020[DEGAMMA_SIZE] = {
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+	0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
+	0x0000, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001, 0x0001,
+	0x0001, 0x0002, 0x0002, 0x0002, 0x0002, 0x0002, 0x0003, 0x0003,
+	0x0003, 0x0003, 0x0004, 0x0004, 0x0004, 0x0005, 0x0005, 0x0006,
+	0x0006, 0x0006, 0x0007, 0x0007, 0x0008, 0x0008, 0x0009, 0x000a,
+	0x000a, 0x000b, 0x000c, 0x000c, 0x000d, 0x000e, 0x000f, 0x000f,
+	0x0010, 0x0011, 0x0012, 0x0013, 0x0014, 0x0016, 0x0017, 0x0018,
+	0x0019, 0x001b, 0x001c, 0x001e, 0x001f, 0x0021, 0x0022, 0x0024,
+	0x0026, 0x0028, 0x002a, 0x002c, 0x002e, 0x0030, 0x0033, 0x0035,
+	0x0038, 0x003a, 0x003d, 0x0040, 0x0043, 0x0046, 0x0049, 0x004d,
+	0x0050, 0x0054, 0x0057, 0x005b, 0x005f, 0x0064, 0x0068, 0x006d,
+	0x0071, 0x0076, 0x007c, 0x0081, 0x0086, 0x008c, 0x0092, 0x0098,
+	0x009f, 0x00a5, 0x00ac, 0x00b4, 0x00bb, 0x00c3, 0x00cb, 0x00d3,
+	0x00dc, 0x00e5, 0x00ee, 0x00f8, 0x0102, 0x010c, 0x0117, 0x0123,
+	0x012e, 0x013a, 0x0147, 0x0154, 0x0161, 0x016f, 0x017e, 0x018d,
+	0x019c, 0x01ac, 0x01bd, 0x01ce, 0x01e0, 0x01f3, 0x0206, 0x021a,
+	0x022f, 0x0244, 0x025a, 0x0272, 0x0289, 0x02a2, 0x02bc, 0x02d6,
+	0x02f2, 0x030f, 0x032c, 0x034b, 0x036b, 0x038b, 0x03ae, 0x03d1,
+	0x03f5, 0x041b, 0x0443, 0x046b, 0x0495, 0x04c1, 0x04ee, 0x051d,
+	0x054e, 0x0580, 0x05b4, 0x05ea, 0x0622, 0x065c, 0x0698, 0x06d6,
+	0x0717, 0x075a, 0x079f, 0x07e7, 0x0831, 0x087e, 0x08cd, 0x0920,
+	0x0976, 0x09ce, 0x0a2a, 0x0a89, 0x0aec, 0x0b52, 0x0bbc, 0x0c2a,
+	0x0c9b, 0x0d11, 0x0d8b, 0x0e0a, 0x0e8d, 0x0f15, 0x0fa1, 0x1033,
+	0x10ca, 0x1167, 0x120a, 0x12b2, 0x1360, 0x1415, 0x14d1, 0x1593,
+	0x165d, 0x172e, 0x1806, 0x18e7, 0x19d0, 0x1ac1, 0x1bbb, 0x1cbf,
+	0x1dcc, 0x1ee3, 0x2005, 0x2131, 0x2268, 0x23ab, 0x24fa, 0x2656,
+	0x27be, 0x2934, 0x2ab8, 0x2c4a, 0x2dec, 0x2f9d, 0x315f, 0x3332,
+	0x3516, 0x370d, 0x3916, 0x3b34, 0x3d66, 0x3fad, 0x420b, 0x4480,
+	0x470d, 0x49b3, 0x4c73, 0x4f4e, 0x5246, 0x555a, 0x588e, 0x5be1,
+	0x5f55, 0x62eb, 0x66a6, 0x6a86, 0x6e8c, 0x72bb, 0x7714, 0x7b99,
+	0x3dcb, 0x3e60, 0x3ef5, 0x3f8c
+};
+
+/* one is for primary plane and the other is for all overlay planes */
+static const struct dc_hw_plane_reg dc_plane_reg[] = {
+	{
+	.y_address		= DC_FRAMEBUFFER_ADDRESS,
+	.u_address		= DC_FRAMEBUFFER_U_ADDRESS,
+	.v_address		= DC_FRAMEBUFFER_V_ADDRESS,
+	.y_stride		= DC_FRAMEBUFFER_STRIDE,
+	.u_stride		= DC_FRAMEBUFFER_U_STRIDE,
+	.v_stride		= DC_FRAMEBUFFER_V_STRIDE,
+	.size			= DC_FRAMEBUFFER_SIZE,
+	.scale_factor_x		= DC_FRAMEBUFFER_SCALE_FACTOR_X,
+	.scale_factor_y		= DC_FRAMEBUFFER_SCALE_FACTOR_Y,
+	.h_filter_coef_index = DC_FRAMEBUFFER_H_FILTER_COEF_INDEX,
+	.h_filter_coef_data  = DC_FRAMEBUFFER_H_FILTER_COEF_DATA,
+	.v_filter_coef_index = DC_FRAMEBUFFER_V_FILTER_COEF_INDEX,
+	.v_filter_coef_data  = DC_FRAMEBUFFER_V_FILTER_COEF_DATA,
+	.init_offset		 = DC_FRAMEBUFFER_INIT_OFFSET,
+	.color_key			 = DC_FRAMEBUFFER_COLOR_KEY,
+	.color_key_high		= DC_FRAMEBUFFER_COLOR_KEY_HIGH,
+	.clear_value		 = DC_FRAMEBUFFER_CLEAR_VALUE,
+	.color_table_index	 = DC_FRAMEBUFFER_COLOR_TABLE_INDEX,
+	.color_table_data	 = DC_FRAMEBUFFER_COLOR_TABLE_DATA,
+	.scale_config		 = DC_FRAMEBUFFER_SCALE_CONFIG,
+	.degamma_index		 = DC_FRAMEBUFFER_DEGAMMA_INDEX,
+	.degamma_data		 = DC_FRAMEBUFFER_DEGAMMA_DATA,
+	.degamma_ex_data	 = DC_FRAMEBUFFER_DEGAMMA_EX_DATA,
+	.yuv_to_rgb_coef0	 = DC_FRAMEBUFFER_YUVTORGB_COEF0,
+	.yuv_to_rgb_coef1	 = DC_FRAMEBUFFER_YUVTORGB_COEF1,
+	.yuv_to_rgb_coef2	 = DC_FRAMEBUFFER_YUVTORGB_COEF2,
+	.yuv_to_rgb_coef3	 = DC_FRAMEBUFFER_YUVTORGB_COEF3,
+	.yuv_to_rgb_coef4	 = DC_FRAMEBUFFER_YUVTORGB_COEF4,
+	.yuv_to_rgb_coefd0	 = DC_FRAMEBUFFER_YUVTORGB_COEFD0,
+	.yuv_to_rgb_coefd1	 = DC_FRAMEBUFFER_YUVTORGB_COEFD1,
+	.yuv_to_rgb_coefd2	 = DC_FRAMEBUFFER_YUVTORGB_COEFD2,
+	.yclampbound		 = DC_FRAMEBUFFER_Y_CLAMP_BOUND,
+	.uvclampbound		 = DC_FRAMEBUFFER_UV_CLAMP_BOUND,
+	.rgb_to_rgb_coef0	 = DC_FRAMEBUFFER_RGBTORGB_COEF0,
+	.rgb_to_rgb_coef1	 = DC_FRAMEBUFFER_RGBTORGB_COEF1,
+	.rgb_to_rgb_coef2	 = DC_FRAMEBUFFER_RGBTORGB_COEF2,
+	.rgb_to_rgb_coef3	 = DC_FRAMEBUFFER_RGBTORGB_COEF3,
+	.rgb_to_rgb_coef4	 = DC_FRAMEBUFFER_RGBTORGB_COEF4,
+	},
+	{
+	.y_address		= DC_OVERLAY_ADDRESS,
+	.u_address		= DC_OVERLAY_U_ADDRESS,
+	.v_address		= DC_OVERLAY_V_ADDRESS,
+	.y_stride		= DC_OVERLAY_STRIDE,
+	.u_stride		= DC_OVERLAY_U_STRIDE,
+	.v_stride		= DC_OVERLAY_V_STRIDE,
+	.size			= DC_OVERLAY_SIZE,
+	.scale_factor_x		= DC_OVERLAY_SCALE_FACTOR_X,
+	.scale_factor_y		= DC_OVERLAY_SCALE_FACTOR_Y,
+	.h_filter_coef_index = DC_OVERLAY_H_FILTER_COEF_INDEX,
+	.h_filter_coef_data  = DC_OVERLAY_H_FILTER_COEF_DATA,
+	.v_filter_coef_index = DC_OVERLAY_V_FILTER_COEF_INDEX,
+	.v_filter_coef_data  = DC_OVERLAY_V_FILTER_COEF_DATA,
+	.init_offset		 = DC_OVERLAY_INIT_OFFSET,
+	.color_key			 = DC_OVERLAY_COLOR_KEY,
+	.color_key_high		= DC_OVERLAY_COLOR_KEY_HIGH,
+	.clear_value		 = DC_OVERLAY_CLEAR_VALUE,
+	.color_table_index	 = DC_OVERLAY_COLOR_TABLE_INDEX,
+	.color_table_data	 = DC_OVERLAY_COLOR_TABLE_DATA,
+	.scale_config		 = DC_OVERLAY_SCALE_CONFIG,
+	.degamma_index		 = DC_OVERLAY_DEGAMMA_INDEX,
+	.degamma_data		 = DC_OVERLAY_DEGAMMA_DATA,
+	.degamma_ex_data	 = DC_OVERLAY_DEGAMMA_EX_DATA,
+	.yuv_to_rgb_coef0	 = DC_OVERLAY_YUVTORGB_COEF0,
+	.yuv_to_rgb_coef1	 = DC_OVERLAY_YUVTORGB_COEF1,
+	.yuv_to_rgb_coef2	 = DC_OVERLAY_YUVTORGB_COEF2,
+	.yuv_to_rgb_coef3	 = DC_OVERLAY_YUVTORGB_COEF3,
+	.yuv_to_rgb_coef4	 = DC_OVERLAY_YUVTORGB_COEF4,
+	.yuv_to_rgb_coefd0	 = DC_OVERLAY_YUVTORGB_COEFD0,
+	.yuv_to_rgb_coefd1	 = DC_OVERLAY_YUVTORGB_COEFD1,
+	.yuv_to_rgb_coefd2	 = DC_OVERLAY_YUVTORGB_COEFD2,
+	.yclampbound		 = DC_OVERLAY_Y_CLAMP_BOUND,
+	.uvclampbound		 = DC_OVERLAY_UV_CLAMP_BOUND,
+	.rgb_to_rgb_coef0	 = DC_OVERLAY_RGBTORGB_COEF0,
+	.rgb_to_rgb_coef1	 = DC_OVERLAY_RGBTORGB_COEF1,
+	.rgb_to_rgb_coef2	 = DC_OVERLAY_RGBTORGB_COEF2,
+	.rgb_to_rgb_coef3	 = DC_OVERLAY_RGBTORGB_COEF3,
+	.rgb_to_rgb_coef4	 = DC_OVERLAY_RGBTORGB_COEF4,
+	},
+};
+
+static const u32 read_reg[] = {
+	DC_FRAMEBUFFER_CONFIG,
+	DC_OVERLAY_CONFIG,
+	DC_OVERLAY_SCALE_CONFIG,
+};
+
+#define READ_REG_COUNT  ARRAY_SIZE(read_reg)
+
+/*
+ * The primary plane is the bottom of the composition and the DC8000 has no
+ * blend stage for it, so only formats without an alpha channel are exposed
+ * there. The overlay is blended on top of the primary and supports the
+ * pixel blend mode and constant alpha properties, so it gets the alpha
+ * formats as well.
+ */
+#ifdef CONFIG_DRM_VERISILICON_DC8000_VCE
+static const u32 primary_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+};
+
+static const u32 overlay_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+};
+#else
+static const u32 primary_formats[] = {
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_P010,
+};
+
+static const u32 overlay_formats[] = {
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_RGBA4444,
+	DRM_FORMAT_RGBA5551,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_ABGR4444,
+	DRM_FORMAT_ABGR1555,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_BGRA4444,
+	DRM_FORMAT_BGRA5551,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_VYUY,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_P010,
+	/* TODO. */
+};
+#endif
+
+static const u32 cursor_formats[] = {
+	DRM_FORMAT_ARGB8888
+};
+
+static const u64 format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+#define FRAC_16_16(mult, div)	(((mult) << 16) / (div))
+
+static const struct vs_plane_info dc_hw_planes[][PLANE_NUM] = {
+	{
+		/* DC_REV_5551 */
+		{
+		.name		= "Primary",
+		.id		  = PRIMARY_PLANE,
+		.type		= DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_formats),
+		.formats	 = primary_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT601) |
+						  BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = 0,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+		{
+		.name		= "Cursor",
+		.id		  = CURSOR_PLANE,
+		.type		= DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.modifiers   = NULL,
+		.min_width   = 32,
+		.min_height  = 32,
+		.max_width   = 32,
+		.max_height  = 32,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_COVERAGE),
+		.degamma_size   = 0,
+		.min_scale   = DRM_PLANE_NO_SCALING,
+		.max_scale   = DRM_PLANE_NO_SCALING,
+		},
+		{
+		.name		= "Overlay",
+		.id		  = OVERLAY_PLANE,
+		.type		= DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(overlay_formats),
+		.formats	 = overlay_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.constant_alpha = true,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT601) |
+						  BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = 0,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+	},
+	{
+		/* DC_REV_5551_306 */
+		{
+		.name		= "Primary",
+		.id		  = PRIMARY_PLANE,
+		.type		= DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_formats),
+		.formats	 = primary_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = 0,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+		{
+		.name		= "Cursor",
+		.id		  = CURSOR_PLANE,
+		.type		= DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.modifiers   = NULL,
+		.min_width   = 32,
+		.min_height  = 32,
+		.max_width   = 32,
+		.max_height  = 32,
+		.rotation	= 0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_COVERAGE),
+		.color_encoding = 0,
+		.degamma_size   = 0,
+		.min_scale   = DRM_PLANE_NO_SCALING,
+		.max_scale   = DRM_PLANE_NO_SCALING,
+		},
+		{
+		.name		= "Overlay",
+		.id		  = OVERLAY_PLANE,
+		.type		= DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(overlay_formats),
+		.formats	 = overlay_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0 |
+					   DRM_MODE_ROTATE_90 |
+					   DRM_MODE_ROTATE_180 |
+					   DRM_MODE_ROTATE_270 |
+					   DRM_MODE_REFLECT_X |
+					   DRM_MODE_REFLECT_Y,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.constant_alpha = true,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = 0,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+	},
+	{
+		/* DC_REV_5701_303 */
+		{
+		.name		= "Primary",
+		.id		  = PRIMARY_PLANE,
+		.type		= DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_formats),
+		.formats	 = primary_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT601) |
+						  BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = DEGAMMA_SIZE,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+		{
+		.name		= "Cursor",
+		.id		  = CURSOR_PLANE,
+		.type		= DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.modifiers   = NULL,
+		.min_width   = 32,
+		.min_height  = 32,
+		.max_width   = 256,
+		.max_height  = 256,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_COVERAGE),
+		.degamma_size   = 0,
+		.min_scale   = DRM_PLANE_NO_SCALING,
+		.max_scale   = DRM_PLANE_NO_SCALING,
+
+		},
+		{
+		.name		= "Overlay",
+		.id		  = OVERLAY_PLANE,
+		.type		= DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(overlay_formats),
+		.formats	 = overlay_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.constant_alpha = true,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT601) |
+						  BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = DEGAMMA_SIZE,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+	},
+	{
+		/* DC_REV_5701_309 */
+		{
+		.name		= "Primary",
+		.id		  = PRIMARY_PLANE,
+		.type		= DRM_PLANE_TYPE_PRIMARY,
+		.num_formats = ARRAY_SIZE(primary_formats),
+		.formats	 = primary_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = DEGAMMA_SIZE,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+		{
+		.name		= "Cursor",
+		.id		  = CURSOR_PLANE,
+		.type		= DRM_PLANE_TYPE_CURSOR,
+		.num_formats = ARRAY_SIZE(cursor_formats),
+		.formats	 = cursor_formats,
+		.modifiers   = NULL,
+		.min_width   = 32,
+		.min_height  = 32,
+		.max_width   = 256,
+		.max_height  = 256,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_COVERAGE),
+		.degamma_size   = 0,
+		.min_scale   = DRM_PLANE_NO_SCALING,
+		.max_scale   = DRM_PLANE_NO_SCALING,
+
+		},
+		{
+		.name		= "Overlay",
+		.id		  = OVERLAY_PLANE,
+		.type		= DRM_PLANE_TYPE_OVERLAY,
+		.num_formats = ARRAY_SIZE(overlay_formats),
+		.formats	 = overlay_formats,
+		.modifiers   = format_modifiers,
+		.min_width   = 0,
+		.min_height  = 0,
+		.max_width   = 4096,
+		.max_height  = 4096,
+		.rotation	= DRM_MODE_ROTATE_0,
+		.blend_mode  = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					   BIT(DRM_MODE_BLEND_PREMULTI) |
+					   BIT(DRM_MODE_BLEND_COVERAGE),
+		.constant_alpha = true,
+		.color_encoding = BIT(DRM_COLOR_YCBCR_BT709) |
+						  BIT(DRM_COLOR_YCBCR_BT2020),
+		.degamma_size   = DEGAMMA_SIZE,
+		.min_scale   = FRAC_16_16(1, 3),
+		.max_scale   = FRAC_16_16(10, 1),
+		},
+	},
+};
+
+static const struct vs_dc_info dc_info[] = {
+	{
+		/* DC_REV_5551 */
+		.name			= "DC8000",
+		.plane_num	   = PLANE_NUM,
+		.planes		  = dc_hw_planes[DC_REV_5551],
+		.max_bpc		 = 10,
+		.color_formats   = DRM_OUTPUT_COLOR_FORMAT_RGB444,
+		.gamma_size	  = GAMMA_SIZE,
+		.gamma_bits	  = 10,
+		.pitch_alignment = 128,
+		.pipe_sync	   = false,
+	},
+	{
+		/* DC_REV_5551_306 */
+		.name			= "DC8000",
+		.plane_num	   = PLANE_NUM,
+		.planes		  = dc_hw_planes[DC_REV_5551_306],
+		.max_bpc		 = 10,
+		.color_formats   = DRM_OUTPUT_COLOR_FORMAT_RGB444,
+		.gamma_size	  = GAMMA_SIZE,
+		.gamma_bits	  = 10,
+		.pitch_alignment = 128,
+		.pipe_sync	   = false,
+	},
+	{
+		/* DC_REV_5701_303 */
+		.name			= "DC8000",
+		.plane_num	   = PLANE_NUM,
+		.planes		  = dc_hw_planes[DC_REV_5701_303],
+		.max_bpc		 = 10,
+		.color_formats   = DRM_OUTPUT_COLOR_FORMAT_RGB444 |
+						   DRM_OUTPUT_COLOR_FORMAT_YCBCR444 |
+						   DRM_OUTPUT_COLOR_FORMAT_YCBCR422 |
+						   DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
+		.gamma_size	  = GAMMA_EX_SIZE,
+		.gamma_bits	  = 12,
+		.pitch_alignment = 128,
+		.pipe_sync	   = false,
+	},
+	{
+		/* DC_REV_5701_309 */
+		.name			= "DC8000",
+		.plane_num	   = PLANE_NUM,
+		.planes		  = dc_hw_planes[DC_REV_5701_309],
+		.max_bpc		 = 10,
+		.color_formats	 = DRM_OUTPUT_COLOR_FORMAT_RGB444 |
+						   DRM_OUTPUT_COLOR_FORMAT_YCBCR444 |
+						   DRM_OUTPUT_COLOR_FORMAT_YCBCR422 |
+						   DRM_OUTPUT_COLOR_FORMAT_YCBCR420,
+		.gamma_size	  = GAMMA_EX_SIZE,
+		.gamma_bits	  = 12,
+		.pitch_alignment = 128,
+		.pipe_sync	   = true,
+	},
+};
+
+static const struct dc_hw_funcs hw_func[];
+
+u32 hi_read(struct dc_hw *hw, u32 reg)
+{
+	return readl(hw->hi_base + reg);
+}
+
+static inline int dc_get_read_index(struct dc_hw *hw, u32 reg)
+{
+	int i;
+
+	for (i = 0; i < READ_REG_COUNT; i++) {
+		if (hw->read_block[i].reg == reg)
+			return i;
+	}
+	return i;
+}
+
+static inline void dc_write(struct dc_hw *hw, u32 reg, u32 value)
+{
+	writel(value, hw->reg_base + reg - DC_REG_BASE);
+	if (hw->read_block) {
+		int i = dc_get_read_index(hw, reg);
+
+		if (i < READ_REG_COUNT)
+			hw->read_block[i].value = value;
+	}
+}
+
+static inline u32 dc_read(struct dc_hw *hw, u32 reg)
+{
+	u32 value = readl(hw->reg_base + reg - DC_REG_BASE);
+
+	if (hw->read_block) {
+		int i = dc_get_read_index(hw, reg);
+
+		if (i < READ_REG_COUNT) {
+			value &= ~BIT(0);
+			value |= hw->read_block[i].value & BIT(0);
+		}
+	}
+
+	return value;
+}
+
+static inline void dc_set_clear(struct dc_hw *hw, u32 reg, u32 set, u32 clear)
+{
+	u32 value = dc_read(hw, reg);
+
+	value &= ~clear;
+	value |= set;
+	dc_write(hw, reg, value);
+}
+
+static void load_default_filter(struct dc_hw *hw,
+				const struct dc_hw_plane_reg *reg)
+{
+	u8 i;
+
+	dc_write(hw, reg->scale_config, 0x33);
+	dc_write(hw, reg->init_offset, 0x80008000);
+	dc_write(hw, reg->h_filter_coef_index, 0x00);
+	for (i = 0; i < H_COEF_SIZE; i++)
+		dc_write(hw, reg->h_filter_coef_data, horKernel[i]);
+
+	dc_write(hw, reg->v_filter_coef_index, 0x00);
+	for (i = 0; i < V_COEF_SIZE; i++)
+		dc_write(hw, reg->v_filter_coef_data, verKernel[i]);
+}
+
+static void load_rgb_to_rgb(struct dc_hw *hw, const struct dc_hw_plane_reg *reg,
+			    u16 *table)
+{
+	dc_write(hw, reg->rgb_to_rgb_coef0, table[0] | (table[1] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef1, table[2] | (table[3] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef2, table[4] | (table[5] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef3, table[6] | (table[7] << 16));
+	dc_write(hw, reg->rgb_to_rgb_coef4, table[8]);
+}
+
+static void load_yuv_to_rgb(struct dc_hw *hw, const struct dc_hw_plane_reg *reg,
+			    s32 *table)
+{
+	dc_write(hw, reg->yuv_to_rgb_coef0, (0xFFFF & table[0]) | (table[1] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef1, (0xFFFF & table[2]) | (table[3] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef2, (0xFFFF & table[4]) | (table[5] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef3, (0xFFFF & table[6]) | (table[7] << 16));
+	dc_write(hw, reg->yuv_to_rgb_coef4, table[8]);
+	dc_write(hw, reg->yuv_to_rgb_coefd0, table[9]);
+	dc_write(hw, reg->yuv_to_rgb_coefd1, table[10]);
+	dc_write(hw, reg->yuv_to_rgb_coefd2, table[11]);
+	dc_write(hw, reg->yclampbound, table[12] | (table[13] << 16));
+	dc_write(hw, reg->uvclampbound, table[14] | (table[15] << 16));
+}
+
+static void load_rgb_to_yuv(struct dc_hw *hw, s16 *table)
+{
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF0, table[0] | (table[1] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF1, table[2] | (table[3] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF2, table[4] | (table[5] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF3, table[6] | (table[7] << 16));
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEF4, table[8]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD0, table[9]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD1, table[10]);
+	dc_write(hw, DC_DISPLAY_RGBTOYUV_COEFD2, table[11]);
+}
+
+static bool is_rgb(enum dc_hw_color_format format)
+{
+	switch (format) {
+	case FORMAT_X4R4G4B4:
+	case FORMAT_A4R4G4B4:
+	case FORMAT_X1R5G5B5:
+	case FORMAT_A1R5G5B5:
+	case FORMAT_R5G6B5:
+	case FORMAT_X8R8G8B8:
+	case FORMAT_A8R8G8B8:
+	case FORMAT_A2R10G10B10:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static void load_degamma_table(struct dc_hw *hw,
+			       const struct dc_hw_plane_reg *reg,
+			       u16 *table)
+{
+	u16 i;
+	u32 value;
+
+	for (i = 0; i < DEGAMMA_SIZE; i++) {
+		dc_write(hw, reg->degamma_index, i);
+		value = table[i] | (table[i] << 16);
+		dc_write(hw, reg->degamma_data, value);
+		dc_write(hw, reg->degamma_ex_data, table[i]);
+	}
+}
+
+int dc_hw_init(struct dc_hw *hw)
+{
+	u8 i;
+	u32 revision = hi_read(hw, DC_HW_REVISION);
+	u32 cid = hi_read(hw, DC_HW_CHIP_CID);
+
+	switch (revision) {
+	case 0x5551:
+		if (cid < 0x306)
+			hw->rev = DC_REV_5551;
+		else
+			hw->rev = DC_REV_5551_306;
+		break;
+	case 0x5701:
+		if (cid < 0x309)
+			hw->rev = DC_REV_5701_303;
+		else
+			hw->rev = DC_REV_5701_309;
+		break;
+	default:
+		return -ENXIO;
+	}
+
+	if (hw->rev == DC_REV_5551 && !hw->read_block) {
+		hw->read_block =
+			kzalloc(sizeof(struct dc_hw_read) * READ_REG_COUNT,
+				GFP_KERNEL);
+		if (!hw->read_block)
+			return -ENOMEM;
+		for (i = 0; i < READ_REG_COUNT; i++)
+			hw->read_block[i].reg = read_reg[i];
+	}
+
+	hw->info = &dc_info[hw->rev];
+	hw->func = &hw_func[hw->rev];
+
+	for (i = 0; i < ARRAY_SIZE(dc_plane_reg); i++) {
+		load_default_filter(hw, &dc_plane_reg[i]);
+		if (hw->rev == DC_REV_5701_303 ||
+		    hw->rev == DC_REV_5701_309)
+			load_rgb_to_rgb(hw, &dc_plane_reg[i], RGB2RGB);
+	}
+
+	if (hw->rev == DC_REV_5701_303)
+		load_rgb_to_yuv(hw, RGB2YUV);
+
+	dc_write(hw, DC_CURSOR_BACKGROUND, 0x00FFFFFF);
+	dc_write(hw, DC_CURSOR_FOREGROUND, 0x00AAAAAA);
+	dc_write(hw, DC_DISPLAY_PANEL_CONFIG, 0x111);
+
+	return 0;
+}
+
+void dc_hw_deinit(struct dc_hw *hw)
+{
+	kfree(hw->read_block);
+	hw->read_block = NULL;
+}
+
+void dc_hw_update_plane(struct dc_hw *hw, enum dc_hw_plane_id id,
+			struct dc_hw_fb *fb, struct dc_hw_scale *scale)
+{
+	struct dc_hw_plane *plane = NULL;
+
+	if (id == PRIMARY_PLANE)
+		plane = &hw->primary;
+	else if (id == OVERLAY_PLANE)
+		plane = &hw->overlay.plane;
+
+	if (plane) {
+		if (fb) {
+			if (!fb->enable)
+				plane->fb.enable = false;
+			else
+				memcpy(&plane->fb, fb,
+				       sizeof(*fb) - sizeof(fb->dirty));
+			plane->fb.dirty = true;
+		}
+		if (scale) {
+			memcpy(&plane->scale, scale,
+			       sizeof(*scale) - sizeof(scale->dirty));
+			plane->scale.dirty = true;
+		}
+	}
+}
+
+void dc_hw_update_degamma(struct dc_hw *hw, enum dc_hw_plane_id id, u32 mode)
+{
+	struct dc_hw_plane *plane = NULL;
+	int i = (int)id;
+
+	if (id == PRIMARY_PLANE)
+		plane = &hw->primary;
+	else if (id == OVERLAY_PLANE)
+		plane = &hw->overlay.plane;
+
+	if (plane) {
+		if (hw->info->planes[i].degamma_size) {
+			plane->degamma.mode = mode;
+			plane->degamma.dirty = true;
+		} else {
+			plane->degamma.dirty = false;
+		}
+	}
+}
+
+void dc_hw_set_position(struct dc_hw *hw, struct dc_hw_position *pos)
+{
+	memcpy(&hw->overlay.pos, pos, sizeof(*pos) - sizeof(pos->dirty));
+	hw->overlay.pos.dirty = true;
+}
+
+void dc_hw_set_blend(struct dc_hw *hw, struct dc_hw_blend *blend)
+{
+	memcpy(&hw->overlay.blend, blend,
+	       sizeof(*blend) - sizeof(blend->dirty));
+	hw->overlay.blend.dirty = true;
+}
+
+void dc_hw_update_cursor(struct dc_hw *hw, struct dc_hw_cursor *cursor)
+{
+	memcpy(&hw->cursor, cursor, sizeof(*cursor) - sizeof(cursor->dirty));
+	hw->cursor.dirty = true;
+}
+
+void dc_hw_update_gamma(struct dc_hw *hw, u16 index, u16 r, u16 g, u16 b)
+{
+	if (index >= hw->info->gamma_size)
+		return;
+
+	hw->gamma.gamma[index][0] = r;
+	hw->gamma.gamma[index][1] = g;
+	hw->gamma.gamma[index][2] = b;
+	hw->gamma.dirty = true;
+}
+
+void dc_hw_enable_gamma(struct dc_hw *hw, bool enable)
+{
+	hw->gamma.enable = enable;
+	hw->gamma.dirty = true;
+}
+
+void dc_hw_setup_display(struct dc_hw *hw, struct dc_hw_display *display)
+{
+	memcpy(&hw->display, display, sizeof(*display));
+
+	hw->func->display(hw, display);
+}
+
+void dc_hw_enable_interrupt(struct dc_hw *hw, bool enable)
+{
+	dc_write(hw, DC_DISPLAY_INT_ENABLE, enable);
+}
+
+u32 dc_hw_get_interrupt(struct dc_hw *hw)
+{
+	return dc_read(hw, DC_DISPLAY_INT);
+}
+
+bool dc_hw_flip_in_progress(struct dc_hw *hw)
+{
+	return dc_read(hw, DC_FRAMEBUFFER_CONFIG) & BIT(6);
+}
+
+bool dc_hw_check_underflow(struct dc_hw *hw)
+{
+	return dc_read(hw, DC_FRAMEBUFFER_CONFIG) & BIT(5);
+}
+
+void dc_hw_enable_shadow_register(struct dc_hw *hw, bool enable)
+{
+	if (enable)
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, 0, BIT(3));
+	else
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, BIT(3), 0);
+}
+
+void dc_hw_set_out(struct dc_hw *hw, enum dc_hw_out out)
+{
+	if (out <= OUT_DP)
+		hw->out = out;
+}
+
+static void gamma_commit(struct dc_hw *hw)
+{
+	u16 i;
+	u32 value;
+
+	if (hw->gamma.dirty) {
+		if (hw->gamma.enable) {
+			dc_write(hw, DC_DISPLAY_GAMMA_INDEX, 0x00);
+			for (i = 0; i < GAMMA_SIZE; i++) {
+				value = hw->gamma.gamma[i][2] |
+					(hw->gamma.gamma[i][1] << 10) |
+					(hw->gamma.gamma[i][0] << 20);
+				dc_write(hw, DC_DISPLAY_GAMMA_DATA, value);
+			}
+
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, BIT(2), 0);
+		} else {
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, 0, BIT(2));
+		}
+		hw->gamma.dirty = false;
+	}
+}
+
+static void gamma_ex_commit(struct dc_hw *hw)
+{
+	u16 i;
+	u32 value;
+
+	if (hw->gamma.dirty) {
+		if (hw->gamma.enable) {
+			dc_write(hw, DC_DISPLAY_GAMMA_EX_INDEX, 0x00);
+			for (i = 0; i < GAMMA_EX_SIZE; i++) {
+				value = hw->gamma.gamma[i][2] |
+					(hw->gamma.gamma[i][1] << 16);
+				dc_write(hw, DC_DISPLAY_GAMMA_EX_DATA, value);
+				dc_write(hw, DC_DISPLAY_GAMMA_EX_ONE_DATA,
+					 hw->gamma.gamma[i][0]);
+			}
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, BIT(2), 0);
+		} else {
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, 0, BIT(2));
+		}
+		hw->gamma.dirty = false;
+	}
+}
+
+static void plane_commit(struct dc_hw *hw)
+{
+	struct dc_hw_plane *plane;
+	const struct dc_hw_plane_reg *reg;
+	u16 i;
+
+	for (i = 0; i < PLANE_NUM; i++) {
+		if (i == PRIMARY_PLANE) {
+			plane = &hw->primary;
+			reg = &dc_plane_reg[0];
+		} else if (i == OVERLAY_PLANE) {
+			plane = &hw->overlay.plane;
+			reg = &dc_plane_reg[1];
+		} else {
+			continue;
+		}
+
+		if (plane->fb.dirty) {
+			if (plane->fb.enable) {
+				dc_write(hw, reg->y_address,
+					 plane->fb.y_address);
+				dc_write(hw, reg->u_address,
+					 plane->fb.u_address);
+				dc_write(hw, reg->v_address,
+					 plane->fb.v_address);
+				dc_write(hw, reg->y_stride,
+					 plane->fb.y_stride);
+				dc_write(hw, reg->u_stride,
+					 plane->fb.u_stride);
+				dc_write(hw, reg->v_stride,
+					 plane->fb.v_stride);
+				dc_write(hw, reg->size,
+					 plane->fb.width |
+					 (plane->fb.height << 15));
+			}
+			if (i == PRIMARY_PLANE)
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG,
+					     (plane->fb.format << 26) |
+					     (plane->fb.uv_swizzle << 25) |
+					     (plane->fb.swizzle << 23) |
+					     (plane->fb.tile_mode << 17) |
+					     (plane->fb.yuv_color_space << 14) |
+					     (plane->fb.rotation << 11) |
+					      plane->fb.enable,
+					     (0x1F << 26) |
+					      BIT(25) |
+					     (0x03 << 23) |
+					     (0x1F << 17) |
+					     (0x07 << 14) |
+					     (0x07 << 11) |
+					      BIT(0));
+			else
+				dc_set_clear(hw, DC_OVERLAY_CONFIG,
+					     (plane->fb.format << 16) |
+					     (plane->fb.uv_swizzle << 15) |
+					     (plane->fb.swizzle << 13) |
+					     (plane->fb.tile_mode << 8) |
+					     (plane->fb.yuv_color_space << 5) |
+					     (plane->fb.rotation << 2) |
+					     (plane->fb.enable << 24),
+					     (0x1F << 16) |
+					     BIT(15) |
+					     (0x03 << 13) |
+					     (0x1F << 8) |
+					     (0x07 << 5) |
+					     (0x07 << 2) |
+					      BIT(24));
+			plane->fb.dirty = false;
+		}
+
+		if (plane->scale.dirty) {
+			if (plane->scale.enable) {
+				dc_write(hw, reg->scale_factor_x,
+					 plane->scale.scale_factor_x);
+				dc_write(hw, reg->scale_factor_y,
+					 plane->scale.scale_factor_y);
+				if (i == PRIMARY_PLANE)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG,
+						     BIT(22), 0);
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_SCALE_CONFIG,
+						     BIT(8), 0);
+
+			} else {
+				if (i == PRIMARY_PLANE)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG,
+						     0, BIT(22));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_SCALE_CONFIG,
+						     0, BIT(8));
+			}
+			plane->scale.dirty = false;
+		}
+	}
+}
+
+static void plane_ex_commit(struct dc_hw *hw)
+{
+	struct dc_hw_plane *plane;
+	const struct dc_hw_plane_reg *reg;
+	u16 i;
+
+	for (i = 0; i < PLANE_NUM; i++) {
+		if (i == PRIMARY_PLANE) {
+			plane = &hw->primary;
+			reg = &dc_plane_reg[0];
+		} else if (i == OVERLAY_PLANE) {
+			plane = &hw->overlay.plane;
+			reg = &dc_plane_reg[1];
+		} else {
+			continue;
+		}
+
+		if (plane->fb.dirty) {
+			if (is_rgb(plane->fb.format)) {
+				if (i == PRIMARY_PLANE)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX,
+						     0, BIT(8));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG,
+						     BIT(29), BIT(30));
+			} else {
+				if (i == PRIMARY_PLANE)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX,
+						     BIT(8), BIT(6));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG,
+						     BIT(30), BIT(29));
+				switch (plane->fb.yuv_color_space) {
+				case COLOR_SPACE_601:
+					load_yuv_to_rgb(hw, reg, YUV601_2RGB);
+					break;
+				case COLOR_SPACE_709:
+					load_yuv_to_rgb(hw, reg, YUV709_2RGB);
+					break;
+				case COLOR_SPACE_2020:
+					load_yuv_to_rgb(hw, reg, YUV2020_2RGB);
+					break;
+				default:
+					break;
+				}
+			}
+		}
+		if (plane->degamma.dirty) {
+			switch (plane->degamma.mode) {
+			case VS_DEGAMMA_DISABLE:
+				if (i == PRIMARY_PLANE)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX,
+						     0, BIT(5));
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG,
+						     0, BIT(28));
+				break;
+			case VS_DEGAMMA_BT709:
+				load_degamma_table(hw, reg, DEGAMMA_709);
+				if (i == PRIMARY_PLANE)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX,
+						     BIT(5), 0);
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG,
+						     BIT(28), 0);
+				break;
+			case VS_DEGAMMA_BT2020:
+				load_degamma_table(hw, reg, DEGAMMA_2020);
+				if (i == PRIMARY_PLANE)
+					dc_set_clear(hw,
+						     DC_FRAMEBUFFER_CONFIG_EX,
+						     BIT(5), 0);
+				else
+					dc_set_clear(hw,
+						     DC_OVERLAY_CONFIG,
+						     BIT(28), 0);
+				break;
+			default:
+				break;
+			}
+			plane->degamma.dirty = false;
+		}
+	}
+	plane_commit(hw);
+}
+
+static void setup_display(struct dc_hw *hw, struct dc_hw_display *display)
+{
+	u32 dpi_cfg;
+
+	if (hw->display.enable) {
+		switch (display->bus_format) {
+		case MEDIA_BUS_FMT_RGB565_1X16:
+			dpi_cfg = 0;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			dpi_cfg = 3;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
+			dpi_cfg = 4;
+			break;
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			dpi_cfg = 5;
+			break;
+		case MEDIA_BUS_FMT_RGB101010_1X30:
+			dpi_cfg = 6;
+			break;
+		default:
+			dpi_cfg = 5;
+			break;
+		}
+		dc_write(hw, DC_DISPLAY_DPI_CONFIG, dpi_cfg);
+
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, 0, BIT(4));
+
+		dc_write(hw, DC_DISPLAY_H, hw->display.h_active |
+			 (hw->display.h_total << 16));
+		dc_write(hw, DC_DISPLAY_H_SYNC,
+			 hw->display.h_sync_start |
+			 (hw->display.h_sync_end << 15) |
+			 (hw->display.h_sync_polarity ? 0 : BIT(31)) |
+			  BIT(30));
+		dc_write(hw, DC_DISPLAY_V, hw->display.v_active |
+			 (hw->display.v_total << 16));
+		dc_write(hw, DC_DISPLAY_V_SYNC,
+			 hw->display.v_sync_start |
+			 (hw->display.v_sync_end << 15) |
+			 (hw->display.v_sync_polarity ? 0 : BIT(31)) |
+			  BIT(30));
+
+		if (hw->info->pipe_sync) {
+			switch (display->sync_mode) {
+			case VS_SINGLE_DC:
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX,
+					     0, BIT(3) | BIT(4));
+				break;
+			case VS_MULTI_DC_PRIMARY:
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX,
+					     BIT(3) | BIT(4), 0);
+				break;
+			case VS_MULTI_DC_SECONDARY:
+				dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX,
+					     BIT(3), BIT(4));
+				break;
+			default:
+				break;
+			}
+		}
+
+		if (hw->display.dither_enable) {
+			dc_write(hw, DC_DISPLAY_DITHER_TABLE_LOW,
+				 DC_DISPLAY_DITHERTABLE_LOW);
+			dc_write(hw, DC_DISPLAY_DITHER_TABLE_HIGH,
+				 DC_DISPLAY_DITHERTABLE_HIGH);
+			dc_write(hw, DC_DISPLAY_DITHER_CONFIG, BIT(31));
+		} else {
+			dc_write(hw, DC_DISPLAY_DITHER_CONFIG, 0);
+		}
+
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, BIT(4), 0);
+	} else {
+		dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG, 0, BIT(4) | BIT(0));
+	}
+}
+
+static void setup_display_ex(struct dc_hw *hw, struct dc_hw_display *display)
+{
+	u32 dp_cfg;
+	bool is_yuv = false;
+
+	if (hw->display.enable && hw->out == OUT_DP) {
+		switch (display->bus_format) {
+		case MEDIA_BUS_FMT_RGB565_1X16:
+			dp_cfg = 0;
+			break;
+		case MEDIA_BUS_FMT_RGB666_1X18:
+			dp_cfg = 1;
+			break;
+		case MEDIA_BUS_FMT_RGB888_1X24:
+			dp_cfg = 2;
+			break;
+		case MEDIA_BUS_FMT_RGB101010_1X30:
+			dp_cfg = 3;
+			break;
+		case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+			dp_cfg = 0;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYVY8_1X16:
+			dp_cfg = 2 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_YUV8_1X24:
+			dp_cfg = 4 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+			dp_cfg = 6 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_UYVY10_1X20:
+			dp_cfg = 8 << 4;
+			is_yuv = true;
+			break;
+		case MEDIA_BUS_FMT_YUV10_1X30:
+			dp_cfg = 10 << 4;
+			is_yuv = true;
+			break;
+		default:
+			dp_cfg = 2;
+			break;
+		}
+		if (is_yuv)
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX, BIT(7), 0);
+		else
+			dc_set_clear(hw, DC_FRAMEBUFFER_CONFIG_EX, 0, BIT(7));
+		dc_write(hw, DC_DISPLAY_DP_CONFIG, dp_cfg | BIT(3));
+	}
+
+	if (hw->out == OUT_DPI)
+		dc_set_clear(hw, DC_DISPLAY_DP_CONFIG, 0, BIT(3));
+
+	setup_display(hw, display);
+}
+
+static const struct dc_hw_funcs hw_func[] = {
+	{
+		.gamma = &gamma_commit,
+		.plane = &plane_commit,
+		.display = setup_display,
+	},
+	{
+		.gamma = &gamma_commit,
+		.plane = &plane_commit,
+		.display = setup_display,
+	},
+	{
+		.gamma = &gamma_ex_commit,
+		.plane = &plane_ex_commit,
+		.display = setup_display_ex,
+	},
+	{
+		.gamma = &gamma_ex_commit,
+		.plane = &plane_ex_commit,
+		.display = setup_display_ex,
+	},
+};
+
+void dc_hw_commit(struct dc_hw *hw)
+{
+	hw->func->gamma(hw);
+	hw->func->plane(hw);
+
+	if (hw->overlay.pos.dirty) {
+		dc_write(hw, DC_OVERLAY_TOP_LEFT, hw->overlay.pos.start_x |
+			(hw->overlay.pos.start_y << 15));
+		dc_write(hw, DC_OVERLAY_BOTTOM_RIGHT, hw->overlay.pos.end_x |
+			(hw->overlay.pos.end_y << 15));
+		hw->overlay.pos.dirty = false;
+	}
+
+	if (hw->overlay.blend.dirty) {
+		dc_write(hw, DC_OVERLAY_SRC_GLOBAL_COLOR,
+			 hw->overlay.blend.alpha << 24);
+		dc_write(hw, DC_OVERLAY_DST_GLOBAL_COLOR,
+			 hw->overlay.blend.alpha << 24);
+		switch (hw->overlay.blend.blend_mode) {
+		case BLEND_PREMULTI:
+			dc_write(hw, DC_OVERLAY_BLEND_CONFIG, 0x3450);
+			break;
+		case BLEND_COVERAGE:
+			dc_write(hw, DC_OVERLAY_BLEND_CONFIG, 0x3950);
+			break;
+		case BLEND_PIXEL_NONE:
+			dc_write(hw, DC_OVERLAY_BLEND_CONFIG, 0x3548);
+			break;
+		default:
+			break;
+		}
+		hw->overlay.blend.dirty = false;
+	}
+
+	if (hw->cursor.dirty) {
+		if (hw->cursor.enable) {
+			dc_write(hw, DC_CURSOR_ADDRESS, hw->cursor.address);
+			dc_write(hw, DC_CURSOR_LOCATION, hw->cursor.x |
+				 (hw->cursor.y << 16));
+			dc_write(hw, DC_CURSOR_CONFIG, (hw->cursor.hot_x << 16) |
+				 (hw->cursor.hot_y << 8) |
+				 (CURSOR_SIZE_256X256 << 5) |
+				 BIT(2) | 0x02);
+		} else {
+			dc_write(hw, DC_CURSOR_CONFIG, 0x00);
+		}
+		hw->cursor.dirty = false;
+	}
+}
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h b/drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h
new file mode 100644
index 000000000000..31ee2de3c904
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_dc_hw.h
@@ -0,0 +1,426 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __VS_DC_HW_H__
+#define __VS_DC_HW_H__
+
+#include <linux/types.h>
+
+#include "vs_type.h"
+
+#define DC_HW_REVISION			0x24
+#define DC_HW_CHIP_CID			0x30
+
+#define DC_REG_BASE			0x1400
+#define DC_REG_RANGE			0x2000
+
+#define DC_FRAMEBUFFER_CONFIG		0x1518
+#define DC_FRAMEBUFFER_CONFIG_EX	0x1CC0
+#define DC_FRAMEBUFFER_SCALE_CONFIG	0x1520
+#define DC_FRAMEBUFFER_ADDRESS		0x1400
+#define DC_FRAMEBUFFER_U_ADDRESS	0x1530
+#define DC_FRAMEBUFFER_V_ADDRESS	0x1538
+#define DC_FRAMEBUFFER_STRIDE		0x1408
+#define DC_FRAMEBUFFER_U_STRIDE		0x1800
+#define DC_FRAMEBUFFER_V_STRIDE		0x1808
+#define DC_FRAMEBUFFER_SIZE		0x1810
+#define DC_FRAMEBUFFER_SCALE_FACTOR_X	0x1828
+#define DC_FRAMEBUFFER_SCALE_FACTOR_Y	0x1830
+#define DC_FRAMEBUFFER_H_FILTER_COEF_INDEX	0x1838
+#define DC_FRAMEBUFFER_H_FILTER_COEF_DATA	0x1A00
+#define DC_FRAMEBUFFER_V_FILTER_COEF_INDEX	0x1A08
+#define DC_FRAMEBUFFER_V_FILTER_COEF_DATA	0x1A10
+#define DC_FRAMEBUFFER_INIT_OFFSET		0x1A20
+#define DC_FRAMEBUFFER_COLOR_KEY		0x1508
+#define DC_FRAMEBUFFER_COLOR_KEY_HIGH		0x1510
+#define DC_FRAMEBUFFER_CLEAR_VALUE		0x1A18
+#define DC_FRAMEBUFFER_COLOR_TABLE_INDEX	0x1818
+#define DC_FRAMEBUFFER_COLOR_TABLE_DATA		0x1820
+#define DC_FRAMEBUFFER_BG_COLOR			0x1528
+#define DC_FRAMEBUFFER_DEGAMMA_INDEX		0x1D88
+#define DC_FRAMEBUFFER_DEGAMMA_DATA		0x1D90
+#define DC_FRAMEBUFFER_DEGAMMA_EX_DATA		0x1D98
+#define DC_FRAMEBUFFER_YUVTORGB_COEF0		0x1DA0
+#define DC_FRAMEBUFFER_YUVTORGB_COEF1		0x1DA8
+#define DC_FRAMEBUFFER_YUVTORGB_COEF2		0x1DB0
+#define DC_FRAMEBUFFER_YUVTORGB_COEF3		0x1DB8
+#define DC_FRAMEBUFFER_YUVTORGB_COEF4		 0x1E00
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD0		0x1E08
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD1		0x1E10
+#define DC_FRAMEBUFFER_YUVTORGB_COEFD2		0x1E18
+#define DC_FRAMEBUFFER_Y_CLAMP_BOUND		0x1E88
+#define DC_FRAMEBUFFER_UV_CLAMP_BOUND		 0x1E90
+#define DC_FRAMEBUFFER_RGBTORGB_COEF0		 0x1E20
+#define DC_FRAMEBUFFER_RGBTORGB_COEF1		 0x1E28
+#define DC_FRAMEBUFFER_RGBTORGB_COEF2		 0x1E30
+#define DC_FRAMEBUFFER_RGBTORGB_COEF3		 0x1E38
+#define DC_FRAMEBUFFER_RGBTORGB_COEF4		 0x1E40
+
+#define DC_OVERLAY_CONFIG			 0x1540
+#define DC_OVERLAY_SCALE_CONFIG		 0x1C00
+#define DC_OVERLAY_BLEND_CONFIG		 0x1580
+#define DC_OVERLAY_TOP_LEFT		 0x1640
+#define DC_OVERLAY_BOTTOM_RIGHT		 0x1680
+#define DC_OVERLAY_ADDRESS			0x15C0
+#define DC_OVERLAY_U_ADDRESS			0x1840
+#define DC_OVERLAY_V_ADDRESS			0x1880
+#define DC_OVERLAY_STRIDE			 0x1600
+#define DC_OVERLAY_U_STRIDE		 0x18C0
+#define DC_OVERLAY_V_STRIDE		 0x1900
+#define DC_OVERLAY_SIZE			 0x17C0
+#define DC_OVERLAY_SCALE_FACTOR_X		 0x1A40
+#define DC_OVERLAY_SCALE_FACTOR_Y		 0x1A80
+#define DC_OVERLAY_H_FILTER_COEF_INDEX		0x1AC0
+#define DC_OVERLAY_H_FILTER_COEF_DATA		 0x1B00
+#define DC_OVERLAY_V_FILTER_COEF_INDEX		0x1B40
+#define DC_OVERLAY_V_FILTER_COEF_DATA		 0x1B80
+#define DC_OVERLAY_INIT_OFFSET			0x1BC0
+#define DC_OVERLAY_COLOR_KEY			0x1740
+#define DC_OVERLAY_COLOR_KEY_HIGH		 0x1780
+#define DC_OVERLAY_CLEAR_VALUE			0x1940
+#define DC_OVERLAY_COLOR_TABLE_INDEX		0x1980
+#define DC_OVERLAY_COLOR_TABLE_DATA	 0x19C0
+#define DC_OVERLAY_SRC_GLOBAL_COLOR	 0x16C0
+#define DC_OVERLAY_DST_GLOBAL_COLOR	 0x1700
+#define DC_OVERLAY_DEGAMMA_INDEX		0x2200
+#define DC_OVERLAY_DEGAMMA_DATA		 0x2240
+#define DC_OVERLAY_DEGAMMA_EX_DATA		0x2280
+#define DC_OVERLAY_YUVTORGB_COEF0		 0x1EC0
+#define DC_OVERLAY_YUVTORGB_COEF1		 0x1F00
+#define DC_OVERLAY_YUVTORGB_COEF2		 0x1F40
+#define DC_OVERLAY_YUVTORGB_COEF3		 0x1F80
+#define DC_OVERLAY_YUVTORGB_COEF4		 0x1FC0
+#define DC_OVERLAY_YUVTORGB_COEFD0		0x2000
+#define DC_OVERLAY_YUVTORGB_COEFD1		0x2040
+#define DC_OVERLAY_YUVTORGB_COEFD2		0x2080
+#define DC_OVERLAY_Y_CLAMP_BOUND		0x22C0
+#define DC_OVERLAY_UV_CLAMP_BOUND		 0x2300
+#define DC_OVERLAY_RGBTORGB_COEF0		 0x20C0
+#define DC_OVERLAY_RGBTORGB_COEF1		 0x2100
+#define DC_OVERLAY_RGBTORGB_COEF2		 0x2140
+#define DC_OVERLAY_RGBTORGB_COEF3		 0x2180
+#define DC_OVERLAY_RGBTORGB_COEF4		 0x21C0
+
+#define DC_CURSOR_CONFIG			0x1468
+#define DC_CURSOR_ADDRESS			 0x146C
+#define DC_CURSOR_LOCATION			0x1470
+#define DC_CURSOR_BACKGROUND			0x1474
+#define DC_CURSOR_FOREGROUND			0x1478
+#define DC_CURSOR_CLK_GATING			0x1484
+
+#define DC_DISPLAY_DITHER_CONFIG		0x1410
+#define DC_DISPLAY_PANEL_CONFIG		 0x1418
+#define DC_DISPLAY_DITHER_TABLE_LOW	 0x1420
+#define DC_DISPLAY_DITHER_TABLE_HIGH		0x1428
+#define DC_DISPLAY_H				0x1430
+#define DC_DISPLAY_H_SYNC			 0x1438
+#define DC_DISPLAY_V				0x1440
+#define DC_DISPLAY_V_SYNC			 0x1448
+#define DC_DISPLAY_CURRENT_LOCATION	 0x1450
+#define DC_DISPLAY_GAMMA_INDEX			0x1458
+#define DC_DISPLAY_GAMMA_DATA			 0x1460
+#define DC_DISPLAY_INT				0x147C
+#define DC_DISPLAY_INT_ENABLE			 0x1480
+#define DC_DISPLAY_DBI_CONFIG			 0x1488
+#define DC_DISPLAY_GENERAL_CONFIG		 0x14B0
+#define DC_DISPLAY_DPI_CONFIG			 0x14B8
+#define DC_DISPLAY_DEBUG_COUNTER_SELECT	 0x14D0
+#define DC_DISPLAY_DEBUG_COUNTER_VALUE		0x14D8
+#define DC_DISPLAY_DP_CONFIG			0x1CD0
+#define DC_DISPLAY_GAMMA_EX_INDEX		 0x1CF0
+#define DC_DISPLAY_GAMMA_EX_DATA		0x1CF8
+#define DC_DISPLAY_GAMMA_EX_ONE_DATA		0x1D80
+#define DC_DISPLAY_RGBTOYUV_COEF0		 0x1E48
+#define DC_DISPLAY_RGBTOYUV_COEF1		 0x1E50
+#define DC_DISPLAY_RGBTOYUV_COEF2		 0x1E58
+#define DC_DISPLAY_RGBTOYUV_COEF3		 0x1E60
+#define DC_DISPLAY_RGBTOYUV_COEF4		 0x1E68
+#define DC_DISPLAY_RGBTOYUV_COEFD0		0x1E70
+#define DC_DISPLAY_RGBTOYUV_COEFD1		0x1E78
+#define DC_DISPLAY_RGBTOYUV_COEFD2		0x1E80
+
+#define DC_CLK_GATTING				0x1A28
+
+#define DC_DISPLAY_DITHERTABLE_LOW	 0x7B48F3C0
+#define DC_DISPLAY_DITHERTABLE_HIGH	0x596AD1E2
+
+#define GAMMA_SIZE				256
+#define GAMMA_EX_SIZE				 300
+#define DEGAMMA_SIZE				260
+
+#define RGB_TO_RGB_TABLE_SIZE			 9
+#define YUV_TO_RGB_TABLE_SIZE			 16
+#define RGB_TO_YUV_TABLE_SIZE			 12
+
+#define CURSOR_SIZE_32X32		0
+#define CURSOR_SIZE_64X64		1
+#define CURSOR_SIZE_128X128		2
+#define CURSOR_SIZE_256X256		3
+
+enum dc_hw_chip_rev {
+	DC_REV_5551,
+	DC_REV_5551_306,
+	DC_REV_5701_303,
+	DC_REV_5701_309,
+};
+
+enum dc_hw_plane_id {
+	PRIMARY_PLANE,
+	CURSOR_PLANE,
+	OVERLAY_PLANE,
+	PLANE_NUM
+};
+
+enum dc_hw_color_format {
+	FORMAT_X4R4G4B4,
+	FORMAT_A4R4G4B4,
+	FORMAT_X1R5G5B5,
+	FORMAT_A1R5G5B5,
+	FORMAT_R5G6B5,
+	FORMAT_X8R8G8B8,
+	FORMAT_A8R8G8B8,
+	FORMAT_YUY2,
+	FORMAT_UYVY,
+	FORMAT_INDEX8,
+	FORMAT_MONOCHROME,
+	FORMAT_YV12 = 0xf,
+	FORMAT_A8,
+	FORMAT_NV12,
+	FORMAT_NV16,
+	FORMAT_RG16,
+	FORMAT_R8,
+	FORMAT_NV12_10BIT,
+	FORMAT_A2R10G10B10,
+	FORMAT_NV16_10BIT,
+	FORMAT_INDEX1,
+	FORMAT_INDEX2,
+	FORMAT_INDEX4,
+	FORMAT_P010,
+};
+
+enum dc_hw_yuv_color_space {
+	COLOR_SPACE_601 = 0,
+	COLOR_SPACE_709 = 1,
+	COLOR_SPACE_2020 = 3,
+};
+
+enum dc_hw_rotation {
+	ROT_0 = 0,
+	ROT_90 = 4,
+	ROT_180 = 5,
+	ROT_270 = 6,
+	FLIP_X = 1,
+	FLIP_Y = 2,
+	FLIP_XY = 3,
+};
+
+enum dc_hw_swizzle {
+	SWIZZLE_ARGB = 0,
+	SWIZZLE_RGBA,
+	SWIZZLE_ABGR,
+	SWIZZLE_BGRA,
+};
+
+enum dc_hw_out {
+	OUT_DPI,
+	OUT_DP,
+};
+
+enum dc_hw_blend_mode {
+	/* out.rgb = plane_alpha * fg.rgb +
+	 *		(1 - (plane_alpha * fg.alpha)) * bg.rgb
+	 */
+	BLEND_PREMULTI,
+	/* out.rgb = plane_alpha * fg.alpha * fg.rgb +
+	 *		(1 - (plane_alpha * fg.alpha)) * bg.rgb
+	 */
+	BLEND_COVERAGE,
+	/* out.rgb = plane_alpha * fg.rgb +
+	 *		(1 - plane_alpha) * bg.rgb
+	 */
+	BLEND_PIXEL_NONE,
+};
+
+struct dc_hw_plane_reg {
+	u32 y_address;
+	u32 u_address;
+	u32 v_address;
+	u32 y_stride;
+	u32 u_stride;
+	u32 v_stride;
+	u32 size;
+	u32 scale_factor_x;
+	u32 scale_factor_y;
+	u32 h_filter_coef_index;
+	u32 h_filter_coef_data;
+	u32 v_filter_coef_index;
+	u32 v_filter_coef_data;
+	u32 init_offset;
+	u32 color_key;
+	u32 color_key_high;
+	u32 clear_value;
+	u32 color_table_index;
+	u32 color_table_data;
+	u32 scale_config;
+	u32 degamma_index;
+	u32 degamma_data;
+	u32 degamma_ex_data;
+	u32 yuv_to_rgb_coef0;
+	u32 yuv_to_rgb_coef1;
+	u32 yuv_to_rgb_coef2;
+	u32 yuv_to_rgb_coef3;
+	u32 yuv_to_rgb_coef4;
+	u32 yuv_to_rgb_coefd0;
+	u32 yuv_to_rgb_coefd1;
+	u32 yuv_to_rgb_coefd2;
+	u32 yclampbound;
+	u32 uvclampbound;
+	u32 rgb_to_rgb_coef0;
+	u32 rgb_to_rgb_coef1;
+	u32 rgb_to_rgb_coef2;
+	u32 rgb_to_rgb_coef3;
+	u32 rgb_to_rgb_coef4;
+};
+
+struct dc_hw_fb {
+	u64 y_address;
+	u64 u_address;
+	u64 v_address;
+	u16 y_stride;
+	u16 u_stride;
+	u16 v_stride;
+	u16 width;
+	u16 height;
+	u8 format;
+	u8 tile_mode;
+	u8 rotation;
+	u8 yuv_color_space;
+	u8 swizzle;
+	u8 uv_swizzle;
+	bool enable;
+	bool dirty;
+};
+
+struct dc_hw_scale {
+	u32 scale_factor_x;
+	u32 scale_factor_y;
+	bool enable;
+	bool dirty;
+};
+
+struct dc_hw_position {
+	u16 start_x;
+	u16 start_y;
+	u16 end_x;
+	u16 end_y;
+	bool dirty;
+};
+
+struct dc_hw_blend {
+	u8 alpha;
+	u8 blend_mode;
+	bool dirty;
+};
+
+struct dc_hw_cursor {
+	u32 address;
+	u16 x;
+	u16 y;
+	u16 hot_x;
+	u16 hot_y;
+	bool enable;
+	bool dirty;
+};
+
+struct dc_hw_display {
+	u32 bus_format;
+	u16 h_active;
+	u16 h_total;
+	u16 h_sync_start;
+	u16 h_sync_end;
+	u16 v_active;
+	u16 v_total;
+	u16 v_sync_start;
+	u16 v_sync_end;
+	u16 sync_mode;
+	bool h_sync_polarity;
+	bool v_sync_polarity;
+	bool enable;
+	bool dither_enable;
+};
+
+struct dc_hw_gamma {
+	u16 gamma[GAMMA_EX_SIZE][3];
+	bool enable;
+	bool dirty;
+};
+
+struct dc_hw_degamma {
+	u16 degamma[DEGAMMA_SIZE][3];
+	u32 mode;
+	bool dirty;
+};
+
+struct dc_hw_plane {
+	struct dc_hw_fb fb;
+	struct dc_hw_scale scale;
+	struct dc_hw_degamma degamma;
+};
+
+struct dc_hw_overlay {
+	struct dc_hw_plane plane;
+	struct dc_hw_position pos;
+	struct dc_hw_blend blend;
+};
+
+struct dc_hw_read {
+	u32		reg;
+	u32		value;
+};
+
+struct dc_hw;
+struct dc_hw_funcs {
+	void (*gamma)(struct dc_hw *hw);
+	void (*plane)(struct dc_hw *hw);
+	void (*display)(struct dc_hw *hw, struct dc_hw_display *display);
+};
+
+struct dc_hw {
+	enum dc_hw_chip_rev rev;
+	enum dc_hw_out		out;
+	void __iomem		*hi_base;
+	void __iomem		*reg_base;
+	struct dc_hw_read	 *read_block;
+	struct dc_hw_display	display;
+	struct dc_hw_gamma	gamma;
+	struct dc_hw_plane	primary;
+	struct dc_hw_overlay	overlay;
+	struct dc_hw_cursor cursor;
+	const struct dc_hw_funcs *func;
+	const struct vs_dc_info	*info;
+};
+
+int dc_hw_init(struct dc_hw *hw);
+void dc_hw_deinit(struct dc_hw *hw);
+void dc_hw_update_plane(struct dc_hw *hw, enum dc_hw_plane_id id,
+			struct dc_hw_fb *fb, struct dc_hw_scale *scale);
+void dc_hw_update_degamma(struct dc_hw *hw, enum dc_hw_plane_id id, u32 mode);
+void dc_hw_set_position(struct dc_hw *hw, struct dc_hw_position *pos);
+void dc_hw_set_blend(struct dc_hw *hw, struct dc_hw_blend *blend);
+void dc_hw_update_cursor(struct dc_hw *hw, struct dc_hw_cursor *cursor);
+void dc_hw_update_gamma(struct dc_hw *hw, u16 index, u16 r, u16 g, u16 b);
+void dc_hw_enable_gamma(struct dc_hw *hw, bool enable);
+void dc_hw_setup_display(struct dc_hw *hw, struct dc_hw_display *display);
+void dc_hw_enable_interrupt(struct dc_hw *hw, bool enable);
+u32 dc_hw_get_interrupt(struct dc_hw *hw);
+bool dc_hw_flip_in_progress(struct dc_hw *hw);
+bool dc_hw_check_underflow(struct dc_hw *hw);
+void dc_hw_enable_shadow_register(struct dc_hw *hw, bool enable);
+void dc_hw_set_out(struct dc_hw *hw, enum dc_hw_out out);
+void dc_hw_commit(struct dc_hw *hw);
+
+u32 hi_read(struct dc_hw *hw, u32 reg);
+#endif /* __VS_DC_HW_H__ */
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_drv.c b/drivers/gpu/drm/verisilicon/pci/vs_drv.c
new file mode 100644
index 000000000000..18f51ecbbb2f
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_drv.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DRM driver for the Verisilicon DC8000 display controller of StarFive BMC
+ * SoCs, attached to the host over PCIe.
+ *
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+#include <linux/aperture.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include <drm/clients/drm_client_setup.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fbdev_ttm.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_module.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "vs_dc.h"
+#include "vs_drv.h"
+#include "vs_virtual.h"
+
+#define DRV_NAME	"verisilicon-dc8000"
+#define DRV_DESC	"VeriSilicon DC8000 PCIe DRM driver"
+#define DRV_MAJOR	1
+#define DRV_MINOR	0
+
+#define PCI_VENDOR_ID_STARFIVE		0x20b5
+#define PCI_DEVICE_ID_STARFIVE_DC8000	0xb101
+/* FPGA prototype of the BMC on a Synopsys HAPS board */
+#define PCI_DEVICE_ID_SYNOPSYS_HAPS_DC8000	0xabcc
+
+static const u64 vs_scr_addr[] = { VS_MEMORY_ADDR0, VS_MEMORY_ADDR1 };
+
+DEFINE_DRM_GEM_FOPS(vs_drm_fops);
+
+static int vs_vram_dumb_create(struct drm_file *file,
+			       struct drm_device *dev,
+			       struct drm_mode_create_dumb *args)
+{
+	struct vs_drm_private *priv = to_vs_priv(dev);
+
+	return drm_gem_vram_fill_create_dumb(file, dev, 0,
+					     priv->pitch_alignment, args);
+}
+
+static const struct drm_driver vs_drm_driver = {
+	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
+	.fops			= &vs_drm_fops,
+	.name			= DRV_NAME,
+	.desc			= DRV_DESC,
+	.major			= DRV_MAJOR,
+	.minor			= DRV_MINOR,
+
+	.debugfs_init		= drm_vram_mm_debugfs_init,
+	.dumb_create		= vs_vram_dumb_create,
+	.dumb_map_offset	= drm_gem_ttm_dumb_map_offset,
+	DRM_FBDEV_TTM_DRIVER_OPS,
+};
+
+static const struct drm_mode_config_funcs vs_mode_config_funcs = {
+	.fb_create		= drm_gem_fb_create_with_dirty,
+	.atomic_check		= drm_atomic_helper_check,
+	.atomic_commit		= drm_atomic_helper_commit,
+	.mode_valid		= vs_vd_mode_valid,
+};
+
+static const struct drm_mode_config_helper_funcs vs_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
+static void vs_mode_config_init(struct drm_device *dev)
+{
+	if (dev->mode_config.max_width == 0 ||
+	    dev->mode_config.max_height == 0) {
+		dev->mode_config.min_width = 0;
+		dev->mode_config.min_height = 0;
+		dev->mode_config.max_width = 4096;
+		dev->mode_config.max_height = 4096;
+	}
+	dev->mode_config.funcs = &vs_mode_config_funcs;
+	dev->mode_config.helper_private = &vs_mode_config_helpers;
+}
+
+static const struct pci_device_id vs_pci_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_STARFIVE, PCI_DEVICE_ID_STARFIVE_DC8000) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_SYNOPSYS, PCI_DEVICE_ID_SYNOPSYS_HAPS_DC8000) },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(pci, vs_pci_table);
+
+static int vs_drm_device_init(struct drm_device *dev)
+{
+	int ret;
+
+	ret = vs_dc_pci_init(dev);
+	if (ret) {
+		drm_err(dev, "fail to init vs dc: %d\n", ret);
+		return ret;
+	}
+
+	ret = vs_vd_pci_init(dev);
+	if (ret) {
+		drm_err(dev, "fail to init vs virtual display: %d\n", ret);
+		vs_dc_pci_deinit(dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void vs_drm_device_deinit(struct drm_device *dev)
+{
+	vs_vd_pci_deinit(dev);
+	vs_dc_pci_deinit(dev);
+}
+
+/*
+ * The BMC tells the host which of its two host slots the device is plugged
+ * into through the last 8 bytes of the memory BAR. The slot decides the
+ * address under which the DC sees the memory BAR.
+ */
+static int vs_set_host_type(struct pci_dev *pdev, struct vs_drm_private *priv)
+{
+	resource_size_t start = pci_resource_end(pdev, VS_MEM_BAR) - 7;
+	void __iomem *vaddr;
+	u32 type;
+
+	vaddr = devm_ioremap(&pdev->dev, start, 8);
+	if (!vaddr)
+		return -ENOMEM;
+
+	type = readl(vaddr);
+	devm_iounmap(&pdev->dev, vaddr);
+
+	priv->flags = type ? VS_DC_FLAG_IS_HOST1 : VS_DC_FLAG_IS_HOST0;
+	priv->scr_addr = vs_scr_addr[priv->flags];
+
+	dev_info(&pdev->dev, "DC type: %u, host slot: %u\n", type, priv->flags);
+
+	return 0;
+}
+
+static int vs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
+{
+	struct vs_drm_private *priv;
+	struct drm_device *drm;
+	int ret;
+
+	ret = aperture_remove_conflicting_pci_devices(pdev, vs_drm_driver.name);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to remove existing framebuffers: %d\n", ret);
+		return ret;
+	}
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "fail to enable PCI device: %d\n", ret);
+		return ret;
+	}
+
+	ret = pcim_request_all_regions(pdev, DRV_NAME);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	priv = devm_drm_dev_alloc(&pdev->dev, &vs_drm_driver,
+				  struct vs_drm_private, base);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
+	drm = &priv->base;
+	pci_set_drvdata(pdev, priv);
+
+	spin_lock_init(&priv->irq_lock);
+	mutex_init(&priv->bmc_lock);
+	INIT_WORK(&priv->single_node_work, vs_single_node_work);
+	priv->pitch_alignment = 64;
+
+	ret = vs_set_host_type(pdev, priv);
+	if (ret)
+		return ret;
+
+	ret = drmm_vram_helper_init(drm, pci_resource_start(pdev, VS_MEM_BAR),
+				    pci_resource_len(pdev, VS_MEM_BAR));
+	if (ret)
+		return ret;
+
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
+	ret = vs_drm_device_init(drm);
+	if (ret)
+		return ret;
+
+	vs_mode_config_init(drm);
+
+	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (ret) {
+		drm_err(drm, "fail to init drm vblank: %d\n", ret);
+		goto err_deinit;
+	}
+
+	drm_mode_config_reset(drm);
+	drm_kms_helper_poll_init(drm);
+
+	ret = drm_dev_register(drm, 0);
+	if (ret) {
+		drm_err(drm, "fail to register drm device: %d\n", ret);
+		goto err_poll_fini;
+	}
+
+	drm_client_setup(drm, NULL);
+
+	return 0;
+
+err_poll_fini:
+	drm_kms_helper_poll_fini(drm);
+err_deinit:
+	vs_drm_device_deinit(drm);
+	return ret;
+}
+
+static void vs_pci_remove(struct pci_dev *pdev)
+{
+	struct vs_drm_private *priv = pci_get_drvdata(pdev);
+	struct drm_device *drm = &priv->base;
+
+	drm_dev_unregister(drm);
+	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
+	vs_drm_device_deinit(drm);
+}
+
+static void vs_pci_shutdown(struct pci_dev *pdev)
+{
+	struct vs_drm_private *priv = pci_get_drvdata(pdev);
+	struct drm_device *drm = &priv->base;
+
+	drm_atomic_helper_shutdown(drm);
+	vs_dc_pci_deinit(drm);
+}
+
+static struct pci_driver vs_drm_pci_driver = {
+	.name = DRV_NAME,
+	.id_table = vs_pci_table,
+	.probe = vs_pci_probe,
+	.remove = vs_pci_remove,
+	.shutdown = vs_pci_shutdown,
+};
+
+drm_module_pci_driver(vs_drm_pci_driver);
+
+MODULE_DESCRIPTION("VeriSilicon DC8000 PCIe DRM Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_drv.h b/drivers/gpu/drm/verisilicon/pci/vs_drv.h
new file mode 100644
index 000000000000..591785eb8613
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_drv.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __VS_DRV_H__
+#define __VS_DRV_H__
+
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_modes.h>
+
+#include "vs_dc.h"
+
+/**
+ * struct vs_drm_private - per device state of the PCIe DC8000 driver
+ * @base: the DRM device
+ * @dc: display controller state
+ * @pitch_alignment: buffer pitch alignment required by the DC
+ * @flags: host slot this device is plugged into (VS_DC_FLAG_IS_HOST*)
+ * @edid_status: result of the last EDID request to the BMC
+ * @comm_b2h: BMC to host mailbox
+ * @comm_h2b: host to BMC mailbox
+ * @scr_addr: address of the memory BAR as seen by the DC DMA engine
+ * @bmc_lock: serialises the H2B mailbox transactions and protects @last_mode
+ * @last_mode: last mode sent to the BMC, re-sent after a hotplug
+ * @irq_lock: protects @vce_fb against the VCE work
+ * @single_node_work: re-sends the current mode to the BMC after hotplug
+ * @node_type: BMC node type read from the H2B mailbox
+ * @vce_work: periodically hands the current frame buffer to the BMC VCE
+ * @vce_fb: frame buffer description to hand to the VCE
+ */
+struct vs_drm_private {
+	struct drm_device base;
+	struct vs_dc dc;
+
+	unsigned int pitch_alignment;
+	unsigned int flags;
+	unsigned int edid_status;
+
+	void __iomem *comm_b2h;
+	void __iomem *comm_h2b;
+
+	u64 scr_addr;
+	struct mutex bmc_lock; /* H2B mailbox transactions and last_mode */
+	struct drm_display_mode last_mode;
+	spinlock_t irq_lock; /* vce_fb, written by plane updates */
+	struct work_struct single_node_work;
+	u32 node_type;
+#ifdef CONFIG_DRM_VERISILICON_DC8000_VCE
+	struct delayed_work vce_work;
+	struct video_timing vce_fb;
+#endif
+};
+
+static inline struct vs_drm_private *to_vs_priv(struct drm_device *drm)
+{
+	return container_of(drm, struct vs_drm_private, base);
+}
+
+static inline struct vs_drm_private *vs_dc_to_priv(struct vs_dc *dc)
+{
+	return container_of(dc, struct vs_drm_private, dc);
+}
+
+/* The PCI device drvdata is the driver private structure */
+static inline struct vs_dc *dev_to_vs_dc(struct device *dev)
+{
+	struct vs_drm_private *priv = dev_get_drvdata(dev);
+
+	return &priv->dc;
+}
+
+#endif /* __VS_DRV_H__ */
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_plane.c b/drivers/gpu/drm/verisilicon/pci/vs_plane.c
new file mode 100644
index 000000000000..4953d3d8c29a
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_plane.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_color_mgmt.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_modeset_helper_vtables.h>
+
+#include "vs_crtc.h"
+#include "vs_dc.h"
+#include "vs_drv.h"
+#include "vs_plane.h"
+#include "vs_type.h"
+
+void vs_plane_destroy(struct drm_plane *plane)
+{
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+
+	drm_plane_cleanup(plane);
+	kfree(vs_plane);
+}
+
+/* Called during init and reset to allocate the plane's atomic state. */
+static struct drm_plane_state *vs_plane_create_state(struct drm_plane *plane)
+{
+	struct vs_plane_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_plane_state_init(&state->base, plane);
+
+	state->degamma = VS_DEGAMMA_DISABLE;
+	state->degamma_changed = false;
+
+	return &state->base;
+}
+
+static struct drm_plane_state *
+vs_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct vs_plane_state *ori_state;
+	struct vs_plane_state *state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	ori_state = to_vs_plane_state(plane->state);
+	state = kzalloc_obj(*state);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &state->base);
+
+	state->degamma = ori_state->degamma;
+	state->degamma_changed = ori_state->degamma_changed;
+
+	return &state->base;
+}
+
+static void vs_plane_atomic_destroy_state(struct drm_plane *plane,
+					  struct drm_plane_state *state)
+{
+	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
+
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(vs_plane_state);
+}
+
+static int vs_plane_atomic_set_property(struct drm_plane *plane,
+					struct drm_plane_state *state,
+					struct drm_property *property,
+					uint64_t val)
+{
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_plane_state *vs_plane_state = to_vs_plane_state(state);
+
+	if (property == vs_plane->degamma_mode) {
+		if (vs_plane_state->degamma != val) {
+			vs_plane_state->degamma = val;
+			vs_plane_state->degamma_changed = true;
+		} else {
+			vs_plane_state->degamma_changed = false;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int vs_plane_atomic_get_property(struct drm_plane *plane,
+					const struct drm_plane_state *state,
+					struct drm_property *property,
+					uint64_t *val)
+{
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	const struct vs_plane_state *vs_plane_state =
+		container_of(state, const struct vs_plane_state, base);
+
+	if (property == vs_plane->degamma_mode)
+		*val = vs_plane_state->degamma;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static bool vs_format_mod_supported(struct drm_plane *plane,
+				    u32 format, u64 modifier)
+{
+	int i;
+
+	/*
+	 * We always have to allow these modifiers:
+	 * 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
+	 * 2. Not passing any modifiers is the same as explicitly passing INVALID.
+	 */
+	if (modifier == DRM_FORMAT_MOD_LINEAR)
+		return true;
+
+	/* Check that the modifier is on the list of the plane's supported modifiers. */
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (modifier == plane->modifiers[i])
+			break;
+	}
+	if (i == plane->modifier_count)
+		return false;
+
+	return true;
+}
+
+static const struct drm_plane_funcs vs_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= vs_plane_destroy,
+	.atomic_create_state	= vs_plane_create_state,
+	.atomic_duplicate_state = vs_plane_atomic_duplicate_state,
+	.atomic_destroy_state	= vs_plane_atomic_destroy_state,
+	.atomic_set_property	= vs_plane_atomic_set_property,
+	.atomic_get_property	= vs_plane_atomic_get_property,
+	.format_mod_supported	= vs_format_mod_supported,
+};
+
+static unsigned char vs_get_plane_number(struct drm_framebuffer *fb)
+{
+	const struct drm_format_info *info;
+
+	if (!fb)
+		return 0;
+
+	info = drm_format_info(fb->format->format);
+	if (!info || info->num_planes > MAX_NUM_PLANES)
+		return 0;
+
+	return info->num_planes;
+}
+
+static int vs_plane_atomic_check(struct drm_plane *plane,
+				 struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *new_plane_state =
+			drm_atomic_get_new_plane_state(state, plane);
+
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_crtc *vs_crtc;
+
+	if (!crtc || !fb)
+		return 0;
+
+	vs_crtc = to_vs_crtc(crtc);
+
+	return vs_plane->funcs->check(vs_crtc->dev, vs_plane, state);
+}
+
+#ifdef CONFIG_DRM_VERISILICON_DC8000_VCE
+static int vs_get_vce_format_type(struct drm_framebuffer *fb)
+{
+	int fmt;
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_YUV444:
+		fmt = VIDEO_FMT_YUV444;
+		break;
+	case DRM_FORMAT_NV16:
+		fmt  = VIDEO_FMT_NV16;
+		break;
+	case DRM_FORMAT_NV12:
+		fmt = VIDEO_FMT_NV12;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		fmt = VIDEO_FMT_XRGB8888;
+		break;
+	default:
+		fmt = -VIDEO_FMT_BUF_MAX;
+		break;
+	}
+
+	return fmt;
+}
+
+static void vs_send_vce_fb_info(struct drm_framebuffer *fb, u32 offset)
+{
+	struct vs_drm_private *priv = to_vs_priv(fb->dev);
+	unsigned long flags;
+	int ret;
+
+	ret = vs_get_vce_format_type(fb);
+
+	if (ret < 0) {
+		vs_dc_write_reg(priv->comm_h2b, 0, H2B_VCE_MODE);
+		spin_lock_irqsave(&priv->irq_lock, flags);
+		priv->vce_fb.width = 0;
+		spin_unlock_irqrestore(&priv->irq_lock, flags);
+		return;
+	}
+
+	vs_dc_write_reg(priv->comm_h2b, 1, H2B_VCE_MODE);
+	spin_lock_irqsave(&priv->irq_lock, flags);
+	priv->vce_fb.format = ret;
+	priv->vce_fb.height = fb->height;
+	priv->vce_fb.width = fb->width;
+	priv->vce_fb.offset = offset;
+	priv->vce_fb.stride = fb->pitches[0];
+	spin_unlock_irqrestore(&priv->irq_lock, flags);
+}
+#else
+static inline void vs_send_vce_fb_info(struct drm_framebuffer *fb, u32 offset)
+{
+}
+#endif
+
+static void vs_plane_atomic_update(struct drm_plane *plane,
+				   struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *new_state =
+			drm_atomic_get_new_plane_state(state, plane);
+
+	unsigned char i, num_planes;
+	struct drm_framebuffer *fb;
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_crtc *vs_crtc;
+	struct vs_drm_private *priv;
+
+	if (!new_state->fb || !new_state->crtc)
+		return;
+
+	fb = new_state->fb;
+	vs_crtc = to_vs_crtc(new_state->crtc);
+	priv = to_vs_priv(fb->dev);
+	num_planes = vs_get_plane_number(fb);
+
+	for (i = 0; i < num_planes; i++) {
+		struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(fb->obj[i]);
+		u32 offset = drm_gem_vram_offset(gbo);
+
+		offset += fb->offsets[i];
+		/* The DC sees the memory BAR under a different address */
+		vs_plane->dma_addr[i] = priv->scr_addr + offset;
+
+		if (plane->type != DRM_PLANE_TYPE_CURSOR && i == 0)
+			vs_send_vce_fb_info(fb, offset);
+	}
+
+	vs_plane->funcs->update(vs_crtc->dev, vs_plane, plane, state);
+}
+
+static void vs_plane_atomic_disable(struct drm_plane *plane,
+				    struct drm_atomic_commit *state)
+{
+	struct drm_plane_state *old_state =
+			drm_atomic_get_old_plane_state(state, plane);
+	struct vs_plane *vs_plane = to_vs_plane(plane);
+	struct vs_crtc *vs_crtc = to_vs_crtc(old_state->crtc);
+
+	vs_plane->funcs->disable(vs_crtc->dev, vs_plane);
+}
+
+static const struct drm_plane_helper_funcs vs_plane_helper_funcs = {
+	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
+	.atomic_check	= vs_plane_atomic_check,
+	.atomic_update	= vs_plane_atomic_update,
+	.atomic_disable = vs_plane_atomic_disable,
+};
+
+static const struct drm_prop_enum_list vs_degamma_mode_enum_list[] = {
+	{ VS_DEGAMMA_DISABLE,	"disabled" },
+	{ VS_DEGAMMA_BT709, "preset degamma for BT709" },
+	{ VS_DEGAMMA_BT2020,	"preset degamma for BT2020" },
+};
+
+struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
+				 const struct vs_plane_info *info,
+				 unsigned int possible_crtcs)
+{
+	struct vs_plane *plane;
+	int ret;
+
+	if (!info)
+		return NULL;
+
+	plane = kzalloc_obj(*plane);
+	if (!plane)
+		return NULL;
+
+	plane->id = info->id;
+	ret = drm_universal_plane_init(drm_dev, &plane->base, possible_crtcs,
+				       &vs_plane_funcs, info->formats,
+				       info->num_formats, info->modifiers,
+				       info->type,
+				       info->name ? info->name : NULL);
+	if (ret)
+		goto err_free_plane;
+
+	drm_plane_helper_add(&plane->base, &vs_plane_helper_funcs);
+
+	/* Set up the plane properties */
+	if (info->degamma_size) {
+		plane->degamma_mode =
+			drm_property_create_enum(drm_dev, 0, "DEGAMMA_MODE",
+						 vs_degamma_mode_enum_list,
+						 ARRAY_SIZE(vs_degamma_mode_enum_list));
+
+		if (!plane->degamma_mode)
+			goto error_cleanup_plane;
+
+		drm_object_attach_property(&plane->base.base,
+					   plane->degamma_mode,
+					   VS_DEGAMMA_DISABLE);
+	}
+
+	if (info->rotation) {
+		ret = drm_plane_create_rotation_property(&plane->base,
+							 DRM_MODE_ROTATE_0,
+							 info->rotation);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	if (info->blend_mode) {
+		ret = drm_plane_create_blend_mode_property(&plane->base,
+							   info->blend_mode);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	if (info->constant_alpha) {
+		ret = drm_plane_create_alpha_property(&plane->base);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	if (info->color_encoding) {
+		ret = drm_plane_create_color_properties(&plane->base,
+							info->color_encoding,
+							BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+							DRM_COLOR_YCBCR_BT709,
+							DRM_COLOR_YCBCR_LIMITED_RANGE);
+		if (ret)
+			goto error_cleanup_plane;
+	}
+
+	return plane;
+
+error_cleanup_plane:
+	drm_plane_cleanup(&plane->base);
+err_free_plane:
+	kfree(plane);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_plane.h b/drivers/gpu/drm/verisilicon/pci/vs_plane.h
new file mode 100644
index 000000000000..11d2bfabf97c
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_plane.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __VS_PLANE_H__
+#define __VS_PLANE_H__
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_plane.h>
+
+#include "vs_type.h"
+
+#define MAX_NUM_PLANES		3 /* colour format plane */
+
+struct vs_plane;
+
+struct vs_plane_funcs {
+	void (*update)(struct device *dev, struct vs_plane *plane,
+		       struct drm_plane *drm_plane,
+		       struct drm_atomic_commit *state);
+	void (*disable)(struct device *dev, struct vs_plane *plane);
+	int (*check)(struct device *dev, struct vs_plane *plane,
+		     struct drm_atomic_commit *state);
+};
+
+struct vs_plane_state {
+	struct drm_plane_state base;
+
+	u32 degamma;
+	bool degamma_changed;
+};
+
+struct vs_plane {
+	struct drm_plane base;
+	u8 id;
+	dma_addr_t dma_addr[MAX_NUM_PLANES];
+
+	struct drm_property *degamma_mode;
+
+	const struct vs_plane_funcs *funcs;
+};
+
+void vs_plane_destroy(struct drm_plane *plane);
+
+struct vs_plane *vs_plane_create(struct drm_device *drm_dev,
+				 const struct vs_plane_info *info,
+				 unsigned int possible_crtcs);
+
+static inline struct vs_plane *to_vs_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct vs_plane, base);
+}
+
+static inline struct vs_plane_state *
+to_vs_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct vs_plane_state, base);
+}
+
+#endif /* __VS_PLANE_H__ */
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_type.h b/drivers/gpu/drm/verisilicon/pci/vs_type.h
new file mode 100644
index 000000000000..0ecda596c1a5
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_type.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __VS_TYPE_H__
+#define __VS_TYPE_H__
+
+#include <linux/types.h>
+
+#include <drm/drm_plane.h>
+
+enum drm_vs_degamma_mode {
+	VS_DEGAMMA_DISABLE = 0,
+	VS_DEGAMMA_BT709 = 1,
+	VS_DEGAMMA_BT2020 = 2,
+};
+
+enum drm_vs_sync_dc_mode {
+	VS_SINGLE_DC = 0,
+	VS_MULTI_DC_PRIMARY = 1,
+	VS_MULTI_DC_SECONDARY = 2,
+};
+
+struct vs_plane_info {
+	const char *name;
+	u8 id;
+	enum drm_plane_type type;
+	unsigned int num_formats;
+	const u32 *formats;
+	const u64 *modifiers;
+	unsigned int min_width;
+	unsigned int min_height;
+	unsigned int max_width;
+	unsigned int max_height;
+	unsigned int rotation;
+	/* Supported DRM_MODE_BLEND_* modes, 0 if the plane cannot blend */
+	unsigned int blend_mode;
+	/* The plane has a constant alpha register */
+	bool constant_alpha;
+	unsigned int color_encoding;
+
+	/* 0 means no de-gamma LUT */
+	unsigned int degamma_size;
+
+	int min_scale; /* 16.16 fixed point */
+	int max_scale; /* 16.16 fixed point */
+};
+
+struct vs_dc_info {
+	const char *name;
+
+	/* planes */
+	unsigned char plane_num;
+	const struct vs_plane_info *planes;
+
+	unsigned int max_bpc;
+	unsigned int color_formats;
+
+	/* 0 means no gamma LUT */
+	u16 gamma_size;
+	u8 gamma_bits;
+
+	u16 pitch_alignment;
+
+	bool pipe_sync;
+};
+
+#endif /* __VS_TYPE_H__ */
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_virtual.c b/drivers/gpu/drm/verisilicon/pci/vs_virtual.c
new file mode 100644
index 000000000000..4d294027c1cc
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_virtual.c
@@ -0,0 +1,531 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/media-bus-format.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "vs_crtc.h"
+#include "vs_dc.h"
+#include "vs_drv.h"
+#include "vs_virtual.h"
+
+#define GET_EDID_SUCCESS		0
+#define GET_EDID_FAIL			1
+
+#define VS_MODE_NUM			16
+
+/* Fallback modes when the BMC does not provide an EDID */
+static const struct {
+	int w, h, hz, clk;
+} dmt_mode[VS_MODE_NUM] = {
+	{640, 480, 60, 25175}, {720, 400, 85, 35500},
+	{800, 600, 60, 40000}, {1024, 768, 60, 65000},
+	{1152, 864, 75, 108000}, {1280, 720, 60, 74250},
+	{1280, 768, 60, 79500}, {1280, 960, 60, 108000},
+	{1280, 1024, 60, 108000}, {1440, 900, 60, 106500},
+	{1600, 900, 60, 108000}, {1600, 1200, 60, 162000},
+	{1920, 1080, 60, 148500}, {1920, 1200, 60, 193250},
+	{2048, 1080, 60, 147180}, {2048, 1152, 60, 162000},
+};
+
+/* The DC8000 front end on the BMC only accepts the modes above */
+enum drm_mode_status vs_vd_mode_valid(struct drm_device *dev,
+				      const struct drm_display_mode *mode)
+{
+	int i, vf;
+
+	if (mode->hdisplay > 2048)
+		return MODE_BAD;
+
+	vf = drm_mode_vrefresh(mode);
+
+	for (i = 0; i < VS_MODE_NUM; i++) {
+		if (mode->hdisplay == dmt_mode[i].w &&
+		    mode->vdisplay == dmt_mode[i].h &&
+		    vf == dmt_mode[i].hz) {
+			return MODE_OK;
+		}
+	}
+
+	return MODE_BAD;
+}
+
+static void vd_encoder_atomic_mode_set(struct drm_encoder *encoder,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct vs_drm_private *priv = to_vs_priv(encoder->dev);
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	/*
+	 * Remember the mode so it can be re-sent after a hotplug. Update it and
+	 * send it under the same lock so that a concurrent vs_single_node_work()
+	 * can never re-send a stale mode after this one.
+	 */
+	mutex_lock(&priv->bmc_lock);
+	drm_mode_copy(&priv->last_mode, adjusted_mode);
+	__vs_dc_h2b_assign_task(priv, MODE_BIT, adjusted_mode);
+	mutex_unlock(&priv->bmc_lock);
+}
+
+static int vd_encoder_atomic_check(struct drm_encoder *encoder,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state)
+{
+	struct vs_crtc_state *vs_crtc_state = to_vs_crtc_state(crtc_state);
+	struct drm_connector *connector = conn_state->connector;
+
+	vs_crtc_state->encoder_type = encoder->encoder_type;
+
+	if (connector->display_info.num_bus_formats)
+		vs_crtc_state->output_fmt =
+					connector->display_info.bus_formats[0];
+	else
+		vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+
+	switch (vs_crtc_state->output_fmt) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+	case MEDIA_BUS_FMT_RGB666_1X18:
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		break;
+	default:
+		vs_crtc_state->output_fmt = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	}
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs vd_encoder_helper_funcs = {
+	.atomic_mode_set = vd_encoder_atomic_mode_set,
+	.atomic_check = vd_encoder_atomic_check,
+};
+
+/* Copy the EDID the BMC placed into a B2H mailbox and parse it */
+static const struct drm_edid *bmc_read_edid(void __iomem *base)
+{
+	const struct drm_edid *drm_edid;
+	size_t len;
+	u8 *buf;
+
+	if (vs_dc_read_reg(base, 0) & EDID_BIT)
+		len = MAX_EDID_LEN;
+	else
+		len = EDID_LENGTH;
+
+	buf = kmalloc(len, GFP_KERNEL);
+	if (!buf)
+		return NULL;
+
+	memcpy_fromio(buf, base + B2H_DATA, len);
+	drm_edid = drm_edid_alloc(buf, len);
+	kfree(buf);
+
+	return drm_edid;
+}
+
+/* EDID of the sink on the primary (DP) output */
+static const struct drm_edid *bmc_request_edid(struct vs_drm_private *priv)
+{
+	return bmc_read_edid(priv->comm_b2h);
+}
+
+/* EDID of the sink on the secondary (VGA) output, if one is connected */
+static const struct drm_edid *bmc_request_next_edid(struct vs_drm_private *priv)
+{
+	if (!(vs_dc_read_reg(priv->comm_b2h, B2H_CONNECT) & BMC_VGA_STATUS))
+		return NULL;
+
+	return bmc_read_edid(priv->comm_b2h + B2H_SIZE);
+}
+
+static int vs_add_edid_modes(struct drm_connector *connector,
+			     const struct drm_edid *drm_edid)
+{
+	int count;
+
+	/*
+	 * drm_edid_connector_add_modes() re-reads the EDID from the connector
+	 * property blob, so the update must have succeeded first.
+	 */
+	if (drm_edid_connector_update(connector, drm_edid)) {
+		drm_edid_free(drm_edid);
+		return 0;
+	}
+
+	count = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
+
+	return count;
+}
+
+static int vs_add_modes_noedid(struct drm_connector *connector)
+{
+	unsigned int count, i;
+	struct drm_display_mode *mode = NULL;
+
+	count = 0;
+	for (i = 0; i < VS_MODE_NUM; i++) {
+		mode = drm_mode_find_dmt(connector->dev, dmt_mode[i].w,
+					 dmt_mode[i].h, dmt_mode[i].hz, false);
+		if (mode) {
+			drm_mode_probed_add(connector, mode);
+			count++;
+		}
+	}
+
+	return count;
+}
+
+static int vs_try_get_vga_node_modes(struct vs_drm_private *priv,
+				     struct drm_connector *connector)
+{
+	int count;
+
+	count = vs_add_edid_modes(connector, bmc_request_next_edid(priv));
+
+	drm_dbg_kms(connector->dev, "vs vga edid modes:%d\n", count);
+
+	return count;
+}
+
+static int vs_try_get_node_modes(struct vs_drm_private *priv,
+				 struct drm_connector *connector)
+{
+	int count;
+
+	count = vs_add_edid_modes(connector, bmc_request_edid(priv));
+
+	drm_dbg_kms(connector->dev, "vs edid modes:%d\n", count);
+
+	return count;
+}
+
+/*
+ * When both the DP and the VGA output of the BMC are connected, only keep
+ * the modes which both sinks support.
+ */
+static int vs_try_get_shared_modes(struct vs_drm_private *priv,
+				   struct drm_connector *con,
+				   int old_count)
+{
+	int count = 0;
+	const struct drm_edid *drm_edid;
+	struct drm_connector *connector;
+	struct drm_display_mode *pmode, *pm;
+	struct drm_display_mode *pmode_next, *pm_next;
+
+	/*
+	 * Parse the second EDID into a scratch connector which is never
+	 * registered, only its probed_modes list is used.
+	 */
+	connector = kzalloc_obj(*connector);
+	if (!connector)
+		return old_count;
+
+	connector->dev = con->dev;
+	INIT_LIST_HEAD(&connector->probed_modes);
+	INIT_LIST_HEAD(&connector->modes);
+	drm_edid = bmc_request_next_edid(priv);
+	if (drm_edid) {
+		count = drm_add_edid_modes(connector,
+					   (struct edid *)drm_edid_raw(drm_edid));
+		drm_edid_free(drm_edid);
+	}
+	drm_dbg_kms(con->dev, "vs next edid modes:%d\n", count);
+
+	if (!count) {
+		kfree(connector);
+		return old_count;
+	}
+
+	count = 0;
+	list_for_each_entry_safe(pmode_next, pm_next, &con->probed_modes, head) {
+		bool found = false;
+
+		list_for_each_entry_safe(pmode, pm, &connector->probed_modes, head) {
+			if (drm_mode_equal(pmode, pmode_next)) {
+				list_del(&pmode->head);
+				drm_mode_destroy(connector->dev, pmode);
+				found = true;
+				count++;
+				break;
+			}
+			found = false;
+		}
+
+		if (!found) {
+			list_del(&pmode_next->head);
+			drm_mode_destroy(con->dev, pmode_next);
+		}
+	}
+
+	list_for_each_entry_safe(pmode, pm, &connector->probed_modes, head) {
+		list_del(&pmode->head);
+		drm_mode_destroy(connector->dev, pmode);
+	}
+
+	kfree(connector);
+
+	return count;
+}
+
+static int vd_get_modes(struct drm_connector *connector)
+{
+	struct vs_drm_private *priv = to_vs_priv(connector->dev);
+	int count = 0;
+	u32 val;
+
+	if (priv->node_type && !priv->flags) {
+		val = vs_dc_read_reg(priv->comm_b2h, B2H_CONNECT);
+		val &= BMC_DP_STATUS;
+		if (!val)
+			count = 0;
+		else
+			count = vs_try_get_node_modes(priv, connector);
+
+		if (count == 0) {
+			count = vs_try_get_vga_node_modes(priv, connector);
+		} else {
+			count = vs_try_get_shared_modes(priv, connector, count);
+			if (count == 0)
+				count = vs_try_get_node_modes(priv, connector);
+		}
+	} else {
+		count = vs_try_get_node_modes(priv, connector);
+	}
+
+	priv->edid_status = count ? GET_EDID_SUCCESS : GET_EDID_FAIL;
+
+	if (priv->edid_status)
+		count = vs_add_modes_noedid(connector);
+
+	drm_dbg_kms(connector->dev, "vs final edid modes:%d\n", count);
+
+	return count;
+}
+
+static struct drm_encoder *vd_best_encoder(struct drm_connector *connector)
+{
+	struct vs_virtual_display *vd;
+
+	vd = to_virtual_display_with_connector(connector);
+	return &vd->encoder;
+}
+
+static enum drm_mode_status vd_mode_valid(struct drm_connector *connector,
+					  const struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+static const struct drm_connector_helper_funcs vd_connector_helper_funcs = {
+	.get_modes = vd_get_modes,
+	.mode_valid = vd_mode_valid,
+	.best_encoder = vd_best_encoder,
+};
+
+static enum drm_connector_status
+vd_connector_detect(struct drm_connector *connector, bool force)
+{
+	return connector_status_connected;
+}
+
+static const struct drm_connector_funcs vd_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.detect = vd_connector_detect,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.reset = drm_atomic_helper_connector_reset,
+};
+
+/*
+ * A sink plugged into the BMC while the pipeline is already running with a
+ * mode it supports does not cause a modeset on the DRM side, so the BMC
+ * would never (re)train its link. Re-send the current mode instead.
+ */
+void vs_single_node_work(struct work_struct *work)
+{
+	struct vs_drm_private *priv = container_of(work, struct vs_drm_private,
+						   single_node_work);
+
+	mutex_lock(&priv->bmc_lock);
+	if (priv->last_mode.clock)
+		__vs_dc_h2b_assign_task(priv, MODE_BIT, &priv->last_mode);
+	mutex_unlock(&priv->bmc_lock);
+}
+
+static irqreturn_t vs_vd_irq(int irq, void *dev_id)
+{
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t vs_vd_irq_thread(int irq, void *dev_id)
+{
+	struct drm_connector *connector = dev_id;
+	struct vs_drm_private *priv = to_vs_priv(connector->dev);
+	u32 val;
+
+	val = vs_dc_read_reg(priv->comm_b2h, B2H_CONNECT);
+
+	if (val & HOTPLUG_BIT) {
+		val &= (~HOTPLUG_BIT);
+		vs_dc_write_reg(priv->comm_b2h, val, B2H_CONNECT);
+		vs_dc_write_reg(priv->comm_b2h, 0, B2H_DONE);
+		dev_info(priv->base.dev, "hotplug event irq triggered\n");
+		drm_kms_helper_connector_hotplug_event(connector);
+		if (priv->node_type && !connector->dpms)
+			schedule_work(&priv->single_node_work);
+	}
+
+	return IRQ_HANDLED;
+}
+
+#ifdef CONFIG_DRM_VERISILICON_DC8000_VCE
+#define VCE_POLL_DELAY_MS	33
+
+/*
+ * Periodically hand the current frame buffer to the BMC video capture
+ * engine. This shares the H2B mailbox with the mode and pixel clock events,
+ * hence it runs as a work item so that it can take bmc_lock.
+ */
+static void vs_vce_work_fn(struct work_struct *work)
+{
+	struct vs_drm_private *priv = container_of(work, struct vs_drm_private,
+						   vce_work.work);
+	unsigned long flags;
+
+	mutex_lock(&priv->bmc_lock);
+	if (vs_dc_read_reg(priv->comm_h2b, H2B_VCE_STATUS) &&
+	    priv->vce_fb.width != 0 && priv->vce_fb.height != 0 &&
+	    !vs_dc_read_reg(priv->comm_h2b, H2B_DONE)) {
+		spin_lock_irqsave(&priv->irq_lock, flags);
+		memcpy_toio(priv->comm_h2b + H2B_VCE, &priv->vce_fb,
+			    sizeof(struct video_timing));
+		spin_unlock_irqrestore(&priv->irq_lock, flags);
+		vs_dc_write_reg(priv->comm_h2b, VCE_BIT, H2B_TYPE);
+		vs_dc_write_reg(priv->comm_h2b, 1, H2B_DONE);
+	}
+	mutex_unlock(&priv->bmc_lock);
+
+	schedule_delayed_work(&priv->vce_work,
+			      msecs_to_jiffies(VCE_POLL_DELAY_MS));
+}
+
+static void vs_vce_work_start(struct vs_drm_private *priv)
+{
+	INIT_DELAYED_WORK(&priv->vce_work, vs_vce_work_fn);
+	schedule_delayed_work(&priv->vce_work, msecs_to_jiffies(100));
+	dev_info(priv->base.dev, "send vce fb info start\n");
+}
+
+static void vs_vce_work_stop(struct vs_drm_private *priv)
+{
+	cancel_delayed_work_sync(&priv->vce_work);
+}
+#else
+static inline void vs_vce_work_start(struct vs_drm_private *priv)
+{
+}
+
+static inline void vs_vce_work_stop(struct vs_drm_private *priv)
+{
+}
+#endif
+
+int vs_vd_pci_init(struct drm_device *drm_dev)
+{
+	struct pci_dev *pdev = to_pci_dev(drm_dev->dev);
+	struct device *dev = &pdev->dev;
+	struct vs_drm_private *priv = to_vs_priv(drm_dev);
+	struct vs_dc *dc = &priv->dc;
+	struct vs_virtual_display *vd = NULL;
+	struct drm_connector *connector = NULL;
+	struct drm_encoder *encoder;
+	int ret;
+
+	vd = drmm_kzalloc(drm_dev, sizeof(*vd), GFP_KERNEL);
+	if (!vd)
+		return -ENOMEM;
+
+	vd->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	vd->dc = dev;
+	dc->vd = vd;
+
+	/* Encoder */
+	encoder = &vd->encoder;
+	ret = drmm_encoder_init(drm_dev, encoder, NULL,
+				DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+	drm_encoder_helper_add(encoder, &vd_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&dc->crtc->base);
+
+	/* Connector */
+	connector = &vd->connector;
+	ret = drmm_connector_init(drm_dev, connector, &vd_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
+	/*
+	 * Virtual connectors do not get the EDID property by default, but
+	 * the sink EDID is relayed by the BMC and drm_edid_connector_update()
+	 * stores it in that property.
+	 */
+	drm_connector_attach_edid_property(connector);
+
+	drm_connector_helper_add(connector, &vd_connector_helper_funcs);
+	connector->interlace_allowed = false;
+	connector->doublescan_allowed = false;
+	connector->dpms = DRM_MODE_DPMS_OFF;
+	/* The BMC signals sink changes through the B2H interrupt */
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_display_info_set_bus_formats(&connector->display_info,
+					 &vd->bus_format, 1);
+
+	/* attach */
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	ret = pci_request_irq(pdev, VS_B2H_IRQ, vs_vd_irq, vs_vd_irq_thread,
+			      connector, "%s-hotplug", dev_name(dev));
+	if (ret < 0)
+		return ret;
+
+	vs_vce_work_start(priv);
+
+	return 0;
+}
+
+void vs_vd_pci_deinit(struct drm_device *drm_dev)
+{
+	struct pci_dev *pdev = to_pci_dev(drm_dev->dev);
+	struct vs_drm_private *priv = to_vs_priv(drm_dev);
+	struct vs_virtual_display *vd = priv->dc.vd;
+
+	vs_vce_work_stop(priv);
+	pci_free_irq(pdev, VS_B2H_IRQ, &vd->connector);
+	cancel_work_sync(&priv->single_node_work);
+}
diff --git a/drivers/gpu/drm/verisilicon/pci/vs_virtual.h b/drivers/gpu/drm/verisilicon/pci/vs_virtual.h
new file mode 100644
index 000000000000..a1378013f90e
--- /dev/null
+++ b/drivers/gpu/drm/verisilicon/pci/vs_virtual.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 VeriSilicon Holdings Co., Ltd.
+ * Copyright (C) 2026 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __VS_VIRTUAL_H_
+#define __VS_VIRTUAL_H_
+
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+
+struct drm_device;
+struct drm_display_mode;
+struct work_struct;
+
+/*
+ * The physical connector is owned by the BMC firmware. On the host side it
+ * is exposed as a virtual connector whose EDID, hotplug state and mode
+ * programming are relayed through the BMC mailbox.
+ */
+struct vs_virtual_display {
+	struct drm_encoder encoder;
+	struct drm_connector connector;
+	struct device *dc;
+	u32 bus_format;
+};
+
+static inline struct vs_virtual_display *
+to_virtual_display_with_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct vs_virtual_display, connector);
+}
+
+static inline struct vs_virtual_display *
+to_virtual_display_with_encoder(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct vs_virtual_display, encoder);
+}
+
+int vs_vd_pci_init(struct drm_device *drm_dev);
+void vs_vd_pci_deinit(struct drm_device *drm_dev);
+enum drm_mode_status vs_vd_mode_valid(struct drm_device *dev,
+				      const struct drm_display_mode *mode);
+void vs_single_node_work(struct work_struct *work);
+
+#endif /* __VS_VIRTUAL_H_ */
-- 
2.34.1

