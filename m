Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1F23B9DA1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178923; cv=pass; b=kSsjt/xi3id/5w8PhIXfWqF5v7bgJkY9jw+JpnvE4CPGgDE5ptBOM9DwsMBDTpuwwtRE0fjA+FlXnKMsDbNs0OkmP9GVgZE+8nJ+nyUGFIn4kXPMrMKIp7U2i7bn6r7tu5EyjXYZzblXcNCelYyyHXXkKMDRsSJIPPHyVMDpkLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178923; c=relaxed/simple;
	bh=mOrCpobVQthCT8Aq4pWmFtC9s/BebuXFREmkWK++zlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDFu4zJf3QUrpVXXp9Y15ScWOUAG8otFIanH84W8IVXHnZ+NA9uEcpKQcuWqjQ4irNVxeD6UYdMSHRG3umIwP4PBGk99rXgBv//NSr1bUICIcdclLy9uY+ZH9SLgjQBmr2uPWso5qDQ6SFhDA8GE1Z1ylT/GnKvJsVR1esdIEzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFd3AU6K; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFd3AU6K"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e04773687so63250f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792178918; cv=none;
        d=google.com; s=arc-20260327;
        b=fYRWrF56tIeNiguvvYWKdHVkBnckGotrPzWPiRrzIaIHHvxZKc0YfXU429dDQVtr7d
         l4QekHc3m7CXbPlIZVVpoZaQabNvGYBUHElYNLk6/dygmR9fmiOKYpdtgUARdcLWRn7M
         CsWawQkf8Dp8E372JqoyXR+N4fN/x4LjVH2ld9JU6Aq4BaDwLjER6IL/A4zTi8LQ/otz
         BXaVMWCT6hpQgYEy+q7Iv1KqKpk2q7x2b+ehCkVb1CRdrFsmp/paWZ4DdikzaiPBKu78
         mBVdnK+xe5Yz2pAuVsN3UvCsYA3Othxy6duTZu28nw4xS4m7DeQovMhNRYgTQueGZoBP
         Hv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gTm2vhKjxaNKyr2bSUGCE5oU0QWQpVTbCRBZYWrgf1M=;
        fh=yq/Nnh2aX+yyPy4QPIYsT+WG/TRtq0JBUrH35Wor0PQ=;
        b=kON0TBzE45lQ24cYh0nW8UpjK83CzbUswAcPJevzwUBgVmDgUphuDvQPNrdFNG5bQq
         cdAV9pOpu+iWMBcIKWq5eBiuJ+jKUXFYePFXH8QxiZQ+XnzC4vXBuKsYXWeW0k52Vmla
         8Zgw3fgb0qB5J5dnJLjGcLkEy7+TAACQIHBJDdgv+v+ko+QVGDMQTjXktSWimyAWYwfw
         /5rLh4B7vFwTcoU66eXQssI5YWLeqhVgtbq+gE0uSbvsY/TSHp8DYNDufux5oHq+E4I9
         fqjuT5i/qHZl+1qMRdO0eU6DS4OndVTFrbRG3f2vdHRv00Jkab+jDxLRevkQlMG+SkJS
         fpdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792178918; x=1792783718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTm2vhKjxaNKyr2bSUGCE5oU0QWQpVTbCRBZYWrgf1M=;
        b=DFd3AU6KgdKFBlLrsoDs94UzRhrfsX2pHu8tix1swNSV948YeXvRNBm12t7DpNLaa2
         AdaMWsiP/lCF14+TbiFEIfa9drhOqKxDR9hVXrhlgRyvzV0OQ3FyuDE1mnHvoXqLRL6e
         txKHlL1VDT4Qum7zaWOO9xBs/2aA8a0Xo3AzDuKE6ab+9dRtGRedTkXZvO+3LJcvq2Jj
         P3trXDiKYMv4ExCA4XJWPYoTX0LMYX07c3d6hsH563c+J/I8c/Mq4cK/vaW7pfKlD0uW
         /yYc06oBbZ/X1xq2gMp79D4OmcSmz63nep4QA5eMkLUr5sArGMs8+jcbbmwWbNdcpJoP
         V9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792178918; x=1792783718;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTm2vhKjxaNKyr2bSUGCE5oU0QWQpVTbCRBZYWrgf1M=;
        b=0agaSo0+PutnMj0+DZEfqRPeOSELVPVfEQ69lapfo2sGnhTnsmvpM76bFixUs6gqS3
         uA9t7xcOboKfLUsD7tWpKghewEa+55mc/2bLiTK2mZG6KI9XQRDzHiGLtg+q9zVHShu0
         rwnJp+258qxSGNJnazaA9mkGKr7Fa7OBc0HSFskpF097S7dlFyiqHi87Fzv+9DJ5HJY2
         QvkXLSq57hPAREDylJ0cofMkVP1MWLn2o9inUqXsi18fr5UH0/aKhn24IDlTd0HdM97Z
         oKRks5TU6iazFu9uZNs/G6m9HRyygul7c7Nm5sc9Bf1UWY633VM45QbhWNUO3eHHA2tt
         y0Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwtShuT8QkW8XazBwRUnGJjiaaNQI7M8IgGXug8lPVl2HaZL2rofjH/jUTZIbAGAndlDxkKcIZkQZG1mJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC1DLw2xgsam7RpB2myq9BD0sLgMzd2+2c7N1LPVpOHWYPe586
	fxUI49CSftGf24nvrR2HoxnytPtoUpRhPHnRuMCfkpM4OWSlYKHfFjqWvEP6/Pyi856OQxqqP7C
	zumqQJdYTdOHVMyz5fYZOiXb4cwMNHns=
