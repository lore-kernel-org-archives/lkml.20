Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F3554CF48
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085203; cv=pass; b=uaUhiTSYtcMDim5NFOzXI8CwmVejitPOUCkrZzBEAtwvGjbDv1DtDqlveveu1yof7aV7mCfw6oXu1fWg/i+K41U5i1/dPWofILC/wR3cuVsibYGxrF2c1FcKE71jQHylOkw3oLFnsHp9rways6I/C1gICFsCoHxDHrT7dDQ4MfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085203; c=relaxed/simple;
	bh=0hurBNTkrVz1B/9TW5ipWegr4/ZEEZE2GB3faJsOdT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rveZ5qudHfNHc8PBETWiX+y3rAadG0G95jfJrv4JAmujlWEkQStxLeAu0M4wYv+6GPJY8Xjy4UrKnAFtmSj4H4uU8RSMPW9bnS3HQegkUl3VMWA/YZWkWF6CYywSCOvPZeTRpH/ImlvCgFohRUbX0V52SqvfmOo02tNWPRyIxng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBxsn/jR; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBxsn/jR"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so5253655a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790085200; cv=none;
        d=google.com; s=arc-20260327;
        b=l5Os2rrc7hdi/M63FcdlG1HK1YCidYHOd4LOs6sz0E+dRpNOcLa0phV8a6zdIVR4Jh
         k68hqnRU6uCImUHxwhJzbwNN8eZYcs2wpkMvWdbWWBzZgiksjMAqaRoDYjlJInyjpqyH
         spJQNB4DnuY1dr9lJ+dPKf4HPnUVPdlH+SMMH7SdFpz8BlHghxEGeuDwK8NN0vurbHcy
         4li7UuIZmSTB89aqCbdjFUCYKJm8srMP/VhKLqG4V3cQnVaiTQ8L3kLziGfwn7lTXksF
         Mr0fyHo9ZDqJ9ONdP3DXaCfF4mDWXep/hc0G8A30TzM5YQnzgxuATqInVn44yQGn2b1M
         MJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        fh=IOP/h2GDUC9PoVpnccIitbYuoMBQ5rSn/YyikI0aqiQ=;
        b=qV7oJqKTwVbVGjdttPCKGhMiYkkwxgiu+M3zsT7gyCPZyMUrp4xhSAqbw2RsPVjmOm
         +Zd0wj6bzQFSG8QqcOz8mOPU8kIlVv6DqzV1FqVLxkaQMmk8FRlSnoiuTZDfjm5BrXKa
         EYzONHHvdfSrQihquUM7Ru4/VZMnPcGdQvHnoOFEbFGi9cpn1TapBWzQJcaZJwlrhtsZ
         zokYuoyWmFVDuXqc20eIyz50zqp2VzOxP7fcJDLU6vK8iYhpcVKPn38wVatLBUD5bA5Z
         MhIvYpCWkwLvWZYz8Umy+XcOIr3xvY77rJbBQ9qC3idAFiBojfEDHOANbcQOHEQgsGuk
         OaAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790085200; x=1790690000; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=JBxsn/jRsaGBMEy12y39mOfB9BBGyuwRxzlayFrew8tXeXkG9tehN7PlX/5mljzimw
         gCF85PXhWZv+i20SnAc0zjcjbnclieOi7XMcA4UyVd2gSS39sSywN8UKdfFPHsmlEeuy
         hxnX5VRNS1ZNkcUT2sApSfd2nMQdUSJ/ERnEiUM1UuuGJZtE/Yz3eJ1BO64q/4zPMqFK
         R/TD9JAKZ3TCtSrybpiEG5nXpme8A9IVnYh6csgQFh6fXUxsVg/njZv4aBcrUHGYiRVl
         0lZO+lKjaj4VRtThlQANUrs5E3fFFqC5I2kGvWb2I6fKCQ0MspGPYqI4FTrpbgb02EfK
         EO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085200; x=1790690000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awCRBzfBSO0cm9zEvmZIeCCRXLT0QzBOpw1tpjmmlbQ=;
        b=C0R+DwEj8SlglJuIzgFBDf1RPgcskSIfQ+cj6D9iMPKh4Nk+7TLR5lXl74KxWI6VQA
         0Mp0SettumuV+8LOknIL3EgXTF+xwhrOYC5S+DjCqMFetURYn8+zE0bZx7nHvwWLVjLI
         pkvhN3MFeEVHbuIwxiB+Mo7tv3DbSQ2Ny5bJwzpF5AgAINKG9mfWWo7j/ZoHKdSBm8A1
         zmR0/261aXLnoNIps7i3p1QuV1npP61Wqv5YU3kO1yfWJlp5Qm3hKh4IDvkxSGS7O7qK
         d/fXznOqssR5TT5wofRTGTkgQQDUOaOkkh0qznMeZuT3fVdvvQCgFXTarCdR43OPl/TC
         7D4w==
