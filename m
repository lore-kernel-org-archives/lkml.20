Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501643;
	b=cxFnUC28JO4zBc2NHDBWo7LEezmCVSv4XI4uZmAC2iPSt26NEWdb+7YHOGHfi5wEt1Mx
	 vX/b9238P34Ua4hk8dYinewM500KTw0GXABYS2CgOI2jyyECkRYR3Edwfwfh72w53PRoF
	 hXg/+S4JHq8gpqFqY1VawM4e2l82drAREQh9AeQQkA/BA0y78patn+LXtudTvw1Mffb9U
	 sDMXGvNHupfeEEIHy0ImJpu08lYcnUNwF9E/7b3zgOrT22FIN7KGC3CC8YgVR9O+fZ44A
	 k4qnhSHiG59+36zG/BDbz7LThCopWl7ryh+KT1CPze85RJZHGWuisquyDEZkPwt/nuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BkOan397muuCEgFMqk3a5KpizGYyvJYTBVZxmg+BXRc=;
	b=ncMq/ZK8G1l6HzmRi5/m1TxIh/lgBIA3ImzXxBgVnaD11Jvb5vgPtPtmLFoClBznXpkd
	 qRH0Kobq/UtKsZun7JWF/g1ilAbDyR+vok+6V5kU9yuIQTCZgfVBNM6Zb/2uNVg7eLH9u
	 iHChxsQCSrXsnak/vyzYHvnuYsPlZcq2Yj+2/+5D/K/BjA+2WwZScySGgvNRaAvMStFSe
	 jZ08ggl/MIcQnIDqXtILMo7Jd6IpIsBZafwo6rIzDpQakU4dFy48PeS2aVG9ojvj110/c
	 b7TzldhQk2zPVLwTFOzDC3xZ8sKnGw8RG0eaKjZKdetEFbKPfY3zAQVjha8KZkuPkzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SDs4UBLs;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF50606A890
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEF50606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SDs4UBLs
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c445c95d553so113336666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794501641; x=1795106441; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkOan397muuCEgFMqk3a5KpizGYyvJYTBVZxmg+BXRc=;
        b=SDs4UBLs8K+VjxbVMuyDqEl5zUuMDK9ggsUXvnQz1pos5mVBEyvYqIDryIxaZd2hpy
         CmNO7G/qHDbuCVi5VNux2PBpO7tL23O8bqYCqCLy1wtM/3nT9DpJHgCp02ylCFAqxiP7
         FdCUygkucjmz9Eh2Sa9LMOmx3U483RJJmjCFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501641; x=1795106441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BkOan397muuCEgFMqk3a5KpizGYyvJYTBVZxmg+BXRc=;
        b=di3iOd5qzrmvTp2nubMnuvtTEgAUV1+MKu54Jto4QFh5bITxJPCvHJMDS31xEu7n0/
         c1cAkx8sO2LiiBa1iZZRl3OoAKi5EAEN8ZkmQniVsjxMvRL5oJmWIZofL+Vd1CMnfjii
         8FLmc+Pvdt3RTFvhTlCgmOBxbEsgXv3nkozA0pY1coPuRPEsXwj/EHfbEGSd3qmhATOc
         wkRIiGryIJT9r0+wOHlQLAE4mN8vt2urzN2HBFz0kcwWi5+0atT+UnfnUjI92QjMF3Bg
         2MGyQMwZaP8JVYpAOOPswSy7y+N2AM/c7vc9lrCqcl8v0nOHkBflPirX/LtNpFiXBPID
         7D9A==
X-Forwarded-Encrypted: i=1; AL+hErEA0m36Ywrt64uWdtHbXjzH3X7dLRdHtr5dwouW0VmoPaY1dU9lVfKCeOgb3EC9hThgS0Pd2GfMKXcvfzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x6GxRHY3EyRQobzKfvJtwSClsYTbSxq87DySjtAkPxwKUii87
	Eh9SnaCFj4brpGVQnwPDv3GUUxT9c+Szpl9CKSHPlU+YAAIKyTglJSe+oM+3ZuBc7a/MdenzGRE
	K12ae5rO+VA==
