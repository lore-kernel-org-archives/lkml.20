Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792916690;
	b=LuUhtgA7IEwtD/tRqzh1wrJugnef4iqDm9/ZEoxkfswT76K9xim3z1cszSXRl+WjWoNc
	 oBV0eeVjPF38c5q/Yr9KPY29E4kCUeT9XBfuTvt++SAamQLxfDiPEKe3tocclBlATUOld
	 qKreFn1iJ0MNNgAMit0r7I4SvaTmizAzPE+ZFPJDUTyGa3ZNmrL9DveWzN5AuHpIHZaJ4
	 xlBwp7lj+xDxeO3WGdTgTiB297BFtWXZl2JrgP+9hHVZR8Gzo9CphmpyHJ0IPwvImWKoL
	 j2GvIINx+Gn8OcUoX7SZSAD/GOoTAGzo2YBkH//NPzka0EYfvIP1V1/j8WWVq/x0mog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792916690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
	b=HdJUBAtDnTdnwSe5tzTUzpqGacUCWPKDS+3wCxuOQwpikdFZIkclIT3ZBKXgKV8ulc0X
	 6Hc1L31j5L3skyknGlm41G3hg1uCiV6sOsWfFrEoaRWegoa4qe+am4bgeE6oq1gwG6cur
	 vo7t4OjXaUO6e3ZNFYuFzRju+nnxdDxc4RMUjUUbyQ7vhentUPsNycN6U88cMurXYSuoN
	 bSIpMCUtgNwlbpP8XJfuQWQ8Vq6AGC7bltWTDQ6mR72dUpM6vx4Wx1ye1daUi9AVWi+H6
	 ummQl6+uYBw2HBIAl2b+haU2nTDeh5D/3lTcfuvdj2PcUMVQ5qJpgowIOAFPc1A1IUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=AEf3BGvx;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5824606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5824606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=AEf3BGvx
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E4D8D3F1AB
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792916685;
	bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=AEf3BGvxmWG/iHnSy6NsTeaRThtu7MbAixdVLOr5l7m6mfsBcyak9t45V0dPWKzms
	 0oTccDZ5gFsPFIKbFwy2vHsb3vuCyPDU6U/ZZpaX7zY9sJvDluGUCcRVGts4/eoz8b
	 2S3KdNeg4+k57ofdaYb43zT2r/T9OJPTdBfjLKOrWSKoibSgvD8SQjFkKhAlVh3AGJ
	 6HrJm1rVXbFnP8b+fwZR8WROlaPsZ23GFQySP//c+n1CSqbDR8T+WQX4eAc8tk8fqy
	 QwF4dCGviX4XoHsVW6nYYMWQXhuZdxIJq70b7o3vhiAWLic7cJA7ayyzaRCVW6P4kP
	 Upk68MMW/G/vyjUzpsayF25xFnrKi0gbdd3IvqgCV77XjH3TLxbn3ioUnq5DMsyvsf
	 BBkY5juvKDS03JsNca4CrLiMgS4n4Opeb8oWkyN07GKlUYTdIFI0bLLKoa6nsv6OwE
	 M5qCEIb3m7ti+fB7F8xRtvxI3QhB/g0e1rS5DBptmoVArMgoP/IArHfU/rblblRoeo
	 DL+M8cbmgvzW6T1Tdohvi18YSlfj7k5uxe10FX94zrUhUMb3dpcuKhrTF4biON06/U
	 XKCReqmq0J22sdG18Z9NDPkanC1V/yvsiSsQisMXEFdb86sXkkI1HH+AO2wu2wfeJu
	 NAaL9juCTMYHmI48sVYwaKW0=
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so10104091eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792916684; x=1793521484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RWPUVAjdb3F1t8/E4Di9FGAQf/lla3oj1eazW4iQLc=;
        b=opeIM4V3rUQpOvoIVwqNY3haKJmcPD9Cwd2MtjwOqOM6Lhwbaa4cEO1TXdXAl9txb6
         aDnYlzyKqRBhOOtCNWB1TdWVf1mPvis4V27QKi4pJ4VSMN33jk9a8ZYRh3xxUKNz8LFb
         LVVcKIdMMgkHwlSr6SdhwajLGN5L2Fn4VSqHp/bApkmnkG2Z4wudu2SCfyxHang9BkBn
         fC7i0ialXeXOVR5indSCs/V+j5rQgy4XeqAVflyV60n7avoPgswYb0QLMe0L19MvbZdI
         FYj9QcvPIik7U5xabIdlhJeG5R8jccYMaS/oEtUBOiQI2HKNPgfjmX5UhaJT/BqdLAKa
         60JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoox50gBWXaYQQGpeRmjEH551yYr1hlhrk9IgKkDLH9p2wpugBaknae1KKL1Nny/e7oQL3FBt55Flqw60=@vger.kernel.org
