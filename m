Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883196;
	b=bbAxGPMl5e8yARkZMv5nDcuVYvaUuzU+9vDxy77X/lemuzXtbIE4bd10gIvlv6f053kW
	 YpCdbZlH4HqQC7ehE0lmPJt5tceGmT413b07vKhTXpJhFo4X7GPORdqry9BFQZFRn8gDi
	 hQqxk2LTVXfyOEYEPhX3CVeSq26Q9QpQPIUN2LNq3g1R6ekV3uuCJxm0Av7pb+f9Vexy5
	 ZvsapqXCD3o1rdlV0Y9sqgaauMge31u+/jaQSdSBsfz/uwway+YOm/PGR6359lrZPK3y8
	 PNV9xf612A6EMEK+GjjLCMMoU0RTKnKvxFHblAudl1fv0kysKY5J0kc5J1y9jgahfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=l5X1zhTt/mo79FT/cl05olacIHJU1uD7Qt4zdE13cqI=;
	b=QWW5j05veZAq1v9b9XtNgqB361t2tN4BEUJLmEwqhv1CLxcojN9yef6qY3rpdObHC4X9
	 WJ3pRKddgHdMI3Pf/MEUMosGZ5UECsS/7x5CerHuU5J9pfgkR0A4/Ad3p7KCCYw9Lnaie
	 F2KNaVSMqDU6jn9djbV9iUNepvO6cfz+Jy2aewIYZqposj949U4ofsiNI+0N9cIIo4A+m
	 qnXcF+Ly0RUSsOXBL9L+1DeKcSvk+3mWXGxqKzXaSz8rNOncXjypsYrDOej06h8gv7Ms+
	 /7n6ajZv0R91Uv2fv2kp5S3PV1xl2F+vCwC2xP0VHrZad/vcm9ipyRsK44uGiDlodPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="a/qIsEoI";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64771606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64771606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a/qIsEoI
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c418e215671so246870766b.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883194; x=1793487994; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5X1zhTt/mo79FT/cl05olacIHJU1uD7Qt4zdE13cqI=;
        b=a/qIsEoIJ7JXd7dDRfKIL8boCPjx4/MXqK1bE26QZaFCzqI+Rdxqpp5jXFOSzVoolc
         v1zInRtKr9gTdubOUayPsUa8EJEENGSfm/QJ658WblAxdzVHz6IR5+Y/xMIUovw8LP32
         2N33OQaEcr9CODQSkmjNa0MU4vKwhesNS056Iw/GDxNcsoD06HhJ0ndiqAbchNfbgEzz
         keKwlOTRZaEyIU2PbyOxEsaZu52y+vk1YK1OdzGEc+Vj/NR5KxnLiO95355/5QjEjKWv
         c/9nz4/uF5GK1Ie5KxMEiNnVeo6hqhl+vaFTq94nAKXAjgkol8yoHxfUJpRw9P8y5Isb
         OH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883194; x=1793487994;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5X1zhTt/mo79FT/cl05olacIHJU1uD7Qt4zdE13cqI=;
        b=w1xfrM0cRgq1OuWKwnq6Lwukt8xAx460ko2ppl4ixNCSemSrS9S/wFAxEfPnm8mnmG
         q1olkf/ZNGDV/ysu1uuiTsznNhBB2wgTbRRVlz9h+1UF6PvEiXBk/7xNiBxgSamXhTP5
         gw/7wvzbHSgQyHn+xYPuRE2uVXAYvVE0XFv36YUe6v3HWPoxdjZGrzVhcpCQ4iN+x6jH
         STy3DLlt6OX1Hu6dprxDtYLgB6ArWyNslcYGQ+XYuWyDSAM+OebY54oDLr+mXbHiHNay
         CyyTpvGlN05uY+OyeVs0gZ9mskB9hKJDx9gxqnWzjwpvIxOKFpSfMq6Eaoqp+Efpkto2
         xydg==
X-Gm-Message-State: AFq9FYJpDeTepYQSTRYAzPuDCdaO9hkoucxBCBowDug8nhGxiifpNbGM
	8SBTlZUUgP2cAKHmXAtexQAeOEQ1jJQBUk4wezLxRFSMS0WQN8xSB5FZ
