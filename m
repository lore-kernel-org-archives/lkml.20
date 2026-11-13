Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575580;
	b=TE3yHurhfcOYOQf93AxAkV73EgvGisLR+0qgbfTt+5aKO0N87QGl/bLLAJd4fbVuAa4B
	 QNKON0J8hD6F8EL17F+QD2ML/QKygAdqcVRJDP4gQvHcOtqwZmoGT9Mwr9Dsc7uC2Gwx/
	 n+RO1VHjAvoB2+toDm7sWm8nQBJM8T/Bh0CteX4i1s6D6gOhoHsbehvepyLB+8PqH2I3G
	 U27Ty5KSm2RnolHa9l6q4VSBiZnq53VwZ2EHRO1kzQ/MBxyRegG+WBWpB2IpGJQJ/rKHD
	 0XEtucYcC2yXYtCyfkJ2g9+vB+wSrLyJ5j1aoKqKxhabj2O0Qj5YVM80FyK8Nly/xdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fMa45R+tCxZf7NGiJEXnK9MPuFreV0vlZ1o7pYt/ZYA=;
	b=JCGFtuYj44ge8kRRIu7uUap4Uum55bOVJUOd6QgG4nCSIEu9qwe/hJfYqaKWjJqafzNF
	 c4aDsNpG3EdnMQlZQIN7IBCKnOH5bY2liBgsz3vkUMNFADPhBd9pAeL5MSq1p3HcAZXJX
	 fYbVC1z0fSRTl0aAZzEk43Hd9CrDr9M+tM/mmYi9lykXksGWK0M2b2TLMqmIEGeIbc8I4
	 J5gUDBdMyMxB3tFxzd0Cp7H+ZaVfBONeNeJtDRCmfmsW5xT5TGMea3p1nrbreHCO+/uqM
	 c63SXUKIUazWU9qSEmbfdVk4Z9Je1E1s9iMUaGM04MnPZAmojuAfRsSsOn1iG2VZECQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNapqwHj;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C00060A2609
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C00060A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JNapqwHj
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso1261788a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575579; x=1795180379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMa45R+tCxZf7NGiJEXnK9MPuFreV0vlZ1o7pYt/ZYA=;
        b=JNapqwHj3W5sAp8Xirg5Nd0c3KM/w3kzKquBADzPxLVsKC/QSntmtFzHM1WsqejZDd
         aWYGyxzDBCku73G3bhX3qoYohuPZup8yHYIhQhJPEAn/+YokQrUuBc0SctRP4DF4k8X2
         XtDnk3e5mM1ApHMS1gHuTLLC7vX062j/cqjCXpssKqJcPUCFpqv9q3Jnets5peQW8Qok
         5TcT2gO2yibbCqEySwxI8FuSkMF/fS7XV1KjUkymVW6Geb8+PuDmQKG+HmcjV139nc2M
         9meXf7EZUh+yIBiBsgPv7vfe1dZ7RmLCjBxlP0yf6Vjqz3wNBIkCmLtPHB8wvkEK4m/R
         Gw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575579; x=1795180379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMa45R+tCxZf7NGiJEXnK9MPuFreV0vlZ1o7pYt/ZYA=;
        b=tfOlmJolhxrfOWnavLtI+1oILhmoxtLcgUowPHRfcyBFwKp8HsSOQ7zgX5MIWidok1
         w0YB5AMBRWCf51tz1Exd4XB672lbXa+H2S8yU6TtbWQmx6ZxXz2dv19P75MB8viBv3oh
         trOl7O9TyonkMwBKpMK3QqDppoMQb0I7yNb7ItGErt7BPATjxpi01feXlvaYSV69o1H7
         AaL/4AkKOoJMLDj3B8Wwm3Zo+hAz/WKo9nsk+hyf39A+UEULRn9gsjHTturOcbxLFybj
         77kzzXAm86uzIth9HrElh2qXWAv2ftSdJq/eRoI8m1nCF0L+LFVUor4ga3Rv5vAq2n57
         3pvQ==
