Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E84EFFC1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054750; cv=none; b=baPINsO/z/ODonor3Dlbi2Ljt7tJIyhvt8jC6dp5CDps8KRs3x6vbDiov1yBS0tJ49HJQnbmIEmWViLIZQYFhnzCdUrATDc/Z0rjjoMchLXEeHyRLD+yqFWhP7hozHk5qL+jOm6W3eRXB5orttyFos6vGdLiew9gsXnes4mwmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054750; c=relaxed/simple;
	bh=mibTasoYLPRkTtHblHAGE9NyG/cWGdvc4fiuNRggKPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+Eg/ihfKJYb9470O37zF8/5Oavm0jOgZl/jmSRmfJApRGtCLeDu2PwaFUzqYdwStLouO40ji9RGQ6thaQfMYcx0drijx+KzeB5DKcwQhJDrK2LS+QqX4I+4uKAyc8/4q8bawsTMX6e6/Ul0FmGaKwziOdntayaD5Z4FvuH9Yc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL63G2Ne; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL63G2Ne"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e7e742a2c7so34263645ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054745; x=1792659545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=fL63G2NeX5FDsy8QFY2K+7ygXxneotsfEgCL6Yf6C2kLlTzRttEbYeIMm4lBh4hLx3
         GYaiGhXHE/4nbXXnClwzXtclTztWSq+wCzQT03F5CUrXj614Sain3CjZszuGWB+K0Whi
         +BxOU26ylNHRyYrwgOTquJSbz/8C0cAC5yB0LjP4uTbY5CVgIhdOnxDCWu/6Vf1pPluj
         +f4lQsKCALpBNcSkshdVOBUeX1/VopvxgUjYkxmgJOxzYMPbWnz8cVCFbjr9xOXfeqIz
         aQPhQKAa1/kRpbnEuXt0kZ/+wyX1W0/8koz1ibM3tuhI3GHkrKYVXjwu6S+aYTSfV2iK
         WdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054745; x=1792659545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY/Ca6upnPsDr/ZtUeBJxSM1jnY+ETFKViUNpFJNrus=;
        b=Ul4ghJbefXg4jy64WJO0d6/jMK0EOmPP/u+FkoXVzjfGv2xbNIr6TQa0DFZ5Qx/EyF
         0X9SiaInLu86euAW0Rq/Z2dCiDqo0P77UmvurYw/coYSXQbFSItU8Ax4FRI7hIfF39Gn
         7jA9P4nn6rihQfgemG3WJjyGqUosK5zLsnUZiimGCx7oxW02oxrn0K9eRNcIz9Y7s3Se
         bNRwFi/LLgTNRKvXX9qzJTfdAbS65pMvAkW/EGYWuGJKXelTJ7EhgQk6fAl57qrpVOPx
         EtfXaxCq4iHJqaFXxvGmmrNqH/jnqYzHm0lTaw+4tqeG8hMW5yW7+EhmEqZXleUGzTil
         0awA==
X-Forwarded-Encrypted: i=1; AKwUvBzkFFBosiDwUr7eP8lIp5G0JFC0MgJumZdfGuh121yMuiby4MDHVPhRSqOyaxgu+VJToGMkcfC4ZaXDj08=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8TfkyHQRV16/FOQSiUZiCN3hihCN2o8avn6kX2cxIFDyTrIEK
	FZ0ErH1F1HfXr26DRbdKO+em9TEBA5zIVT2r5dgfvYnM/pv0D4JEIW+e8gmQtxt9pCk=
X-Gm-Gg: AYBFou3helYxF9qMOrg6nL45lf6f3DGJ/3oxyi6Rs+zDru1v+8IjJRL7ef2namGMv9E
	QGF3fh8r8o47+9aa0VB3nqS6uQ+PutTu9ZVUIk1UojUoBwWIVcX3pUgJap6cEK+yGcmGkRUIkvL
	PHhO9uB9F/uaUG7Kn4HebRus66kVKpvPvp7pFyH5lkhnMcj0eCpe2yOh0oTZRwU/YFvLrOZk1fI
	7TTRP3xfPRVV1T97pPq1B4sbTQC+mpiB06oSSZFCpN67oUYF8/5SlAOeZhWicMNQMgQHhfB3JZA
	gJ587/AwBz3EIrz6ATZ6SFcxPSOa4nK2h7fC04CWbEY/kDkubLi1kDq5uRpI5iR0S0j/yCpeXBW
	yNgP3kzbRjgXmptcHuqS4B8YoIXz44/fn4sBKEEHu22W9c0Z4N7fxh+F/wNynj7XGeyPzhL6hvH
	T4gLYuYDx+LpWS3z4Ru5VAXgEBOlb/2Ycx/bt2kdsq2ydydvi7fI47Q0FjeIQi555Ar6M9qA==
X-Received: by 2002:a17:902:f70c:b0:2df:aae1:4905 with SMTP id d9443c01a7336-2e842cf990amr110281435ad.26.1792054744748;
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e94ba30f6asm13269885ad.57.2026.10.15.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:04 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:58:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: Add SG2044 eFuse controller
Message-ID: <atCVYXd5cIkcB0oS@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-2-inochiama@gmail.com>
 <20261014-humorous-cryptic-llama-cf6a6c@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-humorous-cryptic-llama-cf6a6c@quoll>

On Wed, Oct 14, 2026 at 01:43:29PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 03:45:13PM +0800, Inochi Amaoto wrote:
> > Sophgo SG2044 uses eFuses used to store factory-programmed data
> > such as ROM patch, public keys and other factory information.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../bindings/nvmem/sophgo,efuse.yaml          | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> 
> Filename should match compatible.
> 

Thanks, I will fix it.

> > 
> > diff --git a/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > new file mode 100644
> > index 000000000000..d4bffe2724ac
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/nvmem/sophgo,efuse.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo SoC eFuse-based NVMEM
> > +
> > +description:
> > +  Sophgo SoCs contain factory-programmed eFuses used to store ROM patch,
> > +  public key and other factory information.
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@gmail.com>
> > +
> > +allOf:
> > +  - $ref: nvmem.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,sg2044-efuse
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> 
> Why is this flexible?
> 
> Best regards,
> Krzysztof
> 

This is a mistake I missed. It should be the only clock, so maxItem is
needed.

Regards,
Inochi
