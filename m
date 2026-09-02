Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0E3612DB;
	Wed,  2 Sep 2026 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367627; cv=none; b=nNihPeQw6fjZer3VvM8ER13Ey72uuuZvNzSdkoytsuVGbWTJHH7wbaWNsd4416E5p7BFfi7Jz/MoFqQ+P7/LFsgFe/W7vklY2NdKUNGcVBzE8iJO9qecPfnHX/rTvT6QPeOFVIIvDVk/NLuwwZzXzOtHngPH569XzQ7yVnXpFE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367627; c=relaxed/simple;
	bh=UaTRvSct45GWzEgw6LB8/peCuLLoDBd6cZ9Iz8pm/gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILW0xzDGnZP0B/qq3urGbJvcsYxTnzNmeKOpOQNC/dGXtwLqJ2smYNTJ1FTJwKlhqhXb1TYZgTnn5c+zwTGhAAMKyJUvsb7yuFPFAl63C0Cqk9/DjkiTe+CFn0n7P1GfXmmkA2OFQTM7xRcztbryqIbZNtmCenvPpya8vFxZw5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CDmlgrOz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CDmlgrOz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/PBUi0NLKVx3xQDyx1Lt+SAG5q3k1Fi5rq37drs66W4=; b=CDmlgrOzociuMBQbMkipVGZPf/
	gohP4u+M+egkqJodGGQWyCp7P5VRoXSNOs4B5ZczDeoo0dLmx4Gk1lTn4fHMlHvuRmvl6mQoBCou0
	GPKxZs/ql3tm7KrQCBZr6t1l9NRZoGeUSZEnKNYUA7zQDkG6cBF1yRlcs/IEWc+jbex2ZpTfhQEj3
	fqo1drbNCPIp1pVp07Ly/JdTkdO8kcxs6GR2LPknWJFIYaK7DiYAn/ICWXUkde1WIz3JtZiYYC9GE
	vVrsxAOWDeCUl7wnjQIaQQfq+uBkOz+NcqksCpnLLcBfpwW/LZGPRUKyxigTHav77uP1jZMXlK3pg
	R2oBT2lg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o71-0000000FIcS-14dM;
	Wed, 02 Sep 2026 16:46:59 +0000
Message-ID: <d254a0d6-83e3-4f67-8fbd-87b5ad3b2849@infradead.org>
Date: Wed, 2 Sep 2026 09:46:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cdrom: fix brackets
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Phillip Potter <phil@philpotter.co.uk>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902125431.696887-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260902125431.696887-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/2/26 5:54 AM, Manuel Ebner wrote:
> From: Manuel Ebner <manuelebner@mailbox.org>
> 
> Fix missing ')' and add '()' to function.
> 
> Fixes: e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/cdrom/cdrom-standard.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/cdrom/cdrom-standard.rst b/Documentation/cdrom/cdrom-standard.rst
> index b97a4e9b9bd3..b6dde1d1eaaa 100644
> --- a/Documentation/cdrom/cdrom-standard.rst
> +++ b/Documentation/cdrom/cdrom-standard.rst
> @@ -1014,7 +1014,7 @@ How to update your driver
>    just calls to the routines you adapted in the previous step.
>  - You may remove all remaining memory checking code in the
>    *audio_ioctl()* function that deals with audio commands (these are
> -  listed in the second part of cdrom_ioctl_. There is no
> +  listed in the second part of cdrom_ioctl()). There is no
>    need for memory allocation either, so most *case*s in the *switch*
>    statement look similar to::
>  

-- 
~Randy
