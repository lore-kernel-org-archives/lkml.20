Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0B4FD791
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104948; cv=pass; b=TkvONqo84BxLN+7cCDqfrfbib4p1BG2QGSagg+Z6g6mdURejUNlr9KjUWLxUh5PBG6eHP9C1FiCpV40ibTviT20mw01kgv3bo65fL+ZzQRZuNCakyX6cJvxJeacyo+9P0DF0f+2FTP9TdlxVIN1OLDRYDdZO48IWiVal5bwxvVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104948; c=relaxed/simple;
	bh=HOodAUwJ+E25FjBy2nyhECkY3MFUHFJNcIC4N1O8JMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nO4kId+Y3c4z+aJLgFWYxuHqqS9G4mH/Wq1gQAAdPbY0q2l9Q6IZXzyQiVDrmuXJl+dCq++P3TzTUtqt0QCAr5SlqAZaGNpOMw2w1pYYhBxyqBJ9YgfMgX9WvE2kerXOg+Mp32T671RPUWD24H4nmOlhrSBsFjxbCmvLOAKSSi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAM98h70; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAM98h70"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a9a1ed66b9so18727991fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792104943; cv=none;
        d=google.com; s=arc-20260327;
        b=V9jVXU06fABxhkT/GW3hU24tsiybr/JR7d8rcgC6SGWoup2Q2VgUypmQW0rDQDx4oZ
         UPhmAV3Z9Csngq0jui1NhAT5PqoELFobUp2gt1q0dfiU/92fqTvshZLHQUbctDCfRJEf
         Rxglk98e+Ns4JvqMrmTYIyhOkhfjbqeRMPZ5bnHWyw3xQlsnkJ3826ViyODBGXMCLGYJ
         80TpO2w6nX9fEM4qaWtOqe4Fu3mLuiIwn0Us15q2flSEjnh6HKtAdFA0md7XXajrPNTX
         KuXsxSXoQSyLnhmra8mntq2EKEV+oJhHmRpk47+SVu98i8XnZAt5BI3GGeufoOaYMy/d
         RT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ir9yC4IPsDGWndlbFXv4TFfTkBDdrwDKIOA2kRca8g8=;
        fh=8/aRi1BnBEF3+f5rCdW3l7MyimyLb7jFZEpfb07oSXE=;
        b=Xm4GyKKPSlTiVVNAFkORvP+JRok45CqQBg9ro0rxNupLtLFzrhX67xQbikEPs0xhtT
         DfUQ3m8EB2jDiMGqQdpjDdJIcHJonLQgGy4pHwSXpvB/UL0QuecK8uiZKpfqxhodo+6P
         +dGEXIVFbOHMcfU8TIAdiQUlKFjjTSxUvfE1ybttZknpR1kTgwTx7TNi5NJeVBUsaQyx
         ryh+psFRl8voywnVb/pdVVmIsoyAWnzG30MJrUDnUf44Afs/DBbWOGEpYlqLRWMCBIQD
         E3KKjmVCGawU/dQThAvczCGiJPSKAxcFgPpXa6h/mqGuNCm4SRIqxT/18oixbjI5kw12
         jKIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792104943; x=1792709743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ir9yC4IPsDGWndlbFXv4TFfTkBDdrwDKIOA2kRca8g8=;
        b=NAM98h70VRnlecBkiZDQ7pafl08oypI1i35fr60LliQR7i0H8Lou3HwjTEKe6DjYyr
         orlqyGMszO7aJqxMjQkJA/nDYbHKFGE5aiHl4HGzQsOHYpa1kHXM3S41aDMQgX83j9is
         aZexRlxQdKIw/QaHtOQNa3Mhz8nM9SQLbnAoxPSZxMts00R6NWmxtzgR55VlvZlmlDxk
         XEdEyVE11x6lSI5bUb8C6+K6vYbzNeQ+R+ZExZGbflIhkjOEq4pS8jVl/BpK9pD6bMGy
         3M0iP9A7snlHICzYfcasUyLjnLSqgfHBdCi92Wbl60uhmu7NNBng64F98znbslLEU3XW
         m8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792104943; x=1792709743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ir9yC4IPsDGWndlbFXv4TFfTkBDdrwDKIOA2kRca8g8=;
        b=xvsc8AsLhovxhjG2QWcbYJZWEnfaAL4WIBibMRS308a6HqgUq7cLaM27z2hi7U8/R3
         8t23lH+H+rcPOV7FXRu/2ttXvxN4Lt6PQvje+PDT8AP36scmDX4aqZxTL8QutHXHYhBT
         7nQdky7KTnYGLHx/ddY6BIQ87nAEnIMRPgDkpf+oWF5BC8eziWObx9PUZOFgXTPycI2Q
         LokX6fJFqigKaDZAR/A4nmGSer8TdiCjGOqXR8BtDZ1TgnwsFzo1TT2GXvrhXhHu4g2q
         KPNW+a+JS5Ad2crAsseaKOApodsl+wX3Bh0YYrtBp1vnDfG5UZ2hceWQdyQsVwBOLax+
         NIgA==
