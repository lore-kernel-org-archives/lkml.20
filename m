Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794678080;
	b=AEZj9VZvtVFISbBOKQKxcuknQUcCKwnhvu2T8Iqgtjg8vVl8xWaJtVnSlHi+BhQfld0O
	 ozPAhp/ed6A3Xt3DVXCXYqGuK7W3zg2sWqF6b+a3Cpx6VBkMt5UViXxAry3HeYvdqBXOs
	 WL2sv/1bCGD03h3zmtcqFioX01j0v+kx5H2Qjp9AGdERPdFq8oNhKc6Gy9+3uXq+RKFv3
	 hPIK1JuaRV/5D/pUwc/Mk+DCNemooNeCUIR0YYkZO+w/Y9WWslgAfHxHdmKDz3Q29c6pV
	 2/4ScPfronRPlRLDY8RhsqccHA0rcU8I8fj71GQJItY0vjCE7UPPx2ei0cbPb775XEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lKzBfGPktJr/szDz2t15shFB1sRF8TZoz1RWFch5hCA=;
	b=FzU6MGcK3MB2Lw5rHrChca+tuAvkTnyBvrrl0Pwqk2pIVQGKD6xk8CnS8g5AZNTuERJC
	 sfruGcq/9qxGOkmzxIodJdDgkhqGRg3UXJoUjV8XXLGVibiCnSARcWBiu/AJse7cXZPov
	 GxB33iius5FwsooHlw9Wx0WmDMcl+sSl3Pa2rcim9lMq3AvcoPIaD4HekFQF9fnpfIAgT
	 5hBE8oclu4YNvgpIII7kZ5zIUWZaAX87Fy79n9YAPJ1p3BTeXonXkWrPYOyuqEVpFSiik
	 6G8cXG0Bq9/MUsu20glV+i/nY3Vh/pTK23AwtG5iUdn6r9rfP/sm22zC3IHWn/uwCwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VTrqHvpW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89134606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89134606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VTrqHvpW
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67921b515a7so2147046d50.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 09:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794678079; cv=none;
        d=google.com; s=arc-20260327;
        b=OOaPXcrJSQl79HJPvG2pfUcTaeqQZRpyp1V/GD/4J/1ep/QJ12/veg4IFKAjvTyBmI
         GxhyuFbhTopRjMY3OgFJruu16YysA9iOoAYdqR6lFKJ/g443qz54K88Qiv/TATXDhy9A
         M60BdbmukwmX53MendC6J4sqgyL4qBJovYocNBsLb0mBANcvS+XsYHu2n8O6FJ+ZzVX1
         hyIoVTEwEE72luE+BiKR8fzxST9pN2OYMY5lyn4FhDqONHr+4QhmnTvnjDYZaiT/aQ/O
         +gseTE41PKWa5bfwq8HyEX5E+BF+v0bSYIaNi5H4K0OEQUtsoPdV0OF6NISjNgxHquKU
         9TLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lKzBfGPktJr/szDz2t15shFB1sRF8TZoz1RWFch5hCA=;
        fh=JPy2oY1K9rFgdV4eDXFQrLOIqvdWcgditQeFxUSCUwI=;
        b=qk06pz8IWtDBjp1qAko/m+MUC32f327a+mtlWUJrP0b1vPNtcnT6PrwKinBmM+vITZ
         crxGy99l9s34MHT8odKVjuLJRS+pglrqZ+KoTGtVscG5ouOi2UoV4K+Bs3fEemZcMrFW
         Ql3sNB0SAB1BFEKEWwRE3aq9+6Zul5EcgrGArUYHbVs1HhYyAwN2vrWx39klszs4gQq8
         z7YfPalUbuO1zlpEcrNeRNag3DTTU0VaekDpdJtrZVWrRWdCz1ZHCqR2qcxN29OwTUgE
         B2yNf163hlzJnpJougwTQ6udxYi/e2ZZhhmhSuSOQ6sTVHg1Lw9F2kGWl0gugBK3IdU9
         FU2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678079; x=1795282879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKzBfGPktJr/szDz2t15shFB1sRF8TZoz1RWFch5hCA=;
        b=VTrqHvpWHE5Kjd1yFtorTHzcFdfklymfKYkuePG+MJjz89H6WstpGdMEttUEhtM1KO
         9r4X8+e88jWwdvRwpkyFeX4iyksq0pLfWA+BB+Hc67pV7b+GEO6rh3uZzYTF3nOV1J/i
         scM25sdBh5aRLiWlT2moEZV1XJUXMNd2rkHF759uJB7P1EqqvnYQjFZYjusGGR18ukoB
         WZ7yqljnMtDyDbIMXt3RXddYSn0Kis6twntZSnu1A4KBa4U5rn7uakscDRzfuGGTRajO
         pJ5ZpJfN1JAcdl6PehvxgyAp34b7kWE4VWB169TiKyj8JZFxzMpqf1S19FajdLaxiast
         zdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678079; x=1795282879;
        h=content-transfer-encoding:content-type:cc:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lKzBfGPktJr/szDz2t15shFB1sRF8TZoz1RWFch5hCA=;
        b=Xj+3F+XGYNpyMpjq2u9IX+VlTGSiRbuukLoI5ynZ8qRn3IYvOojkxfwUiyKzE5TxR6
         OodXHdj2pIJcbUJKUl3U2WLMEO1Fo5sMyGQFlx5QiCUloc8ekY5m3lTvvZ98/4EIPwwx
         46V8uqxLRpN/bIIHQnUMP0rckHc3Ez09fdStgjuXrsvxlSorGGKD2rvT0uwTveafq9IE
         BCZsXCddfTKGXuuLOue+yv4DV5k0Qhi/RNVDKosx/pyBUbqP3nVHM4xksM3i5EuYbiQw
         pgF8wd9aNBKNVV2wqJ0og2Nv2r7bFIRGKHxXaG+7i+CG4LvYeZwsfxqWo+8aJOFlWJvJ
         8vmA==
