Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004634;
	b=SU525FnAwFqr0QNyyyTw7ywF6oKuttn4J3eFEu3QYEY3/zs7zrRu7eU/+2GqzMxsa/P2
	 IZJZICxoDfvtF6RvAkEHTMOdldEKDaaqR3bYThWY9CiezrBJhxEPdoBX7YruyDKkA4aMZ
	 yaa/TEYaP7pyXy9Kf7d866DiOdqhe01JgJFdAyiY2kAm/5NyUxyu2/cTvoRuSbnThGmdB
	 4Xphq7vLHcMzmunz2WaGtS3c+D1biaU77S9JuDSO/XTUkJMJ5O74zYKyOMRbdNdNGpJ2X
	 YPFfK/s9+qh6NiZa8ds4rRHMxA5uL/iqxQngIxR7dujY04AmVrto/RrUO5ctpDqhXHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
	b=vNTIljUrBczWu2MUpS4IHGywM4DXtd1N7g5Li3AkQpzccVS11b817mImXa9HLi3isP4o
	 Rfuf9RTFkX5mDHW3nzDuaZ9y/PIKz0guu43wvTeSD8uVo6RfwAPY1mO7iCaWZgjM6ULOq
	 p8NWe5Q3APwKJaODqBRwwHDoMNgj4NLi1efG8V+J2aKPKAOkTe1gHnP9ucS8ODgPqICll
	 6zKOOidtJjAKmXaZzhsPZYxZGeEpAUFeuBlbXwpzwzux9skAD97NhrkZyF4YTkwNDwcTU
	 s414qpY9ZIZwCQ/37ZJldDZaDwEje9cJKXVtu+47NCIprR04/uRNfERH/8fWtbDqOyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nn0nVMTW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B7606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 361B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nn0nVMTW
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso4458217eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004633; cv=none;
        d=google.com; s=arc-20260327;
        b=oK1UopDGbpWnER01LG6Vj3aJ6rUrq998EK+mnkq/6XDP9RFvky/LKdQaTPtW/8L8I2
         p6FaDM7BIrMNTZVmFG7H8hcN9WF8mBI0yn8yHfZdpC6WfulnIFwE01bVAKxX+9zZsTjg
         val6rLQ+bI8VdmX7oGzAqX1aCpKvOMQ+t3GXa/tsZMkVGTO+t9bGaonhfnOSZ9Ds1OSb
         YfVV/t6FgkIqtSu1aqIutIMT0qN6Y9iq3aA7jkXVhmtHDm8E2O3tpVebrgLmVPCyQaNY
         SjKd2H5xN80d4IrwsSXy3fxGSoZwYQhqVF4zN/R13g67NnjDM0roH942MzuhnkNdthiU
         EjrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
        fh=4AkTHJJnlsoAkngtdQYjUDXWYk8uCPtJbsm0Ea2AUfM=;
        b=hbT95YRQgLcb9VOO2zgVPZfxmAYNHgUkdiKr16YwikuJzAAKB3Olc2VMsMjo1P0yMx
         z5Tz5zb4n94FxmhfujRbNSYJIYjPVLXTNMGpiWDOOn2mKVVyU1JCpWUcQKvMLrleMBXH
         olM2a/+GQTFeoRD1Ueoqd/kwx69QaSWnSYCN71XZQj76uzI6mMil4OAUVqgGM7SZ8enJ
         rB2ICR629lKdJMsPADeAETrqzSObmEAVCLhlzjp3+Jiz9A2ulZIS1w58asMzMh0RFd3o
         eiFElxuPAJYoaI9cdkwwGxzO9gMhvxez4v5cPiuQPP9cRDqU3GIiizBKwagZMfSV34/B
         J+dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004633; x=1793609433; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
        b=nn0nVMTWa/ugZXPz401T/3tm2krdJPTQqU9DomZfF4YDxk/9Q9Uh6xz5nhH6qQ8P1E
         AeYL5P0ze3rc/tKbby7ir9sx5t0zkHCxvV2s/Z1mk1NnH9mt47jESv9zkkwMSVZbO7kN
         a6q3ybnwzDOLcS5B4C0qvq41i/h1wkclm4EbNTzFxQY95U9tpUabB500RG/Nx53/SglF
         Yaj/7W8im9IIiHbhzpwoGIqJWCpWQ/mk3MJ0BJocjD1/BYp+QawbLJpfI0kBLJxo/Azx
         baDB3XQzzCf9lfyV+uio/X8ICKiL89jsF8lex617pD3TS3z6DwNwC6bvmQXehcSeWAo7
         3J/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004633; x=1793609433;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xS2sklpUUUsLj11Ls/tuw9BnZ0uRdCDBYmfpAjGG9c=;
        b=h73p98txWJYKq2ASS2t+cAi58iNzDB3lq44VGoUUd+DUr9GeSQWbeeGowTtc3oclsY
         +FziAZ6XOr3CVmxhfKHT19Qb/vjVhnx+NCPQtL6dox3mYTpPOQqxSj1OlSsCdR0Z+y0i
         smjrZYbiD0+02gmNBgqSEDR/NkKC+mwusVcU7zkiHFxAynf0ZkoFASqWsjErpo/3Grhm
         nfgzamCw0uptZ3+ulSXjoXk66g8+VYH7WAHm+KvuCa0cfWSZ3SGIz0VzBDQKDKkX0G+E
         gdqWAPEgkYKF7Ryqg/mZAvvHETnJZ+IsSSQ9pZAvGdectZlZgUQVcoCudG5fHHiu2iCB
         n6lw==
