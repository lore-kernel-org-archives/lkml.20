Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C5C399003
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792178584; cv=pass; b=a3S5KErC/pLJ9j6gTFq6D0WD0pnE2ghHCy/4Gi8mtg77NdgsoH7fx+DrDuuSKIGGT5O1PFzc/LgMP8dLiqWzhJJFHOQm3yOpQYxqoJFuWWwQgOHoGHGfet/DZGPz9pmZ0XYUHHF3W9OxFX7OfzZnQubUNBg2JJFJC993Aib6wsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792178584; c=relaxed/simple;
	bh=s8YYmvEx2Od01CadNFiHJHUoPJLwLJ90tmxSKKQBNYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=IotQ+/zmt97+ZXoSIRQU7HjYSmsYoeI8Y2ySGpjq4WN+gMnd/OgDxC8ern7XxXxq95sDavo0Gw4mDX21gkyaDy7//0chQJDI59YhwErBfd5fbQgqszFqFAJN1CcLooi9I+AEq15tGMyuhofmhfTdpw0BjP1uP7BrnX2tcrVl8Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsb/tZa6; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsb/tZa6"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so245217466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792178581; cv=none;
        d=google.com; s=arc-20260327;
        b=e8wCpCfNOW/D/cFH3Xs1Qm6KbNFyln33/Gf/2PPzqZ3SiGsnps791c6LfNGyQU4pS/
         itxfUarxaTZUYkCyop2PFrgPyiPWNMDO3golCZwnT4BCIiuPHCfc5FXP2hIgJOy1SL7X
         /g0iHdvnVEqo49w3N20tMGdzVCOdNUsNaVgg0pmLdiEqfbzuq6DkqMmVGx1losLwXE54
         nv84z/wYdGtL7kintwHlahizcQOK7CYZF1dtjt+FppP0VJ0gtgvDxxZNzR6lbygk7Apl
         f1hjUbHXUWL5SpbVIPXvGGSiIhVnKSwpxn1HJhmZ2J/UF2TvkViHsoB6WulrwNmai42s
         3rUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTry7xsjvZwTVpMbowQOfU9yrUwhNbDgMizubcJVDYY=;
        fh=T4Z24tC8QBIK+QAD3RaWuZxtmf5+LErL6iYAtTecBKM=;
        b=LoyMdt5lsMWKqBFgVkMfZa8r2HTyv4+lIJIymDrAVkoqdOkLdJee01DNMqpxegvveO
         Mw/jiiSXTE1SCYSyvUQuS1czm0hGZRt3sKPsr+zLoG+GoV+QOY1I7NTWWtBSnKB+zr5Q
         Tayq+QC1PSMg4y+8TEibPDt5WUfGq4uhGaxCdI/Th73zJka4WZegAHrLQeyNOG+EV0Z7
         sRA48YuJp1IHu2gTgkZ0fSO8OP084QyD/NFZiognKjzQ71vIxnGJPwns5EWvD2eLL8DZ
         iR75k4DFoNFDxmbdqecgmB5R1/duMhYqsHjfw3wFN58AFoCcD0pPvv173KwbCF95M/Ye
         JU/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792178581; x=1792783381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTry7xsjvZwTVpMbowQOfU9yrUwhNbDgMizubcJVDYY=;
        b=jsb/tZa6kglBy0bdUDxyuiBNUJ91D0w8Be9jmslGDQmpcW5sXahKZysQd4VX3zXftZ
         ov7v1z4+lqCW5RuccOjGTFzWwB1jcQt27ubLVAPqOXTaAjClCznJfX5mx9bhLTB6NqLD
         cPWznj8wv/1uWvOe8hWPPVHK+WNb3OMl/sEHPk7hpRJpr4w7bwqveXb8FrNqLNTWQuUr
         7ba+dT6v7qbwj+pnpH7kZzYja9pb2bsQym8Cfw6MKTYPyn+XyHl8ZKML/goy4XV28CMo
         CLDrZNvgXD+V0LzbTiPD4fo5xmm1e5Aqft2pq4ovft8TWktmQfkqTFl0NnbgKztCD6fT
         Iolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792178581; x=1792783381;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTry7xsjvZwTVpMbowQOfU9yrUwhNbDgMizubcJVDYY=;
        b=v8bYsxR7gD+/oR+40a1NObbDuyqLJNkcbsKO+24KFD3Gguttfwl4msPwqlRBtI7D9A
         S8lQj8XF87Ezs7ODQ8p0bEaxYyeHKj74utKksi9WzP8J4iSowD8THSVaV3HkkI7q92zn
         Ky49L8ThfpZQJqoRNtFI8XGm1GG2yImUgnWzWBARymP7CnqZLYfp6mamg5OCVRHRjLbk
         mQBCBhxeffDsjvUc2DLzcso1n5uZK00XzFzE6GeMCXny50RXEDqwMqktYVuQzfdLfc/n
         9CkVObPKSmQchEcBype15cKqxGS256LDm4MDTK1kZ5Qjqh2GKkxIPP3uz06pFWuwGPOp
         l5XA==
