Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794714195;
	b=mDWxkJ43u6MmKttx5A3gryGOTttpwwf09hFpe1+/TgukBTWG50EO0ueCQaXqe7vAxf8s
	 2551U/6qCNXEYtxtSUMVbBGa+u0i8Xrmo1RgutVeABNyUwCkTYIG3CYLdSN09Xq9MwCD0
	 OcXgSOvhE96LZ2yALlnaYfE6ctjuzMTOqTV/8Me2BPmJgaKbKFrPqAgqPIYSAMB6tTUJe
	 GZsyJHYZyyrEfXRdPp8uSt/JJHqukXXSh38DaiRQrUXOIjyKcGmdR65P6+A5kR39gMTsn
	 jyJuAt7mYKf1oSliY9+mYwApWrNh1M3JWVjp9kOtJnk3d+3s3FrIFtfLb1bk1SxbR6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794714195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8sd5W1JdYo8w0tNXiF4fIZJlkVDZY/GgHJRyTPWq0uU=;
	b=A7XBTVS/sRpY/5M8wQqmmKrMzgc2QsHtQPzFQXahQKRXplock6/pJQbJTiXdk7xOb7mu
	 TJEGs4ApSyooIzHVCS2vnHJWJWATtQKT2N1ogYlGTyBm3hi6J+NKeb3zPmBX2B1xSaL6Z
	 Tzkv9UGEFikHTh4e9uVRTDm4VpPMQ+b4u50/1pTbvMIQILoZRUIHXAET6jJTN0vclBV3M
	 QVywYbIQZic8WY77i3C6yyrNjUgTS0pqe17W4n28V17jvY3hV6KTm5u1zW18jI5iGtZr7
	 8ux5XWHU62ndc4CA3mspr4GyEIfWXQSOx1wm79QaUudIB1GQLwZKIwZ8jfSoXVYJypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SwdJJtAV;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A0D606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8A0D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SwdJJtAV
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so3337208c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794714194; x=1795318994; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sd5W1JdYo8w0tNXiF4fIZJlkVDZY/GgHJRyTPWq0uU=;
        b=SwdJJtAV9qSngxJ9aTeT9AHzyJNlgnvyEmtEc+yto1YwGhkHMqCs2QsCzox1y5FCOE
         v1YMx+Xq1OPHG6m9DymLUoIm18YkzumdXUmq6rdjyAG5bY3R4qtnoUjMK1q1rQZbGnPc
         8gCKGkPAMUzi2MccJE73MJMBF0ExmJQz40oBkt5LiW74IzOxZHg7rlyJ9IgCF5Ua8Pui
         p3SxpaY/DOT7YgraJ4fQejCssm8IhS3WgIqnDXL/tPlgPd8vEjtHpJKYcnoLwb2sojxC
         NFkyNKIQyra/qW5R1cD46TKVoveP3MF8Kfu69wKkiQu/XhU0M0IKxI8MFrFcL/lO79Xw
         QFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794714194; x=1795318994;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sd5W1JdYo8w0tNXiF4fIZJlkVDZY/GgHJRyTPWq0uU=;
        b=FySAZrcaAwwSpyyj8D/tsHtx/Re8jtpLE15JNetDgTFetN3bnycxdGFvhz0LNF5AUp
         r+yK9JqVqF+65JLE7oZCa7w9IXVGFWrBfx+wEN7sYQZhPiB+fs+hlzhA6goTERInAJ8Y
         HlEtpjM36IO+WvUYCRn/0PVj2z9ryqOSHioQzUVnzI/EPwg3qVhDLD9HMeI/2CgtLNob
         dkOPg3STSlghu2xEBH8RtODAbbn9vacCU+NLO3vBB6awwPpwO2bRtharpgdYoCn7hBqX
         20Xr4udtl7M5EuiVMZsJ3p9t3hJCuALkxOCOt7vnSTOYleMsBmpXZocAjBVxB+zTJF0T
         sREA==
X-Forwarded-Encrypted: i=1; AL+hErEQqauaZV+8LpEOh17vBlhfoJ5SKFnyxYjs/lwhkC5TdrcsXtGSzRVEDBE+ZVG8rdjxjKENXucLFB1KkwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C9VHNL1dVtCahLknqPKYNw/uLklQVOmzIvA80NOxs26N/Kz/P
	IKtcoaNDCYiywzzbQ2tyIS8uDw3deyKgsU9hkdYphEBQjf5iB8x13kCv
