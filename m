Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472590;
	b=qKzF+rJo49A1LXlUHWwgne0sUvPGKoRfmYp2Ut4s6GEMhWIM6X3pzxBrqMz7LbZ6zIYt
	 ibTUZorCsSgIBefB+5kGlP3DcQotfEwFvCZaUqQSbtS8gxHCgoSofU/2AS4In7wjvAzI2
	 PExluOULikLpGXSnftPbNCsEFmtlTVORDgZqMjM9AZz1CfxJNXlETAR8pCC3U2Ig+dYug
	 3NevyHJZlFr6UEuZjqQk39sWCUTh3wbZWt+oZIZLmVXz+0QICtenvf390Mgi3yt1a3PO1
	 rueXitYWQzx/G7fhz7TIiMe9jYRC812z6TRQrW+1Q6+AA0Hh3MeZ71hQEvMKKXWTfBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=;
	b=coppwbXHNTPGMS1tfnGpVxKLDmS1AySQXKOSJu6aogtqjBQGVuTLbhXebPjhwk7fZL1W
	 ulyIZdZASjvQOAqFtdNaU2J1dAadYB4UyKfm+3BMN8hfK/rh3fYq3WBTe48bpm3+jaxe+
	 3VY6+6AdvhpiNT3SBYsIix3FLTpjFjE/vlS1jDvuYjZwyIJPe53Z1+6zrzLIlo76orBiK
	 m68pMAm+Na65SYRoFQZ5vql9lcY0Nb49Got5vT1G46M2GpHfOqhtS//4HnWkD4txTDBgf
	 Z8oS+LWHKcqvM6KM2cMrpW4WdfqMCyeeJVwU0JDxp8/V0BXupeCNGHFbJ9aQk7dF7fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H1Y1+rIg;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB3606A881
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EBB3606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=H1Y1+rIg
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eb18f4da15so15330305ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794472589; x=1795077389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=;
        b=H1Y1+rIgFLEZYGVI+uNDJs3neKhWqvKlCmyKwLhPgD/lzxnveZ4Bn1uHIdyoEzMWIP
         YP27LR5nwVEkNyrpSGYy+rAQ76BNDgj5sbafJS8kiDpefHg5EhrTPHush+nX5hqSeniP
         55NWjjucJWXscx++uB//yHSH62TbQU5SqhHLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472589; x=1795077389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1LIqguyGHyugjp6T4wuUZqSXt5F4ivfryPqW2wGYPk=;
        b=MyXSRREQH2zJJeiumtyVCh5zmwkIwpi1ZKP9tQun0dpo0yASwHCyEuLJ2fo8bZVTmT
         YD9A2qk38CwvwTsDO6isdckts1eKSEV1/Qq//nFlLG+g+eoXkBp4UT3m9muLLONIX1su
         wIyqTMXQYVr1hWBbUAbwsByjliq1tcgDEWhH9HoMk0GT25fVyOLM6uigxrH20+POu6qj
         5G4zCLM23LVZ9EihSAHtGbKN++31bCQj5vNKxROIudgXY6AiZomTOk/MpnMfb7Z+8KuV
         9WUjM7iVX+C+huU3h9h1G+pQI+93OVIbTUgOkinh4q5wdId2vmoQdK/eIUBrwpetmgAI
         GzcQ==
X-Forwarded-Encrypted: i=1; AL+hErG4vATUkW+DdmYrJ+W0aDSy9fvhikE+b9KR1r9jtSDCgDfpxMPtV6pBV4TiCvCj+qjVRbWORcbkNtV9UAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Soq71V6ImJMU0hMJSU1UzYsSvVfwipR4R1EFO43VwQU+rrTcv
	zDEcGP9iQBZ+k2mvIMC0NEZY7DfAZQYPJvhQrblcxXCmAlk+gasrd1s3h+Ck8Ji+y/HoTdXE4Bw
	D+rz+og==
