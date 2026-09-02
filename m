Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F354746A5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788348387; cv=pass; b=TlBdLipua7CalZOQFbr2ZbQnV4Aek24yg/xZrmCeMoT6zyAoj1bQPxANA4uSt83MiZz1rVKUIiUwrixHYLsbjll4oU8KbDNG7hJP6PFh3Bet320Om9RsvLi5jV79mcBj2jSMsvecpdq52nA2h7mnF8seK6B8J327vrh6D5Wn86w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788348387; c=relaxed/simple;
	bh=FyDbbZPYKYMWaFjRS+uVtqLuXGG9Q0hCZIMV3hMspcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJCj2z8Ur6VzRvUopNorpTUVeCOxDzc0XmR604dzFucJgppnPue1eUHoHjile82THgiUl8beddFJ7g7rLI4vMlj2FjQl32fdU2FbgsIVW7K+TlvN1uYPF0dFnxCCPlLHdY6SJxlxEVPDzsLovzaLQQlWAptovGuFOAkcejSdohI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oat9md8c; arc=pass smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oat9md8c"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso539012a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788348385; cv=none;
        d=google.com; s=arc-20260327;
        b=nR6izJV8q36GIEC5hkDZU2LQComzJNZu8TmjhrcHzMuFnafm6LwZ7NBupmH9fDx4iK
         Z1x8XT/VhKebM9f0TLpEhf0W0RFQlVZj659rqVAgZCP5dtbCK5PGxfaNU7Q7x7AxFOs3
         7UQJwyFGoAXzuI3JemcQf5l1s/Ya3eJS8DoaX0OuG+LeE5UJw2I5OlTJhQRO3Ycr22fC
         WZXEKlY9uD6qNBrDEqCYi1+1p0wjrD5OIuCs9C6c5XKVWKY7yOwZujWc9+V+hzuzp48L
         6KPr16v6S+9eYK8SCoXeiDX7NtABERXEYTOFluhB3xmg0JnBQclwywWyfVxOOkwWX64F
         BKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wcmJkyCZLmx9JarKkkbqP9BwAVB6mlEmU2z7IeOq2cU=;
        fh=BkJqmSiO+WSxKuY3+sIb2i+jXmuq3pBHPVndx083wPc=;
        b=qrIowi8YeEkDu/HCxFRkjlEYYZBTAv/gc6dBf1XD7M+SMe/h26rbwJOgHKQw7JN2EC
         H5mrz4PqZU+6AFLPv2gOYZK7ZLAzDPLT/pwpXP4OeHXvDcSBMAs8uTuSeqgNG4JU//Fi
         FLpVtJv+z7qbsUpbuumwUGaYzyuRrsUg2c3m55Ss1I8gRGjBHI8B32HfMgcbjZpPdlDc
         Q7puFdYr0sfvQpZh24TYdpcKpPghMHuXYvN6gT5GVUsWPLJ75Sn+k4KIzPUKdImDxVaF
         LuCjx19IJXBIXzRwRzHDnlNkflLuu4GupDrrp/s4T7UxNBxskF0yWl5Fq+4yCXXKKJ8e
         /3mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348385; x=1788953185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wcmJkyCZLmx9JarKkkbqP9BwAVB6mlEmU2z7IeOq2cU=;
        b=oat9md8cLHgMKacdTbsFMfULsSoFZ0Wa33mafEkAUUwUyV11mHicsJ4tBTXkYNIxa7
         N6ZFqx6BYmGETOEATtBFlL3YDHe1ANJy+jREDXZIcHOwJEGmKwtchqrHzoB3NYO3WRAm
         5TRMqejHd6AGihJ5b4xLSf1krLPv1Ix15QikmFMOlqyyddUc721QL7DpxL4yYnUdRCpJ
         u+r9uQuQ+nqrjfl7fKp3H8kNMyl/GsrXQsAP0WuaAs154WCLKW9DngnxrxF7Bv56rOsQ
         GkWS1VpEgHbGgpXdN487gDjtsjPqeHA/CXgAj+BoYMvMd8y3/cNnLHDuW5xbILfSNNj0
         /Q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348385; x=1788953185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wcmJkyCZLmx9JarKkkbqP9BwAVB6mlEmU2z7IeOq2cU=;
        b=SwBOnK4vc27K6R+kJQPPFUyltyo+t1cHaRMp3fyGL/obYdEsKgeo2jprlc7t419x8+
         MCddD+2d/6Jdsj3FSLZ3yCpnkETms0gyUHNvdhJcN5ZiE0Une1GX2aR2g+t45EuepO77
         3XYuMwA0ajn5O63+rn2Qi+i7obPlcWQwkBm5gzkmsdHTjuD9/VCaNLKUFKB5s7CNb2si
         v1boXEG1wY7YJt/6jlgcAvUl5VZcITZ5O5Yay/us+gVSyT2EAuYYqqWG7sZ0pLzhPDtf
         mPVSHEm6lq+JoUezf7o5bkcxUGavIdHJGfEQQG9zs4iewjRB+ARmFv7beN4Dko35wXPv
         lc0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqe+912rt2EEn8LxywWJgAbvWpYR6OsDHyFfG0pI2KEdlX+ZjK4bP9Qdj9hchdRI/kIjFqM6xX+MRYyol8=@vger.kernel.org
