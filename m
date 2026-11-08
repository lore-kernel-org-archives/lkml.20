Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794121727;
	b=clCUjHEq1eaMwCUVSh1g4AZijecvFjbI3WIuFI74SHVFd0Pk4cfYy6tfvBVamYgetuea
	 f4HUfXl894/lrSIPPivQucMXdumJcsfpzBQnvAikSaptIA7g3M8HOvRneYNkWc2smH8wb
	 9UYAyNwsOCFe/iS0D9KHiAOKLIG53ICRwsYOKd4ZHbekbzoSExeYUjgD4cm1M+zJRi6j8
	 Rj50SlehhZ9eNxU6sWVnP6cunnv7dTvHIjRjTIfRpARIXnVSFs8E+PPetgIbxCB+LDmfz
	 6Yg6eJyuIL4gR94vQYq0qM4HAuVQg/F22gfG96hmHSJDLlE/JDRI0Kzf92wdaNigeTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794121727;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=f1aUvW1QcVe/pLsJTb2SjVjcQ1tdyW4qexNAw4pj/p4=;
	b=Tr67cyw0aU2ACpOdn6IyhSI5J1uy1BvH+Sboe1dzqZS0CifUuPn4zK2QFnaMDxJz1s+B
	 34kvjkpdgDKjGpUB980lOTAHIn3j6hJb4/e19a4oEeaNNrP6RRXMzfPfKd3YOnpk64uRS
	 QZl3+TWuysapETWdpb05tdBx9te22Rj480nwa0dZU1Fbygh4yjaQLgnWUrTmwnjGMKUSl
	 bpiBWFyq/LBfXrfjLUEr4TAtPGuh+uEjNg0uBGyCK2vIWWARtHg3dMhBFUi6Km9kRvmzX
	 PFVDrxWBX4EWVL7bzMXOA38T+6c+u4TYZIdV6XODPlt95tgO5XfSiVIgVMMV4aVrL+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18C3606A31C;
	Sun,  8 Nov 2026 07:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18C3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBGD2vwH_BqYRYdAA--.57487S2;
	Sun, 08 Nov 2026 15:08:32 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wA3AjbqH_BqcZYqAA--.25311S2;
	Sun, 08 Nov 2026 15:08:28 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs/zh_CN: add clang-format guide translation
Date: Sun,  8 Nov 2026 15:08:26 +0800
Message-ID: <20261108070826.2000511-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
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
X-CM-TRANSID:IAEQrMBGD2vwH_BqYRYdAA--.57487S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3GF15Kw1fGFW3GF48XrWfGrg_yoWfWry5pF
	WIk3saqF43C3WYyry3KFyUZr1xKF93Cw4xtFyjq3WIqFn5urZ5tr4UK34IvFZxWa97Ca45
	Zr4rKry7Zr12krJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHjb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUVk9NDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Add the Chinese clang-format guide to the dev-tools index and point the
coding guide at the translated version.

Update the translation through commit faa395bcda43
("docs: fix typo in clang-format documentation")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../zh_CN/dev-tools/clang-format.rst          | 164 ++++++++++++++++++
 .../translations/zh_CN/dev-tools/index.rst    |   1 +
 .../translations/zh_CN/process/4.Coding.rst   |   3 +-
 3 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/dev-tools/clang-format.rst

