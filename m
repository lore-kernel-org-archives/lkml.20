Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912863;
	b=wDdrv+6HV74Y34DMR59eR/1ezqFvIV8aSVvyGqgQyuAq7YGQkLySyp4Gud93xJW8gOLM
	 PBWDcdQZ6L8u0IM+lLD+Oa2QmzuA9nd6cWk99sTz9KEVekJFW4TYhiGcFiR8D9iTx4TBM
	 150SIMUssgGb/FmkmuafkguvK+sfq5ZAup43A1d9DpMwDi1EU0l6GcttLQXLheL91KeAK
	 9FOk2uyrVk3LltGrx2Q477QYbG67acDJ3kVxbywGAQ3cKoY5GJE4o28VerrCWlaw7uaAE
	 MSd2KZ2HnrfcQIPVZGrvILyudv1WftJoyVT2hXnS4f6Dub6z3B4kPGdjQxOzKlER75w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
	b=q2T/dCtR5m9Hbb5Snd+tDD8Bv3NmbInBMKPVg8GEp+0nApvmpBspI0TRi2pMpVU2mzPV
	 9SM+72axWsNLu8yKUcBgq7T8lRJxYZbWQOIN9XqI0+qt0ogRZQg1lDGuIp7gXqe6auoug
	 92nM6fkE5YaiUWXwpiXwIw+0Yh0VNmJK0liIAvUjop5cFg4shYm8JYv1Ke9174qYjmW27
	 tAnEOs8i9bUhxyaqb1DTyvChudvREtw+FnCKroGBCLlMlmfm1zT5127iW1gc8I/nMTkAU
	 HR2OvjLbNlKIkCYpDBF8Lo1AdW9TE4lJkcXLeicDcvpqVAqzMmYq5VIiVmnipj6EzEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBLiPogx;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0649C606D819
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0649C606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBLiPogx
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso107560a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912861; x=1794517661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=lBLiPogx1HagL7iJ7wlCKBNbjtZOWQYJSYWopyI3EcLhp5+tDMsSb1VypBbCqJI7Es
         FtGrSTadlBFXArfHaKP96K9I/OHUrjU6CjAUlpXwKmB1BPA0jy4H/1vNhQBJix866N82
         z5TYyoTe2YCK0LYgFhqBDXXiwxi12kgntXz8rU3DKCvBn3khzFj1+OgPUD9lWMOlYVXI
         o4XddsNk7LnJvCxTMiDSz41RW5AKxHIhjBjgW4sAGEhe2kPXWqIiWRONxdQk0eb/4NkU
         iKVLVs3onVQgBhXFg2Mt2UikWLw3YzkyuBCvtJI/gPkWjEMTiJy+qDZMiLthBfI/pQAd
         f8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912861; x=1794517661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhSdthgY4lzWyxqScK60PBXNBhT02yTKoURJd/H/bvo=;
        b=JiWNbSRjPmBpbEpg2kDoUrcCCeJUzRULpUO6tTj5RIuu2JWvBW4y8RKS2S1ZpPmZE6
         4i7NS59KQI0B8vKGtHQRHEHrSpo1BQpN4RvOooNr/LLyNKQsw1bzgStbwd3Z40xdk3Wx
         h8Xr/66V9bQ9HyHgNeG9IcjZeQyTpmd7QXVwvk+fTIJMx5U+V4Y6fJgkU6JPEpYCIA/z
         9fbxfGMphYnXUi43qmE9zIbXFWiMgQNHHKFgsl8jZY3UjKLQwmJn5XBvd3QCSBJrFgRe
         1LbrT7tzl2RPj20DfYs7JIB0ke2T2NxgXBTivJxVaZQsFLGSVDTGFTlVWbRoDKDWbjnV
         hovQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVmB10jF0fsblSlPRILtSqhJg+wZgOEUTKC9RTnhPmLZWArZBunHNzbGa6ZBsTeQUD/eRmuZwYEfUpwKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UunHulhBnsJ16fAeoXVuNFfiQ5AxbV7c1S08t/wffwbMF3FXa
	yv68oqLlJ8H4cVpYeuTer9rHLv3DCTUEgEgyJAgyseefIte+2DI9u1Z8
X-Gm-Gg: AYBFou2mQwbFrZres6re3FPy2/QaB22cB/WxD2s5JhSZnzNJVOtVwfRONf5OvkowPIK
	OQS/N8IwRH3vlDr/FGcY5kuiiVRx3bBR/MF3QPxy7BLdROavFKuKhgy5uODAgCPCoJbzvcrp+K5
	e1rJGFJVaJ07qK097UYQa0ZmfkeTQcGDSYaAVQdHxucoVTYaSwABaz+nb2mBkBtaH333y7KXsxK
	cFEDmDa06uuxMGvrNU6+rvTjUGgCuXsm6ryl3YNUctTTgUSMxzXessjUIbv9E+EFj0gB+2aWqV/
	lAHvbMYp6ZgfkrmAEntXjACOmvwgcYMon7kxjKWs+Z8sBwFgHYuC3qtc3IBD9frUlOjSS2IdSsN
	5WBjYm6PElqqEZN7K6ZxxGZc6pSbIFJeF49PciuZqOtXLJvGEQg6Rgllim2Na6Qiq3HdIMxcj3A
	rCGoWWaVyNH1xWCBxL1ti9NR2hFfSXK/n13rwWMwl9ldRGl2ZH/OAyF+NCUBTVWJ5CL5EEYcvI3
	VHPv9gQu2xGZlQLAQHj8BEPCbA5ha71oKMZ6Sliz3KvL1ee7hS8V1ffe3doretXhnyCqO62bfsB
	zFle6+qNn5ERnAFNzEfVkzeL07rAhsOhClo8xFevR0hiMWbILw==
X-Received: by 2002:a05:6402:1d55:b0:6b3:d0a0:3a2d with SMTP id 4fb4d7f45d1cf-6b5975296a1mr338144a12.1.1793912860655;
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:40 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6895
Date: Fri,  6 Nov 2026 00:06:01 +0300
Message-ID: <20261105210622.523747-4-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add a compatible string for the watchdog of the MediaTek MT6895
(Dimensity 8100) SoC, which uses mediatek,mt6589-wdt as its fallback.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f9b725592c27..cac7d9ae98dd 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -38,6 +38,7 @@ properties:
               - mediatek,mt6572-wdt
               - mediatek,mt6582-wdt
               - mediatek,mt6797-wdt
+              - mediatek,mt6895-wdt
               - mediatek,mt7622-wdt
               - mediatek,mt7623-wdt
               - mediatek,mt7629-wdt
-- 
2.56.0

