Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384091;
	b=VB2YYy96W4h5hoQIJr2+aWI9gfi8zIDk+KrVsJHDMwokJGsVSAdc5MIcQt7iXmeHM0QV
	 IAzSP3pggcqR6t1snbRqNaQ+f/4rTDOHEpRXdbtuW1ZhRW7v3uXHVLpnRhMlwtNaYJxRl
	 9fe5PmSWdjdKvjiggzdgoMXFZNcjnY5ZV283CEabV65Bf3MAZhBAFKfrCCjdqyH6c2AIQ
	 TCKEFgz1yYgqBrYeQpqyIE73SKCR1K6n1N81NlEc4/l++yCXj32iYf9998VQhBO5kHMNK
	 /jGZiLllBGFcPGWmM8UOJ6uMNzklWbuhACtjbqdfM3SSqLJvo3Nzwsd4mdtvbynPMUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384091;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o9g+Y5PprFwrlSPnNxUYwyLCvEhXHvtLo8jRHRhCC68=;
	b=azgjwc7QrySoTFzwgHvpD5YZsk9vQ5pIvoDT2dSMxqWdHssXqxzZ3XHMREY4TSCGE0tU
	 aMDrVHZho4JYZhJKtr6hCxKWiFOK+EUp+CkUfHzIKuRNu+Uwppd7Iq+28dWcRijUjeE5a
	 n+rHD3y2PBrH9zaVrncl35p6vJpebmUdABngwio78CL1ZokZCxdSGXDY8ktI16snvgVsI
	 6b8Je/Rbs81mG273Ug/mCHLtJG+PP+v4GzSEi7RhqhMZctlEDCEt7zbH/l/iBwqcnonO0
	 Qcgr2M25tqFC0EUGejcXASOaTde2vfJVXg+8BMd5GY0t55S5i6JCeWXElULqadUjILQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jsaBElm0;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3390B606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3390B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jsaBElm0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jsaBElm0mzVd15WRo/O1k6Ga+oXtdF8Q5f0I+ZP/ENzP/IxI7sGb0vDeiFsgq11zDZzPCwwCOZD2P
	 mKBpQjXseT7yBrkXca8fNANwc/F3hHgPZN1AC28A2sDprqYdXgcl+T7kyVcfC3nn2M0RbQ/Pwl6WNU
	 hKK05HYHa274jeSY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af420d1162-76007;
	Wed, 11 Nov 2026 16:01:28 +0800 (CST)
X-RM-TRANSID:2ee46af420d1162-76007
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af420d6f92-d43e4;
	Wed, 11 Nov 2026 16:01:28 +0800 (CST)
X-RM-TRANSID:2ee56af420d6f92-d43e4
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: dri-devel@lists.freedesktop.org
Cc: laixiangwu <laixiangwu@cmss.chinamobile.com>,
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
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix runtime PM refcount leak in set_bridge()
Date: Wed, 11 Nov 2026 16:01:25 +0800
Message-ID: <20261111080126.1549-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <sashiko-outbox-190700@kernel.org>
References: <sashiko-outbox-190700@kernel.org>
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

From: laixiangwu <laixiangwu@cmss.chinamobile.com>

Hi,

thanks for the review.  You are right: since 917c8d192ba6ad
("drm/bridge: analogix_dp: don't wait for PLL lock too early") removed
the PLL lock polling loop, analogix_dp_init_analog_func() only
performs register writes and always returns 0, so the error check
this patch tried to fix is dead code and the leak it addressed cannot
actually happen.

Instead of keeping a fix for an unreachable path, v2 drops the dead
error check and makes the function void.

v2 follows shortly.

Best regards,
laixiangwu


