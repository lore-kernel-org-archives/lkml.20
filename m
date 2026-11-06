Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974288;
	b=3U6wEFrUsam9As1N02SEYZBC3nj35vo66U5rLRSU8Q5MSQ7yoKC7OMaWUidHVa8hA/G+
	 wh9KgJHCSes1LchGleAQ7iRIcdKJoR7QtWFXnXlMMeJjpse7kb9a6h4T5rEIiR+aHRfDW
	 FV5cwTMGyk3+/SP2dU/ACovQHTjaPEAcepuNQbFvZpFjkAVz7hAkd5foIJYh2bcoR4NsW
	 ejwNXCs3ulQ8q51HWZOHjcBuxeBOpbAYEXr25673dmcxyNshVAU+3cOop9IiqZIBqjYpj
	 HdA5z9SUc8ieRIMZkQBsGLdOJcPBZGs9UZjZ+vWpajQsFt7rV/BxyqioU6HgeXJMmPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
	b=DAEJHv8qsmleJtBzVoMSCJpv527UoDyYfiRqFqZ1I7SN3tGG6D83M9RehSqgYP60en//
	 X1Yrm6Wa5OIIRTu4y3TAonE96mLbHxB47lpnFuIkGGxiWzwdqhFiLaGWqk8uG+D1q0DJ5
	 +gYwN3OPqUj9Q9bwbEL0Kq9S8jrku2AuAjcDAhefoW+KK4pJZriiWl51ZRvhXNzKBe5A9
	 PePYO5yU5CbP/rXKszSKIwiWWVvhl/LVfS9KyunbW9N31bv8aeVl9PGR/33gjIt4Rysag
	 bHufz2Msf3ZaE7oHJgPXW8hkrhnm3tPWZ4tenD9lhpFc/euuXIvjgAqSBydtoLD7Hug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlF9vvx0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCDC606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlF9vvx0
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso96729366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974287; cv=none;
        d=google.com; s=arc-20260327;
        b=Jo/+y5xdqkZwzBYwe2PLxw8lw+6NZR+A/0J/BTB34xWbGi1QChqFfowIO1prTWUimj
         4wP7svSFh6I1eBMq6UFgvsyq306GSVNZHXtYzMss9F/Ydgfpy8NngfHxgGrfwCqNmVTG
         sZZP5Dhbi+EpQePS8DGx/8GD30ug4aGutWdOGIVdLP1C3MAAOsMz66cjslQLJgCZFfIK
         INXt1WwmCrHn22KyzRi0PelY6wLh+iT8LRRHEPCw2GAKva2UjrarYhxO+qTTiaOw6W94
         8T1Yv6+R8QNF3Wpginq6ocu/blYFycnCdevZTSjnrOGH+udCf2Dbd5s4RxTmCEpGxojM
         ZCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        fh=tdBJ0DS/j+uwmPpoFbfh4HyKBS4+4QJ906DQTni0SzM=;
        b=NByM08c/HxYskGGg4533X5n2KQhHp/QQ/NX9K8tY41qUSSE5LyGP92RBn7qMfkyq+2
         hR3ljdxBKR1VAz+myyXb91oj3pDewEASsJMGcwTMjp3eELr9I0Dx7nlnWiw8WtiQhhlE
         V7zFsTThTPNG2kzPkJajUhlASP4jm4r7ZiQEXgZUrUlQxVS9JH+mqLeHw6MQhrkpS8h3
         MhmeCrQq1l99zaeV7sGorRpi7pjNpYl/OuXTN+P3kePNBOBuFwsONPmRZ40si5rOiZdA
         y4PuMJ4dhlsuLoL+AT9pmhDUFhXD6OtvWwHkXReLA4yZ4c5Jquvny+Ci1kC6ZQPDtqJS
         898A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974287; x=1794579087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        b=wlF9vvx0jjxE9XlesKjv7QSscrOhN4uaUzQXjeIb+ig4zHVGuWCB7p7+ABbzV/xMB9
         v7QxICPrlsJx9mwTtSctvbTJ3/f6d3Sye/9JZDoHyrMCbuGZdZ8rlzMY9Wglhk5uK/EY
         J98XpdHuLfOMg6ZH2rPyE2gHC19j+bxjIkhL7oMyDqF0ItWJEgiHdJZgxiZQ1bXRgpnU
         +B6/nuEOkEmf4scBkKkpbR374nG79tbJsqukzj64xnPULQ7q0Iu/BNmEPeAz1OeevHte
         HePrgXhcAfQT9VSS/UCDvZxmdjO8x+neHVtWLYHaSxuXB47Ld3p+asftyratZmZQXnqM
         JSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974287; x=1794579087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUBgknGD0vcmexz+RXVBFNFmvAB8yyeZ1WyDa2+Y5Qs=;
        b=Tp8Yb7bMMM923K37C/1Y/gybAxI8x1RtLo2A+pOiE8Xu4Uo4WkE6jPb+LfTZvcPjAd
         A0c2avXt6PC+ANGaS9JwV9siamFHVKUpmExI7igmK5gqDVXfq0Esx5oJ5LMHWtWHsHwc
         5fiEq2ANOBTcbyK+YOpev4bLUepb0oRvR5/kLE5q0Lb6EilrbzxjbCz4Boj3NDBEoaNm
         Z50rt4nTepxpYHonLq0iiLdKrHctVqkX0xJcCsOcerB5kEGKLBUxkMCDO/PG7alkvVcE
         W86kryGLJChDY4i8gGVAvAKiMWfXhJRUna4kU9Vr8Q0KcbyC/xNP6tRUAwZUfssdkxd2
         h73w==
