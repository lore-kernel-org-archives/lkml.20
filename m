Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A623935CB6D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449537; cv=none; b=Z+YHoiod9puv5FzYTSFFSAOpTOj1CJ4XihtAYFj3BFJ8Hd3SHClXELHncWmJizOizIiVhO2JQG4LNNz3jGLk/y9RcHJN3Rt1MBsv6QRdkBMf3VgpkFmGDQ4ovoeVLP5egMUdlBcKihH+zduJqXNWLHfsUxpaWis4YcnEAkUU3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449537; c=relaxed/simple;
	bh=ExNl+FukFqy1rN7N2zPL9sZ0q1gZ5e7QZC7RycA/QTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1CUNN2QrEBZPQpM0Gitfnxrca1SN25KWbLnHByCWhrJD3f69+34639JjZ91W4eBsoyetvDS8CvFOsS4VvqLXAWRNeLRVNKlBAAl+KxzxgEy8xQoHBiECjISaKcbKaoPxuDHeImhDYfnX4U7fG1M+b/zLIJdAGIK4FV6yZ7utxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jzoa9xC6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jzoa9xC6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso3389011a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449535; x=1789054335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtKAnkMlbAEzfViPsH8OxGe1C1IurvV/p7tdYhcgQzI=;
        b=Jzoa9xC6/1ol7MsAg9sLkKu2j4n2spDJ398Wi6ae0+QTSIxuSWDpKLcdS1mmGbT5+g
         9uka4BdJNEaMITttnt3YaD45tG60/EoZS2N4EM7H1Cdr1mb4ES9aYz2vFhAWugEqYxsN
         ZywYhd4fDPPuuheVUFB8stTTUSgXXnrpKGS4n6j9TZlyiGgEZYtNb02C6891PZt/jsHl
         G+XD+pWGELL291kS/9ixTQ12idRO3/JbCuarPzlta+oBTfJLCw9s6Tspf1L+pm/CrPaG
         E6SGXtNqWjrYwD5iHBh8CBimKLO40+1I3EI821YTiXZaaoIv+GmcvORJ3pp2gfbZLgM7
         zckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449535; x=1789054335;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtKAnkMlbAEzfViPsH8OxGe1C1IurvV/p7tdYhcgQzI=;
        b=aGwNL5xmuYKhx1PfEbbK6p+TQf0NUa6hLxceT6mWxTK0vaXWI/HtTekiGk7XhTosrw
         yNkYahydb3XStXrVnV7PowDjs6JDOr8r8gyBBtBgcjLUAoia1LQJIHefjjQFlfifKL6q
         t9NiiNcM4MEhJOpRL22Flukbuh78CImyR/oGojJEoWsferqf7brLMvE5oAPQN4kf9F1C
         ho6URewNnu/SgIG7WsTKQjPeEREi0bb+Npk/opAkC9VvIzWiX4n3YNuY3NBsno9lJUBx
         5g8oTEB6pq4CRIYPyO3BUyxJjJW3pVJoFZ+I+qDcF7A+O/AtWa+ehvMsB886fzyKW0y/
         MMMQ==
X-Forwarded-Encrypted: i=1; AKwUvByP3VScZOFFVoHeOviLHr5X/weKFfvQfrLJ9JmAjtqQtqx0cdE9hsRaBrCP608Cu+J3YWjUVWRwWzyuCx0=@vger.kernel.org
X-Gm-Message-State: AFuF++mS6D1nzaA/mNJfP5jEDCYPti5zjazE/cllVaJVUCrhwF9SiUat
	umhpFS2C2O8Seih+D2Gk52bG7n4B4EGO4J1Z7aI9RgWSO/P6ZJcafHiELjNtV4Qn
