Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D122B212FAD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790304459; cv=pass; b=XC5Usw+Z69ou+RbrFA5YZs/IC371lp5nsrURpvO44gQ76jpG1OVnQQHeUcotqlcWMj4w96P/7jWg9weerN098vMPQeIbimWUUQ5mteFe5Q4KP71EO5mfs5eF09ynNMLUi3qPzGyqp0Uas6AZ2Bq4XjFclqs7O7FtriddTb91mBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790304459; c=relaxed/simple;
	bh=XPsvzVUEn92Eau9URC1F3Wx4U4da26typw0FrLRGIBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tU1S/aJCjB+TUMTpJ8xE0M36fZShaGbLt1kcdGIimvukLuvEL5kNQ0Dz4cT0Vc13OrgZ8WtQpttLzE3j1tb8R1+PS0dfhInWmU/MUWsZZpbajQ2oOY/6I5QpyLvCQVcFkSKYYReNHJyqGkUeXRkjjF30VHYDQ4giwB/HdhegzaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Og0WhiKN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ei6+bqLS; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Og0WhiKN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ei6+bqLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790304456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8EtPgWWYNY80em52aLaC/rO6GqRYVPI8oPHvOAJ7uk=;
	b=Og0WhiKNGFGlzj4KiujkfsaBdl3jtYT5OJa6y9kkqsPpDMFCEAZuGbR71P+WzdRqMbIpg3
	SjmidBFRFp7u9vvhCBKWcVH6I5BFaF0s0Pddn20kaMQ7UFE1/8ilJ+wDYgwQ0mmKwEoIWc
	euXOejsNjDA3PedQjudWdmGPuUUb1Kc=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-CK27GbzdPse9texd0ZdIVg-1; Thu, 24 Sep 2026 22:47:34 -0400
X-MC-Unique: CK27GbzdPse9texd0ZdIVg-1
X-Mimecast-MFC-AGG-ID: CK27GbzdPse9texd0ZdIVg_1790304454
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66fae2bc827so675468d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790304454; cv=none;
        d=google.com; s=arc-20260327;
        b=G0fWFFNhSicp0ZOIcRDK+MJkMuTcpxbrmRnISgB2oPYCpymSeXc5SrhUmA4DX28Bj9
         xtR2CamqpMn8uBCwiAtMS66y2SyApS7N9winzDhvTvxf30YiMF5Or6/84xlPXtnnExlw
         efarhTQMXujdTqv9o2fwz2POUtm+BKzx7Z/8qnseI5ugfyiUXt/Q60x4tfZjS7WMX33d
         c/9OhGlt7x5DcgI9HtfIwJkojOP2k0l7yNFkg1QAjZ0PMBPtNqXiDp/ACdq2kFFM4l5O
         81G1XlHUaeogOrw9x1T8WWI63HQgvAvaWYx7eVYdIccHsFD/pTh5PPzgeIykmSM10d9T
         qeAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v8EtPgWWYNY80em52aLaC/rO6GqRYVPI8oPHvOAJ7uk=;
        fh=YhJ1xH5rvXCm90v6aTN1rjswfzscNwL9iXho6f7a+I0=;
        b=ad/7mkH38Y/1oQFdr+W2aoqa213iSoyH0aBGGOSIh6kslHk/zb9IClai8EaZRBiWj8
         tEPhF2Au7eyyGmO6cRWLYhyYWIgWMIopQ8OgQiXtjPTGaTGCxFjrA4zLJoJrKw6xMquq
         AfdGEAWG8nYgpoRRM0gQSLFUUMzFpljkH+lTZQEcPfm0WR4v/GUgI66BHCoyTRHKotyV
         WlfbvrcCDTF7Ocr/XKa/d10u4jiupFEU4qm/VyWUhKyQzij4vH53EToA6HqLe0fG3Gb/
         cKWbSMlbm0RGLNxIkk93LR1D0TCacReUc4UvOSggUSKkVQQdf2CmcjBJqE9ve9zxXvPY
         YDBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790304454; x=1790909254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v8EtPgWWYNY80em52aLaC/rO6GqRYVPI8oPHvOAJ7uk=;
        b=Ei6+bqLSXxGXzMqiVVMscMya328JamJKeumg2oj12wdFOa4ChxXKF0xBoVSIpak/Va
         JhJJQgqg1Xg1TOvU3q/8jbPVZL7n8zxaztXB37lyjFjglzPwA3/9DKsjM4fLJmVm8jsO
         nBUDcAJsFLqjqgtaxmbtfJUfEA3IO3VZ7GJLLfBRwcVgjGABGoGmi34ZVU2wQECGWcbG
         BvqR8I1XuYepxYgnk5CjREPZ5NkikMT19KukXhHTcXbwoN774kvguGAuO30aRiEGAbY+
         xc1IIAyCETrdtbQXaLpLgyK3e8mzzdUYReWajakNCkIADfovOBq5JWcQX/H1YfWpJn/m
         SM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790304454; x=1790909254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v8EtPgWWYNY80em52aLaC/rO6GqRYVPI8oPHvOAJ7uk=;
        b=SVas5ifaD9v/cc4NC7seJ0wWOnoO80NjYLG9ckMl9QnbDbw8gmiFXnrJPILue5uaUV
         x2s9lhbUJzH012X998c8Ahun2iR1kse1GuxuIJITXNgQ1l98pydiV5S/TI2EJHgQNtCp
         7YREwmIXKAuQ6ggYVU6kYwkblY+FDOmbUxYiM7pfYqZ06XTk74nBc4GSgBWT5oiGLbTE
         o78f5u4MCgqeE6jQiADVJ5sCJkot/YGl9Egn1NIO04QTQtLZ767pqGOaP6dpdZNh+5f5
         Er4/4cQDtx4Ne/w+pyqa1Q4PsTNSHjljZ/ZaVEvnHoqgnm+rph2Ki1L3O6I5Dw3AikbV
         AvAA==
