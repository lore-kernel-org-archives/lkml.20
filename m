Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A094217723
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465728; cv=pass; b=iolL3znLLT+GZe4+R23TlmVm2nij1GIbYnSWhVm09zqSFKfXD29QHOquiS/SUaPvnKG3N2DzlFdYNbBvRljQ2/XuQ/LTA32IXakoyRMeap6zd57yPUq6MYS9H6ltKwmqkzhTa/xdb5V/VLJO7klNymqm8UBe+NtoEGbPD9OZn7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465728; c=relaxed/simple;
	bh=kqN7v6OkOyHJgxbwrpC5Eacfx8YjrcZBxxUXMIP2YC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EID8/mK2pXaWpauN1n5FMeO+y9RT2U4iRKSgKqWYTas8bqHE/A2jNB+aDuyL8KVN4ElJbTLLZ6VJuEiSGLmIWQfF+QAiBY04DB3xhwwMvVw5VMxHDvodwIJgc9Vi+9lfNt6Ua9M85YARh4lsQag0bWg1EGd0s6kkPM+p2tFjdzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FP1ayT+w; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FP1ayT+w"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43ac8d1fso19099717b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465725; cv=none;
        d=google.com; s=arc-20260327;
        b=it4I8wFfLcJUxXaasAYHoOeXiNksT5IalUm2CJmpIyTJl3m+JSYsmIELhCktkjzyGm
         Fp2tG/Jek+m+OeOCjUv/zZOaWJeE9Iox8iVVk7vvpfOOSKqnnKld6AhSiC+sNW1N+0lc
         DeMNR1YV64vrNRzHne1dbFMBNDc19qmniKou7+V98oOtZeEXGkGgc2XEHMHphD0FEBhe
         2HvnRbonLcd3O/KunCt/1z62nOqbEhUy5b8nPMWVwnKt8zZ07VDg9LcAU4q/s9y2RELL
         2tK3WouJCoTsSR2BoNcqmT8twcvh1ZbbBdBlGszJBJ/bjL2IxzOicDWNm8pu38MvfBSS
         6Rgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        fh=7Y9hSQ4UEJ6ki1SpZhMjYbekbm7XbKroCG84EQb3e+c=;
        b=fp537lAo9eGT0lQcocf3RK1PP0SVsLZi1E99SlmHG+hW3AccihPjGyUkgGtgLmxXrk
         CayYfD3uSpknolBSYe+jT/dUqEaE7U5s1GKlX+EHW7+/IKULrHdpyIJIhTEN/eV4MQBk
         mHLlmDYoHsZ0vAXd2MXYQO79i3ybq9yV6Y6OLKTP2Lf2p4HO0FqW+JQRZ6Q7V4p7mJH4
         Sx+esiRYX/CRAu1Khq0tsAKj18/HhI5I0/l1CAUKPKYw5hBkNehwEGYBodEood2TG7++
         GDczU1rS28ZQM43/OMdxhFy/3O/9bLJPE9Y7itRDIMaQmrDIDg20bBkEuYgaflJXCv1p
         zgtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465725; x=1790070525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        b=FP1ayT+wSNVGfq0qzEdIfLUDQ4EfryMIXuD3nRX4TOJUzphwV99dqE3p7XBYA0fQ3s
         RuBpaTMyg2wbPjxKnlNkOrSkTwYbcm0/u/UmDotjQoOJhqA8wuOr/wCeWExDVJrEr/T2
         msBszEVwdS/VsnoLFQI3ABwbyGsv5161f4qQ8fInG1BiFy7aSiUnUiAReT0fQ1stKlZT
         Vr1+oIbnjLV7la0Jv0qd+pch8VU/UIJPDISn9OM5E3KJSocmXHinYq6/0To6LiZvE4eS
         GTu7FsI/aALM50+W25FPo6Dq5yNGdQV+ZRdz9MMG2LgBmEMLZZnGd48dDAdwf+rlGns7
         MvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465725; x=1790070525;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xt/N1c2QTUTpESd5vWZaOt8vFR/C1nSv7TXwJ+U64JY=;
        b=coaKch1R02cioPWO0Jg+Wca5sFSzcG5pp+icPCBM2NQjedvEHEs6Sly0HWtgSaFAjZ
         ep3yCO5E0MR4o0dDMEG0TLQ24bjCMSj3rk0mW5MCHjxeleyaCMDC4VZGnC0NKhRzTym4
         0uxY2BfMyIhmsc+RTph6lbtUDs8Df7RHVssaA1lbwzs6TWMGC2sdQhL1g3p3MArMyIC4
         JnOrKxWPedmPg5810EIF4E7l1ijo3S1KNJz9+SxGcmgvXWIPG0ROftG4dZ4TEqObbMMT
         wFld5y5PB7GBx8Inn/aiJOK2uACHgSHGtfMd68v7WTQrfCwnDS29B3ssuPVqNWNCuq3y
         W2XA==
