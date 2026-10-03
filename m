Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C930352C54
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049572; cv=pass; b=QcX7+93TQ+tLytFCquXx9uWW5i89VWluwStWqpvGOaFnxW9xc+IUSK+QYlaqiBitwcfjxDHeaMr6ZOBu2rzYw39sLWalkntazg1IOUg9XwVRzQnzPAkAXL3OOoK1dw76nCct7IJ3airyrZlV+mLojGPvCyKFFiXLGNaEuEEXsfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049572; c=relaxed/simple;
	bh=z2MbF46EZ5ucv0Rbn4jpxSOSlpvuR5oe+FtklMkMybI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKvEtooT3sV8tUAe/Y8TwBxKDm7qiEb0NqgZMWNg+eBic34+7oDT7mWPXKucu/7si6k94D8s4tjkW2y+y8CQwQDVIdDrXQwkKpJUJEaQaFww3IAw1sqjcK1yR0CSeVUtFazmb8EcLCn1RxWD8v11E/I/bR5WKf2TkjIAuEzm510=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiyV/7OY; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiyV/7OY"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so670894a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 10:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049569; cv=none;
        d=google.com; s=arc-20260327;
        b=eKmEh6HS/9tkclbfv92tT2wocRspi+2HB44LXS5KK5AiisWZXdsw5bnOhcHx4/5Aiy
         o1sRNb+DD+vf4gXtSOjYZ8TAImCL57+uymD5APpaZZVDD+ZFmV6fXBBaAeA0TPEx//0x
         SQ14AdubcI0tpz8QGxCkuct6bOphldUaJMDZqOHptK7ru038fJL7TyQQFcuYijC6rs4O
         m0vKce0qUTzFDq7xOMDCEkV8Ciu8vx4NZwp9n7EXSbu/XXKYNi/rnG32RbdR8LQed/6d
         RZgrn2NYlORYg0DtgKM4O004BOJ552anhaRQwASmKQtI1obwljKftwvTTjY3UH53RpuM
         +q1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        fh=HahFLI1DMgVuERyCUlUhXewgQMbefkQrc4XZA0bUyoQ=;
        b=Cma42Jau/KEX54d6kbFHuScgnZS5vIB0/Axq+O3dIF3Tw8RjoTAFeCi+Cbi8WdLje8
         Z8Rs26VRoP+pBoMqmmx6punOtxDapJD6vUglPPh1I54PLRSnrFNuG88+9o9rK+nXt3yi
         eRyDofGnHSOkPAKlOZMnBdqmyGLmAP1JQD6omFtFhpTbMI9GsImYAmCNW51rLJ2G+nna
         DIY1t26Ufke/IRlUwAKqoWo2zDdnV/UAMq9N7i7Jnm7GdwfE5LaBw7ZaeBW8tbPlPJDF
         tQlcEApFqgXUXyoRVR0DjE9ohkhFkID5v01Q2D55HgApQgDE8q1szXzwxc5s7GtLVueg
         SY/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049569; x=1791654369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=XiyV/7OYH8shVFm6i6FYH0R8A9d8hZ7Rl4m6TztQAlnx0bKdSbRygem7TvnYJZgYX/
         /ynQ7u3Ma4YtMGURHOt6KUj8IYbkHN6K79JFmIhsekxUAGye+HDOwtjZUzyFqyIDqz0l
         +40WUAnKAo98LlmObYtDd4gCkZJtyTT+sjEvka5zs3Q6whJOeKi6tCTiUJNzxpDkCpLF
         OeYetQga0XzoAg2C2ZnPyb9wW/PvGfw46ypPh6eBXDp5TIckD8cPeigKqxbXFpM+RKkV
         o+hUPY3PGZBkA7YifT8KMRKMm0J39CkzmbxXzboBlxnE9dqYvQitBtwI63M2+ayKIJA/
         J2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049569; x=1791654369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMiH1wSVwCiyesfMWslIkjdwyDMLwOiiGX8Il+FqIEQ=;
        b=us/omb4Kz5vzoep0oXNPABCTSJAiYNwpXVDjstDNjBRR3aBKUh0G38B6Wj3S5DhVaB
         ZlHmLspnoKQTzLR5sUCJd5j14uYFTkoGe16OnOwIpsavHR5w+NDOyMbS7FZo9dhAHVF6
         R7KZE8YJVg7VGa9vTHR4Hjm6hW+4XSl8Qxu1RvC8rpsnZbtLesYm46ld+iTiqizWyW4J
         NIH5osHnwTLiQB9e2MnkwaD2qcaFd3ZTuR8iNdtXbQnFVarxYki7/K6DRGPep8HxpeVv
         1B1qcnfenSYY7xvMkvVgyjJZipSqdBvaYJLwncayndhL4Yza7gO7MXDIbZuz43WElvfR
         b3wA==
