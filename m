Received: from outbound.st.icloud.com (st-2003k-snip4-11.eps.apple.com [57.103.77.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6344E3E2AD7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.77.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789890834; cv=none; b=Uz9HSUzHhUV8FLVeTyHjJD9fQHS4bbVen3vpL33JwDkruwmNWIu5q8/Iu2VqLIZvwjueUmeJQMKHvU0b2KaAcBinK3YphU3gBoNAhSkVBP+3q3TVbF6+8N1XyMOqcSoOQc2NDuNmbOAKr92HM/6Vh3tufMBi6zeTcRFhwbD+dHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789890834; c=relaxed/simple;
	bh=5cEPnyU75Ah5V+nfOTE9fMSfyh2Z4xhjWLVmWJVBdBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcRyfBzbpRxsiOpEBl9xFslu1m9Q8hEn87Ez+87EBWwPFJtnrEW9tICWN/Dx6r6ZYhddnBpXdH0O6pdnaBxhLfr+eAMOzLhl9WRj6OI9Ema0dE2501SjKjH4nuSpfqgzplBIc52yKBvriL835D7lBYbnKwBGk0lnBOoZM0+iAzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=QCFVtEG1; arc=none smtp.client-ip=57.103.77.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="QCFVtEG1"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPS id 437E6180018B;
	Sun, 20 Sep 2026 07:53:48 +0000 (UTC)
X-ICL-RepId: 01a0bdce-97ac-79a0-a605-840ad6523340
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJCldTARQqcRh4PEA4bEgEHW84ch0KRhMZThtXTVAbXwJCDw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789890830; x=1792482830; bh=DXZPtUyU9s9mMrfe78UMcGtXrJp17csOpzh6GOS48Q8=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=QCFVtEG182IXgVBxAKY7nnZCiPlBZRHpplCiaF6ihECKi14jcF0o1m5sCrk2FYwjXQqRn1sTOYU6PwDFHrYzivkaFLkD1w/yx0xzJ20tDTrwApKuoKzrcTsEIFM64AlzqtL+LSCuJXwQO/B/znPpDOC/E1T5tikt1AJNp5Hagx4Bj0eCJTC4nvjK1ziFJU3zaSiVS6HFFPZyBu7ds69JITA0a9DwIDHyrRojCbRl2l7gS18SWcRCYeqCGJatyCf3NSnRPdk+Lg18iGTPc+sZNaDgaB3eJ6oxmxDgaTnOJmJrxm3ciDugM+4lrLHVvrei66u6+ZUSk5T4VHdvDX5rUg==
Received: from m3 (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPSA id 8602A18000A1;
	Sun, 20 Sep 2026 07:53:45 +0000 (UTC)
Date: Sun, 20 Sep 2026 09:53:42 +0200
From: Sofus Forstreuter <sofus.c@icloud.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 02/14] dt-bindings: media: add apple,avd
Message-ID: <aq-RBuOWrHU07pXS@m3>
References: <20260918-avd-v1-0-49977931f455@icloud.com>
 <20260918-avd-v1-2-49977931f455@icloud.com>
 <c8d25275-3c45-4e9a-826c-cf856938d60e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8d25275-3c45-4e9a-826c-cf856938d60e@kernel.org>
X-Proofpoint-GUID: S6e61XuDsmK33ipxJAJUc3U2l_BzDx8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMiBTYWx0ZWRfX66J5KzOfJs2q
 1a8B4E/MxpTpFX277QX4b/b72REyTW3BCVALxCdqtA7uFe8/6nnpXPVDWGcJN1Hq27AI8s7KQ4d
 XigJEBUxqigohz0HEjMO98zT14nCpx35jdkY+XFMJ4sIiUOdf6VHzTUP14b528zMRkMP+h9TqvK
 6KcIw/Vrd1ltAi/g2KTwLufAhGQeUrYeTtD5tHm3pW+R244yvAhBKWClpe0jgzLm+W1EG7AG3zL
 lL8R9f0HynC8yiNvDlDDSYOSa8XtGS/M1+r/JOM2ckHWxcc+fu7SQzh/ZRLP+O8doyPKHlk9t3c
 6UN+z+Vc+GHPyqn6LWcwU5Gisywj9VhOKOtRquKk8qAhH1WI9SUecYhup9KZLE=
X-Authority-Info-Out: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=6aaf910d
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=v3ZZPjhaAAAA:8 a=uNVY81mLXwUjaPPEvSoA:9
 a=CjuIK1q_8ugA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-ORIG-GUID: S6e61XuDsmK33ipxJAJUc3U2l_BzDx8T
X-JNJ: AAAAAAABh2Ju8KJ8gttMZDPbI8BBILSbRiIsMboAJb0CbhsvCLsTv+PP2ZG7K7lphsDv6u96pQ9fxQj9KeqmYI+KNGwjGDnPxR8ImYypsja/+aL1Yq5gCD1pab6QkLiPb7IMuPGBfC7cJoYqSxigkSv3ixoD7cVw29wB7rwrEKc4physV7n7p92lSKrID1E7wXJi+mI4xZfq7ZyiwMeP4BYYAqsuTEOn5CSZHPuWhVL5WcdFkZgC2jZR4r2YSyeEuWzn/trSRmEbiVhLP0AZ1m02IZf/o89Z60avwzkjsSfzhSlulL+2YWEEsYmj0hy1275qmSxc1K/jotixKi/CuuWbW35H6rfgtd6EEBBtrD2FsLgWdMskd1GTXtCnfxkmSsKDAHLGSejxhVRsfwJqXWRq4ufGD/3Dqz5an1DS7vYVeI5NwjGYYD0ybwnByOIjNHxbsstCJCO03dyo9M1z7ZQ/d0qjAunYBVJDeNc5pdgwREE0RmNxRc295lqOPz/WSZVOVV5Bzcx+yAWqbqtlv+KLpyPsUofhFNfUYpSJ2lmKXOmFEy1g2oiZ3bnxo6frB6Q0TgR/ksSZarDuDwOfbSIjpfO3DBTh1OMO4h8JW8TaoyB/Eu9uTSHJbEdHJcMlVEfI/ZcZWZyRKrACY0iP6Q6Zk2rpNGFqpFZQLsP1/LIZqEzrfW2/C8tMqzC5Bv49DwENK1iArZvQ3Al8b9b9ZvfhhhPD0EhfJKzhIbZhZpQOyjx8+OXSDjBaiYPW1i1GaWHh0OfD3tiqJ0GVx7OjVKyENYcAB4mhAXSy2jcJyoztjJEAtYp4YXW14z4U2jcAsaPgjKZym+A6X1It442CLrFt6RIILydpD5Re95VnX1NqSDBzPgFdcsMxP2/SJZxYciu2cIZ8VQK9v9C4yz8AmnL7KgZ53q/I72hAmPzPuCzsmXeBdq+KpwLCKjuOpkFjqHU+u64aCj0duc6apNSJ7TA42bEPFtC
 UxmoNV4oh6LtbD2+LeuoxpzS/koLZBKdJ4FL5zap4cOVDP1UkBdE9iU3zluZ0FWWu3kFdYXdFPN9dxMGRy4j6QiUh4bW4ZZuWMzkmmvyzjpeClPAx7UIFuQZGV48pDQzF/Mbs+fV6v4iF6L+0oYfGTFcg8G0G6iO0MacbeceUbhhhHGlh8rzOOdw1MLwkf73+uRuuqC+bAOoRcK1FDztMY91q7nPydNUZ1i3Jw3LKXZVUSkrbcdHzpuepsw7pmsInKEpPfAphuc+0HbPap0Rwy1YAdUBdAlMc3fYfAUXMKdS96TB8Hcnd0wR13GXSJU746A9+EPzG3/Ap+mw17K9MIRIo32IvrFVhHwXRrZGRD7BvuGAnaCDQ9QllDFEhyli2nVPe1zyKJ+EJNIUuMKZG34SBKwhGGdAR0pExIdB4Liv7pMHEJKjiJUE1bg==

Hi Krzysztof,

Thanks for your review and time!

On Sat, Sep 19, 2026 at 08:46:31AM +0200, Krzysztof Kozlowski wrote:
> On 18/09/2026 15:15, Sofus Forstreuter wrote:
> > Document the Apple Video Decoder. A hardware video decoder present on
> > Apple hardware.
> > 
> > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > ---
> >  .../devicetree/bindings/media/apple,avd.yaml       | 112 +++++++++++++++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 113 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/apple,avd.yaml b/Documentation/devicetree/bindings/media/apple,avd.yaml
> > new file mode 100644
> > index 000000000000..34a4129d6a46
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/apple,avd.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/apple,avd.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple Video Decoder (AVD)
> > +
> > +description: |
> > +  AVD is a stateless video decode IP block present on Apple devices.
> > +  Notably it includes an ARM Cortex-M3 and associated DMA controller.
> > +  AVD is capable of decoding H264, H265, VP9 and AV1 on never SoCs.
> > +
> > +  The IP does not change much, with changes being mostly the CM3 having more
> > +  memory and interrupts.
> > +
> > +maintainers:
> > +  - Sofus Forstreuter <sofus.c@icloud.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - apple,t6030-avd
> > +              - apple,t6031-avd
> > +          - const: apple,t8122-avd
> > +      - enum:
> > +          - apple,t8103-avd
> > +          - apple,t8112-avd
> > +          - apple,t8122-avd
> > +          - apple,t6000-avd
> > +          - apple,t6020-avd
> > +
> > +  reg:
> > +    minItems: 4
> > +    items:
> > +      - description: Cortex-M3 code (unsigned)
> > +      - description: Cortex-M3 sram
> > +      - description: Mailbox
> > +      - description: Video decode control
> > +      - description: DMA control
> > +
> > +  reg-names:
> > +    items:
> > +      - const: code
> > +      - const: sram
> > +      - const: mbox
> > +      - const: ctrl
> 
> Sashiko comments are valid.
> 

Ack

> > +
> > +  iommus:
> > +    minItems: 1
> > +    maxItems: 3
> > +    description: |
> > +      The block contains 3 iommus, one for decode operations, one the DMA
> > +      controller can use and the last for decoding drm-protected content.
> 
> List the items with description with minItems instead.
> 

Ack, i will drop the third iommu as its unlikely that will ever be used.

> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 2
> > +    items:
> > +      - description: mailbox 0
> > +      - description: mailbox 1
> > +      - description: mailbox 2
> > +      - description: mailbox 3
> > +      - description: flag 0
> > +      - description: flag 1
> > +      - description: DMA status
> > +    description: |
> > +      Notably there are no decode related interrupts. All decode related
> > +      interrupts are sent to the CM3.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reg-names
> > +  - iommus
> > +  - power-domains
> > +  - resets
> > +
> 
> Why properties are unconstrained per each variant? Why are they flexible?
> 

There is no reason for this. I will remove the unused interrupts.

> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        avd: avd@289080000 {
> 
> Drop unused label
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
> 
> Don't use custom names, like apple. Codecs are usually video-codecs. Or
> isp if this is ISP.
> 

Ack

Best regards,
Sofus
