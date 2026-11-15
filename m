Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748948;
	b=hF8H4f1Ii4aR2t62lPrhe7oXPA7TavR8B1M+uWgAdyzEqXeznaUGvZiSvWDr3BRo+r8Z
	 3Vi5DJX0nWfuu/c83jeE2Lib+sfhccWsY8E7Ed56iON3xMtcNfPJS9FhULcRmIeSj1uWK
	 3JvDozYbMF7rNdm6EincBzxF+qK+ZRR0mkRNlOXY+dGDSjFMk1QNE7U+PpEwNgqof94w6
	 2uX+peJJleoY/djUuNuwZMNhHbhRU1XeU6zrZnExqiKAJoImYJqAgbCCyx3y2ST2PqlD6
	 YnkUWWP4jmvosHoN4A/pb/U17lORX+lOvPqUrabJmQMyyFcWXBGHfZScUhXYhB0h2ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
	b=wYFd9iIM9hqwsIBzzOjc5ZPz8wuVr+puddQzBXmnR4OKHGM1oa3HFpcgLg0f12RXs+7+
	 dH6oKpxs09UJXa1HWKJdcCNxbM0cnmhODd4/XLtnWwBUaiwOc+rnPvB8gYubqsebmpQyX
	 wyceHcHFMLJNPCjFV+Q/tiAdJwof4z5Mdya4YEuJYjm/ysWAE+Vg7iZ3DYzCgDwz5aP5t
	 lOIWEUvc1TyPMQ7ve4tAaVRFuHofe5THOH2f2u7cHwEoC9usr/HUh5gAZEgm5t/M/0GOC
	 mTMidBLWp3GZ3pJR/L5hQySTEIjKnB3gAro1iQ4rQEqUrbb10IFLg93rtoC9IKw6a+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzWQKClT;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD7C606A887
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD7C606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kzWQKClT
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1523679f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748945; x=1795353745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=kzWQKClTNl9bBl9YgC4CWWkOCluChdcX+XH5aOd2jppkv0+8Qw1/gGICPRGRLgjbw5
         w4JdGhk84gFeTlGsPfH0+5ZR2slnHfIR420yPrAAV1cGLV3MogVQ9mHaHGOPz56Sl4tm
         HIsXrI6+pAuhkCmScj3H8PFr7KlQlVddl8O9yuGoPN2KpR6sIq5hzbJ9/XF+wGcgmIIt
         i4Jnlm8yH67C+DgHTOeMd2WQudULzcirT3i2AGq2Txvkfbvrv+Ou1TYbeMCykQnL+e1R
         I00q/U0SN5tEZ8v6K+sDz3sLeI20g7lLgV5KHRo8qsDhOW400RQChE7M1Z1kRTeybvKj
         DmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748945; x=1795353745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjzj5aEMnAhOnp3zC+6PlBD16bM2Wct+scJniZ3yxAk=;
        b=UZ6F19mQaq9yEb8hAhrovVVMrI647D5rEehmSPdshmgsCrWcKSr0YxFm65p1aL2WLw
         uE3asdb3ApACj0TyW97dn/DfdMW49pnEargwYk4EU8SSU8JnvyNiABiaXEYBnjrg0Pj5
         9AhaQW5QLrHQVD04NXiX/RMDcp9Y+08Ysy+2t539131pIHlPJW3GKMJxE9KXW7BFYcWk
         gANO7lj+PLqMRxNVGO9B114dnO/8iOOn5SMZOyoykrdAj6Rl5I54YWfz1DcvZ0JeOcin
         ZokEjoT/yfsnqo6OAWoT8Qv6IEMkJ8Ts37WO6uss5nmQotrwIZeQv0ngAwf1uzLrQKqe
         KNAw==
X-Forwarded-Encrypted: i=1; AL+hErFE9NjQmKeVMLV1+dp/+jAo6MndU+f+imrf4Hmv4Mi+Ecl/S79kFFQeXgbjvwPLLMLZnrZMLsm1vSf5lQE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iLrWIgyjzDDH7jBCAbo88IIAqbWd3rJ8VhB3TJuX5N3NiBb4R
	+wHhWWCXDo0IxqLc+gajVTxLxfNs//Ti2ESk/EXjBPzRbU3GaNTwzSHM
X-Gm-Gg: AYBFou0XQV6TfiH2sfLa6iYAOYsKrVlmCxzSnLUfzo0TqGRPadty482iNxNaCgKJqcA
	p5JnT7UTa02zG2TOecZE0OB+vmT+GbciPqx6jAi6lms1Yuu1pAkbCkASt52m/nxt2Xm96KVujbg
	ehQ5r/jdvG5AVSH201H5fCg+IYcmpscFo/lMx1DxIggxLOpQHadNqOvAoCfBTObYkUxKJeKg4fD
	8r9hasZjrsixN4fZsIt2C5eR0bx0HeylZrrpm5gBVGOTBAoCVSsQxTSE/XV3TfQU/HIamSaxdFh
	yZhXSU04EhiIA42tp0g7xGb48THkOYjcvZQAw3lc1sIsnqKrzlu87D9wvUsCLPfaGvMPApQsgDM
	rtri3sAh7VQ78l3Ms3edN3nZ99VxCagFlhD59Qom6/UaiKGYX/4hJ0EfInxKtszhSXhrGghPf+t
	O3XWsJmao8eynV/tE4v+60LGgXVJ6gqw3p7/cS1wxPjK+qzFpI4D2AHTMaLojKUkskRMWKuKWQ9
	/7A09i3NdnPHXRFZxYYa7LrHlsqeCTBqvDb0+aoRBW0Bklc3uXvlpX/hgokA+NEOnk4xTuCt3dq
	PuGt5nv0+TcWC9AnM8CkAYiUQ42a3V/aVwxaCfSklciAbKPyYA17r/ssk8CWV5FEDlOSs/1zL3w
	FjMwmbW9ss3a6/PqYlfZQ3nROnrYp+xCAEEQ0x+gqgAyf5v6npDB1V6K9ecR4iziLH30KTtObGd
	Im5ApaFxDkQx49xVxtNs1+4gHENGdGLjbK6bbz+JjbT5censuuYiA8nej5zbqCFkrivmyO9OBcF
	Fg0g1Ndv0t2UVRNSupvp4QDc+3rz9My+Mo=
X-Received: by 2002:a05:6000:2385:b0:48f:d7cd:a5af with SMTP id ffacd0b85a97d-49c6a645dd4mr18844055f8f.0.1794748945187;
        Sun, 15 Nov 2026 05:22:25 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:24 -0800 (PST)
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
Subject: [PATCH v2 2/3] arm64: dts: allwinner: h6: Add GPU OPP table to all boards
Date: Sun, 15 Nov 2026 14:22:13 +0100
Message-ID: <20261115132215.289236-3-jernej.skrabec@gmail.com>
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

Only the Beelink GS1 and TaiQiCat A01 include the H6 GPU OPP table, so
the GPU on all other H6 boards runs at a fixed clock rate. Include it on
the remaining boards, so devfreq can scale the GPU clock for either
better performance or lower power consumption.

The table also works with a fixed GPU supply, as on Tanix boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index dc7381c944c9..ce82aa265cfd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index cbe88ee6a487..40c5c42b347e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "sun50i-h6.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
index fa7a765ee828..f4a5a2215ea2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..f08077175549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -5,6 +5,7 @@
 
 #include "sun50i-h6.dtsi"
 #include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
-- 
2.43.0

