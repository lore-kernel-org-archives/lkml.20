Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B654457A3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140060; cv=none; b=u9vRqWIwvF+CG9Li4JlNLaBSIEfnrT9sYpDVGY0rDkVqCBifazpQ1gaHKGljzgn1Us4MhzW4JBUILZjULw3Jr4tJhLTGZAXRs7xpxFeNfvQZCuIFNwvb6IKvq7cwlkr7Kum0d13vBT2cL5PSr74ZWwZFj8l1Y9AFfb7L6qodIEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140060; c=relaxed/simple;
	bh=PjYj5OcW4JfpfG4g+XhgfGTd7DVPkQ8LFPMLoMqOLz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pW73s/qkouQDJiLYRijKaEn0l2YxTX3Y6wcRnRBoyHWua8Zlgb1I7TNRHD/CGErTq2T+STdC1AaXc9GvfdZfVoKHYhf+n0G8pQB0R9EgZDx6bnrlWy9PY084KPyGzfyXtj/37oZWr0bRKRyQPSr7dR3s5yOF2Dv8zh/+5C8/vhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2K8as8S; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2K8as8S"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso4459041f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792140057; x=1792744857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=V2K8as8SjLWigx8l6UbkXXojJ2gH/m1fWlNAMrWMIR/3yEgwh2OsNVgJBHe4A890Bs
         FYBnyBHkNgUi7V37W+tcevvtT1ylogeW0b80wJbJ96jNmRWhQEgyMRhuFm9rreUc734T
         XXo6DmzGmeQOxnpX25MVKTfiWnL8eOjGwOehzTtcSE5Li93+cYDeO/HMpI++bv8jmUGr
         gQ66fX3gZx2T/3AbZa93jZQIggeEQvnWZn3PoQ5UmTGVp717B0TWhwAkgF9FvmPcb5M5
         QJTnkPj1FBm4QZVuPgaYXXqz7EYtm8bhiPlqNTENHCpCPDZArr0E1LIuoaPyEXwsbb0S
         yRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140057; x=1792744857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m37LH0K2JtdkMATWovRMsFTjhjXw4zu/xnrVqxt3zQA=;
        b=oq/2wBCzQuNiDmEmVxYXml5aVOMtOxIH+jcSh+jJuvZl4ScQw3IBJ7j1xhcME4hYQi
         rbHxVk10pVohjZOcJQaoJFtphAFEa1ctbg0ruQKxQfjvktGB+h6uBunvkgcehYk6EClf
         Y9hdP6ALBnt8GDX5ZsUBOyIr2VTMVtCgBg1K4dfy+6VcE7i+AV1iKhN2jb789e0mIcLD
         5AO9Nuhm9VNqJciKqUnVryuqJ429blxCY+zSFdYbkxOIPW3Ytn9KvvGHdRnG9bUmy6Xi
         g8zbxoZPgduAngACV9Qf59uWitwbrFzWoUZep2U2CCf0RA2HbIdgFHG11l44V/GsSow7
         DTeA==
X-Forwarded-Encrypted: i=1; AKwUvBw48MC40IqKq4B9pNceg7E6/F0kkdsEyjN2RQUNS6U7UkClQc7oV7Vzq13yg8g7Ru0ELw43KDJOIOLInYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHy07RoqG+uvmJi5t8zRTXcEiSC7VT3NBNmwnj9OOsbyxo8DaD
	OBiiHNAMGJ5W8X4JcSIvNegL/od/PgNVMnt2kiFYiZxD4BjFcbBp+7lc
X-Gm-Gg: AYBFou3wnGjc9t8ejQcyW/+ysRSH5suA+FysNTlCXZ6DX08qzDw7pnRxH/zo4Zh7qvg
	dKFOOyEgr2wXD6Ya5ktlnmdtad7oZnuq4GsDPxPOgj06bqoShAq3Q8g0n0+/IPcW1TxjapgsGe9
	sJ23JtalGp+Qh0o+1H5gYuUzjOPahgvHnMI9819ya55W3LK7OpJloY/cod/DL0r1Y7TvGTcHMVd
	ZQlranaS4EPuJX3apVNakVBsN7lWy2C5ZOMHWik5qsCRHyYn8ZXpST4ljdEG0JNqrPwC5QQbNG3
	2OWikkf+AgnNb9XJ4fowi3I80tIgqV4F3GgExkBlEUhGGiQzWbvZtQztt7pcwD/PNyeG7jPWRNt
	iVkDMXwZwoQHhIP4jYOKud7jdUnBhuwD59sQWHYD6N0a1NOtbl68/oMopfmk1hxkTrJlV2pR6MQ
	liU7YrFrhYpqBxxA909m/WnrOLxHRhma8cg32PvJWzFZGTKVJS4yy2vLuwjKeL3tXEGEZuH3GOS
	27BYKm/VDDuT85wMiAFFGBVPUa3FSJhSj8MIMXLNhLDjMqR26waM+e5wlS5ft9NQj4h88glEgI6
	MzOUbsb65oMtpgUpER89Aw==
X-Received: by 2002:a05:6000:2912:b0:48b:5e2:52dd with SMTP id ffacd0b85a97d-48dbace9d5cmr40663215f8f.11.1792140057193;
        Fri, 16 Oct 2026 01:40:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm3715233f8f.45.2026.10.16.01.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:40:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mm-var-som: Enable WM8904 DMIC input
Date: Fri, 16 Oct 2026 10:40:11 +0200
Message-ID: <9c0e289ab226609d99bee1bff4f175ff9796d8c8.1792139809.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792139809.git.stefano.r@variscite.com>
References: <cover.1792139809.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The digital microphone data line is connected to the WM8904 IN1L pin,
but this connection is not described in the device tree.

Configure IN1L as DMICDAT1 to enable the digital microphone capture
path.

Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index d05b1ab17fed..514cc568fb71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -348,6 +348,8 @@ wm8904: codec@1a {
 				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
 		/* GPIO1 = DMIC_CLK, don't touch others */
 		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		/* DMIC is connected to IN1L */
+		wlf,in1l-as-dmicdat1;
 	};
 };
 
-- 
2.47.3

