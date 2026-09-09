Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B232352016;
	Wed,  9 Sep 2026 15:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968977; cv=none; b=NXz35spqoJgMLnkYNROFj58v6bNI/0ik/3PPJzn0lSe0yakgA2Rsa6zMhhaLhqV38qLMAnF2pGHDerGTrWOqra3QpjSaYFi3igjaWFB4N0oQHDCxr2kzv5Lg0U9OqO9oSqgEe06+nwmpJL0L7kxBv3/2jgOQyYWYl6qzx65Co98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968977; c=relaxed/simple;
	bh=7bhXyQhetiPBZeVEPUSFwKKEOPXZKDlnY1fbnbOb6EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMOMbzVKl+RU4avPYNsloPTzry3JsZyh11CI79KTwW6iIVPipcLtdo12Og5WIM088RwWD+90w95JxzLCTSU6Lpq+RnsGob9g68ybRMQGz4dnapTSHeq3Db/9WNG5Ogywl4oL1v7ZZROK1CRlv85qXpArJBQzTYJevdkWAchLM3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O56gEx+y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O56gEx+y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=O982MRz3ZnvJpd6XtX5F47jsQHnBwqKeU3GJ60z6ANk=; b=O56gEx+yyLLBfrGG2qOGxDnXtf
	nc+G4U17cNF5TvbzBadrwfWgfoRHTZQhIcaYpWfAWRhi+Y5eUF3WT8DaF27NL3/T7xBISftyNgSSJ
	Pz44cVosEUiP4/QFgEEUchX3HVfzM7gbeKsbuHDddvYO01b1VCbTlotCg0PJDMsETUWn4v5+hqukZ
	/nv1iA3DAzfygMNEhs3+Rbm/x38sLyaioA8pPsbdhrQM7fFymbEaj6dnUyHoN+twNNDM52Cy/8GTd
	ycaQ8z2z+xyNEPE0Tfmxs82pU2eWYNqu5M0+YnW2vwQ1Y1GvERL6bfaPX6rc8cm1owKOCMPhAMTxh
	j4mODtAw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KYB-0000000CEDO-0kNL;
	Wed, 09 Sep 2026 15:49:27 +0000
Message-ID: <62c2095b-199f-4646-b3a8-b52fdbea36a8@infradead.org>
Date: Wed, 9 Sep 2026 08:49:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: UML: user_mode_linux_howto_v2: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Renzo Davoli <renzo@cs.unibo.it>
Cc: linux-um@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260909140051.1365758-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260909140051.1365758-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[adding Renzo]

On 9/9/26 7:00 AM, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index 9224bea5e..13acac1c1 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -580,7 +580,7 @@ https://github.com/virtualsquare/sshlirp
>     ``vec0:transport=vde,vnl=vxvde://234.0.0.1``
>  
>  connect to a local area cloud (all the UML nodes using the same
> -multicast address running on hosts in the same multicast domain (LAN)
> +multicast address) running on hosts in the same multicast domain (LAN)
>  will be automagically connected together to a virtual LAN.

I would put the closing parenthesis at the end:
                                            to a virtual LAN.)

@Renzo, comments?

>  
>  ***********

-- 
~Randy

