Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096779;
	b=zptqIQvw8nZAUx498FQZC78nlpN5K81uUcY2kpsm+/q/ztP/1zZ6lwQOT3M73v2esTXB
	 rFPgT46rA8tS4ky/gpbxPNLQXGSOTY1uNY6iAVIaRDJ6zAd9LlnQs86aJyVBntccSTZ3g
	 gCoEVh7MEPxJy1P7ouXf8Dv1nFWzqbUuhAFcaqRRPHoGSsP8LbVeyy5EtWyaGmoYpYshz
	 uKRLwWqNR2NYYDfgFco3CuhS52ISBTKZGsu6HIoAMSU7C01ECsOwQo2NGiS8lGAOLeWj0
	 Qv3YGDpPD+FxjLnyMYBRJgxr6JFsdn+G9aWXMX/i/zfYBGmdRFFadL3lTEoGPiVrHoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096779;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=yhyQj5qvzlEwuLy9qkTVjpW2K1o4aKe/q90l39+t8Zw=;
	b=zqxQh8bJYz+5CrTU74rxwdIWamBjs+hPYf4ieEXCF6Yno9Pcw2grjwavu1ZOe4RwjS4r
	 0kPdm4T7H0kP+lHgFbHrv0evABcvMN4y1BjgxYV0Tj1NOKiKyazEGFY9opzM2VYG6+NQr
	 EVSarh1VeUaYl++gz0sPFzvZQbX3Us7XBWQyKgpUjpH6HDVFHOrnyDqfcAfUGOchcek9x
	 +YmRWd05J88CwGP+BNXbIKaUmZnJXoWV7MuAJYJ5wIAr+HeWgPDQmjFupEvg218vYJRJx
	 qm4ur3Bi20I/FzJ4qabE3c3mjzuWeIlmMIp0PKmSPe0wSF5iFqa0WIuawrns07e+dhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A7D60A2616;
	Tue, 27 Oct 2026 10:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A7D60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMA2f6VBfOBqc6g6AQ--.15041S2;
	Tue, 27 Oct 2026 18:26:09 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S5;
	Tue, 27 Oct 2026 18:26:03 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] docs/zh_CN: add media administrator guide translations
Date: Tue, 27 Oct 2026 18:25:46 +0800
Message-ID: <20261027102552.3801595-4-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027102552.3801595-1-dzm91@hust.edu.cn>
References: <20261027102552.3801595-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMA2f6VBfOBqc6g6AQ--.15041S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoWfWF18tF4rWr4UCr43tr1xGrg_yoW8ZF47Xo
	Wvvw43C3yDA3Z8trWDtr4DAF4UXrsrCrnrZ3yDGr1qkry0g3WUtw1kKw4fGF13ZFW5GF13
	J34rXr45J3WrX3Z8n29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOG7k0a2IF6w1UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xv
	wVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxV
	WUAVWUtwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY
	07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI
	0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw
	1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jhcTQUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Translate the media administrator guide and V4L driver index. Move the
OMAP3 ISP translation from video4linux to its current location and
update it for the English source.

Update the translation through commit 3cd9b7011519
("Documentation: add documentation of AMD isp 4 driver")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../zh_CN/admin-guide/media/index.rst         |  54 ++++
 .../zh_CN/admin-guide/media/omap3isp.rst      |  95 ++++++
 .../zh_CN/admin-guide/media/v4l-drivers.rst   |  44 +++
 .../zh_CN/video4linux/omap3isp.txt            | 277 ------------------
 4 files changed, 193 insertions(+), 277 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/omap3isp.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/media/v4l-drivers.rst
 delete mode 100644 Documentation/translations/zh_CN/video4linux/omap3isp.txt

