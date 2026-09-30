Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81B4CCDEB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768857; cv=pass; b=jtVogxwE5D+TfMUp1+qESsJaeOCApzTgRMSZAMe3TWjT0XmXzx/cmBqc41tbJQXAsUmPjNXQ8KJ8Re0jAGhHKGHdGO/QPVKVGkR7n6AeuwhkS93DkJmwYWclNEYSmdbh3sOYW3syeDEVjQoMAAdWzUDOlg86CbzcnZR33QdGTDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768857; c=relaxed/simple;
	bh=tCnxQKaF5n24ux0FqNmPiHkkdScPtGclpUr1AEGXTyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maECERcoXxSktM5GtJ1gC8MrWe/CpjwZYtG1UJQPhBqEat/zwVD1qt7EjwPcZUhKwnWIyNQKjU0fNXIPuaswK/GfVQ8g4BPExgUxb+88ZZgzGNFswcf+nCm2Q1Lj1Ly4MqpTKr9QJ51hEs6rAH3NFimykx9mVV/T7ycsfHakWAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdQ8H+ml; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdQ8H+ml"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342773d94a7so3250645eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768854; cv=none;
        d=google.com; s=arc-20260327;
        b=YWaYwjJs8iPC7HfWGDdcP8ZrOuebNrRUELqOgm7UVimnGnfm09bOSrQn/f/9l97LGm
         +lG3r7DPwPP70yFYo4Rem4b+rRRQ1qdpJYP5FyUTtfFbdOC4T6hnBGH1VN3+p4/Whon+
         cnWvqU0EuKVOuqy+mU7s5SF6saEyI+5lkMNgwrbJXclMd0wcujlCdpAyrlvkXorKQx5R
         oFwk1/CHADnt5TI4E7hsWzueb0KoyqqJ2KWm7SCuY9I6YGnyBMVY2UghP4UT5t5NinyP
         QjNdXdJFhek77RuBC0MbHqyeM1vUn0kmhrUh9PNCBeatnOKuJtiIwmEXQZCdF8KKvoUo
         MH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        fh=uY3VaLT2pdWKhX1vmboZ047EoeMheYv3pbsB6pyhfkE=;
        b=XI5QD+oV8yam15tjP5KEsJOK/Funsk7SV6HN3cpuKz0DTN7Mdwu9/lyzqyvinRtMTk
         Yjv1SXHKFOE0lhA9i32X3+rb77MyuH3T/3v86L/pX34bdnl4W053qtJCj5dEh7/sQhZZ
         i+k3pkEnQL5DmgFIlJpj95027AEDkDWA1j2m04/HiL3KZMe9X/WGC7Wweo6+34c19tZz
         VrmJIr0lVioUo7S5aYtwXerHCSybk0APOTq0/9qWBVvN8yWdFqmKUVbctNrEYEeScFQn
         NnmIDkV9XnKDyjYnbohff175bK2+46/dXM+LlLm/bn4T6Cjj0mqt5gYL74kvcdufY32R
         XyfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768854; x=1791373654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        b=bdQ8H+mli6OECyMRBFOBx36NS7W/muNtXD+vOdjl/9B65WwU6Ogf2fWmYKFIn7d3Ww
         oDrpOCjhb0SrETHWTdOoNMcuHsM1LBq8bHw705YZ2YBdumiuO4UtM31adsiDOaeqtUpY
         X0RH2QRGyzpwKdP8u+5BLXSvmy2bHLS/KAReeR5zdzIve/gEP81zpjNXgXpe76WA4U6B
         MViCKdDsF9Z/mjyYWa77vspcPYAii5KJ85jwvUwZWzAINFHbYUU2SgLtp8iIIj5Kkfja
         HzCM/g/xKcP2u4/TTPO2vXllMC042CKqaZmUOICfBa3ZinfPKk6ResP7Tevue3J7jAf0
         wQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768854; x=1791373654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CU1MX58mqxg2gi+eZkq0TdZ36IM664l7Pic4XLSnu5s=;
        b=0E4cAZtLVEdZZ39pbgb7rXwypq2hYjMI5kW7rL3UrmPei+67RxnNx2rFWuFkHsdSD8
         0anIviSLhg+GEJoAp1N44+5+Rlo515RpyJtWwfaIkiGLcTPP/hOq+FZgszGMKzJceZQA
         Kg9RW+pYGMlWk0xBrwNxN3za60dQZFpdQSfOvIiD/bPIH6TIjTjd9yk4A0+TTsM0d2nK
         LssIYAeNMd0MOk0ZN1P4uZWSp5vPLA8+T7u1que83RpB+PRQ+J0wcqnsI2wAtkwuettl
         tNm8aBZbpNs0gFKCe6/VVVDWcqoBqYB3xcFCQb6TV63qarNiLSR9W3BchrIXICuAfWkk
         yPdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFq/ibN3dRcYZkipKxlTEpomXgmpvU2Xb1AdcA970R4ZHi435OwggCIHUP7/vcV/nrwzhgdhmgB8D4bKs=@vger.kernel.org
