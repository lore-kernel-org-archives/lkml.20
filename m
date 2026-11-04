Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.189.79.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807940;
	b=ZQxK4doR/+WU3NTCIohT7AGguAgYK4qqJ90nwzqaq+f1TFMG+Au6Cq+8ifQjHCrxdJ65
	 foyfolFMsifuDEH0qCiuk7DpFD8/haB0Ar6KInWxM/kuA3MRTbbc1RheI4wrXd075bQUR
	 WzNydFUJvP7tyNhTeHMMChn1XxQ0VMrr6X2zrSNCPvnu2Iq/m1uHZVMhKMXgl2AXPP7+7
	 zjRqqFkzNjd1dLxGg0gmUZfqwfrO64W9yYOn84vAFtcR7XVVAWTKFQBolCG73NlNUxGlx
	 PFWUIPPy3kWGtZbkfl0N6yOycKWynuKRxc1PKGZb3f4X6K5GtBmlxF0JBLkwYqSUXKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807940;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=GWgFAgYd7faXWjbRsQtHt5kEVPcmrggpvBb6RTogV/Q=;
	b=y9QFP3mKljPK+So40yD8qKtCnl/Ba53SDnrhSMFNniTgCN0fNvVlbd+ohLx+8LD/axbm
	 9vGLCl3O0IMEk+snMHBzrGws3QNIK5ow6e2VFfERmrypDz/GAs7d7Tz/O/EoyyX01vPTl
	 0U2wbaBMwKtA11roWzCbYIdQcCYyUe/bR46VpRHJr2LMWg5kQ/QR2XtETHPAF7ziXG1em
	 vpU9N51zTYvZ23gK4t4JjbkbgWvBJvfgCCJop3HwylHj7wn6XXLq9MCgkjrN7LBGffofH
	 VL8HFCM8DwD8Z7G/Tp6ovmB5BoA+wSilJD2hZOmaA7CCpE8zvQw7j+hIdjVsOSbpLsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=206.189.79.184
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1F5606A328;
	Wed,  4 Nov 2026 15:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1F5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDWnmo_Vutqr54AAA--.4412S2;
	Wed, 04 Nov 2026 23:58:55 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wDXwDY6VutqBUYbAA--.20765S2;
	Wed, 04 Nov 2026 23:58:52 +0800 (CST)
Message-ID: <96be0e40-f9aa-41b1-90c2-3c209b5091a3@hust.edu.cn>
Date: Wed, 4 Nov 2026 23:58:50 +0800
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
Subject: Re: [PATCH v2 2/2] docs/zh_CN: improve maintainer/pull-requests
 translation
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
 <20260905-configure-git-v2-2-ab194db8c6b9@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20260905-configure-git-v2-2-ab194db8c6b9@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDWnmo_Vutqr54AAA--.4412S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3CrWDAw43Ww1UZw47Xw1fWFg_yoW8Wr1Uto
	Wvkw4F9a1kC3Z8XF1Fgrs3JFsruF4rZF40yF4DCF43KFs8Kr1Fy3WDtFnxtr9Iv3y5WF4r
	Ja4YqrW0qFn5Ja47n29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOl7k0a2IF6w4xM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkIec
	xEwVCm-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0MxRDUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 9/5/26 6:06 PM, Weijie Yuan wrote:
> After the last update to the Chinese translation, the English document
> removed the explicit section label, replaced the configure-git
> cross-reference with a direct path, and changed "tree for forever" to
> "tree forever".
>
> Update the translation through commit 3a1b9c4d8edb
> ("docs: Remove redundant word "for"").
>
> Remove the abandoned Chinese section label and point the configure-git
> reference to the Chinese translation.
>
> Some of the existing wording did not read very smoothly, so polish a few
> expressions. And also correct some Git terminology.

Merge the above two paragraphs into the first paragraph and keep the 
line "Update the translation through commit " at the end of commit message.

Dongliang Mu

