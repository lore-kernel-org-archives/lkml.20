Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464629;
	b=l6ffPVMEPb1aqh5G7ztrMCEz5Z3c/N07v8LCKxQVh5KqVZ8ZKUZMGC1HwvfO2SOu053l
	 WXFdlkGmmcDRQlrhy4GC6M0TZ+2G2JI+aMse3jWU4/nZuZzIEM/QbBtwaFhPwbv85Q9Hh
	 HmUknAobggKrr1J6sdOVYIDhh05wtIBFi0Teeq8YPXImlgC44PTUDxHScjMrjeQMHQVgD
	 Ge2ttkUrVcNbiU0MnTQYftbZDtB2aNCENT81C+E/gpY9hpI+MDiVEhYDw3iNIe1ptlTMQ
	 zox3/A7/duDZbCWLX0fo8E366uaK0+CwT9ozla4MiaLTBadhYr3Duhlr44ya0zCMC1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hog/LSraSSmnGVZ4/pHBjOKsX6XesCbb7trG3Vy1+fM=;
	b=mFcJC5oslkMG4AsboT/Qs6eDMFqjyptdgbZynsdQYQKyKOzOa7xaGU+9qdcMg2jRuEY9
	 bdG7EIuznYWida7LR1VFd9t/0zKPtHm/wDgL/p6w1O/bBbcL6gSRoINv9ECZyPXNqKL9a
	 ecMlt2RooZ6dDwCmdYG6NO6k0z/gOmVZR3z/Nhsl3abKgUB+gK5PDgq/BjCGHwEtNsyAS
	 0SwWgnnGlvQHPW2Lvtl2YW0hXLxMz4Vb5fjsw0/ZT62+O36EZbtRsYvVnraHhIRRb5lmm
	 BePEL020j5XHjxPCwHy63GTi7ZoTm44VFbjX8EK9CU3s7r+pW4RzN8ioSCzjbSICH/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryQtlJXu;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F92606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06F92606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryQtlJXu
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eac6e4a735so92489e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464628; x=1794069428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hog/LSraSSmnGVZ4/pHBjOKsX6XesCbb7trG3Vy1+fM=;
        b=ryQtlJXuGOLY277F7JKl/5lVPrcSb4rXBnbEpO3itGx+1xjXisTz3mTMXT9bkdFlkv
         hLI9uz8ndz8i3smEGsFroNxgiT+XanUm0Ph1IlH67k5Ue1KuQRwS7EXQgAbJJa+np22k
         q0rrP9zbSxB29xD8T/+chHxZuU8uTRjYnEiQVjPLACCI38+RoawfwzpfVuQwad2+Cksk
         fi3I4k3ipvbnxAS0FehI70nvEIjGfWMatOQQieM+oioIcQYcrkwkX9JmyE7xij6W6G0N
         RB2OSw8PZzskWvAgY2IngyouO75X26t6vU4Gv6ggyPMQeY6wVgllKZD8Def5hxf3eLIR
         jq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464628; x=1794069428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hog/LSraSSmnGVZ4/pHBjOKsX6XesCbb7trG3Vy1+fM=;
        b=n1hOceNv6xtej1Z8mo4RGkCnM9ynDNGvTP47lmQ0hdgwe8xWcE1dB+dvI/wyOrrjs+
         VcpxfT3EQjJQu8JvKJm3tV+BAoDwGJ2sZ+foPTmi7bjc8FZteSaP58iTZO5dsgpmVH2Z
         YCfZxY64LEhobz9h9GIHTL3fs5MfnFxqxUNIsMMlxP7lN+J1AgW8hui7uu4yXgixZYwM
         EExsMGNIMdZwDLbaIfxK20KwE9tSd+B83drpUGrXbfVpr2oIVdBjz4pCnFOj9A8giv4a
         c2sMexxulpUAC3+4hm7NJe/MYN+3HlBKmqOy8H2L0MFEDcU6QlRljx5qQtut/UEC2NQL
         z5zg==
