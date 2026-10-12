Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E333793D2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812000; cv=pass; b=agV5W9XZVPG6P51CeNg6Illby5eynci3AJjoKMkSVBPMH2IVlGpZDTB9g+8fcJMQ2l20msT4DqfUvZ+h9BSeRdgCxTqoaXYTF+vNGxEJQKZs2IKjkneoCYqMCxqrb+bkEtUjaa4QEhJkfTDd9Jgz8PKz19FV4l8hlZIeh27jkpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812000; c=relaxed/simple;
	bh=Q8kBAHTJFyIMI6V+nJ8Kf/uBpMG3W+HiIvXhG9fBQzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oToLPtSVnvfXAh7EqDgZRnMkQ+AeowGsZF4hEm3K+Ka0WCFcIe0j+1jS7l7oQq2qq3Jic31vMcIScZdb/4R1Z6GkXpXScVtJu8yUMtT1KpWgX1zVeLoq7mrpOrdQlmau9IbVEP56vCL5vUqth4I9btIeuocvH6SEbGt/trrnnXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSzwUVwG; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSzwUVwG"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-677bc4704cbso1467289d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811998; cv=none;
        d=google.com; s=arc-20260327;
        b=kkga24nejQwA+sJGoi1NX2Np2MH/aqPVJeUJZgvYOmDQxloUAol99Ln2yIb0MiBnzw
         PAtbRvnrKKSJpULYuvXV3wpBoJA53bm9Vf+Wo6eHQhXma3u3axcAmAfnQdzJt9tvSJTK
         EWIEyK5CGt8/eyOB0Ljjq60Asi9l0CcRni58HKKMevFYPy3S3q8g8gZHj9485m6UO5H9
         6Q60o0f687jWHh54ISHalf0OQz2uyyfqkt07l7mN8vAFzk1htBmGpmJEknkmHDtE/K3t
         wpXICEwESOGtu3vB7wnNZaW51AshM8atRX7iUMj2azypplKAFSsQepGS4a9ES3sz0W43
         ZUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q8kBAHTJFyIMI6V+nJ8Kf/uBpMG3W+HiIvXhG9fBQzI=;
        fh=NiXNstY28Xpmqn5VmlEHaein8u8gUlBLwVsyoDvuQRo=;
        b=SamIQUr4dgRjx67adv2ND8gjmIO7vsTUuKx98Ds2xDD7JSmSss8MwyiL3EBEaj8iO5
         dmS3gX+ToQLfKLV0FOmeCMuc8z24quuSxH0be1CT1OFtxutEPyYPbPGqzIrl7QoBBGKm
         Oqr2hE9o8eUgtRmBRNFOuqVx7RYIRsPMddF28PnPoopk/HNkbn1Rjs8Gj2ERXgmaoo0n
         FJDLfWkkdTg9n5oyytR9RXJ6TE4XZKLGxJ7T7WQHDJGU4AmnqWiPI9fobXEMwhSmGF5o
         s6yWFzL4AbKYmbmnvVxnIMpzwfZFrrmQxt5jC9VTCyaA/b4ZFZL/Nv10uML2YTR4CoHu
         e/gQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811998; x=1792416798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8kBAHTJFyIMI6V+nJ8Kf/uBpMG3W+HiIvXhG9fBQzI=;
        b=FSzwUVwG6G1mDAVrABaSLpBK7Bojaj/Xk3xCR8fmpDJEBquYYdhmlStPb3W6XEf9vs
         AXyTRDOpU4zWm3geVCbPxF+dj12uuIwg+WX5qtUN9SyObD/8m92TNsx8DtUJLZG35fJM
         s1rQBXHRvjZk9DrfcVyJPvvJg8VSKrjch/nczCFZoytXGbBBMM8ohIWTTBm/IUyRU+JS
         UyvnHqe7WmTjZjRAEQ84z32O02JjZ70Ln/mnUE+6w4YDaiZ8TEbsJYbVww1H5Tn3CicH
         H/33qGybbu70JhgQaXCAEsrp0Kao2a3g9qENJ3JeQXssX1JF528u2Py6rIkNiL48O6wd
         KATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811998; x=1792416798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8kBAHTJFyIMI6V+nJ8Kf/uBpMG3W+HiIvXhG9fBQzI=;
        b=Htmd5UNL+KW6dy6UFSxzGWpDvrvhSHHwHC3YmnLmYU9EACrCTlRR5fjzgrNbuWdEdn
         EPVNso6sbE+z8h0GncI5K26K0fYOirHDQEAnYEg+QxhMzKtilz9YWV2gRBHsYYBH8Kg2
         3pryZKE29ZMlHuYSoNeEI7xf04OpeJVAwkufbymBwxo6tfymyJUexsO4FDXW3+so98zN
         iCLGRfQDJ7682l/1D5eU86SgSuOAL/MuGAGybioScNEfJFxRPIJy/3S5GycFlhvgvgni
         Ano46zp4f0JgxCZPY82Nt2bHLuAYPB05kT3lmx8GE9SLmx2bqGK/gtO83TRXRHpEzRt/
         w3RA==
