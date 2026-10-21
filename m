Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792593640;
	b=1TWmh9IbYwzzpLsPFrtSypDw7Sjgv0Wdn4vXfHcgYb/I2io0dAKKiXR/WRFhPK+UlpzH
	 Aqq32RcSGf7BrqFgZmxMn4a+Z9fxdoP2OlEqk6HDYhM3Qo+9ITv6rOTxoP8SAZ0rTW7E6
	 y1QZubIg24b5vIfVaJDKHx5OwJcj8FJoPzyKkpGzsvnqY+hBfCrh4pvvZrjKHybUg3weP
	 rpnEJV1VVRGh2/4Ut3Ra/CjHQrk8wtYtSj5Uo8P3MVpjS6738cgTI/8sH8ds2LSuFxtHL
	 WF8yZeXL6TYFTsO9781wbiJwzdBcnrZ3yYBzTheBY525anBaG72rU9H8Nh7QU1Nea/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
	b=pu00UMBqbcsjWyaYNJP0AvIShmohti3zL1NoUJhdCt6eX5Yi8Gt5j5dpjTW+8g+f96MT
	 apnlTUGfkknKfGoBYpbpFv+Xl0oIIxB0f8g2k2mNJWjTDBovJXzvdMWZi2wY7MFk5pUJr
	 ULPVzm9bouOW7QDpO6xd7DymcISvkoSuSfNUYi6MUKGTFWagP9gzh1QqMKLev/4YftAe7
	 IjWkVJqQsbDmNSF6LDNq5On06uzSeulCiQ7Q1v5x5+ftB32Mumo081pNTwrcjq2EFUTld
	 O9l9iI5uBxNc5vvQ1w3jmnrQHHtEtVSbRh6F03KKE5lPSIbTNBED4amHveEprj1Ah5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4322d310e7so108136266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792593634; cv=none;
        d=google.com; s=arc-20260327;
        b=XwU9uaiGt34fzyZLFH5fCXbcYw82QBS5YYGV+PBdwMaqvIczpsMy1gHEA/DNiNAbJm
         QFYzBtwI+Yk5NtrJ4BYSy1Gm2FJ9YYRB8s943/ibtGMkA+Jqkw41RguSMKsfFOYyt15h
         aJ12Ur8wPv9riFqzxc6+bxGMQI09YeDdvqslC3kpA5LikQxdjPjpPuf+6sRsI7LcHPwD
         gOcNCblTVA2t9hfgDag/1dqwEYcEl2R15Fw/oyuMHXZIiWni4xeGmhs2w3ax+7ZGx8tm
         8Ghtdr0yadfZQY1aDIkYG1HcrpIsU9EFjr+W+2yMR7u7BD4/GxmbYp8TNZchnUCJTGfA
         P9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        fh=6k3fxStixaum4i6k8B3gOzvFOK19XgzKYJROiSqmJR0=;
        b=AEEfQzS0UlJ3oSnM8zVEnm0H+aB8mZYhoVQc/D49nXDdZPUXmLxE1WSVG9qaZAieZV
         L4/Y6sG0Vpkd6oTafTSoVRTaSzOA7fftb4JhdQ0oUbc2o0daIisRezukwfJXZZBoDuW1
         eQvHJ4cakzcel2Nfwh68hUszkVuOvOgSQfY9PeYCSkbvcElyF3T7vMUBNnRMLsxEPGyy
         PNZOGQ7/7JN8qH+OU3wBnP+aFtf9sezoXVUPXzEWU/t7c7TyOj5fDBEBwUsC9vzf1fvZ
         C+4u/JqRBjRKfiMYfySVS9zdVCHolADSNW2aN1dniDLJefxba0+nsDW2ZuSFRdCzFlUI
         z7Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792593634; x=1793198434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        b=YOtiR39oWEq1NTpzYsD+O/moSozbEa3Eg4RSnKJy49DnFb+9W1tBNxOPOsrLRow/rt
         BKBrrgzC9CPN/ElxyNzs3dFY/pPyqRQE4CoqEPDfMQ8Ils4ANla9wilhdGn5zr2VUBsh
         XDClU5phi6C7HW5g7q4x4E+4fhhH+VQbFfTlKkYhue2wVkIqODpirKs7DYiD9NHgOAD1
         weJZNd0fgXEY46TQzfKEp2ZOQ9bKLcvHSgTAooQyE4W6vR0n3dycaUcgNAy5MwJJwboQ
         hopm5fU9nBm0YxyruqOpnDGw+OptacQuZQVNU+r0yL5AcOfOgY2vsxeMhNU33b82YSYu
         dbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593634; x=1793198434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Gn2S/EOjHmywEEzdPOIvC1yoyDIbnmRdYYynFb0JCU=;
        b=kz3PMj9BYwikI2Bi96KEmDdyIM60Q+da/lULCJpfG3ia0X8Er2KDdrxmXfEVztGQ8K
         jL2nPWVV4PuDOzOKdoypz9BkO1MENhqvsFSNaW5tl/z/Ne9w9tElISJg3PDJiqXy3wIX
         e/JGJpWqI9vvrBpMeFBKGsf0hSklI7eszvsJeoZ4R9Zbo+2GcuCr9x6OWBpRUF0IxF9y
         Bclx5XkYjYSciQP5NjHF/GtEgnhEa1KJAdFINplMUo1kxjG4QytTp7z3/m2On9IPhWGu
         MVU28wLFMMuWDUIHhnHJFowq3k1rqjPtibhiUmgYbp64Wltn2r0755sKLfXrdrI/6SFG
         Tyjw==
