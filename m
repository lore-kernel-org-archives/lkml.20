Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376203C062D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990732; cv=none; b=QJDu1/QW3gUiygHOAT78IliI3Z48igLN7Tfnl0D4P1T772eG9Tux8aMQSkeEeRIK+uWUmo8llvf8wCZLq65XUf//IWe2Nope8zqxQUohFAIYXYYUipg1BIzmIBzSoSpFh7gdjMAUGkSEsYfy618hNeNKADPis/6dg3yG9/b2nG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990732; c=relaxed/simple;
	bh=qQbPsCR7zQtDIHPUVuibU2H+q8UKY7xlBbVL4dX7Wy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkiEXSLK6JtYf+rJGwABaAdzFSG6jDguCidaMTAKZzchze8BU3kdB1cxzCvpUvAQ6/Fix2e1S+v19wNKvmXAb+s0Y6QI1lJoUj48p3FQaupElmYHqaiFhK/yiSbLj2QS/aqi0LWNDo067CF5oQB+IVX3bxYyFn/JF0oaI2lVb/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tkSZ3yG0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tkSZ3yG0"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2dd020a2e44so10874955ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788990723; x=1789595523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCamGyjjkDxfDn1PqRtYYcfreXW3ECF8AiZuRQhHSQo=;
        b=tkSZ3yG03OeuR6jJKSDNfi1a4ayqiLdL2cRKDuMckJQhM/Qr0UtsnMfOvSiAnnSDen
         LGkgnIskP9l65sUNndGW5pi3sy+7n5xq3WXCzGuewYLoU9BGqdbCZq0CCZSLsGrxgpCj
         UNaItggDMNiUTFqpWKkDe+n6RXDvk6lGjpq7Ef1OEScrIa91/VVun9SuYaOIoEt8qYCB
         rRGK6D+vsasCbw8wcU9Yjhr81TjzJpC1Ze2MqJKQsrKCzKMx0xS96vyosDvBlYuP4XMs
         VMGowAZ9jYAqnElWIUKJ2L/AvFRgWs+v3FuMHQVs6RLfQ+JvkZLEI3FR5BRHMPovfeS6
         jmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788990723; x=1789595523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCamGyjjkDxfDn1PqRtYYcfreXW3ECF8AiZuRQhHSQo=;
        b=TVJ+ja0rvW0XKxeKyUDLVH9INwY+wt/NslthJtPOp5OzG7Y4ZujdgVG+e5tSIO8QSr
         zaL2uYOqx1fHPK885ZSi67lYTxfT/b+5wEgSAoCsMeMeNA6kTPuIP9+Gil4tkocoDgVt
         TgmifMZVR/7HxMxox8erD8/hDhU025gLAi7YpcbluHF9b4/G3WpQjP6A9PPf3sc6MKab
         FteR3+4hWEWq1uKKu7/zUMU9VwpBjWPEmDO0YfwvqdKKRRiZ041pJFW1zeSH7G0h1IdI
         DoiclEGU6rBXx/o+0sv7xNfOaT2fimhvwOivwVFDydMyao5JGIrtDPZKaHOmMIfsa/Qu
         9aUA==
X-Forwarded-Encrypted: i=1; AKwUvBx7XweR+gpiRSlAWWSzxtRQRvNv8IldzI29ZHvY0nOrK2F7M/6Dt67KlF30pk3MKqVassfXv7LMPtaY2js=@vger.kernel.org
X-Gm-Message-State: AFuF++klWTCtwQg8qKWz7buow2WIIeiqx7esINDr7CFf9gNNPKsgnS1p
	lXAXSbanW8ZoJ2nDe6P3W83Y1pe+cXY/7o25p5dOentCnX3ahBncci+FfkEe3TJbJNhEluNRAbI
	I0gxxKQ==
X-Gm-Gg: AYBFou1T0mxEHeuozELvvvWm4lMm7jr31yX6hgZ8r2PxkHfH8znjJ/ZlpsNLXBgJj2N
	s0Z1sq201/hTJUy93PBMAerTkCDXf2FaE3AjTXLhIcEhNcEGudwMp9OZiAY2Kgkt3HF7ZhMEYRX
	nCqMC5G8vRgI2ojFkURjxDs13pgSc1xDHkRaY92JJ9jsFPDiU/QQMsJfvh49B4x2r62slfVIe4x
	krp0DN3U9XjP6mkxW08kRurjGdk/DGdWY/ZvCMa77UvxV5H2/rPlzJydXhST1UkkIR1ZfqdYx+f
	iFDvV88mdfaFP9j5xUyKfZsurD1T85dEWRvvnoKS+u+DuPCJxVBKJ+uDL4Cxw7L3tjaUNGVDjHP
	zkzJWqKDpxbcDL5qHmpHLo9gWD7K/MibRb70iImNRiVjm20QBt42Go+Oh32t9hdCG3r8NWrW5tt
	ixHmdbTKQweRako613ywbyzMNLdSCtsuiaEdHVGfw1UOOBYS8wpVPBES1pj/fA5YjLxRBgMnf2l
	JKcki86V0si7H9MyzVnM7SZLR+aOH7VIf5YpJ/r
X-Received: by 2002:a17:902:da4d:b0:2dd:8e5:28d with SMTP id d9443c01a7336-2dd08e5053bmr43507235ad.8.1788990722587;
        Wed, 09 Sep 2026 14:52:02 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dcffa9827dsm15047155ad.66.2026.09.09.14.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:52:01 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:51:58 +0000
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm <kvm@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH 4/4] selftests/vfio: Extend timeout for runner executions
Message-ID: <aqHU_nqICBENMI7B@google.com>
References: <20260901215358.2421359-1-alex.williamson@nvidia.com>
 <20260901215358.2421359-5-alex.williamson@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901215358.2421359-5-alex.williamson@nvidia.com>

On 2026-09-01 03:53 PM, Alex Williamson wrote:
> When executed via the runner, ie. run_kselftest.sh, tests are subject
> to a default 45s timeout.  None of the igb, ioatdma, or nv_falcon
> drivers can run the vfio_pci_driver_test within this window.
> 
> The igb driver is the worst due to the device getting wedged from bad
> DMAs in mix_and_match and requiring the full transaction pending
> delay prior to FLR.
> 
> This is even further exacerbated when the system implements
> firmware-first error handling and the transaction pending scheduled
> delays are preempted beyond expectations by SMIs.
> 
> Worst case observed runtime for the whole vfio_pci_driver_test on
> such a setup is 450s.  Round up to 600s.
> 
> Assisted-by: GPT-5.5
> Signed-off-by: Alex Williamson <alex.williamson@nvidia.com>

Reviewed-by: David Matlack <dmatlack@google.com>
