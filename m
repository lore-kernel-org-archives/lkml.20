Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268C2931F8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279001; cv=none; b=uP7HiJxrV1SevFhI21083Qvz7PRgNSKvij08lg3GajKy1OHf52AXRn4F7Cyc8OSlZxodVgWZiT+P7G71YMZc90f0fZVo/yII01OWK1g0TuSTMl8b6tM8j02WRKwGZir/wVwjgXa50v+BT0RFcFJpZ+Vf3+/iYHeAML+zbl3q+/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279001; c=relaxed/simple;
	bh=PbO3I5Wzv6Q0HLNgTgjdCNxGPB2wiMT01lvMSgTu2s0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSX0v4BCRPIREEPSxbtICoEc2oaltHEfV/78QPtL6qYUQ3UrsVfAIEYFh0PiynjWyfvrny1dav7LzMgjJ3JJFtTFcscOT/rMuSC5CDtAfxTlX6egZIuFcwuxhdYOiLHDYqBSQoxTH5kjstuQ4YYXgwlqFXAzV0Dj7X1IUX/8LSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5356b6a7fe5so973621cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278998; x=1791883798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVTxTfkNs+IvzxUmHzgjnWzXGShomJ5y8a1XbauhqO0=;
        b=dRdRNmtH2kAKaa9hQHszXFLRbiW/aP2RS6V7Y4bH5oRSgVg2oOYP4PgtkdTyI2CAUd
         /TDbmLB7MUMYFlXo5JL9rHxMNE3IQ8XY5OlLL6r/2GOvKz7PWBsNbuq9EkTt2WH+Lflf
         kxpukcWnpmPE4610Io0XYTxc5cy5WMDuLnWpxEzLp+PFxq3FTRk3QRCZV2f90Ei04t9I
         i0MWX6Ol04DTQ67W5B32S4QuUnjykdzfbJLJVVVNcD5CWyeHy5OKrc2T24oa82X/t/LV
         eGJ+IrN8ts6y6sU/s+GBw3J5bkFFPVeb/aA5UmPPtuO1PXxtfyUVaLXZZG9RQi7S812J
         Ns5w==
X-Forwarded-Encrypted: i=1; AKwUvBxl8vSBZy56hqzaswwJwqlV4DL7e6NpzOJzqt+LhBqVnXXnUN5KT1OnW79D3GXhJwhQTI027ooNbOgmINE=@vger.kernel.org
X-Gm-Message-State: AFuF++m5e3F1vngPVAgJD5F+wU9ElxgMlz//XtcpV7iXHMhIROXaLQ3f
	VLe+dZ97wTn7Ww618ZBom9itrfz4d3OU/A1aGfnOfjpphteF4jELbDXV2TLclobgT/miBg==
X-Gm-Gg: AYBFou17+npGJkX7DMx0C2BYYSggCqPBzt5nMJphAbzJbSLjkO2pMdCK2uMj4SxdT9p
	tE1o41VjhOQ9Cs4sBLXqPAH7xGwxfQ3ZoA5WjKbFcYZtJAS9frLsQ8riFnOPJvQR5G75wBxFTIB
	ESLS+6715Zn165wgyx8G3PZl4+Kvw2UJr/OGNP0AmDXkE3brolgv3d/awQ5aMOgB5NqJLiPYLCs
	BVlenNEDYLDQiCTpl9HM+mNwP9MvWwhciCAxBOMjDVr0jbDfTHidzcqwImf3P2gZ36mWaQSkms9
	iTUYjR8kzz8ToOSrSwx8B/ErgrcTJoQBNV34jOMNduTGveeBztcXUSWVDOfUTOsRclq2nx8rNxS
	jUx4BuTMijADrADQekeZ3FBeJSIwFjmj9bR4YWPpe7T3huRMXBPHLm2vlL1VYu5c7eIrNf0UxiQ
	ARpTbxY5WxRHuxW3BI4JVNV2aPCkajmViwwYPuKcpV764VDp/MtVLXL6ku8vzrtM5S6ezWcuK4Z
	PE8KTNXeQIviZi8QWTdrcd/YlltNBsvXjCUrrkG6UNQn7Xsu5w6QcHTPGqQSROkLuY=
X-Received: by 2002:ac8:7f44:0:b0:535:21b3:60cd with SMTP id d75a77b69052e-53566d89372mr9722981cf.38.1791278998483;
        Tue, 06 Oct 2026 02:29:58 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398a5b6d6sm117021371cf.9.2026.10.06.02.29.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 02:29:58 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533778ab0bdso5155531cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:29:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxs4fArfRUIkxZyLAOLtKp8oWYtS0vA0qX4YYi2J21jJQafPjbduKzpRaxDM6yaV0saunISTj+jEhwiqxI=@vger.kernel.org
X-Received: by 2002:a05:690c:7108:b0:8ae:7fb9:8cb8 with SMTP id
 00721157ae682-8b04f3b6667mr2040067b3.17.1791278683947; Tue, 06 Oct 2026
 02:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004144046.391444-1-tanure@linux.com> <20261004144046.391444-3-tanure@linux.com>
 <asN_-5zalENhkdVA@squawk>