X-Forwarded-Encrypted: i=1; AKwUvByOx69e+LsbK1aygtpvEh81uHC+EUE+aFZeuVyQoeAy0aad0ja1N4zMm7IhktgWkTG/4Py9dWIHCgCGBQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I1ZMVHdzkhBicGSolqoMWKHPhNFS3kI07au9e3K0QPFSxZxg4
	X8f0kXOyVVCWSKe3mGZnu9E7cEV0+rEm8RcSngu0/q4WaL0aYwoV1xvsnciWIvR8bndSvbH9qsj
	c5kOhMw4+suAsky/wxY58IUfzz94U/Gc=
X-Gm-Gg: AYBFou25fGBEieY8chK8/gM9kjmXTfmPiooD9QPMyxtpt9vqbG3O+bILk1xWyJdeDJk
	MqnDeC3Bjo/+5I5OSzgVYFAPPr7eNui4u03ao1Qd0CqSTppi5vu1WLfHdgoEUvkaLxxlD/zQ5ZJ
	OBcciKABVyy9ROnwDjZ9AvJ7hb/ZBh9IJNUUER2mrbxd8zJj78ccu2KwoYHaw+5wJEO9NPAoOwK
	pDxcnpGkGbOODlKmgDxNrunbKyB4RfilvUvgHjg9kQrza7/iGTiiylcGhZgwW2tFj5NEkj4kPn9
	xDJXDk0J5qOIM51ql2+XV6v1NZbBOvqGDI+e7dUrMTqnLlRYEGwPRDeluypJ6iWD8LPoo0r9AH9
	3PGZcu582gW5OrwhbX4C84qDOgq3IXpHFSGbpB9aWNKoflBK6JE229P9wpuO4HWbs0ODdqkk2N8
	CUUYGXsN/ldlLAkvfGV52xOo2XDP1uQA==
X-Received: by 2002:a17:907:3e8e:b0:c44:16ad:c31d with SMTP id
 a640c23a62f3a-c4d3526bc65mr237868866b.4.1793974286564; Fri, 06 Nov 2026
 06:11:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-10-clamor95@gmail.com>
 <au3etybQlb5CtjBL@orome>
In-Reply-To: <au3etybQlb5CtjBL@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:11:12 +0200
X-Gm-Features: AclHuK8vFqFS9sw3roYv91eoeg5V28eK0ZMbIUEIj7uPY5ywLKX-LdV7NUmea50
Message-ID: <CAPVz0n3o5pc62eF6gv+PYmJh1KN1a5s=qmjxpNGJfxbCC4tqzQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:08=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:09PM +0200, Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 ++++++++++++++++++
> >  .../display/tegra/nvidia,tegra20-dc.yaml      |  22 ++++
> >  2 files changed, 135 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-dbi.yaml
> >
> [...]
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-dc.yaml
> > index 69be95afd5627..ffeb124905dbf 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc=
.yaml
> > @@ -79,6 +79,16 @@ properties:
> >    rgb:
> >      type: object
> >
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^dbi@[0-1]$":
> > +    $ref: /schemas/display/tegra/nvidia,tegra20-dbi.yaml#
>
> I think it might be better to group these under a separate dbi node at
> the top-level, making it a sibling to the "rgb" node. If you add
> #address-cells and #size-cells here, I think that means technically the
> "rgb" is now in the same address space as those new dbi nodes and would
> need its own "reg" property and such.
>

Only 1 DBI node per DC is available. Adding address/size cells means
nothing for rgb.

> Thierry
