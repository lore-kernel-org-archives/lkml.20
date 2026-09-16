Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4991151D53A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569627; cv=pass; b=ni+fJQppoFRctdPzuw2C9guVqzq+voIVN/ea3e1qSMqdwdQ4IVzydwwn9OCCaYyxndji+/ekQyfHQ8PVYtu4JYXRh4LT5nxV3b5bXpzraOrHDqlSAaeu9TH+YkHxG/kjcx40z3mT9QSf8oEVsJl00FyTAGRQ4eg6FkHWqI+G8Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569627; c=relaxed/simple;
	bh=vp4KwM89HW6Mu87mOnx3Jjun+CzeYfFbeJpAIlmE2tQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4jxlBvoRZmh7AvFlOAAbF0nKXGD2H4RLGaBH1rVeTCxqE8nNKu1JIX2MxhAf8hyzpi09Be2+peprRhvnzGTzonvUJa5zWvbN0q2gTftZXqTyW9duJkq6piOoNA6FK1neBDwAY/HvHn/Uh/ZWm7tCyjzDUPbIRyJKi20nlRii4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CJBiyv1P; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CJBiyv1P"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530e28a62abso12725791cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789569625; cv=none;
        d=google.com; s=arc-20260327;
        b=oyOsgJj00EGTANosuAkyWMuftBB+JBUFfld/pLVDlaz+iwd9BiMw+/aDo+9NsTe/r+
         wJGlsPshXYau0k0ScehpaK8NVGlEZJvQWY5ScnPjekSmugtNjZ6kuoQZvGj954cVgVuV
         X7HB4iz1H3xacMg5T4BEtuGii9YoEJEgTAnhAJ8oTFZRpngt/M76Rfw11pMy+/WygMta
         PnpJhpD2hpMs2VcZOMIC/sSKL2Lam9vx1deR/wbtQ55/haIgeTVDBEpU1UybEvcxIy9r
         BLUsQANIA3YjVaK+iTzumvfN7D5op1ufFl5/GdSusYDKmlfIEl6dUTC87CS5yYcVeOos
         Gu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b/vIKWuIBX4Kniv2CRbgraghVwxNf5MtIz4CNVAHs/k=;
        fh=uhgsWbYZ1NHzaf3SvnddInvJkJcMADKtHUTewDIKBkQ=;
        b=l01gwCSBVrRn8LZff+j3QCw1hw2tdu/4Wy3NeiUj5RIGUDAAHL7SpzbbwR8LP2Akcf
         PYCCXDAb+e2e+x4K7bNu/+7k+de3me0/6rhwbvNdQZb/Aeuhu152BWfCGmWXWNYMD5BI
         Cv3Ph7DzYsUsP4i4OgWGTkUhXApZd4xY9ueM5qc+HhyJX68nSFjVvpBeCsO4Z3VZIDae
         wHDZjQhc9iy6tsmZYRsyI1bm5xd+GH3e3jqLmYCTpGOcDtIpgiylFPYbTQR5jUoqqqvL
         CScM9UXEtl0XMLrLeoO0Bu8p5+/xMDEjBcpXHJ5I7NzTPToMEadCO2y+Be6IOWhKgjM4
         9lWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789569625; x=1790174425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b/vIKWuIBX4Kniv2CRbgraghVwxNf5MtIz4CNVAHs/k=;
        b=CJBiyv1PSw5+b5iWgIeoGWrSKkVHjOGSxr2XDWqQ6p2Wjzm+gwVhmNXdllA9fvKaSu
         CqCDHOE2bi0cskuqULzPZ8NiA6f6ohPlsw5lQDrUqkPtbocMw4RUAgYLpIjdDQ3do9Ju
         HyHgkJXxcmC+10Q2yfhZNI3evMkS1G3hwjlm5WDqRPj0AUOgRZ6PleNUfSDqHWco4zVl
         DbVnvfOzHNRkTizgNMYmrGXKh1cDXHeVrtarKH5Ii6CUxC8iGzqnBTUND24SKDMoSq1p
         vxyKA9wGu4gcNTwR4XvK6qwD7bBnJZv6IXK0H66C2bKT8Ifr5V8OdrXOexNA278F8rI7
         dkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569625; x=1790174425;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/vIKWuIBX4Kniv2CRbgraghVwxNf5MtIz4CNVAHs/k=;
        b=21s6bsvd6POTRFWWKiUXlHIszc6jJHDpNXu+oVFkVhdD27M/nmuxRPB0g7qUI4+Unf
         nna+nqkUaF2Ndpf2R89AJ4UxpXF4DlCm2XDdbXOQPmv3abo1i3IVNVc9/eGNT8m5BzFj
         R7Go7aUbMZ9y0IZQCeL7bqJe+gUgyB4aA/68aD7XZS/42zyrAdmiMqRkpF5dha0fCeV6
         uQID/gQeQgt3dFDnlOhVaJa1NUhVoFeRox+A2NmP+57t10AYXbpYElqI8XwowbfgxN18
         i7oUoVRuclanucHxWfmVnJ4BnbfmrvmxNRX71nvO1CDxvKbWz8dTba1vimVihZoJS9Hc
         48nw==
