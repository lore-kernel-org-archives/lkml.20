Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793469369;
	b=ulwZX1aOkNn9Oj8u61luvyNxdoxcKXgFAlr2Q/6VsHpe9ZV99+1PAl1/GV+G8U0Qc4NF
	 NVc/9VKQd6cWZBjV4rSFMfd7Vs5NwEZcfZDJyJ75yzb+XwUA3vUZp3YKa1tRmT3KWbfqk
	 Cv7PqQgoHNRW60CcMVuHX+tVGDvo1lqXmUDPQk8sTm05iTq3r7zFlHg1n2nFdiUJuVfNE
	 /1b6nidZDUZA8bMKWa3IeqX8HiCgxQMeCMXeG+4sWUlIdFM7PYX0Xc4lAJ33dREAcnYpI
	 F3nBCnQgr9uBKwrZ6Ejp6dnP6c6VfKPy4sd94eVeAkgzzLm4Ln3Ixwcv5TfXnu2lO2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rNkbpOf/6CdhovZlb0JCMvwkSOPZhyRjQwXGgcPIcM0=;
	b=DM8Ore9NM/xNoIcuvaw5XZVAuzoRnM+S47lweunKI4VIuKqhSF20v27FwRS2PZohPeYy
	 tN8ShSNYffobdujHpObwegX8bDvQ5hBOv4IesDH92RJVvrKmag2JvEgcXFpa6j/begNuL
	 R3SPjT/7+pIy2FVLufRicNtdexzE2MKq8SQlvym4H8jHeWKb+Jdm2AQRgEkawaACj4guM
	 ieBeXhD/zRyzMQxr0T8htgBCtQJsvYPT1r4F43cspv3HjiMZC4t1Ni9IwLIZveji9AkwA
	 /jx/AUOBRX8VWcRCDYqOtAO97wDuBoYhJ5gm2Jy2YyUf0RF9B52tr/pwPrnAOGtxwvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="K/iYObj6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A117F606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A117F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/iYObj6
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so2693900eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793469368; cv=none;
        d=google.com; s=arc-20260327;
        b=cOMbhJouaFAb21qDpCTueALfX25ZG2SaUZQxRhr5rE9QCLIMARSRTIRvoqU8EnTM4M
         FipgfaXJu6gnhjEpmF1O9YSsTkV1naVCLo+SMFx3rIVg5f0UuJcspbUZqrQZp6VEl96g
         IWSP7BExzwhFoYEBeC7yM6uopM/Ah2eXicSOMAyDrTadp21SApViFVa6dFmpt4KBGYtZ
         hMZjVgoGrVtaKuYNi9jiyfkEPTfokbGHv8cmKH1nYJNktkMXlO5bzwkz+Yq6g2fc+X/N
         Flr63rh7wUKlX67xAPQivL+fclEzUHOKqctgr//HpJXc40Wam19VCcZTPiyIM2UcOl2A
         fZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rNkbpOf/6CdhovZlb0JCMvwkSOPZhyRjQwXGgcPIcM0=;
        fh=tMGQJz8Rx6ZtF7vrjDIIJrfdtmHs0cvUdV5AhaAkZ6c=;
        b=ln9YeXj76rgPnF4GCnnM/RSKGEHusN08x15jaPaJyKHIhdN1tFl1kBNtHOM5atsJEm
         7Cb+kmQXXeX2h79DAeuJomJ7JZFsG7NdXnC1NvnKLtGIVBmjhn/ipmnqGgoX0SD0Elzu
         6ValaIt5l8iFvvTGksPQ4bZIXQm10GrMObNOUys85N/I3RY7MjlUVNUyHb3R0S51MMYk
         eve23h0WFvG2lj1fc5SvH4AGSh+B7BPh7xnFwFNDdQcAzliBriOIKPesDHVCFYazLCqb
         WNQEl1WVl06ZZbCorWYWN8l+sAFI7LGMYbh82G1bBTFjiqSFg/R+A8Ni6ACQejSftf80
         73Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793469368; x=1794074168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNkbpOf/6CdhovZlb0JCMvwkSOPZhyRjQwXGgcPIcM0=;
        b=K/iYObj6mZs+cetMYz7PFKhblN8FWUBq41e+M05iSEKpcHDPpsaZNPWzQY2OnjLEgc
         ZDp11DfRlQQnTakkESFrkRVHufAeTXnUMVU74MKyeI45ih/xr5Z9nvipJr9JfBrZgnQx
         6Edk/4DUChdPPDCM+48s9l/R+OTMsf7FKgqdag0pD0pME8vNeDR2HnBVoQ6SyValBnh7
         TWR+UflijdAe3N1hr4Qg9GUD/3Pd+VfOvrpbLMPmJiPZo25X6piCwiB4PEs2pAW8z0mm
         N7+semMaXoadLQMkofizc2BT1S0RFialSjIJN+1iqktgXQ4HO//fqgXoR+eiYlGJW8HA
         tbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469368; x=1794074168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNkbpOf/6CdhovZlb0JCMvwkSOPZhyRjQwXGgcPIcM0=;
        b=FEfp3Y3wjMnNe8AozwRwVFdopnxEdKh9kBlHGYk42AGYYlq4t3YnJTsBFXIumNwbYj
         404uYNWP6TZw4dF2tDsvPtB/yRysOAYZTVc4k3Xn4RbHofe076N5NYEChSNHvcBK2wZm
         Vzse0IqRUWV1D39jgbpkcXFHPA07r4n5LUdBetyLnX5PE6W+21T8FcFKZaZsvlb7AGPE
         WiKC4xqjW6KEnhZxTyXHcBBQxxzPA/Uo//4V9Tbexs/wFsBGJIse1z37oxU5SbNISv8h
         up26DocvjuYxPuriTYWdHhGzD8kbEab2HRKNVv/PIGJH7GGgPZrbfak/Y6BuHAR0QKMZ
         7bvQ==
