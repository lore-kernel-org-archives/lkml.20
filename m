Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2FC449B2B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792311502; cv=pass; b=nDUBBrBi4i5Zzj/70KnYDoWBDz8M/DKspKZ3RtIfXlZLa5xOcsoAusgcutHSm6NpmBhOAA6whqHZnsobRT6pREf15X6FiXC/8bjlkx885Df2adcqmiTTKRSAsVx51Lxu/DQ4CLxAVhK8ZyLwplK/HxBpwAn0E9rw7dwLm77O1Ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792311502; c=relaxed/simple;
	bh=m9LovGZRm71Kz/26siQRqDNvtYfWBfw9Tv7L/BOcLq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SurOE0s0Na8Y5JxSv7hIKLX4IYJE2CrJYiSXuREhxohT2LcPw6FiRBLzxPU5G8F+IrUmcvjRGSRgfQKgiV0JVB0Bwc68hS7PnEN+K6SroVhG/RL1mLuuaWCtaxrkeBRej/TM/3/koST94+EQEK+dqFvsR5QXx7x86XKZR/arDus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbB1coky; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbB1coky"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67921b515a7so1378165d50.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792311489; cv=none;
        d=google.com; s=arc-20260327;
        b=WHZozhWUFEjMgniQZJ3uDMOnJd2zYwbVsGtJjXn0P1lRXTxSUgHeFg+oTk6kbgu1Ae
         XOotUdv5rSeTqnoqHCbCvZTOfXKproSja/tsSAwwgUPC6KC8cMtfh687t6lbhXJFgb9l
         UUGiwaiKb6FUUHRgo3a82L6yVYk9Oj8/qWD0xXLc6WRzSMxKLRpVmWdYRCEg5VX4RtV3
         THlC56c3pUCzslOpBZN+U9ztvii9bUCIl3FiZk9kg6Tqbw7xeNWVDDwTQxDONOVCvB+V
         mcjeI7eMgjZu1NdsBrpRAgk0qXV9j3/tL7jjFD1s/112BKFjFB9sY+Xh6ia69gksJoN2
         63uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        fh=NnsQsYrB2mFfbiEcjtC86kM/DQCbwr3z9pugf/pJZN4=;
        b=SL4cedzD7+paBJGrdUePPlAdNJmcCxdpbMFa5+ntwJuf6zqkfm7bWB/THKAKD+JkM+
         XtFWPtMaWerOONouj6Bf3nb0q5CLeHGSMrjcDJkn4DiVSg3Mo6Uiy/Gbwexjk9eyI17u
         MIA9VF13F/l22aM1yA/qQDAb+dLjBMBu8iJy430PnkqSY7bcy9WgVNBtv4G0EcLMZ8Cs
         /Y9+1uIspZlJMaLiGrkzKLFe/7vhmQmldJ/TAbkv8Gg/1CVmqRDObqxYWyj4QC7a1YxZ
         FuwlK+5FyW9p7yJaLSDkB+s9dsYBXG3jOHh5APjAwhEvr/36jgYj6hlyCkvN4QawMxaD
         8IDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792311489; x=1792916289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        b=BbB1cokyERZfK0hTfxQTtmwmvtFW/q2hmlF+irPUC/MDzL2O0/Pxenl+uXX7ayPMsA
         oaqNS4//XDbeIKgq7EspM7Z+rZb2/O4hklyewBfMvczfAsMmNUDKiIWKgPPK1bPM8ej3
         cBccKYLiMgbI4sEQ1r8LJL9amuuzd9RLa7YiZpyi7sZ6q9hAf/1VyMCSuMzeVThNBtj6
         o9os4L3gEcv1FtYdqfqARbnb1Uc1d1C2MCkE/VdCDEfe9Fe/qDYRjMz71OScZt75ayF4
         Edsop6C0EVZ3cXRB/6B3repVPVdKU6zgXKiT+dqYVaQv+ddpeUSqoumW8mO2C3HoaTrB
         HTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792311489; x=1792916289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZKQD7f8VncSnmQVt+FYovLRzFClXdtIOZ4L3tv3n0X0=;
        b=h91bgn+/kbAD63TACu53xoFf5bpf4/an1d2i44aM7neATXsnn6o4qgWu5JNYMhT2F+
         YM/mBbkwsifaPdNlVF0qH2vIcXrayaoWzGXllQ/KK1JOb6Qt1YDkMrGXqHLKWqoNZdFS
         3QluVt4yeLGA5Ykk/jV2XlWQRDiS+3p1nabFKPgbdxAJE6TbdEWC59hPMjPEp0j9vrxr
         VokU/ZS+oapdKR+2TjZMvjqp2h4L/DbX22Nut8MQzX0PAECyiOF3w7HAc1Vc9dzFU83f
         hC+VKqJG3Gd3z9F07JDq/RJuBXD2PCwCvAWSkLsg3kB/s2lBsslxujyz7Isp1mQZ00XV
         bSLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF0gP/LKO5lEBClQBbZMhjYTit3YWUn+bZx9XLq8Wbz/M+/N+YmIPRdxKL0TFeNKPdfeutWtVp2fnr5KU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWcRN12ogImxAhW5eNraE1GD3Riq58iaVlF+Fk7KzCZVNwzEbS
	9airHZ0lpvCfqHu3WGGDRl8DW8Ri/rFG1PT+1uH5ZnkTzdtqZ6p6KaW/RbH14ArdDR02wVvYx8M
	nmZc9K09LbDlE6lnT6Z5cHGrSfzvgCGU=