In-Reply-To: <asN_-5zalENhkdVA@squawk>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 6 Oct 2026 10:24:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
X-Gm-Features: AclHuK-bVUCezgDuqipnwl794qiJm9NtCr-yWp4gG5KzmPFjPQMebZJ1Y2LQr9E
Message-ID: <CAJX_Q+2hD_LTcimHAVhyzgTnp9jYxKKFD2TK5cv9-wLjDh8+wQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Conor Dooley <conor@kernel.org>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 11:46=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Sun, Oct 04, 2026 at 03:40:42PM +0100, Lucas Tanure wrote:
> > The T7 has the same ethernet glue as the G12A, but the controller
> > reaches DRAM through a pipeline stage that the hardware design inserts
> > in the bus path. That stage has a gate of its own, which no other membe=
r
> > of the family has. Nothing else in Linux claims the gate, so it is
> > switched off as unused and the port can then no longer complete a
> > transfer.
> >
> > Describing it means a fourth clock, and the fourth clock of the existin=
g
> > list is the one driving the timing adjustment logic. The T7 applies the
> > RGMII RX delay through PRG_ETH1 and never enables that logic, so it has
> > no use for that clock. Give the T7 a list of its own with the pipeline
> > gate as the fourth entry, under the same name the SD/eMMC controllers o=
f
> > this SoC already use for the equivalent stage on their own bus path. Al=
l
> > four entries are required, since the port cannot move data without any
> > of them.
> >
> > The RX delay range is the one the G12A has, since it is the same
> > register field.
> >
> > The compatible pairs the T7 name with the 5.10a Synopsys core the MAC
> > reports, and with the generic fallback.
> >
> > Assisted-by: LLM
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../bindings/net/amlogic,meson-dwmac.yaml     | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.=
yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > index 90ef79161ab1..96118b4d1560 100644
> > --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> > @@ -23,6 +23,7 @@ select:
> >            - amlogic,meson-gxbb-dwmac
> >            - amlogic,meson-axg-dwmac
> >            - amlogic,meson-g12a-dwmac
> > +          - amlogic,t7-dwmac
> >    required:
> >      - compatible
> >
> > @@ -57,6 +58,47 @@ allOf:
> >              - const: clkin1
> >              - const: timing-adjustment
> >
> > +  # The T7 applies the RGMII RX delay through PRG_ETH1 and never enabl=
es the
> > +  # timing adjustment logic, so it has no timing-adjustment clock. Wha=
t it does
> > +  # need is the gate of the pipeline stage the controller reaches DRAM=
 through.
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: amlogic,t7-dwmac
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: GMAC main clock
> > +            - description: First parent clock of the internal mux
> > +            - description: Second parent clock of the internal mux
> > +            - description:
> > +                clock of the pipeline stage inserted in the bus path b=
etween
> > +                the controller and the DRAM. Without it, the controlle=
r cannot
> > +                complete DMA transfers.
>
> Have you checked that this actually works as a limiter to only 4 clocks?
I have now, and it does limit to four. Adding
a fifth clock to the board gets rejected:

  ethernet@fdc00000 (amlogic,t7-dwmac): clock-names:
    ['stmmaceth', 'clkin0', 'clkin1', 'pipeline', 'bogus'] is too long


> There's an additionalItems: true in the snps,dwmac.yaml that I don't
> know if will permit random additional items here.
There are two checks on clocks and both have to pass: snps,dwmac.yaml
allows 1 to 10 items, the t7 branch allows exactly 4. The
additionalItems: true only relaxes the first one, so the second still
rejects a fifth clock. The "exactly 4" is not something I wrote -
dt-schema's _fixup_items_size() sets minItems and maxItems from the
length of the items list.

>
> Cheers,
> Conor.
>
> > +
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: clkin0
> > +            - const: clkin1
> > +            - const: pipeline
> > +
> > +  # Delay definitions for Meson8b and newer (including T7)
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,meson8b-dwmac
> > +              - amlogic,meson8m2-dwmac
> > +              - amlogic,meson-gxbb-dwmac
> > +              - amlogic,meson-axg-dwmac
> > +              - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> > +    then:
> > +      properties:
> >          amlogic,tx-delay-ns:
> >            enum: [0, 2, 4, 6]
> >            default: 2
> > @@ -106,6 +148,7 @@ allOf:
> >            contains:
> >              enum:
> >                - amlogic,meson-g12a-dwmac
> > +              - amlogic,t7-dwmac
> >      then:
> >        properties:
> >          rx-internal-delay-ps:
> > @@ -143,6 +186,10 @@ properties:
> >                - amlogic,meson6-dwmac
> >                - amlogic,meson8m2-dwmac
> >            - const: snps,dwmac
> > +      - items:
> > +          - const: amlogic,t7-dwmac
> > +          - const: snps,dwmac-5.10a
> > +          - const: snps,dwmac
> >
> >    reg:
> >      items:
> > --
> > 2.56.0
> >
