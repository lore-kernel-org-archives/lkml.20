Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793364639;
	b=D3fcMkgKrOAFJ4H4pF4DBLx1M2tD3OVgMb9okMm9+K+Sad3NdkFgc4w0By0Lc9+uDoXS
	 MIoWI4hwNi3HK32JaubCL66hjEvcLadSu28EwlTkRlVu0bTSV5HEPQ4d7IxvLi7cHDUPS
	 7Rwn5aht+hz2bNzEGtCJgy9vfdsUrq2YdCnGUHGlkI/6ZP7w/BuvWixHLHqutxVq++ByU
	 TurtOBlt/0haJWmic1t9IapG9ysUa0gnGogj32cDspZZZF258MKka+De5yLxz0ilyFJdw
	 Jgg0RIP5BeGQWWVUKj4j9vJPwQSzEDlwHWLBFa560Re4Q7C1z0DArPumvPg0g20gGSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
	b=ldNstwqWqCRyQSjaD4xEJqEFzhUAuHu1FIdgfpnvHFaM/V/Ve1CnZSN3Ns6iB03NHvNu
	 HyZ7DySf2gdcDrq+z6M2zmC+vb0Hai5QDcVsbjpKxPLkyL1oi+ZSeXZpBNbv8z9eMSd6D
	 6W0gKA4CntcFMZxdB0N1wzIxip9ezn0xL/u3yVpcHXw0qrCfHp1MLjazeH5rQ+y8+7sTA
	 VA4FCh9NDVWkjXnzRhFRm/l1HK2J4BWEpSxdO7ylo7n3t+2oy7Lp+dB6fssgokZdY6uI4
	 kj5ycw3Fvu1kkH18UyUZNfPWKAl2a9unPUwHNG71mTL3PuATd2IuH9uY4OUHNZC03qA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CswuN4e4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C4760A2624
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C4760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CswuN4e4
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afa651700eso900724a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793364636; cv=none;
        d=google.com; s=arc-20260327;
        b=WWvctMXoR2G1FI9WK4ggAGB8ExWDZzuMVDybiVRTGY28E5kJvJLcCdyAzHsT0hexNI
         Ezezmmr4RJvjCCjJU5Nv/zTcEDjfZP1OCiWIgvKZQ5I6bgb2gjufF0GRkqeLTXoVIhoh
         aqwJ8CRypLHc9zmtoyAx8d/2d3miqBL1gcOAbkHlIgQvi7MsXE39om5FvU2tYvOtK86p
         0zPEGCYsxcpahYslCQAlub1POyqMuhhXHJzOhWVtMG+LnvjinMGB4EettCJBWzQFBvUq
         MYJCYe8JPq3sF+kLznxfIKbKusgHdtfNqA52x9pIAYluvI82bXkWFUExVrg6B/EZyEH3
         WVLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        fh=tvwG+DHRiGoGX2iwpmmJRcGPux4rD9LPNTKZe7Xxz/o=;
        b=YWgrNy6aV6jjWz+ltuz45XdHHGzvdif6RbLzOYAdRUvnBZBIk0r7Za5/BUxfN69+fL
         wfH+H3YLQW/tlnwCofZdx7OPN9bNBA8jSR6EW9Vk/ThGDbZ6FOSKTprZVV4wJbscykeL
         5MOG2niPnX59VCWQoPbOl4HcqfypZ5AFmf+F4BNEtWnM8QqGO/f7G0G4vObxiO6hyWGp
         EbG0nMpW/3HNNMlWHyrPMD2Khk4DcsoSjvBaPrVnF41k+EeQRxpiOZ9w3VZbgPuLJmst
         RM5pjFjbcdmfS/6+vERum9r2tzCI5sanJC+9ifnkGXV941ApdbQfY1t3WcbSL1Jl4ztt
         KJVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793364636; x=1793969436; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        b=CswuN4e4SFhY65NI69nl0lKvSPx7/6/t+bfGIiMz6r7+Ht1mJaNA0sot1+MowGI1K0
         f0OXoZcyZlsSF4f+3xZTO/IuR6bFuNrCZa2OCCgDu2eoZ9D8khmOtRCgZ0Wp+bZTXThE
         C4Td8iq7wAYo5YfYC4XsMDwP/X/O9TLiduZmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364636; x=1793969436;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=upMUJ0fHbuWdbhcc58kgwG4xc/y/+j+lYCouryGC2jg=;
        b=kPKorBHfMUtWgcXXCloMKAYVslM9IgfMNYNEVOlhW7/cneDhm4HT6ghkZ7/kcKQUaK
         mB378WYBdVG7frz1CSDnCbLzKCFHsak3rv/R1qAVmlXDAECJHuJktPGntgo6Sa/En/Sv
         CfjWBzgkcGcHxasKCQ9AJK8WTD3E1atbXKKLxXzc2w0zpz0Tffr2POtIK7ekiNBLOjMW
         GGlCZvGR/G0TKLulc/VWT87KZZELn1LfXmMO0884J+MDIpauUqpaGWatu1Comu7KVtWw
         zArS8Ibf9AbyRFlt0PBrcyywOZ2eMmAWgY79tTNN9hb+FdqA/eL9rbRG/ZdiTJtEYhbp
         f0rA==