X-Gm-Gg: AYBFou0VfyI5M/mLbNmBIW6IPwEyBquByzjXZ+aKC2BkL+64KFx+Whwko8+yrFrysdX
	K7uR7uVB4m573H0wIjOfHbqdlWTd0FhAAhs+QHgj572xbdbq2OJjF2jJwpQ9vdWRobKqmtNmILs
	9e28PzqM/VPkqKYmqQkGRyJwNWX1vtiVJsxllG7dIWgNFzT2DqbCE+JoBomy7bPDNzlSXwoXANO
	+38oOiMGAlBBoUlwA/sZYLFdNkxwsuBY8Vu9sjwN+XGBC8gCtqNGQY+JqUI/KIENA5/nxOspBIn
	ZtK23617neouuEVecR0owdzbdQbT014K3H/CxDINcVh00WFf2S4jjQHr3wCV3yPaV8mPg0f5TjD
	UaEaVFtzVPti3+Z6Oof08RoeDmFQG5PbhiD15zIBpKqjwx0q2pfUtDcI40uS1FWO874rtFKMLpl
	cpZEy3no1Ve36xFYGFE8WO4MUu2Bm/Q6AS9RQdmnzftqAg6HSEak4PeBGMWCE9wgJY7cITDotkU
	3SaSBu+Eb9xAsngH7Em9qv1VNqsuS2bPFqbTqyS2EkFn9APfpTvDqA=
X-Received: by 2002:a17:907:160b:b0:c25:afb6:2d91 with SMTP id a640c23a62f3a-c46bdaa7283mr360392266b.2.1792883193723;
        Sat, 24 Oct 2026 16:06:33 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:6::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm141551566b.51.2026.10.24.16.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:06:33 -0700 (PDT)
From: Sam Crossley <samuelcrossley@gmail.com>
Subject: [PATCH RFC 0/2] netconsole: allow replaying the printk buffer on
 demand
Date: Sat, 24 Oct 2026 16:06:02 -0700
Message-Id: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANo53WoC/3WNsQqDMBQAfyW82ZRErdZMhUI/oGtxiPGpKZpIE
 qUi/nvRdu16HHcreHQaPQiygsNZe20NCMIjAqqTpkWqaxAEYhZnrIgzajAoazx1OPZyodPog0M
 5UH4pEBWrUpUXEBEYHTb6fZSf8LjfoPxCP1UvVGFv7lqnfbBuOf4zP+TfKv+7mjllFLNzzRKsk
 7Rh13aQuj8pO0C5bdsHENRCZ9UAAAA=
X-Change-ID: 20260926-netcons-replay-upstream-189eec0b4c79
To: Thomas Gleixner <tglx@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paolo Abeni <pabeni@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, Sam Crossley <samuelcrossley@gmail.com>
X-Mailer: b4 0.16-dev

leitao and tglx had discussed this at LPC, sending RFC as suggested
by Breno Leitao.

Netconsole only forwards records while an enabled target and its
transport are available. A target enabled after boot, or one that was
unreachable during a network outage, leaves a gap in the remote log that
cannot currently be recovered.

This adds a write-only "replay" attribute to the netconsole configfs
subsystem that rewinds the netconsole consoles so the retained ring is
re-sent. Patch 1 adds the printk helper; patch 2 is its only caller.

The replay is best effort. console_try_replay() uses console_trylock(),
so unrelated console activity can silently skip the replay.

Testing: verified in a VM and on a physical host (the latter rebased on
a 7.1 kernel) that records emitted before any target was enabled are
re-sent on trigger.

---
Sam Crossley (2):
      printk: add per-console replay helper
      netconsole: add configfs trigger to replay printk buffer

 Documentation/networking/netconsole.rst | 14 ++++++-
 drivers/net/netconsole.c                | 25 ++++++++++++
 include/linux/printk.h                  |  6 +++
 kernel/printk/printk.c                  | 67 ++++++++++++++++++++++++---------
 4 files changed, 94 insertions(+), 18 deletions(-)
---
base-commit: 00513fc3d6c467b1ef3c101a2943cb92de25c49a
change-id: 20260926-netcons-replay-upstream-189eec0b4c79

Best regards,
--  
Sam Crossley <samuelcrossley@gmail.com>

