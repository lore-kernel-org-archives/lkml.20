Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98363F44E4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788559554; cv=none; b=O7hDtIg8rnAACWilYbiTRLFzqt6N7XPsXZMY1TUAxlwXbXsBgza5VJ/b1PbtsMhuvb+H5MjCOUBcxcX76PiW61zu0/5Hi4W5XlngvGewRksIa78sicqG5WZB7IPi/vrccGyoNQ3J1SNLL6kirqNqiejbLe31FXPoY+UOaljhCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788559554; c=relaxed/simple;
	bh=850zEUtf6eyvyz/n9N68rT2vZ1UP3UAE41iBMsS+5XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shTzKCSumIrezTvu2gijTWJ3mGIVLfSPPg/pLElRtWEgIADKn95IkV8RDmxC5dQp6EhgHR6m+BcFzDtcJohsJ8fAZuCI5K25KKwJuPN1IMR9di05gltK2O6FyClQaQi+Vn9BedLUzC+YSoR/dsBNCuWFaUeVx3W2uRK1cAT45Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD4ghcsh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD4ghcsh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1548786a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788559552; x=1789164352; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XIFIlwrf7HKsMVMmerm3tqy7zlt6phSJBKdQug2lmoM=;
        b=QD4ghcshkXXoJ8I2rBLxdX8vvh+Y+yJ063c/SOtvcdkzI9CEMdBp0Mtx7oFoiFjrDB
         JB2xTlfgJO1lP2ElAKRoKLiqMVlrIaGZK7FzA/LeEFTt8WiYjveUxj5D6l/jZl+33dUQ
         KviqxqbwWeTDWkUR+16EIvTF2NoZv52uUExcHa1L+h5niX1jvFj2/J3dIqYjqtTtw09j
         IwdYgElc56pPhfD6L7THN+4E/oDHh4KkeV6HN44ZXxKeklb6XeZW3FTARfCRy1HHZnza
         +l1vWuwDAZVIIYWsU+2JWNvzs+aDPkIbZxQzm+hXKhPGzDHkrmdGjFaciFW7gya+LGQa
         Sajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788559552; x=1789164352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XIFIlwrf7HKsMVMmerm3tqy7zlt6phSJBKdQug2lmoM=;
        b=JDlfwnCzQc+ZvCQ433i4FayBUwx8nHNFVn/U3FstF97VH9+V0EgPpUuOY6GZr911r2
         IyFo1mfX0yAAE2ZorPQlx7A0+7C8LCXut53r70PM6NK2KR1MIY45OaqE/gjcj7+yfFin
         PgakRU3dMvkTAJXLzIDGmJcrncYhf+VXiKul+EXBNNfunORQ4LxD1aowG+hr4OAe86LV
         mGlBG8W35iNggWh0Np7v8BLNX4jkH92gyIZwPbcxEZUOjnrgheFXdN9jAgSw4hefYstI
         OiD1hw3HC0z3Lh472Bslq/4lNmnlgEVoQZtpN+8dtjNwEEjamJY56xjDQP9FTcOwAyqr
         S1cg==
X-Forwarded-Encrypted: i=1; AKwUvBy2CzY3iw0k4hDl4hSpsWI2OZgyFDxnuSk0UYwRuzB/r+WU6P7Fq4m8shet+HxLRYPMxXBFVP2Oz/eUOek=@vger.kernel.org
X-Gm-Message-State: AFuF++kumrkf9+4b8tRCjbHI2klxdtkCwNg53r1gMG4xi+G8hxiG2K/S
	hKXv60DD6BUG3xT0fEev5L2JkVFP6/vTkYKUbEOZWWE0Ox9PxstO8w/V
X-Gm-Gg: AYBFou3ZIWHIf4Wxh8EdNIia77r7Fge0MwK3sOE35H+BPcC2bUOo4WR16ryxWNKOGTH
	OkqJIjfnGzg7kykdZ3JOntjmpdPVUpK1XoAun8TQLAEqP3VUPZVTBELsNLAk9re3MQE5sOLLmhi
	NAK+ZmN0D4S4YeLmMlmAWfnug5f2zt9c2UyFreOh+jO5+r6RFey/P7Llsadpe8730pJrWO7I+Oz
	D+EbU/T0gJiDW+Vu/DSVcfuKC8oDnTLA422YahtTwwn9vYxCHYfDenf3O98G8dtxlTILaj2DyZK
	Lpghx20jjgcemKGc/PQqfghMarTg4zNQ5JuEXBlYS1ZqdM8bnwy6Wn4E4VATBX8nGdU6LLjRhkY
	dpZgCajiEfpHbTQwSkRbhSjtyB/m6wsoHYhtmvlKt9XwxDT1X+07upjQd07WJZk6UcZ4KKezAk+
	VtGTN5i18bCUTJCReEB67pYmR+nluKGdljVsDVc8cqQ3JAQltL4G+tA9au7mPmYp5MfeCO
X-Received: by 2002:a17:90b:1a8f:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39b2612ed35mr12168805a91.7.1788559551701;
        Fri, 04 Sep 2026 15:05:51 -0700 (PDT)
Received: from localhost ([2804:30c:94d:7300:da0f:c2c1:1aa6:43da])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm8280458eec.6.2026.09.04.15.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:05:51 -0700 (PDT)
Date: Fri, 4 Sep 2026 19:06:44 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@analog.com, jic23@kernel.org, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Subject: Re: [PATCH v1 08/13] dt-bindings: iio: adc: adi,ad4134: Document SPI
 connection mode
