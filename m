Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793799154;
	b=MRiCdrAAxuLcGt2Vf20F/+am4v/Vhv1W5iIA88dW0WByW8qwFGIQ9x1b1iZYRWmKSsmI
	 OjlhaucJEHxY0+IbbPsH44B/R41zu8CN6Xp/tMB8oUE9cSXjt1hO6gFWgLrHq9xTDJpXo
	 UbByQ77JYjrlKbeU0vQIlvOaYTfRJKd4g1zKG6Q7Q+ow8M6uyzz/16ihE0ryXQE/4uDXh
	 FmCkYyatQRlYWDqQHMF3TPFHRGd88nHaaGz16/pdW6jj4RyEeBi6Jw0cpjeZ5VY/rZEku
	 qLuKlfFeBu76g55idL7gVxbYEuEqrWl/+ib9QFPn7Bl2cV23P3Cn+3usj/cqB23Op+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
	b=v0/uHRLCX51xb44RdImiRYFr87NMwT9FpKGCExhgFHgCe10mohwu5sQjjz6Pe8vvJLp2
	 e5sU2tJwEoB2wmSEsd4XiSX9FfFlTlbQisUYfActEAjEKMuEG84XeBRjMpe/OshNGDIgV
	 UWwjTZVzB2Dq5vskQR6I4HNgyDyR1ZUNV+BX0zaMduG+IV7ddeGzhydfZcVUfxynM67os
	 A+gU0id0BjgH45tmv8Mgog5HVJSGn9iTfp0ZAwxtlKL1P2i2Tya2VFLOEZJGNjJ65MPAk
	 qTJ6pqZ/+GxEFOs5xZvHEqo1xM3LrZgueS+she0VtWnnyZSIvE5XHgBGrPqZwQiV4Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp;
	arc=fail smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD429606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD429606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy9pS4bp
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6de2f213b7aso309011eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:32:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793799153; cv=none;
        d=google.com; s=arc-20260327;
        b=T71A7lAC/4iqxpdrjm2roiq4DAsoV3fKs26itfKqm6UiV4fypgTMaxkIcnJKW1z7S9
         UXRWJRz/IdtWH1AHXhrcgVyIq9RnPINii4D9+xwEjQ9qROVWrF8NOVh5LhLxmN5G/Po3
         gFPR/VfiQDqMFqPPbEDddEdRxxJ9K8c4pWaZcCVF0B5xnN6Ou1VoDaRNjcodw3qqP1yZ
         whgIAe7Pnca4t/J3mGEQ1GZsf2f1SxbdrvWQajIxN3XJGhg5lvbFfzTNF6ILJz4SVm62
         dBc1He1C16/GsluqtBWGANNn6oTaNecVDZPYof3nN4ud7JEbLIn/dMzen0pv5XcIxGhC
         vXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        fh=2nJ6Od8JwWf2VRm8Gzzzm6bxiOvHQiHVNk67O1Omulo=;
        b=C6OZ8ROUCVLqymK8+M7V1UPaUVo5wCVui2TjgR0PqqhZGXv9d5pUfnppAx16925p2/
         QnXjzwdGfT2tm51YalB0IY69uKchTfLrf7AG/k1yrUH2zyCxCSRSTDbeeO1Lluu7Q9XL
         6IQr/wQtIVdpvJg7TGmO+1l1gKwFK3D2XsHNtBuSi+LkaHa4gduVfJyDUEC16KaZWRnE
         cjxPw9tNbgXtWTHqA+IGOwfZqCA+4cIcYhOrynHt/oUa2hIhWjZ6F2hte5LVL4J9RaRh
         v0kr950czVhX7FdIKkz1VlNhkfD0Ovc0/C9OQ+RDrl9fOkp6t8Wuz2JHN/3HCO9Di7Fe
         RoyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793799153; x=1794403953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=qy9pS4bprOjTsWRvlH9jkM15Jb6X9A27TdRPIVsM3h3dXuLNkrkluEELmjTLBM+V3P
         ncmegftrX1Jbf48M/GIiWSkyr9c2afUzcpyDNVJUxw2kErAFuFuiYBM0d4r2Z2WVe8/P
         mryc8gKuoM+SPz7kBRJsT3vcNUF1prKGEyid+vyji8hwjKqA/XununEaEOmNqxRbF7Ik
         Ay6P0FIY9Xe7oHKlx6qraSAP9Dbjx59WRcXWsOznu+IpcBB6lS5xl7kIb0TV6bN2rGXy
         D2jjv2adUgO9gp2wR1eQZMN2kZBuWpiOMzIW4Nth+vi0fpGicG3Y+McnpRkp2x+TqdRj
         /FeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799153; x=1794403953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flt7oH/ETh3Es2fb8h9unV+oYzs4yKusapEzarwUpgQ=;
        b=eqHBSm3qoidjfRu4b8Em8HC0ROP8jUYa4w7S/W/D+cGRqQa4CACErKzWNK35zAWerh
         SIty4ROxyDocM+gEZ2U3vECnFaL3sAoChkXkdEK/2NqQhZKSFpBsYBzUK8NuCQSXpw7o
         YC5RcNiQXIBFBWjhi94Dg4NHVM1LC7Oz6vrOgPKSjhlhK7rY08w07Cy2WtIcPXtGeS2M
         R1qnn53ss+iV4ws+IMFksC3gAeR60fPqwx6zgR1CjyMcG3rh1MrDirB2s/+hQfWG1A2p
         zC2zq5clE2NNwSpOTuBQ4LweWkFVKiVjYh4QEkCsNx7/3HMYBG3CnwEUmoaX3U9Bjab0
         hKDA==
