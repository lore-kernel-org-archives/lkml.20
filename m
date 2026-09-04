Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E053C517BD6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788543233; cv=pass; b=pnbSpRfHlBws695Co0WCy/5pcn/Y/1iqGdaH8v/64fFLvba7YuZ1JDRx2FN1SezDdVY6PWrJ2o+AbZ9PcSsWQtwujuTG2ENnW3Rv7LSKL0b7si0G6lV8+k+fz0nvmSML+LTPv3qVyzRCW+vMyz5/PSWnpDpRRB+8rseYhy8n6UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788543233; c=relaxed/simple;
	bh=t1ktVxTbJlW2upQFhjIfSwuMOl5963W4/r7K4+ZZ0GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AG36LnUulaIaE1OuYKzaToOfjS4cn2gOVIZ3jxHDxJs1HlbPncZS1NKzF7iAHtZenJjEccWvW9A1dJ8ca+y9nyHydCZf7o0DslJtcYqnpF0GHbjxmd3PtGv43vSWxt/2Lzgr6SHVQg6IzaZ5mCKtFDuL02IPH25FxgZM3UE6oNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vmtdgF8o; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vmtdgF8o"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso62035e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788543226; cv=none;
        d=google.com; s=arc-20260327;
        b=NB691KkwMaowUCStJw+NpTVO15tpsnilEGJZhXRhjBsv4pdyBL9XETQGqy/2ANLO7w
         ltQy79UeJOYfK6+rAC+6oHFk0TPGfibCDdkPgO4iG6PnazLKZkOJ8igRS+9QPd171BZg
         dSeJjtszzGEkMw7WzxRGP8fy4yXwWbr9kKb4Ea9r3yURUEj/33McGXIzlEEUompmSGvs
         ms7qLmm+68X+yII7CV0Fq4DOEKWBLX7UBNql32dGHgx9azy8Bts320b/bgC6kcKdhShK
         n5IJ5jdrJIe1N3lBNpHZugGllyVk+s6mhR7OcEWU9muPHrT4bQKnAY4y2jGsYCbQqTsB
         OrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1ktVxTbJlW2upQFhjIfSwuMOl5963W4/r7K4+ZZ0GY=;
        fh=I9VAyy846z3rmYb++XWqd3zI6wlatS5tDbXK71kEB5M=;
        b=MxmtfUs7+s6FiwIYlDwW1pTowjCz5UasrpftctPSaXJ5HjksCuju52cItdPvrKQoF7
         pm48GObkngYj/6P8ovKsKSfCzfo5se8/ZRMKGOEVAeanX9Og8vuN4MuaJzrPU01Sn41v
         OSXNJmr1ApvGJti6ryae9+Jk4PEI6DGmaMtXqRQ7pC3M7kgyQI1xBg6D2BUyLrFBDaSB
         qW6/jp+IQwpL7Ifx9S3+1wJPvegdKD24jHXT1903knPw3DyI/WGH0n73gNy1n5Ico8qG
         M42bBnndND9VfISykDCNeXMlT0Ro7Xdx7aSOGd/bbMrVcOOg3lgg4ziyWJ/IMpAsm6vk
         Gexg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788543226; x=1789148026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1ktVxTbJlW2upQFhjIfSwuMOl5963W4/r7K4+ZZ0GY=;
        b=vmtdgF8ov2uBoqG3a0dv8Mdzk2995tbfWR2Bm6rAsoyU/HlfhTuBz/TUykRhS9AHsW
         AABZjdEB2i4TVr62kTdt0M/6NyxpHkEthbmMzG9wE6fj+lgOQYebr3EAczFMlwV3OKml
         KWuRSwP/bdVRKSwgDUxRj5lra+5BAhAQqvovsBcHK/soytqd2eCqqghc7saKAnv39gAm
         GfWa28oLfnQHJ9Ukn27/1UWQs8P+Rz8wk6jCJb0ZSNnKFG8gUSW1WZvI8BwdmFwrRUcA
         1sn1jSfBBi72hBs770W0kUJ0vjQibrk0D9NYzvAI3bSdu7RfW99a5QWIF7PDnzSq3iTK
         FbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788543226; x=1789148026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1ktVxTbJlW2upQFhjIfSwuMOl5963W4/r7K4+ZZ0GY=;
        b=QwxSN2Xk4vFwVJnsNpVeFHe9eSy1ZvNmIyD1LoUSUowrHVl2dVOjo7zKoU78Rgk+l1
         KqCrrGiNnjdw+zf/uWXeT7GPCoAFEkn8qlgCJC0gcWPLo3Qp+47gKM4YmS9e8u3iMqa9
         lPQDFdn1k8aTIxZBn8spcFsTVr3YcfezfMnAZI7VKVK4+CedfmYfgjhqSx4R4P6KTmLQ
         VHykCKmFQxmlC3Uo02XyronTLqj8ZbCy9Zjuzeq60Nciw8XaTaP4Zea4WzrHk8SimCeN
         ZHehBzGANJrtWLh4dDf+zp3Ka6Z22utjMbmN8rW41ASAZ2RFUbxg9MVnhiPXAXMV6Osf
         M1VA==
