Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792457819;
	b=U6hvJJXZwKnbT+CZHfKVJaQGDJoX0V3RWkpp+QyxxsVKQI/YCsa8BWRv9kmtuyxMNYen
	 hl7g8OqUhpeu7HQpxZjMbN5yw65CtIgYpWX8XaP5nrUqVBYouo9xypTOYHM4Q9cS5GVcF
	 LvXCRUcxVCpWddyBVhOZ8WhrdzcpRDg1ZDSjSp0MMh6KRBPcRjtF6cvtuE/XZFrUDxmED
	 GZV+F5pErTxeRl0dxzuA74Mofzd16IgT2y2fLrAVdI7cfYQWCvc7z927lF3u7zGMjWa3s
	 XNj8zLi94StdB/Yyvf+9ixSIfwL9zBlMQKpKqwgb/lmurV0DW94UXer2f0uHgWBpOpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
	b=wVMM/ScLebBouYlRvqwsauSUEvDHci6ZFOqVjI+3ZXxrvEvdXz7Qtx+aMCiKHWWl5QGL
	 YiBNstr6b5Bs3QoKclsRFOwWOBlDZ2Og5wHud4HqEioC3wRHrkAS+uhwHVTWYmmR4nCl3
	 JmWy95e09XhkODsc283tzNhsI6eXgmkgbmI6a63b4wC1PLjhDBT+SeyAweYh8IeCczb2a
	 lzR9PDS0Cwz2CsdO4OdISt1UMYX0n7XuISNYGTNDDnJ8sbRBRKw6gwwRwwQ7NdhukHnCW
	 /IrrR3n62i9R3hO0uUFloFS9bJRxftnXbuJHmnIgbLK6S8YsTSo2F4/2O1ZN9em4mMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="g/t5o6Ej";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C5F606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C5F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g/t5o6Ej
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so3095042a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792457817; cv=none;
        d=google.com; s=arc-20260327;
        b=SKYJ9lhVYPZNvtHNge16tv2daydGfY6oACvBJCCvDeWca2Wx06VpCQlY8vnwlMqthU
         j84AGovScCejuV0F/qFwNu6Ue5hDuTV6OoImjM+VjE/D8WwU9SdFAJNZNc9Bkvj0h48v
         sIiHkeRCz8XjDKURbLKSlvB2QKlZw7XYHxOEhf7VCXf21IsZ7STxO219TagY5Lkg1xhc
         gyNB9HT//mbI9+pkBg3iSdasks9pzQc0Hou832jDoIbY14VUOG3qaNw6UqG85xMhjYo1
         xhAPv93YZkOvTbdvPT8WLmk0btwaFlbgIhj19hfUqaxJDGCAz7nRPw0Ftp2Iso94xb/1
         rBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
        fh=otyGu4NyM93mhBPfmux3cE3c5pPezxb+hqPd48ulIuk=;
        b=iGIXxmWYsAp5O04NCff0P5/ina7KeB3cQ7QFsfxTCEgb45PCsvR3Lv+6Z/EG1hjrkf
         V28OBtymZR6uxMufTljj3W7Y3oF8127RH32z7/UyxNj5qqUgjPaklCYGYSfQZTxAZdNX
         kyRiijb58bKmfzM2Txd5mjDHPPZsHWh+BMYyuKCZLY3aVEmgY5oQVJhnthLFCUjop3tB
         NtfaCJjMDAMtYjggcjPx+9kn8jxEBecgBjKEG+Mrni0bomgCFApjfHBIoT4ibhYWs5QR
         YSRARfsgpdcdWyDT6G0Thl2U6Ts8AOt8msYxBJMt5QkWnSeuezkRH+WGKb7/jjVmpyQ8
         R/4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792457817; x=1793062617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
        b=g/t5o6EjkuZWvwQHWRZsNtJAmg42hUhwnonMDxvZE8hdCb+pC8Hu5Lq1MYavooKfNQ
         0duOmTNpTzabLa5l3/tg7z6XQEolPXZx0BF54eWA8R8WLUEU9YBgabWOahk28S5JQo4Y
         6295ltW2oqwBdrYHyaOgB5u9XZJBRnl+camCywbRELNDdNHUVCU5jblyTd/eyCJG7hHs
         NW6boU/4REtX54JtBw+7Pri67PFkDBiHvPp52eIW/tejGHfCRsdBWQW2fRIb97nJ5y9h
         tqenEs4c8UcxH3O7H57Na5Tr9yNuV+eN90DFOlCZsnqYtx8UbQKiv7kREoq8Bm/gjoHC
         tD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792457817; x=1793062617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAtqBowqzkjXyj3wz92DLNUCFjJ/T1beZVYNBRJ7vrY=;
        b=cJdvlF6PSfTtipjFhN1EHFDm9jm/GLLNUmrVf/YVswuu/WlbAV6oR+LRhMWHuw3QPu
         mzZ3hj9NwgTv3TLn/RO7WSnu2s0daxrUU0naPJxeFygTy4PoxXSmusYBekoy0AAM2pPv
         +KXrSgqizJslXZKrr42XVufeNod3ozPFpAiUsCn7IJ/MEsp+o9okCqIz96FTfDAHPCTV
         aXJREPsbEe71TtMUOexi3auJJYJBWqF0gBY1OuKmpOaBRxTaaBo43phCb/z8YsJlYsUP
         qtj2nYU+XQJd31IsUtAbKahHqMNsPGJQHWN9o/iyLKGiKj1QOrrbclAKdUnpWj22s/hj
         Dd3A==
