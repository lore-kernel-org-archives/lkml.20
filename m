Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815912;
	b=OCF2BgAIT7lV1N9Cu7CpG8wYJpeFg4fxZuLTDcHOceLHXYQq4gzp1F9TS+9llu/0VA2/
	 DKNxfzjD3XHskKEQ5XuUkMiA2P4z36lIKI4Rgcwdke/MANlbTbKaVyZacl30YEif5MaKe
	 TT8qVjqYB2r4GCsUCQPZ7kDBpSiBfr9TSD7V8JUv0cXopxsotGSgxNiOHo2RtDPJ433bf
	 N+C593H7Dvg3zRhed4ufdD2WeZIJHbhc0y9z0Yk6eEzUNFDnw7S1p0Clgo7Elmt29uwjT
	 wI3kNZ2O6UdxloO9NRuUK+0wTtyFmSADrGPO7frate8spZbOqEfvciPhH3E1lCMPBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
	b=DAUCla5TBzBfKnGXcuWIrS7Ttkp5+zUn9OkddEW/xbQb8FBGtPWFIte8fWjpAwNhkRri
	 tEbRmjiUCzeZd6EclvKxOLyFn+Bzm8+VsfA8YGvu7GfbNTjiFKe2uIIk/MKElcmaGLctV
	 Q+hbSzOeP9df/woJxsIgu9R6XW8a8OsgMUFY8w7AbSAHbemxT24wzomhYu2PmvOi3h04h
	 b7fGGHsF/+Zd2BWO8RMrMSw39HKJxoHwwEREJbhE6INSOMagP9K8O8yqDh50YpUWu1HWQ
	 TnYCS4FnvrUR9+x8dJptkrYT4+M8AR/0sE29RdjbCzWcTGyE1qmG9/MUOi/FhiznQAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZwbcCo0;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B7A606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96B7A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RZwbcCo0
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso1157163f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815909; x=1795420709; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=RZwbcCo0a4gjuV18T+2Ucnw6jCdsWPKRC5LMIQkGS1u3K0j0E8r+eXQHgwhpFjV9Ns
         E4eQbhZlMF0oYosxibPqVnuTLzKDIZ56ygSzOKMLI0U3HdyWkdsGQRg4ffVVNprx0lNl
         3VoShnBY86Rw8ivEwPnvAve0hmIwWUhUt2ZoXiWAG5yImwJfbTo3xhtFN5I/MYPHtn4b
         enxL6PfWiyWc5q9d46A94egMlP3knZPlBbquGKVnCwHFNT5Fsl4ImTFxxiA9tP+r47o4
         8TQ7tud9tTBHlzYrfDmF4FaRvuovfFXjlIwl3BFIwbrGT1RvY+zLOzg32pd1vrPaiWJ/
         fCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815909; x=1795420709;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ7d3rNHeUtNAkSjUSjsQ3HRQiSBTnNiLXOBSu1liKw=;
        b=yA3XYENM0o2QBK8XlzLJXCxJgqWYmnNZsbh6yCzg6jb61GWYEy5FS1CwlGXx+yhWb9
         K6PWRQ9glio2PHtt+GD8reYVgTamh46NzWQ3Dv4n81kduHQYTpKBRnnz4BDpxyRYTw7Y
         FjNdUPR1LyrHuZkhw5t2NXxmIjKCQvvQ4sv2LAsrfV8kuPAitRn1j0NQgTY4x2HJedbO
         wKOW2v/os3gkljto6quluDGErJ2XK62xaxKzflzfmpa/kzHBMMVYXowWVgjv/SQkk4L1
         qr1XonnbdmUxGI8W/v1sX5bjA1cY340gnuGym214q8ubOGnlw3FkwXuS1E8PpoT61CZX
         qNFw==
X-Forwarded-Encrypted: i=1; AL+hErGlRnYCsQjEAUvoww1f1CHgnQLQq8NHXjUF0rg7Y0+9Ou9vA+6IfVV1N3NTy/1dddqBDPGZWhZdmHDPoQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kpA4bYCvO3CJjABu0W/VDWydmvsNyvBNev3S8l71rrsaygCvf
	XqUG4dX5f5YJsGAtkNvcRlyEti/zk2Vt7QC4gkXNJD3PJ+DNE/gKC4ptbPaNWB4woNJK
X-Gm-Gg: AYBFou3/UMq9JoYZkhaDl/GE9sUcEVueuxMKyRtdRWllX8PdqTlUBnlxCdaPZRYTRbg
	spyObC/SNe0n9C5y92MRh2kO0qzfCF03o2SaZVbFdBp0X1GzHjnkcblByJ9UdKlML+mkWC0A0SR
	j8nPVWUmfQZjwnKbcqQiIQ2CyI8nMHAAUPwgMdrENznyCzrFySHHhJgwhjEVpirp2VhgBTpfzzV
	xCugrqN/H7MTrCpG7e/67Td6m9EV8IqE5PAAMo60z7J3YVYhOWwgWn5aRxmEOiReA7cVfKYpOHo
	SVY+Q5DP6jMpy5JfTISP3DhWwexekLVePhRpSU92V7305yL1p52Xk2k7r+x4RPVG5jU8t6kC1rg
	4Qmvc+EOGhtapwT3LddT5taDSBGQAIE1HXcJv2TRQTeIzA6YFIedb8H8tP/RsJH6ShqB2OCWr6q
	MhlzNPnGC1BmlssQHFRQ1nunBZQJ909/Ce92D+Mkm4HFoTfKhEVOQGMvVAB/SLdIsrecfssUJ7S
	c9w/ZJOJKuXizP4DImFYrK+sh/+9mXuU5Srqikpy2jAAeyX/LRf1a+S0oyYgDxczbyLfgUlvpkt
	qbSHc6tv4CjKThQJSM979YpYTRpMdn56oore87PbTB37FOBAtap/9iNoBVX4HNc=
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr20084703f8f.45.1794815908942;
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm21124748f8f.28.2026.11.15.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:28 -0800 (PST)
Message-ID: <19b4c35c016a91302bf6bc3380bfcd3d21dc50c0.camel@amutable.com>
Subject: Re: [PATCH RFC 1/4] powerpc/crash_dump: check ioremap_cache() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:26 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-1-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> copy_oldmem_page() maps a page of the old kernel that isn't in the
> linear mapping with ioremap_cache() and copies from it without
> checking
> whether the mapping worked. If it didn't, the copy reads from an
> offset
> into the NULL page. That oopses unless the copy happens to be a user
> copy, whose exception table entries turn the fault into a short copy.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns that into -EFAULT like any other short copy.
>=20
> Reported-by: Chris Mason <mason@kernel.org>
> Fixes: 54c32021eb6f ("[PATCH] powerpc: Add arch-dependent
> copy_oldmem_page")
> Cc: stable@vger.kernel.org
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/powerpc/kernel/crash_dump.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/crash_dump.c
> b/arch/powerpc/kernel/crash_dump.c
> index 103b6605dd68f..1543917bd3e1d 100644
> --- a/arch/powerpc/kernel/crash_dump.c
> +++ b/arch/powerpc/kernel/crash_dump.c
> @@ -86,6 +86,8 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	} else {
> =C2=A0		vaddr =3D ioremap_cache(paddr, PAGE_SIZE);
> +		if (!vaddr)
> +			return -ENOMEM;
> =C2=A0		csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0		iounmap(vaddr);
> =C2=A0	}
