Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDA542812
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175414; cv=pass; b=urj4q7n5GELPT6Vd7ZswN1+/3KuluhH+PuTdku0zM1H/Wa8fUg0rEj9SBHMT6HEMabFSEA7jhcE/mXCltcmsWqr2wzHc3tX7/9LsI9PTh5agp1+57pTyVsV0d3U/Ke1nYTXZkgC0dToxAQdMJRjEMVkMCSxkKk+8Q5F8wnJ+5+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175414; c=relaxed/simple;
	bh=UyMSLBvW9tmyx5OoI5WsB7xjvglDq4V9P7yAbnK27AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swZMzAeVXl59d3s0Wbdw9R72DitE/61phgx+DYzHInQS6U9afLrlWGAUi0wJD3G88a9laQ12AARZvGnBl8nxvIWXCrKQafrcm8nDt9vfMnyHE38Djs4rYa81NirNOkw2D3htfZe0l+2SKkUxxF7eckh3SSt+UBSfWAlyhvzvmUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2MjLjcA; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2MjLjcA"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaad1544b7so1668471a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175410; cv=none;
        d=google.com; s=arc-20260327;
        b=EwImfXOYPhdUkwmcLe1IxlTVXoo1a4yMxx+UAg8C3m1IV67C1mZ2FfvkWXGrKZPj2w
         SjYPLyTXHjnPiglTpN9dMmx9yWS1A+YjVjDYZEfB4C6oEZGqUEauS0oQpghWZwztekXU
         ERDWRuw7yDoVHebEBcFHuY81SWg54Otw/whQsCLW/4H64FISwtKOP5pjlumxS+ukl2RB
         dytUlyuipQOzY0rnOgXMIVjQ2zARhZuUhQOrnUZwViZVKFNaVzyCK48rHkwMBH5wXkad
         D4jhCFKQMf6vgvF0PdUUqQXg5aF0JxIHlQSXMhJgzpAEvlzT2DDXGW2oCjmC464b+cue
         pOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        fh=TJRLz+ubKPV+3CDwVRx53VJLNsbVL/ZcLhQnALP14qI=;
        b=T1446tIbgLv33UWlw06OkWHqfACO8mJznIzcenfdc2v10y6TrI6+MQf4YkZizPsuDE
         5dx0jZroOLKXxPTCtQG/fvEAC8+5V9dYGBhWR/KaIEWhi3IwuuaR0x7gC8kBdZmJxcAC
         D8ienD8jcrvMlH/1V3O60ICDvgrBCRPhU8ABYSEFPL7DyA/Ymj/feP1bQJMe5oz9H4yq
         BQFdap3xhJkzOu41vOJ682QYmlLrVlGA191RKNh2i/FuTsUbCu/CDEn7kPK09V/XfBcp
         jEZnFbNJ+6Ia8Q+IqLj31b3KW9+aS5h3sRRTrglVC1ymTWWFJzKqS9T7iUlr896F0QhE
         ESlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790175410; x=1790780210; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=s2MjLjcA0AyFc3tudZzDSVIPZNG8WBN3K04612i2meXScdWB5e1QBUPbP12oXgjFqM
         laDKeAQiAhUeTGKziVP/M5QBOaGNFWVZMZrENueMVwMu9CMuq7P2F4+VsKRadF7ih7H6
         hDIwGMWsDP2c4pbSiTHynclCQfWmlo04XWR99zgAFtUHpyAXFgorbbsa4iCr9c8JKOAB
         10X8OS4S6NDkDk2tapaIgoH9njFFq68xO9oKaubR5Cxh1IhH4YEHGYQMTZZqagVkZIgO
         xWDDvGoyeVL8E0GRvBPjrj31JmiwqZJ00PeeWZ59lLDAcaN/GFZmzOe+JcAChHGiFufs
         OYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175410; x=1790780210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=HWQlmI7OK6Wf9gEXGYel1ODF805A33xgVAv+hbwGoZIHMzRJB1o6zweCH1b7n/C4Bb
         Z7fn2PrBJ/qITdRLtRyNTVHolUZ+YMf5NwxzaEXbSqw7nbZlhIaQXp+BLIsZuX82JQQJ
         TYbf7YZEinGh2ctVE09ABGZCNCdQ/leW2zm9xOeR+f0bpP+JOp9nhDQabvws0b3hcqIQ
         1MOtuBbLMCnckgABA/dIf8J/3IzmLdgfXdUWMpabNLDIYDmbJj+HXE5VLpRs/k9wtEe5
         u818B2yqbYjr8qPTHqdBDfuZ41Yw7QvW0a7uoZfjwodw3ym1PCcsaG3gx52VMEVAoBVR
         +uXg==
