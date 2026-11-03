Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676860;
	b=tOgD2sjEZrpVMQQYEe9420/AfoS1cjlSb2LbSmBIcoS4fsbgelOXTEQ3BQfSj03W5glp
	 Na0t3TxMWkIB6X9whNZjldJqkZNSg0AbynhxrRD+Xr6R4P6q+4Wb8E/LA1pEqoQmq10YO
	 diSJ5WWzCbl9L7OuVx8ZBDfVM/iUk/AZfpYp+8EGiMiXjiCZoy1y5g7OxqwWHn4lftmtP
	 1Nmf51wq0yGshnxtPXG2zGvtlXO3X+A6rGSvNcbbUgW1yp3fJxY8LILkHiFMjTvhsra2D
	 +RL/msa+lkLF8Jaj4YSpEEmBZ59vGPaiisIUOjkfd7IOtClt280dnKeTDqyWHTU4jQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
	b=M7J2HzUZIC/C4iXOD/IzV8inS0jaOysKweQNXg1juQoMC/OKeH/crf6TI69cJzfbf/xX
	 1TCDCQoT4dPrwvWQ5M4VR8q84t0xSOLIqesQV6xoekSaaFwNx5vx2nhUuMwtJFhjGuNyc
	 rO0rJdrvgyIaGM9+r+pknasUSi/7zcLiucgzyq4o2PmZc6NAUj2YOm/wrFNQueWo8y3f4
	 oOqXFAgCDJMSaI5gQtZZYzqhUA5Z2faFgJexE8srTLHxbqDCNkcC1DanoZtbtUTyKggCq
	 K2Wvk9979rf7ybXUdfeWo3gb0lSONHjYE4jCM2ojAUnbZY+FVIPDuVbgPvQANoK6evg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AgiwMN+W;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C66606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C66606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AgiwMN+W
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1517123a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793676859; x=1794281659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=AgiwMN+WCDb0CzMHKck1ZwBsxIOmlFDhABJrFx0RhXHXhMEgdpcjCQkcKPD4i6PCpd
         tEwCWnQT5COSNU9Kn67nvGjSDZv81kzF3ZnJPRRczxT9628t7vDQF9fGF8hHW938fkta
         UwWxhrKF6jVlZZ8P+LGMzklD9K3D95NJS1MCXZ3SshiMAgYFtOaG97TujFyhlejTBWVj
         LhjWOZ3aVkTJduAlo82JvxBkn8eKoTcDa/w2rzhd1ysfkhrQcksTnSEvQiyayqY3NIHt
         5qWYfAntph4Sj2ZG5nh+jr6+/XCxRiQBA4naC59UJvxwhllk4l8L6iYI9GYF3L6/uCUI
         ZhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793676859; x=1794281659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1Rw55oWDrh7Qrrp6JFBlhT1fM/bU2NaiuzfyjKKcU8=;
        b=d/dyKFmWXjetIHX9fGXEVM5+uFh+BkynDbddXvJ2EU65vPtSWJguj9IcHdSpOMuTKh
         CXGZ7F1EoJLV9GMQhxx0AJ2+4NeBcV4906lj359jwuIfneWOyeYhYVxdRNe78OiKHUj6
         vKpgmkRzCpgTGiTDnyBFRA7Sf0UufvdKsGUGH/7M3bXH/qpN1jsKjZ3nOq8Cr30FFmjD
         2WRKFLos6CYga2mv4rsMWIxjDgJCC+rDgepjjYsgbPkPfrbdoetcbmXFg5Yk6R0DbMLt
         gtVEasxExR0o5s7+O30KfMMPci2cvFL52hD7/E40+SinHLxZxkaUZJU/Yia4TxFhP/5r
         +f0w==
