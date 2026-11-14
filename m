Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794685640;
	b=llQ3AeB+ckCXBH+mLvqOtSPciigIsttrpd45HLpfsJjRzQTojBhYPtcn5IMad4ndlgSb
	 0v1s0q/6A8yQJPozJNjNqX5YLsmI3mumjBMLLYUPggdDLCz/Wap/37fhC36rD3MIPY1rB
	 OzM9qnKr1mduFxecKsD4kSUdruzWIa2Kj/ev6/oVXYIf+UiIsxAwSmy4zgENOVKYIT2nY
	 0QyO9ac7sZQCCPcGGTo3jAKzh2LsLNw3Bkai2GjeZYOhdAYolxsKAkHRfRpqen+Xn8X/V
	 F9++xyo7z/pslaP0PaexGzdBMykmympvNnXEFlavrMphjPePynmQcpqRdCVHg1yAhvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794685640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=98emB7w1WvhIxOBHV30lEu1AvQx3qKoZ54Faa6ikAUU=;
	b=PhA2N/AHiO62e+R3bnuz5nNTqVM34Q8+dJHjQLr0FuHsIXJ7XFGEuhg3LH8JWGZ3oDwX
	 evOylZvRGHlVNADC7su+C/UgHFNyCyQf9sOOqkUNLDyKRAm4VtzQC9lNQRm9KvNm9pyMa
	 GPBwXg7cvusXmTyDLr2mmI7t2WlPZY8n4se53szwdNGA7LjklNQ5C0WwPvqg2c49kY1Qd
	 sYsgutNPnpp2xHwY6frium044LZ2AqAUPILsRu2U+YGlJ4HbhZKFL/f/7nKe3nazJUz+h
	 fDc22Vl5Bt9tbSAZufiUz68hrXee2tsvrWqNGoZCz+FFuZWYefZIHR7ZVGu14G1NSIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HRSop0go;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82319606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 19:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82319606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HRSop0go
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55b8cd4e2abso21761531cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794685638; x=1795290438; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=98emB7w1WvhIxOBHV30lEu1AvQx3qKoZ54Faa6ikAUU=;
        b=HRSop0gomPkWZTRZBAdHejFeO7g0G6CplVHB4la4HAb1SY1REw/e224LvSuyqvNvyQ
         yzatCCBxfct8msr+/dNeheh5p3N7tiPbqvP9/VwOo23Obzih73TYvHvism04ZV+68y25
         eMAMd28kW9Oy/Hx/LgerdTMyytJ+ab5y7zS5DyIvLVtKOLOE1SNd+dAUk2qAzJvEdR4G
         YY53PJothZjZqbyFslwmeygINF0tHPlGQd6rNIMMgki+RVReiqKdAn6xeb37fWy+hU9j
         j10qW0AMTQbNSVjPCwe/9WwK+rmVX0/hPHUsFQZIrUYAYboMNSCbssuJJUqSjjd0spCJ
         2hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685638; x=1795290438;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98emB7w1WvhIxOBHV30lEu1AvQx3qKoZ54Faa6ikAUU=;
        b=uhtEVbdWGWUgTwkHL74OoWWl8Jz7E87LgmT7LzLDB64ni4y82/qqe4UPTyzf5okX1K
         6xH4CeJc/Naw5X0Lx+dMltnekU4rJATsWgphELrnJvBVJpT5xIpQss5YxP0ZQhEreuGb
         Mu8kZH3OSOWHWv50kXnKhFjrJFAOky9e/WGtWZrsqv4KIRJ4R4SMlTdULkGDdmRQv5MU
         xTJBRu3bcc5Xt4i9kGDdQ5V1C1tG2eQvOZ83t358T+XwcliwMnYRcF3hXHZCOcWUPmBO
         52TA8HCax88WwUfgIZk9hd9kbhVTPS2XtDwmhrts7ZPTiNkp45QQvIECr/bf8gja2HHW
         KIdg==