X-Gm-Gg: AYBFou04ErhPtZUK7VNIxUG7xCoJcgpNH5cenw3ommbuVHuFYmhii10Z97nFyIKI01V
	Yt/X8yfoChlWD1HEVryYaEKT0SBpPkF1CmU4CYzjFRcd7eZoymaXJCGeCKF9CL9LEUkmFqsQYnr
	4ln1ZTh14tL/q56VdeqU5quTLMOpnIfgoSui6FsqL4P5pMqHGpMTbyXhKbL64TScl1nWuGelxAy
	m4KsNhQ6fi7rdQBhbcEtZ4nr+DVZHiFkzKl+SZN0HUVVqTJ0gx0HcIjXniBsZGtEB9ZwWOHdicn
	/l7MBmj5zxStlL8Mw9Bcobrl8qUT0q4tIAJOQH+BXcsZrvabTrK1b5fSIPN78Jp858L/OJN8M4W
	UDf14iNBPaq5PlcJAsysPTqHCG2SFYV0bFyzuETOM357Azf6ZnlBSwqyXI4C+WAUL+/ZFyhSUYH
	OxeB8bhgoFnD2z5hM3rwBtUqBz8Oerac9n24Qe6kyAMMb9zP909mhZRrDb1PWmRqVMD92qOpycX
	WNiuzPhnRJt+Wj1J04bmByyKK7GvmIlwa1p5K9ITKsSa1u2gyTCGOsNxOTEBkPK9JOG1kvwTR2n
	ged8+S76sPeWUAepF3LMawmszwn4sWK/zpepwT64rKVNGAborLlwDkevkYR76HZjDMg=
X-Received: by 2002:a17:902:e844:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2edd760ca35mr50676555ad.1.1794472589323;
        Thu, 12 Nov 2026 00:36:29 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7eafbsm30026355ad.36.2026.11.12.00.36.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:36:28 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so7341182eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:36:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHPCrOQtIrBLI2En6pxzPhhwCpm3C8s2QLAngov6ylhhhSRqnew6aKOqhPV01hxO0j9D1BCcFTaMHBdt4U=@vger.kernel.org
X-Received: by 2002:a05:7300:fc15:b0:36e:a265:8ee with SMTP id
 5a478bee46e88-37686171585mr5111950eec.18.1794472587019; Thu, 12 Nov 2026
 00:36:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112061736.4014993-1-yidilin@google.com>
In-Reply-To: <20261112061736.4014993-1-yidilin@google.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 12 Nov 2026 16:35:45 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni1r2yWQOntVCJxjU+DkHAVb=gBEE71VN701BxeMCxN+w@mail.gmail.com>
X-Gm-Features: AclHuK-lH1eh8S-718xAEgJiftUumas93CKfUyPQy8uMkB1D_yMS7HqTV46k4yw
Message-ID: <CAC=S1ni1r2yWQOntVCJxjU+DkHAVb=gBEE71VN701BxeMCxN+w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: Wait for the complete AUX reply before
 reading it
To: Yidi Lin <yidilin@google.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 2:17=E2=80=AFPM Yidi Lin <yidilin@google.com> wrote=
:
>
> mtk_dp_aux_wait_for_completion() returns for a read as soon as the RX
> FIFO write pointer is non-zero, i.e. when the first byte of the reply
> has arrived. The rest of the reply is still on the AUX line, so
> mtk_dp_aux_read_rx_fifo() sleeps 500-1000 us before reading each byte
> of an I2C-over-AUX reply and 100-200 us before each byte of a native
> reply. The FIFO is drained this way even for DEFER replies, which carry
> no data.
>
> A 16-byte EDID read therefore takes about 16 ms, although the reply is
> complete within about 300 us of the request.
>
> Wait for the AUX receive-complete (or 400 us timeout) interrupt status
> instead, which the write path already relies on, and drain the RX FIFO
> without delays. Poll every 20 us instead of every 100-500 us.
>
> Reading the 256-byte EDID through the DP AUX DDC adapter drops from 266
> to 6.5 ms on an MT8189 Chromebook, and from 547 to 23 ms on an MT8196
> Chromebook whose panel defers every 16-byte read once. A 16-byte DPCD
> read drops from about 4.7 to 0.5 ms.
>
> Signed-off-by: Yidi Lin <yidilin@google.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 64 ++++++++++++-------------------
>  1 file changed, 25 insertions(+), 39 deletions(-)
>
