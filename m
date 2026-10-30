Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793320683;
	b=lNwUBLm56g7OGgbmNvRAlVmwbP9RgLMgMxvbC1VZnkngujwbWhscdzP5ykz2LHwMwdRj
	 4viwrMNPYAcVPPGUkLOBpafPXb4xBgvzJGVJkJaRRO0jnmkUU8twr7R52Z8OeZrQtMdX8
	 Dwjq13nVM5sCfecxwtg4M3PsLHa48I6ge/59gTV0gNdpPGjWb0L/Qme1+iLzdtTH3SuJZ
	 iLGJDx06l0+h8G1QqP1aO8dOmrWF/s1mzYwotqSsA1PIlNr/hsidDFSiaCqmKvhmSDKId
	 rerl0WNrVV6h1jWXQc7bQ2anU2x4X7rOqXNcX/VKkr3KymAF53kFnNTY8rxZXuGzPJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320683;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+ejUc88EAEnllGPh5+8BwGXy92CaElpvn7NALAOELCc=;
	b=DGnubRK/3uZqE6Gd4g6ksg5Y9nXqsWLD2QeDxYyLerJ/qSl8P3/FEQRaUYu0hoUzv9tM
	 G2yiJdiY+4ACgjw3G2XKcg1HyX5y+nEE0EEqZptGTJRhyv5zp4nTy0lHwDO04znLUwFel
	 amG8P4fs8RWeNkpAByuHXDmPpUk1oYszlKn5kleUP3RhDGlO8/TBMtHDQHxCrB7bqBX8X
	 elsDV2ZikNfooBUkPzWIU62LAvdzDgge3ZGvuqxVNFJlxWYIFotM9pmXSr3hxw5EFR3e/
	 PF4A6+6x9KFMNOuu62U9K+yGL7yqmovOqY+LJpypchwyYxvvKiudHSGnhUfaniPoKgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OFam45+T;
	arc=none smtp.remote-ip=91.218.175.142
Received: from mta0.migadu.com (out-142.mta0.migadu.com [91.218.175.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OFam45+T
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K7GfpJyNnnqUVpQu5f2RWlDjv0X3GwsGthodx3OUA8A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793320679; v=1; x=1793925479;
 b=OFam45+TF7mmR5EXLqlXsmvZnLUVe6uvtyKJyydYxa4ryun6tv01vTt4Keo+KOiY/DPnNE6y
 8qc/4yNm+V0mMtt9bGKB/3lE5jqeTILID0elyoIP/hAN0F52Scie3NNJA1icbA5ZexboQ0f1gJa
 9bx17nqYb/WQk38Ey5DKNCh8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7d457b01126d2a8c;
	Fri, 30 Oct 2026 00:37:59 +0000
X-Mizu-Trace-ID: 7d457b01126d2a8c
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec68004a-8479-4b76-aaed-2a261f782d24@linux.dev>
Date: Fri, 30 Oct 2026 08:37:52 +0800
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
Subject: Re: [PATCH v3 1/9] docs/zh_CN: update admin-guide/index.rst
 translation
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
 <20261029124429.294868-2-dzm91@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20261029124429.294868-2-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 20:44, Dongliang Mu 写道:
> update Documentation/admin-guide/index.rst Chinese translation
>
> Move the already translated tainted-kernels, media, and unicode entries
> from the Todolist into their respective sections.
>
> Update the translation through commit f0efd29aa60c
> ("doc: Add CPU Isolation documentation")
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


> ---
>   .../translations/zh_CN/admin-guide/index.rst         | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
> index bd01cf6474c8..23443eb66124 100644
> --- a/Documentation/translations/zh_CN/admin-guide/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/index.rst
> @@ -1,7 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/admin-guide/index.rst
>   
>   :翻译:
>   
> @@ -10,6 +9,7 @@
>    朱岩 Yan Zhu <zhuyan2015@qq.com>
>   
>   
> +==========================
>   Linux 内核用户和管理员指南
>   ==========================
>   
> @@ -86,6 +86,7 @@ Todolist:
>      reporting-regressions
>      bug-hunting
>      bug-bisect
> +   tainted-kernels
>      init
>      clearing-warn-once
>      lockup-watchdogs
> @@ -95,7 +96,6 @@ Todolist:
>   
>   *   quickly-build-trimmed-linux
>   *   verify-bugs-and-bisect-regressions
> -*   tainted-kernels
>   *   ramoops
>   *   dynamic-debug-howto
>   *   kdump/index
> @@ -122,6 +122,7 @@ Todolist:
>   
>   *   cgroup-v2
>   *   cgroup-v1/index
> +*   cpu-isolation
>   *   namespaces/index
>   *   pm/index
>   *   syscall-user-dispatch
> @@ -170,6 +171,8 @@ Todolist:
>   .. toctree::
>      :maxdepth: 1
>   
> +   media/index
> +
>   Todolist:
>   
>   *   acpi/index
> @@ -183,7 +186,6 @@ Todolist:
>   *   hw_random
>   *   laptops/index
>   *   lcd-panel-cgram
> -*   media/index
>   *   nvme-multipath
>   *   parport
>   *   pnp
> @@ -220,11 +222,11 @@ Todolist:
>   .. toctree::
>      :maxdepth: 1
>   
> +   unicode
> +
>   Todolist:
>   
> -*   highuid
>   *   ldm
> -*   unicode
>   
>   .. only::  subproject and html
>   