X-Forwarded-Encrypted: i=1; AKwUvBwEZmw197bOyuDj9xNtuKWHvgQsQbV+BnB2rmu1LLUcs6rBk8tc/mtbN5BKQybuDjbOroccBcyRJY2cXu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeZCLIpXfOI374hw3EAYMmc8HsPRAoSyZwOgJDI7zIIU4slI/b
	jj7ObI7uAdor+Ak83Wh24MNXMNkpXofqSIW9UyfRHvX4TnevLI6Nqi6Oo5Yc50e5+rORbGljES9
	JtQ4VYu/75sXd6P13mWMyj0C0SoYETrTZxXYp8P4=
X-Gm-Gg: AYBFou3hRoy6UyWQlNu4C8PcxcopsWZ+sfcyeF2YRCt1adGafxVWKuOtUpmDW2ckEfq
	DEXhCDlPJLAV+Ty2vRcyZij8iEuGZASXfo+8mP7RkShdg1/7nIJH5J5GZi5a+v7n3xhJY5F0TgT
	HjPiLLm13F5V12Vc5iqOlyyU9DPVbeLVrVYc2+nwqFc8WhN+0Igxjh4XihXI+zw8YuPJW4ORXtq
	8JX+aTRdfGBskw19DvfP3zyFDZCrQ2mqUiy85rq39DU6TkWDfI96KhAmvT4GlccXcYm3tAJtU5+
	wg4yx3oAIMD6/ruWHhwGLKFWRAEua9BdE6u6EKjL2UmOXfRBZ/XSWN2TBhaYBS8hzFhcT9WE7iV
	plcxsxiQXEgt6eCIAPlPH7wqeMa51gEuNhq6gmzi4G/lgnRPwGyvXSIRKJVj4c8EB5D2xgltDai
	sLAcx5c56e21J6UzM3wuSXzZn9p6vVS5lwjrQpzcmfvFcmRZJBL5EWMwDwXp2r9uCqKWRyiay2L
	uKT4sXMaRPr3YAMqFKiyySmKq/2/5Na9gwiQUydHJR9zFeFiuY=
X-Received: by 2002:a05:6402:3217:b0:6ac:765e:def6 with SMTP id
 4fb4d7f45d1cf-6b3a80e3881mr5814280a12.2.1792457816790; Mon, 19 Oct 2026
 17:56:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003238.2823758-1-sashal@kernel.org>
