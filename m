Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824161;
	b=JFo9N9J5SVENO3A0pXRCivXZmnSEBLcEpOSvHtQWjAi0wARGsskc7M6wd6A+R0eikt9T
	 5uL5TMrVhbdBOa8pgk7a3fd7AicJaTgMJ8jT25UCDqT0pCyWT638CgUjghBB69CgXuATh
	 pNYPBRljHoF7SNDJVBlpx9/NbLW57QNuSzD7AVHQ2y18hZddouqigjgBorvgZrF1+KPl6
	 niwgQJlzOP41v//cRfxlHIPWnBb+6XbEMxBb91BGeDhyFBOXjz0msFyasqCmSnY1R7qzF
	 LjiEGLkVq0x1H67lBrsT+xccltmxBBJvOlN5eYDBdzfvF4OT+Ucl0pyW8ciH7U6lamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824161;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=q4d263XXglI0iqpL8mpE7A6pZt/pDzsX4AunwdC2UEw=;
	b=JxXy0FPHYJKsqyS6s3kgnlR1s34NRXg8FXIOcQvqkH/x16RksHsUG+2NfOQJdUYP3GBI
	 cn+MkvPP5FpJiqkxQzXZOY8WlTdbTxeHEngRpj8uM1rqOqEt9zL+4afUK2bQkCueGzzWX
	 NvgZkvyApIiNTIO72C02aMj/p0IMdCekoJcJH7wWnSp9LcNsOqw7wuzatTglZLzk4j65+
	 ufPxeC8bo3jPLs9Autgl2THP2jyYxdHOCGNjF6xITHeODdQQPu6hsQzeyl319HmJxmlBi
	 EP5YM2AWehEm5nWcso9wmVyIeEv0aQOPfTl6ZtCJKbG153/pxNGflwaJ1kMYPSkbblQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V+eIapUd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90511606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V+eIapUd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75AA91F000C4;
	Mon, 16 Nov 2026 10:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794824161;
	bh=q4d263XXglI0iqpL8mpE7A6pZt/pDzsX4AunwdC2UEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V+eIapUdbPOyQuRXEyb2TCgUjwso8Fj7arBAuXeX0Vxe4e2SbEGr2YSDg+ahcU7aT
	 IhTga7Kzf9bKk2f1vHkMM+9+0Gn1U9Dr5vxyZvN+cMjO2QoCF58aLWrYQioFILxedM
	 0FSrn+TFRzFI9Ctlx68zaLBDcgBc6MRmMp92j4zblNKGspBk9NIo4pFulJrrfMRD14
	 SmZIW4OWKZYOA7ituF5ZgkYtsWvWXRXAqygSAgqqbZV9nRJ/5zlJ3RrULyH0zwaxFz
	 4LOQXx1k3LU4zZLnVt7h+yH2BRCqW+OvloeTmSBdhbrWCz8gib7FkXj2YWAwgSO3l2
	 w4Zd5Ci1oguPw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniels@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	=?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
	=?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Simon Ser <contact@emersion.fr>,
	Victoria Brekenfeld <victoria@system76.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Daniel Stone <daniel@fooishbar.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	freedreno@lists.freedesktop.org,
	Oarora Etimis <oaroraetimis@gmail.com>
Subject: Re: (subset) [PATCH v10 0/9] drm: Add DRM_MODE_ATOMIC_RESET flag
Date: Mon, 16 Nov 2026 11:15:56 +0100
Message-ID: <179482414984.70626.579928766697794355.b4-ty@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
References: <20261112-drm-reset-state-flag-v10-0-cefaa1ed056d@kernel.org>
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

On Thu, 12 Nov 2026 17:31:49 +0100, Maxime Ripard wrote:
> Userspace currently has no atomic way to bring a display pipeline back
> to a pristine state. A compositor that wants to start from a known
> baseline must explicitly set every property on every KMS object to its
> default value, which requires tracking which properties exist and what
> their defaults are. This is fragile and must be updated every time a
> new property is added to the kernel.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[1/9] drm/amd/display: Fix planes atomic_create_state implementation
      commit: 02d46912debff86b107519f9557557b3f9c13df4

Thanks!
Maxime
