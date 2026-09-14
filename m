Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0DF377A85
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426152; cv=pass; b=mZpzbZQTW60nlGvoS8AMevys0rMfXu2TYojq3SOQy4yIXaZcE1uYivaoRyMV4qK2CTyQMdqBi0c4WdoplPC1SPPCBJ+wkM3VCov263iKeKLTOHdGc5etufkQxvh40rDJrIN/35UCJ/3gMg/6UUD5gdyyeEG3NyrA9FOtTd5Mo2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426152; c=relaxed/simple;
	bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nd4M06M92mvWFHM+axTw+WOSi6lL9Z+a7xtEYKd7R4gBt6Qh8cc4mJZPf3g8CX+7BCCbX9QvXKQhmISZOdikSNMJLLvKVTL0jiK3mNi0TwEBY2UDCgTqJFk/p1iFMHgT5DxtYX+bFCVNU6P4GaJ3w8wTm0QFlAAk2fz0dzSXCy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyPsWtY+; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyPsWtY+"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c84060045aso1692147e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789426150; cv=none;
        d=google.com; s=arc-20260327;
        b=No3R+iiaJmBQTfgKrhIR4oAWg8qRwxqmdnrVB4bPRaa7P0oBWxG7ox7Rm5ldDW0n8/
         0BpJ0XtttsXOQ9Ox6I3Y57Om3+iVt6F808S9QFdKl3HVgmu+ctHf8yU0xl2L74itRZX+
         3c9/MyyDTxp9LP65pkutXty7kNwKa+dQN8XtCxSwYIAHY4kg33/Z2RX5rDrRYQFYsTc9
         1Uo1ovTtWIdJBlYIHcLkzpO25pPmEdVzmVgT6vu6OVS/Ncjn3y3owV1XB5CJ602OCLgJ
         D30bnD8OYBQutYEA+BtPvsrzFysM6PNMuC9Mt6Mtfwq2xltPmIdZc1769JFvQO9UJBKj
         UVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        fh=HN0+20NPzeHuODKkowPIbeLq2PBosHlLPDFkOfrnudY=;
        b=VXMGzQOXq5YMSwVXl0Q3t4vmC5146G4PRNTcnsXcvawgW76ai7qDT/k2y6wBsc+lGG
         Hgbw7sZMdWoxlntNfpp1RH1LxRpmCJHNML0vy3VCfkSfd3mCkmB3JUePEaNMzSWX1Yfi
         UElzwxqYRzzMNK5ophmuWJgfdfsCDOfgLhSVADt95f0RM2OZ3D2aWAWmSqg7NljYheSM
         6HGZxHxCwWkxhDeo08MU2EDaDi7oPlAShZj5N7fJrhicOUMo/av09U43sVadX8yFMTP+
         q5qVUSzy2ySIRx/g/qNDnXMEEyMgRQXkB1vZb7MtL6P70gpGfufFYrqjfbCJy6Yht4BQ
         xkrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426150; x=1790030950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=oyPsWtY+1hS3t8V8z9RpnsZRLnxIV9qtcOHvrQbtUBmUMe7f1xz7MLjUN7a8o16jRY
         3bFyo4+PDeK/3L22Gn/aetbXQINkdcsE5fMW9ON73sFbQmENKaMxjaDPxfkbHSa8WnD0
         UPYsY+oJ4CSzzmudPYyramALSGrPll0WxysYDnleDKRu18YfpTonHcUntjCrhi+fknM1
         S4n4lPai/yV6NoSARkvrE9YnKt3eJZHt7DeqLTksX8yPG/kGzAKKDTL8suIyPKB9SQSz
         hrnNO477Kld+wk16uJCB5UJzPr2hi+eqKjWGZ+eom9oZs0kaojNuC8rPYBiV6WD61dl3
         fVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426150; x=1790030950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gb8DWQjrs9f+P3wLgZ+RgMWcDCFnHm5XHmUmq+Bd4U8=;
        b=Oz+JCH+S2d1yrbc27UZBbtRkAZgVi3WttyMTyeYtldWYajyhitF0Gs6lxirMx9+ShN
         PJ4mAbBK22NrlDWShEjLXqzCJi9m2nzTieKeKUV2oaewvLjzU+1YD8H1GtkjVSytIIM3
         CTYGYN3CaAf7/URDAqO31n74ga1k1D52hZfrj4gWfRpTlcMlf06m5gYJn7HO3dHvHyUP
         GzGcEn2b3wCarTetLPJfgRxKbllG3oddLKWmtnxnogoWsL3vkBcg8Bg67ZLijA/EYq2I
         B3HqqQ5QctmmqkydgQyIJ613qwPuNyK1gg4S38GeAzORH9NLZrAVU5EvSKwZ0Fp61ZqG
         yz/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwAOz2jFwuHxiIv5slQe17OuoQFOFlWYx6R/BCnsaXExrhY2MQqb9ATNmx7v180zB9e+3vBmIyPGgw6aOw=@vger.kernel.org
X-Gm-Message-State: AFuF++kFIBHLzXE0pWDtdCHhx8E9uisynX3LkqMNU9hBmW6JMKfGjv8w
	eoOzgwcd1Gr1Lzl6TfxpNWPWGY7USLjlfPu1DJ4RNLeUzUc5BI7NzNp1ZTjrEnJcikbnrqjTlsN
	tI1bA+6p/PuotbZm40b4cQI4tWsPztpk=