X-Forwarded-Encrypted: i=1; AKwUvBzKCOCDNFFcNBTCnGUsiUjkxsGsEeqegytipXASduZouiL/0yAIRzFyMKnssTTdG1IFps9LmnIqm2Otq+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kImyc6drpJ9LKD7l4Ja+zqxL2Qsv0E8+Id5+r7OLvdaWicQVFO
	JcHiGDZ3V8ujIkcY5xIGpHrvDcGB85YaMSW1CuGoXqHwVRQwowm4CAMNrtHM5o5LM3zHr2zu27b
	wN6zp2RbHV134gywdq6l8QK7xDjRxOR44a0NUP1dupQ==
X-Gm-Gg: AYBFou1x8DT9LfmEHY5Mbq4Lx8DBKy9x5NzZTIPr8ujTVEusF9mxlzpebQqQwNmkRF5
	v5gfzz4U7qeMdzWJy9nrJJTTpoKks4aXC7dLJClYgaYiH33Z8fzM84JiygNf67qxiR2WHjRcaZn
	oz5bUNVIEc+tVTlcV6a9eBnfZjzyrwnWrqIlbvst/cs3VIJlwUCQuddsiXoLfGPeDTDIvYAzA7P
	+PXwBhYCah4U6pO/paNdluZU0PdzgonYlNeInH0EZyzGPyEmu4GN0vIC8WxzjqCgdkn4Ut2DIja
	B7Oj33BQEy+IBXB+TN0ktqQ0Lse3Ji5gyDs+Bn2WjmBJX6G5CTnHsenEyQtpkIVUThfE2gMsSbZ
	QYaRqV4/NSmUr
X-Received: by 2002:a05:6402:20c3:20b0:6aa:9210:262 with SMTP id
 4fb4d7f45d1cf-6aa92100342mr3351155a12.22.1790085199929; Tue, 22 Sep 2026
 06:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <aq1sooGCYUiWbhMH@p14s> <aq453yukMHiNb1jp@bywater> <CANLsYkySF+eF-FURnnT6UJv7P5Sg2HdfMSBZnZy_BLyCMvuofw@mail.gmail.com>
 <arIfj-1Ji6HEBHLJ@bywater>
In-Reply-To: <arIfj-1Ji6HEBHLJ@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 22 Sep 2026 07:53:08 -0600
X-Gm-Features: AcwNN1V0zenE0U1QivuzVoqHQLJIIYIxl9SSuy2ocYOHZBqajP-1AfG4uh0OqKk
Message-ID: <CANLsYkzaxwx8NJAOki_wkzauL68ourd12qF8PzzVKW++PJXZfw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] remoteproc: add support for any virtio device
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:29, Francesco Valla <francesco@valla.it> wrote:
>
> On Sun, Sep 20, 2026 at 09:31:11PM -0600, Mathieu Poirier wrote:
> > On Sat, 19 Sept 2026 at 01:33, Francesco Valla <francesco@valla.it> wrote:
> > >
> > > Hi Mathieu,
> > >
> > > On Fri, Sep 18, 2026 at 10:53:54AM -0600, Mathieu Poirier wrote:
> > > > Hi Francesco,
> > > >
> > > > I have started reviewing this set but given the size and implications, it will
> > > > take me a few days to get through.
> > >
> > > I'm going through the review done by sashiko - would you prefer me
> > > sending a v2 with the trivial errors already ironed out before doing
> > > a complete review?
> > >
> >
> > We can wait if the errors are trivial.
> >
>
> Not all of them are. I have been a bit to naive about the bounce buffer
> management w.r.t. what can happen if a memory area is not specified and
> I will need to rethink/rework that part.
>

Ok, I'll keep an eye out for that.  I'm already halfway through your
work, so there's no need for a new version now.

> Regrads,
> Francesco
>
