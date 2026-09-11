Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E57B476CE1;
	Fri, 11 Sep 2026 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134519; cv=none; b=t2S1Lg676P1hx8g8RePCFi62dZKR2JD/qz18wWNuqr+UwOzCQbDjookB4RhzCBopNV2ClELtLFD+1UNhAvKIscjXMpDRtMNv2m/EJIxN2+CX0Jz74ud5JEZpb6SCitYy/cPAE+FRZHzA5HrokqGIe9yRpYSM1x0CJX+fJhlMQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134519; c=relaxed/simple;
	bh=lG4KDAp2pMa37LUQNtZbacnmooezoxlM4A7rINK4vpY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j2ZyLTQfNnxCeT6fMNEyhNGNuLOuYrrsUCNDB2LdWWiWRkzVbM32Uw9WO9cIfKxGorMMtUBSa1KNyRJ117rP8zlDWZt/PUk5fn6AjhligUVceshf7aMBwm1rW6J91s/u5qti1oKFvv3KzHKbcniWa+6sq5Q+36x+4/JcFxaeOkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5oUdyEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5oUdyEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0B6FC2BCB8;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789134517;
	bh=lG4KDAp2pMa37LUQNtZbacnmooezoxlM4A7rINK4vpY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Y5oUdyEJMSwiGeUtOfczssRAPoFBaSXnVWs/4sMhbFj0li9Q3eGlnrqH7ArgsGrW/
	 /ebCQhwEZUzESW8pDfyRxAkGjug4E80cSSQe1+2f8IGw3uZiXgA0dFEHf/FcbziOG5
	 KvpAh1SoaF2v1uIb7VXrXfIFcB+lPk2DRiNCyDrUgF8NC+j9eMYvUCrJdlYYFVLURv
	 qFgFBl+VlqXlTMy/xx12EyXEWXD/MA6CvBpUuNX3uBn6ccJx0irtLy5d2IfDvXzY3Z
	 NUzosFRsN/aqvGeceIJP+Nv8AVJ3kFUUdRWnVrErUmpUmq4gVLRT1vuTjWckDKB3gB
	 dp1tNa+7BtjXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5F1C88E50;
	Fri, 11 Sep 2026 13:48:37 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Subject: [PATCH v2 0/2] Add SPC Glee 10.1 A64 board support
Date: Fri, 11 Sep 2026 15:48:36 +0200
Message-Id: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ7CIBREr9L8td8AbYm68h6mC2h/W4wCAWw0D
 XeX1r3JbF4yM2+FSMFQhEu1QqDFRONsAXGooJ+VnQjNUBgEE5KdmUTdYPQ9Tg8iVLLBhaMkOWh
 Vn5RqCcrQBxrNez+9dT+OL32nPm1PW2M2Mbnw2a0L33p/BSUMpeDDKHjbUs2vPrjk7PFJ0OWcv
 8IU1QfGAAAA
X-Change-ID: 20260906-b4-spc-glee-a64-v1-6e6dba38aa5e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789134516; l=2744;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=lG4KDAp2pMa37LUQNtZbacnmooezoxlM4A7rINK4vpY=;
 b=9cQ8HQazllEZ9I3uWCMPeNw1KeaNAYJ7K67hJqRBiRk3vDkZLO8y0O98Kuiym09Ba9Fr+zhVv
 ihA3uDDYJ0HBtZRMro+NaiR2KP+HnwLY8llpeA3HBQck4uWQtw7cFMw
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
Reply-To: jcarlosgl96@proton.me

Add initial support for the SPC Glee 10.1 tablet with Allwinner A64
and AXP803 PMIC. Describe essential supplies, 2 GiB DRAM, microSD,
UART, battery monitoring and USB peripheral mode. Keep unverified
peripherals disabled. The microSD slot uses broken-cd and a conservative
25 MHz limit until its card-detect wiring and faster modes are validated.

Validation against sunxi/for-next base 913f7eda9f3e:
- DTB build, binding checks and full DTB schema validation pass with
  dt-schema 2026.6. W=1 retains three inherited SoC warnings.
- Cold boot from microSD and kexec into Linux 7.3.0-rc1 with the corrected
  DTB reach accessible userspace without regulator_ignore_unused.
- CPUfreq transitions to 648, 816 and 1152 MHz were observed.
- CPU cooling state 7 limits the CPU to 648 MHz. Automatic thermal updates
  were paused briefly to test this actuator, then restored.
- USB supply online/present changed 1 -> 0 -> 1 during cable unplug/replug;
  SSH reconnected after the cable was restored.
- Automatic CPU thermal cooling reduced frequency under load. Two SHA-256
  workers completed 10 minutes, peaking at 78.37 C, with USB/SSH connected.
  Cooling state returned to 0 after removing the load. A four-worker test
  was stopped at a conservative 80 C limit after 27 seconds.

Long-duration stability, sustained full four-core load and broader peripheral
support remain unvalidated.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
Changes in v2:
- Use the onspc vendor prefix and place its registry entry alphabetically.
- Include CPU OPPs for CPUfreq and CPU thermal cooling.
- Enable the AXP803 USB supply and link it to the USB PHY for VBUS detection.
- Keep ALDO2 (VCC-PL, 1.8 V) and ALDO3 (VCC-PLL/AVCC, 3.0 V) always on.
  These supplies are identified by the stock firmware and match the
  measured baseline settings. Earlier test boots stopped progressing
  without regulator_ignore_unused; the corrected DTB remains responsive.
- Link to v1: https://lore.kernel.org/all/20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me/

---
Juan Carlos Gutiérrez Lavado (2):
      dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
      arm64: dts: allwinner: Add SPC Glee 10.1 A64

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-spc-glee.dts     | 143 +++++++++++++++++++++
 4 files changed, 151 insertions(+)
---
base-commit: 913f7eda9f3e3fb1c67285e144e202494d440049
change-id: 20260906-b4-spc-glee-a64-v1-6e6dba38aa5e

Best regards,
--  
Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>


