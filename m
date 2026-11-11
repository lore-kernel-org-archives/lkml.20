Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794376610;
	b=l869XwMlmchaYzy7cCgh84gBxTBLHxUKHvAxd2LxJbYlfJdVq5z3x8pT4BrrOQNOTtxa
	 iDfH7efllZbhBKGtthDPboB7lgqmXu8mW3KGqLwghc2pwp28g/F6sT+UW4qTBv9Ga0YfA
	 RTvrKxzRSA+3E/PphdzEE2HEDoEmQ9xBqgx9s8YZ5zc++2CCbe27QRU5HW/tf2LaEiDiJ
	 e+YS+CqHHEyvXZe47S8jYfP4yUsiZskjrTnkWXR/jB5r6ARVd08/5fMZs1YYOHIjQhDww
	 hKG/FTWRd6Ov3dzTM6boIn4F27KFaZJ7Obwx74sjkgXyup0smmP6nQ/B5liPYYpfuCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VMys8McNjnWrl5YPrlDdndx3edldCiGJ31ibT5uzN+8=;
	b=vurOB9iEdIZv0a7AWzepb94cQp3GO4P4Pm+zdM6AdQLszODGGtjLqfTQYL0NEAKd1nxh
	 xGZvg7DVVEc1RE3me1mUVV3nwmfYanGHiT+Nw2UeZnYkSvCaTm0vcZYejo4Dt0TdQsI6f
	 6peKO/aTPsIXRIFzIn/PuMODrzgDDrhld/vxMOtKC5N6sVS3y7EiZqPAUBmAYG9g5YO/P
	 OaAgLXdavQFS/49+CfWInhHoxrHxK2K/vU/DflqGQpsFFYVp/L51MkFHwbNnlYaabBrK0
	 iG5nGL95tJ3LDX2qiHBsYdBjVoJLfkX6vWss3UlT3aZOh7onC9LrxUoSRgMngaHZohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBOXRgdj;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE28606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE28606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EBOXRgdj
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2131719a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376609; x=1794981409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMys8McNjnWrl5YPrlDdndx3edldCiGJ31ibT5uzN+8=;
        b=EBOXRgdj64jVioki41kXMa8iPyDDnNbvmbuRYDycw2WGk0xUwNCa99nZe40gqj22bP
         9zmCauJUUmVprBFZHWKJJ2dCZKZ9afrDkqRgUoODnpJG9+IDJ3ookVxLo6T6rvhN3F9L
         eJmAnYb8acScgTZur6wL2dfjEAD6ifDirP3gfZ4idc+S1XONmo4hkXB4w6a8cKvrHd3k
         kbPuSjDunLDLpnCTF08Eab9TKKO/6OehHyWyZIhks8fp2Nrkd4+MK8llEHqd1sXOrk9L
         mdZ6Tw+IGZVHDbjUiUGtvg6ZsbJIp39gvoYS8z58Xqa+jzppIvGgsoYxNzrYCgDIgHmb
         pfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376609; x=1794981409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMys8McNjnWrl5YPrlDdndx3edldCiGJ31ibT5uzN+8=;
        b=01VMlD5UKjDcA3YQSufNoRwMUYtlmTlmWKTfrszQG3lik5M263TiiBXcD3n2ZWYjTt
         bMqIOd1D0/+iZoProPj5+A2UCN6U3j7i3Mjz5DhTxbGMIsQ4Xmfj9tpMRBmumFAcWldK
         ZC7grnH/LxnhQ8APjiMQN/lQ48S/Cb2d3yTLH6Janx9LXkFzDvZzOvvV5Rr1kiSMF8ey
         PXbvcqoRqI4G3DjB2mHJdrbDovQNiQwXyi3DmiAnxqn+fakS9dgM/L7W/fgRq/5B4dai
         RF3GRAnAE1gfaLjp/irdsUabGfrFW7y1x8Ew7O62UlRX7QimV4qYipN5/wofq6NWkDSC
         o89A==
