Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702134;
	b=zCJWMdiez8pNjoG8msx+vp2kpVIzBnbobdJi6WVMK7Gajw+5mHPkzuZyFdoaU8L+szKc
	 npEJSsvyHsq+bjDS5M0I3KMFmlzPeHtKUgnjOA5e9XT8pd8CEs3okfbto60uu+Tmgs4Bm
	 P/92ZdqtFXB3lx7guWDMssU34LATrGg/CphV4MofjlUVdPvg7F0Tn2LZA3SSqBzsL5TqF
	 cQ5jw2trwZSgMGx878wtDq2XpfZlNEf11z6+MEs9tWEc1cC8Of33QhPvNl5cWtceuwPyW
	 Btu3/X4wJRCgZw19DmQcihVXpsgkcnpOLpivtFqrXYUHma8DFaHdNhpLYSX+lR2JnBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8G2i52QMSNjS3WqnOiLf0rOX1z8/4eapMGP5PDnRZQU=;
	b=ekFxJZudY8QBXTK6Th/aGOutevvwC0Dww1qtXZq9ts8vJdpNj5LxAeeE3g/YXDTMF54M
	 pB9+RFRJm1XrkSEJpAw3EVOqBX9AvuSV+yw00p1eYJym2cP7YcvdQbe9u4z9ECJg4B4zd
	 riBnB4CbPgyUavwCyy7EV9Vd3SgTqAlRpbagJu7Ff2zdZGC/rHRYProVwKkdX5HycEkim
	 P7GXJpqb1MUJ+YKw+/Vg9jAGgVWjt5VTZWJ7WO4JEsz5TB3v25iplRB2dwf2rgk3IqqGe
	 FKypSjwMCFjhSkpTwfhBP5tWL2V5uHKGKIh3zvA/IZyVJ1i4ftj9ngQwpd8ylejMGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgJhJUuE;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D978607FA35
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D978607FA35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vgJhJUuE
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so3830485e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702132; x=1794306932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8G2i52QMSNjS3WqnOiLf0rOX1z8/4eapMGP5PDnRZQU=;
        b=vgJhJUuEvrAmYmy+knsgMQszfxSA+iqVgMMq17HoEbmRhjDGFT98E0A3FuBdsGdCLW
         3nQZOYJRoIoLVsNksYzwtWEEAkSK7K6w3wGCg5ZyKDQBdIyCCWkMYN0a2X7CxSOqfDYV
         jfKCCyege8pF5hCswkqPzA5Wko8+eTSZq180QiBDoSlZY2KFuJbt7X4Ye0Z5SJXXnssz
         vXPwybkmOuSmNpOil6qHBpqR6yJjPU4yQtVLVppRbyLho4mSx7nz4hVUOSWG8uDunNeH
         iDISDAda+p8nPCwy4tnivcAp4Nczebo2UJ57yd/Nx0oOCL9WMqtM7rIi0YZ+1yfotgSH
         yLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702132; x=1794306932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8G2i52QMSNjS3WqnOiLf0rOX1z8/4eapMGP5PDnRZQU=;
        b=w4nRxHn5PHTWeXjnjnTV/ajPH2xITfb5smE62ynxIdExQW3SpsG2nnwynKQ6o1d31H
         XI5XGnHSnhIcPlPuG0wsoKnHYpbgFPw1+N4vddGM7RNloPLD1/t6Fd9uykTz2VC5gCI7
         E47h5SCw9Ll+07GkxQO+E+YVzJ5aTYf0ov2yIWNZeseExZSmsn7Qo6ZbSGXRn4colC6O
         Mp0ALbCahwmGM3epOUF4qxIwEBtwb/QvuG0YZspEf8OvzNdCYL6GHxpiGqZBuMiKZvEs
         idwiZ1rBzlvkmHX/UboqPoJy7dtXOJ5FkZkg23ZYSDFb4GONMCOz8wGfmC+Mbc0TuEl2
         qGHw==
X-Forwarded-Encrypted: i=1; AKwUvBwkZLkETeuKpga/psza2UDtR7rS7bGFfqEwllLmj5PhI6SG2wpc90e2VZkw1NhaOUwdNfE2Fy5FUQ6ii5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bpxn6da+KvV4CTJYxMobp73Jl5Ro6TxeTCAITOFVXxNvdUT6L
	F7MCmInW3Rn7NlhvAlpYyEuRv9yaJWBfUC1Nn6z0//iGK7WoPzm0bJka
