Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838317;
	b=xPwHdMIlC7QZr/uOx00qEaN4Yw4MlM0gu6mtR/Sl1G06pYdHKuPeXvyI7w41hxBoh1i9
	 wwHQlDP54oJrVx4dNTdibjSfVNHVnvcy0wW4AMRowaTbTRA9v7nojfS8nlX1NuVNhlaE/
	 FbFVlDD+2cCHAorQTFFWramuX6U5dgvoGnvqr6K8MWD6KPayAwP2uT9ocP6xVOgGjdYWL
	 bfZOkHWjGRBwazezXyiYSjaSojd2kbFaYPGh3kOGUjzi/vcYubnzeNg37hCR0fohz991l
	 +uuLBOaX9+KZIx4zRdraqPoFrNOKwYJKfCHbAVjONBOLjqeSuOnj2N+9BhsYknmar8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838317;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Mailer:
	 X-Originating-Client:X-Rspamd-Queue-Id;
	bh=27EBgBrbFFlASVSyVER9wm/IKSXbTEK4pD7f5ZtX4VY=;
	b=WbeQo5pHMmeklYm45GVwWYRLYA4pg9sjaIlBuBiOm37zqIwSOe2/0UQNGcAWeKK0WX9l
	 oSj6EkwuKLswzcmQ8yV1WMV9NSkNhzO0eHHJeDd5nsPUnEgNYtMvGGWQLQv6wiOAzEfxz
	 j06fqDkbaGTOshkGpYEpPpc48thT83riJ7oqCZbPDutIUk2XAMByaylVLcfFsrNm2GpSS
	 py7HJILARitCRT4oc+hLKGKfiTP/ggmQHf/o1zUui0Tz7VDjE5PsqSM4r9TrHtQWY8tu3
	 1V6wLM56mH9vrVyxkwHOF8TdSoeP1k5V4LP7WtHqzlaJ72I7QvUweRnc0F27wStQH2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=kshO+vjx;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F2606A323;
	Mon, 16 Nov 2026 14:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461F2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=kshO+vjx
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jSqYN2qY7zKnC6;
	Mon, 16 Nov 2026 15:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1794838312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27EBgBrbFFlASVSyVER9wm/IKSXbTEK4pD7f5ZtX4VY=;
	b=kshO+vjxICe+BZY4EzzCjo60xoca8VuT/dDDPzocZyijX1b+/XA9BYiqZHVoF1wEb3vSsA
	Jt+80MQjjeqasDBJD6cK0CkuC3bhcTZUmvVKogadGgpsHFYNcIPOswQJ4AofpQSweWRo+N
	UVXBCzTHP+PhS6b3TWaOvd9tSuTCCzYU4BQwXZLMmdKj+BSo2IRNWvjtkcYd0kLGR9TUwD
	aIfx1SDwoX5wBjLxw7v4/2+JxC6r3yntM+bEQR8x5f0CtkIZ8mlTvWyQ9hucG/LlThKxfY
	kAJiWh0FspnMoJksItWDRJlm07jATuiCROvcy6P8DIfop0OLt3Nmgqx04d1yKQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=hugo@hsal.es
Date: Mon, 16 Nov 2026 14:11:50 +0000 (WET)
From: Hugo Sales <hugo@hsal.es>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Ray Wu <ray.wu@amd.com>,
	Alex Hung <alex.hung@amd.com>,
	Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
	Ivan Lipski <ivan.lipski@amd.com>,
	Chenyu Chen <chen-yu.chen@amd.com>,
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <335815674.648716.1794838310991@app.mailbox.org>
In-Reply-To: <20261113-abm-sysfs-commit-v2-0-5808d17a7e89@hsal.es>
References: <20261113-abm-sysfs-commit-v2-0-5808d17a7e89@hsal.es>
Subject: Re: [PATCH v2 0/5] drm/amd/display: Commit panel_power_savings
 writes from the kernel
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.53.348
X-Originating-Client: open-xchange-appsuite
X-Rspamd-Queue-Id: 4jSqYN2qY7zKnC6

v3 is out: https://lore.kernel.org/r/20261116-abm-sysfs-commit-v3-0-7a3d84a5328e@hsal.es

It adds a patch 2. Without the forced modeset, a commit that only
changes the ABM level on a CRTC with VRR active carried only the primary
plane, and DC dropped an active overlay until the next flip. Sashiko
reported it on v2 and I reproduced it on my laptop. Patch 2 adds the
CRTC's planes when the level changes, and the overlay stays with it

Patch 3 now credits David Weber, who sent the same change in August,
and patch 5 says a compositor commit waits for the write instead of
failing with -EBUSY, as Chenyu pointed out

Chenyu, if this week's promotion run hasn't started yet, could you take
v3 instead of v2? "Leave self-refresh before an ABM level update" stays
at v2

Hugo
