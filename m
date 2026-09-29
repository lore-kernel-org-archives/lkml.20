Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8ED3F1041
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673140; cv=none; b=Gz1A+3OqRqTBUkgt0UfnAQAzg9/XWHTI1JhLTcJsJhIOfFf85AqrqwiTnv/QEvOnx+1Z9KVpTSjha2ZOjDO8VigKC6bdXb09kSkD7ZxF1WtNrIt+FMSvST9EIIYJJ64eXBuIH9U0yiqzENaWUeQxC/Q0x5i/PDz6MJkNYGx+pPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673140; c=relaxed/simple;
	bh=eD9jJiA9GPEMmX8bCB0JmdatEsivCM7gKPJYSSi9XLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxT0M+vm87mQUNHr/jpJ1scCHB+q0b3Fb85GUaFuXYlpE2iftLbo7TSrClXNSBzFno3W84Kdf2dplwJq775sYc0thLU+e1yS6XEMTnS4ooFLlzyMrEDqA/lCQql/roGs1v6MakB0bM3xLOnMrPmBIRkfONrZ4SK0ef7VPdef6QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-988bb9d0548so225080241.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673128; x=1791277928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOw0a9YdB1CwQ1gVObJylylvUx3VbrlfiDLWG9S39O0=;
        b=jyX5l/d5Bdb9WCafaN2tMFLIlfhv9pSjBcvN6SnyRq1QSmERYryuhJH6hm4JaSCvkI
         Bh7rssuuQLOgDt6Z+VIw/YSTeXyWkG1J7QdFu4hqOBIY4MgeCy7nakMbU51fp4RSYmSr
         j+u/8aOme7vuhZ0QynSlkd0R7VrwC11+2KfntGvOznIvXu7IhDMJPoGmvuBASt9c+Yg6
         wFXGvDVLXiLn6ZY3n4qlb0Y/1/374Rf6FpZmjvaC0LSPT0yP0p8sMWk92A0SEZpDfqYb
         H3MV8KnQ76SYvY54k+KjRz3A2WltuDOemKJ8EI8Odo+fddIV+olIIF9+kV8wKHUUJxdI
         pz8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMOpmmQt2yghZnYBlbfCE1e1VJXcnvSmuW3yHF53fjQoNf8MyyPs67m94quvwNYG3x/UA4l4tvmErPLRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqg/+zaj4Nud6GIsdjQRlH89cq+S4uIJd927I/QOhzfyubfCoP
	k2WBwmJ1jVbYtVNTu4Ozwecf7geAzBe835qNP1NXpobMGNSgt8pxMfKaWI+jhEDd
X-Gm-Gg: AYBFou229n6A+P3FKMCWs24dWFDtCruKBI9rnzxhyDdDGuWp9E2zxvsERgrKOiuXUbb
	XMYhnJr1SbZA8wkmsPACuOLKBdjZSCJn9lRShIeiddd8KXf3NjbFq6SJ5ofDQ2wPB6ut8dXgIxa
	FCGgMdzQgdlCoW8pq0rYMDT8rzZ972vk6whVnD+EGZCyrOhqbkg+aY3B9X5oPX53wmoRZv5MOet
	o1Pc+pfOhmbgqMLQ4e54jdvcTVNf5jYu0mssF7t0tCM0v2lCh1kK5SWamQ10TY1h/z0mivbSWOT
	EcMi6ofh3Ln3vhIX1J3VYesSWLEf6gSge12sqp/LPWsDbgKsSsQNfDyqn1U4fPbC80JzGdI/IrP
	oaguRaBakVXbua95hPhppMkKV7HoBkBcdbF2IiK7wdFzn8aONNAdEA8qQ1y3wPb+L6ttQn/StOD
	9+KU4PdCI2hhzWX9eU1s3tX7zh6dFeXK0Bbq87Cf/LZ4SWCjzKtGx14NloKcwFt3NFTtqRlqcYT
	scyfhcWs3ck0RiEjJnWPHn+z6/ssFEETBNH
X-Received: by 2002:a05:6102:4b0c:b0:7a7:7961:b14d with SMTP id ada2fe7eead31-7af1bb76c57mr5350302137.12.1790673128360;
        Tue, 29 Sep 2026 02:12:08 -0700 (PDT)
Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com. [74.125.227.39])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b257379sm12689418137.4.2026.09.29.02.12.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:12:08 -0700 (PDT)
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso1115061e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:12:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByuAZ2mC7mnQA5ncMo+3SUxvZ9f2V4pUdhXneyaMREl7l2JcuExgOPl45LfyaTIFrPgMk9W7sTTyNEVgFw=@vger.kernel.org
X-Received: by 2002:a05:6102:149d:b0:7b7:3acf:bd3a with SMTP id
 ada2fe7eead31-7b73acfe23dmr1486747137.4.1790673127529; Tue, 29 Sep 2026
 02:12:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924213256.122530-2-blum@kernel.org> <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
In-Reply-To: <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 11:11:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
X-Gm-Features: AclHuK-WMfBhqpiaX2MeBSdTA0pBWiNpHLGLXukEn385P1daLkcYPTJ9S7ydLfM
Message-ID: <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in compat_mode_detect()
To: Paul Walmsley <pjw@kernel.org>, Thorsten Blum <blum@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Zishun Yi <vulab@iscas.ac.cn>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul, Thorsten,

On Sat, 26 Sept 2026 at 01:48, Paul Walmsley <pjw@kernel.org> wrote:
> On Thu, 24 Sep 2026, Thorsten Blum wrote:
> > Replace hard-coded strings with the str_supported_unsupported() helper.
> > This unifies the output and helps the linker with deduplication, which
> > can result in a smaller binary.
> >
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
>
> Thanks, queued for v7.4.

Thanks for your patch, which is now commit a06776565b9e7351 ("riscv:
process: Use str_supported_unsupported() in compat_mode_detect()")
in riscv/for-next.

This fails to build:

    arch/riscv/kernel/process.c: In function =E2=80=98compat_mode_detect=E2=
=80=99:
    arch/riscv/kernel/process.c:138:17: error: implicit declaration of
function =E2=80=98str_supported_unsupported=E2=80=99
[-Werror=3Dimplicit-function-declaration]
      138 |                 str_supported_unsupported(compat_mode_supported=
));
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~

as it has a hard dependency on commit 5383cf280ef4f00b
("lib/string_choices: Add str_supported_unsupported()
helper"), which is only present in the for-next branch of
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
