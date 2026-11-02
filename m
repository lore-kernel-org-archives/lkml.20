Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593945;
	b=QQW6a4vXbXGG5E7yegrTT3W+HOIpjcPCuazfguNIuqQg37/RvYKu5XxViTBsY2WHBY8O
	 GGdd1VwIP1pn5X0gX5o9cY3mz1d+nCF0WBIi9Pe051BZf/U6yqZce1A4w0nYo7lbLonxn
	 FmY5Pjml4qyjdN5shKfJhy/G3HQvuogt34k62jSIcSkN5NViB8LoK4kxQqTpFhY4lg7T6
	 lrFgHmB9vJsg7BvoiPJavp2Lw1d8skj4jzNSUyoeJ+dNW3KF7raqZsvs6mtLgVo5Pgdlp
	 fOwzH24/uitcP8ZTFkd849N5yy3l6o8Ffopc8RRb+6qUr8iBKSQ1s1fqqDrfEBWyfsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5Bqd6rCNPSXxAR3I72cEucGZxSgqBsGLhAkb3kN5Zr4=;
	b=MwhiwsHvq5sELjiXjNXrwqA3g22n0/F8/MTRUvkG5ZBB0Otia+uEs6gq/UyC+qi+uIk6
	 tm9lSEGiav9kIuZJjo0w9jXvIZnsbRG/xByuT4THXaLYM3j3mfwcV0Qqz/T/q45K3YPxs
	 S5JrEhNAE1MFzDbQ3go6ik+n9VveskYmElkXONk4tgTOqI1gd1nyJ6jMCDKjWAR7yGIQA
	 bWKeWfccywkaqczIoBgwZToTKGHep2Vnt6114hjrYBBbGY8yaZQc2bSP8J2krqjVBsBQ7
	 8ZIydJkgWYFCruB+7vECqks6JvoI/Lk+PzSaDhsMsd4RMeyMS47s3R3U9gCqjiOavbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKf9irLL;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DB606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKf9irLL
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a18fc7a38so4218034eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593944; x=1794198744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Bqd6rCNPSXxAR3I72cEucGZxSgqBsGLhAkb3kN5Zr4=;
        b=UKf9irLLtru3nUzRMaqmpfFrcnMgif8Xrjzk0bbdLncu/2KFP5yHikqlEpUyTWZ5D7
         bNn5OXaJH3AzBoLOnvJvkxaWFSRTLdZBDxN+STas5Q0yFmAtvdc/IKGDuNO9bMP1XvOv
         Iqp34VX2/hyjwZwjMgHQ44uPRojRXjvcvQOn8XsmcMFBQj4RMJ3PX+yg1KAd5jiw9uz/
         IfaiL5yRINkWRD5dHpaKD/Pz4NNAtgPyTrDIAOvg3CHEgCw528gtgosAPJ4FtzbWdjs/
         gvESx1796Jy3Co/OybygueawxIpjcaHqbH5vysmtPVB/1xql4aKQbeSrjpp79V0+b0hj
         So9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593944; x=1794198744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Bqd6rCNPSXxAR3I72cEucGZxSgqBsGLhAkb3kN5Zr4=;
        b=iqN79g8VVZ/m8CfiWO+VCbjfdkjk/+46QXHP8eYoUWEE9ow5wMP7QeERvFEwUWrntO
         jPJqvtUepYL0rFN1CN06Z8zCFkXd/XPxwquMNEqT9AkJo2xx89QgcJXYAtum201MPNjL
         A6A5w4H8W/QcsruYCBBROhyQRDyU2ev289X+y7o0QqY7JaeDNbEB265CDHp97Wzr2rFL
         ad4X7jNL55Kgjl/MAr/PJ3ZO5MNB6fNANmnfF4B5amj3tojCSM2a6BhENJ5hx9GbWkSw
         z9IgNULCGur8nHY7DPnXgdo+EUpK71BON43XvRgA/X3D39e+XE/NVP2dePaB1hOIYpP5
         QstA==
X-Forwarded-Encrypted: i=1; AKwUvBxQuYVCNDGLPLsIDP4tq7fhJ/BtQG+Ue0y9yvkHOdB0ZhqUbBbw30COQqszaNOfk2Nb0u4DGNjag9iqwn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFNMkTzkeYAPlQ1+E4t+34PjijSwNPN6Exda8qHP6BMwftpe+9
	OMOSdwUmu/QgKoKb7ioVh6KntBokT/Te44H3Yd53qrIXUAY7yqRxLW+x
