Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7F345CC9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510561; cv=none; b=FSOuCKxwi/abHfFcvLQLS6dqDwvgk9BMCRYUUtVYTX6NQDvJoMHSRG2BEu726vZVLKvDx1Z+KnkoSOd0N3xEeGlZPazZMWglwEYYtdYTSm0ze22ATM+d9SUOoXyayx6RYSjbnNIK8eV/24uDHmNJUlDLsIvQQuOqWyDnPGx/44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510561; c=relaxed/simple;
	bh=Z9paiwYidXUiqezPHTXQfCz85MHxLktOuWNdhVGUFAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ND1A3UwiKqST5KqrT0wal9Ia43xfzpWKil0sBy3esE/9BFnPQWLA7gszJmHh30Srcxw9AlJerGiiVCB63MXBVrHxdVvjKh9Fv6sXvlORHuFBE9sf/uCaM8UvjSUZkfDBQmojRXiOALEq/cQAUwUxfnJwqnyQFQZ5YZ4oN5Ztk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPg4cJSF; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPg4cJSF"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484399babcaso213004f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510558; x=1791115358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01429hMeoTXrkDg6gix/EcLJWWvM5W0z994eSFJkqXY=;
        b=ZPg4cJSFoAdxoDJNYLMrL5o4NDZGspi31Ah7F4mI1DWPRxj9DEPS9BcZwEXxcClWPc
         2OJ7TjxEORAM2pvsBKC0LrjH1rg4Korl/jhc6CFVRtOA+9wDyd1VvMkfwMr/dvYF4CHc
         hkkGUX0cp5aLdFUXsO5dDNywOQFs7iIQfj7KvqMrSkc7VgKnp+qkJHAIijrQKJVoMYSV
         epVLNsSjq+4pS5CSoEsihfx0Ok4RzluVUpFDDrNtKzmysf2RNHy3bQym8l7tiZuyysFx
         Z+CJNVGgMKkCS5TGuD93CdBg7t2D0qjHgLaHcFrp1jymh1mW6Lt/LOLVYCYbfpw1aLyf
         HsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510558; x=1791115358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=01429hMeoTXrkDg6gix/EcLJWWvM5W0z994eSFJkqXY=;
        b=pwBSJA8iBc0aPeGfKI1S2Vl8M9zYiABpjOVaUPuJaMyGQwSA0yi9bKcbj8HoJOpk+J
         03QHYJTn869nVylYYUhmw4UYMOZD10ur1Hmj0cYlLgZWR7l51NvAH9V5+SyiajGciP0d
         1FRnttkVdfiFLXMFiajwxWcOa2FRCMFc4F9SfwhkvjDV0CxwjmDEBKQbe6/w287S0HRX
         9bGdVQu2im+KX7hxYmVF10ONVasD5uo0A5dd7/0nQX+Mv8p5RePzHopkM6p3zkHhXeDw
         LKcU9rik3mCJK/mn85r7ZZVkyFcOZthY2GJoOPBhBpJ2ck3BXWB986xG4D/CS/Zr9VGl
         q/Yg==
X-Forwarded-Encrypted: i=1; AKwUvByHTY1bt1tHng37giZWdxoqYcsPGfQw73ZrkzkmKhd1Njdwx0Q0q8lUn3/P4nL/T7sGu2LFmasPmOKkkwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeAVPVcJ4LNNT8jO/ScTbFcEF/CjIA2xQ5y4Nu2LApQQRKpzdE
	KDn6m1sKeqchNT64oskiRk0vu/LGXHZjaSgGhneIHinzxs1ux8VClmGy
X-Gm-Gg: AYBFou144EjGLWdyRbtAgfoS+rjZwxv0FfgDEwtQeULL6T4s9lURo6XMRaIPwA08Jt/
	pph9+vMo0XzLwf4NPIv7Bxjl3pNJZcKAy2nmPpx/N38kEYEP+H0ZxBIHAQL4RVkmHx//O7Lj+52
	Rpetp82UWkkhG7vb/XelvQ9tt6CgaZFhnJvwB0dmUZfz1swo1++1uBhm/pLvMMihhhSdq/dsD2J
	GkUyeEjKavJZsQLWKPoQQBWEnlWkkHdR8szloTFM3mr6v+kfkgjdbCYj+MWKYEGlcc+2h6UzF/L
	cW71coVoCUmBCyR690DOis0QxkMG1I1OsK5bwPUD0ywka3Qt3+wSJt0U8oBporpeDIpHyEOlefn
	aY7pFQ835mWhpiKus/3p7PUbSpVbnybZ7juC4ohFjSDVmwWPgrT53/vjT+pzwwR4h6e5MxDbcFO
	eWKKymELBJvhLUCCkyZiuF/9FHpR+KNGDN5/IjOQAWsXMlYoRJ0kSxhyXUJaGDsMSooq2BMz5qu
	uK2ZT53xZFxBC0BrJwNiDPj/B6xrQ/4XY0rWHcQnuZVFApcoQWiOhuLTUSkk9EQ54iQfiXT504g
	imo=
