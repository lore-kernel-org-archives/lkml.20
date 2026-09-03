Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7929D1A681C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396049; cv=pass; b=aMcnn0X+/Ob4YcGgtDFY12FoVh1VDxEhk43ehvTDI3fx9pvg/ht60uY1cmxcmIe3tiBz/hlvvE12V8M/S4BmBoGt8V0wW7o9NQcAYq6wQC4/VTVWpIdaDXIi2rK2ht2AhgVZTORY6A0REVWlFCQvF2S0XAauSUG1mW04hgcWr58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396049; c=relaxed/simple;
	bh=ummikDaVeCHW0JPhyX90qry89JcKzSQE2CkFya5vVbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJor7JWix5FYSw1p8wQ1rfLV5CoR6H6MPaLqGRXejgXNfLvPDoxytLxqkccTXZfQdX8M7lTruPtA3QJ07KSUiL7LqakDcAZUtIxk7tIRhTIIy2qcRBYv/1NY7hXrutoUYBu6rTIEO+O+4lYpvpEkQpygGiCGpLDDGYapficdHOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n25efLp7; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n25efLp7"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8556ec44e9aso1691817b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788396048; cv=none;
        d=google.com; s=arc-20260327;
        b=MwEvTUHlfgV/2w8qnkBCP4KOy1ZdGny+DMK9jjGh9bXcmKcPE9HAjpxEwfBBjlCSGe
         pLLvIY9gHiyzKXHpRSQHp6cCpF8SaSKvupBEmAmXk2Ac8v6RPwYVDKfnxdHHd4BMHIHn
         eZLgf5IhsGKAv895+Mw8UEPCx6aYHFgM96PoBa9ZfihCuJ/8OtuvoK+8ZdkirY8g6UuU
         i0t85b+weHu8Hrc0rT4fkCTateJqECr9415QXpbOrHH7xZ5ad6/vXXHVoYspHrtus+1t
         Yp66XBwyoychzXeZv3LvAWjqR0g8PQSpUwE7HtnLeBSoZADMYLw6kh9HUyp5McL7zKqU
         h19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ll3GLAxigapk8vQrhDFtbMqJYnX3ubAR8duvzc6SrcI=;
        fh=RK6wNgzIfmI8OMzePPBTIWt7+ow0FYKH+RFqLMn36I8=;
        b=pLaz/T0QKfz3PDUiCFUkmzocGwusNM2bPEARyGC9Pa6B1q7Ye6+TKT6gksGw/lDpv1
         BJz7SMev2iYlzLt08jFld4Zj8JSetfofmV98uaF4S7wPLIfumH7tpKsJQasAdXiaeyZl
         djBx7gkwvJl2i0DpW3ol5Ngq8vt1JGlfuiK7vFAFx8BsjnDRZ+TmfvvoT3W4dAWN0O9o
         4BCrTckhWh2zz+kYl45DGKqN0hYU7UyQbuVSY6y+AebfxoQqV1XMMz7DpkQssKI3IbUK
         nNoV5DIyXQMq3H9Nk9ssYBTpPF8DwV1Z5rKpj6s8X1jPHtdfJNmBN/CT3X/MZxdqfLoi
         EY/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788396048; x=1789000848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ll3GLAxigapk8vQrhDFtbMqJYnX3ubAR8duvzc6SrcI=;
        b=n25efLp7McjhmpeTM9eoOznGkE3xN616qRCctvLLI9vfZdqDs68OH5cz2/cLw1pkJL
         bMEfgpqd6yHfBsS5/yOVMCWLuQMfP/pgkAekGxV1YkzWfZlnysGHNbQSCbu2F0T7pCZG
         AmUKtm9dBgUvIf7xvwFtFQ0tNKVp3hg7jOalHEQMoMDzRKNok8zImOtOe9ltAlcU5Gcy
         qPax6nzyVRt8TY5Wq0/XeyIgdTHEGCd7IsHWrCPuPo8jmwib5KqUW/gXT/DT+B2usUXg
         IoYgepQqh1BC236bVe1udBzOicguI7DkpnWxsTwyvs82Qyg8UdIODZEtBoeqKC9hcdhK
         tQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788396048; x=1789000848;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ll3GLAxigapk8vQrhDFtbMqJYnX3ubAR8duvzc6SrcI=;
        b=F64Yux1ibwywUyzpQyQnsq1Uw6VrqnRm0KPQvD8oO2mjGJ4N7QaNv5qcFYuHPggXWE
         nRpb9CxAoRfhInTy8VITfXs5yvN5WlNlQCbBFhyLxhtUWHigcEejI/+rhAbGPuVnpI2F
         BgzXzhGOMF5KhNuv4iRW45eauc0VRBmpy1LBiOnScc+wgKvoju2Mv6wvp8ZrKzH3g7aQ
         y2lV1GRCFc1jnkkZsaGRjRYcY+fb/7qcZz5VaTx1iQKUkJLfL+Wjg9xzO3IsYaJv0eDs
         Cf++PaX5mhlNo0w6/T9bEl/Q6fM/rrXbI2e4UeYYnfliEAKO5E1YicpmqrPKezdCadOV
         nbTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9GO0ySodF3VOCPOomMHDD94VVXaqdsvtmrdf/1V56se8NdBQ+AJzs8Ln7Z6nQFLTrGx1K952ggGpeO9g=@vger.kernel.org