X-Forwarded-Encrypted: i=1; AKwUvBzSgY/sJP6zoQfgsFU/TuZz828ZUUS+Zs/0kFbIVJOWM5udSazccFZLnYwQDRjAUZR6F4Lh1Itq678klGs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSdR1wUtei7XVqXBkRaMMyZscr7ceboGfh4Qr1NFXw3JATUrxy
	bEByEe43b8volWDRDsyE0rcAP4BfQKnDorAnsbSGOPSpp9iJtQgGz6iB
X-Gm-Gg: AYBFou2JByYhrs2kkwKD+sLNSEPz0FuYb9v1yFQGDnA1krzLiJx/K9VA6nN+HWN8MFk
	bABpmeXdjuqg9jy3zKgSYE68yeHkRkQ+u4OorZEZpLGH6hbQvtBCdqhML2bJayXiXyfpzmdTWD/
	83Hqs6y52uzfxThxhLiCvSu+FzCg2QjhYaCou5ZX/JGhYcc84yRjYbsJSQmieBkSw61F7h74e2s
	7Lf9s2m40/g7cFWuk3v0hWHlUULTf042aGMdHItcU4aQaX7IqyhvhuuIJVYH1+K4aqDrUl1KfQO
	rpibjhdkF4DC56/sD8aEVWRzVf2O6LG7kok4p1vAoBYFGWu2UC84vOxZt+65EssPgzoT/hPnTYA
	FJ91/41XHcvgKLxEqH2cYcucOkRRmBbjGp6I+n6e1qkn+uR65oofr5g7EP+CaCuwiTff5TpXL1f
	8IJ/23q3BuXYjKVkcmFupndtOOmwOOOeGw5bSynxABkPFlOl0OtFLfbDIKMRBZDarUJCt5NxcLj
	U6c7k9dk8+wSRogln7RSBsJ81qud/9LXke/R5m5bh4keNssFeMY6lW035uCMObTyL/TYqubTPIS
	R8E56TB84RNoaDIka107wkCHPJ9+ChO1tHWvdpl3kCZUEA5efupm29ATDinqTEhlI/g/fA==
X-Received: by 2002:a05:6122:2b16:b0:5e0:2ba:5a06 with SMTP id 71dfb90a1353d-5ec6896981emr2989151e0c.4.1793464627977;
        Sat, 31 Oct 2026 09:37:07 -0700 (PDT)
Received: from JSANTO12-L01.ad.analog.com ([177.112.152.97])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf220esm5989015e0c.7.2026.10.31.09.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:37:06 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:28:06 -0300
From: Jonathan Santos <jonath4nns@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Santos <Jonathan.Santos@analog.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux@analog.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	dlechner@baylibre.com, andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 2/9] dt-bindings: iio: adc: ad7768-1: Document
 multidevice support
Message-ID: <auWKdiIzL1Gykxkk@JSANTO12-L01.ad.analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <6e2176d5547c59c39bb692e9768d7ac079b40f71.1792435248.git.Jonathan.Santos@analog.com>
 <20261026020500.6c13c0e6@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026020500.6c13c0e6@jic23-hlaptop>

On 10/26, Jonathan Cameron wrote:
> On Tue, 20 Oct 2026 22:56:56 -0300
> Jonathan Santos <Jonathan.Santos@analog.com> wrote:
> 
> > The AD7768-1 family supports aggregating up to four devices on a single
> > SPI controller, with each device occupying a dedicated CS line and a
> > single data lane.
> > 
> > Extend the `reg` property to accept up to 4 entries (one per device).
> > 
> > Add `spi-rx-bus-width` property to declare the per-device lane count.
> > Since each lane is bound to one CS, the number of entries must match
> > `reg`. Make it required when `reg` has more than one entry, along with
> > `spi-cs-composite` property.
> > 
> > Add an example for a four ADAQ7768-1 aggregation, with shared DRDY and
> > SYNC_IN pin.
> > 
> > Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> > ---
> 
> I'd suggest some asci art might make it more obvious what you mean here.
> 