X-Gm-Message-State: AFuF++kxMLfHZyyVlXLyC8crH5eKuskwdtoDbjoXWb+e8+FipIWxyibi
	gZ/f7Moo8ro0mnR2407lq+0TPsIehphSPkR3gv1D4lzTCxytikP6YgOvQIvElXBDrlLgQr0PTkP
	84p9UhOaoL+8FxXhlcZ/9k8fDdO5CzzR3VGHq
X-Gm-Gg: AR+sD13FOn3IuM2t5En0zs1JP3UVQ7m6rvquxqET3rva0m2JXwBbeBt647tiVnoAy3y
	j92c+kqeb0dSDmBKLqKEIVDZc1eLG8W9h5KT1SexTXq1+HMQyl0Pi8lOfIAGShHSxLNr0weULW2
	b/sbj9yTLmQzNygbe+N+78Hgyglwqwp4f3O5FHYJPHarrPO8mtDuixOg7jS5gr8Cycun++gQniU
	cpmSJL8i5Dx+M0S1keVDtADrKA7NdVaamQWd3uFyXjm8YUl2hXNUoyDkYK/ixidz6RCW0uhYbnr
	9fUscGqmsD6RIpfrHpdXFDh4Aq3Jg5UURv1Pcr+XTLb2ddR9LtOjX8phC7S4b8/I7928nB2SDv/
	+8sZGUMfjEd3v214WN+oa0B9WbsPqrfhUghOtuUVptwxk
X-Received: by 2002:a05:6820:4c83:b0:6b1:be9f:ce6c with SMTP id
 006d021491bc7-6b47ecca88cmr3371164eaf.4.1788348384937; Wed, 02 Sep 2026
 04:26:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902064437.1376-1-yanlonglong@kylinos.cn>
In-Reply-To: <20260902064437.1376-1-yanlonglong@kylinos.cn>
From: Ming Lei <tom.leiming@gmail.com>
Date: Wed, 2 Sep 2026 06:26:12 -0500
X-Gm-Features: AcwNN1ULId5dgyvfzhvLeQbUKIYfl-Wufo2Tsfts7a1j3EvoRrStToG4vaJ75pk
Message-ID: <CACVXFVOYhYd14pvXAVni=tCnbaJ4AKbOh3y7L=0qWY9+e14=bg@mail.gmail.com>
Subject: Re: [PATCH] selftests/ublk: add NULL check after calloc()
To: longlong yan <yanlonglong@kylinos.cn>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:45=E2=80=AFAM longlong yan <yanlonglong@kylinos.cn=
> wrote:
>
> Three calloc() calls in the ublk selftests lack NULL return checks,
> leading to potential NULL pointer dereferences on allocation failure:
>
> 1. kublk.c ublk_ctrl_init(): the allocated `dev` is dereferenced
>    immediately via `info =3D &dev->dev_info` without checking for NULL.
>
> 2. batch.c alloc_batch_commit_buf(): the allocated `t->commit` is
>    dereferenced in the following for-loop without checking for NULL.
>
> 3. batch.c alloc_batch_fetch_buf(): the allocated `t->fetch` is
>    dereferenced in the following for-loop without checking for NULL.
>
> Add NULL checks after each calloc(), returning NULL or -ENOMEM consistent
> with existing error handling in the same functions.
>
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>

Looks fine, all needn't special failure handling:

Reviewed-by: Ming Lei <tom.leiming@gmail.com>



Thanks,
Ming