X-Forwarded-Encrypted: i=1; AKwUvByytozHm8BoIChXdA9NnT8QAGMJWVIJSy7h4UIM2h3uBuQSod3aH77yYcAEP+Z1X4EUj2amIPg95m8H9S0=@vger.kernel.org
X-Gm-Message-State: AFuF++l+/mDAK3YKBSUQeGDdWhAGe8fO80zjdcQctLgBYkAhkl9sgAdo
	RMBSERW88wz1yN1z2LrqVdMhKo842WFlh9l1+NrAuJh+3JZMB05V5T0y4C+teIw3BBB5Vi6wJ5u
	L461xNgqidM+YF0ucSGgVTRJpTiB8aNxbsesmKrobQg==
X-Gm-Gg: AYBFou2wRCWTagcWBFSm2AtXaD6ZWz8MlVXxjRR+ryLs+zMwY4smsqktUEBRvXft3SK
	28IaSgUKvSdJKgW3osp4bj4+i3cQFATQaFsiAYgh9li77sk9yixQ9VukcenxwEsmR5Qg4zz5Jqf
	nkfhiWLYEzwEah4TDFstXcuC3Ph+nwF7zYsjhYVvSJIvtcn24x/hIiAIFxyO7oFdTCPeZeLC6rr
	GgfBnRipgqEUNHaMFupEmD0FhXUSkzG0WZ+LH/MBw3qquz86aPRVxfOsPK0OB2p2ogT3IIlb7d4
	zQn2bM8pGBQyqLbibh3HeDcP+XImG8lZZ4geeefPzsgiiBy1miCJcnr2E16wufRo51IBNKtHZGw
	2NgWTmdGXOtU=
X-Received: by 2002:a05:6402:5514:b0:6aa:129a:1f70 with SMTP id
 4fb4d7f45d1cf-6aab3b647e8mr2420276a12.43.1790175409790; Wed, 23 Sep 2026
 07:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater>
In-Reply-To: <arLZj2DxBazf3wMd@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Sep 2026 08:56:38 -0600
X-Gm-Features: AclHuK883D6T5DYJIUEwz22c4TjWkQLK7CcGTqdjz7jqNMirfKCdfrjOT14z4v4
Message-ID: <CANLsYkzC5DU8j_QJLkuUcV2tYb=G86L_G4yiBZTePKSqiRdd6w@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 13:44, Francesco Valla <francesco@valla.it> wrote:
>
> On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > these are discovered through a resource table parsed by the remoteproc
> > > infrastructure at runtime, their description can be needed to probe
> > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > >
> > > Each vdev is described by a dedicated "group" node, which then includes
> > > a virtio-device node, which binding is already existent and used by
> > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > using its index inside the resource table as the reg property of the
> > > node; this permits to have multiple instances of the same type of
> > > device.
> > >
> > > The binding is intended to be generic and adopted by any remoteproc
> > > provider.
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > new file mode 100644
> > > index 000000000000..c4a0d84b1460
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Virtio devices over remoteproc
> > > +
> > > +description: |
> > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > +  and its resource table. For some of them, a device tree node might be needed
> > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > +  providers.
> > > +
> > > +maintainers:
> > > +  - Francesco Valla <francesco@valla.it>
> > > +
> > > +properties:
> > > +  virtio:
> > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      "^vdev@[0-9a-f]+$":
> > > +        type: object
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description: Virtio device index inside the resource table.
> > > +            maxItems: 1
> > > +
> > > +        additionalProperties:
> > > +          type: object
> > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > +          maxItems: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    additionalProperties: false
> > > +
> > > +    required:
> > > +      - '#address-cells'
> > > +      - '#size-cells'
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    remoteproc-cm33 {
> > > +      virtio {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          vdev@0 {
> > > +              reg = <0>;
> > > +
> >
> > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > provide their input on this.
> >
>
> AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> child nodes using the 'reg' property, not the node name. This I believe
> is the preferred way of doing things.
>
> > > +              gpio {
> > > +                  compatible = "virtio,device29";
> > > +
> > > +                  gpio-controller;
> > > +                  #gpio-cells = <2>;
> > > +              };
> > > +          };
> > > +
> > > +          vdev@1 {
> > > +              reg = <1>;
> > > +
> > > +              i2c {
> > > +                  compatible = "virtio,device22";
> > > +
> > > +                  #address-cells = <1>;
> > > +                  #size-cells = <0>;
> > > +
> > > +                  eeprom@50 {
> > > +                      compatible = "atmel,24c1025";
> > > +                      reg = <0x50>;
> > > +                  };
> >
> > The previous patch introduced bindings for virtio SPI while the above two are
> > for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
> > everywhere.
> >
>
> This is because both GPIO and I2C bindings are already defined - even if
> not used in the devicetree files part of the kernel tree.
>
> Moving forward, I plan to submit at least the spi-virtio bindings as a
> separate patch set, as they can be used independently of this one.

I suggest you leave spi-virtio out of this patchset.  That way we can
concentrate on doing only one thing.

>
> > > +              };
> > > +          };
> > > +      };
> > > +    };
> > > +...
> > >
> > > --
> > > 2.55.0
> > >
>
> Regards,
> Francesco
>
