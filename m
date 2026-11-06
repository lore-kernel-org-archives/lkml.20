Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964756;
	b=Jp7/elL8nCyrOjF9m+YXDdT+bBoEIhFuoMmFzDU9gGJXL+yfxP/zKgrx9MNEICoLceLq
	 ctI21OOo0VWHfF1NxYioxU2U/QypCs7XldzWC9e+mecr+5tzjQohlr3ArcHNE5ZV8qe8G
	 2UeDSYZSYq+TievgH22wNxCq3q5ADSWfTCXf0Sf/RMwjGMQFIdrNera6SgmtMOHxSy8vm
	 StcVBqRu0QXD+a60LmrDmKQrQ91wc8Qc16JA4+9BZQM9T3xHoXby3s1zI/nknl3Go+p9G
	 ZUlYX7t64skb/umdo8vhzgbaXDW1Cq3UsGhJuCrejuVeL3n8EKxbIYKnBCeM1p1agvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wGiOeNE8Bnji04NKLc8q6Gdt5TOl+enDfg0BQ4VBWQY=;
	b=4jRCsJ+uxY1u0d6JA9fJ5lR3KWqiQS89Q7aGMNXW6bPvH/vvKC0JsmS6+uInG9Re5u66
	 ZtVFR2i19u+lUkGdRUMfQrxZqUxlV/mGtTV9LOgmwU2Z83ZWVH7R8W72cQltC+Qz/fPAX
	 0LBINaklTo089AC4GEFZwIAK0U4PACoyDUJVAR5IG0k3W9GzkcEDfaXqLGz9bee9X2+YW
	 YxaE0HkqCsjfPM/tWEopGC6dQSXC7YDemsm8A6zafp8N9bmk7cN9amlM8ODZctgjgqgvl
	 POHmXbPupcL3yNeNbouqU2tDBfI6f1zSBxnM00ovvVvBlTpmO6maQAl+uBbzTn/CiQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/j/VoG0";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C860A6F6F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0C860A6F6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/j/VoG0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so5411845e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964754; x=1794569554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGiOeNE8Bnji04NKLc8q6Gdt5TOl+enDfg0BQ4VBWQY=;
        b=o/j/VoG0Kz9bRK7eA6PJoiXwFDQJVm1yjK/TnARbK2bUS/WJqiaZJcqZ2lgUZiLW/Y
         HDyVieowf7v0kAUVRn/jPWCAxMF3jiZzQHeCuI9zONuIjAPNq65WqT5Dx/cqZNNfBHcp
         KvPrVqkIvi9yJAwwnW+AJKUxQuWoJZRtXZF9DSIonGIrZuym+mWLIwdbit8Az+kSJ008
         AD++GY50KCGdlo2ojwyZsVHPhbJCMaGkT6ELgVSutk+fnam43nYikYtu2M9/hXGomXXY
         IemweuIopL0dAAKctMSe9blRl5fFMjm4gjORpwzRAhJ29VW8DasindMbqK24/pCriPXm
         C2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964754; x=1794569554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGiOeNE8Bnji04NKLc8q6Gdt5TOl+enDfg0BQ4VBWQY=;
        b=Vodocw1RawkmguXymzTIo7VMwa26gaD5zcvzDDq8tGzZAVGeYlyY/4SVVxsAub+TTH
         qjtdeidIEduQoqbipL6SJynywiCnLLcfzw860v+UM+zy3h4F0f+KRyfAAcgvx9r7S4mM
         bSYqNPxfxaafMsvaqwgY2erP6nRe+iebdtQ1aAXG9OOTy4Unj9dtNVuSpOmSWgx73Zue
         Wud6Ctdsx0hSXh8JrOpJzjVmI8Jk5MZrW8worBV63FrDwNCIok4OahHZmeq7u86dOq2E
         SRdZInn/C5guAY0VMuLXH1K8Yk+vZFDmEiO/E6xfWw6yQFYmU5A45BtQEqgoZedezYgl
         zAOg==
X-Forwarded-Encrypted: i=1; AKwUvBzjaAYsIDGytm5bIgrUIaGfda0VZUuHyXW41YNvnYgf0c9zCXd68UpZZiufHzkhcDqi36J+TbHyGXUuktw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9muQOwOl/ec1pqQA+m8arKIHGcBB006nR0pZ1wDgnUJWWrgLIR
	+hLKSBbaKFh0KS7P69GS6xFlheFa9Ec44g9z+FZwzSbbmYYIBcUKxIoG
X-Gm-Gg: AYBFou3ILGyKMMaMcl+EFLNoUykYQ6bQLcQgRyTsnm7SReCmPOj+RupFX5aPs6bxOPX
	n+D4aEm9wT2cJxOonWksBA/E9Q4cLWdIn/9x/f6UOU+COVy665p33TpQdvB6pmON7Z1H+dubwdl
	4+vPR/C8KZCryH4bLz99/CxSdZ3Md8idHWHzpnqFl2iVNBKBlcF/ywXuiFKfuKrt4oowxYFgJdV
	oMTr1wC6lR+LM91Q/D4E9BfTffDKyyOYf1KUOXLdoSSNCZE1giRqQ8ioXm9rayyDoayNLG/802+
	OyLu8dpKpF0oVhXc1vd+ptKnOeodeNtFvZZYImcqywvsSCMAT1eunh/zVqIGR8qPHQTVrMuFemb
	v/O6Q8kGCS3D+k5SiQjGAAWAdEBUDCqn9dSPgeA2QPDK/bMrjsYVxnOyn2Hr0uinV6Ne2vNCh+Q
	5mmI8I+ABNmJfIVwhB7nWPL7+rDa/OR6W3OU9rVwzfWVsLICMmaNljLZAykfHw3in6JVGf+Ospj
	JqyrKXuEe+Bx45Mi9kvSGwU4DaEk6r9zQyPu3kB9h56joXv9mNxkJYXyC19XsI9cxis/LmXeiZr
	3vcBhemLMzpeUH6wkN3X8WBN9tsv9VzqscXfUN99I7I66ju83ShG5b5SEdN3vJP4HfZKAQgcZpZ
	FbBB8B5p5pohy+sEhNuUyrPS3TIVwZeICYw==
X-Received: by 2002:a05:600c:4e90:b0:4a1:f7f4:7ced with SMTP id 5b1f17b1804b1-4b6df21362dmr38701455e9.17.1793964754034;
        Fri, 06 Nov 2026 03:32:34 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-492d72333f9sm3254280f8f.29.2026.11.06.03.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:33 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Fri,  6 Nov 2026 12:32:23 +0100
Message-ID: <20261106113227.182324-1-ansuelsmth@gmail.com>
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

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Changes v4:
- Fix regression where base_bits is 0
- Handle divider_get_val returning -EINVAL

Changes v3:
- Rework to clock divisor API
- Return error instead of -EINVAL
- Use dev_err where possible
- Use devm_kzalloc_obj
- Revert to not fail on clk registration failure

Changes v2:
- Fix recalc_rate return value on error

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 301 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 281 insertions(+), 20 deletions(-)

-- 
2.55.0

