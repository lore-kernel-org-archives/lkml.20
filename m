Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAEE3F484D
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016523; cv=pass; b=eQjBvQm+FwX0Gm8igWaCpywMyBiWLJv2ZXQm+RY4DcpTp/+H5b2Q1h8DlBaF/obZ+K+hW0ZMzNnTmfaTled6OEYB18iHe9M0mlPS+5pY2XYtRYj51prtTFRm10wszW0LVeyHnqyN6d+NGCjdL5J8rruC5YgoTy/nN8q35Bg9yPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016523; c=relaxed/simple;
	bh=W0LyutHRq4/XTAFmwy2p1eN0RVHG+QvoaRK1lZkjFD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ht4hcQY6j34zGR+Yuk+scOwRJk7znPNiBKNTmRDUGr5sc9FZefiVbzCFVrZP1He+mAuJdc7TCJhwAoC8ExCvxiFpI1AjTE1O1UYTS+psFxIZ/4fm+ow3SLF1AAtNCghER2Oa1hElkBK64AYpbybUg3xZ6L9WEt74jgAUBwJZllw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo5VleIv; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo5VleIv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-486e8faff03so2017596f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792016520; cv=none;
        d=google.com; s=arc-20260327;
        b=P9hdvIRk8EngYIsca2UWYlNntTV7Wj47ghqmmCDpNlRJFLTp4gAYhdMToi1zUx7xEt
         aVmA7FTOWMfnLMcMC6gGaqxMYcqNx96PkgePr+KVtJThxIi18+o+yWBo9xyazKYbdJH4
         o8SJsKkDnXn7aUbnQ4/aUk8EZbaKxw9tT9iQxaMJWxErLcuC+BncFA1bRqcetbeAdVlI
         YD1d62mK8gIyixjprDCtdVfKrNj5eSmR8/xoeGFZFw5qeAMQklbp1f+jGEF4kkznsQPU
         7rMqRJhkBoqCuYDXMGjGLD1qoLSGsa6s1mTQQiUPsbJOKGeiVelE8JXvMmTBzfU6ayCW
         wFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8QQjN27s0Pot0JCVcrmzcvPmF+Pv8lSLqLgVFGNeaI=;
        fh=2YPcb8K6KqcI/ixARDriHGzEB8/NfrF+VTmALaZGX/U=;
        b=id9kQL1IdI3NJppOBWRibzaLS6qFnSRnVbKdf9hKulOFzCrCG63GubJTkstJ19UsCc
         FHtIW33WEOZWIOyiPcZ9HsDD/a3Ib3nkRdv5mAQ3RhlFc+NgGtucHvxudecuDXtoS+9I
         x5YWYxkmsLEAHXtFNo/MvUFDlx0mXkr+kxnYM8Ej15RqgWUdAGLHbdOeRe/H8iV5FaQJ
         zoGi0ckyWVt2SGMydhhIKo2hkVQfUDeIclOpTq5UC5YvrM8dZgl2P3KNdk9GNSjUy7wo
         5h547t5onbBDPL1B0j+rmblHUxuAEYl8l9rIj97s2M0UdMh/4PokLXsliVjn+1gvKmjt
         p4qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016520; x=1792621320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8QQjN27s0Pot0JCVcrmzcvPmF+Pv8lSLqLgVFGNeaI=;
        b=bo5VleIv7V4nY8VbAmNp5PveYqGjiPqyh37uN+1k4dJPcVju5QOfIwWmvCL5sH1V8P
         jH/E4CIUhadsEt6uhlNi78ZY9zXQl82CJ9Tsd2AN/6p+N4AHhKqqWY94tKesceaMtf8R
         P03jYcrKDmPCa4xOH+/yHSMSu6pPbbtUlY6W7qrQoHU6dcT5UXwJV6WmzThyDSNCB3vk
         CLX4CEi0juIj1pXQ8aFQ9ot02GXC0q9V9Kie/yKaQbP+q4GWgSrKJv9jX+iqfO6ngXOH
         4nAY5Dgrn3GaAgxarq4xOaMzdslscH23ATalr6u6JVHL4OPXrv2odJPT25lpgNEmkJam
         bn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016520; x=1792621320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8QQjN27s0Pot0JCVcrmzcvPmF+Pv8lSLqLgVFGNeaI=;
        b=0qDxLqPZaTFSEjk21QcgebZIGGj7Kdj7C/i+G0902TlIFl/F/g0fKE/q/QorIodzF1
         xNDXNdtZnCHX1/go+YZVoccoCY1yWY4UJxzxXINlpci4V2bTupuOjKNO9MuuBaeHqW/T
         6qUxHFT3XeSnQNaOLJ/s2goLTXhg0RXDLBcRURvxqf7Ss0dk6gGV4r7j5lfb3WnW8GQk
         UsI6fhN20sswg0Wxx1bkXzc6BVDuj4xT64qRtke5r2spWJuPOg71WKv87RQr+SAhGpdr
         /dW8yZTSPUDjfJi8Hu3NKS5I4hquFEmvVeJoQQ8yet+Da2MydNaaPCFbA5ooXqCpvewn
         N7Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxr1sUbyHRja3JInFeFdLCQvArED/R3eDLTA6hhlRQcHmmLGzYFYD1CqPBHiber+YL/hcV2Ne3q4QbZTi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYImUuLNClvDrvya7RCEZ/d6GO+9gndLiX6HLyYzxWSv7PXfh+Ku
	2weq6FFiu/fq//RYeTqINeyQNw72/EhUl5KGfzbVdSS+j2RGVZ1LRBcpW5xAp1Qrkk8Jzu+rND3
	RNYTXEDm7e74RSiPr3aukQiphtcOj7S8=
