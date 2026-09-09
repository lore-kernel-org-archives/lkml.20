Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6547035E549
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974014; cv=pass; b=vFpa++Pw3FJ2rSmexR7Utzb6xt95RPtRKNyrcyyBHkWzis/IlCXuFYIjY1nIgp1PoVAgFojkSc6cpRARuShCZCoJMCVSWKRWERSVlyKUEyxvuaELNX/aucHrfyzXIzKiSyY8rmQPFknkMt+x925NpvLYei5R3Xo89/GDSVON5mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974014; c=relaxed/simple;
	bh=BoITJbg+tcqR4yAMRl6LbU3qdaLtqDYLmTuTo1MWr54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGSjis4ERkcxnG7dF0uBTk9OQpE6XVayG0x5TXrSkaYFKbU/ZUCDeIcTV8Y+MMF4qrayqOYhV3TlsetwpwZqGCE1TzYqNpRZEaZGHdy4dN7H9vBfCVY3xgovOkL7ew8MuXRrMGIaXir/ofLA2PcpFk2wi/jEJmRvsCsoZu/9RR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lMOncLJx; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lMOncLJx"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5306706e89dso328921cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788974012; cv=none;
        d=google.com; s=arc-20260327;
        b=q6TXD7+mg/Lk2lubpXnIp5vhn7+KeMQTIlQDsbtgqxtfwXosT7pvPq8B6FOJQUfCqc
         8RDDjpEeNwOVRDQFEFnGQXTGtWJzfNPhchpG9G06H9Ur8c97Rzf4Sy79Ehf4aDhAGHxw
         A9o0u19zHvDlNdkzw1hI1Q4dFT3/uDk4ZiOEikSSm8bmQM0c3sB8rRpFts/WYjJ8hEID
         UnMJXkEuWP76XoDMlaGqgYmJB/8rWIi8X8YwAqDpMLgkJAfgKVW06zbdNI48MeUIJFid
         jJpHQuWFPg0dTuZAA0oxgw//SzCQDumrGFoLeHhyeIAUwTAN/YKl/M6ZCJ/mh8nma2Wz
         E/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BoITJbg+tcqR4yAMRl6LbU3qdaLtqDYLmTuTo1MWr54=;
        fh=JCzmrSNnjKRVyJho1vNNeR4o15CUNRmnCccUPVqW/cw=;
        b=f/k/FsmDdOL39uNVnxrlICfeN5uDWSLCy8oXfzfIk3LnZ215KPvgIuxkO0JqMz7/vM
         vMNJH2Pz+jrpZELVb1C6m9oACMC8XQZP5mGQK6w9ql/512ukOihj/xE9Xq/fDC5GCwuk
         SY94J9dugWecbjr61wSWIvVGTrACxge/E3s5NpLS3SH3Dv4ze0Cdnq30jm1uhY5r0+19
         yA0y9xGDjVHJQMzy12qfDsrX+o6vCVSlcU1w7RvmD1HpjpFNiVLznWpDaQakWZYIVog9
         pgx4om2diDAeNXoTEMgNeJFJmRJbLfQ3vSKNdAeQas6sSmy9yHYpJdj203h8be1m+dZK
         4LhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788974012; x=1789578812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BoITJbg+tcqR4yAMRl6LbU3qdaLtqDYLmTuTo1MWr54=;
        b=lMOncLJxINj9R9tafp9eA1n6M4h6oqObsKm3SmUuE9xfP3sFsYnDChggvPHMbofq5Y
         CzdDiGscEfJCquZ5DWLuCnUBkLB3B6moWZblGJOJ64SRU7ji3vuqaAkAhFL8veHSi5uP
         VGR3VL10GfW5ERdyu9jKjOXC1RENAeS8YNdhro4Cv6iL7IwTEMeGdlmOIDtgvpRxl9tJ
         9UzH32aTScoi+WpPHZJUSl+JyfoyZWGl3Y36000Fut03vjZHiLFQ8b/noZ9AR4k6Yz7g
         DEWE8XQ7FxhfQ/6iOVixakzGF0SyaCZGXD8OgKG9+Mr3+qG+zD+UWheCKEHzB9DfLmdJ
         H4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974012; x=1789578812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoITJbg+tcqR4yAMRl6LbU3qdaLtqDYLmTuTo1MWr54=;
        b=FZ0Vu8mCfw/lE/WkIoS8YYazwJjzfXA/Frg7FH92eEJwBkOrIk9lHBc2s6e5tLtVv4
         kn8F6TgOSTAVxbXotWuBpsQkwwP8R6NhGax9Q2rUPkHP+7MPIjJsVCet4fQiNnXiRbev
         nram+GauUhRYiztuSk20qoTLt5rTaPXw2ibDGERTgPChen0C0+WA8WKl2bavg+9jDRkg
         CwGIx/eoHIHSRQY4S2MyLD5oDBPMr/xdDNAgi5qlL+NjFMM4hEnXEvDsLQzj21iLg6Fz
         jVzOt2PNgHrgZrsydk8KxBzdUWVQzFOhPPlCNP5hnJcCDGKSkWqF5XJXItEo8cmRNMzD
         iTpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLhwyHWimIl0pPrMM8WjlgsZFl9reecII8PzjcgEu/w0JnAwR6Ta5sh+E3l3qrg3O/WhbYW+SJoEe4bXk=@vger.kernel.org
