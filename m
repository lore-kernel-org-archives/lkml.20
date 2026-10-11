Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD8645C6ED
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791748821; cv=pass; b=Yp3+6oWcNAwXbODj9/Y5f+Lq/HFnPjRxNHQc2lBnD7YE3BKVXlBSLotUUv5omV3UG5RtJ/sz/jvkvC4ZjpABP192ba2xnrdS/MijRsOx/22z57MaXngTWB1pkV3NybW3Mu+R1u+U8aGkHmjMS7w6woBAcHQZEaJm8a6oy++QQnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791748821; c=relaxed/simple;
	bh=PafRVT+L1hTCA458bkWDsrr6ZsVGkP4Fi7cPDz2SeAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrmVkfDYQ1buamiq55iZ26I+KRuNA7ELVjRcknQuRbuuzdKhcobmvPgyaWDJhw1a5bgAVxPV8okTfOIkjME0iRal0qMynwj5srgvWGUBCXlJxumZZnybQ+Zy0Cxw4vNDTQZ1mHXw5zMrhjFqrmOaFYolL13hAldD0QnOv0ae9p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcGrZgQ2; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcGrZgQ2"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53512cd2f85so18109381cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791748818; cv=none;
        d=google.com; s=arc-20260327;
        b=Oh3qo7Ulni2ME6qGsNLjydwo/gZHWLkpTDdhyVYLUkUP4O8C/fXrqms49kMGGqOSIT
         Xf79ODZQt4vAES2S0KgQvUE1cacbkIRE4opH7rADf8ro/CxPVFjzssUixLrRU2pHdRNK
         L6YIwaJ8J66MaMfa1wDOO/XYWMQcT+IRZirNmoU5ndDNywLJrIi+p6izTD+XrPaKgR56
         m4H/Z8ke4qjKFlrHVwqO8Y8WHyadQ0Cjr0Maaiq6+Bw7HJCGMaVPO2UA8Da1a7ww/q8N
         tr1xZgZ+0qz6Uzdj/rgj36LRbSLFewveRk17vyDkN6lQjs0V4WDPrcTBfVSj4ukkMdzQ
         O78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fHzd/PpmTpoi3aoYVl6YzROirHzRjHYEj9c77Sd2SZw=;
        fh=qOJ/oa5Bg1eX3jEjO0ThuopAGiFDcOPiz+MPFFh+S0k=;
        b=pYZ/TKr1fAnYy5bPcMgq1X6RVY/JLylxiU48OJCcijSCIuglwtl/ZIW1HYq30a0uMy
         5ALinlPx7QLqM1ZRysKHAgr/MqS3piWbdMtnC2f50yeP5z2zP7lscSugB55GI+OtXDqI
         vobfHM6tPW2Ce8yiHfCmTcioiRvjR5D0oSH/1lu4CIp6aZ5rjB7yJXDfY8I7RDEqZuyX
         B34GdU0ED/FQN8JJGlRqN0gvGbMo+GrVs1Bg2+o0T6Z77QnP88Bqng/ZW71qtJjwJz3Z
         N8ke6ALB0e6uINE5vFj8KGECS3Zpxfuyeuz53v433ha1BC90Rzpph9NqjUKMxZHeQvTX
         Zfpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748818; x=1792353618; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHzd/PpmTpoi3aoYVl6YzROirHzRjHYEj9c77Sd2SZw=;
        b=XcGrZgQ2BM8TnRQxhnQNbJrLJmeZMM2+O9M9yLPbMWKV/grJ8wWnnpp6qElUl+/0xV
         CDLfiGDvtyIrZ30pCK+SoUAu3Di2rAmq8zXsnjvg2HhnRNNH4njyKmB8KXUGD6NMpXWj
         +VEe+bpCUYPZEd43WvFC4JIou07zi/Xb9rNdB/TExQrWauMm1SgC23ySlNFJFVddtmSp
         OMYaHVotMkuEO5GY59OU5r89f+Ssj4IiJ4yVGo07nnXok35FywyDTmYQmHFZhsp6iKxQ
         QsUTUHN2yXg0Z3FLN2L2oeFKDLZPlJXKdJ1C3KftzUJG+qD/fh43cYMm14CcmoK2lnDq
         3jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748818; x=1792353618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fHzd/PpmTpoi3aoYVl6YzROirHzRjHYEj9c77Sd2SZw=;
        b=wSDFktJU4FlCyloye8q1SBKickrdmZU6KuYXgzYbPQeZ7KEpUMl1JVQqE2lQZa+vFT
         WK9wruNZVS/bEWSq66DZX5SNVGtRPdlDn9Pfw+fePbtfYnc8MUG/m05QeS6JSrCc/OSp
         BBpwDe+jMhJZwRVXDzhHQh3MBStSZMqlReMDLPgHuOiEceqo2wN1Pb/sIODYx6gpTM9f
         9fSqUMI+nQMaxKKDfanUIrLpY+m6xFWfp76nnkh9jQN3PsxjfXA5LJ8oqIvUzuO1+XYi
         sR6jkzLKsSvZpV+1JJywLCPdKykJO+NEsP3hAz4IG7Hqfsu7wCMmfISbpWtb9v59apP+
         NkxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5t/LQ6wMeloRIKuVi5c6yj/6dj2GN5lEMxEx0d9gYy7QJWXRBEthNhIURHgjAowe4Wmn8OidQVd1/LjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGC7zJ47E5MuucWpgnzur54AXi/zf9cqb/nwRuF694ETdlyA6j
	W0fnmmw9u63OYY3ISURRpxVSf+9ZBMccZ5GFwJAimScZU5hYQ89gwTgTznrM9DXdykEO7ekMEvt
	/9rrIVhs7yP4loJou9FCay5lZAxzxBOA=
