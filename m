Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F3B430794
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343646; cv=pass; b=WsMexlcehLOy3823n3KQnDWHAuEeJitR1gEQQejS2SCLMjzjDDNiLU6KgglWvICH6JOIRexxYVvqFUv8KjhXEwf9ey6Atzncx8YYm3HeH9lPDZxi8QEvmAjcZEN7m9pVFzAMEgbQmbTImX9MhnLeVPB6O79sNVunkVJv2V3t/08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343646; c=relaxed/simple;
	bh=1xa+lElD+YJMoo2jLjMuafTdhcpMKsbzXGbVsD/2zXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByodvE/VU16cMdblL0jJ3PRnz+VUT6XztWQdJ84nclU/Ojm4szzgyxjmBi8LxLW6pKoaG2lhj3jEjiV020G96PdA8nQRiWbD3poqVyFH4gJD5LiubGT8diJwOUJYcVZGoxeY9DZCIuDjFP1D4oQimvIHUQgMDoj3ReZA8rZTBK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GGe9ZU8D; arc=pass smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GGe9ZU8D"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so441642241.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:07:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788343643; cv=none;
        d=google.com; s=arc-20260327;
        b=s82LCvgFpguU6jcsePJJwkF1h7V/ndaAF+hmuXQKBNjzEwZtvilkbNAZzrr4Q/IElo
         cfDrYEQEspX9e/gt8rBREXdE7wKlLgpJNZua9z/nMtJ5cV/iF9iBU31BTMcwHt3GLWdX
         HYiNkMxZQw/TpyoCcUaZwYz7Uj0pcIRv7SnAD9ZZtWwB4S9j3XhqFD2PcdzQ1c5pMHuV
         omu43yeG0sEC5ScJrG5GINOH4BAlR7G4iTHd5xd5PgYqHIUV/XKdhVefN852t8rqmRt4
         UeeF7YF3b4RHJBan96/wExsCV2OMpx6NoqZrbcUwQVh6Ztrw+oIhCa//7ecM5Dt4IzYV
         ZvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LtaXRwU7EmfoNAd9qDxh30eMQcuF5WCOAQg3rtox4ZA=;
        fh=Lfanl1P9NQaNPTL4gaaBB5DUgBSKnYv4LtteI4ZAm/I=;
        b=kR5qL8/1IpqZmPjHqeq8jBO18KCxtspEk/oYDW++wQeK+/1NDYvasd68h33zmh0ox7
         b5fqrsuZJ6p0hirltWIaDJzyT7Qj4DmWPyl22rs1PRUwuZ3vSNYvtz99D6cfVfUPfoOo
         Apux1uqHKzEUdWVyQjClNfPhktN4/K8mvc2qZ0EaTC4opD5YYRqL0pl/gJMEA2RvEBzj
         fVeFkKysydVO3+7Y0HAyuvqYvRfPpkkhVNBzQO04zajhn6Q2Ij+NShHD86+sFtrq2YH4
         ksyOdLdI2KGR7r45qGFQF1R71+oBBIMCQu3ALjihJyw1ri60HOe0AWpcLU/7O6L7R0eU
         YoUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343643; x=1788948443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtaXRwU7EmfoNAd9qDxh30eMQcuF5WCOAQg3rtox4ZA=;
        b=GGe9ZU8Dc94fA77fMlFhyZI9JnoyD41q5AUAEQK0ULWLO+bGGfIxwH4OlMF2ZLjQXU
         WgW8W9yRNY93POrTBOtK47UMgEDuZPj0oitr3Ww6a2Jo8069gAyqTSdl2B4s1sCsHD7A
         mt44zKg4NJsm/jlF8sXWsS1IXTTwwpFiiye0B6BQ1XocPMAZyuk1qQexUvmZwyKT8PQJ
         G0FpG1UwlWGUq0soz3yj2PPNquv8MD4BJiXFRQnUrZcSPBCQyuaSvo1XZuQy71KUaolc
         yHhvsRKxx9tSlTYk5lsvjW9s9fkU1Lim3KaFazS+jMF4ufXF5RCrqvvo/uFxgw/2Ah/c
         eaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343643; x=1788948443;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtaXRwU7EmfoNAd9qDxh30eMQcuF5WCOAQg3rtox4ZA=;
        b=Dweso3I+SrMKfYqUYr8Rdjn5Nnt/NdnPjPW1Fucw7TBWYlOT1uJNIFjEMWqSC/o28w
         Aaz/eGNqFCD8JND2CVBiM4iCy4pte7lZqJPJoks32rIcCx4Z5LUDeGk5GMMsGn5+1JIm
         Yk+Ymkg221wB07e2Y8QrX9q5qobToM/due81faNUBqV2iA+IvV9K9axorC9vfXykzgE+
         x8IgWQXobOrZCgfb20kXZS/yOoHKPiouVmQ3zPbC8swdEwlR7VXvDmnSc2VcUJnrzrxK
         s42OWnhNvY7Wb5ddVbSuQuFV+9FFpLbXIdHiHUki7tnAZq2m3/J5pcA3MD78+r7ADirI
         I30w==
