Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794188379;
	b=D7a/YwlPjV66wWfAAEcUIBEDl89l+6+8be95j5c3R/5Kv7Ej8O2kpBZQK4Bg17u3fnyZ
	 L1+FdGoj2MBtulWlHHw36wOM9mfHPOxEoTAGJh27FvpXu0NJg6sYPlEwWYRFB4j/5/O9u
	 OtxuAoGg0LQR32bgz8FQ518IkmpmUYW0a25eszeNPdBDeJyLt3sTYhYcUv2DlsVccg8To
	 2cyBIEvSK2f+iTJxtN0ZrTO+W70xZqbx6aHgDX5296uaLGzIL1GNq+ZhyJWorxSLH3h6n
	 3rI1xZj5wkkcGkKrvXIk8krTubVbYareNzZ6lsB5clVZEQIB0yJBI4DO9rQhwC8xoSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794188379;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=SmNiWWTUiw7MgXxDCCDUx/NOoT7KtenYtJtXha7IZd4=;
	b=0jyH7M6BGbGbxW5UmWwbpSXaOKoPcm4U5Q/d48tvjrp/7JPfroW3vjWtDOkNPyBEZMx9
	 mA3VCjXyTUjeQ8XIUbzx+0Ny7Af691GTthYSLFbhzeBWkBi8RJNyn67xNJhLRKlGtUVVx
	 QPPOtufoFi2EQkF85MczXse2Klp8XbhTiucOG76wREuZH6wMUQlNJXtDAU4fEQkz0XhLv
	 +8IX7Z81cYi/R9uL7XoCDSH0LHxFkNWGR1uN/NjQ9Ca61Ripk0LAL+IcZY+73izbcYXeT
	 II2GDGTS2h0+VGV+AsfFboGsbsiO9va2y2VhdwfNqgyY2xHm1Lb8Cy2rQfl7ulK6w9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40B7606A333;
	Mon,  9 Nov 2026 01:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40B7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAGLsZYJPFqZr4JAA--.22262S2;
	Mon, 09 Nov 2026 09:39:36 +0800 (CST)
Received: from hust.edu.cn (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjw9JPFqZoQtAA--.37324S4;
	Mon, 09 Nov 2026 09:39:32 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] docs/zh_CN: link AI guide to translated documents
Date: Mon,  9 Nov 2026 09:39:08 +0800
Message-ID: <1dc2be038d0b172e731105619e3704c9c19b7b58.1794153793.git.dzm91@hust.edu.cn>
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
X-CM-TRANSID:IQEQrMAGLsZYJPFqZr4JAA--.22262S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7trWxGr1rGFyfuFykCryrXrb_yoW8Zw1xpF
	ykKFyxtan3A3W5K3yIgFWxXryUCFy7WayYkryxt3saqrn5tw1Ivr9xt34UtF13W34xZay5
	Xrs3KrZ8uF12vFUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	wIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0XVy3UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Point coding-assistants.rst to the Chinese translations of
generated-content.rst and threat-model.rst.
---
 .../translations/zh_CN/process/coding-assistants.rst      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/coding-assistants.rst b/Documentation/translations/zh_CN/process/coding-assistants.rst
index 2a432d1dc401..eef475b49d52 100644
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
+   判断缺陷属于漏洞还是普通缺陷，并将结论交由报告者复核（助手绝不能
+   自行发送任何内容）。普通缺陷按以下文档所述方式投稿：
    Documentation/translations/zh_CN/process/submitting-patches.rst；
    漏洞按以下文档所述方式报告：
    Documentation/translations/zh_CN/process/security-bugs.rst。
-- 
2.51.0

