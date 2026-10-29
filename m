Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.101.248.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274664;
	b=SPlLxZM8DH52KjmLYcyK/Z78t65VpcAqPWCnwt6s9p9iO+Jhp8CxsYGWUAgGaIH+W0UQ
	 1FlApwdEUluzVFUrRFUgwWr/Iq91zJkvEBYOBSgilAvO5K8iKr1MH1sPLMSCAVPMFhSro
	 deC+2Qe01gD9Tz5VSD/CLhFMe3KcI1eOvfz30SNmaahPeLlxlVcvEVY6FOtYvf8HaiTAJ
	 EwR6tTivjMnj35sYeQkQJ/1aal4mX1Ehq9TesJQTXx4KTCaehnHUl9GsVCCKHsDEgpILv
	 gVJtWznKr/VwqP4BEB6+SVLzW2iHh9xU7nhrxw0IiPBeXBssPQzJhiYD5MAK8J7B6eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274664;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=6XG/pzNbNAXAbtmesT7YUOxuY9CUklqVFjZE+bYi/+8=;
	b=ViHDnu+v34ZwyFZwpgOjJXLrCyHZBrvhC9pMTgLYpAYWCWO0fxAZRq6xn0lZNDAaTDo5
	 7t85G72i/WbxW6qqbp5Wy4c/fngz+5D+hK963+4hpnwVg0BnjAT7rlyJ7xQIiKfHQqHiu
	 ZwfU8nHifW4CMviXxRB3hEd/KJjYGdLMF1eqjDKr0gbhMRIqWDdm32hJSGBEle8ropHN0
	 ih6X3MsXr9Z7f9ADvrZ1xBwUU4uOTQnu1Ued53/LbT0GZV/FZCNQg1SieWkwZf6JPgHL3
	 QffAvEbSnHf9h/JkC7xRJ7HE/Uf+aEolLoeiPXvnzrigDvr2+e5Cy7CboyXQfJ3jinA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=46.101.248.176
Received: from zg8tndyumtaxlji0oc4xnzya.icoremail.net (zg8tndyumtaxlji0oc4xnzya.icoremail.net [46.101.248.176])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B54606A31A;
	Thu, 29 Oct 2026 11:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B54606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with UTF8SMTP id IQEQrMDW_XYcM+NqQzFkAA--.63937S2;
	Thu, 29 Oct 2026 19:50:52 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wC3sN8TM+NqPDYEAA--.8561S2;
	Thu, 29 Oct 2026 19:50:46 +0800 (CST)
Message-ID: <d32825a1-8da4-41f3-964b-8854618890d5@hust.edu.cn>
Date: Thu, 29 Oct 2026 19:50:43 +0800
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
Subject: Re: [PATCH] docs/zh_TW: remove top-level labels from process/
To: Weijie Yuan <kernel@wyuan.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f851e36f0ca9db7a0f71200964fe97a2efa85c13.1793265072.git.wy@wyuan.org>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <f851e36f0ca9db7a0f71200964fe97a2efa85c13.1793265072.git.wy@wyuan.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IQEQrMDW_XYcM+NqQzFkAA--.63937S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoW3ZFyDGFWrWFy7Kr4fJFy3XFb_yoW8AFy7uo
	Wakw45Cr97Cr1DX3W5Cw48Cr15Gr13CFs7Ar42kw1Du3s2g3WrCa4Ivw1Yvw4S9r45Gas3
	J34xXw4rWrZ5Ca47n29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOd7k0a2IF6w4kM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCY02
	Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUv6pPUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 10/29/26 5:26 PM, Weijie Yuan wrote:
> I happened to notice that there was actually an embarrassing label on
> this page [*] that had been rendered in HTML.
>
>   * https://docs.kernel.org/translations/zh_TW/process/kernel-enforcement-statement.html
>
> Therefore let me drop these labels in process dir but leave the cleanup
> job later.
>
> --- >8 ---
> From: Weijie Yuan <wy@wyuan.org>
>
> We can link to these documents by path, so the top-level labels
> do not buy us anything.
>
> Drop these redundant labels from the Traditional Chinese process
> documents.

Hi Weijie,

Removing these labels breaks existing zh_TW cross-references. The patch 
deletes 25 labels, but 17 of them are still targets of 25 :ref: uses.

