Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408AA1A0BF1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789796698; cv=pass; b=S1uawPUFSIiWHrWsOrwEHj9O9coHW0JS9slaliLb/DwFSll7eu19iE+cODEESmJ2z8xZG1btJFepolhYMumLmjhnStWD+DsVakqfv1tup2C26x3Rz1p3W08NklFvGgyUuLsCFFb1hJ0IjUuPapIgC3wzwWdvGnc8wS/Tm2mG1mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789796698; c=relaxed/simple;
	bh=ic3wmoCCnpNHkoLUgFgDCvLUOEG/SacGXw7TtvYdhsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m22FS7P3Wsumj59fWfdWolnfKf8F2fYBgrVIdapVt+ZjiWHNSfk0cabi9hYENYFN7a7zwrjB3bTb5tyHvtusG8B2n0PuB7XvQUNberVPP/YsZsClYR74sxIkG2SlhrGOY1oh1jXv9Fc81CKKTHTcAgtbZZlFTFgSFsEmsnqE3VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrhRXREe; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrhRXREe"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85a4329731cso1165431b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789796696; cv=none;
        d=google.com; s=arc-20260327;
        b=q6L+KMRPsMxuJuiRWltl0zeGcabwuj5duizi86SEC8NvduL1HmD4xio/3jDGsMP+W2
         n/uX5azI5J8gCeGlfi+pqvWqr/kFSASSpF55xE5qgrZPryDSRKHMfy2cykiIaiYcflf5
         vc7zmiRzUZ0KzCx6vzOoE8729mHp4rcPbxfFw6jcGgjkFS4ZE24pei0V01+EGrmseHO6
         /EcUgAjjPOMwBZLjlYkwqdA/7s878qnzDign08vhaFoGrenJWyeDqmU+gm5kzfPu7dRW
         IhrKLcUM+6UDGNKcoEs4qusWPstsQwQtjmDLOJWdX24+aZYHz1/1yFe2Re1IvzXhvCzd
         TnxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTSICFICYYV90/lo5t2/z441tnwq8yhovKqA2AQy4hU=;
        fh=+ds4MOtK5XbTmfJIxKf0wAehtvnbatCbSjcdmvTngNk=;
        b=HZcljjGxJk/J9mKGa9SBcL1uTfMe7uazqNOXGD2yZQuGvKW4kO6j9O1Bwec1pw+eoQ
         8/QhSURIWrCh2P2/Y0hRyknOidE2jyng9agCs12J04WCYdZP25/2PabVz2cR3oBkkXpT
         qA7OMTbMnnBnuByrM/2g/g5We0zHTKCxQrDkLrWH5+6aXMl8NSTvuY5e4zYkCnfoeTbc
         kFHH3/CXIBFgvhEupckFdAQiqMhq5ATgNlkaOHcWw9bYNj5FUQGXTFj0CyfWZjRqQ0g6
         KdJGOu32ks27JEny4O0TaRn0D6TYNC2zMeRpOn1Ab6Aqm6DPQBVTRYrG2ZGnl719bg7I
         Guvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789796696; x=1790401496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTSICFICYYV90/lo5t2/z441tnwq8yhovKqA2AQy4hU=;
        b=YrhRXREeDT9dZCfWnWKh5Dr2aeDu3z5NfuZKHZxj1/pCr+wREYUR54A2gyFcXwecVZ
         hgVZR8liJiZWw6F0Vhz1IQ6xT6x6i/zRi/g8/4KdER5WqZlcaeBsHrC4Jfhv6kzlnJ5s
         CtFPF+1+1UCfAZRTyLOx4WryZgIdAnz6AgVa2aGbLxTefF0AiS0G4GrvYDrpl/Psxi8f
         31Y7PCAo1npA7zBd+s1VpfQDjxYbT5lBtVGQdkXLzzwK1hSLrtyeijtwZY6Y7pbRft0X
         yJl+/8WwfPGv08V5wZqp28hKgdjMJpRkiQJSeSdoKhGlzFfxVTX6SzK6D/4AFq+Z6M2/
         XMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789796696; x=1790401496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTSICFICYYV90/lo5t2/z441tnwq8yhovKqA2AQy4hU=;
        b=Pam3kBjKpBM+tT+qTWiWH3Bz/JrJp0dcm78dYed0esmpmyLfF1jduNQOIz7CvX/n9x
         X38aEUw5K/Hr83OMGJKiPJxq21YNE0aSm2YgdGi43C4QUvuT1o5GPi+IYcuy0geUmqwc
         mFkhGve/er9Y/jlEgyVNkphbgYstbfUE1i+4G2K7ZvtH93jB0yUfjc5g9MRhbQve78S4
         olL1rokx4P9q983Y9UUPkp2hd9mReRDFCs+8jwr8GRTSD/oV6qejuHmiH7d63TuOk3q/
         0YW0ZnK0HcUSxgEnb2YmmZoucq+/iJCJrTCt0qAnuZj0RjD+6KjpApRyS8NjsduNU2yI
         8bIA==
