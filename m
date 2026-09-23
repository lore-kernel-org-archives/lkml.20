Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B53ABD96
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161953; cv=pass; b=SwsovEgKS51r2cnlfy1QC8RUAcePkisb4Gmna5nqtcdjn6BIbcsoBA2siY3Y7pqO2Yp+eKAdpXbdkOoDuJLv6llwJ4JWP75xq7OfCDv8YGgR5nayxvh0N6y4Bv0DX4fA60JvhfNqxZ7QxCo9GIygIWTWWjEWhbqsmusvDbZWI8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161953; c=relaxed/simple;
	bh=f/0LsAmAUPrERvHIKAN0O+q00kXbtbpAuAixKX4hpi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouMZ/kM/2Qw1hgvFYrXCD0f2Lwd0vGOMCJ984Dcoe/IcV6TIf6tCsM3i5Z9yAvZ6MPyIEI2aSb7J4m9dIsBceSuF7vt1/7OkO4b2uJHQeFuCMAKtfdP6XM3Fx2vgC64RL1XJQNQLHPhlojHM4gHTNXRgo4XWxItYmuwczhUv9U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=LWlHJFzN; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="LWlHJFzN"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso558570f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790161949; cv=none;
        d=google.com; s=arc-20260327;
        b=mSXnwNx8D9GNFl0i8tihsUrdpay1r97PDU9aWHruiraTjzanVQQe/q/wwOrVIcGO8v
         UKG0PdWMRGCM6EsFKmJheFNYUr8d03P7TCdTSc8TpKuC1hkvJbYX0trm3ZVEMvFtTwFW
         Jo3eBhQUuLg7BkpIPL005dH9w98EJeowC5YZJMvwicoAMk3Gby+AEi+ZHv88e+vz7NBu
         XmXLDTkPboF5/Uiyki0D1iTN6NojpNxuHYjSOEwQNgojsCuIfUMFmkOqdOcni0xJlQZi
         ien6hTiRxDOcN5dp6GPPwwg5//gAFC+vmkX8RdnnnEAgxO14n7qjWr6F+z3reFbxBBlh
         OVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcKgp7WxuTxdAyO4JZnM809V8L2x1IuAvkUQrt1z/LU=;
        fh=ygsA3cyPe9GAOvXZx+BPr4VWTSE7QVI9Ii9NuglLFeU=;
        b=T8ugubgTfAF3DfPzGymXBPHZrC/bmimTzHtMD8GgenIgpgJTN6BZmww4nlDMR97ktK
         uSR4VHou7qIIySTeSqapj7VYtKpJXr44CbQYmDEMqroQ0953R7SpDs7aHQiE7zmhaUAj
         vBhLdxzqZXHFh2PPl5pB+Ob2I+X3OAt/XCfMNajRM63W0PGnnEydx9tqPQ6gfL2HB5n0
         Jpxno0ygUtlR0mNtzNKoehvmw0BbWeds2wy50U1q65jtF4x5CZH6yajS15ojy7YFaH9G
         svqwdki/Mg6v9ZoDMOjw3rQ8HeWJgk0X/jGKv0J8lZcOuztdDDJjtxYhDZen7jcM010a
         Trfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790161949; x=1790766749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcKgp7WxuTxdAyO4JZnM809V8L2x1IuAvkUQrt1z/LU=;
        b=LWlHJFzN7TkEaAN6B4BBbPdDFhsKtRFe/0TvBWv5i9WxYof6GNMLe6ShAsnDfdmUyO
         1o//ocATvJC7/34Es8BV7AbR5Bl4n8XV3nslT9tnHM/soeznImUxsuU0MCuIpD/tkirY
         cAIy47h+SvQ2yxKny5Mt3Yg+JEfAJBcE6L+a5yeFzjbvJ7YVyHddw7JjitQnx5ZtHhGu
         ArjSnQLCZycFcKx6nQt2KPVfJ5ZIbJX7eE4ctO9ybdxjeeAWnboYW0Hpw8jvW+zirXco
         mFh4YLtLKhDBzkhwBrGMBPSLnGpssYKfnCBQ1dFr5oQlwKE/H2t2chI1+qaVFWJtaNBC
         K59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161949; x=1790766749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcKgp7WxuTxdAyO4JZnM809V8L2x1IuAvkUQrt1z/LU=;
        b=UdpmtDyFnAQwJGjDChMiS+9si2UYOvcpYvhuBbRwp+YaQnCzcwZGjC+yfdEOgPwGRP
         fV4uisPZOWCoOVK6iX1G/Dks28J/RvCW4C7Y29WBpvkfAx/vIhpcWphoV3ksUZ1HLRxj
         Dy5KxHLNLiY1x3XwM+3PWCJ+NcMDqde5K6q2c1pvvW+umQiHp9sigSE7x7Rf9+ggvh9J
         5GcX4ZLlCQV9D76GnUHP4cXQoIinBYXUnDdgnMQbW4VD+wr+pMx1d36nq8hBinQYCVTt
         foh6I4m0uL+H1mCAcWZFMPJ8ncY2o40jOQamw/aIhdCq/pM6x1RYFysBnrnMLbLeiYmC
         YhmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtfxtt7qdUFo9HwB9+CYFQr9jpHAGfvKSrbs699NTE4GyBpE+sZcT/HsbOUSor5Z3qQDywXdGf0mX9AaE=@vger.kernel.org
