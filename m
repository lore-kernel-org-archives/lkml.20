Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621257;
	b=yTI/SX52BbKUCk0wEyov2g+ITGHVYXE+Hm5D5yctXtPFO18M1HWv2zskzFbwXdUs3b7x
	 Vv82HhNtUQacFKcr44/PaXHr99BURG1YKJ64GD5+zGwWXSmm6MPL4KijZHEPaPJknb2rl
	 vyost0n3wvRSUGFDV7uMPLytl9e4JWlfEk/s69xQv+h+Z6IvSKxzctPIg8VKg60kDko0E
	 YjNLWXAAy3/VG8bJgK8BrRhZOtfPOY0KAeiyXDOUQh4G+W2gQMxqxL5DxS+pSpgtMs6CS
	 nBM61Sn3cWWBtoDLQ3H+xI/x/+KQ7zTXHKIVFJY11QlF/7kY0nWMDXj/V8n3HdBYoEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621257;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=y63dkkwfBihVGNBC6LZbRAzqWBR57wMqdkzk89CFPaI=;
	b=RRnfFWu6FA/EjGgqDpqoc8BXKWOvLh+SbroeaaS/9WK/56Uo9zj+il2pKKwD//tVOSlW
	 h9654Ofbi4jGrpuzQuCuRLZRzjEBdq8s2j1Wqz1xTzPg0edUrl9b7IpCe+FQ5xVN2MvnY
	 UaKWsNj36IRZgwjqU8PErnE8dCII1yr5+qsu82iaweFlI438HZ1kO4mwze+MJPFa4abrd
	 l41jiokdCxrTCBaXrkE00PnAYHPiFNj9cA8UXegNX+PnCBTwPlJaK9tKT8Ky5zURvXphr
	 Jo5XXgKVxou5mO4nfcbQNyS7ULcJAZtDaQh6jD5boj3m9R8CX3XOLybXIZWQCYYAauQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EhDwSGBK;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27E606A335;
	Sat, 14 Nov 2026 01:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A27E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EhDwSGBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=y63dkkwfBihVGNBC6LZbRAzqWBR57wMqdkzk89CFPaI=; b=EhDwSGBK1BcmLwg11aYlpcDLHB
	ubEj18NlcnP1/Wz/Zhq7NEvmO69iZaZv0PyW4rAifZejyhSsu2DwBJGwYkAtFufPTqWVMVkbBJ/x/
	gwnu19RRgeQqykyGckcBZZEUQppG6i4J7fgBr1p64JTq2x902qp/s+K/UVxYPlixJDUAJULRM2wet
	YJOvgLl8HTJkMGghgTY1oVEcHVyrbTB1IEPBApYYvJ2wZc5RcIFPxMU6wT/N5P15P4FPYi5kgOzQu
	BpexggR4tOMaQHCit+v/it9Lmrw94uQbQCdT/kgiJx2handr1hJdvyvuPWQKZ5dNKi1YA64c4ZiLs
	2eWIpkZw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2y0-0000000F4az-1aPM;
	Sat, 14 Nov 2026 01:54:08 +0000
Message-ID: <ccfe6cc4-507f-4e54-890d-91da75de11fc@infradead.org>
Date: Fri, 13 Nov 2026 17:54:04 -0800
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
Subject: Re: [PATCH v3 2/2] docs: submitting-patches: make LKML a list of last
 resort again
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org,
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik
 <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>
References: <20261113-get-maintainer-the-rest-fallback-v3-0-36ee5a3e8d13@linuxfoundation.org>
 <20261113-get-maintainer-the-rest-fallback-v3-2-36ee5a3e8d13@linuxfoundation.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261113-get-maintainer-the-rest-fallback-v3-2-36ee5a3e8d13@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/26 3:02 PM, Konstantin Ryabitsev wrote:
> Commit 77167b966b7e ("docs: submitting-patches: clarify the role of
> LKML") changed the documentation to say that all patches should be sent
> to LKML by default, because get_maintainer.pl always suggested it.
> 
> Now that get_maintainer.pl only falls back to THE REST when no other
> matching section provides a mailing list, update the documentation to
> match: send patches to the subsystem-specific list, and use LKML only
> when there isn't one.
> 
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/process/submitting-patches.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index f271d7413f72..85ba046d66fb 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -239,9 +239,12 @@ patches as arguments to scripts/get_maintainer.pl).  If you cannot find a
>  maintainer for the subsystem you are working on, Andrew Morton
>  (akpm@linux-foundation.org) serves as a maintainer of last resort.
>  
> -linux-kernel@vger.kernel.org should be used by default for all patches, but the
> -volume on that list has caused a number of developers to tune it out.  Please
> -do not spam unrelated lists and unrelated people, though.
> +You should also normally choose at least one mailing list to receive a copy of
> +your patch set.  Look in the MAINTAINERS file for a subsystem-specific list;
> +your patch will probably get more attention there.
> +linux-kernel@vger.kernel.org functions as a list of last resort for patches
> +that do not have a subsystem-specific list.  Please do not spam unrelated lists
> +and unrelated people, though.
>  
>  Many kernel-related lists are hosted at kernel.org; you can find a list
>  of them at https://subspace.kernel.org.  There are kernel-related lists
> 

-- 
~Randy