X-Forwarded-Encrypted: i=1; AKwUvBx2kLx/3WrtnIYk/EKEndBwDQoW/DFrN7rWUjaNtu4+5RoF0tq9VXcvVTCFteFuPOBnuPAUBgCfTbxZXoo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKV11XO3oz679r7XIYb67S0rMTanAa6sWdAic8ImYJza3A6Kskt
	SPuK8EQdF89rDsXGYoeYBAv0dj3y8prpCvmAHETqR+2ohUnsbxW7hi6ZY9ALwb9YUAh/Ilvf2O7
	IfpBr5vnj+xsc/tA+Nztt/TClNkxZ1tHzPl+oIpFV
X-Gm-Gg: AYBFou2iVLJiUha37L7TebUOm5Lbg9YrSoCU2TTxElBqEbJ1ZGG/RLaUOrDTVTOAnbW
	JIZQLnt8Roz89IoMWNhBjHdgTU5MMj9kSa+kMIdYKDiNoAs5BJTMetpaPW2nQ2i56n3ujzR4Yk2
	5my3AH66f7JR5ZTloTekclmQDKdNW7pRCcSXPxDOZiTd5XBSxCrFGGlt3uz2YVofyU2yRqBEAbe
	DFkIw+ryP6ZXjVpdqmWHcjEpZ4wQQ5qgbuQxOq0BuaePcFsv3eS3wVP+BsIFSBahoznd3t4C2ve
	2KRUR48uP6IA3MxS14jjU1nJ7UZaEv+RtRm6s0iMmY3ZOlCSLXEyWnCHseb0t8S2T/t7H6z4jSG
	MwRdqAU5y9T3vI6g1Q8zeR+F9h2DhD7DRMM7HDjwC5Kf68wQnbY191f1N2EYPrjJXIt4kR6co
X-Received: by 2002:a05:6402:c4d5:20b0:6aa:a040:cbd3 with SMTP id
 4fb4d7f45d1cf-6b4d337d51cmr1265781a12.3.1793364636473; Fri, 30 Oct 2026
 05:50:36 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Oct 2026 05:50:35 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Oct 2026 01:16:42 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261028215600.1713475-10-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org> <20261028215600.1713475-10-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Oct 2026 05:50:34 -0700
X-Gm-Features: AclHuK8Q6LSStP9w_jyKcuIwAnO4J0Fv84SaEEt_21aYQDW37VQYsqL6XDDTA-w
Message-ID: <CAFLszTgS0Bp9KncngS7Nw7A5dXroXywiDkoHfUtWpCEexecqPQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] fdtfactor: Support compressed DTB inputs and outputs
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Devicetree@vger.kernel.org, Simon Glass <sjg@chromium.org>, 
	David Gibson <david@gibson.dropbear.id.au>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-28T21:46:49, Douglas Anderson <dianders@chromium.org> wrote:
> fdtfactor: Support compressed DTB inputs and outputs
>
> Firmware and FIT image build pipelines frequently store device tree
> blobs compressed with LZ4, LZMA/XZ, or gzip (e.g., `.dtb.lz4`).
>
> Extend `fdtfactor` to detect compressed input blobs by magic bytes or
> file extension, transparently decompress them before factoring, and
> compress the resulting `.dtbo` and `base.dtb` outputs when appropriate:
>
> - Support `.lz4` (including legacy `-l` frames via the `lz4` CLI),
>   `.lzma`/`.xz` (via Python's `lzma` module, using `CHECK_CRC32` for XZ
>   compatibility with kernel/bootloader decompressors), and `.gz` (via
>   Python's `gzip` module).
> - Preserve the input compression format on generated `.dtbo` files and
>   compress `base.dtb` according to `--base-compression` (which defaults
>   to `auto`, auto-detecting from `--base-dtb`'s filename extension such
>   as `-b base.dtb.lz4`).
> - Report compressed size savings alongside uncompressed savings when
>   `-s`/`--stats` is specified.
>
> On the 47 Qualcomm SC7180 Trogdor Chromebook `.dtb.lz4` files,
> `fdtfactor -S` reduces total LZ4-compressed size from 1.71 MB to 213 KB
> (87.5% savings).
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  README.md            |  17 ++-
>  fdtfactor            | 312 +++++++++++++++++++++++++++++++++++++++++++++++----
>  tests/Makefile.tests |   5 +-
>  tests/run_tests.sh   |  77 ++++++++++++-
>  4 files changed, 379 insertions(+), 32 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
