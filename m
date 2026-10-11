Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C1935C193;
	Sun, 11 Oct 2026 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739042; cv=none; b=ahLWffdzFDgd2AhpjkYFwERKvzf4o5MvQUnuphSMUN6hXl9UEH8whLXNL7BBexBP7i2ubIiAQUVMbKebNoK0G/Kup+zXawUvGjxpupKItaLieLF83qs2ZIVt0p2LjB6JdzrSjsdNyz8kJ8HBDvlO94UpRPaonC+ivX3IHE9LUv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739042; c=relaxed/simple;
	bh=ae1bPrtDyGrs2a0laMfc/OYJpM4BBJvlclfzCOSwtR0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dN2r/U5aM5dsUvUmHizNyqxWnvXMAkpdFAtw8MMXBg3zuScNaBF0CDd9P5uAnHMPn7A2sPjOvxzd1xO6gIzRgwmpoWd/te6tKdL0HCDa12WUHBI+Li3a0/QZ+xzfr3VgdHb+WleOxG2APYY1cs/6OmrmeLrmFAWRpkaATV5xMfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jB3hNoR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jB3hNoR7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0A67C2BCF5;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791739041;
	bh=ae1bPrtDyGrs2a0laMfc/OYJpM4BBJvlclfzCOSwtR0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jB3hNoR78WKmXQ4L9Wp5ay6zJxrncwO8yUKiLo91/ijokXW1OkCpGgJK5juaHAMfU
	 X/iVHNW4yaVbXyDOCCPVDdHoJ3TwncOBQHFliwcxhdN4gUHG5AgLXoaCk/idXTVCOn
	 17YTgZip5W+1hw4d8+KY2IgqkcNw9YSmuHWjSsQHgVZ9WT2gcyaHp3VcxgqRUvQ0jq
	 s71OzZTMb+FovxXwvz5HYfuhBN7sUvQ8tD8aQRooLH/F5Yh89PqO+FNxHcihf9zFgB
	 izTgKYJD36EV88n49Vxyk3BqhrU9d9eqb1Ais8pXgsc302ymDzn1f17Txhb5+3sPks
	 d6sCgpdAAZ3Yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7C1CA9ECF;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH 0/2] arm64: dts: meson-gxbb-odroidc2: eFuse MAC address and
 LED properties
Date: Sun, 11 Oct 2026 20:17:20 +0300
Message-Id: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDXptFi4iljQDsZCpYNIxN0Vy
 7f4/wKhyCRQZxdEOlg4LAmYZ+CmbhlJsU8Go02FGlEFHwN7Z5TfRJW2031lCmsdQkrWSAOf365
 pf8vez+S29wH3/QBRMK56cAAAAA==
X-Change-ID: 20261011-odroidc2-dts-53a0b62433c1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791739040; l=1059;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=ae1bPrtDyGrs2a0laMfc/OYJpM4BBJvlclfzCOSwtR0=;
 b=GVJBAWBcJccI7BftcnfSOQBKjaaNNOT8mkWe4pU5mIhBCjmUdbK1NotBESevNbZMlvCPP5WJD
 YvfS4QJfZUVAo8pp02GouscmEfXDjIGElN+Ru7FNwfYLmLpSzeqrrLF
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Two small device-tree updates for the Hardkernel ODROID-C2, found while
adding OpenWrt support for the board.

Patch 1 wires the eth_mac eFuse nvmem cell (already described in
meson-gx.dtsi, but so far unused) to the Ethernet controller, so the
kernel reads the factory MAC address itself instead of relying on the
bootloader or a random fallback.

Patch 2 converts the blue status LED to the standard color/function
properties.

Both verified on ODROID-C2 hardware and rechecked against this tree
with CHECK_DTBS=y W=1.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
Fil Dunsky (2):
      arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse
      arm64: dts: meson-gxbb-odroidc2: use color and function for the status LED

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
---
base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
change-id: 20261011-odroidc2-dts-53a0b62433c1

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


