Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793230701;
	b=A8w7g930/mZOi08ZepT2SWNrRTnjqkc+nF0abl978ixzP0Cp0pZCzZ01qykOFDTDYHbU
	 NdtjKOg6BGE9xVIAVtEIWt0af7Fsa2YxKrWg4ttQmR50UJvJJnQKneCP60Am6JK7ULr9v
	 xsONB6o/yUJ5Npnm2Hw0tDdWUyiGqJNdPF/QjS0b1361J3IMd/XwRXQPkDoh3REkZCa8o
	 nonydhNJBiHpcV3kR1RYLyPOWZHfAjFgsdedhTXcvdQJEpJGfp5vkJkPbRfZsIvPp9kbp
	 ipWmCjVnPCngVnm9G5k58TotqPrV4s6tSB4PKsvZadqaW2/e8La9c/j7Q+E86RidPRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793230701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
	b=TzUDpb8Tti/7zQsEd9HXMMs3g942HbBCTL0Xvkb4fJEeePyOYtUmYM7jtqFOp3wnCdqk
	 1IIwyUwU3KfIVHIeIGGGHV3l5N7aPZTZC6ykikcaw2WwvQ0l0hv3672sHbL1Ic16KuRXI
	 beXPt0pSKDyyLdp33YhLBI/E5AbhroRL21pLaIcrgrx21qOqrVC4a+L4AbIa7ZaiHY3Ge
	 1hO6IGR3FjbIzC7WVOcX/BQJ5Dc9pH2ojhKwet9bUziExqqGMGcpJh6P4fS5o2JPcJrRU
	 84Sh0EEwId0KU5SC6E7qD/eDibsxBJQVv8xBqXVdBpuR17io8e40xPuGetqrWZsZlqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EFE606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76EFE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac4806e210so13841247b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793230691; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhaVCOyYrFjJ4r814ZKzVgSIWv8mRR50obulcMUC65opJTv+f34DCGjwlKEbUdWfX5
         pVadw629TM/W9ZBJecVqdIC+Yukb4j+LHsLMwnt/Z/gioqX/Wq1OR0hSzzPhLnEeNNAt
         6z0x5FOTT9P7f2OWbcDaGBYhVDjHd3iyWSsReLTR0ASqy/jZj6rzaGTKF1V/Fse1B5+R
         Ke41mc5Hvo1ektje7pk8bUdRcAa5+37vLAAQbapdYbnBXggBqSMA3bKR5hDFyKBDucH/
         eayGv3OlHS7/T+X84XXpkXRd1au9gWzM1l1cEEWKX/OX8AbYzTQ4S2rfdJxczENNDgRs
         sEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        fh=TWR5Ua37XScjxPX+iD3jIOJQ5U0b3b8Rc27nBk7Zs6w=;
        b=MxAbljWeqXm69YRZjTLWgC6o2DZFDE+AsN8JNAI7RVoDzYcl1s/L69+XDGXgHtEUF7
         gDKRAxNLfOPdLuTZkl/JV/dImkwG5BLyaoiLpBCapobjbQoiapS3j4eQVnOAXbHcanhv
         Xh+0j25zHjHzlEUBEu6Wy7BqqJimsZiZsT9EyX0fD7iQ2faGnV/ECMLiPOK0X3jiqY3c
         Alm8biJY1070lP3UAE37bx3K1kxgF0LWVaj65msw8iImhgnvSPrds20CmKHtTTSAkyNs
         PMNQGKiSLJw0yB2mxHfJkTgiick8VyPD+FR301sl/GFpf1M8xbMzbBuRQ5EDykW5QVMr
         AidA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1793230691; x=1793835491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        b=EybuO5PsCdtZBlXFtNBHcCMOqDiSJOQzE2/e1eChgMMX/p4gC2s5ERF/SekqQcwU5L
         8MMrtOnx6JSto1t4eCs748AzQuyxhXk8Hyb88kcp/ZOqiC6IZAClqDr+aZUuTyYmBpIK
         +BqhUm/rE5atw0n9GMRFHQBEeK4PSSUg9FQ8EgAIfJZ/DKnu5+faT4XO/j8ZC1Jrv+cs
         05xFinPkiI0uY0HNn19PXHVVv8C/b28LU2X0T6OwtYtai1zrsLX351sdJtoFYEs2cS9m
         3WKqyoXpz6dSRoGXWuSX9yJ3Xk1gDi43U41lPFA4osGc8Yfz1zmczSbmnPy+bWot3VTt
         iWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793230691; x=1793835491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwnJftUwj+AATA9qklYrAxD78ahkF2IuNib+vGAuNWk=;
        b=nY+HofqA3Zguln5k7D6MlvyJWbWTpDLWuh6NUMvUBVjbzvIhhLStGvC9nhCSH7b/lZ
         DxK86ut8KrxxtbmbRteKeMQL8mER+htBwt9jvWWgKEKgtFQutEuj92hAcsJ2CSlm8gYG
         RBCpYfjeEzT/VNKB32YWqEIv+Le9vx2+y+aAuxzyVIepHj72GjLEbDUaXmss7Hm7kU51
         jN1Uhg/6P2BSZmt6jj2kokWO1Idmq+O0vDM4c3okuoCEOfolDR73zaOS2ir1YyJkbq5q
         zfhFNx/JVqttjmhHtGbPONuJY2TLPKVR1a/+vh1aF8t/0/CYIr2kRc8g+qOzAdpu004G
         Jb/A==
