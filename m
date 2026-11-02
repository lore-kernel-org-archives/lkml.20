Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635674;
	b=S3gqeTtMnr7lMF3h4sTsQo3FjjxauI+uUz47F8engcHijd6rT5TGfu72f65C/mPIW+S3
	 alhLDG3s6kyj5Wx4nDPjI8ki/DJ9zEf1u7IKXrnGSQxylRAzro6K53j0vFpLZl+ASuiVc
	 UtKQvoDBeEivya1cUaISnW7SNuKNDPqH2qcXHkL+yYjRAPKzus7IvyumtSyhJXvxH5msn
	 GxmmoH/IYcEsjnQDpbjaVjQxO3E2q4MMY4jZDOao+KOByO/Xptk9fmkjNAro4MwFWESHt
	 zXc5j68cV/0WdW3w8hPrM8LbxS8RnNTW/qG4F6QwfDWKJWIeZ5AS11SLrVMG9UNy0dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iKqppwJgaOXP6N2jFbbLAd1EvvxPKuXzSzDJiISCkR8=;
	b=ytUV4gfJzWC9ui8BI8APIrXQd+s87cL4lGr9Q/vgDkiDXGsH/ErcBnt+t2dk+MwSXobH
	 BRQmUNnfRJ2NyrqNeBXs0fldRkPoW4gt7ktek6h1dIGpXsWTgvhTNC4MgCn//8sLND23L
	 XMqzcNrFNH0g1nYfxLQc6tw48bP9XOMy9fBeWkXQ1eb1U6xsl4xP/buk7BhvIbagjjCL9
	 QITGE6scpww63nAV3lyoxrZeh8BfkNYCUzyuGxv1KCAaZvcPu2xD0rSjkfn1S24bPUVEB
	 os/APma686C9cg1KC25WweZTx9cM0JOngjq/xkA0E0VNjnyPr0UBJQuNj37SjwPKlXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jYiOTlAo;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5771860703B1
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5771860703B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jYiOTlAo
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20884475e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793635672; x=1794240472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iKqppwJgaOXP6N2jFbbLAd1EvvxPKuXzSzDJiISCkR8=;
        b=jYiOTlAoF2hnVEtjF8MBgfhR/gINhACtWDOCFdYcqPJcy9m7fmqPuGoBrVxReUexXn
         nET1cThlc/1exOuNNUoNo3RRE+Sy7gjF5uIluYFFmAWd3W90c0R4mqKa+SSaiZKetJiG
         W3Z6yg9Llgz/trkUfr71dSyXWgeBX6sDVLp9eDGjH8Z8DiClA7gOH78xiv6WfSzyaUaI
         zDDd3RTfma7Ha5STlqLu8KHTdQY5rTsTV1L3YwcJsoBjn8LDi0Bp/hCE917Q4QJmuhOQ
         PbjmlEZ+a9avnqHt55odxSv27y5KPOzJfyMAlCufuVgJEwpnR1bS4YuzBVQFx/Y8IBi3
         4Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635672; x=1794240472;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iKqppwJgaOXP6N2jFbbLAd1EvvxPKuXzSzDJiISCkR8=;
        b=EqAXuUCiZFUapMiJD4i47BHHlWDFIVh0YZQmYrsbnDY069ne51v8AmhqRnNCvnz2ka
         sORH+hH82wjb/Er4EzGpNhZEwR7yrx0HTMibXNad5XaZCdNai9nQyi8+VSK8H0n2S12K
         u/rI+Vu1pI/h8M7P5kRLOqJeEMSzhYgVOQUYdf6T0pgwx97hABe/WtdVYpFlJw0SkKk3
         QEveRH0iCoI7u6Q78DFeeQQZRY/Kh4pdQPPxYmVDqf21C3C6LQ+/zL3C14Pxx8RQjzDw
         iYN2NXTEQRZLpPdf28o4r9FT9j48TdxEZDRoDBLsnjSGyUnZFVy0CGa0ReITZVH4uqQI
         jZmg==
X-Forwarded-Encrypted: i=1; AKwUvBxfzQzs6Olp1nfC+/wyL85p4a4qmRGoyw2Ohbs8eT39P7RVphMKCa4q3lTwOH72HeTyvFsQZ2K5/0GEg9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJXMa9VgkETy4nB4IJYQGnIfW1zQYqTOBOlEe+JNIFCFantcGN
	Swdc8M1n4nFm19yayHyDAhxix1mftivsbfKMZSEijmRr2B7iY0XQvVq2Zhm/HfZEaVo=
X-Gm-Gg: AYBFou3mpByizzgm/BI2OxcvCmWF2NqPFcf770ohjKZnIdJwKftoeqiyOFg/96l/Wpm
	a94WoaheOMrK8dyk4Md3Ad8lH8Zab7xrIF5TBdFtpYTNyN2exhLHsheZr4geuH0IGXOOYPaka4f
	YFfEo3QU2Yxal314Lt+NLCmO/Lhp6q36lfqnq3nRPC6GNDwxd3L3FVspPva6NjpDDW/cO2V5Xv9
	JykqMh1kZDN+i4sHrg3cKp9Id1cJot8LPCgSxE4lAq3XGh6I1w2yXG6PBlCZVB7JgJ/zVpW3VMY
	GSYm0eW6c9xusDR70//jG2Xu78iBwMII025HTPXDkC009EVP5A0E1Gvk8pmypnuN3VUm2gmD1LB
	LLbNsINNq3X1Ho7+Mm9L7whpgmy7ynfqOqT4EjqaA8ZQ30WKN7jCKHO//TSV4+I2m9kykLtwo3m
	a67MzssFGrc2Y6Bsjvr1ZFhousl9Z1v7Iv459lFWZ+ID9DO8n0yQgktW4+JVSXZS7QXfxjmNFfm
	FiznKdohKNBc29aKZTX7iuJgoHcmjwaSloo2f5IEmv53OPelUs1u0Ktg4UW1EKVS2+cfC3/lDRO
	p3bcGG3vNAnYQYbyK8WncGs9IxMLuY6sKF8/rF2tH+vHIsD63+xjmk0Dbaux/AghE4rdMtzNnw=
	=
X-Received: by 2002:a05:600c:350b:b0:4a3:2f35:38aa with SMTP id 5b1f17b1804b1-4ac1932bac0mr210839835e9.29.1793635671784;
        Mon, 02 Nov 2026 08:07:51 -0800 (PST)
Received: from jarvis.. (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm360429605e9.12.2026.11.02.08.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:07:51 -0800 (PST)
From: amergnat@baylibre.com
To: rtx4060@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] regulator: mt6363: Use 8-bit regmap values
Date: Mon,  2 Nov 2026 16:07:50 +0000
Message-ID: <20261102160750.230679-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101164405.1743177-2-rtx4060@gmail.com>
References: <20261101164405.1743177-2-rtx4060@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 01:44:03AM +0900, GIBEOM LEE (이기범) wrote:
> The registers of the MT6363 are 8 bits wide, but the regmap has 16-bit
> values.

I had the same fix ready before this series and have now posted it,
together with a VEMC voltage fix:
https://lore.kernel.org/all/20261102-rgp-67-mt6363-regulator-fixes-v1-1-420789a3113e@baylibre.com/

The only difference in behavior is the BUCK_TOP key, which mine stores
as __le16: with 8-bit values, regmap_bulk_write() sends the u16 key byte
by byte in memory order, so a big-endian kernel writes its high byte to
the first key register.