X-Forwarded-Encrypted: i=1; AKwUvBwVZXL/sAQ8uNMdljbW5UJahJqF5FwtJMSqPWwuCI45gzJm6hByekZVVMUT1eJqr5KNBsu5ygpEQc9U/rM=@vger.kernel.org
X-Gm-Message-State: AFuF++mmxXdJZVHL0t+U2do/5yLpGD8Q2GdRtbOfa7KCVqnfo2FwOgCj
	fYigUxzLuXKNyO+wM9g21T6S7ovqp8FeVbrWgpJS1xnjVzJRRl8CCiBlPowoWL1r/bF0NE0B7Bc
	k++ff1hBid25yixjshrrW2VgE0ThuJWO3hIQ8uiXq
X-Gm-Gg: AYBFou3EO7LVMUDmxIOcbZlw1Ezi3fqmHsNbhcfib2RPaVslsLidr86UUMTQFgCHRRe
	pSgVqgC87Otn1KmzSSAMVbzdoXFtQ4sFZLYcBevjqmJGnByiEFPgyGxypMl2Xl1GTiEVv3jQPi8
	hgCXX3bypuT81QyPJ3bWCTz0W3ju+D1LzCNbEdqFCbNaBgZfXlbt0+0uG2xoVllBl8r61Ql0N4C
	e3/5dx2CT8Xf+IngmdAeSrrM4H6nMXPj5etxcmL0AuJ61lCviPHK/5JzrWeCxIzzZvqTRrxAD9Z
	3u8g8KwGhiyVvJnrWQybCBkUtZGu+WlFWGK+eKberDjrWqW8oMOi9In82X44Dm1FAsYsmCSudpq
	bKorQ+m0EQ8c=
X-Received: by 2002:a05:600c:35d0:b0:499:fa56:f542 with SMTP id
 5b1f17b1804b1-49d01d85e40mr39325e9.8.1788543225025; Fri, 04 Sep 2026 10:33:45
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831234339.280376-1-stevensd@google.com> <aprp6GXv8poXXad9@gremlin>
In-Reply-To: <aprp6GXv8poXXad9@gremlin>
From: David Stevens <stevensd@google.com>
Date: Fri, 4 Sep 2026 10:33:32 -0700
X-Gm-Features: AcwNN1W259iSlNcdOxCm33dP0lK-4S0p3PqWOSOPP-wtwD-84kHw7ZoHOPqUqY4
Message-ID: <CAOiLmNEPw_cPE0QM1Q7CbNC8owW94PvejKo71Hb7DF=QKNN4Lg@mail.gmail.com>
Subject: Re: [PATCH] memcg: Don't call schedule_work when no spinning is allowed
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 9:25=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> On Mon, Aug 31, 2026 at 04:43:39PM -0700, David Stevens wrote:
> > Memcg charging can be done from any context, but calling schedule_work(=
)
> > isn't safe from an NMI. If memory.high is breached from a context where
> > spinning isn't allowed, use irq_work to schedule the reclaim work.
> >
> > Fixes: 3ac4638a734a ("memcg: make memcg_rstat_updated nmi safe")
> > Signed-off-by: David Stevens <stevensd@google.com>
>
> This is in mm-unstable and breaks the build for me :)
>
> In general - please don't rely on implicit header includes, if you're usi=
ng
> functions from a header that's not included, add the include because your=
 local
> config might happen to import it but another one might be broken.

Sorry about that, I'll be sure to be more careful in the future. I've
sent out a v2 with the missing includes.

-David
