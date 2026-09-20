Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D63FF8B6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905210; cv=none; b=UQ/ShuGDGnMPogpvmYGjkt8SdqHA4w/Mi07c0IX18Ji37DpMH/nQd8WBaMpOwQqWK+TYFgrfwzcYmTViUrqHc9rMoRv0Do/OnnM0xLKCLQDL2N0V+nAKQPOaNOWRrOJRZLtKA9CFe6SFD65LVXV3HlAeC3fAYnQ2/S9rBwNfDIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905210; c=relaxed/simple;
	bh=t5IfYxWQE+lOigxGvBYPwLvDK8q2BggQOWEImshy4wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FWRIuWMgW7siNgDra0k0bnengOtzir2lgmFZRn+XEOeCrfENA4+otfss/5oOcGaHoQ5MkMwCi0Sby6vJaX92iBBck49n1/0C3BuYPGVXamdGuQOLCmBG4fkstROmQA2t4XW5E/hSYyqjt9POsUnHtit7FbyilLMfCuXA1cQc3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r09MP271; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r09MP271"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso17763035e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789905204; x=1790510004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XF6M9PU3tXoXpfmNDf1afoDG2Svbnyp8JQoGluRlA/8=;
        b=r09MP271dSn2CJ+KFsn/w6Cqs/isF8/xrfGoP89dUqjtSF5oJOREwcMO3C7uvKQZZz
         Po2Sq3MC311cp6PK+fmXeJbPzZv9YvRlj8x88oJg7VarnnvPv3QrYrbLk+egFoZkMIzW
         h77GLltJ90XBxBxi2k6/eWN/cTy8fz1+BfnHWhej1rHiEN9cf8NyCCj1qBOlfteClx8D
         pNsTBBSW6Kp1sAOFyn3CvhaZJmwX1sm5T4YMyC8ikzhNB1SfaVSiBOGqU8xbqvOswJbc
         qAac+NJQsIclrgQ8Dz3ZnmS5yp9CgbFDYCsioUWGZODdLlc9wbI11/kJgUHi+YwpY8xf
         VdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789905204; x=1790510004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XF6M9PU3tXoXpfmNDf1afoDG2Svbnyp8JQoGluRlA/8=;
        b=tO6RLSSm39qTEvMAB06vXWRBB8GKwdB3CW99VrMJBFFeO6zVfXohNDHx5fDzHSddd5
         YgHSc2UvXkeijR5gniIXn3vxNraITw7oHBoEUMo8QYawpcaVof3N86I6yZ51NGKId3eS
         lDYjHC+ovSVIIQyNp6/NDvX+oO1K+8HOZrMq/LVfJHkcVSIeQbTIUguz/5u6TlJgLh8s
         q9aJPsuVsy7OZKxHuWtLv39mtKTIQL9Eklk6LnDfNeBcB+wdem/Vm05ajib1yRcYmC/u
         YQ67QKLnqFrLdIonmvLC76nuXKL94EmpmP7+0wyUVXJ7NdtQlF9BpUcPrgVyLeCFt6Rq
         h8PA==
X-Forwarded-Encrypted: i=1; AKwUvBzVHsBaF75oNVs5wMtIGTGvEYT8W5z12XMZKV1bWh8tCvpQSYK3O3rlCeOm/Fa8EZWXyb4nM9beRi6Qd8s=@vger.kernel.org
X-Gm-Message-State: AFuF++ngK/oPs+YKR4EuAsgGaE+NiOKAwDnZHisfCdoXDkeNptxDnGcG
	xFwgSzt1Jp2VF/PLWCI3+lBFXrnLFP2uGABjk0VpfN1BOOf7sG28EuYpmDO/KLXy
X-Gm-Gg: AYBFou00yFKAX/uUb29tQavT0GADCiWd24bTp8h+z2V4/m1gMnECKMGOil+TZu66Y5S
	kW45OMY9Qsa8LvfKzWuPbIHd0w1jgRp4bAuChycUZyLesGhbNX4XT5B/BVUi7QOsP19B/JmbPVO
	kmnFO/sh17rYpXTIeP2pqIcZnA/EeeKlxliQZL5zg77wsuGpaazNGMzY+KjGB5Hkgpuf57oDHLW
	NijfPZggPBTh1R3rmklkohZCVm/oMNOamnGR31d43GMXAjOwXrOS4WduMxJwoK+6A+1K2BuGPEs
	K2kA1dVZn5xQr/I3P00P+qxIrXipRMjcD3ET8Ngi+lIS7+yh8L9/cQZq/F+emBhong+N7Bo/XBq
	T+S/7oFjgANR3agpGD4oVySnElDQ6X6xi4Vtj7P3ndLo7cO82CtAGYr4fePH02jjW+aJWKqRPF0
	26f0sU/YSVM5eoMisk2geTw49CWmfGa91+1A6z9Ebwvg31IkzN742Dkdy6IGN8M/TH7Xi68u0Q
X-Received: by 2002:a05:600d:1a:b0:49e:6778:c2bd with SMTP id 5b1f17b1804b1-49fc5a10c99mr92167765e9.6.1789905203734;
        Sun, 20 Sep 2026 04:53:23 -0700 (PDT)
Received: from gmail.com ([51.154.249.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm175056685e9.2.2026.09.20.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:53:23 -0700 (PDT)
Date: Sun, 20 Sep 2026 11:53:21 +0000
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Jens Taprogge <jens.taprogge@taprogge.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	industrypack-devel@lists.sourceforge.net
Subject: Re: [PATCH] ipack: fix typo "informations" in comment
Message-ID: <aq_JMTLGtANCLkk8@gmail.com>
References: <20260904120954.21119-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904120954.21119-1-hemanth.selam@gmail.com>

On Fri, Sep 04, 2026 at 05:39:53PM +0530, Hemanth Selam wrote:
> Correct "informations" to "information", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/ipack/carriers/tpci200.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ipack/carriers/tpci200.h b/drivers/ipack/carriers/tpci200.h
> index a2bf3125794b..d0c13b8b7f8e 100644
> --- a/drivers/ipack/carriers/tpci200.h
> +++ b/drivers/ipack/carriers/tpci200.h
> @@ -136,7 +136,7 @@ struct tpci200_slot {
>  };
>  
>  /**
> - * struct tpci200_infos - informations specific of the TPCI200 tpci200.
> + * struct tpci200_infos - information specific of the TPCI200 tpci200.
>   * @pci_dev		PCI device
>   * @interface_regs	Pointer to IP interface space (Bar 2)
>   * @ioidint_space	Pointer to IP ID, IO and INT space (Bar 3)
> -- 
> 2.48.1
> 

Hello Hemanth,

Thanks for your patch!

Acked-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Hey Greg, could you please add this patch to your misc tree?

Thanks,
Vaibhav Gupta
