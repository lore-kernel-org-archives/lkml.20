Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364493;
	b=j43oQSFNlyzAC4b9cxuyiIlH9nqtOOd1hbQ+8kOV7qfKlyfsJUtFukovOTZ4iwPuJghx
	 rQibfB8tijpKaJfqXrIDFVF09T9PeiPrS+z7rNYlxEPbu2c20c1jCYUnWHoLC4lh3ALZG
	 xwl86R5cGgz9ze7/aYuNHwBi36kNL4xpsQ5wCgKfV5fx9AkrE7t8TIb36roA9gGX/sLyN
	 KE2SJF6G1mSQ64wcz2g3EYX9MF2kdAGhF+F9Do3w71EZzFLLVrfdOhulqk9HjpRmrq5PB
	 fXCQ5zeql2/w5xHQzX/iEcKYgXOW0NKxFAmpk4dvn70ALz+ef4U0j2/NB7R0ae9KJiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364493;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=v9BSfNbOfry6oxbGa7ddf0k6wY17J8n9dywMSIRiq/U=;
	b=3doFMJwtPqZHlxDOmPfFPmEWTQm9gb8ZpRDVXau1dmn7YyLS23LSYXa67Wq0GXngFBim
	 YtUrGkw6eyS3AAahd+FC+Y16YDa/23PfkrfTak2UoVx7BfBXjwxTUwWXGgxltD9q1Vs+r
	 9ONHbEpzDwDzZcHlBuVXSDxdOx8kAHBW45i6XFv+d76BDYNhxYJ4U+P0J+fkOKPuB7aEU
	 LghOZ9zmesOYW3v8bSSDRkrF26+Iv1LQOdATf4A3xLHMd2FXgkut6XfaNQLKSTEBxlxC+
	 Lx3z6wRoSZtmn9/CXo4ZUzzqqgLj3Vr8FLPFlaSbsLXYmKtmVlEi9EgejwL+NFBKF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OOPTwjCQ;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19155606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19155606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OOPTwjCQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6IcMIDVurWSAy1aeWi3vXutHP4gnx0qWt96gTgko+d0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793364489; v=1; x=1793969289;
 b=OOPTwjCQ5xHfNUuTv3/KB+6DI5LZawqjGkh+ZRXatVQyBKp8pomd6YytIXJSxZMnhMwJ2jkt
 ah1+MFczTSIp5unSUBGu5/Mq75xGYuwZsVqDEdBNrdHqHlZo+Y4j5FWafc/F4kJfzjwWGn1RZUG
 QySkurSAj/XhMvcDvmuyMCenZop8j2jAc5pQc6uZQh3B5x2ME0uyPrleilZP5OMQYgSWGFpOMFV
 UZShAornLqUptk+RUESpOhzJsbGK7DZchHqEXlEzCI+eqMkDcuIkv6zHmxUSOcuMxFDcWYYpgYh
 2xh11GeH1l1tS3mg7rdO/FdeRgoTVX69KRDTrTkfUp1gw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7b69efa69f680fed;
	Fri, 30 Oct 2026 12:48:08 +0000
X-Mizu-Trace-ID: 7b69efa69f680fed
X-Migadu-Flow: FLOW_OUT
Date: Fri, 30 Oct 2026 20:48:05 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Tomasz Pakula <tomasz.pakula.oficjalny@gmail.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/connector: Fix HDMI VRR capability member
 documentation
Message-ID: <4b9b0f01c86a84b4666a1ba38a085c7b84e9a585.1793364084.git.wy@wyuan.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, when running 'make htmldocs', Sphinx complains:

WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')

Please take a look if I'm doing it correctly. Or if duplicated, please
ignore this.

Also for this file:

WARNING: ./include/drm/drm_connector.h:293 struct member 'cnmvrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 struct member 'cinema_vrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcinema_vrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cinema_vrr', 'cnmvrr')
WARNING: ./include/drm/drm_connector.h:293 struct member 'cnmvrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 struct member 'cinema_vrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcinema_vrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cinema_vrr', 'cnmvrr')

-- >8 --
From: Weijie Yuan <wy@wyuan.org>

The HDMI VRR capability comments name mcnmvrr and mcinema_vrr, but
the members are named cnmvrr and cinema_vrr. This causes kernel-doc
to report both missing and excess member descriptions.

Match the comment names to the existing members.

Fixes: 014da1db5e64 ("drm/edid: parse HDMI 2.1 gaming (ALLM/VRR) capabilities from HF-VSDB")
Signed-off-by: Weijie Yuan <wy@wyuan.org>
---

 include/drm/drm_connector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..bcdb402a7ede 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -265,10 +265,10 @@ struct drm_hdmi_vrr_cap {
 	/** @fva: flag for Fast VActive (Quick Frame Transport) support */
 	bool fva;
 
-	/** @mcnmvrr: flag for Negative M VRR support */
+	/** @cnmvrr: flag for Negative M VRR support */
 	bool cnmvrr;
 
-	/** @mcinema_vrr: flag for Cinema VRR support */
+	/** @cinema_vrr: flag for Cinema VRR support */
 	bool cinema_vrr;
 
 	/** @mdelta: flag for limited frame-to-frame compensation support */
-- 
2.56.0.438.g30c3f27cb8

