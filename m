Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4065C140E5F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907984; cv=pass; b=iAdmW9Ah85cE/X4ekGFjH/cwFPfEk5Y4zv1IA9DMFM6ZBg3gL2xRL8jSv54KfxzTsVrnzi3t7tvHlgVJ0RvxpZTA31cqC2i1Dnftdjv6FQR796jaEqF+yXDCB2SOqktF7Ys/OWFazL214dCKsuquw9Fv5zeD/QExA4QDLl4/1XQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907984; c=relaxed/simple;
	bh=xLmAuBwYyaDsx3wecHpGi6rL0YjkstSOswTwY3CkQe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwciXYdLOdumC523z+6gX+o2P9hOAWIYaumW0RO/ch69L1EJ9msrZgbl1Q20bcxx/kEXcjyUm5LI8E/a+Lg2d//MxPQC2P6+pd3K6hEkMhElU2Sw5/qGZTL4C9QMNhJaHcIbL7lA/AaZL9M8bpyAAuT0xufgs5vtFGxUA7bwAFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADE8G+Bz; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADE8G+Bz"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c25344a8c6cso81963066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787907981; cv=none;
        d=google.com; s=arc-20260327;
        b=DRPMsA3o6efq0pOA/I7M6GijsVkx9oTeti4vRqqH/UZbCwPh8z2VgBxIp6AxlSR0PJ
         JAiV7Ab9US/EsXyf4toIh5T0pwY6Bcmdy3eVX4JKE+AYqBH6uMoUyMxX5fYH98gspX1V
         OvjiaGx7/82cWdM1KLEtoVoATmEF4ldiKN08R21QKHqcEB/sVN9Lo1W7QG8/VOhS5zGb
         9MQb2fkdsO/j0p/9oSoboJbLMISKomjPlQ3g/sZBZ37XuFslEeS22U2W+vRsAgUqvcjp
         jrQtCPkDFSgmPnXxhpUchJbD+/aUpc3vEEIH0h3tO2UrPTPgHvmIdcFppOEY2hPadPfF
         IzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xLmAuBwYyaDsx3wecHpGi6rL0YjkstSOswTwY3CkQe4=;
        fh=IerGXAjSn3g2h9duA72p9m/3IP9PgTzgdvL4MT+/tp4=;
        b=lLYYSUOsieSM7RhSQGZLvLVUd8ZxU+LMkIHB9I5P8fvVqH2eqO4kLtafRU+0OGrQEv
         RV+HSbfcphFTcH4tgry76WUBu4rVlmT6NqgLiXY0biySXBpsjXNTiTTTCiJN3ZWxjcii
         B3W3tEoBkXlP6PmWuQol4W7DBBT9jYOIaC9iK3yYzwcccRQFXmyML02RHhsl3wadGH56
         9E1aPqcXi3a4KKvl+Zf96tsB7/4s2eWEfq4cixbpKoSM776LhDiH0n4Ha8CzSYX4a/XC
         IIVkQ7btg2RmQ3oNWtEyyTY+BT/7Kf/0sdqOTQgqr/771GDjaz+okc0/Cto6AkqiQAJ0
         9rNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907981; x=1788512781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xLmAuBwYyaDsx3wecHpGi6rL0YjkstSOswTwY3CkQe4=;
        b=ADE8G+BzBNAtVKblnujP5Wg3Dp5AIUe/eNpinxo3mVXBibeofmP67vaiadE6a9OKlW
         mBqcgeATVxZL/gJuDXuqpEDx1FSHg6emfys54vAKyJavkxflNuWczqu2xpRPK+hkG5QC
         +NF5Jls203DzrzYNVjAa8bwbyz/OSmOB2eKOtleHpJgECzqaX+Xq19eHNdtVfO/t01yj
         Qn5/mGRMikCbOcyEEm/xSlcnSSwv7NYLVhxRkDaCfjX0ySXQ9hqOaJppJEDrntxHoP2f
         04nwU3EMcAxSxrBNfGoD279lUV/pSB2zmn7T6SePb44NsMHKmY0HGtHxZG+G1nnbPgfr
         D22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907981; x=1788512781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xLmAuBwYyaDsx3wecHpGi6rL0YjkstSOswTwY3CkQe4=;
        b=RplQ46J7B5FcWbi4mJj1kbPumEpKYArdYFsnzin9k4T4KSX+fClGj8EsI+/+kn34fc
         Cs0UX2Iq9UjBgaTT3vnpnnsGADaTMKDhgBFSE9mgZXlywEcFPOG/dc9UAcnO6Xfm+EHs
         PmGKyBlICIgno7IWBKLIa2SeS8ra05w60DeBLPlxmh4jeJs40UA6x1ueRupaVHLX1OG/
         FViO8Hf/eMIV5XtNqqDGr/4J9u0dPs4fzSutOPaUFIgyFuoP6suB+WY6qAPue5XqMfiL
         04zqsRpnmgzlMkzlY/iYDOaKSnKUxuUSzNiFoJh7fSSCdL/Cus3rK5YfekBqxN60M3uM
         embg==