X-Received: by 2002:a05:6000:481e:b0:485:8df0:dca with SMTP id ffacd0b85a97d-4887abb09d2mr14521475f8f.3.1790510558071;
        Sun, 27 Sep 2026 05:02:38 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B89A9009A7C72AB6C68D3F9.dsl.pool.telekom.hu. [2001:4c4e:1b89:a900:9a7c:72ab:6c68:d3f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm19655495f8f.26.2026.09.27.05.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:02:37 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v16 0/6] usb: dwc3: introduce Rockchip glue driver
Date: Sun, 27 Sep 2026 14:02:29 +0200
Message-ID: <20260927120229.9664-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sebastian,

My tags on 1/6-4/6 are from v14. Since then 2/6 changed its PM ops
(v15 and v16) and 4/6 gained the two tracepoint exports, so I re-ran
my tests on v16. The tags still stand, and 5/6 plus the Kconfig line
in 6/6 fix the build failure I reported on v15 5/5 (posted as v1)
[1].

I tested on an Orange Pi 5 Plus with the same base and the same
local DT as my v14 report [2] (rockchip-devel at ea51774c5c42,
7.2-rc7). The v14 glue patches were replaced by v16 2/6, 4/6, 5/6
and 6/6; 1/6 and 3/6 have the same patch-id as in v14, so they
stayed. The glue is built in, with PM and USB_GADGET enabled.

The sink is different this time: a Dell 2408WFP at 1920x1200 on a
USB-C to DP cable, not the Epico converter into the Samsung 4K120
from [2]. This cable also has a GsCooLink chip (VID 0x3679), and its
DPCD (1.2, HBR2 x4) is newer than the 2009 monitor, so the link
partner is most likely that chip, not the monitor.

I ran the same test on my daily kernel (v14 glue, plus a locally
patched tcpm module) and on the v16 kernel. Both gave the same
result:
- dwc3-rockchip bound to fc000000.usb and fc400000.usb
- DP alt mode active (svid ff01), link trained at HBR2 x4
- cable unplug/replug, and replug with the connector flipped
  (port0 orientation changed in sysfs): DP-1 connected again about
  2 s after each replug
- the xHCI on fc000000.usb went away on each unplug and came back on
  each replug, and the cable's billboard device enumerated again
- no messages from dwc3, dwc3-rockchip or the usbdp PHY

With this config, none of the v14 to v16 changes alter what runs on
the board. So this run confirms v16 on hardware, but it cannot tell
v16 from v14.

Build test on v7.3-rc1, arm64 allnoconfig plus a fragment, gcc 13.3.
Host-only dwc3 with USB_GADGET unset now builds, with the glue built
in and as a module. USB_GADGET=m with the glue built in can no
longer be selected. Without the two tracepoint exports in 4/6, the
v14 modpost error comes back, so they are still needed. All builds
that passed had no warnings. They all had PM_SLEEP disabled (PM
itself cannot be, ARCH_ROCKCHIP selects it), so they also built the
new PM ops in 2/6 without sleep support.

Gadget mode (6/6) I tested separately; the results and my tag are
in my reply to 6/6. Not tested: system suspend/resume, a 4K/HDR sink
on USB-C this time, and USB devices in host mode on the USB-C port
other than the cable's own billboard. 5/6 was only build-tested. I
am not adding any tags to 1/6-5/6 here.

An LLM assistant built the v16 test kernel (reverting the three
changed v14 glue commits and applying v16), wrote and ran the build
test, wrote the board test script, compared the logs and drafted
this mail. I ran the board test and did the cable pulls and flips.

[1] https://lore.kernel.org/all/20260918091032.15593-1-royalnet026@gmail.com/
[2] https://lore.kernel.org/all/20260815121608.64818-1-royalnet026@gmail.com/

Igor
