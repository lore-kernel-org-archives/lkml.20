Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7067B4DE710
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792161696; cv=none; b=NSRFfu3niG2l8yqGyZ/xK7yGT9a58Pe6A3REnFOGvy7qPa5H/5q2VN3+2YSGOuaXfzWuKUJf/2yHFawpJ7y09Vw4OwDe+N+QO68v03boDTddg/wPZQkYYvx0UI5CTeGGyg1c/BFHfQCt9f8Wu7Smev1lgSg24BDYe45XuyZoVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792161696; c=relaxed/simple;
	bh=SaXqgEOyKdwDlxokS4s2yK08mPWXLB9VVoYMmSePtWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tu06JiNktt0heJjJMoeLbOVufLSmn1UHQPW1KwGzNPQx+zcUU5Wsg9JupyUyoyJhI7A7Kp+ASJJ1F+qHybXoCbWzbXI78rzHFequWFsfxogyjnCH5QV0v2wuaLF1vS9XeouwIo6v497uOOXiWFRHY+5M6o19Lh/aNs9XVrX4Duo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHyx+4yN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHyx+4yN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so112795e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161692; x=1792766492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=xHyx+4yN8MS5TGIYlBVOaod+EUvwDnocBkmYqPCIbdfJ2Yf83Hl5Inx5ahomuqmSnL
         8dtwNzu20NWl7pFtsrQDhBn7u34nz2dNt1LJFn/m0uJrWkoV+TyEZq+/SW494QFwXIef
         SyWvuF/nCkULFVxBmD/bE2UegSZCqeQJzXvnxJwTlNJ/YuW/jk30b87AX4LW+JfZuDGh
         1HHg4oyolC2BPMpby32liLBN9f1iRyCm6Qvht7UhYOALQRasqnU7p13UXRVt2a6Xh8oN
         fbxDhhbD1Eb5OQP0AMCDjdrcN4j++w++PfyiL+WU83H+zhKpAJ9T3jDX0DOtz1yHivl+
         hCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161692; x=1792766492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pA88NLv/TBiOG5702LaEvC3C13NKIBA4nDe3RPxHldU=;
        b=oCFIxfLrl3XHHdA+b59SVxTqbg/gv2GJuwYHGrbDWj+oRxZA/3hgih05WrbUZwn6fF
         21QekJqR69lvpCw+GHr+Fz53oWm+HCOh/SQa9tXcXUziWYCNRz3ZCVp8qSvwLbvAZjC3
         KnoSNfbSeQZEiqJ77GLVJ5rUHtzHEqKDsHIRGad9WclGvQbJyVwnA8+jSspUtBMMq/pz
         nkxovwUNJ42TLNM4o9thjMD1c5ezfWkxRZ5QTNzSfMAO0ZvpfhO7LJRA38rKK/kBnad4
         I6U70taGT2FlsX+d8Jnq7E/IQj1b6I+9OOSXqMvFA3VnHjRYYAvVBXddz7s3J35BuczM
         jG5w==
X-Forwarded-Encrypted: i=1; AKwUvBw6FLUKxocC7HQyzulEPE4ix3LIFAYK6Mg09tA2+qJRlkRDr20AcdPOkJtUZS/znG4kWDBMxS+5aHp3mMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1LFU7TaqXhNMe5RgI/ULVs8gXxqY5m6MWvF16I4tiB1gjwuAF
	84C43t0+isNLF96y0L8hBjqtuaG5v+XbHOWWu7lJg9AV1wETE5k4XvMx3RkkD8J+lwk=
X-Gm-Gg: AYBFou06w/8JPeGEuy7XJa9ZCfaBjAiUzJSyO6fqG4pkmZoO1tpt548Lc2uhlVnYwrR
	ouDJZseXcFn/7anbOEuPCOqAaD+pEHtwQBIbaz0huBKMoWP/TOZnM7Buz6Aa78IW8hkl5AAAseP
	06Z7PxVau4/GJq3V0Asetk8YE8PwCYSRE2NnrWg/Om5RrbQtsBMuyz60sFu1KS/zmiFXACkdS78
	AxxfL30NViiOrBx1c0boNw6GqpM76dMuJ5LPpNatoRdlH+m4p7OAIZThHe860CBG9zSspigSD01
	jfcn7dVK/8mikJHl8qbSHPLEfeykoAaoSdN8MkbnNwrOXyKz6y1OFlbQhgHwQ5fQz7ToMB/H5Vh
	BOt++5qDlzvYfQ+73M8niEvt6lvGOU/kHQ5oeCeXNv0K5AQAyQyw9CQjRBZ+D4AS97ljRMkKyq5
	kOp5wMs7XSIUwW3j8o7ekyPQNArfqr+EAsMUHdz9TDGCC9PCGBY2rQVN6xTVzeTvbzsoeg3ImJV
	UYf+0OKMWF+Xqry6n8S6/w0jj77ydlHNNTqDbHiUio4VOa+9QlRjrzQ1cmPUxhnd6x2eg==
X-Received: by 2002:a05:600c:1d11:b0:4a1:d307:b52a with SMTP id 5b1f17b1804b1-4a1d307b62fmr25383325e9.19.1792161692388;
        Fri, 16 Oct 2026 07:41:32 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:32 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 16 Oct 2026 16:41:23 +0200
Subject: [PATCH 08/10] ARM: dts: omap: dm816x: Correct speed for sysclk5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-8-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=905;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=PhDr6kpoBVqdoNYvmZIO1sO7TmGrj5fxqBZLDfq+g74=;
 b=YKJqXfJGsRC6h2W9mfs7+8pUluzq08OblX/xnpGffG9iXzk1/OGVF4+5i7Vufvm6VIO8qJ/T1
 gCQZ6eud/OwDFLxETFckzoUsSrtJEOZrnbegit/K746Fvy0zP3XUpeC
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

The default code for setting up the clocks results in sysclk5 running at
1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
divider to be /2 to achieve the 813MHz speed.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
index 76ebc6c3c3e5..cb990773b098 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
@@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
 		#clock-cells = <0>;
 		compatible = "ti,divider-clock";
 		clocks = <&sysclk4_ck>;
-		ti,max-div = <1>;
+		ti,dividers = <2>;
 		reg = <0x0310>;
 	};
 

-- 
2.56.0

