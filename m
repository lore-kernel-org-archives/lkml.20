Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CE24D797B;
	Wed, 16 Sep 2026 15:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573407; cv=none; b=hR7pmfH679Ia+cKEMLn7YJwqerb0qfbMh0jgwy1HhtxJX12fpMs7DJoFznuM3+r+cPY9ORAUwaOkgiDMVvefe6Qt4u/spIr51Ps/TVXeokVZkw5Hws69ldriTIVj1Y/zL4zGfeZyF98ZKAKTDyvOsYJiJEXHEsHDPKHAjYh7YFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573407; c=relaxed/simple;
	bh=hF2hqF//d30+BO1ckNXZ6ZOVG/l7TRhPpGypEh7VGCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dwIpCfSwE9RfJC2F3HtUa1rE6ClKGRCRduvRtHeOO4lrTkwgZlvlIF1dS2lqMiUv7r7xbMQTtL8JQfLmaeUDEZtPutzI6dVlfy7zNrVe8z+4+D0VMkrzDGn0zLhlTUXxcoTNEUqI/tzB5rAabn8vo7eNEmbhJKMk+eQeg6kddBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qtkbc7O2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qtkbc7O2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 099C91516;
	Wed, 16 Sep 2026 08:43:21 -0700 (PDT)
Received: from [10.2.200.62] (unknown [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 700A53F86F;
	Wed, 16 Sep 2026 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789573404; bh=hF2hqF//d30+BO1ckNXZ6ZOVG/l7TRhPpGypEh7VGCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qtkbc7O2vqbc+V4MkstxiqWF5r/H+OYro5ZO8pRFkm/W3OgCkN+9TvKaNG4dMLem8
	 sF34UciZVSH0EJYAiWZfDBNlMVfCgZ8uXgEkk7KOnr9cFGg6pciSi/RIrkSX2BrDko
	 bf13LRLYg1tHP9oEWoAWij8jHGajPbRc7oAuAJuk=
Message-ID: <335cf0a8-4c0e-4c07-8d81-c076ac73d329@arm.com>
Date: Wed, 16 Sep 2026 16:43:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: add padding to mali_c55_params_ccm
 structure
To: Arnd Bergmann <arnd@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260915202458.3673504-1-arnd@kernel.org>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260915202458.3673504-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

quick question since you are mentioning information leaking in the commit message.

On 15/09/2026 21:24, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added structure has extra padding on the on
> some architectures, which triggers a pedantic uapi check:
> 
> ./usr/include/linux/media/arm/mali-c55-config.h:807:1: error: padding struct size to alignment boundary with 2 bytes [-Werror=padded]
> 
> Add explicit padding here to avoid risking information leaks
> and incompatibilities between architectures.
> 
> Fixes: bb401df68c06 ("media: mali-c55: Add support for CCM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/uapi/linux/media/arm/mali-c55-config.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> index 84d8f3901405..9c922290e035 100644
> --- a/include/uapi/linux/media/arm/mali-c55-config.h
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -804,6 +804,7 @@ struct mali_c55_params_ccm {
>  	__u16 coeffs[3][3];
>  	__u16 gains[3];
>  	__u16 offs[3];
> +	__u16 __pad;

Does this field need to be explicitly zeroed/validated anywhere the structure is
populated? Turning implicit padding into a named member fixes the layout
warning, but by itself does not seem to prevent leaking uninitialized data if
this structure is ever copied from the kernel to userspace. It might also be
worth documenting that __pad is reserved and must be zero.

I think you already checked that changing the explicit structure layout/size is
safe for existing userspace :)

>  };
>  
>  /**

-- 
Regards,
Vincenzo

