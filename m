Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1ED3DCD80
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828595; cv=none; b=TrF2H4jjZSQBQUrW/tL+twyTH6MIjHMSnMY2B9h1GxcbHejSW4UdqBm1qM5+ju1meP5Q3fuxAYN6++y3v9D+Z1mYBu/jaODtzeNrBGBsJHoVxhruqTj1wGmv/fvJM+zTFzJLTK62nYhy4uhtmsCAc+Fxw07btxNILUZd78hYFmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828595; c=relaxed/simple;
	bh=xUcU4/ath3MB9X4umm3moMbocA/jtcRYF1kJ89FEfuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vAZ7VvWGK/0Xnf8cqgKLYhmiOOPR3t35q8seksQVTvSzkJajHdQTJqTWxP8kJMsePd864VKsjTikYCMesuGccC8Dgt2RyXLCE55A+VMNbsmbtZiNcl/l88Yhq33im9QvNDO2eIgoQ9/1LCWjc56YquqZqC3+Irekd85/8zYmTBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=iWjFxj8d; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="iWjFxj8d"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d710632717so17844285ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787828593; x=1788433393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z30Tt3xIoabTbn0/fF4p38d5mX0hzLF11O+CjT3QkYI=;
        b=iWjFxj8dZ1jcL8ZJMZv1pSAz1/BNMjpgdPDiZsG4OVK7zaD8ArMT8Tb1w+HnTm1ZDr
         alfI7uvtOVffIJadERkR1ulzNIBdgCajUoprQryVNivatxfgZy7479eBLUikb18QHkKW
         pJCnZJoh8eLSz74lvJCteYhhniN4iETH7RCB1XIaaD0AqRKWeKLO4GUrooQrdwLC+GqP
         vGGlWvCv9n/LzrppMi8e7tmd5M9jXqVciPy2vMJq6SP0C1J6ypGBFcT5YUV3UUiU/XWk
         VjVliNtWlBCtONXIeDrEycZIvVNSbP68A6Ylt/bGeFNT7pBWQIc2snA53ZuYh6dMAs/G
         oZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828593; x=1788433393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z30Tt3xIoabTbn0/fF4p38d5mX0hzLF11O+CjT3QkYI=;
        b=aCPRBNEiWD7jY3L5SUhnuLBEUo7tHoLa2DNUHFKoHb+hjmTxr2mArg5ZM3fCx+v06E
         9VL6sHR9bQzHm0dAu0SGu+IQRFvFFUk/+r/ulRIOxm0ygtDU/T5VU7WxjotXM6d/wlcG
         3E2/bKjC7kUlscAU0njTr2mKgA3b5jWTM96zmHSNc3vZOhwFhsFCFglqCMj7FUCmpzn4
         w2F7XY1R64opHo1NefLzzM+5/UuASPp5av2pvEP7s9B/n5xvliTI4+CIxPOq1/3wnjhM
         ueYEb2VmODtLEgxoco77NbrKOTHk5PX0wE5OFMdbIRmdQT6cbWmgiYTRb78lPAIeloMX
         I/8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq+/RzwJdruliCnjeJVM7lAaX1bEO+Ug2cmB1pD0GC5gRd8FJlytstMz+xpfQMnTZMiqYoZRxypooi2siM=@vger.kernel.org
X-Gm-Message-State: AFuF++n9IX/2e1HY8w9HMLGp/MJGhjj73qT8ZvHTmJpzv7CPiM9wIY/h
	qT7qwl6Odkzzn++ldFtjA5hyHQF4lM89LjVneCxLyNsYPilmFQd1M5/O9hJzhyDrhHP/adkvZNf
	QWXqm+2xVeQ==
X-Gm-Gg: AR+sD13xSyKNFv/IkIkpOI/Hcqlc0Jg121OpWj6MH1oQRRrjj036S52vTch91bJVoZl
	3xhk5OuKPfR15HV8kErhBocHoP9u0BHWAh8Ud7ZV+VtGd6U+yUY2UJrYRAsS9iyzDUgNUlGIj2D
	rGT9OwpmjorB3moW/FODb9Lq52uypVLKzm46hNMvxQZ+WA16H3JrdvteZaiIDy9ki4ISo9Ux5nX
	7DqRwNYz57Gn3enZ6y5Uy9T8+WWtoh2qcsR4Vnq5tHwZ5lTP2WBwE/2VFjwJjAbmheN4JTN2SdQ
	zNEE/K98PW3rXb2hVD/lAq6CAH/lp9vkdmJU5f/psepNStcaH2NsA16/nyCb7TDS+E1Uek+AQxq
	2V+m9WgV6CCTw9lZqIqIxsUeziG4XAMWQW5LRS3WPRQ1e+ZS9/78HpJ6nqd8wN5gvo0gJqUIOUl
	8Fc/0tUoswKafDeK4EikXeVdBlYGhaDDgfeIUgZDT3JBANsTaOZgKw4SPUBdwk3Rl51UhRJdnAJ
	t6n2yLDYb4u+F90U95kFnYFN2FYW+DCEFmd+JuKDfEQ6IRsKGFBdm6uHSkI4hknbPrZ6QcizaUK
	P9I+mw8=
X-Received: by 2002:a17:903:32c9:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d7079eb7e9mr258015565ad.4.1787828593135;
        Thu, 27 Aug 2026 04:03:13 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c4bea8sm15081585ad.82.2026.08.27.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:03:12 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v1 0/2] Add support for the Synaptics BCM4384 Bluetooth controller
Date: Thu, 27 Aug 2026 19:02:40 +0800
Message-Id: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first patch adds the BCM4384 Device Tree compatible string.

The second patch adds the controller support to the Broadcom
Bluetooth driver

Andy Chang (2):
  Bluetooth: dt-bindings: net: bluetooth: add BCM4384
  Bluetooth: btbcm: Add Synaptics 4384 chip support

 .../devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml   | 1 +
 drivers/bluetooth/btbcm.c                                   | 6 +++++-
 drivers/bluetooth/hci_bcm.c                                 | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1

