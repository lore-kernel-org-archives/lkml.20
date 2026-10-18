Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17953388878
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299919; cv=pass; b=m5h/kG3nP0ytCGuLHVw8ouWphkQnzPoDlCj7ufudzXP4WqSl5g+DkP21rB/OcNQaWTBqkeo7gzHhbx7uWWt10JssbKSo5XWcYf5UemFSJT1aAwcRmmHeot+aS97NxquDwxUQllE+ppm/WcxKA5TONESMIXyX188yZ9wIBt2jUCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299919; c=relaxed/simple;
	bh=YnhtSSB8nZRhBohNK+Ha3Mxq4te3x02LOrcyBX8A7pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DATjvF7sxa9DAiiCfZvSHGMnF6uoTB2m3eZOJJHsbqE3LQIUhYm/2Lfy7ExwniSX9Kv06RZyckm1RylI73Ae2rG76htqwHWcKgGgVJnpXmaOuOq8rx3jMUs9AI2HcaAEajiWHHqXAc4yToc25maQuyIyBxwLreSEDUPlYi0Umi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk; spf=pass smtp.mailfrom=pcc.me.uk; dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b=R5+Iwxfn; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pcc.me.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pcc-me-uk.20251104.gappssmtp.com header.i=@pcc-me-uk.20251104.gappssmtp.com header.b="R5+Iwxfn"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso3808709a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 22:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792299915; cv=none;
        d=google.com; s=arc-20260327;
        b=K53rWhzJUEsxzeC3YbMVZfLvjsJZwclQOSNo2UTn3k8oITNsgTBtduM8n22Z4mV4pZ
         jeTC8TEbo3vu+/SXY7ENHp6UPIvFG0rSFoKWPjgzI9eZTv7ldAsBpl6J/rchZKFyflLo
         dVJBABbzU+cOw6c1RcuwUgqslW7fY5xU+/toO9QBfhturXHZ/3zM87h6ziqe9gGlJgy0
         +8erXSC/Hr76VS/K3VRAxP8ydOIgd+MZ8qNmH6usk57YScwD/hxIsz+m3ijQ9rLU+cBK
         gWRrpiuU38CKBBnZgxNIpb9GSe7EIs9owCXarZmhwS3r4pTEWVD3NpfQ1buf1JgKnAyY
         YbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QxYDg45A1Xl222gPYyi8L6/LqFiJJVoHaNN/GFautYA=;
        fh=y2E6JGc5vsnB5Od9J1HQBozCrsjYdJYKmcujjpo9Hus=;
        b=I2aSByIqXuI8TYdPgEZiHX63F4Cl63mtQYf8eYmjcDTFnmayYmacK9MjMXm7pamyIv
         dE39GUzsdz72DTaqmfvvNvP6deT+UblOpcKu8p/Yay9j5u9qi4AXZItLNIrgvFsXq4XV
         78UR5xA1vvr6QVqlPu2ILCpEOxG0zTXbpKXNRhodmKXT8IJgFT7+hnMcenOgE4klLMIe
         tCAL7Y5L0SaKqGKFxEtFxMryIKjDeJ2gwV2sLoM33qCuHUy4+KWGYgH3pYRDfO4j4oXr
         RrNd5thMiOS+6hHv3jRp4WO4+MsIeUh5glCBQSb+QqiOLQeRtEqa9gNtQLRC1vuuxaoC
         C8zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcc-me-uk.20251104.gappssmtp.com; s=20251104; t=1792299915; x=1792904715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QxYDg45A1Xl222gPYyi8L6/LqFiJJVoHaNN/GFautYA=;
        b=R5+Iwxfnp7vYq0Kvwm03lGp3L2Im06oCLKrnDzy6xOBKM6GxB3EhubMifYXYXhaDHt
         s12Oj7zsHMzQwdFpHarWAogpVKc0vT2DMlfwQkXax7n7NcN2r/W82Kn6bY6d6Qysd7sC
         9Oncy6yQCddQR/FGo19AYSvr+b/g03h7zxYRq9bZIM4Efc4ugSDHIF4mIFWIHHaJh0P5
         NcE75FDsk2byXuusbkgbVryz/ls5zSFgiy6MJqBklB6JWsK/ykLp1RlZhhVB6X5WEZcE
         ZH/IPG1IY5rCNi2Wc1smh4cUnw/DV+rDT6fzHRvH48nPoPawyAZrxGyjA78JemOJZl4c
         y3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792299915; x=1792904715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxYDg45A1Xl222gPYyi8L6/LqFiJJVoHaNN/GFautYA=;
        b=xyS+zjBVcunaF+tEv61WeJyrhUj8TVzl+rrHKP4DWFeUBjG858G7KwvTcx7rx4qy8u
         eMtcpUr9fUae6Kpkh9xUpYbgI8OAohxiEE06KmwvuVCCOkbC2PiRHoigUJrnDUc36UzL
         NFi87npgi/gEX1Y4YZAj+aFIZw2D5So1O0KN060GdHT03/yEDaxY/QybFBRgxNiYFoOq
         JetIArJk/Y4klsgdNhchet9rhZ70QQcZsMnEe4XsASWh538c5DRe/eMdDLTBSO8bn2Tm
         KeEc5TuQJTtPw/v84Hf4z1qB2m++PReOLwv7jFKLExHYZLl0OJUrtYVbUEcTpsvtLKMJ
         QCXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwz8BTvsvI9S6bppgwSJO2bcMTtRliwN4pKkANcHBg8fzbn6876b1tdcQt4HNMYlnLxpsDbopnrzL76n2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGciSRQjL/qBGmbpieqX0XJtero13kXDexAiGK6hacVItsVVkx
	yQWEXGkymxqFThW3ZSUEz49g7HBs1jedWap0PBt4iD0LdyoVYRqC/D3opJScZ2uCK/POvmRN0Xo
	XtE1Q4zSYDTDN69Fi6jZJJdB64vpHG5SVBRqeygs9DA==
