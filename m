Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793096784;
	b=foxM3eIRsxFs4HPNsyKYyb2FZSLJ0kAVW0wA9MHOHGzkU7vSciAJBwV0rR+jyyBC/3E0
	 6z+9B+JD+G7S484QTi3SYORTVUiOQ8mqe3W3GqfwPi6PhghqttQlRyx3h/hsoxlwEElOf
	 XQs4hZNcpH8d/CYmnRYcEIeubDqhopIBZc9nvTwwssikJaL8GAK84LhrZk3TL1tADlRGZ
	 QEPH+KKsmCuvztoxj79KhfdXGglMpOK87tzZMnXvj4ZtjtAjaQqKj6Gwb4d91MR2wb/YV
	 7KogCOQq9nK/Blq+AtutMrNVU8oFzUSPfRmxhdm6HtdB7XH7hmXrBASG5wE/Ld5BAxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793096784;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ZfWsfQXy8/vDymkFG07zjP8zxmXwki0fgqaUeXe6d48=;
	b=FTDxn/7ZHIksiSzhs1nJCogptrpOKw/k/9NgoPZnnrVe0SanIuH/x7rceAO5nacpe5S6
	 iqnx6ObTa1UFrtHoaz1JERmpfr9QvUNIhB0TO4IH7ComInpJr+SSIZh/QAYN+lECaEMpL
	 /z9gU5/DMrdm3h+AUmkLwfNo3uarNexqihmdq9xflIX1w5iWMSO5ss06N3Z69KghXdq3x
	 RjBv8KiJhNt8dU+mWqN8TYImeK6wpkZfWZKJHeYyAw2oFK9Nku9ajXIkXDhF6b5Ec5hn3
	 Xk1xzr7GHLC1ZbrMydG4X/J9Mo/Dfpz/vZtvXTjUchv1NdvCMhZiEFGCI/HxLFnIrDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB66606A33B;
	Tue, 27 Oct 2026 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB66606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCWvndHfOBqSTZfAA--.52784S2;
	Tue, 27 Oct 2026 18:26:15 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXseYwfOBq0WPDAA--.19105S8;
	Tue, 27 Oct 2026 18:26:13 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] docs/zh_CN: reorganize media driver API translations
Date: Tue, 27 Oct 2026 18:25:49 +0800
Message-ID: <20261027102552.3801595-7-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMCWvndHfOBqSTZfAA--.52784S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoWDZw1UtryUuFy5tF1rCFW3Wrg_yoWkXF45Ao
	Wa9rZxuwnayw43Ja4FyayfJrWDGrn8CFs7Z3WxJr98C345CF15G3Z7Cr43GF1fA395Cr13
	A34fZ3yru3WUJa1xn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYD7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xv
	wVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxV
	WUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VACjcxG62k0Y48FwI0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262
	k0Y48FwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK6svPMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxAIcVC0I7IYx2IY67AKxVW5JVW7Jw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x07bx5rxUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Split the legacy V4L2 framework translation into the current media
driver API pages and update the driver API index to link them.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/driver-api/index.rst   | 232 +++--
 .../zh_CN/driver-api/media/index.rst          |  52 +
 .../zh_CN/driver-api/media/v4l2-core.rst      |  36 +
 .../zh_CN/driver-api/media/v4l2-dev.rst       | 286 ++++++
 .../zh_CN/driver-api/media/v4l2-device.rst    | 127 +++
 .../zh_CN/driver-api/media/v4l2-event.rst     | 124 +++
 .../zh_CN/driver-api/media/v4l2-fh.rst        | 123 +++
 .../zh_CN/driver-api/media/v4l2-intro.rst     |  75 ++
 .../zh_CN/driver-api/media/v4l2-subdev.rst    | 491 +++++++++
 .../zh_CN/video4linux/v4l2-framework.txt      | 958 ------------------
 10 files changed, 1448 insertions(+), 1056 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/index.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-core.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-dev.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-device.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-event.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-fh.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-intro.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/media/v4l2-subdev.rst
 delete mode 100644 Documentation/translations/zh_CN/video4linux/v4l2-framework.txt

diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
index 4050a2fb51c6..ed25f0a11b01 100644
--- a/Documentation/translations/zh_CN/driver-api/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -2,8 +2,6 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/driver-api/index.rst
-
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
@@ -17,109 +15,147 @@ Linux驱动实现者的API指南
 内核提供了各种各样的接口来支持设备驱动的开发。这份文档只是对其中一些接口进行了
 一定程度的整理——希望随着时间的推移，它能变得更好！可用的小节可以在下面看到。
 
+驱动程序作者的一般信息
+======================
+
+本节收录的文档，在设备驱动开发过程中大多会有用处。
+
+Todolist:
+
+* basics
+* driver-model/index
+* device_link
+* infrastructure
+* ioctl
+* pm/index
+
+实用的支持库
+============
+
+本节收录的文档，在设备驱动开发过程中大多会有用处。
+
 .. toctree::
-   :caption: 目录列表
-   :maxdepth: 2
+   :maxdepth: 1
 
-   gpio/index
    io_ordering
+
+Todolist:
+
+* early-userspace/index
+* connector
+* device-io
+* devfreq
+* dma-buf
+* component
+* io-mapping
+* uio-howto
+* vfio-mediated-device
+* vfio
+* vfio-pci-device-specific-driver-acceptance
+
+总线级文档
+==========
+
+Todolist:
+
+* auxiliary_bus
+* cxl/index
+* eisa
+* firewire
+* i3c/index
+* isa
+* men-chameleon-bus
+* pci/index
+* rapidio/index
+* slimbus
+* usb/index
+* virtio/index
+* vme
+* w1
+* xillybus
+
+特定子系统的 API
+================
+
+.. toctree::
+   :maxdepth: 1
+
+   gpio/index
+   media/index
    phy/index
 
 Todolist:
 