X-Forwarded-Encrypted: i=1; AKwUvByySv6ZfFiks8SiHXX0Gp9gHzXMZFy+ZFhnv0ydE8ipK5+ObKiVfXFnR2DANTToV8DFJ5gj+DW90k8Ibio=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZcBbPQ4gXERJznuTICm2sqguETXuKvcB66/d7joKprEOGfzA0
	6fDPQd3a/1Lkwxe8M+ko3AgF6WGpnNHFKURR45/CruCyT9BzPsA67XZgoxQ/vIhgLH4pznBufgL
	XERHoEkzB7pH5Wy7F4r0VSTPFTSXHqJ4=
X-Gm-Gg: AYBFou24tfdA+5v10jZaAheA87/d40BAv5zOwa40H7nc/bMD49nisCJAneNXyl4BR4D
	vyTI0x12GREYDzMlpBLlA8eEfjRopbGDx77Tv/XHuWNI0rbAhYXcGE1XE45G96O1uSjLeaYZZjO
	XsVSgTv5jF8Q8TxTmp73gJpeOoOViBMqomQEKQsUICCOx9PFVLD8Xx7SnOxCCAaMfKCMetbiatH
	qjugr/mFn9Bo++/8VOGFRTvJX4+mY7yvRKU1ry4FjQkqVJ/RTIdfJF2YphEE39qULx0TJxb4H0O
	3A4OtGcxOtx1vqiVqyE/+TWV1+LCHYkNb8KsfUAc5v1JQ4HsDM2v5cU5WaLlr4p2KuHSt7TaiGA
	a847hVU2JhbRXglY1rNYI1UPQ85i0tauKWfesocgPJYyxyOMYKknYUarhZTxk0gw+P5Lld61TdM
	hKbNMcnOMcN6Qpa7ptUv183rGNyg==
