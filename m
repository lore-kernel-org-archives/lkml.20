Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4523C197A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510582; cv=none; b=S9NAJ6mYTAlJv1PVSX3LEhFGcnpfP+iKIVg2N883ffnPt7HpbO3JLpSbDPGr0SAjhQdgIcKgUQZQOl8R19K2yFmPTF5ZxWHQMq4/uOgCRdDrMffeHz+AKJDJkFVbwIn32bdBIqkIBVLYaLPRVDRxusho9FmSzgXKf9vTVwBsiWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510582; c=relaxed/simple;
	bh=Z+V9unX6aBDFJuuH1gIxp0fin+EUilc5XMo2mblqJ30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2EkTAzJzKCIPu1CzhMOZao/+KrS0CAY0D6wbfALqa3IpzAJgqvZrdVra4aer+8zN1x6KdnMcsSKigBQFQ+ZSsjYch1hGcnHqlQ+fIf5HzV+o3C7Fxo7MzCvx+2kudIn1oPwTO2G5qtxi1pX77rZl0olU0s9N+HQjv3GXoYVR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eygImu1h; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eygImu1h"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484399babcaso213029f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510579; x=1791115379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+V9unX6aBDFJuuH1gIxp0fin+EUilc5XMo2mblqJ30=;
        b=eygImu1hdlEAduNQFCw3y92qkiLLtoq2AsigeZUWoJP7O2xhLiEoKIQOXpnxtoQdS8
         OBGYSwa7lIYUhE8g9TYfxBoRTqfZ/CjbRn+1ViTH1QWBwF29vba/pV1YyVU9VrCHrOEu
         1Y+QLyj+ImXoJi5HYXkssMEF1F5P8IW2eIFKTCmjshq2L6twsI103CSKgDeoGw6BqKDV
         7T/SdVny/diB/pfnOw2vyVPIryZS15XBqEI8kOVLFz7HrvbGIJ59u/1Jr4Lbaa5XpuJ9
         mff/pHhr0MKPxm31yu8SfGUIufruRds0onTko9Qfl5LSLlpO3RDuFVM9IcaSCmWYyR5B
         9R0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510579; x=1791115379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+V9unX6aBDFJuuH1gIxp0fin+EUilc5XMo2mblqJ30=;
        b=A8eXSPj/f6e6y7hyOTWBkKNmnvMgRZdY6ziLMc4ESEh+Lq5n+RlyHgq7l1YcKDUqFa
         zdJSpwF3fnaGFXT5IAZFQ2TG4An+hrr09WSGNWjbCWyHdLt3abDU8ZnJ4jPp87W3FDIF
         GHZ8Dw7cB7yj/vK4+eegDfp+T48ooX7bygqZoifn+kY8GcoEy1iw/o21/forBmpLwMct
         2FpHJkeWq2ggjIBS/zFSf1N+Weslmtgjex3s9I+RYtedscFbt9f65TeB4qouJeAlI1WV
         6Xsq/NsPoPxJtpi/rVrw26tprj3e5zlMlhBoid7pAu+6F8fQFcUsQk9LrzPuJmCU87Wv
         hIVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcWnGkrRQJ+ouR5YciK26GKUWvup0JJ7B5ab1yEs5zNERr8Sq9RC6i4AaE3I3wiNsbI1w2E/hBnRjKL4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYITpQV3Wj7IIVxN4ACjlPXIcXPp3oneD5s1tpqbyrWzc8Dg7Zp1
	+9lIIXbXFxPNGdIQX0YJB6Dr6bSlujC/3XazjBoXs7yPxEUuyE21LSfe
