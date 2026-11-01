Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542533;
	b=gLV4StuA1l9tAPvS78Ey4ofJdZW7bU+SkAJk1QTl8H3P1U6rk5pPv357zDmBtFmCIudn
	 RjwIsxLpRZ1k3qB1g3dVOtpbTNpGVfyLlY519JrOZjB7kOaWG+drZ6BQJtkSb9QPWl4R2
	 OSEV2xBJR64G5nsgovSIvSm10RnE/QpcXx5OTfv7ESrPvKvE6doYeQ+6k2C74sxlA2Jwo
	 vyORmQMP1toHz8xpu+iwyUtQnfIv1EZza2fv6EY0f1PyPFdM5QWvekAV0ZYhPgo3O0Kw+
	 f0279FfwwsbVjNEMlv+bQrw8X0R013YvptT/s1OLxatIrgIdPjifXg6Sbj5bbIwseiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
	b=Sv/Bq11/NzSPaxkRq9rLUJDosx6/GNZwdINODwjdfQAONPCC7Vb6zSBnP5uhRTiz8B5v
	 pGdiaeBtwKr347AU6BJoOwHFkVck12XAvCXqWwFMZF86LLXQmYScRLVcGS39czjVZ9TCv
	 /v10TjTawDzX7VdFeFEzDz7HYYRTXM5h4Cdux2DbRFwuvQgOcJi0OF/cME1wccPTPNPJ8
	 k6yXM97+h/OI/meJHFBjlsdvjs4LF/xMvCe9/TsFOSkr3hh3yCdofeYOmU/q0FguFywhE
	 Ryjz8av5F0Lfz0YfeOZntsSSNwizWTXR5RGyUs2xVkwDjdGG4gW+Nr579S0QSYFjZWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hE+tk5Le;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B3A606A330
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B3A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hE+tk5Le
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c37b612635bso305122766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542532; x=1794147332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=hE+tk5Leam7kz4ZKTkBOYn/U8XAqhR+uwoX8FgHVXR95UB8LGxUI+qygLbNQGE7eLg
         3jqblPI8Kokn5TT6IY7vj17bYWcpr6M9OespfMNJxJ1Ly+S4nB6YTF5FYF3qIcM+jbHx
         B7APhQF0iWQxtChIhY3TEKNlxf70K2GGFVVyaZCfDksj5CDLm5QPloaBzzPKRnJg/YHc
         YNsgz5koB4952RoF5P1CEBiQOMZqKGDbM3S9p+AvFZv96GIXF6rfrI/FAOVvoUOUuNtx
         8PFj1Ci/n+flAtpWnGqIdvDa21jJuj7+ev+lc2dTIoYNS6dqNXYwJpXaHoXIIadtxLcI
         Ae0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542532; x=1794147332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xu7FC3Q8JkhKAZXkmoQyecqo7Y03cSTT/z26JLOH2q8=;
        b=xhe4584qsUWgrPdLJGih0fu57LXqO0HWt5XV0Kn3hV2eRN/WdevDrKn/7DUZLn7JyT
         SvoN9NpwKvHLSbVdbZ0n7OauYkl99AjwAPzD0Cd2Of8vnIh8viI/OL+dDGtTJI4zc40P
         rQ8kyDmqTuB2hdkgM8LFAaB6vDCrTFYlSynLZxevZAd4kBvQjoy77LNH4zeOIGyhCWC0
         8M6anMb65FMDxP9zNztAb/Ur2zMYZkP1+x9Elta6QXIjvMS/T2T18gkSxGw5e7zp5vJG
         NdVmiM6FYdJl76Q8OJ0JLobkI7sniYEWsTxletJgT2Q5+pCP4S4y98yhCQz0omqcx9FR
         Fj1A==
X-Forwarded-Encrypted: i=1; AKwUvBxxX4tk+GkY8UPj6hLBpL5ENBJSHWaO6v5ZdHAlo+tJdJZTI7rZJoQGiZe+BxCqrNL0QMaeS16uECpZnEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7Rlo96Ynh0wcMTJfa86E1pDjKmMZUTjIf8ZjwL1v6oXKjR/BS
	1p8Gtu6dAiI98Cjo2zzYe2L8KLYaB2tXYXi6m7r1Tq76kTPxFsAyJpDl
X-Gm-Gg: AYBFou1m4aPHxnZayiPh0cbwRTAADVygf6keGpvgtip/fZgDOVTnH7F2UL5rXYZ2E9S
	7iBWaYN3mkfOynSwb/HVIUop44aTsV40rgejB67iYMoUJPFs8dTAVev0DKCvyiDGx7TiKdr5BMH
	lbXOHi42JlaRmSfLSdDu5/tQJ1WHmABCxZtQLyuXUkI8FUAMioqpgfBZW5+3/UBiHjPrOBaSgBf
	swO73E6qnQLzAPyewSOODj98lT6/zeQdF7B7pMpoHGwFi4LGYUbQkmCOEF3LAemMk3weDlmKP/F
	u8aAm3X59yxLRsHRZKrOL9tR6arfcTCzAFLgX/aWu/dRA+pK/9dH5NZo94FRj0ObnQZ0R16TPIJ
	vtoZl2SCJq7lQTxIXi0efr3gu8cpFb1n7QW1XqYrzoSryR0rnWRoIvparwIldvOrGRjxrlAvrY+
	ntmVWqhodMgTGvsIvlEkZqwRnA3dG6s+9ZRsImPpsQvwn8wyEo3KPPDma75ABAOWg8NVZMJJeb8
	nAT2VKLsU3T7OvxgjJ04sMcZAC7m34kisC+0AejwL4TIXv35d2KSnD4Ar/eaR1AnC1PF6l5km8C
	O2ByzA/TtWHU/TZY3+HsPYOJSjeEv2l82NXJW/9kYetAgxAEKg==
X-Received: by 2002:a17:906:ef07:b0:c49:cdc8:10cf with SMTP id a640c23a62f3a-c4ca7aa04a1mr633438066b.40.1793542531418;
        Sun, 01 Nov 2026 06:15:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm281769266b.12.2026.11.01.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:15:29 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: iio: light: ltr501: Document LTR659 proximity sensor
Date: Sun,  1 Nov 2026 16:15:06 +0200
Message-ID: <20261101141507.119186-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101141507.119186-1-clamor95@gmail.com>
References: <20261101141507.119186-1-clamor95@gmail.com>
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

The LTR-659PS-01 is a proximity sensor similar to the LTR-559ALS-01, but
without ambient light sensing support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
index 20abd7da080d6..85ac3b540c206 100644
--- a/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
+++ b/Documentation/devicetree/bindings/iio/light/liteon,ltr501.yaml
@@ -17,6 +17,7 @@ properties:
       - liteon,ltr329
       - liteon,ltr501
       - liteon,ltr559
+      - liteon,ltr659
 
   reg:
     maxItems: 1
-- 
2.53.0

