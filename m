Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464204;
	b=L7qS4qGm2i5vE0D+5VfVmtCwJBjjN2eSE+u1Rv129CZ99kYyqb0flPf0MTBLaKvlVXJ1
	 GyWRCHyrHfgGtMdpDL0nH8O1WnBP85OY1HQnyGCv5oWF3hlMN/DKaUBQighrvMRaVbXQW
	 3dX2BMYumzKWHl3rRqa1nOVIa7oBAccx647VN0cIphTUImgkpnjC/9owTDFA+PqFZBbgN
	 GAMvppf/z2guFwBKv4uQNoYmnnnb1I7e+2O3NfMh8msee42LLTrEjBg/eCfRkoPxN5ht5
	 A9AX3vZ389YqiTActwzMfnYiOASHvC6Nnqogi1ycJ5/EcaPZSnu86Bv2RwQ5SmqT+uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EgmEJPMkjbYM4FRPkppwPSirxq+mxfkqTc2AOCI0TeY=;
	b=Bt0WDmU/aHaCUx3ur4JLxdK+tzSYPZxSGRut5RUFzl7p4+tMhnZps1gxMzT9f9HTEkUL
	 p1VpeLJxP5K3EEbSzY+grw3Sau5s0P5WDDj58aTNL/NG5rVMpNvx9OsTv8vmE2o1NUfbJ
	 aouO/AJ65JtSMf+IcgEHeT+IJ0q07Z4MZLJ7rrDqhZEdoThQvhpai199gPVwRdKp748Ar
	 9/6J2Zu7ma5RRVELzcfhmFJ6u3NLa0NVN1Sb5QVeMePAMe8sKRQHuC8GKTb1dIWL1dfeK
	 tSDujubDWvGYwsFK/iLr9M2wy2BCV/a4APpqpGRrAVK6sW63jANvn79/vzhaS4lCJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaCaOq1I;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D4F606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D4F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaCaOq1I
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c7d1fc8f9dso111727e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793464203; x=1794069003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EgmEJPMkjbYM4FRPkppwPSirxq+mxfkqTc2AOCI0TeY=;
        b=NaCaOq1IS4vwEHlRWQvnbsS9HsMF9dwaaD0vhkRKTrgIcVBZDkggWXU8/3tG46OTdm
         cpg6OM1czuebilGZOLupqWhc2EKGo3X/Gis5gz7rTdzJVzbdJIeV2LCJv1TWzJL5DEWN
         JxQeHBTv4vFWePfOxdUvRpDpzpHzgd+hrOSG3YEOlcvtJZa782VtaK0deY2K8j3uFQnW
         1XwmOXkCjWyWeI2h+QC3wE//RKwy9MhnGX1cOGQoLEfUxemm/XvK58do89hhvf6zn/eO
         gV/Uz0ZyhF7uGHPzptjbevWf6qPBT0ntpJg9jgGW0q1RNqoRMh4R/8+p5hkxDnnIkfuv
         8LHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464203; x=1794069003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgmEJPMkjbYM4FRPkppwPSirxq+mxfkqTc2AOCI0TeY=;
        b=W+R0vH0SZ8TGeWonW6lr84Kkw9TG+bxSf/Oyb3OeILTv6BRvswKBSNW387lw/6Ztgr
         MhAV4qX89wgOVOU1nYSU6KZncMuesVZBXmcsmyCkmxj0B3SDvjavgt/BXCUm8pMPs/MN
         J9DCC22SV5eGXTRekGFBiiQNPmt/+McGBCw13qoe7C7nHNHB7dOTMGBwAywVBoxxv+OG
         bJgHikh5J+DiO19iPj6YJmwbjwknxuzNnFN2H3CLOtlGnIEKarK++ipinGh//j0M2SNa
         SkPHKMRHaw6qd0/teUzCQ7OmUiXULx3ObPiFkGyD5Kz6rxU6Uz4XBgNJc8waPZzGj1pa
         olWA==
X-Forwarded-Encrypted: i=1; AKwUvBwuYC/H4h0vRQ+M0ZQsLYhBqZ6NdSMzvaXnwmEPLQqkC1mxcaoLqGQ5axlnf4Xs3F9Ti7oDWPaO89uHHqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1RzgzJDmmzTzoDkZpLgPp0kuFW14wMvJmRzQ0m1q7MpDx9biv
	U7KkaacEJnsJZEBGo+fQFyubXyokEIk7CTrW5mbPdEehzsOhTqamxHzT
