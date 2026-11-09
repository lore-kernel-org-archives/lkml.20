Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201716;
	b=JowYYFk5YxhBDA6P30ArWJbO7YZMVPILl+VRqBl+y4T7nFFNhENhdGB3kfGQS0cclPuG
	 K0973Garb/gsPqvjEdvHyrK50IuhoIvPCZoazH4fdlEdvUM0nVftWXlykSc0DrGfZfwmQ
	 9Cgmp+IOjzoacv0jJd3SDfe1lWZ8p2DkZya4k2lJHMdyVwVhp0by9wHd3Jevbxtfr2N4g
	 NcPQCwlg2KvBUZsSya2YpGg6VqsHa6l08ThyNDK6HMCsYPVrXQas+e8fiaLiKRvgQHZja
	 hcx1uIegPemN8EhLaZlugUfCmcMoDsySkRI75sQqUtOJ1gBQ8ddrt38vD9E+KT90gAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201716;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=BFFU+fI2ROLJzJslgjYuUGevW7kvRB3CrpxpEyAMwm8=;
	b=JgXvsdhmby3TL61RmHWGJNbjV5MgV+I1hO/6YxV4S2rClWE78tNtjsj6YI6SHsg+qRfP
	 /2ZFEYre7l5YUTpAgfhccxuSipak1XklMHTwrQFpUElOazzp71pXskp8mm+09BdNgO9JB
	 U3xIiUR6jEKUkU87lYiPfFuhCi4YEK2QAuqGire+zDDk4+mILqhkN2yx9U2n6DEUWLVY/
	 7/N6My9Vzlek46eiaba0meLbNmnP+1kAyip5kGd0pFoiG2fFzjyK04z/LV+K+2E7FIJe0
	 /5SexUoAj1dy27hDB4YCihwC3u7QC1+LvYh9T0fcCFQd9xxOZw+MOcn2x6A1gqhBieQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1CC606A331;
	Mon,  9 Nov 2026 05:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1CC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMCmzsZrWPFqYTIKAA--.11020S2;
	Mon, 09 Nov 2026 13:21:47 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAn8jVlWPFq3SUuAA--.28705S6;
	Mon, 09 Nov 2026 13:21:46 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] docs/zh_CN: link AI guide to translated documents
Date: Mon,  9 Nov 2026 13:21:40 +0800
Message-ID: <27cecdd625db14563933678300b7da1d9b4fa254.1794197977.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMCmzsZrWPFqYTIKAA--.11020S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7trW7tw1kuFykKFyxWFyDWrg_yoW8trW8pF
	ykKFyxtan5Z3W5Kr4xKFWxXryUCFy7Wayjkryxt3saqrn5tw1Ivr9xt34UtF13W34xZa45
	Zrs5KrZ8ur1avFUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHFb7Iv0xC_Ar1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	wIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvj4RECJPDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Point coding-assistants.rst to the Chinese translations of
generated-content.rst and threat-model.rst.

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Weijie Yuan <wy@wyuan.org>
---
v1->v2: add the trailers and spell out "AI 助手" in the bug-reporting step

 .../translations/zh_CN/process/coding-assistants.rst      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/coding-assistants.rst b/Documentation/translations/zh_CN/process/coding-assistants.rst
index 2a432d1dc401..afa89e4140ce 100644
--- a/Documentation/translations/zh_CN/process/coding-assistants.rst
+++ b/Documentation/translations/zh_CN/process/coding-assistants.rst
@@ -18,7 +18,7 @@ AI 编程助手
 
 有关 AI 编程助手生成内容的准则，参见：
 
-* Documentation/process/generated-content.rst
+* Documentation/translations/zh_CN/process/generated-content.rst
 
 许可和法律要求
 ==============
@@ -66,9 +66,9 @@ AI 代理 **不得** 添加 Signed-off-by 标签。只有人类才能依法作
 8. 说明哪些工作未能完成。如果修复无法构建或测试，或者无法编写复现程序，
    应明确说明：维护者目前在分析未经验证的报告和未经测试的修复上浪费了
    太多时间。
-9. 阅读 Documentation/process/threat-model.rst，判断缺陷属于漏洞
-   还是普通缺陷，并将结论交由报告者复核（助手绝不能自行发送任何
-   内容）。普通缺陷按以下文档所述方式投稿：
+9. 阅读 Documentation/translations/zh_CN/process/threat-model.rst，
+   判断缺陷属于漏洞还是普通缺陷，并将结论交由报告者复核（AI 助手绝不能
+   自行发送任何内容）。普通缺陷按以下文档所述方式投稿：
    Documentation/translations/zh_CN/process/submitting-patches.rst；
    漏洞按以下文档所述方式报告：
    Documentation/translations/zh_CN/process/security-bugs.rst。
-- 
2.51.0