X-Gm-Message-State: AFq9FYK60cBxLdKYsc0O/3SnLc95nkh+uE40JQguH2zCnPYVo4Y7rUEf
	x5LM5z8RTFTNi4sY+zNhB2GXz2AhGXeSK32sX40t+Ef0irorp0ELQHXETCdwd9vGzNddOuFMQIK
	ksvQMvj+fQG/koshtLZGa53a9XGNZz/R8BeoHfIgJg4iR51tMhJ8BnmBSF06ta3tbqRmZ44M55t
	SEt/DxWg==
X-Gm-Gg: AYBFou3OQF872zB4F2avnE5gsk8FonOvSiAv5lAOlRAT25/7B8yziqtO4Q2jyarrx3L
	A9qQOAlUhPvIEyqiKasiszepY1d3d731r6s4Wa8cheK6Ff3x1yoZynVDCGapZVQ8ZuBYGii7Loy
	JNTkzuX9OrxHVhE90junIAZAon3KsBuYDLqDnEKQe9r0V7F4MA2l1K/Mug0sUjWazfK8ehjvBX2
	TuxJHZ8VX3oj7PXtcJPz7FMOs0Sj0zCJskrvVpZyJ3VlT2k4sF1CuEuSEO944gxH5bfQ2DohWAW
	RLmjPvbN/pY6AfiI91YAwIR0eVX8Ftay4gYdL8D4pPeTczZvUMuJ13s3ETPkHiFvJkgYpJFCe2l
	e8pSB/gJa4v0mFQ79+ScUIyfh8qYFz/HzoGQS45AkGDmMtRz530pZ1rQPS7eFSq75l45emgE=
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907897eec.5.1792916683838;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a05:7301:f2b:b0:35d:f3cb:ede with SMTP id 5a478bee46e88-369e836aeeamr5907869eec.5.1792916683321;
        Sun, 25 Oct 2026 01:24:43 -0700 (PDT)
Received: from resolute-linux.tail872496.ts.net (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm10301143eec.4.2026.10.25.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:24:42 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: Register the media device only once
Date: Sun, 25 Oct 2026 08:24:18 +0000
Message-ID: <20261025082419.199021-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
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

The v4l2-async framework calls the notifier .complete() operation every
time the last missing subdev gets bound. This happens again each time a
remote subdev is unbound and bound again, for instance when the sensor
driver is unbound and rebound through sysfs.

mxc_isi_async_notifier_complete() calls media_device_register()
unconditionally. Each call allocates and registers a new media devnode
and overwrites mdev->devnode, so every rebind creates an additional
/dev/mediaN for the same media device, and leaks the previous devnode
and its minor number. As media_device_unregister() only unregisters
the most recent devnode, the older ones also stay registered after the
ISI is removed, and ioctls on them dereference the freed media_device.

On an i.MX93 board with an AP1302 ISP, every unbind/bind cycle of the
AP1302 driver adds one /dev/mediaN: after three binds, /dev/media0,
/dev/media1 and /dev/media2 all expose the same media graph.

Register the media device only if it isn't registered yet. Keep the
v4l2_device_register_subdev_nodes() call unconditional, as it has to
create the device nodes of the rebound subdevs, and it already skips
the subdevs that have one.

The issue was found while debugging an unbind crash in the AP1302
driver of the NXP BSP kernel. An AI coding assistant helped to find
it, and wrote this fix and its changelog.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
---
Tested on an i.MX93 FRDM board running the NXP BSP kernel
(lf-6.18.20-2.0.0), whose mxc_isi_async_notifier_complete() is identical
to mainline, with the AP1302 driver from the same BSP plus a local fix
that makes it possible to unbind it:

- Without this patch, three unbind/bind cycles of the AP1302 driver
  left /dev/media0, /dev/media1 and /dev/media2.
- With this patch, after each of three unbind/bind cycles only
  /dev/media0 exists, and media-ctl -p on it shows the rebound AP1302
  and sensor entities. No kernel warnings.

Not tested: the ISI removal path, where the stale devnodes would be
dereferenced. Build-tested on top of 330517c63aa9 with W=1, no new
warnings; sparse was not run.

 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..82a03742405d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -90,6 +90,10 @@ static int mxc_isi_async_notifier_complete(struct v4l2_async_notifier *notifier)
 		return ret;
 	}
 
+	/* .complete() is called again every time a subdev gets rebound. */
+	if (media_devnode_is_registered(isi->media_dev.devnode))
+		return 0;
+
 	return media_device_register(&isi->media_dev);
 }
 

base-commit: 330517c63aa9b48227b6ab45f01003effac77ae4
-- 
2.53.0