X-Forwarded-Encrypted: i=1; AKwUvBxTq3UorWmELTygNkmcfDPEUiAE7mtx4CtxaXTeXkXhkk8+0QsLDGJnyFYY0lI2dwFxQNk76m8omU0rn4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nZlVk/rSivgB7ZG/ZQdJO855meSRYf96tSl+JltJYx+aLqg8oU
	SVUI0w44361CoAG293anVJix/RWxQLjTToN2/2mlVCc/XPY4/bp1Ktq7hz3EZ8/L0d3Boa2sSUO
	5ftouch8yqv9zNaFguBTAaL+sFe5REHyIlCWQ
X-Gm-Gg: AYBFou1nYJwVrSZaCJKwba4fmBAnmLOCNeb/7h7Er+N1f0XyQfepsGtBvT33grVSm7s
	6cOxdd3qIPpZSSn4afGuQqe4h07C/xBUTGqjt3T7LY0Uq0tJd8MOb7HKdxgVfsChlqkaMzdPC1o
	eSrdxpPksvKoa3gvan0kBQlpHib10TNmdlBO9p8AwWQL9+wO4NOavEOOFb9hutrpNEK96ATA+Ys
	xm1tvRfPXykD0YRICCsbOTTw/PMVs+eNg9KBCHTLdiV2aPZ8LRiFIQRKXdol2X2kRxoZKGSoP+l
	VdvOev/zuHn0xDxfKcr2tVbQvPCGWuEd85f3G72usW2lXB//f7WEM1wu5w==
X-Received: by 2002:a05:690c:9990:b0:884:b55c:1bf with SMTP id
 00721157ae682-88d19927a33mr17511267b3.0.1789465725204; Tue, 15 Sep 2026
 02:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-07-k3-sdhci-fix-v1-6-b15c5d0f64fd@kernel.org> <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
In-Reply-To: <20260907155300.1411173-1-alan.tseng.cs@gmail.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 15 Sep 2026 11:48:34 +0200
X-Gm-Features: AcwNN1UPWo8A8KL1cUnWKRSOKo7pDITqyT1rjkjcajM5WYeVYYuEMRIWcJfeozY
Message-ID: <CABdCQ=Mi3M8vGCYjURicNWy-Bh22qN199jOdHA5rEfTzui2b_A@mail.gmail.com>
Subject: Re: [PATCH 6/7] mmc: sdhci-of-k1: Improve RX tuning window
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: dlan@kernel.org, adrian.hunter@intel.com, ulfh@kernel.org, 
	long.wan@linux.spacemit.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 7 sept 2026 a las 18:00, Hung-Chun Tseng
(<alan.tseng.cs@gmail.com>) escribi=C3=B3:
> So a threshold of 50 is comfortable here. It also supports your
> rationale directly: boot -2 produced a 5-code window and boot -1
> produced a 1-code window on mmc1, so the narrow-window case this
> patch guards against does occur in practice.

A jump from a minimum window size of 3 to 50 delay codes is quite dramatic.
Could you clarify how 50 was chosen? Is there a specific hardware specifica=
tion,
phy datasheet recommendation, or test dataset across multiple boards that
justifies this exact number?

> My question is about the form rather than the value. The vendor
> driver takes this same limit from DT, per host:
>
>   sdh@d4280000: spacemit,rx_tuning_limit =3D <0x32>;  /* 50 */
>   sdh@d4280800: spacemit,rx_tuning_limit =3D <0x32>;  /* 50 */
>
> So 50 matches what SpacemiT already ships -- but there it is a
> per-controller DT property, and this patch turns it into a global
> compile-time constant. Was that deliberate? The vendor design implies
> the value is expected to need per-board adjustment, and with a Fixes:
> tag this will land in stable, where a board with a narrower window
> would go from "adjust the DT" to "patch and rebuild the kernel".
>
> Two options, if you think the concern is real: keep it as a DT
> property (matching the existing binding), or keep the constant as a
> default that DT can override.

I agree with Hung-Chun's point regarding configuration. Hardcoding 50 as a
global driver constant assumes all boards and trace layouts will behave
identically under thermal/power variations. Defining this limit in the Devi=
ce
Tree (or allowing DT to override a sensible fallback default) would prevent
boards with slightly tighter tolerances from breaking or requiring kernel
rebuilds to boot.
