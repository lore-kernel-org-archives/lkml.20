Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9215538238D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791268977; cv=none; b=rqRz8VVx5zsOg7MFHPp2zmb3+XzwgcN9KV3iq68eE4c8zV4/sQsRskqu0d5frHHDg0vVOsr5H6enmfVapJ9I+QG8ngK0pyXoxz4RaeFQiQI+TT4wgvSNgRE/k4nOtsutyBA8wfJuN5MBUAS/3wr+xUcC3vzLnH8A9IDu0G2EAbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791268977; c=relaxed/simple;
	bh=UxmhJigIDtWJAL5Wyc2OYcZAIYRSzM3HsOZGZW/fzZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bb7vx8KR9c6szm1McwZvmoN4CmvKRVVwM6UbvrMfUMErdcmSqS8AgYR3GlMVTy/4G864dCxElszJjQpAHoZYwNDNQZwnyCfrNme0Nqm74Y09WKlQE7by1cvYhnn5mU9ElJD2VK1zTaOe0ggkHlayTA/SZhZnFKjbGfYpxV3OVJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsruWvY8; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsruWvY8"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34bb8b31647so4134113eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 23:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791268976; x=1791873776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=;
        b=YsruWvY8j/8w9ez9dkd3Ue5ijRfYjTi2VLeuafIz6bCd6W3JLd+jk3FRPJF6rzSJau
         nH0PrRudO9e9tMEouqgIv5u7WZrCchwb4zvtfOjAIM5hvyBdy0KFJkTs1K1X/Hv1+kRn
         Iy+cftqW+CbwiN3SOnNYigZpCiXyFjPSYndDhEICAgGk5zX6daDChrOx1qf+0r9IOhrF
         5jlLLKHeq8SVzdCAyz8BNGC3f7RVwCh7YyN4fzBj7XTFpxSmE7tXzZ3PUgSvRc/E37NQ
         HqRhsDO6MkEDcBvJnQfsMV4CepBjfS+x+631v1uLzyaR0CoeCdSzQ1XifSV/mHQJB6aG
         aocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791268976; x=1791873776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My1PIJVgQpM5EU1o0KTJuSzA87j4uP83Hs1j1/0ESPw=;
        b=MrY/rKCwTbndJn7c9ZMqxy6T6+i0GCWKeoqOxNRMMlHTYGSqB6GnYuSUpqm6n5aTTg
         EMhYyyu5/6pfHJQVm4ihUt777WjnO4b+ATmolMxRIkApkIqR90iPCAwDe9FCFeFjIC+3
         seaBPNqYH2bipF/6aVJ1xfZDLDnNhfDq1I2U3DhxWTEfPEwdnysaIpYwrLvj4q29bf1e
         nFU2IfW7fvQAyF/qoONaL2XZaCKX7KQT9bxw0pH5lQ6pyzNFejp22JCdhzkqQfKufRQk
         2SJf0b5ugvwlY/nsCVt4R9R3NuAAuv8P9x3xwhV/axTd1i/Sna/+7i0OUVnX7xpUYZle
         wkwA==
X-Forwarded-Encrypted: i=1; AKwUvBzVPglI0wfBfWESjO4Au+bMjoxpoW1qBcccEbj5XtgFR9sYFsy3uvjyBfGek+JLlfL2GdQUWv5YwOSnnGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVtzTxNtAADQbJUtQTWwvB8ErWn17KM7OUgqert9n4xlIv/0Ft
	5J/uqQNNSEkKLfQ5Xk0lVzOikyu6l2gpk293pS8uFa/FWI1CSs7OkJlW
X-Gm-Gg: AYBFou3fqHHfM6wCAoqwl+enC4OxmSaE26V4xKfc5Chdxr1SIdhAkNuZvWoybgGky7t
	0M3r8FFQ9EpxozJetV1tQqh/nLtqomJrzojQab8WPeFQHVUFkHAxxN7jc+flAvwuD5fgusUjq6S
	cm3tgVcxzYQGCU73UBUzH4lNGX/XeK+YXGQc6BuhI+SZAHt33+8iHeNYgZcL4JYiw3KxbQTADyR
	1llcV9rI+avRiVqZZ71CqOH6wDED1wCTiWeFNNBYnpQBz+mArV1zvhMT9I8vDRsLTZ0kgVhhwgX
	7W2uX1EFEkHwi42Wj+19Vv80pQoY/zksKyfRhRwciCkzGiFCcxWzzfxUrDKMw3h5EySc4EkgFKW
	PNJlZ57wik/bUEv6z1iZ2FjqsmhQ2XtO9mPsMn6HpLdpRoOVph5eXFAxbkc4z9VLnlCNXaWMSfC
	hUd5SiIyQXSHuSehgIglu8GczchmlM5jL3ODGG4U5dDWe6GTBtm22cFuwcqE2N20Ecrm12O2ZKw
	FWe0JnC
X-Received: by 2002:a05:693c:20cb:10b0:34a:c4e6:27c with SMTP id 5a478bee46e88-3514e2a5347mr444919eec.18.1791268975568;
        Mon, 05 Oct 2026 23:42:55 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:55f5:25c3::3c3:b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a2c991sm4617347eec.14.2026.10.05.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:42:55 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 06 Oct 2026 14:42:23 +0800
Subject: [PATCH 1/2] dt-bindings: clock: mediatek: mt7629: add RTC clock
 IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-mt7629-rtc-v1-1-e556386df816@gmail.com>
References: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
In-Reply-To: <20261006-b4-mt7629-rtc-v1-0-e556386df816@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

Expose the 40 MHz / 1221 RTC source and the RTC clock mux. Keep the
existing CLK_TOP_RTC ID for the 40 MHz / 1024 source.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 include/dt-bindings/clock/mt7629-clk.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt7629-clk.h b/include/dt-bindings/clock/mt7629-clk.h
index ad8e6d7f0154..aa94a398ae05 100644
--- a/include/dt-bindings/clock/mt7629-clk.h
+++ b/include/dt-bindings/clock/mt7629-clk.h
@@ -115,7 +115,9 @@
 #define CLK_TOP_CRYPTO_SEL		105
 #define CLK_TOP_SGMII_REF_1_SEL		106
 #define CLK_TOP_10M_SEL			107
-#define CLK_TOP_NR_CLK			108
+#define CLK_TOP_RTC_32K			108
+#define CLK_TOP_RTC_SEL			109
+#define CLK_TOP_NR_CLK			110
 
 /* INFRACFG */
 #define CLK_INFRA_MUX1_SEL		0

-- 
2.55.0

