Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AECD3BE638
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817910; cv=pass; b=mxKHyqVC8/gcNQEBVVKMUHVmZOZanM8jgFKbUqRYoqfT/j5Rng5ppj4V4fPuyPpmKNC78MqioMRGL+3f5xKftvVHpK1utCR+FMEa1BKouXffxH9jQbBwF7S+E/Zpd8Kj81q5FU+eLgiPDnseD9AyTRcjgo2yE0O7jBZY9xUaVPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817910; c=relaxed/simple;
	bh=oCHlrU9PYmt9yzqxa3asUHOexrGAA0lr63AtxPgvHsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXtyZOmpkMhrb15qv2FIRiHR6M7Hg5bVEFazkKhUXxfSKxZQ78zY9KavRboYoSqnGtLiZkvWqsoCkojf9sujpg8zypMf7RHvPxiQPoZIUH1SuH04uhpDmzTtoLa8FbzaLzKF3Karm8nCdIg3LYscpqPx79nT0V8f2u4IvGXdbZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XnXVrP9t; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BfRq5ywL; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XnXVrP9t";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BfRq5ywL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787817904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azhbdQCZEFVE/DWcZ3GrL9ze7Hy93ahYH6cH+iy53kc=;
	b=XnXVrP9t868R2R7qPf+sO2g9oxSA3HD95evX6HZhdie+FB/wnbBEswuniJZfiWcrq+OVsu
	0eA0KTuYhkvl7pzkFoPAaIdDObftjdVVZxmBhLWVTTmT+abwc2ZihcoTnTfGKtY3nU8Ni/
	//gj6eq1P22n5UrlJvb99fHIVuMIWGs=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-NOdmoMZrM9i6zaj3h6Fnlw-1; Thu, 27 Aug 2026 04:05:03 -0400
X-MC-Unique: NOdmoMZrM9i6zaj3h6Fnlw-1
X-Mimecast-MFC-AGG-ID: NOdmoMZrM9i6zaj3h6Fnlw_1787817902
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c2b00bbaso58559567b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787817902; cv=none;
        d=google.com; s=arc-20260327;
        b=pmErQwuIXOsicUlSHNZllXn38dFb22QzCRbKqFAYpFC3tY5KuGSe+VJ8mdA/sVJsPp
         s4+188aUWLpWDdWGADaBugi6vGighb/Hvz0NzVmAnlRhE2btg0BLOzIZvwwaBnWpuNE7
         IkJEBYjqPMVlPpFsHYSyyfnYTlxUoUckcVuj3h4JSjcN0fg0CGSAeXRniamO8BcMDqJ3
         ydof4h59aL0gT4medQtKURFNrY5O21uitd+WNJbzQfy/8WSx/P7dq8MIxkmERura2TdB
         JwSECLvqhfcmWzZW5FZrX1y2tjdbnHSj0QoJ+Jysm3dyBRl3a+LPVcfFU9ljV20YOA1c
         8/hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=azhbdQCZEFVE/DWcZ3GrL9ze7Hy93ahYH6cH+iy53kc=;
        fh=mT5W6izA+BHl0BFooBtBbsMt97GML+8AUVDTnXOQBec=;
        b=WuqVVNpgEsWttLAfQZAr1pkPqfcmng8mR7O/hckG1XkNPSUsjZeAh5477Rnf4Y/hnw
         mp0ns4Kj0UAL1Rd7s1x8h3v15JLaBfd2ZaSsITfdxiX42qDnSY22F4ICQi5BX2egPas4
         Qe+q41I8gPz4zo8pOYXFHPSiQhv9wAf5ROtC2r/smwPi18+fsaEwH/dmkrDZQ54UPBGt
         0aXM+fahFP0RrLlLRNglpd0xdTxMcvOPePGVw6LSyHh9SmQcQ/oMMkdq0hF/JF7c7CoQ
         iZLwW55ELbUBykwOi/WNwt00CwmkFLQaOymHhWaKKe0bAFPvIaJSFEulNfCFn2ME6O7a
         KyvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787817902; x=1788422702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=azhbdQCZEFVE/DWcZ3GrL9ze7Hy93ahYH6cH+iy53kc=;
        b=BfRq5ywL/mO2Z2UrjW52r0hwUmFbTngX/n0edbPOFLdUtqz0UKqHNumwEnaFYOqF4h
         TZG0dAhkAniNHsfh2hkb2YLYJe8+zNqAXIvvWBcjI9ywuLC0rnTs76SE308176NSP4B5
         UhIlTR0BRqv0qSknyDPZ2M35HlDC96XUEIU4MeqrL+CNnjSMdytTHd0d4SQ4KDfrwdhB
         3nDvJab4HjPFpV9cOeXRuos5vYIj6bFUK3mwi/6XCrbOL0dYuIZV+x6QSSIkiKAlihqt
         qWPO9y6buoQHS/XPmiuhFOSGhQAqWMgiIiHiNs6LzZYg9uuDW5MYbSGn4b4BQpWLnY06
         OzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817902; x=1788422702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azhbdQCZEFVE/DWcZ3GrL9ze7Hy93ahYH6cH+iy53kc=;
        b=RaOJsl1gWzL5WL1u60nKdIET3/vCA0IiTv7dV1yR6a6AYpkQHC5KgeaYlgH32HHZTP
         eCEeh2PkX1DTwfWwpog3n7wwJwPf/J+WxNbL/GPqwWxWrN/h/TMGir6wZx04EjJh2u/A
         FUYKprKjEFt26Ab8llo9vgt4jsxfcyamZmiwG/rMq4GiQFFPISojMFE8w1ZGRYmd8Jfn
         pOGKYpCejcQjScVwfiVLt4mKz7k2rn+vbyZay1G2a2BLbesTTU2WlmOHRCLxGlOrAEEJ
         v/m8AC/o8G8p6PeAHABBaz3CwY0hU6kboU0Syj4luPFHAPyDHV29b+KfLeOUR3hI0Pir
         w39A==
