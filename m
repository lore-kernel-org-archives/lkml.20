Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E7C4DD3CB;
	Wed, 16 Sep 2026 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577925; cv=none; b=uaPa0pVoXZYIzA1V2j0odlyIYnVFSAwrcBkNPFxfd4wiBzJs6fCSoEltpKe9unCDeKnXYDX/1TiZcnKyUNAwI5cAkkFovZY8+PXBb0KqlQX+0W8tvNFxJEjEnsD/VgtE8y+oKz2gJDjtBEu2T8vH0JRK7jlSzuHQM5jxK9XrC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577925; c=relaxed/simple;
	bh=eZkQ/VKSaiJJ88hn0sOhSTgFAOYEcdz42i9GK3CKgAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuvUdfRibrKzMmhqXEVXZWJAPnTCk3JJiGIMtB+BroaZDPZXnHoInpjVEU2DhCLhLC8NC7LlU89xUmjG1rMItKwzqpJAYIRHhfs7gnLmaL0+qMAMAynJxKDn4jf+U8ce9f9f41cq3NCM7T3XLjnMgCZSL8YgLeIIZ6eUuxqsHE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WdiI59iD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WdiI59iD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3n4TlQQrXwK7QKzZnUnV1l1DwLeMlfBFCLYLXcFf+xk=; b=WdiI59iDIV/r+qeNgZ6PLvUsO5
	lViWM8C9HeREnH7uXbBmKbd2X3gHAgfIjEuemuPeoDiPajtpFl4/bF5mJt3WRvICUjWMtMI5XIEwU
	Qq1Gx9MzBagb9PicRX4ZBGjgLZZPKv0sYMttoSGTKL0yNcV333d9CCq9x+9Jy4vysjT6ltP3vrq7V
	53Hx36/ES8sVGuXLAE7sbyY/H7rmwkd5I0bjLgOS5+3s+N2rzUlPYoH+a6KZuWz1zY9qesBH7z1j4
	GRgdVav6NanUbzP2uJuxZ3HmYCOd6N9DzuAPdtosrnIPmNc/lgi4OEoq1/uVkOiqMvUrSFJpZxTj9
	Bo5mXRiQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sxt-00000009oqa-03Zy;
	Wed, 16 Sep 2026 16:58:33 +0000
Message-ID: <515eec25-9694-4dcc-aa31-55dbac368575@infradead.org>
Date: Wed, 16 Sep 2026 09:58:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: docs: aic: Fix brackets
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916123458.314458-2-manuelebnerli@mailbox.org>
 <20260916123458.314458-10-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260916123458.314458-10-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/16/26 5:35 AM, Manuel Ebner wrote:
> Add missing '}' to lines of code.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> Would it be better to remove the '{' and replace '{{'/'}}' with '{'/'}'?

Not IMO. Looks to me like the patch now matches the definition
of tag_info.

> ---
>  Documentation/scsi/aic79xx.rst | 2 +-
>  Documentation/scsi/aic7xxx.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/scsi/aic79xx.rst b/Documentation/scsi/aic79xx.rst
> index 071ff5111..ba5299cb9 100644
> --- a/Documentation/scsi/aic79xx.rst
> +++ b/Documentation/scsi/aic79xx.rst
> @@ -292,7 +292,7 @@ tag_info:{{value[,value...]}[,{value[,value...]}...]}
>  
>  	::
>  
> -	    tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
> +	    tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}}
>  
>  	On Controller 0
>  
> diff --git a/Documentation/scsi/aic7xxx.rst b/Documentation/scsi/aic7xxx.rst
> index bad0e5567..117cd55fd 100644
> --- a/Documentation/scsi/aic7xxx.rst
> +++ b/Documentation/scsi/aic7xxx.rst
> @@ -308,7 +308,7 @@ tag_info:{{value[,value...]}[,{value[,value...]}...]}
>  
>  	    ::
>  
> -	        tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}
> +	        tag_info:{{16,32,32,64,8,8,,32,32,32,32,32,32,32,32,32}}
>  
>  	    On Controller 0:
>  

-- 
~Randy
