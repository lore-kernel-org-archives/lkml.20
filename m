Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794918371;
	b=bb2/aV9aCqEmZIo2rin+z6dTLceqUVYZsw836aJLMpmZZUBkNDPaYBw1rCD5Ap8QLCP/
	 0UM3HHSdAQXxRU8GEDarUuH0syYCYo5X+0bhFhd8ciRbtoS9A8nGgOI/B2w4JBaHIOt4I
	 205w2XFVhXLbtBwPME8G0gI22FmfVw4gFgP0sDOINN/TW3JMndOcz/zoo0HD/mciVMnzE
	 atjZsp86TJvluF1e3XamzHiMDrdnuHPVCceqpXt8Mg3mhhFw9wcYPNhsCB57eLu8Vex/D
	 CNwut4yBKF52GjetxNwiSYcmP1Z8vahPYdfnlpg+d1cKQsII8ZiajPTusi0TMsFfn9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yD4bvqGbOYlVbbtMfAfQfhVhb4wkuj1hNj2dagv3uPM=;
	b=GcxtDe/cpRFXVgFmK6v9UHz7jB0ZCJQ9N0NNefzgz67D//aJtK/cn8rP5qehc08XvewQ
	 LjaCuK6DHRy8PJjlhZd0Pv1XbXR+CR7fGtwy4YCqwAeqouZ6WCfKcsYA9YpiBf7O4tfen
	 6Z/LVvBtBYZy2SLLeqBMJSFhteeBZ2S/DRo/tE3lRgYiQnVfndKOfOydT4i/oviwEIsZy
	 TokjQF58vqjsGtU47NKCYoXZEnu+IAe7laOxtH/6Rp/99yjn4FXDHc5Te87cC/v/wPeFs
	 7HH4ppChxuQcYCphFAqdBbdOBwjpVegJoHntUhZ4Pk5r6yxiILJAWCk9cIRbRTTfVPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZRAqxoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB4F606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB4F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZRAqxoR
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679aeeddc6bso4530598d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794918370; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4fdHDdM/MdgthzhjRq1QFNh/VpJ1iagDGVnNOTNNQDWmUiNRYpMtjeJ55vI0VtNSJ
         R+kOxysRGsvZh+DIcdCrfPWMvDkLzX4dpA+zAuwvDhSNzOxrXAHSMwtppI+SM9mFcrCc
         Ya0Cyxu6nGU8VW3oRRdwSjLgh94tj6eyiP5+ho8UqfXzpMsrgQkST4NsSv1fmvuO2QIb
         HotIC1bc4bmxDjPKHr2HRpDvnMJcXWe6zqN9Oac2DJsKS7ZRFf8lk05K28FSwjrO1nfh
         OfhDLvXAui275g2439OJAcSC1nUMjYfe6I0iGa/ltDhvlBvPwsZMEkxm6S2fUj2x3RrF
         qcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yD4bvqGbOYlVbbtMfAfQfhVhb4wkuj1hNj2dagv3uPM=;
        fh=6dabYEP0NAdDFrlwjWV7GXNQkU2pZlKv7XS6GWQtJME=;
        b=j9CcGLnmYVmDYe7jYx0XJ9Km3yCjYLyH6f93+2ZEuu/mbIBVZdRa7z1X1JzAxWDHED
         HNVwmk42zhWPGxhhv6BKd8cReLw1FFCoeEYS6rmLYd55QEW09J3wC/JtjSKVglxZCOb8
         lpCrKa9qDXFmSMc2D9foG/xJw9Ms35qj1+LCXNd/Tna2wJn3P6oXmawIzs58noEtGXoT
         0pL7PmuKNgH2HHuBvV5GRn+VD9xP/WJQ2pYJ5U+fQYlBl+e7rS+lCLK0IVsKwRRIIutF
         h6QGNDc4EXLTx5B7pMJMu8yLVVKr8X9N4aRTiY39G+1Z9UPuzjVFUZee+CeOySnR4IZ0
         OVBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918370; x=1795523170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yD4bvqGbOYlVbbtMfAfQfhVhb4wkuj1hNj2dagv3uPM=;
        b=bZRAqxoRLO/BhrCVZ9XNOcW0ky3d6qwRDHx/SVLV/2A7cEe1+njV5buv66ZYI4xJgl
         IP+elU0KBaExUKOwg+RhKP2JDKduZFZ+kxLk2xTSxOkQqAvEVsnSN7nUjfseosHOMNCW
         aLn4FL1WASDKPStTvmPtd0uZb/1GhRuCGy8xrsICBBmMgkUd88Om6Gf2cOhbndKujqKr
         Mo2UlbAa5kflHI/S7AUDSQBOfwVT6r538q6F4PtDC4DAOOun1T7N+YPoMSS2O5HoRT+w
         3fkmlxuqx9XLRbE0pgt6MeOeAicbDFnK6Uq1GrLQIDBcdsS4SFjSn+hEIQlwH7qASvRn
         o3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918370; x=1795523170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yD4bvqGbOYlVbbtMfAfQfhVhb4wkuj1hNj2dagv3uPM=;
        b=xQ7HUA/WLi3OSBGs3J7km8Ja39olRM29i5oFL8LypE6JyayMDnOOUyJ1JDQCvkZ3Bi
         3mGlqK2h9E8Zw6zVEKmbDUKoVUBwPtqppAozRvrexEKjjUQoEZXNxRQTbRFjAYNy3dWS
         vwHnXhGZt3nMCzYIkCpv5cyu30GNpxIaj2uLAjUE5m4m3cVcjepL+RtigXJkxLd1j7xZ
         6L2Zo7ZkkSDsoW62OsLs87FYgW0aje+7WtfUR7vI2u0/C++4hXXH9AZflTu7SzlGVGW5
         i+PPyDIe7hEKmgPTAV/Ip4O3o/yF1ZB9qTQwgE4fgrsdzXMyLDSj0a5AZx5FoEs2DMD1
         KOCQ==
