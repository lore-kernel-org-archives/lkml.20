Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322482;
	b=UecmDqI6QuidlzQX+VDDrpoa/WLXar/Xlaq+rpu81dHWyt/RBLYpUwDoPJRK/tPEUasL
	 5tZnXIM1Bi4RU81J8JN7OvvYggUeM0rrmd+3HbXz2KsTnFs46ibC7Ya9MwbUM+6K2miSa
	 XsBBgM/OUMf7+NQ/Sy3KbHiqXyxidUQMekiJhDK2ocOC77yrjoBGFftnAiJEgzlqEF/8d
	 mV5QRoma+2faMekXjMSHxlGraHP6bkSkiN+PbbHXCb4udklEvvVRB2v6bfANI3fFKpFJz
	 idzMOfrF3tKEf7zewqxu9nsUpjirazoH8XXgpudPF1zFCr2UVNNfZ9O4fAt4FD67/Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322482;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=i8nCWJsIMi8tRj0NbiJ3ZAa3Z+5NAGFl9nF3hq0mvIQ=;
	b=IOMuqyqP3KDwzsLlNCRrSe5fMtqj295M33SOFx6NJ1xQO2nsLHwLKQ/3IF548i9kldNv
	 t1tcpreXr8xctxi5lzSlCHY4Rk1lWSnIrx/QFnS/3ceC604SNovI9lSH9UHGo20eVurSk
	 dO9gpVV5w4aUpW1Jjri3vN4Xj5XXyE4so7qmmYXVxhAEqatOo5L23/7i7slbEGr/UIZRX
	 2u/UzOLhNQaU8ZeLrrywJs4hr6DchNywxKruak7w5O6v54nfkOeOBAnHOcWAsZAESTCyf
	 BvQBT5THOAc/e3iFrdyWUMOTvK9bwjdFybDQNV98/F/nL/MAakKYtn8PQ+YmjSopdZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q5mB7zM+;
	arc=none smtp.remote-ip=95.215.58.74
Received: from mta1.migadu.com (out-74.mta1.migadu.com [95.215.58.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D63606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q5mB7zM+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YV0ZAZQA7eLGOxIXAY73xMRJkv0rtAiAQXAfZzs6aeU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793322479; v=1; x=1793927279;
 b=Q5mB7zM++DjyM9P+4tEVYPrHMRCXGM6eJxdy1H1mVQ2xWLnNdMgk0viAK/35pesMpWcHARNQ
 ycsPqk0Lptn/DfUft1lWrO0xGBTcaUqz8ON5yx159rbEaj31/QgO6TGsJoERVKGJtLx6alEZIh7
 gmL+X3vx1kk2YDpNAzA3QmLI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cdee6e35ee4de474;
	Fri, 30 Oct 2026 01:07:59 +0000
X-Mizu-Trace-ID: cdee6e35ee4de474
X-Migadu-Flow: FLOW_OUT
Message-ID: <89758699-95f0-4c2a-bda1-c1427a45e91f@linux.dev>
Date: Fri, 30 Oct 2026 09:07:48 +0800
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
Subject: Re: [PATCH v3 9/9] docs/zh_CN: remove stale Original fields from SCSI
 and IPE translations
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
 <20261029124429.294868-10-dzm91@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20261029124429.294868-10-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 20:44, Dongliang Mu 写道:
> Remove the stale Original fields from the WD719x and IPE
> translations. Both English sources use the same relative paths
> under Documentation.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> ---
>   Documentation/translations/zh_CN/scsi/wd719x.rst  | 2 --
>   Documentation/translations/zh_CN/security/ipe.rst | 2 --
>   2 files changed, 4 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/scsi/wd719x.rst b/Documentation/translations/zh_CN/scsi/wd719x.rst
> index 79757c42032b..f56eef04fd00 100644
> --- a/Documentation/translations/zh_CN/scsi/wd719x.rst
> +++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/scsi/libsas.rst
> -
>   :翻译:
>   
>    张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
> diff --git a/Documentation/translations/zh_CN/security/ipe.rst b/Documentation/translations/zh_CN/security/ipe.rst
> index 55968f0c7ae3..51065bbc53a1 100644
> --- a/Documentation/translations/zh_CN/security/ipe.rst
> +++ b/Documentation/translations/zh_CN/security/ipe.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/security/sak.rst
> -
>   :翻译:
>    赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>   
