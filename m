Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.160.28.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481865;
	b=BwJjd+Z+AxOQIPJtGe+z6hgsvmKG1wiJ47r+hTYAPcz3msyjPMAE9/qb1osbxUPSj47v
	 y+GJxF6k6EkkdFlTgby8b3USNyhnnXCCunoGS0vTkLqrHEMZtSH+Btv5lihmmFE26Htz0
	 WvxXxhE0hc65VmvVUVM17UesD5pKC7KtnwFRIP05mtGyh8J8q3kC2ItHMjjp1m2BDVijl
	 RuFyMzlQOFvQut9/YfxqU2MtIK4Ly5+n9YZWL3GQ1xLW2yiuu9Wc4q8K0zQXxdyPXuZmR
	 eVzSXNKqMJ4EFenXpnMvIpLGc+jN095a87JRqO7ysQlRgZONCUwUEPL00zhM/Auk2RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481865;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 Organization:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Spam-Score:X-Spam-Score:X-Clacks-Overhead;
	bh=0HS6tT3KdrhmD3sjNiNbCvEXsKi2u4/Jhk//K3aXK8A=;
	b=vzrF4WCc14hs/1C2g0nkQWQb5HzJ6woIOOl6x+vOx5l0oPdp/w7F9mJvWv6UOH0C6LZe
	 Shazus4P97EMaN/d3d6f1cTBAMsbv/UbxS9wDWSH32hOXx6rjRXUv9ts5JBVT9gMD4AZJ
	 DjrloLCXTUoqddMalXUZxOK/JkgLdrPVd55rQTTRifyx+wIMSMNNY4kdTOThSVU6S8lGL
	 VstNxkHQlAL3LYNOg+DpiWy9GqK4yb+/jgJ+NhSn07dh/VculionHxc0Odj+z8ui3IK2G
	 rNkJ0jW347R68LVuciOgeNs0BC4GlTIWLEJtxPQJUy4Nr+ZzqPSoda4nKCrCESQ5B3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cambridgegreys.com;
	spf=pass smtp.mailfrom=cambridgegreys.com;
	arc=none smtp.remote-ip=217.160.28.25
Received: from www.kot-begemot.co.uk (ns1.kot-begemot.co.uk [217.160.28.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10781606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10781606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cambridgegreys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cambridgegreys.com
Received: from [192.168.17.6] (helo=jain.kot-begemot.co.uk)
	by www.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xJ4PP-008pey-S5; Tue, 20 Oct 2026 07:37:19 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
	by jain.kot-begemot.co.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <anton.ivanov@cambridgegreys.com>)
	id 1xJ46y-00000002MYI-39we;
	Tue, 20 Oct 2026 08:37:18 +0100
Message-ID: <e1418f63-6815-4732-b07f-934414ebd124@cambridgegreys.com>
Date: Tue, 20 Oct 2026 08:37:17 +0100
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
Subject: Re: [PATCH] um: vector: use kmalloc_objs() for the message vector
To: Hungyu Lin <dennylin0707@gmail.com>, Richard Weinberger <richard@nod.at>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261020072035.8980-1-dennylin0707@gmail.com>
Content-Language: en-US
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
In-Reply-To: <20261020072035.8980-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett

On 20/10/2026 08:20, Hungyu Lin wrote:
> Allocate mmsg_vector with kmalloc_objs() so the element size is derived
> from the destination type and the allocation helper handles multiplication
> overflow. The default allocation flags remain GFP_KERNEL.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>   arch/um/drivers/vector_kern.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
> index e902e78c5ff6..d6127944b202 100644
> --- a/arch/um/drivers/vector_kern.c
> +++ b/arch/um/drivers/vector_kern.c
> @@ -528,8 +528,7 @@ static struct vector_queue *create_queue(
>   		return NULL;
>   	result->max_depth = max_size;
>   	result->dev = vp->dev;
> -	result->mmsg_vector = kmalloc(
> -		(sizeof(struct mmsghdr) * max_size), GFP_KERNEL);
> +	result->mmsg_vector = kmalloc_objs(*result->mmsg_vector, max_size);
>   	if (result->mmsg_vector == NULL)
>   		goto out_mmsg_fail;
>   	result->skbuff_vector = kmalloc(
> 
> base-commit: 4ad423aa2108485f8bc5dde51fdf9c1ed979ee4b
> 
> 
Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
