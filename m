Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530267;
	b=q1jqQ/1ykoTEsFGBWx10iSJp845drnfhW7hgEe4v+w2c+YCe953h/cv0ZN4uSzduI5qO
	 Xlclpv2CHmG/KFF0L4hBI0RNrr9AWFt9uGHBEp//yZ+/1ikg+Xiw9EzNhrIZ6BZ7/MQzJ
	 Zvf+hPArWHFENbmEtNe5PhT78UeJLj76XBmZ78Hrl0eL9I5B0hVcMTcJgqjy32yFIayaE
	 3PP1rpd1EdMmYVlOSKbeaLXGCu+RmjZKAZLoXZtWTIxoVa6sb96pDjjLzEGhZw9vDKnIu
	 Cj7wX5Kh848qqP5YcIfBcA6nL8lN9u6kfE/W9XxueX+HVC1c0/RjXkm0OabIAe5rh4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8LSEo0mNhx+TMG62Egyknhrrk3n9oM++PyBFHpR6AXg=;
	b=F262lLF6r1ro4gJ1UulGs7YaE4K+F0SU39B71wRRbQt1UsqTZg71KZX9AA5/i8Vkmgmh
	 emazQ6DPuE8OvoFMt9oaQ7NkBnalImfIfvl29CVbcQp+PzqbXGegncbQvcLkY+x8iPdGL
	 /pffOH8ZML3HnvJD0m/edaQXVM6cKjJsaMSzOHVx3pp+AncciwmnuDK9G7AE6v+qeVous
	 sSFwQrYil8k6RQ1qLphgVAMgGSEAZgBbYRsL06KCHl43lupm4+I49iQ9Wq77+Xl6C4YnQ
	 ecWJgYM8wti6hZ+utrR/cKaIj+BlJu5S3MHSNv2/qXJ8Cju+mmNqbEcXA9HJWoXLiRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YrUfbkvR;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A14D606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A14D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YrUfbkvR
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so126717f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530265; x=1795135065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LSEo0mNhx+TMG62Egyknhrrk3n9oM++PyBFHpR6AXg=;
        b=YrUfbkvRor6M+7mjB5j0TG/memu7CSrlkcJMnKFMHN/MoO7/yUamz5dL43ymRdV6AV
         H2iX3ZSyBB4JnRfQTuYYQKLNh8p6XgHE/iLIbCNg3XZQ8xgsAZRJQ+klwfslVUKotkIF
         0/9d+SgP+zDpFbd5TnNu/YAh1ook7o1NhlZeK63K5z6ksiVHQhGfnn6mwQoDfG9lDMSz
         63XJc7OIj4lp6ZKuwhv4JKfeZaNMokz1e0L8A8e4sJFFb2EXFAwuQvkFpqfXVkVmOP3m
         kyXEY85fyIC4YP65JYywB5vXmkNTqVxXFsCp1aBM8DttfbDi9CReUlYlU1E5fU7PUsBp
         3d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530265; x=1795135065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LSEo0mNhx+TMG62Egyknhrrk3n9oM++PyBFHpR6AXg=;
        b=W0V0LhaMfd+MwzZWysjuABlEvidG7skxPTyVuzBClnkIBML2bByXQsCcW61KvWLfdh
         L9XpSikuCaeMkme895dRqvLO6BwWrHQAalj+icU8XXg15l2oKfucgQGzfms3V1S7MwUM
         AWEZx37LE55rqSuvbLvnpBQP/bq/k4kDDH1WiZ3aqJdoq6pVLxXUup+xf5O80W2UABnO
         93oJTTwTno4isIOKCqPq5LZne3LceKvtGWEw6q/wWC5SZ1M2MGl2cyW1GiDekIyBggvK
         KA2/MIXiduH+sKLp4T5uYLNFSqcNuXcdAp5E3a6N2+pempD2p5fPIamI/tlahrO0uQMw
         Bh0w==
X-Forwarded-Encrypted: i=1; AL+hErGTjpzaxG+wIv/83SzyujVZzfn763pdA/gMniTFC1F5g2+F92JGKGf1INvUFh7A/YRc6iPg4FLqPG3kApk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CGpD87p+pD6y7a1f6VypQRrnhdSgR7NG34w1ooGTpHS1abaxM
	5BhNyI4ZhLsCCBdC7LfWhs/L5b9ORuHkksqBsBU+nLZ6gXVh4jyG9wLl
X-Gm-Gg: AYBFou05EsujBuBHguJbMPtRC4FUcPvvGYsD5QoHJHI3kXsEOOU0E7T1Q8qQ0U9rLxb
	TW166xxmff/pFicBDwTFpowjS9GpQwkMCiBRv+GGH/bm0PfzziOxGlhvZCNqQw1tHgNhiTpICuM
	8HK2qMyJltwW4pKGRsBNBFcut6vReEYOhtYnQbamcJzFdW4Vvn7mrW5XPgLQnx5yf9kd4CF5C1j
	aVSFVel43B1DjCHCItKvpGptI/sF6ntdqi2TcGlbLLqUxOuUzwLzUmO0FsnMTW5IrUseLUZR/1o
	zNS8wpkBzPX7Eu+ZIpMwIYeZHF1/13ca1UjWJMVncqccR0K/pDnlcev7n7MV4wJ9vqAdSbpQ88e
	PgD+ONtBQyAH9wByasnt4UjR/qPP1iqEL1agOOdQNDAf1kgvjcIxcEx35pURo3FCwtnje4ZvLhI
	TK7T/36e36LRTvae0dbatK4Kbvck6P1AScWojQ+Kzdp+wFAVcesCq0AMr1VUBul1t78qxlE21yg
	8mzDOHwvck9OCF7fSrFjCXFm3pzFm7ghPV2NvdjJwYwMC13jjcJ976xNWf73xswN99fH1dTJS55
	5dmyQc32EDCVUr+/4JcMzLHCtYUumP+g8OzZjIjSqYSSz6Wc4+xVqwPrDzCslAuyC5KGRje9QyB
	N1XcN6TUMk8wFdd8N6XQKAWFjj2cNwIJeark7LkWKjq5k35cV+To5s5+24hVLsDSGjUwJ7BYYzL
	ThUxZuQ6jxVuFddmdC
X-Received: by 2002:a05:6000:25f1:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-49c7381a73amr2038948f8f.55.1794530265593;
        Thu, 12 Nov 2026 16:37:45 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm2183440f8f.8.2026.11.12.16.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:45 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller driver
Date: Fri, 13 Nov 2026 00:37:44 +0000
Message-ID: <20261113003744.3668464-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-large-mayfly-of-blizzard-bffef6@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-21-ghahramani.navid@gmail.com> <20261015-large-mayfly-of-blizzard-bffef6@quoll>
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

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> Drop such messages from all your code.

I am dropping the SPI driver from my series since Stefan will submit a
driver. I checked the rest of my patches and none of them prints such a
message now.

Best regards,
Navid
