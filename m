Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCF733B6CC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789962714; cv=none; b=YpQHTCE3vOLXRyifhoyDNnB3gpVdajHO3F2ZdMZNhl3sgdzhP6X3iS4X/rit/wPVjcRyQzPWbX4e4lWSMy68yjrfrFyo6mf9S7Bd+sz6W7/upsCOF3SI+6Lt5ErUbtW5i4u8kcUuQjWKFK/XtvYdParjWKDR++OvLJ7H9Ojccbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789962714; c=relaxed/simple;
	bh=K82EgIbx1c3Pt4aprRyajv8B9kasIoaE1zD7vpKRcbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edBB1KwjzwuFdAA8Zf8WcNiBqxUbyFoPBQ7u9hfSMnpF49+5FniiA6BprNlOEbUoruS3G0FyOH7mhTlQDDhjKXi2sx94wGa8gK8j4GSOtX/MqHUcr6n8BCr/S4bOz0qGv0PJIXHl/f02vIgoVj+ULhuIbB/bhbNImBvAiNc41Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OghcOJf4; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OghcOJf4"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1775357a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 20:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789962712; x=1790567512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdDhzCRdCllLNDO+MhePTUS200ix97YhSyiLkztN8Pc=;
        b=OghcOJf4nZVTYVRG6KA6VP6yKh41NlbMtdeEDZBSSt4lzbn6BHCkFQXFcXztAS/cw1
         v9VuwFcpqIhP5RVMl0DpuurTpDPaCXCmlI3Vr955BS0VCThKByCRzLDqQQzWdkY1pUXi
         2AcwL5DLtNAw5WHzLtNv/vmhA0SF/vTuABPu+P/hDJR1me5Gk4HGrQKnlL92KnFU/Flx
         4T0G7L2IPxJ4//PVUN70xSdMcJ0BnPTzW0Y4dBzmSBmUga3To8DP2K5+lc7mAQHFNIQG
         Jm1IVhsuLhFOBbXKguSBK066+V+0YMdDiu9XoT7Uk+Dbi9+uMc8azTPwaB/l6raVpNXh
         VPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789962712; x=1790567512;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdDhzCRdCllLNDO+MhePTUS200ix97YhSyiLkztN8Pc=;
        b=jVZ956zEHha47HKR8pEnHuifrRcd+Ldn65FVptWyTMqAdyC65GadYlN/5+JnY/ty9d
         K7E5sLEgUNxaf7ZAUSe9YGEsKDwbrOfYhXcccib1yP24zwCYE/D1WpgxjvR+1sZ1LvYM
         CP3QBQ0X7Trb59cWdVfU0JnB7gLMO24qnm06qlBn2rvVDvS3E5H3gytqFIbb/PmzNVjY
         jdIYf5bnSICF5vgO+A19NvUOkJGRnauw5mPmllseooqTmeyIYY0iIlMKKwMueIdbu6ig
         wl+lwSosG7C0eJ2VUxxLGu3/N6IJDDYsT2DU6kB5MdCplZF7WM4+OqMrOJnGLrsqXqay
         acXg==
X-Forwarded-Encrypted: i=1; AKwUvBxszoNmkiE7nM9I4CB/cFe6myK61g0SucP2TrWn3SDfyQP1yzpiCsQuxnRDb9pMLLNdb22rAZfxpWVegNU=@vger.kernel.org
X-Gm-Message-State: AFuF++kY6DtWUSQCsjiFb4wAk36qMsbuDGF3SiKpUA1wuv9K01ptMV5b
	qBlTM84SN1Gd9xnhyuVniqzOvnsWP4F3QdTOpX4NzSIAvZg0PVAn04uU
X-Gm-Gg: AYBFou092D2/uJsgyy2m+eD8vvnVShWo3F2R+EFrfiHRigyt8sAi3b/MYLXl7Zo0u0O
	a6OVMGt7UFya/zPhI9E6vugMuM1l3U9TFWRTVFyiz+WBqp1JRCGfEhJ6/4i5O51U8Q9JHpwH++0
	FcZqaKs2izNNp9z244IFFRoARvEfVsJnU4HhtPnkmGvGQVp0t4azqM9s2aMz50PFCaEKbnA/Hft
	79bID/MkceB4hFlrj2Fd4bHY4/d9KX9mKCypR9NcfOCIDqH/iSpnjGPeklSuRQa9jQHy83kJaUw
	CzNPNQnxB8x2iPgiRGvcX+Qi6I3CztKJP4vpYZlVibyGJ0xiyWD2uMYovNr99PCnDmHjqdokQXo
	viQDRSrPweR2j3p1oGaKqKwINQ9btCvNUKCYdXNg5BKlulPHCBFKFS9bqfTeS6pXaX4rHz+oZCG
	HCPHLsiaK689htJdWmAtF5An3pzu2XYslas6o7/Y11s+aFTtx62GSm0A==
