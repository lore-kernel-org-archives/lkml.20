Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B301EB19B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787999454; cv=pass; b=CU96B2VRi4E4v2ww8Z68wMADhTFdSC18RTm4fC2k93LWcuvbZPLoXJSN0Urp8/WWfIJqXPGM67Z8izHiYxkdhYWuaPtFdhmCz8HCb/QtSsNoBQSUL9ZADLq/jA4E8hXV20OuqMjONMJFWJdIwrvs46E0Vptr6Avd0KPC8yvhjTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787999454; c=relaxed/simple;
	bh=bHwXFE2owPIokZUYt8pax3s17uo9rI+W8f4UCCZ76K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhfUc+Gfdho7AycQUDODq3JT8TmDZFU4tQ0OMN+Kon/bOyLPKavAHU5lTNmpNeBH0qBvRy3DlFu0kx3gXOg5sM77/jSCsl6sEtQ7MTzET+Gg1PdsGIjaztkbT2X5guQbpIEzvXsFZRYx6r9dq3Uym+qc3Ch0A4SIrDwWAaxbNdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rlBpDbV8; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rlBpDbV8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f84023916so1629828f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 03:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787999451; cv=none;
        d=google.com; s=arc-20260327;
        b=IFrqU9P7xtsKBAv1gwdSeXkM4ZglJzPK7T2CrE4lTQRYtGI1isJRxHON0M6lvUGYiA
         qsfcGw/Gik+EJVEqeiPwefMql6iJaI7uUQPgLADWBMdBMfl2kRe7u3cBaePLAKCBrRK+
         GXKmrSNXZYpc0FUPxDIiuAbi3KxMX249/N3iRWtC/qHRRw6POZBRfy0sq9ErXv82uk1v
         eIvSbZVbzJUoFVjGRx50sWVHzXx0ZPVnXoGnzC2lm7kL5fXzZ4JXbNGDWfntz+K+kKJv
         FskrpQqcf5tSLwjcyXt3I9QunVupbzL7o6Orq/eihuvxRaWRa7WGeH7lqAGysu1lNIuj
         uUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bHwXFE2owPIokZUYt8pax3s17uo9rI+W8f4UCCZ76K8=;
        fh=V5L9UeRMd7zzZtfh3geI8sdlXe7h7i2Dy9ZAh2EKPbA=;
        b=QCgMjbNvKcCpDk+UOq3mDOwBql5/DygmxYQXlklpTBhpyrXesaRKTrEHZjfnbVEJmp
         UtX0FrftSmMkTZdK5xuK06Am6dDIn5z+lZ4ZNqSVsT1W91I5d0lNtPTyl62rAR4NTzaI
         XK6GkSXyxzjWsfGeuT1GwgnyHglK2XpZU5H1miUIBRkIm3Lr9paewgI5Ks3PkyRj00+O
         DlVGU68lJGWWew3HERyQvPsTrs9HZ87v8P4Q4Z6UcSaUw8dEL8S4YM7muKJtx2xaG/3c
         EkRvytJNZyNaTKp1L5g4L53fneiEeR5oHxA2a89M2fMqMdd/J0He9SJ/v4+mPnc7iyTW
         7TZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787999451; x=1788604251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bHwXFE2owPIokZUYt8pax3s17uo9rI+W8f4UCCZ76K8=;
        b=rlBpDbV8C30Y8z6ec4eud+PBfjNUoLfpG6lqUDnZJVb9Kmjb1e7sXbz6GIzEDIJ8WO
         /dbHpFhX4yFYkYsKaVMk6vG+GH1PUwHHj/zxXbZgHxUP/AvxCpQWh94QVyub7ZbC5dNG
         1PiKuEyoK6C1fhtq6neAsM/hNTt9Pvdo2T0FRBdLzDcuS44F6rzaByphkWvf3Okw9bpu
         sIyp0VF7jpGQ8/DZRalXf/F1k50zrEel9t/Qdup8MyxTqIRFiysbGF0Yfn/yJhgbueOW
         otGA8q/I/S9LaKQok1AtgcNu3u9LYdahmX4hA5LtBlf2HZyfM+1qSSsWBPfYSXKjtJZV
         guag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787999451; x=1788604251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHwXFE2owPIokZUYt8pax3s17uo9rI+W8f4UCCZ76K8=;
        b=CF0GgnUXmp6ne+10y5wykAJCQl0Mg8me9Bpk9XJlb0JaKTBFnguf5QZkZ0U5urIQCY
         3miry0xnUD71j0ZoY6EYWqYBRyaYGIP7vVJ1t/iYuXHOmSU/+aKauYRUPksChQvjKuHD
         d6PtJqKGW1lFYA5XN5/QxdH7vx9wykA0L8X8Ug/wjcslRondFLvSCaVXYZbbY5fk61Jp
         Pi3oGYs2jP7ovGk9aOp9l1mtgarrYWKgjn7rM8qEm5BANirHAaZABV9BTNF1UIg4g4Bf
         W/CN7l+M6AiMZpPoEdEIyUE4bgI51n+lpuY85fWtjP86NSwQ2BkxYTc6TSA2pbOBnlVL
         A+LA==
