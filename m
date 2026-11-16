Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840284;
	b=SohRLcLHmhYGaartpFX4zFwNlLuRT9HnGKHFpqKubApZXUaU8MNzHu6yx4xSzeX9t1vA
	 GNJ4r5W3s4q/EbL70Q1pfjguOju5aJGzOlvHbV+fsOjqpxSOvkgWpi6ldW6hwG2cjdF+K
	 HOca1ELcbE9LpYOPfgktSx+ifZR40ozyeBpgBrZButcn44yW47eQnFH+3yp2m6+Xd7IZP
	 s3CQbfDBjX7idWwiAdGaNOAI16Q9f8KJqNNdKBtCCZvNDRuBQM0LKkihkV8CIremLTKnw
	 DyNHUK2d+oBSt/6kMWJ4wfheEGzC7Gq4kwLWMUBQs0p585K65XcjdkNGRZuyOGYYc7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840284;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=KrS6nSSflC2Uo74lKP88Gza8Y+3ZpCavvBZ/lSebZ8U=;
	b=n7w9btRlVBzQhvUtCBJX4Ab0gfhpXD9cvX6WUHRrnNn/1LRiFLKjWTwoMlAVX2JPf40D
	 3FTs3hEUDOVMhv0f8a4kcyF0VBlBQEAbOdIW2nB5KJIlbfO9ZhSq2vIQAcWMjGIac9TH9
	 4ItnlMCxVdtQBQfjzkGmPP3Odv9yNQf/oRKy4AhVfGGFY9JYCgPMfdSMe+iLgTYPJuufF
	 PSBuony5Ho/sfgUYMW4E6Syl4cremLoOBWMktxuVAK4BocNSNb0ATCzbdvrqnecPwggAf
	 /0cJMd6tgY2rbDDvGS/ztLlKUjcYw+k6Toqnorh2OSerfOl8y3X++fbMVxEVX/OF8rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06EC606A31C;
	Mon, 16 Nov 2026 14:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D06EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMBWfsbYFvtqYGUbAA--.53067S2;
	Mon, 16 Nov 2026 22:44:40 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD3_6PWFvtqkYocAA--.6202S2;
	Mon, 16 Nov 2026 22:44:38 +0800 (CST)
Message-ID: <659e7c81-f0af-4afb-812b-9c55b39777ab@hust.edu.cn>
Date: Mon, 16 Nov 2026 22:44:38 +0800
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
Subject: Re: [PATCH v3 1/2] docs/zh_CN: sync maintainer/configure-git with
 upstream
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
 <20261109-configure-git-v3-1-d7807bb8e8c7@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261109-configure-git-v3-1-d7807bb8e8c7@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMBWfsbYFvtqYGUbAA--.53067S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxGF4UGFyUtF1fGr4rGFy7trb_yoWrAr4UpF
	Zakry2qw4kJFy5Gw4UGay8u3WUAanxGr17Jw1UCw1rJFs7AaySyF17KryrWFZ2gFyxAFW0
	yr13GFyqvws0ka7anT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQKb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	126r1DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnb4S5UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/9/26 5:28 PM, Weijie Yuan wrote:
> The English document updated the signed-tag instructions to describe
> selecting a key with -u <key-id>, configuring a default key, and using
> -s. It also removed the explicit section label and the instructions for
> adding Link trailers automatically with an applypatch-msg hook, because
> Link: trailers should only point to useful additional information.
>
> Also point the pull-request reference to the Chinese translation.
>
> Update the translation through commit 944df7a31452
> ("docs: update the guidance for Link: tags").
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
>   .../zh_CN/maintainer/configure-git.rst             | 48 +++++-----------------
>   1 file changed, 11 insertions(+), 37 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/maintainer/configure-git.rst b/Documentation/translations/zh_CN/maintainer/configure-git.rst
> index a45ea736f73b..693d4e5247a6 100644
> --- a/Documentation/translations/zh_CN/maintainer/configure-git.rst
> +++ b/Documentation/translations/zh_CN/maintainer/configure-git.rst
> @@ -5,58 +5,32 @@
>   :译者:
>   
>    吴想成 Wu XiangCheng <bobwxc@email.cn>
> + 袁维杰 Weijie Yuan <wy@wyuan.org>
>   
> -.. _configuregit_zh:
> +配置 Git
> +========
>   
> -Git配置
> -=======
> +本章介绍维护者级别的 Git 配置。
>   
> -本章讲述了维护者级别的git配置。
> -
> -Documentation/maintainer/pull-requests.rst 中使用的标记分支应使用开发人员的
> -GPG公钥进行签名。可以通过将 ``-u`` 标志传递给 ``git tag`` 来创建签名标记。
> -但是，由于 *通常* 对同一项目使用同一个密钥，因此可以设置::
> +拉取请求中使用的带标签分支（参见 Documentation/translations/zh_CN/maintainer/pull-requests.rst）
> +应使用开发者的 GPG 公钥签名。向 ``git tag`` 传递 ``-u <key-id>`` 可以创建签名标签。
> +不过，由于你对同一项目 *通常* 会使用同一个密钥，因此可以在配置中设置该密钥并
> +使用 ``-s`` 选项。使用以下命令设置默认的 ``key-id``::
>   
>   	git config user.signingkey "keyname"
>   
> -或者手动编辑你的 ``.git/config`` 或 ``~/.gitconfig`` 文件::
> +也可以手动编辑你的 ``.git/config`` 或 ``~/.gitconfig`` 文件::
>   
>   	[user]
>   		name = Jane Developer
>   		email = jd@domain.org
>   		signingkey = jd@domain.org
>   
> -你可能需要告诉 ``git`` 去使用 ``gpg2``::
> +你可能需要让 ``git`` 使用 ``gpg2``::
>   
>   	[gpg]
>   		program = /path/to/gpg2
>   
> -你可能也需要告诉 ``gpg`` 去使用哪个 ``tty`` （添加到你的shell rc文件中）::
> +你可能还需要告诉 ``gpg`` 使用哪个 ``tty`` （将其添加到 shell 的 rc 文件中）::
>   
>   	export GPG_TTY=$(tty)
> -
> -
> -创建链接到lore.kernel.org的提交
> --------------------------------
> -
> -http://lore.kernel.org 网站是所有涉及或影响内核开发的邮件列表的总存档。在这里
> -存储补丁存档是推荐的做法，当维护人员将补丁应用到子系统树时，最好提供一个指向
> -lore存档链接的标签，以便浏览提交历史的人可以找到某个更改背后的相关讨论和基本
> -原理。链接标签如下所示：
> -
> -	Link: https://lore.kernel.org/r/<message-id>
> -
> -通过在git中添加以下钩子，可以将此配置为在发布 ``git am`` 时自动执行：
> -
> -.. code-block:: none
> -
> -	$ git config am.messageid true
> -	$ cat >.git/hooks/applypatch-msg <<'EOF'
> -	#!/bin/sh
> -	. git-sh-setup
> -	perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://lore.kernel.org/r/$1|g;' "$1"
> -	test -x "$GIT_DIR/hooks/commit-msg" &&
> -		exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
> -	:
> -	EOF
> -	$ chmod a+x .git/hooks/applypatch-msg
>