X-Gm-Message-State: AFuF++kGjx0s+fCQ/RYCfgL6r/HfLs937BnmenQOzjVkE8DUAtn7wdrC
	nit1/C5c2G0R63GHvcqm5w2D97XPe7enkmjUv0nSa9T23QL0J4qmUD7dT2IW6FJB5SCm+V4V1vG
	h5hS/hEUBMdkiQKaVCjsxYoq28+mchdM=
X-Gm-Gg: AYBFou1A4j37Xn5A0WGsZankOaQz488TdZPWY7aKUJqTQ4o0mNiU+c9KJ3IBG45L15Z
	gSXFLyEvMbEQkZEgN0zLerAM2WjSM4noQdxW2ZADOo4cIXJJMsh+JzkRa3gF/NVKqH5pNupnKG1
	ALMOt/NJ95WOsz7KLgbROSiBAxmH7CY5FyufiZ55hn5t09DxSbZTNUx0Bysc1RVQcI4FfnmCFrp
	VU+c/uGNUQNh6eqnXwp0kDfD5yVBwvzEs7GLmELV1GcKsJDM2Y4vQGR+SCrIn9jP55iau2cVIMW
	wltRxLoY/3avybNmrwV41wuar0k+vNHnvQANk90+cI/2rAtYduwZnrCFS+u3L07EGbn4619o+w5
	Nk7vLBbx3JLi52b+gL8tyuKo=
X-Received: by 2002:a05:7301:9e08:b0:34b:6d45:de57 with SMTP id
 5a478bee46e88-34cdb5f5697mr1375712eec.9.1790768853829; Wed, 30 Sep 2026
 04:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome> <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
 <arzlR8mCg9d_z62L@orome> <CAPVz0n0jnitNemUyhi9C2SgbRbJA9CinY1DrR-r7gnN=CaYGiQ@mail.gmail.com>
 <arzpluDc-Ib7q-K7@orome> <CAPVz0n0sQo-6xKOGzd3LsJzzAr7_TficW4KeU320Z-tcRUne9w@mail.gmail.com>
 <arz1BYJT30VTosYj@orome>
In-Reply-To: <arz1BYJT30VTosYj@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 14:47:21 +0300
X-Gm-Features: AclHuK9Y2nKRAcoyGWBo0XedUHUJ0UGBHVCSLavApiAyymEH-DqiDv0t1HCafQI
Message-ID: <CAPVz0n18Y0oAREzJvm3utM3XohQXyoRWGBm=7uRvzVRTSK9CDw@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: display: tegra: Document 8-bit CPU
 parallel interface
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 14:41 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 02:10:15PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:54 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 01:42:17PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13=
:34 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Wed, Sep 30, 2026 at 12:00:21PM +0300, Svyatoslav Ryhel wrote:
> > > > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=
=BE 11:47 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > > >
> > > > > > > On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wr=
ote:
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
> > > > > > >
> > > > > > > The description says that this is a feature of the display co=
ntroller,
> > > > > > > so adding a new binding and compatible string for this is not=
 the right
> > > > > > > move. This is all covered by the "nvidia,tegra{20,30}-dc" alr=
eady, just
> > > > > > > need to extend that with whatever is new.
> > > > > > >
> > > > > >
> > > > > > How would you model it? I have tried to model 8bit-cpu as a bri=
dge, similar
> > > > > > to how DSI bridges are modeled. This reflects interface used to=
 link RGB and
> > > > > > panel, without inflating existing DC binding. If you have any i=
deas in modelling
> > > > > > this, I am open to any suggestions.
> > > > >
> > > > > My suggestion is to integrate this into the existing "rgb" node, =
or, if
> > > >
> > > > Not an option since it is not clean RGB and there will be no way to
> > > > distinguish RGB from 8bit-CPU.
> > > >
> > > > > that becomes too convoluted, a separate "lcd" node (or "dbi", wha=
tever).
> > > >
> > > > This is fine by me but nesting nodes without compatible feels weird=
. Oh well.
> > > >
> > > > dc {
> > > >   compatible =3D "...";
> > > >   rgb {
> > > >     dbi {
> > > >       ...
> > > >     };
> > > >   };
> > > > };
> > >
> > > That's one option, but there's also many other ways you could
> > > differentiate between RGB and DBI. Could be a simple "nvidia,interfac=
e"
> > > property in the "rgb" node (that defaults to RGB if absent). It could
> > > also be a node that is a sibling to "rgb" (rather than a child). Or t=
he
> > > child could work, too.
> > >
> > > Ultimately we're still describing aspects of the display controller h=
ere
> > > since this is all registers within the display controller's MMIO regi=
on.
> > > Nested nodes are purely for adding some logical structure for the
> > > description that makes sense.
> > >
> >
> > From my understanding data is sent basically as RGB, at least RGB
> > configuration is still used in downstream. Panel commands are sent via
> > DBI
> >
> > dc {
> >    compatible =3D "...";
> >
> >    rgb {
> >     port...
> >    };
> >
> >    dbi {
> >       ...
> >    };
> > };
> >
> > This would work nicely if DBI is modeled using bridge framework. I
> > would strongly insist on keeping it as a stand-alone configuration
> > separated from RGB and DC.
>
> Okay, maybe give that a try then. But to clarify: this should all be
> part of the Tegra DC driver and not need an extra compatible string or
> separate driver. The DC itself should be able to function as a bridge.

Noted, I will not add compatible string to the dbi node.

>
> Thierry