X-Forwarded-Encrypted: i=1; AKwUvBwShLmI5vLwUeHtv0opY9eK0/S3nK/jWbXWcxu0B3v/jQrZ60pG5QJ7Vj6rEL2RMPymZmEIoAOrrVxvfQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0MiEZV3IAmm/vq8izOPcpPEh+WNTYpK56UDMx7fvVnQdz2HVQ
	1qy3RkvN9x6D9nfPOL03JvqhsTD6ti++5glE5UM2IBl3jDpKbcmEA6SwR/uCLA7hG84E/GAQoJA
	WGcRRYlg1KE1X9tIcwUOhv97eDxvmGElu8CXTNCYE3w==
X-Gm-Gg: AYBFou1DLass1UsJ+1JaG+O+RsspMJiTlWBEsJ/n0Z7gNC0LfwrICLNFk3wC9cVVgMy
	8u6Y+7Pjr9y46/My+4PqREXK/cJN3qq4BAY8+4HtBdzwWm5ACJJrPyMa/9vpQS1kM8lPqxYLOzt
	ePTe7KkXmnUS8WkGQm4DirduftCz5mEa9BqILSJCoQ3qxbNCuq1YuyMtWToNeoRao/FSZUeoNqh
	UZ4TnQzBYBJ1lMZWVVGnUNeGv50CHISJ1BwUeP0mVCDISmSmH0HQWa/7Ad/R7zn2gk8XtE48YW0
	sLmGquqy0SFb5HQ9iqQm7kilCJaB2OB8RrIAAuV8jObUUSRRpUz7ckDkH5oS0iM05aCFWUyEidI
	0gN7mseoLPIFFQkIezo/mxM6YNJ8hNlXhYWmR7cwvspbBE8GmrxgLeY8M+p2fYXSD8seo7O5diP
	EB4ikpS7MPtp3a+vmuqpkEkbV3/IB39i16+wgovU5j1wksqE3HwNgs660=
X-Received: by 2002:a05:690c:38b:b0:8ab:37e5:6678 with SMTP id
 00721157ae682-8b1b5d394a6mr28742787b3.44.1793230691387; Wed, 28 Oct 2026
 16:38:11 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com> <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
 <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com> <auIR2GFWZHUP5vzs@SMW015318>
In-Reply-To: <auIR2GFWZHUP5vzs@SMW015318>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Wed, 28 Oct 2026 16:38:00 -0700
X-Gm-Features: AclHuK-LKjsKCaobPjRchQyPcT15lMhGBWVE2x98cOvF9GEVC10J-zU2k9Et8_w
Message-ID: <CAHnw2UkoFcTHs7nXBBFVEZpyf8BCTs9tpkSmj5RXCsSoaQmK4w@mail.gmail.com>
Subject: Re: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, 
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Suraj Gupta <suraj.gupta2@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Alex Bereza <alex@bereza.email>, Folker Schwesinger <dev@folker-schwesinger.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That makes sense. Given the cause is likely a hardware fault, and
that a timeout is generally a sufficient and common recovery, I'll
drop patch 4 from the series in v2.

On Wed, Oct 28, 2026 at 8:16=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Oct 27, 2026 at 01:36:27PM -0700, Jeff C. Jensen wrote:
> > In theory. I haven't seen a reset time out on our hardware. Every faile=
d
> > reset in my testing was injected with fail_function, as the cover lette=
r
> > notes.
> >
> > PG021 describes the soft reset as graceful: "Pending commands/transfers
> > are flushed or completed", and the Reset bit reads 1 while the reset is
> > in progress. My reading is that a transfer that must complete needs the
> > memory side to respond, so a stalled interconnect or memory port would
> > keep the reset in progress. The driver already allows for that, since
> > xilinx_dma_reset() polls the Reset bit with a timeout and returns an
> > error. It just doesn't act on the error: xilinx_dma_terminate_all()
> > frees the descriptors and returns 0 regardless, so if the engine is
> > still fetching, the next transaction reuses segments the engine owns.
> >
> > Patch 4 may be more than this series should carry as a fix. One option
> > is to drop it from the series and post it with patch 5 as a two-patch
> > RFC, scoping failed resets out of this series.
>
> Yes, reset timeout is most likely Triple fault. If timeout happen, most
> likely hardware fault and can't recover at all.
>
> We generally choose timeout value is much bigger than enough.
>
> Frank
>
> >
> > -Jeff
> >
> > On Tue, Oct 27, 2026 at 12:22=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> > > > When xilinx_dma_chan_reset() times out, all the driver knows is tha=
t it
> > >
> > > Does this real happen? or just in theory
> > >
> > > Frank
> > >
