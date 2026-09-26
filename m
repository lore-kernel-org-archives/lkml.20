Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF9E38A72C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395216; cv=pass; b=MXYCGjHTHiHedBUIw+FXqHe9XVziD87w+0O2RgzgniRdvEB7DvDjZKZInJvzQvITogCOQhoyQa6UEkWC0NGVnWCQYy4fsIVpfWfnB8k9uxb6puZA3nB+Xx856oQodYF4ZpHYDmp5WgPNibp7epI31LNRwOQinpVlC6ZIBq74g+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395216; c=relaxed/simple;
	bh=8Y2bsAkSTZILhk3+rv+DzLT4+GI9Kjxt3IAQHjbMyP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obqMjFMVgQsJz3JR+kUf171hsMOJTSLaG3fs35nPPGmBZGimp5yjjUFDYcK3xPO56jIxYHxgho7CQglu1wxJFHixI2q+mIcUlQNy6YWcRItDHtVksUsMPwjNMeeBPOOmZGgWfJ9HhSPlA9v4ECF06E/zE/whxrrT3fsgMY3QkHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XXJeHREf; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XXJeHREf"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so890659241.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790395214; cv=none;
        d=google.com; s=arc-20260327;
        b=J5E7aAuDHQMLmmed6FtLCZ9TjrB4+qv5QeWy/8QNelVesNaYiXa57WiXb3WeXghMjA
         pDjgJu3ppgBcT16GuxDYto9EJFWCcgTK1hAyd67gNqbEPQM8UeqzboiAT3p84tQ2NRp6
         oebIx0eq2H44EIL+NFJJMBge/w7Bc0G1GWdaY9gWD6RxHI5gmCGnJHMiN7U/6liBcCmi
         CPxtvFIZLwzcyAjzmfHQUeqXbHWj+0SyRbu+pcLyPkOoYIcRzEd2ZYc3StzUzmCqSKMu
         EcsoHk7peexhan/FABJp5sFFyuy+D7e5LToTKUtNtDY5TV7qP4KazkWNxF6d4sdR3kQz
         +6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYpeyRZV+TWw0zn+XSYzCNOx9+tm8LCGwN/L1KGsoYA=;
        fh=ZnX1kPRlvxOqwIO8KK8aD4bBvL3iTQuI3B5JlxKo5YQ=;
        b=XTGCkV6FUYE706G70KiMcJs7omqKdpfkYMNveVNhQSdR3rA1FqHQW/DnCqTKE/sVkp
         sbn6cXGdK3ZqhK3pI3YpRkpS+Se9QaMSVClhXzlHlIsDu1uq0UcXdrswd7hvZsMGaJRI
         Yk0vjHG8HseWNxD6hT+/FkMa3cennanwAhck727Y7SFMLuDGnMcbBZOwMOj5UVvgbEy3
         D+oY6tKuFm8YKWj8rcoONFNtZKjFyBOlCE9ZjW+8PHXQ+WvEj/Kzw1IqASMh/6WxEY+V
         0PE/hMye0Uw3jQe+ESdlkKBrqXQy+6OCPeVkgrB47O4/dEkb+xF85H5NAlGuJ12i9aet
         iilA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790395214; x=1791000014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYpeyRZV+TWw0zn+XSYzCNOx9+tm8LCGwN/L1KGsoYA=;
        b=XXJeHREfGdGEpJLhlZEr7bLdF64uLhvzDzfpdZ3JpjZ9Hv9jkgeIyW49aNUkLPnAbk
         V25bb7JZdufoj22umFsGgibbm2lhNsyt1ESZJ0B5NhGfA9bOQnhw/wQfDHS5hwSS+OAv
         1Gs6KJHF/Qkb0Hy1Tke3gEoL6F8ToD7NDqNZd6YIKdXDN78hhoWBdSrNFEPjacECWtVu
         76+7+9GpT0w+oywDNIfTsPI3P2Q3yACJIAVl2cbKIFKy44kWiZsRHzQwBfK5WMajZ6s4
         q9G6vKTotqW4A7kSZn73G5hxmJ5CBKTaRluFdaKIvI/UBvlzNBdhFf/qO6HMLxccqYyr
         rQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790395214; x=1791000014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYpeyRZV+TWw0zn+XSYzCNOx9+tm8LCGwN/L1KGsoYA=;
        b=K3zjcv91K5SnwGTkt9kwE0A/BWSzkncDAYZygdRVXWjgeHTG/MCrB+6gx2Ngr8RjC9
         uVU1ZSWcAfChNR3YpJriEdlmyAQFDr66pdgJKPtbmi6eykTETf0y5xy+lkyHftJk8ArN
         GkicKdranvMq5sDfYAzQOx/+96tGUzaZVJIKEsu2k4ZyiwlCPkhDzmuSub/LkahfVfAK
         fcTcBz1h5k5YV+et44pU7RpCfwmtxviF2sji3PbAUl0F78hMWZSMC64wCtjIhWvHogbT
         znGSJXY70n+5TZO2czZ4Jc8Fpe8LDeCufKEFHFZObyF1Rl3UU6J1SIeXHWmjIVqp3QGV
         o4fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfCji7/r1NFNgJBaA6XAVQxhHRhq2p4rO8nOJxIp+rx4GFB2Q3xW6ZFtxjR2VL22L6LvJuoRID3PO6g6o=@vger.kernel.org
