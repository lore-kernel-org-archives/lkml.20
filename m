Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892079;
	b=4fwZjW/26yH1YFy5GSxt+Kdna/1wBxfQ/pvP34NlSnLnZPb9kzwT5cno8C9HixAelEym
	 tVZmKE7NdK9vq9dCWIZSwp8tlWXxQz4AZczDnKGwGGcc2PF+PlT/QAW8xFX5WXw1X5DRd
	 KMIbXqLadSs7sWzYL0sIo6N+y85TsIWRVRxIbdHwMPGbypsu5XNjDefFPsUBFV2E108Su
	 9wTB4Zd7hgw0dKqCX0Remdctwpi8WmO+VAnWBDNjZrljQygxr+YcyEg+wgov1UP36+30p
	 uQhapx2kbaLYI5LEGdHl9PDoq7sJa7Sj73AHWP+OTh76Hq4lI18J7UO3gMmBdLG3qvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892079;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=cbSgKruvS+nOZ8BMMyg2cx9JKd2KAgBd0Qe2VmtrD8g=;
	b=WnHDL7jRilh0lRNOumJ7dmFMzpipVbL4WlAtCQFoQrgR8bx1BKja/14No5yBb2ikUdUA
	 wgxCo+5QLqEtXDPIW/foDJx8k2C+VYMDvf4ZU7ZUWinOYrANTwQPGeiFsOOQhbCUfqOKZ
	 XoHmmvQJc5EJpyH4rSwVXI1DV8qNHeRkzKOQwza1w6/eo3T11Alhf+v7Lx+KtfCSABTXf
	 ULiUcCFl8ta1EovqIJLGsB4twtgNbdfbdFsef0fodPHGhCVsY9/H1TQAlqF8raaBSLj2B
	 9Wf9EjckR02Li8qTWN9YFeglZfhRh9HGFpQ+cJ/JU3kfl24Ww8GVbmCkOhqgP5gV7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DFF606A338;
	Thu,  5 Nov 2026 15:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1DFF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMD2vWnfnuxq1egHAA--.39731S2;
	Thu, 05 Nov 2026 23:21:03 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD3_x_Unuxq1Z8BAA--.3036S2;
	Thu, 05 Nov 2026 23:20:55 +0800 (CST)
