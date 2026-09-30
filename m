Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968CA4F475E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773889; cv=pass; b=hC6Pmde3XNs7+WPFql6LOZ33r/LArvSlCrXaFb9PsuqTuCDa4YA48ZWT0dWQvaxT/MxI25s5APgRbsJz4wIvbbznPgyqLGQOZFeNb9EBf7SmFsAfT/r8mbqi55gXqSwpVM+aKKpsiB3Tq5qEXauAOqF9uBwhcbcG/bosMcgYUEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773889; c=relaxed/simple;
	bh=Zt8I0rLvsyoWaB8MFKSA6VF9+DaTZuRYcVHpW7GrWDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gEDIBw517aqn8A16Afw6SGOVw2TrNdEf+zE3gHQCIeBwjPWUPfxilBaGCcR0XkGK7aaTzMUXZPynQRV8OAAcAWFUNC/TDhmlavQ40PQDdRnRNxdin/pCDdMfS1pOA6zRbW+8OO6RS2VIYsBmTpshIa1I5PP3l+lGP0a44tU8Plg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNtPvpJM; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNtPvpJM"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c2a97ec17so813713eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790773863; cv=none;
        d=google.com; s=arc-20260327;
        b=QMbHcKjLIjz77VBO5vdEnGU7kFIcysBNqxAKhbsF6RHhpNe1YGtDS8aKVilS9J0JoH
         ON9tVzlD9hUKLnBRnpkYzf+fg81AUtUdc0EMn/HSeJiGHNn6gTOxXugmAjil44Fr5Aqa
         oAKNdo372ScoePKyex5AHMQ01QqAdzH4OSeP3Fv4uU+/LqNqxh3wjCmTA7WZkNqPEgMz
         IFWQP1ttkR5JQJjH9AwhsQ1KA3AO3CsQJGc0M3BGobdtQkOQOZ2X5VJ3tXKFXAF/vD6+
         jC/wxXCjfLyuPc9HnDwc3/c2TKlhTM5fWZuFGGyRdyEJPNXlnMHNYHycCooRa9y2JX5K
         Y1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        fh=UQj/NggINre+DBTpx4Ydz8MksaJJPzLfTjLNw25wqBM=;
        b=gnzSij8kfbwvo8mO0typ2y2Hob2natQyi7ArmSGkE5JnMxeA5kO2PNhWOJrSD9Z7De
         0XleeZhB54pSW3Je/oqXwS5PyT5eA9/2YEjht4f5gU1t6qlaKhCVjh38yDUzkVw0Cq6C
         rk730NpScP5X+0bdWRT/CJcoILbsrwvsA22duwfgINYQ9DhHEQgwpst7R/h7YKDvg8FC
         zc4B35ekLr3GH8RGWjRbj243VfL2LEkTejTL1DdlliWzsfka9dFqrsomQrJvRx838lPG
         +ZQ3VCwWGn4w6Mle7uZD/w0ZhfsIJud/fyAA4Trh/Cszn6CYtxqVqZqKCLbEfdy7KS+i
         kAHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790773863; x=1791378663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        b=VNtPvpJMSRf+Iz5RkG2YCEprFK/z7SsWmXEYc4ujWJQiBi+8Yj42wkZS9epDEjvqrg
         Kzd8JE9v5hkziOQ5WaGz5r3DoESExEWd+BF2o7Scdyr9Z23PmEh2SSuw3Bf9pyYtLq6Z
         kcM9Jm5MUdRCpU90QDCR1SWH1lhmMXpFK3w9YmIURO1MQLJarvA6vaPjpJ94d/eb/2sJ
         VBH1JrOGO257kGek+l1+CPhUkkvzTTj77pVPcsSUtIyqsHPK0Gvf88ukpgS/aMi11JoR
         Utlfj2q9JZvyNo/55wRoYxjVq75TDeaUxMJ7rJypZSk0asSp8P+A15XrE6ZbJoethWAk
         hI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773863; x=1791378663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAcpYy8Y+KFMyBoefBiZVG5Vh10XWP5p2hVnta/lBBU=;
        b=0W4mElwmQHA+oBn0MZKDJOrJMVionP9ZCCc4csh7GQ/3eyqakqvjlU1sWVvwMk3Btx
         feKZaPWaHCtZPsI28Kl1Buq2RHulMIMuC2iEylZfOe6gzDc+PmKUN6fDnVSbjltHIokz
         icl5PIuz4WBR8sOJA6xTlnJafDiFF+Vz78d0u9qCbxar7Hbf0G7INBPMdroZePLL6jFs
         CO8UbYgV0r9WSmUnxsLCz2yRFyoc0SOiKHbHRv5HsBDUgvVQzlbVmdFadUnM0hm6VVPB
         GZNs8Z2r+ps6WDKE09R7d5Xr3rQgGasONF5Bmgr5afEZdX8G+xr1uIuKuWLEJs8DQ/bg
         cwLg==
