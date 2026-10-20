Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513399;
	b=rjAzMcFfornyZN9aTRw7inlz/gCUnLs173dsnPE3oiLx4Uj88pj8ifcx2XO1oJarduwc
	 HjrHTr9SJXKVaP6nsPEqLxoSf62Bdn03p59+am1oJQJA6ciHWDSZNaAWJjpk0dMDVnBt7
	 Ap0BHhdI2mqyHl4L1J33OqEIp1G15ey5ruKts+ajj45vprRkiIIIOhRxyOgGVmOcrjbVc
	 T97YZfCVqzMqo4ovv9sQ+swORXD88ywQ3cziy59+SScI9SqfyB0r5r0ETIPzQrUnOD2wQ
	 0zAGOUYJijuHOfT/TvEmk7p7QxikB5/TtuH8Zyq95P9v7/rITUR3RxIFnuLRpA/I7Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0jCj2axNyxSFURiXpH7V4N8DE8GNJe9dPnJmhT9P0cA=;
	b=Xj8wmo6hU/PK7/m9bOP2OE4LTJAmRuL/JUSgqt9s8CDK15nuK84qqlCY8/g9Yup6o4rL
	 YopxovqsooCMUgsR7Rr6ax+B9eBkU8EZ4r27ezM21lt6OCcBsGVxHJbnILNQGznmcvotm
	 /uT6loaz4KNddQ795DTuxCZ4/N4SN9mwljV/syomtgvYis5g7CM7tZ65rtVyPrwpdth8c
	 vB02D65blhZJrkeFFCgAcgbbwtQIQjIVn2mi84xKmwKmKpzgDuLfkDeNuuBOeuKUhGrD2
	 hFtWiE6Axoauyqq1ZajMyczMPthiES2/UUrwuw9HkjYqJ/h7p+UFR2kqdtjCYwxX3tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Xua+F94x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB562606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB562606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Xua+F94x
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso12402a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513396; cv=none;
        d=google.com; s=arc-20260327;
        b=XiCP3AOUZ9t8k41P7EBbEliaiHGjFh7BQ5/DLY2fcfwCdsoSLI12b+JUdiQCpu8sKa
         URThQlqbF+NY/YbMnxbYDr0xwI+7DwmL/IrpsaIZj5MMoRhdlFW0t5vLlx5pgQ18XcL+
         UVuAVp27kvnIY0xrsrdJaja2dFTpIRVDeOtBne7idwsC31meqYjBx9oeYY+VjSSdEXgG
         ZpvhRKGBefVM9jgEQGQ+6H7Ee6/5j4f8HhNPODn3Guo7dJRKLAru623MLO7ZDOsZ5ifj
         v1HzmcDpxWkrAHgRr+2nua+Qwozn/IU8SfYkj00qcV119SxN8o33qNAPG5anY6GINyok
         VZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0jCj2axNyxSFURiXpH7V4N8DE8GNJe9dPnJmhT9P0cA=;
        fh=G061GSxI9RzEVoUQKKAVtctsrNq6j9plnY/yp2ceiPI=;
        b=sUOItKu7SJf/kCexdSpJZ1MY8s69HiJHdRXI8+Ls557WbIezorrRgp4H7x9yys1N9W
         FOdyiZT38k4rbLmIG+e5ZLNXjWUy+XqZJLtQxHMIecbKaZp376irLICkGwJ4l6XVptqL
         n2qFDtoTE2on2JV8AIddJcaMd33TmG1wkFsK92+Mmcai2Z/fPRZpLqy/0xlomT1mEBgA
         6oDCqONPcdMSmF/7xSUaTQFN92hgZqdw5693gUPWhHpNrxynaoMCujsB+sqKAFJ3QNyp
         G5ZEw22dYbS4g1YKAfIKnUNgih0jr874Sh7W7IylQr8sZvgtpBVxbA44mbnJ4+w8vfqW
         I1WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792513396; x=1793118196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0jCj2axNyxSFURiXpH7V4N8DE8GNJe9dPnJmhT9P0cA=;
        b=Xua+F94xPs4SLRFvPHZvf8ENdD6xQkEFYVjamT9EZRzYSfJtvS7XDtwmZyz1gTEJ0Z
         /WkxlqQ5rxEvkZKLXwDC4ALxhuuf3lvKENwOAe2FrlDflythScAJ0Tn5Atp7/sUdwsFJ
         E5biZmC8UmGgW0KNyTHjULGeLnoa0QbAm6UUD7R5xj70LVhv4dsixEwE51Pjds0Owm/s
         yh4EPRS7zc5XwowJlsvmHsNHogBe1Cs3eCTy7l+wjYHJVHHx8KQKzvWnrNZKclhTNIQm
         ckqTqXGWGJiMJjLhtJ75lQ1ZbkeOSru9OrP82Q8PUanZ2j0r8yLVhiS2BLjqoKfeus8q
         kXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513396; x=1793118196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jCj2axNyxSFURiXpH7V4N8DE8GNJe9dPnJmhT9P0cA=;
        b=GeLV4BBeLQxFTzkrG5yIe3VLcf7JLPhUanuTAJ0ACO1QXDw5K905sHMIsY+JGsx6db
         l6E5lfn9FytQ1FAVWXdAKG15ylpvJ4EFIz0fo+43HsqIRxOzj9q7tmNQB4PJmUScqT8Q
         aaV3qM90b9xXOp8mMiDmRvuP91KNDWzjPdy1TjbS4USJd1JvUw90aSejyqB6Dep512zl
         aptYcLAkvHsinN44cDDXhqrYIqh6OtIyCED9pY30OsSvlRvq26/kxApMoNkOhlz6EGhA
         VulMgHbA2EVlakQR2FYsvidNi9YaKih1OIKo+IJlFcXlM38belpwsOrOW14L4QW+vVdI
         NxhA==
