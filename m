Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194683;
	b=oHkTbT5dtzLr4yX7UvwEpmFD6n5BB4os8MeCV7GkE+8u+HWis03f/zd0bbs3eR66AN5c
	 7TPqHHmxcoT4Z/pGqjchKrVnbeucFWnN1dt8Pz+TgTto41QrzRxep4zRWMsZINEX4VpWv
	 P3bwgmM96PHY1ReFffgQmsdnqBcqs7s/LWNmxnXGE7VkglXYQtfKmu5mapPBzYUqzbNX4
	 lnpVJLE+/Osc5HYLs8xtUP+JU/8mOGB5hbNXAk7GYlXKaQXiyd+sQ9h60p4R2FLb2br8Y
	 PBsCpd8ETKFGYXBiah8mDhIglWUZERTVrqwJUHPLfsP0gomHYKpCEOHEUi0sPjkv9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194683;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lEb/UkQHtVIhpbCwO7ym4SFqqLAa1fydRkJpxU0wHAQ=;
	b=AqbVaejYe7QCTpnHSam+Hp/KQV46NIIkKoysrZKY5t4IVbElXInXv0w3Qph0o5mjEi8i
	 Lne2wS8TzqKcdqnwnQBUGUxLLtZZHxCV3xXHEx1fRr0hYlDFF+7C06vJcCbyB5Iecby27
	 QJdh8QCNkPyYKyUy1htGixjvuY0tz6Vn+ws4HVgYlCd7sMecMOXciK817IjCtGj9B+Afw
	 HNcU5v58HAZIejtfWk8qbgmDXfPzBJvQahdxT8QMcY9hKqL/FtQ9AKXhV3ucC1SoSMISm
	 9s6RLMqh3y5iMeguH+3o34/L/ocJmGEjAcPIehDV38xApKK89UZepCW14MDnICcEsxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=O7ebv9CC;
	arc=none smtp.remote-ip=91.218.175.228
Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416FB606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 416FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=O7ebv9CC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pdVF8YsZ0DoIQCsZWBqcJ9M8G3cpwrzv7QBYlr5nnXo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794194680; v=1; x=1794799480;
 b=O7ebv9CClWLlq6S81kTd0RPASBPoqJa2F3vT7+CDvvOCrMisbKeuRKA5oyuQvf9J9KLmSrG3
 DjRht585UDJ9f6mM27NUPa+6JKoBK9iMgxcJcZr4wZX268IodocWI7V18eE0wXStGzMbXE+QfLK
 Nd21/oc43N0Q4uB77SqUix8XP+01hlCV9/ITiQmzJ5H0CuJqBDbYMguDiVM+wboNgyRpllJRlcW
 4sKXHydY1liEGStqr3Al3WneoGktctKsar1Nad046qWFHCqwPqitwKiGis+OL50qtXR+iHZ3O5s
 jxTOcVJiBhOqfaQkffLDcy/w7jDSi6JprdLZTYQ/oImQw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0ca65705dc8ed683;
	Mon, 09 Nov 2026 03:24:40 +0000
X-Mizu-Trace-ID: 0ca65705dc8ed683
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 11:24:32 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] docs/zh_CN: link AI guide to translated documents
Message-ID: <avE88OZ8FRuNe-Ts@wyuan.org>
References: <cover.1794153793.git.dzm91@hust.edu.cn>
 <1dc2be038d0b172e731105619e3704c9c19b7b58.1794153793.git.dzm91@hust.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dc2be038d0b172e731105619e3704c9c19b7b58.1794153793.git.dzm91@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> Point coding-assistants.rst to the Chinese translations of
> generated-content.rst and threat-model.rst.

LGTM.

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.

> ---
>  .../translations/zh_CN/process/coding-assistants.rst      | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/coding-assistants.rst b/Documentation/translations/zh_CN/process/coding-assistants.rst
> index 2a432d1dc401..eef475b49d52 100644
> --- a/Documentation/translations/zh_CN/process/coding-assistants.rst
> +++ b/Documentation/translations/zh_CN/process/coding-assistants.rst
> @@ -18,7 +18,7 @@ AI 编程助手
>  
>  有关 AI 编程助手生成内容的准则，参见：
>  
> -* Documentation/process/generated-content.rst
> +* Documentation/translations/zh_CN/process/generated-content.rst
>  
>  许可和法律要求
>  ==============
> @@ -66,9 +66,9 @@ AI 代理 **不得** 添加 Signed-off-by 标签。只有人类才能依法作
>  8. 说明哪些工作未能完成。如果修复无法构建或测试，或者无法编写复现程序，
>     应明确说明：维护者目前在分析未经验证的报告和未经测试的修复上浪费了
>     太多时间。
> -9. 阅读 Documentation/process/threat-model.rst，判断缺陷属于漏洞
> -   还是普通缺陷，并将结论交由报告者复核（助手绝不能自行发送任何
> -   内容）。普通缺陷按以下文档所述方式投稿：
> +9. 阅读 Documentation/translations/zh_CN/process/threat-model.rst，
> +   判断缺陷属于漏洞还是普通缺陷，并将结论交由报告者复核（助手绝不能

                      Nitpick & non-blocking: AI 助手 or AI Agent?

> +   自行发送任何内容）。普通缺陷按以下文档所述方式投稿：
>     Documentation/translations/zh_CN/process/submitting-patches.rst；
>     漏洞按以下文档所述方式报告：
>     Documentation/translations/zh_CN/process/security-bugs.rst。
