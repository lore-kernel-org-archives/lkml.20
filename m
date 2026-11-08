Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131808;
	b=ClJlB75i6n85rDeXMSX62RVj4E92OhPRqJmZ20/0Kf3lCryHZF4OWKh+TX833SvQGlEN
	 BmFQ78XKyn7EhSh11rPYVrQLqq3aWfRoIBX7/wXrIjcdjTTZiQvzrRy8ywJ+kToQwF/rm
	 qRI8qO/FUI5XAwTTyRzv4mMSb4k1j6b6goI+9m0obCOmJXTQ6LQbXKdUaobKosfpNqYvg
	 IekI1YVY0cJckKd1W1wO77GcW1YNqqu0AeLtFvA5cefqntuT6/mbQzoRKaP7YPwtxxD6M
	 t6jCnmFAuNg3JKeT6XkfrCi4iY9sv1To3LnemGXh1Y2IPJI4Yht4ggC1XaOyR5VYC+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
	b=4qjFtHTHaRd/ao3LqU9wjT4f8BhRo6x+sUtb7kuz9n8CdCple8GRwyKKnXOm83mOjhxh
	 2GzA8/S+oOFaa5n8KLMmJJNHwPzutz0VRB9n+LK7FWfehzrpZOs533AKMWdfU7RT/3ay4
	 SDiVVbuivpxswHHuQ8ZNeNad81OszS73Mreaat8/VhSr/cKikzkF+3/y6i5kj1LSUKq+o
	 8PPVF6tGVjh6hHsAjNMoe7DPD0CJmIeJXLlDsP9fGLQc5IzGeTib4PeI82XJUFqKNnfKL
	 qGETtwWHTa0n5h3jRV9y+gVkDydIctjg72Jl77uKksg44Pacqh5K8/djKJFcQF97A8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6k18Nsc;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBC606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15DBC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d6k18Nsc
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso1872966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131806; x=1794736606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
        b=d6k18NsckswXQJHgdv7ZJdN5lnDDlUwL1IC9wGogAAcQnYo3m/Svt3Moax+Rcfwg10
         NnyvNM/9ItpHXc1Z2AS652d13hEAzr+N6eP5UKAYrEK+zJvLq8i3BzEdR8MXFRMVF385
         awNQfBN8ngK5jSTbTZRarUrRM2kxH3IAuOw1srSgxGfPCqkXw93cmdw1gmzj9bbTKXNR
         8MCECcBRKFdPq4kuu6XZQypB4OYiXym+TiU3FVahUScgUPoGj0xtFfVO46q9DCIh3D3O
         BEITlOGb67SAAh1uk0sKos8qGzbbewGKY/9dHdhDuYtY0AYM2XTTvjgE+AZcO7km0tDd
         9S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131806; x=1794736606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uqi3gyiVeJ5V4q5i7p+1+tL7Q+jROIpeI4BmduF5Zrs=;
        b=fViFaNUKfXwRFEfvsb+q0mND9pYkXyK3HnUOYgOm8toJQ5E2mVehrB4cBESWLTUG96
         57kk/0SfJ/VihWFkF6V+xDWpHWbURetMZu1nTLfMv9wuxgtOgwYoCvjjvomVYX2PS/rd
         ukgW14cpQq6LLEwdsn6PxZ/RhE7cNGnHKAJFTTycaPyjEiq1gqcOmiJSvkp/05uXYOuS
         qSoQ0zflAoQh9BEXrKk+wJw+OPxdC4Bn1KcZrxHWwDHsQw16WQiD2O0E867GO02Qn5fz
         RlJ78wav9c2rDTi1h42Z3Rf556sTIkYyrILMzErWj3dbCA2RbltsJdQEDrotj7cr0kL6
         j0Yw==
X-Gm-Message-State: APuU4Z8+jpo0STYuC4gq5e/ly0CCpnIWlTu5zDMLRnbNNkKxPGcmizB1
	TnNjY/x+CvnwLf5eCcJ/WBjRz89qVodhqbmPWI6IBvd4JjnakT1YQEqU
X-Gm-Gg: AYBFou1IVAjicliZTknuAlbgrdCK6c0YTUnKB1Y0shwWxvpjPa+eufSmKGq8qDtuecD
	wEHuEaYaMWAo6Lj2m+D5MXKPMstsu8wUnoD0eMVeVh+jXFwyrSojhSbyL+OmLba1UW6iKb4+QPe
	OHY7t/Ummp/ji2tgiLUWiuVBGqjeOxqCdYEQGg8DQPv0IVlfBb8Td93jatRY9j59A5/NmmqpqZd
	8Z6B2g615r3jdlYsjY6FdkVy1jFIClDS/QBY0Dw2nWidpeRtSocZMw2+w0chu69hhuYtM50WLHV
	jNghqCs0zwVb0BnJNuq0ITud3T0Wqj/5qGyL8HKRSjnyRIHrbtqPIAPHHgjpT/XklnuY4ktaYRz
	J5SClM586Y8SkGJM5ZeCav62JbV0Tb8p5U2ZG07fGV3PxFbYy+SmNapmtZBCp9Lmsz645Cly12J
	4z9x9T1FQ8eS8lpy571sfNHbzOaIxmfP/b8aq6H0gT8zM7yyD7dMrWsg0uGSouyDVCQ+bhy3rLf
	hLi5F6Veh3C+geqfyDegAnmwjJiXpwMJ21SPcpoNy8JsWDVFHlceh8bVNFBJhQS41SukON2Y50b
	ZBzP6RyQ0lvR9jSuREu+iSENchuhc3h7X/4HO5kLrMt/oj6d3SGX3gOSSiBfHb7Rtj8Lt/WHnwp
	fshJYBOBMSQ==
X-Received: by 2002:a17:907:da1:b0:c3e:d0ca:d2fd with SMTP id a640c23a62f3a-c4d6d35bda4mr86080366b.12.1794131806225;
        Sun, 08 Nov 2026 01:56:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:45 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 1/4] regulator: dt-bindings: maxim,max8907: Document io-channel-cells property
Date: Sun,  8 Nov 2026 11:56:31 +0200
Message-ID: <20261108095634.100517-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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

The Maxim MAX8907 has a built-in 8-channel ADC. It does not require any
Device Tree (DT) based configuration and is folded into the main PMIC
node. Document this behavior.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index ee1a305d1c210..ccdeb9ba21e26 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -27,6 +27,9 @@ properties:
 
   system-power-controller: true
 
+  "#io-channel-cells":
+    const: 1
+
   mbatt-supply:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
-- 
2.53.0

