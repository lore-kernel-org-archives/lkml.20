Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360CE472F74
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783507; cv=none; b=Stvq3EKSFfxMvJpJUuF5kIyTzipDFKisILeLer5s8Mn6XGwbvu6VokqGBC3YifMtZKCkKzt45cGz0RmtL3cEnqbCwr5oQq4ZG08Hyen0KgXMdCyeZQ3AwV1ZDK9lG5ecPx9cKHq2161shfb6Xnk6IPujRhCV+H2h0AnA1LyD58A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783507; c=relaxed/simple;
	bh=MkWGEFafuVF1/BklgAJXV0fN5ghDmV0dTjlZs4zA3sk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SyyfuTo/zXzUL/joPK5EiHcVAsnNmm4NuYFz6UWUlE+f92fSm5R+GeHvHdIYJIMKRvNeNhRAMxdU2sRL3W8UyNz6nGrTcWygsu+ushYFZQ9Um5le9CzbdjiDOOKHuQ56vyE6C+F0hqe9gVPsSnyZ1cowCROLXfAcqHIixVrujhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogD1f6yn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogD1f6yn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3997082a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783505; x=1789388305; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M+HAsxQQxUDOt5N6zlO4MPtV29db2csxIdg6BsvV3Xg=;
        b=ogD1f6ynEvol+sKbjXJjQiLwbikJAoxQsJEF1rh89BiAgPW44T9zKmiLIPL0qbAPsA
         PMobPxc/zLbTs1X59QwdrFWTbAzYEBjVqgMgD2jXZIxgD2+G+XhHpxuioSUaBzYEPHeE
         iOnGnr9DNLJznhm9XeTm5lxfYyrZbHwUNkkVld3IYsH+a1q4twgLBbi7PH2aFUq1crjW
         1F4grt1qcjFdngg9B0ZDHazzfNHE8OWIqBw6BEj+HQFirFAKzJ55e/93Uo+DZhRXBxZL
         D5D4ET6EFmgOm1FNRKLSC4h55tFBWBoeycj/yfGVAeXYt15UOcqb2uHBCDplMtp7WoYY
         feqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783505; x=1789388305;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M+HAsxQQxUDOt5N6zlO4MPtV29db2csxIdg6BsvV3Xg=;
        b=Cl3F5rclC7CtC+VWHTYNsKCV193INEYCNcuaXgvNCqVP0r2lDvHf+Tw+hQ2d8gij92
         h+SWISouw9UPBkGtA9SjlRDtwSDfO/V3iTk0jNnkO1fBL8GKkafb3hMlHZbjtHQOwdR1
         N78hdE1rsL+gm/hf02dsnQAuq38zudBkl5gBaM7S5SPU5cYmnwQNzaolo6WO0qzAncKQ
         dUR4nfWXh/xuSni+6FdllMoZzTjIx+DGaAwTwSMtZG+QuEJZm/5mY8WAh2vAsOKguuJ+
         7fWSjYpmI2RS4HdnXBUMf6bNRqkYGiXFku0VrekFzdAsBrve8qvL2aigEwybMoHSc8WV
         SqzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8jhhfP+7FgyWeLVkH9j3GHH7wPiS8ae2Dl8MzgV90d/HmfrYAhd55RJBtQQk2G2dHpC8tf1mrvfAZuD4=@vger.kernel.org
X-Gm-Message-State: AFuF++lC3o7bWb0GRJcg3DLBY16R9PvUtjrMFTV6cM/hxeatej/zbW0D
	loME6WPYSWTPRyWB0HVzpOkiRiKbWir+0dDLLuMwHnLioPwdhErLgTaj
