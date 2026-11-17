Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936528;
	b=z/U8Y/976cDweYLS4YpoNp/J29/q8GD7+850zboYD72lOvcK0I+NJUzEIeweTZPdzBSF
	 +9V29Al1NLlg+g8f8dAXfHp0hLpPOrKPDU/cMwQLf8und3FgmXsV4a9V/MXHtTWv5QHb+
	 JkRoPDKRK4+iynyBO1JqYqK3JKQYQoNfQ/0gt4MH0lJ1f+3RsADsA7I/3+RqleWGo5oJA
	 qd87MFB2MoJb4X5ocjVXDs6V5rGO1MhRyEYKodG+zb8RO6aool3cmzpetFIg8MVN1HykF
	 1je0aDU90N/52/oO8eBB7DJDGFnDY/8ZfbAh1gYZ+3dnvLgM/93GqfYIuSGrO5rtrmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
	b=Yd8ZfDEzlo++d0mcSrf9zRAtQeUaZxtPoLrAIIhv+xz5TMrLKiAwn2V598zVUC5+BRle
	 875S1B171CbGMNWPCD7iKthTbDkv1bwhditZ5CaZmEq3q9kBf4ihmWdrjEJRlr4tfq4pj
	 ceGvpnh+kmW4xIhtWuBZx6smmevwSzQPgtOtVdXLjEnpfnwDkIZH2v5J1xXWkSjevp/RF
	 jUzkrBZzaAR+QOIpV1NK03GD1eAiLFS5PNCwfj9U2qTvSEHoXHEgWoctIWAZR0Uyxf3Ns
	 xvYhzZAln+G8a/vzEXhdVWJR0YYtFCU/plvnjkiiYawKDNpYvYhMOq2op0CE0afgLbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7NPkbc8;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB686606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB686606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7NPkbc8
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-46556b9e02cso885010fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936527; x=1795541327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
        b=O7NPkbc8YXE6vipiT2iOvKlBCkHb4wi3Xj0BESPetKwjukqy89o7UXLSQtZ9pFlV/H
         1MxZMAgA9VyYFZpiwT5QtSkGW1CZK/8o+qbmsLYWWyq80ewCVvGvZ316r0nmvRV+UPvC
         LyIIi9xNgi7jK42Jx/ENd03IVIVsgdxti1+fJQxl3H+f1U6NPMy2FGEJqFi4cyp5wT7t
         2/LGLH20SbGsw5KjhIpvTPs+GDiHfLkmHy5IVCKw8IArz6Gv7TLMrA/hKMLg6GyQVaZl
         Bl8UPr0QN6l7pGaHqQEJ8ajRAL6GncdDXfpO80oqAHrfJ5U2zbKOA25QkZwXLSdPA92L
         XGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936527; x=1795541327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ka7y97kjrP1N5aLm53cFojAaC0fJOtAirjVuWEljQwo=;
        b=ohu2pZk1lKVpP/rdtrU3f2XbA6OdhCeQ0ulI6jgHVkbCemkGZVgXVJab+RPCvd333x
         jxC37kIOw1SG2x0MtmjgJn8EH4FvO0qredBzX9j3JtcKCjq6BEjsaGRW8xaUngAMe2NL
         3QpmypmWN3d6UNvuu2Jzy7uuhMBfELuQie2KL1qDOA5idzQrTPmHYeiTGO5d1MphbuuA
         AlXrbBpDSw6vWK+TulhVACRoKux0L5915JJEnlOZOLWm1Mjtbh9zK8MbDFTJfI421wi1
         7uKO4Oqj3VtKbZzKzO1M9X4FGgK8r5O+vAPJ/7gYbHVqi5qoXx2RnvL3McjOTSdf6wTZ
         xUEw==
X-Forwarded-Encrypted: i=1; AL+hErGAeIqhxO+KIbMGboYlNR1futxqDY40hzcH0XxCHKQHPpLiBqLqhj8Ym3RInolfUQzqcYcqjG5XTndAk58=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LWAeFaIPEYM/DCg1x5P8SRkKhbgtm9wTbYdqzhnr+S6HnKnbv
	ffOgyWDwGRunnlwt4b1h+z9TJtz70eJ7MNeHEXKUO5ykDEpUCGz+kxuc
X-Gm-Gg: AYBFou1IutQhVmS8mICdrfIbPG19MG99BdZ5GatZrvH0idgBBA1CA9Rpk1Inhtlkvcz
	qD7F0NBfTqGvKP0glWvTht5OvZN16GIBAmtJbDm3HoG5KDZbmjVKLJot9LERULV9Ahwv65jLyRI
	AEF9Cvnm5lGirzk02fkZbxcwWz1VNyvzdZL8Em2iSDSU46Q7Cmhmp74+HuXzTXnYHXQTbKLxwA/
	t7Oqz1lnNo4gTZlOn6bG4ch3dZKP1+i7qDeK41ZvmpKxjNwg9gzz/qLmWoHwr6AIxDA6ehV0sWd
	YQOVp5l1oENPNTlIDg/JB5wvcJmhTGAFX1ao7Yrq5ROJL7XdIDmxbvJ/Qaami2VpvqCkQqrGxnx
	ho+KHUnxoQh1r+H1ZcuF9KRbFxQIU2prhja65KXzPnNTGqIk/VtaTWeShypQ7eIf6Gh/kbJE9r3
	y83GpuOGFAmzMquoUinBy3NhtAoqQjPQqEdZyvDcjPWGEm9Xron0KsN3OWOttbe6EEPhj4AACmM
	dVHdrpdd2Ig2QT6qXmuO8T38jNKaSV8FniEH9My1zrXHk857rwQ0NTZU96ULuZ3BNTetszI32M1
	39DbPF0dqXe/wUd0seuF/mErODzGbQ==
X-Received: by 2002:a05:6870:32ce:b0:4a7:1d64:2695 with SMTP id 586e51a60fabf-4b415e97967mr2027034fac.43.1794936526492;
        Tue, 17 Nov 2026 09:28:46 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:45 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 0/2] Add rockchip-timer for RK356X
Date: Tue, 17 Nov 2026 11:28:40 -0600
Message-ID: <20261117172842.65346-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the rockchip-timer to the RK356x SoC. The timer for the RK356x is
register compatible with the rk3288. Address range taken from BSP
device tree and confirmed with rk3568 technical reference manual.

Changes Since V1:
 - Added additional missing maintainers that I forgot to send to for
   V1.

Chris Morgan (2):
  dt-bindings: timer: rockchip: Add rk3568 compatible
  arm64: dts: rockchip: Add timer node for rk356x

 .../devicetree/bindings/timer/rockchip,rk-timer.yaml      | 1 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi             | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.53.0