X-Forwarded-Encrypted: i=1; AKwUvBw1lvOiBwC8ZQwuJAT9Y2+8dLftzHP1MhFW9Abzxuj/hcMEtB9ZUypP6nOkYeFgyoZQ/e0vzNOiEWiwHJc=@vger.kernel.org
X-Gm-Message-State: AFuF++mWKpR9sY3nwzV6ATFqs56F6qff1zOPSFVp3N7aJjzCp/5WW+Q0
	fygijPjanxlAUeOIve6JCbfNULai0c9Geka47FY5TmMPxi7vXBXCd3lQiJznT/DekSY79ykBpP/
	hYZrkdVX4WQcn7zu1UIT60hf1nGmBj9gTensePHcwxJWKRwXKDsWvd9NMHPqt2O6qis4VZFej1O
	sFe6I1M+5pBHjoJ+MGerNwRZoM65oY75fN1Z614PAA
X-Gm-Gg: AYBFou2ZhxMIGP5y1fiRaamOu6y9bS7W0IDaeWjtHO4oP4qwR/FcVPCaJzRw7Z5Ti+I
	wIZcnf7iZ3B9TFSknWG9y8XZ1cnIO3Lho9Q08CajDuQR7pdSHWJPPO4SATMu8SLpFPE3XHs2ail
	Z3VI1ikzSFBKawJ8BqeLO8xMwH5vrtzO/mevi9rKsgsU8YGEOzSv9rq5ywMn6Fmn26EUTp/A==
X-Received: by 2002:a05:690e:400b:b0:66f:c1be:a650 with SMTP id 956f58d0204a3-672ed484568mr2732714d50.66.1790304454191;
        Thu, 24 Sep 2026 19:47:34 -0700 (PDT)