-*   driver-model/index
-*   basics
-*   infrastructure
-*   ioctl
-*   early-userspace/index
-*   pm/index
-*   clk
-*   device-io
-*   dma-buf
-*   device_link
-*   component
-*   message-based
-*   infiniband
-*   aperture
-*   frame-buffer
-*   regulator
-*   reset
-*   iio/index
-*   input
-*   usb/index
-*   firewire
-*   pci/index
-*   cxl/index
-*   spi
-*   i2c
-*   ipmb
-*   ipmi
-*   i3c/index
-*   interconnect
-*   devfreq
-*   hsi
-*   edac
-*   scsi
-*   libata
-*   target
-*   mailbox
-*   mtdnand
-*   miscellaneous
-*   mei/index
-*   mtd/index
-*   mmc/index
-*   nvdimm/index
-*   w1
-*   rapidio/index
-*   s390-drivers
-*   vme
-*   80211/index
-*   uio-howto
-*   firmware/index
-*   pin-control
-*   md/index
-*   media/index
-*   misc_devices
-*   nfc/index
-*   dmaengine/index
-*   slimbus
-*   soundwire/index
-*   thermal/index
-*   fpga/index
-*   acpi/index
-*   auxiliary_bus
-*   backlight/lp855x-driver.rst
-*   connector
-*   console
-*   dcdbas
-*   eisa
-*   isa
-*   isapnp
-*   io-mapping
-*   generic-counter
-*   memory-devices/index
-*   men-chameleon-bus
-*   ntb
-*   nvmem
-*   parport-lowlevel
-*   pps
-*   ptp
-*   pwm
-*   pldmfw/index
-*   rfkill
-*   serial/index
-*   sm501
-*   surface_aggregator/index
-*   switchtec
-*   sync_file
-*   tty/index
-*   vfio-mediated-device
-*   vfio
-*   vfio-pci-device-specific-driver-acceptance
-*   xilinx/index
-*   xillybus
-*   zorro
-*   hte/index
+* 80211/index
+* acpi/index
+* backlight/lp855x-driver.rst
+* clk
+* coco/index
+* console
+* crypto/index
+* dmaengine/index
+* dpll
+* edac
+* extcon
+* firmware/index
+* fpga/index
+* frame-buffer
+* aperture
+* generic-counter
+* generic_pt
+* hsi
+* hte/index
+* hw-recoverable-errors
+* i2c
+* iio/index
+* infiniband
+* input
+* interconnect
+* ipmb
+* ipmi
+* issei/index
+* libata
+* mailbox
+* md/index
+* mei/index
+* memory-devices/index
+* message-based
+* misc_devices
+* miscellaneous
+* mmc/index
+* mtd/index
+* mtdnand
+* nfc/index
+* ntb
+* nvdimm/index
+* nvmem
+* parport-lowlevel
+* pin-control
+* pldmfw/index
+* pps
+* ptp
+* pwm
+* pwrseq
+* regulator
+* reset
+* rfkill
+* s390-drivers
+* scsi
+* serial/index
+* sm501
+* soundwire/index
+* spi
+* surface_aggregator/index
+* switchtec
+* sync_file
+* target
+* tee
+* thermal/index
+* tty/index
+* wbrf
+* wmi
+* xilinx/index
+* zorro
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/driver-api/media/index.rst b/Documentation/translations/zh_CN/driver-api/media/index.rst
new file mode 100644
index 000000000000..a5645a14f1bd
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/index.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+.. include:: <isonum.txt>
+
+
+======================
+媒体子系统内核内部 API
+======================
+
+本节介绍媒体子系统及其支持的驱动程序的使用方法。
+
+另请参阅：
+
+``Documentation/admin-guide/media/index.rst``
+
+  - 介绍媒体子系统及其支持的驱动程序的使用方法。
+
+``Documentation/userspace-api/media/index.rst``
+
+  - 介绍媒体设备的用户空间 API。
+
+.. toctree::
+   :caption: 目录
+   :maxdepth: 5
+   :numbered:
+
+   v4l2-core
+
+Todolist：
+
+* maintainer-entry-profile
+* media-committers
+* dtv-core
+* rc-core
+* mc-core
+* cec-core
+* tx-rx
+* camera-sensor
+* drivers/index
+
+**Copyright** |copy| 2009-2020 : LinuxTV Developers
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
diff --git a/Documentation/translations/zh_CN/driver-api/media/v4l2-core.rst b/Documentation/translations/zh_CN/driver-api/media/v4l2-core.rst
new file mode 100644
index 000000000000..9e7414a51dd5
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/v4l2-core.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+
+Video4Linux 设备
+----------------
+
+.. toctree::
+   :maxdepth: 1
+
+   v4l2-intro
+   v4l2-dev
+   v4l2-device
+   v4l2-fh
+   v4l2-subdev
+   v4l2-event
+
+Todolist：
+
+* v4l2-controls
+* v4l2-videobuf2
+* v4l2-dv-timings
+* v4l2-flash-led-class
+* v4l2-mc
+* v4l2-mediabus
+* v4l2-mem2mem
+* v4l2-async
+* v4l2-fwnode
+* v4l2-cci
+* v4l2-rect
+* v4l2-tuner
+* v4l2-common
+* v4l2-tveeprom
+* v4l2-jpeg
+* v4l2-isp
diff --git a/Documentation/translations/zh_CN/driver-api/media/v4l2-dev.rst b/Documentation/translations/zh_CN/driver-api/media/v4l2-dev.rst
new file mode 100644
index 000000000000..805a7e197a68
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/v4l2-dev.rst
@@ -0,0 +1,286 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:翻译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+:校译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+视频设备的内部表示
+==================
+
+在 /dev 目录下的实际设备节点根据 video_device 结构体(v4l2-dev.h)
+创建。此结构体既可以动态分配也可以嵌入到一个更大的结构体中。
+
+动态分配方法如下::
+
+	struct video_device *vdev = video_device_alloc();
+
+	if (vdev == NULL)
+		return -ENOMEM;
+
+	vdev->release = video_device_release;
+
+如果将其嵌入到一个大结构体中，则必须自己实现 release()回调。 ::
+
+	struct video_device *vdev = &my_vdev->vdev;
+
+	vdev->release = my_vdev_release;
+
+release()回调必须被设置，且在最后一个 video_device 用户退出之后
+被调用。
+
+默认的 video_device_release()回调只是调用 kfree 来释放之前分配的
+内存。
+
+如果 ``video_device`` 嵌入在其他结构体中，而且释放时无须执行操作，
+可以使用空实现 ``video_device_release_empty()``。
+
+你应该设置这些域：
+
+- v4l2_dev: 设置为 v4l2_device 父设备。
+
+- name: 设置为唯一的描述性设备名。
+
+- vfl_dir: 采集设备设为 ``VFL_DIR_RX``（值为 0，通常已是默认值）；
+  输出设备设为 ``VFL_DIR_TX``；内存到内存的编解码设备设为
+  ``VFL_DIR_M2M``。
+
+- fops: 设置为已有的 v4l2_file_operations 结构体。
+
+- ioctl_ops: 如果你使用v4l2_ioctl_ops 来简化 ioctl 的维护
+  (强烈建议使用，且将来可能变为强制性的!)，然后设置你自己的
+  v4l2_ioctl_ops 结构体。``vfl_type`` 和 ``vfl_dir`` 会用来禁用
+  与设备类型或方向不符的操作，例如在非 VBI 节点上禁用 VBI 操作，
+  在采集设备上禁用输出操作。这样，VBI 和视频节点就可以共用一份
+  ``v4l2_ioctl_ops`` 结构体。
+
+- lock: 如果你要在驱动中实现所有的锁操作，则设为 NULL 。否则
+  就要设置一个指向 struct mutex 结构体的指针，这个锁将
+  在 unlocked_ioctl 文件操作被调用前由内核获得，并在调用返回后
+  释放。详见下一节。
+
+- queue: 指向与该设备节点关联的 ``vb2_queue``。如果 ``queue`` 和
+  ``queue->lock`` 都非 ``NULL``，缓冲区队列相关的 ioctl 将使用
+  ``queue->lock``，而非上述 ``video_device`` 锁。这些操作包括
+  ``VIDIOC_REQBUFS``、``CREATE_BUFS``、``QBUF``、``DQBUF``、
+  ``QUERYBUF``、``PREPARE_BUF``、``STREAMON`` 和 ``STREAMOFF``。
+  这样 videobuf2 队列无需等待其他 ioctl。辅助函数也通过该队列指针
+  检查文件句柄是否有权操作队列。
+
+- prio: 跟踪优先级，用于实现 ``VIDIOC_G_PRIORITY`` 和
+  ``VIDIOC_S_PRIORITY``。如果
+  设置为 NULL，则会使用 v4l2_device 中的 v4l2_prio_state 结构体。
+  如果要对每个设备节点（组）实现独立的优先级，可以将其指向自己
+  实现的 v4l2_prio_state 结构体。
+
+- dev_parent: 仅在使用 NULL 作为父设备结构体参数注册 v4l2_device 时
+  设置此参数。只有在一个硬件设备包含多个 PCI 设备，共享同一个
+  v4l2_device 核心时才会发生。
+
+  cx88 驱动就是一个例子：一个 v4l2_device 结构体核心，被一个裸的
+  视频 PCI 设备(cx8800)和一个 MPEG PCI 设备(cx8802)共用。由于
+  v4l2_device 无法与特定的 PCI 设备关联，所以没有设置父设备。但当
+  video_device 配置后，就知道使用哪个父 PCI 设备了，此时应将
+  ``dev_parent`` 设为正确的 PCI 设备。
+
+如果你使用 v4l2_ioctl_ops，则应该在 v4l2_file_operations 结构体中
+设置 .unlocked_ioctl 指向 video_ioctl2。
+
+某些情况下你要告诉核心：你在 v4l2_ioctl_ops 指定的某个函数应被忽略。
+你可以在 video_register_device 被调用前通过以下函数标记这些 ioctl::
+
+    void v4l2_disable_ioctl(struct video_device *vdev, unsigned int cmd);
+
+基于外部因素（例如某个板卡已被使用），在不创建新结构体的情况下，你想
+要关闭 v4l2_ioctl_ops 中某个特性往往需要这个机制。
+
+v4l2_file_operations 结构体是 file_operations 的一个子集。其主要
+区别在于：因 inode 参数从未被使用，它将被忽略。
+
+如果需要与媒体框架整合，你必须通过调用 media_entity_pads_init() 初始化
+嵌入在 video_device 结构体中的 media_entity（entity 域）结构体::
+
+	struct media_pad *pad = &my_vdev->pad;
+	int err;
+
+	err = media_entity_pads_init(&vdev->entity, 1, pad);
+
+pads 数组必须预先初始化。没有必要手动设置 media_entity 的 type 和
+name 域。
+
+当视频设备被打开或关闭时，对 entity 的引用将被自动获取或释放。
+
+ioctl 与锁
+----------
+
+V4L 核心提供可选的锁服务。``video_device`` 的 ``lock`` 字段指向
+一个互斥锁；设置后，``unlocked_ioctl`` 会用它串行化所有 ioctl。
+
+使用 videobuf2 框架时，还可以设置 ``video_device->queue->lock``。
+设置后，缓冲区队列 ioctl 使用这个锁，而非 ``video_device->lock``；
+队列 ioctl 的完整列表见前文。对于某些驱动，尤其是 USB 驱动，设置控制项
+等命令可能耗时较长。使用独立的队列锁，可以避免摄像头正在调整曝光时
+``VIDIOC_DQBUF`` 被这些命令阻塞。
+
+也可以把两个锁指针都设为 ``NULL``，由驱动自行实现全部锁定。
+使用 videobuf2 时，``queue->lock`` 必须指向用于串行化队列 ioctl
+的锁。这样，在 ``VIDIOC_DQBUF`` 等待缓冲区到来时，可以先释放该锁，
+然后重新获取。
+
+热插拔设备断开时，应先取得 ``video_device`` 的锁，再调用
+``v4l2_device_disconnect()``。若还使用了 ``queue->lock``，则须
+先锁定 ``queue->lock``，再锁定 ``video_device->lock``。这能保证
+调用断开函数时没有 ioctl 正在执行。
+
+video_device注册
+----------------
+
+接下来你需要注册视频设备：这会为你创建一个字符设备。 ::
+
+	err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
+	if (err) {
+		video_device_release(vdev); /* or kfree(my_vdev); */
+		return err;
+	}
+
+如果 v4l2_device 父设备的 mdev 域为非 NULL 值，视频设备实体将自动
+注册为媒体设备。
+
+注册哪种设备是根据类型（type）参数。存在以下类型：
+
+* ``VFL_TYPE_VIDEO``：视频输入/输出设备，节点名为 ``/dev/videoX``。
+* ``VFL_TYPE_VBI``：垂直消隐数据设备，例如隐藏式字幕和图文电视，
+  节点名为 ``/dev/vbiX``。
+* ``VFL_TYPE_RADIO``：广播调谐器，节点名为 ``/dev/radioX``。
+* ``VFL_TYPE_SUBDEV``：V4L2 子设备，节点名为 ``/dev/v4l-subdevX``。
+* ``VFL_TYPE_SDR``：软件定义无线电调谐器，节点名为 ``/dev/swradioX``。
+* ``VFL_TYPE_TOUCH``：触摸传感器，节点名为 ``/dev/v4l-touchX``。
+
+最后一个参数让你确定一个所控制设备的设备节点号数量(例如 videoX 中的 X)。
+通常你可以传入-1，让 v4l2 框架自己选择第一个空闲的编号。但是有时用户
+需要选择一个特定的节点号。驱动允许用户通过驱动模块参数选择一个特定的
+设备节点号是很普遍的。这个编号将会传递给这个函数，且 video_register_device
+将会试图选择这个设备节点号。如果这个编号被占用，下一个空闲的设备节点
+编号将被选中，并向内核日志中发送一个警告信息。
+
+另一个使用场景是当驱动创建多个设备时。这种情况下，对不同的视频设备在
+编号上使用不同的范围是很有用的。例如，视频捕获设备从 0 开始，视频
+输出设备从 16 开始。所以你可以使用最后一个参数来指定设备节点号最小值，
+而 v4l2 框架会试图选择第一个的空闲编号（等于或大于你提供的编号）。
+如果失败，则会选择第一个空闲的编号。
+
+由于这种情况下，你会忽略无法选择特定设备节点号的警告，则可调用
+video_register_device_no_warn() 函数避免警告信息的产生。
+
+只要设备节点被创建，一些属性也会同时创建。在 /sys/class/video4linux
+目录中你会找到这些设备。例如进入其中的 video0 目录，你会看到
+``name``、``dev_debug`` 和 ``index`` 属性。``name`` 属性值就是
+video_device 结构体中的 ``name`` 域；``dev_debug`` 可用来启用
+核心调试，详见下一节。
+
+‘index’属性值就是设备节点的索引值：每次调用 video_register_device()，
+索引值都递增 1 。第一个视频设备节点总是从索引值 0 开始。
+
+用户可以设置 udev 规则，利用索引属性生成花哨的设备名（例如：用‘mpegX’
+代表 MPEG 视频捕获设备节点）。
+
+在设备成功注册后，就可以使用这些域：
+
+- vfl_type: 传递给 video_register_device 的设备类型。
+- minor: 已指派的次设备号。
+- num: 设备节点编号 (例如 videoX 中的 X)。
+- index: 设备索引号。
+
+如果注册失败，你必须调用 video_device_release() 来释放已分配的
+video_device 结构体；如果 video_device 是嵌入在自己创建的结构体中，
+你也必须释放它。vdev->release() 回调不会在注册失败之后被调用，
+你也不应试图在注册失败后注销设备。
+
+视频设备调试
+------------
+
+每个视频、VBI、广播或软件定义无线电设备都在
+``/sys/class/video4linux/<devX>/`` 下具有 ``dev_debug`` 属性。
+它是一个位掩码，可启用文件操作日志：
+
+* ``0x01``：记录 ioctl 名称和错误码；仅在同时设置 ``0x08`` 时
+  记录 ``VIDIOC_(D)QBUF``。
+* ``0x02``：记录 ioctl 名称、参数和错误码；
+  ``VIDIOC_(D)QBUF`` 同样需要 ``0x08``。
+* ``0x04``：记录 ``open``、``release``、``read``、``write``、
+  ``mmap`` 和 ``get_unmapped_area`` 文件操作；``read`` 和
+  ``write`` 还需要 ``0x08``。
+* ``0x08``：记录 ``read``、``write``、``VIDIOC_QBUF`` 和
+  ``VIDIOC_DQBUF``。
+* ``0x10``：记录 ``poll`` 操作。
+* ``0x20``：记录控制操作中的错误和消息。
+
+
+video_device 注销
+-----------------
+
+当视频设备节点已被移除，不论是卸载驱动还是USB设备断开，你都应注销
+它们::
+
+	video_unregister_device(vdev);
+
+这个操作将从 sysfs 中移除设备节点（导致 udev 将其从 /dev 中移除）。
+
+video_unregister_device() 返回之后，就无法完成打开操作。尽管如此，
+USB 设备的情况则不同，某些应用程序可能依然打开着其中一个已注销设备
+节点。所以在注销之后，所有文件操作（当然除了 release ）也应返回错误值。
+
+当最后一个视频设备节点的用户退出，则 vdev->release() 回调会被调用，
+并且你可以做最后的清理操作。
+
+不要忘记清理与视频设备相关的媒体入口（如果被初始化过）：
+
+	media_entity_cleanup(&vdev->entity);
+
+这可以在 release 回调中完成。
+
+
+video_device 辅助函数
+---------------------
+
+一些有用的辅助函数如下：
+
+- file/video_device 私有数据
+
+你可以用以下函数在 video_device 结构体中设置/获取驱动私有数据::
+
+    void *video_get_drvdata(struct video_device *vdev);
+    void video_set_drvdata(struct video_device *vdev, void *data);
+
+注意：在调用 video_register_device() 前执行 video_set_drvdata()
+是安全的。
+
+而以下函数::
+
+    struct video_device *video_devdata(struct file *file);
+
+返回 file 结构体中关联的 video_device 指针。
+
+video_drvdata 辅助函数结合了 video_get_drvdata 和 video_devdata
+的功能::
+
+    void *video_drvdata(struct file *file);
+
+你可以使用如下代码从 video_device 结构体中获取 v4l2_device 结构体
+指针::
+
+    struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
+
+- 设备节点名
+
+video_device 设备节点在内核中的名称可以通过以下函数获得 ::
+
+    const char *video_device_node_name(struct video_device *vdev);
+
+这个名字被用户空间工具（例如 udev）作为提示信息使用。应尽可能使用
+此功能，而非访问 video_device->num 和 video_device->minor 域。
diff --git a/Documentation/translations/zh_CN/driver-api/media/v4l2-device.rst b/Documentation/translations/zh_CN/driver-api/media/v4l2-device.rst
new file mode 100644
index 000000000000..8c808d81c558
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/v4l2-device.rst
@@ -0,0 +1,127 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:翻译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+:校译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+V4L2 设备实例
+------------------
+
+每个设备实例都通过 v4l2_device (v4l2-device.h)结构体来表示。
+简单设备可以仅分配这个结构体，但在大多数情况下，都会将这个结构体
+嵌入到一个更大的结构体中。
+
+你必须注册这个设备实例::
+
+        v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev);
+
+注册操作将会初始化 v4l2_device 结构体。如果 dev->driver_data 域
+为 NULL，就将其指向 v4l2_dev。
+
+需要与媒体框架整合的驱动必须手动设置 dev->driver_data，指向包含
+v4l2_device 结构体实例的驱动特定设备结构体。这可以在注册 V4L2 设备
+实例前通过 dev_set_drvdata() 函数完成。同时必须设置 v4l2_device
+结构体的 mdev 域，指向适当的初始化并注册过的 media_device 实例。
+
+如果 v4l2_dev->name 为空，则它将被设置为从 dev 中衍生出的值（为了
+更加精确，形式为驱动名后跟 bus_id）。如果你在调用 v4l2_device_register
+前已经设置好了，则不会被修改。如果 dev 为 NULL，则你*必须*在调用
+v4l2_device_register 前设置 v4l2_dev->name。
+
+你可以基于驱动名和驱动的全局 atomic_t 类型的实例编号，通过
+v4l2_device_set_name() 设置 name。这样会生成类似 ivtv0、ivtv1 等
+名字。若驱动名以数字结尾，则会在编号和驱动名间插入一个破折号，如：
+cx18-0、cx18-1 等。此函数返回实例编号。
+
+第一个 “dev” 参数通常是一个指向 pci_dev、usb_interface 或
+platform_device 的指针。很少使其为 NULL，除非是一个ISA设备或者
+当一个设备创建了多个 PCI 设备，使得 v4l2_dev 无法与一个特定的父设备
+关联。
+
+你也可以提供一个 notify() 回调，使子设备可以调用它实现事件通知。
+是否需要设置取决于子设备。子设备支持的任何通知都必须在
+``include/media/subdevice.h`` 头文件中定义。
+
+注销 v4l2_device 使用如下函数::
+
+        v4l2_device_unregister(struct v4l2_device *v4l2_dev);
+
+如果 dev->driver_data 域指向 v4l2_dev，将会被重置为 NULL。注销同时
+会自动从设备中注销所有子设备。
+
+如果你有一个热插拔设备（如USB设备），则当断开发生时，父设备将无效。
+由于 v4l2_device 有一个指向父设备的指针必须被清除，同时标志父设备
+已消失，所以必须调用以下函数::
+
+        v4l2_device_disconnect(struct v4l2_device *v4l2_dev);
+
+这个函数并*不*注销子设备，因此你依然要调用 v4l2_device_unregister()
+函数。如果你的驱动并非热插拔的，就没有必要调用 v4l2_device_disconnect()。
+
+有时你需要遍历所有被特定驱动注册的设备。这通常发生在多个设备驱动使用
+同一个硬件的情况下。如：ivtvfb 驱动是一个使用 ivtv 硬件的帧缓冲驱动，
+同时 alsa 驱动也使用此硬件。
+
+你可以使用如下例程遍历所有注册的设备::
+
+    static int callback(struct device *dev, void *p)
+    {
+        struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
+
+        /* 测试这个设备是否已经初始化 */
+        if (v4l2_dev == NULL)
+                return 0;
+        ...
+        return 0;
+    }
+
+    int iterate(void *p)
+    {
+        struct device_driver *drv;
+        int err;
+
+        /* 在PCI 总线上查找ivtv驱动。
+           pci_bus_type是全局的. 对于USB总线使用usb_bus_type。 */
+        drv = driver_find("ivtv", &pci_bus_type);
+        /* 遍历所有的ivtv设备实例 */
+        err = driver_for_each_device(drv, NULL, p, callback);
+        put_driver(drv);
+        return err;
+    }
+
+有时你需要一个设备实例的运行计数。这个通常用于映射一个设备实例到一个
+模块选择数组的索引。
+
+推荐方法如下::
+
+    static atomic_t drv_instance = ATOMIC_INIT(0);
+
+    static int drv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
+    {
+        ...
+        state->instance = atomic_inc_return(&drv_instance) - 1;
+    }
+
+如果你有多个设备节点，对于热插拔设备，知道何时注销 v4l2_device 结构体
+就比较困难。为此 v4l2_device 有引用计数支持。当调用 video_register_device
+时增加引用计数，而设备节点释放时减小引用计数。当引用计数为零，则
+v4l2_device 的release() 回调将被执行。你就可以在此时做最后的清理工作。
+
+如果创建了其他设备节点（比如 ALSA），则你可以通过以下函数手动增减
+引用计数::
+
+    void v4l2_device_get(struct v4l2_device *v4l2_dev);
+
+或: ::
+
+    int v4l2_device_put(struct v4l2_device *v4l2_dev);
+
+由于引用计数初始化为 1 ，你也需要在 disconnect() 回调（对于 USB 设备）中
+调用 v4l2_device_put，或者 remove() 回调（例如对于 PCI 设备），否则
+引用计数将永远不会为 0 。
diff --git a/Documentation/translations/zh_CN/driver-api/media/v4l2-event.rst b/Documentation/translations/zh_CN/driver-api/media/v4l2-event.rst
new file mode 100644
index 000000000000..d1d46a0fc732
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/v4l2-event.rst
@@ -0,0 +1,124 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:翻译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+:校译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+V4L2 事件
+-------------
+
+V4L2 事件机制提供了一个通用的方法将事件传递到用户空间。驱动必须使用
+v4l2_fh 才能支持 V4L2 事件机制。
+
+
+事件按文件句柄订阅。事件由 ``type`` 和可选的 ``id`` 指定；``id``
+可以标识某个 V4L2 对象，例如一个控制项。未使用时 ``id`` 为 0。
+因此，``(type, id)`` 这一对值唯一标识一个事件。
+
+``v4l2_fh`` 的 ``subscribed`` 字段保存已订阅事件的列表。每次订阅
+都会向该列表添加一个 ``v4l2_subscribed_event`` 结构体。每个结构体
+末尾都有一个 ``v4l2_kevent`` 环形缓冲区，其大小由调用
+``v4l2_event_subscribe()`` 的一方指定，用于保存驱动产生的事件。
+
+每组 ``(type, id)`` 都有自己的环形缓冲区。因此，驱动在短时间内产生
+大量同类事件时，不会覆盖其他类型的事件。如果同类事件数量超过缓冲区
+容量，最早的事件会被丢弃，新事件则加入队列。
+
+``v4l2_kevent`` 结构体还连接到 ``v4l2_fh`` 的 ``available`` 列表，
+以便 ``VIDIOC_DQEVENT`` 确定先取出哪个事件。如果订阅关联到特定对象，
+例如 V4L2 控制项，该对象也需要知道订阅者。此时可以通过 ``node``
+字段，将 ``v4l2_subscribed_event`` 连接到对象的内部列表。
+
+总之，``v4l2_fh`` 分别维护已订阅事件和可取事件两个列表；每个
+``v4l2_subscribed_event`` 都有存放该类待处理事件的环形缓冲区；若订阅
+关联到特定对象，对象也维护自己的订阅者列表。
+
+此外，v4l2_subscribed_event 结构体内部有可供驱动设置的 merge() 和
+replace() 回调，这些回调会在新事件产生且没有多余空间的时候被调用。
+replace() 回调让你可以将早期事件的净荷替换为新事件的净荷，将早期
+净荷的相关数据合并到替换进来的新净荷中。当该类型的事件仅分配了一个
+kevent 结构体时，它将被调用。merge() 回调让你可以合并最早的事件净荷
+到在它之后的那个事件净荷中。当该类型的事件分配了两个或更多 kevent
+结构体时，它将被调用。
+
+这种方法不会有状态信息丢失，只会导致中间步骤信息丢失。
+
+
+关于 replace/merge 回调的一个不错的例子在 v4l2-event.c 中：用于
+控制事件的 ctrls_replace() 和 ctrls_merge() 回调。
+
+注意：这些回调可以在中断上下文中调用，所以它们必须尽快完成并退出。
+
+有用的函数：
+
+void v4l2_event_queue(struct video_device \*vdev, const struct v4l2_event \*ev)
+
+  将事件加入视频设备的队列。驱动仅负责填充 type 和 data 域。
+  其他域由 V4L2 填充。
+
+订阅事件
+~~~~~~~~
+
+int v4l2_event_subscribe(struct v4l2_fh \*fh,
+			 struct v4l2_event_subscription \*sub, unsigned elems,
+			 const struct v4l2_subscribed_event_ops \*ops)
+
+  video_device->ioctl_ops->vidioc_subscribe_event 必须检测驱动能
+  产生特定 id 的事件。然后调用 v4l2_event_subscribe() 来订阅该事件。
+
+  elems 参数是该事件的队列大小。若为 0，V4L2 框架将会（根据事件类型）
+  填充默认值。
+
+  ops 参数允许驱动指定一系列回调：
+
+  * add:     当添加一个新监听者时调用（重复订阅同一个事件，此回调
+      仅被执行一次）。
+  * del:     当一个监听者停止监听时调用。
+  * replace: 用“新”事件替换“旧”事件。
+  * merge:   将“旧”事件合并到“新”事件中。
+
+  这四个调用都是可选的，如果不想指定任何回调，则 ops 可为 NULL。
+
+取消订阅事件
+~~~~~~~~~~~~
+
+int v4l2_event_unsubscribe(struct v4l2_fh \*fh,
+			   struct v4l2_event_subscription \*sub)
+
+  v4l2_ioctl_ops 结构体中的 vidioc_unsubscribe_event 回调函数。
+  驱动程序可以直接使用 v4l2_event_unsubscribe() 实现退订事件过程。
+
+  特殊的 V4L2_EVENT_ALL 类型，可用于退订所有事件。驱动可能在特殊
+  情况下需要做此操作。
+
+检查是否有待处理事件
+~~~~~~~~~~~~~~~~~~~~
+
+int v4l2_event_pending(struct v4l2_fh \*fh)
+
+  返回未决事件的数量。有助于实现轮询（poll）操作。
+
+事件的工作方式
+~~~~~~~~~~~~~~
+
+事件通过 poll 系统调用传递到用户空间。驱动可用
+v4l2_fh->wait (wait_queue_head_t 类型)作为参数调用 poll_wait()。
+
+事件分为标准事件和私有事件。新的标准事件必须使用可用的最小事件类型
+编号。驱动必须从各自类别的起始编号开始分配事件。类型的编号起始为
+V4L2_EVENT_PRIVATE_START + n * 1000 ，其中 n 为可用最小编号。每个
+类型中的第一个事件类型编号是为以后的使用保留的，所以第一个可用事件
+类型编号是‘class base + 1’。
+
+V4L2 事件机制的使用实例可以在 OMAP3 ISP 驱动
+``drivers/media/platform/ti/omap3isp`` 中找到。
+
+子设备可以通过 ``V4L2_DEVICE_NOTIFY_EVENT`` 直接向 ``v4l2_device``
+的通知函数发送事件。这样，桥接驱动就可以将发送事件的子设备映射到需要
+获知该事件的相关视频节点。
diff --git a/Documentation/translations/zh_CN/driver-api/media/v4l2-fh.rst b/Documentation/translations/zh_CN/driver-api/media/v4l2-fh.rst
new file mode 100644
index 000000000000..1a2faf642602
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/v4l2-fh.rst
@@ -0,0 +1,123 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:翻译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+:校译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+V4L2 文件句柄
+--------------
+
+``v4l2_fh`` 结构体用于保存 V4L2 框架使用的文件句柄专属数据。
+所有驱动都必须使用它。
+
+驱动在 ``open()`` 文件操作中分配 ``v4l2_fh``，通常将其嵌入到
+更大的驱动专用结构体中。必须调用 ``v4l2_fh_init()`` 初始化，
+再调用 ``v4l2_fh_add()`` 将其加入视频设备。后者会设置
+``file->private_data``，使文件对象关联到该 ``v4l2_fh``。
+
+驱动在 ``release()`` 文件操作中释放 ``v4l2_fh``。释放内存前，
+必须依次调用 ``v4l2_fh_del()`` 从视频设备中移除它，并调用
+``v4l2_fh_exit()`` 清理。
+
+驱动不应直接访问 ``file->private_data``，而应通过
+``file_to_v4l2_fh()`` 获取文件关联的 ``v4l2_fh``。
+驱动还可以通过 ``container_of`` 宏取得自己的文件句柄结构体。例如::
+
+    struct my_fh {
+        int blah;
+        struct v4l2_fh fh;
+    };
+
+    ...
+
+    int my_open(struct file *file)
+    {
+        struct my_fh *my_fh;
+        struct video_device *vfd;
+        int ret;
+
+        ...
+
+        my_fh = kzalloc_obj(*my_fh);
+
+        ...
+
+        v4l2_fh_init(&my_fh->fh, vfd);
+
+        ...
+
+        v4l2_fh_add(&my_fh->fh, file);
+        return 0;
+    }
+
+    int my_release(struct file *file)
+    {
+        struct v4l2_fh *fh = file_to_v4l2_fh(file);
+        struct my_fh *my_fh = container_of(fh, struct my_fh, fh);
+
+        ...
+        v4l2_fh_del(&my_fh->fh, file);
+        v4l2_fh_exit(&my_fh->fh);
+        kfree(my_fh);
+        return 0;
+    }
+
+以下是 v4l2_fh 函数使用的简介：
+
+void v4l2_fh_init(struct v4l2_fh \*fh, struct video_device \*vdev)
+
+  初始化文件句柄。这*必须*在驱动的 v4l2_file_operations->open()
+  函数中执行。
+
+void v4l2_fh_add(struct v4l2_fh \*fh, struct file \*filp)
+
+  添加一个 v4l2_fh 到 video_device 文件句柄列表。一旦文件句柄
+  初始化完成就必须调用。
+
+void v4l2_fh_del(struct v4l2_fh \*fh, struct file \*filp)
+
+  解除文件句柄与 video_device 的关联。之后才可以调用文件句柄的
+  清理函数。
+
+void v4l2_fh_exit(struct v4l2_fh \*fh)
+
+  清理文件句柄。清理完成后，驱动才可以释放 ``v4l2_fh`` 占用的内存。
+
+struct v4l2_fh \*file_to_v4l2_fh(struct file \*filp)
+
+  取得与 ``file`` 对象关联的 ``v4l2_fh`` 实例。
+
+
+如果 v4l2_fh 不是嵌入在其他结构体中的，则可以用这些辅助函数：
+
+int v4l2_fh_open(struct file \*filp)
+
+  分配一个 v4l2_fh 结构体空间，初始化并将其添加到 file 结构体相关的
+  video_device 结构体中。
+
+int v4l2_fh_release(struct file \*filp)
+
+  从 file 结构体相关的 video_device 结构体中删除 v4l2_fh ，清理
+  v4l2_fh 并释放空间。
+
+这两个函数可以插入到 v4l2_file_operations 的 open() 和 release()
+操作中。
+
+
+某些驱动需要在第一个文件句柄打开和最后一个文件句柄关闭的时候做些
+工作。所以加入了两个辅助函数以检查 v4l2_fh 结构体是否是相关设备
+节点打开的唯一文件句柄。
+
+int v4l2_fh_is_singular(struct v4l2_fh \*fh)
+
+  如果此文件句柄是唯一打开的文件句柄，则返回 1 ，否则返回 0 。
+
+int v4l2_fh_is_singular_file(struct file \*filp)
+
+  功能相同，但通过 filp->private_data 调用 v4l2_fh_is_singular。
diff --git a/Documentation/translations/zh_CN/driver-api/media/v4l2-intro.rst b/Documentation/translations/zh_CN/driver-api/media/v4l2-intro.rst
new file mode 100644
index 000000000000..d530450c3062
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/v4l2-intro.rst
@@ -0,0 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:翻译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+:校译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+介绍
+----
+
+大部分现代 V4L2 设备由多个 IC 组成，在 /dev 下导出多个设备节点，
+并同时创建非 V4L2 设备（如 DVB、ALSA、FB、I2C 和红外输入设备）。
+由于这种硬件的复杂性，V4L2 驱动也变得非常复杂。
+
+尤其是 V4L2 必须支持 IC 实现音视频的多路复用和编解码，这就更增加了其
+复杂性。通常这些 IC 通过一个或多个 I2C 总线连接到主桥驱动器，但也可
+使用其他总线。这些设备称为“子设备”。
+
+长期以来，这个框架仅限于通过 video_device 结构体创建 V4L 设备节点，
+并使用 video_buf 处理视频缓冲（注：本文不讨论 video_buf 框架）。
+
+这意味着所有驱动必须自己设置设备实例并连接到子设备。其中一部分要正确地
+完成是比较复杂的，使得许多驱动都没有正确地实现。
+
+由于框架的缺失，有很多通用代码都不可重复利用。
+
+因此，这个框架构建所有驱动都需要的基本结构块，而统一的框架将使通用代码
+创建成实用函数并在所有驱动中共享变得更加容易。
+
+可以参考 ``samples/v4l/`` 中的 ``v4l2-pci-skeleton.c``。它是一个
+PCI 采集卡驱动的框架示例，展示了如何使用 V4L2 驱动框架，也可以作为
+实际 PCI 视频采集驱动的模板。
+
+
+驱动结构
+--------
+
+所有 V4L2 驱动都有如下结构：
+
+1) 每个设备实例的结构体--包含其设备状态。
+
+2) 初始化和控制子设备的方法（如果有）。
+
+3) 创建 V4L2 设备节点 (/dev/videoX、/dev/vbiX 和 /dev/radioX)
+   并跟踪设备节点的特定数据。
+
+4) 特定文件句柄结构体--包含每个文件句柄的数据。
+
+5) 视频缓冲处理。
+
+以下是它们的粗略关系图::
+
+    device instances（设备实例）
+      |
+      +-sub-device instances（子设备实例）
+      |
+      \-V4L2 device nodes（V4L2 设备节点）
+          |
+          \-filehandle instances（文件句柄实例）
+
+
+框架结构
+--------
+
+该框架非常类似驱动结构：它有一个 v4l2_device 结构用于保存设备
+实例的数据；一个 v4l2_subdev 结构体代表子设备实例；video_device
+结构体保存 V4L2 设备节点的数据；v4l2_fh 结构体跟踪文件句柄实例。
+
+V4L2 框架也可与媒体框架整合（可选的）。如果驱动设置了 v4l2_device
+结构体的 mdev 域，子设备和视频节点的入口将自动出现在媒体框架中。
diff --git a/Documentation/translations/zh_CN/driver-api/media/v4l2-subdev.rst b/Documentation/translations/zh_CN/driver-api/media/v4l2-subdev.rst
new file mode 100644
index 000000000000..407828c0cab5
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/media/v4l2-subdev.rst
@@ -0,0 +1,491 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:翻译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+:校译:
+
+ 傅炜 Fu Wei <tekkamanninja@gmail.com>
+
+V4L2 子设备
+-----------------
+
+许多驱动需要与子设备通信。这些设备可以完成各种任务，但通常它们负责
+音视频复用和编解码。如网络摄像头的子设备通常是传感器和摄像头控制器。
+
+这些一般为 I2C 接口设备，但并不一定都是。为了给驱动提供调用子设备的
+统一接口，v4l2_subdev 结构体（v4l2-subdev.h）产生了。
+
+每个子设备驱动都必须有一个 v4l2_subdev 结构体。这个结构体可以单独
+代表一个简单的子设备，也可以嵌入到一个更大的结构体中，与更多设备状态
+信息保存在一起。通常有一个下级设备结构体（比如：i2c_client）包含了
+内核创建的设备数据。建议使用 v4l2_set_subdevdata() 将这个结构体的
+指针保存在 v4l2_subdev 的私有数据域(dev_priv)中。这使得通过 v4l2_subdev
+找到实际的低层总线特定设备数据变得容易。
+
+你同时需要一个从低层结构体获取 v4l2_subdev 指针的方法。对于常用的
+i2c_client 结构体，i2c_set_clientdata() 函数可用于保存一个 v4l2_subdev
+指针；对于其他总线你可能需要使用其他相关函数。
+
+桥驱动中也应保存每个子设备的私有数据，比如一个指向特定桥的各设备私有
+数据的指针。为此 v4l2_subdev 结构体提供主机私有数据域(host_priv)，
+并可通过 v4l2_get_subdev_hostdata() 和 v4l2_set_subdev_hostdata()
+访问。
+
+从总线桥驱动的视角，驱动加载子设备模块并以某种方式获得 v4l2_subdev
+结构体指针。对于 i2c 总线设备相对简单：调用 i2c_get_clientdata()。
+对于其他总线也需要做类似的操作。针对 I2C 总线上的子设备辅助函数帮你
+完成了大部分复杂的工作。
+
+每个 v4l2_subdev 都包含子设备驱动需要实现的函数指针（如果对此设备
+不适用，可为NULL）。由于子设备可完成许多不同的工作，而在一个庞大的
+函数指针结构体中通常仅有少数有用的函数实现其功能肯定不合适。所以，
+函数指针根据其实现的功能被分类，每一类都有自己的函数指针结构体。
+
+顶层函数指针结构体包含了指向各类函数指针结构体的指针，如果子设备驱动
+不支持该类函数中的任何一个功能，则指向该类结构体的指针为NULL。
+
+这些结构体定义如下::
+
+    struct v4l2_subdev_core_ops {
+        int (*log_status)(struct v4l2_subdev *sd);
+        int (*init)(struct v4l2_subdev *sd, u32 val);
+        ...
+    };
+
+    struct v4l2_subdev_tuner_ops {
+        ...
+    };
+
+    struct v4l2_subdev_audio_ops {
+        ...
+    };
+
+    struct v4l2_subdev_video_ops {
+        ...
+    };
+
+    struct v4l2_subdev_pad_ops {
+        ...
+    };
+
+    struct v4l2_subdev_ops {
+        const struct v4l2_subdev_core_ops  *core;
+        const struct v4l2_subdev_tuner_ops *tuner;
+        const struct v4l2_subdev_audio_ops *audio;
+        const struct v4l2_subdev_video_ops *video;
+        const struct v4l2_subdev_pad_ops *pad;
+    };
+
+其中 core（核心）函数集通常可用于所有子设备，其他类别的实现依赖于
+子设备。如视频设备可能不支持音频操作函数，反之亦然。
+
+这样的设置在限制了函数指针数量的同时，还使增加新的操作函数和分类
+变得较为容易。
+
+子设备驱动可使用如下函数初始化 v4l2_subdev 结构体::
+
+        v4l2_subdev_init(sd, &ops);
+
+然后，你必须用一个唯一的名字初始化 subdev->name，并初始化模块的
+owner 域。若使用 i2c 辅助函数，这些都会帮你处理好。
+
+若需同媒体框架整合，且实体具有 pad，你必须调用
+media_entity_pads_init() 初始化 v4l2_subdev 结构体中的
+media_entity 结构体（entity 域）::
+
+        struct media_pad *pads = &my_sd->pads;
+        int err;
+
+        err = media_entity_pads_init(&sd->entity, npads, pads);
+
+pads 数组必须预先初始化。无须手动设置 media_entity 的 function 和
+name 域，但如有必要，revision 域必须初始化。
+
+当子设备节点（如有）被打开或关闭时，对 entity 的引用将被自动获取或释放。
+
+在子设备被销毁之前，不要忘记清理 media_entity 结构体::
+
+        media_entity_cleanup(&sd->entity);
+
+如果子设备驱动实现了接收端 pad，可以在 ``v4l2_subdev_pad_ops`` 中
+设置 ``link_validate``，提供自己的链接验证函数。管道中每条链接都会
+调用接收端的这一操作；驱动仍须验证子设备与视频节点之间的格式配置。
+
+如果 link_validate 操作没有设置，默认的 v4l2_subdev_link_validate_default()
+函数将会被调用。这个函数保证宽、高和媒体总线像素格式在链接的收发两端
+都一致。子设备驱动除了它们自己的检测外，也可以自由使用这个函数以执行
+上面提到的检查。
+
+子设备注册
+~~~~~~~~~~
+
+目前有两种向 V4L2 核心注册子设备的方法。传统方式由桥接驱动注册，适用于
+桥接驱动掌握所连接子设备的完整信息，并且知道何时注册它们的情况，例如
+SoC 或复杂 PCI(e) 板卡内的视频处理单元、USB 摄像头或 SoC 所连接的
+传感器。另一种方式是异步注册：例如在设备树系统中，I2C 设备节点中的
+子设备信息可以独立于桥接设备出现。两种方式只影响探测过程；运行时桥接
+设备与子设备的交互方式相同。
+
+同步注册子设备
+^^^^^^^^^^^^^^
+
+同步注册时，设备（桥接）驱动须向 ``v4l2_device`` 注册
+``v4l2_subdev``::
+
+        int err = v4l2_device_register_subdev(v4l2_dev, sd);
+
+如果子设备模块在它注册前消失，这个操作可能失败。在这个函数成功返回后，
+subdev->dev 域就指向了 v4l2_device。
+
+如果 v4l2_device 父设备的 mdev 域为非 NULL 值，则子设备实体将被自动
+注册为媒体设备。
+
+注销子设备则可用如下函数::
+
+        v4l2_device_unregister_subdev(sd);
+
+此后，子设备模块就可卸载，且 sd->dev == NULL。
+
+.. _media-registering-async-subdevs-zh:
+
+异步注册子设备
+^^^^^^^^^^^^^^
+
+异步注册时，子设备的探测可以独立于桥接驱动启动。子设备驱动须确认探测
+所需条件均已满足，例如主时钟可用；条件不满足时可返回
+``-EPROBE_DEFER``，请求稍后重新探测。条件满足后，调用
+``v4l2_async_register_subdev()`` 注册；调用
+``v4l2_async_unregister_subdev()`` 注销。异步注册的子设备保存在
+全局列表中，等待桥接驱动匹配。
+
+在调用 ``v4l2_async_register_subdev()`` 之前，驱动必须完成子设备的
+全部初始化，包括启用运行时电源管理，因为注册完成后子设备立即可被访问。
+
+异步子设备通知器
+^^^^^^^^^^^^^^^^
+
+桥接驱动须调用 ``v4l2_async_nf_register()`` 注册通知器，并调用
+``v4l2_async_nf_unregister()`` 注销。释放已注销通知器的内存前，还须
+调用 ``v4l2_async_nf_cleanup()`` 清理。注册前，应先调用
+``v4l2_async_nf_init()`` 初始化通知器，再为桥接设备建立所需的异步
+连接描述符列表。可通过 ``v4l2_async_nf_add_fwnode()``、
+``v4l2_async_nf_add_fwnode_remote()`` 和 ``v4l2_async_nf_add_i2c()``
+添加连接。
+
+异步连接描述符表示驱动尚未完成探测的外部子设备连接。当对应子设备可用时，
+可以据此建立媒体数据链接或辅助链接。一个子设备可能对应一个或多个异步连接；
+添加描述符时还不知道最终匹配结果。系统会在发现匹配的子设备时逐个绑定连接。
+
+子设备的异步通知器
+^^^^^^^^^^^^^^^^^^
+
+异步注册的子设备驱动也可以注册通知器。流程与桥接驱动相似，但应改用
+``v4l2_async_subdev_nf_init()`` 初始化。子设备通知器只有在 V4L2 设备
+可用时才能完成绑定；也就是说，必须存在经由异步子设备和通知器通向某个
+非子设备通知器的路径。
+
+摄像头传感器驱动的异步注册辅助函数
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+``v4l2_async_register_subdev_sensor()`` 帮助传感器驱动注册自身的
+异步连接，同时注册通知器，并为固件中发现的镜头和闪光灯设备注册异步连接。
+调用 ``v4l2_async_unregister_subdev()`` 注销子设备时，也会注销并清理
+该通知器。
+
+异步子设备通知器示例
+^^^^^^^^^^^^^^^^^^^^
+
+添加函数分配的异步连接描述符类型为 ``v4l2_async_connection``，
+通常嵌入在驱动专用结构体中，并且必须是该结构体的第一个成员。例如::
+
+    struct my_async_connection {
+        struct v4l2_async_connection asc;
+        ...
+    };
+
+    struct my_async_connection *my_asc;
+    struct fwnode_handle *ep;
+
+    ...
+
+    my_asc = v4l2_async_nf_add_fwnode_remote(&notifier, ep,
+                                              struct my_async_connection);
+    fwnode_handle_put(ep);
+
+    if (IS_ERR(my_asc))
+        return PTR_ERR(my_asc);
+
+异步子设备通知器回调
+^^^^^^^^^^^^^^^^^^^^
+
+V4L2 核心用连接描述符匹配异步注册的子设备。匹配时调用通知器的
+``.bound()`` 回调；所有连接绑定后调用 ``.complete()``；连接从系统
+移除时调用 ``.unbind()``。这三个回调都是可选的。
+
+驱动可以在包含 ``v4l2_async_connection`` 的专用结构体中保存数据。
+若释放结构体时需对这些数据做特殊处理，应实现通知器的
+``.destroy()`` 回调。框架会在释放连接描述符前调用它。
+
+调用子设备操作
+~~~~~~~~~~~~~~
+
+``v4l2_subdev`` 是通用结构体，不包含底层硬件的专有信息。例如，一个驱动
+可以同时包含通过 I2C 总线和 GPIO 引脚控制的子设备。这种区别只在配置设备
+时有影响；子设备注册后，调用者无须再区分它们。
+
+注册子设备后，可通过以下方式直接调用其操作函数::
+
+        err = sd->ops->core->g_std(sd, &norm);
+
+但使用如下宏会比较容易且合适::
+
+        err = v4l2_subdev_call(sd, core, g_std, &norm);
+
+这个宏将会做 NULL 指针检查，如果 subdev 为 NULL，则返回-ENODEV；如果
+subdev->core 或 subdev->core->g_std 为 NULL，则返回 -ENOIOCTLCMD；
+否则将返回 subdev->ops->core->g_std ops 调用的实际结果。
+
+有时也可能同时调用所有或一系列子设备的某个操作函数::
+
+        v4l2_device_call_all(v4l2_dev, 0, core, g_std, &norm);
+
+任何不支持此操作的子设备都会被跳过，并忽略错误返回值。但如果你需要
+检查出错码，则可使用如下函数::
+
+        err = v4l2_device_call_until_err(v4l2_dev, 0, core, g_std, &norm);
+
+除 -ENOIOCTLCMD 外的任何错误都会跳出循环并返回错误值。如果（除 -ENOIOCTLCMD
+外）没有错误发生，则返回 0。
+
+对于以上两个函数的第二个参数为组 ID。如果为 0，则所有子设备都会执行
+这个操作。如果为非 0 值，则只有那些组 ID 匹配的子设备才会执行此操作。
+在桥驱动注册一个子设备前，可以设置 sd->grp_id 为任何期望值（默认值为
+0）。这个值属于桥驱动，且子设备驱动将不会修改和使用它。
+
+组 ID 赋予了桥驱动更多对于如何调用回调的控制。例如，电路板上有多个
+音频芯片，每个都有改变音量的能力。但当用户想要改变音量的时候，通常
+只有一个会被实际使用。你可以对这样的子设备设置组 ID 为（例如 AUDIO_CONTROLLER）
+并在调用 v4l2_device_call_all() 时指定它为组 ID 值。这就保证了只有
+需要的子设备才会执行这个回调。
+
+如果子设备需要通知它的 v4l2_device 父设备一个事件，可以调用
+v4l2_subdev_notify(sd, notification, arg)。这个宏检查是否有一个
+notify() 回调被注册，如果没有，返回 -ENODEV。否则返回 notify() 调用
+结果。
+
+V4L2 子设备用户空间API
+----------------------
+
+传统上，桥接驱动向用户空间提供一个或多个视频节点，并在响应视频节点
+操作时，通过 ``v4l2_subdev_ops`` 控制子设备，以隐藏底层硬件的复杂性。
+复杂设备可能需要比视频节点提供的更细粒度的控制。实现媒体控制器 API
+的桥接驱动可以选择让用户空间直接访问子设备操作。
+
+可以在 /dev 中创建名为 v4l-subdevX 设备节点，以通过其直接访问子设备。
+如果子设备支持用户空间直接配置，必须在注册前设置 V4L2_SUBDEV_FL_HAS_DEVNODE
+标志。
+
+注册子设备之后， v4l2_device 驱动会通过调用 v4l2_device_register_subdev_nodes()
+函数为所有已注册并设置了 V4L2_SUBDEV_FL_HAS_DEVNODE 的子设备创建
+设备节点。这些设备节点会在子设备注销时自动删除。
+
+这些设备节点处理 V4L2 API 的一个子集。
+
+``VIDIOC_QUERYCTRL``、
+``VIDIOC_QUERYMENU``、
+``VIDIOC_G_CTRL``、
+``VIDIOC_S_CTRL``、
+``VIDIOC_G_EXT_CTRLS``、
+``VIDIOC_S_EXT_CTRLS`` 和
+``VIDIOC_TRY_EXT_CTRLS``：
+
+        这些控制 ioctl 与 V4L2 中定义的一致。它们的行为相同，唯一的
+        不同是它们只处理子设备的控制实现。根据驱动程序，这些控制也
+        可以通过一个（或多个） V4L2 设备节点访问。
+
+``VIDIOC_DQEVENT``、
+``VIDIOC_SUBSCRIBE_EVENT`` 和
+``VIDIOC_UNSUBSCRIBE_EVENT``：
+
+        这些事件 ioctl 与 V4L2 中定义的一致。它们的行为相同，唯一的
+        不同是它们只处理子设备产生的事件。根据驱动程序，这些事件也
+        可以通过一个（或多个） V4L2 设备节点上报。
+
+        要使用事件通知的子设备驱动，须在注册子设备前设置
+        ``v4l2_subdev`` 的 ``V4L2_SUBDEV_FL_HAS_EVENTS`` 标志。
+        注册完成后，可以像通常一样通过子设备节点将事件入队。
+
+        为正确支持事件机制，poll() 文件操作也应被实现。
+
+私有 ioctls
+
+        不在以上列表中的所有 ioctls 会通过 core::ioctl 操作直接传递
+        给子设备驱动。
+
+只读子设备用户空间 API
+----------------------
+
+通过 ``v4l2_subdev_ops`` 直接调用内核 API 来控制所连接子设备的桥接驱动，
+通常不希望用户空间通过子设备节点修改同一组参数，因此一般不会注册节点。
+但有时允许用户空间通过只读 API 查看当前配置很有用：应用可以检查子设备，
+却不能改变其参数。
+
+例如计算摄影应用需要了解传感器在每种输出分辨率下的跳行、像素合并、裁剪
+和缩放配置。桥接驱动可以为此通过只读接口开放子设备操作。
+
+对于设置了 ``V4L2_SUBDEV_FL_HAS_DEVNODE`` 的全部已注册子设备，
+``v4l2_device`` 驱动可调用
+``v4l2_device_register_ro_subdev_nodes()`` 创建只读设备节点。
+这些节点对以下 ioctl 的访问受到限制：
+
+* ``VIDIOC_SUBDEV_S_FMT``、``VIDIOC_SUBDEV_S_CROP`` 和
+  ``VIDIOC_SUBDEV_S_SELECTION``：只有操作 ``V4L2_SUBDEV_FORMAT_TRY``
+  格式及选区矩形时才允许调用。
+* ``VIDIOC_SUBDEV_S_FRAME_INTERVAL``、``VIDIOC_SUBDEV_S_DV_TIMINGS``
+  和 ``VIDIOC_SUBDEV_S_STD``：不允许调用。
+
+如果 ioctl 不被允许，或者要修改的格式设为
+``V4L2_SUBDEV_FORMAT_ACTIVE``，核心会返回负错误码，并将 ``errno``
+设为 ``-EPERM``。
+
+
+I2C 子设备驱动
+--------------
+
+由于这些驱动很常见，内核提供了专用辅助函数（``v4l2-common.h``），让这些
+设备的使用更加容易。
+
+添加 v4l2_subdev 支持的推荐方法是让 I2C 驱动将 v4l2_subdev 结构体
+嵌入到为每个 I2C 设备实例创建的状态结构体中。而最简单的设备没有状态
+结构体，此时可以直接创建一个 v4l2_subdev 结构体。
+
+一个典型的状态结构体如下所示（‘chipname’用芯片名代替）::
+
+    struct chipname_state {
+        struct v4l2_subdev sd;
+        ...  /* 附加的状态域*/
+    };
+
+初始化 v4l2_subdev 结构体的方法如下::
+
+        v4l2_i2c_subdev_init(&state->sd, client, subdev_ops);
+
+这个函数将填充 v4l2_subdev 结构体中的所有域，并保证 v4l2_subdev 和
+i2c_client 都指向彼此。
+
+同时，你也应该为从 v4l2_subdev 指针找到 chipname_state 结构体指针
+添加一个辅助内联函数。 ::
+
+    static inline struct chipname_state *to_state(struct v4l2_subdev *sd)
+    {
+        return container_of(sd, struct chipname_state, sd);
+    }
+
+使用以下函数可以通过 v4l2_subdev 结构体指针获得 i2c_client 结构体
+指针::
+
+        struct i2c_client *client = v4l2_get_subdevdata(sd);
+
+而以下函数则相反，通过 i2c_client 结构体指针获得 v4l2_subdev 结构体
+指针::
+
+        struct v4l2_subdev *sd = i2c_get_clientdata(client);
+
+调用 ``remove()`` 回调时，必须调用
+``v4l2_device_unregister_subdev(sd)``。此操作会从桥接驱动中注销
+子设备；即使子设备从未注册，调用此函数也是安全的。
+
+必须这样做的原因是：当桥驱动注销 i2c 适配器时，remove()回调函数
+会被那个适配器上的 i2c 设备调用。此后，相应的 v4l2_subdev 结构体
+就不再有效，所以必须先注销它们。在 ``remove()`` 回调中调用
+v4l2_device_unregister_subdev(sd)，可以保证执行总是正确的。
+
+
+桥接驱动还可以使用一些辅助函数::
+
+    struct v4l2_subdev *sd = v4l2_i2c_new_subdev(v4l2_dev, adapter,
+               "module_foo", "chipid", 0x36, NULL);
+
+这个函数会加载给定的模块（如果没有模块需要加载，可以为 NULL），
+并用给定的 i2c 适配器结构体指针（i2c_adapter）和 器件地址（chip/address）
+作为参数调用 i2c_new_client_device()。如果一切顺利，就会向 v4l2_device
+注册子设备。
+
+你也可以利用 v4l2_i2c_new_subdev()的最后一个参数，传递一个可能的
+I2C 地址数组，让函数自动探测。这些探测地址只有在前一个参数为 0 的
+情况下使用。非零参数意味着你知道准确的 i2c 地址，所以此时无须进行
+探测。
+
+如果出错，两个函数都返回 NULL。
+
+注意：传递给 v4l2_i2c_new_subdev()的 chipid 通常与模块名一致。
+它允许你指定一个芯片的变体，比如“saa7114”或“saa7115”。一般通过
+i2c 驱动自动探测。chipid 的使用是在今后需要深入了解的事情。这个与
+i2c 驱动不同，较容易混淆。要知道支持哪些芯片变体，你可以查阅 i2c
+驱动代码的 i2c_device_id 表，上面列出了所有可能支持的芯片。
+
+还有一个辅助函数：``v4l2_i2c_new_subdev_board()`` 接收
+``i2c_board_info`` 结构体，将其传给 I2C 驱动，代替原先单独传递的
+``irq``、``platform_data`` 和 ``addr`` 参数。
+
+如果子设备支持核心操作 ``s_config``，则在子设备设置完成后，以
+``irq`` 和 ``platform_data`` 为参数调用该操作。
+``v4l2_i2c_new_subdev()`` 会在内部调用
+``v4l2_i2c_new_subdev_board()``，并用 ``client_type`` 和 ``addr``
+填充 ``i2c_board_info``。
+
+集中管理的子设备活动状态
+------------------------
+
+传统上，V4L2 子设备驱动自行维护活动配置的内部状态。例如，驱动可以为每个
+pad 保存一个 ``v4l2_mbus_framefmt``，并以类似方式保存裁剪和合成矩形。
+
+除活动配置外，V4L2 核心还为每个子设备文件句柄管理一个
+``v4l2_subdev_state``，用于保存尝试配置（try configuration）。
+
+为简化子设备驱动，V4L2 子设备 API 现在可选用由核心集中管理的活动配置，
+以 ``v4l2_subdev_state`` 表示。活动状态实例保存在子设备自身的
+``v4l2_subdev`` 结构体中；核心还为每个打开的文件句柄分配尝试状态，
+以保存该文件句柄对应的尝试配置。
+
+驱动可以选择使用这种状态管理方式：在注册子设备之前调用
+``v4l2_subdev_init_finalize()`` 初始化状态，并在注销子设备之前调用
+``v4l2_subdev_cleanup()`` 释放资源。核心会为每个打开的文件句柄自动
+分配并初始化尝试状态，关闭文件句柄时将其释放。
+
+同时使用活动格式和尝试格式的子设备操作，通过 ``state`` 参数取得正确
+的状态。调用者须用 ``v4l2_subdev_lock_state()`` 和
+``v4l2_subdev_unlock_state()`` 加锁与解锁；也可以通过
+``v4l2_subdev_call_state_active()`` 宏调用操作，由它处理活动状态。
+
+没有接收 ``state`` 参数的操作隐式作用于子设备的活动状态。驱动可调用
+``v4l2_subdev_lock_and_get_active_state()`` 独占访问，并同样通过
+``v4l2_subdev_unlock_state()`` 释放。驱动绝不能绕开这些辅助函数，
+直接访问 ``v4l2_subdev`` 或文件句柄中保存的状态。
+
+V4L2 核心会向子设备操作传入正确的尝试状态或活动状态，但许多旧驱动通过
+``v4l2_subdev_call()`` 调用操作时传入 ``NULL`` 状态。对于让核心管理
+活动状态的子设备驱动，这会造成问题，因为它们需要收到适当的状态参数。
+为便于逐步转换，``v4l2_subdev_call()`` 增加了一层包装：遇到 ``NULL``
+时，它通过 ``v4l2_subdev_lock_and_get_active_state()`` 获取并锁定
+被调用方的活动状态，并在调用结束后解锁。
+
+完整的子设备状态实际上由 ``v4l2_subdev_state``、子设备控制项和驱动
+内部状态三部分组成。将来这些部分应合并；目前可以共享一个锁来协调它们。
+``v4l2_ctrl_handler`` 已通过 ``lock`` 指针支持这种方式。驱动可在调用
+``v4l2_subdev_init_finalize()`` 前设置::
+
+    sd->ctrl_handler->lock = &priv->mutex;
+    sd->state_lock = &priv->mutex;
+
+这样，控制项和状态就共用驱动的私有互斥锁。
+
+多路流、复用媒体 pad 和内部路由
+-------------------------------
+
+子设备驱动可以设置 ``V4L2_SUBDEV_FL_STREAMS`` 标志，并实现由核心
+管理的活动状态、路由和按流配置，以支持复用流。
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
deleted file mode 100644
index 05414579efac..000000000000
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ /dev/null
@@ -1,958 +0,0 @@
-Chinese translated version of Documentation/driver-api/media/index.rst
-
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
-
-Maintainer: Mauro Carvalho Chehab <mchehab@kernel.org>
-Chinese maintainer: Fu Wei <tekkamanninja@gmail.com>
----------------------------------------------------------------------
-Documentation/driver-api/media/index.rst 的中文翻译
-
-如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
-交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者。
-英文版维护者： Mauro Carvalho Chehab <mchehab@kernel.org>
-中文版维护者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-中文版翻译者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-中文版校译者： 傅炜 Fu Wei <tekkamanninja@gmail.com>
-
-
-以下为正文
----------------------------------------------------------------------
-V4L2 驱动框架概览
-==============
-
-本文档描述 V4L2 框架所提供的各种结构和它们之间的关系。
-
-
-介绍
-----
-
-大部分现代 V4L2 设备由多个 IC 组成，在 /dev 下导出多个设备节点，
-并同时创建非 V4L2 设备（如 DVB、ALSA、FB、I2C 和红外输入设备）。
-由于这种硬件的复杂性，V4L2 驱动也变得非常复杂。
-
-尤其是 V4L2 必须支持 IC 实现音视频的多路复用和编解码，这就更增加了其
-复杂性。通常这些 IC 通过一个或多个 I2C 总线连接到主桥驱动器，但也可
-使用其他总线。这些设备称为“子设备”。
-
-长期以来，这个框架仅限于通过 video_device 结构体创建 V4L 设备节点，
-并使用 video_buf 处理视频缓冲（注：本文不讨论 video_buf 框架）。
-
-这意味着所有驱动必须自己设置设备实例并连接到子设备。其中一部分要正确地
-完成是比较复杂的，使得许多驱动都没有正确地实现。
-
-由于框架的缺失，有很多通用代码都不可重复利用。
-
-因此，这个框架构建所有驱动都需要的基本结构块，而统一的框架将使通用代码
-创建成实用函数并在所有驱动中共享变得更加容易。
-
-
-驱动结构
--------
-
-所有 V4L2 驱动都有如下结构：
-
-1) 每个设备实例的结构体--包含其设备状态。
-
-2) 初始化和控制子设备的方法（如果有）。
-
-3) 创建 V4L2 设备节点 (/dev/videoX、/dev/vbiX 和 /dev/radioX)
-   并跟踪设备节点的特定数据。
-
-4) 特定文件句柄结构体--包含每个文件句柄的数据。
-
-5) 视频缓冲处理。
-
-以下是它们的初略关系图：
-
-    device instances（设备实例）
-      |
-      +-sub-device instances（子设备实例）
-      |
-      \-V4L2 device nodes（V4L2 设备节点）
-	  |
-	  \-filehandle instances（文件句柄实例）
-
-
-框架结构
--------
-
-该框架非常类似驱动结构：它有一个 v4l2_device 结构用于保存设备
-实例的数据；一个 v4l2_subdev 结构体代表子设备实例；video_device
-结构体保存 V4L2 设备节点的数据；将来 v4l2_fh 结构体将跟踪文件句柄
-实例（暂未尚未实现）。
-
-V4L2 框架也可与媒体框架整合（可选的）。如果驱动设置了 v4l2_device
-结构体的 mdev 域，子设备和视频节点的入口将自动出现在媒体框架中。
-
-
-v4l2_device 结构体
-----------------
-
-每个设备实例都通过 v4l2_device (v4l2-device.h)结构体来表示。
-简单设备可以仅分配这个结构体，但在大多数情况下，都会将这个结构体
-嵌入到一个更大的结构体中。
-
-你必须注册这个设备实例：
-
-	v4l2_device_register(struct device *dev, struct v4l2_device *v4l2_dev);
-
-注册操作将会初始化 v4l2_device 结构体。如果 dev->driver_data 域
-为 NULL，就将其指向 v4l2_dev。
-
-需要与媒体框架整合的驱动必须手动设置 dev->driver_data，指向包含
-v4l2_device 结构体实例的驱动特定设备结构体。这可以在注册 V4L2 设备
-实例前通过 dev_set_drvdata() 函数完成。同时必须设置 v4l2_device
-结构体的 mdev 域，指向适当的初始化并注册过的 media_device 实例。
-
-如果 v4l2_dev->name 为空，则它将被设置为从 dev 中衍生出的值（为了
-更加精确，形式为驱动名后跟 bus_id）。如果你在调用 v4l2_device_register
-前已经设置好了，则不会被修改。如果 dev 为 NULL，则你*必须*在调用
-v4l2_device_register 前设置 v4l2_dev->name。
-
-你可以基于驱动名和驱动的全局 atomic_t 类型的实例编号，通过
-v4l2_device_set_name() 设置 name。这样会生成类似 ivtv0、ivtv1 等
-名字。若驱动名以数字结尾，则会在编号和驱动名间插入一个破折号，如：
-cx18-0、cx18-1 等。此函数返回实例编号。
-
-第一个 “dev” 参数通常是一个指向 pci_dev、usb_interface 或
-platform_device 的指针。很少使其为 NULL，除非是一个ISA设备或者
-当一个设备创建了多个 PCI 设备，使得 v4l2_dev 无法与一个特定的父设备
-关联。
-
-你也可以提供一个 notify() 回调，使子设备可以调用它实现事件通知。
-但这个设置与子设备相关。子设备支持的任何通知必须在
-include/media/<subdevice>.h 中定义一个消息头。
-
-注销 v4l2_device 使用如下函数：
-
-	v4l2_device_unregister(struct v4l2_device *v4l2_dev);
-
-如果 dev->driver_data 域指向 v4l2_dev，将会被重置为 NULL。注销同时
-会自动从设备中注销所有子设备。
-
-如果你有一个热插拔设备（如USB设备），则当断开发生时，父设备将无效。
-由于 v4l2_device 有一个指向父设备的指针必须被清除，同时标志父设备
-已消失，所以必须调用以下函数：
-
-	v4l2_device_disconnect(struct v4l2_device *v4l2_dev);
-
-这个函数并*不*注销子设备，因此你依然要调用 v4l2_device_unregister()
-函数。如果你的驱动器并非热插拔的，就没有必要调用 v4l2_device_disconnect()。
-
-有时你需要遍历所有被特定驱动注册的设备。这通常发生在多个设备驱动使用
-同一个硬件的情况下。如：ivtvfb 驱动是一个使用 ivtv 硬件的帧缓冲驱动，
-同时 alsa 驱动也使用此硬件。
-
-你可以使用如下例程遍历所有注册的设备：
-
-static int callback(struct device *dev, void *p)
-{
-	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
-
-	/* 测试这个设备是否已经初始化 */
-	if (v4l2_dev == NULL)
-		return 0;
-	...
-	return 0;
-}
-
-int iterate(void *p)
-{
-	struct device_driver *drv;
-	int err;
-
-	/* 在PCI 总线上查找ivtv驱动。
-	   pci_bus_type是全局的. 对于USB总线使用usb_bus_type。 */
-	drv = driver_find("ivtv", &pci_bus_type);
-	/* 遍历所有的ivtv设备实例 */
-	err = driver_for_each_device(drv, NULL, p, callback);
-	put_driver(drv);
-	return err;
-}
-
-有时你需要一个设备实例的运行计数。这个通常用于映射一个设备实例到一个
-模块选择数组的索引。
-
-推荐方法如下：
-
-static atomic_t drv_instance = ATOMIC_INIT(0);
-
-static int drv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
-{
-	...
-	state->instance = atomic_inc_return(&drv_instance) - 1;
-}
-
-如果你有多个设备节点，对于热插拔设备，知道何时注销 v4l2_device 结构体
-就比较困难。为此 v4l2_device 有引用计数支持。当调用 video_register_device
-时增加引用计数，而设备节点释放时减小引用计数。当引用计数为零，则
-v4l2_device 的release() 回调将被执行。你就可以在此时做最后的清理工作。
-
-如果创建了其他设备节点（比如 ALSA），则你可以通过以下函数手动增减
-引用计数：
-
-void v4l2_device_get(struct v4l2_device *v4l2_dev);
-
-或:
-
-int v4l2_device_put(struct v4l2_device *v4l2_dev);
-
-由于引用技术初始化为 1 ，你也需要在 disconnect() 回调（对于 USB 设备）中
-调用 v4l2_device_put，或者 remove() 回调（例如对于 PCI 设备），否则
-引用计数将永远不会为 0 。
-
-v4l2_subdev结构体
-------------------
-
-许多驱动需要与子设备通信。这些设备可以完成各种任务，但通常他们负责
-音视频复用和编解码。如网络摄像头的子设备通常是传感器和摄像头控制器。
-
-这些一般为 I2C 接口设备，但并不一定都是。为了给驱动提供调用子设备的
-统一接口，v4l2_subdev 结构体（v4l2-subdev.h）产生了。
-
-每个子设备驱动都必须有一个 v4l2_subdev 结构体。这个结构体可以单独
-代表一个简单的子设备，也可以嵌入到一个更大的结构体中，与更多设备状态
-信息保存在一起。通常有一个下级设备结构体（比如：i2c_client）包含了
-内核创建的设备数据。建议使用 v4l2_set_subdevdata() 将这个结构体的
-指针保存在 v4l2_subdev 的私有数据域(dev_priv)中。这使得通过 v4l2_subdev
-找到实际的低层总线特定设备数据变得容易。
-
-你同时需要一个从低层结构体获取 v4l2_subdev 指针的方法。对于常用的
-i2c_client 结构体，i2c_set_clientdata() 函数可用于保存一个 v4l2_subdev
-指针；对于其他总线你可能需要使用其他相关函数。
-
-桥驱动中也应保存每个子设备的私有数据，比如一个指向特定桥的各设备私有
-数据的指针。为此 v4l2_subdev 结构体提供主机私有数据域(host_priv)，
-并可通过 v4l2_get_subdev_hostdata() 和 v4l2_set_subdev_hostdata()
-访问。
-
-从总线桥驱动的视角，驱动加载子设备模块并以某种方式获得 v4l2_subdev
-结构体指针。对于 i2c 总线设备相对简单：调用 i2c_get_clientdata()。
-对于其他总线也需要做类似的操作。针对 I2C 总线上的子设备辅助函数帮你
-完成了大部分复杂的工作。
-
-每个 v4l2_subdev 都包含子设备驱动需要实现的函数指针（如果对此设备
-不适用，可为NULL）。由于子设备可完成许多不同的工作，而在一个庞大的
-函数指针结构体中通常仅有少数有用的函数实现其功能肯定不合适。所以，
-函数指针根据其实现的功能被分类，每一类都有自己的函数指针结构体。
-
-顶层函数指针结构体包含了指向各类函数指针结构体的指针，如果子设备驱动
-不支持该类函数中的任何一个功能，则指向该类结构体的指针为NULL。
-
-这些结构体定义如下：
-
-struct v4l2_subdev_core_ops {
-	int (*log_status)(struct v4l2_subdev *sd);
-	int (*init)(struct v4l2_subdev *sd, u32 val);
-	...
-};
-
-struct v4l2_subdev_tuner_ops {
-	...
-};
-
-struct v4l2_subdev_audio_ops {
-	...
-};
-
-struct v4l2_subdev_video_ops {
-	...
-};
-
-struct v4l2_subdev_pad_ops {
-	...
-};
-
-struct v4l2_subdev_ops {
-	const struct v4l2_subdev_core_ops  *core;
-	const struct v4l2_subdev_tuner_ops *tuner;
-	const struct v4l2_subdev_audio_ops *audio;
-	const struct v4l2_subdev_video_ops *video;
-	const struct v4l2_subdev_pad_ops *video;
-};
-
-其中 core（核心）函数集通常可用于所有子设备，其他类别的实现依赖于
-子设备。如视频设备可能不支持音频操作函数，反之亦然。
-
-这样的设置在限制了函数指针数量的同时，还使增加新的操作函数和分类
-变得较为容易。
-
-子设备驱动可使用如下函数初始化 v4l2_subdev 结构体：
-
-	v4l2_subdev_init(sd, &ops);
-
-然后，你必须用一个唯一的名字初始化 subdev->name，并初始化模块的
-owner 域。若使用 i2c 辅助函数，这些都会帮你处理好。
-
-若需同媒体框架整合，你必须调用 media_entity_pads_init() 初始化 v4l2_subdev
-结构体中的 media_entity 结构体（entity 域）：
-
-	struct media_pad *pads = &my_sd->pads;
-	int err;
-
-	err = media_entity_pads_init(&sd->entity, npads, pads);
-
-pads 数组必须预先初始化。无须手动设置 media_entity 的 type 和
-name 域，但如有必要，revision 域必须初始化。
-
-当（任何）子设备节点被打开/关闭，对 entity 的引用将被自动获取/释放。
-
-在子设备被注销之后，不要忘记清理 media_entity 结构体：
-
-	media_entity_cleanup(&sd->entity);
-
-如果子设备驱动趋向于处理视频并整合进了媒体框架，必须使用 v4l2_subdev_pad_ops
-替代 v4l2_subdev_video_ops 实现格式相关的功能。
-
-这种情况下，子设备驱动应该设置 link_validate 域，以提供它自身的链接
-验证函数。链接验证函数应对管道（两端链接的都是 V4L2 子设备）中的每个
-链接调用。驱动还要负责验证子设备和视频节点间格式配置的正确性。
-
-如果 link_validate 操作没有设置，默认的 v4l2_subdev_link_validate_default()
-函数将会被调用。这个函数保证宽、高和媒体总线像素格式在链接的收发两端
-都一致。子设备驱动除了它们自己的检测外，也可以自由使用这个函数以执行
-上面提到的检查。
-
-设备（桥）驱动程序必须向 v4l2_device 注册 v4l2_subdev：
-
-	int err = v4l2_device_register_subdev(v4l2_dev, sd);
-
-如果子设备模块在它注册前消失，这个操作可能失败。在这个函数成功返回后，
-subdev->dev 域就指向了 v4l2_device。
-
-如果 v4l2_device 父设备的 mdev 域为非 NULL 值，则子设备实体将被自动
-注册为媒体设备。
-
-注销子设备则可用如下函数：
-
-	v4l2_device_unregister_subdev(sd);
-
-此后，子设备模块就可卸载，且 sd->dev == NULL。
-
-注册之设备后，可通过以下方式直接调用其操作函数：
-
-	err = sd->ops->core->g_std(sd, &norm);
-
-但使用如下宏会比较容易且合适：
-
-	err = v4l2_subdev_call(sd, core, g_std, &norm);
-
-这个宏将会做 NULL 指针检查，如果 subdev 为 NULL，则返回-ENODEV；如果
-subdev->core 或 subdev->core->g_std 为 NULL，则返回 -ENOIOCTLCMD；
-否则将返回 subdev->ops->core->g_std ops 调用的实际结果。
-
-有时也可能同时调用所有或一系列子设备的某个操作函数：
-
-	v4l2_device_call_all(v4l2_dev, 0, core, g_std, &norm);
-
-任何不支持此操作的子设备都会被跳过，并忽略错误返回值。但如果你需要
-检查出错码，则可使用如下函数：
-
-	err = v4l2_device_call_until_err(v4l2_dev, 0, core, g_std, &norm);
-
-除 -ENOIOCTLCMD 外的任何错误都会跳出循环并返回错误值。如果（除 -ENOIOCTLCMD
-外）没有错误发生，则返回 0。
-
-对于以上两个函数的第二个参数为组 ID。如果为 0，则所有子设备都会执行
-这个操作。如果为非 0 值，则只有那些组 ID 匹配的子设备才会执行此操作。
-在桥驱动注册一个子设备前，可以设置 sd->grp_id 为任何期望值（默认值为
-0）。这个值属于桥驱动，且子设备驱动将不会修改和使用它。
-
-组 ID 赋予了桥驱动更多对于如何调用回调的控制。例如，电路板上有多个
-音频芯片，每个都有改变音量的能力。但当用户想要改变音量的时候，通常
-只有一个会被实际使用。你可以对这样的子设备设置组 ID 为（例如 AUDIO_CONTROLLER）
-并在调用 v4l2_device_call_all() 时指定它为组 ID 值。这就保证了只有
-需要的子设备才会执行这个回调。
-
-如果子设备需要通知它的 v4l2_device 父设备一个事件，可以调用
-v4l2_subdev_notify(sd, notification, arg)。这个宏检查是否有一个
-notify() 回调被注册，如果没有，返回 -ENODEV。否则返回 notify() 调用
-结果。
-
-使用 v4l2_subdev 的好处在于它是一个通用结构体，且不包含任何底层硬件
-信息。所有驱动可以包含多个 I2C 总线的子设备，但也有子设备是通过 GPIO
-控制。这个区别仅在配置设备时有关系，一旦子设备注册完成，对于 v4l2
-子系统来说就完全透明了。
-
-
-V4L2 子设备用户空间API
---------------------
-
-除了通过 v4l2_subdev_ops 结构导出的内核 API，V4L2 子设备也可以直接
-通过用户空间应用程序来控制。
-
-可以在 /dev 中创建名为 v4l-subdevX 设备节点，以通过其直接访问子设备。
-如果子设备支持用户空间直接配置，必须在注册前设置 V4L2_SUBDEV_FL_HAS_DEVNODE
-标志。
-
-注册子设备之后， v4l2_device 驱动会通过调用 v4l2_device_register_subdev_nodes()
-函数为所有已注册并设置了 V4L2_SUBDEV_FL_HAS_DEVNODE 的子设备创建
-设备节点。这些设备节点会在子设备注销时自动删除。
-
-这些设备节点处理 V4L2 API 的一个子集。
-
-VIDIOC_QUERYCTRL
-VIDIOC_QUERYMENU
-VIDIOC_G_CTRL
-VIDIOC_S_CTRL
-VIDIOC_G_EXT_CTRLS
-VIDIOC_S_EXT_CTRLS
-VIDIOC_TRY_EXT_CTRLS
-
-	这些 ioctls 控制与 V4L2 中定义的一致。他们行为相同，唯一的
-	不同是他们只处理子设备的控制实现。根据驱动程序，这些控制也
-	可以通过一个（或多个） V4L2 设备节点访问。
-
-VIDIOC_DQEVENT
-VIDIOC_SUBSCRIBE_EVENT
-VIDIOC_UNSUBSCRIBE_EVENT
-
-	这些  ioctls 事件与 V4L2 中定义的一致。他们行为相同，唯一的
-	不同是他们只处理子设备产生的事件。根据驱动程序，这些事件也
-	可以通过一个（或多个） V4L2 设备节点上报。
-
-	要使用事件通知的子设备驱动，在注册子设备前必须在 v4l2_subdev::flags
-	中设置 V4L2_SUBDEV_USES_EVENTS 并在 v4l2_subdev::nevents
-	中初始化事件队列深度。注册完成后，事件会在 v4l2_subdev::devnode
-	设备节点中像通常一样被排队。
-
-	为正确支持事件机制，poll() 文件操作也应被实现。
-
-私有 ioctls
-
-	不在以上列表中的所有 ioctls 会通过 core::ioctl 操作直接传递
-	给子设备驱动。
-
-
-I2C 子设备驱动
--------------
-
-由于这些驱动很常见，所以内特提供了特定的辅助函数(v4l2-common.h)让这些
-设备的使用更加容易。
-
-添加 v4l2_subdev 支持的推荐方法是让 I2C 驱动将 v4l2_subdev 结构体
-嵌入到为每个 I2C 设备实例创建的状态结构体中。而最简单的设备没有状态
-结构体，此时可以直接创建一个 v4l2_subdev 结构体。
-
-一个典型的状态结构体如下所示（‘chipname’用芯片名代替）：
-
-struct chipname_state {
-	struct v4l2_subdev sd;
-	...  /* 附加的状态域*/
-};
-
-初始化 v4l2_subdev 结构体的方法如下：
-
-	v4l2_i2c_subdev_init(&state->sd, client, subdev_ops);
-
-这个函数将填充 v4l2_subdev 结构体中的所有域，并保证 v4l2_subdev 和
-i2c_client 都指向彼此。
-
-同时，你也应该为从 v4l2_subdev 指针找到 chipname_state 结构体指针
-添加一个辅助内联函数。
-
-static inline struct chipname_state *to_state(struct v4l2_subdev *sd)
-{
-	return container_of(sd, struct chipname_state, sd);
-}
-
-使用以下函数可以通过 v4l2_subdev 结构体指针获得 i2c_client 结构体
-指针：
-
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-
-而以下函数则相反，通过 i2c_client 结构体指针获得 v4l2_subdev 结构体
-指针：
-
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-
-当 remove()函数被调用前，必须保证先调用 v4l2_device_unregister_subdev(sd)。
-此操作将会从桥驱动中注销子设备。即使子设备没有注册，调用此函数也是
-安全的。
-
-必须这样做的原因是：当桥驱动注销 i2c 适配器时，remove()回调函数
-会被那个适配器上的 i2c 设备调用。此后，相应的 v4l2_subdev 结构体
-就不存在了，所有它们必须先被注销。在 remove()回调函数中调用
-v4l2_device_unregister_subdev(sd)，可以保证执行总是正确的。
-
-
-桥驱动也有一些辅组函数可用：
-
-struct v4l2_subdev *sd = v4l2_i2c_new_subdev(v4l2_dev, adapter,
-	       "module_foo", "chipid", 0x36, NULL);
-
-这个函数会加载给定的模块（如果没有模块需要加载，可以为 NULL），
-并用给定的 i2c 适配器结构体指针（i2c_adapter）和 器件地址（chip/address）
-作为参数调用 i2c_new_client_device()。如果一切顺利，则就在 v4l2_device
-中注册了子设备。
-
-你也可以利用 v4l2_i2c_new_subdev()的最后一个参数，传递一个可能的
-I2C 地址数组，让函数自动探测。这些探测地址只有在前一个参数为 0 的
-情况下使用。非零参数意味着你知道准确的 i2c 地址，所以此时无须进行
-探测。
-
-如果出错，两个函数都返回 NULL。
-
-注意：传递给 v4l2_i2c_new_subdev()的 chipid 通常与模块名一致。
-它允许你指定一个芯片的变体，比如“saa7114”或“saa7115”。一般通过
-i2c 驱动自动探测。chipid 的使用是在今后需要深入了解的事情。这个与
-i2c 驱动不同，较容易混淆。要知道支持哪些芯片变体，你可以查阅 i2c
-驱动代码的 i2c_device_id 表，上面列出了所有可能支持的芯片。
-
-还有两个辅助函数：
-
-v4l2_i2c_new_subdev_cfg：这个函数添加新的 irq 和 platform_data
-参数，并有‘addr’和‘probed_addrs’参数：如果 addr 非零，则被使用
-（不探测变体），否则 probed_addrs 中的地址将用于自动探测。
-
-例如：以下代码将会探测地址（0x10）：
-
-struct v4l2_subdev *sd = v4l2_i2c_new_subdev_cfg(v4l2_dev, adapter,
-	       "module_foo", "chipid", 0, NULL, 0, I2C_ADDRS(0x10));
-
-v4l2_i2c_new_subdev_board 使用一个 i2c_board_info 结构体，将其
-替代 irq、platform_data 和 add r参数传递给 i2c 驱动。
-
-如果子设备支持 s_config 核心操作，这个操作会在子设备配置好之后以 irq 和
-platform_data 为参数调用。早期的 v4l2_i2c_new_(probed_)subdev 函数
-同样也会调用 s_config，但仅在 irq 为 0 且 platform_data 为 NULL 时。
-
-video_device结构体
------------------
-
-在 /dev 目录下的实际设备节点根据 video_device 结构体(v4l2-dev.h)
-创建。此结构体既可以动态分配也可以嵌入到一个更大的结构体中。
-
-动态分配方法如下：
-
-	struct video_device *vdev = video_device_alloc();
-
-	if (vdev == NULL)
-		return -ENOMEM;
-
-	vdev->release = video_device_release;
-
-如果将其嵌入到一个大结构体中，则必须自己实现 release()回调。
-
-	struct video_device *vdev = &my_vdev->vdev;
-
-	vdev->release = my_vdev_release;
-
-release()回调必须被设置，且在最后一个 video_device 用户退出之后
-被调用。
-
-默认的 video_device_release()回调只是调用 kfree 来释放之前分配的
-内存。
-
-你应该设置这些域：
-
-- v4l2_dev: 设置为 v4l2_device 父设备。
-
-- name: 设置为唯一的描述性设备名。
-
-- fops: 设置为已有的 v4l2_file_operations 结构体。
-
-- ioctl_ops: 如果你使用v4l2_ioctl_ops 来简化 ioctl 的维护
-  (强烈建议使用，且将来可能变为强制性的!)，然后设置你自己的
-  v4l2_ioctl_ops 结构体.
-
-- lock: 如果你要在驱动中实现所有的锁操作，则设为 NULL 。否则
-  就要设置一个指向 struct mutex_lock 结构体的指针，这个锁将
-  在 unlocked_ioctl 文件操作被调用前由内核获得，并在调用返回后
-  释放。详见下一节。
-
-- prio: 保持对优先级的跟踪。用于实现 VIDIOC_G/S_PRIORITY。如果
-  设置为 NULL，则会使用 v4l2_device 中的 v4l2_prio_state 结构体。
-  如果要对每个设备节点（组）实现独立的优先级，可以将其指向自己
-  实现的 v4l2_prio_state 结构体。
-
-- parent: 仅在使用 NULL 作为父设备结构体参数注册 v4l2_device 时
-  设置此参数。只有在一个硬件设备包含多一个 PCI 设备，共享同一个
-  v4l2_device 核心时才会发生。
-
-  cx88 驱动就是一个例子：一个 v4l2_device 结构体核心，被一个裸的
-  视频 PCI 设备(cx8800)和一个 MPEG PCI 设备(cx8802)共用。由于
-  v4l2_device 无法与特定的 PCI 设备关联，所有没有设置父设备。但当
-  video_device 配置后，就知道使用哪个父 PCI 设备了。
-
-如果你使用 v4l2_ioctl_ops，则应该在 v4l2_file_operations 结构体中
-设置 .unlocked_ioctl 指向 video_ioctl2。
-
-请勿使用 .ioctl！它已被废弃，今后将消失。
-
-某些情况下你要告诉核心：你在 v4l2_ioctl_ops 指定的某个函数应被忽略。
-你可以在 video_device_register 被调用前通过以下函数标记这个 ioctls。
-
-void v4l2_disable_ioctl(struct video_device *vdev, unsigned int cmd);
-
-基于外部因素（例如某个板卡已被使用），在不创建新结构体的情况下，你想
-要关闭 v4l2_ioctl_ops 中某个特性往往需要这个机制。
-
-v4l2_file_operations 结构体是 file_operations 的一个子集。其主要
-区别在于：因 inode 参数从未被使用，它将被忽略。
-
-如果需要与媒体框架整合，你必须通过调用 media_entity_pads_init() 初始化
-嵌入在 video_device 结构体中的 media_entity（entity 域）结构体：
-
-	struct media_pad *pad = &my_vdev->pad;
-	int err;
-
-	err = media_entity_pads_init(&vdev->entity, 1, pad);
-
-pads 数组必须预先初始化。没有必要手动设置 media_entity 的 type 和
-name 域。
-
-当（任何）子设备节点被打开/关闭，对 entity 的引用将被自动获取/释放。
-
-v4l2_file_operations 与锁
---------------------------
-
-你可以在 video_device 结构体中设置一个指向 mutex_lock 的指针。通常
-这既可是一个顶层互斥锁也可为设备节点自身的互斥锁。默认情况下，此锁
-用于 unlocked_ioctl，但为了使用 ioctls 你通过以下函数可禁用锁定：
-
-	void v4l2_disable_ioctl_locking(struct video_device *vdev, unsigned int cmd);
-
-例如: v4l2_disable_ioctl_locking(vdev, VIDIOC_DQBUF);
-
-你必须在注册 video_device 前调用这个函数。
-
-特别是对于 USB 驱动程序，某些命令（如设置控制）需要很长的时间，可能
-需要自行为缓冲区队列的 ioctls 实现锁定。
-
-如果你需要更细粒度的锁，你必须设置 mutex_lock 为 NULL，并完全自己实现
-锁机制。
-
-这完全由驱动开发者决定使用何种方法。然而，如果你的驱动存在长延时操作
-（例如，改变 USB 摄像头的曝光时间可能需要较长时间），而你又想让用户
-在等待长延时操作完成期间做其他的事，则你最好自己实现锁机制。
-
-如果指定一个锁，则所有 ioctl 操作将在这个锁的作用下串行执行。如果你
-使用 videobuf，则必须将同一个锁传递给 videobuf 队列初始化函数；如
-videobuf 必须等待一帧的到达，则可临时解锁并在这之后重新上锁。如果驱动
-也在代码执行期间等待，则可做同样的工作（临时解锁，再上锁）让其他进程
-可以在第一个进程阻塞时访问设备节点。
-
-在使用 videobuf2 的情况下，必须实现 wait_prepare 和 wait_finish 回调
-在适当的时候解锁/加锁。进一步来说，如果你在 video_device 结构体中使用
-锁，则必须在 wait_prepare 和 wait_finish 中对这个互斥锁进行解锁/加锁。
-
-热插拔的断开实现也必须在调用 v4l2_device_disconnect 前获得锁。
-
-video_device注册
----------------
-
-接下来你需要注册视频设备：这会为你创建一个字符设备。
-
-	err = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
-	if (err) {
-		video_device_release(vdev); /* or kfree(my_vdev); */
-		return err;
-	}
-
-如果 v4l2_device 父设备的 mdev 域为非 NULL 值，视频设备实体将自动
-注册为媒体设备。
-
-注册哪种设备是根据类型（type）参数。存在以下类型：
-
-VFL_TYPE_VIDEO: 用于视频输入/输出设备的 videoX
-VFL_TYPE_VBI: 用于垂直消隐数据的 vbiX (例如，隐藏式字幕，图文电视)
-VFL_TYPE_RADIO: 用于广播调谐器的 radioX
-
-最后一个参数让你确定一个所控制设备的设备节点号数量(例如 videoX 中的 X)。
-通常你可以传入-1，让 v4l2 框架自己选择第一个空闲的编号。但是有时用户
-需要选择一个特定的节点号。驱动允许用户通过驱动模块参数选择一个特定的
-设备节点号是很普遍的。这个编号将会传递给这个函数，且 video_register_device
-将会试图选择这个设备节点号。如果这个编号被占用，下一个空闲的设备节点
-编号将被选中，并向内核日志中发送一个警告信息。
-
-另一个使用场景是当驱动创建多个设备时。这种情况下，对不同的视频设备在
-编号上使用不同的范围是很有用的。例如，视频捕获设备从 0 开始，视频
-输出设备从 16 开始。所以你可以使用最后一个参数来指定设备节点号最小值，
-而 v4l2 框架会试图选择第一个的空闲编号（等于或大于你提供的编号）。
-如果失败，则它会就选择第一个空闲的编号。
-
-由于这种情况下，你会忽略无法选择特定设备节点号的警告，则可调用
-video_register_device_no_warn() 函数避免警告信息的产生。
-
-只要设备节点被创建，一些属性也会同时创建。在 /sys/class/video4linux
-目录中你会找到这些设备。例如进入其中的 video0 目录，你会看到‘name’和
-‘index’属性。‘name’属性值就是 video_device 结构体中的‘name’域。
-
-‘index’属性值就是设备节点的索引值：每次调用 video_register_device()，
-索引值都递增 1 。第一个视频设备节点总是从索引值 0 开始。
-
-用户可以设置 udev 规则，利用索引属性生成花哨的设备名（例如：用‘mpegX’
-代表 MPEG 视频捕获设备节点）。
-
-在设备成功注册后，就可以使用这些域：
-
-- vfl_type: 传递给 video_register_device 的设备类型。
-- minor: 已指派的次设备号。
-- num: 设备节点编号 (例如 videoX 中的 X)。
-- index: 设备索引号。
-
-如果注册失败，你必须调用 video_device_release() 来释放已分配的
-video_device 结构体；如果 video_device 是嵌入在自己创建的结构体中，
-你也必须释放它。vdev->release() 回调不会在注册失败之后被调用，
-你也不应试图在注册失败后注销设备。
-
-
-video_device 注销
-----------------
-
-当视频设备节点已被移除，不论是卸载驱动还是USB设备断开，你都应注销
-它们：
-
-	video_unregister_device(vdev);
-
-这个操作将从 sysfs 中移除设备节点（导致 udev 将其从 /dev 中移除）。
-
-video_unregister_device() 返回之后，就无法完成打开操作。尽管如此，
-USB 设备的情况则不同，某些应用程序可能依然打开着其中一个已注销设备
-节点。所以在注销之后，所有文件操作（当然除了 release ）也应返回错误值。
-
-当最后一个视频设备节点的用户退出，则 vdev->release() 回调会被调用，
-并且你可以做最后的清理操作。
-
-不要忘记清理与视频设备相关的媒体入口（如果被初始化过）：
-
-	media_entity_cleanup(&vdev->entity);
-
-这可以在 release 回调中完成。
-
-
-video_device 辅助函数
----------------------
-
-一些有用的辅助函数如下：
-
-- file/video_device 私有数据
-
-你可以用以下函数在 video_device 结构体中设置/获取驱动私有数据：
-
-void *video_get_drvdata(struct video_device *vdev);
-void video_set_drvdata(struct video_device *vdev, void *data);
-
-注意：在调用 video_register_device() 前执行 video_set_drvdata()
-是安全的。
-
-而以下函数：
-
-struct video_device *video_devdata(struct file *file);
-
-返回 file 结构体中拥有的的 video_device 指针。
-
-video_drvdata 辅助函数结合了 video_get_drvdata 和 video_devdata
-的功能：
-
-void *video_drvdata(struct file *file);
-
-你可以使用如下代码从 video_device 结构体中获取 v4l2_device 结构体
-指针：
-
-struct v4l2_device *v4l2_dev = vdev->v4l2_dev;
-
-- 设备节点名
-
-video_device 设备节点在内核中的名称可以通过以下函数获得
-
-const char *video_device_node_name(struct video_device *vdev);
-
-这个名字被用户空间工具（例如 udev）作为提示信息使用。应尽可能使用
-此功能，而非访问 video_device::num 和 video_device::minor 域。
-
-
-v4l2_fh 结构体
--------------
-
-v4l2_fh 结构体提供一个保存用于 V4L2 框架的文件句柄特定数据的简单方法。
-如果 video_device 标志，新驱动
-必须使用 v4l2_fh 结构体，因为它也用于实现优先级处理（VIDIOC_G/S_PRIORITY）。
-
-v4l2_fh 结构体作为驱动自身文件句柄结构体的一部分被分配，且驱动在
-其打开函数中将 file->private_data 指向它。
-
-在许多情况下，v4l2_fh 结构体会嵌入到一个更大的结构体中。这钟情况下，
-应该在 open() 中调用 v4l2_fh_init+v4l2_fh_add，并在 release() 中
-调用 v4l2_fh_del+v4l2_fh_exit。
-
-驱动可以通过使用 container_of 宏提取他们自己的文件句柄结构体。例如：
-
-struct my_fh {
-	int blah;
-	struct v4l2_fh fh;
-};
-
-...
-
-int my_open(struct file *file)
-{
-	struct my_fh *my_fh;
-	struct video_device *vfd;
-	int ret;
-
-	...
-
-	my_fh = kzalloc_obj(*my_fh);
-
-	...
-
-	v4l2_fh_init(&my_fh->fh, vfd);
-
-	...
-
-	v4l2_fh_add(&my_fh->fh, file);
-	return 0;
-}
-
-int my_release(struct file *file)
-{
-	struct v4l2_fh *fh = file_to_v4l2_fh(file);
-	struct my_fh *my_fh = container_of(fh, struct my_fh, fh);
-
-	...
-	v4l2_fh_del(&my_fh->fh, file);
-	v4l2_fh_exit(&my_fh->fh);
-	kfree(my_fh);
-	return 0;
-}
-
-以下是 v4l2_fh 函数使用的简介：
-
-void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
-
-  初始化文件句柄。这*必须*在驱动的 v4l2_file_operations->open()
-  函数中执行。
-
-void v4l2_fh_add(struct v4l2_fh *fh, struct file *filp)
-
-  添加一个 v4l2_fh 到 video_device 文件句柄列表。一旦文件句柄
-  初始化完成就必须调用。
-
-void v4l2_fh_del(struct v4l2_fh *fh, struct file *filp)
-
-  从 video_device() 中解除文件句柄的关联。文件句柄的退出函数也
-  将被调用。
-
-void v4l2_fh_exit(struct v4l2_fh *fh)
-
-  清理文件句柄。在清理完 v4l2_fh 后，相关内存会被释放。
-
-
-如果 v4l2_fh 不是嵌入在其他结构体中的，则可以用这些辅助函数：
-
-int v4l2_fh_open(struct file *filp)
-
-  分配一个 v4l2_fh 结构体空间，初始化并将其添加到 file 结构体相关的
-  video_device 结构体中。
-
-int v4l2_fh_release(struct file *filp)
-
-  从 file 结构体相关的 video_device 结构体中删除 v4l2_fh ，清理
-  v4l2_fh 并释放空间。
-
-这两个函数可以插入到 v4l2_file_operation 的 open() 和 release()
-操作中。
-
-
-某些驱动需要在第一个文件句柄打开和最后一个文件句柄关闭的时候做些
-工作。所以加入了两个辅助函数以检查 v4l2_fh 结构体是否是相关设备
-节点打开的唯一文件句柄。
-
-int v4l2_fh_is_singular(struct v4l2_fh *fh)
-
-  如果此文件句柄是唯一打开的文件句柄，则返回 1 ，否则返回 0 。
-
-int v4l2_fh_is_singular_file(struct file *filp)
-
-  功能相同，但通过 filp->private_data 调用 v4l2_fh_is_singular。
-
-
-V4L2 事件机制
------------
-
-V4L2 事件机制提供了一个通用的方法将事件传递到用户空间。驱动必须使用
-v4l2_fh 才能支持 V4L2 事件机制。
-
-
-事件通过一个类型和选择 ID 来定义。ID 对应一个 V4L2 对象，例如
-一个控制 ID。如果未使用，则 ID 为 0。
-
-当用户订阅一个事件，驱动会为此分配一些 kevent 结构体。所以每个
-事件组（类型、ID）都会有自己的一套 kevent 结构体。这保证了如果
-一个驱动短时间内产生了许多同类事件，不会覆盖其他类型的事件。
-
-但如果你收到的事件数量大于同类事件 kevent 的保存数量，则最早的
-事件将被丢弃，并加入新事件。
-
-此外，v4l2_subscribed_event 结构体内部有可供驱动设置的 merge() 和
-replace() 回调，这些回调会在新事件产生且没有多余空间的时候被调用。
-replace() 回调让你可以将早期事件的净荷替换为新事件的净荷，将早期
-净荷的相关数据合并到替换进来的新净荷中。当该类型的事件仅分配了一个
-kevent 结构体时，它将被调用。merge() 回调让你可以合并最早的事件净荷
-到在它之后的那个事件净荷中。当该类型的事件分配了两个或更多 kevent
-结构体时，它将被调用。
-
-这种方法不会有状态信息丢失，只会导致中间步骤信息丢失。
-
-
-关于 replace/merge 回调的一个不错的例子在 v4l2-event.c 中：用于
-控制事件的 ctrls_replace() 和 ctrls_merge() 回调。
-
-注意：这些回调可以在中断上下文中调用，所以它们必须尽快完成并退出。
-
-有用的函数：
-
-void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
-
-  将事件加入视频设备的队列。驱动仅负责填充 type 和 data 域。
-  其他域由 V4L2 填充。
-
-int v4l2_event_subscribe(struct v4l2_fh *fh,
-			 struct v4l2_event_subscription *sub, unsigned elems,
-			 const struct v4l2_subscribed_event_ops *ops)
-
-  video_device->ioctl_ops->vidioc_subscribe_event 必须检测驱动能
-  产生特定 id 的事件。然后调用 v4l2_event_subscribe() 来订阅该事件。
-
-  elems 参数是该事件的队列大小。若为 0，V4L2 框架将会（根据事件类型）
-  填充默认值。
-
-  ops 参数允许驱动指定一系列回调：
-  * add:     当添加一个新监听者时调用（重复订阅同一个事件，此回调
-             仅被执行一次）。
-  * del:     当一个监听者停止监听时调用。
-  * replace: 用‘新’事件替换‘早期‘事件。
-  * merge:   将‘早期‘事件合并到‘新’事件中。
-  这四个调用都是可选的，如果不想指定任何回调，则 ops 可为 NULL。
-
-int v4l2_event_unsubscribe(struct v4l2_fh *fh,
-			   struct v4l2_event_subscription *sub)
-
-  v4l2_ioctl_ops 结构体中的 vidioc_unsubscribe_event 回调函数。
-  驱动程序可以直接使用 v4l2_event_unsubscribe() 实现退订事件过程。
-
-  特殊的 V4L2_EVENT_ALL 类型，可用于退订所有事件。驱动可能在特殊
-  情况下需要做此操作。
-
-int v4l2_event_pending(struct v4l2_fh *fh)
-
-  返回未决事件的数量。有助于实现轮询（poll）操作。
-
-事件通过 poll 系统调用传递到用户空间。驱动可用
-v4l2_fh->wait (wait_queue_head_t 类型)作为参数调用 poll_wait()。
-
-事件分为标准事件和私有事件。新的标准事件必须使用可用的最小事件类型
-编号。驱动必须从他们本类型的编号起始处分配事件。类型的编号起始为
-V4L2_EVENT_PRIVATE_START + n * 1000 ，其中 n 为可用最小编号。每个
-类型中的第一个事件类型编号是为以后的使用保留的，所以第一个可用事件
-类型编号是‘class base + 1’。
-
-V4L2 事件机制的使用实例可以在 OMAP3 ISP 的驱动
-(drivers/media/video/omap3isp)中找到。
-- 
2.51.0

