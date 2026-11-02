Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585963;
	b=tmktwQRxRpCqjC6L8AUIcbRpQNKBYyGsb+RECOMYWQH30RCGuK/LIjpSpJyceBDrXpNg
	 Y6oRbLm71gmmAuQmsTVYQJPaLNZCLkJrGs9cAQFxgr3N6Cyyj37ESFLOtwf7N0C8HQVLY
	 jS044h53JsCe+cGJFqwFof+iuYGPev9sCfoFFGhSCYqBFLkQYCpM0zSu+q/EhiX2AXNLR
	 dDQmEeATYOVNvi5oAFPyEVBpRXEpsxs0HiDT3D/iTB0Z/6x+4uAfeuLC1f01Hxo3u6PqP
	 asJMiR9cToH3JFF3UR1IwHm0V95gC7XfSPntTlQMJ90VFQbZdm17YoEABS7IGjvT7JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SmVzEHru6v2JByNONOTsp9MZa0alWvR2mXh4ZEgbOvY=;
	b=Xje+MZurU3y6Aawpxk3otM+LGW6KDlBL5CiKSpCRekBafTkHWK3K6I6sOzKn5JUyGsdD
	 Mq1bZnPixnyn6HX1IU4PHF/+VpXEhCK3jr3ythNwK1ymIOgeVbCAahdG8WTJWA/Ttacgq
	 Sdx2h3ERfMUmA5AB2uXe9MQ8JjvMW3XCq1tUSZN+BuAIrGsx2eXhxdqeBIttGy+SpOvwb
	 JqHDPmtZaXmOl2CWO55uIoH9ore7ZZNEKNT0vFjtsmoD+odfiYZ0cXHJN9SpO9+pCt6IY
	 sVk8E4dFWmK0Hxpo9MvsNABStFbqh/I9/KBgziWiq+t9EyzqwoG6RzmH6xq5OitKnIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii1xC1qh;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2CD606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F2CD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ii1xC1qh
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so4286378c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793585961; x=1794190761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmVzEHru6v2JByNONOTsp9MZa0alWvR2mXh4ZEgbOvY=;
        b=ii1xC1qh2uYRw7S7vh/tWBPqNSvqolIUSNkRvYjgNuavSFhud3Yl4KG2CH1il5slRb
         1LeHzzjvrO7Rmdul1FMtQaalG6scjIHIcOYUrNlZFQUiK+l8uTYRlSIHwS87d6ilciOl
         0vIJgZfn0+seJYEckVzOKvrtaMCbaU5QrrzpRTL1S8UEVwNAjlkPmQVwC9wZMH97ptsr
         rruKOB311JXv+RVO5NsCcE1jK39NCqhExibVsxnVbEm7ycmWWQTZyFZJH84rT3Qwvcm4
         Nug0i5JeMJX35detfvSZkEktPFTgT9T3rqm+bFRS+eP+eJMjQYpDjXhsfRKaG5srfyjd
         urvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793585961; x=1794190761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmVzEHru6v2JByNONOTsp9MZa0alWvR2mXh4ZEgbOvY=;
        b=yibuZMKHmk4i1wP883EpyLIokcIfFeuYsPZJeXNItrEcOt27VMHatPEG277ZwYsX4g
         3lpr3Lws9q1wO7TCwhQFI+ASU0AvgpIcUXMUHGk4BBwhMj4FaDAI3Fgiqqow4+M9wiSb
         CvMUcHFEgCpdZOIEPncu5Fy6Zr6m8K12ZeC5gAHowyVxc2PDpv866nxaOXSrwstXIhBt
         R5qME+r/5+0zyFc2rZvdS+5ZhQgxGktyGxeIeSIsIJczGHbbU6sJWrXTXNV3zkaDbV1l
         ZiO1/Jzhs70QRIw3Vhi44oAMd/cIgjIXnwSMLIM9P/btnc9OgB9J9NFWe+TIDyzy4FwB
         FgBQ==
X-Forwarded-Encrypted: i=1; AKwUvByo4zpLVO3uaOIPX3FcA48Jj9JFdQaKFZDeN8yYQC9dYU1h7doXx3xf/C9FoGXrrdzDgDlWzKM9G6Grmv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFGmnRkm3RPuyywMplOFgGNGN8WQcukLwhwCXwzaXLHdtSWZGj
	4zBI/zRhZSjrHD8k8faLPb4IyO9YVNSdqeiWIGKqpR6juZZdOrb+IwFh