X-Forwarded-Encrypted: i=1; AL+hErFdhtaz7YbQCIs8hxydMeOJnWBwIUJrKmYdFjz0lU5o1e2l/3BbA0cyn1ro30R2vUhM0ML3eevc7SVbpL8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ddtUBXH/j60vJ0UlXZgOPM2BS6SyhCyHQsz28YKP2lsEw7bbV
	VPqqZCCgHyWLlI6Dh48JWV+aW0m/86wvVu6OqplgkQI+vGO4/Tcf9Q8wv1YAuluXo5pY5K+oROh
	5U9Wsj/7BeoaHMtmYCBrQPd4BsQF66Tc=
X-Gm-Gg: AZFdTZdh3tr2Qya8WjHRSVzU+JS6kMBAImnRUKlydUI3279MIfWISQPbgvHImhn4xaD
	KGCPE1jYJ1c/YhbJ4IWMfZ/UA3j064yjUuRAAeblxXnO0anCI2wQuISphT5KKr/xZDjAtZ9O+wy
	khznf8LKs/H8Y4ta+RzH3dnCOp5xkEpxWGBHM6ROXUIFcLBaOm2asGOH4SWE2m4wlesshT+xHs9
	J1irFN5ZC4uyYfmQXt39CeFoePIc5WTtcPnN9inn3oP6loakglKi8jesM9S8nBWbtBA/L0Afvev
	Mh0YDQUH8yELEcy5+J2KeTponeozX+3GWHpQyJgoa04jw/mebOtUdf2R28gSQx32AHLzRFedO1c
	BRanLNrGejYIEabwcECGM7ztYwLWwNE/ZbBvxAISD64fwsFnnTHxNwPITyP2O4LGXabqRveBxp0
	VEVBpsD0EIl4Rh4FXVCn+GceEhe44=
