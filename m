Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322363;
	b=IcNZzNKQUh7adcYqgWK69Sdx9UlVqBHtuKdJi9i+5mQ14Vr64ri48YPYUInaG1D/3tPB
	 g4i/c4sxQd6J2GsUs8RUeh7TibrbMjfEXz/5XbEVVhtEhQ0LQy0Z5DWTxRwPbuzta396/
	 m7kqQxRCA/n4CESdgZez9jUyStnT0xodQ+ZdJNjVIIE5Xr3u7uB1347wIWVVkbczyRWJr
	 1eCRbT/wez91wG5ghbTRQcuuZqmPq94ghP98muJowGB2KmaCfLB8ONQ6Eb3YipcvrpGeX
	 HQmeoqRa7zDq9+lGofvwA3zotkpjMzHhFhm2Yz6Kgm+TO/rxnJ/QfmDtaCpefr0rnUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rs/oFurKJhSYGG+sQ6Wjjn4Z6/eBxMr6Bp2M1KnVjls=;
	b=d06+rgBrvcbG0Jc6Iu49a2fyKFJOlrrgscyPb+ibA+bY23L1PyiIEzSIMveXXqFUfMLB
	 ELHy4d+gfPhCdwER04q6NMDv/tisp8jOSVwI5/BfaNv0UNc72F+g/pONV7XIYbdXiUtca
	 wc1lQf4n8QWHn82F8drblNEmjUhKKRWXRP+OZuTy8PHXaeGEkT6bNYRj/j8DFlYfR8BLB
	 CmGwtF1n92YiRRno10uR7I8cX/0YHwooUNZwuRdZ/HLZW9Y/+cZ866b+HYoytorSrEYC2
	 KPMBCXNneItTA0J4bNz3IACoedf8R+J+qARguPkIERX+UWiRwFYK9gezCv8tPvsLPJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KiMnUVz9;
	arc=none smtp.remote-ip=91.218.175.153
Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDAB606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KiMnUVz9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FDXTRkfucaFAYD70xdlMzkbFL6oW+ZvOhQiLVAVKUG4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793322361; v=1; x=1793927161;
 b=KiMnUVz9IH4GRHLGrq0a54jNstF/eqYiYBVXFWcaxu4JojgSoBurpkrWzLinSq9fVAjejCLZ
 WsIpvNMdPQ/u7GdIAu25mXH5aHs95R8OLBGEdLDlMlZHDsDr1nm+6k0hqyyNc/waWE82BwaYUv5
 swtMLUNO8H7NGxH/Pb1DsUgM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d3b563cc8270636e;
	Fri, 30 Oct 2026 01:05:30 +0000
X-Mizu-Trace-ID: d3b563cc8270636e
X-Migadu-Flow: FLOW_OUT
Message-ID: <4d63fb8d-e61b-478c-867c-36f2e0f5d44e@linux.dev>
Date: Fri, 30 Oct 2026 09:05:19 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] docs/zh_CN: reorganize process debugging guides
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
 <20261029124429.294868-5-dzm91@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20261029124429.294868-5-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 20:44, Dongliang Mu 写道:
