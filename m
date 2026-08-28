Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084DF286A4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787938549; cv=pass; b=QnLsRr5YPdNw1JqVZR5WHWDfkfO9Ykhb8Hj2azBNjPuLi40asrzlHD5cxqlhnyBEVqK5kGTGWBslT950f6KtSl2KeZT/BNUZltSwqrhMuw8uExH8Tvyv9KmuqcLg0TsR/cx2RWeKyVWvK/KaPVMkFJCFKUjua8pUJUF9N2euXIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787938549; c=relaxed/simple;
	bh=QIwfG51FYqLbuC6hjumlOSKKDDgtiZ/qEfd/e4ujq2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7rTu2KDJIMicX78CeOC/HxOeStZXxdumx3tGSl6rU8HYk1IrSc9RlpZEQhhs3CV46t6Hg40Y2Fd341cLlLAhE6kOknIA4b7u/Hwgt7kAUFjQOLGmu3nnKcr3Ufo6ElMwqpOlcqIVrgE1ZXvzsj1VoKuqtLtR4k+IZL9EwE2z+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJbBMiqf; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJbBMiqf"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso175018a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787938547; cv=none;
        d=google.com; s=arc-20260327;
        b=Qi12BoKnAYv8vSL3Fs+dMzGiLyC7Kd4bJKjc1x6B8uo4wig+cpphxWbXbnoA+NaX00
         g975NNlo6NRL+vVEVr1u+BqFObqkJtOmbxZfWvsY2/xMq19KfRwDgGUazBCm5ZogNDwo
         dSmZEwvpBCPVFS8xuv7BaC4BamfY2Cl6szSlJmhsOrDRVDk3+Xm9LNagIEy3F5Zlm93o
         t4QmilmMzLw/wt8mKBOF/v6TbeKrf9UNH1p7bMtzxGGWvr89QrJaJQUfa09Zegvnrwp0
         JLUhpoSPtxOC0t0XcM/OZlL9l2nQRCx7hL0f3kDP/J0wmQvjZlqRxyR/Fr5k6LlHeOTM
         H9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        fh=sF8CJsz3vX7ygvwVJVLTI5+DgLrFsl9vuybm4coR+fw=;
        b=Iys7ya7cBXGOSjYdO0rBHJQkzFOW1xS6i5IMFmVR44nhBRfCVF6ExJHsqA5gV8RRKj
         HWIlzKBD8zqIgYGkGx8alXwM2q+fF08PBb0tAIpTBMwCzfvU/7PgYLFOEjO8fu+WSO+z
         WoO+7gewIapQfkesZbcAUJ4eybP+ueomlsjegnYX+xyXoNau9tCc3hVurgkCNPlhtC/S
         wOxqz9xOpFrXhPaMPT1lK5D3xG32d8GfZyy84ouf8e+jHJAdzYTCIeyehfDbNdmhJL8I
         V1unRCeSeHv5d1hcA+bywS0RXzs05BwZTuf51HekBcfSr/fGBhqdj2OwFJfHwWC5hdeg
         gsjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787938547; x=1788543347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=cJbBMiqfnfAzijPJg52XSJhSdf6VBAoIXgQABBtFTXeL9RWB1Otgdfb53SbhWsdc/y
         8zL9XSz8jn+XcKsCDxmpUzB2J0s1aubLdWKgF79Ise6dKeevXJKQaWls37MweKlfuGmd
         gIlU7fZcHXoM+CQbeY/sRY5ah8e79mCRpUjoFtfe3kjiIhG6s0b30vPleJUSLoty/jrM
         YyDikunxgsG23Iuwt7jTR/k4cjWh11mCnPkcZ2Mkv1R0CdEyfXCaGdmzoQwAXK7UU5a6
         XLVxkQbLoc4IOfFq+rM0yupntWHQubwwPKJ9jFiNbQAPw6/AiwZpTzewPMaAxvFrg6GE
         HIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787938547; x=1788543347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwfxxVP2KSOMEoHgtysV+D41nPRKx7dyBiRUJMucGgE=;
        b=Q6nkdx+batP/JIK96boBt+iddbVoyDoFUohjdZvsXseb4RPgHhIb9A1AoOMmB2S/Kq
         /Nj266uS+sfg9KM4Mog8fPb7j9MW/weW7B9oXI5UWPlr/9tItxW9gcpsG+Qz4MZeQmm/
         sYUg1xxRJEGYl9lf7AQIwFshc7W/7czi5Up4ZNSJMSGjAyRrucKoc6WIRd08lS0NkVtb
         LgDYpqlBuPYRExn7AMvcm9TuiddYuGSQEBBkBYP4noDGkjS53zVg5We4qiwbk0YXDnis
         KnUcqJo9bVlLzr/mNFawG0cXCjOR3Ob7IGRdy/N2D9VAEWkoRzfb29k6tWM2+O5xxJ2j
         P4Hg==
