Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966141F7EA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758836; cv=pass; b=IrdC9QiR399un8T1rWbaUx/pYiRE6kxbfhBTltuGMkESmddZo6q7xqKrR/LuOrdWyX2D9onWt7N/B50ofGB7hM+lUuCIQXpSuRKw54jQ7Qxz+LE9XPZE09UWN8Xdv3ANa826vMqDybyimzFV+jAxOjY40F0seky2rpj9jsiGbWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758836; c=relaxed/simple;
	bh=2ptQLVKYeJjEOvJHdG809i6XfpxS5ynDbXh7OBZc7Ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uO3WP4p28ac+ObI7e0D+uSweYWdFuschOMgZsOeIPvTdRaL6uZGqHexX3ue0vTHrTz9lOHag1IbAbNOUL4ZU833CwMb8bir8Vszzr0vWZJWSE63T4KBkXd5UgN18SRgD5EVMSjolYuCzWhm3pWxV6bDePADk2aaY+uMbSe8QLbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q36lqAQL; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q36lqAQL"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so1381963eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758834; cv=none;
        d=google.com; s=arc-20260327;
        b=V0uB1ptvLcDEy7oS7eskW2ipj261U/YOPJVUETUmfsNftuV2ZS6M4zi/N2Zre2ITDh
         YDG+E4Pe4DRopCdAyFs9LY3rBQ9+msPYsobbJwZ7GEkZctA871rtopU6OSWeTyGXsJ2/
         msJJddRsdeV0JN38qIrvg1ik3w47Ivkcfl2hlTcigS+ZY5ih3wAyTUvBytEetbScJ76m
         eXUGk1ucNjhXOOxRzeGran7W3ocHzohlp8+4U7on+fZtnWfcUfjuqz3O3F2jQrkF/3B+
         0o3WK1HKvkWiSOAlY3MuhXARmtMzR/AAGPmNSKQKMxH9YnLfKFgNtTw/dFOTifjx1X0E
         55Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        fh=6VJ1uqErO2TDXs4IND/VUIWjj9vVuiN4u0t/O3gORYc=;
        b=fvFtwZtepzvBnYmB+0AWhPDibM9lqt6GAn8dPrFD/320SBmPRf5RozuNO9Idu1WKhb
         6plas0nLB5Shg23l4oaoso6wv8Dbdmc6laai9XmJ+P9R2Eu9GqJJuHYGV04r9lPSFPq6
         AwSiqQBAIPkh69pApNhZOS9scKTP+BTBbC+nysB1I0oP5hFUGspek0mt0WFYSGh+Z7e8
         iW6GHwodrEEkyUm7LU1Kt/Re4mCNz5Q34ZtUjQ+pWZc1A8n9xBcbNEO+ZlwdJtqtf5YV
         e1rPtEZ+TR9RxDQyja/jxg4E4AwalsE+FYm7OV6bdCzhQN0imNi95LjVpW7mFHRyj7Xe
         qlKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790758834; x=1791363634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        b=q36lqAQL0rX1j50QXQ4g49CYGMhYwKHCsJrYBLkFisCdAjHYrVK5zggtRjJx4pb+aC
         TWQZIYeYSVckcySzdbNxihiPbPpBKFkpWE9xzF6MfLJ2Sh9NYTMmeMBdvHR78H60BohC
         k5EgxQxavKZibsXmfUzCSuJC8x7UUXXeBc6/d494nPTBRe8D4+lR/yyutPxccyhx0+sI
         vnCFfGkyWdqlE5v38OXIOdW0nqoH6IiXSBrQoREUITfvhOjpfs+Bu2Jj3KUFbtHezRDk
         LvkMTNsvJoqZ/aOfnWOOP/91M5KYp8IGbOsY3GwADVgmpR0ouIU9sP7PxOLzyGhiQ+ZH
         J4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758834; x=1791363634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmnQsQ2nLUzstSMrsKXf5By3v5J3tmrAtywKsYCssgg=;
        b=NJy8t/Lv75H+hejmSQTgGp74YXXTs/0zQQempLDPGZaQMl82wt1txLDDxBceMuNsy3
         MqYVF2ad/gqrf3o7ZitbiP3c39dh39jBMRtJzZSUyEsoMJl+iewwXotJeP4bsao/QG7v
         Nsvitus/kHR8gZ40cP6lOqYxSm5WokUZtJdnA/H4ts8zKs0IRR7JGuPXLABeIclqTGnr
         Y8M+nCGga38xVc8iD/L0v5HlpdjRa+Z1lTYSxJTx+uYq+JwWV4HJ+WW9dCgOesC7PsK1
         KneRkHEyNZVF6kHihEdTfLfj5XYmIQxYSGSPOBDhSdD1T+HjUI+T0IeKpgw9hBAwGXnU
         mokw==