X-Forwarded-Encrypted: i=1; AL+hErEFGerJ9gy49yr6s+2H73zhT+xUpESn43UbqhfCeDjwJG5DkqLJgxIpCh1ESO7qYQ5uX+CfkcRcKadFc04=@vger.kernel.org
X-Gm-Message-State: APuU4Z++8DoiYQfRhJHc0EQ9zUpaZ5BhmtTA9gx7PBXu9uiu8QOO3B5L
	1Nv1H7t/1xrJ+GAVn/3bTepAuucV8t0v94/MTSTJ7OmJsz3xtql++ywy9mNsL7XCfODripmCq0N
	95+XF3Lg5kQxLYURMGEEaJRdakRvtkhukjJ/3
X-Gm-Gg: AYBFou22BfDFcGIjYwBX2bLOawA4l8ee1LzGAVagZTRinxGK+ljuRizJX8NZEVuq9Sg
	Nv41ivKqhXBabGSjogo+UtRn5wycpL4cX0k8ix1yo5OgvFIyyxlNQwR0AzwxTOFsf3L8j2/Uy9m
	VNgOLHgvpCgWoYF3VOzWIXLpw+fwGJ3vn/exJl2jU0skSo/olwnjOduZhymxQufg8sgRtbsW+tu
	FV+KRMCcnd+mhqAJ579XOcojyfmQfAL7h/jSNXLJThNw4a8IlcOw6tfI0NfJLnTJTEISff7wWzn
	h6Uw4moXKytjcQHXaDouwqrSs2ozCc24aOuxxq9M9n8Pyg5Pmw2Ha4XtcjKQR4xQCn22SfiNywE
	JqnFnF6ecJmnCzKcljhNKuVjOjWKNZ9XbIdeYnbwZJdPbwGKXCChNQ4+rh9XcSMABpdRVUddlEh
	IeAZyhhwKvTg0pwTfMBXn2no9XCuYSe+HFroO0d0JXx19xrIV8
X-Received: by 2002:a05:690e:4814:b0:677:c8f6:8d6b with SMTP id
 956f58d0204a3-67d89683233mt2717467d50.50.1794678079442; Sat, 14 Nov 2026
 09:41:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028131939.1014720-2-thnkslprpt@gmail.com> <20261105-igloo-stunt-534496ad0518@spud>
In-Reply-To: <20261105-igloo-stunt-534496ad0518@spud>
From: Avi <thnkslprpt@gmail.com>
Date: Sat, 14 Nov 2026 19:40:42 +0200
X-Gm-Features: AclHuK8MWDmPC5MuRXOth2gQ08oHB2Ef627AwfQrAm9fEzCcDU6F2vk2-TUYAHc
Message-ID: <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's more of a defensive thing. The 2 ccache instance was an example -
the issue is also relevant for one disabled ccache node no?
Since of_find_matching_node_and_match() doesn't check whether a node
is enabled, it can return a disabled one.

sifive_ccache_init() then goes ahead and maps and accesses its
registers, even though the device tree marks it as disabled and normal
OF platform-device creation would skip it.

On Thu, Nov 5, 2026 at 8:24=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Wed, Oct 28, 2026 at 03:19:40PM +0200, Avi Weiss wrote:
> > sifive_ccache_init() uses of_find_matching_node_and_match(), which also
> > returns nodes marked as disabled. The initializer can therefore map and
> > access a cache controller that the device tree marks unavailable.
> >
> > Select the first available matching node before accessing its registers=
.
> > This also handles a disabled node preceding an enabled one.
> >
> > Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller =
driver for SiFive SoCs")
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > ---
> >  drivers/cache/sifive_ccache.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccach=
e.c
> > index 71d3f94987fa..02878d54381d 100644
> > --- a/drivers/cache/sifive_ccache.c
> > +++ b/drivers/cache/sifive_ccache.c
> > @@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
> >       unsigned long quirks __maybe_unused;
> >       int rc;
> >
> > -     np =3D of_find_matching_node_and_match(NULL, sifive_ccache_ids, &=
match);
> > +     for_each_matching_node_and_match(np, sifive_ccache_ids, &match)
> > +             if (of_device_is_available(np))
>
> Are there any devices where this is actually possible? IOW, where there
> are 2 ccache instances.
>
> > +                     break;
> >       if (!np)
> >               return -ENODEV;
> >
> >
> > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > --
> > 2.43.0
> >