X-Forwarded-Encrypted: i=1; AL+hErE6UzfLMBjJQsPBmFRlrHsBTnaOqaHCVmdSFzh5fJgtf8MxYtG61/cDccCekZ0bg++YYeKjf0ByJ2aDlIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yo/seCex7x8loGK/3ndE8f9Pqqg5fMjimujN7wrgnpq/2t95p
	tlWpY1gd7Ycj0iNb8QslysADFEGauiYJfkIh7B2diZLNNUoTvAAbNsko
X-Gm-Gg: AYBFou0qKgCOrHSROQ/9WQ3zWqg+qN2/uFwwxivx5E8Ng0Q03v9oNId+im3ZfFQi2lk
	M7TC+2I8HTGeIKoT0mDHCJenxqXbydxGHjhA9hw/ZsgXPQRMojxQBvlElq3aizVQ+6n1W38Z/Ud
	10Tyt6CoEq/J2kH0zTOkeWucBck9w+Jj3LBiCy/zFKH4RUe0Hct1u+lR8glQd5vjXwKropuJYmK
	AVxkH6pJfehzih5NY2/2s1dZIYlVF2AdL+bcN6wFRtPkxCOGIF9hjjbkhAhTM1v2l82hbeYDn2f
	KI9ZS+GYdKaTDiiDd9foL/8CuG9sa2omVYowm0cWQxd7gDyfsuqn+28jUUVnEdrO5KJPilGIhNg
	hGvCn6KDcWYcg7H1fLEcux4iTFgM2rxcP9063uhGmyg3bFPZCnXOFwAyXkIiD1EJFfDHiD85dp1
	bnnllq5e1JEschBOU2JhC6DUahkBZtX8oURFxaELFZm53Tu5EC+PzXWKVzLIZMqahNJdRCODqMc
	Lbe/fMZuuAeFheph5v9UHe+Jztz2OvVhTbGPPwm2q5AdZH8NnVj9MGnt5t99LTrrpLzUXbnO8Wc
	p1ImKlFsoOxzQ+HI2PqYyXQrKoY=
X-Received: by 2002:a17:90b:17c8:b0:3ac:3e42:60a2 with SMTP id 98e67ed59e1d1-3b182edc9d1mr1477647a91.33.1794376609372;
        Tue, 10 Nov 2026 21:56:49 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b18142fa70sm2449126a91.16.2026.11.10.21.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 21:56:48 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] usb: dwc2: Add USB DRD support on CV1800 Series SoC
Date: Wed, 11 Nov 2026 13:56:15 +0800
Message-ID: <20261111055628.183891-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The current DRD implementation of DRD will cause a interrupt flow on
CV1800 Series SoC. It has two reasons:
1. The DRD does not sync the phy mode when change the controller mode,
   it is a violation of the DRD as it does not rely on a OTG phy.
2. The CV1800 is entered with a Session End Detected interrupt, but the
   DRD code has no change on it, so the controller will enter the
   interrupt storm.

This patch add fixes for these two problem, and I have tested this on
a Huashan PI board (it has a CV1812H SoC).

Note: This patches set does not resolve all the problems, as
      usb_add_hcd() will override the role set by dwc2, but I am not
      sure whether it should change skip_phy_initialization of hcd.
      So I kept it as it is and users still needs to set the role
      in the userspace as "role-switch-default-mode" in devicetree
      takes no effect.

Changed from v1:
- https://lore.kernel.org/linux-usb/20261110070627.217946-1-inochiama@gmail.com
1. the DTS patch is dropped and will be sent separately.
patch 2:
1. fix wrong is_host check in dwc2_drd_init()
2. remove unnecessary role check before setting phy mode in
   dwc2_drd_role_sw_set()


Inochi Amaoto (3):
  usb: dwc2: gadget: honor pullup requests in core_connect
  usb: dwc2: drd: Sync the generic PHY mode with role requests
  usb: dwc2: Add USB DRD support on CV1800 series SoC

 drivers/usb/dwc2/core.h     |  5 ++-
 drivers/usb/dwc2/drd.c      | 75 ++++++++++++++++++++++++++++---------
 drivers/usb/dwc2/gadget.c   |  3 +-
 drivers/usb/dwc2/params.c   |  1 +
 drivers/usb/dwc2/platform.c |  4 +-
 5 files changed, 68 insertions(+), 20 deletions(-)

--
2.56.0

