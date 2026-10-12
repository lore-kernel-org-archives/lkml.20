Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADB1281532
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810487; cv=none; b=d4xEo3G1aSTiihvbA0DFMtQlpEFMufIZ/8oet7nMCqPUz0Dp4vZRQs90LyajDRgHFgqtFE6dgDuhPbCRJWOywe2hOurX4qZxsaCfgJGwj3XhuAifNBYKtav6oM3LSdXeDTqgxeReAGVMZQl9KmqLIy8Sk0hRkAdwehwgrTsTRhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810487; c=relaxed/simple;
	bh=POvujTz1z34bw0MZ3uiykvcaFRM070LEG/g06kGP3aI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4+Xvi3UmtU2gq20OzUs7DGbjZndmrUVu62fWzTw1dhWD9IRI10deYwc5hbok94nh2gj3u2iUVuiQi4no4VIDddzxqz06D0Efa1VlAlh+PU10oqQp8qDTK7JkgM2DIRQyw7EuOcIxTNc6cr9eP0liRHC/mIM2ThXl0EWvjQiSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ora4Qnco; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ora4Qnco"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c02782159so1115619f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791810484; x=1792415284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEXjo4xNLEHjAPgm22WbApSKp4thYvSYX5Y5T/p9yxo=;
        b=Ora4QncoaSII2sDxODFZ3pKXT3+ORQkMiL86sfwNF1fietVuLBTBRB4Au7N5J0koAg
         bf00LgeeE3idN3f+fNrIEYUuaHrw2BU17Q2BQJOzt/78tKqCF7tgkSxWFj9vYDA/4mSN
         tpfKLTKvypJmyheUxPyeD6g90ebrtRUyfqLO3HCLnah43EV6Uc6dsvfNj94Koa1HTV+a
         TH+6TaN7sfwu4WoxSpRp/YaCJssEk4GE34UTnp+iL4CdYFtaMpuOxTPDfZ1C6jXyXELy
         CQ2YNhhX+SWUtV+vlWeFvBPLM9hRNHElpYbBXNbY1frPhw4M7D8/GM2U8x2n6MOJWZZb
         Ng6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810484; x=1792415284;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEXjo4xNLEHjAPgm22WbApSKp4thYvSYX5Y5T/p9yxo=;
        b=tqCsGpo1+D6qc0hXGYMLKrvGbaIEwoJ1Ndp3KaY1Fn0C17CY7EweRpT9r5NyQYCky2
         sS/hzwNVTO5fiCt8P3js0fmA/MtEhi8FElFjzbVqETvTXUPCKb2ZnCCjdswcqZ6sN6cS
         Ge0ZjfLiCecAeNisX7mOXhRU631tFMKwvnsJMcRnLXnlQ1mp7iv588BJN9kdvl8a+BhF
         ev9jybnE1kxhZd7fS/d2hZMADPIsHTrNCLoyiLE8Qq+O/Ro8ITxXGR54d5UbkEkaqBqj
         i3aPLATf7emkcwu/dNa9bH7vy9MjxKXZqlD468Ijk4nGLOF5I1nZgdI65DXfJpvnTE1U
         BGbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAWxXb6eHaK9W4liurZXgplKwwhnQlmXdhn0MkQ0Xz1pBCa2ZX66c5iH7s8eVnDEiNjoKajWg57eduYj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMmh8TEfdiL/p/aOS+Li3+VkfNt+/SVN0J4Qzr2nwa9iBHctTR
	6BmEFFUt9Iqk08GwuKCADKW4nUXoSkP9G43wzQNDq4go+y3TbK0GJQfL
X-Gm-Gg: AYBFou0TftFAQAZkHLLxMjccpWnSZ6vVkvWPgteYbc7Mm3hltQyuCP7gEyA1sf7zXNX
	pJ8DuGGPiRHdKnQk/PuGCvoP/PBnu9YICJYklhnb/oGO2DApv2aSxNElPE0LrD4cq/UqYJLWzst
	OrrQs1tKA48EzNXkutjq0VCmLrgdnZuK89TAeSECgb85evhuo3HwIKEJ5niK/jN0oyJc2lhWlW0
	ru2DH7VEqxC6b3BFnCR9hRJUKs4hIr0vWFZbUQdpsJRjsIe8/fFv4cP9QuSj6/QTYj/e07qy+yq
	STFIeAtGtOsDWIR1ec56ScuMYREsni2xiSley2YCsOwHZP4BPczBjmPRWahdoaGe3ASiQN0yWqE
	skDy/Rj2tMjOXs1TOWEbD+IywdshrZU6GtKcMZcOGKzMBirNo9VQWRs9GIDy+veGGjNjXa0PUye
	daeTxfno3PW6l5/lES3vfnf+Bq2GiDXilMpwmcOgYbw4LZ3LquODGGvWFX5Hf2qljj80PkIktYD
	ojvntmsQF7q0wvZXQa0hOHEvIHCaK7J8gs=
