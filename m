Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0994FECD9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792082189; cv=pass; b=jzpJuidoek7XFqTQaW+yI34M8Ud2nkOWJ75auY8OAgxG7yMgnXpT+XjsKPR4Et5/pWSw3TdqKuLpvWYac9ONVOk9QpVlUBA/bnM6NBkzKtfZA1ByTs62keB0AMwJEAbKepw+ZNXxrYmYnMo/lV7nI3Dk/6aVnM2pyYQsS/zChzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792082189; c=relaxed/simple;
	bh=Q1Hbn8A5ixxsCYzm5kvN36Nd0MTAUla5jdeLPZM2QAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvYw5mJsWwHc2YY60c157YaeAQ6YYjjRp/noahKJmdkqIg/G+xs0sbxvifMu8pEnjvOB4jxynLVny50JNmPEBiGvw9Loy3WbObNOv1l3vweXJPlwJiAawmx0kMUGx+ZJfF1mWSnDjy1kqIiPFEwU43SGGkyfb70BkGLLRqbAU9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=hCxO0nuA; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="hCxO0nuA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ff680331aso26089285e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792082175; cv=none;
        d=google.com; s=arc-20260327;
        b=UBNI7Hx4JgH8TD6d6YXM1KHjmYKdaDU4YMWghcuFmrWgV3EGHxD4kH8rt/iIhf2Oik
         5Rs1eoS0KBx6lBVR27xVDivFExWZF6T6aL7o+U81/n4ZCh/Np1RfsT+55mFPTlu8jEmO
         zu46/Mj7vl1QlZ6YEtgp+rMuk5VCmKCOSZbGP1xslUTAi4YblvzVvNCi6eHlVkWxBusL
         EvljDUvvitLDGd3COUMYRT2+lYtwqYvvME+UVh+jfjDlj5eYo3yAOz+94VAeSpKh/qIl
         xhK7nOFGjpG9u0rCccShr2ww37+qyr55VFbf1rKSyuvj7vHWom8m/tp/fQ4dmASko6Yi
         J4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YZTsnGl93T9ATaDuHMEnI+XuoV61t91q+RIl87Urhds=;
        fh=jXsbHTtjezjg7FPAFRX+kwdcnyg2M665H/phDWA88rE=;
        b=aG4MxLWtf3kbaAlwimce7Xuudf2a7F7BST/p6me0KykVzBBlvk6rBPJfY+HH1T2ZJm
         YxsIiNPJwxxJ1MBlnnpQaEiomBWA31PIAWbasugb8WuFVCCKy5p2JIQ/7FhH88wefzjg
         ot5yuYUfZS6noxlihxyNc/f21clO8Flie/q892teZ6lU9jOXVeD30TaivV0cbnc9Eb1i
         uk+xWJBdw0iAmIE/P1xxvBKFToNOE9TX2UKkKkl2CBVJhdg9oKC8+flqomUMLifcliYy
         m1BEBi+b32a5xKuNzqrmXKWmrKP5Nc7twPoRCO+qW8jGLM9c3DAzOdjb/hnzadtu/9Q/
         wS7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1792082175; x=1792686975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZTsnGl93T9ATaDuHMEnI+XuoV61t91q+RIl87Urhds=;
        b=hCxO0nuA/h9+fXdy7YdWXZk1zj3kB89t+5VcPf2MOgn4vcnWUsKOE5CF9/vTsm9BTr
         y2OcY2vEGENhuXym0537aFsxbJU/rv6KUx3uTq4Pyo2t6IPK8JKvVEqsO8p072fQ6OXY
         kX9rCRYmfUmMWvR039MNitzhRxXwoxT5xcrzlcMK/52kwDTuAgxzpjEks8j8cCn0QHon
         5kfRAKrtmRkC2XjBP5c758wTP2gsskKTDfL/ZDTr3h05lCES/Zpkal13guzd6j8otd6M
         2HCMXD3vA8ynBFX7/mzb9z3Lc9b3WZPbnYLh14uRg3y6dkKLENCyWqO9sp/Goo+VEdgU
         sdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792082175; x=1792686975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZTsnGl93T9ATaDuHMEnI+XuoV61t91q+RIl87Urhds=;
        b=H+wuaUczC6gyepGI6YTxXcdGGNlsbBApldOf7vEHn/iH4eIZZYhNR1DyumL/foA6jU
         lFw0hIjjUve2OhCvIaJETiZwpLNbZRIuhprlEihXxQ5TPGHFZAvUkvVJdULzpnqEh/RI
         2hUA8BoYema+HWI2TvePOh3ZOtak4ouHwRhWi5P9ocBrAbPw1LG3z0GiUjhf/Y0vcaKp
         ZuSw0gDQWnYoG4VQwzxqMnV/GFACia61Yh0Q9u4ozfCwCEUNSENkEJ8zoQXfcVCQAc1m
         rb7Xm3ADnFRjstO9HgvG6lJqHXNgbS9yyenE149iCgCUlWllDtYlqx/wgk1ktv5hAonM
         szTg==