X-Forwarded-Encrypted: i=1; AKwUvBy0aAYES0DPW42Q8Z7x/XE6oV9+HZMiqzA4eFQrGtZU88g88hg7MDpD3a1JUe9ypcth3cz6d7usG7PHc1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4I76B2vxr+9hWr4fXZ6GYdo6HxxngPUT6kt+/kHDP5ugwbZw0
	608o4VJDHWYx92mZceJ/QNUvz0c6H6wQPrEGFm5wjoDDH9UNJXdEeoemNCX45j0uvFV1JpWIcIz
	frT8gjCwKYN+oiY15Nvo815ry8JPCtSQ=
X-Gm-Gg: AYBFou2vxwWHJV6NdQJlQESBGobjf3wnFgfYvCZKrp5TZSwUh977oq4dCyJlu6XMmhp
	6Hl4m3VtNTKFTgbXTopnD/GVbPZQHoWf/+t6CmGdYYv7KGCmLBeWz5ODGJ1T2riz3M7uG78xxrM
	ufTqubnKrysunPFf4LGx9kWXJFaNlxi7ljuqChAd7uA7KUuUrTKO1izC99OtTY34xOSSf081sm7
	5fNwX3iCG47F67TgWJiHOnnhXjyTCbdF5rYjSjtAoftZcNxhItFwQikON0ulxvW9YE59IYehYNv
	wKD3jGCsm+O3qFyxpLOK8EwpjjCx/fwX0ah4yhkxuXHrRGrlB3A6FyENgHG89D+TTQ==
X-Received: by 2002:a05:651c:19a3:b0:3a9:aa26:3a4c with SMTP id
 38308e7fff4ca-3a9c538f51cmr47801041fa.21.1792104943160; Thu, 15 Oct 2026
 15:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008182814.27450-1-kanchanapsridhar2026@gmail.com>
 <20261008182814.27450-6-kanchanapsridhar2026@gmail.com> <as7JC8o2kggiq_ss@google.com>
 <CACpmpofXMGBP70Rn7jHLwOF38GRKMUGoW3rb1Jp2SPH7ygKcfw@mail.gmail.com>
 <CAO9r8zOEcGmg8eVttu41htugnng0ahnVQbubiJfxVH+GfDe47Q@mail.gmail.com>
 <CACpmpodDA=oqnVa_hsJpyhGt=4zxknYF=QX9L6-sJbxsRxtM2w@mail.gmail.com>
 <CAO9r8zNN6F01icKUFr8q_AgJvhxGw0MkGezKbBuKzFQV0NaAdg@mail.gmail.com>
 <CACpmpocCJWkA+zvZ9ivNCt8xSZWfViKQ2ZeYN+f1EmdVTewzRQ@mail.gmail.com> <CAO9r8zOtedHfJ5A7JiXJYtWO-MjoGfE9PLPyyrQoHrr-R3FivA@mail.gmail.com>