X-Forwarded-Encrypted: i=1; AKwUvBwsGjb5+VRqoMawaJxQKz8vWWe/RFOkZ3OY9ygwF9tr2tPrJ1+KWWEJ5qi06YATTzKgfjUM3+FbfQknLe8=@vger.kernel.org
X-Gm-Message-State: AFuF++maeM9Nxa4JkI26xEDn4S2pmCGKr4Y09yaFMpDg0CrADkthNE7e
	gUXFcg4ylnVMf/6EE6Ffj3ofq/BHk3JzX/VvuNfdvQOS/6HJnbYEcTO9KlsIl2KrfG7bN02SdPU
	XUmfvFAiNx9lsqvJmDipQ/nkVCb1dTls=
X-Gm-Gg: AYBFou0k/1kXAprtrlWNh4B1QqJ+4c06cRzC//hr48bxU3fl/8lp4E1rLg95WWh0cwm
	PRg4lpxNPqEIwD2O7Y+5PNw6l9UHDzQHLMZuj+DvTXFqz3NMi159fg9qyXDq91PmQoAP51YVB+i
	eVrvrbdeJ/xlWMJB98hMBLoRyO7yXRRKldBt1mlPmsEID0ojMyn6r12zjvO7KrjdRsrF4PXzAfp
	qfcLbmNa2f0/HnvAV5dTPQ5ohP8iicTRPDqSlit3mb7wKq4naIqXbHXT+DTPmut9VuPNWH2hOsb
	TStP1TawemdbEIL9n6gcZUOFnNn2Q9vJqbMTXEzve7WkxqPtzp9svvRUvRdQW5xa61VwGfJdAf8
	NhP2x9Qi+cJKdysWnI0RhGHmyuCki/FZPMo4NpSvaUDGYPZlbgPJpZE3GMOXxGS7EF2fWK2S7Yg
	==
X-Received: by 2002:a05:6a20:3d8d:b0:3da:6bdd:2308 with SMTP id
 adf61e73a8af0-3dd8c4ff25dmr8514188637.18.1789796696494; Fri, 18 Sep 2026
 22:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915021338.1520964-1-main.kalliope@gmail.com> <20260915021338.1520964-2-main.kalliope@gmail.com>
In-Reply-To: <20260915021338.1520964-2-main.kalliope@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 18 Sep 2026 22:44:44 -0700
X-Gm-Features: AcwNN1Vh-GA3y-jQOYzFbcyt-JLyUr5-tYXcOs23bIU7VIPtAK935mc0-3bwOM8
Message-ID: <CAADnVQK7PqU+VXgZFOLqDSs8m0-DXWmm5+_Lg4gddrwdvd3N0w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/5] bpf, x86: Add support for BPF_MOVSX in the
 i386 JIT
To: Nicholas Dudar <main.kalliope@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Wang YanQing <udknight@gmail.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	"H. Peter Anvin" <hpa@zytor.com>, bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 7:14=E2=80=AFPM Nicholas Dudar <main.kalliope@gmail=
.com> wrote:
>
> The i386 JIT lowers register BPF_MOVSX as an ordinary move because
> do_jit() does not inspect insn->off. The generated code therefore copies
> the source instead of sign-extending the selected low bits. Context-acces=
s
> conversion can also introduce MOVSX while lowering signed loads, so
> rejecting BPF_MEMSX does not protect those paths.
>
> Stage the source low word in EAX and use the native byte and word
> sign-extension instructions. Derive the high word from the sign bit for
> ALU64 and retain verifier-managed zero extension for ALU32.
>
> Assisted-by: Codex:gpt-6
> Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
> ---
>  arch/x86/net/bpf_jit_comp32.c | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.=
c

I don't think anyone cares to spend their time or their tokens on the
dead platform.

pw-bot: cr