>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
> I did make quite a few changes to make the reading more fluent. However,
> to some extent, this might also be unnecessary. If you think there are
> too many, I will remove the less essential ones. Thanks.
It's fine.
> ---
>   .../zh_CN/maintainer/pull-requests.rst             | 127 +++++++++++----------
>   1 file changed, 66 insertions(+), 61 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/maintainer/pull-requests.rst b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> index ce9725f4674c..4509ec2a2bea 100644
> --- a/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> +++ b/Documentation/translations/zh_CN/maintainer/pull-requests.rst
> @@ -5,19 +5,18 @@
>   :译者:
>   
>    吴想成 Wu XiangCheng <bobwxc@email.cn>
> -
> -.. _pullrequests_zh:
> + 袁维杰 Weijie Yuan <wy@wyuan.org>


I had some internal discussion between zh_CN maintainers. The "译者" and 
“校验” can be kept to motivate old or new contributors to submit more 
patches. How do you think about this?

Dognliang Mu


>   
>   如何创建拉取请求
>   ================
>   
> -本章描述维护人员如何创建并向其他维护人员提交拉取请求。这对将更改从一个维护者
> -树转移到另一个维护者树非常有用。
> +本章介绍维护者如何创建拉取请求并将其提交给其他维护者。这适用于将更改从一棵
> +维护者树转移到另一棵维护者树。
>   
> -本文档由Tobin C. Harding（当时他尚不是一名经验丰富的维护人员）编写，内容主要
> -来自Greg Kroah Hartman和Linus Torvalds在LKML上的评论。Jonathan Corbet和Mauro
> -Carvalho Chehab提出了一些建议和修改。错误不可避免，如有问题，请找Tobin C.
> -Harding <me@tobin.cc>。
> +本文档由 Tobin C. Harding（当时他尚不是一名经验丰富的维护者）编写，主要依据
> +Greg Kroah-Hartman 和 Linus Torvalds 在 LKML 上的评论。Jonathan Corbet 和
> +Mauro Carvalho Chehab 提出了建议和修正。曲解原意并非有意，却在所难免；请将
> +责难发送给 Tobin C. Harding <me@tobin.cc>。
>   
>   原始邮件线程::
>   
> @@ -27,54 +26,58 @@ Harding <me@tobin.cc>。
>   创建分支
>   --------
>   
> -首先，您需要将希望包含拉取请求里的所有更改都放在单独分支中。通常您将基于某开发
> -人员树的一个分支，一般是打算向其发送拉取请求的开发人员。
> +首先，你需要将希望包含在拉取请求中的所有更改放在一个单独的分支上。通常，这个
> +分支会基于你准备向其发送拉取请求的开发者树中的某个分支。
>   
> -为了创建拉取请求，您必须首先标记刚刚创建的分支。建议您选择一个有意义的标记名，
> -以即使过了一段时间您和他人仍能理解的方式。在名称中包含源子系统和目标内核版本
> -的指示也是一个好的做法。
> +要创建拉取请求，必须先给刚刚创建的分支打标签。建议选择一个有意义的标签名称，
> +使你和其他人在一段时间后仍能理解其含义。一种良好做法是在名称中指明来源子系统
> +和目标内核版本。
>   
> -Greg提供了以下内容。对于一个含有drivers/char中混杂事项、将应用于4.15-rc1内核的
> -拉取请求，可以命名为 ``char-misc-4.15-rc1`` 。如果要在 ``char-misc-next`` 分支
> -上打上此标记，您可以使用以下命令::
> +Greg 给出了以下示例。对于一个包含 drivers/char 杂项、准备应用到 4.15-rc1
> +内核版本的拉取请求，可以将其命名为 ``char-misc-4.15-rc1``。如果要从名为
> +``char-misc-next`` 的分支创建该标签，可以使用以下命令::
>   
>   	git tag -s char-misc-4.15-rc1 char-misc-next
>   
> -这将在 ``char-misc-next`` 分支的最后一个提交上创建一个名为 ``char-misc-4.15-rc1``
> -的标记，并用您的gpg密钥签名（参见 Documentation/maintainer/configure-git.rst ）。
> +该命令会基于 ``char-misc-next`` 分支的最后一个提交创建名为
> +``char-misc-4.15-rc1`` 的签名标签，并使用你的 GPG 密钥签名（参见
> +Documentation/translations/zh_CN/maintainer/configure-git.rst）。
>   
> -Linus只接受基于签名过的标记的拉取请求。其他维护者可能会有所不同。
> +Linus 只接受基于签名标签的拉取请求。其他维护者的要求可能不同。
>   
> -当您运行上述命令时 ``git`` 会打开编辑器要求你描述一下这个标记。在本例中您需要
> -描述拉取请求，所以请概述一下包含的内容，为什么要合并，是否完成任何测试。所有
> -这些信息都将留在标记中，然后在维护者合并拉取请求时保留在合并提交中。所以把它
> -写好，它将永远留在内核中。
> +运行上述命令时，``git`` 会打开编辑器并要求你描述该标签。在本例中，你描述的是
> +一个拉取请求，因此应概述其中包含什么、为何应当合并，以及做过哪些测试（如有）。
> +所有这些信息都会保存在标签本身中；如果维护者合并了拉取请求，它们还会进入维护者
> +创建的合并提交。因此请认真撰写，因为它将永远保留在内核树中。
>   
> -正如Linus所说::
> +正如 Linus 所说::
>   
> -	不管怎么样，至少对我来说，重要的是 *信息* 。我需要知道我在拉取什么、
> -	为什么我要拉取。我也希望将此消息用于合并消息，因此它不仅应该对我有
> -	意义，也应该可以成为一个有意义的历史记录。
> +	总之，至少对我而言，重要的是 *说明文字*。我想知道自己
> +	正在拉取什么，以及为什么应当拉取。我还希望把这段说明用作合并说明，
> +	所以它不但要让我看得明白，还应当能成为有意义的历史记录。
>   
> -	注意，如果拉取请求有一些不寻常的地方，请详细说明。如果你修改了并非
> -	由你维护的文件，请解释 **为什么** 。我总会在差异中看到的，如果你不
> -	提的话，我只会觉得分外可疑。当你在合并窗口后给我发新东西的时候，
> -	（甚至是比较重大的错误修复），不仅需要解释做了什么、为什么这么做，
> -	还请解释一下 **时间问题** 。为什么错过了合并窗口……
> +	请注意，如果拉取请求中有什么异常，就非常应该在说明中写清楚。
> +	如果你改动了自己并不维护的文件，请解释 _为什么_。无论如何，我会在
> +	差异统计中看到它；如果你没提到，我只会更加怀疑。当你在合并窗口
> +	结束后给我发送新内容（甚至是错误修复，但看起来很吓人的那种）时，
> +	不仅要解释它们做了什么、为什么这样做，还要解释这个 _时机_。
> +	发生了什么，导致它没能通过合并窗口进入……
>   
> -	我会看你写在拉取请求邮件和签名标记里面的内容，所以根据你的工作流，
> -	你可以在签名标记里面描述工作内容（也会自动放进拉取请求邮件），也
> -	可以只在标记里面放个占位符，稍后在你实际发给我拉取请求时描述工作内容。
> +	我会采用你写在拉取请求邮件 _和_ 签名标签中的内容。因此，
> +	取决于你的工作流程，你可以在签名标签中描述自己的工作（这些内容也会
> +	自动进入拉取请求邮件），也可以让签名标签仅仅作为一个没有实质内容的
> +	占位符，等到真正向我发送拉取请求时再描述这项工作。
>   
> -	是的，我会编辑这些消息。部分因为我需要做一些琐碎的格式调整（整体缩进、
> -	括号等），也因为此消息可能对我有意义（描述了冲突或一些个人问题）而对
> -	合并提交信息上下文没啥意义，因此我需要尽力让它有意义起来。我也会
> -	修复一些拼写和语法错误，特别是非母语者（母语者也是;^）。但我也会删掉
> -	或增加一些内容。
> +	没错，我会编辑这段说明。一方面是因为我通常会做些简单的格式调整（整体
> +	缩进、引用等）；另一方面，其中一些内容在我拉取时可能很有用（例如描述
> +	冲突，以及你此时发送请求所面临的个人问题），但放在合并提交说明的上下文
> +	中可能没有意义，所以我会尽量使它通顺。我也会修正看到的拼写错误和糟糕
> +	语法，尤其是非英语母语者写的内容（英语母语者也一样 ;^）。
> +	不过，我也可能会漏掉一些，甚至再添上一些。
>   
>   			Linus
>   
> -Greg给出了一个拉取请求的例子::
> +Greg 给出了一个拉取请求示例::
>   
>   	Char/Misc patches for 4.15-rc1
>   
> @@ -104,9 +107,10 @@ Greg给出了一个拉取请求的例子::
>   	Signed-off-by: Your-name-here <your_email@domain>
>   
>   
> -此标记消息格式就像一个git提交。顶部有一行“总结标题”， 一定要在下面sign-off。
> +标签说明的格式与 Git 提交说明相同：顶部用一行作为“摘要主题”，
> +并确保在底部添加签署信息。
>   
> -现在您已经有了一个本地签名标记，您需要将它推送到可以被拉取的位置::
> +现在本地已有签名标签，需要将其推送到可供拉取的位置::
>   
>   	git push origin char-misc-4.15-rc1
>   
> @@ -114,35 +118,36 @@ Greg给出了一个拉取请求的例子::
>   创建拉取请求
>   ------------
>   
> -最后要做的是创建拉取请求消息。可以使用 ``git request-pull`` 命令让 ``git``
> -为你做这件事，但它需要确定你想拉取什么，以及拉取针对的基础（显示正确的拉取
> -更改和变更状态）。以下命令将生成一个拉取请求::
> +最后要做的是编写拉取请求消息。``git`` 可以方便地用 ``git request-pull``
> +命令代劳，但需要获得一些帮助，以确定你希望对方拉取什么，以及拉取内容应以什么为
> +基础（从而显示正确的待拉取更改和差异统计）。以下命令会生成一个拉取请求::
>   
>   	git request-pull master git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/ char-misc-4.15-rc1
>   
> -引用Greg的话::
> +引用 Greg 的话::
>   
> -	此命令要求git比较从“char-misc-4.15-rc1”标记位置到“master”分支头（上述
> -	例子中指向了我从Linus的树分叉的地方，通常是-rc发布）的差异，并去使用
> -	git:// 协议拉取。如果你希望使用 https:// 协议，也可以用在这里（但是请
> -	注意，部分人由于防火墙问题没法用https协议拉取）。
> +	这个命令要求 Git 比较“char-misc-4.15-rc1”标签所在位置与“master”分支
> +	顶端之间的差异（在我的例子中，“master”指向我与 Linus 的树发生分叉前
> +	的最后位置，通常是一个 -rc 版本），并使用 git:// 协议拉取。如果希望使用
> +	https://，也可以在这里使用（但请注意，一些位于防火墙后的用户使用 HTTPS
> +	方式拉取 Git 仓库时会遇到问题）。
>   
> -	如果char-misc-4.15-rc1标记没有出现在我要求拉取的仓库中，git会提醒
> -	它不在那里，所以记得推送到公开地方。
> +	如果请求拉取的仓库中没有“char-misc-4.15-rc1”标签，Git 会抱怨说找不到
> +	它。这可以方便地提醒你，确实需要把标签推送到一个公开位置。
>   
> -	“git request-pull”会包含git树的地址和需要拉取的特定标记，以及标记
> -	描述全文（详尽描述标记）。同时它也会创建此拉取请求的差异状态和单个
> -	提交的缩短日志。
> +	“git request-pull”的输出会包含要拉取的 Git 树位置和具体标签，以及
> +	该标签的完整说明文字（这正是需要在标签中提供充分信息的原因）。它还会
> +	生成拉取请求的差异统计，以及拉取请求所含各个提交的简短日志。
>   
> -Linus回复说他倾向于 ``git://`` 协议。其他维护者可能有不同的偏好。另外，请注意
> -如果你创建的拉取请求没有签名标记， ``https://`` 可能是更好的选择。完整的讨论
> -请看原邮件。
> +Linus 回复说他倾向于使用 ``git://`` 协议。其他维护者可能有不同偏好。另请注意，
> +如果创建拉取请求时不使用签名标签，那么 ``https://`` 可能是更好的选择。完整讨论
> +请参阅原始邮件线程。
>   
>   
>   提交拉取请求
>   ------------
>   
> -拉取请求的提交方式与普通补丁相同。向维护人员发送内联电子邮件并抄送LKML以及
> -任何必要特定子系统的列表。对Linus的拉取请求通常有如下主题行::
> +拉取请求的提交方式与普通补丁相同。通过邮件正文将其发送给维护者，并视需要抄送
> +LKML 和相关子系统的邮件列表。发给 Linus 的拉取请求通常使用类似下面的主题行::
>   
>   	[GIT PULL] <subsystem> changes for v4.15-rc1
>