X-Gm-Gg: AYBFou1ZIlZ63rr99cSlCHbXcnHjmyEJkuwcSylY4cZqymjG4bRzh9X3YTen+zF7BcE
	TOrIXmpJYcxrUvxlQEdWWBathqt0jfgkArwfapP3j1zxtfQ0tKBkuI+Ao5tJg5ovm1+s8zlRVlR
	IsOh3Hb2lSC5qRQXmt/1u9y4Rid07QliFDxZx4umzx45cQq+HCV3RP1WxHpBQcQV4lBixfc6cQr
	ptM+h2uyYyVZPrQgdMWhlyQrg3Bdbgu9tmajJwP2vWNVrcB4W3yc5/CPvblmxOZYEYrXPcTNgyQ
	vKtlZ+QAvz7mSD8s95IIA+rPelLWbX+3xoQC+J2TnlG6a/WVF7ct8L/nu+749Kti70HTTC5KwVw
	XDwEe8oc/Zn226XpAuT4AG5GOX1mWgwKvmUxb1KLak2JKgcpdAFY9vN3GDiNke47MYlCEv4mAi8
	RdJ8DEt3e8F0Oh4H2q0VgxIVX3OFITN2SwFIy/DqiM/dbmc/AQfEY5KiwBM1kZ4bmMLjdoOflZV
	bORBvwdY5vfoKCDMXBlJAhNpKaDhc1sensd6KdoJANU9axEOS8P667fjQgNwOt01oide7XDpk1O
	tNdI0b9uIyd0NzUcu9WrCjn3O1WVAvghErxpPTJUpuAAV3uoWKYEMGMvu1OI4xlteMwmXdMz4lX
	hQw==
X-Received: by 2002:a17:907:1b03:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c506684d385mr517521266b.2.1794501641238;
        Thu, 12 Nov 2026 08:40:41 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffd8sm379853766b.20.2026.11.12.08.40.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:40:41 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso4931005a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHLERFIr8xc0ZMiQ3YuEuu76/VorvpHCiX1xXqbueuOAlsCFv236AtT3nrsmqj8lb9gQ5csvngKgIy3EmU=@vger.kernel.org
X-Received: by 2002:a17:907:96a5:b0:c41:e75e:5889 with SMTP id
 a640c23a62f3a-c5066b5bba0mr524017266b.33.1794501270421; Thu, 12 Nov 2026
 08:34:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260914223212.i.829-kees@kernel.org> <20260914223219.901347-2-kees@kernel.org>
 <20261112004039.GA523044@killaraus.ideasonboard.com> <avWNCC3_Ff0knO6J@devuan>
In-Reply-To: <avWNCC3_Ff0knO6J@devuan>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 12 Nov 2026 08:34:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com>
X-Gm-Features: AclHuK9Nmkkll1Jqx8Ewj5iXnIEjw3xkEvFj8OVOVXeQp99rrxeYYFJHUsjvVTk
Message-ID: <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] devres: Provide kmalloc_obj*-style API for devm_kmalloc
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, driver-core@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 02:13, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I suggest removing kmalloc_obj() entirely, and using kmalloc_objs()
> always, with a second argument of 1 when we want a single object.  This
> would remove the risk of that typo.
>
> I also suggest having default arguments without variadic macros.  The
> way to do that is using empty arguments.  Linus complained that it hurts
> his eyes, but it really makes these macros much safer.

No to both. These are both "make the code worse to catch errors that
the compiler should have been able to catch anyway".

If you *really* want to catch them, make "gfp_t" be a 'struct'. That
way even compilers without things like the restricted types that
sparse has will catch at least that one.

I did that many many years (argh, decades - I'm old) ago to catch all
the 'pte_t' etc issues when rewriting the MM layer, and it works very
well.

It's going to be somewhat painful, but ti might be worth it. People
who only use GFP_xyz flags to pass them around wouldn't notice.

            Linus