X-Forwarded-Encrypted: i=1; AKwUvBz+GNpd17tkL7XS/1T4YhQV0j+3FdRn7pwwKgFHfr+azHvREt7is85LmyJbp+s16GsrwZnZ92uFLFY34yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJViyWC0VIfArvnPyl7vQ+ibYnbMPKFDZUWuAadIX6CSQzMT7Zd
	lro6TAt3B6yCGltuVQwWhHXGpZHsI4Ak3TLc9R9gFfy24xj6wpX7l1jDVjmaMEv4dnjgrB+hfMJ
	qOJiBANvWFz8nPJeSoX43HOefjKBdMrU=
X-Gm-Gg: AYBFou0mV21X1pxleVOmdiHp7fPsYEFd/y2mn69E87htQOXH1d3m0+5d5d98ZFBabQT
	j32Ogu1HmDeNKHoTkp9810XwggSUuypFRG0HI+oc5bHRkSEsrXKftk1QvcyMvgxAnrNTHxmtaYP
	pR0TTO4EienYYI/SERvlV6aSF5MfeoHOqzxn0+OQwqk27IExL300NNki16NbuFrYZlFu8UEsnSH
	TRA3pKnrDjbZmIDZkObm7wYtEm0/G6Yi1ZxPJOXWOapd7Wy/Q3WymRsaZK3wbtUbPpQvjeWBT7K
	F/Tsg1ksz6U4F3ul0vrv3kpo3NA1eU5GJSbE9s+zssvRwPcis57TIIeNwxAIKLOjqBH3fV3kSV5
	lj5s6VUOLr9OK5+wtFhHtrjG32ESdyQ+1n3sApiiCYVD8W4ENMUwbNdggJppHOIVbyAZsxNuXvA
	TjhFaNI5HzTU8zhppF+i8IjvKw5IRD8mW7SR47GASb
X-Received: by 2002:a17:907:7296:b0:c2e:3ed7:7da6 with SMTP id
 a640c23a62f3a-c2e4ada63f0mr521651166b.25.1791049569085; Sat, 03 Oct 2026
 10:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-3-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:45:32 +0300
X-Gm-Features: AclHuK_DTCjZOQTCqmPG6gDQzEj7LZ2x25KMdK3y7HmSttC0mQYSQAXn5_TTUz0
Message-ID: <CAHp75Ve+qpAhf-LcsNnFwyzQU31FmHkxqZGsEMxd-GEUZcEt_g@mail.gmail.com>
Subject: Re: [PATCH 3/9] gpio: mxc: cache compatible checks at probe time
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> of_device_is_compatible() on every invocation to determine pad wakeup
> capability and i.MX8QM-specific behavior. These properties are
> invariant for the lifetime of the device.
>
> Cache them as bool fields (has_pad_wakeup, is_imx8qm) in mxc_gpio_port
> during probe, eliminating repeated device tree string comparisons in
> the suspend/resume hot path.

...

>  {
> -       struct device_node *np =3D port->dev->of_node;
> -
> -       if (of_device_is_compatible(np, "fsl,imx8dxl-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qxp-gpio") ||
> -           of_device_is_compatible(np, "fsl,imx8qm-gpio"))
> -               return (gpiochip_generic_config(&port->gen_gc.gc,
> -                                               offset, conf) =3D=3D 0);
> +       if (!port->has_pad_wakeup)
> +               return false;
>
> -       return false;
> +       return (gpiochip_generic_config(&port->gen_gc.gc, offset, conf) =
=3D=3D 0);

Too many parentheses, also the semantic of 0 is not obvious. Better,
for example, this one

  int ret;
  ...
  ret =3D gpiochip_generic_config(...);
  if (ret)
    return false;

  return true;

>  }

--=20
With Best Regards,
Andy Shevchenko
