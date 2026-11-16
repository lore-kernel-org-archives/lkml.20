Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840775;
	b=1WBxr+U0QEqLn/gdkkPGWFs22aLJCiYqXpnDTYh35QwibeK1C5gxpyO5+IHYubrI70rA
	 hJofprAEGoF5kmoz0mY5+z2Zr1PlcrTtUgNOdyZ2dkep5QVBVkloqw3XobCwHNVHogNvy
	 gZiYvgq2c6QvI+OL++awRouvdzdW8KcPG3eiwJocKTlOYIwCor1kYNZH6uWz1FFUrxqIq
	 3ct6ZeUBBKAED4gT+K4Pg4P3I2fY22pAitmTObzbg/oyGkPLaQ0l37JO8BUFHR4tSFZ3a
	 KgUkqrHxKOqobTEK9dcWgUItKk688fzwCf7OwZ9NOSzt9ymNj8uYIXUqz2f1DKkpEqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
	b=wzBNlWnCOAgP8U/As9zn3ZJcYk8f2P0H4li6WRJjkBg7tHqL/iLwMiQ237BtajFTVHsY
	 RSmgLndtlz6Toi8CMghOik+ROvkpZV/4jruF1nHSLFhGooFHv+nS0aOqeBH5BCyrLYmgq
	 XJgLGwbsW6YD5U3pDCnBvMKgIooyzW/zqGUiPQSyZrhqSgbkMZW1zdbb8CrxxDl6nuCaL
	 uFa2KXWEU4I7jRlWB2XIEvqLEN6x8ScgLUbMqVP6IUm3Hjy5MSl+eJtFZqD0iVsqq0P5q
	 Mj/sq7GbAJes39UglJFZ+Wjj7jRXeW+2z9iveo6zWh/50fjNYeMlvChQNSPNZBlPu6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXHbl2eA;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9307A606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9307A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JXHbl2eA
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4336682c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840774; x=1795445574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=JXHbl2eAJPxkWt+l++ykB67rQRdfT4dR7ea73HpyIH2a0aW0Aexq0JbEJX60h1i4xp
         tolBGgs4g6vV/aF6Nng/KX7bF2zJwaiHsW8v+E4SB4w8ceRJhI8aXufF8LTPNQLFQpBH
         DpRCOeSjvK/wgASIcAs2RB/zYo2drCL0FJ6KmgcaBi1hqwDbe76PqPGWKFa3QqWHgL1Z
         aRr0SfaQRhsmGvqRkLL7TkuNS7xpBTGYsJXOEtIFCNcaQEMDFORP76t+3Sbi99m/EuXp
         HgBOGBJDeA/JPbwIrQsV0B+fQilgpzxTHK6Gi7BubArD0TjRVK6thcG7J+LL1sDZBN//
         Rd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840774; x=1795445574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op6Celd0vr0W4RZ4RM+PObegGMYvdt9q1CeYgOR1cR0=;
        b=obFLu3EVo6ZFobF759zeaSqS4MmxbIXLQLfN1r/3GQp0lJbx1l8ts1KmWBLgA3jk+n
         1KyGG1G5AqfgXkcgftomL1y01OX8uBa5hjEEvZqYPSscTEBJYYShUSaOhsCmgWSHPYtj
         HjS+1GbE/XDFTOf2kL3QmhwDflKoj3YyyAFAIY/1NR4neGuMIR21cSJgAKLGv5pPVbfG
         /Cp84dE+ctvzftjwrHM+x9jUFQHVzbNATUjlDVhHtweiOJ49dP13OE414lNm2ysd2jrJ
         VP4wYt3lDH4wGwPQMnL3aaIW01hwfka8IwE2qBcvFz/1qwc+ag+j0jZFNpgG6f7M1tvd
         D3/g==
X-Forwarded-Encrypted: i=1; AL+hErFfaATXIR64Ru2m9N7kdvoVhBChGjedRMBWWJrvSXp+Kk+Fdw7fCgEbkS+FN5laUql+bojgxWQGCtO3F5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/euvnilmv65smejEYCTud8aR0p650xqvGhT6VJvNot5Xv+JkZu
	L6yA7eLSHSlcNGTv1FFJNY6IsKZFp1zVeVXQuwYV0vhWVkutbDUm0DIA
X-Gm-Gg: AZFdTZcfVm2O8/PhoVF6A8yAkJCxDssjf6+FdqBIAVV4+KYdyZlQ5Bz/qUUX/Wl3sje
	EdLEm1ELBZfGw4lyape+oCISGu6ljXcvX5xHgnqYa37TVuU3aMei8acAQ+SndcmVTlMH0WZVBK0
	U5GdWd5yPut1Bq6xi4FpG3Y66WQHxY5ecy3l4uuhFZUQD+4ZdP2ME7FGrNQXrhAk3TmoR2nw59c
	Ujfu2aZO8haoW97vwCaqsCvj5T/aNovk/3DHL79ycpGxtq+Tybc5i4cWgZlEYLZXKof/O9cIAu9
	lf0+dzWKKVPFRQxvrjeR6zEYpIQkIROxgU/r5OJhFAm/dqa6r7HP1DU296Ua2r3I1/7zrhbueIe
	j7TJ2YEctXp6jJqBHFh67ED6JFc7rWw71srMob7nj953adzE6uYtQEibX0+qvPyvNlVpau3wIYY
	wB8d8BzCJj++YL11HTSVHbWUoFFpWdWRPEUI9kUzAbUB8U1luMQbBaejBq1KP7PF86eXM9bCpkf
	ZdB7vC9TgAKUuvRRodS9xX2Tn1a/+IAUDiNf2PaTnUHM+6w02cVR6wb/ATVPZ2jm1mWPcrL5S5k
	al/2c4ewkn1Y4BvfJSPq8NMZ
X-Received: by 2002:a05:7300:cca2:b0:36e:371:8255 with SMTP id 5a478bee46e88-379603825bemr9856188eec.0.1794840773662;
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
Received: from [0.0.0.1] ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm69003540eec.20.2026.11.16.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:52:53 -0800 (PST)
From: nhansp <nhan.094.vn@gmail.com>
Date: Mon, 16 Nov 2026 21:50:33 +0700
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Document greatlte board
 binding
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-upstream-greatlte-dts-v1-1-768d49fb7d85@gmail.com>
References: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
In-Reply-To: <20261116-upstream-greatlte-dts-v1-0-768d49fb7d85@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 nhansp <nhan.094.vn@gmail.com>
X-Mailer: b4 0.16.0

Add a compatible for the Samsung Galaxy Note8 (SM-N950N), codenamed
greatlte, which is based on the Exynos 8895 SoC.

Signed-off-by: nhansp <nhan.094.vn@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6ac7f895351e..088995a32a03 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -247,6 +247,7 @@ properties:
         items:
           - enum:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
+              - samsung,greatlte                # Samsung Galaxy Note8 (SM-N950N)
           - const: samsung,exynos8895
 
       - description: Exynos9810 based boards

-- 
2.43.0

