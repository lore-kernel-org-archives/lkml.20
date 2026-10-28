Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207310;
	b=GpHI4oRvu6nrkzzOEiU0oiODOkuA3gRXzX350MijypcpUDtFsfsHSpEa+iCFTnfUODuB
	 U9kidZjirXLXhf369fvJ9wdGTwxmChg2DJscOl+URgpOajWz6KV8c9AAqjc8HBS9/DaN9
	 rTEuMLtGjddmYodE6fJUew8AKVykCY6UUWQMhdOJbup6644UywEJjeM7vMHnbKU33f/6x
	 nqDAIQtS/bz0x7D3zCiT3k3sVxrGxUmtf58fi1cjxFo0uYUExN32nDNRbQb+EayC3Uatg
	 umsSR6JVU+L8kKG6nlsdUuEhDvZee/TdyzH6MjQKTtjRUj/HVdGDpTkELMLWM0+9t+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZC8KY/zVt/3XvTsa+avKtgzZjJJCkMC+z6b2LaJLjVU=;
	b=vLqIrfhmesuk+xthLEYFH/d+XH9zKwpss6OzYHDuYwRrw/tXFWJnjXg1N0kxl7aWgJUp
	 XTu+y1g7ZnF93t+jdqZyH//4DqfnXRrCn+5lZcE0NV76rQb8lRRE11XF+seA2GlgRxxYl
	 NfVHt73qLsrQp5zM2zTb1V7EoQgZzbEDKZEWF+OmFuDsYUzrNsnzRS7t/LS8h20HQzRHo
	 lyWirjrkb/WIoR3NgoV/ONLK53ViljCn1QJSj8lXUBac4wbW2fWCG6Ru75Sj02tPIbEQR
	 /g9q7Q4w7QMerNcIYKYkHocQRUeVJ1/mLoAWGkOGhAmIJiDiI9wSksIJoOSB8ZZGW/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcAj1j9h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6AD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C6AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XcAj1j9h
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4682977f9aso157446266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207309; cv=none;
        d=google.com; s=arc-20260327;
        b=ShDn5ibT9MFvYfgC2ioqV7X0yz1k6v6acytYzQr8h20/VEK0MSYWGbjNrmjOSZiFqh
         5zoJt4zam7YR8XNEmfeAkyI7nUOzKlinUDTDBnvRCGQgEdQNF2ARks4Khk6eq+ySeYgm
         WlPA+9gUoau+kxySu3VOLhiqHxVq0CM4PoTQa1ZG95KhUywgFdPA8i/49Jqzhww3Sj2b
         BhIF/gx7vbIIkGvvH5lOwM56J5fHzI1DjL0YUx2uO4wDLVb8ezrW2rlWH9TZe+N+8hv4
         z2M6iZgFzzRVZiGJKw3Qel/CIdAJPI8u4UieKnFnqsknHj1uo49dXb6mwkKiRlfOG4xl
         o2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZC8KY/zVt/3XvTsa+avKtgzZjJJCkMC+z6b2LaJLjVU=;
        fh=drcUEhGGXCEAuwj/vrDiqYL2uIT+sv+dTiS5KGgERw0=;
        b=qWveh9FlMcC5Fx86R6DY7/PGwHTgrccRRNVdpbJTJ3U1bbX3h8iknZhMrRhO0CSsSE
         JKpVjp0PJebRck3WB4CLUtZAsKKalnG28Oxa1/Gqghh6jilcgbT8eHF1c5a9fXUiB0HR
         O5ryItV7OAcaLyKHiQk8ITrxBwcWJt5ruYaqQabF8yiZzZ0r4LZBLJwNpQeTAX4YhRpe
         OIzdnxdBsIeTFDXdEbdCIokmEhT199h8DfmliH7Rp2JQwsynoQYnkKiR+yLu45I8Bvrw
         ig9V+heWS0K9UXrLfndNJT+e06Cyl+WhTnvN8/swSc0z7QovLu3/TOZkdHpDKcrcBH1l
         TTHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207309; x=1793812109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZC8KY/zVt/3XvTsa+avKtgzZjJJCkMC+z6b2LaJLjVU=;
        b=XcAj1j9hpN8HsHCgNOirja2B19VT5SlGB4hhlcj3IC6RZB9nnGdILhB69EzMj6HPzc
         uQG93WGLIAdoFML+WqWKo2V1fGB4iros8BptTbhUIoMEqfNP2aeAeCH0PbZAvgy/jGDN
         lfGtB+buzR68az+Eegc6wWz/4+UgbjtaUA8jZapBMIt4qAzR59bOSJ4P0iHbkwl3XD9q
         VPVP7jERB3rsdNrF4Z5Myw90tHNkC72S1MGa1u8G29e/Mr0zV0ZGzRx8IxlyeOZOTc16
         oK4hdEFN0L1Xqb5MZrJfQi4JqAkmgzvJvbCdtWBVjTWNuCLVSB/Md/GWbTTTdjYrpYPP
         HP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207309; x=1793812109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZC8KY/zVt/3XvTsa+avKtgzZjJJCkMC+z6b2LaJLjVU=;
        b=1tmkoeoQ480J5/t1MZ3baaUyb0BYGXltGZ6c/HMCzpoNBL8qbxkyuL5U4cOwCa7BRS
         2iwEyv/YSRU5oGtAyqFBOohM2Q8UBALPL/T865Tt5Xi2oCF3pqKEyxtBgFimSuV0pQ9y
         Cne06a315uuVRre0LWrzaLcz6HfWgu0S+Ya0u27zflXOBeizeQVqdwpVtiqRbijmN1PD
         wI4/XStRvg7aTYq2nzN6wMnA+hvBzPKwvfSYHo4ETrQzB3PsXpg+qvyMK6D9n80MNfur
         ZJz+ZEDdLilwQ2Hf588Gvd/B8wv+PUAbE/zt3YTqMDU7oAbPn+UErhT2uCstedJOmhd0
         WeQw==
