Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EB50E580
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662666; cv=pass; b=EvNR9Y8Ej/Ojji2TwaljDhgnFoWCu0Nl+/HEZ1uARK0EAM5fhYbZ9kOEIoBtBcgNoMCfzvbsLpmhzn2Gcf2tBKzdV0aNT0nl6Csxi6v4oindvZFE52T8mxaeC+GXl3QKAw0XietG9iyq/tq3xICovKgxGItFJeogXzH8bzTh8gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662666; c=relaxed/simple;
	bh=ki8EP9bUSPkKjTAgwJvnAEPBiGsgX2hwq11+7AcUjrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GeccL3y9AcgksOJAHaIOZnausWT5okgk1Bq6f/LAyaQTzD8lXMTg6U2T+XUi+EMdz3LuyWc3udwdF/fZDLt0nUKB+PjrTGMNZy/JZPzZEig5KIze51BZOUB96QeditIVDBYSIV7vZEG5dPLwJxh4b51QdqdxuX8hweBYHfaoPyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UD9ab8Hw; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UD9ab8Hw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso27675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789662662; cv=none;
        d=google.com; s=arc-20260327;
        b=itTsjf1Tke+nb4qxmcKCxGuf/vE71i9DPAl15XEIsi8sdsAF97rTxrSH5xKWHrjopM
         nAvO9B7W0EHIxaPUTbz91SJCjzOLNduGJu6GurZCPO776GLBMRgv0vktBj6iaD/LEPXD
         rwfmafmk8m3+76dJyKZK5QHqEcQlompDsb555BIOnONU+a+DpdMsDvgGgi26FWYYkEkt
         IamVDKOs2woTL0T7rtnumyuZR5cuCrsG+NWNES0Ai+TUvGnDUZj3JiYbwV+q0eFVQyG6
         I2hRNsoeYyH8BZza5MydHC1sLhws1O3pLBSUlH6fwisxSi9LhQZB2x0mSaeLpilZ+Iu+
         PkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tXwhH+XcURTEbCq1x81PCzjps805OYxsbA4JBXJM2WM=;
        fh=WA6GIjbgY8O9uNhVH2HuF0iPA3Rrh+5TnnHIuM/eJEY=;
        b=eKtq3n7GT5t42tMjK7t0cYwxSjhKs3jrR6cNucJo8oO0UTYOUcIhIbZ81PhrJQUUe4
         PIFFKUmgQJWrlHLKycjkylXe9pMOeNne4FpeV/I6Xe1zinByg9byN3cgYVUhGbSDMoh7
         Hh/7vUPtUDqXSvhXC17YKFYE5oIGLWy96p+PuMJiYpAAlVxn1BQREnbbJynPh/EX/mGn
         CUX4fAkhhZc9h9CBdBJymJw3GNotJhAJxvJXjqrISSwbvJ6AycSdnpYqOfSVE4kATM7X
         2HZC+iIKUFhXXYG4MQG4zoYAFvtSno2lk8OgXIWzpMWUU2TQtK2EVDvtnNM45KgmSyct
         tXWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789662662; x=1790267462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tXwhH+XcURTEbCq1x81PCzjps805OYxsbA4JBXJM2WM=;
        b=UD9ab8HwqhFceapl4YioYnA0TSkXxUxcLA1hF5KT/HkfDJkWqOQY+WO7dlPeUQCVec
         Px7qs++nNiq+evR5WKHBP54/fnNXzhzGUMle/CqS2GTjjM5dSpM4CS9ntbmuyFtW5J3e
         4CuIU0nVvTF1y6uePMB0JIZlSGyxYp+Z/AVAXJX0Uer6QLVZc24fdiBifmCUS8UkbpWP
         3vB8bW08Uxdv0+xR2GkCrDPi2WYHXgCtwAPu7wJ9h2JLLqAMIO2vZ0N1SzusOXVHTIlz
         HsuU+dxl4Bt+GJBQRYhxg0va4izAUaaLbFmLbpSFVS7qwotULZRh+jZPlzIZxngUbRTf
         OLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662662; x=1790267462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXwhH+XcURTEbCq1x81PCzjps805OYxsbA4JBXJM2WM=;
        b=QxObAuazLo/KxIObP6Rv2QGouP89xF+j7R35sQTApKsuuHMAkOvhzGiDKgD8r1p3h3
         hXM5ixFifK3OSYye+ezxrdeohyD2tmgS8fq7LBwfjKLEw9TC621ALZxwzNJqKdjzyB5E
         modbqmVgwS3fKAegoekprIvGXQYtPhiZwAhK4+KnOw715ewiP94Hln5uxuaVjTv28MX3
         SSEFHta4NcqcJpHbaoDLVtBPtnNgyF9hmO8baVUzbEvp22s7pS8H2AmrPnMl6lZeC4PR
         BGoM/Pm2ziP01bkOdOeGBclm3YRON1hg5B0wgFRIPBfN/36a1L/CQ7aGxm/D4/S9Qh5l
         a5VQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/eKCsMQSRSBN9Z+rMZQ3gX8QS4RT54qGM5Wb3NptICoL5o3p450OCHHX5VSH7y5yBGljckaqiugKeK8U=@vger.kernel.org
