Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206055;
	b=4yDASZ/WUv1BPgbh09lBovywyXD/KFq07L24kpat2ig2k68kMMxPsPrC1JJSfLOV1GVn
	 Qo5Kn2Vuf7qjSCw7Wm5GaaaZMHsdPkieqR1wACvdrXkI/zk7xF1tVPD83+u4WP/mFpZVi
	 w5cNqswzoJspDpfc66g6y7fEoxDoKacPzpbiF5TVDKNUlcZc6oX1xjIAqzL1Qr70bRlzA
	 v2DbAsZWTppknBniB+8FjqRGVePqjow3e6tdxqLOubopfkGnOJKBl7QBYE3qgWIF3e/Yr
	 +LMRiKIgNENdhtHBRYqrH6hYG+2pUn8hpiyQoQ/1sgb6D6BTe4YzBgVugFc74IT9qDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hXQ5AtLbtETfyYAi8CVU1bdEjN/xUiyW0YYpN9HOqkc=;
	b=p3IwYRix17xdZ2QkXiEI0KkwoWAZDSO/f5tcc4dMHjFu2do3cAZCeolqMj2Uu3CyJsBQ
	 pZf3kXr6h+t6bBjKbl3tbuIEPBTGBnnTvw8Tm+6l0i0bDdMJkA7+nvsZxO+PG9skLzgWY
	 yPMrtV/j+7LfhR4SVmjCs5ebmhGTe0rXLh2MqOzRldmT2I2QhN+rGmSjiE4xYB6QJgtDh
	 GhCBkZ042ABv/twHo4t5oLeOuBBptkJ38+1Kh4TCPW6tc+f4QHl/s/H+ZHAHblBXO07Yx
	 t00B3hL4VMiJg/VNhM6lknh3VpkqIh2Gw5BM/uwdldG7ASrOVetuOxvOFlukkf0Q/Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tZqd/5Zc";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC6606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DDC6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZqd/5Zc
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so521729a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206054; x=1793810854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXQ5AtLbtETfyYAi8CVU1bdEjN/xUiyW0YYpN9HOqkc=;
        b=tZqd/5ZctCbxMs1eSeArkxV/6Yk8QYOU200v8aPUBd4k+sUr0zgoPNPHCiY9a31ngD
         gns6UZwWrMJNXTVzKhcVhZMb6F9fvMWXjAUgyuqPUB8GdNC/uij/msuxHgxXGDXrKgly
         CSHMSlmpjfyrrOANMGrLr8oaAAMetCgfX7vA5SmknjqRrvTHz3YTSlaJSAKd22Az96/b
         1CFbWwIGFdEurhKh4wzON/31ndk2aAcs113W4EE4HC3oXaI2QHAWCOOB/d4cjPgVhxEY
         AzxcmEQ/BbfzcZtH7PfgjPvaeYWCVY70q7VB9lCRG3LeLPN60Zc4HPF3kXaUs5OWSW4j
         uFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206054; x=1793810854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXQ5AtLbtETfyYAi8CVU1bdEjN/xUiyW0YYpN9HOqkc=;
        b=OLO6lnag4v9FAgBO3vAGcz/KN2imEbJym4xgy8xc5fDiJy2ZetmDsOeqzqACom1Bfd
         IXzw7QT7R+h0v8xW8mGCPgkhnlKyLnKNvEQiN7cwoPcnUSvzB5AdgFrF9cG/QpjNa54q
         xxAccOfPrI5g1u86AxVSmk89t1myrUr6FYjTDOVa1o5AWs8jky5FeKov12wSvtZQoaet
         yUQEn6XOuSsVv4keXAh0ScL4QUZdfE0AF39ilhp8GW2bWqII72cSvjOIk5ptwiuk5Cgp
         UimcAmeA8t7ir9rU3Vzf8opabVvikx1lnuJrH5S9gX/8gcwkDcs9WHIdqKr9+/PzM/b+
         3R4A==
