Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D392C2DC791
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761955; cv=pass; b=U+HCoMm03i9cbqO7skNH6tauyuAf2VouDAIm+Fjl9+RxVo+e5VcgCFvdzGWZTFBivPSXkPaxwoCybhJYpPGspoiUUnsuOKhyHXlUtwp/uayrZxOdtc457Rj6s8rZNV1DPCj6gdAuoIVxfendkNTvj7XQ3K63PpNyp3ty5w95E5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761955; c=relaxed/simple;
	bh=bjD/Y05Lpd5GylJNzOLs802z3oVBzEjhypxLuBXLRos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fih0qfccyTm5TLV2lO/iyhDBgQ4YYm1aHIicpLN9afyIdGEdeL+H3dF7KBbr8iQ1feg24hoa2NeXkkfriG8a3Rh6TlFgxQlLBIA+almvfJjaG0BTMbRs9ecfWkvsAPy4rSWHuPrECT4xxtXGnAi7G6MIlA8IU/tUx7+Cfo8Qb7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URJwwz3Q; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URJwwz3Q"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so6533153eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790761950; cv=none;
        d=google.com; s=arc-20260327;
        b=nSwrjVHEOu04NK2mr21WPyrIJ8IZdpgik3lFd7pwOp+iK8CmjaEpQNpHHjZAgRbUip
         Y8e61aUmJxA5IVUpHL9SBwKfs8Fsz0lNG7pTaLRRQztxZ/0yBJ6KC3AwQ7EgTlgRA1oF
         qrWOTepEI80VxbETyHHQuCvOsMdvvPH8VkUY+tHofvqluMgAEKEU7zG3j++4QIDoj6fs
         aiCpT2d3N+lZe+lUbv7TJtM9mzBCdnpFBeJNxn9Oj0IazqZ8TsRZuxbXQ2NgMBxeP2W1
         gZfjZ/b3x7LQhPWEv+u9s5+HaUFDOXayvPmC9EpvgMPsMpkr1zlVv2+JxwdN+tF6BHu3
         oOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        fh=CEXBmkCGFH5InwmF0E0LsK+Pmursxfz2qG7HCAs2cUM=;
        b=RmjR/zCCBodpFkfqsG/4vdYTvHKw4jW0enki3EeFflQK9zGnxVze1GQ9c7TzVI16tH
         nNJO1n3s1auSsp74l8Vyn/WK/o2j1W6/WrhQtOPH7dg5RHa64wERDA+TPypow2WhlZj7
         5lQqf4fkw1qWVNjUgGvUDXgehA3EZ7cdte/C+l0YQggr5oGvrMpxeYj5BkF6bQ/uAsRu
         ZDhQE9axBI4tBi/i00kSir+hEkahC755mDFsA+Q0yPObrwfeHIYmO4Lu3mSeCcaBI5WF
         E/wcUfMMnlWLUvSC6g4lA/m4x8ATKjSAUN38zVQRnfa0cj0mMEw/W0sF7xpE0ypQhjVw
         Hk5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790761950; x=1791366750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        b=URJwwz3Q5weOK8SyIeMRj5F6yJ9v6l6sXJ9AbEhqyfRMLLcEgG/y0ajmZtJelRTAgY
         tpIHSS/f7fHcbTiCmSMJpRDVXhxlwk2Nz4zkVvQtPUXAbhYzzR9mxKnrFAKqxXAI8XvH
         sNZtB4MbFXRo5nmUKBRar6YsUmjYMFmpTs5nL5m4UXzF8NjeaixLrY50K481otxFBPUy
         OGTrrWcTvatQ78993Scd09nN3nsBqIgFhQnJ90OFlfvPUgNuyanY/OaDmWsp2FcnAnF1
         Qtb56g8dBAza1X7uoXnI676Do76lJ0DRXrX1TFtWdS4HV1/+27LWpLQZi1O7sURziALW
         NwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790761950; x=1791366750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRT+bVkpUAp+N5S99zEO9+WtEZoje0u1sUGfRr0LWg4=;
        b=hOcYqrpYFytSPq5IBQC+zyxNckN1eG9yb0vXMfRcODaQsR6Aa+bIiOQtkVDpqrcCr9
         aYLcy2sAP7pu1k+/AxIYK62y4v+crnxniCT0LZpzcpduSTEjlaHFTGan2RHXa/Ztydqo
         PlSH0QDpXp0k0BuecnqDdwC182gxX5aLhhB+dV0FsNEDHk/SZln10iSMLCkyZkORufgC
         stnKHmlrRv47XiDUAzFL0X28VZ+xEPPTR1FXstmnka4jVm299PAUzJ41SQBex5NtdXel
         C4GOs8O5QPlpMrV9reuMWtCHeFMtAQUdMUX8ksD0n4R3m/sKJ1K/5X4CipjC86Ve1fkK
         rYhg==
