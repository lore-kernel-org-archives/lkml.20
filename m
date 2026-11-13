Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604185;
	b=qqiX6OtXUZFRkQ/aHukpB+MJEeCaD0dc9fzedtG0ENYQoCf549UkT8b4DceOXDa2TG9i
	 evZj7DrpEIr04fTM2SX7abHC9M0HSiUhWXRrJgUVnOYMvMBZEEeJmo3A6Uvc25Pm/5nx2
	 V8IcKO8eIkHOD9Bfo/7SAerU78ZrP2Zm80Y4Roe1MEUfCpie58BwGoGLQfYw8KUb8q7Z7
	 v2UPpngWTPcemg/hLh2fqBXRoOyrUj96Lgto+v6kx9O/VelxwyuBK7j4kjYf8rvNTVvPB
	 m0HP1bmAJm0sv82c9o3l3s0hCCnb7ahYNGzvjs1vnPBfokQjvIGUuHw2u4u7H4VX3Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
	b=scodVOC7W/nd7GwDu8BYPMRDx71l+4r5PVHiMte6Smc5sykKwDLN3E4Aq3qaLuV9TdVy
	 Lg9ed9O3VSajrN2HkmKKNC9rzR+KY0priLZjTjtlm/w9sLvNweomCBC0XX4EjtJl8R9S6
	 Z7jMVjRLIbSgsvgcq7EpEyBvM170Vj7CeOFJRD1P2HDhahmw58FGhWIDXjRgN98syy4ai
	 EklRlinaeT2c5GvDnfBrzk51MYhiZoHp7CcthVclfSfuzOf+65ej8uPaCbV/7y3II7Mdf
	 osX/JYd9onFa2uBg/n9b2yHq/cnewbxMyCF8WXv1Yrf0ISUbCzJdIAcPFesEGaBCfEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f5G+K8mu;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB8260A6F52
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB8260A6F52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f5G+K8mu
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3ada81853so1368453c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604184; x=1795208984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
        b=f5G+K8muPvFutbfJr6R332HD1ROW1xYUUgwMqGlJG5sdS8n521EAX9bb7/fEpuROB8
         eNUbtmskhwKN9TVqqp2dJSUilyYGIHhpsJxhJDNg8bjAH888Nnj8sTfSQWKWG+KtwyCH
         5yt/NdJ8FyoTKKXpWUSAhC/Q3ZjHTzz8lquGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604184; x=1795208984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBdgOJlsLt8Qt2YLb95EyOEaypO8pVHtrEH3jnavKt0=;
        b=WsXwYPDFRGCKZbnh7NgU06dicLdrpHFfVVab3i6ftrpY9njveN7tKr5bO5QoPs+qwC
         SclQPfGU70eoeudqhU7HcahHTHAf9fxcMs1rB2Mm7Ri0mFu7lPSzYXscqx/zUYluLHzS
         HWFS1XBhNMmvgAczMVs54LoaMw7zyUSNc2TCWiXJqihHb0k9rLfEugBU0YCk5wdpsfKE
         ieFg8C7FGfOM/12Rp8KIn3AZfdYbOB5E/47mT6G0aoKQjLjRuytFPznfOJhkAmdp8hxE
         rdWwjLA5hFwqsg67+yK2xxwS0HiZPrQfERJjr+I4kuxm8joMKODDD4pFt77Z6IebFQoz
         VzxQ==
X-Forwarded-Encrypted: i=1; AL+hErGR3l1eV4AjLfxzGUfn80jFJB9NFNLfyMkB7HsCiRcCRjqXAvB0yrpETj5oDNd/1QC9EZUaUg/Pyao2WAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m8WFGfBdoHx9OB6rpFsfbSBb4ppyEyO8SkjYQeT2f0bWCOOkK
	NNaIn4ur0rl7oJ2ezqWQJkLeZV0Opnt2AArvVqj2l8UNFVUseR6wSEyE9WXrJjZLSw==
X-Gm-Gg: AYBFou23Ye6Fv4jHOHn7tL4ag+bBInFI9as+67tQrEGx6HKT9K3TZIUqqg8/lYOrPh3
	PyUgoW8KpT2RjK1hnHUIyiSyaidNsUkAggpK87kRHtS1btJ3MqIWwSscjCVgCcYBC1aDGcTWURM
	eIXLhoBmUtkb3hfffUiMRDHJNTKoN6j+YN6TgcGB7ERVot7qC9xmNYOr4FkpPPzi/XeELqd0NDH
	GCgW2KxXsBwpikyhzTJCCwvfMjUUfNRR6t5b0ZO4NhF3EUE/kw4AXVoWTUU9koR2SnfqQUJxiwZ
	wV1Tm2pN3SjpkcGioO0hWUYvhMuXs9T+Xe6e6DVHgDpyBFgn5LvGrIn5ftT2UCkkknEAMH0R5a6
	olk9FrTE0/BxvlTe3iS9Gj7FDyr62cRrDmnAjPO0nPGWuy/cUUAVMh0RntNHh9Btl5Zt1nHlb+b
	/hqM7PG5kGXhSrifF0OpIPjps6qHFFFkKjIhjCKT3lKhGpJDT+3KW+Tqfk5X3MJBoLscNul5rb9
	NXzqV5malTl4Qj5+K/K8/dh+Md42uKvhTXbIpHB9g/OXyw21LImvY03gHjx82055xftOFWGTtb9
	x8wli8ggZ4mtreRJReWV0WNYZ3oHTqLd2zDXYue8qqgKMrbF5RAi7mM03J9U6CWVT+vJgFu2DDr
	W/gvOE7l3x54Lv6KL4ITIiT/QAk/uMF6/7A==
