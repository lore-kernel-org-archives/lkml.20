Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D44854E8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781088; cv=none; b=EBErQWmKYDhb5PKELGA9SBwj+ch9LPRmuPTcypIeOB3h4Umfjp15kcZukvbkz5fqO3UwLNtXw6BL4AnhBkBzUyjlLN9qWcHUDcFwtyZ2KkYmxnYbCIFlZODzB7bTBRfwzSrcuORnMJHYlYOXNnzXwZ3nb81leLJhqoBtDLwDzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781088; c=relaxed/simple;
	bh=pSUUy68iEUMbccMv5CvszWOHJ0OfsO9hJWlxHfSfEyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hg5/aKtKPLiB7UDn9da6et6LMjRw9sne02t1MNNqKjXtgEm0MKxykahb0+MqZS0IUA3Ah2fvV8+185HyCJMguoEUfXg6Q1oPAT0ylsy4goyQQkLz+Oh1BRUjkO3NMhYSHAaEBjsU484PUUzZPzYEyGQUCOvzxtohrMYD9VUF3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BiWorANS; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BiWorANS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d91ff7d9acso28852235ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781086; x=1789385886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2k3YSo3vpVW3e75vhErB5oixVDeaXIpJznt6jU4MH/I=;
        b=BiWorANSNXRI5UDaQVdLltsEYeMcits//+pAOdbwpJAF02UOpaARiNtTrOW2FTiuQW
         cQFolsRuoWMVW3fNAmfuCfkLpEalkkMq8yQumeoHwc8kHzVVXWTN5WrYfee/Dsp6PRlc
         /KZGkMzwp6QmqALO37txsLbkGPUBn5AYih5oKuW3GQTz6FSWeweYK8Qra3LdvNsQ4+a8
         A+yvVuiMnEQY6MioxmTMjHOk18Skayu/R5ftuF2nKjs7C8wNdjvZw2fxizfqzC8DYqr1
         i8GJnrfr4c0vI2iSI4TsIAWe9fL1KdvW40JGDj+qohgoju1z9uKuumvGxKxYAmcD87qA
         7row==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781086; x=1789385886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2k3YSo3vpVW3e75vhErB5oixVDeaXIpJznt6jU4MH/I=;
        b=M3Vo07R/kCXVNW7x7obRtCQMptq/k4O5LFd1gZ+2dDCs9gbi7SSdr15AqK3CIn8+3P
         d/kF5kizpiXb+4onTG3wBSxVLRMUXFz5oWD2LrvHI26i+gULVMQXRh0idHtDD3+W4nVx
         2ISbDuxySBxnuzdQZfJ0cZwC3YfW+GMXmp9V3ubni2Za/TA4LcxsngwEM9y7eETRVMUC
         DXBcuMaXDE84RXCchP5HSUzo01AS+TX443HS9ATB+osHl4IUoLRUgG1Vh+O0lPyrVI9f
         taFmmZqnDfPcvtyO0obbU5lRA66PO7jF60zyOs0QJSZwWWEz+nJO9IIYb+xycc7Yqre7
         mepw==
X-Forwarded-Encrypted: i=1; AKwUvBxYi2sWhPY/O+u1gyG2tXA4aCmqGmyBlj7/CWjIyf7o7C0LHG/UELb+ZasJN/fmoZImLMek9ZW9HllWTq0=@vger.kernel.org
X-Gm-Message-State: AFuF++kbUm5UZVbSPtlFCBNXNcdtO9nb40ytlnYlml/c8FxN77jzkpOk
	na5JbZpeRqn8d9JFcxofHIJjgcq3nITdqaAzBbB9emWvZzySfS8SR19T
X-Gm-Gg: AYBFou3AsTFZBL/uVz8DS/gQcsW6We7qozB9cdVFOP/roBBXiH9gqeFj4gI2AbrEFUv
	wEgZUlmzpbSv58wD0Pn2lTmI5T3nbvnRcTETfn5fJHrXVrhc+HbhK09TaGCvIqZ+tSHg3161tn7
	hDDWmoZmTr0SfLADQHtSuheFej8nrNdEcO1jV+R1HI1BWLJguTSMgEfWJ73ThAkK81XpJYc3/p9
	oBOUFO4hPXfDaGSXEULtd+M1nKrTguBZAwPKXK54bmx3LwW9LfIZ1LXMF/XWNBY2BRs1fGRhYVN
	N9AwvAM/eHognojZUbcAWcVvNBXoSr7oIHVYGZVG8riGo0psTWWqRl0okZzp4R09mw7YxhnZVFL
	E6JYs9yBQKW1iONILeeGLJve1oWt20MH2b66KSRXw6kLTq42nO0UsCkbKOvqDI5bRakq/SqPbDK
	yqTZt8lLvJj2wOaoIIVNXY4pDfsKrEc3GP3LfMWkaVYIIH54rdAicN12Ukhfs=
X-Received: by 2002:a17:902:7004:b0:2d8:d4d3:3fbc with SMTP id d9443c01a7336-2db12629346mr237775995ad.16.1788781085615;
        Mon, 07 Sep 2026 04:38:05 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149ca4eesm44727255ad.66.2026.09.07.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:38:05 -0700 (PDT)
Date: Mon, 7 Sep 2026 19:37:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] phy: core: Add phy bulk data helper functions
Message-ID: <ap6hHV49iWexJlWp@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-4-inochiama@gmail.com>
 <20260907105611.uvhdywq2pwikfz3y@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907105611.uvhdywq2pwikfz3y@skbuf>

On Mon, Sep 07, 2026 at 01:56:11PM +0300, Vladimir Oltean wrote:
> On Fri, Sep 04, 2026 at 04:37:07PM +0800, Inochi Amaoto wrote:
> > diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> > index ea47975e288a..13f9f030122f 100644
> > --- a/include/linux/phy/phy.h
> > +++ b/include/linux/phy/phy.h
> > @@ -81,6 +81,17 @@ union phy_configure_opts {
> >  	struct phy_configure_opts_hdmi		hdmi;
> >  };
> >  
> > +/**
> > + * struct phy_bulk_data - Data used for bulk phy operations.
> > + *
> > + * @id: phy consumer ID
> > + * @phy: struct phy * to store the associated phy
> > + */
> > +struct phy_bulk_data {
> > +	const char	*id;
> > +	struct phy	*phy;
> 
> It's not clear from your design intention if struct phy_bulk_data :: phy
> is permitted to be accessed individually by consumers. Personally I see
> no reason to. In that case, can you explicitly mark "struct phy *phy" as
> "/* private: Internal use */" (like struct regulator_bulk_data does,
> albeit for "ret"), or simply say in the kernel-doc description that it
> is managed internally by the PHY framework (as is done for both struct
> regulator_bulk_data and for struct icc_bulk_data :: path)?
> 
> This should help at least LLM review flag abusive users.
> 
> > +};

Yes, in my design it does not allow and I have no reason for this too. 
Because the bulk data helpers are for ones that does not care a specific
phy. So this is fine for me. Thanks for the thing I have missed.

Regards
Inochi