X-Forwarded-Encrypted: i=1; AKwUvBxRkFggp62u6g+vjoHE1klPw/S+O7Q0k0112k7BnXetAvZVlCREtXlF4N2z4p9AqwsK11Ym09oqLD4ZuGM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8OkzFR1N3oo8xJRJVssWtoX4Oaj5xRHd60lY7ArUq+hqLphJu
	1B764QV3z4Z5fMtIEIItZiRtzG4xNnVC8wsKTu6gx4DoR/ODICyy7TVgIohfEh01xjPxF/Yrc+e
	Rvm57WGofmzBwXDyI+XGa5nEKcJ7QzQ0=
X-Gm-Gg: AYBFou0vNRFdSymwsTpmBjmoBw9PXMbA0ANJ8T1zglOZE0z8xxjud/H1dJxJdizeJhX
	zfrIWbBmkmYt0ZZqXgh9aLD+wtE+nCBDk98fpoLAZxbLhjZQxdwHOO8E02FDGUvM7BNnSCcR3eg
	gBoFRuJ4+BRWyxW5wo42KRP315dOi6o/10MlM6GzRBZSyGO4D1Ddt3Zo0X30gqTYV0TgaWHOht1
	bAGQPaQNFOjbD3x3UHlFqXPqIajoVzhhZms/K29GRWgNy1r5S2HQM7ap82/mmrCOtO84g66lo/P
	KSt6dFQqQCjrMAUmYzyQFgJjk1C5Qkz/eIVzYP+MEMIBvQhqmNFVZGVJaVITbylpAkp4w/6inhb
	9azJuYkSbQY4r
X-Received: by 2002:a05:693c:6392:10b0:332:8b9b:bdc4 with SMTP id
 5a478bee46e88-34cdc3caaaamr1126682eec.20.1790758833695; Wed, 30 Sep 2026
 02:00:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-4-clamor95@gmail.com>
 <arzMF0wjcF_SVxpE@orome>
In-Reply-To: <arzMF0wjcF_SVxpE@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 12:00:21 +0300
X-Gm-Features: AclHuK-TlqGnIU7ukp8yYWTozjs2IS2nCNkcdYeOW3HWE0VGgW8HyLwmVml-FCw
Message-ID: <CAPVz0n3Oc4ocUWrtGgd-MdrdJ3SgDEi8onOkXi92o7hAn3y0Ww@mail.gmail.com>
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

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 11:47 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 10:05:32AM +0300, Svyatoslav Ryhel wrote:
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
>
> The description says that this is a feature of the display controller,
> so adding a new binding and compatible string for this is not the right
> move. This is all covered by the "nvidia,tegra{20,30}-dc" already, just
> need to extend that with whatever is new.
>

How would you model it? I have tried to model 8bit-cpu as a bridge, similar
to how DSI bridges are modeled. This reflects interface used to link RGB an=
d
panel, without inflating existing DC binding. If you have any ideas in mode=
lling
this, I am open to any suggestions.

> Thierry
