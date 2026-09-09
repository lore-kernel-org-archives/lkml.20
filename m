Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099A54349B5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938504; cv=none; b=lLkig2LqwE4kC0Gm96vuFzqEuGDymSKXMZHxuX2DokQIEYAY9NyPymyCKJNKJ4a07xzsIqkgQLfFzmjkfMfZIR36JHBIIz8awQpjNiv3H0kgNVZ0BS7IRBvX65L9jnKtFdEKEVy/jlohED/kxMZmfBw9d4m/xLvw64xg41LfR7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938504; c=relaxed/simple;
	bh=bdtfK8hlgNaxrFNODYutQUM199Ay4f+K5uqqRn3MwW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4BJ+W3+nllh6cOf5/36ty9sCKJcK9ccbbP2XjyVR9oZ1iB86vjiJ6RA4g+/Ii7JZoGBWxuHG/IoUcTOjQIOyMdmmyX5Elo3qeZkxhg74l8HXVZn97HtjLeETPF4zFabsd9E7txOj9KHjgq0WAr19t4GpOOUdV87g3DQwbEJgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDBvlvib; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDBvlvib"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so34788305e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788938494; x=1789543294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=SDBvlvibwtRp7WxoRjBENUi5Mk7PF4tbHz37lIYZBerv7MR8wWxDs45RYaxKpgFAWV
         pYI/DkS78MuIAuTGDO/NrjRYSVn8xVNEnDW60UocPGTgW5jSzIjsAkn/p7BynGilfNw/
         kdsBQsT7VKEX105ExxrK1qdogg9mUsbg4QXYchZS8K9PL85mU5trPa6zwk4GtM0i8CxH
         9npTCSxiJr2Ln48+KHPLMYHC8cxwbiDOrkPAkywyRhRxmylyzsieYIKOu3Hxo1LJdxYI
         pVevHD4eqqxqChgmWHfNJpBs+dYl69Yg+DxruqJA0H9OHi+UnZT8u6qZZkT5pkAe3Gjs
         La5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938494; x=1789543294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Psx5izFz/CT47tzHifey69nrknoh0GX9iQboe2Wpy28=;
        b=AVpOHmd+6oRJ+pi75KC4x4iQWg9aEE1LswzqtCLuG9J8tnAxEMlAjF8g9Vad3Zk57o
         koX1AlYZrUZGfCb8EXIm7lU3F5D864Qstg9IJVhqHKT6DnVqHvLy5HD3QRfhbOhAL0Uu
         9wQcFivD50j04o4/m/I1EopAGlQVpxf+3do0rmRPFGyG7BN+TiELDJgENmutbyimjwGu
         jcP34Ll+Mitc1tyMpJ24R/MOdKX0EH6tFOvX185Rx5ye5W+kePEO/sl16ifSkGZOmU8G
         UicgWS/H1dTKOYyggAHju3jQmUJS5Cv9SPPWzMrNzstfiPmphzGmq1CaoAqw79lQYvQA
         4fxA==
X-Forwarded-Encrypted: i=1; AKwUvBx5whmVwKRzYmOQxS1kzAdMNIGYZtwHpONpHXJ29+p3DiciEWCmibr2S9YQAYgFMltAIMFgJJOdPtBJlv4=@vger.kernel.org
X-Gm-Message-State: AFuF++mqMr5FUeUFtuyeEC/JbDJ1gj7d38lHgjl/oRvJaZWLbaZPPRzH
	RxqxipEYCmcvyydCMT8CqIws0fHfGDOyciKA+UZ0mFJ/J1RrrXoiwWP4
X-Gm-Gg: AYBFou1M/vg2EFSVs1ogTLUQIakYTsr7pkccRWuMyxB0rhCgd6CQ8Xl2k1hRee4hxfo
	4wegLLJziSBDmj+S7D/0C1QlSeb4b1slNaweLTYcVgP5SYHmYerQt9mz7oOsTTtGEeKsA1B/Xc3
	aF8Mc+1TUZGYySDYeIjgcMdTSOyVXIcLSKFPkCYy1qp9952tWWfgVqrqEtqptDOpTjM4MTtM1zu
	2+df9Q035VERwTpPLwVT78k1yfJGC84EfvWi5q6Ezk6Gz/g8eyD8p8wAxzzz3gVfnG9wLkDZcGL
	EyllJFD6DcMbDYDYTiHBDl9TVZFZ9O7mPE9gS14EKdvVbuqLYhiFY+grp5QdvD88jjra0b5t0qP
	pW/LtC430VPyG5uXx8YKQW7bFrSjBGJKuoGaP4kLI7Y1MiIemZutNCOWH3v0zWCNYOD1Qd6wxSO
	WW4R5gFJKvhJD/MvZTxI6HJuqWBLAT+ZegOQ9NOBrlVgGv2zGN3HupK4ddFg9rIADo8Po=
X-Received: by 2002:a05:600c:3511:b0:49c:fa21:1c86 with SMTP id 5b1f17b1804b1-49cfa211cd7mr325233275e9.27.1788938493693;
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm46703902f8f.25.2026.09.09.00.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:21:33 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Wed,  9 Sep 2026 09:20:14 +0200
Message-ID: <20260909072051.4627-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Fixes: 5236347bde42 ("arm64: dts: mediatek: add dtsi for MT8516")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..596f673a0d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -95,7 +95,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-- 
2.43.0

