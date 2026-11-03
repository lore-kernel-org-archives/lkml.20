Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793706079;
	b=faBffDoZ2YpcAOYro9dhH4cJeNYCLAjaS6TYqTLungLG0AJdx/dhGREaIaniM2+LTDME
	 uX1MNb9BMZoM/K+HY3WdkjdfedCuMj34upn1aTrjoWaVPgviXkJmJbVgVDE39BXD8FcKK
	 nCprLUmQd9zwjJB6nuIDHZ+lhCUUKja73iqUcwMC+AA0CNgpRADPV1vGfV5qht8FNZbHd
	 AYifAD//CfcmhbVJZ6P9DH2EOFr03f+0rqXppw25UQUuEzfGDPVeW/qw1s4Lo9E80VUAS
	 f7Wf+9Av0t2ERyqX7cEoCDeNcUlN3b6hf9zPVr1WEf18WCCRYcf6Hdbg4Ttx3NwdQ6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
	b=DUWYQ5fqQR3draEJObhd35Y1WGdgmkENS4uuC1EPfCFB/Q/pH8RmBIHKo0hH62UC3jH1
	 G/HqW/nNIlfbxVxwMg/UM4OcVzSdOSZJ4bfssm7QVEZTIUEPM/bo7Ss2reLQFibXrjFPr
	 IH/5AXqRw2OhnTx+gqFnf6pBrRJN/Zrs5+WGamm8OPZtew/yDIKIiW4N5mXNBInkI15/0
	 9DVvYWxVIqC9h9dwPRjuTz5xmCv+OquY0iGfYaeYgE6mVsA88N8DNezyqDqYaL6rgZTFV
	 KMVWWolyIZqCxy3WA/2w0Eq1lGv7ZOTXEdL98cci9bvoaeIM8DisXydyJRez0fQG7Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="IZ/h420J";
	arc=fail smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22001606D828
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22001606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IZ/h420J
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a0eecf73fso690113eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:41:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793706078; cv=none;
        d=google.com; s=arc-20260327;
        b=pGeWolVpILp02HhmOanT0pVpYcm9JMfIGbDPOQmjNuC/0rF4fr+cMbpJQDd5vj6Ir4
         dQ2GwWLjwH/8es6qd0950pZuqwK7+UNpHGWBlk6DxmJu+QtW9wxmi9EDM343nPeooabQ
         J31iUzUEpnLbEPzaOKfMmVbJZFi/ZHHo7NKwJJqUPiDUoEmjnLcW4NrFR0ite69w1Agj
         CfOzz/wX4KGwMSODMk0FVldDVOQyLLhHNbHNuFnpvMyHpKGbm2l8z2EVgcd9SR4YFVQl
         6vGw69PEmtHVFCIujkNzWZt2qfO03ORqdoUdOqpFurB1K6h4AFGaaabKQRlX7R2sliBU
         JgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
        fh=6TqjoL7p8iBTwiTGUdFkjaZBjNCooWI3D1AzBwS7E7I=;
        b=ICq85us5z97db6qHOGERzSPJ5bJj5myeBkzFgP8/0JeaIVRw5HzzdLNhQetYGxDJcH
         UaTQ+SUq899ro9xG7bmdpLLDe0vTS7MkrAjbMknjZFfuM9NMtG1GU7IGCBR8SGnDJg9T
         ruUaPerBZI0W1qy11+6WrlXnSx46YAz46TdWwmkpwqlKx/v+yD3I2aStUujDy2AO1lkA
         MHVpmj4TMjLN4A+Zs3Qi7ajjOUohrYCx+lqpxOW8NfvzRuB2fw1RIdG0mo6L7Y6fxQLI
         2ri4KwRoulPBMxGPkljelT8x+qUBZyi+JW0l5FYl+f9owVjAGuSTj5QCPOapUo47Tchj
         IAfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793706078; x=1794310878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
        b=IZ/h420JkfXL7GZvLOuJ6he1yVUFj2spADUzg8pZ4MFAuE6Jy46fr0YKtI5WjkjAva
         hBpem4tQCott6vJJZm8zAZg22rxmZx+4PIvUL0Bprbu5lsvcP93xPXFFjr2HvR6yJ8PH
         ENSaKTj/roidwhcjq/wS+IJXEKJV2ePGQwOKiM8b/60qyKkTEy+xXOWs6/fn6NcEz9JB
         g7D7s+dC5V65dX/1iTZUtiCIQ6L0A3GP/q+8w1NJyqH5sixl75ghk3ex8esXgZQGOIMg
         2mr3P6VjXSKAacWJtLl+67g3lb+SLIbU9hT2BN5/EX3ftLmCdUFyEqg5ncelVA3DCVq+
         xCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706078; x=1794310878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF8KPXQW/l1F2OMDbW4b8SXIZxTagK8YBRwglirFNRM=;
        b=YK4qn/vsZkCLEMKwhHal3cIo/z4ZlW6zagHIMH30MuLHMnWTxYXTSZniPNgO50Kmyn
         0sUfbCxJPKjpv6na1FEPImmvlncH8/P9rDbXB2XBMhd84vMITWOq/auNy5PMq2MKlbOO
         5UZR0e+RUN/cJFaTbjHbIP3wE5IzBVNVB6L2VFhVq1rSzXj73Gu6dgYudlMc6f87QLek
         BsH858oXanfW1Sh3vzAonIHMZ+8SNO+6tvyqykP7WGOYT/QYQm6+E/ZqD0yLC5pb7mKW
         Cy2xIM0TtLF3VhNgYY2P1D7QOajY7GMSUnbwTlGn8yGt01xrsDoOyTWkAy5/MmXXyqrb
         xMPg==
