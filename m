Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794188377;
	b=eVET8XOEwjJImehFcIF2MWWqI7bCQPfy/lT5exZahISRKka1Reer2x3/pPotCRkTdQvV
	 hAUdqY8uHhENKjXytWGq6NMHoFspHnFg4jlpV2lBhpn71QCVUDQPrMqS+xpYla/Z2Z3O9
	 cMuTVG8KAFDCmMnFQnhv7bVLhKja2e2UpsM4G/WGnp9Xc51O/4TTMynaHM4Bvyd9W4xc8
	 fgat3NblC9d/vEjHFf7HajSAas2x7ldX91bKYokiEC+5uHw3r6IEo3jJ5BxhPMJ/nMRit
	 06ZXOqWxg+tSlkkvmM+g8Hy+KxqE7ko9BtDWUJTr0eZW1zS9SaNSwoH5tc/SdmGzvRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794188377;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=rGpy2J3RwV8f8Yjs5bgIKdGTteqMsKSOdlOCeLRY2dA=;
	b=a/mc2IhCZPzETTlymhtGo4MUz5ubsXpgb8canU8DjS3mUousu5Hep4f7XGEgsj8GwSOw
	 sVoxDSAL4THcqKtQuX3UEtBYrhPjVKgO5qKXjJo3kNW/HeIFMr7yzEMK8g7EoCxHHQ1v/
	 48SfriDhyrKr84Yv+QsOT+y4prXczbTx6F4biWGktQX9SmsauK1IUBApwZ+ehkPkxMxks
	 siFZqBdc6ZxM+S4R50sx7FjvqYDWL+fO+DO/OC0Qg1VjfQT4ZJTCn4Q6fvOYbKgt57w/P
	 cNQpu1qmCjIlINTVDcCXGYd8xPGDj38d9DxoQqgwovnH7GQBFiWc/rqI/6CY+vjlYgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA32F606A326;
	Mon,  9 Nov 2026 01:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA32F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBmL2tNJPFqBpAiAA--.8502S2;
	Mon, 09 Nov 2026 09:39:25 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjw9JPFqZoQtAA--.37324S2;
	Mon, 09 Nov 2026 09:39:11 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] docs/zh_CN: translate generated-content.rst
Date: Mon,  9 Nov 2026 09:39:06 +0800
Message-ID: <541a2e0f4958f2261db1397b095a8206675634a1.1794153793.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1794153793.git.dzm91@hust.edu.cn>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMBmL2tNJPFqBpAiAA--.8502S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Ary3Cr4kAF45Gw4kGw43GFg_yoW7Ar1kpF
	Z7G3s3tF40kFy5CFZIkFy5X3W5CFnxGFyxJr93JasxtrZ3GFyqyry2vF9xXa43W347AF98
	CFWkJryUCFnIyFUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Translate the tool-generated content guidelines into Chinese.

Update the translation through commit d699a5da1039
("docs: link AI coding assistants and tool-generated content pages")
---
 .../zh_CN/process/generated-content.rst       | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/process/generated-content.rst

diff --git a/Documentation/translations/zh_CN/process/generated-content.rst b/Documentation/translations/zh_CN/process/generated-content.rst
new file mode 100644
index 000000000000..0dfc02018eb9
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/generated-content.rst
@@ -0,0 +1,97 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:翻译:
+ - 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+========================
+工具生成内容的内核准则
+========================
+
+目的
+====
+
+内核贡献者早已使用工具生成贡献。这些工具能够增加贡献的数量。与此同时，
+审阅者和维护者的精力有限。了解一份贡献中的哪些部分由人编写、哪些部分
+由工具生成，有助于合理使用这些精力，保持内核开发的健康发展。
+
+本文旨在阐明社区对工具的期望，让大家提高效率，同时维持投稿者与审阅者
+之间的高度信任。
+
+适用范围之外
+============
+
+以下准则不适用于仅对已有内容作细微修改的工具，也不涉及协助处理简单
+事务的工具。例如：
+
+ - 拼写和语法修正，例如改用祈使句
+ - 输入辅助，例如补全标识符、常见样板代码或简单模式
+ - 纯机械式转换，例如重命名变量
+ - 格式调整，例如运行 Lindent、``clang-format`` 或 ``rust-fmt``
+
+即使所用工具不在本文适用范围内，仍应考虑：告知审阅者所用的工具，是否
+有助于他们审阅你的贡献。
+
+适用范围
+========
+
+如果内核贡献中有相当一部分内容并非由 Signed-off-by 签名链中的人编写，
+而是由工具生成，则适用以下准则。
+
+发现问题并测试修复也是开发流程的一部分。如果使用工具发现了一项变更所
+修复的问题，应在变更日志中注明。这既是对工具的认可，也能帮助其他开发者
+了解这些工具。
+
+例如：
+
+ - 工具建议的任何修复，例如 ``checkpatch.pl --fix``
+ - Coccinelle 脚本
+ - 聊天机器人生成了补丁中用于对列表条目排序的新函数
+ - 补丁中的 .c 文件最初由编程助手生成，之后经人工整理
+ - 将补丁交给生成式 AI 工具，由它编写变更日志
+ - 从另一种语言翻译变更日志
+
+如果不能确定，请选择公开透明，假定这些准则适用。
+
+准则
+====
+
+首先，阅读开发者来源认证：
+Documentation/translations/zh_CN/process/submitting-patches.rst。
+它的规则简单，长期以来涵盖了许多工具生成的贡献。请确保自己理解提交的
+全部内容，并准备好回应审阅意见。
+
+其次，投稿时应在封面信和变更日志中如实说明内容的来源。可以提供如下信息，
+使说明更加透明：
+
+ - 使用了哪些工具？
+ - 这些工具的输入是什么，例如 Coccinelle 源脚本？
+ - 如果代码主要根据一条或几条简短提示词生成，请附上这些提示词。
+   如果会话较长，请概述提示词和由此获得的辅助。
+ - 内容中的哪些部分受到该工具影响？
+ - 如何测试投稿内容，使用了哪些工具测试修复？
+
+与所有贡献一样，各位维护者可自行决定如何处理投稿。例如，他们可能：
+
+ - 将其视为普通贡献；
+ - 直接拒绝；
+ - 特殊处理，例如要求额外测试、更加严格地审阅，或给予低于人工
+   编写内容的审阅优先级；
+ - 要求其他特殊步骤，例如请贡献者详细说明工具或模型如何训练；
+ - 请投稿者更详细地解释贡献，以确认投稿者充分理解代码的工作方式；
+ - 建议更好的提示词，而不是提出具体的代码修改建议。
+
+如果工具允许你自动生成贡献，应预期生成内容越多，审阅就越严格。
+
+与任何工具的输出一样，结果可能有误或不合适。你应理解并能够为提交的
+所有内容作出解释。如果做不到，就不要提交生成的变更。
+
+如果仍然提交，维护者有权不作详细审阅而拒绝整个补丁集。
+
+参考资料
+========
+
+有关 AI 编程助手的具体准则，参见：
+
+* Documentation/translations/zh_CN/process/coding-assistants.rst
-- 
2.51.0

