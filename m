Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102452;
	b=XpDjO3GTwfoVCqCakrTW2WIwok5yCjtFffG8sjjDMcG95qvni75gngOt6SD4Z9q1+p7h
	 BgWuNIkaDaXYpFLhbsd/kVlNCo9ymRYIAI61y/UCGZWaUWOIh6JgIVHMeuIJ3vd99d86/
	 SDopn1XmyOO4bH6nRrbVp3knMiQDw7OD54rubfoQcrv17w1gsP+Bdd5e8NC+P5LvroLDT
	 YTza4ur6KyHO3GvUezpUPuZdjfTDqW4LLYB9nG3RuvZEV5JL/R+thwu0wMdOqh2VxdMJ2
	 VPvudDWBYf3sgO0ETG7iNTdawGwgz4g9WUT43KqyzeASxmV7lmjKtq2vzKGnLSKrDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
	b=cNYM2PQb6cadKzwZOTo/+0RmFpRc31xCSx3PxRDess46kN43pYZbXx58Rg5dZGFH+5Zd
	 k++1ga5iUYJqbxieDeilYNuO/CquZlRp+Twu8aabwJnD+bcipRQLUmC9RjT/GfeHayoTX
	 Vz529Y/KhkNYFp74gpT5MIXS/l9jwexqNmFFTqmWZYskjuJaCbWZ4LsKH44dybyFqgufb
	 UBerSXmIr/NBBDxk+BcgEf9d6SZ+P4sWD9GjMovWvj87+kstVfbG3Yn/G/8+gCHcZyDP6
	 X+f+bPBCLiQfP9TBDjcPKsD5co/n9hmsOS3H5e2AlPpzPySl5NzuMOxI/ccaIGfpa4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC49606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BC49606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENAmsw4N
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so6001912a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102450; x=1793707250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=ENAmsw4Nw22yhGScbFjLDocGggraBRH99Rars+0xxe2Oj/WqHA5Lji1MtwB2XMePKU
         0L5NRLesKErQISbxqHgyLlyfnbcDV+noK2ldPPhJ2VfxpDViDLvYCyBaj3SBy7NYTHb0
         y4JzqR34d2BUAPCsGiW3+xm2787/IFgQ4vfATDc8Mu2HA+II+no/Z8hRt6X//uw+KVhX
         HtPXnu1bjduugmphhrxFGxDNZnVLnQ8dvEkDxoLCDHwIC7X4qLN5MDl/aAAX87pJncAG
         6qMWZjVQnanbI2LcQ8KSessBYQKaDIA3qUxUhBPVELSHctBBeuxe3Nc1VrDRRE90mKE2
         K6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102450; x=1793707250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUqVSXLAstwlQX9p2ri4V0g23CqSWbBN5EVVq2UQPOA=;
        b=t4GOw3HkZRmxUUkZKDsiJeUtmZ5OQ1gHDZuuHEQ+tAOYVHzR7zRFYQMSl3u4Tmq07T
         BrUDt0ddRXdcHsscXkfjKHYXK2ot0CNHl5j+EVpXnrI0Q2pcrhy0ZNG6XCipodgQ6kmS
         /iwHi9tj4TFrmWq+LsbLlkNS3ProCofNjiN0jw383AvgtJU7RSLqYI2uHr1QXiNiQgM5
         nB/FCivDBYphFbs2DP76LnOjG+FBg25LgdF+tzBvBQ3ZSqHgNhiw6WtahxyCbxo/1bAZ
         DDOdiHlRm+1oyuMAQrF3rP+grs2ipFwHa+JB6q9JIQPccjyRF5jZBP5tmlNNBA0GF6O6
         T4rw==
X-Forwarded-Encrypted: i=1; AKwUvBwLIi4H68hcSiuNpNf6oVgopQcn+YA1iTo71lU23Wuha50zIc7IDtVObamtEOerbklawsgVUnjNNeQdN1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrQsfChv34KDS7uBxVW12Vzzw8TjWmgXqwlRcmN8tMOywW9IHL
	e6T34XkmkT79IIBocWSpfo0j04oKzdHgEe8E+p9KvK6A5Pn2D5H69PpQ
X-Gm-Gg: AYBFou2lyjFTArGBbtklF9Z4g7xlVirrLcFdhqDkZY01WJDFtFWAOtiwQy1OtXTeZnk
	sHPtK1xhOfYndpKxvVswwsUQ6O3iR5/z38B3HTo94COsCmv8imTokfKpBIfLZChrxhhVjMBCeS8
	XGX0LAyNhag9c0lf2iGmVNtCiGXJfQiyC+jtFrUc0+UlUoxpHrlNxQZBrWjmGKvUDxrSrAnz4FV
	m2WWQc6TypIWTCib3zbvnTIWQAxkWyEQSlXORFtXxSW88Gztnh6IR04i5DomSjJLg6A4+1iDmPh
	1O6lcnhbvmfaAkDl5JXsYyVodhlWDCqvDYVyO5Tg0PCqVqZhCWyz1N1N1m1qC0hpsRdxCR/VBNT
	PeFN1AOju8Q7wY/QU79a80+gPhokw8mlhjyMO1r1032ILz1TESi1eDiiIidEOOVfJAVmrS39bb8
	X+oZ49IowOnvFDf5Jt0mTCb+bJcY1bc9ftXXALaaAbLpsvw66ZZUs6EzzVivU4FmncEni4xZyUB
	GeGj0NfRhNjq6kIcpjmL/gDF64VQ2VYSf0HNGn1NUBhTJqjoyepgyc7PAXAM3rJMsp4pbzc/UwN
	A0og6tlAX6qRO7KFCJkKEw==
X-Received: by 2002:a05:6402:428c:b0:6b1:ef5a:6720 with SMTP id 4fb4d7f45d1cf-6b442fcfc70mr10159119a12.16.1793102449777;
        Tue, 27 Oct 2026 05:00:49 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:43 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:13 +0200
Message-ID: <20261027120019.93611-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Maxim MAX98088 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/sound/maxim,max98088.yaml         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
index e4a2967e1e818..4d33fd705cf8e 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98088.yaml
@@ -9,6 +9,9 @@ title: MAX98088 audio CODEC
 maintainers:
   - Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     enum:
@@ -26,11 +29,14 @@ properties:
     items:
       - const: mclk
 
+  '#sound-dai-cells':
+    const: 1
+
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