X-Gm-Message-State: AFuF++lardfzcolMm9D+JIvF4QYQFhstD5zjOQ0eNZtimVXsQWJ/Egca
	tPlJPpY/alDH+4B3TikP3T/XbH/JZm8xqkOIcvDFDytq2cDARQJdbWokOgUqZPVIC0eQ7oCAiM1
	oyK8N3oOzu3v1rIG/ZhU+IP9Erbb1Arw=
X-Gm-Gg: AYBFou0ZgaTbxvaQT1zXT/aaHx9FGRbqn1LqUXyooy3Xh+rPI28BuZIipwoKHXVu/w6
	aK2DQ4Uu5vuadULtgc9EHVaCaJk8qgtrBV9m4xfLzIlq4FrU5eE9ut1sIyjyg69tn73jpdUaeTx
	zwNsHEUgHtnApHBstb00SDx7mvXOtd7oeL6oWagTenfWGGA2ai3TxFJNsdtM9rbm7E9ZED9pD7n
	TTWcRavAeZPD2qpjdJnq/cbGWQELq2n2KvBox8chPS0HMwMrUm2loC97OxoUjLddCsLbSDDjDK1
	CPcvPeJ/ICqwsMUkBSXKxlBfpI/dW4oroGmfBed06pLxPA4fOJSTT5jdosYPxhj9T/1iH6DT+vA
	IrMv2ptAz9YsJWSLMY6ZcoGNbHg==
X-Received: by 2002:a05:6a00:4c86:b0:847:9015:e68c with SMTP id
 d2e1a72fcca58-85ed3f70278mr13510128b3a.17.1788396047600; Wed, 02 Sep 2026
 17:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902091126.59281-1-markdamirkan@gmail.com>
In-Reply-To: <20260902091126.59281-1-markdamirkan@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 2 Sep 2026 17:40:34 -0700
X-Gm-Features: AcwNN1WhcKJO8-PyXPVycu3bHFJ0XG2h_wkDwdZhBHP-rTVF3QHwBAawos6jWAk
Message-ID: <CAEf4BzbATmY=yzdKsQwAV5hXwZsahxcYVqtT0+7GoG+N2eFTLg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] libbpf: Reject oversized unknown BTF type records
To: Mark Amirkan <markdamirkan@gmail.com>
Cc: bpf@vger.kernel.org, andrii@kernel.org, eddyz87@gmail.com, 
	ihor.solodrai@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:11=E2=80=AFAM Mark Amirkan <markdamirkan@gmail.com=
> wrote:
>
> btf_type_size_unknown() returns an int, but calculates the type record
> size using unsigned operands.  With a 24-bit vlen, an unknown kind whose
> vlen is 0xffffff and whose info and element sizes are both 252 has a
> record size of 0xfc00000c.  Converting this value to int produces
> -67108852.
>
> btf_parse_type_sec() returns the negative value, and btf_new() encodes it
> with ERR_PTR().  Since the value is outside the error-pointer range,
> libbpf_ptr() does not recognize it as an error.  On a 64-bit system, a
> 129-byte raw BTF input makes btf__new() return 0xfffffffffc00000c while
> libbpf_get_error() returns zero and errno remains zero.  Calling
> btf__type_cnt() or btf__free() on the result crashes.  The same input
> makes bpftool's "btf dump file" command terminate with SIGSEGV.
>
> Calculate the record size as size_t and reject values above INT_MAX
> before converting it to int.  Add a regression test for the maximum-vlen
> unknown kind.
>
> Fixes: cacd6729c092 ("libbpf: Adjust btf_vlen() to return a __u32")
> Assisted-by: Symbolic
> Signed-off-by: Mark Amirkan <markdamirkan@gmail.com>
> ---
> Testing:
> - normal builds of libbpf and bpftool, plus an ASan/UBSan libbpf build;
> - the reproducer through btf__new() and bpftool;
> - the added btf_kind test and the existing encoding/decoding subtests;
> - identical bpftool output before and after the fix for all 60 BTF blobs
>   under /sys/kernel/btf on the test system.
>
> The complete BPF selftest suite was not run locally because clang was not
> available.

that's ok, I hope AI wasn't too stressed about this unfortunate state
of things...

we are not going to harden libbpf against any possible malicious
corruption of BTF contents. If you don't trust the source of data,
don't pass it to libbpf (or do it in a VM or some such).

pw-bot: cr

>
> This fixes code present in Linux v7.2; please consider it for stable.
>

Do you use libbpf in practice? and where do you get its source code from, i=
f so?

>  tools/lib/bpf/btf.c                           | 11 +++++-
>  .../selftests/bpf/prog_tests/btf_kind.c       | 39 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 1 deletion(-)
>

[...]
