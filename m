Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDED4A49B4;
	Wed,  2 Sep 2026 17:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369085; cv=none; b=E23dHRzEI+Ub118mZ18cAs2qeI6vinQ0OOU7QyBKtikNFnUrorCzIYhNcSk+r4Z7fUgmQhlYno4GuAnHRAod2a8Nw9DGvFr3HSQBAyX9xoFvSEF7wl1ykYRuWFRKZi/NakuFfymzPMMi6Kkck7WwqFj6DJrJyybmNE0aeq+1kyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369085; c=relaxed/simple;
	bh=F7UkuTj97Fxyxet4QZZ0EU7w/z5NrYvRqhVG0eDqMvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANAEQszaVgQbusT0hZuJ0X9ZaHha+5BAKo74eHLoY/XCWMc/ljQaL6tTFWXX3shP+2uqng5Pq7pi1+15ggRvvTTfAeIWF16f4OJ/4OAcocD1YsMaA4UEqSi1DiHxOBFbj0AwvN3t1oYuUIRmrWebooClloAobddN/8jl2cwrVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xhdoh3Pb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xhdoh3Pb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eTNn0d76R4O0+k9rVJ2pe3fnIv3evJ59yunTKX7NAy4=; b=Xhdoh3PbJ9lGU/0GowkVjXW2+Y
	grODHnO8j9cYU1P6O9AOqoGXVDJ5gI0daOAM4dzZwicTj4N/nlD2EBtFQSShR6nKvyhmjvmFb99KG
	ZN4cTiSqC8i3qT/6yqLqS4fUkLBh1PHEO46pa15X6Nh1rNENlUyRIHW2UgPvqftLGpQw8dYgzAJhL
	6rMMFXsVBo4J547+9R3Xo7n1HDfhGF5DOiCH3LTxSq1CkF7VWSMDWbSDEyB7r3bj25iECVwqfK4IQ
	IZZJPZPifq537A3lVvv7kl4QUA4+lbL75/7f8O8gsk/he6TTtkWPyTSGAb12t+RPkRUB7SFO+ovqd
	G6GYXJNA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oUc-0000000FPIr-1ft0;
	Wed, 02 Sep 2026 17:11:22 +0000
Message-ID: <9b69cbd5-afff-4278-a56a-2a17c11de7cf@infradead.org>
Date: Wed, 2 Sep 2026 10:11:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: doc: hdspm.txt: Remove bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902150324.705863-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260902150324.705863-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 8:03 AM, Manuel Ebner wrote:
> Remove needless ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/sound/cards/hdspm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/sound/cards/hdspm.rst b/Documentation/sound/cards/hdspm.rst
> index 5373e51ed..ee157f351 100644
> --- a/Documentation/sound/cards/hdspm.rst
> +++ b/Documentation/sound/cards/hdspm.rst
> @@ -367,7 +367,7 @@ Calling Parameter
>  	  note: each playback channel is mixed to the same numbered output
>  	  channel (routed). This is against the ALSA-convention, where all
>  	  channels have to be muted on after loading the driver, but was
> -	  used before on other cards, so i historically use it again)
> +	  used before on other cards, so i historically use it again
>  
>  
>  

-- 
~Randy
