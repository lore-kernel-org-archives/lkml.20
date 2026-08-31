Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33B63ADBA2;
	Mon, 31 Aug 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151556; cv=none; b=Fts4u35+rWv6L0GiMrCRiHzv52QZo7K5KuHFDeXuWVvEYTXaA9f/I53/Kw9P5Hrw+yJKEM71URf1JgNsw6e2mJQrn/HGMQm40F71MYf+wSvX8730O+aPgxWhScWBkjCGgMmss5Sg54s89xCCY+rQYIEVCoAB2x6FBe9PWYHIVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151556; c=relaxed/simple;
	bh=gnssPAE5e9jERJdPqsG71tW7kOYJmhAmcMvHNkQs47A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUJT7kkLKuRQDmAQ58bPVDaTkdsN7vBRLE+7gqW3Sj6rw9JMIUk6DFj8KfYqExLvlHr5CpggyflOSXfBG0GzBKvxEVKOhHuLrxgAS6XZdHUYwQnyUnSLCAnxYx4+rPJmcWr1/NbdxyxIugvQpi2pN4tdPJ/Nyg6KXhdzb5mUpqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=CQsWHoPI; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="CQsWHoPI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9J2seGKRWZVNJ1p8+AjKgKsDACjOYKsJmiv89i7OaIc=; b=CQsWHoPIG+chRQp9FTX+9wntNC
	mq7WXVvcr6Ex4nrtJlK5nWnpfvZLZStA1SQrKX8PEahJ9LyNJ5URo92PNyOJiF7LZfQKeVkbW+BpD
	ycSAT/R/muR7+SnJHwWRWISrytdefBGF1gMDxh8j4tcMpy6Wff/2ZUA3jmdlaIzaCTr3KFbXGg+Yi
	WVCPUfE3VY86n9i+WNC5fa6sVRCTZJYiAZpVx4RUd8Q6qXK18Ts0zOf8CpHwmypovMjmZr/aYz3fB
	mIbaG0GCcp1R+pe4bfHLvJ6YZg8WB5Mv26hP84Z1d53jL57wZHnKa5gs6Ex8ENRnQZvmq90BTneXy
	UIK8nqCA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu3-0000000Ape8-2BUo;
	Mon, 31 Aug 2026 06:45:51 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v3 3/5] riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX board
Date: Mon, 31 Aug 2026 06:44:23 +0200
Message-ID: <20260831044540.3304350-4-aurelien@aurel32.net>
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
RTL8852BE Bluetooth enable signal is driven low, resulting in
impossibility to use Bluetooth. Add a DT node to expose it as an RFKILL
device, which lets the Bluetooth driver or userspace toggle it as
required.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index 5aa6fa89cab58..d3f256dffb4fd 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -43,6 +43,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio 0 30 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c2 {
-- 
2.53.0