X-Gm-Gg: AYBFou0QaVmksVTtyrABfskoQwilnshRCzgPmOoLOl+SPrP4JePF+GWvvv0DBy1Yedk
	KuQ/7z+UHLiR5tTxf90tpcy2kVTOMEZ27GQ/KNgDsSWUQNc+bL6MlZnHF3jgYuW9hLCdC8U20OU
	CPV8OzXesXmrEmSBnjrmmF4XOAs2dTFZqMvmxwj5LsOFSHiTTDFlmxxMc12B6e4M9kmrEG1IleN
	Uw1kF4ILOKb4a9LGBlplx115//+3bxsl5gRPEJAbmDQ0fyViMxgOfBx8YV+mT9T1aSpu/SlExfc
	4NZjAvE1iMVqNSSxqHRv9qPlzvopy2H4a8LB/r072gndnGie2T1LWCfFKY1CsCLbJ46VWcsd0kg
	tUeqSNV2KDb71Su34lG8gs9RqL7T9+29JSucc4XkrrDVbOlhZs9bhk2dwREHk+rNMY+txZyMLA4
	/kq6D/cw==
X-Received: by 2002:a05:6000:40cc:b0:48d:f5c6:1a0d with SMTP id
 ffacd0b85a97d-48e07bb5600mr1302929f8f.15.1792178918026; Fri, 16 Oct 2026
 12:28:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014090821.227366-1-jiayuan.chen@linux.dev>
 <CAMgjq7D50X47JFsTnF2-jYGv7i-Nd3WhQLK-TJGy4XkhMQU4OQ@mail.gmail.com>
 <62d17959-d695-4fec-a87b-8eadaaf995a8@linux.dev> <CAMgjq7CJ+bwKgwUmCzO9Hr7TrL68bDjgAsLx-4AGuXo6zowh9g@mail.gmail.com>