X-Gm-Message-State: AFuF++mZa+KiG8Fq41qU67R5wmT6XQ1J4OuMghMMCCNq8scQEKaKx2Y2
	sN1dHccXhXlvbuHX/v9Tqz2gegQf1fXBq7Of5q90e4Mh7mvF7RFcFf7ruS/xfmzW5yEiZalpYY+
	kdZbK/JJmWZA6cW1qnHoQWxAa+1FDzk8=
X-Gm-Gg: AR+sD10sJ3l149UKesDwL65u6f69raT9zzE4egSi6XiZ7xZy7Q4rnxLFMWc7D1I2nVT
	pem9FI6PqQ+hUX3YADcGsYC2LZIzs2KZim8zyJxG1qnAX6T+gMnvP6kntEWalKtvzIOc1k5PNNj
	rx+Yu9bZ30Ms8Lbkr04dHJRe2PuefBvJt+Mxg/JzsT9+TC8ItMR2sqZ/1m26yrpWdoD/JtfaQOT
	cgSFzNXmKycEyb7IU5qGMMS0b4GvFVbOAfDQSYnscxC/WsL6veDu8FP3NAx7u64Xu6rRjTQw0OG
	/neKvHGn8ZasAjip0DrLVOkVfGNVeN7ekpJS36RA9e/76GWIGVjzQQoXo6tUAvvAWBDgb20PWIT
	leU3iQRVMcRY=
X-Received: by 2002:a17:907:7ba6:b0:c24:6445:d19 with SMTP id
 a640c23a62f3a-c25571647aemr289652366b.17.1787907981128; Fri, 28 Aug 2026
 02:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825161712.41471-1-scadastrangelove@gmail.com> <ao_iJG-f8707OjL9@google.com>
In-Reply-To: <ao_iJG-f8707OjL9@google.com>
From: SCADA StrangeLove <scadastrangelove@gmail.com>
Date: Fri, 28 Aug 2026 12:06:06 +0300
X-Gm-Features: AcwNN1Wd2e1MRK7vtCr_OqirlMJyNOAFc_6liqQfvY7sm5Dc1gtQdwOHvNHmRbg
Message-ID: <CAJ+7+cCnWHC+4n=89ndWH2zK=oYnVabH_cw53TfzmWn+cRgHwA@mail.gmail.com>
Subject: Re: rust_binder: use KVVec for files_to_translate
To: Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review!

> One it looks like you're missing [PATCH] in the email title.
> Also, as checkpatch points out, Suggested-by must be an email
> address.

Both fixed in v2 (sending shortly).

> Also, should the close_on_free vector also be a KVVec?

No -- close_on_free is 4 bytes/entry, matching the wire format, so its
worst case is ~1,048,554 entries (~4 MiB, exactly SZ_4M - 88 bytes).
That fits under KMALLOC_MAX_SIZE on every config rust_binder ships on
today, but only because SZ_4M and KMALLOC_MAX_SIZE happen to coincide,
not because anything enforces it -- if either constant changes, this
stops being true. files_to_translate and reservations don't have that
margin at all: they blow past 4 MiB at far lower fd counts because
their per-entry kernel size is larger than the wire size, which is why
those two need the fix regardless.

Sergey

=D1=87=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 10:07, Ali=
ce Ryhl <aliceryhl@google.com>:
>
> On Tue, Aug 25, 2026 at 07:17:12PM +0300, scadastrangelove wrote:
> > From: Sergey Gordeychik <scadastrangelove@gmail.com>
> >
> > The num_fds value in a binder_fd_array_object is bounded by the
> > transaction buffer. However, its in-kernel metadata is larger than the
> > u32 array on the wire.
> >
> > On 64-bit systems, FileEntry occupies 24 bytes. About 900,000 entries
> > therefore make files_to_translate request roughly 20.6 MiB of
> > physically contiguous memory, triggering a warning in
> > __alloc_frozen_pages_noprof.
> >
> > translate_fds() later allocates Reservation entries from the same
> > count. At 16 bytes per entry, this requires another 13.7 MiB contiguous
> > allocation.
> >
> > Neither vector requires physical contiguity. Use KVVec for both so
> > large allocations can fall back to vmalloc.
> >
> > Keep close_on_free as KVec because its u32 storage matches the wire
> > representation and does not reach the allocation sizes above.
> >
> > Tested under QEMU/KVM. The 900,000-entry reproducer no longer triggers
> > a page allocator warning, and a 300,000-entry transaction that repeats
> > one valid fd reaches translate_fds() without WARN or BUG.
> >
> > Suggested-by: rust-in-peace agentic pipeline
> > Signed-off-by: Sergey Gordeychik <scadastrangelove@gmail.com>
>
> A few things. One it looks like you're missing [PATCH] in the email
> title. Also, as checkpatch points out, Suggested-by must be an email
> address.
>
> Also, should the close_on_free vector also be a KVVec?
>
> Otherwise this looks good to me.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Alice