X-Forwarded-Encrypted: i=1; AL+hErHI/Cm+mh98y9fMvwIJtiNUR/Pmfo/JldpequaYdrQZLCLcI1745xnuHh7/hYia1qOsba2h0LjUJexvAQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gH6rq6Lex67ii7ZqhUa86dcCllyaOCiKuccT2AS/GmPAfFoRh
	X5WmTOSepvvfRhWOsGkIO6pCDpz2IKjJirzYzphIGAxm4iTvADoUROdSnXoQFyiarr8=
X-Gm-Gg: AYBFou2jZ8Z5NZR0kHHMGKiRYQo3EMv6rVBfKnjNB8U1qDL1G8PmmtGjUXR9pSNbT4U
	afv1OqnNn2pgkdg/oZPSI12dMKbxy8s+MjMJbYKMvO0UtCQFwLBQsI0X5gszI0dZLxD6c9GD0Qw
	M8dXpBZHv57sKdTJRvTAJGPAuDu6l2yai1Z2cvnwONzcGgxbQUVHPpOTiY4GzCueQa9Zz0zKe2j
	j9V5GO9YuIZw0Qd6w46LG4TPVWzaj4waL0xIgvg0HomIGzbyZsYItDHKNGvML0PB3vWTmMTgC0i
	iloztZW+p6zLC5V7zGHR8uF0mKgN0roN89QC51ikbEmaIcFvq4EhMYLF1p/rz1YipnDFKS8gZVH
	JFQe5lKH+uKhROh8RBoKA231gb3Dw4nYMiW3pw3zCGdCJaT9yXkPHKzbSyf+2O7S/EUvsO7T+73
	4V2Gpa/uo8m/BG6BC+3OMmWXkbeJqALAsQOwGfDALmuknIUG57UZ75YKFavSfUk2+SamI0NlXdm
	sS+eAUPn+ThSRIWexEm4xlWoHVrqiEUNQwdyCEwuK9xOw7Zo2I2hSy5Av9czBXzY+DyV9ZyKtgP
	kWKeM54/lXRbdRyHwDP+O30V8iqdPL4Cd/J5pH0NRrpqISyu9qiRsjMp86MVkMXrVPEBW7D8+rc
	sLutW/wc=
X-Received: by 2002:a05:622a:191f:b0:536:780e:8f42 with SMTP id d75a77b69052e-55ac7466d2fmr101182171cf.33.1794685638449;
        Sat, 14 Nov 2026 11:47:18 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm49222936d6.28.2026.11.14.11.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:47:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/vma: restore VMA iterator on full-range merge
 failure
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: shao.mingyin@zte.com.cn
Cc: ljs@kernel.org, akpm@linux-foundation.org, liam@infradead.org, 
 linux-mm@kvack.org, vbabka@kernel.org, jannh@google.com, pfalcato@suse.de, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261115025832904-wsPy8LPoyIcDJ6FMU1_H@zte.com.cn>
References: 20261115004655564ix3vefI54RZ3HhYOmxuKX@zte.com.cn,aviVQ40at8rZEyjW@gremlin
 <20261115025832904-wsPy8LPoyIcDJ6FMU1_H@zte.com.cn>
Date: Sat, 14 Nov 2026 14:47:17 -0500
Message-Id: <179468563735.482102.182237761852902643.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-15 02:58 +0800, shao.mingyin@zte.com.cn wrote:
> 
> I would like to learn from the technical feedback and improve the
> quality of my contributions. Thank you for any further guidance you
> are willing to offer, and again, sorry for the interruption.
> 

It's a matter of triage, attention, and respect for people's time.

If a bug is unreachable or so low impact that it has no appreciable
effect on in-tree code, mass-driveby submissions take maintainer
attention away from critical issues. That is a net-negative.

Exporting this triage (mental load) to maintainers creates a strain
on the humans in the loop.

By the time the patch / report is read, the damage is done.

Even reading your patch message, it's unclear to me what the iterator
position being off even means.  What visible effect does this have?
(None, it's not even obviously a bug).

You may ask why not pass the patch to an LLM to help automate that,
but then you are externalizing the token cost (and someone still has
to read the output).

This is not intended to put you down, just to illustrate the frustration
that these kinds of submissions is causing.

-- 
~Gregory

