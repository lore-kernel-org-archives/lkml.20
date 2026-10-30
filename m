Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793319302;
	b=VNij3Agq0/fraAUrK2YLj7ukrll/AhjtfMaZZ8NQD/W/5cyOiOSSjyyHJfvv+Kkh2T/Z
	 HnzbfhH+ePGJC+C/QLcItZHnOvzOoy/Ie4Jmh+BZU7lJ/tBYwdfKaUhIVKMQSpUZ9kB8q
	 gGBShZOPCiTPTYeZgxTHoHXGT30H1Y9ZgqAeFYz32akjm7u7DB2itFOHvdHAdB5P/0klB
	 B8y/VRL0CuhVOs6M411v++6d1SfOLkyPlsm2fBONGJYd31DVcU8zPlvpiBNH/TsixAiUI
	 TY69COI3COPhdYA9bCztYPThrozvkyrDQxMuRqFygudT8D6Vm9bCelJrkXsoBKgIMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=u0CLwVk3a8k/4O+bQ140RorSIVT9PYbg67sstG2f+Bo=;
	b=YKylql5Aaif14JDVEXq7Lr3Ux/2VMjCLhWiqGjH8yY2S3pJMrLIH4FfYLrYuBb/MKrhu
	 I2yeyOaFH4AfS4Q/sQ9p+/6IzQbrRS9DUNN6JZEFcmlD49HLKWEC3+3m3rFpz/AzJqMEZ
	 T+WmkzzR9HrOagvKA2WXqBu6MmDX3LHKdeKYsAzRm3lPJAPU818B3zbwZny/PzWPd/fq+
	 bTCppjVIgjtZelSXRaOQqzJ5sGgtlfoLRlBHsL+tiHCuPxgNmzTi6InO55uluRmI1n9MJ
	 D7TpVx5Vpt9OK8GdO7TanAXYlMyMXHgfPSdkX7x2DcujvWtf6fQTFruyQ09p88iSytA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZFXZrpe;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C7A606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0C7A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZFXZrpe
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c45111bebso64178f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793319300; x=1793924100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0CLwVk3a8k/4O+bQ140RorSIVT9PYbg67sstG2f+Bo=;
        b=NZFXZrpeClInr/QV4HMbvk1egVMR0LcWwDJBnnk/iAjd65Kpds/7cjQ1p4KD8Z8sAO
         k1dPLyM7BH36zWviF2EuhNnjHo7V1PVawky+iRECENfKzhNj39T0QPedj1BU469jjQf+
         +efC45V9bpO01zExU+EI9w4GrpZgsA2IYHOqPCQVHzD+Qi28oS2cbDqkhhSpjApTEt1D
         s6CL+lbWFXPpLI+8PW/dS0P5ydR8kmyc6bgnqMGPLyWHdRhCc35xspvSRTMOQB9WBkBm
         VyOSqen3Qq0OjC0TPYW/Ky5kg6xnj85/Z2CVE+o5mEe5DyS+SvQETGFabTVPRLWKOrFd
         1baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319300; x=1793924100;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0CLwVk3a8k/4O+bQ140RorSIVT9PYbg67sstG2f+Bo=;
        b=IPM4vnJxVcGT/MMi7/dsNLn1tK4fs71Rs6BXSyVl2CrF//VXILfI8SK1E6jQmQQ3NF
         ePFmiNHt3kl7X89gxq8GJuO5JrcGDsKv7IYstiaCkJqMuyjVoH8475HROgVkHbcOGEAS
         jGDABTdPUi65v3qE8ZCTwjuvFbgX7cQhvKmKn5R0Odq3ZBftID0o03Vcd954Wijdvdb1
         3BrZb42xft9zBD26YaaYV68RPxgvOLQATtoVpb7haaEFwXOQb01R9fjA8Q5pRrAV2YSP
         F0/XKmXBJgWPir2lHM245Fj1JRRba9WF3qo5Sn4bAbdGBP3bTPEcOCuJjsLIMAyBILuL
         rg5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEMdhDMj36EdsXO6ZTs5ebcunQ9QZsTBYzha9qouss75KxFanrcQHroNGXxfmT7U/gt/eOXSiXrgN05yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIe/AiOd9/47NO3SBtjzyLgX1Ngim6OL1P5AlgQEQkzQwOmE9wR
	VcqYnhXI3lChHDW2DWwbdZJfgM8u3srCoZp6ztDwN5NpvTjKikYgMI76
