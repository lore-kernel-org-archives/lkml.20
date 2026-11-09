Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201714;
	b=PscCFI18ApPlQlj/6KRQPbscbGqqnWGk+zGl11JgXrU3z4UznwaDRVACXbhWJ7vYkaB6
	 2e97ooOco0IBFnHMqo9zFiOur/igK8Jl9CKLIhSYwskh3u0AXETIgyI5QAghlhRNr7G8m
	 Ypinn9nAyi6vMx5QzjX5S0tjGXmalsYvKhMEQCOFkUzohcwTr8L+KKFsAgdQe+XH1GMlF
	 UOOPgfOcg6C8mmqK4isxTEG7fRet37CGKvKSK7ZmbGI9aZNa38GMTFQuge/iy7L+/iUlr
	 5mslVxQf7ks9A/LCmpFb5T7Pwy6VU4UpaYTG+Mm+muKHp4v404EA6PjUTueuwoh14vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201714;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=qcqQtUv5yhvRk4S6kIAr2T7WTtHVUG1X5LtcJ+SgKVw=;
	b=B/Zi3LbkEHmg5qjBW9ea6dr3Lyz8G3t9Cu69d7p0FvgQ8dnT+M/zERP35Y8s3EhNLOZ2
	 zrlA6cEyJaEoikDqM9fkkmfwR7+KQNqRDpQSc1GXU9vGFY4Pm+IFsbdmsmd2Gp9rQlstL
	 EeZz+K7hK9hqLtkdnKa7MhBZ9TOyEgLqUQquN5Xu61dLNyXGeQS6b7aPHt4kLJs202L5Y
	 mzH4DstPI4/FPN2BC8CVydyxLAH+dMSZmnIaiNXepF74UnqZiyd2v9rKMk3iBRDAAXAef
	 ++qtsJP7jyVzJCkiKuy9snWM/7Wcskm/Agx9lsFiUMS5cEi5Vf4ipEvJ3zMFjVlW11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1FB606A332;
	Mon,  9 Nov 2026 05:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1FB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDGjmpqWPFqwMQjAA--.38378S2;
	Mon, 09 Nov 2026 13:21:46 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAn8jVlWPFq3SUuAA--.28705S5;
	Mon, 09 Nov 2026 13:21:45 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] docs/zh_CN: translate threat-model.rst
Date: Mon,  9 Nov 2026 13:21:39 +0800
Message-ID: <fb718c822db16379b4f317f2f7f589f9c431d2d9.1794197977.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1794197977.git.dzm91@hust.edu.cn>
References: <cover.1794153793.git.dzm91@hust.edu.cn> <cover.1794197977.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMDGjmpqWPFqwMQjAA--.38378S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoWfJw48XF43Ar4furyUury7Awb_yoW8Jr1rto
	WfAa95Zws7Jw42qF129rs8Ar97WrsY9Fs8ZanIkrsxuw1UWa1DAFs5Aw4UXF909rs8tF4F
	qFyftF4fC3WDCFZrn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOG7k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jfvtZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Translate the Linux kernel threat model into Chinese, including English
changes from parallel history merged into docs-next.