X-Gm-Gg: AYBFou0yNe15OAfuRJn6wlFwveMULhMxEfZZ0EUXO97OOhWAnkUc0vsceOJ12BYQbtm
	cDUr3SEe6SDE7EGOmEVBbKlpdrR7wGIdQkAWTABjapab4yvUCcA3zc9DUkyGEVKP01kwlmHBjd6
	RYW+p7DAUbkUeR2OliXKB1s9WQu/PLTaAnD7PYdCCW+/al+jyDJ5FwtSzbaKl7xVF5bazllPIko
	O3rQ3RZbJ8opHbETjPl+tH2pcZ/pNS4t6n9L3MMDA3NAps8uDC346JZh7ftqAuNOzfAhUjkbPpL
	VTSQ9HHTSkH0gnMRp8A0LeK2f4MoaSMEy8lIHlm+b3w8zYJWvmQKJPTREM8o+zogyL/2IVWZrxt
	3d8g83PkD3/c8uj4NPKlRlp0rsRJLTwQYrS7XR5G89FpGNIjrxJdcB58k0spCZ5VLZqA9cpp47L
	L/zONUeTetZvawzcKSsekzgW/MzaVREibhZDK7fJhN+E4nXwp97Wc6+wf8pbNEP0jCjYlajBLMh
	ZfbJqdY1Ex6+Nt8Mw==
X-Received: by 2002:a17:90b:17c3:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39aee1d6bf3mr17931236a91.19.1788449534662;
        Thu, 03 Sep 2026 08:32:14 -0700 (PDT)
Received: from kernel ([45.251.35.126])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm355669c88.5.2026.09.03.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:32:14 -0700 (PDT)
Date: Thu, 3 Sep 2026 21:02:08 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: Alex Williamson <alex@shazbot.org>
Cc: bhelgaas@google.com, skhan@linuxfoundation.org, jkoolstra@xs4all.nl,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: quirks: Fix out-of-bounds MMIO read in
 nvme_disable_and_flr()
Message-ID: <apmS-K35HCY0usrZ@kernel>
References: <20260903040049.5460-1-raizudeen.kerneldev@gmail.com>
 <20260903083443.400dfdc9@shazbot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903083443.400dfdc9@shazbot.org>

On Thu, Sep 03, 2026 at 08:34:43AM -0600, Alex Williamson wrote:
> On Thu,  3 Sep 2026 09:30:49 +0530
> Mohamad Raizudeen <raizudeen.kerneldev@gmail.com> wrote:
> 
> > In nvme_disable_and_flr(), the PCI bar is mapped using
> > NVME_REG_CC + sizeof(cfg) which is (0x14 + 4 = 0x18 bytes)
> > 
> > However, the function later reads the controller status from
> > NVME_REG_CSTS - offset 0x1C, which is outside the mapped 0x18 byte
> > boundary. Reading past the mapped MMIO region is undefined behavior and
> > can return invalid data.
> 
> "Undefined behavior" still seems an overstatement.  The code violates
> the API contract, it should be fixed, but it's effectively harmless
> afaict.
>  
> > Fix this by increasing the mapping size to include NVME_REG_CSTS.
> > 
> > Fixes: ffb0863426eb9 ("PCI: Disable Samsung SM961/PM961 NVMe before
> > FLR") Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> > ---
> > Changes in v2:
> > - Changed the commit message to avoid overstating the risk as pointed
> >   out by Alex Williamson, to be more accurate about the actual
> > behavior.
> > 
> >  drivers/pci/quirks.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index b09f27f7846f..ed03892cc960 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -4090,7 +4090,7 @@ static int nvme_disable_and_flr(struct pci_dev
> > *dev, bool probe) if (probe)
> >  		return 0;
> >  
> > -	bar = pci_iomap(dev, 0, NVME_REG_CC + sizeof(cfg));
> > +	bar = pci_iomap(dev, 0, NVME_REG_CSTS + sizeof(cfg));
> >  	if (!bar)
> >  		return -ENOTTY;
> >  
> 
> The cfg variable is no longer related to the mapping size now, it
> happens to be the same size, but this should be sizeof(u32) to avoid
> confusion.  Thanks,
> 
> Alex

Hi Alex,

I will make that change and update the commit message for v3.

Thanks,
Mohamad Raizudeen
