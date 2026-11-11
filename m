Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390444;
	b=zIQf42HaR51LWmVXkDFRC0b5CrGHvwBiOFSyXshgjeIHWlT5SHrL4zckrydNFFpuryRq
	 hFLtTM1+Q3QPq68wm0tcoRWlb/YKNgBXqmOzGfwrP4Bjn3dJJxN0mWDw7uLQFZIwVpjVV
	 9Wze9FY6ZY4c0mbwBvOmQ9LJ4SgVtNbk0DCA9KPvshKlQHubYqHgHq3apH21Nwhe9NgwN
	 1km0WC+wfCd/D2VdNIfAHkbMyHwIpIcJMZ7jlmkqgXKL9FOI20H2Dxz1EqOKmGvUtM1xn
	 yV27L44/a/+6TyNp4JRXKwvVqfgNUUn9OOIFoxkAe1f6a/mXCDxb3ea3fSe2AlgWeyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390444;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lpOElBQeqwiB40uyFwOtgDzyu7V1V4FWBprLtS7Fa1w=;
	b=Exxw6gjb2FoTeYYOAH6jvHuwI9OTNWqbJQ3e50SacEuS51SOLpmz3saEKN0igsTQbzGF
	 Lwc/Xv52IdfmhHZ7zkUCnn8jNZ3bbHh96qhjryH4RnKaOBJ55NSAdmcZbIZueNZFFCQPN
	 mqZm2zLBHCd1W9A4CNxphz9TR8k2p4COMGfQhUCLuuipS8TVIz77mRiOMxqaIvKFCSmGX
	 bkbipGJ3p3W9yK8VYjDewJn1Y0iyaYMX3HrfbPQ/tzx7qBohWNvTvTlfQgnQhJZAI6V7l
	 +/pSgGR2sb+tw9P3X9TmxeMIbxSyswwPf0ZuKcxv/njHLnM+8VTmK7pXCeRMZ8P6FXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cCnP0DpO;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FEC606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FEC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cCnP0DpO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cCnP0DpO/Haoism1z+bfki46kVkU+0jS9FcHfg58+FpghWRZQq2cS/Ln/7+7DoNBqNXXlABt5jXrc
	 hErT90wBa2yxITWPZogy3yZl7Kxj2utG8rK4geJEm3s2q3OYEiXWVcOQ7oSdHG/EVnM8so/6dYqyRW
	 7Ew5e5F4dB52NXdg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af439a8be4-77af2;
	Wed, 11 Nov 2026 17:47:21 +0800 (CST)
X-RM-TRANSID:2ee46af439a8be4-77af2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af439a6c55-d7dfd;
	Wed, 11 Nov 2026 17:47:21 +0800 (CST)
X-RM-TRANSID:2ee76af439a6c55-d7dfd
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: dri-devel@lists.freedesktop.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: analogix_dp: Drop dead error check for analogix_dp_init_analog_func()
Date: Wed, 11 Nov 2026 17:47:17 +0800
Message-ID: <20261111094719.1655-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <sashiko-outbox-208563@kernel.org>
References: <sashiko-outbox-208563@kernel.org>
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

thanks for the review.  You are right, an account handle is not a
proper name for the Developer's Certificate of Origin.  v3 uses
"Xiangwu Lai" for the author and the Signed-off-by trailer; it
follows shortly.

Best regards,
Xiangwu Lai