X-Forwarded-Encrypted: i=1; AKwUvBwmS3gnpTCGTgHp9McPnbTPGTxr/Cm2aCdS64PuqxoGkgJRgfQKnZNgW6i/p//cJ9tIfyz+Kjof07BrWWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJW1dtUmqJyBjsDwgVCgEbtagQC1JcsJfzydytHi5TeCr9uUn8f
	Q3YUz8kdu/c5YWAJlb19iHrClKTrZW+jSAzX1032GqSW1FMtfIx0iWv0x5ZuzwlEjmKAOf8psSR
	k5jq/3xw84p2eTcxL5BTE+Mp6xwXyklejoxywWj1N
X-Gm-Gg: AYBFou3SD0YsCNDkdL9M4XF5CAAgtdXi4AplFB/iAmgCKZj5lSwV/UCErAJkcHIJ34K
	ZDrl8RtNJACfaJuOKXtkGrv5UvREJUJHZTPccdoI2oTExdTqceNOJpFKyTV/vZFgIq/bzxIDBsE
	0KDvW2NJ+pimUIWxCczytUrvIwzyClw/Jb5qFYcwcM57nfJFKuYuJ6TzeiN/VApbc6wAEa+OUlP
	La9aqbjNuTs8TzlWDp42m4m8ETaqyYWbnsyQkWuU2LYhPh0odud+R/VgWBvhcijIInyNgKnk4WH
	BHZPjJEtBkIjNRb+eIKD6PYvUIAxUUWhgIbR23IABMUEuH9dsIwm
X-Received: by 2002:a05:6402:a593:10b0:6aa:babf:adeb with SMTP id
 4fb4d7f45d1cf-6b3e59e5999mr68410a12.4.1792513395686; Tue, 20 Oct 2026
 09:23:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014173945.373295-1-almasrymina@google.com> <179249101026.3632927.6502845375265155678.git-patchwork-notify@kernel.org>
In-Reply-To: <179249101026.3632927.6502845375265155678.git-patchwork-notify@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Oct 2026 09:23:03 -0700
X-Gm-Features: AclHuK98NB_XkoOPCMHRm8iUlfrFJ_YYRk69JLvIRXvJ8G4hhuCyWlkE4iWtFOw
Message-ID: <CAHS8izMRSU3AyVf+sP5uXShiSKuLumZwT=fsgW+bhJz47UoPRQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] net: unify symmetric netmem and page_pool refcounting
To: patchwork-bot+netdevbpf@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, ayush.sawal@chelsio.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, tariqt@nvidia.com, horms@kernel.org, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	ncardwell@google.com, kuniyu@google.com, john.fastabend@gmail.com, 
	sd@queasysnail.net, ebiggers@kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, petrm@nvidia.com, u.kleine-koenig@baylibre.com, 
	j.raczynski@samsung.com, wang.zhan@smartx.com, willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 3:10=E2=80=AFAM <patchwork-bot+netdevbpf@kernel.org=
> wrote:
>
> Hello:
>
> This series was applied to netdev/net-next.git (main)
> by Paolo Abeni <pabeni@redhat.com>:
>
> On Wed, 14 Oct 2026 17:37:14 +0000 you wrote:
> > netmems (pages and net_iovs) have two independent refcounts: a non-pp
> > refcount (page._refcount or binding->ref) governing backing memory
> > lifetime, and pp_ref_count governing recycling within a page_pool while
> > page_pool holds a single backing non-pp reference. SKBs with
> > pp_recycle=3D1 own pp_ref_count references on page_pool fragments; SKBs
> > with pp_recycle=3D0 own non-pp references.
> >
> > [...]
>
> Here is the summary with links:
>   - [net-next,v3,1/6] netmem: rename __get/__put_netmem() to get/put_net_=
iov()
>     https://git.kernel.org/netdev/net-next/c/a868720467d9
>   - [net-next,v3,2/6] net: skbuff: add napi_pp_get_page() and use it in t=
cp_recvmsg_dmabuf()
>     https://git.kernel.org/netdev/net-next/c/729a47b803b5
>   - [net-next,v3,3/6] net: skbuff: replace skb_page_unref() and __skb_fra=
g_unref() with skb_netmem_unref()
>     https://git.kernel.org/netdev/net-next/c/4d688084070e
>   - [net-next,v3,4/6] net: skbuff: replace __skb_frag_ref() with symmetri=
c skb_netmem_ref()
>     https://git.kernel.org/netdev/net-next/c/1f6f88105e1d
>   - [net-next,v3,5/6] net: skbuff: use skb_frag_ref() in skb_try_coalesce=
()
>     https://git.kernel.org/netdev/net-next/c/447f58db3505
>   - [net-next,v3,6/6] net: kunit: test netmem, page_pool, and skb frag re=
fcounting
>     https://git.kernel.org/netdev/net-next/c/2285346afc99
>
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
>

This is awesome. For years the skb refcounting annoyed the hell out of
me. I couldn't fix it on my own; there were too many edge cases I
didn't thoroughly understand and could break. LLMs made this possible.
Thanks!

--
Thanks,
Mina
