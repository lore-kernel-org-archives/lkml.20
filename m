Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2F154CF72
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885480; cv=pass; b=sWJNNERU4/ztaqaW0Vjv+6ZDyobNU5fv66ro7jtNyoRQfusvJukxOQPx3uT9xSe6hJPq9tJnyL5mM3il8P4x0bZ3EgAn6zHdRKzi//HkXvc08eVdxWv8jeW/x87RNIVWAkXxgDWXddH8oyXdQYIG5wSg7b/eAsC4agZUZccws+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885480; c=relaxed/simple;
	bh=tqk8614BLoIOeOT9CI/IALiduSN9nR6x4DKz4FZIZZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YvD5swB7V89LH8/5fW/9/EZx5tiR3Axq0f9kvO22/3j1wQVqH6FUW5mcINGIu4BsS/fhq3g+GizsdG2g/702cKhviCGu2mvAGQVBJNfvnzhHAo1oewpw9vDwDETxj/cD6fomwF6K9IvhKeL05DXW221PBkEDe1KQPRtgvpD3Cwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJqUuuhS; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJqUuuhS"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-85377c8bc96so4378671b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788885478; cv=none;
        d=google.com; s=arc-20260327;
        b=atgEe3Giofww6E2JtiAXXMbRAdNFkmG+KJrQhsA6d/CThP+dwpgU4nlaiyk+YeuQ9D
         90UODp4mh3SyStdjtcgbDWUcGpRipF5VHURzUDscaMfssVdpiDDNIxikaqv4JBtHtbO4
         D66h7Ij3qL93SfoRbhHQk+wKsfVH+tf1mdpB4UE8/RDgApyq9FGzTniSdIQ0MrSsFya9
         rG5spUPol2ewYE/6KfBABTIGbZBOf3AR6doMTqLkoTl3LeRhWAZKYEBsGFFc3Bs9tAjN
         Tbf5bjPhrn1z8vdbMEYzAkyilPVUIRMnZh7dNWAENuiqlZcPNsVb5x6ngDt6YAjMlB3l
         fYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tqk8614BLoIOeOT9CI/IALiduSN9nR6x4DKz4FZIZZk=;
        fh=4XUTNE3i103TO8vaGcddOX9gzVd5tf12amApxdH56/g=;
        b=Hk/zyX7vGXNvTpgTFme9Ht2TTQPDS3m5BgHEyuYMX74hNAOryt5R7ywci7lM/fjbIf
         qKoUhIDBeKbjALWdoBEmdIyl9vfuNOK2p1Y4SOdQz3U2PrE5MT59GIn8epHzbNVHdKIo
         JnpDW8DybBLffNV5kQnPrg1UGrDUbmwz0TLiG3bl+VnZcsdKbAoejKtC1ydad/pNMMJx
         4gIKt/ldhYEEbvaCgnSc+dAC5o3yuXOnJb9v+8ICixu4Y9YBBImdqIxoKn6arserYnMZ
         YHcXaZyBKE+s1YYeLeY1ldeY/xKFS/Hi3JQ+guNU+bUoq4cIdjVL2SGAnQulXuiNV8Kv
         TBzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885478; x=1789490278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tqk8614BLoIOeOT9CI/IALiduSN9nR6x4DKz4FZIZZk=;
        b=CJqUuuhSe76t68OtOXGv5goTikIfTNl1Mw48Ka8y9ie9nJJ2EK45rLEFq5/X4MvcHY
         lKijqmDVUEFDyl6lsTkuXLlSQc/TZhsGN8i+kAwFcxHiFD1UD1ey95fqBzUsuPQjPqFO
         euG9egNueEo99u9219IQFZg0HsbuE41NxGDaPxt98ApSO/q1F2yIWTlmwmsTIl6Gudl4
         amoZAXeD8X2vBV3TM4QoIhHtUP8zQkqmDWsU5juy/xnNBOnMoRSEjDj5P8mcJR92PMN2
         tCJF6RU8ZUB34UBeQkmsPYNb0w1xue+W5jrtHy/9CNmziSN5T+TNdNMTaBBSMUOMaU9n
         fS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885478; x=1789490278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tqk8614BLoIOeOT9CI/IALiduSN9nR6x4DKz4FZIZZk=;
        b=g6IlWMH6bOFyXz6g6tCNNL2oEeF/FYOguf4eyWhIZRb2+OXFsiW9CxDrLs3Dlx9Ijf
         +e55Pjk3w45Unle1Ie/6eTI7RJEa5XiiuJkHPg/iCSntobFItOjTSXs/u7VyLdLjl4zv
         CoGeN7BtcVaDm2sY0fqM9oVlqfb2Wed+e2GxLApy7wiqgGi0MasykD4ws9bGz/I6g2DB
         ZM7FiJ408cfa/nCIlLWPBN4UfJfCmZV2pFRYHIeX70FLAaNsAw/H6Tz5g5AvU7aQAbJK
         UWR8a6uBGZBsKuezjNL9DI5vvv1u4qx6rsMMAOpum7At31qKzZOdQhkkUwjmXvEsF0w7
         pQbw==
