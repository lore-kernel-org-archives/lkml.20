Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE79A79DA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057583; cv=none; b=DmhIaMJWwUTQlBzApkGmX545KHkrio1+srA2kVPGVKAe+mh5w62ua8xVB3UR1EtXDskzB3dpIJx3Ds1S68KiIgOGgLGV98QFVoCw2JwQUtii2Q8p1d7jOvg/qdKCZzuPWuWMyyEo0PQzUcRuWscosSfz+Us0ElhEe44v/6NP/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057583; c=relaxed/simple;
	bh=MB7wRyd9nEMi7bowtSgpsc7+CUROFpqA+7dAvbWzMYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDhtpJaT1htkjJAqP21/2V2YQ3GV3706avlq64o7A9TsSaQad0hwIkMdzMcLDxNCPlF2ZUXqxrK9O77G2VafP176iK3BcaxnoaNHg5xndMQ2u5MMVPf7lKrBJsNhmJBmFzfsUx216n8DfV3QH7WKh/xh+ektTqejBO/79nNA9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMCxqifH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMCxqifH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso9105e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789057580; x=1789662380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0smL/d6QKu04fRHQtGBAAZuzGVVYkDUilTOApT5q0GE=;
        b=BMCxqifH4+sByJFC1avp2ASNSW89jeSx3GoXLXLMtZ8JdXjDPPcDAwi54Oe7BhurG2
         PqVxclmBTl5hIpRKbgPhTGPklEaat0znOgfjES+KVI4xPB9qUAKrE+Px7NvykzP23lBK
         2HdZbguVtOaiykcA3kUOkeFKpUTyMKW5eWUWR5LHA3zCx+xJs2CFW1wXDo1L4LLFyi3m
         /27NRXDKHDPjrIVbtp6zIZ4n0Z+BAXlMm/lciMpe/M4syyZau0u74LyQRkzUcNlde2kb
         o5EOG+CDP9FA1vR/HELqiQ2uW9DsMAykDhAwhtLLh6yqOytZSpmrU9WjTVRgyQFfH0HJ
         sRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057580; x=1789662380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0smL/d6QKu04fRHQtGBAAZuzGVVYkDUilTOApT5q0GE=;
        b=HgfVHORYUE64hroz2uKIKTbEHbVEZeoukRG6DfAYVrvhSoEMIkRICzaQoHiIhgm2JR
         ahmBb+Ialrtu93OHZvVapUBINGm6gDUVzHb1CZUmX9NjartfA5NlZn47dXKcxRlUVqvS
         oZXy4errL+INCkcdPlBvyOj3e1SoIG0F5VdKzSFMA2nllL9eU+z9h2c3I3VFEkw89hvE
         jeSzAgKlnHay6it8Pz2qSBf3ZLrszMww4bxv14EUtLUFhKMxKR9Pkud5QgNfQE6N7QYY
         NDJSuKlGIDN63Vww2rTu9/Nszgo3CBDM+HJEdHasZoZOgcpN2lwH+5V9AScDLL4re1w9
         cGKw==
X-Forwarded-Encrypted: i=1; AKwUvBybakTsZ+2GfsIUS6Afsqb6qcQPoPqK8w4zHwi0eJd2j8boa7uoaj3jOqN0wOyS+OcGrjAM4gAcEOfJ5KQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mn6YQnCVFIE5RHMwxAc0GpQhxxh/JI9sNp1PuX+aqoCukLfh1A
	7wgsmklZ+uOgpCA97eG4Kwh+Ovt/T+ZubeZb3iyUZpwAv+44qcu1rQyT
X-Gm-Gg: AYBFou2doCarCLpwanIcZRe1W5/XB8ZfifK3M42waAXvmbP7ON7loUKjPc6gECoClSY
	8tHnN3/yuHpTogtDHADv7EYUoNTV4xIQx+7K3I5PyuoZWPUNZMPu7Lyq1A1tgcdRcpXRO01pWbM
	reep3IiyMG/o16d2Gye21uzEzJpWUKkA2ApUL72jhVdEjE373lRGgI5mxfC+TCTplartdXnxNw6
	qLv+xC5ggSkMEroWNenw2gYyw5F9XGXF2KyrcM1nZbKPucmGBe+WehVA2qSScjFnKRoxrb7Vvd3
	x8pWb/eGtBuM+a70Jsm5IH1He4k1llAVbTRsCKEgBfrlsdfPaXoRZV98QL1MxT3D+vuhHAJzxYc
	RbviSvZkZXHZt8/RwNVi4UTo4S+pYYLOviXDJ5Qf/3IQKWqULNXiw0mFYrmPkUkL0kOI/oeQ1J1
	aSw4uCIXPDH8m3Ibg0+hvDYAPnmueATiFe3/TW7AdCfzsiamerlD+0E9iBF5BeuTo81zyv83zyq
	X9sCu9d3oEKySwlVrrr9h4DMBSS61gKBNnH+gfBohAeXEhWh01W1IxM6aVbCpGNq/p5hcWCCFdm
	w2au
X-Received: by 2002:a05:600c:c494:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49d010c3969mr322629105e9.0.1789057579609;
        Thu, 10 Sep 2026 09:26:19 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B91460038D48F9767ABDC4A.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:38d4:8f97:67ab:dc4a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60946249sm7275965e9.0.2026.09.10.09.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:26:19 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Alexey Charkov <alchark@flipper.net>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH] drm/connector: Cache out-of-band hotplug events
Date: Thu, 10 Sep 2026 18:25:52 +0200
Message-ID: <20260910162553.6262-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
References: <20260821-drm-connector-oob-hotplug-cache-v1-1-e92e146fdc7b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

On 8/21/26 16:55, Sebastian Reichel wrote:
> When the USB-C state machine finished negotiating DP AltMode before the
> DRM device has been probed, the out-of-band hotplug events fired to
> early and are lost. Without replugging the display or reloading the
> USB-C driver, the DRM driver assumes nothing is plugged.

This is the boot race I reported in [1], and the patch fixes it here.

Orange Pi 5 Plus (RK3588), a Samsung monitor on USB-C DisplayPort Alt
Mode behind fusb302, on drm-misc-next plus the dw-dp and Rockchip USBDP
PHY series.  The same tree also carries my pending vop2 AXI clock patch
and the pending dw-hdmi-qp audio guard; without those two the board
does not survive the boot for reasons unrelated to this patch.

Without the patch (one boot on that tree, two more on my daily kernel)
the DP connector reads "disconnected" from the moment dw-dp binds until
a boot-time service of mine unbinds and rebinds fusb302 some 45-70 s
later; only then does the link come up.

With the patch the display comes up on its own: the same service,
running 40 s after dw-dp bound, finds the connector already "connected"
and does nothing.  No warnings over the session.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus, USB-C DP Alt Mode

[1] https://lore.kernel.org/all/20260811211534.8618-1-royalnet026@gmail.com/

Thanks,
Igor
