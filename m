Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE33130D419
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 00:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791334328; cv=pass; b=YiQuddms67+DjBJbXY/FgQJSqNJpDthFkjnG7K+uVwbBExCpg4A+b9rF6LNzzas8pAUIgJYx+fkkOPt4kwF5uAKPnvzWiudkf9zEGTgD4IFFof9Edt5KvRK5ieEeaM5cEJYlQlgXKZwNpTmIRFzYH1c4StGMK7ZlHLd4unwGZtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791334328; c=relaxed/simple;
	bh=BX1JTxbJEXnqNqVkUffmNNj1V50eTcs9S7BDpSMKKPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMHOL4u3+zczRBFoUDhFkk8ulkIoUEViBqO0zSeXBqjOgm6UIyYo/+yy9kZhUbCnnO4Rv6pM7sqwDfVMFDGgUTNvFCDf98bSTBBvr0CRD3TT3ZDkmDQS6koVJ/kCNhRBhaDKYX5IvvB5y8JaWAr3GNBiHdcg2WpZ9CKuHrvW1OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C9rCBi2F; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C9rCBi2F"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso4237499a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 17:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791334324; cv=none;
        d=google.com; s=arc-20260327;
        b=eNkmTZnSGXjrlmlUfysvK+qZENUYnpdXAJ2ckH7aVfOG/eqGERMwPTHO9/px4b4lhd
         UBVvGcWelX7LFN/7TFsk6LxkBPFEPwxm2aBTLtKbO2MAu/PEo1IVn89N/5CxlfLSL0SH
         R6FbYE9oKbYBMahpAx9so9FFJCu5nvhLTmTsLrRTneh+tlzvhSG1ziZopFGJ4F/pmH2/
         eStMFpcxbfpgQ+EVjWjEVip3INyUT3CUbTXQtJpRUMSwLMG08w21xV+kFMihnXQMGl9s
         54oPPnWJeX1r7u5ai9ja1WSWfX6pyrxaviHexvIYQOrAIWJLJgn0GtouyCmxWVGMqFv1
         ZwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        fh=4gnROrc75aTIWD2smqW5WrNvEYbXelp5UBpqAwOsCjc=;
        b=U1rPeoUxu0o5/b8PZuywe/arcWnQsUiSP8fFt0iFlHe1gJUJ2pckPVeErSic14jIoD
         k80iESsuYk5SkSvdt6eXGO7/KHW+EWA0aecUr1Qmblcg5r/seAHHdxhMCL+u2Rj6hl3n
         +eaCdQXhcevdNuNL+JyuEw49ZTgJDCXgFeBxwS+LKF17BZWCl+EPMWnh2Gg1q8CfZer5
         9bfCywiSgX99VcWNkU8/VErt7wX7+Sbv8ikmKlgaKPcB+Jr7AUceeskOPZNbjtnDxl2T
         G7Ijm2/Eepsodf8zpTjW2/ieBOepQsUICSuC7/s0l6ALaEZh19LjD3UxAZH1pIVGhTN9
         3bgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791334324; x=1791939124; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=C9rCBi2FjKM1nrti3wmzLt8Fb6cPzqlGg6nKk/Og2aTzQk0tWLK/pCUQYdBuk0DAeP
         RoILmNW1xaVMpwOzvmHXM7oXbdcoxQSVEnJazsZMEd+kjJNHskW7bkhMtwwH4Z2Tj9bk
         BUBUBvKvhv1yo3UoUIRD39bDI1cN3zJyoJIfBjGCUIO0wRGZ81XxuEQvvsczuphHx8Zr
         eE7H12eS0gcxcNCsDBkQbfncxrmgQxKxfrhzzMCvLnp49Uy5e6XskT0G060yhEk+sgzV
         Or34qUjhr6eNdtb9HXqpe2Z+w3EfIRTBWVsjfBxdCcPtIod1x23I4BIlrrH6lZoy925F
         zCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791334324; x=1791939124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNKeIlua+JayoelHkZCjyJRAYpDffnOMiZGr6BfxirU=;
        b=j8wKMAakfUfwyZ6cED2YE+hIzMRa+iwTPXYmzrfVPpp+w/+Zoz4VtmXwcO3VhHPVyf
         xDrsjB+h5rqVLLz1q/79TFyne1sgv0CXkaTkChgnxm+3BtzCwmpAu7ctkA4A1XfXHgU2
         Gr8v7ORGz56dOqkIxDlOz8SXUo7ODBws/9lGthfP5MsvXPrPhf95UKaxxjsn84DFyFLT
         KubopRQahg5oK6/SvbxudFjOsCu6j5HKm9hGrVh6vhTilF4n6Ru09UVrc6KnNUC3345S
         yCzZLCkoeOg+1kX6g/DUfaWuMXylcYPqC+/kZYcSitHAUlOj7QPEHHPpH2C42kFdMInC
         eXWQ==
X-Forwarded-Encrypted: i=1; AKwUvByVW3NzJltRNj5fnHKTQXWAqcZPhhroPnyMtrMaY9fa7V8Txlw+YJEjzl+t0DVYULC4yMZe4Wt0pgIqe1M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTrYpWwpXZb/wR/geXWdxUPA0GDJY5iOAlqxTZrJKPSZhtm8PC
	4+07g+fGaIqlV3HdUwqh5Y/Ad0ryj/RldwCw5QGX8Wp2WwabjmATR630MNgWRTFm5Wk5etH/+6Q
	nJB9NTCW01hRDN2mKN5b4SADjjLajt60OEslvUCm/JQ==
