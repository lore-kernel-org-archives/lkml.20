Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF431ED83
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790729279; cv=none; b=A6tZyc9u0o1Wbqa/rLKFQeVYr4jnXqPEi2ipCLbE9zL1CcLUs/bjyDGh7vDoc/WQEsvYjlcMe6JQTAA4NohBFX0bUSMtIlK3pK9Z+8QxxeWF99ekeH8AsOrDMKzWwvfK1gmn0lmak2dMkfk0/e53MKYeTxwOf+/RUo4aX7cnmEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790729279; c=relaxed/simple;
	bh=IkJ9vtM6s7ZyhaUSNWu4KEIRoo54ySib6eoHDno0ZzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSU8KuBrfJue8NMbToR2hBL0J9cTght4aul1Ncv5DffnRLIGTrnu/cgB4hKa5PD/Szif5Uoc9+GL8M842o6bJjQmTlMvlQ1O6k8aAWXFKk3CuPekbA43c/cLgRDiMaEyn002YhZwba9H2D4mzOvEUcYw4IRqRjthVpBYjyS2Fd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=SN8deThB; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="SN8deThB"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-885f0eca6c4so471674b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790729276; x=1791334076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=40g7gQiOI5yVws2P9bf3jH4EWpMijZlz7/Un3g1hMDI=;
        b=SN8deThBfTLAfxUrRXB8NfVFKSg9BKBgSG/I1r+g+TtwdY0D7V/IRkCTZX96sa+J0X
         8ZKeCS7kCi3JfcjJfBxvGMm9lsBKjHVEz50fZXJ/Q/6bzMOnpaApDANQ1Q/nLLlVBYr3
         D/M916tqwvnRiQwingSCKNlvUuhDCs88/oaIAudgv8ddcBzY0rzDIOwT0rdJzoaqBoq5
         Ho46T91/dZ4XJz9ghF+3sGEX21313eRIMwuPDDivStBzjtT/mQ9X3xjNvk2w1X8MJmxl
         NX9gQEZgjTgo0Qjdt430U9ArWSIISZkyvIQpmFlFj1kQRetxkvACFNI/g5viJEGUKNws
         /I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790729276; x=1791334076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=40g7gQiOI5yVws2P9bf3jH4EWpMijZlz7/Un3g1hMDI=;
        b=M/0MiEGHbE42q9QGWQ5VrMa09y11jyc8mx6FgwZxlFOf4GYcSHnpuQ4XGkFNXCajps
         Q2oo3n7RPGNdml7mcwa8rhsc7zuWwO4SkLfnxom4/Ou9MqJTLVzqM4oct9F7cp94J7U1
         2RAsYXGyjRm3E6bR+g5ADyt+wksdiS14kYa1ykkKmoVuuVvMRGVYLtCiRztUgbqyNyDl
         akhrlj0X9DGFhj2n/iqtdDviE504Vc/q6sEqjbV5ls5iReJRnhn/RJVAbqm8fH/js1H0
         aeqVJ5dIJWmTZx4pM/9PjfL9bYKcKyzA6n6vTEqVbPN5yjhcr7nlKVI/6uO1yaJSHgYx
         U/PQ==
X-Forwarded-Encrypted: i=1; AKwUvBw32W5BV63nEsJyY8ojd5M9nT1rmtuVU5M7DC4bd0cTTr0EnGc5fVfdA4MS94zd6JatWu7FHTcoi3P5hzw=@vger.kernel.org
X-Gm-Message-State: AFuF++m9DMw0tuFQJ1dl7sKWnr7wIkrsI4kWdd1K++BvQ33/nm9MClR5
	wC/7EdJNEPIMIxUJ0YEbOSacolhTm4AIEqr0jBN425XZfpvQ9+CGQInlJG5iHfEo/2g=
X-Gm-Gg: AYBFou1LFkmO4Hjcp4fADfsAGHm+0L4PoYfQm9sosrxxpf/sFdNY8cq7HbE536w8+1B
	ntAaUcI3VXIFvl8vbfMEx3Tm+LmZ8m0PaGNF9q7gAOStNfFoPacdaqHX7vwsU66GIuG+zecgD2D
	aqZczNuM2Sq0jVCRiCfhfNq4PtVj1X9XaWtUC/j4BCmoKrDIvnaSRteKG8eD5wWs7dnAzxtnCYm
	EdLMIV/DlYGApSw2lXP5twBcsNmf27PTRVILo7rOpJ4BLP9sdFGjPk800D1gBEfpaf9eJhlMQTs
	D1YetLJ7JRJFz4w+aOt8msVimXS2LjSkznKpqw48t0ghxSYYeuYdZarHiUzV6sxyLXqO9tiH2gj
	56L/OcyIyljC05WpPQexmrpSUG6L3t424gU9maLlGPOUDh2mBqivX+F/7trIMjoO8j5KW1AeheJ
	U0seRVl5r8+uO5velCNXoF9mcOjrS4hbgCzPiebRaJ+nA6I83P9+sUTlokZ88ezzCEejqOsA/lG
	OvaT65Jw73UN5z3PtE7RMA=
X-Received: by 2002:a05:6a00:1906:b0:869:f065:f499 with SMTP id d2e1a72fcca58-886c3eb14a7mr659287b3a.25.1790729276326;
        Tue, 29 Sep 2026 17:47:56 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8868ba02d02sm560259b3a.21.2026.09.29.17.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 17:47:55 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:47:54 -0700
From: Joe Damato <joe@dama.to>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew+netdev@lunn.ch, anthony.l.nguyen@intel.com, davem@davemloft.net,
	edumazet@google.com, intel-wired-lan@lists.osuosl.org,
	kuba@kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	przemyslaw.kitszel@intel.com, sln@onemain.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] ixgbevf: fix xfrm_state reference leak in
 ixgbevf_ipsec_rx()
Message-ID: <arxcOtu89COHAncp@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Wentao Liang <vulab@iscas.ac.cn>, andrew+netdev@lunn.ch,
	anthony.l.nguyen@intel.com, davem@davemloft.net,
	edumazet@google.com, intel-wired-lan@lists.osuosl.org,
	kuba@kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	przemyslaw.kitszel@intel.com, sln@onemain.com,
	stable@vger.kernel.org
References: <20260917111418.2148632-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917111418.2148632-1-vulab@iscas.ac.cn>

On Thu, Sep 17, 2026 at 11:14:18AM +0000, Wentao Liang wrote:
> ixgbevf_ipsec_find_rx_state() returns the state with an extra reference,
> which is handed over to the secpath on the success path. When
> secpath_set() fails, the state has not been stored anywhere yet and the
> reference is dropped on the floor.
> 
> Release it before returning.
> 
> Fixes: 0062e7cc955e0 ("ixgbevf: add VF IPsec offload code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/net/ethernet/intel/ixgbevf/ipsec.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Joe Damato <joe@dama.to>
