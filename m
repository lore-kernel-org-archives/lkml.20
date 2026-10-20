Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515504;
	b=5coLYF8GY3+1fmGKtfVgVrjWSYviYgClxe/6PwusDzssE+SFeD3cBRzQfZS8yyV/HQ0K
	 TfUuM+v8GKyIK/3bUK/a37OAEAUiq8L9jAU5gUC1JEZSuG2Elow783dFljDZxIgFjZp7N
	 Uc887GrPwKLyUFpBiSEcRnXr3B2bExbAgZJChzr0qbPaRbCZrji7AqSPvFd7HbYijcx1j
	 yClyx7q1YOQ7gSKd9Bs7O9JA9JeU0hY4WeHE41VqU3yQE+aJS/p9zW5pxEROBbHQHR9kj
	 WT+E/oeS94uHtaR/uIO5mtkvNxU32wujLJ00XjridcY3QKO+79SC1GpP77UgVqgyZpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515504;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5rK+lDjde7+rlTTqYoeU/IKtrX3tA8RsSKIzVbGxN5A=;
	b=k5BErheJ7R22Dt7nzluWIK5ESNg2IlO05x8A+bh/kCx6CwyKPo6qiPsscmOGBF57E4EP
	 KGcDXqdU9zJsFoMrI0LTezHgXMgGYXM1GKytCXbl3KbwjVhXqy9WnXb16A+7nOCDPWSxQ
	 /U2vPZgzkuzfywnvcJ1ew8KLYGUWBWaloxToSresu5Gmbch/ZWa5cdy3e9yMCaQgD9z6U
	 csE0PwDERcmYBV2cQQRBd6IKHEVUHhLjeW4WwvpDozCAIx/hCY6b8zA79331svlORtf5c
	 KsGmAIF1gCIRjlM3sbM4ZknSRjCJsMwh1hcz3JkOZqQ2CSwdssMk2WNLnjvQu8velDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SC5cvL4f;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61127606A320;
	Tue, 20 Oct 2026 16:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61127606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SC5cvL4f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5rK+lDjde7+rlTTqYoeU/IKtrX3tA8RsSKIzVbGxN5A=; b=SC5cvL4feNHpllqrgkushrqkoP
	ikB3wZms9MpW+Yb4/ypjx+lUsW0+Ezp5EM8irdvFr1sNUjqDuMmaXQILDiEii2gEloX4zxzxtvV8I
	9aEIpm7QrFb/OnpAvk/Jy3LDV3V6+U/5OVVuBFDIHqiOLIQQjlEPiKjaM5/ske036raVY7Ck8JFbW
	neGwfPx03r7FMhO/BWHyxgxJPZi4pmfwGYV7khgMV8nctCglaYHfyZkJ29iSyayY4itKGlQk9FMS3
	c9LMniptp9azPBAJeDY0wUrd/bBj83wULyTo6Y5cLdDVXhJ3Rn89rbxsEzESJlD+0CgFtakVTfk6c
	31k+wPkA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDAJ-0000000AHZA-3ftz;
	Tue, 20 Oct 2026 16:58:19 +0000
Message-ID: <ded20c0a-f590-4160-a675-b68b54f25fe9@infradead.org>
Date: Tue, 20 Oct 2026 09:58:18 -0700
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
Subject: Re: [PATCH v2 2/2] docs: submitting-patches: make LKML a list of last
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
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261020-get-maintainer-the-rest-fallback-v2-2-162aea473488@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/20/26 8:35 AM, Konstantin Ryabitsev wrote:
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
> ---
>  Documentation/process/submitting-patches.rst | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 7ae79452e1b4..b4a2750599a7 100644
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

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

-- 
~Randy
