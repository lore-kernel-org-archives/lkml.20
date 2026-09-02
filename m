Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C94A2071
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358729; cv=pass; b=einD4PGGgQLziFIM5426+Yvgg/IfezWwQaqgDsVjei6DTmGsp0pE5hH8NLGAu9lXAEViW8jrgzpQo8yj4wWqcNYsth4y+PShpvh1/oGbYynffl2FdszVzegigga76VKON7BJBg1n/A7fcAe8T3TeOwp5H1clYOBAkdug3O8fb2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358729; c=relaxed/simple;
	bh=om459VHzGIcS7fnosyh6/zrkKImWOivry8YlszBybgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLmmBx3RVXHXgHF1L2LcE9ABdirvyJ2w1JGEhbqBOQTkxz2RsdmRFBsB4QCLha16eJmblloYY+ysPIObh6w12HT5vBJuxyHuWFvYr5/40n3nuYZWhvU66VlIc93fB/YZQuJjPYYxJbwMpaKHvN5k97z2gSz2/vrdQh2dmqq59c8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=Teo7tB4L; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="Teo7tB4L"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1412340b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788358727; cv=none;
        d=google.com; s=arc-20260327;
        b=qE9c3hl04cIhZfWltuA19UlveXyJw+njGAjADT7EvOK6FkuNLH65RsK8rPbpAP2ZWl
         FVgWtflPexe4z812y6Lfz9xE/IEJYYgcBh1b48QWoinwZJrIMKvSV3UlllGF6yHuOGft
         SSTNV//z43qoZ7d1rzVSHLZLz2q8yG+Yzc6vocUlA2sRg8cBtTe10L8tjz75EVtY+yvO
         P+AkNzxLdZDKCFbu7VG97Wt1UKfaKuJl5ADcziL1rOi+etQ+lTsIcX+YMCzA3wDPJMZl
         TesaKQ+43nY7tI2biwhoZAjRgG63LgVetLmZTaNeZ0uT4d9IF/jmOnhktbKzvRdb09cu
         vjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uYNjIZZ8RMmiF+3QP0G43VfzKqj75CKSNv+DnxNLnmo=;
        fh=ZrUZJVUemzeSnl/QLD0CGVR8kFBop1xWDI2mvN9tev8=;
        b=dhS8ePFueujG4RghpzJWeZJf4czDQLfW5qXfLvY48Vt9vFGTNX9qGsi2yeSLmSe8+P
         o7tNEwSmtiH4D/JTWbIL70wA3VrytfBB2Z06XGLMr8toC/B6Xl0BD3A7IWZQV//DHWzV
         PkM0DtrEUUrWMxWXiwl1kzHZ25lJCw85lBSfW1W1oFw6iQxhsEa/xCLHQXoZHQ04KACD
         Cmxs4nDFdQrtY7k6Uqi2DyrZKe+dxY9o/8IdxiFQjYqT1vAFy3J9/4v8thCkId3DPtNQ
         niA6xqYP4vYTDYMbw/SmMUl1PzTivexo2bCgXYlv14ybJrKCJYMSP4xksbmwSH9h+1YW
         EfEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1788358727; x=1788963527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uYNjIZZ8RMmiF+3QP0G43VfzKqj75CKSNv+DnxNLnmo=;
        b=Teo7tB4LQR2K3ajvykXzKTv/jx8n3VGY7tNVgCtpiviUJG9H/QlzVLRGuVrLDv/JTp
         9N0rVEqlAIirDQeXtG5pPW6rgCXXrQvVPYDvSWDb88qPMYQQbMJqfImMBwz0UKHWRZCo
         6UIp2EKn+KzSYMsxM4ZG+1xMOBr25B+i7Etfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358727; x=1788963527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYNjIZZ8RMmiF+3QP0G43VfzKqj75CKSNv+DnxNLnmo=;
        b=U8HK9MXrJln4Jxgi8hUyb/QKmyF+7M1V0y2jycAljiHt4P6QvTDSRh1XgyqypfJ3tb
         4XKKzer2inG3o3Dg5iZwjdX5rA1ZBMH53SqKw7WdDioOIrB1ZGGLUkpNKcju6lmn5Ybh
         302z9ztqVVajE/BzPlSIW5PnkwRex6nu5WDtrHy8kD5lovVK9A/840h0b98ZPjz4sgXS
         RCSLWWxWlwlT4fX0odJnWgkKOw9iIYOOxNkjRkMLiIQeKEslUNr3n15Ub1RwQ0WlQMMR
         o0zpHu8XFV+HNWLvfkS1L+A9h9YVrlq6WO2G/zQth3Oom9EYKESPz8Fd5kf1SjRtsRkT
         nFgw==
X-Forwarded-Encrypted: i=1; AKwUvBxSiyehk1Gq++P+MSLqHLMoGw9dl0WRR0Y4xOFkFcnfkRmgpsNefmz5NL7vfFgLRkCAkPgTUlrb3nwDE7c=@vger.kernel.org
X-Gm-Message-State: AFuF++mhKkgV8zRrVkdygYB3FEnu6H2znrR0i0TFfD7jsdiRCr7SPJA7
	s4CGymjow4vqJQxDkhOEyOPETJeNfzGq0T/uGzsRpAN3ulZfViWObYWv4vv5JnaS4v0GMswL/HL
	L28lTYBKvME13lg9lF/q9MaMUYlivKOpEyo5u99MH