X-Forwarded-Encrypted: i=1; AKwUvBx0IFfGcSpviVIvviK8UMp5Knb5LBaICVZrogvg3UYfJJjq+FkOIe+8GNM1PTjTS0iVyEhwVnS5qJRE25A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjAFSCr0730TX7G/WrE7JW/VKelxgSY+DXAzk7BPoBF0GCe9of
	J9p/3AqiIeU7hOYXPdBEQh8RbEAgosa6ZYQhsUuZow4HxtKJyB/2wMur6W416Az3NHUy4Zmr5iA
	5SXDSQvbfwl5EmBPEiKKk517P40CpPuc=
X-Gm-Gg: AYBFou3wdy8QIM8OzTwAUnf6kv1qy+fQwlgnerAtkuzzvls2VSwofLOqhiLy0siXgq2
	raYWW8JSlM0w64rjayQwq+pCOoVeUHrPuz5XgmqmCMck/xziFI7dwXWcWX+IoNLrDd872EJekfz
	SdTlpD33Ie/GGvYwlVS0MNfi7bX7o8hjaYk52XA2b0iG5a1KpXQhUkQ4gZT4g61b9OYutxVuwn+
	ks2I8V1lXxtFWJqfm5rbHVc/jr7w+S77MjeQ3o5APQYecqGikcVgdKPqWMsUb4Yk8wIWriJTsQh
	tKIGgPNTiXNwkDhNDRlUGvmW5dbCEr2VWHd1GNv81soxnjeGtHgOp5HVFjDnceLussCrUTaU3QB
	zMjt78YGqsCrB//w31b/RxzE/BoYUlpJYbsXusNLiMnsQRC77apEjju573OvYb4lVms6Gxw==
X-Received: by 2002:a17:907:cd07:b0:c40:b59:1b with SMTP id
 a640c23a62f3a-c4679a0ad6cmr205617466b.44.1792593633650; Wed, 21 Oct 2026
 07:40:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atibhAMcgKle37-g@sirena.co.uk>
In-Reply-To: <atibhAMcgKle37-g@sirena.co.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 16:40:22 +0200
X-Gm-Features: AclHuK9P_pXHpQjeIJNu3hhCsP1EXBsiHMxAkTG5K31baLilLfCNdBeEfFXeaCo
Message-ID: <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kbuild-current tree with the
 origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Oct 21, 2026 at 1:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the kbuild-current tree got a conflict in:
>
>   arch/alpha/boot/Makefile
>
> between commit:
>
>   c437950dceb88 ("alpha: add self-extracting compressed kernel boot stub"=
)
>
> from the origin tree and commit:
>
>   0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")
>
> from the kbuild-current tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/alpha/boot/Makefile
> index 7c2a41c1e2a06,b050753e90157..0000000000000
> --- a/arch/alpha/boot/Makefile
> +++ b/arch/alpha/boot/Makefile
> @@@ -39,14 -38,9 +39,14 @@@ ifdef INITR
>         cat $(INITRD) >> $@
>   endif
>
>  -# Compressed kernel image
>  -$(obj)/vmlinux.gz: $(obj)/vmlinux FORCE
>  -      +$(call if_changed,gzip)
>  +# Self-extracting compressed kernel image: a small ELF stub (see
>  +# compressed/) with the real vmlinux linked in compressed, which aboot
>  +# loads and enters like a plain vmlinux.
>  +$(obj)/compressed/vmlinux: vmlinux FORCE
>  +      $(Q)$(MAKE) $(build)=3D$(obj)/compressed $@
>  +
>  +$(obj)/vmlinuz: $(obj)/compressed/vmlinux FORCE
> -       $(call if_changed,copy)
> ++      +$(call if_changed,copy)
>         @echo '  Kernel $@ is ready'
>

Thanks for resolving this.

This recipe now only copies the completed image, so I think it
should stay without '+'. Matt's series moved compression into
arch/alpha/boot/compressed/Makefile, where the change should be:

 $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
- $(call if_changed,gzip)
+ +$(call if_changed,gzip)

The existing vmlinux.nh.gz gzip recipe in arch/alpha/boot/Makefile
still needs the '+' from the kbuild patch.

Maybe adjust the resolution accordingly?

Thanks,
Magnus

>   $(obj)/main.o: $(obj)/ksize.h