X-Received: by 2002:a05:690e:400b:b0:66f:c1be:a650 with SMTP id
 956f58d0204a3-672ed484568mr2732707d50.66.1790304453685; Thu, 24 Sep 2026
 19:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn> <arSr8E0CYQRi8wMs@aurel32.net>
In-Reply-To: <arSr8E0CYQRi8wMs@aurel32.net>
From: Jason Montleon <jmontleo@redhat.com>
Date: Thu, 24 Sep 2026 22:47:22 -0400
X-Gm-Features: AclHuK_n-7A1LEiaPaMaU-m1zfMfdrRJtsrU1av0U8CI_yqyYkPrXTJhyjfUgBE
Message-ID: <CAJD_bPJdR1QOD-O5P1-eDjm8xDFqN=rzVya8T0T3S3TGNoW4Fg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2=5D_riscv=3A_fix_strnlen=28=29_overflow_in_Zbb?=
	=?UTF-8?Q?=C2=A0implementation?=
To: aurelien@aurel32.net
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	gao.rui@zte.com.cn, jiangfeng@kylinos.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 12:50=E2=80=AFAM Aurelien Jarno <aurelien@aurel32.n=
et> wrote:
>
> Hi,
>
> On 2026-09-24 10:57, gao.rui@zte.com.cn wrote:
> > The RISC-V Zbb optimized strnlen() implementation can return incorrect
> > results when very large count values are supplied.
> >
> > The previous implementation calculates an end address based on the
> > input pointer and count. When count is close to SIZE_MAX, the address
> > calculation may overflow, resulting in incorrect termination checks and
> > wrong return values.
> >
> > This issue was observed while running device-mapper tests:
> >
> > dmsetup create testname9 --table "0 8 zero"
> > cat /sys/block/dm-*/dm/name
> > dmsetup remove testname9
> >
> > Rework the Zbb implementation to use a decrementing word counter.
> > This removes the dependency on end-address calculations,
> > avoids overflow entirely, and simplifies the word scanning loop.
> >
> > Performance was evaluated with string_bench_strnlen:
> >
> > New Implementation Previous Implementation
> >
> > len=3D0 : 70 ns/call 70 ns/call
> > len=3D1 : 81 ns/call 81 ns/call
> > len=3D7 : 81 ns/call 81 ns/call
> > len=3D8 : 81 ns/call 81 ns/call
> > len=3D16 : 97 ns/call 90 ns/call
> > len=3D31 : 119 ns/call 113 ns/call
> > len=3D64 : 174 ns/call 162 ns/call
> > len=3D127 : 264 ns/call 258 ns/call
> > len=3D512 : 801 ns/call 824 ns/call
> > len=3D1024 : 1578 ns/call 1550 ns/call
> > len=3D3173 : 4541 ns/call 4703 ns/call
> > len=3D4096 : 5984 ns/call 5982 ns/call
> >
> > Results show comparable performance to the previous implementation
> > while fixing the overflow issue.
> >
> > Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
> > Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
> >
> > ---
> > v2:
> > - Rework the Zbb implementation to eliminate end-address overflow
> > instead of falling back to the generic path.
> > - Use a decrementing word counter for word scanning.
> > - Replace numeric labels with descriptive local labels.
> > - Add comments describing the loop structure.
> > - Run KUnit string tests successfully.
> > - Add string_bench_strnlen benchmark results.
> > ---
> >  arch/riscv/lib/strnlen.S | 111 +++++++++++++++++----------------------
> >  1 file changed, 48 insertions(+), 63 deletions(-)
>
> Note that the following patch was also posted, to what I believe is the
> same issue:
>
> https://lore.kernel.org/linux-riscv/DLLJDLKPZ4S3.1KQ5O4OQBBTEW@linux.dev
>

I tried a build with the patch from this thread and another build with
the one from the thread you linked. In both cases the UUID is no
longer truncated and I successfully booted the affected image with ZBB
enabled. I do not know which is preferable.

Thank you,
Jason Montleon

> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
>

