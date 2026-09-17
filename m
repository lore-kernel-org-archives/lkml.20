Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC8D3612F3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632564; cv=none; b=eiuBbaWrEDLrKT48UekGOnGLezwaOn6763VrLFIxNt0wTqrchaaB/8vQiq+JIRPkOPB0Sv6YsJ6uYbfGznGHC/iWuniHBv+6QxZCnlIaVKU2byJxSTT5rPuJ7QypMDd3xVAGJc0lTtCAybwHwkqDfg+ItHccOvn0pr0WQi0f2QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632564; c=relaxed/simple;
	bh=cjQ6RYzc2Amucs+53IxcHHczFj1kbL1NRf7Hpsxfmg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOz2nwk4NVbUfkYhOFOJ6ytGfWAG74HvcHkR/WELtyKX6iaMblubILIoY5mWF4fpgwUADUm28RGugA7zmpwg8Bg5wnM0tOUwsRAtnMy8FwoI5jOYgqyWD6r5+43y24tqLaq++ylDaDvT6bLDhCr9IZpg02OtlFJQfCTrYdj8nJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVuVJaJJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVuVJaJJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso1202665e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789632560; x=1790237360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jNDQvvdETqkQqr6M3U+s+GuEJjts7GdgrSSwohM6KmE=;
        b=iVuVJaJJbujO3c5XIHUBkcIUF60Dg90fOoR5t5RZFE6rFpNU7J9ze72C++C7Fze1lu
         czEGzL1etuAFkPVmgj6F3qnBNdtbdOkum7Q7nJYPKG6a+42ZN3yUN/cYqNsOUVQTRcvs
         ojuqxBKQBjz5nEa39AluoXFMKUQ/6lx6yjug/YoCZPFvfHUOk0ac2ds6w0BrLJr5/xHw
         euby7eAH9j2yEDITeXe+KjSMtYQl4OQf6OlEZh4l9evvki88sfHP0CtmEIvXjsF3xXhM
         nEopzxxIijx7s+gaoEPYOt4Sun//rhvo7QaAFxBZxm92eY7WU7mrYHQxmPQI492k5Uc4
         XMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632560; x=1790237360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jNDQvvdETqkQqr6M3U+s+GuEJjts7GdgrSSwohM6KmE=;
        b=DSJaD//Sk4nABcKTpeMYiSQKw2DfZXQi4n4rjQJqrWvVOc9fzVVYbq+2D+LYOaV5J8
         MjVUs4DLYkJiCqRDQmqOdyaYwf3ef6mRAxm9VHI4mPLwUo5axdmW5sURJQBpY78ukp4P
         kG6LWfeiaCidXOEuJ+WSbhfRuN3tJ7bUogn6Qwpng4gx5EMGlWOUY6oGwwGSyub5kVuH
         W1AwpFdkQSTuaneHTeme88KSaN0Jete7pQTUy8c7oSwAoWmBA4VTsQuc08aJFss8igjp
         qm8EFVzmfU2CzExdiL+okCvXDhIRgsQ/nFJ6Gm7yOkTfEGxrtKaDtvQeaO7CwYPx4nLL
         dGBw==
X-Forwarded-Encrypted: i=1; AKwUvBy3BSxn9/xih9E6jFuZ9N0j22cfzvl7XpXA/rP0Q8ujqOZb4Ij5LLmnD07s4a/ruQMTVPyGLNH4DoY0Bnc=@vger.kernel.org
X-Gm-Message-State: AFuF++kA6XQwD6O7mcjjqEAs/Jdz6mjICW5eymE+LVP+fnGKwtmoDNm3
	5esEj3QX34UXoX6TUhkJu8VoXYovFdgQiXqOcr7YL8GdlZvtJ/iyj4Te
X-Gm-Gg: AYBFou3dM4YTs69gBUc5G3EQMJ3jlHn6T0AVW//MmcNB947Hcb+KKN5a9zomGSHVLWh
	0i85deOn69+bJFJGdfJoGSPf1NMdQnWngufZ2kH4Y5lx1xFVyBB2xyw614uyXB1ZPrW+YljQsTi
	35nrtrtaHqw3vZ9q/G4FczgJDiZyXSeCh+n8I6MI6qoCCOmWCu9RgZycWJ2ny6Rr34CKExghL3/
	6sq/Jh+D6o7Tj88j0l4U8qiLqWPW/MrY+mq0eaa9QS0JeorPv+wPElsycXDuTyqELqDjHh9X1vq
	zuNxlFxuuHZJGxmoMqMsS69W9dqnoKEAeiodKEtGAGXAzO3e4YebArgIKwcvlUtSP58b/JcTshj
	iBTkn1c80UxCoWNIiyH8+niyF035r3sYgCoiOpq+Bw/AJpFJoNytYAa+AKFojHyHmiZaI1ygjuh
	1KvFO/mgDDlUHsnmHbVfhpdpRwE+17vtooGDWph9SpiaVA45ZKTz2rcdg5844PV3XrMkSz
X-Received: by 2002:a05:600c:1d25:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49fbd1ccc32mr42120145e9.8.1789632560321;
        Thu, 17 Sep 2026 01:09:20 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm85566375e9.3.2026.09.17.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:09:19 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: iio: accel: add adi,adis16203 support
Date: Thu, 17 Sep 2026 11:09:05 +0300
Message-ID: <20260917080905.7654-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add adi,adis16203 support to adi,adis16201.yaml for
staging adis16203 driver

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
index b6ba7ad1a..73ea8f192 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - adi,adis16201
+      - adi,adis16203
       - adi,adis16209
 
   reg:
-- 
2.55.0

