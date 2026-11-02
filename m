Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793640848;
	b=UK1kffrbp0rmwZNvejJVTS5nWUp+yqOI4tnPQ/Zf0WxD2yqiA/NyzBlbbPeh2DUjrcx9
	 pU7/XFvlraUjGhkg+cRH68ORS1Rer/4XwhsVUuIkyVs4j2nm/j6x1G794wSvJ7aKoo19/
	 Qd7qmjJ5dhs3qkntCXCQSckGYlRWniqxoIsN/mTf8q79gI8/Kt3KVgmc9V3nMpIaQnPos
	 V038Eyr3ntu8YYZHF3wfXVS8jVaTnYzbCgIwAZ4726cjZe4IHpjJQbEDA+fSiGrcc4xA+
	 Y3J2NzUEwGZuMGcOEIIsy5vKhc7sNjD5NBnPGCGGT3ZLfNTj4kiiSAU5mqVJSj7z3Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jAbGNR1GG2wMSfrTw5y6/CFWdZUJUh+tcsQZI8cuJpA=;
	b=r5tc2dXKFWseQC5/K/Vt4Ivk29ljQssQR+muCEyQ9ORVXzskLwMnqrokxDL3GtdyJgX+
	 C+fdjU0cJLEfQW2bVkIyauRywWHVOo4cgglY4LKGqmU206TT/6sENqU/yhZa0kKIVAlfG
	 3XNcPCiqt5/22gpGh0NOVzM8AijGwBws6/IpnHHoUvNwi5WolhWvsdn9UjxYCaZzKG+7u
	 w1LfBs/3+O2E2RjWPbURxuMaeXHM5GJK8yrjmUZNyOJgEBZQG5siAcxw5KFWnKlvhvlq1
	 QDLdo9vWY/ocPK6xKteA4RdJboDhzhk7lLQQFxiMSo3wynpJ5J/Rt3jhFveTNanRcDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+qOkeif;
	arc=fail smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB8F606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB8F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+qOkeif
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2308082f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:34:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640846; cv=none;
        d=google.com; s=arc-20260327;
        b=JN7EaXUnip4iB1dheDPWRG1It5vfW3TuN0irNmuPN1+YL2hFWpC9JwfNw6sC6NXzUB
         Alq/ZAgreLhB2uiofM7F6qxyVuhoiYvOVZlFoBfGeaEbYj91KpigSvfhQfGp1has1qJE
         TPCAILf90fST5ljqbfRfJ7oOe9TnWqV4Rz5C56sgCDW97g0tqDjjyUzGaIQbI0Rog96u
         gkYyXHBiclAQQWVo3s/G9W/RDrW19BbsQ3g0mCFZokgZzIEytAJPT15E0kiGvsZyfSYr
         ANEeA2TcyphzKEeQ7Af8O7vgmshaLT9WO1UQsB5kKr9ZNJRRvZxMCPzaJhyxkoXb5mjC
         PeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jAbGNR1GG2wMSfrTw5y6/CFWdZUJUh+tcsQZI8cuJpA=;
        fh=5TiFO0M5nMsdSA0nGifBZBV4jjVJXWTleIrTM3ncvQA=;
        b=SFW6kPLpZBQ2QQd1XkW2HYnK25NqhYrf1qQ5dqT6ttScbngY3xgmEVagPtMjMbAvYT
         Kam2PqWx6WscRA3IgUgZC9WtIdusUQ5nx7iEzSflsLCXwXCu2exnIRIJ5u5Nf3o0fkwd
         zb/dxB2MET8fz14TFg5J///osCLihhXcpdzB2bCjdh80ecm6iKKPyo4386CJ83lcjyhg
         /TkrC7jFL9/GC6dfAaT1BdS/WhouydNjwDj/hnnlMyU0qRr1ZeReLdmP66j/QjT6r1sc
         QdkrBdNtG5ASY4itJ38rG5hgWc+kNkCv6DlRZqR9ChMitPJK+7fK5GTW8RijzP4zyujN
         xY3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793640846; x=1794245646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAbGNR1GG2wMSfrTw5y6/CFWdZUJUh+tcsQZI8cuJpA=;
        b=E+qOkeifSJTrTp5WxNztdO8u+cYOm1xGbuoc/0SSuVFl2PFxOeG8/nAeZORpGZHXSF
         pALfopJMxI7WQP3uTa1eSz3+KwSwWTbIrPYCJIEiWx22VsgSLRHXSw4ziIAyKXuUdz38
         uXpdD9A5ngJ+KXIWhwi4a+V9TS9LfpYDmn1nTC9Fhy1wintK268fTLQjtbIiOICI82Sr
         ceMpYP/iPWqFyEuocxNGVtUyoybPlppmWBb8gdAIQOEJBgC1oFNEmZIS6PazIZhPxOM4
         IVD9AXlcjQX9x3bCvEFF69npEqAFE1WQZuQGpAqCJl8oPF+qw39hHcMzt8WOQ//TX6oP
         ve8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640846; x=1794245646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAbGNR1GG2wMSfrTw5y6/CFWdZUJUh+tcsQZI8cuJpA=;
        b=UKP6fSR2KOpBF/ZX5Y+36KjHrKzrxh0BgVODYxHbOFM5TJQx0tz0CfTnuQvWPv1zCh
         r3d3qoRn/7xvgNbFQMyZfUd7ux+38DwPLo4MmX7ofecX5srZnoYwS6wKzgDWPATQlqRq
         Yphu0DqDlX/yCAJcvDp6KGlD1T5aaCmtd2OY283XpgwXjLf7RhC9L7JlyD+qkOYCr9j9
         xW+QDqFb85GkVOTCpt2j3bGfQIIU+qxl5x8Ha+BAIMQtcyQtyTZ4JykhLzaY4Jg9FbOZ
         Ra/RtVFWTtoY/QIkhHaIAwspdiblg0OwEaKlNWe0u0gEv29mULLq5e9EEtHR/MTvGIfp
         b8AA==