In-Reply-To: <CAMgjq7CJ+bwKgwUmCzO9Hr7TrL68bDjgAsLx-4AGuXo6zowh9g@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 16 Oct 2026 12:28:26 -0700
X-Gm-Features: AclHuK_hp_b8zp120YCuqjyWWJ8sGDHX6zBYEepjMwfG9dhLe1x58p6Tgmfo-f8
Message-ID: <CAKEwX=O4sPx5MtGL4-JwLzD4TWm7fNycFMiuOqLk4ADFUUipNg@mail.gmail.com>
Subject: Re: [PATCH mm-next] mm/swap: free swap cache folios the zap path gave
 up on
To: Kairui Song <ryncsn@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, linux-mm@kvack.org, 
	Jiayuan Chen <jiayuan.chen@shopee.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:24=E2=80=AFAM Kairui Song <ryncsn@gmail.com> wro=
te:
>
> On Fri, Oct 16, 2026 at 4:42=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.=
dev> wrote:
> >
> >
> > On 10/16/26 11:05 AM, Kairui Song wrote:
> > > On Wed, Oct 14, 2026 at 5:10=E2=80=AFPM Jiayuan Chen <jiayuan.chen@li=
nux.dev> wrote:
> > >> From: Jiayuan Chen <jiayuan.chen@shopee.com>
> > >>
> > >> On our production hosts we saw swap cache only pages keep growing fo=
r days:
> > >> on a box with a 500 GiB swap partition, 250 GiB of RAM and 250 GiB o=
f
> > >> swap slots were held by folios that no process mapped any more, char=
ged
> > >> to cgroups whose workloads had long exited. The only way to get them
> > >> back was swapoff, and with other services actively swapping on the
> > >> same host that is not an option.
> > > Hi, thanks for the report.
> > >
> > >> Such a slot has swap count 0 and an unmapped folio pinned in the swa=
p
> > >> cache, left there after a process exited or did MADV_DONTNEED. No pa=
ge
> > >> table holds its swap entry any more, so nothing comes back for the
> > >> slot; LRU reclaim drops it eventually, and the allocator only reclai=
ms
> > >> such slots once swap is half full. The growth stopped exactly there:
> > >> at 50% of the device, where vm_swap_full() becomes true.
> > > Hmm, I think this indicates a much cleaner fix is available.
> > > vm_swap_full is inherited from the old allocator, we can instead just
> > > let the allocator reclaim the slot if the slot have a count of 0 and
> > > ignore vm_swap_full at that point.
> > >
> > > Will this work? (Just a minimal implementation for reference, will be
> > > even better if we can avoid the overhead).
> > >
> > > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > > index c3288910b3e3..94670fe82f31 100644
> > > --- a/mm/swapfile.c
> > > +++ b/mm/swapfile.c
> > > @@ -212,6 +212,9 @@ static int __try_to_reclaim_swap(struct
> > > swap_info_struct *si,
> > >          nr_pages =3D folio_nr_pages(folio);
> > >          ret =3D -nr_pages;
> > >
> > > +       if (folio_mapped(folio) && !vm_swap_full())
> > > +               goto out;
> > > +
> > >          /*
> > >           * We hold a folio lock here. We have to use trylock for
> > >           * avoiding deadlock. This is a special case and you should
> > > @@ -903,8 +906,6 @@ static bool cluster_scan_range(struct swap_info_s=
truct *si,
> > >                  if (swp_tb_is_null(swp_tb))
> > >                          continue;
> > >                  if (swp_tb_is_folio(swp_tb) && !__swp_tb_get_count(s=
wp_tb)) {
> > > -                       if (!vm_swap_full())
> > > -                               return false;
> > >                          *need_reclaim =3D true;
> > >                          continue;
> > >                  }
> > >
> > Hi Kairui,
> >
> > I tried it on our box (224 CPUs, 931 GiB swap partition). It doesn't
> > help there: after 100 rounds of the reproducer the leftover is 291 GB
> > with it and 309 GB without, and both stop growing at the same place,
> > 488 GB, half of the device:
> >
> > # cat /proc/swaps
> > Filename                Type        Size        Used Priority
> > /dev/nvme1n1p1                          partition    976561148
> > 489006260    -1
> >
> > # cat /proc/meminfo | grep Swap
> > SwapCached:     489006260 kB
> > SwapTotal:      976561148 kB
> > SwapFree:       487554888 kB
> >
> > cluster_alloc_swap_entry() picks clusters from nonfull_clusters first,
> > then free_clusters; it looks at frag_clusters only when both are empty,
> > and at full_clusters only when vm_swap_full(). A cluster gets onto
> > nonfull_clusters in partial_free_cluster(), that is when
> > __swap_cluster_free_entries() frees a slot in it; after
> > alloc_swap_scan_cluster() has used it, relocate_cluster() moves it to
> > frag or full.
> >
> > A leftover slot has count 0 and a folio, so __swap_cluster_free_entries=
()
> > never runs for it. Once the live slots of a cluster are gone, nothing
> > calls partial_free_cluster() on it again, it stays on frag or full, and
> > cluster_alloc_swap_entry() doesn't pick it until the device is half
> > full. That is what the swap table looked like after the run:
> >
> > list      clusters   leftover slots
> > FULL        106415       54484480   (all 512 slots leftover)
> > FRAG         44822       18471614
> > NONFULL          1              0
> >
> > Making cluster_alloc_swap_entry() revisit those clusters means changing
> > the list policy.
> >
> >
> >
> > > Or, from the LRU's side, put swap readahead folios at the tail. I'm
> > > actually trying to do that and it's not very easily doable at the
> > > moment but will soon be easy to do.
> >
> >
> > That helps the RAM side under pressure but doesn't give the slots
> > back.
> >
> >
> > >> Options considered:
> > >>
> > >> 1. Fix it on the readahead side: after the read, check the swap coun=
t
> > >>     and free the slot. Covers the lock, not writeback, and the
> > >>     asynchronous read path unlocks in the bio completion where the s=
lot
> > >>     cannot be freed. Two places to patch, neither clean.
> > > In fact, readahead checks the count before starts the read. It should
> > > prevent some of the problems but seems not enough.
> >
> >
> > Right, the count is still 1 at that point. The zap drops it to 0 while
> > the read is in flight, after the folio is already in the swap cache.
> >
> >
> > > And another idea, what if we just add dropbehind flag or rotate the
> > > folio, if folio_try_lock failed in __try_to_reclaim_swap?
> >
> >
> > dropbehind would work for readahead and writeback if the read
> > completion honoured it too; today only folio_end_writeback() does, for
> > zswap writeback folios, and swap_writeback_dropbehind_folio() expects
> > the folio off the LRU. It still misses other lock holders (migration,
> > split, ...). Rotating only helps under memory pressure.

Yeah might be worth trying. You'd have to modify readahead and zswap
load logic to check folio_mapped() etc. I suppose...

I'm not sure how reliable it will be FWIW. There is still a race
window right? Albeit a bit smaller - the readahead thread might check
the dropbehind flag before __try_to_reclaim_swap() sets it.

>
> Right.. But I think it will be much better to avoid such folios from
> hunging in the swap cache in the first place instead of having a
> worker to reclaim them. I'm not strongly against adding a reclaimer if
> other approaches are too difficult at this point though.

Also, IIRC, dropbehind can only be handled in task context, right?
We'd need to make readahead bios to complete in task context
(BIO_COMPLETE_IN_TASK). I wonder if this has any perf implications.

Another idea: how about, in swap_read_folio(), where we are guaranteed
to have the folio's lock, we check if folio is mapped. If it's not,
invoke folio_free_swap(), unlock, put, then drop that folio from the
submit batch? That takes care of the readahead race. Seems safe to me
(I assume if a folio is not mapped and swap count =3D=3D 0, then it's a
pure readahead artifact, but maybe I'm missing a case).

The write direction already tries folio_free_swap() before submitting
the writeback, FWIW. So that takes care of both directions. But who
knows - maybe we still have a small race window, and that's bad
enough.