X-Gm-Gg: AYBFou3CyOHqZjJWfB/HKsP6syjLAHEWGRI8oTZHIZcJKCuVgP9ZcA5d/ab3W7o85cN
	wGDNsuf2qXpgJtCXY1Du/xgjp5jjL5LvFogEzc7BWpFIJYrIm/HIJEWrzS7uCQ6zszP3mlaXL2g
	4/2h/5vMwgtXKfwO1tL61sTFqgw2tdGHa4t9AQ83z0CSfBEb02hD4p3FgOEjBM+WO4uLPvpBsRE
	ZSnSYCAJB6a+bXaeug4HRMhmERjpTmcQzy/qof7B61O0V6LuJ7JFREXCxJMLn9EFG35T/U+HVDR
	TtkBb+K55/xSIV+dASYkVoJisyetSzVviDl99fglqB7lewCqooRHR7PZX7z9eu9f32Esjff5gh7
	AubfoRb7JkcpVrkIvmPlLCJWG7kAIssoMtLGvhXkqLpnGNJB5O+SLTRNVeAjeqpkt8lpsA+A6TG
	hrxqoZrWd1nPGAGp2odcEhYbCMLqUYpOP0TE26mihaTLaopbygRDPo8onVmYKxF9ALn5wsrDTq0
	tJ/evQA7SUiT5GYbEPunY8igyzBpw==
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr39413109a91.0.1788783505530;
        Mon, 07 Sep 2026 05:18:25 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm26350223a91.1.2026.09.07.05.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:18:24 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] net: add USB CDC Ethernet NCSI support and fix
 unregister UAF
Date: Mon, 07 Sep 2026 20:15:54 +0800
Message-Id: <20260907-ncsi-over-usb-v1-0-6b74d2f1196c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqqnmoC/yXMTQ5AMBBA4avIrE1SP6lyFbGgBmNR0kEk4u6K5
 bd47wIhzyRQRRd4Olh4cQFJHIGdWjcSch8MqUq1KlWBzgrjcpDHXTrMqDB6yLXR1kBoVk8Dn9+
 vbn7L3s1kt3cC9/0AkTI383EAAAA=
X-Change-ID: 20260907-ncsi-over-usb-3e786f4686c8
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Oliver Neukum <oliver@neukum.org>, 
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, 
 Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Mik Lin <Mik.Lin@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Adrian Ambrozewicz <aambrozewicz@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788783501; l=1794;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=MkWGEFafuVF1/BklgAJXV0fN5ghDmV0dTjlZs4zA3sk=;
 b=Fx16GO5ucEg/0bu7HbuHd3717YW/a0u4iihQVxPSlAPCpDP75sojVy1WFJ3tumaGE/oBfABNP
 DEktHDPO+5YD4JJ8XuKgvktiEceLa+zi6QTKXsCwoQCfrnMHOUJxTZR
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

This series introduces NCSI (Network Controller Sideband Interface)
passthrough support for USB CDC Ethernet devices and fixes a
use-after-free race condition in the NCSI core unregistration path.

In DPU (Data Processing Unit) platforms such as the NVIDIA BlueField
series, the Baseboard Management Controller (BMC) communicates with the
host or DPU via a dedicated USB CDC Ethernet connection for out-of-band
management traffic.

Unlike traditional platform Ethernet devices where NCSI is initialized
statically at probe time, USB devices require dynamic lifecycle
management within ndo_open() and ndo_stop():

1. NCSI control packets share the USB data path, requiring the link
   carrier to remain enabled while the interface is up.
2. In USB drivers, usbnet_disconnect() invokes unregister_netdev()
   before unbind(). Performing NCSI registration in ndo_open() and
   cleanup in ndo_stop() ensures NCSI packet handlers are removed before
   netdevice teardown occurs.
3. Dynamic unregistration of NCSI devices revealed a race in the NCSI
   core: ncsi_unregister_dev() freed the ncsi_dev_priv structure while
   asynchronous request timers and workqueue items were still active.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Adrian Ambrozewicz (2):
      net: usb: cdc_ether: add NCSI passthrough support
      net/ncsi: fix use-after-free in ncsi_unregister_dev()

 drivers/net/usb/Kconfig     |  20 +++++
 drivers/net/usb/cdc_ether.c | 190 +++++++++++++++++++++++++++++++++++++++++++-
 net/ncsi/ncsi-manage.c      |  19 +++++
 3 files changed, 228 insertions(+), 1 deletion(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260907-ncsi-over-usb-3e786f4686c8

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