X-Gm-Gg: AYBFou042U22m3OkpzhjUO9tlUfiuzZhaLx2BX6GAxtn9Mj6gZU5ziGK3I0rQc385I0
	zvFV23iQEAdizq2rAAmdXaIdRUbdp8cbxd8V+tg8Sr3RZRYMmIKhLL1J2QfXpEw/gudb2gmJNyN
	Hu+XJIDpmnZ0ohrGAPjvFRlYRh+YgQFm+LOw41gbb3MjSfLb9CzAyZTY4FR6TlV11tB24zgiCI/
	ycqZnk1l0r480sa2McyMeLYT2Xl1cnqV6mKFqkRg1jGiTTQDXhw4IDEWfSeTPLWbUOaBX2I1Idk
	lQC+621oB1AehEyQGIczv5NPtbFueAe1+twHT9V52pkRAHgDLSAMhj4+z/URv8yz/CmjSFJJdDF
	ChdEtlgmQ6Ttx
X-Received: by 2002:a17:906:99c2:b0:c41:825d:ed8c with SMTP id
 a640c23a62f3a-c41825dfa20mr296694066b.26.1792299915074; Sat, 17 Oct 2026
 22:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-bug-string-strscpy-kasan-first-byte-v1-1-375a2c46d88f@gmail.com>
In-Reply-To: <20261018-bug-string-strscpy-kasan-first-byte-v1-1-375a2c46d88f@gmail.com>
From: Peter Collingbourne <peter@pcc.me.uk>
Date: Sat, 17 Oct 2026 22:05:03 -0700
X-Gm-Features: AclHuK-A8ldGKQ1YLtwqcTfHeRS7W4qDOo99_fThOBQNK4r230uqHy-5Gtj2lKQ
Message-ID: <CAPQLkRhXZwozmfhNd_PEx1ihwdH1_5qthP6PANYJ_m-v9vfQTw@mail.gmail.com>
Subject: Re: [PATCH] string: instrument the word loads in sized_strscpy()
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 9:53=E2=80=AFPM Qiliang Yuan <odys.yuan@gmail.com> =
wrote:
>
> sized_strscpy() copies a word at a time. The loads go through
> read_word_at_a_time(), which checks the first byte of each word with
> KASAN and KCSAN, or through load_unaligned_zeropad() on architectures
> with CONFIG_DCACHE_WORD_ACCESS.
>
> load_unaligned_zeropad() is inline assembly that the compiler does not
> instrument, and it has no such check. Since sized_strscpy() switched to
> it, generic and software tag-based KASAN no longer report strscpy()
> reading from a freed or out-of-bounds source on x86_64, arm64 and the
> other architectures that select CONFIG_DCACHE_WORD_ACCESS. On x86_64
> the kasan_strings KUnit case, which expects a report when the first
> source byte is out of bounds, fails as a result:
>
>   KASAN and string KUnit suites      failures
>   on x86_64, generic KASAN        before    after
>   CONFIG_FORTIFY_SOURCE=3Dn              1        0
>   CONFIG_FORTIFY_SOURCE=3Dy              1        0
>
> Check the first byte with instrument_read() before each
> load_unaligned_zeropad(), as read_word_at_a_time() does. Hardware
> tag-based KASAN does not use this check, so it does not bring back the
> tag check faults that load_unaligned_zeropad() avoids.
>
> Fixes: d94c12bd97d5 ("string: Add load_unaligned_zeropad() code path to s=
ized_strscpy()")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  lib/string.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/string.c b/lib/string.c
> index a3778d5aab4af..91de344956fee 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -19,6 +19,7 @@
>  #include <linux/bug.h>
>  #include <linux/ctype.h>
>  #include <linux/errno.h>
> +#include <linux/instrumented.h>
>  #include <linux/limits.h>
>  #include <linux/linkage.h>
>  #include <linux/minmax.h>
> @@ -132,6 +133,12 @@ ssize_t sized_strscpy(char *dest, const char *src, s=
ize_t count)
>                 unsigned long c, data;
>
>  #ifdef CONFIG_DCACHE_WORD_ACCESS
> +               /*
> +                * Unlike read_word_at_a_time(), load_unaligned_zeropad()=
 is
> +                * not instrumented. Check the first byte, which must be
> +                * readable, as read_word_at_a_time() does.
> +                */
> +               instrument_read(src + res, 1);
>                 c =3D load_unaligned_zeropad(src+res);

It looks like at least some of the other callers of
load_unaligned_zeropad() have the same problem. Would it be better to
add the instrument_read() call to load_unaligned_zeropad()?

Peter

>  #else
>                 c =3D read_word_at_a_time(src+res);
>
> ---
> base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
> change-id: 20261016-bug-string-strscpy-kasan-first-byte-335585ce203d
>
> Best regards,
> --
> Qiliang Yuan <odys.yuan@gmail.com>
>
