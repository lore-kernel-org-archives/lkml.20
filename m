Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7131AF2D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604763; cv=none; b=eqmEr/8pax+XDixB0L1MaoLDlw+ZrMFfGgeACXQ7aGt/40RbnMZAzg01C0md0832HN+vmlloeamcp1gom4jsU8+lpF/rWi4JwZEfUoq/CFopGzOdjHsg1RIUkNRUb9udnfrcAeXpqfQqrGyvvr4izBB80/AtImhaVW4BA75W5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604763; c=relaxed/simple;
	bh=5b/u82wL27/Fu9PH2a97FNdOABh4pOizTMteEoxSlJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJELVTGeu1KDkJmRmugmSic4uFeMPjd2iGd32fDjPI8irignNSokJKMizkV26f7+WOuxmoClOKodLs30rA6DK7bPg6YiXCCMaZwbybSFQFFvHD358/22TNf2NU0IdtLNk4/r6L8hPcHPIUVZokfcPc/x45RRWSxPGZyFN0MWdBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7IQBgPL; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7IQBgPL"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c6so225416b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604762; x=1790209562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vV88gSyI1c3ZYT2h6e0lSF5RM8fB6PlCcIwJXe36LlM=;
        b=j7IQBgPLjn9sH0nV2YvmCk6T2O2+TXlNsEyPEGYiRAwXEDeUO4+RwOQLwZnua0Bgk+
         oO4B1NnOarcDEGX5DywGc7yhbfC/15WtUOrEIvt8iGp9pJq7p4RXMITE0onw3QS3zoo0
         8X+xPaA/cKJk5OVZX6Z/SzS2J+mUMUHI93b70jbiMsbuzSCVDrzy3hrVbceTBaJfVO4C
         rsWKGiYiJUl6oLibqw8Mbbe5Xg/9beBxjp3Np5KHkItCZ9C36gKe86M2GPkMPwvgPbOM
         BX3uJIShx5bfXFvg6XLIbO2Wh2HxmU+8KDrDZLIX8i/6/RM1VRYs+j68uuIN97ZJHkJA
         tncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604762; x=1790209562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV88gSyI1c3ZYT2h6e0lSF5RM8fB6PlCcIwJXe36LlM=;
        b=sQ7NHNwmFApaOutuuc5Iu80RvjfSjbLh2D72ogApXs5E9alGjIf5f9LuA6jZquTogA
         3saqvHO+d/Cw5T50A1T3gMqC9N4oROgaKcdKvnFPdVL0ecLkA3IACnPRGSNHb2vSTDIw
         j+p/EnkTbx+23QIertekNnP+QxAY3Jk8ZSufoZOtKE87lZFV+6aY7XXJmqcqwQKjAmnj
         Lpz+teFrqd9Gkg/KQUwUG39XL3CRI/r29aVReFb2+Fr4CHnRlAKViKZc72gYQxWvthuH
         khp0+rFuFAG7CcZVvKue/7RrYsv5XbwfPhiaFhzEuTkhINd3YrFGRfMt5C868VZcRb2C
         vGsQ==
X-Gm-Message-State: AFuF++lw19a9GP+I7FE/7oKnp0iOqqa3FGbGQW4Jt7GnNJGE+45FUN7z
	//RMSSg5Aazn08Es+3zSqpvQLUnQIs8aeX1laoGtpma2C7ek5/+z9G+M
X-Gm-Gg: AYBFou1+p5b+i/o7L53nk03r53GeF2yDWGK77Wf23bkxc5GXbOOQxOcavyk/eN1mDcc
	UiN39S55K2fQ9683cTgyMBX6bUPTuj/wnT23sNTFgsMhd54KDHUGf3BF1CVIpQbFU87L6/eBobD
	H5TacSimVsG4iY8dNcsqHi7QSPZbDySOul3GnD+RMcregpI03rhLtHB1U38u5jTMrlU3jwe2XfV
	URGDzuc7buffzhZLV+sWdLacILSRTatU8MgqXbjRWUH0cFs1pXYMpt9X/gBQtve4GOPkVuA7b09
	nKlmN/a1AnGAkqkM/YHV6Ct1OI9iZpDc8Ui4xPWLAASb8bo9Mvz7HlectgMkrc5pPdOy+Cu29K6
	Up6Ie1wJY/UCnwh/q3IzGORofLWmXpp/udVmxpY0/K/3xOMCFXP892BeC7o79PwsCT0+rB60c/+
	ZvqGyMh+GBm5LutUdINb736VsPfkSLx/0cFI3CkTXxeqalg79UPzzqetKv1B88ieRUbRE3nqTBH
	6u5ZDSyLCkG
X-Received: by 2002:a05:6a00:440a:b0:870:c2db:da40 with SMTP id d2e1a72fcca58-87239a9dce3mr9776123b3a.24.1789604761569;
        Wed, 16 Sep 2026 17:26:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872025dd04csm1926956b3a.60.2026.09.16.17.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:26:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:26:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	mikew@google.com, priyankag@google.com, wim@linux-watchdog.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: sp5100_tco: Fix pci_dev reference leak in
 sp5100_tco_init()
Message-ID: <8df16733-9a20-45eb-89b5-c396244f0062@roeck-us.net>
References: <20260916170511.2086199-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916170511.2086199-1-vulab@iscas.ac.cn>

On Wed, Sep 16, 2026 at 05:05:11PM +0000, Wentao Liang wrote:
> sp5100_tco_init() stores the PCI device matched by for_each_pci_dev()
> in the global sp5100_tco_pci and keeps its reference for the lifetime
> of the driver, but neither sp5100_tco_exit() nor the error paths of
> sp5100_tco_init() call pci_dev_put(), leaking the reference on driver
> registration failure and on every module load/unload cycle.
> 
> Drop the reference when the platform driver or device registration
> fails and when the module is unloaded.
> 
> Fixes: 15e28bf13008 ("watchdog: Add support for sp5100 chipset TCO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied.

Thanks,
Guenter
