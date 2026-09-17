Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F26835F16B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608744; cv=pass; b=fKcJiM80mte5XnekialturooBIVhA96K7oz5n4sacgnUAqq50k4PZRTpcM6M4hujGeXzO/JKhUPzs9397bpX9ziRU2fJWErxNJhPoAv0QPEyDwFLDMAE63o5M/S71Zukg453PunWqVypFuyl+Q4Eu/3K3it79dQxH5ht22sSafg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608744; c=relaxed/simple;
	bh=A+lyblawb+dgZi1Z+Fh12EBBr9ZxtiKYKrx5lLTeJY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZ5zZhjousBQk+UkjR4PiDc3USKYJuQw8JQMia92RbdUu5dQ53v5WWNv6la19n7sUiyDNkBFPpKZM/lnQWd3OEQ4vlejtbxm9ECUARf/vjaP1Gc/BLUd9iD8WxWYB0EmkjFL+3Y5ibzky8epQhtxV4/uGdrYL1YiK8CONxj5ZhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0reQ/xI; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0reQ/xI"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c7so18768385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:32:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789608741; cv=none;
        d=google.com; s=arc-20260327;
        b=GEDKXRkVvYm4NBJ1e6fGbFngx6DQLQaS6GGqTIX5lQ76GE/GKoEGF+TxKZReh1m6DB
         aVh1yTEaERkVHCT+J6uJeatGnLOsQPJpD8DjcJAGwpnxmY2V2ZulaXUm3x8w2IZSC0zq
         vIYbIQ/1pF4DefXPpNLFWHjiH7J4CYPx5pkl0299ljAYyvFSR1tKwrDOW84tYjNRlRcT
         2t2j7e7JNsbnzS0bLWkYVRY99A1PUirSiTkuWNAG78KEXNDtQMOhNg3p8LRvS+79V01x
         x/X+nfnE/J5/AyaAgyYxjkBi7AulSHaZt3datPvmHm4Mp7wa8loECP5N0sdZ/N2DWUpo
         Fzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        fh=di1BSuQOlGaYnHqpGysdF5H5yowUKX80FiU4Sz15OqI=;
        b=EyYFOjJIPKGxP5CRK1abuLWornOdxa5SuxUO4rlPPbeWuXlblHOp/0SowBT+Cr/7hf
         RF8yeCoBmeBAwE5lFiuh0Rg04R7ayeHFgBf/eHqjAvjb3fYU8y0wNFPz8ApBYR69taar
         NujPjyD+EYKEt3oRk0/desnSNGy4YDneyPCQdk/jGLJyz2GfT5BeQJLVq1xBGNrUQeqT
         AVwRu69sqp6myEOds/r0LzWo9UYbMCfyoWdcwgwLUS1ICEhVzKIAr4ZatKge/Hfxa14O
         fJ09YCTbmiWW+kwtM8hHo/Gl2nFq91+hpYzKv5bwdYTrCmdJHetUH9MZeClKm6P0WfNf
         ykYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608741; x=1790213541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        b=F0reQ/xItJ0VwokY3OtU4QLiubH1w2NzLbVOUcIFza0DztIZBwX5Ipa2CP5jFq60lI
         8L3gaEirKnzXT7NH1gMhsEv7yo+GB34NyhH7LkisZ6QjaxRsKzBl3rpCdLvLQ3+812rP
         /WMsfQdG2AyAQjkLcKcyfvusBhE2DVmO7DtVmiNdjvAkt1e8StYSgMzK6oOtVysYCaIt
         CpSIOW0yw9Bb6gbXF3l77t9zVubEMrr9sadXgUqzXBEP+lM7G7AT7WP46zrHwPNzaVmZ
         plbL7uPu0u+HMprcbH6yhlhrIG1DOwDhj7d5gsMehHLkZDhtklB0FvxLb/SfCwbrbi03
         PLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608741; x=1790213541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQRUPW6YJQIkC46/KpIizzCCGCnEQ9KqApfgS7uijf8=;
        b=xgd8bStQCO1NCrSdKHU5Mj8t5yk3jlqqLERCVRGlHfgRq1hr5VabFSjXtOqYzDC1z5
         AulzNCKGBaiwu7aF0gpOwx7aVjfcmiU+1zIi6ufLo4FSQH/dwYYn8jjZUUjnieyOz4mx
         kt0MJdDkcooRERffiwDeonNUifxUpWETfNV0gg0c5fUYwgOh43av6SoLkksm7z7ajaGo
         EGfsPnUJj2qwpvRV83iT3lyvtZZEzavWMibNlX6PC3gK7HDviUlkYR+1MJwFZu4VQ5Oq
         jXHlRsZaiVxVaqNVSzuwIGdwIlaHOeu947cyuDgDprTF7kSniBXG5eNwl1NhIg6/mI54
         E4/A==
