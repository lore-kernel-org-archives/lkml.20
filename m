Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489077;
	b=D4oey5MA+d/lge8B1KgMnJg27V0/WqpJZJg88V/t02Yd+8o3A5m6FSvgriUNV8d/EHR5
	 hS6RLjczlicBU1g79+9EjCFck4qmhyYAq2AJfHwsVFZaMawwOxavBWsOnKFP8plVz40YF
	 0etHWLzWLYm/CZw+j3vgnIXzKFsbBb9saxZ9Hc1FpsaXQYIVLYrazUOn6zFGagzdyDjsl
	 q6h/H9YQrCxSeejDpDKmBybRvX5gfpKIs4/fF/lMkfteLwwR9F2yBzNyHlGRsFyiaEwRW
	 YeaHj0CcVEIB1jnmjNnegL0k0Qxa1odMMLtpA1N9dMsGhptBYpBTV6mhD1igSccbiGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ExiWe6IYRCzUY8rck7nlU6f6ETQaj99+YuhEArdi1eM=;
	b=YcxmpWfh+dwMfVM0qh+pnfN0LyG3n4RFC9vioZlHWWFqVaWOv3JcplGrFH1xTwffJUVF
	 1qptOiHNRoRwTb/3xUS4zgRtWnQtVKol3wJZnjNg4RomNkjWRa9qMI4/hBwyiD9YOOMIa
	 xeCpCtAd2SB2RAkc0vUDKeYSnLUyGqXRRy2cta6oIv3Yg6kFfVPDjZS358f2v+DI5E8o4
	 re/k/LlAvXKeat35FeGwa4KOEJ92kuP+X9B7Ka5BTHL77JX1SY6dkdkBH4cUdh5NFJRju
	 CKwe4mA0Hl7YwJFz59hTSmxz88mS8Bgxru9W3g++d8voytt2P3/mnXLoPMdGcX/ydoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTTsQeZS;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F21606A882
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F21606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aTTsQeZS
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso7104874eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489076; x=1795093876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ExiWe6IYRCzUY8rck7nlU6f6ETQaj99+YuhEArdi1eM=;
        b=aTTsQeZSHDLOerAo12RK4wsz6ThRmPhvgPb/PbQFyIjz5OLR651gaUPDRyA4a1Xb5M
         mS495dLFYqdKbDhN3zdDNnWGlcbX861hGBFetoTbgsCDYC4Za5yTg7c+mGwCAWs1Lsxd
         9uDF9szcQiQfluxHBeR3RQk72/GTu7hLGhnX/SC3QWQdVqTIL4Gs0pDnwBKTSsnq3pHB
         iuajqP8hcHMP8lklRiv1gO1/CfTXxbcvn+/Wo/hN+saRDVM1rFQT0ZlESx3/lK7t0Ctd
         CeybPY9geqBPudJeQl/QDKEPR4bAJ05fKu2gsqmsLGm+9vHI7zgAU5KZ06v2R4Uzb68p
         PcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489076; x=1795093876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExiWe6IYRCzUY8rck7nlU6f6ETQaj99+YuhEArdi1eM=;
        b=sw1hN8Pt3+Qs+N0TdGINsMTZ7FmFVEqFv8WVySkabZRCvI4XpQbBbMSz61/8heyhbp
         DURYlOL1InKAbp0kg1SnGMycydrNTA6YUU8DaIGEZygE49Si4HY9fblJmFBqY2IsyBCQ
         XbZYurluywO3NrLDVS/rju15JdGHb/1lmSHvqNsSGL46PBUu/gDAz6YJMM+zZrmWqosZ
         3t+WvT6yKrr4w9NG9/4cPYXaCgOLPiP/sxabhOx0bPtzrtDZXuFiU7wdPrAoVX4KzncC
         qB0FHG+TWG4FED9+XbJomv/lbT4YtmO7K0c3DNblVDwp43mZNE4lqEi8fpesxmVRY+ha
         g2gg==
X-Forwarded-Encrypted: i=1; AL+hErFWJ2M6JpR5J6jeq6dOETLyZQPxDq1mcEMmBUEag0XU56hG7+LCZDaPMhndjfyuayVkTjxHjVwrfVabLWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dUWZiYTgl7PwAXTl6a/tkYxFIR0ZiDxgyuz2FMhtH9AguZnNT
	eh/VYZnl4dx3GT+KccCFSBw3LrfRpOob1v97yhcN9bf0X8UArW8VQ+y2