X-Forwarded-Encrypted: i=1; AKwUvBz1M8RWGcv1Yws//KSIc4h18RBDZ7wD6Wkp1a7D82bJT50yR3VxBS9ILn1dLhTS+M02Qp7Qux75SZqHdDo=@vger.kernel.org
X-Gm-Message-State: AFuF++li5sHO4lLma/zG8OyrySHDFn7IbUHETYiVOJyGGZEnBymjmneK
	6nHoHG+GTMKaWnRGGkeKG/I9jyW8R3sYuOnDEc5yN/9YSjRIHIUCz5euDDzeiRNjzArHjexrxDH
	zROAEc0IFa7iIHenB9Z4j0FbOPRALAes=
X-Gm-Gg: AYBFou07EZ0MTF2d+r2re2gWAGJUX+kUpr9j9H3tX96Mdf2gqujBhGoGEaELMvKQjSb
	DmLjj5RzUhZfbtikchN5za4JowFd3T30XPeMVUt4ksVimxE27qJfs/Pf3V6rhzRlxt9DOQH1Atm
	bG14Rl8gGMKXHQz3IEv7mgiNsTgtEXFvBbLDDc93tQm2lVVyXoRI3NjDsSL4NcM1/5fgbHRIBTb
	awyqf/vcE9S7fmJYkfLO9b2+t27363RaRbwgvnquM2SLv+elbQ/IFwAhsm4YPEsGcZIrg+THV9A
	Bp/qJqNakTDRvzPHdERGPqO5ViX7wEN6D34i5zQ2JCAXjQ6Smu2+99+ecx5VDUCUFVl837yWqnh
	1CTM7cjwldXyJRLQDQbOTx2FfSB9z
X-Received: by 2002:a05:6a00:3007:b0:846:4d4c:23f8 with SMTP id
 d2e1a72fcca58-861662d4c34mr43970654b3a.1.1788885477863; Tue, 08 Sep 2026
 09:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-b4-x86-cfi-fineibt-func-hash-v1-1-6ffc0af5c4ec@gmail.com>
 <CADAM+B2jgDiyShSSXYoUG36C7yVpjx2NrhP6tOHeDjB0h+GvTA@mail.gmail.com>
In-Reply-To: <CADAM+B2jgDiyShSSXYoUG36C7yVpjx2NrhP6tOHeDjB0h+GvTA@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 8 Sep 2026 09:37:46 -0700
X-Gm-Features: AcwNN1U713emDEBEY77DqpIK_oX7R7ikV6MmHQT0CKKTJmS_FXiyFemFfwHRuRQ
Message-ID: <CAADnVQLu-XiLxz_k02YK9xCgM8guoszby3O_m00_vdq5X8-w5A@mail.gmail.com>
Subject: Re: [PATCH] x86/cfi: Fix FineIBT hash offset in cfi_get_func_hash()
To: Soheil Hassas Yeganeh <soheil.kdev@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 6:22=E2=80=AFAM Soheil Hassas Yeganeh
<soheil.kdev@gmail.com> wrote:
>
> On Mon, Aug 31, 2026 at 10:49=E2=80=AFAM Soheil Hassas Yeganeh
> <soheil.kdev@gmail.com> wrote:
> >
> > The switch of the FineIBT preamble from "subl $hash, %r10d" to the
> > shorter "subl $hash, %eax" moved the hash immediate from offset 7 to
> > offset 5 of the preamble. fineibt_preamble_hash was updated to match,
> > but the open-coded offset in cfi_get_func_hash() was missed and it
> > still reads the hash at offset 7.
> >
> > cfi_get_func_hash() is used by the BPF JIT to give a struct_ops
> > trampoline the CFI hash of the stub function it stands in for. With
> > FineIBT the trampoline now gets the upper half of the real hash
> > followed by the first two bytes of the next instruction, so the first
> > indirect call from the kernel into a struct_ops program,
> > tcp_init_congestion_control() calling ->init() of a BPF congestion
> > control for example, fails the FineIBT check and the kernel dies with
> > a CFI failure.
> >
> > Move the FineIBT preamble template and its offset defines above
> > cfi_get_func_hash() and use fineibt_preamble_hash there, so every
> > reader of the preamble shares one definition of its layout. The
> > CFI_FINEIBT arm is only built with CONFIG_FINEIBT, the only
> > configuration in which cfi_mode can take that value.
> > cfi_get_func_arity() does not need the same treatment: the __bhi_args
> > call whose displacement it reads still ends at the function address.
> >
> > Fixes: 85a2d4a890dc ("x86,ibt: Use UDB instead of 0xEA")
>
> Gentle ping on this one. To recap: since 85a2d4a890dc the FineIBT preambl=
e
> stores the hash at +5, but cfi_get_func_hash() still reads it at +7, so B=
PF
> struct_ops trampolines are emitted with a wrong hash and the first indire=
ct call
> through them (e.g. a bpf tcp_congestion_ops .cong_control) hits a FineIBT=
 #CP.
>
> We have large scale panics when we use BPF congestion control.
> Happy to respin if a different shape is preferred (e.g. moving the
> offset next to
> the preamble definition), but this seemed like the best way to fix the is=
sue.

Looks fine to me. I guess it will go via tip tree?
