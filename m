Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505B4A205C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008826; cv=pass; b=SduT2Qxa31wPZD0c76X9HnkRIi8ZNs2NOACz34WZhIp0uZ3H13Y/f8qJldom4gN7nJN12N30Ldc++xpmnyhPKCFP0IRDHWgYuCGTtwedLmT11pgJSOqMj6ltUrEI3vO342J1C7qIFtBGpIugT+PZ69GycU+epGgEzn09xS6J/3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008826; c=relaxed/simple;
	bh=5Be34nQAzZfx7EoJzQieDRwSrmNJWfYgzYOdriGhY8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y11rEyxzKz/CgFSkWKEzGZ5UO8FQrSJGAZJLPiflENk6QiRpSJufPZe368s3iKJc7bAoCT5Sw1zX0JZi7oI9MZCcy3Wzyh4Sog/g1Sexsdsq+vwmkqTvtcF9s3omDnKuuOOaNpoX1h1ZKnVwJXmOuvK4FG2Fpua5XgUgbm5fVh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oiI9/W3I; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oiI9/W3I"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-498012a61f6so76325e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790008822; cv=none;
        d=google.com; s=arc-20260327;
        b=Nhu5AED2UgU8cCjTzxx1qW+5n7lPsiGu47RrKoEAGdqRGdWIqZYhqIYAvw0jukL9sX
         AK2Ic8UcFbHnSAfhoLqPxdTe3ZwvIPKrx/vQzoS2lLOjThxZiBUGpW71eb/A78GnNSxS
         /QNlPhGeNsedSjKcDpQdB932F6Iz+2IOhzmiAqwWWSIfQmOnRtL8er6qLZednYs3mTXR
         mIUZxgf33fKdT4qEli/yIyXNt2t9KlOMKaISS9Q+VSEPxfpnHmYoXNzmnyFAxxaKYC5L
         uKakCZS5GwT8pkcicuDmHRXB+4et2eJ73dfVZoORGvMXEIvPJ2KN0sYyTl+GXN5vjxF9
         kawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RtzXQFwnjNHYsoXZmKYlP+Kf2L9hheYVuKPWeaO1pHs=;
        fh=tkfK4jKsiv+J+9PXnk2UoKLTjyZjku4BfkQtCfFCF90=;
        b=mIfcZITDVSjs2UzTioVTGr//oiPVXI1Eu2zpmVUYOGKMNs70noYlRRSTHHcHDi/7jq
         oasWjCFm4Ha5xmPwntpEzz9QagiXu+wR11VIPHUY2qPuDGsywXdiV71gmIIBAMSbQtbn
         4swCsjQcpMat7IJrg90DAngO+lC/Y/bSA3F8wlncVLyY8KPugHxR4e/Iz2RaFj4xZlLg
         yUXWgFj1pDs2VFR1MMD4Sp7yozgEExqqfk7oQFEFCgrZoIlBsf1ct48iANzUu9uJh05w
         NxwYBs0xj8HQ6bXbN/Ii3tjE89AuE3Y2BChRs+2OUa1OubKW/uvz6J7z7jdXAiyGvckk
         Unmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790008822; x=1790613622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RtzXQFwnjNHYsoXZmKYlP+Kf2L9hheYVuKPWeaO1pHs=;
        b=oiI9/W3IUzmBmCava0nuE/rBjOk6E7NWujUShvPcMI0IWBItd6LsHTdRqfjKavnRs1
         idN3NBqYppXVXCWUJwzYpLhVgwaCh5+wGfEklakPuOocnilwBEOL5BjuTF4+li3x6qc1
         BnExb0fUGj7PI96Q7aaGZ+/slTEexNriwdvH6ICUMtrlWp/dDRkhaJT+lCBCjdtt5whJ
         GIQj1whsh1kiBHL1EEFybwXqYYJg9YTyLiWKRWDZNl1g7Ubor2UM9LL9QQGCkLJFj5EI
         sqTX/SP1LD0J1wQ9p9Fx9njgshpB5k9drNbH+nSJ5U/T+Y1Gv6tQFS4tXuGQYmlfMCu4
         XtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008822; x=1790613622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RtzXQFwnjNHYsoXZmKYlP+Kf2L9hheYVuKPWeaO1pHs=;
        b=EuB+N0Vm7Pi1cvzDlwVENNf1AzK0I28IjznRTPV/feScsNFCVSBfMhm8d0bjugYR+5
         6+n3QWud0Wsp4E2j3V3QuoGpFWOZbnUAY7G1Ex2vwttUJ8Ax9e7j0SEmxR2DrsEyr/RM
         YmtY+yONE0kF72/tjHFxgqeeD72VCjzUE25otht6+/6eAGS0DOtTaBCj9K99buSIewxD
         BuZ2URhKfwjR2Pk4gvLiPeZfo+ZXPpGjAHQWUpmTGDNNIDiFTCRXwXlEegAA9Hi8NbKE
         2DoElZWRFioXOrGNDeDMSBg6ISRWIXD4G2tddKduWnIOw669XIt0W1llQAgMAyw23wxo
         9Oxw==