X-Received: by 2002:a05:600c:3541:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a18e4e9ee8mr165470305e9.32.1791810484032;
        Mon, 12 Oct 2026 06:08:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2e0dbsm305917465e9.11.2026.10.12.06.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:08:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:08:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Wentao Guan" <guanwentao@uniontech.com>
Cc: "Eric Biggers" <ebiggers@kernel.org>, "chenhuacai"
 <chenhuacai@kernel.org>, "Huacai Chen" <chenhuacai@loongson.cn>, "Ard
 Biesheuvel" <ardb@kernel.org>, "linux-crypto"
 <linux-crypto@vger.kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "loongarch" <loongarch@lists.linux.dev>, "linux-kernel"
 <linux-kernel@vger.kernel.org>, "Tianyang Zhang"
 <zhangtianyang@loongson.cn>
Subject: Re: [PATCH 1/2] lib/crc: loongarch: Use hardware unaligned load in
 CRC32(C) loops
Message-ID: <20261012140802.267c293a@pumpkin>
In-Reply-To: <tencent_339CC94656CDACB222608A27@qq.com>
References: <20261011142930.492999-1-chenhuacai@loongson.cn>
	<20261011150052.GA168780@quark>
	<tencent_4750F9C704AA3CFA1E7309B7@qq.com>
	<CAAhV-H59DV-qF98M1Uu=Y4k1a8YNw0_RnP_nH-yr8fZu-jnFXQ@mail.gmail.com>
	<20261012072200.GA828441@google.com>
	<tencent_339CC94656CDACB222608A27@qq.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 19:11:02 +0800
"Wentao Guan" <guanwentao@uniontech.com> wrote:

> Hi Eric,
> 
> > On Mon, Oct 12, 2026 at 02:43:47PM +0800, Huacai Chen wrote:  
> > > Yes, we considered modifying {get,put}_unaligned_* globally. But it is
> > > not arch-specific code and we have no way to override it.
> > >
> > > On the other hand, the byte-to-byte {get,put}_unaligned_* is always
> > > correct, we are free to only optimise the hot path (like crc32 code).  
> > 
> > The unaligned access macros are used in lots of other
> > performance-critical code.  Hacks in random places don't scale.  
> Agree, from their side, they thought may like: the change is minimal?
> My thought like what other arch did, use alternative to patch the {get,put}_unaligned_*?
> 
> > > > > Since loongarch made the incorrect decision to not specify unaligned
> > > > > access unconditionally, similar to RISC-V it can be worked around only
> > > > > by overriding that in the kconfig.  For loongarch that appears that
> > > > > already be implemented; just unset CONFIG_ARCH_STRICT_ALIGN when you
> > > > > know the kernel will run only on CPUs that have fixed this bug.  
> > > > I think that we have the use cases to provide the general kernel instead of the two kernel with
> > > > different config, so the image increase will be tolerated.  
> > > Yes, the default configuration is to keep CONFIG_ARCH_STRICT_ALIGN set
> > > for single kernel binary.  
> > 
> > So don't do that.  It does not work for divergent unaligned access
> > support, as the other architectures have learned long ago.  
>
> From RISC-V workaround learn, their model is different,
> they want to default unaligned access, and trap and emulate the access.

Which is entirely broken from a performance point of view.
Especially since some system hide the emulation from the kernel.

> 
> This LoongArch model is point to default safely aligned access,
> after detected the unaligned access support, next to use the unaligned to speed up.
> Or did anything I missing?

There are three cases:
1) Unaligned accesses fault and must be avoided.
2) Unaligned accesses are executed by the cpu but take a small number
   of extra cycles.
3) Unaligned accesses are executed by the cpu and are (almost always)
   free.
For (2) it is still worth aligning buffers.
x86 is pretty much in camp (3) - I suspect it uses byte-enables on a 64 byte
wide interface to the cache.

If you align buffers you don't have to worry about things like
'word at a time strlen()' running off the end of a page.

David

> 
> BRs
> Wentao Guan
