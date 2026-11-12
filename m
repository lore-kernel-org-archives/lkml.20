Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509333;
	b=lbJ46w/f8J0nDMcVRA46WbpAm5WkTxMChLuBpqvceUILkq6lOD8l8F07lTUc/c0jPYBX
	 EleQF7km8EEDEKVrW+XVuy3gXYe8PFj1QkPHCXUaDWgevWcJpJAtE6u5PXM5JGu7LHVrz
	 aO79aQamYaJSdbSlh9v3coKEINGdB81LPSq/YWtRyO5ekMcETMoG/HHDJvJJVWCn1QewX
	 oajbeQqBMySZ2FmIqLm04pCJbm9l25Vq/zjnVcPYVnN7QxZbN1/Ia6plcnGc4EddoU8az
	 2e6Z2S6H42SWK4DdUK6THcSRFcFidS6A0Xlh24Q8/8ZK/V/eASCOXjezbc1IhjKFcZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ehC3qw847iiWR5bSKdz3P8hEWEJvIA2jk0hJ/mxqd70=;
	b=UqQm1cQLL+AENHlfD9m4Yz4STCR75TtYKmm8zolI4Lj/3aNluGhYtlWRhjBkin30osxH
	 8REF8RN4h+dUcIROQEipWLPv63HCdsd2weuUW8PIBoKrM1TtKyPKAusB0vdBnpPu6H/ee
	 fqHvwadHFwRsT4HuDXp/pQyeOgXpsfOU4DrwhzIW2RIpppPBjV6oSEbHJNttM+lErwYOS
	 pTaVQxK5Jukc6zOBas3kUBM6SqyyUeOi/lrqO4t+z21fc3sYACmicuky4MOdOZm8agyu4
	 wrVyMwFnNz7OTlp9dGodqWzzyb9eI9HVDuA1yJxOEwfeqEgsuwWl7sl/CmcPYUpbr4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Uwp7LFy;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA8606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44FA8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Uwp7LFy
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4918c2d727fso51465f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509332; x=1795114132; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ehC3qw847iiWR5bSKdz3P8hEWEJvIA2jk0hJ/mxqd70=;
        b=0Uwp7LFy9H3iZbBdJ54W+9fgzSqkyHsStffVINr0TBShOrFhc7h8UEdYxpjnWd1AqS
         5+gNE+B5sxz5Zt8TCiXM9hd1tuKEQOYAHzWLw7hFAxsH7xCWosBsl2EYtj55IzP9APC9
         Bxpm4YKHBidjtg+XklPtQE8WS8GB4dplrA69fuqhw2V0WPsxA90TMNheJyU/MjdrS6gA
         wgNSiOfJ8qallXm+3EukTreqjh/4+MOL8/4p7+lCY8QiCkuWP2g0Ikb8R1sFrYWKgKph
         qZQ4xiEJXR+aLghKiBo7hefVt6t6+lqYoiWpTbFb0RrYyvE2N/6nTSVYuc2p20PsarDl
         OKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509332; x=1795114132;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ehC3qw847iiWR5bSKdz3P8hEWEJvIA2jk0hJ/mxqd70=;
        b=E1qNmQ4pNx1ScU9055HTXD6QFafEJ7Is+jhivxec4kfZVkQSiY10xrwn7vIekMScgn
         vDc6K+KzlMYHUs8UEZ4DWj+yU/Czz5Qy9ZvbOwbRbvwZJzQplXVL4JBDUo0z+nisQJbO
         BmF4g3k547HTT0LWvG+YocEGZslHgiocJcIE0QLDXMUmMPSU44pw1Rw4quPzofuwStFB
         LLBFdBOk9WLg6qcBP3D5qwRqo64ASjVJkB1KP7PGBk+uMrmPqreCophOk0jsaJOQgFFH
         NDsDVsl4GjxeZbtaII3Nk//uBVK/GFl0z3Rm1CXvg7HyylDk9x1vrt0FYgOpBs2sPT63
         uVcg==