X-Gm-Gg: AYBFou3EdRuwvJRXNAkrDevQtjfHpDMbyzMKtPqeDbe9OqiEyzmTFVA/z6Q+z5PQ+38
	i/iRIp/IE1fM2gRM3ql/Nv/hxWALLiSiOuyh39Wz8A6h0JMSAnfWcJ/AXwJ+7sYHDLoo5RBRDx7
	6Jfbwe51KyMuTKxkZ7phr5E21YV/Ri3TWztbzSduXvZ/Lu17InmTz/qosEwAAH0ft6q4rbc6YHP
	eG5j7f9HbCox6Plg9gR3NEegXnky2KWhKn0c3m7ZcPlehyDZtZJtt4juleCNfo0YBE2oKVqJrYg
	eLYqDRdIhG0/nL596eDj2OvayM5ZfDd2/hTn6E0Ft3j2/eNjNgLqqa92CcPAgyE/XeA6+p7mbmN
	Pa1tn3R+XhbbA4q2E7XN57x7nAWlaRl/LQ+Ym2w==
X-Received: by 2002:adf:fad1:0:b0:487:342:d142 with SMTP id
 ffacd0b85a97d-48dbacf59d2mr23574589f8f.44.1792016520219; Wed, 14 Oct 2026
 15:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013221307.850803-1-joannelkoong@gmail.com> <b90ec4b6-e0a4-4f46-aa3b-b1a3a08570c9@kernel.org>
In-Reply-To: <b90ec4b6-e0a4-4f46-aa3b-b1a3a08570c9@kernel.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 14 Oct 2026 15:21:48 -0700
X-Gm-Features: AclHuK_tUcdkEvV4W4vq6H3QP4SX_X0yPFMq0-te8p6YxVgvDdJo3929XLEFj8I
Message-ID: <CAJnrk1aroGboovN=VVSkODEvcGxkAOaDmg_dh1NyqDkTjwF4Uw@mail.gmail.com>
Subject: Re: [PATCH v1] mm: unqueue deferred split folios outside the lruvec lock
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Barry Song <baohua@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 2:31=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> > @@ -177,14 +190,10 @@ static void folio_batch_move_lru(struct folio_bat=
ch *fbatch, move_fn_t move_fn)
> >                *
> >                * We're bypassing normal cleanup. Clear flags that are n=
ot
> >                * applicable to dead folios.
> > -              *
> > -              * Since the folio may be part of a huge page, unqueue fr=
om
> > -              * deferred split list to avoid a dangling list entry.
> >                */
> >               if (is_lru_add && folio_ref_freeze(folio, 1)) {
> >                       __folio_clear_active(folio);
> >                       __folio_clear_unevictable(folio);
> > -                     folio_unqueue_deferred_split(folio);
> >                       fbatch->folios[i] =3D NULL;
> >                       folio_batch_add(&free_fbatch, folio);
> >                       continue;
> > @@ -201,6 +210,11 @@ static void folio_batch_move_lru(struct folio_batc=
h *fbatch, move_fn_t move_fn)
> >
> >       /* Cleanup filtered dead folios. */
> >       if (is_lru_add) {
> > +             /*
> > +              * Since the folios may be part of a huge page, unqueue t=
hem
> > +              * from the deferred split list to avoid a dangling list =
entry.
> > +              */
>
> In general, this lgtm, thanks. I am confused about this existing comment =
you are
> moving.
>
> folios being *part of* a huge page? Huh? A folio might represent a huge p=
age,
> but what does the "part of" thing mean here.
>
> Is it simply "Dequeue any large folios" ?

Agreed, I'll reword this to "Unqueue any large folios from the
deferred split queue to avoid a dangling list entry once the folios
are freed".

Thanks,
Joanne
