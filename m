Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6EF3F1052
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789105758; cv=none; b=Yl03Yo5UwpFWzAAMxGuBKsdofE5rHL9OHT9mDjshDrIOrI9TVhndvEA2plvQYN1zcoqj9tt5w/TmaZPmDLAWYVTvxUq2vJ1j56Wz3lEDABQdI/fPFKQRIvDFgJIjU9lIxDo0uOgdMgn44xgL1bAZTsWc7lhpM9GorwC/hq7ciag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789105758; c=relaxed/simple;
	bh=NX/0FxXyFfQZUAmTs3a0stKu2eAXVAkDkn+OMUSpgxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvRtE3D2Nt2d83pWO7IgoZ68zWH70+j2zt8KCoJ1xZUiVZlrXyoQ9faetqagBk1VP43pfgAViFBelEyCQENAbqi21FZUr2DjKVExzEG2GzH7uJhL7egX59BeWAveRmgad+CFlHk3PLviH4dSwZ/Sxu4enJ2EfgEY2f879JA2fU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=nNofjlPq; arc=none smtp.client-ip=207.54.90.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="nNofjlPq"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789105742; x=1820641742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NX/0FxXyFfQZUAmTs3a0stKu2eAXVAkDkn+OMUSpgxU=;
  b=nNofjlPqYSvRmpoJ746K4NN46wsqbwhyMHFGTdOpU/6QQPvzpLAdS6/K
   Kfv1tgdCARMXGBbQG/9uOzS5s6AIRj5qmgOtLn5q5fn5EvmosZvzR6+FK
   BMOKQZ1aOf88vOE1ALHDQuhTTXBOh6nFkcKy0aPPlFXaDqMqB0wpCimyI
   KYiYw2o5lR4pO30olKpqYlNw72lQwGDFJHoJ9funC5l0KkpwVoix6MNkt
   jxbEp28VguV2DwF3B4uAp0cS4yE9VHPDFDOMx/WkxAPZ7a/NuGr/cNPQb
   +dknkZMsMwjU333UrtB16+JewcxShBE52FSXUAMUvzICUgUaXFznctdD0
   A==;
X-CSE-ConnectionGUID: cYraSv5ZSBeDvZr33V/UpQ==
X-CSE-MsgGUID: +lF6nPy9TBO0G0KY0wrQvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="254629814"
X-IronPort-AV: E=Sophos;i="6.27,96,1786978800"; 
   d="scan'208";a="254629814"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 14:47:49 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EE58E406EC0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:47:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9F92C18009DA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:47:48 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 216CE829F12;
	Fri, 11 Sep 2026 05:47:42 +0000 (UTC)
Date: Fri, 11 Sep 2026 14:47:40 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, oupton@kernel.org, tabba@google.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, will@kernel.org, ljs@kernel.org
Subject: Re: [PATCH v5 0/6] KVM: arm64: nv: Implement nested stage-2 reverse
 map (new data structure)
Message-ID: <aqOV_NFeTuHWFBVP@sm-arm-grace07>
References: <20260810205038.118843-1-weilin.chang@arm.com>
 <20260902163500.1841671-1-wanghan@linux.alibaba.com>
 <877bl26aqg.wl-maz@kernel.org>
 <wsnf276xrun3g4hjr3t6alprapctg5z4kpj422v3hujqdjnrsa@swq4blkqvvj5>
 <46342b48-550e-42c1-9d9f-e800c72269c2@linux.alibaba.com>
 <874ig55u5h.wl-maz@kernel.org>
 <f2357ad9-ece1-4331-844d-5911baaf571f@linux.alibaba.com>
 <87o6ea4q67.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6ea4q67.wl-maz@kernel.org>

On Sun, Sep 06, 2026 at 11:42:08AM +0100, Marc Zyngier wrote:

> That's an interesting remark. I guess we could add some extra tracking
> for that, but let's see what we can do about the above first.
> 
> I've hacked something together and pushed the result at [1]
> (compile-tested only). I'd appreciate it if you could put it to the
> test with your setup.
> 
> Thanks,
> 
> 	M.
> 
> [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/unmap-vmall

On Neoverse-V2 though, with NUMA balancing on, the WIP kernel from
yesterday brought up the Ubuntu 7.0.0-31-generic kernel online
without an issue. I will test the host kernel again when the new code
is merged to kvmarm/next.

Thanks,
Itaru.

> 
> -- 
> Jazz isn't dead. It just smells funny.
