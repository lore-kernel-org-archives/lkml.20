Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5214568526
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964424; cv=pass; b=NcDoeG0RbpHu1OIJT30nJ9VA2o2hzca7maODVqV4QQ+GT+cMtjmDFSlLOLCaAWiSaNPRtYehZeQ/wVnaEmaMd0AnNOsm9lK3fv6GCkqNMx1AniYRQjYn1S3xtGvLLE0kBiDhJ6VmKX0+z8sx7OdTuSK+1SkqlgCCEYNOsVmn3ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964424; c=relaxed/simple;
	bh=sc3bVyIxBh0d+wj/LxXIb/GjWX9SGCKPaM9V1MhQnEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZmgPc7Ug4kpA/V5CBGd5dshwD0AUq8WMKjd3HFNz06PtrqXcELzH9bwL2nL+ClUUTUIdE1iqPr2gZ8BnloGj8sfPU32gL+AfllBaIta5/OD/ofOUh6hzFWaD86pcAl7YIf8NvsU8xReYrdr02s6025zZ8vhsQho7gAmFWUV+1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STCVCevf; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STCVCevf"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4c0cd10d56fso342472b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964422; cv=none;
        d=google.com; s=arc-20260327;
        b=khh3kKxwBdQJGSkopYK5f9Iv6uYfwoqWzXt1cWxwj7ARmqkOZSf5z1Hvemc5VUU/gP
         0FOu/Z2HyNHjIse2uOPTas2kA2CUA6+NU0/2Q2yrK06ZlfLvY7Ou7xDNpvFlJtbUpU0X
         nq4In50pasY4btK5az0exZ2d1xUawUikQ6zeeqRbDH2Ox6sYg1b7E12PrZIUr7Wk3/kV
         5X+CH4QWaU8mkMYv9mMOnH5bhcJVBbr7q7GsKW2oTmAmvuLzaLdA4LKMKQ4Wo2FJSsf7
         WgEhSf47/Mg+Acig5HXC4ndsTG9uGE70q3ynkbRnaXnjT65D1aEZ7hPuFVWxluc9mUv9
         14zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JrAGYZtQxHWbWrqLOMN89bORD52IltCr3/3mzUcj/II=;
        fh=VTQzMLyoG6gizlQ0tY6xjzGXjagZfLM+yNOvdihcWb0=;
        b=Fqdc5vKLY2DOApIAxC+IqWAIbSnkcq7/6s30BFUebD/XHPsCyIQcQX4jQ0gW94kLIT
         tT6HUcXAb6wu8yx9g89jQnsKw1oo2dz3zX9ez87mfEyymTDL4UD4zFvou7LIHb9uIMxp
         LWpgJ/n1QcfI82baKKCuUKX5IPL/oRmWCwYqlbgytLXw0mHFB61LFxeiwkBmp7j1dIUi
         3jd7bVqdanHczjBJDahObg+eX4u/x0D1e/kClGCfT5i2BgiGt0hLx4cjsHKxuOusZt+O
         NnVcdriQ3npF/0w5DmYDKKMcFf6UwkF6pq4PtEYNZglpw0aoGTvBqOJH3D635pKQHyH7
         8cqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788964422; x=1789569222; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrAGYZtQxHWbWrqLOMN89bORD52IltCr3/3mzUcj/II=;
        b=STCVCevffGVH+xJ1jeQuPH5X1mkSgNWc2NriIhxtgsziNN7QI3lmYqGLuAKyb7O2zu
         IfZCetT/FLvnZQZuElChnQIsg10KU5yBZNU2VuSKJ3ht4RXyIhBquMI1rKXYSBFjXE+c
         5dybE61/AD70k+BS1eXVCYtRYqe27S3XigX4EYhyWQ3NZd5UDtUG/F6xgg7D3VrxyjHs
         10nz8esO0orh/If4viN12m2H05tHKPxSd9LL6b31n7xkJAI551TQVhsazs7tEYIKU7Dz
         OOGt9iai1HBLRhF1+QnTnFAho/i0T9RNPsEm+2eChTXcv0VBTCUupBJcR6MEL+x7a5Jf
         ADFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964422; x=1789569222;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JrAGYZtQxHWbWrqLOMN89bORD52IltCr3/3mzUcj/II=;
        b=bfyVeTJsUXk0EVzYbC7l6Goo6RZlZHbpXFJhuETTfK/ViUJUZjz4pB6w2XRxEkg1MA
         xqB8b0zz2ELlalCovJjFrm5qVHeQB3ExquhDv6WOwRLj9LrIeSfeJqFPBKE5nwj2v6wY
         QywXjX11tHPMCvIcF8uBbN3YvNyRASXGtYojzuCyY0aOMsd02/7NTILZiYKS2Yyi6udH
         cYswD0x9YO8zFICra2FJ5S/PWT2BsCZ6j2IWNhuBCm+wIjboY7XrhycyWn2aeYiOJ1RF
         g0mZkA9VRHnqJhBD2cPieydmP/3YNOIdCgat8VZq+Sqb96ClE5kwETc3NSQPoQQD7tcK
         3EHA==
