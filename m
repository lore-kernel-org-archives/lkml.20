Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792850941;
	b=Jm/AISQrf9i3QCCGhLYInPyR9HL+95f+KZOYfZkL0A0EudlK5XXnq3nG2q99GAjp7fbT
	 R2jpNsJrtJpoZfA+ppgB/bWKGXM/4eKA4yZX6JbnbosZlw2vKlbUm02zu+RH8HVDch7Mj
	 N/39m8SaZW3AYo+KI/veymn8wP95XnauN1Y+WQ+Wfnh8JuKlJGppyfYV6CXZ1Y5gnOJt9
	 CJxljc63rmzT0O3qBu6Flg4/ghEwPMGbXAlAj+KE6ffbmt6wEfYOEMGg1ndYnkg1QKa8F
	 vrkRHw+w4AliTVVz5F7YI06T0MA1w3l7ZAqpjcZnyL4nLr0Ptie1hk1EO+5GcrzkiKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792850941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EwKsrdatUTlg56QAFqz1oLMl5QbRHEGp0tdF9/HcfWk=;
	b=ZgK/eO0/oGi5NqlSxdGwkWtaznnRdjxMSfi8XZ7khOAeA/gJ52q+tU8IZ6r5k1NLvX58
	 mg+e7V+Rvug+LcP4kaePeMzYWxVpsKKB7WbbEiSB3KAMqkK046jY55E1KIjDRSU7zJp83
	 12PDKAY8esdPb8bX12OubtclfqvkevwMq+V9jIxkzlxSDAHmubMr/xOgFQl7j8hoxR0Z1
	 Txt+MREeXSAYyWt9fl5Y4cqwEnf1LMqy20rEBzWe6D3RNNIY4xKqI28yH9IQUeZwq+a+P
	 hUEqv1Fh/IXMNEZKdGFbf22qak4dxZdeS3n0uZJKXWA13p6wjKez4j2HkN5XZeg2irQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lrvBAWhn;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66140606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66140606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lrvBAWhn
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so6743365e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792850940; x=1793455740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwKsrdatUTlg56QAFqz1oLMl5QbRHEGp0tdF9/HcfWk=;
        b=lrvBAWhnbw45bOzK9RWYKvM6k57lVML5qCdb40NDOyS1EWgKvtMZDQKswmTw8CT3qh
         383rQxDQ9NvCQTKTptxW32GfdVHbQsuILkJ5fCluBw8DeeoA3zlqMmLqeUiXOOQWipAp
         2LCdXoAUyKU0RDegEbdp/e48zG6EA9b4A6QoVFxZ0J3BnoTiDLuTJDdV9c3AM/kmB8aI
         o/YSukE6NG2FOyrNNI81hkbNh3NrulnllZPY3IN4i30Z1ZGpBRFDRZCtS917rMiiI26Z
         BkugSmayF8HYNzJnzcDJKB/yUpxqMwiWLe50aYz+RDCti1Nh1Rtb/xfuzeXUqjKjLBTA
         OZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792850940; x=1793455740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwKsrdatUTlg56QAFqz1oLMl5QbRHEGp0tdF9/HcfWk=;
        b=S+fwlQvhH3a71JoFQUu+1585azEC3Ns8ISKxsMOr/9sJiKAPE9/bcVIRBF1vreZTUg
         TY1U/7vlwP00r36pKFSiYlOyGLPVcAdPCYaEKO70lNWiRuONsZfjmmQbwoBId+Nd/1Jv
         tjRA1PtCSE5ruhEub2qBe8tQp3R2649YFmykHfgYRcBFu13c5e5x5qroEVkm0cAJyGC6
         zejjks+/R34LcgTCg6XJJcoKGmv9Vc/eER/s4mbx19m4YOko9O7LwhZcrB19QanwWjwK
         tEMG7JavgBKxXPw4Z4xv3J1CIzs/g0puKJozVBa7zv5qyWBUyKC3R3/Ef48jfAVh49f9
         SeUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5nTbkTk5OCt9vh2Tv7MjQwT2CbNnCc78FEGze4L+NUzsJNB52VrvXKhGe7S50E7mhIK7M4RMt0z2AsCk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYxThttKp13eBwwqvJn+3a3cnTBLleSJPqYzpDn/3YhHQU5Pxx
	+8XEQwlm9vteE5l27t/OsL3gr1wgPpGX+o18+P0pSbCyKmfD2LOxMuo1