In-Reply-To: <20261020003238.2823758-1-sashal@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 19 Oct 2026 17:56:44 -0700
X-Gm-Features: AclHuK_gmL5ntpzJBqKaW4eMlZNeLIH7jBbTmZLvss7NzP2JfQGi4qJnNJqFwWE
Message-ID: <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com>
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
To: Sasha Levin <sashal@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Florian Westphal <fw@strlen.de>, Julian Anastasov <ja@ssi.bg>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:32=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Building an i386 allmodconfig kernel with clang fails since allmodconfig
> started building netfilter with GCOV profiling:
>
>   In file included from net/netfilter/nf_synproxy_core.c:7:
>   In file included from ./include/linux/skbuff.h:26:
>   In file included from ./include/net/checksum.h:21:
>   In file included from ./arch/x86/include/asm/checksum.h:9:
>   ./arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requ=
ires more registers than available
>
> The csum_ipv6_magic() asm needs five registers at once: the early-clobber
> sum plus register-only inputs for saddr, daddr, htonl(len) and
> htonl(proto). With frame pointers enabled, six general purpose registers
> are left to choose from.
>
> In synproxy_send_tcp_ipv6(), the GCOV instrumentation lets clang's
> machine scheduler move the copies of two incoming register arguments,
> EDX and ECX, below the asm. Both registers then stay live across the
> asm, which leaves four registers for its five operands. This is LLVM
> issue #206307. The error goes away without either GCOV or frame
> pointers, and it reproduces with clang 19, 21 and 22.
>
> Neither len nor proto has to be in a register: adcl also takes a 32-bit
> memory or immediate source operand. Use "g" for both, so the asm needs
> at most three registers whatever the caller looks like.
>
> ASM_INPUT_G, which normally replaces "g" to avoid clang's poor handling
> of it, is not enough here. It expands to "ir" for clang, so callers that
> pass a variable protocol, like nf_ip6_checksum(), would still need five
> registers. With "g", clang passes a non-constant len or proto through
> the stack and still turns constants into immediates.
>
> Fixes: 403cec8ab6d0 ("netfilter: add option for GCOV profiling")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://dashboard.kernelci.org/build/maestro:6ad55fe255fda507603d=
2651
> Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Closes: https://lore.kernel.org/a28df759-d0e9-41c0-97c7-5f89a18d54e2@oss.=
qualcomm.com
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/issues/206307
> ---
> KernelCI's kbuild-clang-21-i386-allmodconfig job has failed on mainline
> with this error since the 7.2 merge window, v7.3 included.
>
> Tested on i386 with KernelCI's allmodconfig-based .config: with clang
> 19.1.7, 21.1.8 and 22.1.8, nf_synproxy_core.o fails before this change
> and builds after it, and net/{netfilter,ipv4,ipv6,bridge}/ and
> arch/x86/lib/ build without errors or warnings. The same directories
> also build cleanly with GCC 16.2 (i386 allmodconfig). A 32-bit userspace
> harness comparing the asm against a C reference over 2M random and
> carry-edge inputs shows no mismatches with either compiler. No full
> allmodconfig build or boot test.
>
>  arch/x86/include/asm/checksum_32.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/checksum_32.h b/arch/x86/include/asm/ch=
ecksum_32.h
> index 17da953879976..f74873a5e3510 100644
> --- a/arch/x86/include/asm/checksum_32.h
> +++ b/arch/x86/include/asm/checksum_32.h
> @@ -159,7 +159,7 @@ static inline __sum16 csum_ipv6_magic(const struct in=
6_addr *saddr,
>             "adcl $0, %0        ;\n"
>             : "=3D&r" (sum)
>             : "r" (saddr), "r" (daddr),
> -             "r" (htonl(len)), "r" (htonl(proto)), "0" (sum)
> +             "g" (htonl(len)), "g" (htonl(proto)), "0" (sum)
>             : "memory");
Same as https://lore.kernel.org/all/20260904000833.2058186-1-rosenp@gmail.c=
om/
>
>         return csum_fold(sum);
> --
> 2.53.0
>