X-Gm-Gg: AYBFou3e9W20vnnbhZ5olFE/Vq5fFVejgvRbVWthnS2biwRsDwVf92sF45SoiKAKSPk
	PsUZl1q4gaoIKujLC2UHlrFifWs6C5Q3w41SDnAWeVg8GNPd3CeDVvAhGZ1eF5L/wI2jnCKtVXO
	fDg0kS60cfdG0NCNE6w6959fD61shpXgAXtzPpnPlEGdr82jkKgEJU53gPz2O/AcUoLF56UNbcW
	1WH159QASwWFh+HscePYc/yRX/wz2l/U3QOL6oktylju9CXi0c8yLSJQWOolFU/klhx7i42WNbg
	cQf9yzby1pRBKc6ES+S9ufYFWzABWAcrttu8xnaqHbtRweUg2jFvLYSMoIP10qTGPerHor97+12
	H+j2IX+DTTVX/ES6YiOdAd8d49o2HqfxJfOrX0FssCDU0mbLxndHj2WPQGeaX2fDUvAIbh4zV5J
	FQN9D3OeYwjTwV0seiJ9KNbTQfh+lOeDDxF+6TAYu9KyAdOViTCzAwmbz12XIpT3zoOcnX7l4Mq
	ql+3lps6a0HbBIJIcE2hNyqW+kILGADZ7aTMOczkKq9wSCHAyTSlW62U6ZTHqYy+m2QumWXS+K8
	F9VTaPBANDvt06XS066ddqZILpHVsVLj8RHS0tsATLYlrT38CmbUsNE6Mrsrp4LgmuspQG26hfm
	73A==
X-Received: by 2002:a05:6512:130f:b0:5bf:cf41:2578 with SMTP id 2adb3069b0e04-5bfd95606bfmr3866973e87.21.1793702132215;
        Tue, 03 Nov 2026 02:35:32 -0800 (PST)
Received: from valor-verifone.verifone.com (balticom-242-238.balticom.lv. [83.99.242.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074802esm2121007e87.73.2026.11.03.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:35:30 -0800 (PST)
From: Stanislavs Nilovs <valorcool@gmail.com>
To: brgl@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] Bluetooth: qca: Clear 5th byte in TLV tag 27 for WCN3950
Date: Tue,  3 Nov 2026 12:35:28 +0200
Message-ID: <20261103103529.804025-1-valorcool@gmail.com>
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

Hi,

Recently at work I was making a proof-of-concept for swithing our
WCN3950 setup from hciattach tool to hci_qca driver. With the NVM blobs
that we got from our vendor, the QCA drivers weren't working out of the
box. There were 2 symptoms observed:

1) The QCA pre-shutdown command (0xfc08) was always failing with
timeout:
Bluetooth: hci0: command 0xfc08 tx timeout