X-Received: by 2002:a05:7022:408d:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b50310591dmr3354209c88.23.1794604184477;
        Fri, 13 Nov 2026 13:09:44 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:42 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH v2 5/5] arm64: dts: qcom: sc7180: Add sc7180-trogdor.fitconfig FIT config file
Date: Fri, 13 Nov 2026 13:09:14 -0800
Message-ID: <20261113130858.RFC.v2.5.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
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

Add a FIT configuration file (`sc7180-trogdor.fitconfig`) listing the
SC7180 Trogdor family board DTBs, allowing the LZ4-compressed Trogdor
FIT image to be built with:

  make \
    FIT_CONFIG=qcom/sc7180-trogdor.fitconfig \
    FIT_COMPRESSION=lz4 \
    FIT_FACTOR_DTBS=1 \
    image.fit

Having an in-tree `.fitconfig` configuration file for Trogdor produces a
FIT image matching what downstream ChromeOS build scripts
programmatically generate, makes it easy to use `fdtfactor` on the
Trogdor kernel image, serves as a template for future Chromebooks (which
could encode board/SKU matching metadata in configuration match subnodes
rather than combinatorial `compatible` strings), and helps community
users building upstream kernels for `sc7180-trogdor` devices.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
As mentioned in the cover letter, there is no desperate need to land
this. If it's controversial or people hate it then it's fine not to
land it.

Changes in v2:
- Replace 728-line sc7180-trogdor.its with a 49-line
  sc7180-trogdor.fitconfig sidecar file consumed by scripts/make_fit.py
  (Simon Glass)
- Move motivation for sc7180-trogdor from commit notes into the commit
  message body (Simon Glass)

 .../boot/dts/qcom/sc7180-trogdor.fitconfig    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig b/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig
new file mode 100644
index 000000000000..5a7be0035001
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.fitconfig
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+
+[sc7180-trogdor-coachz-r1-lte.dtb]
+[sc7180-trogdor-coachz-r1.dtb]
+[sc7180-trogdor-coachz-r3-lte.dtb]
+[sc7180-trogdor-coachz-r3.dtb]
+[sc7180-trogdor-homestar-r2.dtb]
+[sc7180-trogdor-homestar-r3.dtb]
+[sc7180-trogdor-homestar-r4.dtb]
+[sc7180-trogdor-kingoftown.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r10.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r4.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r5.dtb]
+[sc7180-trogdor-lazor-limozeen-nots-r9.dtb]
+[sc7180-trogdor-lazor-limozeen-r10.dtb]
+[sc7180-trogdor-lazor-limozeen-r4.dtb]
+[sc7180-trogdor-lazor-limozeen-r9.dtb]
+[sc7180-trogdor-lazor-r1-kb.dtb]
+[sc7180-trogdor-lazor-r1-lte.dtb]
+[sc7180-trogdor-lazor-r1.dtb]
+[sc7180-trogdor-lazor-r10-kb.dtb]
+[sc7180-trogdor-lazor-r10-lte.dtb]
+[sc7180-trogdor-lazor-r10.dtb]
+[sc7180-trogdor-lazor-r3-kb.dtb]
+[sc7180-trogdor-lazor-r3-lte.dtb]
+[sc7180-trogdor-lazor-r3.dtb]
+[sc7180-trogdor-lazor-r9-kb.dtb]
+[sc7180-trogdor-lazor-r9-lte.dtb]
+[sc7180-trogdor-lazor-r9.dtb]
+[sc7180-trogdor-pazquel-lte-parade.dtb]
+[sc7180-trogdor-pazquel-lte-ti.dtb]
+[sc7180-trogdor-pazquel-parade.dtb]
+[sc7180-trogdor-pazquel-ti.dtb]
+[sc7180-trogdor-pazquel360-lte.dtb]
+[sc7180-trogdor-pazquel360-wifi.dtb]
+[sc7180-trogdor-pompom-r1-lte.dtb]
+[sc7180-trogdor-pompom-r1.dtb]
+[sc7180-trogdor-pompom-r2-lte.dtb]
+[sc7180-trogdor-pompom-r2.dtb]
+[sc7180-trogdor-pompom-r3-lte.dtb]
+[sc7180-trogdor-pompom-r3.dtb]
+[sc7180-trogdor-quackingstick-r0-lte.dtb]
+[sc7180-trogdor-quackingstick-r0.dtb]
+[sc7180-trogdor-r1-lte.dtb]
+[sc7180-trogdor-r1.dtb]
+[sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb]
+[sc7180-trogdor-wormdingler-rev1-boe.dtb]
+[sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb]
+[sc7180-trogdor-wormdingler-rev1-inx.dtb]
-- 
2.56.0.611.g1030f0b940-goog

