Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438907;
	b=PodqB1s/4wOONbqLq/SY46iZosisznA5rD6v2uQjXuk1Nip+uwVteYoZT8eJPCKqiXVP
	 kLHVONhFMMZsAYogT2Qxdt9bRVoY+cDQTM+4EbGh8mOOa2yxMNq8Wl0RlYYXX2AyyuDpm
	 16TukRC4RUOqyltLC1nq9ubTXLRAs3NS5Xi3i1vF5iDjyCRKtUqpKqiaLFCEa/hA3NGIo
	 Zc0BprzfxZlEZa6EQBj4oYuCVCbe98PTx9XqHJhOqFH+C8KTQ1xTWpCtz9l6AYhvmqw/C
	 XRIoLtqPI3vhAIj0Rs3htCVmGFyNa8bq0u8b9ySs5H3DHGb5TLvbBE3Pc1rFUYDQ1dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438907;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=k9Zx/ZW4I8N+mjB5vEjKMn6hXcn3AohRAT+gKs7pw1Q=;
	b=XYnXmG/391KP+wFxnGPYJTko9Wge6BsHooZeL0CqmQlvXsyt2AZQ8vnVnhw5L9rxUa5H
	 u3q2hsNyudVk6AsHA112RVARMqMYk0ePtET4ogjd94UeDOkwSxTQ9aIhTX19/4USudFeP
	 YezU8ClXvZ5XeDsqy2QymuNE04iTX9Y//oR9zuyHgOzY5m5m7ocyAZDT8P9oY2Ke48R1f
	 fKcML2K+3D7yU7mTdyPpJ0X24smSTy40qaNkX0XkoGuHvLSMR5zoOkmVjsOBsVVdTHfFw
	 x+xhlBMy+xSFxTsdIeUMZ3Hg6miyZ8db8nGlJvFOKaV4njaasfiDHsX068uCq5oA//w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=Igalia.com;
	spf=pass smtp.mailfrom=Igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=SA8vSYJO;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB8A606A31B;
	Mon, 19 Oct 2026 19:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB8A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=SA8vSYJO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=k9Zx/ZW4I8N+mjB5vEjKMn6hXcn3AohRAT+gKs7pw1Q=; b=SA8vSYJODOm0IYLi+FFi63+/R8
	XtHCyZLlK2msXsGkFeHikcB5TwNf86G3x/vA0XkCAX5NVtodS5DzRBo4b4nCz1O2HDPkY7xJRPEko
	44NohojE2p/Jcy1QvVTaCYkhUpA500wqDVMUfSGaED3J5pLDnvDaWGxfyzHGhURnFAGpl0ABKMyBL
	JNSmz10y0q5nln+8UiXYVtZUrpLI2ug7+XEw+MLT3OQziJUVj9ra5j4EytZCoI1Cu//3N2CEyZYiO
	gDfUyyJJ3o3G9Psb7GK8BFOswedtt56vMcCSdBoO9tbfW92R43NvH1rLbUq9jAcEHFtNK/EA9Q85t
	Ao48gZSw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xItEM-003nxp-E9; Mon, 19 Oct 2026 21:41:10 +0200
Message-ID: <45638e6b-04a9-46b2-97c0-66f3e2f9930a@Igalia.com>
Date: Mon, 19 Oct 2026 12:40:58 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] drm: writeback: clean up writeback connector
 initialization
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Brian Starkey <brian.starkey@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 06:12, Dmitry Baryshkov wrote:
> Drivers using drm_writeback_connector_init() / _with_encoder() don't
> perform cleanup in a manner similar to drmm_writeback_connector_init()
> (see drm_writeback_connector_cleanup()). Enough of the drivers don't use
> the encoder embedded into the drm_writeback connector.  In preparation
> to further rework of the WB connectors (as planned to enable WB for i915
> / xe drivers, which would move drm_writeback_connector to be a field
> inside drm_connector instead of subclassing it) remove the drm_encoder
> wrapped in struct drm_writeback_connector. Rename the
> drm_writeback_connector_init_with_encoder() to
> drm_writeback_connector_init()
> and copy drmm_writeback_connector_init() interface. Then, with the
> encoder being gone, handle proper cleanup of writeback data in
> drm_connector_cleanup().
>
> ---
> Changes in v7:
> - Significantly reworked series, no longer insisting on using drmm.
Is there an intent to move everyone over to the drmm version in a future 
patch set? Or is the plan to give up on that as being just too 
complicated for the benefit?

John.

