Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962034;
	b=znlUsbiG1yoWtK8GCaoiIL8JDzyY0YrvU5Ea054NXG6LoRNwLtb6mPtUa62RQ07gxtn/
	 hiB3/VGM9IuuQlq3dxq2YuGt1SVJ9eqb7sN84uwcJ7GRcES9QxebYkoUbz4SKY4D7vkjI
	 UzGSdxcP7SXcBLEtFIhP2ASL9Q84yri9zIUN/OKSO4jO71cXbFwoW/my+SSy9ZJvdOOXo
	 qu0xpw7TOa2gxcGavR4jVS9NkGPd10biTmy6Nq7CEItlffd8hsEGg26J02x13CI31X9Li
	 Z/9uY1d3CsNcDrpKF/xDkV99kZeGZG8t/HbafWvT9UMVhdxYzQKMKDzTj4macxxOsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962034;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=6lyfZkMaV5efFDaQd+IxuIBt8CTl0E0w6j7qjN8lYSE=;
	b=w/M4JUe+QHFhqJbCXHX2E0843LTkvRZcK1iIfJR0gJD/mNoQl9QQtPdurUSnFVNMi/0k
	 kJqTv2B6u2E9cX/YvF3BS/3I72csVEcXSnOOx4A8XMFPEmPDF3ab0X+afvr6L1TgN8CRh
	 00QKWPYRfwk4hBgUAiccPd52CT46wB64lWeMfDZWa3VAQUiN1ZkAVhJbmaROZhHokFY3t
	 9dlHE85UstMyPXlJI1R2yHrJdYE2b8k/B4AzCe7phmZBzfKRtcwa5xsEj6VPQ6pN9V+x1
	 ozU9TCfPxQWTGUTWmPdiNvcbcO66ohFUzir4cvkghmO/0rzH47r/z98bc5K17Y3hM+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Wq7bNyJI;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C2606D802;
	Fri,  6 Nov 2026 10:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13C2606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Wq7bNyJI
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07F1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:02 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07F1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962023;
	bh=6lyfZkMaV5efFDaQd+IxuIBt8CTl0E0w6j7qjN8lYSE=;
	h=From:To:Cc:Subject:Date;
	b=Wq7bNyJISiqD46Vv+Cx/w4pTAF5EVD47JK+PiaLtg3hRh5M4Ydpm6SyyydhNvAE59
	 vqwskoeRDqCvBUSJiOEqfGTLVy81l0p+dE7kEbNS5YUBRshgF/qq9IQ19qpuZsdwMC
	 /osCFy+pii6znpq6aKE4hLilv8s9/xCP1bsUBiuE=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 00/10] arm64: dts: amlogic: S4 SoC additions and the Amediatech X98Q
Date: Fri,  6 Nov 2026 11:46:49 +0100
Message-ID: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
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
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Patches 2-9 add S4 SoC blocks to meson-s4.dtsi, one feature per patch:
caches, PSCI idle state, S4 secure monitor compatible, Mali GPU, CPU
thermal sensor and zone, GE2D, USB host and AO CEC. Patch 10 adds the
Amediatech X98Q TV box (S905W2) that all of it was tested on; patch 1
its binding.

The board has two USB ports, an SD slot, Ethernet, HDMI, a power LED
and an IR receiver, and no analog audio output. CPU frequency scaling,
audio and the video decoder are left out until their drivers and
bindings are settled; the HDMI display path is not in mainline for S4.

Dependencies (bindings, sent separately):
 - amlogic,meson-s4-sm                     (firmware: meson: sm power-off)
 - amlogic,s4-thermal                      (thermal S4)
 - amlogic,s4-ge2d                         (ge2d binding)
 - amlogic,meson-s4-usb-ctrl, s4-usb2-phy  (usb-ctrl, usb2 phy S4)
 - amlogic,core-phase-degrees              (mmc core phase)
 - wakeup-source on meson-ir, rc-x98q      (meson-ir, rc keytable)
 - amlogic,shared-antenna                  (Bluetooth W1)

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (10):
  dt-bindings: arm: amlogic: add the Amediatech X98Q
  arm64: dts: amlogic: meson-s4: describe the CPU caches
  arm64: dts: amlogic: meson-s4: add the PSCI CPU idle state
  arm64: dts: amlogic: meson-s4: use the S4 secure monitor compatible
  arm64: dts: amlogic: meson-s4: add the Mali GPU
  arm64: dts: amlogic: meson-s4: add the CPU thermal sensor and zone
  arm64: dts: amlogic: meson-s4: add the GE2D
  arm64: dts: amlogic: meson-s4: add the USB host
  arm64: dts: amlogic: meson-s4: add the AO CEC controller
  arm64: dts: amlogic: add the Amediatech X98Q

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 310 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 246 +++++++++++++-
 4 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

