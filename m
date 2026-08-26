Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F22E764D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780500; cv=none; b=BJCc6d6qv36nx1Mt3stSeYEfjTX/XPvp9pEHpjLijP+fvyRHFvqW4bKiFOm5rBm3FUtyvKyB8IipNGyluqSDHOcn+qa3exASvG8KUBYbtZIBvH1zklL3smIQ73Zg3ylWXC9ZFzVkCdRSklPUO2CTxUAyinhcDUm5+jyJcB04qoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780500; c=relaxed/simple;
	bh=twlJFyFSMZwL2LQA7vtBaH2/8Ve6Y3zxtnEWz/haEWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPeBSPDsU3LZgXivPphRBVoV9Fhcx+zRrxEYoyGUsZSrADYVBdbHPNYPECEjQDRw3fQzhv+sKpGm/pysK9S1GhppLiF3sEs71fezsYebr0iWRL7VeWGIiLXKrSSqi2C0BoKlcyi/z7vea1Ohqad4BiNbqg7UDHnwPVlEiz1+Uj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rz0x8RQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rz0x8RQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9EA1F000E9;
	Wed, 26 Aug 2026 21:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787780498;
	bh=JQyo0FkTx6wAUb0+0rhsxKTB3sLkP5D0HVkycmLIZsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rz0x8RQQ9nINYtsTsbS+zvaJe0y6HEg6PXNKbZugTNP4Dppg0JaoxPtbhxk7KiCB3
	 FD0vQMzWO7Rd3ZCpwoLG42GqzRSfZYcSBFUBLu+8zpffGauw0nnlvbGRo9uFs1Oz8O
	 WPSaYOPVbyJxQhV4KCX/AFYmjNDxrc+aXCfx8b3ET0yAxOR/U2LU9KpmQ9rEzaQ3+w
	 zpfGPaPbbC19LpNdY/GIlZrmWrMQAyh4/8UO9BxoB4rj694xtSo9VDNGGFlew7ymCg
	 BaJ08yiJuDsrzZkTT30E76k8b4RB09KZwnqAiSxC9WVmYpub0k1DgORtzrj8oePT/O
	 dXXtwJfPEO0EA==
Date: Wed, 26 Aug 2026 23:41:35 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>, 
	Lionel Landwerlin <lionel.g.landwerlin@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix memory leak in query_perf_config_list()
Message-ID: <ao9ddFWP771y2J-d@zenone.zhora.eu>
References: <20260823205028.178597-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823205028.178597-2-thorsten.blum@linux.dev>

Hi Thorsten,

On Sun, Aug 23, 2026 at 10:50:28PM +0200, Thorsten Blum wrote:
> When krealloc() fails, free the original oa_config_ids before returning
> to avoid a memory leak.
> 
> Fixes: 4f6ccc74a85c ("drm/i915: add support for perf configuration queries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