X-Gm-Gg: AYBFou2hoepStvC9tyOpEQsV7/SmH1zQhKOj/tmnXILYUlFLJGo5gRshtdpXaYOwudf
	hDB84807g1LsSP36E6j/6VlQXwoBgGfVDK7Lt+a4cSqQallhYIpWXncoCRZL/QoAMkTsWdFN+xH
	i4k2BW70rhIm15J2RnHIgedZb7PEmHIFOk3sXyQuw3VSEl4YYM4QTm86/DRHj3CAKPkoNwWi7IQ
	fAltgQLqJ6DXSDjPSNPW93vFkA7KWr59mLOdGbdEeUycnC0dWaOV12DEYZfd8rvc80qEPmS7PMt
	ePfACqII/+jXLWikkEcq9+iguzoU7GzL+QJJ3fr+avbVjDN6txJ3/biiEfv1kSJnM7ll+56W/cX
	yruE8MI2M1Iz+5N0atfGyrr7GzNnGA8jJR726nnwYx9XzwPs1r9zaP+vUe3u2HgBF2+I+rkKAdy
	U1iCgjLHr8gZACj712Bua0e9zAsiaFthiOfh6HJdux+PA2dI6VFm3bcZJtMRmZ4H1HAWhzPzomh
	0Ix+zvEIlTjVryCNc9j8ZTsegHlTOUF3Ll/1DMp9aSTV6KJsK6WvgGhuEsg/ojNRz2rsbPYIbnv
	o4JC6ZZw8tqKiPa8iNDy47Oe8Fw8ru9a8N4hE6l/5buBB7Mw
X-Received: by 2002:a05:6000:25c3:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-48e6e517f2bmr1719562f8f.50.1793319300294;
        Thu, 29 Oct 2026 17:15:00 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm15085f8f.45.2026.10.29.17.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:14:59 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	syzbot+88435e204734072bf39a@syzkaller.appspotmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net-next v2] netdevsim: reject port addition and clean up ports after a failed reload
Date: Fri, 30 Oct 2026 03:13:20 +0300
Message-ID: <20261030001444.289973-1-omermetekaya0@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nsim_drv_port_add() does not check devlink_is_reload_failed(), so ports
can be added via new_port after a failed reload.  nsim_dev_reload_destroy()
returns early in that state, leaving them behind.  nsim_drv_remove() then
hits WARN_ON in bpf_offload_dev_destroy() and a subsequent use-after-free.

Block port creation with -EIO when reload has failed, and delete any
leftover ports on the early-return path as a safety net.

Fixes: 75ba029f3c07 ("netdevsim: implement proper devlink reload")
Reported-by: syzbot+88435e204734072bf39a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=88435e204734072bf39a
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
Tested with syzbot C reproducer.
v2: drop Cc:stable and target net-next.

 drivers/net/netdevsim/dev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index feb88ccbbced..61f0824ce4d3 100644
--- a/drivers/net/netdevsim/dev.c
+++ b/drivers/net/netdevsim/dev.c
@@ -1697,8 +1697,10 @@ static void nsim_dev_reload_destroy(struct nsim_dev *nsim_dev)
 {
 	struct devlink *devlink = priv_to_devlink(nsim_dev);

-	if (devlink_is_reload_failed(devlink))
+	if (devlink_is_reload_failed(devlink)) {
+		nsim_dev_port_del_all(nsim_dev);
 		return;
+	}
 	debugfs_remove(nsim_dev->take_snapshot);

 	if (nsim_dev_get_vfs(nsim_dev)) {
@@ -1758,7 +1760,9 @@ int nsim_drv_port_add(struct nsim_bus_dev *nsim_bus_dev, enum nsim_dev_port_type
 	int err;

 	devl_lock(priv_to_devlink(nsim_dev));
-	if (__nsim_dev_port_lookup(nsim_dev, type, port_index))
+	if (devlink_is_reload_failed(priv_to_devlink(nsim_dev)))
+		err = -EIO;
+	else if (__nsim_dev_port_lookup(nsim_dev, type, port_index))
 		err = -EEXIST;
 	else
 		err = __nsim_dev_port_add(nsim_dev, type, port_index, perm_addr);
--
2.56.0

