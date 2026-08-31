Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041D3AC0D9;
	Mon, 31 Aug 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151556; cv=none; b=PNjSVflP/0W6OZb9vSs2v9g7O7EFWyrrIe4IbTmWrotEbQXjw++ctRur5igwoqFt81qrwDA528qxX8AAFn+D4BqKz+cTOxNBsX4J2Asi4Xqe2wA4ZeIlRVqmsXieVhYzXn3s9hSVsaTSHiMMNsLl3U6LFb4aFgKU/chguq5eD1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151556; c=relaxed/simple;
	bh=Ovej68cLXFYOnS0QtY+PxZfnGeevRqdmCXTREH3RCZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+HkZzj6J8ewl3cjZX/vJIzQBL1+j5+MyGAP1EA2olU52S9a+fx2XMaBuulzs6gTIrqkDYAHn9EtOgIgVdUAdXgCBqfq59Eq3eWnmSLQyTRr65+O29A0xuCX6B0lD2NlH+JjUYJQquiCx57Y7tTrjA1DZMRJcrXRYTkpXenlb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=YzEAmaZU; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="YzEAmaZU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FjJnigpBeHIQ125/9YAb7UUdeqoXLLzRYVllv9SQ/2Y=; b=YzEAmaZUONWfIOcm0Rfr6LmhL5
	pm0LIeefxErQuG1LTBIoHJijnOYdNnszYJuXeEu1pN2nLXZ8GfcXio3I0bAhwslfxvH64uRGYBdfG
	Qv4yRTNzR32iX463fYdcLylcj/lbRyKDmHYpgJxWqPnPBMDMzpgrHI+iwsEnjmm6fT0EWEzjQ6VAg
	po7JUg9UdWwUESvVSkflVvgpa09LkKKEcPYhep4I0LoWKaTQFdCJAt6tvlU3eQ4KkZzTlZQUSvgj4
	abQFeWriRge2loMNtWVgS5KmtEGN5zhMZNXWszMrdCCsE1pMe03LtA49WMqPcOhkGIyR6DqTsuzuA
	7HC0nkYw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu3-0000000ApeA-45VG;
	Mon, 31 Aug 2026 06:45:52 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 4/5] riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board
Date: Mon, 31 Aug 2026 06:44:24 +0200
Message-ID: <20260831044540.3304350-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044540.3304350-1-aurelien@aurel32.net>
References: <20260831044540.3304350-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the K3 Pico-ITX board, by default the GPIO pin that connects to the
RTL8852BE WLAN enable signal is driven low, resulting in impossibility
to connect to any network. Add a DT node to expose it as an RFKILL
device, which lets the WLAN driver or userspace toggle it as required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index d3f256dffb4fd..dda420900aa2c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -44,6 +44,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-always-on;
 	};
 
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+	};
+
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
-- 
2.53.0