Message-ID: <85899751-7554-4014-896a-24bb916c572e@hust.edu.cn>
Date: Thu, 5 Nov 2026 23:20:52 +0800
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
Subject: Re: [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese
 translation
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMD2vWnfnuxq1egHAA--.39731S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3tw1fZry3ZF47WFWDWw4rZrb_yoWDCFyrpF
	9xtF97Wa18A342yrWxGa1UZF48AF1fCayxtr1Igw1SyFnYkr9FqrW7tF17uayrWFyIy3WU
	Xw42qF4q9r42yFJanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQGb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bxv3nUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/23/26 3:14 PM, Weijie Yuan wrote:
> The script says:
>
> $ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> [1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> [1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> [1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
> [1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
> [1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
> [1787244823.779522] 4 commits needs resolving in total
>
> So I updated this document in chronological order, created four patches
> based on these four outdated commits to make it easier for you to
> review. Hence, you can freely squash them when applying them.

I am not sure if we should use "So I updated XXX" in the cover letter 
message.

 From my understanding, it is fine to describe about what you have done 
and why you do this here.

>
> Tested with make cleandocs && make htmldocs, no warning or error made by
> these patches. (Hope my eyes work fine this time :))
Haha, LLM can help here.
>
> [+To: Konstantin, as he is the original author, thanks.]
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> Changes in v2:
> - Fix the label with adding a prefix 'cn'.
> - Add Patch 5: Remove empty proofreader field from maintainer PGP guide.
>
> There are currently many other zh_CN documents containing an empty
> `:校译:` field.
>
> Is leaving an empty `:校译:` field intentional, perhaps as a placeholder
> for future proofreaders? I would prefer to remove it when no proofreader
> is listed, since an empty field does not provide any useful information.
>
> - Link to v1: https://patch.msgid.link/20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org
>
> ---
> Weijie Yuan (5):
>        docs/zh_CN: update maintainer-pgp-guide translation
>        docs/zh_CN: clarify free Nitrokey requirements
>        docs/zh_CN: update maintainer-pgp-guide kernel.org link
>        docs/zh_CN: add kernel.org trust repository reference
>        docs/zh_CN: remove empty proofreader field from maintainer PGP guide
>
>   .../zh_CN/process/maintainer-pgp-guide.rst         | 154 +++++++++++----------
>   1 file changed, 78 insertions(+), 76 deletions(-)
>
> Range-diff versus v1:
I think this versus is too long to read and it has no much information. 
In the future please do not add such thing in your patches.
>
> 1:  92e17e712630 ! 1:  ff5d9c87f839 docs/zh_CN: update maintainer-pgp-guide translation
>      @@ Commit message
>           Update Documentation/process/maintainer-pgp-guide.rst Chinese
>           translation.
>       
>      +    Add missing labels from the initial translation.
>      +
>           Update the translation through commit f44a29784f68
>           ("Documentation: update maintainer-pgp-guide for latest best practices")
>       
>           Assisted-by: LLM
>           Signed-off-by: Weijie Yuan <wy@wyuan.org>
>           ---
>      -
>           I used LLM to help me quickly locate where's the part that needs to be
>           updated, as well as what's the suggested diff for it. And it helped me
>           with some translation wording stuff. Well, I have to admit that LLM
>           knows Chinese better than me nowadays. ;-)
>       
>        ## Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst ##
>      +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: git 仓库和 tarball 都带有创建官方内核版本的内核开发者的 PGP
>      + - git 仓库在所有标签上提供 PGP 签名
>      + - tarball 为所有下载提供独立的 PGP 签名
>      +
>      ++.. _cn_devs_not_infra:
>      ++
>      + 信任开发者，不要信基础设施
>      + --------------------------
>      +
>       @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: git 仓库和 tarball 都带有创建官方内核版本的内核开发者的 PGP
>        则就是假定基础设施的任何部分都可能随时受到入侵。因此，管理员特意采取措施，
>        强调必须始终信任开发者，不能信任代码托管基础设施，无论后者的安全实践有多好。
>      @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: git 仓库和
>       +上述指导原则正是需要本指南的原因。希望确保通过对开发者的信任，我们不会
>       +仅仅将未来潜在安全事件的责任归咎于其他人。目的是提供一套指导开发者可以
>       +用来创建安全的工作环境并保护用于建立 Linux 内核本身完整性的 PGP 密钥。
>      ++
>      ++.. _cn_pgp_tools:
>        
>        PGP 工具
>        ========
>      @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: PGP 工具
>        
>        配置 gpg-agent 选项
>        ~~~~~~~~~~~~~~~~~~~
>      +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG agent是一个辅助工具，每当你使用该命令时，它都会自动
>      +     rc 文件来删除旧版本 GnuPG 中的所有内容，因为它可能不再做正确
>      +     的事情。
>      +
>      ++.. _cn_protect_your_key:
>      ++
>      + 保护你的 PGP 密钥
>      + =================
>      +
>       @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
>        
>            $ gpg --quick-addkey [fpr] ed25519 sign
>      @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将
>       -    你的打印机可能不再是连接到并行端口的简单哑设备，但由于输出仍然使
>       -    用你的密码进行加密，因此即使“云端打印”的现代打印机也应该保持相
>       -    对安全的操作
>      -+    密钥仍然使用你的密码加密，因此即使使用与“云”集成的现代打印机，
>      ++    密钥仍然使用你的密码加密，因此即使使用与“云集成的”现代打印机，
>       +    打印也应该仍是一项相对安全的操作。
>        
>        备份整个 GnuPG 目录
>      @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将
>        
>            $ cd ~/.gnupg/private-keys-v1.d
>            $ rm 1111000000000000000000000000000000000000.key
>      +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
>      + 完成此操作后，请确保删除过时的 ``secring.gpg`` 文件，其中仍然包含你
>      + 的私钥。
>      +
>      ++.. _cn_smartcards:
>      +
>      + 将子密钥移至专用加密设备
>      + ========================
>       @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: GnuPG 在将私钥存储到磁盘之前使用密码对其进行加密。这样
>        道密码）。此外，每次执行 GnuPG 操作时，密钥都会加载到系统内存中，并
>        可能被足够高级的恶意软件（例如 Meltdown 和 Spectre）从那里窃取。
>      @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: USB 设备插
>        
>        请记住将更新后的密钥发送回密钥服务器::
>        
>      +@@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: gpg-agent。
>      +
>      + .. _`Agent通过SSH转发`: https://wiki.gnupg.org/AgentForwarding
>      +
>      ++.. _cn_pgp_with_git:
>      ++
>      + 将 PGP 与 Git 结合使用
>      + ======================
>      +
>       @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: Git 的核心功能之一是它的分散性——一旦将仓库克隆到你的
>        项目的完整历史记录，包括其所有标签、提交和分支。然而，随着数百个克隆仓
>        库的出现，人们如何验证他们的 linux.git 副本没有被恶意第三方篡改？
>      @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: infradead.org
>        “ ``pip install patatt`` ”从 pypi 安装它。
>        
>       @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: DKIM 和 patatt 签名，例如::
>      +     Patatt 和 b4 仍在积极开发中，你应该检查这些项目的最新文档以了解任
>      +     何新功能或更新功能。
>      +
>      ++.. _cn_kernel_identities:
>      ++
>        如何验证内核开发者身份
>        ======================
>        
> 2:  6af479825464 ! 2:  e75297c007f6 docs/zh_CN: clarify free Nitrokey requirements
>      @@ Commit message
>           in MAINTAINERS or have a kernel.org account to qualify for a free
>           Nitrokey Start.
>       
>      +    Also translate the Nitrokey link text and fix its RST reference markup.
>      +
>           Update the translation through commit 273aa250f138
>           ("Documentation: Improve wording on requirements for a free Nitrokey")
>       
> 3:  e11c9967c042 ! 3:  f25ed4748812 docs/zh_CN: update maintainer-pgp-guide kernel.org link
>      @@ Commit message
>       
>           Signed-off-by: Weijie Yuan <wy@wyuan.org>
>           ---
>      -
>           The SPDX identifier of this translation was added at its birth, while
>           the SPDX identifier of its original English version was added this year
>           2026. Although it has been added, I'm quite curious about whether it is
>      @@ Commit message
>           the English original does not have one back in 2023.
>       
>           I know Jon has been a little bit careful about it, so I'd better leave
>      -    my thoughts here for furture reference.
>      +    my thoughts here for future reference.
>       
>           Thanks.
>       
> 4:  fc948173fa5e ! 4:  0a4ac21594bd docs/zh_CN: add kernel.org trust repository reference
>      @@ Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst: SSH 的信任
>        
>            trust-model tofu+pgp
>        
>      -+.. _kernel_org_trust_repository:
>      ++.. _cn_kernel_org_trust_repository:
>       +
>        使用 kernel.org 信任网仓库
>        --------------------------
> -:  ------------ > 5:  85427bbca5b0 docs/zh_CN: remove empty proofreader field from maintainer PGP guide
>
> ---
> base-commit: 1efa3bbbcc2dc6028e833d6d4f1bb23b8fe88c06
> change-id: 20260820-maintainer-pgp-guide-f1f96164cfaa