X-Gm-Gg: AYBFou1JNUcivD/kXjaxH+WEj/T6pCeO+n5hbtK64bERwPZUBAw1GVsurZhBqzMucCy
	qXKT2QYLpGgXNxuHPy9wYxH9fTiS70jBRvJXTMSQoI9XCRONwUVs9C3ryPsono4+rCC7s32imIf
	FSXH0xVPcMG2d3OvtzzW5i+sOR9CIKbDllsK6N5XKHN9pw8Yq6LupUujNk62hT/D0lDnAg0hFn7
	L/tXZF+lwY6pn/SbOluSC84LoG2qCZJV9OYasCP1KMGZwbvu/54YZAtFcpu3fTD3ihCMe55in9v
	ZOScQC3w58XuPxWePHr4oHbrBJl/oCCwL/os1yx/4VmNmJe1m7ERdhyG6lu1UCgqBbdOJDTfvOv
	OGlmlD+pX7Y+EuFSfXuGg58xfwaGzc0I7UMFRe7LheS0Tx4zOMR7q9KlRPC4JL9at9l5nVcg2FQ
	mrMBRlidSirPPfs1G+5m1UEfJAeFaKhrhIwfHDJaS48LjGdFtUjxOm4gpgmPT7qxzRzqac7c1aR
	VmCZrspPY7nvMC5mewrW2vETwP0pBe9PRAUJVtsHdwdEW+6+EPfIVP8+dggFpAp5q0CrIfHDWp+
	s3incr0GA31XdqmRaPeoV+DGhlJ5WLbyl4iMtK+9k9rViXaW3se6899QsQlb7gHHAPET+76F
X-Received: by 2002:a05:6122:12b4:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec685631b9mr2836551e0c.2.1793464203129;
        Sat, 31 Oct 2026 09:30:03 -0700 (PDT)
Received: from JSANTO12-L01.ad.analog.com ([177.112.152.97])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69caeccdsm6020716e0c.16.2026.10.31.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:30:02 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:20:26 -0300
From: Jonathan Santos <jonath4nns@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Jonathan Santos <Jonathan.Santos@analog.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux@analog.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	dlechner@baylibre.com, andriy.shevchenko@intel.com
Subject: Re: [PATCH v4 1/9] spi: dt-bindings: Add spi-cs-composite property
Message-ID: <auWIqpIaegH+AWV4@JSANTO12-L01.ad.analog.com>
References: <cover.1792435248.git.Jonathan.Santos@analog.com>
 <e9308680e7b45ecf9ef2b6b2a752ffdd4d23b80c.1792435248.git.Jonathan.Santos@analog.com>
 <20261026020003.3f3fbe86@jic23-hlaptop>
 <20261027-colonize-primer-f994b88171a6@spud>
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
In-Reply-To: <20261027-colonize-primer-f994b88171a6@spud>

On 10/27, Conor Dooley wrote:
> On Mon, Oct 26, 2026 at 02:00:03AM +0000, Jonathan Cameron wrote:
> > On Tue, 20 Oct 2026 22:56:41 -0300
> > Jonathan Santos <Jonathan.Santos@analog.com> wrote:
> > 
> > > Some setups combine several SPI devices into one logical device, with
> > > each chip on its own CS line. All of those CS lines must be asserted at
> > > the same time, so that one transfer reaches every chip.
> > > 
> > > Add the 'spi-cs-composite' boolean property. When it is set, every chip
> > > select listed in 'reg' is asserted together on each transfer.
> > 
> > To me it feels inevitable that we will see a device / combination of
> > devices that want groups of CS lines together and others independent.
> > 
> > Seems less likely we'll see more than one set of composite entrees.
> > Maybe this should be an array of values that match with specific
> > entrees in reg?
> > 
> > I'm not sure though.  Conor, Kryzsztof or Rob, any thoughts on this
> > or similar things that have arisen elsewhere?
> 
> Why does the property actually exist in the first place? Does the device
> driver not know how each CS should be treated?
>