X-Gm-Message-State: AFuF++lNtYd6x55RQxFuwVSiFnPjlkseIvKcmbi7cOmVfwWNHQfCOVid
	Ls3I2UCoTyLmKBTSfg2Ixy5ryIRhQ7Io14hO9J8Y7xQQQjckyqYsiWaOMZFqkRHo8G+2u3O1JaD
	ziLOl0JN1jLERQJVZhyEVKAaNhrDj3PrTptLZIro/
X-Gm-Gg: AYBFou3Eaqx3lJnmjyoQQGpd+6ywfC9dD0dMlVBHZqoe0RQlLEhUXpiTOK71S6QDpNv
	u2o3FEfVoXVkVvIVHwVNNyxPg+BnyI49hSrliFWNriqDCtiJ7C/ASIr3emjHAcQkvYE+cCaHNyQ
	dSE9q2CwQwxaY7RyP1zewV7/b4jlbo8HJYNnJT2BQpfIvYLDKkDb1/yvkW3+sN89zxD2UD+AMVv
	jLj+x/aGsA1rLIIBRu6iIMnsFQP1RwPaj9SQGg3DpKBBNL8huswIs1do/hVcKsFahRI+DQCMg8l
	79UZ5VuOgBnr4eL8iFsimNU1eCrJ/G1s5tXa6sxBJan4AUR0cmXrAU5GnA==
X-Received: by 2002:a05:622a:400d:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-530a5f013ddmr15911cf.7.1788974010867; Wed, 09 Sep 2026 10:13:30
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907063918.3432401-1-surenb@google.com> <20260907063918.3432401-2-surenb@google.com>
 <1d5011f8-26a1-41e1-bb9d-8d72c08b8fe9@kernel.org>
In-Reply-To: <1d5011f8-26a1-41e1-bb9d-8d72c08b8fe9@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 9 Sep 2026 10:13:18 -0700
X-Gm-Features: AcwNN1VviiL9YOndRTSyFCutgcsYgAZMb28lE2qZmCuqHAyOyXU8c5SOoH4lvoQ
Message-ID: <CAJuCfpH25ML1+hdhTtZUoSjgrNcGv9HbQD8o5UErmAdW-7C8Bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] proc/task_mmu: remove unnecessary helpers
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:06=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/7/26 08:39, Suren Baghdasaryan wrote:
> > When per-vma locks were behind a config option, a number of helper
> > functions were needed to simplify the locking code. Now that these
> > locks are universally available, we can do a little cleanup.
> > Remove lock_vma_range(), unlock_vma_range(), query_vma_setup(),
> > query_vma_teardown() helpers.
> >
> > No functional change intended.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
>
> As Usama says, this could get picked up early independent of the rest (ma=
ybe
> even as part of the other patch set)

I can post the 3 cleanup patches separately from the one that switches
to using per-VMA locks if that's preferable. One downside: I'll have
to wait until the cleanups are picked up before posting the last
patch, as it depends on these cleanups. Please let me know if I should
split them anyway; otherwise, will keep v3 as a single patchset.

>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

>
> --
> Cheers,
>
> David
>