X-Forwarded-Encrypted: i=1; AHgh+RpBwiKh05rTlvS6CVURXcxdVQfsxUsaFX8B/JlXBmpMxhsHPs+USnv8dpOqY/tznyMCG83TPIVR5FbRGTk=@vger.kernel.org
X-Gm-Message-State: AFuF++knTkrPDeGcnM/B9YfGD2s5zIduxKLsV0+re939yJKm0BG0Yq/Q
	mTfNsy8uQqtdI5xSuunIPfW9X1q4dw4PyPTjY9Y6KZPSZkqoYWDWSQyrN3oquobPf26gXswktQd
	pQMDt8Tw050sbHZZjNI9nCxqYwvUong6vLfVYMz/3XzWnT0avefJZOd5ryd0whtC4xQ13bjMHcg
	xcSxzAFv+iF81GU571phdJaUndKAkfPrOMYXAw/dOu
X-Gm-Gg: AR+sD13fXkHlF+tG8iFVjPRpiroYl2lRmn0QiWPpTgUJwaAcenVJ+StVAYGr2XUEqZR
	tQ5SxOJJBY96fgfVW9z61vn9PZLea1/gRVn6sNk8mEcVr84F0oyisKgNcZBIxyKmCAivFeOlD7u
	sUgtWCL3aPibtZBwz5KMqUjZt51aDxn3zBqZ4FIFw8b++l4HsFwN1Fvfla5MkPSGc9Qxy6ZLzqH
	63SsJD5vu0KwHVI77i4AI0CCHcrsshlejCBKH9LLEx0
X-Received: by 2002:a05:690e:414a:b0:66d:16ff:2126 with SMTP id 956f58d0204a3-66d25792f27mr4527158d50.30.1787817902310;
        Thu, 27 Aug 2026 01:05:02 -0700 (PDT)
X-Received: by 2002:a05:690e:414a:b0:66d:16ff:2126 with SMTP id
 956f58d0204a3-66d25792f27mr4527128d50.30.1787817901739; Thu, 27 Aug 2026
 01:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630041432.96776-1-kartikey406@gmail.com>
In-Reply-To: <20260630041432.96776-1-kartikey406@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 27 Aug 2026 10:04:50 +0200
X-Gm-Features: AcwNN1VRjrrgLiEOz0SquCK7V-ix5FDPB5DR501AiLqy7SgyohwvvMuNsxm_shs
Message-ID: <CAHc6FU7x5By1YusP4RF0DEDe2sWAf6A-p09gxSstDvTsLkQsKw@mail.gmail.com>
Subject: Re: [PATCH] gfs2: fix null-ptr-deref in gfs2_quota_hold during unmount
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 6:14=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
> gfs2_quota_cleanup() frees sd_quota_bitmap early in gfs2_put_super()
> before the iput() calls that can trigger inode eviction. When an unlinked
> inode is evicted during unmount, it goes through:
>
>   gfs2_evict_inode() -> gfs2_dinode_dealloc() -> gfs2_quota_hold()
>     -> qdsb_get() -> slot_get() -> find_first_zero_bit(sd_quota_bitmap)
>
> If sd_quota_bitmap has already been freed by gfs2_quota_cleanup(), this
> results in a null pointer dereference:
>
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   _find_first_zero_bit+0x29/0xb0 lib/find_bit.c:149
>   slot_get fs/gfs2/quota.c:355
>   qdsb_get+0x133/0x340 fs/gfs2/quota.c:522
>   gfs2_quota_hold+0x191/0x5c0 fs/gfs2/quota.c:606
>   gfs2_dinode_dealloc+0x176/0x3f0 fs/gfs2/inode.c:488
>   gfs2_evict_inode+0x11cd/0x1400 fs/gfs2/super.c:1479
>   gfs2_put_super+0x300/0x860 fs/gfs2/super.c:618

This is happening when the metadata part of a gfs2 filesystem is
mounted (mount -o meta), the statfs inode is unlinked, and the
metadata filesystem is unmounted. This is not a useful operation; it
will leave an inconsistent filesystem. The kernel should nevertheless
cope with it.

An appropriate fix would be to skip metadata inodes in the quota code.
I will post a patch.

Thanks,
Andreas

