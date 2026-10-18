Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0030A3DCDBC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322050; cv=none; b=A4wWHOIBN9rnWxyS+eWYeUH0IWuuqGIzBZfTNmkM+vEtskdMqfUAa86fLAOvst+Ws+uTSQHcogPeYlIN8oaGNKlD0OMWhmJUWgA3+DkZzQnPM/DR77Jb+VJyMJIqA205NTlUUr/ZU8ysKW1hlN2LPcU3qAXx4uTWq2xqQZ432SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322050; c=relaxed/simple;
	bh=fctVlUNxkjbmnVMzce9QkG8geM0AkD1apjhciOP8ows=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWz5GurFnX1JOqHWBW5kzirKm2VvGzZ8L86qwzB3GDFPXaqrRmX/CjWzDvNpIGnTjBd4Zh2+D+vSlBGeFQ04HBJA516dxnNnU6B0/j6R6DPKUZH4AVhwPpSnkQ5w7SBVU/WUgb5WEn3ANEiBGS9ACMNv6fjZlUYw5YFVAr1S//A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTuWCOxg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTuWCOxg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so9231135e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322047; x=1792926847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fctVlUNxkjbmnVMzce9QkG8geM0AkD1apjhciOP8ows=;
        b=lTuWCOxgProbE8mHJ9wowS4qKnK6ja/DLvfMZ9jtcqypPq1J8q53ZzbK97XHbnhvgc
         MLitGDvbEYLZzrYheqMuERPaCg/nZ7IAuQuZSz2k3fAyVy98J1bVkGkHu59olvasf4Iv
         DCJpBd3u6maPityrvNKrwXVsEV00AzJaQTtzxhunkFtZb8tVLlycoOFbpKwbB5wclNGj
         yvVqrxGzK3H+N1fhuO11C57XrMHiQVdYBcgQveWj7iHyeiGB7HWAK1BMix2yQkVGtH9s
         fzX3CTsTnSq7lmqpVqwbxBSE/0k5LME6Lv2Cggm0tVskjI5jx3bjgVMLFGwo7R/pHz2X
         ae+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322047; x=1792926847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fctVlUNxkjbmnVMzce9QkG8geM0AkD1apjhciOP8ows=;
        b=w3afrI1/z0niiiVDxc+J/H/KQLxmHr88HuDNtRSk7z8JThDbk8edoY3tSbSyvy3ZGV
         nsgbMdn3VZmyZdL9M4XdlBwfKgsS6yb43/nwLT7R9BgLoybXSoVxH8IT6mFmJTBrTSvX
         yWUUn+RNE0I2Tt3HoYzGk9t1d43kI6xdSRMglKHl7cB8FnsmjPk612JuoyUr+KtDf2Qg
         shmSTczQRo7dYro/RHeKnN8WD3s4Ynnxj8xEnoDygNv26ZbkQEXjaTCn1O6gYtCQEchN
         dTd/WrDJFfBmfquDW+g1JURdTrNj/NCNO8sP6+wRetLPE75Ssv9IQp0JIH5Kt85aVphJ
         PY/g==
X-Forwarded-Encrypted: i=1; AKwUvBy9UqSFrkWXpPVh31/HYAHC+HEu5G+wp/grJsghZoNW9+Av1bhEE4bK5hxIkO6zGUohRh2QZjHJ9CzykFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLVEXKmD2RCQ68r+UMiqI+XkmooIkg9WSNuzIf7DWU4Iq3w2NY
	LLRDx2ixMF5s70NTfVmAm76PpKgazdJFBoIjlWEp9DxbHxuaI6lIKAZ0
X-Gm-Gg: AYBFou0SbAaBcUIfKfniHVyw3nZTGvFP+ApP8Q2DOm7o66Dht/69Tm7nS/3hgbCXI6c
	9XaNlaJ7giQTIppq9eMKjwlXIjgRaorgCU8bn1+8hOLYNlkiU5514usb6N41bXfk01ump9S6qbK
	DLCN05G4r5MwPr21wYGweC/IB88jthgV6QrU5o79DCspC8RuLbr2aRl7plg5LdQCI9v0eIA0gFD
	YBE5GSjNPjnOaLKgEGftoms1BbsuoLxCbcbntc2Cq4F4GcWhkB+BNs05RXVmeSpfxgXLTriPwIx
	jQmB7ufd+sfAcd4Lygt7xzxdLGqivHvA+OsLd9aSyeU9RDL6vm1HTnAzsC6noaJGwkpIQ1PoEbT
	ywz4tjaVuHakku49gunyoRrPW7pbLfoMaPbfKYHboEpO3JhK7tqLzLCSCvtPtoBvxRezS/HC+zx
	jMWwx7B6Qkyx6LU2RMtUWsbvVVLv1aNOULZrgevjc3wuS9eUwHOkVm43tVxmqWbP1s+RJLzw==
X-Received: by 2002:a05:600c:4fce:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1d75ac25cmr109797265e9.1.1792322046507;
        Sun, 18 Oct 2026 04:14:06 -0700 (PDT)
Received: from fedora ([94.79.80.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a88bbsm290127415e9.3.2026.10.18.04.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:14:05 -0700 (PDT)
From: =?UTF-8?q?Alperen=20K=C4=B1l=C4=B1=C3=A7?= <sabri.alperen03@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: class: Do not inject sleep time without a suspend snapshot
Date: Sun, 18 Oct 2026 14:13:57 +0300
Message-ID: <20261018111357.164684-1-sabri.alperen03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003163138.14221-1-sabri.alperen03@gmail.com>
References: <20261003163138.14221-1-sabri.alperen03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alexandre,

Gentle ping on this patch. It still applies cleanly to v7.3-rc7.

If you would rather see this fixed on the timekeeping side, for example
by having timekeeping_resume() not leave suspend_timing_needed set when
a persistent clock exists, I can send a v2 that way.

Thanks,
Alperen
