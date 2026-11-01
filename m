Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793503221;
	b=nC4jI4NR0lX/SIOM6HYv4Qvzorn7kmYMa7j0qrcRKEjpLme5EFBzwn5H4p/gFsMTcqfY
	 61hBtcd2wXoT3nCjG6gIVRv8yaIUEdh1Xe5wqW4jfS2q1J6TH0hQU9YSL53oGBSZFlSZG
	 xo+7LEvGV+zRdoF6yZaeutV3femX61CDQTHUEb//ZbrW5o4h91C2A8bJko8qLxlBKpbfO
	 vNI8BEz8QlL7q93lXw412CU8WaEjM2R3SM3pJ3cdOiLs74+M4V00j2bjZcqVggwtLnj5T
	 5DbyxA9pYQE6LBfKnW6Fc9yhRlcREWPPGV2dgTOb4o/qp7w8ywxxREo8h4CLLLADqwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793503221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ROyck2tv4dX+E4QrQzUDo16ieFP08+/ueNOZlrK/9dI=;
	b=Xt/r9+l0TJS32dGMn2N7auxKe2oMaTvYP6zRRideSuM3pLt0cPE7Waku90JCxCy8yrXG
	 OhqbU8cZldvYAvGklt7m44yC44m1WWIBh9NBkBD6YlkiwRelulb6i2W2rezXdYKaUZJXS
	 h/5NlVUuoxdkedDQyzLEDaatDDxLNpRbxP4857e/WZmJt5dnTSJ32HgzQecCjfULDm6mA
	 ZOi/SW7Nm8dTrRhKmfUSMBAIeJ7OAblL06ykXW1qLe7oWKw8wpTvlyvNIRe1a3AIA2m62
	 anq8ACTKKK9PpIFspFh3T6g6+JYYuklejJ9bHqobSn3mfHaQvYi5q/Ium4gEChDTskA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oa3G1JPl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781F5606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 781F5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oa3G1JPl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2179588e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793503215; cv=none;
        d=google.com; s=arc-20260327;
        b=awN3Ad3HCvYKh9IyVxElqltR7fPHEBEWLDMOIyrPfzMQ03mxBP6GJqUxX47K85mY7e
         gQu9zdi3NgCWLyYwXgKpRYbLOMMuJjFQ7nVvFYQcrs6XK/PXqmpt053gwFS/Cjhq+aeK
         CoZNxs9liBEQ7Pd6EfQOjH19UEmkCoQWOom8sQbZnwOm7WC5Sn8ZdFKTK4eRu7DFbQAx
         SLTWOV9GMlk3S3nFC315DeG5OnCofS/mhnJSQp9gHZoAfGJQrTP6IswMIaP6GtW6pjKm
         eEROJi/XvXANQfB5g49u76hqdaXpOyVI7rjIor3NPIB33nEYdJ8bwQcEW6W+RyHkrF4U
         P8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ROyck2tv4dX+E4QrQzUDo16ieFP08+/ueNOZlrK/9dI=;
        fh=O+DuRgTalmLKlaAbPsrUfR7cMHZFaKLj08xnlTpSJb4=;
        b=afkL9HIXbVWQ2OP1hQTO135wqpoC8VOVUnwBKqZm4Hy/Hk2JXz0XBApMALG5AVUe3c
         iEq5Fme3ZCrFrsfP1L1AL0axsE9hl/hc35lJSWcYsfb/eANb1znpmkCrDJLPqSY3d40I
         KwllUOUI0ommvZgCsWFUXxSPcUoeKiULt2rhIZ4tmdVRJ8eelCjJFg3NkSfyATipCtHG
         BA2KSKiG30D+co4OC79vr7nFCKIBf5Wk0XKFn3Qj527kTbctwksjrGcXelZ3UztPDIIO
         rUlwrgEN6YSfp7/Qe2C/VdxAajOgBXbyjH8OW4py02tG4o6vIQ3OSsJe5oInPE5gIsmf
         7dkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793503214; x=1794108014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROyck2tv4dX+E4QrQzUDo16ieFP08+/ueNOZlrK/9dI=;
        b=oa3G1JPlsawQocPoqkdwzQShpAXI+/vYQ/Y1aSrO8C933VrvmwyzRpgrrWN0Slivth
         0Iso4VwLUZlTiEo5a6ZAzX5z2y/3/wFiLcoXjXk3i7kxh8YvKoveMaeZpFxvgR0amKJ7
         fWdxu8guTa2WizMzJuOqnSfIpJdsUZu6SmtVNYnpzEbn4U5tq8P3DrZRo8DpgaFSFW4J
         0cmntTFk53h5tApdkstueJcBKtmVEDD1wo8rMXC2riEYYGfU8iNW4T90A6WadYlXRz2o
         UwDfdjHywNAB+HH6KoSuiDQsn9nIi2g/Tx8tifmVEe/FXnojqZ4AE+MjAktGMjR7g4Mn
         LlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793503214; x=1794108014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROyck2tv4dX+E4QrQzUDo16ieFP08+/ueNOZlrK/9dI=;
        b=TYRNcrosJcURkbXjaHroqQCIu/G7wVXJxpaejYjND4ZOVIYElmW5MEpEb1OsGmKih0
         JwiCaVBSKvygHCGHYkpvk5GoKwE2bse29YAIYi1Btm1QLp1edFig/HVphMkBZcVr9NQB
         jokrtectEEVxha4KcLKS8ubzFK4T7SlybRkn6DyNfYkNFymY1OTkPinqrnVJ5NCO/axf
         sJFenx5fJiYbVCToQVgy+sWwQ4uGM0V4KoiefQzrCzOkQxEhCZbZFD8urSbWT3VmKlzR
         ptmhA+1m9PJ9rrXWVhidz0p3Q8dizIbDGs5bHNblOdUz9Or691mhtllbNTRG6/G6C0Yz
         66LQ==