X-Forwarded-Encrypted: i=1; AKwUvBzCIn1R1vMGCMuj6Sgb6x703aiTwJQgSZv5y/4dSIAzRGjiRKgq2ZAeJX02togKYJv84/1hMxVfaTOv1XM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpXd5rg1EBU7x/a27VxEu/6Nd+wSO0OYRqYY2M1V5ztAZ2qcqf
	cotX6ghyppi/pPq6Lu9Jq2qpkYAYbN0SxtzSCjEQu5OGKn35438EolDXjKzdU0TaFgfe94dweyH
	dctXkZrHIYWosWnQY7Uf6uywk0U1jnuw=
X-Gm-Gg: AYBFou09e/OOp6aPLVbGuiiOe0SBWNW9e/7E4WRgJh6BiJ0JfYzgavJgMYeSDwThY63
	vftLENvn7PPYLkMm0pX1wCRpm7/cVrSHS7vl3+4QoTBjfJZP180pENz+gEqRuzlwthQQ3zf1slm
	Qf50gJO89UgDGspDgGkiDPldaUoquKFoS0mpIPiXOXFjrh45yuwpidLbznEwMttU1j2pwbM8a9P
	1MVcFiqW3uL8FSzso/c/V/UNI5mhU1K4S4zrpjpkBRTEESNK7kWedSZTqUuGN8TeVZaOXxoPG5J
	5H/k6HDWvAJHNlqhRYnrsjBOnntiP2D/7q2cfEiP3UWGQxwJ0rCRvy2cltBcqzWa9ND/lEJcNvp
	F/NLfyBXU/gteFzEzdZbLC8GWtGem6nW4OeyI
X-Received: by 2002:a17:907:3e8d:b0:c3e:d2c7:c530 with SMTP id
 a640c23a62f3a-c49bdedfbe1mr261186066b.12.1793207308831; Wed, 28 Oct 2026
 10:08:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016141208.2641974-1-e.velu@criteo.com> <atJXYHJa4jkUWJmP@kbusch-mbp>
 <CAL2Jzuz1qFwLSA=iivp5qLCTL6-4rvKmvFzJbOQzjPu6j_7Y2A@mail.gmail.com>
 <atJeazM_rJ0uj3vt@kbusch-mbp> <CAL2Jzux8v6zCxfcdd=MY5n0zQMVSa-_8Lki9z-fz7bFShNf7vw@mail.gmail.com>
 <atJk_2FmzjUZYO_Z@kbusch-mbp> <f665dc3e-fc5c-4352-8e41-a46b7ae97946@criteo.com>
 <CAL2JzuwuZp0gg1D7wSn7cdgpnhotnuLP6YpPd-SrdVyqhkeiJw@mail.gmail.com>
 <atqZmctbU0siYmVX@kbusch-mbp> <7fec6534-9e57-4041-8699-72c5950c7e2a@criteo.com>
 <auId5RuBhMFGirJ1@kbusch-mbp>
In-Reply-To: <auId5RuBhMFGirJ1@kbusch-mbp>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Wed, 28 Oct 2026 18:08:17 +0100
X-Gm-Features: AclHuK-5_1Gilc9_SLXAMsAbWyhTvmhD9biFKJhmkVB59sXOJbXXsUsXwUEcFRA
Message-ID: <CAL2JzuzMo3xTMbF6LK97yf6-CB0_NGhr7sGpf69Gv3ONvZQ1KQ@mail.gmail.com>
Subject: Re: [PATCH] nvme: honor the volatile write cache enable state
To: Keith Busch <kbusch@kernel.org>
Cc: Erwan Velu <e.velu@criteo.com>, linux-nvme@lists.infradead.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 28 oct. 2026 =C3=A0 17:08, Keith Busch <kbusch@kernel.org> a =C3=A9=
crit :
[...]
> > Considering the performance impact for these type of device,s would you=
 be
> > open to a backport to stable once merged ?
>
> Not sure when a performance improvement is stable worthy. I'm more
> concerned that doing this is going to expose corruption, but it's what
> the device is asking for, so fine to introduce it, but stable is
> questionable.
If we consider this dangerous for this device, should we add a quirk
for some devices that could be seen as lying?
PS: I'm still waiting vendor's feedback on this question.