X-Gm-Gg: AYBFou3uPssPXVWErhL6Kr6CYizPy/LjD7igCEk3lb5n5SzP5Q0OmhcG2cKbDWFX0SI
	r3Mpro+RlcsP1qSYTMohZs3/3PIQerwNEyygaSWSsWEz7vO31yOoQTorWhmiyB8K+gmZlmQ1cyU
	9z7MBHnlRmtl7Of46bzw//wD6ETkGwYIUPuhuvZ6als7XiLJnJd3phsup1TDS/aZc8eTqAE3QiA
	kL1DRnh3kSV9/J57ybs4CDLlnPJWVG1305LP13F9DT75OhrT1CvXs2hUc/Clf0o/HPftIQ9uy2N
	i7zKnXOoHe5A4Lxksj9P+ox2P9r4CWb9GCh3YOVzUq4bceTiZNobFOH63Tp8ZyenTR8uplBfGg3
	r+B2lstCkrdVDDl7f3VqZAW0wQhIVbP1R+AcK3e2DV3obgkM/MORXYntRGfuBU9fiIVvJoX30C9
	TH/HNJcKIKL/m386K0cPcFzZfNP7tRiTSBZ2Y1ZJUl1Q/FDuqE
X-Received: by 2002:a05:6102:4492:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-79b60973580mr409096137.12.1789426149941; Mon, 14 Sep 2026
 15:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
 <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-2-b12074f4aca7@gmail.com> <87ik4fu4fh.fsf@bootlin.com>
In-Reply-To: <87ik4fu4fh.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 16:48:58 -0600
X-Gm-Features: AcwNN1UlC9FxjgijfoClAvZzNG8RBzvUoNkXu_nF9VDV4LFTu4fZlyRKfp3tTWs
Message-ID: <CADvTj4pH8KvTmsxOXO8JQYCQmKf2OA__eqvYXrM+1=vjq0368Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: support randomized OOB formats
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 9:51=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> Hi James,
>
> On 04/09/2026 at 15:22:12 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > The controller randomizer covers the bad block marker along with the
> > rest of the OOB data. The driver currently compensates the marker bytes
> > before writes and after reads so that they remain plain on flash.
> >
> > Allwinner NAND firmware instead stores the marker through the
> > randomizer. Media using that format appears to contain bad blocks unles=
s
> > the randomizer is enabled while reading the marker.
> >
> > Honor the allwinner,randomized-oob property by marking the NAND as
> > requiring scrambling during normal hardware-ECC transfers and leaving
> > the marker in the randomizer data stream. Keep the existing plain marke=
r
> > behavior when the property is absent. Reject the property with software
> > or disabled ECC because those paths do not operate the controller
> > randomizer.
> >
> > MTD_OPS_RAW behavior remains unchanged: raw accesses bypass both ECC an=
d
> > randomization and expose the physical representation. The raw-NAND
> > core's bad-block and flash-BBT paths use decoded accesses and therefore
> > continue through the hardware-ECC/randomizer path.
> >
> > This changes marker handling on all supported controllers; the H6/H616
> > protected user-data placement is handled separately.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I believe it is still not completely working. If you look at the error
> path in the read functions, in case we face a factory bad block, there
> will be no data, we will face the "page is maybe empty" case where we
> still address columns like before. Since data is randomized with these
> accesses, I believe we would return errors which will not be interpreted
> correctly by the core. The discovery of the factory bad block markers is
> thus broken during BBT scan. But a BBT read is also broken, because even
> if errors are ignored, we perform pattern matching on data which is, if
> my understanding of your implementation is correct, not de-randomized in
> this case.

The erased-page fallback could overwrite the decoded buffers with
physical randomized bytes before the core inspected the bad-block
marker or BBT signature.

In v6 [1], both PIO and DMA preserve the main data and protected OOB
from the original hardware read in randomized-OOB mode, including on
uncorrectable ECC errors.

Erased-page classification uses the controller-specific vendor
spare-byte heuristic without a raw reread. Accepted erased pages
return all-0xff data and OOB; all-zero physical pages instead retain
a bad marker and an ECC failure. Other uncorrectable reads retain
the decoded buffers and report failures through the ECC statistics,
so the core can inspect the marker and BBT pattern.

I verified this on H616 using the actual NAND-core BBM and BBT paths
through PIO, DMA and forced split-DMA reads. Signature searches
retained the decoded pattern despite ECC errors, while table loading
rejected an uncorrectable primary and successfully loaded its clean
mirror. Correctable protected-OOB cases and BBT creation/update also
passed. Hardware validation is limited to H616.

MTD_OPS_RAW remains physical, and the existing plain-marker
erased-page check is unchanged apart from the prerequisite
error-handling fixes.

The series grew because this work exposed existing bugs in the shared
PIO/DMA paths: error propagation and cleanup, IRQ/completion ordering,
OOB indexing and program-command handling. Those fixes also apply
without the new property, so they are split from the format support.
The final patches are separate optimizations.

[1] https://patch.msgid.link/20260914-submit-sunxi-nand-vendor-oob-layout-v=
1-v6-0-2fb084fe0751@gmail.com

>
> Thanks,
> Miqu=C3=A8l
