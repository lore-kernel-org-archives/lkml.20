Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684389;
	b=S8U/a2ewUC5WshWzgnLww1IScjHnom3S3M0lzaOEsQ1RjnHK+c8ffHfm1L/QLeH1dhaW
	 8qwHtKsttdZ2dd7K+fOOf6+QtU8xSRfy8/zg0t+IrWHeyuA3dxjCD3hMlKNOaEtrzlJK4
	 OyDbfdjT3HPhhDmwT6fClm/o4+n/0E8QDUViSr4LVRbRj0RKGTPOKfPiLkWRntLPf9w6B
	 fbkP4wP7Ef8ka8lCe6emP+qFgEkGcW/eFGeiQG71LT1cmLlP6NKczdPmetmM/ujohJILE
	 u/a3yHod/K0fnHwO8yAwpdCqenRFwKit8mCeXlQnpUDIQcD3Y6qe3rcHGRaSjiW5nzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684389;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FC4eFsO01rcXqLH7YHA3uDKUlJxUSk705KFFMzLmvQQ=;
	b=yTxjLn5hele6o588FNwOv9qRUacgnaARG3uGBV3gNwngQVcJG7y8vr9GyzlUUK+DIvPg
	 iiCVh0iUNTDVrtWNzCc0m+At2UNtvb+NO2lOcCXllP7PoBoSFS14BtAFRdVHiiES9NRWx
	 tfs0x+wt051F9lSXBpXVL8Uh4GfBrz8EtyIuRBMDtzDfYI/ED8kzycS+YkPRQYIPxXJMl
	 luIfLc/Z2d5fmUd/aU0cjDIdL2kneFzLc0MFGntNqtYdIDMe/U4OO+mH1hGXNVw151ChW
	 XZB5aSRwHZi1LW+cPi5nYDxXSKJhO1OCIAMUXcvOEpqRFpLUjVe4fUq6uk1Pkgd+85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=Igalia.com;
	spf=pass smtp.mailfrom=Igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=PKfQ3107;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781F606A326;
	Thu, 22 Oct 2026 15:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B781F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=Igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=PKfQ3107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=FC4eFsO01rcXqLH7YHA3uDKUlJxUSk705KFFMzLmvQQ=; b=PKfQ3107rKT1VMujuAHMJ/WzFy
	qCZqJaiRKMEUVjxt5mqwp7pTmS3TuIEVDKSF9hM7PxSGeFX/9v5aZRT60aZm9iOkdHbvuDKcSN3P2
	p1PEg2oHXtohazoq1YXKP1SjE3EApaXC0KM60oO3bahfEJ4nx1sTLSIIH7OO+5MwI5+nE0AVHvj8z
	u2BbOHVsHKeB+3oGR5lCXXrgOO+C9YVCMD4CtzCfZPDidOAnNVJUCWDg/R+bC9Gbmwd/7V1cZT/Po
	YoH4UiAaS9aiH1qxkTeyH8fXyRRZf8kqiWI4+jTUf7deNCPpM/ylQmGE2fN+ldFdJ/kQMfJeSRN5v
	g84OhrKA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91] helo=[192.168.1.133])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xJv5u-006wgQ-Se; Thu, 22 Oct 2026 17:52:43 +0200
Message-ID: <b93caf6d-1277-4e86-98a6-139f9cf8fb4c@Igalia.com>
Date: Thu, 22 Oct 2026 08:52:34 -0700
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
Subject: Re: [PATCH v7 8/9] drm: writeback: clean up writeback connectors in
 drm_connector_cleanup()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Brian Starkey <brian.starkey@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20261019-wb-drop-encoder-v7-0-d4288a26eb54@oss.qualcomm.com>
 <20261019-wb-drop-encoder-v7-8-d4288a26eb54@oss.qualcomm.com>
 <d792066e-c857-4e80-8587-44a58ab75815@Igalia.com>
 <gjeqgaewd5omwhdmepqcsrjq3pph722j6rjtoedot5rqsjsaht@h55ako6z42dt>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <gjeqgaewd5omwhdmepqcsrjq3pph722j6rjtoedot5rqsjsaht@h55ako6z42dt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 04:59, Dmitry Baryshkov wrote:
