Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9034908B0
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214336; cv=pass; b=QZh8wLXUFF6Q4a3GrS4EROTICbcfyWJTvQw3EaCk70v2S8AZYbX+IWMQ7ChRHx+Y9tuH8VjOtv9dirS4oNPyP5J0GouJN0rkbh9wEMpzbY41jyvHZ6PBTe9r9ymamaOS3+6EYLgZlwn5tPiy3NMy5MY6vgxBLmXjmCjkjuXhG0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214336; c=relaxed/simple;
	bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiQBvNkOqT5jndKFzwQ6cl4rmNtleUUHVLb/ff6a41wXiCFxcT5RNLjvoA9TEJqLBmVFenqle3MY15EEGX5kjey9maTj3Qks4abkbbGoeOQMhf18Rdm4L+7u+iWK762y6lnhqVH4dUbbuoldadbrtkYuitcPs9wQE9+MJqDBaBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X72NKqqR; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X72NKqqR"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91791ec1b83so14637646d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:32:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791214334; cv=none;
        d=google.com; s=arc-20260327;
        b=kUWcjoXJFONmRSBZkg4j//UDXH9Q6vvXN0OO+nbo3khxSUODxXHD4BH4aLf6v9gefq
         aM96WRHJlO1/1ZhJZG2ozMAsUWRl/zbl/DV93wvACHkIMnDTe4xEZyyPMxKw4AaIvk4y
         lnIVgm6oJJNa+wHZ94UvNZEw9is33wBDqL5EfHzBa2MwB0E9h4rA7qQK1iGBuJmdr2fA
         M1TIUJz2jzjhWPp9BDEvVsgcY1AU+VHZklG9eWaF8k9AHh2VR1lhNAlpv8Ru37xQ/Eb2
         VHCibWuIQ3HrJoTE+mv8T6vGpjRNvp+QNRa2f6FHSJmN9l/06D43hayoPl87otgFkdqj
         cXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        fh=OKCUG3w1w4Yx7XkanmWt266OHCcpdXlfs4Z9vfyIy6o=;
        b=hOxZj35vSyNXuHo7NWJup3uWdnjCn26+kqs+USKSdtRvTn2hOvrMIECV/vS79zwlvM
         RNVt4EB1ZunWcR1NHhUkxsVec9wsdDgM0+MSz9sDWQo2LZ1hfF59QiNGqZRakzPagLr3
         iddDQWDUCYYI9l0qFcmU0d7R25KbGFhf9LrjJXQq4oDJdzGjZouoLrne/HrO728S6LNx
         oGVkZEKk4natz3p0OWAgb1NsZGpxqWdT4UN8Ce3UVJczyO/DisEkEhElIfLx5806j3Hx
         PfjqI9Fmm3FY5GUjIJxIW2knuNOyEDL3pdX8HJjFXmWbSpj579j2kJkALUjt3eSuOjRM
         ZWpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214334; x=1791819134; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        b=X72NKqqRKLlJ2z8yam1AyCl+5IY3PCOHzJ5eY5al/5SYeo7BuZ5JwwuC/38bLrskSR
         mPx9CWG9ytOGXqzv2BI+CbKtR43brdcoOVFjV9cLZxiSjMg4AbXA9ETwBh+V4ev+Ble1
         g3+Ko+p6N4295xvZwTO1UvHirOudRhP5C94lMBhWFZzYgAr/Z4hmuD/MB949p9jDpA6t
         k80VVxOK3BvwT1iln6L1dBqwWOcgNPHYceI4PPBdjhbQ9cNbFMd8UBfz7rPECesQppNQ
         9Ctu6mAWZ24XJO0jRt6rVzMpdBU1+QCv/gbnmKrIGGhYad9l4kDGi6TdJlrE8GHW553e
         KseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214334; x=1791819134;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DHbE/ZQrnN4lIbhz9d2lRY1XaGiqJgT56yvkXrJ87/I=;
        b=jNCGEIuF2T7593AJNh2uB8u326hnyQ7hE8eeKnyoBeq9HuTgoz3Cu4QZvSlBk7u3Vf
         CNwN9r82YHIMYVS3jgivG86jYof6ixUKtOkpaF8VuAjdv7qwCzMeuz3kzasYLRRihWvv
         dujdQ9hAyJ0FV6IfhZLAfnKjxx504aeudEEEuKzGF4bbDJlqXY2CSDOnzmyaRzd5wM94
         GL4VgEYMFBFhDfQq8cNGNAKQXa9ULKuImNA2lUVrnm8eOCZFuQmoUkUcmg5TEMx+SpuR
         3iepvBDCqCzVa/5nZPDOrdXTs/av5TH0uzub+UgWXH/xnzDFdS3zc4pTFYqIL47m95dk
         MbSg==