X-Forwarded-Encrypted: i=1; AKwUvBzN7yHxyOxMFaE9l5WuSHyCrZoZNA0HWrJasTj7uVi/0sqAcjiTi4UgGnX+mnatcbcT37jJXcnqiVTuanQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWoKmFK2EHQ3pbUDpIt4rrJ9DkJi2HH0b0zcA6NwLzgVO0UwBR
	8ppUxXWKoNRiehcyBY75btbsnkXNG8GDuJEfmDesiVGyqc1U+HXaYjkUwuPLzu6o6IPnA+WCCvQ
	yPUU39t1+95KZuN4J7E2rOnGj/tC8YQo=
X-Gm-Gg: AYBFou32hSiLxLqYdIQu1nShNYTWRwrx5uI87PJLP/J94RC58oynTdUbhDhpDurhgZI
	j6AcVD/pk/Xuu0VNPyHqD/tbap0yCybhcpxiD/57g35qGURc7J4B49oIlVixhCfxjWc4MDtu3Mj
	R+blyaosrhYFoF7Z3Y4jx4ETUiJ76TcNuGlvS7HPvkkTTaB5LtxENuJnYCchPx08K4STVd0GPJq
	KLLRLTc3J/m4Q1U8gZsvIoRlMQw44yrWQkBFCA3/blq9r9aeAJpgmBO6SfDlN+oLIJIKB37jGAO
	as1P7BbFf2tg2NBFWbgXsPRj/BkGi3BP0ht+dUGulbZN/rL9fUsy0/LPMzIzCML/dKb4FBR8CeU
	/BbpGa5aAiROR9kXS+wgx4qqsS6ds5JTnw80PlkxGKBasr7oQv+Y3Bzzjp1aofV0vkys9og==
X-Received: by 2002:a05:693c:87d7:10b0:366:83dd:46f7 with SMTP id
 5a478bee46e88-369e84bc5bemr9492113eec.17.1793004632970; Mon, 26 Oct 2026
 01:50:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-upstream-serial-tegra-overflow-v1-0-267b5b7a79ee@tsv-stahl-riesa.de>
 <20261025-upstream-serial-tegra-overflow-v1-1-267b5b7a79ee@tsv-stahl-riesa.de>
In-Reply-To: <20261025-upstream-serial-tegra-overflow-v1-1-267b5b7a79ee@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Oct 2026 10:50:21 +0200
X-Gm-Features: AclHuK9eFB2IINUeequ9JiBD2-5Y_QxsonBBC6Q_QH-dQtxOvUA1C2K4ZB60Feg
Message-ID: <CAPVz0n1X3K_vtCNUg5k6oStVCfwZEpXJSSGJdk1OK24au1R-UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: tegra: Fix overflow in tegra_get_tolerance_rate()
To: admin@tsv-stahl-riesa.de
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Shardar Shariff Md <smohammed@nvidia.com>, 
	Krishna Yarlagadda <kyarlagadda@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:5=
0 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> tegra_get_tolerance_rate() raises or lowers the UART clock rate by the
> tolerance from "nvidia,adjust-baud-rates", given in units of 0.01 %. It
> calculates rate * tolerance in a long, which is only 32 bits wide on
> 32-bit ARM. With a tolerance of 136 this overflows from a clock rate of
> about 15.8 MHz, i.e. from about 1 Mbaud, and the rate ends up adjusted
> in the wrong direction.
>
> The Tegra Note 7 (Tegra114) uses a tolerance of 136 for 1 to 4 Mbaud on
> its Bluetooth UART, as in the downstream device tree. For 3 Mbaud the
> driver asks for 47.79 MHz instead of 48.65 MHz, the clock rounds that
> down to 408 MHz / 9 =3D 45.33 MHz (-5.6 %), and the WL1801 controller
> stops answering after the switch to 3 Mbaud (HCI commands time out
> with -110). The same overflow gives 23.31 MHz instead of 24 MHz at
> 1.5 Mbaud; both rates were confirmed on the device.
>
> Do the multiplication in 64 bits. With that the driver asks for
> 48.65 MHz at 3 Mbaud and gets 48.00 MHz.
>
> Tested on the Tegra Note 7 with the tolerance of 136: Bluetooth comes
> up at 3 Mbaud, scans and connects to a paired device, and the HCI
> counters show no errors.
>
> 64-bit platforms are not affected.
>
> Fixes: f04a3cc8d455 ("serial: tegra: add support to adjust baud rate")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/tty/serial/serial-tegra.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988) and LG =
P895
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