X-Gm-Message-State: AFuF++mRAQPiHHbgtmy56RZA2KK9fsUL47iIkuWV2rcXwCVEMXVO0EIk
	2VsjkBECc9SjgrZeV7i+dZW1QC5vP1NCPAmaA7jtDxCBV1aAkujH9nK8piZA0f6HqUm2PX35RxU
	Cy/kK7+zA9Dx2vxrCskrmxFCki/MztOW7i3BJkkGP
X-Gm-Gg: AYBFou2mLeiSC3PwcNOY3Hn/5E+FQelaX3tWEPBosxNoOIBGyAPaP0EKGQ3SGKixgXs
	uu21M22y5w2RxS78ZtUN54rmpVtZYoGfdczGFQjHfPWYqUzcFS+7EryVYZUNIEl96uon4Qh5QNr
	30ZdatNJXxw1av5ztfv50cJc43PLsUH6JwGtfNWWVUB1Q7ijw+2YQypcGB/LcTyYZEeZd2+Pe77
	OG5LkFjcAOH2yThlvxyEzgGAc6Nnb0dNxW1v3JRcvAHya3+tHE+9rP81BFlZINRAiZGHHoNds7N
	LavQHu95L6YijKjoPgs5qhnOPpbjkVaslxHTCrgWE74qR6FmB4hPseYcwclEeoha0SZNLxncBNY
	69I6nN5MJjM9HjxudNzdwNkX+HtLKw2M8x1o8+kVr/Q==
X-Received: by 2002:a05:600c:4a27:b0:49e:7946:d8ce with SMTP id
 5b1f17b1804b1-49fc2c72b11mr220195e9.3.1789662661590; Thu, 17 Sep 2026
 09:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812231905.2956588-1-tjmercier@google.com> <15342d9c-d823-427d-9ce8-04cf48c6854b@gmail.com>
In-Reply-To: <15342d9c-d823-427d-9ce8-04cf48c6854b@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 17 Sep 2026 09:30:48 -0700
X-Gm-Features: AcwNN1Uj5BaVPgPcxOdBtmVcsnbjqMoXReDNzWqGa1gtHNunRmMJCleRqYBXI-4
Message-ID: <CABdmKX1kM+ZRoj6R9R61kQv3dGQ=5ar8YPX=YdqtdJ1DO_-ZOQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/2] bpf: htab: Reduce memory use of hash maps
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:10=E2=80=AFAM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> On 8/13/26 12:19 AM, T.J. Mercier wrote:
> > Memory is expensive and scarce these days. This series reduces the
> > memory use of BPF hash maps by eliminating the per-element overheads
> > below. This saves up to 50% of per-element memory use for standard and
> > PCPU hash maps. The memory use of LRU hash maps is unaffected.
> >
> > Map Type & Configuration            | Old size | New size | Savings
> > ------------------------------------|----------|----------|--------
> > Standard (key <=3D 8 B, val <=3D 8 B)   |   64 B   |   32 B   | 50.0%
> > Per-CPU (prealloc) (key <=3D 8 B)     |   64 B   |   32 B   | 50.0%
> > Per-CPU (non-prealloc) (key <=3D 8 B) |   64 B   |   40 B   | 37.5%
> > LRU (Any key/value size)            |    -     |    -     | 00.0%
> >
>
> T.J. are you still interested landing this? Maybe respin the series?
> Alexei was away back when you sent this.