X-Received: by 2002:a17:90b:54c4:b0:39e:4c7f:7308 with SMTP id 98e67ed59e1d1-39e55071981mr14409742a91.31.1789962712193;
        Sun, 20 Sep 2026 20:51:52 -0700 (PDT)
Received: from localhost ([2600:1700:5431:250::22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54af4d5sm16190292c88.2.2026.09.20.20.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:51:51 -0700 (PDT)
Date: Sun, 20 Sep 2026 20:51:44 -0700
From: Chang Yu <marcus.yu.56@gmail.com>
To: Conor <mail@conchuod.ie>
Cc: Jonathan Cameron <jic23@kernel.org>, Chang Yu <marcus.yu.56@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shi Hao <i.shihao.999@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: light: add as7343
Message-ID: <arCp0DQpBiOk3zvz@zephyrus-g14.localdomain>
References: <20260907210042.32552-1-marcus.yu.56@gmail.com>
 <20260907210042.32552-2-marcus.yu.56@gmail.com>
 <20260908-dinner-shelve-1d61e19ee3b7@spud>
 <20260913014203.2bae2222@jic23-hlaptop>
 <20260915-gleeful-jester-c8114edf28ff@spud>
 <20260917034823.03940ac4@jic23-hlaptop>
 <aq3rdBcMw1XcHnkL@gmail.com>
 <20260920010448.114fc597@jic23-hlaptop>
 <77D15400-6ECD-4661-8733-E1F4F85077AF@conchuod.ie>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77D15400-6ECD-4661-8733-E1F4F85077AF@conchuod.ie>

On Sun, Sep 20, 2026 at 03:14:30PM +0200, Conor wrote:
> 
> 
> On 20 September 2026 02:04:48 GMT+02:00, Jonathan Cameron <jic23@kernel.org> wrote:
> >On Fri, 18 Sep 2026 18:55:00 -0700
> >Chang Yu <marcus.yu.56@gmail.com> wrote:
> >
> >> On Thu, Sep 17, 2026 at 03:48:23AM +0100, Jonathan Cameron wrote:
> >> > On Tue, 15 Sep 2026 18:11:17 +0100
> >> > Conor Dooley <conor@kernel.org> wrote:
> >> >   
> >> > > On Sun, Sep 13, 2026 at 01:42:03AM +0100, Jonathan Cameron wrote:  
> >> > > > On Tue, 8 Sep 2026 19:13:55 +0100
> >> > > > Conor Dooley <conor@kernel.org> wrote:
> >> > > >     
> >> > > > > On Mon, Sep 07, 2026 at 02:00:41PM -0700, Chang Yu wrote:    
> >> > > > > > Add binding for AMS AS7343 which is a 14-channel multi-spectral sensor
> >> > > > > > with i2c address of 0x39.
> >> > > > > > 
> >> > > > > > The GPIO pin is described as a generic GPIO for now. Binding design for the
> >> > > > > > more advanced measurement/LED synchronization use cases are deferred to
> >> > > > > > future patches.      
> >> > > > > 
> >> > > > > Unfortunately, you can't change what you document, so picking something
> >> > > > > correct now is needed - even if the driver doesn't use it yet.    
> >> > > > 
> >> > > > Definitely needs an outline of how it would be backwards compatible and
> >> > > > an explanation of why not now.  Sometimes a portion of the binding is
> >> > > > so uncertain that we do kick it back from initial version but we 'must'
> >> > > > be sure we can extend the binding to new configurations.  Normally this
> >> > > > is one of those we are fairly sure, but not entirely sure cases - or
> >> > > > picking between two options where consensus isn't being reached.
> >> > > > 
> >> > > > Chang Yu: This sort of things needs discussion and is one of the reasons to
> >> > > > go slowly.    
> >> > > 
> >> > > Ye, I note that there are 2 more versions of this since I left this
> >> > > comment, but you seem to be on top of that.
> >> > >   
> >> > > > > > Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> >> > > > > > Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
> >> > > > > > ---
> >> > > > > > Changes in v2:
> >> > > > > >   - Add the LDR, the interrupt pin, and the GPIO pin to the bindings.
> >> > > > > >   - Fix node name and unit address mismatch.
> >> > > > > >   - Include MAINTAINERS changes.
> >> > > > > > 
> >> > > > > >  .../bindings/iio/light/ams,as7343.yaml        | 69 +++++++++++++++++++
> >> > > > > >  MAINTAINERS                                   |  6 ++
> >> > > > > >  2 files changed, 75 insertions(+)
> >> > > > > >  create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> >> > > > > > 
> >> > > > > > diff --git a/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> >> > > > > > new file mode 100644
> >> > > > > > index 000000000000..b06d445b92b3
> >> > > > > > --- /dev/null
> >> > > > > > +++ b/Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
> >> > > > > > @@ -0,0 +1,69 @@
> >> > > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> > > > > > +%YAML 1.2
> >> > > > > > +---
> >> > > > > > +$id: http://devicetree.org/schemas/iio/light/ams,as7343.yaml#
> >> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> > > > > > +
> >> > > > > > +title: AMS AS7343 14-Channel Multi-Spectral Sensor
> >> > > > > > +
> >> > > > > > +maintainers:
> >> > > > > > +  - Chang Yu <marcus.yu.56@gmail.com>
> >> > > > > > +
> >> > > > > > +description: |
> >> > > > > > +  The AMS AS7343 is a 14-channel multi-spectral sensor with i2c address of 0x39.
> >> > > > > > +  https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf
> >> > > > > > +
> >> > > > > > +properties:
> >> > > > > > +  compatible:
> >> > > > > > +    enum:
> >> > > > > > +      - ams,as7343
> >> > > > > > +
> >> > > > > > +  reg:
> >> > > > > > +    description:
> >> > > > > > +      I2C address of the device (0x39).
> >> > > > > > +    maxItems: 1
> >> > > > > > +
> >> > > > > > +  interrupts:
> >> > > > > > +    description:
> >> > > > > > +      Open drain output active low interrupt pin.
> >> > > > > > +    maxItems: 1
> >> > > > > > +
> >> > > > > > +  vdd-supply: true
> >> > > > > > +
> >> > > > > > +  ams,led-current-microamp:
> >> > > > > > +    description:
> >> > > > > > +      The driver current for the external LED connected to the LDR pin.
> >> > > > > > +    minimum: 4000
> >> > > > > > +    maximum: 258000
> >> > > > > > +    multipleOf: 2000
> >> > > > > > +    default: 12000      
> >> > > > > 
> >> > > > > Rather than a custom property, the tsl2772 uses led-max-microamp:
> >> > > > > tsl2772.yaml
> >> > > > > 46:  led-max-microamp:
> >> > > > > 81:                led-max-microamp = <100000>;
> >> > > > > 
> >> > > > > I wonder if the same should be done here, or if there should be an leds
> >> > > > > subnode? Perhaps the IIO folks can comment on that.    
> >> > > > 
> >> > > > I don't think we've ever bothered with a subnode as there only tends
> >> > > > to be one of them.  Given the enabling etc is all hardware controlled
> >> > > > I'm not sure a more generic LED binding makes sense. I don't know that
> >> > > > much about the led bindings though so maybe it is worth doing a subnode
> >> > > > just to use the leds/common.yaml definition of led-max-microamp?    
> >> > > 
> >> > > Could always just put a ref in to leds/common.yaml and not bother with a
> >> > > child node. I'd stick with the additionalProperties: false, since
> >> > > there's lots of leds properties that probably don't apply to a device
> >> > > like this.
> >> > >   
> >> > Sounds good to me.
> >> >   
> >> > > Cheers,
> >> > > Conor.  
> >> >   
> >> A quick heads up, adding a ref produces the following error when running
> >> dt_binding_check:
> >> 
> >> properties:led-max-microamp: '$ref' should not be valid under {'const': '$ref'}
> >> 	hint: Standard unit suffix properties don't need a type $ref
> >> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml
> >> 
> >> So it looks like we can just put led-max-microamp, and not add the $ref.
> >
> >Ah. That's a bit irritating as it is assuming the ref is to get the
> >type rather than to make the connection to the standard definition
> >of what it is.  Conor, what is the best way around this? 
> >Maybe a comment to say where it is documented instead of a $ref?
> 
> From the error, it looks like this was done incorrectly, but impossible to tell for sure without the snippet.
> The ref I was talking about would be at the  top level
> 
> >
> >J
> >
I was doing something like:
    led-max-microamp:
      $ref: /schemas/leds/common.yaml#/properties/led-max-microamp
      minimum: 4000
which gave me the error.

IIUC, Conor was suggesting something like:
    allOf:
      - $ref: /schemas/leds/common.yaml#

From my limited understanding of dt bindings, the above should not be
used together with additionalProperties: false ? So do we want something
like:

    allOf:
      - $ref: /schemas/leds/common.yaml#

    unevaluatedProperties: false

Or just stick with what's in v5?