X-Forwarded-Encrypted: i=1; AL+hErH1uZej6DXuIWIjTQ5RjlHn1DTBwjvXeqemyY33IK8RChEIcTAzr8Hh6eFnwfbtLRyS9jrAXH12YbFYE64=@vger.kernel.org
X-Gm-Message-State: APuU4Z88E/tN4HBYNw9vLDyUgDQdo83qUQQk6QB3R8fafqbsCcPg1x6I
	ijBAXxhWHvVgr8mtgt2GyLYq6WogWupXV5YzEjMR25sjTFCVQasRd6aq
X-Gm-Gg: AYBFou0sZqz0GKAN2jeOOPFjomtiqHZ++c/Yjg/BaLmXFabBkBr+Q7VFtiDFlhVH9kY
	hoSN779GbWtWPamzHWUNvCTczFQdBZoaHGeMQwBpy0cCjy8SePO8yMcS534X+MfYcHF8pPONdS+
	sPp2x1G+WaRx/cGs4YV1TJLXJ/QWg0yMG4Yt7VQ5kh0UBJFhSFw6EIa8TjvTqYEr0N+86Ai1w9R
	UZ8uvDE3Hb8aGFlwHSVUGUpfd9IYII0Svrwi4CjOhhC0sxcaajfnG3TG9167pgdGEqX7FtF/YOM
	9bTtm3LjVCs56iCbQ2s9V/D9MQlpEdlD3uGLe97xVOGb6im6yQvz+uwQeZg6vDSbaGNEq+BcT8r
	lwwT0sV6AuFt4o6P1m9hCZZRnbpL8AVL5H13HMzqg9lC56Stx1YD3w+wmpKZkvbtFd35FZqq4Jb
	fqAZlLcUECQmCzavirsSoufN/qPBonyMOdNJcKBFK1Z1oOizD8ax+1UqfJCJtqyNRZyZgPt4Z19
	8sH4Ca3YmvMT3OOPuxkgzUn0jLXgv9QZHAKz2/DWW+y9/zw1tpQmbJmDIYlgos/MgjdUs6H5Me3
	kdQPOfWdtLNIeA+HUg0Yb7lchRk127FXQH2usZKc9xO3TBsJ1KyzL7R+C8oRcZPBbw==
X-Received: by 2002:adf:e193:0:b0:48c:7306:18e9 with SMTP id ffacd0b85a97d-49c728c6e6amr559149f8f.43.1794509331619;
        Thu, 12 Nov 2026 10:48:51 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:72c6:df48:8225:6701])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm712972f8f.49.2026.11.12.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:48:51 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Enable RZ/G3L SDHI
Date: Thu, 12 Nov 2026 18:48:49 +0000
Message-Id: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABEK9moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mj3eKUjMz4oqp04xzdVINk85SkNPPktJQUJaCGgqLUtMwKsGHRsbW
 1AK8wX5pcAAAA
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794509330; l=927;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=Dss9d3rLSskDoDGjHbVLdNl2abzsD0tiK74OykusZ0g=;
 b=U5lTnM6vZZ2+5AixWA6rJ6+Y3nnciUxHLKYa+1CLUz+FfMARiYHqhiMyLwt3GjdSOAUI4Uioc
 NAVTQK3dmPXAAoWx3xXdKSBWWoc/Gh4YdGfSTTBlRh8+PCKbgrCeYj3
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enable eMMC on SDHI0 and SDHI1 on SDHI2

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20261104-usb_rzg3l-v8-0-ab109c4bd108@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Biju Das (3):
      arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
      arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
      arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  73 ++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  89 ++++++++
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 231 +++++++++++++++++++++
 3 files changed, 392 insertions(+), 1 deletion(-)
---
base-commit: e7d07f2ed4b4a14f79bc9fb417d25695cb7679a9
change-id: 20261112-sdhi_rzg3l-e0c7dbf7cfdd

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