X-Gm-Gg: AYBFou0SbEix8ST4/pkr8W8ZGk6RsfhxTnUWN1D8YY3BMGrl6sTyHVOoXR3cD0NrNsC
	Mg385p93ofvKaS5eb8aQFY7dt9T3r7vGDH7NIr31v917BpGnJEzkjxghOx51vy/41e2SXwdavtk
	p5rnLI0On8cU5X5X+0dQroNF3+bXgCvXTa5d4spHWFTlfAsac9NVAiBgjpKLAOiIUICw3Ap2MvF
	2ueVIYdw1Ykm9PD+dVYlK8/kxhmQds9DfShRo4h9VUgiNFpJG/Uzs4fjFKmc92CGINfn4nF5m4L
	Tld72o4sic3l7Fof6nm8q47Mu24VWszLKBpqFXP+Xl4kfxNgLEGlRsTWneebDyxGrY5YtXPw6Sg
	aeaiWEIlutBfjjX6c0gCVQoTITtff/HXAJf3ffMjeQ/4s9qpIgVfEYIpdsD2hXTxokcobah0Yx0
	9v5An/EX3ON+IMykyvpBxMZb5dNLa53jOfVqpAv6pcb8MUtiMwZDTlahYczh130B4Xd80rRcQ9d
	MQqvHjAjq6ragfVRRjK+n84qXnIqDMWtdZ3EL/OJTSPdc63XF4At1KCQrKEQLVvjUefxkShLkw1
	LyBxbQ5IcNth17uPgwMGhOv+iJ/6+mzm3ZqlzwOWGuvu+A==
X-Received: by 2002:a05:701b:4188:10b0:166:b307:5855 with SMTP id a92af1059eb24-1ac4f91fceemr13994638c88.0.1793585960835;
        Sun, 01 Nov 2026 18:19:20 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm28955788c88.2.2026.11.01.18.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:19:20 -0800 (PST)
Message-ID: <11431f90-9b67-4324-990c-2f1cfe6d7819@gmail.com>
Date: Sun, 1 Nov 2026 18:19:19 -0800
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
Subject: Re: [PATCH v2 0/2] docs: add a guide for translators
To: Daniel Pereira <danielmaraboo@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261015125644.12908-1-danielmaraboo@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261015125644.12908-1-danielmaraboo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/26 05:56, Daniel Pereira wrote:

> The documentation has seven translations, but the English documentation
> has no guide on how to contribute to them; the only one that exists,
> Documentation/translations/zh_CN/how-to.rst, is in Chinese and covers
> zh_CN only. As a result, the same problems keep coming up in the review
> of translation patches: labels copied from the original that collide
> with the English ones, partial builds that hide those collisions,
> documents left out of any toctree, missing commit descriptions and
> missing recipients.
>
> Patch 1 adds Documentation/doc-guide/translations.rst, a guide that
> covers the whole workflow of a translation, from choosing what to
> translate to sending the patch and keeping the translation up to date.
>
> Patch 2 translates the guide into Brazilian Portuguese. Since it is
> based on the original added by patch 1, whose commit hash is only known
> once the series is applied, it does not carry the "Update the
> translation through commit" line that the guide suggests.
>
> Both patches were checked with a full "make htmldocs" build, with no new
> warnings, and with scripts/checkpatch.pl --strict.
>
> Changes in v2:
> - Drop the references to the Assisted-by tag, which was removed from
>    coding-assistants.rst and submitting-patches.rst by commit 1e035297ffda
>    ("docs: remove Assisted-by references"). The guide now only says that
>    Signed-off-by can only be added by the human who certifies the
>    contribution (Weijie Yuan).
> - Use a plain path in the ":Original:" example, which is what most
>    translations do and which the documentation build already turns into
>    a link, and drop the ":Translator:" line from it (Weijie Yuan).
> - Rebase on current docs-next.
> - Cc the translation maintainers, so that every team can comment.
>
> v1: https://lore.kernel.org/linux-doc/20261013003702.5824-1-danielmaraboo@gmail.com/
>
> Daniel Pereira (2):
>    docs: doc-guide: add a guide for translators
>    docs: pt_BR: translate doc-guide/translations.rst
>
>   Documentation/doc-guide/index.rst             |   1 +
>   Documentation/doc-guide/translations.rst      | 694 +++++++++++++++++
>   Documentation/translations/index.rst          |   3 +
>   .../translations/pt_BR/doc-guide/index.rst    |  19 +
>   .../pt_BR/doc-guide/translations.rst          | 711 ++++++++++++++++++
>   Documentation/translations/pt_BR/index.rst    |  11 +
>   6 files changed, 1439 insertions(+)
>   create mode 100644 Documentation/doc-guide/translations.rst
>   create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
>   create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst
>
>
> base-commit: 90d9f76ccb72ec024ef476b4229f3dd1957d7b26


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>

