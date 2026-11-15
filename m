Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748948;
	b=jOMkk/UIIVJuXRxJ4Qp8zVXwuIOnkj9Zm4yMx5nUKbX5ZuCQOYGUtbWA4kJztqjJCM5F
	 ZW3avBwZlKuFGg2XW/o/mQTNh/CseWveuLTRUb4fKSQz9hIdiYbJNvJaGCEGsq4tSR22R
	 X8tWJIVlxPQZGTX3XUhclXWW8Os4CFVidSF3XKrOBKZnwlEz2puag6ivV9cZY8gB/0b3K
	 VGte6O8L5atbq2MUBD0ZhQO9j2JN6qzR8oWELRbj4VU8QYDOT17noz6Qry/K3G0ZXZ7nA
	 QIFD4Dsss3nClnktaFUbSCVjDG+r8V4m0GuLhHI5cGtKsWAmvLWWvcrQwfQ1h0zo81g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
	b=TAl6+CGkwm7nJhr2ToAaHrEIaEezwq+JnP9vjFBamgJqJ64qtesksANqHt7FkQ+UElwb
	 LTvxFMJjHPZNjKouQaDEQTv2eLT2vXEbyV+uBgUC0sFYDtI+zY/jRHZeHKxDWVmKP4sRg
	 ixwSdN43VfhIFy4WmJny2lESYhwsAEGDLYAcghud3nhUtsMYEaM2Mzg+3j1JSVHocvzQh
	 ORRsZ3vf76ZSss+c02pwL7qT72H08zx3CbwT0XR/aCiqj5i2TeQKWHYgo8dEL1ckegB6+
	 /gpHO+zfjy8xBnG+3I/FpC9XEb96OeLjORUJZxsQrOujTZQ6bqnNQV2Pbn1dxwpyiGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkfYjDfb;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C474606A889
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C474606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fkfYjDfb
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a92144733so940924f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748946; x=1795353746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=fkfYjDfbVwOUPmPIcmRVRviCwS9ifEc92SQIdBZr9pS5uY45k0F3v+tkmY5NoS/k/a
         MmJHT9w1FkMmtoeFXJssFHnqRY2+56WuYvLRNvqM3WDLIZmd8Z+3s0RUJB4SqDYL0M7f
         VHBIYIkvifEwrjZK/ivGbIOHcpJBoRe+mWul4z4/7a3SBd3m34k2AM9n88liiR0Q0m7L
         VSskSpvfQtIBCriOyYHOcOCP2qvMvuF297l78meqpppVmTZWEZkHuZzBET/ZUrJsooE7
         Ea0MfWmLxt8Ento0PGdtDvAkiNx2k+PU1dvqhS2VJV9Gmp18509rlF5DqcycVtB4f3xj
         WqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748946; x=1795353746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEJ8tISzkZUJs3n5ldAazsbKPbtXICT7gb0PQxJh4L0=;
        b=ekfqD48yjRwm4Jn4sxwjkXSDqeH3lsHkCjnsm9Zfj63aNGr7mmwo2OP2OpRdw0Pgtn
         LeC32isZx0mV7HWiXM4LXkxbOb30X5+ZF38BorZiMApsqRG9Yh41w9srfpTbGOr/NMhH
         guCVyw2ymMzwfH9kRHkJdzDH1ao600ml+2xgmN5Fmat34iXTwzMVWUFIFM8/82WGJnNe
         UrPZD7AjrjmoVUtVKXZpsap0B8/Ha5Mtma78IN4o0BARRG2by5BH0Ua0j37dFsOQd4/3
         IuXdhghUqCgpwJSg4UVERuz1Iperg+VZHpZNhwmsMXk8pIbQTBFfq2fnbUibaN8R0lWL
         91qA==
X-Forwarded-Encrypted: i=1; AL+hErEpZA2qVK9iGJjNWc+siE7oWs1lW8dJH7jadpBeU1SU5/Bpo3nC26tKIq50am68fg4YQT+CbymQ3lJDk08=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KtLhMR8sD7epAlZAI7f6hXDhfRz/G7tL7EonqBo5+E9FmGpHi
	MRUKIK+MbdbbPc3lMZbCYBMK8QAfzfbjwt2nTFkmNx2p5VBQJz6o8yOr
X-Gm-Gg: AYBFou2RLGctYpKoRTDu4hbhuclP69MktdJZ82fLXui1R1B1sqT03KEHSlr5DVq/cFF
	8LNTdNLxiPpcKWuRWiO0pTGNdyW0vvnFT9o4qDnHCZVZNaxWNOX2wPcBdz6RJOYXlMkWnlUKkCd
	zHfWpxv/c7u6sN4tp58vkVmgkJA8UaC0leKva+MWGlOlmm9SYpEHGXv5g+w8SHqfwyFj3Gi0b0b
	ieB3bxBk4eAuhC4xcLW2K6vxpTDCANKeWiCxZmRX/gXu4WwagETOZNxc1BED43xzdpkn7O4RvAc
	GMRKAGoaXP6xi4hVW7xECc6OpK/2W2xJZDqomEUe8GRfKqPZH7eedGyBYio8zqpakdOSRvykyhj
	1bZewwEGH0AlUTaYmpEA/PCBI9B1smH/iebaJ8VUFArMyXr4wZF6wkNfT6AX4NwYEdgbzqg6Gic
	V4oW4CXUvdMAraBk0Q+qRX3KlS3KoDKxUKNF4tIDXejwFrxtt88Y6WKkJiXuo6psZiwEliYJhL5
	meH/5//B6Y1G5C/W/8kgTm7C0gMzMIMENc4TSfMHRPH14PCy1+3xEUDfVjXZIo3eonYvTTyhusv
	fnhlLJAZir9aFlnceTc9PRYdRqM4D9wxPOuwSEDwpcq8gbT5QvFzjmBDnzAraOPPXgG9uf+txIi
	A5w/J/XYMbohn/XNUJZQCI9dqSN5w2sQ4KX1m3rsgqy2qiVCiP4m/aGTCNslVE6eUIBq/4k53gR
	xlsCzyS6Rp9Y2EWPwYVS6uDMLwCHquJOGnl1WhoSB9bOH7fY+0HcleeFonTnFdMy+69ODbPbidF
	p1AIVR5TF/tQA==
X-Received: by 2002:a05:6000:4b02:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-49c6dbfff8fmr15902097f8f.8.1794748946344;
        Sun, 15 Nov 2026 05:22:26 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling
Date: Sun, 15 Nov 2026 14:22:14 +0100
Message-ID: <20261115132215.289236-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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

The Orange Pi One Plus and Lite2 lack the CPU OPP table and CPU supply,
so the CPU never scales its frequency. Add both, like on Orange Pi 3.
OPPs above the regulator constraints stay unused.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index 40c5c42b347e..a2a2e4cb0256 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
 #include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
@@ -65,6 +66,10 @@ reg_vcc5v: vcc5v {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
 &de {
 	status = "okay";
 };
-- 
2.43.0