X-Gm-Gg: AYBFou0sgcFPUmRO5Ad3oKqkgSujFzBfy5psHVhyRQKeIF7EJrr4O9gJlbOxzP6wreI
	0Fmjww7IqMqB7o7oRHpuaioZQy9kBqbNAZbAkVsSWoaoQqb4+Howi1us2efDgkUtA/UUBnjv7ZB
	pNQMKgK/EjgTE1CWszA/MtNLUUZSK/CVZKYoEQ3yP3uJm9uxbi995Iyl0n8eByZTryEsdVC2ttb
	IQDmGjXX2U22jxxcqur4mjyKdo262jyDvlmAd4LoPokBwhAI7K26tzyt6dIArmrEpEx9x+YpKfb
	UINS5586CEeINI8Gz47c9gJ7DjlJRBAzZMIvcMm2leX54wdeMm+gUO1A0B7b6gTuPA9haDjW/2q
	5TXfXcb6EK/zDmwpPw8Xvk2DdvdCXYgGpch75rw6wtlUZh9OBbMLrQ9V+4T5TEB9Adw8u2vfXuW
	f0J5si+bH0y7PTOZcCFNdpJ9F5xeh6gRHF3EVOOgOT8ZhtPuyDvjHYdVfbx+53rt8s+dGc/9Gyg
	SFWgV61CGpkdK3BOZe7z2SX9Ib/EEzbU6YLlVRQ5IH52/IpCYb7iQwx3F3F8sLaJT2maDAKVw+h
	hNSAfCUgvfMdytJKU3CqaYQkKmky+MRd22sJUmp/4xA=
X-Received: by 2002:a05:693c:8945:10b0:372:7af9:b914 with SMTP id 5a478bee46e88-3768636eb08mr5533318eec.24.1794489074432;
        Thu, 12 Nov 2026 05:11:14 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bfb58dsm49306866eec.18.2026.11.12.05.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:11:13 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Jeremy Kerr <jk@ozlabs.org>,
	Matt Johnston <matt@codeconstruct.com.au>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH] tun: disallow setting ARPHRD_MCTP link type via TUNSETLINK
Date: Thu, 12 Nov 2026 18:40:55 +0530
Message-ID: <20261112131056.234801-1-skalpesh942@gmail.com>
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

When an IFF_TUN device is registered as ARPHRD_NONE, mctp_register()
attaches an mctp_dev context to it. For ARPHRD_NONE and ARPHRD_LOOPBACK
devices, incoming packets in mctp_pkttype_receive() invoke __mctp_cb(skb),
which initializes cb->magic = 0x4d435450 and zeros cb->halen.

If a userspace process sets the link type of the TUN device to ARPHRD_MCTP
via ioctl(fd, TUNSETLINK, ARPHRD_MCTP) and transmits a frame carrying
protocol ETH_P_MCTP, mctp_pkttype_receive() evaluates dev->type ==
ARPHRD_MCTP and calls mctp_cb(skb). Because frames allocated in
tun_get_user() have a cleared skb->cb and were not constructed by an MCTP
hardware driver, mctp_cb() trips:

    WARN_ON(cb->magic != 0x4d435450);

On systems configured with panic_on_warn=1, an unprivileged user in a
user+net namespace can trigger a denial-of-service kernel panic.

MCTP communication over TUN interfaces is designed to use ARPHRD_NONE.
Setting ARPHRD_MCTP on TUN is invalid and has never functioned. Disallow
ARPHRD_MCTP in TUNSETLINK by returning -EINVAL.

Fixes: ff4cc3ac93e1 ("[TUNTAP]: Allow setting the linktype of the tap device from userspace")
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/tun.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index b50a7245be9..eaaec072814 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -3364,7 +3364,8 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 			ret = -EBUSY;
 		} else if ((unsigned short)arg == ARPHRD_IEEE802154 ||
 			   (unsigned short)arg == ARPHRD_IEEE802154_MONITOR ||
-			   (unsigned short)arg == ARPHRD_6LOWPAN) {
+			   (unsigned short)arg == ARPHRD_6LOWPAN ||
+			   (unsigned short)arg == ARPHRD_MCTP) {
 			ret = -EINVAL;
 		} else {
 			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
-- 
2.53.0