X-Forwarded-Encrypted: i=1; AKwUvBxhZod4ILkvbFvuW5kwvaFwtpiR8K28aUi3SbXrfM/NUl5X9Fv7kp/5/rFgLsKruwWOHtyx5j1VbA77tNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1gYwbmvqWpyu4bwSOCwWeCIQYnb3uSPIk1ZPmE7hq1OMQ58yY
	bdd8ddC+9A0/C+IWVhYZoB9e4WcCtFCZYuDDyYq5QFwxp8+52GXQFy87od5V8CL6RyOw29XiNme
	brJJJ9n5nSqUpb8qaL0tvzUEggy97hLQ=
X-Gm-Gg: AYBFou38JMxVLIR9p6EjkHEXOltNNSX+x3ztFjK8/OtzuhktHr2ZAgv8Q21uJ9y8xhg
	i/WS9ZmMQrC25ILc3qddmIniqNWuX317+ujHAnrlmuYS9fh/XETg91cRdXekKeW3kax5gVtL7ur
	zavVnhIN9uLgVjZKjHuJxoP55Hq1+j9ltdOyrOj4mIG/+9ZRIaH4cl0pDcKIuR7r7eiRAn7b9+j
	N9om5EiJ28T+f7q3CE+XsiHT0DFPXUPMEnFJ9/70xQ9nfqjijV9npsvk6b909pqgm9YsoEzYOp3
	UcbF4xMRgFNjAboydr1OC22kpjSbed1BTe1fhpfejbUItVBPPEqkKNy5Uxc0NE8bUXpNBN824Uu
	WUS9WYq0Qjx29
X-Received: by 2002:a05:7301:4b06:b0:33c:16f1:2e11 with SMTP id
 5a478bee46e88-34cdb6ed6b1mr1708219eec.7.1790773862800; Wed, 30 Sep 2026
 06:11:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <UJZ22UtaS1GSRPlyAst1og@nvidia.com> <CAPVz0n2F8LBqFs2bJERmgvdNYgtt1OEVtK3++CP9y0gxW7gCGA@mail.gmail.com>
 <arzn-TNbOlqXqQgd@orome> <CAPVz0n33c_uwfhsSguEfFfJ3FV=26SPtNTEpHes9f5RjnPDA_w@mail.gmail.com>
 <arz1wzEI_7e7ruKi@orome> <CAPVz0n12oiuc=5wjeNCuNtJpe-M7Ys=rHn0TOExc0qkweVQnuA@mail.gmail.com>
 <ar0HCfSKR9yr9Z44@orome>
In-Reply-To: <ar0HCfSKR9yr9Z44@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 16:10:50 +0300
X-Gm-Features: AclHuK9PDl69Sotr67TThU9DWzl51KL70LQ5tx9814AsWsSrWDYmjdY2XxCFv1M
Message-ID: <CAPVz0n26bPgAYjAdpqknPdMeQgYd=QEfZLX2VsACmkTQNJ581w@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 15:58 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:56:26PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:46 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 01:56:40PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13=
:50 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 12:52:18PM +0300, Svyatoslav Ryhel wrote:
> > > > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=
=BE 12:19 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > >
> > > > > > > On Wednesday, September 30, 2026 4:05=E2=80=AFPM Svyatoslav R=
yhel wrote:
> > > > > > > > Document 8-bit CPU parallel MIPI DBI Type B interface provi=
ded by
> > > > > > > > Tegra20/30 SoCs display controller.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >  .../display/tegra/nvidia,tegra-8bit-cpu.yaml  | 138 ++++++=
++++++++++++
> > > > > > > >  1 file changed, 138 insertions(+)
> > > > > > > >  create mode 100644 Documentation/devicetree/bindings/displ=
ay/tegra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > >
> > > > > > > > diff --git a/Documentation/devicetree/bindings/display/tegr=
a/nvidia,tegra-8bit-cpu.yaml b/Documentation/devicetree/bindings/display/te=
gra/nvidia,tegra-8bit-cpu.yaml
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..f0dab608b2936
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra-8bit-cpu.yaml
> > > > > > > > @@ -0,0 +1,138 @@
> > > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > > +%YAML 1.2
> > > > > > > > +---
> > > > > > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,te=
gra-8bit-cpu.yaml#
> > > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > > +
> > > > > > > > +title: Nvidia Tegra DC based MIPI DBI Type B bridge
> > > > > > > > +
> > > > > > > > +maintainers:
> > > > > > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > +
> > > > > > > > +description: The display controller in Tegra20/30 SoCs fea=
tures an
> > > > > > > > +  8-bit SPI interface that closely resembles the MIPI DBI =
Type B
> > > > > > > > +  protocol and is referred to as '8-bit CPU'. Each display=
 controller