X-Forwarded-Encrypted: i=1; AKwUvByBKGo99y8lbC+CUsfjj6LnjGnHuyqNquAO/BY/d1v7RZR0qL9qj0G2W4ExXI+9UnjXghaRnLBBO7W05qc=@vger.kernel.org
X-Gm-Message-State: AFuF++l9Q/V8Rj7YL5kUHc2SEWB3YMepLs86ub759EuW/27WzdQBpKNq
	T3hr9Vp8W5LCNSlAZvC11l5E38aBCkhpy0yD3jMTSG2V26GKygpZl/dutuwF2tbTW84dZUOKkaK
	CQuP2OSzVV3t5ikk5JzAXsr+2dt6LHQ4=
X-Gm-Gg: AYBFou0Dgw0AyVlw1yE+OhswgU/ENcQLAe0TcPP8LZqEhoxnGskAmoIXacCdH5tb9PW
	hhgMsFzil0X46MwoRr+s62uvskqHtJdqEwX6gmHTTwfCJdWzM0kPRxKzstm40jT6zsKQ4PkrhkI
	/eNxmWYYVckK9I57hmRYU9N8J2lM61aowVlBr+LBIg98sNY2xG3vdtTLab88MHrAPrugdTuXNBo
	+KaiBpiPXTGpWM14UC1XaF+4uAG17Zpp6IqVc1LjuHqK1U6dgQDLhLxZSazMu20h4u9s2aOfzE+
	wB+3vLskxh31/O9p8NkzeJ9Lm5IRU1esif7Ti4IFwMtUagq392sOM4VWIbWtQZBehFETc7rW9EE
	uSEQrt5ewOj0M
X-Received: by 2002:a05:7301:2624:b0:342:d7a0:2f40 with SMTP id
 5a478bee46e88-34cdbbd634cmr1436523eec.7.1790761949877; Wed, 30 Sep 2026
 02:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
In-Reply-To: <UJZ22UtaS1GSRPlyAst1og@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:52:18 +0300
X-Gm-Features: AclHuK_PjMkrSZpZDbHZxmDO9H7m9qGOop4eAvIoUg-ZusCaq49UWziUnYzuIM8
Message-ID: <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:19 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Document 8-bit CPU parallel MIPI DBI Type B interface provided by
> > Tegra20/30 SoCs display controller.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra-8bit-cpu.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra-8bit-cpu.yaml
> > new file mode 100644
> > index 0000000000000..f0dab608b2936
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra-8bit=
-cpu.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra-8bit-cpu=
.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description: The display controller in Tegra20/30 SoCs features an
> > +  8-bit SPI interface that closely resembles the MIPI DBI Type B
> > +  protocol and is referred to as '8-bit CPU'. Each display controller
> > +  provides two such interfaces, which can be used to send MIPI DCS
> > +  commands to initialize and control the panel while image data is
> > +  transmitted via 16/18/24-line RGB.
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-8bit-cpu
> > +
> > +  dc-gpios:
> > +    description: Data/command selection pin.
> > +    maxItems: 1
> > +
> > +  rw-gpios:
> > +    description: Read/write pin.
> > +    maxItems: 1
> > +
> > +  cs-gpios:
> > +    description: Chip select pin.
> > +    maxItems: 1
> > +
> > +  data-gpios:
> > +    description: Specifies a set of 8 gpio pins used to transfer data.
> > +    minItems: 8
> > +    maxItems: 8
>
> Based on my admittedly brief research, according to the TRM the display
> controller can drive all of these pins - of which there are two fixed
> sets as you mention - directly. So we'd need to describe which interface
> the display is connected to in DT, but not any GPIOs (which they really
> aren't).
>

I am perfectly fine to not expose any gpios in the binding, if this is
preferred. Only question, which method of interface checking would be
preferred. I assume if primary then nothing, if secondary - boolean
prop "nvidia,secondary"? Feel free to share your vision.

> > +
> > +  nvidia,init-sequence:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: Device specific set of values used in DC DISP_SPI_INI=
T_SEQ
> > +      registers.
> > +    minItems: 4
> > +    maxItems: 4
>
> And AIUI this is panel-specific DBI commands the display controller will
> transmit. So ideally the display driver should receive this data from
> the panel driver.
>

This is not panel driver data, but it is panel or maybe even more
interface itself specific. TRM has no clear method of generation of
this seq I am aware of. Maybe I have missed smth. These 4 entries
co-respond to DC_DISP_SPI_INIT_SEQ_DATA_A_0,
DC_DISP_SPI_INIT_SEQ_DATA_B_0, DC_DISP_SPI_INIT_SEQ_DATA_C_0 and
DC_DISP_SPI_INIT_SEQ_DATA_D_0 registers of DC. Maybe you have some
info to shed some light onto method of generation of this seq. Then it
could be simply removed from binding and calculated internally. Thank
you!

> Thank you
> Mikko
>
