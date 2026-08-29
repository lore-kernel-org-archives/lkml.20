Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143D04C6D;
	Sat, 29 Aug 2026 02:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972268; cv=none; b=j+ehbd6QiDhbOd2hCcSVWrL5W8neiNS02TZ49aCJLQQe/arGut2oZ4UloJURFSVGUDPdmww276kjMQg7QeyFTG+WM7gQz+XARpSVBkdZO+xnwV1OrdLv5Nm49v6I4hmGL5Avg7Lhtm68G/i4iJ3neb+8lrojTg19zBX6PpsJXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972268; c=relaxed/simple;
	bh=TzJoHjCt8v3OyD1rEx+AxrfBI//whlUclKf2F/yk6dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDuNadk1Uw+6/c8qTD0fgGwl1rhYf66GYrDFGITvkIrrVIkztFyIZX/L0X4cMmbR8yTwzHfFpRcRaTrDWwrLmpt6NltbCLmnd48PpRfzKk08eUx/Pc29Dg+mf/P7iSBICCx1pgoWPYCMPW1HPFuXzfMJj25USOQ6aF0pLmoRYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMA2vk+lSpJqiaEKAA--.25595S2;
	Sat, 29 Aug 2026 10:57:41 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wCnRKGhSpJqOoYrAA--.39705S2;
	Sat, 29 Aug 2026 10:57:39 +0800 (CST)
Message-ID: <8490cbf8-0514-40a0-8456-d6a1085c29f0@hust.edu.cn>
Date: Sat, 29 Aug 2026 10:57:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMA2vk+lSpJqiaEKAA--.25595S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1fAFW7Zr4kZF47CF1rWFg_yoW7WrWrpr
	ZFgF9aqFn29r1UKa4xKr1UJFW8ZFsxWFZI934DA3s3tr4kJrWIgayDJ3srCF1ag3s3Zry0
	va4kuFy8Ca47A3JanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jw
	0_GFylnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU-zBTDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/29/26 10:23 AM, Yukai Wu wrote:
> Update Documentation/arch/riscv/patch-acceptance.rst translation.
>
> Update the translation through commit ed843ae947f8
> ("docs: move riscv under arch")
>
> Signed-off-by: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> Changes in v2:
>   - Changed "补丁跟踪系统" to "Patchwork".
>   - Corrected branch selection to "for-next 或 fixes" (was "和").
>   - Adjusted "已批准" or "已冻结" order.
>   - Changed "只接受" to "只考虑".
>   .../zh_CN/arch/riscv/patch-acceptance.rst     | 46 ++++++++++++++-----
>   1 file changed, 34 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> index c8eb230ca8ee..20b91d0433a9 100644
> --- a/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> +++ b/Documentation/translations/zh_CN/arch/riscv/patch-acceptance.rst
> @@ -15,19 +15,41 @@ arch/riscv 开发者维护指南
>   
>   概述
>   ----
> -RISC-V指令集体系结构是公开开发的：
> +RISC-V 指令集体系结构是公开开发的：
>   正在进行的草案可供所有人查看和测试实现。新模块或者扩展草案可能会在开发过程中发
> -生更改---有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给RISC-V Linux
> -维护者带来挑战。Linux开发过程更喜欢经过良好检查和测试的代码，而不是试验代码。我
> -们希望推广同样的规则到即将被内核合并的RISC-V相关代码。
> +生更改 --- 有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给 RISC-V
> +Linux 维护者带来挑战。Linux 维护者不赞成频繁的变更，且 Linux 开发过程更喜欢经过
> +良好检查和测试的代码，而不是试验代码。我们希望推广同样的规则到即将被内核合并的
> +RISC-V 相关代码。
> +
> +Patchwork
> +---------
> +
> +RISC-V 有一个 patchwork 实例，可以在那里查看补丁的状态：
> +
> +  https://patchwork.kernel.org/project/linux-riscv/list/
> +
> +如果你的补丁不在默认视图中出现，那么 RISC-V 维护者很有可能已要求修改，或者希望
> +将其应用到另一个代码树上。
> +
> +自动化流程会在该 patchwork 实例上运行，在每个补丁到达时立刻对其进行构建/测试。
> +自动化流程会根据补丁是否被识别为修复，选用 RISC-V `for-next` 或 `fixes` 分支
> +当前的 HEAD；若上述均应用失败，则使用 RISC-V `master` 分支。补丁系列被应用到的具
> +体提交将标注在 patchwork 上。任何检查未通过的补丁通常不会被应用，并且在大多数情
> +况下将需要重新提交。
>   
>   附加的提交检查单
>   ----------------
> -我们仅接受相关标准已经被RISC-V基金会标准为“已批准”或“已冻结”的扩展或模块的补丁。
> -（开发者当然可以维护自己的Linux内核树，其中包含所需代码扩展草案的代码。）
> -
> -此外，RISC-V规范允许爱好者创建自己的自定义扩展。这些自定义拓展不需要通过RISC-V
> -基金会的任何审核或批准。为了避免将爱好者一些特别的RISC-V拓展添加进内核代码带来
> -的维护复杂性和对性能的潜在影响，我们将只接受RISC-V基金会正式冻结或批准的的扩展
> -补丁。（开发者当然可以维护自己的Linux内核树，其中包含他们想要的任何自定义扩展
> -的代码。）
> +我们仅接受针对新模块或扩展的补丁，前提是这些模块或扩展的规范被列为未来不太可能发
> +生不兼容的变更。对于来自 RISC-V 基金会的规范，这意味着“已冻结”或“已批准”，对于
> +UEFI 论坛的规范，这意味着已发布的 ECR。（开发者当然可以维护自己的 Linux 内核树，
> +其中包含他们所需的任何扩展草案的代码。）
> +
> +此外，RISC-V 规范允许实现者创建自己的自定义扩展。这些自定义扩展不需要通过 RISC-V
> +基金会的任何审核或批准流程。为了避免因添加实现者特定的 RISC-V 扩展带来的维护复杂
> +性和对性能的潜在影响，我们将只考虑符合以下任一条件的扩展补丁：
> +
> +- 已由 RISC-V 基金会正式冻结或批准
> +- 已按照标准 Linux 惯例，在广泛可用的硬件中实现
> +
> +（实现者当然可以维护自己的 Linux 内核树，其中包含他们所需的任何自定义扩展的代码。）