> > > > > > > > +  provides two such interfaces, which can be used to send =
MIPI DCS
> > > > > > > > +  commands to initialize and control the panel while image=
 data is
> > > > > > > > +  transmitted via 16/18/24-line RGB.
> > > > > > > > +
> > > > > > > > +properties:
> > > > > > > > +  compatible:
> > > > > > > > +    const: nvidia,tegra-8bit-cpu
> > > > > > > > +
> > > > > > > > +  dc-gpios:
> > > > > > > > +    description: Data/command selection pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  rw-gpios:
> > > > > > > > +    description: Read/write pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  cs-gpios:
> > > > > > > > +    description: Chip select pin.
> > > > > > > > +    maxItems: 1
> > > > > > > > +
> > > > > > > > +  data-gpios:
> > > > > > > > +    description: Specifies a set of 8 gpio pins used to tr=
ansfer data.
> > > > > > > > +    minItems: 8
> > > > > > > > +    maxItems: 8
> > > > > > >
> > > > > > > Based on my admittedly brief research, according to the TRM t=
he display
> > > > > > > controller can drive all of these pins - of which there are t=
wo fixed
> > > > > > > sets as you mention - directly. So we'd need to describe whic=
h interface
> > > > > > > the display is connected to in DT, but not any GPIOs (which t=
hey really
> > > > > > > aren't).
> > > > > > >
> > > > > >
> > > > > > I am perfectly fine to not expose any gpios in the binding, if =
this is
> > > > > > preferred. Only question, which method of interface checking wo=
uld be
> > > > > > preferred. I assume if primary then nothing, if secondary - boo=
lean
> > > > > > prop "nvidia,secondary"? Feel free to share your vision.
> > > > >
> > > > > The driver currently uses the GPIOs to program DBI commands, so I
> > > > > suspect we do need some way of controlling those pins. Or is ther=
e a way
> > > > > to have the display controller program the pins and send commands=
? That
> > > > > would be much preferred because it would more accurately reflect =
the HW
> > > > > design and possibly also simplify the driver because it doesn't n=
eed to
> > > > > parse the GPIOs and then also not use the GPIO API to set the val=
ues.
> > > > >
> > > >
> > > > From what I know, GPIOs must be used and freed after use. Sets of
> > > > GPIOs are defined and remain fixed for primary and secondary
> > > > interface.
> > >
> > > So you're saying that we need the GPIO handling in the RGB/DBI driver=
 to
> > > prevent anyone else from using these GPIOs and potentially messing wi=
th
> > > the DBI communication?
> > >
> >
> > No, gpios are used for dbi communcation while their sfio versions are
> > used to transfer RGB data. So there is no risk in external
> > intereference.
> >
> > > It feels like there should be a better mechanism for that than requir=
ing
> > > the DC driver to request all the GPIOs. Maybe these should be exclude=
d
> > > from the range of valid GPIOs?
> > >
> >
> > NO! These gpios can be used for random purposes on devices with non-RGB=
 setups.
> >
> > > We can make sure that device tree isn't going to use these on a given
> > > platform, but there's still the risk of users grabbing them via sysfs=
 or
> > > the chardev API.
> > >
> >
> > Well, defining them in the schema as it is now and adding a note that
> > gpios specified in the binding cannot be re-used/shared may be a
> > solution. But overall it is impossible to reuse gpios dedicated for
> > dbi by hw design. They cannot be shared or used for other purposes if
> > dbi is used.
>
> My concern was that somebody might try to use these pins as GPIOs, in
> which case the GPIO and pin controllers are going to interoperate and
> reprogram the pin functions, potentially making the DBI interface
> malfunction.
>

If 8bit interface is in use these gpios cannot be used for anything
else. You can be sure of that.

> Or is there some other hardware mechanism to prevent this from
> happening?
>

yes, pins are physically linked to the panel

> Thierry
