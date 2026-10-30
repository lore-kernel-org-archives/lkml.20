Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322387;
	b=hfoNa4l9Ctj1AuVp6pB4XUzOdCgFxueTOxfyFwYBq9yuFu5eOmbBYLal4yvjjU3rj7Wj
	 B2Nf+3C/y7C8/urUtytoZ5jnXS+BkxqX18JRs5BO2Jydpf06+8Xus6k9siEo4gWdo5ZPZ
	 J8CvvAQt1HG62FlONRpPGcdkxkTMEasCpPrN23o2G/ojktYBr1kE+NFnGbmZM0xpkfQ7I
	 2VN6zs4mF69GKkFpZ8zoF+Mb6FJ5vVlCPOYQDfC8ari0E/AzfTbyWT2igmpIxjt5eWpRT
	 sVUs8f1FKYT0Brm2+ps/j9aJWzNeTsD+9fFMd1zKlwRIOM+YjkvyPAzuoQcj9tyF+kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322387;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JzgFJMOLFYwvePlKh+I1EU5zI0SF2rYepqzNiEMGBak=;
	b=hG/vaMs1xsp/35N2aUxxjnHsvL3OgCHU9JqL72YKjFipQpmrcWV26PXBsM2djD0LLu9j
	 YM6b9Qyf/X822HkZ72SBc6pNL6RqukfE6967w5DKWtI6CmX8kJ29TzrB/Ynt4o9oO3jpm
	 DidEvyAQ2UsmnVm/sCUpf3wNIsR86ONRvDWyHdgz72bbt5zdW+BrTq5GmD2MNyu8PRbwR
	 JwmJHxVnyMMr7NOe90uYtUGqP5z3NmYJvHscW/DBRekBqwwN2w9p7cEnrrO5ijmYMgd8h
	 yXwof3rEb+3kkG8C3SySabXdhzBZveOOwEMG93Dxt+IjPowR/FA05x71z3oFSf5XJPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bh+gNGsN;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26011606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26011606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bh+gNGsN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yTADy1/D7Gqq4qD3lyh7cKLqinNvU24JT1mwLdBDAKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793322384; v=1; x=1793927184;
 b=bh+gNGsN9m954p2h69Wnh64hxtjv47C2klg8ffzZfp38+nttBCUMP4ijrw9J1LVmiabnGZAV
 WhMSbWhJSRLuu0khtxqaBg0miHmIrQuETpXdbCxld3ipmkxzehjaOlJiDrr7r0KRhFM/+PpbUzB
 DprvSrL92AhCAVmB002tH3sE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2b9a7a775910b620;
	Fri, 30 Oct 2026 01:06:23 +0000
X-Mizu-Trace-ID: 2b9a7a775910b620
X-Migadu-Flow: FLOW_OUT
Message-ID: <2dd076bf-cd4a-4d07-a5b2-a0529a61281d@linux.dev>
Date: Fri, 30 Oct 2026 09:06:15 +0800
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
Subject: Re: [PATCH v3 5/9] docs/zh_CN: update magic-number to match upstream
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
 <20261029124429.294868-6-dzm91@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20261029124429.294868-6-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 20:44, Dongliang Mu 写道:
