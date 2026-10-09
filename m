Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303893ACEEC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548828; cv=none; b=oqIFBdOrImZHqQhHvgm2Nww8uMuD0J0VLM2xpXh94F9GDuZCa8yI9f8pMi/9g2N57opeeJktNQvB5nVuYebv2KlQN2lzAUPEiu8vt0ta5V92DZnxq5p/SPTJkdX2dAftLzTMByXOJg1MRtxAUr0kbNZjB6ylEgnve1CYIWBnfLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548828; c=relaxed/simple;
	bh=zcj1UP/uWaZlOap6IYuctN6jhC5vXlt+4pbftX/pN+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=losLWd/GFUWA8xu7yKf8Qada+CirBiI1OM20X1jawxhgbVKVJuHMO/rxWrm5azOlzl0l1YCvnXkcoXTgcIn3fEgQp6D2+a+0BGk3Nj8qt73HdVPuMO3PN7HEmLHHeh9jnPik65mAusnXAZUTAVpWnG8QVPKlpXhbx/C5OPrdzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdlNDRiR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdlNDRiR"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso3628560a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548818; x=1792153618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=omRS45+vQBa/52QRk3tpqdOThEMPi8HnWucvIlnVNIU=;
        b=YdlNDRiR6I3yGEmGqO+bP90VwwvMF88o2n8k4Wca2Oo0PagSwivURFI8tdLJVHl2lQ
         cwUyg33yrVq4/sCyD4irARhutbsQuCcuCSySww+FyBgTIbgYCKjqvZJaU+h9itHsMnCw
         FqY5RwpBLMZje5XtDwyztyAoBQbToQhemdU9mvXXNL5R4gCuHV6r+agbedYxI4aHR/jR
         y9Y0sgqFN9PycJtWyRPO8Ddzb1KE0jEsWTkd+Y4ilY4K6oT5Cmq8bipN2rIpdnZ6bQ2U
         EYAlJ8RxhtXE6hTCs2rm+RXjCjTIA5gdl/A/NIUmPiBLx7TYuq16yx35HU3by/8+IEC9
         umVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548818; x=1792153618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=omRS45+vQBa/52QRk3tpqdOThEMPi8HnWucvIlnVNIU=;
        b=Wb7lFCsf1kHWx5NjH8H1w8kBZKg8O1U2l7arykRFkKrYjt567Pba1HE+J4IL1BUtAL
         mn7UbsXZiJd3Y7pG37+6kn1VDL+HEATlOYAe9ju9Su1oQuaOta7HIFGJrk64j7YfEtyp
         LUljsgojhUHvRggK6W0I3CoBcs7zb8YTjGs1QBPtawjYU3NmIfe460Qdbeqa7DlxIcXs
         gJnmKNf/OxIioT/YNUmdwVBYuDlLMiMqnh0sN12S1xgKUKWuHxUix+4qIlu53GIVbRmH
         71ozk3WWgRns2J+cCQ26/k9T9uypIhlzq9wgAHzpChHLbkvkesRcGTVhgQF1jMviw2Ak
         llJw==
X-Forwarded-Encrypted: i=1; AKwUvBw69qz9qgs/wh0FqrQssg+8G8GBqIL3dT7e0myHwx/bq74ik+WQQ0JrAZ9P7LoXBvjSiKascAMC9jDltSM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIn+g9aS+YI+vThf9CB7bJLAztvGSR4Ka0EcKWQ0sf13p9xys3i
	jME/xDhxmnUYzNcjaKKmELA6FrXBTkgf5od2BJnNOBUTy6adbpgxoTPv
X-Gm-Gg: AYBFou0N7IPtY84l9K1SLnXzgSm946G319e0CFJ/ZfVjpHlx3H52L+IqUu9AQvI0tfA
	rWyxH5FFb85PmBmNLkLkP/eBfFSG8Rku98oLmKdCsB7yb2TYsix1i/QUmJbiUUQZZf5GOnHXmoA
	vY24iHeDRBeraaXsSIbWjKrSv9/HwXW8cbAjyLY7WuLFlUUiGfMsqVoDSsWhDjFulCmPvQxY3FL
	+0yqAy+UHcsvBOdQLC8Tw8QIGRhCzPSjzJsW2UrZxIqBgiA94G8nXg/3VeefGwKaTg1RIBtSz1B
	DoZkYr/dH1DzRzPWgLN+dqumUdFUO1TQo2ZIqh30UvfZU2pzJSe/6vfEP7z4toaquM4WcewTpCo
	qbuQyl3vhhtpCxZ8eFUdDaEnHe14AbrWiCY0AaV5qHhXh/r/hJByBVl9FSv13RcWgFwaxDR1VYK
	QV1rKr1aPwU6qiK1GJ1OihjfG34EuuzT6hosP7Z3L+FON8C13No7DIJkWSodgvTgENDBeGnc+Ez
	eYi00ykneKpMiteSJ7rlx9D0jY=
X-Received: by 2002:a17:90b:390a:b0:3ab:413:49a9 with SMTP id 98e67ed59e1d1-3ab3a932609mr1852738a91.50.1791548818302;
        Fri, 09 Oct 2026 05:26:58 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9397:bb62:5cb7:971b:ead7:8dc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f4737esm3426729a91.7.2026.10.09.05.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:26:57 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 0/2] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
Date: Fri,  9 Oct 2026 17:56:00 +0530
Message-ID: <20261009122602.56624-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Some Dell OptiPlex AIO 7410 (35W) ship with DELL0501 in ACPI but no
physical UART scalar board, leaving the machine with zero backlight
control after the UART probe times out.

Patch 1 is a preparatory refactor that extracts the UART initialization
sequence into dell_uart_bl_init() so the probe function can inspect its
return value.

Patch 2 adds a PCH PWM fallback path: when dell_uart_bl_init() returns
-ETIMEDOUT, the driver reads the Intel PCH BLC_PWM registers and
registers a BACKLIGHT_PLATFORM device.

v2 -> v3:
  - Split into two patches: preparatory refactor + fallback (Ilpo)

v1 -> v2:
  - Use __free(pci_dev_put) for automatic PCI device cleanup (Ilpo)
  - Replace 0x10 with SZ_16, add linux/sizes.h (Ilpo)
  - Name BIT(31) as PCH_BLC_PWM_ENABLE (Ilpo)
  - Fix double-space in block comment (Ilpo)
  - Reduce devm_backlight_device_register() to fewer lines (Ilpo)
  - Extract dell_uart_bl_init() for the normal UART backlight path
    so the probe function reads more clearly (Ilpo)

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_init() from
    probe
  platform/x86: dell-uart-backlight: fall back to PCH PWM on UART
    timeout

 .../platform/x86/dell/dell-uart-backlight.c   | 156 +++++++++++++++---
 1 file changed, 133 insertions(+), 23 deletions(-)

-- 
2.43.0

