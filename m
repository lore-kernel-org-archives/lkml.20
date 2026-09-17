Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F860286D60
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604921; cv=none; b=kvrYTYeeHad/cxhMErEtOwzm4I2WwNqDlnVGThR70tbORMTskay3RB+KpgNCRPIBxVKeU+Z1paQBQ/3T1mxC2hlrhk1jw/BES3XFFkXa9eyXhQX5ZmWCXs/jVAZA0al8X7JYFWfWd1ES5ScwXta/sUxFIENkOKulHHP2KhsoiJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604921; c=relaxed/simple;
	bh=3pMdVJHKYz5J9ib8uBjE7OWKJkAOczbrxH0zKsT+P38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzypSFn9hz19MP8AS3Yzy71ui3EAUIZ21mULNuXVJtj0wyofE/4FFPYbpjIr7blG2ZaI1CNgcoJtzq9AXzGKHTFIkiPwHLEnG5LvFci3ztFMcz9+cR1RO1lj42/eJ6TtNUDPs5KX8tu/ygtGMbp4+pADfLrM1CFoUXhK9kTXNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0aqRPDF; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0aqRPDF"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so227264a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604920; x=1790209720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=70Ad2tuJAd7+0temZQeAvFdIzO9M6V246nOBkiiOttI=;
        b=T0aqRPDFHM73phRyWmpWm/qSTyQE7xli5yvabxvhtxNi+rSyNvi9BUUGZrnb0hzwyR
         fe+VOZGt21bRh1j4W/Ux9Epr/lnr/0N1geY/hmzMOx1pFVekC/CvjT75TcV3KI2iXjaQ
         WfeELZEf0IqhkEjTbeOAZfhsYj9frzpxNDnb6AgLlJLRjxL8+EOkGbBML975z7BrRnN4
         PfWeGT9TPTJMjkc8Voqq96T7w0fRa34K0+fNLVcKad8UA7RTD+HsLIl9t0AbROxujxyS
         +VXqK0BeMF3J2DBlzlNtFpQeDakqkk7HXZHOZqTdT/t92y6NaC+u/n8p0VbPo02yLwZY
         Xlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604920; x=1790209720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70Ad2tuJAd7+0temZQeAvFdIzO9M6V246nOBkiiOttI=;
        b=Ozzw1lANnpuPeZldL/aJFfTj5hG9Qa6Z4KETWBXIYO48iKu6FZGgxbzpCWnWz64X1v
         3aUDiEfYWd130uCn34gs+z6bMRPzVg5ty0Eq+7cfhGGoLJ0ZBDGL/yl0dbMJX0WzkNBx
         I1UP9hRaS1LRJF42p80BHJJ7M/jsOwl5JmPBA1wrwhdlByJtmUoCWaZZ3e9uyekr+828
         SVnGu/Bq3H0dfDiaihrNPzmd6xtkNrKzSCaiLj8H543YK19z9BxUuGfOGAYUa6RbkF8c
         z+tkmpBoyeQdhRzU7wpRITuVlv+9UbjbkihmSFzuxbpjvZIA0f0eaom+m3ulQ5Aw/W3/
         1M0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkTVoEHKRShCCM1tM3RwRg4F+fS3iNZ2ksRw0g7VCqS+MMU8CcKEXRCOz2uZoNTw6g9qNKWGQ4uYrB8pg=@vger.kernel.org
X-Gm-Message-State: AFuF++lx6xiot22WUcoxY3bOkN0eHipuNzDVM7RbQnGFQkqct7T0n1Q0
	ffAKH4jeOqACBgBIhi94l+4Eu8ogPD9smMitjKc2k87q8fbiCTS5Blqz
X-Gm-Gg: AYBFou31K9xgTbZsg2eoCZhYONmPLKR+F52kmBgyF8eEtUaLN34xNT221qrc+Gv5Ipx
	nsD4LhitcSi0ZEnwORGMZIuKEbML9XsZilDFUVfSbGmcHrG7BoF8B6q/uP7boN92h/HO6q8Oik4
	qscfouqHVckQgCUMkyC3Zv1IOQ2kyqwF0+b8FGZCzoCDgwPLrzYfPSgSXBhjAZap3/Ea2dTt18Z
	MaWE1ciaE+00FGEyDY5Pim4aXsPWjxoAyUCjK7o33nO4/H1NIQorLz3rqN5CkRIiEV2v176CTsf
	b/O7LGpbkVVU8T5Hpg/yDm3YgCFX3Uhv39RqOwGuXUdjZDfm/RD3zZX74OM/MbJ7HOW0zU0GqSa
	F1cbOnbbSYIIe80p0H2gj/RC+NVZa4etlspaoJWFI4HHZ3uOzBK7ILefpCdwoxPgN4oDhLWKjaE
	CL4gAuCzkMq4EV8NvX0WrOKWEo75hqVnLI3H3Fd1rULPp1xgK5CyQl4dbLK7Hvnbg0QsXS+0Yr8
	K8mfQLcTZRR
X-Received: by 2002:a17:90b:390e:b0:39e:8d5:fcee with SMTP id 98e67ed59e1d1-39e1e4d750emr11947446a91.17.1789604919683;
        Wed, 16 Sep 2026 17:28:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360a6c8asm1946241a91.13.2026.09.16.17.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:28:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:28:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Baruch Siach <baruch@tkos.co.il>, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: rzv2h: Avoid division by zero
Message-ID: <7915afcc-4740-4315-a53f-36becef281d5@roeck-us.net>
References: <20260913064851.8239-1-tzungbi@kernel.org>
 <20260913064851.8239-4-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913064851.8239-4-tzungbi@kernel.org>

On Sun, Sep 13, 2026 at 02:48:51PM +0800, Tzung-Bi Shih wrote:
> clk_get_rate() could return 0.  Avoid a division by zero panic.
> 
> Fixes: f6febd0a30b6 ("watchdog: Add Watchdog Timer driver for RZ/V2H(P)")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter
