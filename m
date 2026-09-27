Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5EE2FD1B3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790489415; cv=none; b=uyvHHn8lOjOxWbquorY2DvH9zJgs4DCh8Sdm7oWQAl5+vdlqdVqAQB89EIzATVCa7UiorT3iE8E/45yZT277oEiisWg8++cBhZSyZgDFzjCkAkGvm0L/Ul7CyEV4u3p5Q8F4yIhyClgSEIzyt9ulUTqdCPj/oFfjiWNefTZ2lFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790489415; c=relaxed/simple;
	bh=nVrs/8T1e/0c1wb35JoPd1Jnzl7Me3+fEMjClG+05+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8F7kMR9gBuM7P/yaYWnTL/tZLm/d5ixaWVIjH+UyfwZfQ5TRrXuswQPpW7F2l3nfMt0J5ZwQX+kx47BIFBVv+3YAkL3J69ns0yR5emGjYp/0qvd0DJzqMRCoTp1pWXibyeBRYS0Bt+BZNJ+yVH8XzkpFL3D7/oBAqXNN2GJbSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZMW1p3T; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZMW1p3T"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so969319a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 23:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790489413; x=1791094213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=330RjSxESUmMZyuNK1veh17/1thhiAzCXFHq2ujk6QA=;
        b=cZMW1p3T5mZ3yG1UNgAq+oSAxZ58YFngSjVpN+9SdHOAGYgqtvtSW5+xrfiWLqjRTl
         MxDa1JnnOLgdXjxEchYr1EcP6+pa+IqSidWUth1sUfIiBOMLvjwiJRvxE7H96iOEPtTR
         atF1LU+r/IZLxdzIJZnGo+YvHwd6Udx3JhAgFAgYjE+rRtgbB5zIm9LojwbT42MVWzC8
         B7kHivflbENd7UZB4Rldperai2dxmvejDjjFMmDasx+ZC15FJJ9XfIBjZq67sf6JMAtJ
         XWJ96Og+5FIKWzHqLEOGCDLhj7husGvNz2y2CbiVZaaWrvaUkcwXVSHSiadqaQs6yy1D
         TZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790489413; x=1791094213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=330RjSxESUmMZyuNK1veh17/1thhiAzCXFHq2ujk6QA=;
        b=JSpAyBxRp2//jsGW7yqu8my4diMOCtOmQjzi+ulHOQrt066R4V9XLCn0r/Vpx/pydR
         mrR1uWURGjSjG044rfTJDAyS4QsNuL094LJhVS2WAKRA9X4tUTgJEDz25JLTJTbPnbm5
         mkOiOdc88J3vCNljvSFc4za3UiXan1tVKZGKxl5jwbPEOPLXJPeCynGl7EckvhWahdU4
         hitZ0xZoloBxPQcYjDuPK1SwJGYeyJjogf2Sp+zoLdEp98rKgHiB6w2QELIuHIMLyd6V
         RKZJNCjdIYSDrlrewvtqTHvagnG24sERStBJHbN4HRz7+cQ9jaxIDL1EO6yX/vTpW4/u
         fa/w==
X-Forwarded-Encrypted: i=1; AKwUvBxftuIxdDxpJmGi9oJeHT9iAJfafpaF4tgj0oSn0Q3s3+dIbkKKBVrC+YH3PMyecstU1iFlGO0qlHBIk+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWsUsHWY1O63V9PYYf2oLoTsH7qsIpYDtetjlRJEoQIA3S/gGF
	cNL+rNanZ98bGi6YqMOBvsuJuP56SRtIIJsf9tW66l3/L6P995lLmdKV
X-Gm-Gg: AYBFou3use49OEeuUzmCoMQ4Nf6DY5H60rPmEX4w9eQ73uOB0e6jGrNM7u575lsTNHY
	0DNzk7vDiepSiRI4Ca3zkpR5nE5gQr/BGFX0yte7s2Tf8e84WlNTSDp8N/D9idxYaDmW9ar4tNc
	bNsORQc2uuA4ZHWV9g42/j4z3xovjXwtKqanOsujitPfIgPRdDZQkx6wbovOIv9RwggzESk5fXG
	HiZzUEuYa0S4R2hmfYltpBhH1Ata+S7084X8pMeOWhFzwokPMzqV+frjeJ9n9wT0N5NRlJlhWXa
	fsQb/k+WRj7S++DGHefRllYiu0rpqIvev92wiPY4UShO88c/kpQMhg1ypzDYPNUMZ2m6SHhqrRi
	lFCIQKYZR0PegsQu6gFrPfp3qFXP39HyFxbIjuX+d6ZEQQY/hMkItNWWVLfX+e2PoHiXYAi3Qd/
	pwdS4F2xpvw4HS0cvV4n8A8tuZzFRFMWg3VxASSQKx6hl/E1yGdGex+CqsJ/KdBix7v1fkXxbQY
	W20+EBfHPB6eJZb
X-Received: by 2002:a17:90b:3b4a:b0:3a0:a912:e764 with SMTP id 98e67ed59e1d1-3a0a912eb3cmr7323135a91.31.1790489413260;
        Sat, 26 Sep 2026 23:10:13 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:3a0c:2ea9:4ab7:bd1b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9356f48sm13557768a91.6.2026.09.26.23.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:10:12 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] media: dvb-usb-v2: set active_fe before the demux goes live
Date: Sun, 27 Sep 2026 13:10:08 +0700
Message-ID: <20260927061008.47318-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927044547.26979-1-ngocthang2710.1999@gmail.com>
References: <20260927044547.26979-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dvb_usbv2_adapter_dvb_init() registers the demux devices before
dvb_usbv2_adapter_frontend_init() runs. Only the latter set
adap->active_fe to -1, so until then it holds the kzalloc'ed 0 while
adap->fe[0] is still NULL.

A process that opens the demux and starts a filter in that window, which
lasts as long as frontend_attach() takes, gets past the active_fe == -1
check in dvb_usb_start_feed() and passes the NULL adap->fe[0] to
streaming_ctrl() (or get_stream_config()). mxl111sf_ep6_streaming_ctrl()
then dereferences it:

  Oops: general protection fault, probably for non-canonical address
  0xdffffc0000000061
  KASAN: null-ptr-deref in range [0x0000000000000308-0x000000000000030f]
  RIP: 0010:mxl111sf_ep6_streaming_ctrl+0x2e/0x2e0
   dvb_usb_start_feed+0x57a/0xc70
   dmx_ts_feed_start_filtering+0x129/0x220
   dvb_dmxdev_filter_start+0x434/0x10d0
   dvb_demux_do_ioctl+0x48b/0x540

Initialise active_fe to -1 before the demux is registered so early
feeds fail with -EINVAL.

Reported-by: syzbot+c35815bad054e6ad396e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c35815bad054e6ad396e
Fixes: ad6b9e517b39 ("[media] dvb_usb_v2: move from dvb-usb to dvb-usb-v2")
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index bd86d250433d..557451b541e6 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -637,7 +637,6 @@ static int dvb_usbv2_adapter_frontend_init(struct dvb_usb_adapter *adap)
 	dev_dbg(&d->udev->dev, "%s: adap=%d\n", __func__, adap->id);
 
 	memset(adap->fe, 0, sizeof(adap->fe));
-	adap->active_fe = -1;
 
 	if (d->props->frontend_attach) {
 		ret = d->props->frontend_attach(adap);
@@ -795,6 +794,9 @@ static int dvb_usbv2_adapter_init(struct dvb_usb_device *d)
 			adap->max_feed_count = adap->props->pid_filter_count;
 		}
 
+		/* demux is live before frontends attach: no feed until then */
+		adap->active_fe = -1;
+
 		ret = dvb_usbv2_adapter_stream_init(adap);
 		if (ret)
 			goto err;
-- 
2.43.0