Message-ID: <aptA9HP82-ss45JF@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1788368334.git.marcelo.schmitt@analog.com>
 <d9b759d29fa8ca12b6cf083e180b2556ca4533f0.1788368334.git.marcelo.schmitt@analog.com>
 <20260903-liquefy-prologue-9ec914cccf04@spud>
 <apsufKf-EOvTfpwf@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apsufKf-EOvTfpwf@debian-BULLSEYE-live-builder-AMD64>

On 09/04, Marcelo Schmitt wrote:
> On 09/03, Conor Dooley wrote:
> > On Wed, Sep 02, 2026 at 02:24:02PM -0300, Marcelo Schmitt wrote:
> > > Document how AD4134 chips are connected to the host SPI controller
> > > according to different wiring configurations.
> > > 
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > >  .../bindings/iio/adc/adi,ad4134.yaml          | 22 +++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> > > index ea6d7e026419..d843c02a394a 100644
> > > --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> > > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4134.yaml
> > > @@ -131,6 +131,28 @@ properties:
> > >      enum: [ free-running, gated ]
> > >      default: gated
> > >  
> > > +  adi,spi-mode:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    enum: [ no-cs, 4-wire, one-channel-chain, two-channel-chain ]
> > > +    description: |
> > > +      This property indicates the SPI wiring configuration.
> > > +
> > > +      When this property is omitted, it is assumed that the device is using
> > > +      'no-cs' wiring. When this property is present, it indicates that the
> > > +      device is using one of the following wiring configurations:
> > 
> ...
> > I'd also really appreciate a dts example for a system
> > with one-channel-chain or two-channel-chain looks, given the second
> > device may require different supplies etc. I have no impression in my
> > head of how the dt would be constructed, so I'd like to see wht you have
> > in mind.
> 
...

Realized what I said doesn't make much sense. The peripherals can all have
the same configuration and thus share CS, SCLK, and controller SDO. The wiring
would be like the following

::

  +-----------------------+                               +-----------------+
  |         AD4134        |                               | SPI Controller  |
  |                       |                               |                 |
  |                       |                               |                 |
  | SPI interface    SCLK |<--------------------+---------| SCLK            |
  | for register       CS |<--------------------|-+-------| CS              |
  | access            SDI |<--------------------|-|-+-----| SDO             |
  |                   SDO |------->|¯¯¯¯\       | | |     |                 |
  |                       |        |MUX  >------|-|-|---->| SDI0            |
  | Data interface  DOUT0 |------->|____/<------|-|-|---- | GPIO            |
  | for ADC sample  DOUT1 |---------------------|-|-|---->| SDI1            |
  | data read        DCLK |<-------------+------|-|-|-----| DCLK            |
  |                 DOUT2 |<-+           |      | | |     |                 |
  |                 DOUT3 |<-|-+         |      | | |     |                 |
  |                   ODR |<-|-|---------|--+   | | |  +->| Offload Trigger |
  +-----------------------+  | |         |  |   | | |  |  +-----------------+
                             | |         |  |   | | |  +--| PWM1            |
                             | |         |  +---| | | ----| PWM0            |
                             | |         |  |   | | |    +-----------------+
                             | |         |  |   | | |
  +-----------------------+  | |         |  |   | | |
  |         AD4134        |  | |         |  |   | | |
  |                       |  | |         |  |   | | |
  | SPI interface         |  | |         |  |   | | |
  | for register     SCLK |<-|-|---------|--|---+ | |
  | access             CS |<-|-|---------|--|---|-+ |
  |                   SDI |<-|-|---------|--|---|-|-+
  |                   SDO |  | |         |  |   | | |
  | Data interface        |  | |         |  |   | | |
  | for ADC sample  DOUT0 |--+ |         |  |   | | |
  | data read       DOUT1 |----+         |  |   | | |
  |                 DOUT2 |<-+           |  |   | | |
  |                 DOUT3 |<-|-+         |  |   | | |
  |                  DCLK |<-|-|---------+  |   | | |
  |                   ODR |<-|-|---------|--+   | | |
  +-----------------------+  | |         |  |   | | |
                             | |         |  |   | | |
                             | |         |  |   | | |
                             | |         |  |   | | |
  +-----------------------+  | |         |  |   | | |
  |         AD4134        |  | |         |  |   | | |
  |                       |  | |         |  |   | | |
  |                       |  | |         |  |   | | |
  | SPI interface    SCLK |<-|-|---------|--|---+ | |
  | for register       CS |<-|-|---------|--|-----+ |
  | access            SDI |<-|-|---------|--|-------+
  |                       |  | |         |  |
  | Data interface        |  | |         |  |
  | for ADC sample  DOUT0 |--+ |         |  |
  | data read       DOUT1 |----+         |  |
  |                 DOUT2 |              |  |
  |                 DOUT3 |              |  |
  |                  DCLK |<-------------+  |
  |                   ODR |<----------------+
  +-----------------------+


So we would set them as only one daisy-chained device.

    spi {
        ...
        adc@0 {
            compatible = "adi,ad4134";
            reg = <0>;
            spi-rx-bus-width = <1>, <1>; /* 2 lanes of 1 bit each */

            <supplies, clock, and other properties ...> 

            #daisy-chained-devices = <2>;

            adi,spi-mode = "two-channel-chain";
        };
    };

Thanks,
Marcelo