X-Forwarded-Encrypted: i=1; AKwUvByQMriMmoQVougimPGuv6mFonyIkAfhQRznYDvz8sx3lydLW1yvSyaSvMhB2BdJshrYOsJZNgjKQbAxEu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLoqcvH5VMrBPHJGWZaZAVahAVfxJ/e0WB314bjLI6I47kHcLl
	g8RDmFp/ppXfyhoAFbDGUdnGr8ylSTx0YcXtQqwAZSElnbmNxWnVG2JtS8ojNqIUxJ6K3L9o5Po
	HuzeRGIsKHFHIwpHOy13PKWkaOv2WhQIDIZlqfGMqOA==
X-Gm-Gg: AYBFou1+l00zM2dm/GXk8RLDuNj6Qoygd8o1UqqyexQrc/DeY0bU+MYIOuim/bI3QWh
	pJ8miIepCpOO0fpEUc8MbDZJz++kergEaUFWTKGPym+yi5b2euhCfgdeCEwpt+ObGD5TRz+4TZ1
	cuKcRpHtf8MpLXHpgfpJUhlwxu9Zc/gFjv8Bz0I0lQcRhCxGndCOV3GMNlVqthLx83wekqMZbka
	n2duzzbvZRoqwwqpWI5EsfcnnSEJZKSISvuyOsuQoWaD+LlYCGeNqYEgIc8vQIZrl07a+dPc8+n
	3Ci5J9h2wDvLz0aXFJDHPUtwP6HWFsu2CQYJnQ/6a7jfpMWjSLA2DjmuMNj47ghbHs4936E5d8r
	bem8iegNx/knupvABo9OmiV6SmCs/+jYJSvUSg8OdDmVEcg==
X-Received: by 2002:a05:600c:3144:b0:4a0:2423:946 with SMTP id
 5b1f17b1804b1-4a18e48d362mr391589485e9.15.1792082175349; Thu, 15 Oct 2026
 09:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014190815.23455-1-artem@trailofbits.com> <atBnuPOa68f21L6C@debian>
 <2026101501-willed-gracious-cc62@gregkh>
In-Reply-To: <2026101501-willed-gracious-cc62@gregkh>
From: Artem Dinaburg <artem@trailofbits.com>
Date: Thu, 15 Oct 2026 12:35:37 -0400
X-Gm-Features: AclHuK8y_jc3VDzcJv00TFRcnHd-VT4h5bEOUBoAM87IHLQfMWP-617JGGgKnqY
Message-ID: <CAP3zxaDs7Te1utQu4Pi8j5fSkJx1PbxCS1N0jXqjcO8x6jQ6zQ@mail.gmail.com>
Subject: Re: [6.12.y] Please apply one upstream fix
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, stable@vger.kernel.org, dlemoal@kernel.org, 
	kwilczynski@kernel.org, kishon@kernel.org, frank.li@kernel.org, 
	bhelgaas@google.com, sashal@kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani and Greg,

You're right, sorry. We haven't hit this and don't have the hardware.

I was preparing a 6.6.y backport of 934e9d137d93 ("PCI: endpoint:
pci-epf-test: Fix double free that causes kernel to oops").

I had planned to send this commit ahead of it, but upon further inspection
that is unnecessary because 6.12.y already carries the double-free
fix without it.

Please drop this request. I apologize for my mistake.

Thanks,
Artem Dinaburg

On Thu, Oct 15, 2026 at 5:55=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Oct 15, 2026 at 11:13:42AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Oct 14, 2026 at 03:08:15PM -0400, Artem Dinaburg wrote:
> > > Hi,
> > >
> > > Please consider applying the following upstream commit to 6.12.y. It
> > > applies cleanly to 6.12.112 and is already in 6.18.y and 7.2.y.
> > >
> >
> > Please explain why you want this commit to be backported to stable kern=
els.
>
> Yeah, this is odd, it's a test function?  Artem, how are you hitting
> this and why is it needed in older kernels?  Can't you just update to a
> newer one if you have this hardware and want to test the endpoint
> hardware?
>
> thanks,
>
> greg k-h
