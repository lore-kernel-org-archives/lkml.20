Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EB936D51F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795118; cv=none; b=RyJuikhT9TOwF9+26A5R39vfIXKxg3oLztMNK/nTaYhzYa4SQFw/p9Pb+qCoDdkveIOc9qXGTY9ULmi3dnFZ2uJVQ61ANmeB5vtnB2EVYIMn2bZjJrmHFlQrYjhGVOSWHVXAru8U7cdqbaIvGOPUCb/mu8UZx2FmhYPb2Kl2zDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795118; c=relaxed/simple;
	bh=1tUtuUrEXlXgTzbEoxh1BpuPhgQ2b2BnNT3+Ec05ZYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqVDIQRNPKyYDoFsc244tr3Q/GNmzXvG8kSHsaiazeInUpLzZ7CVgexzYCEBIJJe/4vN/V4jrGjV6Pf7QI05LZ33J6fqd/KU+Njv9wS3t0yr3YRKF8FmUrz3djh4q4IKM/SZhSxSHbq2CdReNJpaD/d8PohSZkXFl1O2fLXfmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQH0/wUo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQH0/wUo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so13626275e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795115; x=1790399915; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sBBnfsQ+/vg6cjSZvG+Kg56eu8vn625PDpD6taCDHRs=;
        b=JQH0/wUoSWm5dTdmfatWdAAMVb468xRibyYLciYtkyzw8jcGS3kBwhcmrDjebTZMmt
         uaHuDNkkfss709VwqZjCWHL0xE/9n55Ao3BMOCWW61dCuwG3m6TUKuNTGXwlWgULkIOi
         J4LKY7330CJYgiT43L+Dm7KOJtgd0IIYIkDHs5qFVKaROaiWdLm1+hxVG8bReJjxQS6m
         RyVVosipz0KLbNKtDx/ZTYLAmHdTk7fHjqUzHQAx9ZZsPOkrdm8VlOqcQbpK7xoAzBLf
         IdOunkh5x81MN0oyZthmgat38ly9VU2GADgrKLIPp1jYtGdPIeF2YNFW7/xcZeUXRnmH
         wK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795115; x=1790399915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBBnfsQ+/vg6cjSZvG+Kg56eu8vn625PDpD6taCDHRs=;
        b=H85LhDkcY4eNG9RwAod/1Vb2jdOK4My/T7AI4eJyfRKDnAqVT3Q+UJCuwqce5IgmP/
         dFOBmH2IQQnL368Xp8TVaCggWRxdCxhqw+DbdqftfYlB+Rug16dNo3us7d+QuPaoJUHq
         9MD8iErSwSuiBepwWBKvgI4XAbDoGTnQV7VVawz24xmApj/k6CmAcTffmP8QpF3hz8Xq
         wHhy4OoLG3zTz1WaNziXjScKnWWJRbx7GALmuRTHIaUSX5I6lehFu9exrsJuzbm3fb4b
         11YHOieVYGjPQmQQNKMnszCeqlP/iP3PhG7OoEx08DE9cpyMtWhPH0V+CbrqodCem+32
         pTeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbE4pFOCXRHXYFkSKikSZ68O+qQnf4CH2hqq/A4loCvylfEAN9XQa4Ulgq8Y8EOuBYM6nCHfDJY04daNw=@vger.kernel.org
X-Gm-Message-State: AFuF++lu4eV5ZcqSB5VyqBLcCxuEh9Wwt9QzPIhIaCbp90EacAmzwgm9
	08jJG49IUaKAosK2nZW2ZYLGUsKN/bCYdDMOmqo0WamiusDD0yOaKrkj
X-Gm-Gg: AYBFou3HOkmcwL96gD0C9t2wm3vPaadKQSSCF+o5j2N3joWBpeFOLRzU6ErNESUvbzM
	tokbMi6OvGzeE7J2sBzIiqtbu804MTwvh1eTKO4q0NOBQKb3iCHoEcCVQcMaRV6PljtPUSsXTzy
	+AbTpAIFZnfJvVqde/lTm6tUaoUkLX0m8KxXeNw9AywqXaI0CGApQ159Svq6iCQGoHasFOMVUDL
	iWpyus/jN+vqF0FNRvrmRB1TP+zvfvCe6t9NBaKiCBb6F+rrrJrBuM66RfZ4THoCysBb7KjeUi2
	A1fz3ZsqzqtIB+1pc/KcTfpD6sIs8KvSXKsMbLYze9Ah0L7L6i5P3Cm+Nho8PnZbekgyouD0JAb
	sWqvqun6ZJ1oIOVvyj+rJ2HsU+kUxBM15jBQttPaTsYPY4eSjOlwJcnEVxyrrMhQiv3Ykl87z3x
	guzMw4TFD5GF29TuW+ai63tapXH4OdCt5QJn+X1DL5iDsW4F8fhKk7CY1jnwgTR1uqg30ZtgF0F
	5FFTDvrCc8xNYBUH/iBMDnYVAigNY2vVSEy/HrcvNHLTtG2dZ3vTf3nDspTHx0cOwXC95Bd5eGS
	CZC06u9F7VnvugcXpPlax0siDran1Vr/9+YH+EJRM6oxG8uUnqGcLkIyP7BeTObrdhoIaT7KpqB
	dKYRkeXhVJX5ty+Y=
X-Received: by 2002:a05:600c:3f0b:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49fc56aa68amr61228495e9.8.1789795115151;
        Fri, 18 Sep 2026 22:18:35 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcda2140bsm30392735e9.1.2026.09.18.22.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:18:33 -0700 (PDT)
Date: Sat, 19 Sep 2026 07:18:32 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix AArch32 DBGBXVR<n> handling
Message-ID: <aq4awYi4eQwgcZ-E@gmail.com>
References: <20260810005616.13227-1-kmehltretter@gmail.com>
 <86qzk69x2j.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzk69x2j.wl-maz@kernel.org>

On Mon, Aug 10, 2026 at 09:52:36AM +0100, Marc Zyngier wrote:
> > diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> > index 5d5c579d4579..2862df188155 100644
> > --- a/arch/arm64/kvm/sys_regs.c
> > +++ b/arch/arm64/kvm/sys_regs.c
> > @@ -889,6 +889,7 @@ static u64 *demux_wb_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd)
> >  	struct kvm_guest_debug_arch *dbg = &vcpu->arch.vcpu_debug_state;
> >  
> >  	switch (rd->Op2) {
> > +	case 0b001:
> >  	case 0b100:
> >  		return &dbg->dbg_bvr[rd->CRm];
> >  	case 0b101:
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> 

Friendly ping on this patch. It already has a Reviewed-by.

Thanks,
Karl
