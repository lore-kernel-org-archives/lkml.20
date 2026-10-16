Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [144.76.133.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2146DFFC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.133.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149107; cv=none; b=EyCPee5K8or3FdsHuUU2h7eqAFahlu0nGPoJWUyzcAEa4AjHxsyiQIupbVwhu7UF7d2tX9mR/MtDR2QI6H3olmmTlRk2l9+LaP7Jvk6Lh665nK8XzvA5gJTrNhLeK/BLSEY3CF5tfSS2hIjVuKObi/T34pk8ezwzLF9eH6xY75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149107; c=relaxed/simple;
	bh=Y9lp5mQKUVEFy2SJY3OtcCrqCBLMcB2bcz1wGo2JFII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKfaS3FW0Qm7lQ8eCduySoHG61fIPFgyxrtOgtuBdzz0/RvTvdwVynfr/FBLm22vItA71oQspMyhkOq0tPzlnzdkab5nGzs9fQjOOfiXc6ylGNBZQE7b1uIhgRYUMZERPdHgHiEHRReWLmtMLQDCFVBRf+7VTV7JIhXfMhu7S8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=144.76.133.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id F38F5C94;
	Fri, 16 Oct 2026 13:11:35 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id B2E5C602EA06; Fri, 16 Oct 2026 13:11:35 +0200 (CEST)
Date: Fri, 16 Oct 2026 13:11:35 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Adam Azuddin <azuddinadam@gmail.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Aditya Garg <aditya.garg@linux.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Atharva Tiwari <evepolonium@gmail.com>,
	Kerem Karabay <kekrby@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/appletbdrm: Fix incorrect error message on encoder
 attach failure
Message-ID: <atIGZ78zy4St-MEA@wunner.de>
References: <20260926-fix-err-msg-appletbdrm-v1-1-bb578a7dbdda@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-fix-err-msg-appletbdrm-v1-1-bb578a7dbdda@gmail.com>

On Sat, Sep 26, 2026 at 09:18:11PM +0800, Adam Azuddin wrote:
> drm_connector_attach_encoder() replaced an earlier call to
> drm_simple_display_pipe_init() during review, but the error message
> logged on failure was not updated to match and still refers to the
> old call.
> 
> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
> Signed-off-by: Adam Azuddin <azuddinadam@gmail.com>

Applied to drm-misc-next for v7.5, thanks.
