Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54B51B192
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909773; cv=pass; b=MbgtshSV+u9fT/0RSuu5X8nFEca9y5gNj0AjSLvO1hB5bMhQ1/mV/EuZ2ETkIJI1ePOVJPTn7CLnTx9e4KJ9aqVw9IMR4kcKf834E/+5fbnXvANFhr0CrVBpZQAgZV4I0mfFs5Tf+00xgIm/A17sdP2g/Ssec/NuQQeh13Jqp8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909773; c=relaxed/simple;
	bh=YEWBZSCDOHNDO3i+3Dhofyy1g9bLH5Fceh3LVymGhIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UF88ewV97vnWDMvFIc0QTWA5uGcX0OYHLKkvahoerrclNFL4GGFp+tD2h+H6LiTkpp/CKULeDdB0yuT3x7fjR91HxgI5iR+LlhGTgw87mWuKmFiLLHXdLHs4Xxb6+1809VAVjj2z3pD0bNobL/yVlojjoBrVd6ogLE2MEWv4wPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dr+We5fX; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dr+We5fX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afbd2c386so1856105f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791909770; cv=none;
        d=google.com; s=arc-20260327;
        b=UlFEXzAya9035Au5+BWTymX7UgIdoXCGlpiStI+8xSM0TImdwyczfM2Tn5TfjhQxEB
         kVsh/ADUgVdyFEmrTaOQjBQYY81hJR8eCq2Dt7ZQ6TRRtyJyunq/KRWESKhiFhvuFSgc
         QrY6cU+pomq2X/XX+uMwwZ+aJ63i4/dW3xKhONtD5C66mAb5tB8GVPy4Y292WKlJcfV+
         e0hv6FDqzZ7GIGnQPzUUx/LGTPHsVLXd3IRVJ+0CYE8DdIfncYgHdP4BaMlKIc+BHPCo
         4DiUMT2qkNPddU37byCfwC9xNOgETjKFbbdikBiyz2PKzuZ8VesFyyWdOf5JXbuSLY4J
         atjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEWBZSCDOHNDO3i+3Dhofyy1g9bLH5Fceh3LVymGhIE=;
        fh=RtMoTbSEqHiETVGUlu88iRhc9W6RZZO3hH4/UKDgilY=;
        b=FySXp/8VqUOPZLXZAX+qh5LwZfbDfOwLo5xWxLPn6Ppx4oxGNyBQVImpVm6zi5ji2t
         8x5jTaXKGqtyL45kK09wtAh1vYOHKzm3majg6lvnFYskjqw6dIUDKDHMkyC1f4MSYWib
         NRamStlFSdgohgMw9bMLtZ/jnfKsdADq88YN/boywHj/ZypfTv+0u0QBC5nhfGEx6BWT
         OXuGuTiuJ7Hadm8fC2P0D0d1bnBjydT2q1RVbu0DMvdIBg0NQYoFLOes1aFMZcobR+R+
         W6F/+bX6xqemy7Og+EWGwWPFkTp59FkxIEvdtbzlCWGU0UIX3hgO3LyJs7o42bRfI6wG
         xRyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791909770; x=1792514570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEWBZSCDOHNDO3i+3Dhofyy1g9bLH5Fceh3LVymGhIE=;
        b=Dr+We5fXI0ZNaPKG7rBRB0dP03qa+LQFaUCmT5Xu/RHl6yI6RkPFx7BDHVUp1xGOqd
         AAaK/92Us7KpgTfw3iXyBqlt2+XNQLy5IV7nCbhixik8kVYx6bW9MYPV8a3GrzWmEyDO
         7BeMvOshyqGgWpbDfz0ZFlKeTEXkKQcyNExI184FKL4g7mBhgEoJVFL2c6rYQ++SwJXU
         abSLH43weF9eVvTxPlAouJ8YButzIa/Re50vNDDJXH3H0AmVcy4fSb3fvK65sXvv0kJ8
         oFxO38AeytdJgPPWofY0fd8kC4Hd0g9jgj8yWpSnmV0nQJY1SlgCQi5qvnMgLeSIiAFU
         GMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909770; x=1792514570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEWBZSCDOHNDO3i+3Dhofyy1g9bLH5Fceh3LVymGhIE=;
        b=yAVGjz+EIN45sh33DdPccloxcFe9v3U8ep5IgPhup5VobzrF5tCq6qWc3OmEJyDkBK
         MHBaURCRTCcZjDwDYDKSCaOmEdayZQGZ5Yfi40r4oHa5TDubdkt7M9WdHsfRRWcRvtTy
         zVZtZIdu6GspWs6B1cPHnXNPYE64Qzu5Pj5WXnFd+6pR7xxe3mvthdiXc7RBUyQiZIi1
         oMWFJq1c2m5uCgzppFbkgegY+CnKlXTT6PwdsrnOx9lqPFvzA89XZESweSuzwD1W/zeq
         ZWqrakezQFrvotavQyYTCBh8khGLLv40Qi//xu6AH7fO1f3Nll0TeTnCSfuQtOAgBOmX
         kSLA==
X-Forwarded-Encrypted: i=1; AKwUvBxphnbmVeCq7lRZwuHk69f7HN5VvX1vDMi0j+9NwctqPTxoRpFDfVWad2Jrt0phjGbN/uE3cjwebfHy3ho=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCnGqWx776h1kA+ThxRmdsVQstnVO1bGaKa1S9DfjGclq2HtKb
	UiBJe6ndm6hpHu/3AlYXvF3LfbWYwzfb+dmLGztbYwUfi8682vQ68Kxbf95q2jnHxMyWfOAT8v+
	hGP2tL6lSRoCRLwfXgSWgE3g4klSNlZY=