X-Received: by 2002:a05:693c:87d5:20b0:35e:7bfd:4613 with SMTP id
 5a478bee46e88-36a42425470mr8170127eec.40.1793469367409; Sat, 31 Oct 2026
 10:56:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-b4-nft-rbtree-gc-v1-1-51d087c187a6@gmail.com>
 <auYpCzdrOsoWr84Z@chamomile> <auYqSpBFtC0nTDDd@chamomile>
In-Reply-To: <auYqSpBFtC0nTDDd@chamomile>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Sat, 31 Oct 2026 14:55:55 -0300
X-Gm-Features: AclHuK_jTBWwlCh0wjD1rslD4cft5Le-TpMnYVQaT5Qn6qxToOLkYxnoLfO-V_o
Message-ID: <CAOCBhwHSe7M39Bq6mYuai=gLcq4nfTC2Z5+nm55EUJmpFmRsQg@mail.gmail.com>
Subject: Re: [PATCH nf] netfilter: nft_set_rbtree: do not pair an expired
 start with another interval's end
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pablo,

Sorry, the description was too terse. Answering both mails here.

There is no memory safety issue, and I should have said so explicitly.
It is a correctness problem: after GC the set no longer holds what was
committed, and the packet path matches keys that were never added.

Exact sequence, raw nfnetlink. The set has NFT_SET_INTERVAL |
NFT_SET_TIMEOUT, an ipv4_addr key, no default timeout, and
NFTA_SET_GC_INTERVAL =3D 3600000, so the commit-time scan does not run and
only the insertion path is involved.

Batch 1 (NEWSETELEM): start 10 with a 50ms timeout, end 20 with no
timeout, start 30 and end 40 with no timeout. Only start 10 expires;
[30,40) is permanent.

Wait 200ms.

Batch 2: DELSETELEM of end 20 only, then NEWSETELEM of [12,13). This is
not something nft(8) generates, but the kernel accepts it. Inserting 12
runs nft_rbtree_gc_elem() on the expired start 10. The walk skips end
20 because it is being deleted in this transaction, passes start 30 and
takes end 40 as the end of 10. 10 and 40 are removed, and start 30 is
left without an end.

At commit, nft_rbtree_commit() turns 30 into an interval with ->from =3D
30 and ->to =3D NULL, and nft_array_lookup_cmp() treats ->to =3D=3D NULL as
open-ended. So nft_rbtree_lookup() matches every key >=3D 30, while
userspace believes the set holds only [30,40). Reading back with
GETSETELEM, which uses the same array: without the patch 45 is found,
end 40 is gone and deleting [30,40) fails with ENOENT; with the patch
45 is not found, 40 is present and the delete succeeds.

To be fair about the limits: the only trigger I have is crafted
nfnetlink from whoever already owns the ruleset (CAP_NET_ADMIN in that
netns), so it does not cross a privilege boundary, and I have not found
an nft(8) command sequence that reaches the insertion-path case. The
commit-path case (nft_rbtree_gc_scan() not clearing rbe_end) uses a
different sequence without the lone end delete; I can send it in the
same detail if useful.

If you consider sets built from such batches unsupported, I think the
better fix is to reject deleting a lone interval end element, and I can
send that instead; or drop this if it is not worth the churn.

Thanks,
Joas