Hi Mykyta, thanks for following up. Yes, I'd still like to land it. I
took a break during the merge window which coincided with a vacation,
where I broke my collarbone on a mountain bike jump gone wrong. Then
surgery and recovery, and I'm still catching up on everything from
while I was out. I plan to rebase this and send it out again before I
head out for pre-LPC travel next week.


> > 1) Unused LRU / PCPU fields in standard and PCPU hash maps (patch 1)
> > struct htab_elem is used for all hash map types, and includes fields
> > that are not always used (bpf_lru_node, ptr_to_pptr). For standard
> > (non-LRU, non-PCPU) hash maps the 24 bytes for the bpf_lru_node (union)
> > are entirely overhead and can be eliminated. Non-preallocated PCPU maps
> > only need the 8 byte ptr_to_pptr which is currently unioned with the
> > unneeded 24 byte bpf_lru_node, so 16 bytes of overhead can be
> > eliminated. Preallocated PCPU maps don't need ptr_to_pptr, so 24 bytes
> > of overhead can be saved.
> >
> > 2) Hash caching for small keys (patch 2)
> > For hash maps with small key sizes (<=3D word size), comparing keys onl=
y
> > requires a single instruction. Currently the 4 byte hash value (8 byte
> > aligned and padded) is used for this, but offers no performance
> > advantage in this case and can be eliminated.
> >
> > The implementation splits htab_elem into dedicated structures for the
> > different map types (htab_elem_lru, htab_elem_pcpu, htab_elem) which
> > share a common initial sequence (struct htab_node), but contain
> > additional map-type specific fields where necessary. This means the
> > placement of the key for each element varies with the map type, and
> > key_offset is added to bpf_htab for this purpose.
> >
> > While using key_offset and conditional hash checks adds new pointer
> > dereferences and branching during element traversal,
> > run_bench_htab_mem.sh shows no significant performance regression acros=
s
> > 10 runs on my 3995WX.
> >
> > Benchmark (all in kops/sec)  | Avg. Before | StDev | Avg. After | StDev
> > -----------------------------|-------------|-------|------------|------
> > prealloc overwrite           | 115.11      | 4.10  | 115.45     | 5.24
> > prealloc batch_add_batch_del | 127.14      | 4.32  | 127.06     | 2.32
> > prealloc add_del_on_diff_cpu | 23.22       | 0.93  | 22.91      | 1.60
> > normal overwrite             | 78.52       | 3.05  | 80.40      | 3.25
> > normal batch_add_batch_del   | 45.37       | 0.69  | 47.71      | 0.66
> > normal add_del_on_diff_cpu   | 12.02       | 0.73  | 12.48      | 0.70
> >
> > ---
> > Changes in v4:
> > Removed inline from new functions per BPF CI (netdev/source_inline).
> >
> > From Mykyta Yatsenko:
> > Factor out duplicate lookup_elem code into __lookup_elem_raw.
> > Use offsetof instead of sizeof for key_offset assignments in
> > htab_map_alloc (patch 1).
> > Eliminate branching and htab_elem casting in htab_elem_hash /
> > htab_elem_set_hash.
> >
> > Changes in v3:
> > From Sashiko on torn reads/writes:
> > Use a local unsigned long and READ_ONCE / WRITE_ONCE instead of memcmp =
/
> > memcpy for atomic key comparisons for hashless elements.
> >
> > Changes in v2:
> > Make maximum key_size for !has_hash depend on word size for atomicity
> > on 32-bit.
> >
> > From Mykyta Yatsenko:
> > Put the htab_elem* common initial sequence in its own struct (htab_node=
)
> > and reuse it across all element types that share it. Eliminate
> > associated BUILD_BUG_ON additions.
> > Replace both the hash and key fields with data[].
> > Store has_hash in struct bpf_htab, and avoid per-element reads of it.# =
Please edit the description for the branch
> >
> > T.J. Mercier (2):
> >   bpf: htab: Split htab_elem_lru and htab_elem_pcpu off of htab_elem
> >   bpf: htab: Reduce elem_size by 8 bytes for small key sizes
> >
> >  kernel/bpf/hashtab.c                          | 418 ++++++++++++------
> >  kernel/bpf/map_in_map.c                       |  13 +
> >  kernel/bpf/map_in_map.h                       |   2 +
> >  .../selftests/bpf/progs/map_ptr_kern.c        |   2 +-
> >  4 files changed, 289 insertions(+), 146 deletions(-)
> >
> >
> > base-commit: cfce77b63375dac81d53f2f85593c548415206b7
>