X-Forwarded-Encrypted: i=1; AKwUvByZXJxOP12wm4bc3JQ0QNg1S3qYjElro2S00Gs62iAunEGkq/se8nVOOPejvt+teFbJMnKJFUz/Nyc9JSE=@vger.kernel.org
X-Gm-Message-State: AFuF++mN5+Xh4sEK7WfeW9tnFX4TzTLkd7c6w0Vc6PnnME8naLITH1Ni
	cqanYODMts2NIMaReCEIEyfcjZMMc95MpIrbq/+G8b2vsPQ9LAjL2a2qWlfg5WXs8IlDpewEl7a
	+l9sKvEtmK/7836SUwEpUP4o0FiTpYBk=
X-Gm-Gg: AYBFou2mKxp4YJ7lJwJLzxYIB3j97mwEQIg7fZEBrYhBOszGac+KZH6Ik/q5LiYCrMY
	UNIgR/eLpjYLyaEZJcE+hAmu7e/Vm9RMxGMRymtfVRp9B39JSyY9KvfJ4ApL3wl91rrZQujql1O
	Gu4bhA487h5LdfEUzFRuEWQKZrDMidgcolqMXWBCKlchfP1dMBOAyf+uAYsH4e5IHZKqrdU5nMr
	iH0dX/jrtinC7AckEsEpbmmPjNbDX5VmdLP8LB2xDciEBvH9MmtJeNTWzJY3Fky+pIDOlW5RRxT
	3NgxOZ0n/DwKeB/QUADCDqHVqEXnbFCgBoTQrN3eHtAiXreFgeZk9Do=
X-Received: by 2002:a05:6214:4906:b0:915:e9af:3145 with SMTP id
 6a1803df08f44-9195d07bd1amr138006566d6.12.1791214333390; Mon, 05 Oct 2026
 08:32:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005105535.2472-1-ansuelsmth@gmail.com> <asPCFDMXyntAV6lx@parshuram>
In-Reply-To: <asPCFDMXyntAV6lx@parshuram>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 5 Oct 2026 17:31:59 +0200
X-Gm-Features: AclHuK9sfRTTob9cejo5rJV-vGSG3XFEFgdIAL7ikLesT7uwwOKne_JE24bBBNs
Message-ID: <CA+_ehUx_B2K3WgLYkt2fz5jzDRB24LQRB3uX_VScZ2QSxCojPg@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] airoha: an7581: USB support
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 5 ott 2026 alle ore 17:28 Vinod Koul <vkoul@kernel.org>
ha scritto:
>
> On 05-10-26, 12:55, Christian Marangi wrote:
> > This is a major rework of the old v2 series.
> >
> > The SoC always support USB 2.0 but for USB 3.0 it needs additional
> > configuration for the Serdes port. Such port can be either configured
> > for USB usage or for PCIe lines or HSGMII and these are configured
> > in the SCU space.
> >
> > The previous implementation of a dedicated SSR driver was too
> > complex and fragile for the simple task of configuring a register
> > hence it was dropped and the handling is entirely in the PHY driver.
> >
> > Everything was reducted to the dt-bindings to describe the Serdes line.
> >
> > Also the property for the PHY are renamed to a more suitable name and
> > everything is now mandatory to simplify the implementation.
> > (the PHY are always present and active on the SoC)
> >
> > Also other unrelated patch are dropped from this series.
> >
> > Changes v13:
> > - Rebase on top of phy next
>
> Pls fix the chechpatch issues. There is new blank line at EOF, SPDX
> format mismatches and many more. Make sure you pass --strict flag to it
>

My checkpatch doesn't report the blank line. Am I missing something?
For SPDX, is it ok to change it? The commit just move file. I would
like to fix that in a separate commit after. (I can include in this
series if you
want)

The other warning are about Kconfig description where I can
artificially make the help text longer (no idea if it's OK...)

And the line too long for the define but making the line shorter
would result in a disaster for the register.

Up to you what I should fix but I guess the real important one
is the blank line but my checkpatch script is not detecting that...

Can you help?