X-Forwarded-Encrypted: i=1; AKwUvBx7/lr0V2K2+mqN2O1+AIqzQfwJw/Ae6NYbVooTushg/j0t7I21MJsaITv9r1M6MCPuMjkqWq7jVprWRGI=@vger.kernel.org
X-Gm-Message-State: AFuF++lqBzPgIfvBVKck6RZCOZefBGbaySNZh8H1+dI1Y5AoB295zeZj
	D71t9g5m7MLNyQKfvtdXpVnuzHcpFmfcckLVjUL16SonJv5PdYpP7T5S1AyolW7dbvoktwCsdy+
	y/NYX+jOX7fitTA5H0lMvKGF5O1DCJzhTmHsEVf4=
X-Gm-Gg: AYBFou1ZwpfNvvL1oOrB31LXoQx7mvDGi5fUaanN2wT6cp9h4J7LMzGDgFOk1E0vzvv
	SQAaXp8SK1+w1Ge5Z0bvQBcHLFCGzaK1HGO9JMqFK7OQRI4QSxw9wkTTxq/wNpjspAXM0cS+XOI
	QodMkNUO1ASrhVOeQS3FpuowB+hlpIYEux8ewNjO/FDs06Xj5o8tdIQCJc+8KsnUGt4j8Htbfoc
	GlIjFYzzIBi+oXOk/uQ9cgxpZy8/5adNmOeWr/1HmeHraKDRTc2MyWIrZlWNB3Oz+Qy+8OkXy1F
	btfiHO78h2J5/Alwxk7hqTjbpeSB4p9CAIS43N2oWCpRrulq73P6TzUVtjAYViNmv4yX34CD8ZC
	LfksFWiZwdv/5+A==
X-Received: by 2002:a05:6820:f034:b0:6b9:3295:76fe with SMTP id
 006d021491bc7-6b932957a7emr9354112eaf.8.1788964421691; Wed, 09 Sep 2026
 07:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909131253.2158486-1-dinguyen@kernel.org> <20260909131253.2158486-4-dinguyen@kernel.org>
In-Reply-To: <20260909131253.2158486-4-dinguyen@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Wed, 9 Sep 2026 20:03:29 +0530
X-Gm-Features: AcwNN1VZvuSDtTgNoji8VaCpiSitHoNDPvAc1bk9oPNPvkeAKfWaadrsviD1jLA
Message-ID: <CAPYTKoOmFpCzw5EydwxRdq3LhKP6p+osY=gxvy+KOZWQsXu-qg@mail.gmail.com>
Subject: Re: [PATCHv4 3/4] EDAC/altera: Fix code leak on dci allocation failure
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

>         if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL))
> +               edac_device_free_ctl_info(dci);
>                 return -ENOMEM;
> +       }

This file will not compile since the braces are wrong, there is no starting {.

Also, another thing that I noticed is that 2/4's Fixes tag is missing
its closing
quote after "probe()".

I will rebase and resend my of_node_put fix once this series lands.

Thanks,
Rounak
