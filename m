Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837E3F8232
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791294980; cv=none; b=YdRavPikOTjGNetbzIkcr4sElSq6iXhwt3Wpa2n3WMKAUl0T+6CahwqXjw4OId3Ckyfv/mSxOstIh6ik10ifg/Cwr/Gv8MEIxaqP+LOcUAq+oyGjZD2Y0l2mv2Rjam4nPX2Y1Sjg07B2K0SRclckq81CvqIPSNUiXqiiIMbc25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791294980; c=relaxed/simple;
	bh=bDAliNzKZyMwFf1bhOd/4jXes/YgZfP9EADAymbWW04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WVApShnoFFFFrxhXc9KcPMiOffaoR9wf93B1Mm+1cpxcxiaacs3B6NqLyjPkiSybbg31gRsv8mFjj/m/0Obfa21/QEl4V9rzUGCFHsEYdgvSuJEwLnzzFaGHQH5KIxSPCRSDFoMDnfjrTCi6c8utyXBQd8TzF6mU6OZoKzQm+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oaZxjX13; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oaZxjX13"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=cuBXybBUoDkg6+ydTmReZGyM4NMPu0ZgI71jNBcqLlw=; b=oaZxjX136cx5v4tV8vk3rr3UPH
	7FuP+xqtsTrFOCzKDXew16n8q5k2MAUZz2XcWCb8GsKGziY9zOHbOUYeWC+YMqsBjcs4HVMu0JLfl
	gntMjK2BKH/oVOdMuInZFnvTlvlXnjDb3Sj20CN/tF6JmZBXFCc2XRLpNXc/g9rfN0dFxYLSvQH4L
	FnTroKxPK7G547IiX43kQ8Jl6Jeb9Vo4aMVNu+200w9Yk9oaVm693jEsquBRy/GlAC3aJQMONbKYy
	ekXfV1eoMD53k3gSj9gdKTVzbnL6BzbSl95Nh7mzCJfbTQYnG5ch6+F/MyXIJSLvCVfdnY+aMUz8D
	gXyCIm/A==;
Received: from [179.105.94.163] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xE5e9-00CyrJ-Ju; Tue, 06 Oct 2026 15:55:58 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Drake <dan@reactivated.net>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/vc4: Set DRM DMA device directly from HVS and V3D
Date: Tue,  6 Oct 2026 10:55:29 -0300
Message-ID: <179129492581.2506814.16927758002559575379.b4-ty@igalia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004-drm-dma-device-2-v3-1-45b121ab819f@reactivated.net>
References: <20261004-drm-dma-device-2-v3-1-45b121ab819f@reactivated.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 04 Oct 2026 19:24:45 +0100, Daniel Drake wrote:
> vc4 uses of_dma_configure() during bind to set the DMA configuration of
> the drm device by borrowing the configuration of one of its component
> devices.
> 
> This violates driver model expectations that IOMMU probing and domain
> attachment occur before driver binding - see commit bcb81ac6ae3c ("iommu:
> Get DT/ACPI parsing into the proper probe path").
> 
> [...]

Applied, thanks!

[1/1] drm/vc4: Set DRM DMA device directly from HVS and V3D
      commit: b0a6b769cc174dd9fd154270f78acf72dc3e5c7e

Best regards,
- Maíra
