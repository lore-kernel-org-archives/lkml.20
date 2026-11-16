Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=132.226.202.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838867;
	b=plf3Regx9PHRgljdHnfECLBmtG88SWfZ8sb1yrJmFck7KUjEqnV7vsT0YHWoQLCHRPcU
	 H1hrifMx5ShPrZlyDFdshUnoZdA2kzyDOrrGK+g7Zbwx/rSbdZpPwCJD9ne9Ydmrl/YTQ
	 6JoT8IX6agkKZnMEeetS+96b4a0Y4nxbtxY5UirPTZ4ETIJcDNcEBgHfD/LJZuFCWZk2K
	 zjpi9yeL0ShIWe7dZZifUaZsCg/PnUbwh9z+4a1kwR/Uxg396D8OTCxfZH1eld5z3pMRJ
	 xrf8OjLAP+gILlOTwGxGK0QXat9CFdWabX7aFhSlHJ43v8Gzv2+qO8AKSdaw2C66hag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838867;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=GYpH1G88JW6hAEjtppof/45/sQE0ELjjABmyEB4PR5Y=;
	b=zuBy4bTa7LCX8I9YXluGfJJHFdn1iGaxnGPlU/FcmyC3gJbvsYb7wykh7eYykegXPcS3
	 4MKGWjgJWmUsDIwIkVrnDp060+JH2wvXVtgrQLzrmHoiiL0wKOJ62cmr7QmXdhvfx5kJc
	 cc69Ret3qOxsylrSdv5PDbI4Bi8AM1XOS0gg/P88vWLqlsiGJVDxleyI0XTkvHrYzXO3t
	 qrteKNsxsaMgwoCxnwUeW8GU0NuawjmV9jTKSLq3d9sjMCpUT7D9clL7t+kkrAKuISMBR
	 QcWcqJsmXtngJzSLfMuY/csE2565KRCkbDKaAtyvmKYgfqZaa5FcdGNrDfmsnb9n9fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=132.226.202.154
Received: from fraori-sdnproxy-3.icoremail.net (fraori-sdnproxy-3.icoremail.net [132.226.202.154])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B376606A31C;
	Mon, 16 Nov 2026 14:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B376606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with UTF8SMTP id IQEQrMAmT8dFEftq8FsbAA--.61783S2;
	Mon, 16 Nov 2026 22:20:53 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wD3RKA+EftqE3kcAA--.30707S2;
	Mon, 16 Nov 2026 22:20:48 +0800 (CST)
Message-ID: <476202a2-26a7-4b6b-a7d5-ba8e586371bb@hust.edu.cn>
Date: Mon, 16 Nov 2026 22:20:46 +0800
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
Subject: Re: [PATCH v3 0/2] docs/zh_CN: update maintainer/configure-git.rst
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:IQEQrMAmT8dFEftq8FsbAA--.61783S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxAryUAF18Gr4Dtw17AF43KFg_yoWrArW3pF
	4fKF12k3Z5JF1akan7Gr48uF45Xw1fGFW5JwnrKwn5Ar1qvrWFqry2yrZa9FWUZrZ5ZF4Y
	qw45Ka4v9ayvyFDanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQGb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
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
	MIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jhCztUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/9/26 5:28 PM, Weijie Yuan wrote:
> Update the translation of two files:
>
> 1) maintainer/configure-git.rst
> 2) maintainer/pull-requests.rst
>
> I only update the first one in v1. However, I find a reference of
> pull-requests.rst in configure-git.rst is in English, while we've had a
> Chinese one. So, update both this time.
>
> Note that there're warm tips from checkpatch,
>
> checkpatch.pl: :6: WARNING: 'Link:' should be followed by a public http(s) link
> checkpatch.pl: Documentation/translations/zh_CN/maintainer/pull-requests.rst:118: WARNING: Do not use whitespace before Signed-off-by:
>
> .. which are caused by a 'Link:' in the commit message and a sample Sob
> trailer.
>
> ---
> Changes in v3:
> - Put "update to commit section" at the end of commit message in both.
> - Rebase to d48723711bae (Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux, 2026-11-06)
>    Alex's docs-next HEAD now.
> - Link to v2: https://patch.msgid.link/20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org
>
> Changes in v2:
> - Remove the SPDX identifier, see details and reasons in the thread of v1.
> - Add a new translation.
> - Link to v1: https://patch.msgid.link/20260823-configure-git-v1-1-3c65eefcc585@wyuan.org
>
> To: Alex Shi <alexs@kernel.org>
> To: Yanteng Si <si.yanteng@linux.dev>
> To: Dongliang Mu <dzm91@hust.edu.cn>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> To: Randy Dunlap <rdunlap@infradead.org>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Weijie Yuan (2):
>        docs/zh_CN: sync maintainer/configure-git with upstream
>        docs/zh_CN: improve maintainer/pull-requests translation
>
>   .../zh_CN/maintainer/configure-git.rst             |  48 ++------
>   .../zh_CN/maintainer/pull-requests.rst             | 127 +++++++++++----------
>   2 files changed, 77 insertions(+), 98 deletions(-)
>
> Range-diff versus v2:

You need to tell your agent to forget about the range-diff.

Dongliang Mu

>
> 1:  d292fa654b82 ! 1:  a791cc884749 docs/zh_CN: sync maintainer/configure-git with upstream
>      @@ Commit message
>           adding Link trailers automatically with an applypatch-msg hook, because
>           Link: trailers should only point to useful additional information.
>       
>      +    Also point the pull-request reference to the Chinese translation.
>      +
>           Update the translation through commit 944df7a31452
>           ("docs: update the guidance for Link: tags").
>       
>      -    Also point the pull-request reference to the Chinese translation.
>      -
>           Signed-off-by: Weijie Yuan <wy@wyuan.org>
>       
>        ## Documentation/translations/zh_CN/maintainer/configure-git.rst ##
> 2:  9ed78fb91f42 ! 2:  2bec387ee1e3 docs/zh_CN: improve maintainer/pull-requests translation
>      @@ Commit message
>           After the last update to the Chinese translation, the English document
>           removed the explicit section label, replaced the configure-git
>           cross-reference with a direct path, and changed "tree for forever" to
>      -    "tree forever".
>      +    "tree forever". Remove the abandoned Chinese section label and point the
>      +    configure-git reference to the Chinese translation. Some of the existing
>      +    wording did not read very smoothly, so polish a few expressions and also
>      +    correct some Git terminology.
>       
>           Update the translation through commit 3a1b9c4d8edb
>           ("docs: Remove redundant word "for"").
>       
>      -    Remove the abandoned Chinese section label and point the configure-git
>      -    reference to the Chinese translation.
>      -
>      -    Some of the existing wording did not read very smoothly, so polish a few
>      -    expressions. And also correct some Git terminology.
>      -
>           Signed-off-by: Weijie Yuan <wy@wyuan.org>
>      -    ---
>      -    I did make quite a few changes to make the reading more fluent. However,
>      -    to some extent, this might also be unnecessary. If you think there are
>      -    too many, I will remove the less essential ones. Thanks.
>       
>        ## Documentation/translations/zh_CN/maintainer/pull-requests.rst ##
>       @@
>
> ---
> base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
> change-id: 20260823-configure-git-686aea09bf5b