X-Gm-Gg: AYBFou1/Z1QA/nQjU91xKWI2s1Fs60ZZbN+I+i3K3RpsxGD3lPvykosUh6PqHUJBjr0
	LaQxX0dC8qtMcHjL9uDe8+KVKRN+TXfA5PjRSIaeWK/iIfbOsjQbVWkUJdTtA+LMWDG7ufiR1UV
	Lp1YdJJ7IoIwOk5cSyfkzADTMz2q3kcbG7/7/3TbcwoN9Kit/LWYiebV4IKtLZdhl9ilTH0rU/7
	d5oN9O4MBlor6UBW5zs8eXedOZyeELcT0yYvnPowhKMmY2k0C/YczWf3+kc7K8+xVC5PvdmBwtJ
	l3+wGbh5yZiyrDJRK4CHp8rnJo8vhJ0L0z6YEuFdzn5o9CDRS5GA4Dx9kRyzLnOH+sCuZr/fzH1
	r01XSyFeVNL0GBknyj5p2R1HYnXTInyIEaSrZuEJVia5KtG2UHOzbLUz6TVNchichUF5in8A=
X-Received: by 2002:a05:622a:2615:b0:535:bf6:320b with SMTP id
 d75a77b69052e-5359f066860mr125127841cf.0.1791748817777; Sun, 11 Oct 2026
 13:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-5-linmag7@gmail.com>
In-Reply-To: <20261011191344.981000-5-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 11 Oct 2026 16:00:02 -0400
X-Gm-Features: AclHuK8gThSsTR6UPLB2dbtNxL1DaDdN0mPX8SSgu4DvGRlJWKXOsoPGo7emv4k
Message-ID: <CAEdQ38GnwLbEWicdPGN93=j1mNRpY_yO2m7iXJ12VRq5V3WcCg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] alpha: decode and acknowledge Tsunami system
 machine checks
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#include <asm/irq_regs.h>
>  #include <asm/core_tsunami.h>

Patch 1 already includes this a few lines down, so it is now included
twice.

> +     /* INV invalidates SYN, CMD and ADDR; SERR has no command/address. */
> +     if (perror & (TSUNAMI_PERROR_INV | perror_m_serr)) {

If SERR is set together with another error bit, this throws away the
transaction that the other error latched. Can it test for SERR being
the only error bit?

Similarly, with an ECC bit and a PCI bit both set, the fields are
decoded as ECC. We cannot tell which came first, but a comment saying
so would help.

> +     tsunami_clear_errors(&live);

This runs for every vector, and tsunami_report_live_errors() then
prints whatever was latched. Does a PERROR bit still latch when its
PERRMASK bit is clear? If it does, NDS left over from config probing
will show up at KERN_CRIT on an unrelated CPU error.

> +             tsunami_process_logout_frame(header, 1);
> +             dik_show_regs(get_irq_regs(), NULL);

For the correctable vector this is a full register dump per CRE. Titan
only does it under alpha_verbose_mcheck. The old code dumped as well,
so it is not a regression, but would you want the same gate for 620?

> +             mb();
> +     }
>
> -     process_mcheck_info(vector, la_ptr, "TSUNAMI",
> -                         mcheck_expected(smp_processor_id()));
>  }

This leaves a blank line before the closing brace until patch 6.
