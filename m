Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238903;
	b=TVhHoX2H5H+3ptershqNv4PYM0D5qaeRYgjf+mUv26YsYcPjz83ReqNr2G2a2z/RJbs9
	 Kgee25PuiggFehP5VbNM3hIZd3tA7x7wTgmZp05Wroux9pgQr2t4mJ3xa1K3hZ44+uyBn
	 ni4MzxE1q8o2K+crxzr6SGccwo9Kd4mA8JrNWHfEns5RZwOkRLH/00EM0pYk6vFsKDGWI
	 GedVkbHon3s1pN6inCGgfx8kHWCBUSqCFAhGp6gWzoytUttkkhWQKK0Md5wx61oU1wRBA
	 eQne7WDP3+V0U6ltdRMp7yDQL6Ff6qWW+a70YAR4fvJ3RbT66zsIKGzzi2GitH0KEkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
	b=yjRtIO0llf6XUPkNdjp+BhYiJqr2AfvHbE3XEzPU+ejLXUl5YCp5dphBIPYpEysqU68P
	 t12pdWo8ywlXQf/xLs0cDd19cVuefABobtdbDfXNhMVkBtluXO9RxxzxrHTeMtvSRn06M
	 jaOg8GexN1OwGzDIjyATNI7MU4yfB8m1YLGgDQBW5ZZDZ1FcQaj0KqNvZS2FnZV1StNyI
	 HDHMT3Vl2Xk86qr8OqWx++jmQ64bOuJ89szAcCEM3FhSIk77btsA8RP66BRy+UJPdrMw7
	 r1D+tXDe/CcSHUHUgB70ikn7Uy5QPWupcuPyVRRe10+JInFBXZDe/9DM5hSz8C/D3SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN1A0RX2;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2CF606EE86
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E2CF606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NN1A0RX2
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8919525e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238902; x=1794843702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=NN1A0RX2qAyZCkj0S3mmw7+ZRqcnPr2R6EeK8HY8MHRI2mpvxzxdLWG9yg/d/YMfk7
         JKOIcB7FedEV9OrKEa3rbjyjwyeW6PbnkMu2RiDuy37mPptYcA6ymfyXwCG2TyL2t/Ln
         oEf4pVAMGAOnteb45QuqnDSaqP2BCHirEm0dXhNGb/AthYW13IzjK5vwiHNSkJVhcCxj
         UvY2fIRI0YwExYbWlGMENCaJY89A9d/w49d39dDVbd9jN/AEThIiZvEdgpoY54l/FwYI
         +VJQeMENTmNBnaGjk323+nTX/0fLDX4qsRJGDBRrnNRw1GbkCkhhIxlrQot7Xr7U/lco
         xmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxUvJu3JfSMq3bHVs2CGVC07cR612RqD3otgVjEHieU=;
        b=mwos36foRpdHQ6KOl54dmaTbZlGx6c+MUUvAW1JzevRMo0OuLm8jx9ZlFfWc3plSnZ
         HD6brvie0SFw/7K3ls6TqIvMgK8iNiwoAbSA5tvlV03O/NcbfRG/IjR7Laeo+qUMYHGM
         ymiq/lYQS9hwI71T42Bn4v4KyGw1Ep9AB2XN5Dck9KPlOYEzta+s92W5YDNXFCWCYF6l
         v5UVYdELBCRumnEChbmZFOKnI9e9e/ZtSuSWe1PYu1oQX51LLcudY9ktSX35Jl+ZtklF
         qoKOZu8Oo3zvp5H4Rii7kyl7oXhVfcEOqTuq9+N+ciwCK0wZPnz7mduoWoiah1kvV4Se
         VruQ==
X-Forwarded-Encrypted: i=1; AL+hErGvo2nxSEQPaiskEtME9/HY5KLwkzaGfDDxCeW4IbMiHIxJ1apnFNwMcHyIXUXlRj1czuaD82Ibrnn6Phw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tFLA069Oxw960faPaHiUAEoLlkPKeDE6up2LPkchHX2Rik1uM
	LtyVlCYA8MIulppqIR+rOREQhIgDwYoc4zN8cMIueDInzMJ0nzpoY1RE
X-Gm-Gg: AYBFou0/LBeHv15RrD4s0LIErzbfu9JafoK7OCFlY+DUpiMDH7lced7RpCflS0Zntkr
	aNY8sNPDcNsgOUOtIL26KEWUMoB6iiPJor76bzH2L1qRJkFdrP1Fh8VsVeU0ArsJQQq6+VpXRoa
	TRRUJVlE2JsopeQH1J482pFmbRxSEHeNrYa3jKWlMASEyzsAuZ5QZEOrpEm9riavhkgMYvRe0/Z
	UbGq7Na9O9mKaK+PYsZeFIDNMwsvKZKl9aZmw/bVhE2sztiRwwoV2BoHynMNY0nSiB8rOXzwaFD
	wiHO222paYyOP3dLs/Dx3Vv7UGXajVSxxniC62ED79G1jO0NuS2NhP0OSBD09GYUeKkbQFQNS+m
	16pzgl4dnENZ5UURPROWc2cttkZygCHy6oAraA482JbfJ2a1R7qdNFtuIyxDupDBjMzbev5Ew+K
	GKZCNHKA7RvW3o5KstWi/7gJO6ToOluFdmM9JwijDQASvN3EJd77tpCc8Ze34w53w8D5NLFqn2C
	X9PjONxGM+GPObQZaJziK4ezIgmvu1gGpRVxdJG78StMr/gtBAdyDG6uR3jRgKuALpDBWNCjGbV
	srNOzeOgYo68GNlf3cyGLk9X1ChrKDaXv6efD6M6Lb95G9/NocRzPjm6aR18mcBGUDex6fOuPRr
	rnQ==
X-Received: by 2002:a05:600c:34cc:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4b963c6ca22mr78879565e9.18.1794238901583;
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:41 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:19 +0100
Message-ID: <20261109154120.592392-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
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

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0