X-Gm-Gg: AYBFou3vgWXuVJmr23LKl0b8VlmIhTGF9T5bBnaNIefDHxBTxsztdUAnhsJWtnnIaOF
	nAAgM1AoFPSaw72Q3ajlGbrv8hyFFqBRnM29pugrwP3MnZecjIR2pavHl0MjweVNJwRAPVSSQFb
	HpVZ5ctlgq6lJWgstAysOUqnOIxjhml6Z00mh0dRpcbcI8dD5MBSPN8E9Mz9ocLDAsEoaNovPH3
	nNG7lbZlMY00f3n2T4p/wTKSASvIxgsxN/dQepZZs5mKXVK80DSVTqwJICqgBAj5HakUEkkPj0s
	LR8c1wyQMFoXpAFafoPTQE72SX9jyku44/wJpLfshum9q+R8F/PWr27+3Bse2WUwUj+3fVrtbqn
	n9krPpNmwbhNRcD3oT+bNGQn45VuEcN6IPnlxJJhKCY13kCJvzm1fzbhPVzeSZDPFPmcfBVX6EG
	4+cO/PVjxqxX+5JfXjpfQzx4+a++7JfQyuzMcTaT959uVhG22kFXhzbgDfSR49G045EEMdGsIUF
	VMZAEj85B+IOyuJo0BxqJaoZ+ql4aHZ+su7e2jg9lWZ/5MIqFH7S8jgDfs7s9G44FQmTvYMHYZc
	W86/zkwn7Cxb3jGCGTa3s548ZxcFx2hKEy4plx746xGyHjbdKmWhEYmg5ES3+w==
X-Received: by 2002:a05:7022:ea4f:b0:150:c9c5:1ce4 with SMTP id a92af1059eb24-1b50302f893mr5718380c88.6.1794714193197;
        Sat, 14 Nov 2026 19:43:13 -0800 (PST)
Received: from yunyun.localdomain ([156.239.236.78])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm21023917eec.0.2026.11.14.19.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:43:12 -0800 (PST)
From: "Yaoze Wang (Yunyun)" <wangyaoze999@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Yaoze Wang (Yunyun)" <wangyaoze999@gmail.com>
Subject: [PATCH] docs/zh_CN: Add i3c Chinese translation
Date: Sun, 15 Nov 2026 11:43:07 +0800
Message-ID: <20261115034307.15-1-wangyaoze999@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Translate .../driver-api/i3c/index.rst, protocol.rst,
device-driver-api.rst and master-driver-api.rst into Chinese.