X-Forwarded-Encrypted: i=1; AKwUvBwBmOS51VJU6rj/ek75MCX0ySVe2yu3brVE0RnmufRivephyUXcgAZAWdqoNMeHxezGYLGecNovuyxJNJI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/OhGUIE8sFBjMj/k7P12aAFvBybdfB4k7nvcqYdGX5+JYLjrl
	/TMWItOSVSfQRmMFo3HShWnHt5+0RgcZ9jj6pKMnGmRZ6aY/CUzOeHTzMwsx2bTvdaPUfC02Ioq
	hHsds+ePkApxusf7xlZIq4QKZIzy+/B0=
X-Gm-Gg: AYBFou3zt8FhCB2h90e+kvCwuks/RwUSZrHLbwE7EKQMHSctToH/aO/jKXplkQygTsp
	Ll08Gfl8tbF72YxTgW6RlZq9L+ZbVaEKhOZ0V/9tqBDK0iSvQ+kia67guAQ40Ht+WS/xo9rY02C
	J79NNNdZr0/WHb1TbWk5d5UOVIuO9elhZa9hc94h0QI+tA6alVmU9IZAr0X34zraJAcpBPNwWig
	peu84KtRCezEKSLO98vrGmrRzi0FA2zwZBBdKpic9CndK71svKECSrvQL7kwvxy2YjQG7dWp6n3
	cALOhSUP81IRorT5RQX98b6EwqBesOfdU+1v32m3PiQNA3daxBTNu00QlaG2r94+a5ihzv8J5wC
	Zv/r/gHl1S/ILRHVNfzJ9k29EcuR/ZHWUDh5bSs5ow0mvGBm6ZiCEL/zU7Cu3hHdLz1E/sAtoyQ
	23fvKZBtlecDdXs71T5THY7SvW5Z+IqoI8sjGilOCiSSNceOSwKKJUncz74H9f1hRrc8rjW9VJx
	fSEYnjHbDUYrMK3w1YACL7E4+BmrpdQ0rZsq5RwFjN+7X6wQ/lLk6IAnF8=
X-Received: by 2002:a05:7300:d082:b0:369:ffc5:6767 with SMTP id
 5a478bee46e88-36a4236a643mr25334942eec.2.1793706078021; Tue, 03 Nov 2026
 03:41:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKHwh-GzSuLn9dvjnWph_tr6MDa4nZnjc-JaMy4PeqnNXDnaMw@mail.gmail.com>
In-Reply-To: <CAKHwh-GzSuLn9dvjnWph_tr6MDa4nZnjc-JaMy4PeqnNXDnaMw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:41:04 +0100
X-Gm-Features: AclHuK_Jen2-hcfaHSJ1Yp_sQSHJT1zUbaplJF7JMWFIUAm-y5cC-e37DF5I9b0
Message-ID: <CANiq72=T89-swC3BK0LxcdR2ZxAGtdPnpPWK6JFxjL6Fe2-jWg@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: test retain ownership and mutable predicates
To: Peder Bergan <peder.bergan@gmail.com>
Cc: dakr@kernel.org, aliceryhl@google.com, ljs@kernel.org, vbabka@kernel.org, 
	liam@infradead.org, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 12:21=E2=80=AFPM Peder Bergan <peder.bergan@gmail.co=
m> wrote:
>
> rustfmtcheck and strict checkpatch with --no-signoff passed on this draft=
.
> The draft applies to alloc-next at
> 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4. My validation used Rust 1.99.1,

This is not a draft anymore, it is an actual patch since it was sent
(and doesn't have RFC in the title) -- I guess it was considered a
draft for the LLM when it prepared the patch.

By the way, if you use `base-commit` (which is how it should be), then
please don't repeat the hash here.

The other procedural comments apply similarly here.

In any case, please do not re-submit this one until the maintainers
take a look, i.e. normally you want to wait a few days or a week
before fixing nits etc.

Thanks!

Cheers,
Miguel