X-Gm-Gg: AYBFou127CD1HrJy8x71ZiLFt26HIbUEmUWAodScNRnQ8c0ap+ceAcaQpT5QMMH7aLq
	2s+ab7x6VpeCurx4RmJVYV4ZpBq4i5/gt4bAvjEgJPrqNBf+ZhBmHxSCC1JjVGn9EfN+z9Ib2hI
	Df+Mm9iBTfqAKFpvDT7ySD64Ktd6JPdMQF1GkaI+XReIEZ0FBZgS++yjNeeKlYs3iUXylhjmEip
	Ak4I+tL3hZ9zedPoV8orHAT8ijEfzVdBjxg1spoyxjqUj3du8Jg1fiKPmhfHJr3Zy/nRTO+JJZk
	6t1hMOYeCapR4R0LoelEa4JLe90KcHv5Lkk8eXYIYDTEuxuJ9KmYqQ3bXAyTsoDVRsCnj9APKuf
	1sVQNDDcBlQLqK1VCtVJ1Lu6Vg+0=
X-Received: by 2002:a05:6a00:1701:b0:84f:dfce:966b with SMTP id
 d2e1a72fcca58-85ed21f2412mr6888834b3a.8.1788358725561; Wed, 02 Sep 2026
 07:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPBHdam0Y5cxjFgm7MgavPNHrb=wOSCG_BODbYsn5y2-CGKfQw@mail.gmail.com>
In-Reply-To: <CAPBHdam0Y5cxjFgm7MgavPNHrb=wOSCG_BODbYsn5y2-CGKfQw@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 2 Sep 2026 10:18:34 -0400
X-Gm-Features: AcwNN1U6X99laJb8c88uWPJYk3eUllDdXF5Y-4eBqmjSTbtDjbsRQ5IZUPYJXh8
Message-ID: <CAM0EoMkc57T879QJEOUg4n7pgoff4iLzmF16FGD7j+0ZXmhrug@mail.gmail.com>
Subject: Re: [BUG] net/sched: cls_u32: ht_down refcount leak on replace_hw failure
To: Qingyu Zhang <usupergate@gmail.com>
Cc: Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jedrzej Jagielski <jedrzej.jagielski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 9:55=E2=80=AFPM Qingyu Zhang <usupergate@gmail.com> =
wrote:
>
> Hello,
>
> u32_change()'s replace-failure path leaks a reference on the linked
> hash table (ht_down). A patch is attached.
>
> Type: memory leak (refcount)
>
> * Summary
>
> u32_init_knode() does refcount_inc(&ht->refcnt) for the copied
> ht_down. On u32_replace_hw_knode() failure:
>
>        u32_unbind_filter(tp, new, tb);
>        if (tb[TCA_U32_LINK]) {
>                ht_old =3D rtnl_dereference(n->ht_down); /* live knode */
>                if (ht_old)
>                        refcount_inc(&ht_old->refcnt);
>        }
>        __u32_destroy_key(new);  /* already drops new->ht_down */
>
> The extra inc is on the original knode's table. Destroying new
> already accounts for the copy. Net +1 that is never dropped.
> e8d3d78c19be added that inc; it is wrong given ec5b0f605b105.
>
> * Affected
>
> e8d3d78c19be. Reproduced on 08dbfad3f504. Needs cls_u32, a way to
> make u32_replace_hw_knode() fail (no offload device: kretprobe, or
> a driver that returns -EINVAL), and kmemleak.
>
> * Reproduction
>
>        tc qdisc add dev lo ingress
>        tc filter add dev lo parent ffff: handle 800: protocol all u32 div=
isor 1
>        tc filter add dev lo parent ffff: handle 801: protocol all u32 div=
isor 1
>        tc filter add ... u32 ht 800: link 801: ...
>        # replace that knode so replace_hw_knode fails
>        tc filter del ...
>        echo scan > /sys/kernel/debug/kmemleak
>
> kmemleak: size 192, u32_change, handle 0x80100000.
>
> Because skip_sw on replace is rejected earlier ("flags do not
> match"), the QEMU PoC uses a kretprobe to force the 2nd
> u32_replace_hw_knode to -EINVAL (poc/fail_replace.c + poc/u32_poc.c).
>

Isnt this the same cutnpaste from here?
https://lore.kernel.org/netdev/20260813122242.1690024-4-jedrzej.jagielski@i=
ntel.com/

Have your AI check next time instead of overwhelming us on the list.
It is better not to post anything that makes someone spend valuable
cycles going to double-check this slop.

cheers,
jamal

> * Expected
>
> Failed replace does not change ht_down's refcount of the live knode.
>
> * Actual
>
> The 801: hash table stays referenced after qdisc destroy.
>
> Please consider the suggested patch
>
> Thanks.
>
> Suggested patch:
> ```
> diff --git a/net/sched/cls_u32.c b/net/sched/cls_u32.c
> index ac6d0fa5a40e..a619dbb435b8 100644
> --- a/net/sched/cls_u32.c
> +++ b/net/sched/cls_u32.c
> @@ -938,14 +938,6 @@ static int u32_change(struct net *net, struct sk_buf=
f *in_skb,
> err =3D u32_replace_hw_knode(tp, new, flags, extack);
> if (err) {
> u32_unbind_filter(tp, new, tb);
> -
> - if (tb[TCA_U32_LINK]) {
> - struct tc_u_hnode *ht_old;
> -
> - ht_old =3D rtnl_dereference(n->ht_down);
> - if (ht_old)
> - refcount_inc(&ht_old->refcnt);
> - }
> __u32_destroy_key(new);
> return err;
> }
> ```