In-Reply-To: <CAO9r8zOtedHfJ5A7JiXJYtWO-MjoGfE9PLPyyrQoHrr-R3FivA@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 15 Oct 2026 15:55:30 -0700
X-Gm-Features: AclHuK8cEQZHEGY2kMJTg0wCJzqaMpTTU8RvyNTZr6U6lGP9J6oTJ1x2_LlnLqk
Message-ID: <CACpmpoc9k5bATJDG=GqE1-1XhWCyixHC_ncNoYbRZ-CTkJbDVg@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
To: Yosry Ahmed <yosry@kernel.org>
Cc: hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:48=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 15, 2026 at 3:45=E2=80=AFPM Kanchana P. Sridhar
> <kanchanapsridhar2026@gmail.com> wrote:
> >
> > On Thu, Oct 15, 2026 at 2:39=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > > > > > > @@ -1449,9 +1446,10 @@ static bool zswap_store_page(struct =
folio *folio, long index,
> > > > > > > >  {
> > > > > > > >       swp_entry_t page_swpentry =3D folio_swap_entry(folio,=
 index);
> > > > > > > >       struct zswap_entry *entry, *old;
> > > > > > > > +     int nid =3D folio_nid(folio);
> > > > > > > >
> > > > > > > >       /* allocate entry */
> > > > > > > > -     entry =3D zswap_entry_cache_alloc(GFP_KERNEL, folio_n=
id(folio));
> > > > > > > > +     entry =3D zswap_entry_cache_alloc(GFP_KERNEL, nid);
> > > > > > >
> > > > > > > We don't need to allocate the entry on the same node anymore,=
 should we
> > > > > > > drop this and let the slab allocator handle it as it sees fit=
?
> > > > > >
> > > > > > Was this a recent change? I see the folio_nid(folio) on my vers=
ion of
> > > > > > mm-unstable as of 10-3-2026. Let me check, and yes, allowing th=
e slab
> > > > > > allocated handle this is probably a good idea.
> > > > >
> > > > > We allocate the entry on the same node to avoid having to store n=
id in
> > > > > the zswap entry (see entry_to_nid()). If we store it, then there'=
s no
> > > > > need to allocate on the node.
> > > >
> > > > With patch 0006, we try to bulk allocate all entries for the batch.
> > > > Only if this fails, we call zswap_entry_cache_alloc(gfp, nid). So
> > > > patch 0006 addresses this already, and the nid is used on in the
> > > > fallback case.
> > >
> > > If we are storing the nid in the zswap entry, there is no need for
> > > zswap_entry_cache_alloc() to use the nid anymore.
> >
> > As of now, zswap_entry_cache_alloc() uses the nid for
> > kmem_cache_alloc_node(). Is the suggestion to change this to be
> > kmem_cache_alloc()?
>
> Yes. I don't think we need to use kmem_cache_alloc_node() if we store
> nid in zswap_entry.

Got it. I will make this change.

>
> >
> > >
> > > >
> > > > >
> > > > > >
> > > > > > Along the same lines, I have been working on replacing zsmalloc=
 with
> > > > > > direct SLAB allocations for the zswap compressed data storage a=
nd see
> > > > > > very promising results: memory savings and latency improvements=
. I
> > > > > > will submit an RFC shortly.
> > > > >
> > > > > Keep in mind that zsmalloc is movable memory, while slab memory i=
sn't.
> > > > > Zsmalloc may also be less likely to make a new allocation in the =
store
> > > > > path. There are other considerations beyond memory overhead and
> > > > > latency here.
> > > >
> > > > I realize this means we trade off page migration for writeback for =
the
> > > > pages representing zswap compressed data. This might not necessaril=
y
> > > > be a bad thing for 2 main reasons, the way I see it in this specifi=
c
> > > > context:
> > > >
> > > > 1) Page migration would only be transferring a memory pressure prob=
lem
> > > > elsewhere. Not sure how well this would work with memcgs or
> > > > containers. At some point someone would need to do writeback.
> > > > 2) I don't believe there is a zswap specific page migration flow in
> > > > the kernel other than zsmalloc compaction. IOW, memory tiering
> > > > components like CXL are handled directly in the reclaim path. From
> > > > what I understand, things wouldn't break with slab memory for zswap
> > > > compressed storage, but I could be wrong. I hope to include the
> > > > architecture level considerations/trade-offs in the RFC.
> > >
> > > Zsmalloc memory is currently movable, so compaction can move it aroun=
d
> > > to free contiguous blocks (e.g. for THP allocations). Slab memory is
> > > not movable. It can be reclaimable, but writing back memory from zswa=
p
> > > when we are not under memory pressure is also bad.
> >
> > All good points, thanks. I agree, writing back memory from zswap when
> > not under memory pressure is bad, however I have not seen any
> > writebacks in my experiments with usemem at 60% over-commit and with
> > 64kB mTHP.
>
> We can discuss further when you make your posting :)

Sounds great, thanks!

>
> >
> > I am running these experiments in a memory constrained environment:
> >
> > QEMU VM: 7G RAM
> > Swap: 3G
> > cgroup memory.high: 3G
> > 4 usemem processes want to allocate 1200M each. To make the experiment
> > even more stringent and representative of actual compression datasets,
> > each usemem process reads the Silesia dataset from a
> > pre-fork-allocated buffer into the 1200M. This causes realistic
> > compression payloads in usemem.
> >
> > >
> > > Note that compressed memory can be very large compared to slab
> > > allocations (or kernel allocations in general), so it can increase
> > > unmovable (or reclaimable but not movable) memory significantly,
> > > causing fragmentation.
> >
> > It took me a while to experiment with compressed size bins, until I
> > settled on a compromise between memory wasted per slab and zswap
> > latency in finding the correct size bin to minimize fragmentation. I
> > have been gathering extensive SLUB stats which indicate:
> >
> > 1) Even under peak zswap compressed quota ("pool") utilization across
> > 10 consecutive iterations, SLUB comes out ahead in less overall memory
> > overhead.
> >
> > 2) At steady state (when 10 iterations of the workload are done), most
> > of the slabs have been returned to the Buddy allocator, except for 3M
> > worth of slab setup per compressed size bin (0 objects in use): this
> > is as compared to 32K of zsmalloc slub metadata that remains at steady
> > state.
> >
> > I learned some really interesting things from these experiments, which
> > pose questions about the memory penalty due to latency that zsmalloc
> > adds to zswap compress/decompress paths vs. "internal fragmentation".
> > I expect to quantify this with data from my experimental setup.