Update the translation through commit 395107a7c91a ("docs:
driver-api: fix spelling of "buses".")

Signed-off-by: Yaoze Wang (Yunyun) <wangyaoze999@gmail.com>
---
 .../driver-api/i3c/device-driver-api.rst      |  17 ++
 .../zh_CN/driver-api/i3c/index.rst            |  19 ++
 .../driver-api/i3c/master-driver-api.rst      |  17 ++
 .../zh_CN/driver-api/i3c/protocol.rst         | 183 ++++++++++++++++++
 .../translations/zh_CN/driver-api/index.rst   |   2 +-
 5 files changed, 237 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/driver-api/i3c/device-driver-api.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/i3c/index.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/i3c/master-driver-api.rst
 create mode 100644 Documentation/translations/zh_CN/driver-api/i3c/protocol.rst

diff --git a/Documentation/translations/zh_CN/driver-api/i3c/device-driver-api.rst b/Documentation/translations/zh_CN/driver-api/i3c/device-driver-api.rst
new file mode 100644
index 000000000..eedf61d1a
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/i3c/device-driver-api.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/i3c/device-driver-api.rst
+
+:翻译:
+
+ Yaoze Wang (Yunyun) <yunyun@caellab.com>
+
+================
+I3C 设备驱动 API
+================
+
+.. kernel-doc:: include/linux/i3c/device.h
+
+.. kernel-doc:: drivers/i3c/device.c
diff --git a/Documentation/translations/zh_CN/driver-api/i3c/index.rst b/Documentation/translations/zh_CN/driver-api/i3c/index.rst
new file mode 100644
index 000000000..5113e1a99
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/i3c/index.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/i3c/index.rst
+
+:翻译:
+
+ Yaoze Wang (Yunyun) <yunyun@caellab.com>
+
+==========
+I3C 子系统
+==========
+
+.. toctree::
+
+   protocol
+   device-driver-api
+   master-driver-api
diff --git a/Documentation/translations/zh_CN/driver-api/i3c/master-driver-api.rst b/Documentation/translations/zh_CN/driver-api/i3c/master-driver-api.rst
new file mode 100644
index 000000000..4006650e6
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/i3c/master-driver-api.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/i3c/master-driver-api.rst
+
+:翻译:
+
+ Yaoze Wang (Yunyun) <yunyun@caellab.com>
+
+====================
+I3C 主控制器驱动 API
+====================
+
+.. kernel-doc:: drivers/i3c/master.c
+
+.. kernel-doc:: include/linux/i3c/master.h
diff --git a/Documentation/translations/zh_CN/driver-api/i3c/protocol.rst b/Documentation/translations/zh_CN/driver-api/i3c/protocol.rst
new file mode 100644
index 000000000..3a1b2ebcc
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/i3c/protocol.rst
@@ -0,0 +1,183 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/i3c/protocol.rst
+
+:翻译:
+
+ Yaoze Wang (Yunyun) <yunyun@caellab.com>
+
+========
+I3C 协议
+========
+
+免责声明
+========
+
+本章重点关注与软件开发人员相关的内容。至于所有与硬件相关的内容（例如数据
+在总线上如何传输、冲突如何避免等），请参阅 I3C 规范。
+
+本文档只是对 I3C 协议及其概念的简要介绍。如果需要更多信息，请
+参阅 MIPI I3C 规范（可在此处下载
+https://resources.mipi.org/mipi-i3c-v1-download）。
+
+简介
+====
+
+I3C（读作 'eye-three-see'）是由 MIPI 标准化的协议，目的是克服 I2C 的局限
+（速度有限、中断需要额外的外部信号、无法自动检测总线上连接的设备等），同时
+保持低功耗。
+
+I3C 总线
+========
+
+一条 I3C 总线由若干 I3C 设备构成，也可能包含一些 I2C 设备，但这里先只讨论
+I3C 设备。
+
+I3C 总线上的 I3C 设备可以扮演以下角色之一：
+
+* 主设备（Master）：该设备掌控总线。它负责发起事务，或者决定谁可以在总线上
+  发送（I3C 中允许从设备产生事件，见下文）。
+* 从设备（Slave）：该设备作为从设备工作，不能向总线上的另一个从设备发送帧。
+  如果主设备允许，它仍可以主动向主设备发送事件。
+
+I3C 是多主协议，因此一条总线上可能存在多个主设备，但在任一时刻只能有一个
+设备充当主设备。主设备要获得总线所有权，必须遵循特定的流程。
+
+I3C 总线上的每个设备都必须分配一个动态地址才能通信。在此之前，设备只应响应
+有限的一组命令。如果设备有静态地址（也称为传统 I2C 地址），它可以响应 I2C
+传输。
+
+除了这些每设备地址之外，协议还定义了一个广播地址，用于寻址总线上的所有设备。
+
+一旦为设备分配了动态地址，与该设备的任何直接通信都将使用该地址。需要注意的
+是，即使已经分配了动态地址，设备仍应处理广播消息。
+
+I3C 设备发现
+============
+
+I3C 协议定义了一种机制，用于自动发现总线上存在的设备、它们的能力以及它们
+提供的功能。在这方面，I3C 更接近 USB 这样的可发现总线，而不是 I2C 或 SPI。
+
+这种发现机制称为 DAA（动态地址分配，Dynamic Address Assignment），因为它
+不仅发现设备，还为它们分配动态地址。
+
+在 DAA 期间，每个 I3C 设备会上报三项重要信息：
+
+* BCR：总线特性寄存器（Bus Characteristic Register）。这个 8 位寄存器描述
+  设备与总线相关的能力
+* DCR：设备特性寄存器（Device Characteristic Register）。这个 8 位寄存器
+  描述设备提供的功能
+* Provisioned ID（预配置 ID）：一个 48 位唯一标识符。在同一条总线上不应出现
+  Provisioned ID 冲突，否则发现机制可能失败。
+
+I3C 从设备事件
+==============
+
+I3C 协议允许从设备自行产生事件，从而允许它们临时接管总线。
+
+这种机制称为 IBI（带内中断，In Band Interrupts）。顾名思义，它允许设备在
+没有外部信号的情况下产生中断。
+
+在 DAA 期间，总线上的每个设备都会被分配一个地址，这个地址将作为优先级标识，
+用于在两个不同设备同时于总线上产生中断时决定谁获胜（动态地址越小，优先级
+越高）。
+
+主设备可以根据需要禁止中断。这种禁止请求可以广播（对所有设备生效），也可以
+发送给特定设备。
+
+I3C 热加入
+==========
+
+热加入（Hot-Join）机制类似于 USB 热插拔。该机制允许从设备在主设备完成总线
+初始化之后加入总线。
+
+这涵盖以下使用场景：
+
+* 总线探测时设备未上电
+* 设备通过扩展板热插拔到总线上
+
+该机制依赖从设备事件来通知主设备：有新设备加入了总线，正在等待动态地址。
+
+随后主设备可以自行决定如何处理该请求：忽略它，或者为该从设备分配动态地址。
+
+I3C 传输类型
+============
+
+如果略去 SMBus（它只是对访问 I2C 设备寄存器方式的一种标准化），那么 I2C 只有
+一种传输类型。
+
+I3C 除了为向后兼容 I2C 设备而保留的 I2C 传输之外，还定义了 3 种不同的传输
+类别。
+
+I3C CCC 命令
+------------
+
+CCC（通用命令码，Common Command Code）命令用于所有与总线管理相关的事务，
+以及若干设备共有的一切特性。
+
+CCC 命令包含一个 8 位的 CCC ID，用于描述所执行的命令。该 ID 的最高位
+（bit7）指定这是广播命令（bit7 = 0）还是单播命令（bit7 = 1）。
+
+命令 ID 之后可以跟随一个负载。取决于具体命令，该负载要么由发送命令的主设备
+发送（写 CCC 命令），要么由接收命令的从设备发送（读 CCC 命令）。当然，读
+访问只适用于单播命令。
+注意，向特定设备发送 CCC 命令时，设备地址放在负载的第一个字节中。
+
+负载长度不会显式地在总线上传递，应当从 CCC ID 中解析出来。
+
+注意，厂商可以使用一段专用的 CCC ID 范围来定义自己的命令
+（0x61-0x7f 和 0xe0-0xef）。
+
+I3C 私有 SDR 传输
+-----------------
+
+私有 SDR（单数据速率，Single Data Rate）传输用于设备特有、且不需要高传输
+速率的一切事务。
+
+它相当于 I3C 世界中的 I2C 传输。每次传输都会携带设备地址（DAA 期间分配的
+动态地址）、一个负载和一个方向。
+
+与 I2C 的唯一区别是传输速度快得多（典型时钟频率为 12.5MHz）。
+
+I3C HDR 命令
+------------
+
+HDR 命令用于设备特有、且需要高传输速率的一切事务。
+
+HDR 命令首先附带的是 HDR 模式。I3C 规范目前定义了 3 种不同的模式（详情请
+参阅规范）：
+
+* HDR-DDR：双数据速率（Double Data Rate）模式
+* HDR-TSP：纯三进制符号（Ternary Symbol Pure）。只能用于没有 I2C 设备的
+  总线
+* HDR-TSL：传统三进制符号（Ternary Symbol Legacy）。可用于带有 I2C 设备
+  的总线
+
+发送 HDR 命令时，整条总线必须进入 HDR 模式，这通过一条广播 CCC 命令完成。
+一旦总线进入特定的 HDR 模式，主设备便发送 HDR 命令。一条 HDR 命令由以下
+部分组成：
+
+* 一个 16 位的命令字（大端序）
+* N 个 16 位的数据字（大端序）
+
+这些字可能会被特定的前导码/后导码包裹，具体取决于所选的 HDR 模式，详情见
+规范。
+
+16 位命令字由以下部分组成：
+
+* bit[15]：方向位，读为 1，写为 0
+* bit[14:8]：命令码。标识所执行的命令、数据字的数量及其含义
+* bit[7:1]：该命令所寻址设备的 I3C 地址
+* bit[0]：保留位/奇偶校验位
+
+与 I2C 设备的向后兼容性
+=======================
+
+I3C 协议在设计上向后兼容 I2C 设备。这种向后兼容性允许在同一条总线上混接 I2C
+和 I3C 设备；不过，为了真正高效，I2C 设备应配备 50 ns 的尖峰滤波器。
+
+I2C 设备无法像 I3C 设备那样被自动发现，必须通过静态声明添加。为了让主设备
+了解这些设备的能力（包括总线相关限制和功能两方面），软件必须提供一些信息，
+这通过 LVR（传统 I2C 虚拟寄存器，Legacy I2C Virtual Register）完成。
diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
index 4050a2fb5..00dab29c4 100644
--- a/Documentation/translations/zh_CN/driver-api/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -22,6 +22,7 @@ Linux驱动实现者的API指南
    :maxdepth: 2
 
    gpio/index
+   i3c/index
    io_ordering
    phy/index
 
@@ -54,7 +55,6 @@ Todolist:
 *   i2c
 *   ipmb
 *   ipmi
-*   i3c/index
 *   interconnect
 *   devfreq
 *   hsi
-- 
2.43.0