X-Received: by 2002:a05:690e:128e:b0:679:892f:20ba with SMTP id
 956f58d0204a3-67d89695d74mr6111796d50.54.1794918369623; Tue, 17 Nov 2026
 04:26:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028131939.1014720-2-thnkslprpt@gmail.com>
 <20261105-igloo-stunt-534496ad0518@spud> <CA+jvY9Ft4KKTGD7jM-pBFeN4orRuMs1pQUfcLerKGTW24KDQVQ@mail.gmail.com>
 <20261116-dreamlike-uncheck-9eebf91555d6@spud>
In-Reply-To: <20261116-dreamlike-uncheck-9eebf91555d6@spud>
From: Avi <thnkslprpt@gmail.com>
Date: Tue, 17 Nov 2026 14:25:32 +0200
X-Gm-Features: AclHuK_Nw2nzCV6_b2EqU23EZNYUKsyvIU71Aq-l_ghKizzn7KRtca-eeEF59Eo
Message-ID: <CA+jvY9EjGVmUqMtEugdq=6rj6NwL87e_E5YgBSZOfkD7Br0sOQ@mail.gmail.com>
Subject: Re: [PATCH] cache: sifive_ccache: skip disabled device tree nodes
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes your suggestion makes sense Conor.
I'll quickly check it and if I get it validated send a v2 shortly.
Cheers

On Mon, Nov 16, 2026 at 7:20=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sat, Nov 14, 2026 at 07:40:42PM +0200, Avi wrote:
> > On Thu, Nov 5, 2026 at 8:24=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> > >
> > > On Wed, Oct 28, 2026 at 03:19:40PM +0200, Avi Weiss wrote:
> > > > sifive_ccache_init() uses of_find_matching_node_and_match(), which =
also
> > > > returns nodes marked as disabled. The initializer can therefore map=
 and
> > > > access a cache controller that the device tree marks unavailable.
> > > >
> > > > Select the first available matching node before accessing its regis=
ters.
> > > > This also handles a disabled node preceding an enabled one.
> > > >
> > > > Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache control=
ler driver for SiFive SoCs")
> > > > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> > > > ---
> > > >  drivers/cache/sifive_ccache.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_c=
cache.c
> > > > index 71d3f94987fa..02878d54381d 100644
> > > > --- a/drivers/cache/sifive_ccache.c
> > > > +++ b/drivers/cache/sifive_ccache.c
> > > > @@ -297,7 +297,9 @@ static int __init sifive_ccache_init(void)
> > > >       unsigned long quirks __maybe_unused;
> > > >       int rc;
> > > >
> > > > -     np =3D of_find_matching_node_and_match(NULL, sifive_ccache_id=
s, &match);
> > > > +     for_each_matching_node_and_match(np, sifive_ccache_ids, &matc=
h)
> > > > +             if (of_device_is_available(np))
> > >
> > > Are there any devices where this is actually possible? IOW, where the=
re
> > > are 2 ccache instances.
>
> > It's more of a defensive thing. The 2 ccache instance was an example -
> > the issue is also relevant for one disabled ccache node no?
>
> That is true.
> And on the two node front, the driver doesn't support that anyway either
> before or after the patch. Consider what the new code does if there are
> two nodes, both enabled.
>
> But I don't think the ccache or llc-cache successor are intended for
> that kind of situation anyway.
>
> > Since of_find_matching_node_and_match() doesn't check whether a node
> > is enabled, it can return a disabled one.
> >
> > sifive_ccache_init() then goes ahead and maps and accesses its
> > registers, even though the device tree marks it as disabled and normal
> > OF platform-device creation would skip it.
>
> Could we instead drop the loop and just check for availability, while
> retaining of_find_matching_node_and_match()? I kinda feel like the loop
> gives the impression that the driver supports multiple nodes, when it
> realistically does not.
>
> Cheers,
> Conor.
>
> >
> > >
> > > > +                     break;
> > > >       if (!np)
> > > >               return -ENODEV;
> > > >
> > > >
> > > > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > > > --
> > > > 2.43.0
> > > >
