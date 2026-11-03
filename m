Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696357;
	b=cp1NbWL3Wy4MQnEXVN7sFAJsde2TnDRtY45mg1tscX8dj/w7BqCgUxqfG72JNf1S2dqd
	 OZuUP1VRLUQ/WAYNpeY61j1rLe82hRROYxlcT3pIF01pwwKqSdg7zF5KrGs+8NdF+mqbM
	 ul2765DlEsJW+8eItq2VK0ZwJxDD3tO4YWVzQLZVFiDo7qVPcUJuHsWIdESdL3xiTAkLq
	 YfYjbZZsFBl/GVb4rLFaCvW9xKBfpg/bs57vBpn/Hw7CT1xO0g/HzW5lHaBogu8/4aA0A
	 GGuLSkLhuiQ5xy2h3UPE2BZ/JDiR8SXdLE+8v36hXAbuEoxxZYylxpxUXwCFfsvhdbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
	b=MYyBWC4vNvSAkHjG1l+WGkZadwz4EOi9wDIlZhNCvUDkZraTXCbk7gnn3Vtl7nR8z+x1
	 KN+PrYXBk9DjWTN5FTDUXhmjVp7ZtBQ0Gyr4NNO0RlKLKvjjUrkYNTcvGuYHtpVavjmmZ
	 LAjiC4rAFa3ETsF0LTW/wOgYiGeRI2JLcqFhD7/zzHut8VQpISO3MRBi1LfnyqFNxep6V
	 TzjrNdVcJaQydBAajGImnWwcz+TxlipXlZiX65UrL+CDQk7hCJ4rf0iwiHTGafBPN0W4W
	 GjpbIDtE9KcaSuw4KOiXZt0LQ7U5NBWd30oLyd0cSqa3nL5sL1cVvoojP6A0MxQ8hSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwfWNW3q;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A79606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwfWNW3q
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab2cb02816so570058a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696356; x=1794301156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=GwfWNW3qDAiD5R4hrCV0GCl+mXn2dw/xdGiCMYzVXnh8sAo5j30pzKaJQ2c8Yqb+2y
         R2NhPV6XfLLtSftaQyzY0ccCktIvRfCOIIxuseEwn/HltiMoK38y+JTGogIgZUwfaw46
         tdbC23erg8nvyt6asc4sC+Ns8l4T2E9EjfmJ5LkE5tkJ4sFHbCnN7NiFOMtoS4azkeFM
         64lF9Cz4bFrJ7/YlGIFvdlMi/jQ11pfGwapqs92V9N7LndtS7ou+8UGIujsqvaUoqBSb
         XHuRVmowHsCLH17yFAVxR9OvuXNTXHtCiqNj/nRYcOIMLlHTNUdBr38yq2PURkXJCVx6
         +RFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696356; x=1794301156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rA1Ovd0Kzmkr6NATBzq19LdNhCK5jrPNyVR/5XvodLA=;
        b=TIX6ZFMrg9UPIPQJiJArWl55cteNt6d24na+Ksdex2EsVX5ZG9qdno7b7NVvqzVaqo
         HmixcV9Iq7DtTG/Ro8IeCLtU2QSurZgxqspHV1lq1ye/MqQhBK7j2I2Xv+BxEstoXmAV
         7dnY/mTjZEjCWrJRwuloBU9qmvW6ZP9GmmlhI3YfDWLDp3W8jR7bg/KitvUpQU47X5h1
         Od+lzLTvKHgscQ0I0I74pSofumUMo94YkbL3ri8NltrxzZzloTsTRgHD9rGX6QrWkzkg
         iw9sPkGVURvmSa6sJ1YT7/gwNY6RdF2pTxScYSWFAEOKoBRNOSronqItF/YFsDtb0hl6
         +Pug==
X-Forwarded-Encrypted: i=1; AKwUvBx8x+Nw9UZI0Sx5C90zFr3y8/2KY4jz7Fphcy9ItwXTWJmu0VryfsI3UUjSRgdD+7uDaVbV/mYhnoNCyTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZLyGcsEMP78k29B4hsoCe2Bp/GMC8ISKRyBvfTyVq5xG26TWW
	Bfuofc8L6K0e9zzDz13FBukD/Lgs9jixnQbey03k0ccnWTZE9z1jwF9w
X-Gm-Gg: AYBFou25k33AzboPrhrW6eDFACN+wcuz1PeFGtRHpB+jhpZyGQgSffC2p0j+4if4et4
	03Jt0aJs3tLUiuiw+jzNhuFM41lbj4A8Vmg35D/MZiUcODMuSust/UGo16NB99Dyke4ZkF8wteT
	/bEi1JqZ+pfwlGPGQKn8BcSchslYw8JUzsVqX+PRYCc2Bz4xZXRVqx92pPaqWiHCg0dV7CFuxbS
	+DJuAG4eLz+dAWTf7Ag3A8jjKPINvGJqD/+LjZH2PSwbEtrTXj+fjFiqc3CcGlYmhsUDaM9+rPm
	UhtOGiwZhPSIzlZCvSr4vCyuSgBZO3i9aYeLbcRYNd1S53ykzDpiYdiCTaSaNoqZwp9abjYd0lK
	TZm4OMYsVcdGB+ubFAJNbhM8kbesbGCdU6aNdiZg76VyXWKlE5nnKUfqsSdlD2Cdmc8cmgglcxP
	6P779W0xQ/PVvmNSMQmrOn7gxguG13vOPr+mK2kGUl+KraM8mh3QFciHyx7EEdYZUrJrPKDa913
	g5yVJ1F7PLN2znGaFzg37pKmt/PxzEQyDLklfHgC2LM83jy/uJjN68Y07UFX1Ox+K/RpyjWXGWG
	8T/jwDV94wDOQBd2Obq06S2avv5ZF0fydYvjwoQZo1biDqTFTHNWWsn6/7DOLdrqeMY6VUroj9M
	96xrORKM6jWhV
X-Received: by 2002:a17:90b:53c4:b0:3ac:9e5e:d1a5 with SMTP id 98e67ed59e1d1-3ae8988339dmr19037670a91.6.1793696355979;
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:15 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch
Date: Tue,  3 Nov 2026 16:58:47 +0800
Message-ID: <20261103085847.338613-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
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

The USB-C port of the Milk-V Duo 256M is the only USB connector on the
bare board, and the vendor image uses it in device mode by default.
Host mode is mainly needed with the USB & Ethernet IO board, whose USB
hub hangs off the same controller.

Use the role switch in the PHY so that one DTB can do both, and default
to peripheral to match the vendor image.

This changes the default of the port from host to device. To use host
mode, including the hub on the IO board, select it at runtime:

  echo host > /sys/class/usb_role/3000000.syscon:phy@48-role-switch/role

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
index d4e86c15664e..0ad1dfd9449c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -105,6 +105,11 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
+
+&usbphy {
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+};
-- 
2.43.0

