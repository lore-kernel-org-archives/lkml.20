Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D923921C0;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791743501; cv=none; b=hq7gUrSGka5ev2/FXYG0uulvYrh//qo2TxSZVmxvKB+9VWvGKjUQOsLIyOngNMwb4idPUs/zpVFETlI+YHhG716H2jO9EModWzPaLKaWc/aLZzb9v4NE7rGMDo4BbzEwxib79eeWwGWcGmuJTIFqzUwgQ96GNKTnkoDizbC+oQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791743501; c=relaxed/simple;
	bh=aWMsxig8K23vnf/R1OjXs+3LeoRMkfmdoowDD+N8d68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=suqPUVGI+y+ZthkBkBFMlKQRpSS2dQ0vvC1EdkUfP1/sa4Qlflq2F1w0085Fme0ae6VOvYJul/2hFSQvsqGuYFjY2P+VsYmRiYAHNfwyBKCWBXZO9b8VGcu3lXscAhZt0Kn9NWXlfOMr2R1eeNISvYZ7PJPaSWt/v/QrfkpeOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvngHjUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvngHjUr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10A48C2BCF5;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791743501;
	bh=aWMsxig8K23vnf/R1OjXs+3LeoRMkfmdoowDD+N8d68=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VvngHjUr+tDLCROIy26d14KwK7iLq63CiUC/L9ENCU5bo6He75sXXvC+EPu72rKsM
	 lqsytBZYcnvgoZr5oa4JUu+bgDPmFl18a32e/IqaLVjqXqQ9jphEUVJpkmmFjYblRf
	 osHa+7yKOHLuaw8iNXtzoI0QXQ72pD+nDMqL9WdrLJqwl/JOVZTRyhM0jnZm3YC8NP
	 s/0cfG22VI7dPZr+4iOUYz31Scq06J1jbUM7rn9YB6NkJdEjekNWKLaARtg58Sfd0x
	 dWQ0Bcw8Ci5yEGmxwQSvBH20z/MFielfWC0+9jHRL8uO0FjbC2sxTzIYeRxboR2zNL
	 WyNqsNlZJS7IQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18A2CA9EBD;
	Sun, 11 Oct 2026 18:31:40 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: meson-gxbb-odroidc2: eFuse MAC address
 and LED properties
Date: Sun, 11 Oct 2026 21:31:39 +0300
Message-Id: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw7CIBBFf6WZtRig2ocr/8N0QWFox9hioBJNw
 79b6trlSc49d4WAnjDApVjBY6RAbt5AHgrQo5oHZGQ2BsllJbgQzBnvyGjJzBLYuVS8r+SpLLW
 AbfL0aOm9527dj8Orv6NeciMbI4XF+c/+F0X2/qSjYJzZ1nKs61bZprkOk6LHUbsJupTSF81Ij
 8G6AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791743499; l=2030;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=aWMsxig8K23vnf/R1OjXs+3LeoRMkfmdoowDD+N8d68=;
 b=PY/UhwoUt2ayvSvnBN0VcVMGvOsm5rRv67RWyVsbw8k5cjG13tdXsLE9z+YkyS+AwaqE7IahB
 ICQMtjYTH4IBd8fMvhLxj0QrC+eEizoFKe9HDPV+cSV+oMGJJKr390A
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Two small device-tree updates for the Hardkernel ODROID-C2, found while
adding OpenWrt support for the board.

Patch 1 wires the eth_mac eFuse nvmem cell (already described in
meson-gx.dtsi, but so far unused) to the Ethernet controller, narrowed
to the 6 bytes of the address, so the kernel reads the factory MAC
address itself instead of relying on the bootloader or a random
fallback.

Patch 2 converts the blue status LED to the standard color/function
properties.

Both verified on ODROID-C2 hardware and rechecked against this tree
with CHECK_DTBS=y W=1.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
Changes in v2:
- Patch 1: narrow the eth_mac cell to 6 bytes for this board.  The
  16-byte cell from meson-gx.dtsi is rejected by
  of_get_mac_address_nvmem(), so v1 only appeared to work because the
  bootloader had already fixed up local-mac-address.  Reported by the
  Sashiko AI review.
- Patch 1: describe the actual test setup in the commit message.
- Link to v1: https://patch.msgid.link/20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Fil Dunsky (2):
      arm64: dts: meson-gxbb-odroidc2: read the Ethernet MAC address from eFuse
      arm64: dts: meson-gxbb-odroidc2: use color and function for the status LED

 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
---
base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
change-id: 20261011-odroidc2-dts-53a0b62433c1

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


