Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7F93B38B5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707475; cv=none; b=eokVc7t8kh/+ZzVOKKbuPgybi0n0nIfNsZ5RVwjx+xS4/vLkAs1mjQmXMIrmSuK54xpm7J8VqD+1AU8S/SG59G9tcqZRqAl1klDsNUYcdVD/VCoEcJtfkuG8NCHTAQPkmzuGtM18sAIIltqQZkXq5VXJfMkYmdprXn8IdPkSlfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707475; c=relaxed/simple;
	bh=pKSQ0omTuskZq+kor8UoJ2wNfDWorQkFIo60SsXbA4I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cakX4vp0BBExo1L94BXZW4Ef5yr9EA9V6ib3P8LRJ1t0XbRQ7wn6ufDEL834QMJPr5IhFLB9VxyLgRlnuIhVEK6/n9G5bz8baFjxUSh1sdq6XMtFlLgfiRuz2Ej1wMAYbDeW+iW1iNsL/5yNpCMw32BBmbID/ykcwniTUzvRkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csr8yTRf; arc=none smtp.client-ip=74.125.231.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csr8yTRf"
Received: by mail-oi2-f8.google.com with SMTP id 46e09a7af769-804d58d09e9so93632a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707472; x=1790312272; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FL7nLGZapJfQ8aVhLmuBZ6WgKTHLgrmHKnRf7yd+OgQ=;
        b=csr8yTRf+bRSBK7/gr3+Wdl1pFk5BuUep4Oz0HE/L8o1g96WDkJt5l6BcmAivzh1tu
         +rRgIJctKKsF33eLzd5Q3qyKWEyxz97crq/NV2sZyNMD/NXRnX8DKYqhcJ+wA0PJECIe
         koYmOdrpDwCLsukGKOHfNcudXgZA4gx9bcJbnfwxzhi0UjhkJFd9CBn9by69q6DBfAec
         r3oHs/RwP1wTdmJsUU8jvQ0GaauCA6jm/7jaXpdvGpLay/GBhwXTsmQSJom5NJ0uReCI
         LWfJ4k6v1hN/1nGK7ZIIxPghf/yr81iUZhcY8wz+a9L3m6le1xWBWOQzyiLLnILyk0FX
         ZM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707472; x=1790312272;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL7nLGZapJfQ8aVhLmuBZ6WgKTHLgrmHKnRf7yd+OgQ=;
        b=FtyowNQyNHdaEwnUVNhihdq+Go2jshGBoxzMF/Vxdq2Ivmf8yvfTNMheSA2wTWLZ+6
         6XlK3bBE80w7gdQSwKz5cNDz8+j0i8uTXZ+zt63iptDd/D8ZIBDZtyU8BO7k3inZ6OjV
         FTdTzex6Ny0focoMhs76zo80JtjGs7sxl8irYtNq0y5d7Jck4hYWzhOcQEIJekKO+Hz6
         Fgr045IfIUzzFMiVUnSeH0a+iOZdyCHNZGq5F2eUc9Ha7bcpzogw1+0/QSbUY8F9TF9S
         jTPJ6/AcqWx2juK71e5yLRzwIYcyqHqpXinp5JdzJJO9fKT045VHd9/2SYlHwk62gzb3
         SmcA==
X-Forwarded-Encrypted: i=1; AKwUvBxVYlA5X5FMAhw8OAY0MkOdkAL8Wc9z37JPZkRoQ0zl1F77jBzMjGhoFzMyg8ibsEtTvM7grQwkq62LkrY=@vger.kernel.org
X-Gm-Message-State: AFuF++mJfhuR5n8dcK0xIkyj/0g0x7RPSPWRJZ3AX3i1SGhp2ISocIp9
	cbm/T0rKpceC7Tk15J4ZBd3i9kvJnhLJAS49WtNEs4mxbcP0qb+faA9pfm6WQ2jtWhM=