diff --git a/Documentation/translations/zh_CN/dev-tools/clang-format.rst b/Documentation/translations/zh_CN/dev-tools/clang-format.rst
new file mode 100644
index 000000000000..6af211275374
--- /dev/null
+++ b/Documentation/translations/zh_CN/dev-tools/clang-format.rst
@@ -0,0 +1,164 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+.. _clangformat_zh:
+
+clang-format
+============
+
+``clang-format`` 是根据一套规则和启发式方法格式化 C/C++ 等代码的工具。
+与多数工具一样，它并不完美，也不能覆盖所有情况，但足以提供帮助。
+
+``clang-format`` 可用于多种用途：
+
+  - 快速将一段代码重新排版为内核风格。移动代码、对齐或排序时尤其有用。
+    参见 :ref:`clangformatreformat_zh`。
+
+  - 发现自己维护的文件、审阅的补丁或差异中的风格问题、笔误以及可能的
+    改进。参见 :ref:`clangformatreview_zh`。
+
+  - 帮助遵循编码风格规则，尤其适合刚开始参与内核开发，或同时参与多个
+    风格不同的项目的人。
+
+配置文件是内核源码树根目录的 ``.clang-format``。其中的规则尝试接近
+最常见的内核编码风格，并尽可能遵循
+:doc:`内核编码风格 <../process/coding-style>`。内核各处的风格并不完全
+相同，因此你可能希望针对特定子系统或目录调整默认设置。为此，可以在
+子目录中再写一个 ``.clang-format`` 文件，覆盖默认设置。
+
+这个工具早已包含在流行的 Linux 发行版软件仓库中。请在仓库中搜索
+``clang-format``。也可以下载预编译的 LLVM/clang 二进制文件，或者从
+以下地址获取源码自行构建：
+
+    https://releases.llvm.org/download.html
+
+更多信息见：
+
+    https://clang.llvm.org/docs/ClangFormat.html
+
+    https://clang.llvm.org/docs/ClangFormatStyleOptions.html
+
+
+.. _clangformatreview_zh:
+
+检查文件和补丁的编码风格
+------------------------
+
+使用工具的原地修改模式，可以检查整个子系统、目录或单个文件中的编码风格
+问题、笔误以及可改进之处。例如运行::
+
+    # Make sure your working directory is clean!
+    clang-format -i kernel/*.[ch]
+
+然后查看 git diff。
+
+统计差异中的行数，有助于改进或调整配置文件中的风格选项，也可用于测试
+``clang-format`` 的新功能或新版本。
+
+``clang-format`` 还支持读取统一格式的差异，因此可以方便地检查补丁和
+git diff。参见：
+
+    https://clang.llvm.org/docs/ClangFormat.html#script-for-patch-reformatting
+
+若要避免 ``clang-format`` 格式化文件的某一部分，可以这样写::
+
+    int formatted_code;
+    // clang-format off
+        void    unformatted_code  ;
+    // clang-format on
+    void formatted_code_again;
+
+如果你正在编写新文件或担任维护者，可能会想用这种方法使文件始终与
+``clang-format`` 的输出一致。但请注意，其他人可能使用不同版本的
+``clang-format``，也可能根本无法使用它。因此，在它成为普遍使用的工具
+之前，最好不要在内核源码中采用这种做法。
+
+
+.. _clangformatreformat_zh:
+
+重新排版代码片段
+----------------
+
+将工具集成到文本编辑器后，只需一个快捷键就能重新排版任意代码片段
+（选区）。移动代码、处理深层缩进的复杂代码以及多行宏（包括对齐反斜杠）
+时，这尤其有用。
+
+如果工具没有得到最合适的结果，仍可事后调整。不过，作为初步排版，它
+通常很有帮助。
+
+许多流行的文本编辑器都有集成支持。vim、emacs、BBEdit 和 Visual
+Studio 等编辑器可能内置了相关功能。操作说明见：
+
+    https://clang.llvm.org/docs/ClangFormat.html
+
+Atom、Eclipse、Sublime Text、Visual Studio Code、XCode 等编辑器和
+集成开发环境则可以找到现成的插件。
+
+在这种用法下，可以考虑使用第二个 ``.clang-format`` 文件，便于调整
+少量选项。参见 :ref:`clangformatextra_zh`。
+
+
+尚未支持的格式
+--------------
+
+``clang-format`` 尚不支持内核代码中常见的一些格式。这些情况很容易记住，
+经常使用该工具后便能很快学会避开或忽略它们。
+
+特别常见的情况包括：
+
+  - 对齐的一组单行 ``#define``，例如::
+
+        #define TRACING_MAP_BITS_DEFAULT       11
+        #define TRACING_MAP_BITS_MAX           17
+        #define TRACING_MAP_BITS_MIN           7
+
+    与如下输出相比::
+
+        #define TRACING_MAP_BITS_DEFAULT 11
+        #define TRACING_MAP_BITS_MAX 17
+        #define TRACING_MAP_BITS_MIN 7
+
+  - 对齐的指定初始化项，例如::
+
+        static const struct file_operations uprobe_events_ops = {
+                .owner          = THIS_MODULE,
+                .open           = probes_open,
+                .read           = seq_read,
+                .llseek         = seq_lseek,
+                .release        = seq_release,
+                .write          = probes_write,
+        };
+
+    与如下输出相比::
+
+        static const struct file_operations uprobe_events_ops = {
+                .owner = THIS_MODULE,
+                .open = probes_open,
+                .read = seq_read,
+                .llseek = seq_lseek,
+                .release = seq_release,
+                .write = probes_write,
+        };
+
+
+.. _clangformatextra_zh:
+
+额外功能和选项
+--------------
+
+配置文件默认未启用某些功能或风格选项，以尽量减少格式化输出与当前代码
+的差异，从而便于检查整份文件的风格以及差异和补丁。
+
+在其他情况下，例如特定子系统、目录或文件，内核风格可能有所不同，
+启用部分选项反而能更接近当地的风格。
+
+例如：
+
+  - 对齐赋值语句（``AlignConsecutiveAssignments``）。
+  - 对齐声明（``AlignConsecutiveDeclarations``）。
+  - 重新排版注释中的文本（``ReflowComments``）。
+  - 对 ``#include`` 排序（``SortIncludes``）。
+
+这些选项通常更适合重新排版代码片段，而非整份文件。可以另建一个
+``.clang-format`` 文件，在编辑器或集成开发环境中使用它。
diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
index 7b37194217b0..cf8d7d71904b 100644
--- a/Documentation/translations/zh_CN/dev-tools/index.rst
+++ b/Documentation/translations/zh_CN/dev-tools/index.rst
@@ -19,6 +19,7 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
    :maxdepth: 2
 
    testing-overview
+   clang-format
    sparse
    kcov
    kcsan
diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
index a00ad5d6b81e..2fa79e496167 100644
--- a/Documentation/translations/zh_CN/process/4.Coding.rst
+++ b/Documentation/translations/zh_CN/process/4.Coding.rst
@@ -54,7 +54,8 @@
 注意您还可以使用 ``clang-format`` 工具来帮助您处理这些规则，快速自动重新格式
 化部分代码，和审阅完整的文件以发现代码样式错误、拼写错误和可能的改进。它还
 可以方便地排序 ``#includes`` 、对齐变量/宏、重排文本和其他类似任务。有关详细
-信息，请参阅文档 :ref:`Documentation/dev-tools/clang-format.rst <clangformat>`
+信息，请参阅
+:ref:`Documentation/translations/zh_CN/dev-tools/clang-format.rst <clangformat_zh>`。
 
 抽象层
 ******
-- 
2.51.0