X-Forwarded-Encrypted: i=1; AKwUvByvkBTrY9Q97YwXofd7Qf5Brt/4HwDFe27c9WmK7SqN3BK0TN/wsTNdrlgcL6SvVHwCi1/Ptnm8VOQ1n8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHNh6sKOuev2vZCtVgGGYxm3A1TL/NbOh3InPP0zRIM4agBIui
	2lZKs2CjukcZev2bg0/p22PFJPl5URiH1MVI8v1KdPN1uksdxtsEB4qVuT+O4cMLJkPXYiRi1n7
	Oo6+AgMRC6Rfftewe03OVTWb3HZS6BhVRNUtryhZQ
X-Gm-Gg: AYBFou3URsVPTC/6ppG88O4BNxfo5b7926DRCNrYVcNf6t5tMLl8CIXfTFtRHrU185y
	NqTioYTWIpwBK4AjbW52ZDD4XCAOb+yg4oqX38IVdmK0LxoMqPVY/ltAzqRzZ+xy2can2VcadIV
	/AQ6BtQm60OcS5BX1TYswjrnc2EVeggV04zR67nKzYUEdS2sCSDn2m45IVmBCIngBkFtTEruy9J
	gC2FqyU1hCqyj0VOy2NZ9eyNN40aUJ7VPZv1cNPCo0SZ1IifrHf8UO2v+2n1fW6xUFtCJhVF6pK
	ryFRE+dYcLbUJjBDQHyvN++NXTB0/L807Yw1MWXTJ7A9FopvdrUbkg8XmpNdg4j/r3c26eNgjZZ
	53bLEZ/zA4x+q++FwXMO9UaYTXEm6/UzMCpSliCgQy660vzn06sdSJcI=
X-Received: by 2002:a05:6512:3b0e:b0:5bf:b5a1:390d with SMTP id
 2adb3069b0e04-5bfd9569843mr2136047e87.27.1793503214478; Sat, 31 Oct 2026
 20:20:14 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031203540.2282507-1-skhawaja@google.com> <20261031194058.d3bd25ed950e5340ab595f07@linux-foundation.org>
In-Reply-To: <20261031194058.d3bd25ed950e5340ab595f07@linux-foundation.org>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sat, 31 Oct 2026 20:20:03 -0700
X-Gm-Features: AclHuK_zB1iHzMf0lJZAS88jOk23h0UPCqaNcjm28FlTC1Q3GtQOHifFuWxluKo
Message-ID: <CALCETrU76ThzLDbUfpoota5=xcoOS4aZrwgK2B3ELkYcFOjGJQ@mail.gmail.com>
Subject: Re: [PATCH] mm/gup: check folio->mapping under folio lock in memfd_pin_folios()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Hildenbrand <david@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 7:40=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sat, 31 Oct 2026 20:35:40 +0000 Samiullah Khawaja <skhawaja@google.com=
> wrote:
>
> > memfd_pin_folios() pins folios from the page cache without taking the
> > folio lock. So khugepaged or MADV_COLLAPSE can replace the folio after
> > its refcount check while memfd_pin_folios() still pins the old folio,
> > and the caller ends up with a folio that is no longer part of the memfd=
.
> >
> > Lock the folio and recheck folio->mapping before pinning it, like other
> > page cache users do. If the folio was removed, retry the folio lookup
> > from the index that was removed.
>
> Can we please include a clear description of the userspace-visible
> runtime effects of the bug?

It's straight-up data corruption if you manage to trigger it, no?  If
you manage to race a memfd_pin_folios() against collapse,
memfd_pin_folios() will pin the wrong folio.

Fortunately, there are a whopping three callers in the whole tree.
You can hit it from udmabuf or iommufd or memfd LUO.

The former two will direct DMA to the wrong folio.  Fortunately it's
not UAF as the DMA will be directed to a folio that is still pinned,
but it's the wrong one.  DMA reads will read potentially stale data
and DMA writes will overwrite that stale data but not update the live
copy.  (The DMA will not be directed to some other application's
memory, just to a leftover copy of the calling application's memory.)

As far as I know, the effect with LUO would be for stale data to
reappear in the memfd after handover.  With the patchset that started
this whole discussion applied, I think it might result in misdirected
DMA to freed memory (I do not stand by that claim at all), but that
patchset is not applied.

>
> > Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning =
memfd folios")
> > Reported-by: Andy Lutomirski <luto@amacapital.net>
> > Closes: https://lore.kernel.org/all/CALCETrV5eqg6d9=3D+BQhCpRwBNe3aCQiu=
t8vxPBs8b7PToqjaHg@mail.gmail.com/
>
> Includes the words
>
> > The issue is live update doesn't preserve those background punched
> > folios and now we have created an UAF attack on the kernel across
> > kexec if you don't do something about it.
>
> Is that the extent of it, or are there other effects?

I *think* that the UAF can't actually happen in any upstream kernel.

--=20
Andy Lutomirski
AMA Capital Management, LLC
