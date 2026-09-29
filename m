Received: from www.kot-begemot.co.uk (ns1.kot-begemot.co.uk [217.160.28.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DDF42CAEB;
	Tue, 29 Sep 2026 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.160.28.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663520; cv=none; b=DWs6AbqbsG9Sdnx6pxWdqkLboNImhq/2P/xhO9v3uv+IEOVtE9m+BVbvaPwPttH0yVbYbs47vftxYP6i0mNPJiDKFdgLWarzfNcSg4YihKs2rcKbX+M6fgkS5cjBdDsYYxRtn7t0bMzJ4rQzPyolnmVASkijN2W6SzoymvROJ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663520; c=relaxed/simple;
	bh=UQjLV6SR4IIVfeeY2rKLzrUNxgQ8OmEXMkSIDFkRiMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SCOkQYU3LX8BLUkj7Uzjdku4jbGT9FETYM3NDuuffb5ILmgojJUin3batYTI3VFA3nzHHhHg/UbJwQtSK93Q7tlvYSbZKO7+BVPKRRfTFEyQk8R4NxaMfqEnetF9YzxxmqG17DCX7XFl2A4k1xJmFYQX5YRaupcWogOmb9iXCgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cambridgegreys.com; spf=pass smtp.mailfrom=cambridgegreys.com; arc=none smtp.client-ip=217.160.28.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cambridgegreys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cambridgegreys.com
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
	by www.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xBQxx-006b3W-2Q; Tue, 29 Sep 2026 06:05:25 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
	by jain.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xBQpv-0000000FjgF-3FV5;
	Tue, 29 Sep 2026 07:05:23 +0100
Message-ID: <623372e1-dd03-431d-b613-4592d1505093@cambridgegreys.com>
Date: Tue, 29 Sep 2026 07:05:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Fix outdated URL in user_mode_linux_howto_v2.rst
To: Chaohai Chen <wdhh6@aliyun.com>, richard@nod.at,
 johannes@sipsolutions.net, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-um@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929035006.2201371-1-wdhh6@aliyun.com>
Content-Language: en-US
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
In-Reply-To: <20260929035006.2201371-1-wdhh6@aliyun.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett

On 29/09/2026 04:50, Chaohai Chen wrote:
> Using an outdated website results in an error:
>    E: Failed getting release file http://deb.debian.org/debian/dists/buster/Release
> 
> It works successfully using https://archive.debian.org/debian-archive/debian .
> 
> Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
> ---
>   Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> index 9224bea5ee9f..c4d5d08e2bab 100644
> --- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> +++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
> @@ -123,7 +123,7 @@ jfs, etc will work too.
>   
>   Create a minimal OS installation on the mounted filesystem::
>   
> -   # debootstrap buster /mnt http://deb.debian.org/debian
> +   # debootstrap buster /mnt https://archive.debian.org/debian-archive/debian
>   
>   debootstrap does not set up the root password, fstab, hostname or
>   anything related to networking. It is up to the user to do that.

That is the historic archive - you have only out-of-support distros there.

That line should change to

 > -   # debootstrap buster /mnt http://deb.debian.org/debian
 > +   # debootstrap trixie /mnt http://deb.debian.org/debian/

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