X-Gm-Message-State: AFuF++mN0WSNF5XGJgZTU4DX0gD9yHucwh3xtxNrGoGwpQNnkz2okkiO
	Trlj2SfHZEQlZpVY9SMBk/DzOGDr05G+CRkpx7qsBDTTk/aZdl5YhhcyXhzsC0F1wTudJYIxm5w
	fx0XOeWPX5xbNtRTwwtmqMyOgJMUJsavvKzd4XZ99
X-Gm-Gg: AYBFou01FwJVX5oIqFO9ds6Q+NYeUZK0nO8L4UytFmn9/0brvVkoRWwClBl/Hr/whzA
	w2RdQPxBCvD4do0T7htELOMVjrJWLOFAPTHPoVMaWQuXFkQHq+E62qep6XjcmjpigsIxx/GxFaq
	R5cv1jxDz+PKmxuuc62RVO9Bn1TXLaR2HPYso8GTIJyb9NRFXkzvmtff/55gLSDne4o3xH8ozf3
	6Ht9OOTQ48M0nz/bQSYmuGeMEENpnjem+7mZ4vNuZiu/G9ZGNxiaF4XZvwluICRNj1ViY3tqG1j
	s41ecJpub9mKu4Y/NVYejdr6c01XBCW5GXQGXcXa3qa1IpeH4JOC/LQczrqTKTb6qR2Ns7wyKuI
	=
X-Received: by 2002:a05:6000:4a05:b0:47f:9254:d453 with SMTP id
 ffacd0b85a97d-482f7984ce6mr21167573f8f.8.1787999450501; Sat, 29 Aug 2026
 03:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825161712.41471-1-scadastrangelove@gmail.com>
 <ao_iJG-f8707OjL9@google.com> <CAJ+7+cCnWHC+4n=89ndWH2zK=oYnVabH_cw53TfzmWn+cRgHwA@mail.gmail.com>
In-Reply-To: <CAJ+7+cCnWHC+4n=89ndWH2zK=oYnVabH_cw53TfzmWn+cRgHwA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 29 Aug 2026 12:30:38 +0200
X-Gm-Features: AcwNN1VhUTMCv36uW_Ev2-RowW7-4E2XLmbl3wSzWt7MIAgjYB0CjDkZLIIwD1U
Message-ID: <CAH5fLghenCy7b4Vs8gNd6qtVMWw+cF4nrCtKRka0cZzyHYDEhg@mail.gmail.com>
Subject: Re: rust_binder: use KVVec for files_to_translate
To: SCADA StrangeLove <scadastrangelove@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:06=E2=80=AFAM SCADA StrangeLove
<scadastrangelove@gmail.com> wrote:
>
> Thanks for the review!
>
> > One it looks like you're missing [PATCH] in the email title.
> > Also, as checkpatch points out, Suggested-by must be an email
> > address.
>
> Both fixed in v2 (sending shortly).
>
> > Also, should the close_on_free vector also be a KVVec?
>
> No -- close_on_free is 4 bytes/entry, matching the wire format, so its
> worst case is ~1,048,554 entries (~4 MiB, exactly SZ_4M - 88 bytes).
> That fits under KMALLOC_MAX_SIZE on every config rust_binder ships on
> today, but only because SZ_4M and KMALLOC_MAX_SIZE happen to coincide,
> not because anything enforces it -- if either constant changes, this
> stops being true. files_to_translate and reservations don't have that
> margin at all: they blow past 4 MiB at far lower fd counts because
> their per-entry kernel size is larger than the wire size, which is why
> those two need the fix regardless.

Sounds pretty fragile to me. Would be simpler to just use KVVec anyway
in case we add a target where KMALLOC_MAX_SIZE is smaller.

Alice