Dongliang Mu

>
> Signed-off-by: Weijie Yuan <wy@wyuan.org>
> ---
>
>   * Tested with '(make cleandocs && make htmldocs) 2>&1 | grep -F -e zh_CN -e zh_TW'
>     seems work fine. But please leave an eye on this if available.
>
>   * Based on these series on top of Alex's docs-next branch..
>     - [v2 0/7] docs/zh_TW: remove duplicated maintainer contact information
>     - [0/4] docs/zh_TW: relocate translations to follow the English layout
>     - [1/1] docs/zh_TW: remove the unreachable plain-text translations
>     - [0/3] docs/zh_TW: mark translations that are not kept in sync
>
>     which are currently queued here for 7.5:
>     https://github.com/kernel-zh/linux-zh_TW.git docs-next
>
>   Documentation/translations/zh_TW/process/1.Intro.rst            | 2 --
>   Documentation/translations/zh_TW/process/2.Process.rst          | 2 --
>   Documentation/translations/zh_TW/process/3.Early-stage.rst      | 2 --
>   Documentation/translations/zh_TW/process/4.Coding.rst           | 2 --
>   Documentation/translations/zh_TW/process/5.Posting.rst          | 2 --
>   Documentation/translations/zh_TW/process/6.Followthrough.rst    | 2 --
>   Documentation/translations/zh_TW/process/7.AdvancedTopics.rst   | 2 --
>   Documentation/translations/zh_TW/process/8.Conclusion.rst       | 2 --
>   .../zh_TW/process/code-of-conduct-interpretation.rst            | 2 --
>   Documentation/translations/zh_TW/process/code-of-conduct.rst    | 2 --
>   Documentation/translations/zh_TW/process/coding-style.rst       | 2 --
>   .../translations/zh_TW/process/development-process.rst          | 2 --
>   Documentation/translations/zh_TW/process/email-clients.rst      | 2 --
>   Documentation/translations/zh_TW/process/howto.rst              | 2 --
>   Documentation/translations/zh_TW/process/index.rst              | 2 --
>   .../translations/zh_TW/process/kernel-driver-statement.rst      | 2 --
>   .../translations/zh_TW/process/kernel-enforcement-statement.rst | 2 --
>   Documentation/translations/zh_TW/process/license-rules.rst      | 2 --
>   Documentation/translations/zh_TW/process/management-style.rst   | 2 --
>   .../translations/zh_TW/process/programming-language.rst         | 2 --
>   .../translations/zh_TW/process/stable-api-nonsense.rst          | 2 --
>   .../translations/zh_TW/process/stable-kernel-rules.rst          | 2 --
>   Documentation/translations/zh_TW/process/submit-checklist.rst   | 2 --
>   Documentation/translations/zh_TW/process/submitting-patches.rst | 2 --
>   .../translations/zh_TW/process/volatile-considered-harmful.rst  | 2 --
>   25 files changed, 50 deletions(-)
>
> diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
> index 65c5ae095504..0c1c6709b1cb 100644
> --- a/Documentation/translations/zh_TW/process/1.Intro.rst
> +++ b/Documentation/translations/zh_TW/process/1.Intro.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/1.Intro.rst <development_process_intro>`
>   
> -.. _tw_development_process_intro:
> -
>   引言
>   ====
>   
> diff --git a/Documentation/translations/zh_TW/process/2.Process.rst b/Documentation/translations/zh_TW/process/2.Process.rst
> index cf9bd1b1444a..85e1444b3be6 100644
> --- a/Documentation/translations/zh_TW/process/2.Process.rst
> +++ b/Documentation/translations/zh_TW/process/2.Process.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/2.Process.rst <development_process>`
>   
> -.. _tw_development_process:
> -
>   開發流程如何進行
>   ================
>   
> diff --git a/Documentation/translations/zh_TW/process/3.Early-stage.rst b/Documentation/translations/zh_TW/process/3.Early-stage.rst
> index 7d7ecf9658e5..be3dadcf1663 100644
> --- a/Documentation/translations/zh_TW/process/3.Early-stage.rst
> +++ b/Documentation/translations/zh_TW/process/3.Early-stage.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/3.Early-stage.rst <development_early_stage>`
>   
> -.. _tw_development_early_stage:
> -
>   早期規劃
>   ========
>   
> diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
> index 423d51f4b3de..982735fd6134 100644
> --- a/Documentation/translations/zh_TW/process/4.Coding.rst
> +++ b/Documentation/translations/zh_TW/process/4.Coding.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/4.Coding.rst <development_coding>`
>   
> -.. _tw_development_coding:
> -
>   使代碼正確
>   ======================
>   
> diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
> index d54b16364474..ba3b8a79f21a 100644
> --- a/Documentation/translations/zh_TW/process/5.Posting.rst
> +++ b/Documentation/translations/zh_TW/process/5.Posting.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/5.Posting.rst <development_posting>`
>   
> -.. _tw_development_posting:
> -
>   發布補丁
>   ========
>   
> diff --git a/Documentation/translations/zh_TW/process/6.Followthrough.rst b/Documentation/translations/zh_TW/process/6.Followthrough.rst
> index 76082a15677f..e9a70eec850c 100644
> --- a/Documentation/translations/zh_TW/process/6.Followthrough.rst
> +++ b/Documentation/translations/zh_TW/process/6.Followthrough.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/6.Followthrough.rst <development_followthrough>`
>   
> -.. _tw_development_followthrough:
> -
>   跟進
>   ====
>   
> diff --git a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
> index 392c00213078..fb2e3764802f 100644
> --- a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
> +++ b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/7.AdvancedTopics.rst <development_advancedtopics>`
>   
> -.. _tw_development_advancedtopics:
> -
>   進階主題
>   ========
>   
> diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
> index 2436263c6506..82e89d992964 100644
> --- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
> +++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/8.Conclusion.rst <development_conclusion>`
>   
> -.. _tw_development_conclusion:
> -
>   更多資訊
>   ========
>   
> diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
> index 4fc568409198..fbb9fb719b19 100644
> --- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
> +++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
>   
> -.. _tw_code_of_conduct_interpretation:
> -
>   Linux核心貢獻者契約行為準則解釋
>   ===============================
>   
> diff --git a/Documentation/translations/zh_TW/process/code-of-conduct.rst b/Documentation/translations/zh_TW/process/code-of-conduct.rst
> index 0266cd74a0b1..4db8ddc71474 100644
> --- a/Documentation/translations/zh_TW/process/code-of-conduct.rst
> +++ b/Documentation/translations/zh_TW/process/code-of-conduct.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/code-of-conduct.rst <code_of_conduct>`
>   
> -.. _tw_code_of_conduct:
> -
>   貢獻者契約行爲準則
>   ++++++++++++++++++
>   
> diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
> index 5778b707503f..166b952cb54e 100644
> --- a/Documentation/translations/zh_TW/process/coding-style.rst
> +++ b/Documentation/translations/zh_TW/process/coding-style.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/process/coding-style.rst
>   
> -.. _tw_codingstyle:
> -
>   Linux 核心程式碼風格
>   ====================
>   
> diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
> index 1d22aa0d3711..e3e69882d8f6 100644
> --- a/Documentation/translations/zh_TW/process/development-process.rst
> +++ b/Documentation/translations/zh_TW/process/development-process.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
>   
> -.. _tw_development_process_main:
> -
>   內核開發過程指南
>   ================
>   
> diff --git a/Documentation/translations/zh_TW/process/email-clients.rst b/Documentation/translations/zh_TW/process/email-clients.rst
> index 272e3073521d..7a5cf79fe4f9 100644
> --- a/Documentation/translations/zh_TW/process/email-clients.rst
> +++ b/Documentation/translations/zh_TW/process/email-clients.rst
> @@ -2,8 +2,6 @@
>   
>   .. include:: ../disclaimer-zh_TW.rst
>   
> -.. _tw_email_clients:
> -
>   :Original: Documentation/process/email-clients.rst
>   
>   Linux郵件客戶端設定資訊
> diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
> index 1ffc076ce26c..46c7a63398f7 100644
> --- a/Documentation/translations/zh_TW/process/howto.rst
> +++ b/Documentation/translations/zh_TW/process/howto.rst
> @@ -1,7 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. _tw_process_howto:
> -
>   .. include:: ../disclaimer-zh_TW.rst
>   
>   :Original: :ref:`Documentation/process/howto.rst <process_howto>`
> diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
> index bd638264bbe4..b27af36ce3bb 100644
> --- a/Documentation/translations/zh_TW/process/index.rst
> +++ b/Documentation/translations/zh_TW/process/index.rst
> @@ -9,8 +9,6 @@
>   
>   :Original: :ref:`Documentation/process/index.rst <process_index>`
>   
> -.. _tw_process_index:
> -
>   ========================
>   與Linux核心社群一起工作
>   ========================
> diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
> index 34bcb6f164cb..e6ff67f75650 100644
> --- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
> +++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
> @@ -1,7 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. _tw_process_statement_driver:
> -
>   .. include:: ../disclaimer-zh_TW.rst
>   
>   :Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
> diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> index d54d20529294..45bb50fd1e6a 100644
> --- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> +++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
> @@ -1,7 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -﻿.. _tw_process_statement_kernel:
> -
>   .. include:: ../disclaimer-zh_TW.rst
>   
>   :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
> diff --git a/Documentation/translations/zh_TW/process/license-rules.rst b/Documentation/translations/zh_TW/process/license-rules.rst
> index 0a4558b7fc76..8f9b57e223a7 100644
> --- a/Documentation/translations/zh_TW/process/license-rules.rst
> +++ b/Documentation/translations/zh_TW/process/license-rules.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
>   
> -.. _tw_kernel_licensing:
> -
>   Linux核心許可規則
>   =================
>   
> diff --git a/Documentation/translations/zh_TW/process/management-style.rst b/Documentation/translations/zh_TW/process/management-style.rst
> index 2cef0ef25ede..9908724e37a2 100644
> --- a/Documentation/translations/zh_TW/process/management-style.rst
> +++ b/Documentation/translations/zh_TW/process/management-style.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/management-style.rst <managementstyle>`
>   
> -.. _tw_managementstyle:
> -
>   Linux內核管理風格
>   =================
>   
> diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
> index 9aac89e2c23b..04ad22a25a4e 100644
> --- a/Documentation/translations/zh_TW/process/programming-language.rst
> +++ b/Documentation/translations/zh_TW/process/programming-language.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
>   
> -.. _tw_programming_language:
> -
>   程式語言
>   ========
>   
> diff --git a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
> index 94748429c182..2e82df8544ef 100644
> --- a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
> +++ b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
> @@ -1,7 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. _tw_stable_api_nonsense:
> -
>   .. include:: ../disclaimer-zh_TW.rst
>   
>   :Original: :ref:`Documentation/process/stable-api-nonsense.rst
> diff --git a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
> index d182d625728d..bd0a1599dbff 100644
> --- a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
> +++ b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
> @@ -1,7 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. _tw_stable_kernel_rules:
> -
>   .. include:: ../disclaimer-zh_TW.rst
>   
>   :Original: :ref:`Documentation/process/stable-kernel-rules.rst <stable_kernel_rules>`
> diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
> index 452fecc7c425..f5b2cb56eec4 100644
> --- a/Documentation/translations/zh_TW/process/submit-checklist.rst
> +++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
> @@ -4,8 +4,6 @@
>   
>   :Original: Documentation/process/submit-checklist.rst
>   
> -.. _tw_submitchecklist:
> -
>   Linux內核補丁提交檢查單
>   ~~~~~~~~~~~~~~~~~~~~~~~
>   
> diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
> index 514903daae25..967e558350c0 100644
> --- a/Documentation/translations/zh_TW/process/submitting-patches.rst
> +++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
> @@ -2,8 +2,6 @@
>   
>   .. include:: ../disclaimer-zh_TW.rst
>   
> -.. _tw_submittingpatches:
> -
>   :Original: Documentation/process/submitting-patches.rst
>   
>   提交補丁：如何讓你的改動進入核心
> diff --git a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
> index edfc83f32672..a2384b60b874 100644
> --- a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
> +++ b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
> @@ -1,7 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   
> -.. _tw_volatile_considered_harmful:
> -
>   .. include:: ../disclaimer-zh_TW.rst
>   
>   :Original: :ref:`Documentation/process/volatile-considered-harmful.rst

