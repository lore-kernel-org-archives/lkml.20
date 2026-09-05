Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376C2512C8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577581; cv=none; b=FLPjyMuu314n0euvH/Pvm72AqElzGlxH+UZsuMzqWK/asGrhCac4sMVERcura98OHcLg+SHhi4tqPjz+S96NaB2xO1qwXWpvb0xzQeZMrXdRI158YKb2DP38yuIeVnLmjoaQUUb1TxEVWdDbs7HanCs42JwXaG9ZPsurQOtF6HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577581; c=relaxed/simple;
	bh=05onUa78HA/34vDAUE1i4DkCsbgasfejcqApElO2zE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fIWNvWhoOCEdw6S9M/a89Y5OkZGo1omKwq+OBU0AK4fOjuxNggwb2sIdsBnB9I9JWawIgtiW75edg7PwNzA5p9nnst4cqoYHyJeyljAB70h0bxqdpdjzq72QuKYDmu9p6YJTG5EPd3Arb/S23LNOgKHgTz7Ts8mAu1zvFaV6MHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Cqpje6bl; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Cqpje6bl"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90ce3971a86so19428136d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788577577; x=1789182377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VakFjZ3yG4j6XtWzGOyJF4+PPwgn5fG+FnI3gon9QLA=;
        b=Cqpje6blRQPSLQikhcy8iq2juBHT7Q8wCtawHUcslIX5ebs3FupRcfYx/jUaKdJgrC
         haZEWaMGC5YVSb0thSx4Y4W/g2B5ckYunihw8drTbVbJCU7eeE+c+sQg8D7Yegoq9COO
         huFAt1YoJTPZaIL+0ngqjcJQgNI5Bgce7eRF0mhv6zqSiPjvki8rafSyMj+wRanXw9uX
         Tg/hWzB/00S4WJRRQaOHssaxnt3IX3/Xsp3LCqDyRvHDNKYq+XBNTIGEmvU2Bb7cnm7H
         DjxS8vv7t5p4vm+PRQJzb/R6oYrJtjztaPjH1zBOwFk9bFS5pbPuvxj7rZjWw6OKRGxP
         xryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577577; x=1789182377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VakFjZ3yG4j6XtWzGOyJF4+PPwgn5fG+FnI3gon9QLA=;
        b=ducghJtSUYdvoXM6RDKtG3khMh5ELaooATSzEOGSmE1RLaiTh/rdkij1Pb8rcit2+k
         /a+7GzTqn491vjHSCV1fIEuXo6U1QrBV9fbxYHNWMaRYriewzsmy4nTh7gA3yAqpTiVn
         AxdCCZF9RmOZmPpQiNb3LMYLeXKuSE+HMM0+vdVYmRMkezBpHLwSzzzdspbe70dhjyFX
         TKY4D0FjObR/HbY1rFWU3yyVGx6jBj9uBxSzzhTQWc68ZxsCjGGbuQyz+F14NUDqGCCb
         dX4N0Tl0L8xADLYaIugk2uM7o94vmqtA8C9gWmFdN9R5pTE5rLx2mf6NMTpGOHPvCf5l
         IxxA==
X-Forwarded-Encrypted: i=1; AKwUvBz2ukTlixaFgdM4gMn3Uh5PxetukytzN6HKDfOWI6Oj7DW++mO/PRf6p5quxQHgv/bgUJqG6na4eW3vCjA=@vger.kernel.org
X-Gm-Message-State: AFuF++mEIPTE2vBALiQLtfTJu+Vm4bAa13N9a63DN6OmMsEFXbp0CKIw
	MPQPuCiMAQcEco4IovvYU3CLNGLra1IuWxGM7KbcHvseGag6RW6qVm+9D7O0I22otriTzUR4rD/
	6UbqaVw==
X-Gm-Gg: AYBFou3OACDBLBiC5NIykIthdRIazkvrDmM8ySmrMPvDZZhXk0fsHnv469QvpFemZ7p
	NC7zPfF1uwC9JtiDFMJnqVBkdd349jZ2C+kCznNPtbIVAUdLkKzkGjk3PkIXFCI72j6T3DbsBgh
	cBlobvjzvAZxIav/vEKFDWf+BuIJkaCM0xZgSnWvoNgFZJnisYkbZ8wM5Iv+NQH0qX/kU5rTE/C
	Qr/nm0k7xYtScW5EaQlQHJQos7W6H33kppyxpBsDJPG1ybyS5N/rJ7HgcDbMGHOcawWQ4FOKRHg
	IsgO8FyBF07kje5pnWOuu+OS/xArBns1UG1hImWid+aqM2ZXVICGzfmfBqme45V+IxRrPEP7Wfx
	OhDE8itBBcoX0WcZchzIl4ObzaMF6hC99MYQCph5htfMWxLmaTdnZTA9kwOtB61C6EtTDaw8bzf
	AE2CzUA3FodcbYxSXQr90Z8yGa2Ld+5TkzZe4F3G//UguIKRs0805Pa45EitmXcA==
X-Received: by 2002:a0c:f09b:0:b0:90c:e240:3e89 with SMTP id 6a1803df08f44-9103ef16760mr116075456d6.13.1788577577271;
        Fri, 04 Sep 2026 20:06:17 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406625d9sm35033016d6.20.2026.09.04.20.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:06:16 -0700 (PDT)
Date: Fri, 4 Sep 2026 23:06:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Palmer <daniel@thingy.jp>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] usb: ehci: support non-standard port status
 registers
Message-ID: <cebb04f1-83c7-46b7-9516-4a5ca422d21c@rowland.harvard.edu>
References: <20260903-gemini-usb-fotg2-v3-0-dd92ecf5675b@kernel.org>
 <20260903-gemini-usb-fotg2-v3-1-dd92ecf5675b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-gemini-usb-fotg2-v3-1-dd92ecf5675b@kernel.org>

On Thu, Sep 03, 2026 at 11:17:38PM +0200, Linus Walleij wrote:
> Some EHCI implementations place the port status registers outside the
> standard operational register layout.
> 
> Add a per-controller port status base and use a helper for all PORTSC
> accesses, while preserving the standard location by default.
> 
> Gate the alternate member and lookup behind the hidden
> USB_EHCI_DEVIANT_PORT_STATUS_REG option. This avoids growing struct
> ehci_hcd or adding a runtime branch on systems using the standard port
> status register location.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Suggested-by: Daniel Palmer <daniel@thingy.jp>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

For patches 1-4:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern
