Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792667629;
	b=N3R/194jt1wPSsPCIbQjscZa+sZpg2DNlKYMCYm6l9kvj306cd1u8zAYfpkrKQUR5sw+
	 TgVusKWtasJOn+TbOiXDX9cvyyygDo2rrSQK02l4Uv0YbjeiVxxexUQ+67iwItnBqLAxL
	 7F/bcA7WmVJpxPwPOXFFb+vScZrEsD40Hvw2LP2zPpAtV5yRBpOW0pYfvqCf2XhOpQ7Ko
	 283kDFn7QZIWPrIpo90IXasb3hrBo8fDXPVBezA08PpWEy8LlgPbX3lPSLOR0n1EaNi5B
	 W9vHkQRw/8bZvuXiNy7y9iK8xXwoBGb0ID97yGgxMuzD3yW/Nqidf7s4/Ujd4EKrBPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
	b=ZuhWs8JeizGkfDbo4tuFsO0duOlO6IHmwvCDAKODurXU03FMzMpUV0JFT2I+eUmLpe4w
	 BSWkfMg+524lcIHZI/hBPgOxawOD+ioonKpciQb7ZqyqKw9Lx6yrOlhRWG5kg/w3bMKWw
	 iMOydmWdDqLcMPR6szHMCWS8pV51Ea7MASTORZKfrwRJ8YXgpP5NvLHmCxhU5J8hbV08F
	 065bQOazONj+OFS+UyAuT/+zvO9KIkQFCoaKxK/8mqkH+jAX4MhdBvAsXwZ7yA6mddSFy
	 SE7NnOB7r4rwzXRgBbaOAM190gJ4TAqqmsOeKQd9Uq+GA3zkjuax66cRxKc4MEcpWOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzcsCzOK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B30F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B30F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzcsCzOK
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-34c522572bfso188116eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792667624; cv=none;
        d=google.com; s=arc-20260327;
        b=cfMwDWxDbIxD03jimeQ25rFWRGf+wormTO2c8lzMldcaC6oyvkrRiiJdO07oueN91W
         BileSwC3gmw6lchvZ3IyUUNWMHbMjmd7he/lGLc9Ui3Zf5JiUMDiH1cOOEmLHhqDh+R5
         gBT/fpr5C+rGzBIGXwAIxu4MXvip5MpViTsb16oyKjwrYv3KMLL5hqLZjhQ2ZTpv3PHV
         NBiPQ8t88pQJlLwuGTbZ8ToceQsCVtErjhgEUS1jLNlO6NYJIemDiNyEI4kqR0ENpD+m
         PHbfweGlNw2UUdyaLVHtc3IFkqKBhta+OY++SjYO/tBd93dT/0JFdZZKffqNGO9J1Emn
         jI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
        fh=Z6UbKo6HAcqcrf+FW4TCUCDN8EXNVOovbu+XqTYw8qU=;
        b=Exh5Z8LL7POc+2sjIM/ku4oQpvh2eQQhAR7ziwat299eyMuyPJpR8XLsZvA4xEQPwV
         oaf0tPUK4zIMiRJuXKqK2Tv4A8uRwkyslvs5ubQRKCtI51+kQLWqammELNDMfXrE3VhQ
         1BUqZyvCzLYGJRftjR3/Zc4zCarCTKp8yZrn0+oe6nw1WFGPAUbrUjYw8ps0VBG5M3o2
         NsAEwc5d5m2vToTJnp2eB9asR4+axMOocgQXb5mnXW+bqRsifhpmk4vp893aWJUrSmb4
         HoCwr4i9YUsva+hqHm30NmmM0XwLeaJj42WMNmcKolBfVtLCdau5OYYqpakAnDtVZZhY
         g1VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792667624; x=1793272424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
        b=XzcsCzOKIM1dH7X3ne5kpMLOkyW/kS/lF37y0oepZqm1lgSq0khIYNbARTOd93oqMU
         TfXjKrpV5RZBx81RtZXBePBatu/+IAWU3v4339o0MHOYOStsXtZ1gZg+ftfhrJJ97o9X
         jqknYd4gvq1/exI/EqLx798hDLeSye599FMXrfnHhM0GvQ2yXwCcnFwSF9N9+LTzHkyh
         vFCD63AmEY3JMAQwK+XD8g1FJcFNszVqG2czhj24/nSh5TVzQtFFLGhnadtrjVjEoHGV
         b5OBD27hWUq70n97TAknRmxcqTPS8aubwZjUdzwNgjSOnK0TLvQ6uQ6EHWUf7qS8H1w3
         NK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667624; x=1793272424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8rZRziw5q/fRuMqRbAHHvpJXFcm/wFSyNjqHk2EOSU=;
        b=mfBO/KxPLULwjU3/GmmnTpz/Pltu/w00It866hM1EppAAw3NGGdQxw5tnO3CQNRrPt
         0r4N4yU+VFLPUqXANhIqX8fE6cXGLObd8BEmx/tJ86aTdfoY26qbEzEWNga2yFG2EynV
         /tz5J3QexuI9xoqbrKLN2FKSjxV6+I9sIZdNOLBCmaMQKCAUdame1W0dHOcRSQgD1XEM
         +gelte0rrgQx9fPQrg8HpHFjDtU38my3qW2BN4qtdPRR6qru0PRSragprvZgR0QI23dz
         0IzFY0T5X/L3YBaiXm9iSGs3ISEaiR86gKL/F5OOTxu+70doVQB2ox+BWqXQ+COAdeQp
         wpaA==
