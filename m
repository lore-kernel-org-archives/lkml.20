Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E833E959C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268286; cv=none; b=PNQF+9961GJ5ymJJ4nB6pdvTEKzVB1UBOvfeCJgzlqNcUfX8scMBdWZkg7DmZF2EHARE6agTEI4ylsS6AxgbZDaWOS5scaoaHMzUa3on5lh7lA0G5kS0O/WdD62qG2R03rsWr/vrndMue/15vv0DAjIqTnIHbj90yL6J4kSVAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268286; c=relaxed/simple;
	bh=Do6+wJVKBDNL5nAR2OL/qbk0mdidmP25lT/W/v0I60I=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6NVaosUTuvr/9Yl78KDCkZsXNBeKe3DFAyt5OPHRlontm8640HFCCo9fWVYYiJ4w2+pSmJ5PBCwIAy4GvOz21MviMh9S2rnzuud8NO0e1UUtgJu0dp7cVJsIK83yeHHFC6aoOpW3gEDlOVypcISO2wFIMvnZi8uybUa2HuvLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY6elEuz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY6elEuz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so6961015e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788268282; x=1788873082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4WQe8WxOJvjm3sLRvwhf9J7T9KlfMScAPN+0OUz8OY=;
        b=aY6elEuzm58eq/wD5OHWPpGE48ZV2/yOMwLU/L/nIb0ENzsoXew5MdP7Y3VxoeXXsI
         oTmdnEbU9BQ7ZzpwTdQ+qUQMjLKHlFGsM1AQRnp5PnRJhx+TiYbOlSb2ANzbpsaZpxX0
         8lfAlk/NmHdNoXkvf6TdSoLmbnKh9ebuc/u+kTZBHFPYPLhoEbBUhge+0bZ60sdaYEm8
         uoruMs/UnMrmTH0UK0AbBDGAEuxuDpWjHr8jOoih8k5MhD5V4YE2RHd17UYMGfG6QpJe
         5ziX5jKXHek5ngdovPMppB/Ho+dIQUJeDsH42Xd0ZYQwa4HuuIqAsUKkNw0BefXz8sKP
         i4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268282; x=1788873082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4WQe8WxOJvjm3sLRvwhf9J7T9KlfMScAPN+0OUz8OY=;
        b=CjOGBfbvKIBPgFg8uOnqHAwYtQDAzXcS4mck/fgT50aPLt1cCVsEwsgCTLzIYm0oQ5
         mujyUHbtm+TItSW1nRM00tbWI2F/RiDS/PD5Wx+bNJ97DkhhQ+a8axaK9R9h0HOG7Biv
         mBU+Zwsr5zKHjjnJ6+88SfUO6xrRektTqEoT4PYU+akf7OSZZURgI2YPL2QajbfZiDFv
         pAYaejrpaPLFI0mmUgA+VYhxI9lAVhvrQ7AayJzv6DdYSkjzyVCQU7hVJC1p2uZRrw3M
         pxWqk83weCxqrWECKf3QQyiJ9ha1Yicqmz/nwJaHkVBzEY4O5HTjk2sleI6pIiDF0XnC
         WB2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq80ChsdDv0nealBCWp6FR4hnbytKU5EicXfd+CeNhbg1nJbQYOkSqVhvLRTQad3j16vAkK12oFqOzCO/U=@vger.kernel.org
X-Gm-Message-State: AFuF++lc2nBPi7OBxuVwVxLT2JaFPHJSh7rEA6J+o1qcVGa/loM2QAhE
	TzXBBkRWYZFh9GaXtqs6K5ZrQ8uRKON55m4ip9V90Au7pJi5wc+RAbvY
X-Gm-Gg: AR+sD10DIFe3AUedDd3TTcT7CegKCkSoMtb2/2DmDMkK+rW5g3G4rOC1jbb0XoMfQJm
	foO6Qa7T0rHt4yYasrVa6dDxr22xuo/duhy+Eim5/HPOvDEO2QGofjyzXrMeuBVrFeJWwmQ3rUP
	XIlL4RXTax4WFOjIG0RBDimPLienQ/giB14No3Fhb3b7W9JWONx7JBhpDOV4IuQbqMbsK52rfo0
	/2xfiJb75YlHX1hubzsoGgkkdIm3m5773EktHvNBr+btBkkGwSmQj5huonV958chGGQ5wdjkFCk
	XF1i9/ak9VEw0o/cCdrjzXNKCT7uJcQRcwVIXuNyqzzA953wiiUmGbpCb0EVSJss2J3yyLjWczj
	nTzz8YNCRAvCj+rFi2PTMoz5nd3UfxFinbZkkt3iVLIYCb9rAsy2rrEJQWRtC3NvtzaF85z4EM5
	I8R9qX4IFgHyQ3kQYCr0Oi/ti50GiswAczRrnczs0O3wYuw5XBnYIZyDydL8S7E2uTLa9rauZZR
	lfLNW1ykhUyvFCZ4+G16XJeWnUcUR5NjD64CRtniI8dmw==
X-Received: by 2002:a05:600c:3511:b0:499:adb4:a922 with SMTP id 5b1f17b1804b1-49b91c4bab5mr387735445e9.12.1788268282047;
        Tue, 01 Sep 2026 06:11:22 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1a3fesm70391065e9.12.2026.09.01.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:11:21 -0700 (PDT)
Message-ID: <6a96cef9.1f1211b9.23c693.9e1e@mx.google.com>
X-Google-Original-Message-ID: <apbO8hHBw7bMvVxL@Ansuel-XPS.>
Date: Tue, 1 Sep 2026 15:11:14 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: airoha: Document support for
 AN7583 Gen3 PCIe PHY
References: <20260827122127.18874-1-ansuelsmth@gmail.com>
 <20260827122127.18874-2-ansuelsmth@gmail.com>
 <20260831-elastic-turquoise-puma-f032fc@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-elastic-turquoise-puma-f032fc@quoll>

On Mon, Aug 31, 2026 at 08:51:46AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Aug 27, 2026 at 02:21:20PM +0200, Christian Marangi wrote:
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/phy/phy.h>
> > +
> > +    phy@1fc7f000 {
> > +        compatible = "airoha,an7583-pcie-gen3-phy";
> > +        reg = <0x1fc7f000 0xfff>,
> > +              <0x1fc7e000 0xfff>,
> 
> Sashiko has a valid point here.
> 
> This should reflect real hardware, not current driver. It is very, very
> unlikely that hardware designers designed a block of 0xfff size or 0x4
>

Hi for 0xfff yes the block is 0x1000 but I was reporting how it was defined
in the original DTS. For the 0x4 is for real a single register for that
usage. Documentation is scarce for that single block but this also reflect
the same implementation used on EN7581. I updated the example to address
the strange block of 0xfff.
 
> > +              <0x1fc30044 0x4>,
> > +              <0x1fc35030 0x4>;
> 

-- 
	Ansuel
