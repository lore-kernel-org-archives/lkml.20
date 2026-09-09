Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC53568FD9;
	Wed,  9 Sep 2026 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968493; cv=none; b=hbmMwTu5/I25seUw06afC1HXtg3UwI8ji2IVErb6ngtn7Azq8T1s3Qx1sKIS3vYA7xQ1npmxQ0EkB9hhYwK9H0WwceIoHhjliY2uPHz+kM0YmBR19LuXT6n2jViYWc3vZKpCWamrE+a30b9nVLnBOBzYTX6GAj6yePmoBeGtMPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968493; c=relaxed/simple;
	bh=UdCD/JJTI6/2Htp0aA3cXVU0z9I88iHs73UoUwgV8EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ku7/eps9wniV+sHiDiIxhjcFU8/gLSPQzgz/eoiDVLAbBAcm4sqhsEYZCckgAneVrNve3R0qXHoEnoavKG+CQtaPczChYU1twVMYYL1sXOAIoUQ8eV3U5Qgnms1/M2ObhQ2e+V4cFALvfWl14hyWfo0P3pY58bT2lep+Z3jOBeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=31sVd3lT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="31sVd3lT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4jGEiWuc3LNhn0aOVdAeuDAY3lihVYe3loGnLwhG5ig=; b=31sVd3lTXwmDP95C/LYFKf+7tj
	NoGRXuYEaeQCfG2DjsdWcv1/bc/Rxt1IKSMZg4cGFbTfUjLkI89TCkq2acz0oe310Zx0n9GOmyDC5
	IE9fq8qTbUNoZpIBpcHA6vNJX4X9nk7/kS6f8Oxw6rQVGqJswkHxwwsC3r+HMVGKi0qQ3TcXk71rn
	gv417w+Ue5sCPiGxo9qylUkqB4+Ni7Ip3Di4xynh9bl+BoPHl/QE97rn2LIH3geyzwGG4/2PCjGjR
	Dt6k3e8eBQAlxGqhFT1ENF4P86rly7jJNEYkDr3VREuh6V6n3EiqbnX9osqA7KvP3zlhjS0VBLduG
	Je3u5++A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KQN-0000000CCjG-11zN;
	Wed, 09 Sep 2026 15:41:23 +0000
Message-ID: <84851571-6fdb-4a23-9ff7-8e36de16a435@infradead.org>
Date: Wed, 9 Sep 2026 08:41:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation nova: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909135319.1364776-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260909135319.1364776-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/9/26 6:53 AM, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.
 
> ---
>  Documentation/gpu/nova/core/todo.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
> index d5130b2b0..a01c362b1 100644
> --- a/Documentation/gpu/nova/core/todo.rst
> +++ b/Documentation/gpu/nova/core/todo.rst
> @@ -33,7 +33,7 @@ A good example from nova-core would be the ``Chipset`` enum type, which defines
>  the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
>  certain register indication the chipset AD102. Hence, the enum value ``AD102``
>  should be derived from the number ``0x192``. Currently, nova-core uses a custom
> -implementation (``Chipset::from_u32`` for this.
> +implementation (``Chipset::from_u32``) for this.
>  
>  Instead, it would be desirable to have something like the ``FromPrimitive``
>  trait [1] from the num crate.

-- 
~Randy
