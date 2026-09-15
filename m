Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3A33C1AD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435249; cv=none; b=gnVdzEnvw5JTBS6mLLVNnbqjgG064qcI5QHs3GCrUKtVSqgk74yCXnxn7GI/sQFnGF1ZHueHvEgcQQSYUatWbB8UtnQvVPris0NEjL2/8zAN5zEcH/VQjy9H9qcOi4IeFjduBZDtts2DRwp9crHwJfcAI9gfUM51l2ippWwEepg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435249; c=relaxed/simple;
	bh=cSt7jQUGq64ZD/zrBvItYaOU0WRDoEfcG5mlUjJSbrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oh4crdb2YJvzSaN3kVO/jOPGuUGX0fY+a0gMU44DLl2E2xTIk0nFTk952dAmHxISvY5xR6oCV+G1GZ/+ghNHeWBMpm2XNyLRsfN2nCAThy6D6woI4WUZFjajw6vA1IyJhlY/UcvkxotWWujN6SYfoibvWP9ri8SRt6d7b0e5zJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfcC+YrX; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfcC+YrX"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90cc64570deso4992256d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435237; x=1790040037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=RfcC+YrXivdXRHIpt5VoSMDzj1Ea94+c0Cu2S05YGW4cJV4EhiBzwroLjL0BnPN4wM
         f2E2RP1VNZpwHT5XuCWXiXU30/LBxVtwpSoZpXg4sWOr6rq7SR7VC/+Dw7iAP245UaUY
         bb43GOcdPGhenirAnPEqQ5IQekysDQ15/vv3lIqOE8L0lILS1nk8NX7NO/QloQuyYbqS
         F5UDQLh1phEJojodbvg4NDEOicB+X+75/AgJCR0xYeEz4YKK9lgQTFZRwlNJnPtli0lD
         jiUkgRPwgUJrd1GpYVwt0fX6RsusdJXE/dl+8MizIZN5jCkpBE697qDExF5IJkvLZp74
         R68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435237; x=1790040037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OmgxL+YzDrrZHo0jFAYUF9npAPr+/wsk6K1vfZ01BB4=;
        b=uWciOsQlgAQTA//vVL0TykXagd0FKL0JdEQJAJxUQ00geJyc+1KaOv6coXBlIdk9bD
         SoRcKlzsZlS26XAa27Brj18rH9FfGOJFxUmR96DfOIB1SsbLpkYnkzfytRxWRqpve7dd
         FmxHt5hNL7QVrH8GV2OouoZKtRMgLpjutR3ijhuo4Q/B+V8L0qpiuo5P+0/xajWz2MdJ
         K9SqoEZJqaToQf0FP036Xv/AK/vK+EdTEakzquQgUl+8jGeJfyLyrWmfNk9sYNaE++Ed
         6gEJLTairNcoxaSPsjZI4U5xiqf/89dGvgmpAuyjy4QJEvWSH32YzXKFwSoxCCCeri1q
         u4Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzAXOu4TlDY8CpZUxiPK8MtW0ghq8QPSJEfcU92rOHVjH/EpP7TfDcTPCEcFjmjcqOonczLcl3sBnJlq9M=@vger.kernel.org
X-Gm-Message-State: AFuF++l2oDxVLU9EpOqL6dDhPnVpUIvjfefLydx2TXy1qbjYMZ+Fy1jU
	r1xBtJlBIgR+Q8B1Oji0m9WF/POiEWuuFx8YFtwuB28tUMUMP5rz5fE=
X-Gm-Gg: AYBFou3vGA/GwfdUrrDXpQ6m/Rc51hj7KHU146eD0OBM9M3unTyLpULfd9ZLlK1ayAh
	vvbDKg3YmgK9uUg14tAzN5vDp32AHjk6C6Q/ojU6dbvd7XlTTjZJMguBcZCGLuIbZwVlKwAm+Ll
	1GBm4K+DGXqmWAObLzuXzMluCyDmThjrH0LfeItF0FEVAD3GH5C0sWTJ5udqnYWsvACLqH/gpir
	3Jx0D+lYXA6l8Wr76kDcTm8z1XNjw0rg/+ith8JGG3jJBIW7a4vcNZUm9CsieBfoQT7QYyb4T05
	KYL+pwPUs/8RpLaDAwIQoejsDgCN1kXnMXkxj8EUPBkiBkz8RMsZ/Kakqf/mT1qcGLPff3wfaBT
	UB7ltUvvKnRLgoElXWewMdp2oJQRmhsBXCmLZto4LjTtl/8WRDI3OyHLvpooMm32gjE8bkJwFyF
	iqnn9Iu/+w35hSTwi8LGpOJ+V02ggyDh/vb6kChQU3fNaHosDvy7p5J69mtZU5Rg6UG35JoIzCP
	TZ5NRDXrAhdF3KeTalrEWUeMbnnlf8oaX1oNnRwDbKl+nDyynGTuu+cjK/HqlSzo6h37/2M24sT
	0HJXNUV+zIrHOovDhSAC1Fa31Rsig2j+4iB3LT+3eeQQ6RbNFMU7XMpBBtiq8Sh817P08A==
X-Received: by 2002:a05:6214:4383:b0:910:42f3:958e with SMTP id 6a1803df08f44-9123441de5dmr26302696d6.27.1789435232163;
        Mon, 14 Sep 2026 18:20:32 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a62b783sm91141946d6.23.2026.09.14.18.20.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:20:30 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 4/4] usb: ohci-st: disable controller wakeup on removal
Date: Mon, 14 Sep 2026 21:20:11 -0400
Message-ID: <20260915012011.61874-5-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915012011.61874-1-mhun512@gmail.com>
References: <20260915012011.61874-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe enables controller wakeup after the OHCI core marks controllers with
RemoteWakeupConnected as wakeup-capable. Removal does not undo this, so the
wakeup source can remain attached after driver unbind.

Disable controller wakeup after removing the HCD.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: d115837259ad ("usb: host: ohci-st: Add OHCI driver support for ST STB devices")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-st.c b/drivers/usb/host/ohci-st.c
--- a/drivers/usb/host/ohci-st.c
+++ b/drivers/usb/host/ohci-st.c
@@ -235,6 +235,7 @@
 	int clk;
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	if (pdata->power_off)
 		pdata->power_off(dev);