X-Forwarded-Encrypted: i=1; AKwUvBxgF02eUypvw/s7M4LRQrsCLyakyBP4bMJ8Eaxvo+mh5wRux20XtD51L4kmcl105/NQUVCFf2bcKPfMbE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrf2sMTVrPEeNLnaEEe2q1JpcZOj6NsnvWJOvW8ZRAj0JWheJZ
	JNgMlmNMxOVGG1r3dpZLGKaV0CpYRrPOif+gCJ0Sn9NyNP6QvfCChEnRLT3WlFch2ojLZPD7MYS
	oTsg2sRg6PT8+9gpHyby8GNd60rEL+DoRv5lh
X-Gm-Gg: AYBFou3m8VJ7pxX4qeHFF1XY3Cj9Cye7t8OnMcDVmmVe3fsJNuYDaIAEqS79szo+Soo
	WwxYEPCYBNwIBYhLkSyGt4vPKbtGmeE/OYUuap3MsHrqXV5RNlRb2WiDzsA1AH+DZpzTPRUEaRQ
	CDGc3srHHdH9ZsqtobYTEnDD7mmub2x/cQg3Ix5uwvF1w+ERO9ofUxqgPExYe4YhOHCFgJQO26q
	4eIrxNvHxspdQxfWg71m5IsmcbX+ikH1DpRkC7hs+yDw643FnbdW/ohmr+La7yEbHTAWGqHZdyY
	gadgzfmOGAIzJjKfeSvVITHMsAMPyRAZz736rhP2tOpF6P2trPoMae392E6Eqw89XKec+TFK+A6
	R/UXzQBNVww==
X-Received: by 2002:a17:907:72cf:b0:c2e:22f7:59c5 with SMTP id
 a640c23a62f3a-c40206fb12emr381976966b.7.1792178580644; Fri, 16 Oct 2026
 12:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
In-Reply-To: <CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 16 Oct 2026 21:22:48 +0200
X-Gm-Features: AclHuK_M7RSY9_iBEEPP5vYplr65tX4f40PPhVa3RcdPelewIr-u-RWzps2avNU
Message-ID: <CAGudoHExoEwb4o+SnfAA6qZg4qoQpS8LB7jkXf1FefyNCMPbrg@mail.gmail.com>
Subject: Re: RFB: unrolled inline memset and memcpy
To: kernel test robot <oliver.sang@intel.com>, kernel test robot <lkp@intel.com>, oe-lkp@lists.linux.dev, 
	yi1.lai@intel.com, linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

gcc 16 started doing the right thing in face of small inlined memset
and memcpy, which will alter performance once used.

can you guys update the compiler please to 16.1 or later?

thanks

On Mon, Mar 31, 2025 at 1:38=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> Can you guys please bench the following, at least on one CPU *with*
> FSRM and one without?
>
> there may be whitespace damage below, should be ez to apply by hand in
> an editor though:
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 0fc7e8fd1a2e..a6f3ef7a67cf 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -181,6 +181,9 @@ else
>          KBUILD_RUSTFLAGS +=3D -Cno-redzone=3Dy
>          KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dkernel
>
> +       KBUILD_CFLAGS +=3D
> -mmemcpy-strategy=3Dunrolled_loop:256:noalign,libcall:-1:noalign
> +       KBUILD_CFLAGS +=3D
> -mmemset-strategy=3Dunrolled_loop:256:noalign,libcall:-1:noalign
> +
>          percpu_seg :=3D gs
>  endif
>
> --
> Mateusz Guzik <mjguzik gmail.com>