X-Forwarded-Encrypted: i=1; AKwUvBxi6X02mHmkXsZDsNxVnVkltfEDd01tlq3wH+gbm9JrJj0LsqlhFDPheIxprPb0jI0XR/U92KZ/nPuzbS8=@vger.kernel.org
X-Gm-Message-State: AFuF++mqYvC64inS6Pw1qopJC8BwmG7Jd5wRbx9Y0Vm9NKR0kj/JG32O
	UvtRFBrBzHcziyii0vdxPT2PDHH5AB8fqJ7bUOtzE0Xx64x0c8JLNIWjph9AlVUGxhQTWS4dEzI
	ynpojQNnWkwgKto9zmyxAV+4/URJBYfFyYA==
X-Gm-Gg: AYBFou1Z81t0Tg+ieggdE5tg6PLWCRUxb9nRjdP1KLDnkvbQpMVj5ga6+s3ogOju8lf
	L+ugIf49kcMgGSCrTFqXJfU37Xciv8CTQgqs7GWOtt8YPIApz5cloesGhaPwWz58qRO+gMwTOsl
	6AShRt0jtZAhlUXP2Qnb9XPl+p1sQBgPNPJExr2HqTnpug6TjkxeaMjBz4rPThJz6xdG55vidIw
	RvBBYT6Fw3bd1WXzto3oYBznhD0YNUlXHPn3ydIeTp8rUzq23gln2kqSelx9H6u8GZvN9OdlaYj
	3d6tyA6B+8k0Kw3WBTlZ5BI1BMeVhSVg08b0jBcy8Qq6+an432ZssNts/fZ90wtf1NkyhxHwri5
	ZalXE8HoISo9/5IX4tLMDvdNzZE4BJpAqQnE7pHD47UrU7bnmPlvqPO1G5MMz1EsnzBR1yEwjP8
	tSC6VGwlu4
X-Received: by 2002:a05:620a:2b49:b0:939:10dd:9c01 with SMTP id
 af79cd13be357-93bb78ecc33mr880261085a.38.1789608740708; Wed, 16 Sep 2026
 18:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916200215.21774-1-brads@mainlining.org> <20260916200215.21774-6-brads@mainlining.org>
In-Reply-To: <20260916200215.21774-6-brads@mainlining.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 16 Sep 2026 18:32:08 -0700
X-Gm-Features: AcwNN1WCG_JOJrf2Xbrmh8jFY2fRzqOy5q6E4Cc5_T2BPoTD4KB-hY5Oy_mqGNs
Message-ID: <CAMo8BfLSWyDpxZuePsOdwRks9CuwXiUQBOR5ioSx4GHf_NeZAQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] xtensa: Emulate two-byte cmpxchg
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	"Paul E . McKenney" <paulmck@kernel.org>, David Laight <david.laight.linux@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-snps-arc@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:02=E2=80=AFPM Bradley Morgan <brads@mainlining.or=
g> wrote:
>
> Xtensa has no two-byte atomic compare and swap, so the __cmpxchg()
> switch lets case 2 fall through to __cmpxchg_called_with_bad_pointer(),
> which is declared but never defined, so a two-byte cmpxchg() fails at
> link time. Route case 2 through the new cmpxchg_emu_u16(), which takes
> natural u16 arguments, so the unsigned long old and new narrow at the
> function boundary.
>
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  arch/xtensa/include/asm/cmpxchg.h | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