X-Gm-Gg: AYBFou2qaYoz4pWArHZCeGIq5OyF6ZKpej2RwR0eBu+XaMxRudqKbEbp0KBQHZJacon
	Uu51FLcWZ3+l/xUSlOPDSH1n8i6YKjPvnxZRnygkQ0B14aF0OH/mPqSstFYa1alJgw1RvVKmtA9
	yaOzKA6qE5ZQnXSVzZcSneSQOaTu2U2b1n3cCj5GAAy5FLxSbQQfw90EZhaUEVRClDOGmC9o6me
	HtLZiPAVBXrVZXoVON7SchFYcFY8bufPL04y5cwu42/g9ljkbX4wSJNYNHJ2fU1xvxmJHMV+OpK
	+3ytwA1oRvAt3E67AlVohRsFNeX8zCc2kC6gyKqyQUv87DGvRdKVLyeO8H19NM5TS+YDdqQApQZ
	3ZSj2hQIKgLfoy8/1Lp5p0t/zkHvbma/y138IwIOzAjLM2Acs8qrdwigiOTjghn32JbUEDu/iEk
	fKP9uv0dOFdztfKnRPOlxX9cAzO20eBcvVRj4CtJed/BNBQcX9RsiiRY6WhVwbBJxRuJi5pb1Xp
	3Vicw7tAYiTGPzsG9JI0sBQHfTzyCpEBdeZQWuQcbogMYgVoZt/EJIeXN+DjwVUTFYEnIOUo+9U
	Hk0=
X-Received: by 2002:a05:6000:184f:b0:487:fa3:7630 with SMTP id ffacd0b85a97d-4887acd8844mr13892557f8f.6.1790510579294;
        Sun, 27 Sep 2026 05:02:59 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B89A9009A7C72AB6C68D3F9.dsl.pool.telekom.hu. [2001:4c4e:1b89:a900:9a7c:72ab:6c68:d3f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm19548417f8f.34.2026.09.27.05.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:02:58 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v16 6/6] usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
Date: Sun, 27 Sep 2026 14:02:47 +0200
Message-ID: <20260927120247.9807-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-6-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com> <20260924-b4-rockchip-dwc3-rockchip-glue-v16-6-126a2e9133c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

I tested gadget mode on the Orange Pi 5 Plus with the same v16
kernel as in my reply to the cover letter. The board was an ACM
gadget (configfs) on fc000000.usb, with the Type-C port set to
port_type=sink for the test, connected with a USB-C to USB-C cable
to a USB4 port of an x86 host (Ubuntu 24.04, kernel
7.0.0-30-generic).

dwc3 forbids runtime PM by default, and with power/control left at
"on" the controller never suspends, so the case from the commit
message does not come up. For the test I set power/control to
"auto", unplugged the cable, waited until runtime_status was
"suspended" (about 6 s after the unplug; autosuspend_delay_ms is
5000), then plugged it back in. I did this 12 times, 2 of them with
the connector flipped. Each time the controller resumed and the
host enumerated the gadget again at SuperSpeed; where my script
timed it, the UDC was "configured" 0.9-1.5 s after the Type-C
partner appeared. Apart from the message mentioned below, neither
the board nor the host logged USB, Type-C or PHY warnings or errors.

On sashiko's question about the early return [1]: I have ftrace
output for 6 of the 12 cycles (the trace of the second run was
lost). usb_udc_vbus_handler() was called 12 times, once on each
unplug and once on each plug, always from dwc3_rockchip_set_role()
and never from dwc3_usb3_phy_notify(). The PHY notifier ran only
inside the runtime suspend and resume, twice each time, never while
the controller was suspended. In each PRE_RESET
pm_runtime_get_if_active() took no reference and the VBUS call was
not reached, so the early return does happen. On each plug the
resume was started by dwc3_gadget_pullup() from
usb_gadget_connect_locked(), after the VBUS update from the
pre_set_role hook, and the gadget reconnected.
About 50 us later a second resume request came from another worker;
from the code this looks like the pm_runtime_get_sync() in
__dwc3_set_mode(). I did not trace that function, so I cannot say
whether it alone would reconnect the gadget without this patch.

Not tested: the board without this patch, data transfer (only
enumeration), sashiko's other three points, system suspend, and a
host with a dual-role port. On every unplug dwc3 logs "request ...
was not queued to ep1in", also with runtime PM forbidden; I did not
look into it.

In one of the 12 cycles my script first marked a failure: the
board's Ethernet link dropped while I handled the cables, and the
script checks the host over ssh. The host's kernel log shows the
gadget enumerated normally in that cycle.

An LLM assistant wrote the test script, analysed the logs and the
ftrace output and drafted this mail. I ran the test on the board
and did the cable pulls.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

[1] https://lore.kernel.org/all/20260924174014.366B21F000FF@smtp.kernel.org/

Igor