X-Forwarded-Encrypted: i=1; AKwUvBzri/SFpP9ywni5gSYUtbm/KH+ZO1N5dKuBcdBYCEUbCpqqxKhjcq5pJRoBNT3chfS+8nyBMqbST51+7PY=@vger.kernel.org
X-Gm-Message-State: APuU4Z91kPPXaKBUWK6VZI7olt/JUXqs67bCP5nWaFsd05/53d7BoN6P
	HcaS9drtj/4XITvB8A9Hgr51at/KgwQfqpZKALumWR6s0q5tmt8D2g+sMC3rSLzb0Q==
X-Gm-Gg: AYBFou1szMKRDdUsVBsMCR59Imrew/r9k/DNQYxKOWvF42JIyljokkYEBm1Q8Fa1by7
	btb5wAoS/GucLAMcZAiLYbE8ni08cCBi0x8YowKBMDdu7IOnhrX+V5uXVRcfMvHz0ZQlpC8ffwQ
	z8j9z7z97RuTAmAfgvkoIWdcCCYNzhk/UEoEKP/hb63QLguVhp44tKhDnqSkiI8fGBTo7yW8/ZV
	C5V/sWwQnv591pr9zr6F5VVmkglAGoCWoesZJ6CuIXec24Y5VMPByXldaPGI0UdTrlQUmWftVp7
	a0qKlWMtWQ1YXD3JpoixxzMbCFwJoHHNKdoW+1yr2FOfQAud3oOwuOYhON8tDPkYmfpSyXbYTQq
	RPtSYCeUdIGFU+FYjYV/GwwthqrcPA5QGKFJv+LNjOErM5IdD/HIe4MYm+W/8+JCmPyCRBl7rKO
	fttrdb+dvyUYy6GOqJ8nHhUHjafrMI7D9mY0PYFOkIl4u+GZi0dV1r+hKV4xgSSkTyJwiP00Ivd
	7+VJlkar5KLYqp4a+/s1L4rw3n8lJwl5xH96hX59Tx8XbA6DIi0gRMrT0rT/t/O8qjBE8l5pmjv
	hKLTkcVafUVH+co0I82BM/DHhhhOINb4hah04XxwOR/mQ7G590hAjEXE3xlyI8EzLej4mQMsZ68
	wcmdjiBVETo9A/iS8tg==
X-Received: by 2002:a17:90b:2d0c:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3ae897e30c8mr9894127a91.65.1793676858713;
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c29e619sm1965566a91.0.2026.11.02.19.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:34:18 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v3 0/2] usb: core: fix failed device driver probes, add pre_probe
Date: Tue,  3 Nov 2026 10:34:11 +0700
Message-ID: <cover.1793669297.git.jjc@jclark.com>
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

On a BeagleY-AI with BeagleBoard's device tree, kernels since commit
f918e3804498 ("arm64: enable HAVE_SHARED_GPIOS for all ARM64 platforms")
no longer boot to a usable system: the on-board USB hub is re-probed in
a loop. Patch 2 fixes this as Johan Hovold suggested, with a pre_probe
callback that lets onboard_usb_dev defer before the hub is configured.

Patch 1 fixes two pre-existing bugs found by a Sashiko review of v2.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally.
The -ENODEV fallback that patch 1 changes is not reached on this board.

I found this by booting commit 85b4bc79dde7 (net/main during the 7.4
merge window) on a BeagleY-AI with BeagleBoard's device tree. A coding
agent identified the problem, explained it to me and proposed an initial
fix, which was revised numerous times on the basis of comments on v1 and
v2, my feedback and local Sashiko reviews. I verified that the series
fixes the problem on top of v7.4-rc1.

v3:
- Add a patch to fix existing problems, as requested by Alan Stern.
- Patch 2: rebased on it, no other change.
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

#regzbot introduced: f918e3804498

James Clark (2):
  usb: core: clean up before handing a device to the generic driver
  usb: core: add a pre_probe callback for device drivers that may defer

 drivers/usb/core/driver.c          | 42 ++++++++++++++++++++++++++----
 drivers/usb/misc/onboard_usb_dev.c | 15 ++++++-----
 include/linux/usb.h                | 14 ++++++++++
 3 files changed, 59 insertions(+), 12 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