Em s=C3=A1b., 31 de out. de 2026 =C3=A0s 14:50, Pablo Neira Ayuso
<pablo@netfilter.org> escreveu:
>
> On Sat, Oct 31, 2026 at 06:44:43PM +0100, Pablo Neira Ayuso wrote:
> > On Sat, Oct 31, 2026 at 03:54:05PM +0000, Joas Antonio dos Santos via B=
4 Relay wrote:
> > > From: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > >
> > > Garbage collection of an expired interval start element also removes =
its
> > > end element. Both the insertion path, nft_rbtree_gc_elem(), and the
> > > commit path, nft_rbtree_gc_scan(), find that end element by its posit=
ion
> > > in the tree, and both can pick the end element of a different, live
> > > interval:
> > >
> > > - nft_rbtree_gc_elem() walks towards higher keys and skips end elemen=
ts
> > >   that are not active in both generations. If the end element of the
> > >   expired interval is being deleted in the same transaction, the walk
> > >   skips it, passes the start element of the next interval and takes t=
hat
> > >   interval's end element instead.
> > >
> > > - nft_rbtree_gc_scan() remembers the last end element it visited in
> > >   rbe_end, but does not clear it when it visits a live start element.=
 An
> > >   expired start element without an end element (a start-only element,=
 or
> > >   an interval whose end element was already removed) then takes the e=
nd
> > >   element of the live interval above it.
> > >
> > > In both cases the live interval [S, E) loses E: the set no longer hol=
ds
> > > the interval that userspace added, and deleting [S, E) later fails wi=
th
> > > ENOENT.
> > >
> > > In the insertion path, stop the walk at the first element that is act=
ive
> > > in the current generation. Elements added by this transaction are sti=
ll
> > > skipped, as intended by commit 60c0c230c6f0 ("netfilter: nft_set_rbtr=
ee:
> > > skip end interval element from gc"). If that element is a start eleme=
nt,
> > > the expired interval has no end element. If it is an end element that
> > > this transaction is removing, leave it to the transaction. In the com=
mit
> > > path, clear rbe_end when a live start element is visited.
> > >
> > > Reproduced on current mainline under QEMU (arm64, KASAN), from an
> > > unprivileged user in a new user and network namespace:
> > >
> > > - insertion path: add [10,20) with a 50ms timeout and [30,40), wait,
> > >   then in one batch delete the end element 20 and add [12,13).
> >
> > I don't follow.
> >
> > You add [10,20) with 50ms...
> >
> > and [30,40) with... what timeout?
> >
> > you wait how long?
> >
> > You follow up with another batch an you only delete 20?
> >
> > >   Before: a GET for 45 finds an element, the end element 40 is gone a=
nd
> > >   deleting [30,40) fails with ENOENT. After: 45 is not found, 40 is
> > >   present and the delete succeeds.
> > >
> > > - commit path: add [30,40) and a start-only element 10 with a 50ms
> > >   timeout to a set with a 100ms gc interval, wait, then add [200,201)=
,
> > >   whose insertion walk stops at the highest element, so only the
> > >   commit-time scan reaches 10. Before: the end element 40 is gone and
> > >   deleting [30,40) fails with ENOENT. After: both work.
> > >
> > > Normal expiry, and a new interval whose end element shares the key of=
 an
> > > expired start element (the case handled by 60c0c230c6f0), behave the =
same
> > > before and after. About 39000 random batches on interval sets with
> > > timeouts, with and without slab/page allocation fault injection, show=
ed
> > > no KASAN, lockdep or WARN reports with the patch applied.
>
> Hm, no KASAN, no splat, what's the issue, really?
>
> > > The insertion path issue was found with a small nfnetlink fuzzer. Bot=
h
> > > paths had been pointed out earlier by the netdev AI review of commit
> > > 86b6471e690c ("netfilter: nft_set_rbtree: skip transaction elements
> > > during GC"), see the Link below.
> > >
> > > Fixes: f718863aca46 ("netfilter: nft_set_rbtree: fix overlap expirati=
on walk")
> > > Fixes: 8d8540c4f5e0 ("netfilter: nft_set_rbtree: add timeout support"=
)
> > > Link: https://lore.kernel.org/all/179063970372.3145.17414936987144600=
093@kernel.org/
> > > Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
> > > ---
> > > Tool-use note: the fuzzer, the directed tests and the analysis were
> > > prepared with help from an LLM-based assistant; I reviewed the change
> > > and built and ran all tests myself. Test harness available on request=
.
> > >
> > > This is a resend through the kernel.org web endpoint: my earlier
> > > submission of this patch was blocked by my mail provider and never
> > > reached the lists.
> > > ---
> > >  net/netfilter/nft_set_rbtree.c | 23 +++++++++++++++++++----
> > >  1 file changed, 19 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/net/netfilter/nft_set_rbtree.c b/net/netfilter/nft_set_r=
btree.c
> > > index fbe1750f1..086823067 100644
> > > --- a/net/netfilter/nft_set_rbtree.c
> > > +++ b/net/netfilter/nft_set_rbtree.c
> > > @@ -215,17 +215,25 @@ nft_rbtree_gc_elem(const struct nft_set *__set,=
 struct nft_rbtree *priv,
> > >     struct nft_set *set =3D (struct nft_set *)__set;
> > >     struct rb_node *prev =3D rb_prev(&rbe->node);
> > >     struct net *net =3D read_pnet(&set->net);
> > > +   u8 cur_genmask =3D nft_genmask_cur(net);
> > >     struct nft_rbtree_elem *rbe_prev;
> > >
> > >     /* search for end interval coming before this element.
> > >      * end intervals don't carry a timeout extension, they
> > >      * are coupled with the interval start element.
> > > +    *
> > > +    * Skip elements added in this transaction. The first element
> > > +    * that is active in the current generation is either the end
> > > +    * element of this interval or the start element of another
> > > +    * interval, in which case this interval has no end element.
> > >      */
> > >     while (prev) {
> > >             rbe_prev =3D rb_entry(prev, struct nft_rbtree_elem, node)=
;
> > > -           if (nft_rbtree_interval_end(rbe_prev) &&
> > > -               nft_set_elem_active(&rbe_prev->ext, NFT_GENMASK_ANY))
> > > +           if (nft_set_elem_active(&rbe_prev->ext, cur_genmask)) {
> > > +                   if (!nft_rbtree_interval_end(rbe_prev))
> > > +                           prev =3D NULL;
> > >                     break;
> > > +           }
> > >
> > >             prev =3D rb_prev(prev);
> > >     }
> > > @@ -233,7 +241,11 @@ nft_rbtree_gc_elem(const struct nft_set *__set, =
struct nft_rbtree *priv,
> > >     rbe_prev =3D NULL;
> > >     if (prev) {
> > >             rbe_prev =3D rb_entry(prev, struct nft_rbtree_elem, node)=
;
> > > -           nft_rbtree_gc_elem_move(net, set, priv, rbe_prev);
> > > +           /* end element is being removed by this transaction */
> > > +           if (nft_set_elem_active(&rbe_prev->ext, NFT_GENMASK_ANY))
> > > +                   nft_rbtree_gc_elem_move(net, set, priv, rbe_prev)=
;
> > > +           else
> > > +                   rbe_prev =3D NULL;
> > >     }
> > >
> > >     nft_rbtree_gc_elem_move(net, set, priv, rbe);
> > > @@ -911,8 +923,11 @@ static void nft_rbtree_gc_scan(struct nft_set *s=
et)
> > >                     rbe_end =3D rbe;
> > >                     continue;
> > >             }
> > > -           if (!__nft_set_elem_expired(&rbe->ext, tstamp))
> > > +           if (!__nft_set_elem_expired(&rbe->ext, tstamp)) {
> > > +                   /* rbe_end belongs to this live interval */
> > > +                   rbe_end =3D NULL;
> > >                     continue;
> > > +           }
> > >
> > >             /* end element needs to be removed first, it has
> > >              * no timeout extension.
> > >
> > > ---
> > > base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> > > change-id: 20261031-b4-nft-rbtree-gc-1d9c72dba2bd
> > >
> > > Best regards,
> > > --
> > > Joas Antonio dos Santos <joasantonio108@gmail.com>
> > >
> > >
> >



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