> Move the GDB debugging translation into process/debugging. Update the
> process and development tools indexes to match the current English
> structure.
>
> Update the zh_TW admin-guide README reference to the moved zh_CN GDB
> guide.
>
> Synchronize the process index with upstream revision a03ef333fbd6.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> ---
>   .../translations/zh_CN/dev-tools/index.rst    |  37 +++---
>   .../debugging}/gdb-kernel-debugging.rst       |  15 ++-
>   .../zh_CN/process/debugging/index.rst         |  62 ++++++++++
>   .../translations/zh_CN/process/index.rst      | 109 +++++++++++-------
>   .../translations/zh_TW/admin-guide/README.rst |   2 +-
>   5 files changed, 159 insertions(+), 66 deletions(-)
>   rename Documentation/translations/zh_CN/{dev-tools => process/debugging}/gdb-kernel-debugging.rst (93%)
>   create mode 100644 Documentation/translations/zh_CN/process/debugging/index.rst
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
> index 7b37194217b0..f5cf2621b6e3 100644
> --- a/Documentation/translations/zh_CN/dev-tools/index.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/index.rst
> @@ -1,18 +1,16 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/dev-tools/index.rst
>   :Translator: 赵军奎 Bernard Zhao <bernard@vivo.com>
>   
>   ============
>   内核开发工具
>   ============
>   
> -本文档是有关内核开发工具文档的合集。
> -目前这些文档已经整理在一起，不需要再花费额外的精力。
> -欢迎任何补丁。
> +本文档收集了用于内核开发的工具文档。目前这些文档只是汇集在一起，尚未充分整理成一份连贯的指南；欢迎提交补丁！
>   
> -有关测试专用工具的简要概述，参见
> -Documentation/translations/zh_CN/dev-tools/testing-overview.rst
> +测试工具的简要概述见 ``Documentation/dev-tools/testing-overview.rst``。
> +
> +调试专用工具见 ``Documentation/process/debugging/index.rst``。
>   
>   .. toctree::
>      :caption: 目录
> @@ -21,21 +19,26 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>      testing-overview
>      sparse
>      kcov
> -   kcsan
> -   kmsan
>      gcov
>      kasan
> +   kmsan
>      ubsan
>      kmemleak
> -   gdb-kernel-debugging
> +   kcsan
>   
>   Todolist:
>   
> - - checkpatch
> - - coccinelle
> - - kfence
> - - kgdb
> - - kselftest
> - - kunit/index
> - - ktap
> - - checkuapi
> +* checkpatch
> +* clang-format
> +* coccinelle
> +* context-analysis
> +* lkmm/index
> +* kfence
> +* kselftest
> +* kunit/index
> +* ktap
> +* checkuapi
> +* gpio-sloppy-logic-analyzer
> +* autofdo
> +* propeller
> +* container
> diff --git a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst b/Documentation/translations/zh_CN/process/debugging/gdb-kernel-debugging.rst
> similarity index 93%
> rename from Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
> rename to Documentation/translations/zh_CN/process/debugging/gdb-kernel-debugging.rst
> index 0b382a32b3fe..f5010c144dcb 100644
> --- a/Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
> +++ b/Documentation/translations/zh_CN/process/debugging/gdb-kernel-debugging.rst
> @@ -1,8 +1,7 @@
>   .. highlight:: none
>   
> -.. include:: ../disclaimer-zh_CN.rst
> +.. include:: ../../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/process/debugging/gdb-kernel-debugging.rst
>   :Translator: 高超 gao chao <gaochao49@huawei.com>
>   
>   通过gdb调试内核和模块
> @@ -34,7 +33,7 @@ Kgdb内核调试器、QEMU等虚拟机管理程序或基于JTAG的硬件接口
>     但这通常仅在不依赖内核模块时才有效。有关此模式的更多详细信息，请参阅QEMU文档。
>     在这种情况下，如果架构支持KASLR，应该在禁用CONFIG_RANDOMIZE_BASE的情况下构建内核。
>   
> -- 构建gdb脚本（适用于内核v5.1版本及以上）
> +- 构建gdb脚本（内核 v5.1 及以上版本需要此步骤）::
>   
>       make scripts_gdb
>   
> @@ -78,7 +77,7 @@ Kgdb内核调试器、QEMU等虚拟机管理程序或基于JTAG的硬件接口
>       ...
>       loading @0xffffffffa0000000: /home/user/linux/build/drivers/ata/ata_generic.ko
>   
> -- 对一些尚未加载的模块中的函数函数设置断点，例如::
> +- 对尚未加载的模块中的函数设置断点，例如::
>   
>       (gdb) b btrfs_init_sysfs
>       Function "btrfs_init_sysfs" not defined.
> @@ -165,3 +164,11 @@ Kgdb内核调试器、QEMU等虚拟机管理程序或基于JTAG的硬件接口
>   
>   可以通过“help <command-name>”或“help function <function-name>”命令
>   获取指定命令或指定调试功能的更多详细信息。
> +
> +调试 GDB 脚本
> +-------------
> +
> +GDB 默认不会显示完整的 Python 回溯，这会使调试 GDB 脚本比必要的更困难。
> +使用以下命令可输出 Python 环境的完整回溯::
> +
> + (gdb) set python print-stack full
> diff --git a/Documentation/translations/zh_CN/process/debugging/index.rst b/Documentation/translations/zh_CN/process/debugging/index.rst
> new file mode 100644
> index 000000000000..b0a121f7a91e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/process/debugging/index.rst
> @@ -0,0 +1,62 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +
> +========================
> +Linux 内核开发者调试指南
> +========================
> +
> +通用指南
> +--------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   gdb-kernel-debugging
> +
> +待译文档：
> +
> +* driver_development_debugging_guide
> +* kgdb
> +* userspace_debugging_guide
> +
> +针对特定子系统的指南
> +--------------------
> +
> +待译文档：
> +
> +* media_specific_debugging_guide
> +
> +一般调试建议
> +============
> +
> +根据遇到的问题，可以使用不同的工具追踪问题，甚至判断问题是否确实存在。
> +
> +首先要弄清楚需要调试哪一类问题。不同的问题可能需要不同的方法和工具。
> +
> +是否只能有限地访问系统？
> +------------------------
> +
> +如果只能有限地访问机器，或者无法停止正在运行的程序，调试能力就取决于发行版内核
> +内置的调试支持。有关这种情况下可用工具的简要介绍，请参阅
> +``Documentation/process/debugging/userspace_debugging_guide.rst``。多数情况下，
> +可以查看 ``/boot`` 目录中的内核配置文件，确认内核提供了哪些调试支持。
> +
> +是否拥有系统的 root 权限？
> +--------------------------
> +
> +如果能够轻松地更换模块或安装新内核，可用的调试手段就多得多。详情请参阅
> +``Documentation/process/debugging/driver_development_debugging_guide.rst``。
> +
> +时间因素是否相关？
> +------------------
> +
> +需要判断问题是稳定复现的（即相同输入总会得到相同的错误结果），还是偶发的。
> +如果问题偶发，就可能受到时间因素影响。如果插入延迟会改变问题的表现，那么时间
> +因素很可能起了作用。
> +
> +当时间因素会影响结果时，使用简单的 ``printk()`` 调试可能不起作用。可以改用
> +``trace_printk()``，将消息写入跟踪文件，而不是内核日志。
> +
> +**Copyright** ©2024 : Collabora
> diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
> index 3a36ca7d9333..cac143b68c47 100644
> --- a/Documentation/translations/zh_CN/process/index.rst
> +++ b/Documentation/translations/zh_CN/process/index.rst
> @@ -5,8 +5,6 @@
>   
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/process/index.rst
> -
>   :翻译:
>   
>    Alex Shi <alex.shi@linux.alibaba.com>
> @@ -15,84 +13,107 @@
>   与Linux 内核社区一起工作
>   ========================
>   
> -你想成为Linux内核开发人员吗？欢迎之至！在学习许多关于内核的技术知识的同时，
> -了解我们社区的工作方式也很重要。阅读这些文档可以让您以更轻松的、麻烦更少的
> -方式将更改合并到内核。
> +你想成为 Linux 内核开发者吗？欢迎！除了要学习大量内核技术知识，了解社区的工作方式
> +也很重要。阅读这些文档可以帮助你更顺利地将改动合入内核。
> +
> +内核开发流程简介
> +----------------
>   
> -以下是每位开发人员都应阅读的基本指南：
> +请先阅读这些文档：理解其中的内容有助于你加入内核社区。
>   
>   .. toctree::
>      :maxdepth: 1
>   
> -   license-rules
>      howto
> -   code-of-conduct
> -   code-of-conduct-interpretation
>      development-process
>      submitting-patches
> -   programming-language
> -   coding-style
> -   maintainer-pgp-guide
> -   email-clients
> -   kernel-enforcement-statement
> -   kernel-driver-statement
> -
> -TODOLIST:
> +   submit-checklist
>   
> -* handling-regressions
> -* maintainer-handbooks
> +内核开发者的工具和技术指南
> +--------------------------
>   
> -安全方面, 请阅读:
> +内核开发者应当熟悉以下资料。
>   
>   .. toctree::
>      :maxdepth: 1
>   
> -   embargoed-hardware-issues
> -   cve
> -   security-bugs
> +   programming-language
> +   coding-style
> +   maintainer-pgp-guide
> +   email-clients
> +   applying-patches
> +   volatile-considered-harmful
>   
> -TODOLIST:
> +Todolist:
>   
> -* handling-regressions
> +* changes
> +* backporting
> +* adding-syscalls
> +* botching-up-ioctls
>   
> -其它大多数开发人员感兴趣的社区指南：
> +政策指南与开发者声明
> +--------------------
>   
> +这些是内核社区及其他相关领域努力遵守的规则。
>   
>   .. toctree::
>      :maxdepth: 1
>   
> +   license-rules
> +   code-of-conduct
> +   code-of-conduct-interpretation
> +   kernel-enforcement-statement
> +   kernel-driver-statement
>      stable-api-nonsense
> -   management-style
>      stable-kernel-rules
> -   submit-checklist
> +   management-style
>      researcher-guidelines
>   
> -TODOLIST:
> +Todolist:
>   
> -* changes
> -* kernel-docs
> -* deprecated
> -* maintainers
>   * contribution-maturity-model
> +* generated-content
> +* coding-assistants
> +* conclave
>   
> +处理缺陷
> +--------
>   
> -这些是一些总体性技术指南，由于不大好分类而放在这里：
> +缺陷不可避免，妥善处理很重要。以下文档提供一般的调试建议，并介绍
> +如何处理两类特殊缺陷——回归问题和安全问题。
>   
>   .. toctree::
>      :maxdepth: 1
>   
> -   magic-number
> -   applying-patches
> -   volatile-considered-harmful
> -   ../arch/riscv/patch-acceptance
> -   ../core-api/unaligned-memory-access
> +   debugging/index
> +   security-bugs
> +   cve
> +   embargoed-hardware-issues
>   
> -TODOLIST:
> +Todolist:
>   
> -* backporting
> -* adding-syscalls
> -* botching-up-ioctls
> -* clang-format
> +* handling-regressions
> +* threat-model
> +
> +维护者信息
> +----------
> +
> +这些文档介绍如何找到能够接受你提交的补丁的人。
> +
> +Todolist:
> +
> +* maintainer-handbooks
> +* maintainers
> +
> +其他资料
> +--------
> +
> +以下社区指南也与大多数开发者有关。
> +
> +Todolist:
> +
> +* kernel-docs
> +* deprecated
>   
>   .. only::  subproject and html
>   
> diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
> index 9be4915ae420..bec930b16e64 100644
> --- a/Documentation/translations/zh_TW/admin-guide/README.rst
> +++ b/Documentation/translations/zh_TW/admin-guide/README.rst
> @@ -290,6 +290,6 @@ Documentation/translations/zh_CN/admin-guide/reporting-issues.rst 。
>   Documentation/translations/zh_CN/admin-guide/bug-hunting.rst 。
>   
>   更多用GDB調試內核的信息，請參閱：
> -Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst
> +Documentation/translations/zh_CN/process/debugging/gdb-kernel-debugging.rst
>   和 Documentation/process/debugging/kgdb.rst 。
>   