> On Wed, Oct 21, 2026 at 11:22:48AM -0700, John Harrison wrote:
>> On 10/19/26 06:12, Dmitry Baryshkov wrote:
>>> Only drmm_writeback_connector_init() registers
>>> drm_writeback_connector_cleanup(). Connectors set up with
>>> drm_writeback_connector_init() (amdgpu, komeda, malidp, rcar-du, vc4)
>>> never drop the formats blob or free the jobs still on the queue, leaking
>>> them together with their framebuffer and fence references.
>>>
>>> Call drm_writeback_connector_cleanup() from drm_connector_cleanup() for
>>> writeback connectors, the same way the HDMI audio and SCDC state is torn
>>> down there, so it runs for both kinds of initialization. The drmm action
>>> now just wraps it. Clearing the blob pointer makes the second invocation
>>> a no-op and also covers drm_connector_cleanup() being called after a
>>> failed __drm_writeback_connector_init().
>>>
>>> Fixes: 935774cd71fe ("drm: Add writeback connector type")
>>> Assisted-by: LLM
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/gpu/drm/drm_connector.c     |  3 +++
>>>    drivers/gpu/drm/drm_crtc_internal.h |  3 +++
>>>    drivers/gpu/drm/drm_writeback.c     | 30 +++++++++++++++++++++++-------
>>>    3 files changed, 29 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>> index 893716a9e489..1c2bef5e0636 100644
>>> --- a/drivers/gpu/drm/drm_connector.c
>>> +++ b/drivers/gpu/drm/drm_connector.c
>>> @@ -929,6 +929,9 @@ void drm_connector_cleanup(struct drm_connector *connector)
>>>    	if (connector->hdmi.scdc_work_initialized)
>>>    		cancel_delayed_work_sync(&connector->hdmi.scdc_work);
>>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
>>> +		drm_writeback_connector_cleanup(connector);
>>> +
>> Could this be done via a new connector->funcs->cleanup() vfunc or something?
>> Set that inside the writeback init path and it is guaranteed to then only be
>> called for objects that explicitly requested it. That would be more robust
>> and would keep sashiko happy. It would also keep a writeback connector
>> specific declaration out of the crtc_internal header.
> I'd rather not do it. These are the generic properties of every
> writeback connector. The answer to Sahiko would be that yes, currently
> all DRM_MODE_CONNECTOR_WRITEBACK use drm_writeback_connector. Once that
> is changed for the Intel driver, the condition might/would change here.
Except for the KUNIT selftests at least. I'm not sure about the HDMI 
issues but Sashiko is correct that some of the tests hack up partial 
structures and I can reproduce a bunch of the AMD ones hitting 
out-of-bounds accesses with the 'connector_type' based clean up. Locally 
hacking it to just add an extra bool that is only set in the full init 
path fixes the issue. Using a vfunc cleanup member would be nicer than 
having a specific writeback flag ontop of the connector type. The other 
option is to re-work all the selftests to allocate full writeback 
connector objects in the first place. Again, having an explicitly set 
vfunc would fix all those and just be more robust in general.

Note, it's not just the audio selftests that go boom. E.g. 
dm_test_crtc_set_crc_source_dprx_no_connector, 
dm_test_dmub_hpd_callback_unknown_type_match and 
dm_test_register_hpd_handlers_valid all fail. I've only tried the AMD 
ones at the moment, I'm not able to run the VC4 tests.

Note further, there are a lot of unrelated failures in the AMD selftests 
at the moment :(. I had to fix a bunch of other issues to get a clean 
run! Will post some patches shortly.

Regarding i915/Xe, I have updated those patch sets to run on your new 
baseline and I have the IGTs passing. At least, as well as they did with 
the prior versions. So no particular concerns from there.

John.