2) After few power cycles QCA driver was entering into "SoC crashed"
loop and wasn't able to recover. It could be that SoC stopped answering
to any commands.
[   76.546600][ T2315] Bluetooth: hci0: command 0x2008 tx timeout
[   76.559398][ T2315] Bluetooth: hci0: crash the soc to collect controller dump
[   84.706487][ T2315] Bluetooth: hci0: Injecting HCI hardware error event
[   84.713363][   T80] Bluetooth: hci0: mem_dump_status: 3
[   84.718645][   T80] Bluetooth: hci0: clearing allocated memory due to memdump timeout
[   84.792374][   T80] Bluetooth: hci0: setting up wcn399x
[   85.004363][   T80] Bluetooth: hci0: QCA Product ID   :0x0000000f
[   85.014503][   T80] Bluetooth: hci0: QCA SOC Version  :0x40070130
[   85.020682][   T80] Bluetooth: hci0: QCA ROM Version  :0x00000103
[   85.026816][   T80] Bluetooth: hci0: QCA Patch Version:0x00000001
[   85.053183][   T80] Bluetooth: hci0: QCA controller version 0x01300103
[   85.059987][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmbtfw13.tlv
[   85.358930][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmnv13.bin
[   85.436495][   T80] Bluetooth: hci0: QCA setup on UART is completed
[   87.458917][   T91] Bluetooth: hci0: command 0xfc14 tx timeout
[   87.464830][   T91] Bluetooth: hci0: crash the soc to collect controller dump
[   87.827568][  T106] Bluetooth: hci0: QCA collecting dump of size:196608
[   89.382355][    T8] Bluetooth: hci0: QCA memdump Done, received 196608, total 196608
[   95.458459][   T80] Bluetooth: hci0: QCA Change address cmd failed (-110)
[   95.470949][   T80] Bluetooth: hci0: mem_dump_status: 2
[   95.485343][   T80] Bluetooth: hci0: setting up wcn399x
[   95.678116][   T80] Bluetooth: hci0: QCA Product ID   :0x0000000f
[   95.688217][   T80] Bluetooth: hci0: QCA SOC Version  :0x40070130
[   95.694377][   T80] Bluetooth: hci0: QCA ROM Version  :0x00000103
[   95.700521][   T80] Bluetooth: hci0: QCA Patch Version:0x00000001
[   95.726263][   T80] Bluetooth: hci0: QCA controller version 0x01300103
[   95.732834][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmbtfw13.tlv
[   96.022441][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmnv13.bin
[   96.099833][   T80] Bluetooth: hci0: QCA setup on UART is completed
[   98.114243][  T779] Bluetooth: hci0: command 0xfc14 tx timeout
[   98.120160][  T779] Bluetooth: hci0: crash the soc to collect controller dump
[   98.485913][  T106] Bluetooth: hci0: QCA collecting dump of size:196608
[   99.964863][ T2268] Bluetooth: hci0: QCA memdump Done, received 196608, total 196608
[  106.210456][   T80] Bluetooth: hci0: QCA Change address cmd failed (-110)
[  106.222796][   T80] Bluetooth: hci0: mem_dump_status: 2
[  106.237541][   T80] Bluetooth: hci0: setting up wcn399x
[  106.445797][   T80] Bluetooth: hci0: QCA Product ID   :0x0000000f
[  106.455937][   T80] Bluetooth: hci0: QCA SOC Version  :0x40070130
[  106.462069][   T80] Bluetooth: hci0: QCA ROM Version  :0x00000103
[  106.468214][   T80] Bluetooth: hci0: QCA Patch Version:0x00000001
[  106.492522][   T80] Bluetooth: hci0: QCA controller version 0x01300103
[  106.499099][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmbtfw13.tlv
[  106.774412][   T80] Bluetooth: hci0: QCA Downloading bt/image/cmnv13.bin
[  106.852931][   T80] Bluetooth: hci0: QCA setup on UART is completed
[  108.866237][   T91] Bluetooth: hci0: command 0xfc14 tx timeout
[  108.872172][   T91] Bluetooth: hci0: crash the soc to collect controller dump
[  109.238079][ T2268] Bluetooth: hci0: QCA collecting dump of size:196608
[  110.784410][  T106] Bluetooth: hci0: QCA memdump Done, received 196608, total 196608
(... and so on ...)

Note: These are traces from Linux 5.15, but the hci_qca and btqca
drivers were ported from master, however there are no BlueZ's hcid_*
APIs for dumps. Not sure if those produce different logs

We also had a different device (produced by different vendor) that has
the same WCN3950 Bluetooth controller. Out of curiosity, I have
exchanged NVMs and to my surprise - the other vendor worked like a
charm! No more pre-shutdown timeout and several loops of automated BT
tests haven't produced any errors.

When I started to compare the configs, there were only 2 differences
- one new tag number and a 5th byte in tag 27. And the answer was the
second one. In original ("bad") config the 5th byte was set to 0x04, but
a "good" blob had it to 0x00. When I have applied the fix to clear this
byte in btqca - the issues have disappeared even on original NVM. Still,
I don't know what this byte does and what the value 0x04 mean. We have
asked both our vendor and Qualcomm support, but no answer yet. Not sure
if anyone from Qualcomm's OSS maintainers knows what this field is
responsible for.

Also, since I can test only with one board and one Qualcomm's BT SoC I
am not sure if this is an issue somewhere on our board's config
(previously all was working fine when using hciattach, although it
didn't have IBS enabled) or, if not, is applicable to other controllers
too. That's why leaving this as an RFC.

Claude Opus 5 (Anthropic) was used to create scripts for dumping the TLV tag
values.

Stanislavs Nilovs (1):
  Bluetooth: qca: Clear 5th byte in TLV tag 27 for WCN3950

 drivers/bluetooth/btqca.c | 9 +++++++++
 1 file changed, 9 insertions(+)


base-commit: b118b617cd2c37f41cc4675f5f2cb219e22b6ed4
-- 
2.53.0

