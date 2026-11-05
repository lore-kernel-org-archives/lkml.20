Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865310;
	b=3bdoC0wKtgUyhK585LFWuESFEFmiQVef24M+hM7S4/3qrJbuyOCUA/ympHFVWaQvExo6
	 FhNgIE+MhF8rB0mLpQdAxlCIELZFHqohwjOjbH4GVYxUjeiJueR2RWFN3LuNayHU0sVAa
	 yaqU+xDzR+yNRTxiroi1f8QKrr4RotoEinZmirebDVgEjzvPCWbNW8G2cqx5xt2NHpcPP
	 LpmU4kfdFIW3L1nf2MMX+GwVlggFukmNipS6b5sPk/hZnU02QW4az7n2Y3SP0VKPM2Ja2
	 g/CrxBubw1xwotfCPy+Myk+zpQ6/HN16hXbFG/Ds8d8g4TBBukuFQFz83InAB8bqViQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=49G1iqf2QmSyGLHl7Nzr1fd3WMkW1sA8C00E5igDa7A=;
	b=omAqE7VxSLjyvTh1XAGwhwkuNzqTQDRzRgoMTEH25a1QliG9rPP19zdWyUO6YkEuB+pb
	 3HJ9jJdtUVCp5wx+2ttvN1ARxaGy+Uyfvb3p8HMmNMAREmQsYuecXN3B4id3UJTTVNmsj
	 UR9BPoAnH5LEZmTzdIHc3udmg8gKweGsFl8Ax01tj1fs8ESJGj2KT661SE5X04QbiIWli
	 X6UgdKEemUsPZCfFL5+D6ido2vN6zjHmgeOWnxicxkn2qgs9KIJ3yiSLkDcJGPrisRGOl
	 2ZmFe3wUGImuJc0TCPVLQn4Tec9v2TIK5i57ErQKQKcHCJKwZBdlmyviV5PzBhx1EDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qdkfEXpA;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8755606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8755606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qdkfEXpA
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso921194a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793865309; x=1794470109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49G1iqf2QmSyGLHl7Nzr1fd3WMkW1sA8C00E5igDa7A=;
        b=qdkfEXpAKoq74JnmWDYRgtODsRQ9zmfdbm1M9FUxuYasF24+heFKwIpY9FzZcACY0p
         El0o8osQWq9K5fvSDbDENn+6LdaUNum5yoCk3146guJ/qZbj9uj22ya+tFjWEGGXa3f4
         ekyUh8YkCiuIaqiiMnH/Wh/nw+F6Hjj+SalfVTbBxCkRjeRLcyS6wBsjqKuB+eSr0KPX
         34M3uiY9o43Z3Z004vymUxfwAEX+GUuCi1URgP8B0caI8wLII4N0RWdNfw8vaNqz/c3G
         yMwAtNR93yFQUtCXgI3AHCsUWRz8w+ZlztwO9mHMK50IyELyNCILSTozS/iiMiNdRsUk
         hyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865309; x=1794470109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49G1iqf2QmSyGLHl7Nzr1fd3WMkW1sA8C00E5igDa7A=;
        b=XC+srsX4w48m2MlzBVfFEFBWHCaqGVZXTSWtSMjhTxjJNNFhknjaX4RsB7Ao5tY02Z
         jNBbdHtJMyNxf4rLfQ/eE+E1f3UxqiqaOLHT9mXIiZVDcRfDvIwIzpVjpeDaHBL03FKj
         ATngWeto272QWCZllEpfHzYMBxAW+T0L0vDL/iwAX/f+zetP/g21X0+sqyzH3t0birF6
         +1eKpuKi+g/zEHGaX4XkeMyE3y3r4yQpnc4kNg/Cq1vRpCwUoi7ylYGOJshUJ/2w6+GJ
         w6PQT75kwMqA8v4n2mKgHGGY43AXRhRQ4487UQ7QAqUSvBCIfa8Xst7/vR1ECRgwUl89
         Uy5w==
X-Forwarded-Encrypted: i=1; AKwUvByGVKBzX7z5LrT7az9iUB4sdiXcl8/uvswYdEZc018crYGaRB3RiwrzedauXsf774faUEkdT0bpH+3wtjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ylun+yQxPqKyN7aQ9uWzaSSqt+6ibuwoqrUT4Qree8vw42jo9
	NcMMbuJ55vQ5GM3NSP+fBgowBp9bidWINv1aUWrnhbJNqkMPIL6LywM=
X-Gm-Gg: AYBFou0QDyc2La6JwLsLwIs31MrrPh53Rq6z0OWeqZ7QB4rkhMhzRh/R3yNz+LGo5L/
	zjytt+KWQQIyhVUfPGF6DqAaSKXhr1S4kbZ0O0GspoTBQjQAcrZAz7kkzu2M4Dr+3LJbvud5Vj6
	524ulkFzQpNxeRbrdEFC2JYcFwXRiXIrUG7XE8DdBuaUvwQhDlwpZEfmT/Phbj3Kgo7G5sWxMQ1
	09W72veKyFxkvBM1TmfU1UmT8Ck1fRX1tUfR68Vx+CA+I7xdubENMKie4k0hJpEEawqGXA7r1Qa
	86TIOcVW+yJIIF2FdzpiTO/bx2/8/S5c3XHx/c4eycMq9Oma588IY/wn/u+JLTvZo+yE5DRX0fH
	aaexvBV2anwFmdN5TZSsQ+iXrrZ+jBw90WbsQAdI7nZ12PUf0w9D1VJaO8OrTEz85gazCz/uxjx
	9BbQr+cqCCrAT5AxKgTue9oHV9EZpMsFlWYXI7+UwxIzW3oOUjJDAKkdhgcOMC6atqa9ezC1+AZ
	gbYkMX0fwlggSjdEjKG50hzeHJ0D39uV5xj4QyfNWXTgYFRAzcAOhMleRzUaVnIkyfaAanGGc8f
	67mdKXELYRCJd1oefPFAWmEPu3Hk0gwuGG85mREeoPDI/pUW7kmqBs71dQ==
X-Received: by 2002:a17:90a:5d17:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3ae898ea1b4mr11529545a91.14.1793865308835;
        Wed, 04 Nov 2026 23:55:08 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm2622293a91.15.2026.11.04.23.55.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:55:08 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-pci@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org,
	Daniel Stodden <dns@arista.com>
Subject: [PATCH] PCI: switchtec: Fix PCI device reference leak on probe failure
Date: Thu,  5 Nov 2026 15:55:01 +0800
Message-ID: <rc-review-20261105-vc-149-07fa7f0c8a18@gmail.com>
X-Mailer: git-send-email 2.50.1
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

stdev_create() takes a pci_dev reference for stdev->pdev. When a
later step of switchtec_pci_probe() fails, err_put drops stdev->dev
but omits the PCI device reference. stdev_release() only frees
stdev, so the PCI device remains pinned after the failed probe.

Return the PCI device reference before putting stdev->dev, matching
the existing cleanup in stdev_create() and switchtec_pci_remove().

Fixes: df25461119d9 ("PCI: switchtec: Fix stdev_release() crash after surprise hot remove")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

 drivers/pci/switch/switchtec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/switch/switchtec.c b/drivers/pci/switch/switchtec.c
index 5711aaa5df11..56a370ac9f27 100644
--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -1698,6 +1698,7 @@ err_exit_pci:
 	switchtec_exit_pci(stdev);
 err_put:
 	ida_free(&switchtec_minor_ida, MINOR(stdev->dev.devt));
+	pci_dev_put(stdev->pdev);
 	put_device(&stdev->dev);
 	return rc;
 }

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