X-Gm-Gg: AYBFou3WLL1/u3YNV298Lxzqa3LISiPHpUHuCkSy9QyZGOHZdpMi03iYj8ZzilKsPFx
	XwAVa6sMYoHKXXuWM6hEseFvsW9oVigsdmprWtc7/LoiA37d3cabxoQa7O8LPn1WlpiOLThZymX
	VWlwPR6Vm4U+9HrgKqK1vgt/l/+J7FqNBuMO5fXmN7QtpHEzk22jndRxtQbZbrhMuxLM5Nj8t/o
	bdZG/nX/0r17dPbh060MD6Z7tpomrWmaJsPieTKZSpW7IL8/GH5nv0piQX4JpCRMqc3h2tZrz91
	NkVMw+kPCEafITazA6ynFJgnaNlmfJemQdb9rFUewnNPkjAn0gmyUlLhn4BacoekkpHEbwPxBhf
	Hq2NkWZ73Gm556bb1nlrzgSNBzANPwpGDYdnrM537T1Tg15kQMuhqbr3HIadmRpzPVtE3xgU=
X-Received: by 2002:a05:6000:2212:b0:48c:5cf9:88d6 with SMTP id
 ffacd0b85a97d-48dba7bea17mr24931533f8f.2.1791909769542; Tue, 13 Oct 2026
 09:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003003136.750633-1-hebaoquan@kylinos.cn> <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora> <565e1744-54ff-4daf-ac14-7b6c49fd3fa2@kernel.org>
 <as33VMjNRIZOG5Ua@MiWiFi-R3L-srv> <d6209813-d53e-428c-90a9-6404618d0804@kernel.org>
In-Reply-To: <d6209813-d53e-428c-90a9-6404618d0804@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 13 Oct 2026 09:42:38 -0700
X-Gm-Features: AclHuK-ryAPyn7SnvcpWGj3a4GSukncAVwfSrD3pFoQuFgdkLOUuj2IqX2pNiK8
Message-ID: <CAKEwX=M6iVBGDs21obLu3Ese_wHuQnspsSdo+HddhCeecn-L8A@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase I)
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Baoquan He <baoquan.he@linux.dev>, Klara Modin <klarasmodin@gmail.com>, 
	Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	chrisl@kernel.org, kasong@tencent.com, hannes@cmpxchg.org, baohua@kernel.org, 
	youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:08=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/13/26 11:18, Baoquan He wrote:
> > On 10/12/26 at 03:44pm, David Hildenbrand (Arm) wrote:
> >> On 10/12/26 11:16, Baoquan He wrote:
> >>> Hi Klara,
> >>>
> >>> ...snip...
> >>>
> >>> Thanks a lot for careful reviewing, and sorry for late reply.
> >>>
> >>> ...snip...
> >>>
> >>> Thanks for the comment.
> >>>
> >>> Here xswap.max=3D is a global boot parameter, while not a per-device =
or
> >>> runtie knob. It sets the space space (si->max) of the xswap device
> >>> at boot and can't change at runtime. So on the two places: the size i=
s
> >>> a global setting, fixed at boot; the priority is per device, it is in
> >>> the create interface. They are different things.
> >>>
> >>> The default is 2xRAM. From our earlier discussion, this is the larges=
t
> >>> size we think is sensible, and in practice I don't think it is not
> >>> reachable in reality. If a system has swapped out 70% of its memory, =
and
> >>> even more at 100%, it is already doubtful that it can still function
> >>> normally. So 2xRAM is an upper bound, not a target.
> >>
> >> I remember some overcommitted hypervisor setups where people swapped o=
ut
> >> significantly more -- without any issues.
> >>
> >> For example, Windows VMs initialize all VM memory when booting up. Aft=
erwards,
> >> you might just have plenty of memory that was touched once but will no=
t really
> >> be used in any near future.
> >>
> >> So I would consider some crazy hypervisor scenarios as well where peop=
le
> >> commonly have significant cold memory that is currently not hot (not i=
n the
> >> working set) but might possibly used in some distant future.
> >
> > Hi David,
> >
> > Thanks a lot for the valuable input. This is probably the first first-h=
and
> > information I have heard about a production environment. And Klara
> > measured about 160% of RAM in zswap on her RISC-V box, so the 2xRAM def=
ault
> > is reachable in practice, not just in theory.
> >
> > So I see 2xRAM as a default, not as a cap. xswap.max=3D already overrid=
es it.
> > After your comment and Klara's numbers, I am open to a larger default, =
or to
> > a "max" value for the address space. The real limit is still the backin=
g:
> > the zswap pool plus the block devices. The address space should no long=
er
> > be the limiting factor.
> >
> > By the way, in Windows-VM case you mentioned, is there a block swap bac=
kend,
> > or is it zswap alone? If it is zswap alone, the knob that matters is
> > zswap.max_pool_percent, because it sets how much cold memory the pool c=
an
> > hold.
>
> Excellent question: I don't remember all the details. There were talks ab=
out
> over-committing up to 400%, and people played with both zswap and zram to
> avoid/reduce IO.
>
> I assume as a safety net people would always look for an additional swap =
backend
> (that's what I remember, but I don't recall all the details).

I think the better question is why do we have this knob in the first
place. If there is no justification for it, we should not add it.

We should start with the actual usecase, then figure out the
interfaces that best support it, rather than just expose the whole
gamut and burden users with potential misconfigurations. New knobs are
easy to add, but once a knob is added it'd be much more annoying to
prevent user from misspecifying or to deprecate it.