X-Gm-Gg: AYBFou3u8nl7Rb4Is+vSOyg586w3CvWTBYL0CDuwAjPRdqXzEDOBT+fB5b5BtidpK2Y
	MbM/8jxmxo6YwT40uCt0PcMRkheG11fV/eTCIscbHuSXsVtu5XK6rmXPPW1qGWAvxGUt6TgYHjf
	FBK4hMcR86+Jc+obnGWUiVJoW1AM+qr3+JHT0ectBxTHHQKr1Zdllqz+WFJSQ9gTIJnOmJ8zLIX
	ezUD8XBldt1W6Ws8Bpoqy6lXYpexoaBIjA3huY4JN1ECOjbKdk8EXELjOnAgxjA5ekUZLWoL4kS
	zawg6pjnA5O46d1r2fdlzho0gwynZ+x76SULkgScHI7bWf86ouqU0aVuy/CTeg7klYtCa9Gow0Q
	rYgitQERjA3Nxu9Pbqzl4j+TOZKWaH6qA1c3cgoDtq0J5TtE0U5LtWcPnoHFtg68sepFaBYyOd8
	sJT9/BUnI3E7uvVWl5InFKvhAsNXz5oJq6ZWDGd9+mC9M4q0e1inJAOVmeADbHKZMH2Edu/xChZ
	C1iVzHLugG7tEdXnZXQby2P17SYkmvYXXcfdqmJ8WQzcd9qrfHWFOKEwb3V4w9/sArKNCjtEnv2
	swUX2Dgtk918pGjTRy/8VuGSUINtnA++sCRwPqPJGSrgqYAChV8W4ZU+IkEV5zOtoenjHSpC525
	snMSIDp2zSGxUN7AzcQ0Ut1q2qsxtJzbZyaf5tt4=
X-Received: by 2002:a05:693c:41dc:10b0:351:2958:1740 with SMTP id 5a478bee46e88-36a42445a8amr14044282eec.37.1793593944389;
        Sun, 01 Nov 2026 20:32:24 -0800 (PST)
Received: from NB150512.ADVANTECH.CORP (118-163-147-185.hinet-ip.hinet.net. [118.163.147.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm38581063eec.26.2026.11.01.20.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:32:23 -0800 (PST)
From: Hsieh Hung-En <hungen3108@gmail.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	jesszhan0024@gmail.com
Cc: jagan@amarulasolutions.com,
	osama.abdelkader@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Hsieh Hung-En <hungen3108@gmail.com>
Subject: [PATCH v2 0/5] drm/panel: Use mipi_dsi_*_multi() in feiyang and rm68200
Date: Mon,  2 Nov 2026 12:32:10 +0800
Message-ID: <20261102043215.990351-1-hungen3108@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series converts the Feiyang FY07024DI26A30-D and Raydium RM68200
panel drivers to the MIPI DSI multi-context helpers, as suggested in
Documentation/gpu/todo.rst.

The first two patches fix pre-existing prepare() error paths that leave
regulators enabled on failure. The following two patches convert the
DCS helpers and initialization sequences, with command failures
propagated through the cleanup paths. The final patch normalizes the
RM68200 hexadecimal literals.

In RM68200, initialization errors were previously only logged, allowing
prepare() to succeed despite incomplete initialization. The conversion
now stops subsequent DCS transfers and returns the first error.
Thanks to Doug Anderson for reviewing v1 and confirming that this
fail-fast behavior is appropriate.

This series is independent of Osama Abdelkader's
"drm/panel: Use managed helpers in DSI panels" v7 series, which modifies
probe() and remove() rather than the panel callbacks and initialization
sequences.

Neither panel has been tested on hardware.

Changes in v2:
- 1/5 (new): Fix Feiyang prepare() error cleanup, as pointed out by Doug.
- 2/5 (new): Fix RM68200 prepare() error cleanup, addressing findings
  from Sashiko and Doug.
- 3/5 (v1 1/3): Replace the Feiyang initialization table with seven
  direct DCS _multi() calls and use the new error cleanup path.
- 4/5 (v1 2/3 + 3/3): Merge the RM68200 conversions, as suggested by
  Doug, and propagate initialization errors through prepare().
- 5/5 (new): Convert RM68200 hexadecimal literals to lowercase,
  following Doug's suggestion.

Validation:
- Each of the five commits was built individually on arm64 with W=1,
  without compiler warnings or errors.
- Checkpatch passed, except for the expected msleep(10)
  warning in the Feiyang error cleanup patch.
- Mechanically compared all 58 RM68200 initialization calls against
  v1, confirming unchanged command addresses, payloads, and ordering.
- Verified identical compiled code and data sections before and
  after the hexadecimal formatting change in patch 5/5.

v1: https://lore.kernel.org/all/20261014135028.1438841-1-hungen3108@gmail.com/

Hsieh Hung-En (5):
  drm/panel: feiyang-fy07024di26a30d: Fix prepare error cleanup
  drm/panel: raydium-rm68200: Fix prepare error cleanup
  drm/panel: feiyang-fy07024di26a30d: Use mipi_dsi_*_multi() functions
  drm/panel: raydium-rm68200: Use mipi_dsi_*_multi() functions
  drm/panel: raydium-rm68200: Use lowercase hex literals

 .../drm/panel/panel-feiyang-fy07024di26a30d.c |  81 ++---
 drivers/gpu/drm/panel/panel-raydium-rm68200.c | 285 ++++++++----------
 2 files changed, 179 insertions(+), 187 deletions(-)


base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