X-Gm-Message-State: AFuF++mlhvwUGipl1TTBt9IjH8O9vk3/keFL11/brLv/5055Wt0Fne4S
	mMnvFAy92b/QkSJxfFJwCZQ6Gwdf4BWlz8LyNAhxZD4vXbbCXQbXrhxjREGtf7cbomprZu6U2DS
	x01aBFtnVjtfMlZYJ+Pa/LMIMXTe1N1m7+OZu/s0=
X-Gm-Gg: AYBFou3BPuamabFSAwvajOakjJZd8yaS+9e+/fwyIA9Xp40t6RvS8RIiR+ZkMn4xn49
	RyK+Fb11EjMNGoJNl58ySHsMAByjP6bnMrr4PRozPuHHh1kJmzYYs86IkVYCA6dUtPJix4MQR5R
	4O390uuRZ3sVK2SRn43htBRuIMbh2v5DhKTk/dGK7t33u7MAmBy0VmkO/tcmxs23aEEuP5DIBSj
	n6f3o4rHWkfEWklVulbkh03oOWePLvFsolYInt238lm+wv2gZnH5Q6i2a6pszKZxEc9NWyrH6Ld
	cA1S3UF3dNedRvYyTv1f4cZBl5SgeFLUqnyWUv8uyilOLuhL52EFwfZcbmr1JYSTGsrfAtXjNel
	G6mXj2E9/cYDPzUi5902r
X-Received: by 2002:a05:6102:290d:b0:7ae:da60:5dfb with SMTP id
 ada2fe7eead31-7af1bf73808mr3668288137.13.1790395212940; Fri, 25 Sep 2026
 21:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923055320.2602534-1-morbo@google.com> <a51283e0-7d55-4d06-bf7d-3cd7b7a21faa@embeddedor.com>
 <202609230021.7F6F2140@keescook> <204fb990-7b45-4ce1-8e6a-260538bfb678@embeddedor.com>
In-Reply-To: <204fb990-7b45-4ce1-8e6a-260538bfb678@embeddedor.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 25 Sep 2026 20:59:56 -0700
X-Gm-Features: AclHuK_iI1gG_woeJMTGNDN_cmjTZYiMNuN9pp2RmlztTl9u5AsCWNOE4zKQOyY
Message-ID: <CAGG=3QW43-Kez+FkRM=SuZtbJ_ODgVXY1nrtg7BTYG_OgP3kBQ@mail.gmail.com>
Subject: Re: [PATCH] Drivers: hv: vmbus: annotate struct vmbus_gpadl with __counted_by_ptr
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Kees Cook <kees@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:02=E2=80=AFAM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
> On 9/23/26 16:23, Kees Cook wrote:
> > On Wed, Sep 23, 2026 at 03:10:08PM +0900, Gustavo A. R. Silva wrote:
> >>
> >>
> >> On 9/23/26 14:53, Bill Wendling wrote:
> >>> Add the "__counted_by_ptr" attribute to the buffer field of "struct
> >>> vmbus_gpadl". This allows compilers (GCC and Clang) to perform
> >>> compile-time and runtime bounds-checking when KASAN is enabled, preve=
nting
> >>> potential out-of-bounds accesses to the GPADL buffer.
> >>>
> >>> The fields "buffer" and "size" of "struct vmbus_gpadl" are assigned
> >>> exactly once, during GPADL establishment inside
> >>> "__vmbus_establish_gpadl()" in "drivers/hv/channel.c".
> >>>
> >>> To ensure that the count field ("size") is initialized before the
> >>> pointer field ("buffer") is assigned, we reorder the assignments in
> >>> "__vmbus_establish_gpadl()" so that "gpadl->size" is written before
> >>> "gpadl->buffer".
> >>>
> >>> Cc: codemender-patching+linux@google.com
> >>> Assisted-by: LLM
> >>> Signed-off-by: Bill Wendling <morbo@google.com>
> >>> ---
> >>>    drivers/hv/channel.c   | 2 +-
> >>>    include/linux/hyperv.h | 2 +-
> >>>    2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
> >>> index 7e4cc6f55237..7042de2dd481 100644
> >>> --- a/drivers/hv/channel.c
> >>> +++ b/drivers/hv/channel.c
> >>> @@ -548,8 +548,8 @@ static int __vmbus_establish_gpadl(struct vmbus_c=
hannel *channel,
> >>>     /* At this point, we received the gpadl created msg */
> >>>     gpadl->gpadl_handle =3D gpadlmsg->gpadl;
> >>> -   gpadl->buffer =3D kbuffer;
> >>>     gpadl->size =3D size;
> >>> +   gpadl->buffer =3D kbuffer;
> >>
> >> I think in some cases these subtle changes are worth a short but
> >> informative comment saying that the _counter_ must be initialized
> >> before the first reference to the pointer.
> >
> > But that's only for dereferencing it... there's no ordering requirement
>
> Ah yes, I got a bit carried away by the change itself.
>
> > here at all (and I think swapping order is needless churn). Neither
> > order is correct: only having them both set before dereferencing
> > "buffer" is required.
> Yes; maybe this is something the LLM should learn.
>
> Thanks
> -Gustavo

I've explicitly told the LLM exactly this, but it either forgets or
ignores it. *sigh*

-bw