X-Forwarded-Encrypted: i=1; AKwUvBxlk6FVL71cv4sOexBm2610E8WKBYZQfzXgoFIlNQIu/XVJ0UyFcVZlgYoqtkxG7fzW4m4OBgKjouWJUVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hRo/ZcF2pDLBEZ8uSyWErPXGnSC1p+g1BA/Ci9NFPGP3BoqbO
	hS50ph0vJ6guqT3OqOQEauqkJ5U4D4Zs6Ix3gjkBXLHVZh7a+4gMSbnJ6g0720MKc4ip6Sbu6Nf
	3orWpHh1hM81KJM0OjmNgSnwoQtPLhtg=
X-Gm-Gg: AYBFou02GXMjIHiFOgg9hisG/LmAJU7oHdNkHsGOYmTBKhKUF9dhkdOXj725LkPytzV
	ABOiEQCfbmcjNUZZnhHffNNmA0YTbM8GfcZ0WMsyaIg1GLhHvrUyfNTHTHwH9zpIZBR9SB1egNe
	SCPd9qbiyFJTEvWUdUXKKq3tgu8Dwz69ZKg7HFqMMhhSy8qNZD4QHSIA3mB/nlLZpJoWoTAEa5B
	YD3pGb0Q0iwilLJtwlN+RWS1/9IByxXuYZFIjRdnSnNoi1Rrp23dRhDP9QS/+xdxkPr4W1NzXCx
	+AT+MWpfQQBRlGNR0sMkXVDXBLj/Eks1tU6VFLIb5CgzbfpqWM/1LJFdBnL7hzM6tZWyv0iBL84
	ftv+Nd4DN165/NE7vdnh+Q3Tfmob5BFiocjYUv0oj0ZwJXYqX+pPn15uQcyabuw==
X-Received: by 2002:a05:6820:55d4:10b0:712:c3fb:b4dd with SMTP id
 006d021491bc7-714f2a07b44mr6865589eaf.58.1793799152650; Wed, 04 Nov 2026
 05:32:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev> <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 4 Nov 2026 21:32:20 +0800
X-Gm-Features: AclHuK9KjWGPhCZrdzN2zSc99IwcSQrcSlYV4KRQtVdLRgeo4bHU_zFbKSD1vFk
Message-ID: <CAJsYDVJ+FWHJ9AaJCmQwwfdsVJJC5mPw-fXzr2n6OAsZFHJbEA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: joseph@telaak.dev
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Yao Zi <me@ziyao.cc>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:21=E2=80=AFPM Joseph Telaak via B4 Relay
<devnull+joseph.telaak.dev@kernel.org> wrote:
>
> From: Chuanhong Guo <gch981213@gmail.com>
>
> Add a platform driver for the peripheral clock and reset manager (CRM)
> block found on Siflower SF19A2890 and compatible SoCs.
>
> Each CRM block manages a group of APB peripherals through three registers=
:
> a reset register, a clock gate register, and a shared Bus Output Enable
> (BOE) register that must be asserted for any peripheral in the block to
> respond to bus transactions.
>
> The driver registers a clock gate controller and a reset controller from
> a single DT node. A shared spinlock protects all read-modify-write
> accesses across both. BOE is managed automatically: asserted when the
> first clock gate is enabled and deasserted when the last one is disabled.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; one compatible per block with
>  its gate bits, critical gates and reset masks in tables here instead of
>  the siflower,valid-gates, siflower,critical-gates, siflower,reset-masks
>  and siflower,num-resets properties

Why? This block is one used repeatedly inside this SoC and SF21,
I think a generic binding with clock & reset description in dt makes it
reusable without further changes and also results in a shorter driver
without a table. This table in driver aren't simplifying the dt bindings
anyway since it still needs one block per node.

--=20
Regards,
Chuanhong Guo
