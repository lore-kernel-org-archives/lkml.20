Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410C4746BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373202; cv=none; b=hxLlzzEF8QaIEJsOUQMyIQqRkH+zMqgnRRGWQObD1TiX1qoFcV6pE5zbATorGxmqTavoKgbZpIGVndOiHCgylVae/D0OQM2KSWAf7/QjYzIzv76eKxWqk7yANYjL4zHPElD5n7MA1sZu5VL1nkw6/4MAicDEU+wWxc7xDNIbJXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373202; c=relaxed/simple;
	bh=GtoQA9ZjPrcGOfipPb9IUUp6ZG9jXfqV0icQkIbgXTY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1//FcROutQIloOdy8zOlvHovw9qREhFnc5DCnkyN+whYxhtNZhK8I1iZHaRU4fw4Mxx3OTr+VR403PpX08EH+GRIQJYFJZcbdAuiuLpJpZ3yUcvxN9oANFF+JLUX5PRJahOVKmWnpn6Q6HTl3o4UrBRpRTprrY8CZaEENAAOms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJN3+M3S; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJN3+M3S"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so14482605e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788373198; x=1788977998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u7qs3hNn4LB9d6bKk0MOq7GzVE03yw7eE/Je5YMCtBo=;
        b=lJN3+M3SS3OzJ7tyPwIdhgmAg813hp7IVtB1KVPtZ1S2VYWOEh3pKWqReRQWwVzPWm
         gU57YhI7u8vWntvLgGP3MEHsqC0e3Z0n4PreTTuoqvEADpbaGTBy1ZhxbtL6w7V/LQNN
         zlszoUbhLgtMpp30tOm9AiTsNpQbIzP1TAuiXp4bQvUMft9/0I8yTW6kHLu/E58n6Vob
         HO+xI716sTlWGHO2kiCGAn6hhB0w5AZ+Pq4M80ThC4t/ntSRghq/EFXBF31x4BbowSWR
         zPLTrh7fA2h9bRzDGWfBdwGfMBO37i9lJDTiJoPo2n7DehVIscoXNu139rPa7MNez/OA
         T7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373198; x=1788977998;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7qs3hNn4LB9d6bKk0MOq7GzVE03yw7eE/Je5YMCtBo=;
        b=CeVlaY8wRW1c09b/nrwD2TdXyTf/66XruJdi+rQGGJs6S74qDS/PbFjxIHd7i2JqAG
         BcbiKmLm0mbk29muGjymatgTDHQ0wNOwSSqiPOlhypY15pL10OO1ukQEZn0bxNYCWzQ3
         61GW/fQMseEUeNH2bMxF7gAMLY80bIOZXn71kpDWmn5BzvHpaJ8Zumuf9eNZgOLM811H
         jskJ3Ic89N7mgp+nARIwcyMkJnsJYlRuQyizkr/ABa/pHyPxw5Jx8rVkPudxG8fzAT1W
         FelfKjCgLqkiDIYarJ3CaFYfFrliFds7EqpHX0EkaQYve36P1glvy7FOq1GW/fZ/xyFH
         /5/A==
X-Forwarded-Encrypted: i=1; AKwUvBwJLI37pYLY080rQwp/LSu2dJsVfHorsUQuMQWQASYF0ZV4gU2oRei8dKu9JUcjpQAJd8FyhsvmF3tYGsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mcEctp0p5WumLOnM5H68VZHAvKy5QeSPy22BovqDnlaHjDapeN
	R/DiW5psWVShWqvMkxMSnXuU/XkxuqATlQ9p0OFV16gXEDCmB1wf8dlQ
X-Gm-Gg: AYBFou2w7TsdL2C4xRFICBgtZG/l3QC6z5EAKt3Tx42f9IyrcFBH7mQOQj0+sCK/L7w
	alY2IcQnet3/myuCcSrvb0F2grZ4S6g63ZTBRqfEgqZczIHWn+mlmGGT5779W/C16sH1Pu8F89C
	Kt8NGPtZhCdUdEpDYwbouM8imm0ZFPmOazp/4QrQwt3gu1gvIvJ+cLLsjKh3yUbvD7zNGz4ora2
	JEPjccbjRKMQwvn48c0QREPaautQpCgGBzAxR1e1s4xv1j9Pqk2TNIsNDmfVs6lhTZ4NeDVDAps
	evIuvNYwbxwY0CLh9pLobJcAljBppNDhe8bym8Ix/RLpNxkdsMoz26TUPOw2HhVE3qF+nmQOD0S
	BhZGN+0VSueK59XGJu45OchQSjU4kAS2djh9rUhWjJ8KpBV4Cj/fq1G8G9ZAb64VtDDB8KnJHAD
	PqX6xLiwrvEpho49GAvLe0PpfEQRGVt4xIjshEoeKZmEeCfK++R1PrlKV66XgDsXbf4S3PATPpp
	SqzrNOT4wIf93OIoVigqZwhdQ==
X-Received: by 2002:a05:600c:4f88:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49ce58388demr100657795e9.10.1788373197777;
        Wed, 02 Sep 2026 11:19:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm10644075e9.0.2026.09.02.11.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:19:57 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:19:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] xor: add missing vzeroupper to AVX code
Message-ID: <20260902191956.0834eaa3@pumpkin>
In-Reply-To: <20260902162359.GA2497@quark>
References: <20260831212248.213805-1-ebiggers@kernel.org>
	<20260902133706.GA21538@lst.de>
	<20260902162359.GA2497@quark>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Sep 2026 09:23:59 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> On Wed, Sep 02, 2026 at 03:37:06PM +0200, Christoph Hellwig wrote:
> > On Mon, Aug 31, 2026 at 02:22:48PM -0700, Eric Biggers wrote:  
> > > Since the AVX optimized XOR code uses YMM registers, execute vzeroupper
> > > before returning from it.  This is needed to avoid degrading the
> > > performance of any later SSE code that may happen to be executed.
> > > 
> > > Fixes: ea4d26ae24e5 ("raid5: add AVX optimized RAID5 checksumming")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> > > ---
> > > 
> > > This didn't get taken through the x86 tree.  Andrew, it seems you're
> > > taking patches to lib/raid/.  Can you apply this one?  
> > 
> > Can we do kernel_avx_{begin,end} instead of having to open code
> > and document this everywhere, please?  
> 
> Again, there are cases in the kernel where both AVX and SSE are used
> within a single kernel-mode FPU section, or where a CPU feature check
> occurs within the section and one or the other is used.  So that
> abstraction will not work as-is, and it would be different from all
> userspace code as well.  If you'd like to try to refactor everything you
> can try to do so, but let's not block fixing these bugs first.
> 
> Also, AVX != "vzeroupper is needed".  The relevant thing is the width of
> the registers used.  There is 128-bit AVX code.

It also depends on the instruction encoding used for 128-bit AVX code.
If the VEX encoding is used the high bits of the ymm registers get cleared
(rather than preserved) and you get different delays.
Flipping to/from VEX encoded 128bit instructions adds delays on some cpu.

Yes, it is all a mess....

David

> 
> - Eric
> 