Also includes commit bea79063a351 ("docs: threat-model: clarify
"security bug" vs "vulnerability"") and
commit 11f46e30e688 ("docs: threat-model: move fake devices
out of "non production use""), combined in merge
commit 2bdcd6cf2ac4 ("Merge tag 'docs-7.3-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux").

Update the translation through commit 60763c2f834d
("docs: threat-model: fix /dev/kmsg reference")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
v1->v2: add the missing trailers and format English commit references

 .../zh_CN/process/threat-model.rst            | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/process/threat-model.rst

diff --git a/Documentation/translations/zh_CN/process/threat-model.rst b/Documentation/translations/zh_CN/process/threat-model.rst
new file mode 100644
index 000000000000..4e3f4475a6d4
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/threat-model.rst
@@ -0,0 +1,168 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:翻译:
+ - 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+Linux 内核威胁模型
+==================
+
+对于内核会防护哪些威胁、不会防护哪些威胁，人们有许多假设。这些假设容易让
+缺陷报告的分类（:doc:`安全问题 <security-bugs>` 与
+:doc:`非安全问题 <../admin-guide/reporting-issues>`）产生混淆。如果内核、
+发行版、管理员和用户之间的责任边界不明确，也会使安全措施的落实变得复杂。
+本文试图澄清内核在这方面的责任。
+
+内核的责任
+----------
+
+内核抽象了对本地硬件资源和远端系统的访问，让多名本地用户公平分享获授的
+资源；底层硬件允许时，内核还为通信及处理或存储的数据提供一定程度的保密性。
+
+内核假定底层硬件按照规格工作。包括 CPU 指令集的完整性，分支预测单元和
+缓存单元的透明性，内存管理单元（MMU）的一致性，支持 DMA 的外设隔离（例如
+IOMMU），控制器的状态转换，从寄存器读出的数值范围，以及遵守硬件文档限制等。
+
+如果硬件未能维持规定的隔离，例如存在 CPU 缺陷、侧信道或对意外输入的异常
+响应，内核通常会尝试实施合理的缓解措施。这些措施尽力在硬件能力范围内缩小
+攻击面或提高攻击成本，不能构成内核提供的安全保证。
+
+用户始终在管理员授权下活动。管理员可授予或拒绝各种权限，影响用户对资源的
+使用及其活动的保密程度；也可将部分或全部权限委派给用户，尤其是通过
+capability，但不限于此。这些都通过 sysctl、文件系统权限等配置完成。
+
+Linux 内核采用符合自身威胁模型的一组默认设置。发行版有各自的威胁模型和
+预置配置；管理员可能需要放宽或收紧这些配置，以满足自己的预期。
+
+在具备特权级和内存管理单元的常见处理器上，Linux 内核默认保证以下保护：
+
+* **按用户隔离**：非特权用户可阻止同机其他非特权用户访问自己的数据，包括：
+
+  * 通过文件系统权限保护的存储数据；
+  * 默认不允许其他用户访问的内存页；
+  * 进程活动（其他用户不能使用 ptrace）；
+  * 进程间通信（他人不能观察经 Unix 域套接字或其他 IPC 机制交换的数据）；
+  * 本机内部及与其他系统之间的网络通信。
+
+* **基于 capability 的保护**：
+
+  * 没有提升权限（包括但不限于 ``CAP_SYS_ADMIN``）的用户不能修改内核配置、
+    内存或状态，不能改变其他用户看到的文件系统布局，也不能授予他人自己
+    不拥有的 capability 或影响系统可用性（关机、重启、panic、挂起，或通过
+    无界资源耗尽使系统无响应）。
+  * 没有 ``CAP_NET_ADMIN`` 的用户不能改变网络配置，也不能截获或伪造其他用户
+    或系统的网络通信。
+  * 没有 ``CAP_SYS_PTRACE`` 的用户不能观察其他用户的进程活动。
+
+启用 ``CONFIG_USER_NS`` 时，内核还允许非特权用户创建自己的用户命名空间，并
+在其中拥有所有 capability，但仍受一些限制：不能实施影响初始用户命名空间的
+操作，如修改时间、加载模块或挂载块设备。详情请参阅 ``user_namespaces(7)``；
+本文不介绍用户命名空间的全部可能用途。
+
+内核还提供许多故障排查和调试设施，如果交给不适当的用户，也可能成为攻击
+途径。有些设施设计为允许普通本地用户低风险地访问，例如通过 ``/dev/kmsg``
+访问内核日志；有些设施会暴露足够多的信息，在多数环境中需要由管理员决定是否
+开放，例如 perf 事件和跟踪；还有一些设施原本就不供非特权用户访问，例如
+debugfs。用户在管理员明确授权后访问这些设施，不构成安全漏洞。
+
+允许违反上述原则的缺陷属于安全漏洞。然而，只有在另一项原则已被违反后才允许
+进一步违规的缺陷，只是弱点。内核采取多种自我保护措施，避免某些类型的缺陷
+跨越安全边界，但这些附加保护本身失效，并不单独构成漏洞。
+
+哪些问题不视为漏洞
+------------------
+
+按照 Linux 内核的威胁模型，以下问题 **不** 属于内核漏洞。如果认为内核可以
+做得更好，仍应报告，以便在合理可行时审查并修复；但它们会按普通缺陷处理。
+
+* **配置问题**：
+
+  * 过时内核，尤其是已结束维护的分支，不在威胁模型范围内。管理员负责保持
+    系统更新。只有证明缺陷影响仍在积极维护的版本，才可将其归类为漏洞。
+
+  * 构建时配置：明确记载会降低安全级别的配置变更（例如 ``CONFIG_NOMMU``），
+    或仅供开发者使用的配置。
+
+  * 操作系统级配置：命令行参数、sysctl、文件系统权限、用户 capability 和
+    特权接口暴露等变更，若提供非默认的非特权访问权限，或削弱内核实施保护和
+    缓解措施的能力，就会明确扩大暴露面。例如授予 procfs 或 debugfs 写权限。
+
+  * 仅在使用开发或调试功能时出现的问题，例如 LOCKDEP、KASAN 和
+    FAULT_INJECTION。这些功能已知会带来开销和潜在不稳定性，不适合生产环境。
+
+  * 影响 ``CONFIG_STAGING`` 下驱动或配置中标为 EXPERIMENTAL 的功能的问题。
+
+  * 加载明确不安全、有缺陷或处于 staging 阶段的模块，以及通常任何标记为
+    实验性或不适合生产使用的子系统中的模块。
+
+  * 运行树外模块或非官方内核分支；应向相应供应商报告这些问题。
+
+* **已有过高的初始权限**：
+
+  * 用户已拥有执行操作或修改状态所需权限（例如 ``CAP_SYS_ADMIN``、
+    ``CAP_NET_ADMIN``、``CAP_SYS_RAWIO``、``CAP_SYS_MODULE``），且没有
+    进一步跨越安全边界时所做的操作。
+
+  * 用户在用户命名空间中实施、但未绕过初始用户所受限制的操作，如使用
+    ptrace、发送信号、使用资源、访问文件系统、设备、sysctl 或内存、绑定
+    网络地址、修改系统或网络配置等。
+
+  * 初始命名空间中 root 用户的任何操作，例如写入特权设备时触发内核 oops。
+
+* **脱离生产使用场景**：
+
+  这包括依赖无系统噪声的实验室条件的理论或概率性攻击，或需要不现实的大量
+  尝试（如数十亿次）的攻击；后者早在成功前就会被常规系统监控发现，例如：
+
+  * 只在无噪声实验室环境中才能预测的随机数，如 IP ID、TCP 端口或序列号；
+
+  * 易受测量噪声影响、无法在生产系统中实际复现的概率性活动观察或信息泄露；
+
+  * 只有通过猛烈攻击（例如暴力穷举）才能触发，而且攻击对系统的影响使其
+    不可能在成功前不被发现的问题，例如必须先耗尽全部内存；
+
+  * 只在开发用模拟器、仿真器，或报告时现实系统不存在的配置组合中出现的
+    问题，例如涉及数千万线程、数万 CPU、不现实的 CPU 频率、内存或磁盘容量、
+    网络速度的问题；
+
+  * 触发成本比预期收益高几个数量级的问题，例如为了读取结构体中 7 个未初始化
+    字节而制作功能完整的键盘仿真器，或尝试数百万次连接以猜测端口号。
+
+* **加固措施失效**：
+
+  * 绕过内核的某些加固措施，但没有可证明的利用路径，例如绕过 ASLR，或进行
+    时间测量、探测却无法证明后果。这些只是弱点，不构成漏洞。
+
+  * 缺少参数检查，或未报告某些不产生直接后果的错误。
+
+* **随机信息泄露**：
+
+  指泄露少量偶然存在、攻击者无法选择或受访问限制的数据：
+
+  * 系统调用或其他接口返回的结构体填充字节；
+  * 错误消息中的标识符、部分数据、未终止字符串；
+  * 内核内存地址或指针泄露不能立即被利用，因此不属于漏洞，但须报告并修复。
+
+* **不符合规范的设备和介质**：
+
+  驱动依据规格实现。如果设备或存储介质违反驱动所依据的规格，造成的异常行为
+  属于应修复的普通缺陷，除非驱动明确记载自己已针对恶意输入做了加固。因此
+  以下问题不视为漏洞：
+
+  * 挂载损坏或恶意构造的文件系统镜像触发的缺陷。挂载块设备是特权操作，
+    管理员负责其挂载的介质。这也包括可通过挂载前运行文件系统一致性检查
+    （fsck）解决、缓解或发现的问题。
+
+  * 需要改造或仿真硬件才能复现的缺陷，包括伪装成另一种设备的假 USB 设备，或
+    报告文档范围以外数值的设备。
+
+* **物理访问**：
+
+  需要实际接触机器、改造硬件或使用专用硬件（例如逻辑分析仪，通过
+  PCI-E/Thunderbolt 发起 DMA 攻击的工具）的问题不在范围内，除非系统明确
+  配置了 IOMMU 等用于抵御这类攻击的技术。
+
+* **功能和性能回归**：
+
+  能通过设置适当权限和限制来缓解的问题不属于漏洞。
-- 
2.51.0