X-Forwarded-Encrypted: i=1; AKwUvBxkNiUZegQEvIdQjMcaHMM8CZA0yq8WQdvtt4qqE5DvUp/c0bUPma49JJIsarEVD+yV/BoiWsjThaGeMsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYICzuncBEJvaD3KMaIeuMnIGezHb5xrXGrp5EDpiABbO7x/KTNN
	TD/qJw1ZOO3O9XUy9RREEGy65vaBTe7eNG7TdRZe43t5ELhbiMnQTi6v4JvI70CEtJf9Ehr8UAh
	FCMbABENNEsD8tTacWaMbQMPj5CouLMU=
X-Gm-Gg: AYBFou03ErSBJRZR/BQSvrd9WaO30pkGqJ8quXLM0pjPBmbFHwQc8+37Jm/IiP4+Otq
	SOxOAQkfN/nBjjgHnV4+6SOVmF5zpz3fHQZ/E+ZKIiCopNcq8wNbfsOCbWYlUV9Uf+aSv/WzjTa
	jt7M7thIweFxk7ZQn1803+GJSRaZtXCDUID0LruBsX1TZgGKzL7vrfz97NkrNahdmt3SrW4Yh8c
	42p3/dXgF/ZoO5BXktBSCnAUNdKV8/hRzcDQrNP48ljsCeaH6sU95QH1XX9DbQxa8ovI2BGI3J4
	rDYq1yJzymcsxA1bnvUirZ8SatnEDGQrBGxqRnGJbziUogoSQ7hcqbhOT+gIxtmJVniKLNsqm7F
	RPr734YGxc9xZo4MZpB3hGtFcORk3ZX+nKLvx+w9vdV6n/EVk84obTQ+85QkNbqcUqa73srQpKS
	xb9Ebskro6qpgBVsKORBgXW0DUQjHyMIdmdY1yQ1ApdgLf7NkDqvsCWvLbFDFAvq/7mKMYvpodI
	15GtupXAO6EZUr/jYeP5YhzZECO8lvHIp2L
X-Received: by 2002:a05:693c:42d6:b0:368:5521:612f with SMTP id
 5a478bee46e88-3685522022emr5207256eec.0.1792667623553; Thu, 22 Oct 2026
 04:13:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <as_r8n7p_wdbChuQ@google.com> <CAKmqyKOkmwompJqaP2k-oJicmXmqHY4E0wuLcrvkHLx+oauQ2Q@mail.gmail.com>
 <DM596TT7E841.1U05OKY9N6I6C@nvidia.com> <CAKmqyKMbs_N6C8MAKGUU11DW1y5nJRWPqnUcrVZoyi0SDjsv3g@mail.gmail.com>
In-Reply-To: <CAKmqyKMbs_N6C8MAKGUU11DW1y5nJRWPqnUcrVZoyi0SDjsv3g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 13:13:30 +0200
X-Gm-Features: AclHuK8IRxRyOadDqQczFV7IA6tccuepCRvhA3-QGnHUz-1woYEjtN6EKSEPPVw
Message-ID: <CANiq72kWv2HHniM3HXM=DkTbaNWSHsqfA_dKQNihfAdmA_sgnQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] lib: Rust implementation of SPDM
To: Alistair Francis <alistair23@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, lukas@wunner.de, 
	linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
	Jonathan.Cameron@huawei.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jic23@kernel.org, bhelgaas@google.com, 
	alistair@alistair23.me, djbw@kernel.org, linux-pci@vger.kernel.org, 
	wilfred.mallawa@wdc.com, a.hindborg@kernel.org, gregkh@linuxfoundation.org, 
	alex.gaynor@gmail.com, benno.lossin@proton.me, boqun.feng@gmail.com, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, gary@garyguo.net, 
	ojeda@kernel.org, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:34=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> Oh! That is a great idea. I have added that locally and it's pretty
> nice. I'll tidy it up a bit more and then send a v5

Yeah, to clarify, abstractions do not need to be complete. In fact,
they should only cover whatever you as a user need, since the kernel
does not want dead code anyway.

In general, though, we also avoid adding them locally and we involve
the subsystem maintainers etc.

Cheers,
Miguel