> Update the Chinese magic-number guide to match its English source.
> Move it from process to staging and update the staging index.
>
> Synchronize the translation with upstream revision dd8d4bc28ad7.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> ---
>   .../translations/zh_CN/staging/index.rst      |  6 ++--
>   .../{process => staging}/magic-number.rst     | 33 +++++++++----------
>   2 files changed, 17 insertions(+), 22 deletions(-)
>   rename Documentation/translations/zh_CN/{process => staging}/magic-number.rst (58%)
>
> diff --git a/Documentation/translations/zh_CN/staging/index.rst b/Documentation/translations/zh_CN/staging/index.rst
> index 6d68fabce175..896734ade5eb 100644
> --- a/Documentation/translations/zh_CN/staging/index.rst
> +++ b/Documentation/translations/zh_CN/staging/index.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/staging/index.rst
> -
>   :翻译:
>   
>    李睿 Rui Li <me@lirui.org>
> @@ -13,14 +11,14 @@
>   .. toctree::
>      :maxdepth: 2
>   
> +   magic-number
>      speculation
>      xz
>   
> -TODOList:
> +Todolist:
>   
>   * crc32
>   * lzo
>   * remoteproc
>   * rpmsg
>   * static-keys
> -* tee
> diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/staging/magic-number.rst
> similarity index 58%
> rename from Documentation/translations/zh_CN/process/magic-number.rst
> rename to Documentation/translations/zh_CN/staging/magic-number.rst
> index 05ee75cf4346..e8fdf9a7fbdd 100644
> --- a/Documentation/translations/zh_CN/process/magic-number.rst
> +++ b/Documentation/translations/zh_CN/staging/magic-number.rst
> @@ -1,7 +1,5 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/staging/magic-number.rst
> -
>   :翻译:
>   
>    贾威威 Jia Wei Wei <harryxiyou@gmail.com>
> @@ -13,13 +11,13 @@
>   Linux 魔术数
>   ============
>   
> -这个文件是有关当前使用的魔术值注册表。当你给一个结构体添加了一个魔术值，你也
> -应该把这个魔术值添加到这个文件，因为我们最好把用于各种结构体的魔术值统一起来。
> +本文档登记当前使用的魔术数。给结构体添加魔术数时，也应将其登记在这里，
> +因为不同结构体使用的魔术数最好互不相同。
>   
> -使用魔术值来保护内核数据结构是一个 **非常好的主意** 。这就允许你在运行时检
> -查一个结构体(a)是否已经被攻击，或者(b)你已经给一个例程传递了一个错误的结构
> -体。最后一种情况特别地有用---特别是当你通过一个空指针指向结构体的时候。例如，
> -tty源码经常通过特定驱动使用这种方法用来反复地排列特定方面的结构体。
> +用魔术数保护内核数据结构是一个 **非常好的主意**。这样可以在运行时检查：
> +（a）结构体是否被意外覆盖，或（b）是否向函数传入了错误的结构体。后一种情况
> +尤其常见于通过 ``void *`` 指针传递结构体指针时。例如，tty 代码经常这样
> +在驱动专用结构体和线路规程专用结构体之间传递指针。
>   
>   使用魔术值的方法是在结构体的开头声明它们，如下::
>   
> @@ -28,30 +26,29 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
>           	...
>           };
>   
> -当你以后给内核添加增强功能的时候，请遵守这条规则！这样就会节省数不清的调试
> -时间，特别是一些古怪的情况，例如，数组超出范围并且覆盖写了超出部分。利用这
> -个规则，这些情况可以被快速地，安全地检测到这些案例。
> +今后扩展内核时，请遵循这一做法！它能节省大量调试时间，尤其是在数组越界并
> +覆盖后续结构体等难以排查的情况下。使用魔术数可以快速、安全地发现这些问题。
>   
>   变更日志::
>   
>   					Theodore Ts'o
>   					31 Mar 94
>   
> -  给当前的Linux 2.1.55添加魔术表。
> +  此魔术数表已更新至 Linux 2.1.55。
>   
>   					Michael Chastain
>   					<mailto:mec@shout.net>
>   					22 Sep 1997
>   
> -  现在应该最新的Linux 2.1.112.因为在特性冻结期间，不能在2.2.x前改变任
> -  何东西。这些条目被数域所排序。
> +  此表现在应已更新至 Linux 2.1.112。由于目前处于功能冻结期，在 2.2.x
> +  发布前不太可能再发生变化。条目按数值字段排序。
>   
>   					Krzysztof G.Baranowski
>   					<mailto: kgb@knm.org.pl>
>   					29 Jul 1998
>   
> -  更新魔术表到Linux 2.5.45。刚好越过特性冻结，但是有可能还会有一些新的魔
> -  术值在2.6.x之前融入到内核中。
> +  将魔术数表更新至 Linux 2.5.45。虽然刚进入功能冻结期，2.6.x 发布前
> +  仍可能有新的魔术数进入内核。
>   
>   					Petr Baudis
>   					<pasky@ucw.cz>
> @@ -66,10 +63,10 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
>   ===================== ================ ======================== ==========================================
>   魔术数名              数字             结构                     文件
>   ===================== ================ ======================== ==========================================
> -PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/linux/pg.h``
> +PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/uapi/linux/pg.h``
>   APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
>   FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
> -SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip.h``
> +SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip/slip.h``
>   KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
>   CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
>   CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