X-Forwarded-Encrypted: i=1; AKwUvBwrbUXrfem8epYs28j8IwwPcCHB8IhCnHoKGspEjP2um95ASyMptlW6alMTt1zuwJRElkO3ARv67xzx+co=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZhVOgrVTeLmhISgDXfFcgDzX2WP62qrdhKl/ncby2cO2S+57/
	jFYYBirZCtqeuTY2GJSPC+CTgDNv5cfo5looOPMNnj361oNFG+zsPxab
X-Gm-Gg: AYBFou16V6dRafHEd9QvdVxezdSI+uSjUSNMGicC9FSBqVqiV4mY2ytyzwRTevnUmoH
	O9MlrUVft4ASyeg4w1jFIXIJQ84d0F+OyhpuURIw4GvNnpfqFmo63/GkcWg0PYkkorkhGNEc9Gn
	DZiBjJ2PqdSSoA44lgw5bjLD1DdXXKi6AQD9W5jzOmp1cnAjc4xMnHO4S2dj73r/rEqSFz23bUw
	ivrU7sowShcBQYKnK690gvwKZ2Fc13j4GpJ7fFNkFJxSrh+uRcdoId0o+H9k4PHmrhVlVa75pF8
	u+9TW8HhluRP82h630okUAmlZujczicoDFB7kYYyTqtiLB/PiPbUJgPELpp0HNAi5rBZ4+NyopP
	1k5Nbz9vLg7B6T5tSOwe0JnpyyvjJVL5P+A54ZkJyByPx7X2QFEa0RILzzfKPIsYjlO7UipMJIS
	HOz7fRG8zYSnZcELjMmRWtMY7zgfN1ccp7Mle+TByM4tm7k312FEqod3rXvLWe7i9CMFIdQ0P9y
	V82mbyYmcPrZVh+B9z00GBb7W+9aUz4Va8OBiXBvk9RnQVIiTAvhy6LrAzArfpIg2R8354b/yVL
	EoWlWW3ca23T7ENZ5G50LbzDjKurwaKx8A7oWsg5JLkDIO2yKT8z8ODXMWOt5D0cG5Zf
X-Received: by 2002:a17:90b:4d05:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3ae5821f346mr2159561a91.52.1793206054280;
        Wed, 28 Oct 2026 09:47:34 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c5b77sm2173048a91.3.2026.10.28.09.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:47:33 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Ido Schimmel <idosch@nvidia.com>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH net v2 0/2] bridge: cfm: correct CC receive monitoring transitions
Date: Thu, 29 Oct 2026 01:47:28 +0900
Message-ID: <20261028164730.253238-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Two CC transition bugs affect CFM receive monitoring. When CC is
re-enabled with a new interval, the first RX check uses the previous
interval. After CC is disabled, a received CCM can still change peer
status even when its RX work cannot be queued.

Patch 1 stores the new CC configuration before enabling peer RX work.
Patch 2 keeps RX work disabled while CC is off and skips CCM status
processing during that time.

The v1 submission covered the RX work restart. This revision also
addresses the two review findings. The interval fix is a separate
patch because it has a distinct failure condition.

The combined series passed 8 CC interval/transition checks and 3 CCM
status checks under ARM64 QEMU/KVM with bridge/veth. The CCM status
test failed 2 of its 3 checks on the v1 image as expected.

Baek Kyu, Kim (2):
  bridge: cfm: Store the new CC configuration before enabling peers
  bridge: cfm: ignore CCM while CC is disabled

 net/bridge/br_cfm.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

---
v1: https://lkml.iu.edu/2610.3/01364.html
v2:
  - Add the CC enable interval fix as patch 1/2.
  - Skip CCM status updates while CC is disabled in patch 2/2.
  - Retain the RX work disable/enable fix from v1 in patch 2/2.

-- 
2.55.0
