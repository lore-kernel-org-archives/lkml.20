Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=13.75.44.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201711;
	b=Oqk/Sx5GBPHCltV5AHExrQVhPVSmgS2lKnGCTnbSNwAf8cEfc4Vx8+RDNRS9W0KDPlJF
	 1li2ZCS8ib9C2VbFCRmzxjYJ684Q7t52c06Yt/ZGLgAwUKeWRMOw5b5pU+APgpnMdg1Eh
	 LFL/ZtoYykJvMM4WjnrCMuQXDAjhjRwG+1Tkc5Rj8E1RkAOd5KYN5+2cmm84omslEkhrh
	 5ECSRmSAyuFYIkG1sVzjDSxdGdomk6l2M3YQ0LYHkz+paN4acqyqemx/H492WgV8HqBL/
	 EfMhZO9i6KFszxFfi6Rh+/no52rnJXaONbJbN8cTrLoTFaGdr00/vtO6CBvcHTwA4NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201711;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=FTGfTZKsS4R6jZowdxedlTWXTuWPATy+eOp+Kt/FRW4=;
	b=XsEaETnoD2MeV7tJJsYpOvLRIfOo6/fR8xHaTWPQvZeCOJuD/3ojHzqB6r3fHg+ENjGK
	 nzqJ52zSTQzRIvMNBH+vIwex5fZFDAHkya0Km0MJZ3nfRAY6G3C7Xj/HydiJ5TVkOly3n
	 oj+bMucto4d6V5GLeX3fyd8oq0COzEzSMiDQRsq45clp70aNa3cS1WPoAhCrDsC/qYPSK
	 MLkOID5kd/tHFUpNvSYZXQiUvUb+agu39Sv9tanEa//QG5yyLAck8AiudeFTtM6StMiF5
	 iY8BuU5uSDp849wO5obzlagDLKtx75gLxyxjsM6vd0qskCeAervvimKtk9jBmcrfVwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=13.75.44.102
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1826B606A322;
	Mon,  9 Nov 2026 05:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1826B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMCGTWlqWPFqvcQjAA--.6289S2;
	Mon, 09 Nov 2026 13:21:46 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAn8jVlWPFq3SUuAA--.28705S4;
	Mon, 09 Nov 2026 13:21:45 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] docs/zh_CN: translate generated-content.rst
Date: Mon,  9 Nov 2026 13:21:38 +0800
Message-ID: <690983f220dde2f52e3522e4d204fd3696d2648d.1794197977.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMCGTWlqWPFqvcQjAA--.6289S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Ary3Cr4kAF45Gw4kGw43GFg_yoW7CF1UpF
	Z7G3s7tF10kFy5CFZIkFy5X3W5CFnxGFyxJryfJasxtrZ3GFyqyry2vr9xXa43W347AF98
	CFWkGryUCF1ayFUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Translate the tool-generated content guidelines into Chinese.

Update the translation through commit d699a5da1039
("docs: link AI coding assistants and tool-generated content pages")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
v1->v2: add the missing Signed-off-by and Reviewed-by tags

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

