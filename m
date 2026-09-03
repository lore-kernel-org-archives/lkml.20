Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A2E360EC5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405905; cv=none; b=HRfsZpN4o6fjS6/dQNCjKCRU8YyP/CIATkPWiq2q5HID/ank4f29Eu56E9p2sz0RFvg6yopMR7es8/AAEshCfy+YDj4rqJ55oBKmSF9bXnc7kLwBaZF8fynPIwk2OkAP/5it5vzf5+yvE/bO0wXfXWhMrdqn76azV6ipJINZF9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405905; c=relaxed/simple;
	bh=M1pna9P8kBRQcfW6d5Nv4IAZit0duE+b1rxpMyx5P8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUUC+SyFeZDFjCKXhsFvIYUwGxkNE/PR5llBmlkJ0x1gEb0CZpJdf/ZS9QtTQSnQOcpy2QbUeJQpJj6+pgizXexg5rJAbMPiZ6KP3kaKs/sxISpD31ScaUumUsVVcrBhGUXsvcC2aifm4QJ09UV1Vjl1t/b5wdlQOEi+WmhkKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngUFAb7v; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngUFAb7v"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1773662a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405903; x=1789010703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ocqW2AbRH/BUk9DjTZZYfR1XHut0Pc1pAr4ie873JH0=;
        b=ngUFAb7vAz/6crUADFwv+A8uOQo/TKkS7KyjFwc1/RqwYOmmpdx3vknNtOf7EdJf/A
         sWUjDG7lUUW/GMS7gUBwDgW1rAhrfh71P1CWmRR8uDuzj3bpgU8JatZXl4L/UBzpFIki
         LRCDdkvwK6suaTQiy23/zFWCRUdRrj6p7fUHHgG+LAJzCtf3/n6cpP2+UP/WVbU8XqTL
         uS/7yccOfMNx8ODojZ7UISF2wxX0nF4cyAVK8zNv7NTtosNY8mbW+9DNZKXnZskiQyem
         pIDvgJpRhXNB0uRPD2tB6JNzDUwyJVd0hNL8jxvb6oT5EDlKyrrieRfF9TqSR77FqEvV
         Bofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405903; x=1789010703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocqW2AbRH/BUk9DjTZZYfR1XHut0Pc1pAr4ie873JH0=;
        b=YHqwYPne0jYtS3I+vO9JafPJ6FCZB3H4HxZ9vJT+yYScJYJ6/Htzfuz00TZKLrblXO
         QMxi3V9RoJla1fkG+BC2JgTXnGtNv0RJJAi6YidQeJlSXYdOjqoZL4SgJSdyuy9syHoM
         CsWTk5EUq8PuRRWuXr55koJhRbY5iEqtOuJUEo+OMeBlRi+WQYP2Cfdi0DvOoMQxFUzs
         3HvK9C/DPBAgHiZJWLmUlcPKTkWyNKq+Wgp7gnV3n949+yX5Zd6FJx7rJL/IG9ZqlftH
         zf2GoTjU+behVaIlHSMZIJvdr/n285YO4LN65MQPpfIZH5Rwh8TpGiSc7E+RjxHvYt5x
         uw+Q==
X-Forwarded-Encrypted: i=1; AKwUvBximasHMygs1RAuwZz2+5hbmIKRS+SCc9bXVjLs7c38EIGQaEc/iXpLjbl7u+E2u1PVO+ugzlEq2wNAt3k=@vger.kernel.org
X-Gm-Message-State: AFuF++l+SBhCApwSE+sKKoszAFvJZR9TlaPgBkwtApj0N5frWhNIjG4y
	/OBYZKL7L28zVTG+R7jd5TUdeqjIrBUpkoAOeCHQ7Hs70+tvRiXuIoxu
X-Gm-Gg: AYBFou0/XsCqGLI4DWtcYgX9qPSblGB/FdmqVy42+ip7XKpaqWKvioR+cLuX9H9qUzp
	X3/lnR59xVa3eJLvOp7QZDx1yDUQaEiSO1Ml9gy+Vusw364zw11wfLe7pnFrg6Ti75PQV/PeNYD
	Z5yyahGag7Vlf6k6WJJClKcwKpF1aAun38nIsfTLWbUnlCyZi3xF4qZ2JQ8pcZerg/RUQga9+Lx
	MM4X8KTp3LUF/NXYifCDLGLAlHJFnjs4PY2OZVRPEs0PQluhuUzkVfhMn/IOj8dJ+DD4/Jz0s9Y
	MX3p54EdL0DBxCeFlNWyuTM+w2LjkCcOVf0IdNLrH3UWO3cbFUBuQHVbxXmREwaq2eVKA0QfuVa
	m9Z8WPNMO//FiJsg8aXcEEjl+I64ElKH5IJRBlMmsOBgX44EF3c38Q+iD8WBR6R3BcFIiTzlLCP
	X/1mkZkCAke5gbnWf8j21KQcHPgzMBKJ7+mKHuq/TUFzwTWoUav934/jeGagQJ0F/tYQmfuPU2n
	ygTcvY=
X-Received: by 2002:a17:90b:4a47:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-39aee080829mr13760803a91.12.1788405902939;
        Wed, 02 Sep 2026 20:25:02 -0700 (PDT)
Received: from kernel ([45.251.35.126])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332d6575f28sm76601eec.15.2026.09.02.20.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:25:02 -0700 (PDT)
Date: Thu, 3 Sep 2026 08:54:56 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Alex Williamson <alex@shazbot.org>
Cc: bhelgaas@google.com, skhan@linuxfoundation.org, jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: quirks: Fix out-of-bounds MMIO read in
 nvme_disable_and_flr()
Message-ID: <apjoiNcvvJLv2grA@kernel>
References: <20260817092448.4395-1-raizudeen.kerneldev@gmail.com>
 <20260902115117.34a30084@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902115117.34a30084@shazbot.org>

On Wed, Sep 02, 2026 at 11:51:17AM -0600, Alex Williamson wrote:
> On Mon, 17 Aug 2026 14:54:47 +0530
> Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:
> 
> > In nvme_disable_and_flr(), the PCI bar is mapped using
> > NVME_REG_CC + sizeof(cfg) which is (0x14 + 4 = 0x18 bytes)
> > 
> > However, the function later reads the controller status from
> > NVME_REG_CSTS - offset 0x1C, which is outside the mapped 0x18 byte
> > boundary and it can cause a page fault or kernel panic on architectures
> > that enforce strict MMIO boundaries.
> 
> What are those architectures?  The bug and fix look correct, but the
> risk seems overstated.  Thanks,
> 
> Alex
> 
Hi Alex,

Arm64, risc-v do panic on out-of-bounds mmio. But you are right that the
risk is overstated, since most standard servers return all ones instead
of crashing.

I will send a v2 shortly with a proper commit message focusing on the invalid
data.

Thanks,
Mohamad Raizudeen
> > Fix this by increasing the mapping size to include NVME_REG_CSTS.
> > 
> > Fixes: ffb0863426eb9 ("PCI: Disable Samsung SM961/PM961 NVMe before FLR")
> > Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> >  drivers/pci/quirks.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index b09f27f7846f..ed03892cc960 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -4090,7 +4090,7 @@ static int nvme_disable_and_flr(struct pci_dev *dev, bool probe)
> >  	if (probe)
> >  		return 0;
> >  
> > -	bar = pci_iomap(dev, 0, NVME_REG_CC + sizeof(cfg));
> > +	bar = pci_iomap(dev, 0, NVME_REG_CSTS + sizeof(cfg));
> >  	if (!bar)
> >  		return -ENOTTY;
> >  
> 