X-Forwarded-Encrypted: i=1; AKwUvBy/q1pxeogVWwpE8KRkdmqKCHt9+5P04y8Fbgv8zAQr/gncaX4qrsC4xyr5vj7khuhywXcT05xPcmIDz50=@vger.kernel.org
X-Gm-Message-State: AFuF++nNIu8Jrx2pzReAvtmBszkz2jqaX6OrpgRgR/KH8WB6Clo1SR67
	6fD1VXhDEYxLTyKW+A2vsf2Wh2c6tUu+kiMx3uCnCKdDJyiunRs1b5Vnuz4FaM93Z8z4Gq5PEOI
	S2xqOD5yHXjuarn9ns0V2YNGTrGMb8mkk0nPc2/0I
X-Gm-Gg: AYBFou2GSCIWcMpmMCvGtvcHzZgpIjZg8l8wFCow7hABkj0/sw5UTUCC9uoSLsAR0TC
	daexIk77CGUd3K6fhHxDkBr7rCcDwbo+sNl0IYEyBVOp+Z1dhL0rz386brdHBl9Zzrsavc4KzJx
	5SAoGNDZ3g8cEbBCSHgIXsF8HrVQdezghfYLrSAbS1iGqF4od3HuGjsSq0pyOLkDDUYybsECTUt
	RgjHcIXk1/HpIbCSXPHP8UMkHI+zgR/ePbom53siIg7y2xA0WnwK/D1ry42y3v4SA0S9724CzDC
	XVtxgXaljyh9RoUhj4s88sFtJyVN3H7oBIXD4yfijaHD/BnbBdIz00RZRUi60Zp2Xzj5L/Mi+gk
	ImuxM3EKm/Cc=
X-Received: by 2002:a05:600c:8a09:10b0:49c:fee1:5095 with SMTP id
 5b1f17b1804b1-49fcd445631mr1323105e9.16.1790008822204; Mon, 21 Sep 2026
 09:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921002206.184660-1-tjmercier@google.com> <20260921002206.184660-2-tjmercier@google.com>
 <DLKKZEHWGP2Y.2C0DPQW74COKW@gmail.com>
In-Reply-To: <DLKKZEHWGP2Y.2C0DPQW74COKW@gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 21 Sep 2026 09:40:08 -0700
X-Gm-Features: AcwNN1WcCwaNQ6LsTFn0mdCbRZGKeLUuNw1COTZgAc7X0Ka-SteJgzcq3awIPR8
Message-ID: <CABdmKX1tUodTCcr2bi1eSdWiGOOBPaE98jYOVz8BkCa-ZSjA2g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 1/2] bpf: htab: Split htab_elem_lru and
 htab_elem_pcpu off of htab_elem
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, mykyta.yatsenko5@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 5:51=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Sep 20, 2026 at 05:22 PM T.J. Mercier <tjmercier@google.com> wrot=
e:
> > -     if ((u64)attr->key_size + attr->value_size >=3D KMALLOC_MAX_SIZE =
-
> > -        sizeof(struct htab_elem))
> > +     if (round_up((u64)attr->key_size, 8) + round_up((u64)attr->value_=
size, 8) >=3D
> > +         KMALLOC_MAX_SIZE - sizeof(union htab_elem_all))
>
> sizeof(union htab_elem_all) is the same 48 bytes as before.
> The round_up() part is an unrelated change in what map_create accepts.
> Drop it from this patch.

Ok, but I should do something here. I'll drop the round_up() change
and use sizeof(struct htab_elem_lru) here since it becomes the largest
variant. htab_elem_all was only meant to guard against a future struct
becoming even larger, and without the BUILD_BUG_ON below, union
htab_elem_all isn't guaranteed to have the largest element in it.

> [...]
>
> > +     if (htab_is_lru(htab))
> > +             elem_offset =3D offsetof(struct htab_elem_lru, elem);
> > +     else if (percpu && !prealloc)
> > +             elem_offset =3D offsetof(struct htab_elem_pcpu, elem);
> > +
> > +     BUILD_BUG_ON(elem_offset + sizeof(struct htab_elem) >
> > +                  sizeof(union htab_elem_all));
>
> elem_offset is a run-time value. BUILD_BUG_ON() works here only when
> the compiler manages to fold it, and it cannot trigger by construction
> of the union. Drop it.

Yes, it was intentional. Dropping this means we can't have
htab_elem_all in hunk above, so I'll drop the union too.