X-Gm-Gg: AYBFou3Kku8BcbZy2mj7mTEPelOj7mdk/xNyRnyMBgNsfucyGW7HjLursCV8yvGHTHp
	RXOnMIXOHfzRzCD3R2UEmhXD9cYSSyK7G0zBdzc9OybP0lUvwKthRXo2h4cBvLkIsAnWCnktyNx
	WnkgZWoBIaPx/2oZvmCYr3tyDx+bjDBwrEOKKv+aZ1lI2/A5qAs6QVDkrQV7NjMAwTN94w6BCV7
	ek33VXkBiO/b/o39cYHVyCl3I387PN8sfXH1E5SsBx9INHHp1O7LE2oUInv+WC90sTHVf+j25s0
	XgsMIiq+Kjtx+TDKIGLMIq3A/r07f3pJYDwRjXotGR+u4jbv8QXvxg==
X-Received: by 2002:a05:6402:455a:b0:6ac:73f8:2e50 with SMTP id
 4fb4d7f45d1cf-6aff29b8a9dmr558035a12.43.1791334323774; Tue, 06 Oct 2026
 17:52:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater> <20261006183910.GA2890477-robh@kernel.org>
In-Reply-To: <20261006183910.GA2890477-robh@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 6 Oct 2026 18:51:52 -0600
X-Gm-Features: AclHuK8OpBmmKBzqQvP8CWwB7vUNA7khdkA2Xv5tnX4fcSWpzyBVTx2EHup08IU
Message-ID: <CANLsYkwhrqk0nQNFuP_5aMYQCLGsLrzm-z9YP+Fvv-C1Ug8trg@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Rob Herring <robh@kernel.org>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 12:39, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 22, 2026 at 09:44:20PM +0200, Francesco Valla wrote:
> > On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > > these are discovered through a resource table parsed by the remoteproc
> > > > infrastructure at runtime, their description can be needed to probe
> > > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > > >
> > > > Each vdev is described by a dedicated "group" node, which then includes
> > > > a virtio-device node, which binding is already existent and used by
> > > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > > using its index inside the resource table as the reg property of the
> > > > node; this permits to have multiple instances of the same type of
> > > > device.
> > > >
> > > > The binding is intended to be generic and adopted by any remoteproc
> > > > provider.
> > > >
> > > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > > ---
> > > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > > >  1 file changed, 89 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > new file mode 100644
> > > > index 000000000000..c4a0d84b1460
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > > @@ -0,0 +1,89 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Virtio devices over remoteproc
> > > > +
> > > > +description: |
> > > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > > +  and its resource table. For some of them, a device tree node might be needed
> > > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > > +  providers.
> > > > +
> > > > +maintainers:
> > > > +  - Francesco Valla <francesco@valla.it>
> > > > +
> > > > +properties:
> > > > +  virtio:
> > > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +    patternProperties:
> > > > +      "^vdev@[0-9a-f]+$":
> > > > +        type: object
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            description: Virtio device index inside the resource table.
>

There are 2 configurations we need to account for: (1) each device
located behind the remote processor gets its own set of virtqueues and
adheres to the virtio specifications.  This is the configuration
targeted by this thread.  The other configuration (2), discussed in
the other thread, involves virtio piggy-backed over RPMSG.  The hope
is to represent both configurations using the same bindings.  For (1),
virtio devices will be advertised in the resource table and for (2),
virtio devices will be announced via the existing remoteproc namespace
service.

> Who/what defines the resource table?

The resource table is part of the firmware image and is parsed by the
remoteproc core.  For (1), as presented in this set, "reg" links the
entry in the resource table with the device definition in the DT.  For
(2), the definition is also a device index, but said index is
communicated to the remoteproc core using a namespace announcement
rather than the resource table.

I hope to establish bindings for configuration (1) and merge that work
first.  Once that is done we can extend it to cover (2).

>
> > > > +            maxItems: 1
> > > > +
> > > > +        additionalProperties:
> > > > +          type: object
> > > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > > +          maxItems: 1
> > > > +
> > > > +        required:
> > > > +          - reg
> > > > +
> > > > +    additionalProperties: false
>
> Preferred to put this before 'properties' in the indented cases. Easier
> to see what level it belongs to.
>
> > > > +
> > > > +    required:
> > > > +      - '#address-cells'
> > > > +      - '#size-cells'
> > > > +
> > > > +additionalProperties: true
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    remoteproc-cm33 {
> > > > +      virtio {
> > > > +          #address-cells = <1>;
> > > > +          #size-cells = <0>;
> > > > +
> > > > +          vdev@0 {
> > > > +              reg = <0>;
> > > > +
> > >
> > > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > > provide their input on this.
> > >
> >
> > AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> > child nodes using the 'reg' property, not the node name. This I believe
> > is the preferred way of doing things.
>
> It is either both unit-address and reg or neither. It's preferred to
> have them unless you are just making up numbers.
>
> Rob