X-Forwarded-Encrypted: i=1; AL+hErFU62khPqw9KlQO5l7bm9GY4fCp0x5zsXZXUZnApt4E0FceFwQYHs5Sfs6uReyRoKKWLZAdeYrS7vwa3YU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pj02FSRVP//ydbOo53uFEbeRTAkeIRQl9WQ5pH6fUTWgbh9RX
	ct91dAv/hA3zkEOJVOc3gKbezVZaRHUHaQ1SpArrpVe8ozavqrqcAHRQ
X-Gm-Gg: AYBFou1ahb7kF7riOPHauKYdG9SZbBwakR9pC4xWnJ8bRfmwes+J9PeSoVP+IxJTupV
	59AsfFCWnIj3OU0wiyeqXtjvcJiZhab7C1dt+jyk+aQzm6n9yjYNDC5oZq3uhA4sykCqNcx5gnr
	4a8i7QVGi+la8NN0qZapfH/A4wRI9GQTSQnCr6WkYOgn1dChKpZXmFN+h7Xxv9Q+aqe9iEDDZ5b
	HX7OESDknKeO+U6lLzJc9r1aSlX5FO1d1Hr8mNLBWP71zm4lqHZOTY6xV9h7h+NBZRsvXB+B45/
	9cBP3Yt0Tn4sdpTVfKJKYEupQUikP5SQ0ZpacSbQTMOtv3NlJ+i0mYmii8Ax+hBvp1feHP/6JiW
	SBKAtaDDwIQfCCWNskEtaS8sX7E/js01clIoaOy9LRvzn3KLle0mNpAGU0qlBv8u3I/pZ4andrN
	si8OYSfFexEOaannZ0976AAZ3nZ0SKOtjlNicAQGj42/QfpunMJ+dq+1x7ZvVGnrndg66QAyffu
	DsEXJ1BEwXM/cBgF8R6VfwZ5VUusSEeP5g+8ZStCqWHNUsjU7znw7Q58pvU2D/vkA8FVZEB6Y45
	BeYWmD63EBYoKSWOnwYlBwM9APH36S2ZIRhAX7c=
X-Received: by 2002:a17:90b:2642:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b1b0ba0a60mr1992696a91.27.1794575579407;
        Fri, 13 Nov 2026 05:12:59 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm4931622a91.11.2026.11.13.05.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:12:58 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: damon.ding@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Fri, 13 Nov 2026 21:12:48 +0800
Message-ID: <20261113131248.2804840-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <385a67f0-e5cd-4dba-9b9c-5b766462c6c0@rock-chips.com>
References: <385a67f0-e5cd-4dba-9b9c-5b766462c6c0@rock-chips.com>
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

Hi Damon,

> You are right, this is really a valid concern.
>
> If CONFIG_GENERIC_PHY is disabled, the old code could still proceed and
> keep the driver probing, while the new version would return an error
> directly.

-ENOSYS can only come from the !CONFIG_GENERIC_PHY stubs in
include/linux/phy/phy.h; the real implementation in drivers/phy/phy-core.c
never returns it. And the stub for the optional variant returns NULL, not
-ENOSYS:

    static inline struct phy *devm_phy_optional_get(struct device *dev,
                                                    const char *string)
    {
            return NULL;
    }

So with CONFIG_GENERIC_PHY disabled the PHY is still treated as absent
(NULL), exactly as the old -ENOSYS branch did. With CONFIG_GENERIC_PHY
enabled, -ENOSYS cannot occur, devm_phy_optional_get() turns -ENODEV into
NULL, and any other error is still propagated - same as the open-coded
check.

> It should be better to keep the -ENOSYS handling to preserve the
> original behavior.

Overall the behaviour is unchanged in both configurations, so no separate
handling is needed.

Best regards,
Jun Yan