X-Forwarded-Encrypted: i=1; AKwUvBx6udpCUOXvMkc4UBabqhtr4kARwY7Fchd4T+dGk7KVyHgIBs4PWnuCfLP/RTQMT/9M5IlXZ7PhMfxMR2M=@vger.kernel.org
X-Gm-Message-State: AFuF++lqgfcVaiUlBdbQyt64TbI3LwW2Hs2H5v9e0pKH4VSiZI0o2mnq
	85gfVSOH5viz5QYux06y+1gtXPDpy6kNGRFtn2ouwRXUCFEUeX2txjIRhv1I6ZuRV0cdUJxx8YU
	PwmwKRUQFBMqbxnXruSXx6SgZK0a2uII=
X-Gm-Gg: AYBFou12i4ErjODYIwz5eHIiJ7zIN3OXuOn3OqHGXIEx9Ara5IBTPbfY+MlFriESX+w
	1Nel4wJvL+jBe80AQminMrW8eu4EVrh+B1bdbkFEoE5zpq0e59DoJoVF6ckwgVTjVtx4N8eIzJs
	311LJt8o5dyEVFidJTmUYghr6qeTNTpxZKwqhQnDDxpX/mo8Qs5UBp/1E5wzvJjTZWrCIvlenxx
	5WQIw2PfK04Rp2zt1FMoaEhRldyCuxA2/MsSFA+RMVHUo6sSvMTAbK23NhXrnrjlu2VhD+XHeyq
	LtMNq4FkeZU3bIfDY/Eoij5mYfjNQRKlSGEGyF9Tl8a7ghC0La989814+rkYm/3rH9u51j6jUJQ
	ObCNyhQ0r3Vi88Q==
X-Received: by 2002:a05:6102:2d0e:b0:784:b9ec:913d with SMTP id
 ada2fe7eead31-78a1f364141mr1279608137.8.1788343643602; Wed, 02 Sep 2026
 03:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-ceph-msgr-writeback-v2-1-840ef541b0c2@columbia.edu>
In-Reply-To: <20260825-ceph-msgr-writeback-v2-1-840ef541b0c2@columbia.edu>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 2 Sep 2026 12:07:10 +0200
X-Gm-Features: AcwNN1WAleROut0sEKdtlOPPnJNCWxFi5LIaqqirKxexZnt_ltqakLRjMrs_NzQ
Message-ID: <CAOi1vP-ObFuVcD9OJW2aeguZ0pUYQZf3pF2L9KxXQ3wKpHgNEQ@mail.gmail.com>
Subject: Re: [PATCH v2] libceph: remove pinning assertion in ceph_msg_data_iter_next()
To: Tal Zussman <tz2294@columbia.edu>
Cc: Alex Markuze <amarkuze@redhat.com>, Viacheslav Dubeyko <slava@dubeyko.com>, 
	David Howells <dhowells@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Christoph Hellwig <hch@lst.de>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 5:41=E2=80=AFPM Tal Zussman <tz2294@columbia.edu> w=
rote:
>
> ceph_msg_data_iter_next() gets a page reference from
> iov_iter_get_pages2() only to immediately drop it, asserting that the
> page is pinned some other way. The assertion is the last caller of
> PageWriteback() in the tree, blocking removal of the PG_writeback page
> flag accessors.
>
> Remove the assertion, as it is a CONFIG_DEBUG_VM-only check of an
> assumption the FIXME comment already documents. Converting to
> iov_iter_extract_pages() instead was considered, but the messenger never
> releases what it extracts, so it would still rely entirely on the caller
> holding the pages. That would be just as much of an abuse of the API, so
> leave it as-is for now.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
> The assertion is the last caller of PageWriteback() in the tree. The
> removal of the PG_writeback page flag accessors will be sent
> separately.
>
> Changes in v2:
> - Only delete the assertion and leave the rest as-is, per Christoph.
> - Rebase onto latest ceph for-linus branch, as v1 was applied to the
>   testing branch.
> - Link to v1: https://lore.kernel.org/r/20260817-ceph-msgr-writeback-v1-1=
-38f3754034b9@columbia.edu
> ---
>  net/ceph/messenger.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
> index 34b3097b4c7b..95929eeb1f85 100644
> --- a/net/ceph/messenger.c
> +++ b/net/ceph/messenger.c
> @@ -1003,7 +1003,6 @@ static struct page *ceph_msg_data_iter_next(struct =
ceph_msg_data_cursor *cursor,
>          *        we'll get an iov_iter_get_pages2 variant that doesn't t=
ake
>          *        page refs. Until then, just put the page ref.
>          */
> -       VM_BUG_ON_PAGE(!PageWriteback(page) && page_count(page) < 2, page=
);
>         put_page(page);
>
>         *length =3D min_t(size_t, len, cursor->resid);
>
> ---
> base-commit: 91880e4a7fac45bc407771bc57bbaf4f37e9b4c3
> change-id: 20260808-ceph-msgr-writeback-a67d25e28f1e
>
> Best regards,
> --
> Tal Zussman <tz2294@columbia.edu>
>

Applied.

Thanks,

                Ilya
