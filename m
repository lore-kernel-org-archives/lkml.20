Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570642;
	b=q6WPSoKYPi+A7i6MvgB03owYaVzy44puKl9k5zd06VfZDX0D86TnOIpRjhBrdt2cP6d3
	 0iUPt4J8bkKGEBEYWG2BHn9Ds2+EbGwt3BNrDNOfSPMWE6mRfnZloEAsIT7+wO/pHZhsN
	 RXRBsVDK2tGo4+HTlIlcN9qg5QUsq53h39BqopRz6IIoa+7UdthAsj+e15hqsHIACT5q5
	 meG4VVE0BkG0xlyn+v2PYQdRuowAItYycWGyLdgn0pZKKporUKc8oHURNYJGqmnIwmNUJ
	 Ux/c1ITMAhuOzMlBVNatbNSE6i4jbDFXBeeZkmTj82/KdFeh9RqDsaH56lYKkeocvKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
	b=ulA0hktrDhAZjUCNuYhrsuzC+1uvhGaguK+zpyQOzihfVycpQpERbzgfkQv3MmcHNe84
	 rlqvcigC7T36/kI76/hN+r3hfyAf7bcoU9jefhhG2bjXvSo/RAImPX9vRwFVapGUxGQjh
	 5eWPwZ9WPNtISoRwMksRu6csS0jjD9u1EaZY9eggoDmAzZVA5E+NpRyjfXrKDYe14q0ot
	 zezmbotYGPy/rVPr5WGaR7pX2Zx52fFMebdnKVrwNDRpvk7crxF9rxaoVibUx4bTgwk6q
	 3XlDlarYp2YL2Yne3Jt6VdWeEyTv/Y5GWEfSRX6cn8CefngUV21+5erxzCQF4h9BnBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GaSgdJxT;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1DC606A33D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1DC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GaSgdJxT
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1670477eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570636; x=1794175436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
        b=GaSgdJxTLy10oRGBUy+bumWaJoY0ilqCBp5x8IueoDNSq0ZP+pChyin7C02xb0+Twa
         KmyrEo/I4aSqqvlt6YkQFJr1mai/KzWfssltGOnIv3kHOkAFb3llhCmGIhtwGcT0krYc
         PhcgB/5PZbP8eZ3RAY2g7KLcs8+I7AWbphZTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570636; x=1794175436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ho0e6UH3B/lTO7/cNrPQ+T0vKlpGOthjtjXw3DfjY1E=;
        b=MW7ZUBo6sPlG13On5lbf3vvodkjJ15ZnJ1pOGl04etwa/q22dyx/YKDP3mWt6XwKcM
         R4Ua7l6H7/Bmv/npVPr+Byud/rP0y0n/ibGWyUcB8bklxR9WgJRLd/sFOexbjFnhvDdv
         a/+efwLuK55uJoNhfM76tP2nch0pDLtmH3IkA1wI696DKMzekRoy989Fx4nG2cgnXQaG
         cy46VncKCrQ7SL6Wtz4honcyvWKcO5+NrOn+7J/Pk1ixd9eF4p8Lpfh/YNqIzvK4wx0i
         FEUG2aO4qTMRqVFsP4CNqXH5pKueNGMRVzqWiWBOAo4sifiPDd9eg0UkbyH3jxZi9irs
         bxeA==
X-Forwarded-Encrypted: i=1; AKwUvBzAOAplQhjoast9wbIRXLi6NRYwftfpMwHIP2URs4aQR21JtG6+9dlDjQAJHyP1Y3cbVxVN4n1ufv6vaAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2UJEn/KopN5sN/bInNOd4NM3hG+5imGjtJXpfjp2EkA6lNI0m
	DZwqXwgZ6vavdW5g6VQVixf2aiOAkAirB7ca/sZqV+PMZTE3/sb+As3WIZk6nqBinQ==
X-Gm-Gg: AYBFou2y2cmYNsrL+PvQPCVl3vOmVo0JApte7vCrKjoDVHF0rEyV08/NOS/JM+0DJCh
	SyfRF06xiN4D2o+0mzXE0xScPpwgcetnsEQz8Zi/Fpb6/stQZfUl6/krSavNxN8exBT9zYNYtgq
	czkjOajIiAjM3R+bTZq3zBo15y3a6JcsHHrW6iiVC7nHZPpZRcFWDqch2cg5AaiVBrMZkJda5tL
	y6GJc4D+Sz8taCqlSmv+3eHYJmDG3hwsgms3mfYBwJqhicOPjdLlokliiHSetAsWTMGcpon6oGq
	GsEj6rrlGmOWakcVFS44XFj0mUtvLmpgQSnXU+xNrvvzDjGrFhYHrYGjPZ6lXWvLy4jJo3EXC7u
	eCnTxKt9uS/qFeWhhgDunuK/61T3hDwquwaEXASbg6xac6b/9oj+DIarS32LZIjdANkHZ3pEraU
	CyqqkBfX6nOWZQGTuXRUUp1AneC+BZwnz5rYoCVdAHox964WYelj57srlvrpdxX7reKUgXw8dIs
	wUvmaMOdRw0kCBydr+xx1vTdkNLeJEwKk0mwj1LJUG+XdMzupO8F8BAZjBBXLMvbJD/BK+lckgg
	gLdL2cM88fatHKe7XQLIsaQ8RVzx9KM07+W8uGFhLjOaVm6W9klNpb0yss+OrolZNVg+AXMQAJs
	DM073tBJ3VGcXzw==
X-Received: by 2002:a05:7022:208a:b0:1b0:4272:4282 with SMTP id a92af1059eb24-1b042725256mr5453515c88.17.1793570636332;
        Sun, 01 Nov 2026 14:03:56 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:54 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 10/15] libfdt: overlay: Make fdto const in overlay_apply_node()
Date: Sun,  1 Nov 2026 14:01:17 -0800
Message-ID: <20261101220224.1436242-11-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

`overlay_apply_node()` only reads from the overlay blob `@fdto` while
merging properties and subnodes into `@fdt`. Mark `@fdto` as
`const void *` so callers holding a `const void *fdto` pointer (such as
the upcoming `/__local_fixups__` update logic) can call
`overlay_apply_node()` without casting away `const`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split constifying fdto in overlay_apply_node() out of "libfdt:
  overlay: Update base /__local_fixups__ on apply" into a standalone
  patch (David Gibson)

 libfdt/fdt_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 36f2377cf7d8..4b3e17bd087e 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -821,7 +821,7 @@ static int overlay_prevent_phandle_overwrite(void *fdt, void *fdto)
  *      Negative error code on failure
  */
 static int overlay_apply_node(void *fdt, int target,
-			      void *fdto, int node)
+			      const void *fdto, int node)
 {
 	int property;
 	int subnode;
-- 
2.56.0.317.g454f8302e1-goog