X-Forwarded-Encrypted: i=1; AKwUvBxzuABxAwCv5Wtk8TYPQ1ts0AwGn0QVy0GAtVELX5iy/2ix/RDy2oRSxKB40TQeDd+GPt2cm3LnfutpqxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FuTYLwxvyDDp7nKRTb6Aj+KA5yKWKzLR9Q6q1dNu1Nr+PrahP
	l7/+06FJDOMZtd9/GPS71gKgcDOWBPc4E5kDdTmjcoQwxjpG9eUi3AX66pTLfdU9gkZtNcXH6tl
	Ph4aEjeTn21oBrsKgOdvnVHKcRZ6q7FQ=
X-Gm-Gg: AYBFou1tEUeZRnAt6xx6TSl+RI1UwJHNFRIj0oEfUGqUX0YRescOcVH7HqtHLwgj+VJ
	40RRe+gs10PxPYWHl2HBMd+nYcKo4g/Lu2G50+QGM9K7DNskYQl+OJFDaAjAdKekPxsTg3R0+RN
	bGCJgnF8TskxWD78TItLaWISgSGMqXmIuMb73BprWNHs1QOYmjS0l+1fi7S0pKPz7aLd4UEE+Y0
	z2c3Uj00shnK/h/mtb6bYEuiq+m7LRZvUxkwmvgaIHgtXS/bWCnUrYjCPjFZsTyCAgb4ww50a71
	bBQSptj/ZYADXgJ7MmM4KzaAPJCVNg1gSRxkGPPKnP5PeC8/MI5/fru0fx7Swkq70OH9zeBKAiV
	KZkpfXeOLIHBLbaqua70qoQVEXFNes+B6Z0MfdyvtfikV8TtTco8ozOrBzdduoxZsHGxWwG2v
X-Received: by 2002:a05:6000:46ca:b0:48e:679a:4aeb with SMTP id
 ffacd0b85a97d-48e6e2bcda2mr16546491f8f.3.1793640845959; Mon, 02 Nov 2026
 09:34:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260824184159.240821-1-max.kellermann@ionos.com> <20260824184159.240821-8-max.kellermann@ionos.com>
In-Reply-To: <20260824184159.240821-8-max.kellermann@ionos.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 2 Nov 2026 18:33:51 +0100
X-Gm-Features: AclHuK9BDv3bfJrzCxzgPonZehTi6oa3H0neVRrPnpht8tLYsHQ9tmBMkXvOf30
Message-ID: <CAOi1vP9nBoxBD9VTmMm5KnWj4zp0mdeXxTkzLR5tdBrmKrQ73w@mail.gmail.com>
Subject: Re: [PATCH v5 07/11] fs/ceph: remove i_truncate_mutex, use
 i_fragtree_mutex for both
To: Max Kellermann <max.kellermann@ionos.com>
Cc: amarkuze@redhat.com, xiubo.li@clyso.com, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 8:42=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> `i_fragtree_mutex` is only used for directories and `i_truncate_mutex`
> is only used for regular files.  Since these two fields will never be
> both be used on any given object, let's merge them into one.
>
> (This is a minimal diff that defines a preprocessor macro, to avoid
> refactoring all code lines using these two mutexes.)
>
> This reduces the size of `struct ceph_inode_info` by 8 bytes.

Hi Max,

Only 8 bytes?  struct mutex has got to be at least two if not three
times larger than that.

Thanks,

                Ilya
