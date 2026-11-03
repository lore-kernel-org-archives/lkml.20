Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714482;
	b=IfhwPyu1Pf+zXroVJz4hs7DDvVDCDKgNaniZ3t91SGbLvWk1lUr5W+NKTv6wPU4rj+OF
	 uDsBtqDMjf5t51f5NAsQDuorebm2kmad0yvENys/KoKcm7y9b/bZvMj0th4giBlCurr+W
	 ljDhsP4rUQeYIH0WMebAt2RRM4FPCv6qjxPS35lO35wuHRfaXZBF6ttyzwCbr0WmV5PR9
	 iRvWn0d3Ptkdpy5j62f64e+e6swRdhlVmysGwyIue0lpgJDjVtfeM50qFDndPLiA3x9iV
	 vB/m97P8jaSx0i6bLpFrOiEHqMnzqZDPH0YGJtggsmwRpbrql4uhh6YQ7cXbtftLy/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EZsHlnUndDVe+vKUSGCoj7IkGFEvWSmKL3jbpdQBZvA=;
	b=pDJje67buZMEnfyCL+DcIsU0jum5lXHStN18QETtUKr+iYW8lPAmQkLDUb7iJRzhy7z5
	 tLR/W7Ph6wkpUnm74/23Xn9GChN9rHFVuGsoB0kBfcH1IupFF3y0S9YWe4TDyBaSW1ehh
	 oHWsnQMf7bZ7ct3q7Kg3BuX5dXoICSPXt8lcaHDE43JdM3Yk/EsC7NmJV1sj4fJmsnpcS
	 A4lJi4wAXJCKiAat36CZZ4juMWIaDkHtpku7kWVIqLkvco8sf54Qp6+/yLS/fEyJ4wwfG
	 5mDJ+T5bjwyomVrnOkVzmgM2YxX+0Atn3ZNVyGNIwIfGaz/SA6r8a5JzmllUgLqPbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFd6xJ2N;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDAC606D820
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCDAC606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFd6xJ2N
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso2801574a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793714481; x=1794319281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZsHlnUndDVe+vKUSGCoj7IkGFEvWSmKL3jbpdQBZvA=;
        b=CFd6xJ2NR5NhWmjfGK7vIJkFLy42NWFiWTDek1h0AKcALQcvfPM0A4EOdQEKqEnjqo
         5BHunepR9ulXEW0BkmvmyZSCfTrniLb2KGRRjc4qhZmMzL8DyIKbPYqdz1aYDD7qvRI/
         VVRLP0eLlRgV5DvluMeUecum10aEus6gS8SzC5OC5f5Qw73VL9/pny3ns2nxvw1H7vR1
         8KUZg5QlShHRnbKbTpcO4LTiBt+6WRYdTQHXlns9DeCtCmSExnKjj9dmhxbyHkREi8sY
         wYTO3HnVZQLVwVmBLjIi2XdgHWbzUqeVMU2xLfVypz/HbYLd7ctB2aVuX+8Ua0HnP1jr
         FOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714481; x=1794319281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZsHlnUndDVe+vKUSGCoj7IkGFEvWSmKL3jbpdQBZvA=;
        b=d92TArWqx9mT4twJ1Z+PH5x5MsuTL9aYxoOzDcojbEyIfFgErGQpjCGVNCFajmWRiW
         qDFMqoi5wtfgCV8ExJVDAI33IIN4K0ww84wr51Zd3SZ6/I0I3siMwaK9nPCq7lDoufNq
         tNamK7sRxC/NElvWVj7/+T8AaX8WZ8giPHOKGAchq8rSR4of8wE5FuFHpTCq6a/wtUxB
         0idOqDK3g237O1iQ22vl61JUQw1CLADaFif4N7V/+SuMLBMpHws/5NbXZeeFNvplZeai
         d72m5gMg6LDu2Umro6vepGuST+4Pp/uIQKIE5xAK7cd2WHuGVE8SlsnL2CYFwfy+cOBj
         mRyg==
X-Forwarded-Encrypted: i=1; AKwUvBwixPsfA1dMT/0qGGQndHEmahSRDJJxovN1JwmS2XYOyKmgLo1fy07Ko76EgCgffW4uMwpxGKUQOi2NDV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FwtwtsXHUfuY/FLPa1vb/kLI610vVZsm2EDi/w/pLiwkLTO0a
	AL/2T2/qu17OZLmc9ho7Dd5Ou27DmVNEoKBqGqBJtgqFALRIFGYbGRx1
X-Gm-Gg: AYBFou2cj9GfdLjz1ZL+qnIcoeKdcGLSnJPmViel7ZLKkKsWXtjbEKJ5j/mXRUx6d4x
	mFZIx5Efcxf1jIeGx6CPVgLVPdk+OR1PSCdpYAxCRwLG6Xn5isioSiW4xaLyQTovLNmTmv0d6BH
	Q3vpI0mBKiF8L0rldunwcYnIKCBTzVQ20V50/4mun6ne9TI5mmsOLEQvO3ivrAsxtcaI/DgSM4F
	OimBmT5qfjWpdi7+EHRfB0mBdlQBB8sp0BgyINjJszaMd9BQMZjmyUb+Z+lpibGtx0XGRM4wkLk
	tSqAkXr3qJVIGJ9khhbj9+Z7Y+PDnO84n5rIc//Hki4sn6qRLxhcQgqX/rkcLDJJT27Al8z/qId
	YoFkqvXBkuEHWTTdFKHthqd9RGmPyCTziuvE5hVYGBPaWqM63SUP5FounDWnsiybuH1ODeXCpVF
	JeVWlt2+e9ApCsBCkdoKXxvBEuAkx0SsAtZ7wjJ2+92dgvMr6b78kRY1Miq0VXvLEPFbOAifN56
	PEWZhM9trmaWfEF+GIoYxkWuNh8gUYIJwFDn5ZUu+iVzgKu5W5FZSfk4z+b0HIefxu4KAGGpHM4
	bqzn516rw0QvCbFDtEsKdo7dJGV1L/DvygqGXKDVNW4qz06Kghl+5ywwa2gzyktJ0wk2E08mmw=
	=
X-Received: by 2002:a17:90a:d998:b0:3ae:a59d:4e2a with SMTP id 98e67ed59e1d1-3aea59d4efemr5555004a91.47.1793714481065;
        Tue, 03 Nov 2026 06:01:21 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm4722104a91.7.2026.11.03.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:01:20 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/3] net: dsa: motorcomm: Add BR_FLOOD and BR_MCAST_FLOOD support
Date: Tue,  3 Nov 2026 22:01:04 +0800
Message-ID: <20261103140109.874443-1-mmyangfl@gmail.com>
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

Offload BR_FLOOD / BR_MCAST_FLOOD to the hardware for bridges when
feasible.

v3:
  - refactor port isolation and filter action for standalone ports
  - recompute flags when a port leaves bridge
  - honor BR_HAIRPIN
v2: https://lore.kernel.org/r/20261011030228.2761810-1-mmyangfl@gmail.com
  - fix build error
v1: https://lore.kernel.org/r/20261009005542.72860-1-mmyangfl@gmail.com

David Yang (3):
  net: dsa: motorcomm: Isolate all ports during chip setup
  net: dsa: motorcomm: Rely on port isolation for CPU port
  net: dsa: motorcomm: Add BR_FLOOD and BR_MCAST_FLOOD support

 drivers/net/dsa/motorcomm/chip.c | 233 +++++++++++++++++++++----------
 drivers/net/dsa/motorcomm/chip.h |   4 +
 2 files changed, 164 insertions(+), 73 deletions(-)

-- 
2.53.0

