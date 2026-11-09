Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.76.78.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201719;
	b=U637nUcESTPgb5a55PIZheaL5pFdrp22tPeVRfjLksebHvf7L92Pk20e17xRIiVJi31K
	 L9GEhxvIaFzu3bkjPd0La1vDM89cA723qFKaCBkNRJMPRfIlfUAyfu9u3m72PT6aRMRCM
	 5gmxfoTCnQRatKm9l75LxNQQYSZEuhv3kq43+gxnEpfVlnY3IJmqndBr1vVdZf//XAwc3
	 I08kjPWWbctXcZJFh0U91OskJ8pv8sOdPkdEEvvLivNK4j4PUqdRaloZfWC5RwU4MP+mC
	 ouv8EOZadXjESlB58e0zIQLqChd9beVVBU9X3eFG+InflBKPp4lbi5Hk3o3fURUn6fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201719;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=4mGGbztDF341AvaR+qrYshkYW2R9xASCbG5AyaJbl5g=;
	b=GzdJlZX8/qCooknnLsY/tnDNyODIjVLX8rcnpAEar2KIgqKAVm3LlzcTd/Yk9k+CANQx
	 27tuOAnoQytGGGmLQ+5A/sII5vvtTxvCKFiuRvIAhprw6mS8Lp2+V8EDPdySkvT5sgrU0
	 vIsxFeZUF/rl7uqLr+KGOCTpSw88puNCizDmNN4bB8Y+2dI806wHjWwxHLW0b/CPbTMBr
	 oY1FEiRdtuT7wPHmgdaD/tQINBm7uaSPrvi5pLQDe5aLT/3ucBko4YD5sJHZjPHY99ptq
	 eI4GmC9FA834B5jkPmVw25MVOoHdQwCHiVtoE41fzkSqkyVDBMog9mngCvdoRnPyhAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.76.78.106
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.78.106])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ECF606A323;
	Mon,  9 Nov 2026 05:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3ECF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMAGzmlqWPFqusQjAA--.9280S2;
	Mon, 09 Nov 2026 13:21:46 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAn8jVlWPFq3SUuAA--.28705S3;
	Mon, 09 Nov 2026 13:21:44 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] docs/zh_CN: translate coding-assistants.rst
Date: Mon,  9 Nov 2026 13:21:37 +0800
Message-ID: <d2cad291b61d10dd3fc9dca64f14a3f02b2551d1.1794197977.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMAGzmlqWPFqusQjAA--.9280S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZF47tr47Jw48uFWDAw1UZFb_yoW7Gr47pF
	1DKryftan5Ga4Ykr4IgFyxXF15CFyxGay3tryxt3saqrn5JwnayFZxtryjvF93W34rua45
	XFs3KrWDuFy3urJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMx
	kIecxEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Translate the AI coding assistant guidance into Chinese. Link to the
existing Chinese license-rules.rst guide while keeping untranslated
document references on their English paths.

Update the translation through commit 1e035297ffda
("docs: remove Assisted-by references")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
v1->v2: add the missing Signed-off-by and Reviewed-by tags

 .../zh_CN/process/coding-assistants.rst       | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/process/coding-assistants.rst

diff --git a/Documentation/translations/zh_CN/process/coding-assistants.rst b/Documentation/translations/zh_CN/process/coding-assistants.rst
new file mode 100644
index 000000000000..2a432d1dc401
--- /dev/null
+++ b/Documentation/translations/zh_CN/process/coding-assistants.rst
@@ -0,0 +1,74 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:翻译:
+ - 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+AI 编程助手
++++++++++++
+
+本文为使用 AI 工具及 AI 辅助功能参与 Linux 内核开发的开发者提供指导。
+
+协助 Linux 内核开发的 AI 工具应遵循标准的内核开发流程：
+
+* Documentation/translations/zh_CN/process/development-process.rst
+* Documentation/translations/zh_CN/process/coding-style.rst
+* Documentation/translations/zh_CN/process/submitting-patches.rst
+
+有关 AI 编程助手生成内容的准则，参见：
+
+* Documentation/process/generated-content.rst
+
+许可和法律要求
+==============
+
+所有贡献都必须符合内核的许可要求：
+
+* 所有代码必须与 GPL-2.0-only 兼容
+* 使用适当的 SPDX 许可证标识符
+* 详情参见 Documentation/translations/zh_CN/process/license-rules.rst
+
+Signed-off-by 与开发者来源认证
+==============================
+
+AI 代理 **不得** 添加 Signed-off-by 标签。只有人类才能依法作出
+开发者来源认证（DCO）。人类投稿者负责：
+
+* 审查所有由 AI 生成的代码
+* 确保符合许可要求
+* 添加自己的 Signed-off-by 标签，以确认符合 DCO 要求
+* 对贡献承担全部责任
+
+查找和修复缺陷的流程
+====================
+
+使用 AI 助手查找和修复缺陷时，**必须** 至少遵循以下步骤：
+
+1. 开始之前，完整阅读上面列出的流程文档，以及请求中提及的其他文档。
+   不要只依赖关键词搜索找到的片段。
+2. 记录提交 ID，并按指示定位缺陷。
+3. 对于发现的任何非显而易见的缺陷，尝试编写复现程序，验证缺陷看起来
+   确实存在。若缺少复现程序，报告可能被忽略，因为提交给维护者的许多
+   未经验证的缺陷报告最终被证明无效。如果最终发现判断有误，就在此停止。
+4. 编写修复补丁。这一步不可省略：除极少数情况外，能够发现缺陷的 AI 助手
+   也能够修复它。通常最好在发现缺陷的同一会话中编写修复，因为此时大语言
+   模型仍保留着相关的推理上下文，修复也会更好、更准确。
+5. 构建并通过复现程序或重新运行完整分析来验证修复；丢弃无效的修复并
+   尝试其他方案。修复不能引入构建警告，且必须通过 checkpatch.pl 检查
+   （参见
+   Documentation/translations/zh_CN/process/submitting-patches.rst）。
+6. 将有效的修复提交，并在提交说明中详细描述问题、解决方案和 Fixes 标签。
+   不要添加 Signed-off-by 标签。
+7. 使用 scripts/get_maintainer.pl 找出维护者和邮件列表。
+   具体操作见
+   Documentation/translations/zh_CN/process/security-bugs.rst。
+8. 说明哪些工作未能完成。如果修复无法构建或测试，或者无法编写复现程序，
+   应明确说明：维护者目前在分析未经验证的报告和未经测试的修复上浪费了
+   太多时间。
+9. 阅读 Documentation/process/threat-model.rst，判断缺陷属于漏洞
+   还是普通缺陷，并将结论交由报告者复核（助手绝不能自行发送任何
+   内容）。普通缺陷按以下文档所述方式投稿：
+   Documentation/translations/zh_CN/process/submitting-patches.rst；
+   漏洞按以下文档所述方式报告：
+   Documentation/translations/zh_CN/process/security-bugs.rst。
-- 
2.51.0