X-Forwarded-Encrypted: i=1; AKwUvBxBi2SAIFnGuHudvfB8RbFsTPl3A+8eSCud9fpveAwYF+NKInYP5BeewVzhDquwKgZPfX4zEs9w6rx9YRU=@vger.kernel.org
X-Gm-Message-State: AFuF++nNzdgn6I6ZwC+Uzue4jHXSc02f1xoUmGOrhmTbeLbF854RSanx
	HW0xnaOZTNILvVCcLstj1/Xg/PKDfuKnoK5Bh1D4rBZvTTfz7eumPdlcvXAoJVzu5/yN8P2Tu4q
	B4RdTt81f5C3eECvrp5fq0sJt0MyL3CQ=
X-Gm-Gg: AYBFou0F8gvO9ZKNb5JURKd+2m0FNq/+or/EphQE+BQHKbLl67T3IwwyKSxT77gA3su
	FVWYWr6/c/YWjFw91nj4TOM8K+YxFDRkAT2Sozc0b1CJtldq571cdiN4raDumq4RvcY6suIuD2w
	39gL0jVJe8c4R7HFV2/XYGQn5wDJO9yQ905emdFATRgKNQhBwUXstJ2joONXSyFcucgWI/b8xjH
	LxDiXF4RzO/RAW2YVF1sJ/J2GtiRZ0vXr9oPfHCj2HMCro+iRYzIqsHMIVpkI11F5/JGJLmrZRI
	lk719b3X+tt6VyO+QqPoJoonA2YEoPE30duQekhH/PyZZfrEgpeDgDWGaAQD2qPgFaGm6eXrM7Y
	Hvs7YdmVCGohxx3pUWKThjtNnEw4QBMKcPysR695wkypnbDoFIFOT5/jhrU8qOboKIuvDuMw=
X-Received: by 2002:a17:90b:3c0e:b0:395:4df3:8800 with SMTP id
 98e67ed59e1d1-396d0c0ab29mr8371730a91.0.1787938547204; Fri, 28 Aug 2026
 10:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
In-Reply-To: <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 19:35:33 +0200
X-Gm-Features: AcwNN1WSwsVhEEVM3LRdqRtFMmDIpvaVESiQMW1HL_Bvm7itPlqfdlYEKO7mGmE
Message-ID: <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 7:25=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> It states Python 3.9 which was already older than the 3.10 minimum
> set when the container tool was merged.  Also my understanding is
> that it's not a hard requirement for all the kernel tools, only for
> building and producing a functioning kernel.  If I misunderstood this

I didn't check at the moment, but at least back when the "(optional)"
tag was removed, it was only required for certain configurations from
what I understand (I am not sure why the tag was removed).

In any case, it is nice if we could just say that it is required -- it
is quite useful to have around, especially due to its standard
library.

And regarding the minimum version, it would be nice to eventually have
a single minimum for all Python scripts, no? Debian oldstable is
already at 3.11, so I think we could perhaps bump the minimum already.
And Debian stable is 3.13, which from your list would be enough for
everything on your list, right? So we could perhaps set that as the
actual minimum for everything in the future.

Cheers,
Miguel