X-Forwarded-Encrypted: i=1; AKwUvBxi6+pCgXDSpg56KMZZ9E5fDqzoiwYrUtwZf/6sEza+SjBuycPKfnT5L0NgbP22dEHJVCkzEVgWquoczeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYImiNhH6DFHe8Buf2C+3rkQ/FLIKlPl/BcPRVOPxMQfIRuWokMf
	Vx1wTnD9vmg+yzp9TbgNvsma8zZHZcnLfBAiuq3RGvmr4103haZ4/axBu7PCVHnv4Zo5H1XDM8i
	q6QvtwACdPBvN3GVtdD/Smn1Y4ZXAdl4=
X-Gm-Gg: AYBFou1zbSBQDAvby/QRJGrX6uTC8JUwFbqkvFIrH5Bw/cEPLNP+MRxlrt4ZvPGba0b
	OtdJ+LeQZRBNSsF7TSurQPWiPG6zeAnr4has7hTkk1UYQxQrIFlwlV9FBSY7D/4rPum2ovy/s6o
	NDT/svMxSHtYwbo1NbvLUhLD3qHNsXIaYB5KWHq5UZfL0jKXxVKUcK19fb9uTY2RxLj+waqwaym
	tz5e//Joduis/yEvbIOiDWd/nSpKMr+aibjo8NuPpWhWIP2h03FZ6SevWUlEWI/Ks6QJ6Ajk6dn
	21e23mfKn006DCxqIfHVHYOZc6shHsu425UEylTp5tUKtYcODC0xVXP44NesUy9YUK24
X-Received: by 2002:a53:ea42:0:b0:676:8b69:97eb with SMTP id
 956f58d0204a3-6793634a484mr2435865d50.160.1791811997636; Mon, 12 Oct 2026
 06:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0001-v6-9876bf3e2116d47c065e@gmail.com>
 <aszZ3KPvMMHLEJ0s@kernel.org> <aszalro6U6BFO_D3@kernel.org> <CAFRLqsUB0MQRoCHg8cXmyofWqbDGyvAr7vV07i0jUpMnSaksVQ@mail.gmail.com>
In-Reply-To: <CAFRLqsUB0MQRoCHg8cXmyofWqbDGyvAr7vV07i0jUpMnSaksVQ@mail.gmail.com>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 12 Oct 2026 21:33:06 +0800
X-Gm-Features: AclHuK8khvWi4McmLLK-ANublHQc9k3MPlNZnAtRVi0Ml1u14dD-i-9XyWHto-8
Message-ID: <CAFRLqsU7w=ctKeAv5FQwxcPVbdWO7EjC3WmE1JXywe_JWWY+gQ@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Protect user key quota access during instantiation
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, akpm@osdl.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Sorry for the previous email =E2=80=94 the line wrapping got a bit messy on=
 my
side. Hope it was still readable :).

Best regards,
Cen

Cen Zhang <zzzccc427@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8812=E6=97=
=A5=E5=91=A8=E4=B8=80 21:30=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jarkko,
>
> Thanks very much for the detailed feedback and for your patience with thi=
s :).
>
> Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8812=
=E6=97=A5=E5=91=A8=E4=B8=80 21:03=E5=86=99=E9=81=93=EF=BC=9A
> >
> >
> > I appreciate the fix but if I'm completely hones the commit message
> > looks like direct LLM output, which is not acceptable.
> >
> > It needs to be proof-readed and edited. For this reason, I want a bette=
r
> > iteration before I apply this.
> >
> > Br, Jarkko
>
> Thanks very much for the detailed feedback and for your patience with thi=
s.
>
> Several people have mentioned that my commit messages look like they were
> generated by an LLM =E2=80=94 and to be honest, I did write them with LLM=
 assistance.
> However, they often gave me the feeling of being questioned rather
> than explained.
> I spend most of my time looking for bugs, following my interest, so
> I=E2=80=99m more familiar
> with bug patterns than with the deeper details of the subsystem. That
> means I can
> make mistakes. I=E2=80=99m willing to listen to feedback and keep revisin=
g the
> patch until it=E2=80=99s in
> good shape, but the pressure sometimes makes me afraid to continue the
> conversation,
> worried about making more mistakes. Your patient explanation this time
> really means a
> lot to me.
>
> Of course, I also fully understand that busy developers feel
> uncomfortable when seeing
> unclear or poorly written messages. I just wanted to express my thanks
> for taking the time
> to gently and patiently explain things clearly.
>
> I=E2=80=99ll carefully rework the commit message following your suggestio=
ns to
> make the concurrency
> scenario and the reasoning clearer, and send a new patch once it=E2=80=99=
s
> ready. I=E2=80=99d appreciate it if
> you could take another look then.
>
> Best regards,
> Cen Zhang