diff --git a/Documentation/translations/zh_CN/admin-guide/media/index.rst b/Documentation/translations/zh_CN/admin-guide/media/index.rst
new file mode 100644
index 000000000000..80bd1fec7ceb
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/media/index.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+.. include:: <isonum.txt>
+
+
+========================
+媒体子系统管理和用户指南
+========================
+
+本节介绍媒体子系统及其支持的驱动程序的使用方法。
+
+另请参阅：
+
+``Documentation/userspace-api/media/index.rst``
+
+  - 介绍媒体设备使用的用户空间 API。
+
+``Documentation/driver-api/media/index.rst``
+
+  - 介绍媒体设备使用的驱动开发信息及内核 API。
+
+``Documentation/process/debugging/media_specific_debugging_guide.rst``
+
+  - 介绍调试媒体子系统驱动程序所需的基本工具和方法。
+
+.. toctree::
+   :caption: 目录
+   :maxdepth: 2
+   :numbered:
+
+   v4l-drivers
+
+Todolist：
+
+* intro
+* building
+* remote-controller
+* cec
+* dvb
+* cardlist
+* dvb-drivers
+
+**Copyright** |copy| 1999-2020 : LinuxTV Developers
+
+::
+
+  本文档是自由软件；您可以按照自由软件基金会发布的 GNU 通用公共许可证
+  第 2 版，或（由您选择）任何后续版本的条款重新分发和/或修改本文档。
+
+  发布本文档是希望它能够发挥作用，但不提供任何担保；甚至不提供有关
+  适销性或特定用途适用性的默示担保。详情请参阅 GNU 通用公共许可证。
+
+  更多详情请参阅源代码目录中的 COPYING 文件。
diff --git a/Documentation/translations/zh_CN/admin-guide/media/omap3isp.rst b/Documentation/translations/zh_CN/admin-guide/media/omap3isp.rst
new file mode 100644
index 000000000000..6d9c16bdb5ef
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/media/omap3isp.rst
@@ -0,0 +1,95 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+.. include:: <isonum.txt>
+
+:翻译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+:校译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+OMAP 3 图像信号处理器 (ISP) 驱动
+================================
+
+Copyright |copy| 2010 Nokia Corporation
+
+Copyright |copy| 2009 Texas Instruments, Inc.
+
+联系人：Laurent Pinchart <laurent.pinchart@ideasonboard.com>、
+Sakari Ailus <sakari.ailus@iki.fi>、David Cohen <dacohen@gmail.com>
+
+
+简介
+----
+
+本文档介绍位于 ``drivers/media/platform/ti/omap3isp`` 的德州仪器
+OMAP 3 图像信号处理器（ISP）驱动。原始驱动由德州仪器编写，此后在
+诺基亚经过两次重写。
+
+该驱动已成功用于以下 OMAP 3 版本：
+
+- 3430
+- 3530
+- 3630
+
+该驱动实现 V4L2、媒体控制器和 v4l2_subdev 接口，并支持内核中使用
+v4l2_subdev 接口的传感器、镜头及闪光灯驱动。
+
+
+拆分为子设备
+------------
+
+OMAP 3 ISP 被拆分为多个 V4L2 子设备。ISP 内部每个模块均由一个子设备
+表示，每个子设备都向用户空间提供 V4L2 子设备接口。
+
+- OMAP3 ISP CCP2
+- OMAP3 ISP CSI2a
+- OMAP3 ISP CCDC
+- OMAP3 ISP preview
+- OMAP3 ISP resizer
+- OMAP3 ISP AEWB
+- OMAP3 ISP AF
+- OMAP3 ISP histogram
+
+ISP 中每条可能的连接都由媒体控制器接口中的一条连接表示。示例程序参见 [#]_。
+
+
+控制 OMAP 3 ISP
+---------------
+
+通常，对 OMAP 3 ISP 所做的设置会在下一帧开始时生效：传感器的垂直消隐期间，
+模块进入空闲状态，此时应用这些设置。在内存到内存的运行模式下，处理管线每次
+运行一帧，设置在两帧之间应用。
+
+除 CSI-2 及可能的 CCP2 接收器外，ISP 中所有模块都要求接收完整的帧。
+因此，传感器绝不能向 ISP 发送不完整的帧。
+
+至少在 3430 上，某些 ISP 模块的自动空闲功能存在问题。仅当 ``omap3isp``
+模块参数 ``autoidle`` 非零时，才会在 3630 上启用自动空闲功能。
+
+
+技术参考手册（TRM）及其他文档
+--------------------------------
+
+OMAP 3430 TRM：
+<URL:http://focus.ti.com/pdfs/wtbu/OMAP34xx_ES3.1.x_PUBLIC_TRM_vZM.zip>
+引用日期：2011-03-05。
+
+OMAP 35xx TRM：
+<URL:http://www.ti.com/litv/pdf/spruf98o> 引用日期：2011-03-05。
+
+OMAP 3630 TRM：
+<URL:http://focus.ti.com/pdfs/wtbu/OMAP36xx_ES1.x_PUBLIC_TRM_vQ.zip>
+引用日期：2011-03-05。
+
+DM 3730 TRM：
+<URL:http://www.ti.com/litv/pdf/sprugn4h> 引用日期：2011-03-06。
+
+
+参考资料
+--------
+
+.. [#] http://git.ideasonboard.org/?p=media-ctl.git;a=summary
diff --git a/Documentation/translations/zh_CN/admin-guide/media/v4l-drivers.rst b/Documentation/translations/zh_CN/admin-guide/media/v4l-drivers.rst
new file mode 100644
index 000000000000..579ba0d2da81
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/media/v4l-drivers.rst
@@ -0,0 +1,44 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+.. _uapi-v4l-drivers-zh:
+
+==============================
+Video4Linux (V4L) 驱动专用文档
+==============================
+
+.. toctree::
+   :maxdepth: 2
+
+   omap3isp
+
+Todolist：
+
+* amdisp4-1
+* bttv
+* c3-isp
+* cafe_ccic
+* cx88
+* fimc
+* imx
+* imx7
+* ipu3
+* ipu6-isys
+* ivtv
+* mali-c55
+* mgb4
+* philips
+* qcom_camss
+* raspberrypi-pisp-be
+* rcar-fdp1
+* rkcif
+* rkisp1
+* raspberrypi-rp1-cfe
+* saa7134
+* si470x
+* si4713
+* si476x
+* vimc
+* visl
+* vivid
diff --git a/Documentation/translations/zh_CN/video4linux/omap3isp.txt b/Documentation/translations/zh_CN/video4linux/omap3isp.txt
deleted file mode 100644
index 75e481985630..000000000000
--- a/Documentation/translations/zh_CN/video4linux/omap3isp.txt
+++ /dev/null
@@ -1,277 +0,0 @@
-Chinese translated version of Documentation/admin-guide/media/omap3isp.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
-Maintainer: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-	  Sakari Ailus <sakari.ailus@iki.fi>
-	  David Cohen <dacohen@gmail.com>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
----------------------------------------------------------------------
-Documentation/admin-guide/media/omap3isp.rst 的中文翻译
-
-如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
-交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者。
-英文版维护者： Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-	  Sakari Ailus <sakari.ailus@iki.fi>
-	  David Cohen <dacohen@gmail.com>
-中文版维护者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-中文版翻译者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-中文版校译者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-
-
-以下为正文
----------------------------------------------------------------------
-OMAP 3 图像信号处理器 (ISP) 驱动
-
-Copyright (C) 2010 Nokia Corporation
-Copyright (C) 2009 Texas Instruments, Inc.
-
-联系人: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-	  Sakari Ailus <sakari.ailus@iki.fi>
-	  David Cohen <dacohen@gmail.com>
-
-
-介绍
-===
-
-本文档介绍了由 drivers/media/video/omap3isp 加载的德州仪器
-（TI）OMAP 3 图像信号处理器 (ISP) 驱动。原始驱动由德州仪器（TI）
-编写，但此后由诺基亚重写了两次。
-
-驱动已在以下 OMAP 3 系列的芯片中成功使用：
-
-	3430
-	3530
-	3630
-
-驱动实现了 V4L2、媒体控制器和 v4l2_subdev 接口。支持内核中使用
-v4l2_subdev 接口的传感器、镜头和闪光灯驱动。
-
-
-拆分为子设备
-==========
-
-OMAP 3 ISP 被拆分为 V4L2 子设备，ISP中的每个模块都由一个子设备
-来表示。每个子设备向用户空间提供一个 V4L2 子设备接口。
-
-	OMAP3 ISP CCP2
-	OMAP3 ISP CSI2a
-	OMAP3 ISP CCDC
-	OMAP3 ISP preview
-	OMAP3 ISP resizer
-	OMAP3 ISP AEWB
-	OMAP3 ISP AF
-	OMAP3 ISP histogram
-
-ISP 中每个可能的连接都通过一个链接嵌入到媒体控制器接口中。详见例程 [2]。
-
-
-控制 OMAP 3 ISP
-==============
-
-通常，对 OMAP 3 ISP 的配置会在下一帧起始时生效。在传感器垂直消隐期间，
-模块变为空闲时完成配置。在内存到内存的操作中，视频管道一次处理一帧。
-应用配置应在帧间完成。
-
-ISP 中的所有模块，除 CSI-2 和 （可能存在的）CCP2 接收器外，都必须
-接收完整的帧数据。因此，传感器必须保证从不发送部分帧数据给ISP。
-
-Autoidle（自动空闲）功能至少在 3430 的 ISP 模块中确实存在一些问题。
-当 omap3isp 模块参数 autoidle 非零时，autoidle（自动空闲）功能
-仅在 3630 中启用了。
-
-
-事件机制
-======
-
-OMAP 3 ISP 驱动在 CCDC 和统计（AEWB、AF 和 直方图）子设备中支持
-V4L2 事件机制接口。
-
-CCDC 子设备通过 HS_VS 中断，处理 V4L2_EVENT_FRAME_SYNC 类型
-事件，用于告知帧起始。早期版本的驱动则使用 V4L2_EVENT_OMAP3ISP_HS_VS。
-当在 CCDC 模块中接收到起始帧的第一行时，会准确地触发事件。这个事件
-可以在 CCDC 子设备中“订阅”。
-
-（当使用并行接口时，必须注意正确地配置 VS 信号极性。而当使用串行接收时
-这个会自动校正。）
-
-每个统计子设备都可以产生事件。每当一个统计缓冲区可由用户空间应用程序
-通过 VIDIOC_OMAP3ISP_STAT_REQ IOCTL 操作获取时，就会产生一个
-事件。当前存在以下事件：
-
-	V4L2_EVENT_OMAP3ISP_AEWB
-	V4L2_EVENT_OMAP3ISP_AF
-	V4L2_EVENT_OMAP3ISP_HIST
-
-这些 ioctl 的事件数据类型为 struct omap3isp_stat_event_status
-结构体。如果出现计算错误的统计，也同样会产生一个事件，但没有相关的统计
-数据缓冲区。这种情况下 omap3isp_stat_event_status.buf_err 会被
-设置为非零值。
-
-
-私有 IOCTL
-==========
-
-OMAP 3 ISP 驱动支持标准的 V4L2 IOCTL 以及可能存在且实用的控制。但
-ISP 提供的许多功能都不在标准 IOCTL 之列，例如 gamma（伽马）表和统计
-数据采集配置等。
-
-通常，会有一个私有 ioctl 用于配置每个包含硬件依赖功能的模块。
-
-支持以下私有 IOCTL：
-
-	VIDIOC_OMAP3ISP_CCDC_CFG
-	VIDIOC_OMAP3ISP_PRV_CFG
-	VIDIOC_OMAP3ISP_AEWB_CFG
-	VIDIOC_OMAP3ISP_HIST_CFG
-	VIDIOC_OMAP3ISP_AF_CFG
-	VIDIOC_OMAP3ISP_STAT_REQ
-	VIDIOC_OMAP3ISP_STAT_EN
-
-在 include/linux/omap3isp.h 中描述了这些 ioctl 使用的参数结构体。
-与特定 ISP 模块相关的 ISP 自身的详细功能在技术参考手册 (TRMs)中有
-描述，详见文档结尾。
-
-虽然在不使用任何私有 IOCTL 的情况下使用 ISP 驱动是可能的，但这样无法
-获得最佳的图像质量。AEWB、AF 和 直方图（译者注：一般用于自动曝光和增益
-控制，以及图像均衡等）模块无法在未使用适当的私有 IOCTL 配置的情况下使用。
-
-
-CCDC 和 preview（预览）模块 IOCTL
-===============================
-
-VIDIOC_OMAP3ISP_CCDC_CFG 和 VIDIOC_OMAP3ISP_PRV_CFG IOCTL
-被分别用于配置、启用和禁用 CCDC 和 preview（预览）模块的功能。在它们
-所控制的模块中，两个 IOCTL 控制多种功能。VIDIOC_OMAP3ISP_CCDC_CFG IOCTL
-接受一个指向 omap3isp_ccdc_update_config 结构体的指针作为它的参数。
-同样的，VIDIOC_OMAP3ISP_PRV_CFG 接受一个指向 omap3isp_prev_update_config
-结构体的指针。以上两个结构体定义位于 [1]。
-
-这些结构体中的 update 域标识是否针对指定的功能更新配置，而 flag 域
-则标识是启用还是禁用此功能。
-
-update 和 flag 位接受以下掩码值。CCDC 和 preview（预览）模块的
-每个单独功能都与一个 flag 关联（禁用或启用；在结构体中 flag 域的
-一部分）和一个指向功能配置数据的指针。
-
-对于 VIDIOC_OMAP3ISP_CCDC_CFG，下面列出了 update 和 flag 域
-中的有效值。 这些值可能会在同一个 IOCTL 调用中配置多个功能。
-
-        OMAP3ISP_CCDC_ALAW
-        OMAP3ISP_CCDC_LPF
-        OMAP3ISP_CCDC_BLCLAMP
-        OMAP3ISP_CCDC_BCOMP
-        OMAP3ISP_CCDC_FPC
-        OMAP3ISP_CCDC_CULL
-        OMAP3ISP_CCDC_CONFIG_LSC
-        OMAP3ISP_CCDC_TBL_LSC
-
-针对 VIDIOC_OMAP3ISP_PRV_CFG 的相应值如下：
-
-        OMAP3ISP_PREV_LUMAENH
-        OMAP3ISP_PREV_INVALAW
-        OMAP3ISP_PREV_HRZ_MED
-        OMAP3ISP_PREV_CFA
-        OMAP3ISP_PREV_CHROMA_SUPP
-        OMAP3ISP_PREV_WB
-        OMAP3ISP_PREV_BLKADJ
-        OMAP3ISP_PREV_RGB2RGB
-        OMAP3ISP_PREV_COLOR_CONV
-        OMAP3ISP_PREV_YC_LIMIT
-        OMAP3ISP_PREV_DEFECT_COR
-        OMAP3ISP_PREV_GAMMABYPASS
-        OMAP3ISP_PREV_DRK_FRM_CAPTURE
-        OMAP3ISP_PREV_DRK_FRM_SUBTRACT
-        OMAP3ISP_PREV_LENS_SHADING
-        OMAP3ISP_PREV_NF
-        OMAP3ISP_PREV_GAMMA
-
-在启用某个功能的时候，相关的配置数据指针不可为 NULL。在禁用某个功能时，
-配置数据指针会被忽略。
-
-
-统计模块 IOCTL
-=============
-
-统计子设备相较于其他子设备提供了更多动态配置选项。在图像处理流水线处于
-工作状态时，它们可以被启用、禁用和重配。
-
-统计模块总是从 CCDC 中获取输入的图像数据（由于直方图内存读取未实现）。
-统计数据可由用户通过统计子设备节点使用私有 IOCTL 获取。
-
-AEWB、AF 和 直方图子设备提供的私有 IOCTL 极大程度上反应了 ISP 硬件
-提供的寄存器级接口。有些方面纯粹和驱动程序的实现相关，这些将在下面讨论。
-
-VIDIOC_OMAP3ISP_STAT_EN
------------------------
-
-这个私有 IOCTL 启用/禁用 一个统计模块。如果这个申请在视频流启动前完成，
-它将在视频流水线开始工作时生效。如果视频流水线已经处于工作状态了，它将在
-CCDC 变为空闲时生效。
-
-VIDIOC_OMAP3ISP_AEWB_CFG, VIDIOC_OMAP3ISP_HIST_CFG and VIDIOC_OMAP3ISP_AF_CFG
------------------------------------------------------------------------------
-
-这些 IOCTL 用于配置模块。它们要求用户应用程序对硬件有深入的认识。对
-大多数域的解释可以在 OMAP 的 TRM 中找到。以下两个域对于以上所有的
-私有 IOCTL 配置都很常见，由于他们没有在 TRM 中提及，故需要对其有
-更好的认识。
-
-omap3isp_[h3a_af/h3a_aewb/hist]_config.buf_size:
-
-模块在内部处理自身缓冲。对模块数据输出所必需的缓存大小依赖于已申请的配置。
-虽然驱动支持在视频流工作时重新配置，但对于所需缓存量大于模块启用时内部
-所分配数量的情况，则不支持重新配置。在这种情况下将返回 -EBUSY。为了避免
-此类状况，无论是禁用/重配/启用模块，还是第一次配置时申请必须的缓存大小，
-都应在模块禁用的情况下进行。
-
-内部缓冲分配的大小需综合考虑所申请配置的最小缓存量以及 buf_size 域中
-所设的值。如果 buf_size 域在[minimum（最小值）, maximum（最大值）]
-缓冲大小范围之外，则应该将其调整到其范围中。驱动则会选择最大值。正确的
-buf_size 值将回写到用户应用程序中。
-
-omap3isp_[h3a_af/h3a_aewb/hist]_config.config_counter:
-
-由于配置并未在申请之后同步生效，驱动必须提供一个跟踪这类信息的方法，
-以提供更准确的数据。在一个配置被申请之后，返回到用户空间应用程序的
-config_counter 是一个与其配置相关的唯一值。当用户应用程序接收到
-一个缓冲可用或一个新的缓冲申请事件时，这个 config_counter 用于
-一个缓冲数据和一个配置的匹配。
-
-VIDIOC_OMAP3ISP_STAT_REQ
-------------------------
-
-将内部缓冲队列中最早的数据发送到用户空间，然后丢弃此缓冲区。
-omap3isp_stat_data.frame_number 域与视频缓冲的 field_count
-域相匹配。
-
-
-技术参考手册 (TRMs) 和其他文档
-==========================
-
-OMAP 3430 TRM:
-<URL:http://focus.ti.com/pdfs/wtbu/OMAP34xx_ES3.1.x_PUBLIC_TRM_vZM.zip>
-参考于 2011-03-05.
-
-OMAP 35xx TRM:
-<URL:http://www.ti.com/litv/pdf/spruf98o> 参考于 2011-03-05.
-
-OMAP 3630 TRM:
-<URL:http://focus.ti.com/pdfs/wtbu/OMAP36xx_ES1.x_PUBLIC_TRM_vQ.zip>
-参考于 2011-03-05.
-
-DM 3730 TRM:
-<URL:http://www.ti.com/litv/pdf/sprugn4h> 参考于 2011-03-06.
-
-
-参考资料
-=======
-
-[1] include/linux/omap3isp.h
-
-[2] http://git.ideasonboard.org/?p=media-ctl.git;a=summary
-- 
2.51.0

