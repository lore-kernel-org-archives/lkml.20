Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9CE4F85C2;
	Mon, 28 Sep 2026 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628657; cv=none; b=aeGt7jPH0tB9HD6DS+vVGEsmBWBTS7a41w9FQdYiHM0k7bhFI7J+eaAApwtzWrhKXAb98rlO7HQRdRLTZcySYjbYtOvLfgxe/papHvuMIPtgzodJOwylehXLTuVPeJ1cKEJryWfacLT0bsOZKrHw0otMR7NKudY/Rstjv+j0ci0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628657; c=relaxed/simple;
	bh=Ovej68cLXFYOnS0QtY+PxZfnGeevRqdmCXTREH3RCZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qj1+jd9/Lk6qPaxQZyQhbGWvVqaNfekEpD7y2SgYqcuzVPOOikXWB97DFbkDGJkdbQZO9RRwUXlXOLP+yxmLwmcgmTbdN1H7POwx48ZmUZtMCZOVKJDWmOKg+Wm+Ymk+ehNEm5I/UNAbTR5i2S2D4RsokcyJPUS4KAX2CtftgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=sWuB5onl; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="sWuB5onl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=FjJnigpBeHIQ125/9YAb7UUdeqoXLLzRYVllv9SQ/2Y=; b=sWuB5onlYL2J6viw/vlLhohTgZ
	BXW3wnvb6UyofDDyRUtcjeqgmMAr74Tv0dwJ+V6GvbERvqkbmfBL/PYp8xmNpA1UUQbP8eKqTl1lf
	cnAhGnjCZI1ScptuHQBlYC20U/SbeWa7rjgC8hedG8BXfDAc7oBg4nfzjHehXiL2fz5mqeLQ7ap9o
	3XwsLjodlzqDFSwAEcz+eKbFSUccSddq5h3325DwyfbPyXXCtzBvlZUjWMOwUeI2OXefLlNMItahK
	3JtQoumPb64iCti1rYhK0+uwK7TJFlCUonLi3XLOz2pqTuN6AzzEGZErM+MPeTPgtpbdyNtpxnUg9
	YGstiSGQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJH-0000000F7qh-3si9;
	Mon, 28 Sep 2026 22:50:51 +0200
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
Subject: [PATCH v5 4/5] riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX board
Date: Mon, 28 Sep 2026 22:49:09 +0200
Message-ID: <20260928205012.3689405-5-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928205012.3689405-1-aurelien@aurel32.net>
References: <20260928205012.3689405-1-aurelien@aurel32.net>
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