X-Forwarded-Encrypted: i=1; AKwUvBzxi4NYA/Nj+9Xde/FBztfEPE2tW7Y+ati+nQEX0PIvVPoFW7aLM3+Tbm3V3pt+veHzNfqvkqLBqI51JY8=@vger.kernel.org
X-Gm-Message-State: AFuF++kkBYKSesHmuLb6dOhBsXx+PgWLhSfv2e4sK/e9SgdCeeffb6we
	IfUHi/WH9KeHTLhvEzJPflqIppsw3vqCy4huUERv4UF1bqBk0uoyHba62aTmG+J0IZ6tFZqH5Gh
	XvyCsKQ69gGsQpKwJdVCQz5cL2fHF2umkbkszJwZB
X-Gm-Gg: AYBFou13ejc8bF6RBQOd432Q7SVk94sKk0uZ4D594H3kv6u6vuJjuEc0RWNs5TjgSI5
	PRrwXB5HlJ4Y8F5x92O6SACbxao/idViu0YjftQQNeSDvAcSSHj6k6DYhIHM5j0ekbzJVcfOLY8
	efKLaLKYPvcyLwHIn/JS3AcPUjYJySU7mm2awnM6F0x5dm8Ikfc3/dUZO+OiuGk7asmsQZ4Ibj8
	ILrCe6rpTrOi/QrticOZHMV315Lonq99CK3l+1R2EzMLTHHcWIxV1mPVC77GKXyotKWSqfiFHSf
	eNkvajwxm3lxGueeIqCRBod06Obi4Q5FdjiBvayXovUg0fv6e7+A9CkL2ag8CGflQJdenMxIZDc
	kj3OXJMpwEs/X1bVIqZf4V5JJfCfHxqzod4nr85zmU/9+WRtN24h3k7XR6PQxksFrTxpHhrqLzL
	LX7w==
X-Received: by 2002:a05:622a:1646:b0:530:42e4:effc with SMTP id
 d75a77b69052e-5327f1df88emr45422311cf.41.1789569622237; Wed, 16 Sep 2026
 07:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916125316.988044-1-xiaolinkui@126.com> <20260916143520.GA1046072@shredder>
In-Reply-To: <20260916143520.GA1046072@shredder>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 16 Sep 2026 07:40:09 -0700
X-Gm-Features: AcwNN1WatgbjaIV9yRByLbiQKUqUshLCda1YzGkv91esZJlFP2-kGMTRlENDWcc
Message-ID: <CANn89iJubkwk2enqcZoNKy2_B0ChsrQDzZB+Gjg-X2X4dKQtag@mail.gmail.com>
Subject: Re: [PATCH net v3] ipv4: fib: fix data-race and stale genid check
 around nh->nh_saddr
To: Ido Schimmel <idosch@nvidia.com>
Cc: Linkui Xiao <xiaolinkui@126.com>, dsahern@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linkui Xiao <xiaolinkui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 7:35=E2=80=AFAM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Wed, Sep 16, 2026 at 08:53:16PM +0800, Linkui Xiao wrote:
> > From: Linkui Xiao <xiaolinkui@kylinos.cn>
> >
> > fib_select_multipath() compares nexthop_nh->nh_saddr against the flow
> > source address with no lock held, while fib_info_update_nhc_saddr()
> > stores a new value from another CPU as soon as the preferred source
> > address of the egress device changes.
> >
> > Commit 195374d89368 ("ipv4: fib: annotate races around nh->nh_saddr_gen=
id
> > and nh->nh_saddr") added WRITE_ONCE() on the store side and READ_ONCE()
> > in fib_result_prefsrc() after syzbot reported
> >
> >       BUG: KCSAN: data-race in fib_select_path / fib_select_path
> >
> > but it only covered that reader. fib_select_multipath(), reached from
> > fib_select_path(), is a second lockless reader of nh->nh_saddr and was
> > left bare.
>
> Nit (not worth a v4): This reads as if 195374d89368 missed
> fib_select_multipath(), but back then this function didn't use nh_saddr.
>
> >
> > Moreover, nh_saddr is only meaningful when nh_saddr_genid matches
> > dev_addr_genid, as established by commit 436c3b66ec98 ("ipv4: Invalidat=
e
> > nexthop cache nh_saddr more correctly."). fib_select_multipath()
> > skips that validation, so it can score a nexthop using a stale source
> > address and skew the ECMP selection.
> >
> > Annotate both reads with READ_ONCE() and refresh the cached source
> > address via fib_info_update_nhc_saddr() when the genid does not match,
> > mirroring fib_result_prefsrc().
> >
> > Fixes: 32607a332cfe ("ipv4: prefer multipath nexthop that matches sourc=
e address")
> > Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
>
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
