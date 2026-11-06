Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960358;
	b=JevftVYkAikm7XmOmoW4quVmzMJfYe5A9qxvVzLfND+dGwSM2TSG46eZxOL6++Nz7zYP
	 4IoT4fMXXCk2qQRfh1nisVFNvwWQtmzA6LBemzOjwuuB0nHQUyivmA5CbeJ/nS5h6SZJc
	 nc2oJt+CJn80um7A7IgHs8+ttkhgyhmpk5n7uHIpt5iS5AYZW3qidqM7XvMoRkOqWnPzi
	 r2ZQv2m9F/IZjq14ZQ3A5FklqBrS4RvQOoSSTZTz7PHdXLCa7tzIeDiF+CqHvXz/lHUau
	 pELOmawuuwllxq1rpuzqKTIjfQtenph9RhaJXe9XeZeouEZJ+ORzANtiO58pnOcVd2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960358;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=F4kxI2wTIfu/23csmBMbHSFlb5/hs/tMnDMridnsP8g=;
	b=lLDr5qwo4LBMqPS8qMNTnzDSLoxVfjHxRhHLxeP8r87mDsvO1MDIILcmyeNL+2sSAxhR
	 aZlLjTm8J3gPjhK9mDy5XzqASq50nJKgyOd86Vn2jd8brJkD9yvUKVhn16gmsH0ZcKKwX
	 oJwCe6LA5ST7a4YhZBoYmodmU9ZU2EbhmNNkALD4Z+YRngYYlIMF6SOzG4LHlj3u6qzKo
	 yKyTy54k9WH2c05QsbPd5awE9UUmGKXyyjMTs1ke9viPQ9HqAB75ca4UQRWBM4ocXCNHP
	 kVKYwSU3GW6MaGGGnAnjLX1Nmi6Nz+0bVBlC5IIOO6GW+kz9bbMy0UusEj6rjNV6kUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Dg5FUOzi;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E7606A32E;
	Fri,  6 Nov 2026 10:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760E7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Dg5FUOzi
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIuWx1863787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:18:58 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIuWx1863787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960339;
	bh=F4kxI2wTIfu/23csmBMbHSFlb5/hs/tMnDMridnsP8g=;
	h=From:To:Cc:Subject:Date;
	b=Dg5FUOzil4AS5QZyyF2Ev4vE4NF6Xx0p36U1Lk/oDYXgSAhE2riRKS+CYTUDBfNCh
	 xPaPXp9RbEtggDvq5QL/46wBWB+nPRIHWSL94C+tCjS3ZANIX0KIa2pVXQH/HRV5pH
	 MItaJMffzdxUZ0rpMd7qnt0hu3Q5kkRa6FQdk/Dw=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 0/2] firmware: meson: sm: make power-off work on S4
Date: Fri,  6 Nov 2026 11:18:52 +0100
Message-ID: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
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

On S4 the firmware implements PSCI SYSTEM_OFF as DDR self-refresh, and
the power key then resumes into a kernel that is gone, so the board
hangs until it is unplugged. The vendor kernel sets a firmware shutdown
flag first and takes the secondary CPUs down through PSCI; do the same,
keyed on a new amlogic,meson-s4-sm compatible.

Tested: poweroff followed by the remote's power key cold-boots the box.

Changes in v2:
- Use remove_cpu() instead of freeze_secondary_cpus(), which is not
  available without CONFIG_PM_SLEEP_SMP and not exported (reported by
  the kernel test robot and the Sashiko AI review).
- One power-off prepare handler that does both steps in order, instead
  of two.
- Link to v1: https://lore.kernel.org/r/20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at

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

Christian Stefan Kövér-Draxl (2):
  dt-bindings: firmware: amlogic,meson-gxbb-sm: add amlogic,meson-s4-sm
  firmware: meson: sm: make power-off work on S4

 .../firmware/amlogic,meson-gxbb-sm.yaml       |  4 ++-
 drivers/firmware/meson/meson_sm.c             | 31 +++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h       |  1 +
 3 files changed, 35 insertions(+), 1 deletion(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