X-Gm-Message-State: AFuF++nzA1kEMHJBVGlkScuW/1Cm+NLnuVSWCQin6eb6Ak+g1glvW2tF
	9l/3N68XjJr/Z4fOt2H8gcGfqXwB81dmhA0MH+xMXpIOKbp6vrLcH8Vqdw21pYI2KdkoQ3o8203
	iSMjxdcCrI6QdzlUu5GJLdK12hhexUboolR0F0MN1rg==
X-Gm-Gg: AYBFou3NOn2gtFGHwBtT6s9dr3z/i9StUyRgI1XJWvCsED3D+/ysseBvwuDZsJJSjUa
	BTi7hdWZEKCS/zeMEO81ns7c1jWh51TegLq1IN0tJt5qFHxdyM21c81Gd02NW5ABgfKyLvCvrM+
	RxCbgGtCg8LxMXe+F4KTVgAuLtel/4ZMr+K1R+w7CF+7nRz/0b0gHO6tYH8YrUg71uiWeD1dpnD
	cxGOpruY0ScJhE/mZ8o6YaHox2hvzTSM4l+O1t3JHDKwcYzwrJ3zda/GbUBpyGvEysF62H8zfvf
	veTb77DS4PB6WeN5Yv0BnAA0Sue9YsEuKSeVp+17+9KD9y3GWo615kXC2pJSewLul0VX+svP/DJ
	3bnq7Cxzj6mrruFvS+mFPOyxoSwFQGUEfZcBKDjVTO9Kv8vOPqSUSd0SY4yjPTYAtwV8BQi7/3g
	zGTAsGzGwk389eu/pOgLFj+A==
X-Received: by 2002:a05:6000:984:b0:487:27f6:a4de with SMTP id
 ffacd0b85a97d-488670997femr3395419f8f.46.1790161949261; Wed, 23 Sep 2026
 04:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
In-Reply-To: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Sep 2026 16:42:13 +0530
X-Gm-Features: AclHuK-jZxAsooGTuQFyAWbxOlVlJ_wooZD9l2irWRxzxDUFGfNbUwi7wtBl2nA
Message-ID: <CAAhSdy2Rso15xsRJt1Sx6XqpnJr4VKtsMfqaPNX=sVi_q2-hQQ@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index fields
To: Pengpeng Hou <hppiscas@163.com>
Cc: tglx@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Bjorn Topel <bjorn@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Radu Rendec <radu@rendec.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 6:38=E2=80=AFPM Pengpeng Hou <hppiscas@163.com> wro=
te:
>
> The IMSIC address layout places the group index above the page offset,
> guest index and HART index. imsic_parse_fwnode() checks the individual
> field widths and the upper end of the group field, but does not check
> that its lower end is above the other fields.
>
> Reject a nonzero group field whose shift overlaps the lower fields.
> Otherwise a firmware-supplied layout can assign the same address bit to
> different indices when MSI target addresses are constructed.
>
> Keep the existing upper-bound check unchanged. The new lower-bound
> check applies only when group index bits are present.
>
> The issue was found by our static-analysis tool.
>
> Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early d=
river")
> Assisted-by: gpt 5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup


> ---
> Changes since v1: https://lore.kernel.org/r/caplitmus-rv.bc36e3a0ebcb4a01=
838171f27625004b.imsic-overlap@163.com/
> - Limit the change to the lower-bound check discussed with Anup.
> - Keep the existing upper-bound check unchanged.
> - Send this as a standalone patch, without the zero-width-group change.
> - Do not change APLIC configuration or require the earlier series.
>
>  drivers/irqchip/irq-riscv-imsic-state.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/ir=
q-riscv-imsic-state.c
> index b8d1bbb..a7b241f 100644
> --- a/drivers/irqchip/irq-riscv-imsic-state.c
> +++ b/drivers/irqchip/irq-riscv-imsic-state.c
> @@ -739,6 +739,14 @@ static int __init imsic_parse_fwnode(struct fwnode_h=
andle *fwnode,
>                 return -EINVAL;
>         }
>
> +       /* Group index bits must not overlap guest and HART index bits. *=
/
> +       i =3D IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
> +           global->hart_index_bits;
> +       if (global->group_index_bits && global->group_index_shift < i) {
> +               pr_err("%pfwP: group index shift too small\n", fwnode);
> +               return -EINVAL;
> +       }
> +
>         /* Sanity check group index shift */
>         i =3D global->group_index_bits + global->group_index_shift - 1;
>         if (i >=3D BITS_PER_LONG) {
>
> base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
>