X-Gm-Gg: AYBFou16eiqvJyD42IyLKeRjAHTNW6tppIBjXmMA0+xOBlAt/NG3KmNixPcXj/WjziE
	klW4C/cKAy1SKtw1ePjp8BptEo197bz1G4qWzwsXJMnsVbQ4tv6h+8vYSC3nOCxbSwlBVR8sb2N
	tzYWj2Fh3KSm2XCa7GDpZ6RwX8botm9v/lLjKYGU8/YE2Zj2qdb6bc+fJl+N8dPJFBgjdZuEJrN
	e3BrxLewrTJCg928BHz1OkRLzFgHRXnpwo/5OAGoc6yB8ruG69j2zcoEGKBU8KqoXV/atn0boJX
	+ycyGwv2OqNTQ5UqaWq8ahnH9yCEuDPc52xOL4mduyW6SFs/cxTT51IVuSwEfAoC9kh2Abr82Gj
	9tLpdY6sY8TdeDhZFdgPKANZN7NrnukORANht8MXOX9X/eNDx/QjO
X-Received: by 2002:a05:690c:f13:b0:8b0:89bc:92b4 with SMTP id
 00721157ae682-8b0f21bbb4bmr16206517b3.51.1792311488622; Sun, 18 Oct 2026
 01:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com> <20261016-alpha-perf-regs-v3-v2-5-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-5-17654742226a@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 10:17:54 +0200
X-Gm-Features: AclHuK_OPAh6roFXb_L2yR4ZCbLp7NUjn97i4r3orTmSL6OpqXmOnn6fpLIEIiY
Message-ID: <CA+=Fv5Rmwd6pjs_MBo01Zvqo3CwufefqZvPCJeEvK60Ona0tJg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] alpha: fill in pc for software event samples
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Oct 17, 2026 at 3:56=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Context switch and tracepoint events have no trap frame, so perf builds
> one with perf_fetch_caller_regs(). Alpha does not define
> perf_arch_fetch_caller_regs(), which leaves that pt_regs zeroed, and
> these samples report pc as 0.
>
> Record the caller's address as pc. The zero ps already marks the frame
> as kernel mode, and pt_regs has nowhere to keep sp, so pc is all that
> can be filled in.
>
> Reported-by: Magnus Lindholm <linmag7@gmail.com>
> Closes: https://lore.kernel.org/all/CA%2B%3DFv5S8-Zk8-LUpZnWiBfTGSQXthepm=
Rc_-a9O%2BpEPmVW0mRA@mail.gmail.com/
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/perf_event.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm=
/perf_event.h
> index 5996e7a6757e..72536566014a 100644
> --- a/arch/alpha/include/asm/perf_event.h
> +++ b/arch/alpha/include/asm/perf_event.h
> @@ -1,4 +1,11 @@
>  #ifndef __ASM_ALPHA_PERF_EVENT_H
>  #define __ASM_ALPHA_PERF_EVENT_H
>
> +/*
> + * Software events have no trap frame, so perf_fetch_caller_regs() fills
> + * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
> + * missing.
> + */
> +#define perf_arch_fetch_caller_regs(regs, __ip)        ((regs)->pc =3D (=
__ip))
> +
>  #endif /* __ASM_ALPHA_PERF_EVENT_H */
>
> --
> 2.55.0
>

Thanks, this looks good to me.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
