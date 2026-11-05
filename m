Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793920904;
	b=saNbIKSF2qo4tSAUOqVgCgvi6tQd56NITi7+jSYXrscHUgSphfo91znhp+asgnuII0oG
	 7Rd5Cp4XtHK3QnOAVhwavnLZOnqzf9zP7AO9ked5bK9iUNf+/G5zC6MtGs278UEMx8uP4
	 XFO4tNZHZ5uYJlUbnvy4td7pSJ5UagGRNMz6x+2LQ/5H+ddeaPzO9mC5rVcG+tGd/lo3u
	 d7nBjSNNjcMxQlqdK23Vo60URTu1aYK+GiRRwWq4/F1ZtfpczJ+cGx89191OkFzsMU0wR
	 JF1f4KZXvEY6NvjvOVFhMJAtjgFjfeL6ghIBycmrz8tt1lsRbMR8jb4Ls/r56kB3ufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920904;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aLvtIORUcIji39lg8fiARd0b21RbnKtHkgK4GoPW0iY=;
	b=35iTnXCwK4OKzx3KRa86NqaGLAHQzil6x882dVNrMzVf98Awxfq8PGpqfhVYm1HqaIoT
	 K27O84jQQIG9O7GgNLPZ6fqbDGiMJ8HORT+ILLGtlvp/cRmyH/BQyZkKItwmbyTIZuggU
	 +maIYSZ1AMVDUa605yT8QILWuZwMgkcxhUIQIsPMFwYKZm3V5bA+B6U/yY13VbSkcVgpt
	 iVrAKecFJ4aCLWNs+aO3BCp2CHDr9/vAAfd0AGKj7fXkXIejDMECz4pWtKOlpZgmSxNWW
	 PDHt1GtawL9JT8WBh9ZzBHIx7mAvzKFh5+I+KUoRLYtpHMXoaWzNe3fdj5Lqkj4OPjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=fZkZb+zV;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7F8606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E7F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=fZkZb+zV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=aLvtIORUcIji39lg8fiARd0b21RbnKtHkgK4GoPW0iY=; t=1793920902; x=2109280902; 
	b=fZkZb+zVm/gahJytxBO42L+nB61IMxepdyGl8MTc5RMxnIEWHjpgmtKVrYiqFzKq0czi9M+xDaZ
	n4U4SW4BBOqpCrT5u+DuiBfTLdVu0dWJ7A1y4DFoR+/DfqOcw6g5lW/O/1cWhedwd7sanCHQPAFCK
	AKjdFs5Ts0xK7or6DA05yPeVTtG/rwDdps/gKoMLn8hHoKsyT6ZEYTgVO+/4uZdcekxScMiNlln5m
	IpZ/rsQuNpWFtAmt/sYwmGQTxn9Zuu26gf7qE7Z9B/nFnAIq5NjQMAxW43V6a5D4KKlA/+aylcoZi
	XdHU4SxNDQvx0iEL9K1VeVLqgjzUXy281qzQ==;
Received: from [179.105.94.163] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xP6lm-003qVr-Ll; Fri, 06 Nov 2026 00:21:23 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm: remove deprecated *_of_get_bridge() from non-OF drivers
Date: Thu,  5 Nov 2026 20:20:09 -0300
Message-ID: <179392080015.2087368.10442125005944134792.b4-ty@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com>
References: <20261105-drm-fix-of_get_bridge-build-regression-v4-0-906ca343ac1b@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Nov 2026 11:32:04 +0100, Luca Ceresoli wrote:
> Replace the deprecated *_of_get_bridge() calls with
> of_drm_get_bridge_by_endpoint() for all drivers which can be built without
> CONFIG_OF.
> 
> Some of those drivers had a build failure for configs without
> CONFIG_OF. This series used have fixes for those failures plus other
> patches to convert all other such drivers to
> of_drm_get_bridge_by_endpoint().
> 
> [...]

Applied, thanks!

[1/3] drm/vc4: dpi: stop using deprecated drmm_of_get_bridge()
      commit: 5c18e4b11829d9228510d9580027598b54d382e7
[2/3] drm/vc4: dsi: stop using deprecated drmm_of_get_bridge()
      commit: 4a38a538775e072fee707aa28aea5ccd50941796
[3/3] drm/vc4: dsi: remove unnecessary intermediate pointer computation
      commit: 41ecf852c07391687beb129e12a231760b5d783f

Best regards,
- Maíra
