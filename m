Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CBA457E5F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162092; cv=none; b=sj/aqEhrpUAqu1TJVuO/aTNfxN7yjOAjE5Ct6sgXn+EJzuomFh8Hvle5TC5TWANYZM6Kw8L0LbXGfbmPUUalnWX5eeBjniPnzhny0Rvs00Nba17q6iYMlTGu7sWjwRr2k755BJU81e4WdeAd1jVoFzj+toveP0ZbAC0TKFFItWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162092; c=relaxed/simple;
	bh=BS5NUD8B7TDnufIoVAw2G3kS1xuEK39PCTVYiKoCO8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOOMqbQ4kH9R4bF9wECR2dbw6kTlCd7WlKUaCpaoqeRla0TQPfVg/JZLVRMgXNHh2oNuprAbq4h0B1eZ9NVKYl3/gJqUjJEKuCdctMnOEhlMi4pkH+UkGwGzdaCLkqN7T1zwktPcO+nEO2DWnyGTVCSvEFyuL8vUMgJ+CALL8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TRjjXcTe; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TRjjXcTe"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso322069866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792162086; x=1792766886; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7M0vWm7aULNLgXxZt4UuGQxMmmFksGw7QzD0jlXsto=;
        b=TRjjXcTescFL15dJAwi3hXX3kBNPLzu4jWE1R/hsHhcMMGse20WD8Ob1uCcAHfHP4B
         Xo/K5zMKGBD3fi4Yt0KiueFwIyyeI9Jw7n86OrqOiCqqRayGMvoALGgk1/vvo8zXZUVj
         rm73LfHEBRwc6jf0GchWkGLs0m1/XUXoYZQtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162086; x=1792766886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F7M0vWm7aULNLgXxZt4UuGQxMmmFksGw7QzD0jlXsto=;
        b=S0v6e6GZI++v3GVMEHY0gnzM94DNEF8Yz95s/8dtKFoWfoWJV2CudIPURTtod9RdVu
         jViL6k2gBJwRzqL//sHZGFmCUYtjCV99crfASNzOuL1YRiYbsUMA1fZe+az6ghl4byqa
         F3CwN9kdIuwwX+hSjHOrUQM4lYYWaKWWR0ttt2kAM53I+LTElarn3KaFyzVfF+zbk6pz
         LjhcwtK1O5vaZwfpuobYVmaWPTdYEy68X+MPn3cG9z9UDYDYcN1KOMmd7WOvMYjk7CxH
         ENIxrFg+6IOBl59ALJMWyOPHtH8hXLY1ltWluKpufABBa63thuuIJ3xx1Doh5QmD3/lE
         oDcg==
X-Forwarded-Encrypted: i=1; AKwUvByeMVQyoHIMBrgfyLX5ihPXBy85Yx1JRMVrvKDNpHhuZXyYaaU0NZDCCjdAA/5/agiCgzqiFwPGrJMe99I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOrYOZwX7RDd49xONhuBF9dZpNIdrc1R+N38CDh2/FEtI9vQtP
	rY5ikYWezct2bVIVd/p5nvTYjtHD5vGDqXoqhsE2QOuSKewKYjFoM/MXIyP25eZ7En38nkPTbxD
	y+xD8+kk=
X-Gm-Gg: AYBFou2BB1NV0Ufeu3rMbiaianMEGyBbftR9MjmKvoR+kOJvOkSubq4m9ZIAU2vEUtI
	zghr9sN5KTjihUWhmxOEvRtLkCquoOPUTl4jtUMPxhb890k8g9hAvXOIUIbQXkJ2xLBHa9aPVKl
	cZb9r4fEImV5GDwhrZ68felzzL2duzveFuDJeM+rNt6dc5xqBTp+oveUaYT56H0c9WoOoWCnvKh
	pmILg0X7blw5iGrzb5uZ1KbFups66sVMx41wHEH3TCGZa3bGSn10j4m458kGuJVosAnwCzVudS9
	zhLCZYqp0kmzqnM+lBA3Ks2hfJAZWoyAAqKOHYtxfLPAnuswWrngQKBYILzhntoy6lpQfObuG1l
	hfWMSNoQvQZenwQNaQ09AAxKFKgOcx14Ko4kjtLSCL6e2OybfrJqWr7RMjhjpqaIKcc1URp1eSF
	j9zFEhuLyWAg08P9oPW3C7isC/vw+1tZlKux0ReM+yArCd28jfbRP8fo3ZfYgDjpT2t1OZ+U8vY
	+UqtOc2qfq+9hUSwV3Uhps18dCAJX0O8wOHfqjcoG/SRKJ2
X-Received: by 2002:a17:907:7b85:b0:c21:1b58:fa96 with SMTP id a640c23a62f3a-c419a93bd77mr5482366b.3.1792162085840;
        Fri, 16 Oct 2026 07:48:05 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb39a3sm78261666b.81.2026.10.16.07.48.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:48:05 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c3156e7705cso555481866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/4thObJYR50apbXpwflGF9M1AbwpxBZmUYLBhfa6TvlpWTUwX/KEZ8ctN6t6OowQTnMsd6rwIUammcfg=@vger.kernel.org
X-Received: by 2002:a17:907:2d2b:b0:c33:dbe8:291c with SMTP id
 a640c23a62f3a-c419e93b378mr2200366b.20.1792162084848; Fri, 16 Oct 2026
 07:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <atI0edrmeiRuRtNQ@thinkstation>
In-Reply-To: <atI0edrmeiRuRtNQ@thinkstation>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 16 Oct 2026 07:47:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wha6UNEv+7nVi9zSxa4p=4K-HNMZqxMR-RcspjPTxYp6g@mail.gmail.com>
X-Gm-Features: AclHuK94Cpn1Jujqx5J8oKvkM5v_riGLMBL7QC5OrYhuF36dOCmhroOGOljhXgE
Message-ID: <CAHk-=wha6UNEv+7nVi9zSxa4p=4K-HNMZqxMR-RcspjPTxYp6g@mail.gmail.com>
Subject: Re: Improve page refcount scalability
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: David Hildenbrand <david@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 07:40, Kiryl Shutsemau <kirill@shutemov.name> wrote:
>
> I've added a cutoff to the lockless path: if the folio is large and the
> read covers more than four of its pages, leave it to the slow path,
> where one reference covers all of them.
>
> Sounds reasonable?

Sounds eminently reasonable to me.

              Linus