Hi Conor, Jonathan,

Thanks for the feedback.

The problem we are addressing now: today the SPI core gives a driver very 
little control over chip selects. The main spi_device only drives the first
'reg' entry and the only way a driver can use the other CS lines is through
ancillary devices, but for individual access only. For aggregated chips 
(AD7768-1 in this case) we need all CS lines asserted at the same time, and 
nothing in the core lets the driver ask for that AFAIK.

In v1 I added a CS mask to struct spi_transfer, but that also needed a
lane mask to work, and after the feedback we agreed it was too flexible
and too easy to get wrong. In v2 and v3 I switched to ancillary devices
(each with a lane attached) for single-CS access. That covered
individual access, but there was still no way to assert all the CS lines
at once. The spi-cs-composite property in v4 was my way around that, 
letting the main device be the aggregator and using the ancillaries for
single access.

David also suggested two alternatives before that don't need any DT changes:

 a) Add a CS description to struct spi_transfer or spi_message, e.g.
    passing the ancillary devices whose CS should be asserted. This also
    allows dynamic CS selection within the main device. And since the
    ancillary devices are already bound to a lane, this is less prone to
    errors than the approach on v1.

 b) Add a new "composite" spi device, so a driver would have the main
    device, ancillaries for individual access, and a composite device
    for simultaneous access. The issue I saw is that the ancillary and
    composite devices are siblings and their CS lines would conflict in
    the core's CS check, so only one kind could exist for a given
    device, not both (without some more complex logic in the spi cs check).

I like the (b) approach, but we would have to bypass that sibling problem.
The (a) looks less harmful to existing projects, if everyone agrees I can
implement it on v5. Also with (a) I think we can drop the spi device
name for now (or not?).

Best regards,
Jonathan Santos

> > 
> > The most general case would (subject to it not working) smell like
> > 
> > reg = < <0x1 0x4 0x5> <0x2> >
> > 
> > Where intent is that 1 4 and 5 are meant to switch together and
> > 2 is separate.
> 
> I would expect that for this kind of device, the driver should know that
> the first 3 CS are switched together and the 4th is not. I'm not really
> sure what the internal representation should be, because if someone can
> make a device like this, they could surely also make a device where (to
> borrow your format) it behaves like
> 
> | reg = < <0x1 0x4> <0x5 0x2> >
> 
> and so on. But if those devices don't actually exist at the moment, and
> everything is either all together or all seperate, the API for this
> stuff in the SPI core doesn't have to solve that until a device actually
> shows up.
> 

Yes, this is a bit out of the scope and kind of complex.

> Worst case is something where there's a variable grouping of chip
> selects, e.g.
> 
> | reg = < <0x1 0x4 0x5> <0x2> >
> 
> or
> 
> | reg = < <0x1 0x4> <0x2> >
> 
> but maybe if that happens the thing to do is permit reg-names for that
> device, and again store the relationships in the driver rather than
> try to convey it via DT.
> 
> Cheers,
> Conor.
> 
> > 
> > How to do lookup on something like this is another question.
> > 
> > Jonathan
> > 
> > 
> > > 
> > > Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> > > ---
> > > Changes in v4:
> > > * New patch. This has been included because without an explicit property,
> > >   every device with more than one 'reg' entry would have all its chip
> > >   selects asserted together. That breaks devices that use ancillary
> > >   devices for the extra CS lines, so the composite behavior is now opt-in.
> > > ---
> > >  .../devicetree/bindings/spi/spi-peripheral-props.yaml     | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > > index 4894196c8f9c..456cb9095632 100644
> > > --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > > +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > > @@ -60,6 +60,14 @@ properties:
> > >        Delay in nanoseconds to be introduced by the controller after CS is
> > >        de-asserted.
> > >  
> > > +  spi-cs-composite:
> > > +    description: Some SPI devices can be aggregated into a single logical
> > > +      device by asserting all their chip selects simultaneously. When this
> > > +      property is present, all chip selects listed in the 'reg' property are
> > > +      asserted together on every transfer, treating the group as one composite
> > > +      device.
> > > +    type: boolean
> > > +
> > >    spi-rx-bus-width:
> > >      description:
> > >        Bus width to the SPI bus used for read transfers.
> > 