X-Gm-Gg: AYBFou2d8DSV6+0FLtmiDRxApq382H1l+fhff9vOhEsDzuWmgxHGK1lzR1JA0RHSPf/
	RuvTWEWNMQVsW/mhEXSFWxMkbC1tJXnoCxraK21GG1TK4UkRxXKoRec5WwkZvgkd/5wbmYiLoEY
	AAQM35O9AcSJGhxbSvynxVKLN9latw2gZxhEaZB05JgDyrAFfvISH23osMoUQSX60F6feUYbBtU
	MfYFX8j6u0go6ZtvcG+CPCRJgd+P9tJr/GlpcKKml3yLWNInbB1KSwTHl3i078b1WdTecQ63JGA
	nkKMfoDpWOCbnDm7pry74Uv1Zyy+eYijICk0t6JbY+yWvadXi+mYbxT0m7Y7RpLju7ZPVWIgSDU
	kkePOdCbYJpRuNE5SxvnGWwLyMYUt9o3lw37PBOhhxxP+OdZlAkekhBfaYbfMTiZkJ9s5NGIxqT
	Unb4Yuhd65p01Fr2mdwOPFP5If7v8naYrESJJDnNFJ32K2v0mtbXkGvVBDvDWoqINLHZM4R92lX
	CauLPESlG3X0GqankjwO2tjIPwnCWd7A+X5qFikJ8R3ZWhztpuE7SY=
X-Received: by 2002:a05:600c:870b:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a35ac95981mr31510735e9.14.1792850939744;
        Sat, 24 Oct 2026 07:08:59 -0700 (PDT)
Received: from NB-6746.. ([178.66.130.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm46716525e9.4.2026.10.24.07.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:08:59 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv,
	tzungbi@kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] watchdog: dw_wdt: fix reset line management
Date: Sat, 24 Oct 2026 17:08:49 +0300
Message-ID: <20261024140854.25664-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello,

This is v4 of the series fixing reset line management in the dw_wdt
driver.

Testing:

$ ls /dev/watchdog*
/dev/watchdog   /dev/watchdog1  /dev/watchdog3
/dev/watchdog0  /dev/watchdog2

$ ls /sys/class/watchdog/
watchdog0  watchdog1  watchdog2  watchdog3

$ chmod +x watchdog-test
$ ./watchdog-test -f /dev/watchdog0 -i -s
watchdog_info:
 identity:              Synopsys DesignWare Watchdog
 firmware_version:      0
Support/Status: Set timeout (in seconds)
Support/Status: Supports magic close char
Support/Status: Pretimeout (in seconds), get/set
Support/Status: Keep alive ping reply
Support/Status: Keep alive ping reply

$ echo mem > /sys/power/state
...
...
[ 1560.147058] PM: suspend exit
[ 1560.371470] usb 1-1: new high-speed USB device number 3 using xhci-hcd
[ 1561.031825] cdc_ncm 1-1:2.0: MAC-Address: a4:2a:95:e8:fc:e4
[ 1561.037736] cdc_ncm 1-1:2.0: setting rx_max = 16384
[ 1561.054408] cdc_ncm 1-1:2.0: setting tx_max = 16384
[ 1561.084713] cdc_ncm 1-1:2.0 eth0: register 'cdc_ncm' at usb-xhci-hcd.2.auto-1, CDC NCM (NO ZLP), a4:2a:95:e8:fc:e4

$ ./watchdog-test -f /dev/watchdog0 -i -s
watchdog_info:
 identity:              Synopsys DesignWare Watchdog
 firmware_version:      0
Support/Status: Set timeout (in seconds)
Support/Status: Supports magic close char
Support/Status: Pretimeout (in seconds), get/set
Support/Status: Keep alive ping reply
Support/Status: Keep alive ping reply

$ ls /dev/watchdog*
/dev/watchdog   /dev/watchdog1  /dev/watchdog3
/dev/watchdog0  /dev/watchdog2

$ echo 1 > /dev/watchdog0
$ cat /sys/kernel/debug/1e012000.wdt/registers | grep ccvr
ccvr = 0x09a7baab
$ cat /sys/kernel/debug/1e012000.wdt/registers | grep ccvr
ccvr = 0x0599dce0
$ cat /sys/kernel/debug/1e012000.wdt/registers | grep ccvr
ccvr = 0x01926467
$ [  110.392536] watchdog0: pretimeout event

Thank you.

--
Best regards,
Artem

ChangeLog:
  v1:
    * https://lore.kernel.org/all/20260320135624.223863-1-a.shimko.dev@gmail.com/T/#t
  v2:
    * Reduced from 5 patches to 3: manual reset handling is replaced by
      the devm _deasserted variant from the start, so the intermediate
      states that could leak the deasserted reset line are gone and every
      commit is self-contained.
    * https://lore.kernel.org/all/20261022134354.534642-1-a.shimko.dev@gmail.com/T/#t
  v3:
    * Squashed the last two commits.
    * Add error check for reset_control_assert() in dw_wdt_suspend().
    * https://lore.kernel.org/all/20261024121428.18862-1-a.shimko.dev@gmail.com/T/#t
  v4:
    * Dropped dev_err_probe() in probe to keep the driver consistent.

Artem Shimko (2):
  watchdog: dw_wdt: use
    devm_reset_control_get_optional_shared_deasserted
  watchdog: dw_wdt: manage reset line during system suspend/resume

 drivers/watchdog/dw_wdt.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
2.43.0

