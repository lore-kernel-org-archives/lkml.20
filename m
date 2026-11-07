Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057657;
	b=QdV9Ye5T5W1pxSY31lVW7HK2Z1rSDBUfuOQHR5PIBsXFpMFDCaInwixuMZm4UnSyPO78
	 jgwcdeMwbBuaXAirlehY3pU9OQsZw8t8qq89YcAPbzkRx7olvv0fhSu8d+cXNj4CB7RRA
	 g2WLonTjAjmZCGslUBiH5aYRGR7TA3gdCPpO/2urDa1+aeLcofI3nJnabVXZ+iI6ldH6L
	 v2yvNHgUbmubjtccvJA7Zzy52kDL5EllVSa1kBVmz5nXfpXkOrj22AwzNOm2Ysaxm99tL
	 NFCa5R1JsT/G4t0BQZd93989PgAGXPJt4LOrqRsmCar+gHuJMKFhfxTwmnGv7Kg6VCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cYIhhXqp9c56w/QOvuXU6MeBpa7zv3rMnSX9cjjGbLc=;
	b=O1LwaaVIqV12my/fURhjBjvdd9nYK8pWmbMWoRiVo9mVwWWw4hkEsaxG+ua5sBZA4Ll0
	 dIucBkPYTsCrvqeWx45wQHZJU0IVuGpB/jOeg8lJ4DeSiw+qRVHWnKVzuD5a81lMRzHLE
	 skJa93/vB5WGO0LzqXjNKCWKE8fve6Hms9gI2wd8CTTo/xSwMn36Hw3nA8eJ+GMmpiMI7
	 bxdgyogLIYlJBfcnb2kch7f41+7DBtPceRa+b2NcKt5g8QZbv9E7A8S2j2O0Lhbrm4JcY
	 ar5czXP66PACJh32UbNFAA//ZEjQhXcPy0UwVoOnKpg6oytMspUMo1kb6kyYzd+Uk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alvI6v5Y;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B716A606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B716A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alvI6v5Y
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso672279a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057656; x=1794662456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYIhhXqp9c56w/QOvuXU6MeBpa7zv3rMnSX9cjjGbLc=;
        b=alvI6v5YK+3e3DeMiM9lp1AmmnoVQ5r7ZoZodCRBp4C6E0K78JLc1v1zUfM5PJnl7O
         yJT8TypjpMT3P/VyZ3JwDFB9FMOmDXE9X/5F/XTW8q0C0y9Jp5K6UqH89+U7AlyosAHN
         04o2ErN352FOCYnD6WKJQhjKhBoUGyhRCM/+raJSv+/renLjZnGNOlZPxwbcUrNvJXim
         e7dqrxnNlZAtysXL8gCdCbpi6vwM7XhRicS+dK5s/FdN9V+tu67FDpB21HtZgSCZIORX
         vk/GM0jNkabjHxez0xWf8QKU+Bi08xWRvOyYykJr7xhZLwHgN+bsNYo1Et9I0wSq5YcW
         vvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057656; x=1794662456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYIhhXqp9c56w/QOvuXU6MeBpa7zv3rMnSX9cjjGbLc=;
        b=i07CV6/p3jEqPYdLNlMBkRsM9SicDDVpwdXzcuWpLwu4NMvrBJyDhCzsl/oHCSSCpy
         CvmORNlEFWdsPTHPP7FYCkGJvbXumUnBpLgIbVsEybF91vcXAOWoto5CELNJR9Q7Eecj
         SaWdhbGpEtFCbM5zJl9j8MG4h/2YSuq9X9Ijq01iwS5kp3dUB20HDFrz9LtGaTXTyyp3
         Vsq4oC2P7SNEAbr8TRKOP+E8ZDfZcBrZIqx5a5tqlUlTXrxpf/8JZfSddyuk/WujKFCY
         sizsU7jdixm3Er4xcCaydlTAryYHhiBpg4w2z/LzUXVHU/PoZFlKemHNDZ2r9++ReRyi
         gzIg==
X-Forwarded-Encrypted: i=1; AL+hErH4xSt84jqGLVWWeL38oqGEO0c8+vIYjaxpc99Uj4tLi+aKGOM0A9yIVgaKJqL4X5Q76vPeNYHt0bi0fh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+useJCY8sKMHcl2b7dDCqY7QThLOO6+akx+/nXnpwIX2izIlOG
	d5KwWxx3l5V+WFm0wCAAnfHRdkf5AGcIUQqSU7iXTjyVyOc2iXvbiLhR
X-Gm-Gg: AYBFou3UKFkFYJ585ZhP19KxDFmQAX0FcZ4tVYUGDXyGRBsNhqgsZitUCutBvJ03447
	ehOCJcqbn6FnxS/Od0eLVUkn/eImtBluu7h8Re2wanuZnJx2hxzRJIh03Tslrp+eEW25UH3gpUq
	VxlA4RKoRWtUl70/zZ3h02zKaKy5IG6ko8Rm3/oX6edArKVPwnv6mwC2/kg5YvnpPpVDzQ1v9mC
	IWWR5WDkV0jOYv6iJ8R9V/inb/e0Kwe8/3baBbKJRYC7Hnk8D3FrzLumiDgi1Sjf03i5ysje7S7
	QrN40VcUdIOFZBqY8VqYeH77xcCZZVpkkP+FfvCXI8hFQ+8S7zKRQ8RKJeB2xschm8Ba1b48wtM
	iw9PsI32hE/NxqwDy3IVJb9cnEEZXalS9U1/6hmoqT8Ig+qMUvQPF+CwxN4HQGyMLKfCbu5Nw8x
	3FDf2hADAbdBY/mE2lRMfpG44FRsn214svsNGbSFI0Dv3Au1Zx1OWVNZY/z0bwfR3IQpsSjQe9N
	ngGp3RBHXfoVjZiM5vRMibhwSE9qQe4tDQv8j+0jpnx8U+l4l6JKOt3CQpig6aMPS4P9Y5prG2V
	R+eTpVP+DauAuMsHf25V59xLOSZdAaEl9G4YFvYpPnHnG3s8OIsqZQ==
X-Received: by 2002:a17:90a:d88f:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b0db6e5e5emr5621942a91.28.1794057656176;
        Sat, 07 Nov 2026 05:20:56 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101d3d0e8sm1626521a91.3.2026.11.07.05.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:20:55 -0800 (PST)
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
Subject: [PATCH net-next 0/4] net: dsa: motorcomm: MIB fixup
Date: Sat,  7 Nov 2026 21:20:32 +0800
Message-ID: <20261107132040.1066996-1-mmyangfl@gmail.com>
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

Various MIB defects reported by LLM.  While they do actually "fix"
something, the odds are extremely low and all depend on very specified
transient conditions. Since MIBs are not control path related and nearly
nobody would notice them, target them to net-next.

David Yang (4):
  net: dsa: motorcomm: Fix stats64 error counter mapping
  net: dsa: motorcomm: Fix RMON fragments stat
  net: dsa: motorcomm: Use safe 64-bit counter reader
  net: dsa: motorcomm: Prevent rx_bytes/tx_bytes underflow

 drivers/net/dsa/motorcomm/mib.c | 62 ++++++++++++++++++---------------
 drivers/net/dsa/motorcomm/mib.h |  2 ++
 drivers/net/dsa/motorcomm/smi.c | 35 +++++++++++++++++++
 drivers/net/dsa/motorcomm/smi.h |  2 ++
 4 files changed, 73 insertions(+), 28 deletions(-)

-- 
2.53.0