Ok! in the commit message, right?

> > Changes in v4:
> > * Include spi-cs-composite property to the bindings. The reason for going
> >   this route is stated in the cover letter.
> > * We decided to keep the spi-rx-bus-width property because assuming 1-lane
> >   per CS would break controllers that don't support multiple lanes.
> > 
> > Changes in v3:
> > * New patch.
> > ---
> >  .../bindings/iio/adc/adi,ad7768-1.yaml        | 80 ++++++++++++++++++-
> >  1 file changed, 79 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> > index 7b72d14e104c..64c1cbeaa576 100644
> > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7768-1.yaml
> > @@ -26,7 +26,10 @@ properties:
> >        - adi,adaq7769-1
> >  
> >    reg:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 4
> > +    description:
> > +      Chip select number. For multi-device setups, one entry per device.
> >  
> >    clocks:
> >      maxItems: 1
> > @@ -109,6 +112,12 @@ properties:
> >    reset-gpios:
> >      maxItems: 1
> >  
> > +  spi-rx-bus-width:
> > +    description:
> > +      Bus width per CS. For multi-device setups (multiple reg entries), one
> > +      entry per device must be provided. Required when reg has more than
> > +      one entry.
> > +
> >    spi-cpol: true
> >  
> >    spi-cpha: true
> > @@ -203,6 +212,16 @@ allOf:
> >        properties:
> >          pga-gpios: false
> >  
> > +  # Required properties for multi-device setups
> > +  - if:
> > +      properties:
> > +        reg:
> > +          minItems: 2
> > +    then:
> > +      required:
> > +        - spi-rx-bus-width
> > +        - spi-cs-composite
> > +
> >  unevaluatedProperties: false
> >  
> >  examples:
> > @@ -244,4 +263,63 @@ examples:
> >              };
> >          };
> >      };
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/iio/adc/adi,ad7768-1.h>
> > +    /*
> > +     * Four ADAQ7768-1 devices aggregated on a single SPI controller.
> > +     * Each device occupies one CS and one data lane; DRDY and SYNC_IN
> > +     * pins are wired together across all four devices.
> 
> For DRDY, wired together how?   I assume that only gets set when
> they are all ready?
> 

They are combined through an AND gate, so yes, it only gets set when
they are all ready. We make sure by using the SYNC_IN to synchronize
them.

> > +     */
> > +    spi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        adc@0 {
> > +            compatible = "adi,adaq7768-1";
> > +            reg = <0>, <1>, <2>, <3>;
> > +            spi-rx-bus-width = <1>, <1>, <1>, <1>;
> > +            spi-cs-composite;
> > +            spi-max-frequency = <2000000>;
> > +            spi-cpol;
> > +            spi-cpha;
> > +            vref-supply = <&adc_vref>;
> > +            pga-gpios = <&gpio 10 GPIO_ACTIVE_HIGH>,
> > +                        <&gpio 11 GPIO_ACTIVE_HIGH>,
> > +                        <&gpio 12 GPIO_ACTIVE_HIGH>;
> > +            interrupts = <25 IRQ_TYPE_EDGE_RISING>;
> > +            interrupt-parent = <&gpio>;
> > +            #trigger-source-cells = <1>;
> > +            adi,sync-in-gpios = <&gpio 22 GPIO_ACTIVE_LOW>;
> > +            reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
> > +            clocks = <&ad7768_mclk>;
> > +            clock-names = "mclk";
> > +            gpio-controller;
> > +            #gpio-cells = <2>;
> > +            #io-channel-cells = <1>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            channel@0 {
> > +                reg = <0>;
> > +                label = "channel_0";
> > +            };
> > +
> > +            channel@1 {
> > +                reg = <1>;
> > +                label = "channel_1";
> > +            };
> > +
> > +            channel@2 {
> > +                reg = <2>;
> > +                label = "channel_2";
> > +            };
> > +
> > +            channel@3 {
> > +                reg = <3>;
> > +                label = "channel_3";
> > +            };
> > +        };
> > +    };
> >  ...
