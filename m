Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE69F4E3235
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723614; cv=none; b=HUxXsOUq5W9NDO0ErpS1Fmg5otifOa9mLU/5ZIIe5gcNRbMGVo1VmVYlrduFYab8PTJiGauDM6QLqCiG2uhxRVf0yuItGqEGAH2sMpkONVg5w4zoQdU2TVtrS+rfksDgqk1q43OrdAC9X0jlQ5FcJ1wwMITyB7T3DucVzYjhDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723614; c=relaxed/simple;
	bh=XIEY32W/6MFskFcdYDmnQYcCJnPcJ5eAtl20vIeGctA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X76LTW4Fxb0EJVy6/L9NBa7+cWrcX5JUfhE+JraV8VyJ+gT2NPBID1tMTFYM6JPaKT+s1GyzzZaiWPToeYyK0w0S0C5tyUxCzjKcGCKso3TjMa7Fd9fO3NpqH23ck9Pr9hTJZ04sSU9JLzBZblAWO9dseDKztbegI3Nh4awIeZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=SQpH1NPY; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="SQpH1NPY"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2233533a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790723612; x=1791328412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iu2FY06cIBJ7op43/g8hAlSSeLFMSuwtqMFeIARMq1U=;
        b=SQpH1NPY96fV9pPARaHYxSDrLWtuDAlYYQmDR6A5+ZOwU81NlkaD2C0qNsAXAFtMJR
         RJ+KoV39agJRP3wHJDawjS++sCg+AQtKewV3RmBFMJrMK7UoI6tEH6sJsiBMO/dw/L9v
         Lc+cSlFgW+Gq3Nxhm8dwYRdcco8OCkmolbuPF4sFoy3EfRaaZDPkO3iJEJ5HTT1DrRQZ
         iGplC1y9puO2cNY4k3/Xyn0vGAa1OSXsW4ulcuJnE8ReBs+EhmI6iKOoj/z50xJA1E6x
         9br6/aOBtU7hWDc6XEItEfrHKrp7vPGJFoysfwyC8KhNkU/T6P62V3RtNGniGIupQKSH
         vH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790723612; x=1791328412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iu2FY06cIBJ7op43/g8hAlSSeLFMSuwtqMFeIARMq1U=;
        b=wPZeZqHiXQwTrcEOKI96jubrbGV0mOZxes+eZO9n5rs1VHVS0eFlDgpgmJcsAHzCGP
         xbTCMpbN2xks6fWjOxDAPauQNkrqqWBHSkAOSb+OTx4DqAos9ODpFo2BAzc146+h//RM
         Qa4T6WfY2watHrttwi8N+3l4hemM6wTfrw9j9bFFCixcFwGUMzC5iMDU1lntjLYQjLHR
         lnc4jO9OwrRn6y3iGvPxNRLFOt8eAF2/TYXr4bdoJBVSRg2iISU8bFUeuvTY2ct072QZ
         HyY7kqOoMTfTBdU+ZPZMn/PT4Aj0iT2rc8isr81rDR1Lx5DmFPbKO3WFV1arj7rFsONe
         UbvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCM+yJK5ITDsqNT47KFGNHZEn2hURAjo3G1YkRyngYTMTSN1qxP8l8VBVEpTKhu7N8hg4rFLWPHzfcUPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmIPGhIttc7IceoyV32+7I8DkV3eyG2co0KOkJ3QL9ULw1UCak
	oPgSTM+mt4o9tWgvRQPE2e/7fSDYjkGKj1XV+S+u482zKp9ltmhRkq4XeyHnnWKd5GA=
X-Gm-Gg: AYBFou2PEZEFrpAKrj376k4ikZ9uzDXz9K9LGScpOiBagPFj7py8hALI/W9CGIEEw0p
	JPC+8ML/sKGW+0Ul7esOH8INruafCZeLeaKbsBbmdf/VegZOe+j2RqZ3HQbPO8o8mddYiHITdyl
	CxEK8x9aIDwqo5+yd1msoUC6QFhecZDncQQw4/hEp+BrIZ8Wa08AyZSOF6a0SndPyd1gjV+KKO8
	q8tBjgDO85CBBuSuXxgN9Hm5akrm0q+pQasmUgxGznlYUp5EqpTDMpxGPeBtpmqsSNh3WDrnm8e
	VdSbrLX/ha30cKHCKub0rJ04WRYvyqB5pRWDNggFe/St2nX7l79iUYy1l91nLJyDEeAaGIiuSJj
	1qAnLVWZiVuEbp3jxkgEw1/zyBL4XhBzqhnhynXztTVeFiAVvK7oMA0I8N8H51nrnThw5ZDrjKO
	0hHexy7IiYABtE+IUs4XgvwbVA1YK7MlWUyoKogKaImWimLHZUMUNGEV5VDF4/vG/y548rPq4RG
	GG1wGCbc//D
X-Received: by 2002:a17:90b:6cd:b0:3a4:a3e8:22ff with SMTP id 98e67ed59e1d1-3a4bfd9ec43mr734665a91.19.1790723604565;
        Tue, 29 Sep 2026 16:13:24 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca3f3d67sm152927a91.8.2026.09.29.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 16:13:23 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:13:23 -0700
From: Joe Damato <joe@dama.to>
To: Filip Balluch <fballuch@redhat.com>
Cc: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] e1000e: rename init/exit module functions to avoid
 confusion with e1000
Message-ID: <arxGE+eYEmkxNQ61@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Filip Balluch <fballuch@redhat.com>, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915122639.64936-1-fballuch@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915122639.64936-1-fballuch@redhat.com>

On Tue, Sep 15, 2026 at 02:26:38PM +0200, Filip Balluch wrote:
> The e1000e driver uses e1000_init_module and e1000_exit_module as its
> module init/exit function names, which are identical to those used by the
> older e1000 driver. Rename them to e1000e_init_module and
> e1000e_exit_module to clearly distinguish e1000e from the legacy e1000
> driver.
> 
> Signed-off-by: Filip Balluch <fballuch@redhat.com>
> ---
>  drivers/net/ethernet/intel/e1000e/netdev.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
