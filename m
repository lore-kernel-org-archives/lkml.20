Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024D13DDB09
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723144; cv=none; b=rPhRHnlkaEg5wn5vB+q2nhLl2y3ZbSEhDCnSronEqSqLLttcX2Q5YFx0EXItVvJwihiW57NSJIivvi+am9M4Vsk4lnnSIixIarCYMhVfzNONA9gF1X2duYQdQSUSq1jUR8qLEvjodTgRNHDoCCQzqC9R5EWqb7R7lm20wJFshMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723144; c=relaxed/simple;
	bh=JLFkTSGjzUIWuYTsCyKMnF+JWvzM56a45FnykYK086Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilxT0783tlpBKdrowOO4l0tdiD8QVwrr6gxdmSDrcAScGr0660kzT7Wqy8je/7+sMTI2J9g6pyS5pTbYYMISRUWyfDUVPgoYqvOMbI2yRl6aONs3CA8aMkxijmXtiw3sZ4L6fmfaOuigeCr4Kuvg0HsJD/6u1AzZv6lNTjUtYw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ATgf9iT5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ATgf9iT5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso4201415e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723141; x=1790327941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=ATgf9iT5y91AKxA68wePvWKLuquWw+GvMKN6wUcnmh/YRhDy60FSNNNb5SbkECIwWR
         jQQvi4ztZYNO/kK31TJbvXIbycR3vVzw2iEOVj98SuiiWt9sucs7CnY4na3aTXTfI5us
         5V40HwWGJVISz9BA3RPjyzeLh/CRCgH1GzgWHCno8c1YIjtCwKXdO/+PgD0Uyj3U6egp
         16mQYVWB3tCJLwi5c5WBUZcXNBQ1+gqO7495dV5xaTR807uiFuiwZAJM5jadNJUGZCs7
         HnvIYOC/5kvIHiPMXVVFcVw5OSpPzR9Py9XP4up/lF8WCeTfAdvpwg6qLZw62k/9B8Pt
         4fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723141; x=1790327941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1A7PS1QVqkJqgZkHTjE3VxuBN5PJKQohl6XZ/YElsz4=;
        b=BL1Lq5ivWydhvjshd8qM5kbbGb1ZOea0c+ZtaVcL/sJm+1S54n79Ki8mMb1bsmadfB
         H1LHqMPtK4h503v5l+l+hbs5eNfrO17+SWWUNqUR6j4VvuUdFo7Hlv9CbBS9dg4sif99
         Gj7cIGBo0s9a7Wo76ZXuHTxUY6Hz2VYclKzo/fgnbTjvvDIh/gSDJAFFYCN2kn8N5qV9
         10UTublgrDKBsq3vgoqPLTbYHvOTUAjwyXbbd5HG09l2cBOZs0wrDu4VNmnrv5sOo+3B
         d7akwZ6Hts5HJKfuZyBUOBk+n0c+1sB7zsip6IiH0cuVwH1udRQgLUrZuUnMUNLIzZF7
         mGAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwggVIWGXxtFw1h/P2Iqfzgj18VE8MPratYKmZOelfgoFr0wyKBqhae/unquHwp6VNtb7To1HvMCFwNmXI=@vger.kernel.org
X-Gm-Message-State: AFuF++mZIaGzwUXzrUjeYbb2hdta2hdP8gq3RXfbuqX+hzGwx4A0zs9b
	JLzdXJGKucdfML68coVqtOwd3R26Hda1O1gHRQUV+QN7UYO1vcyf2iei8aRvBTXZlBE=
X-Gm-Gg: AYBFou0g0bTzwYfs944/rpZOuzUqa0PZc7AtoZn51LyqRsASwZXjzPR4DgoWWPQMlK0
	/7psDn9CipQ9NkCjcsZhHwzSYZ7TdkPaFUU1LhFaOi52Bd/wmwjRYqZEYRdUBdGs5eVMLPtxBdb
	iGL3/+5NFTjv/uIugfOyd35ALUsT0H2M/cW705Bd84cH7JiAhNKAxipU5whpD52IqdQZjeODUoJ
	eQ7Jd+fgx4G8eTRmY1hR2gjdnKfgaPSDYHdiwOF+lxZHCAiPomQZY2WJJAEJDXg9kjikow/CYpc
	WXopfYF0G9Dg/EdEdBcLipwjLDBwZfjC1nF8V8YKcE9/v8pGEM6nv7gGJ3P1XUbYeLvzRH1gVum
	6xDv4/OMEOXSxNtpbev1oqOF7hKJDqfY3URoiFCWTp8TGyj2ZkNnyAv6PSpxVrlmyftUITDRhIR
	4N5TA85cEi+ZK8RerP2vaGrXkXkQN9hyVClTmhEyPDYuk9ZTJWvy3LZvFpIN+SZwIsZ6c=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr19681525e9.23.1789723141196;
        Fri, 18 Sep 2026 02:19:01 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc481c738sm25502155e9.1.2026.09.18.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:46 +0200
Subject: [PATCH v9 2/9] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F memory
 region size
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-2-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=msp@baylibre.com;
 h=from:subject:message-id; bh=JLFkTSGjzUIWuYTsCyKMnF+JWvzM56a45FnykYK086Q=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jCeOn7obHnw1gNGifKrQxqei1jUut4QKDn02OHdju
 2fjVY1HHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR9RcY/vAqT7E8mCMnqOon
 6pknWNIaVq5RoGoYoRy1TKp0ZYlZOsN/f1m1A2FaU87eWTuFS8S8T/Z3Zpcwi+qRFfE2cwv6k36
 yAAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

AM62A additionally has a second DM firmware for edgeai whose highest
section end address reaches 0x9e700000, so the region should end there:

    0x9e700000 - 0x9c900000 = 0x1e00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5de..a8c794d07343 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x1e00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.55.0