X-Gm-Gg: AYBFou2TElJTVxy4FBaQUUCKp3wAk3NsXlkbWRJlclZ37E+O9P9xHBc14ycHT2GbHOk
	w46TRhQMecdU90Cx4hupfqU94YEPlKJ7tDQ70LpqXynDjh8rBmXYEpjUZfqVKwHh/DMRno6maJj
	EF7ontpS70XgWbxRZOvVPzqeiU8AMSGRzR4hn3M4O3pY91dZu03B2EGns1pHljAz0bmMjP/udbu
	IJP1bHwVXAT+26TEYVPGfO5r971+2y+XC+nvj33NMxjrYLTEAub6jMwLA/4xGc8qFx0Qfk/vEJp
	QuB5TOl4LvJFq2mHka7x7n9kt+IpVT3AF7uUil0kMR1GUpdvhgjRLmE4dKmbUgcH75mUM3Ky98i
	oKVZsJPyUtXICVLEUYzYTgcPmY7rSy7Z3ECevtbORtsDvga09VFf8hpFfqasstOaVLDAiy8HEQK
	2WWO1qf4xCc8TiE0YD565x4FF/KZYEbbPzocrpNUdWjg7XztRAVuBVLJd8XF79hqKqHt4Rav5k0
	Hje
X-Received: by 2002:a05:6820:f007:b0:6b4:3a06:c251 with SMTP id 006d021491bc7-6ca9ad3aa5emr1276873eaf.29.1789707472079;
        Thu, 17 Sep 2026 21:57:52 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739da0d0dsm256318fac.12.2026.09.17.21.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:57:50 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] rtc: mt6397: expose the RTC's spare bytes as nvmem
Date: Thu, 17 Sep 2026 23:57:45 -0500
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDMBAFf0X23AWNELG/UnpI9Wn3kFR2E5GK/
 97Q4zAwc5JBBUb35iTFLiafVKG7NTS9Q1rBMlcm1zrfjt3A+tICtoIvl82yIkRJK8fs+7HaPHH
 aIyIDLvTOh3lYHNXapljk+J8ez+v6AbkEtDF5AAAA
X-Change-ID: 20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-ee2a326ad7f2
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789707469; l=2221;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=pKSQ0omTuskZq+kor8UoJ2wNfDWorQkFIo60SsXbA4I=;
 b=D2wXBjz7609fl7tbdcv1OCK2Vh4M2UOlYFbDFGfPMj9WSbvog4bhWkntuU48WNlEyAVi731X1
 mTV4XKZ/YGDB/yukOfu0K8mkN81aRKfm+RoXS0pYHAKLn1q/1WbZXok
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Four of the MT6397 RTC's alarm registers use only their low bits. Each alarm
field lives in the low byte of its own register and the driver masks its
writes accordingly, so the high byte of four of them is storage the clock and
the alarm never touch. MediaTek's documentation names them RTC_NEW_SPARE0 to
RTC_NEW_SPARE3 and assigns the first to a fuel gauge, which is how its PMIC
battery drivers carry a state of charge across a reboot.

These patches describe that layout in the binding and expose all four bytes
from the RTC driver as a battery-backed nvmem provider. Doing it here rather
than in the consumer is the point: a write then lands under the same lock the
alarm paths take, so it can neither be lost inside mtk_rtc_set_alarm()'s
read-modify-write nor fire the write trigger in the middle of one.

There is no in-tree consumer yet. The one this is for is an MT6397 fuel gauge
that is not ready to post; its other dependency, the MT6397 PMIC AUXADC, is
on the list now [1]. Offering the provider ahead of the consumer follows what
the subsystem already does -- 32 drivers under drivers/rtc register nvmem --
and it is the part that has to exist before a battery driver can stop reaching
into this block behind the RTC's back.

Tested on an MT6397, in an Amazon Fire HD 10 (2017). MediaTek's spare map for
the mt6323 matches, and the alarm field masks are common to every compatible
this driver binds.

[1] https://lore.kernel.org/all/20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: mfd: mediatek: mt6397: describe the RTC's nvmem layout
      rtc: mt6397: expose the spare bytes of the alarm registers as nvmem

 .../devicetree/bindings/mfd/mediatek,mt6397.yaml   |  9 +++
 drivers/rtc/rtc-mt6397.c                           | 91 +++++++++++++++++++++-
 include/linux/mfd/mt6397/rtc.h                     |  7 ++
 3 files changed, 106 insertions(+), 1 deletion(-)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-ee2a326ad7f2

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

