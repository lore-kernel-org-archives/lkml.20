Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051127;
	b=eszJwku2pp21HFbRac/2uAcEVJibZGrdhFnRNisPsZmp0UJ0reHp7rAmkMBN64Eq681h
	 JPGI3tY/mnlBLyT80HxrW8hLPL0nKynT5WW7OTd4IOXRo+a7gUc/1HsUYKloPufbhPXR1
	 xDkaxir54K84wdetOOpuPYG8VS/HM3Yi7VcjkEYJ5ImOs57hS4XiCkyvcppCpxNfgmnaA
	 Hyk+c9NRM2XQT+P1oLCQhgbF8MvP8ke65Skj4bdElo5hd9gNCA/F5SNhet3WTZrxLf+G2
	 wKX416cH52Qk7KDnIm02jXrsuK2qppCfCh22QO0SQ3KPINeM3v6gkkjyWMBRx/jXGvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
	b=nRhDn+8COZFfgGJGjRlEM9/sHJ+VtCYlHGAYleU9t+CDwh4lShmgg9pfmaB/bqdNhbpS
	 rQNx7aM/Wc02Ue58ttktaIV/sECtmBCH0NVv327wPvqLF4khu6Jyzq7aqZRdTCdBPT5Y3
	 lq4Pn3/owCgSFh5O8MxdJBGJ8pWyNdyIHq48vwG0Dy2N/dmzHBQ66vBVHvC/u9LTogPSp
	 zh4XJPbVROBCkQ8KaGqv7flvndc4fIVhiwMhLx0fa4tvxd64JjrNruE0Zr4gLyZHJ6cx9
	 jaWdwvtqIiwag2CYAoLKyq9DbLJfp/e7VKfcVozjZhulnku//NibW6XUUKWW4bAtxBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WcLnrBjF;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8A7606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8A7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WcLnrBjF
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-185fd3a4ca3so2945135c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051126; x=1793655926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
        b=WcLnrBjFahP4hj117P1H8KOoO7McgOsldZ7VnLKpBz14+p8egeKZglizlEryKv+lFi
         8ETonFbWRyuNR223HvqZyNsz87YT+Jfc5DLfseqwwn+QOI6EHCOsS5VXdhpO/oBlWf12
         tndMKrs8kvUKVhYnBi+E1amNaUwFFI1lUQ/R8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051126; x=1793655926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vYe8GiP6hKBNXwq/bmbj0sq6IXWr6LLeCLyGCfiUVAo=;
        b=WAAc8M/a/sYNITq8220M3qe3YtIdAvD0AWfl8621fflygltdIrkP2csTr1AhEQhTJn
         gZtJ0hf7UB9WfAdI58D+UZKg9Y/aVEx0ghRyBJgPTa40C7FHPHrylUCaBH2GUYBg/c8n
         UYoLiPWnZAB34eGQh1Iv+YxVm3c5LSZLCALY0GMEqOW2ZgdohoZo/RvZPPnJaqu7Fqfw
         woYQw8Jtlz4uL6A96WP/ktsTqm+Y81fCW77Ri8P29teR01Re4YqsbsT9UsNF+A2AZ6NS
         qNLhpMBNsYnr4RF1hbhPWO0Zx4uV3Sb7snD3Pjhxffgj3QeUCQLFooveU+oWe6sQ7ZEk
         Fdxg==
X-Forwarded-Encrypted: i=1; AKwUvByWdbyNlbkTNzcxrq3KHzEOhRUDMP9VXBOIZRzPIG3T4ywJQdWIlyOv5rmqOtHQ21d4mZRhSoCvK2u70E8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyMzgvm9YIbPogZYPbHMS4sPKtnGcTOHuxHhkD/YNxiePLINS7
	I5yr5CWPzhBS/HPxoWMaCNOWaI8vtjYUkyse2kKkGbuvNv2ORtjEr/6UNqNnxjCBfw==
X-Gm-Gg: AYBFou1+spEm6OUrHWc+l4zNr8BOQbpF5pviGkwwYlFRA6VIWy4X9WZHuF2np2QFUTH
	YNlkA+GZ4z2cTDIAfMxdZzjfJxxY/YQ9dxTHmHywCNEcBIrcKj3dOHY/uLoNqoe9cWtcBgxhjzx
	iXgBdW/MRe7RfEBjXoF0PcCHYtvbOi+Vkfp7/+Bz+zChC6ALYMTfJ6qxhwBPz1INqnpzKy/opcT
	BJeJAGe2DlIqrrbvfwr+zkJLnMeOb4f/KGHaRRaJ1wqNtcxP2x4qRBBo1xlgoR63EpZiemhS8B5
	4ZAnb6vyiFI5VrMGuUFO610OkaCxPpaR3l+Kl/YcGz3xxxuxa61Cu8F7lq/V8+eNaF9hHFfjQ0u
	Xr9oTvK6l9zOC4VxJtYW4rb4NRWB3x4C7UqO/SHiEOF188KLVUU+VGMAgGIP7xfUj9A/Iol+t77
	G7rrlxlclGKBNzFV/XB2KLKQ3fXiGaQdmAZ9ZWWhznCVAIUpIq/62VRvvKaJ7SPTS6war0rntjU
	nzvwEo40RL1rwHEUzgJS3nxDMRT3mXGxaLiqH0aXx1L27HhcsYrsb0hhaEm8M8GrIrAlAcLSOQN
	zrUwgd+jGqVbYAVkWwqZ
X-Received: by 2002:a05:701b:290b:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1993505e004mr10316882c88.11.1793051126391;
        Mon, 26 Oct 2026 14:45:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a002a486csm13039391eec.22.2026.10.26.14.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:25 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 8/9] arm64: dts: google: Add Laguna CPM node
Date: Mon, 26 Oct 2026 14:43:46 -0700
Message-ID: <20261026144346.8.I4778aeffbdc796147efa8114431efcb201063b59@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
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

The Central Power Manager (CPM) is a co-processor on the Google Tensor
SoCs, as used on Pixel phones. CPM supports power-management and a
number of other features.

The Application Processor communicates with CPM over a pair of mailbox
channels. CPM provides clock, power-domain, reset, and interrupt
services, so we include the appropriate cell-definitions for those.

Because this also adds clock, reset, and power-domain support, we add
them to the UART node at the same time.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/google/lga.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 6ceb9ea6a100..83b2361c5f00 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -7,8 +7,13 @@
 
 /dts-v1/;
 
+#include <dt-bindings/clock/google,lga-cpm.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq-cpm-google.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/power/google,lga-cpm.h>
+#include <dt-bindings/reset/google,lga-cpm-reset.h>
+#include <dt-bindings/soc/google,lga-lpcm.h>
 
 / {
 	#address-cells = <2>;
@@ -356,6 +361,16 @@ abl@be000000 {
 		};
 	};
 
+	cpm: cpm {
+		compatible = "google,lga-cpm";
+		#clock-cells = <2>;
+		#power-domain-cells = <1>;
+		#reset-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		mboxes = <&cpm_ap_ns_req_mba>, <&cpm_ap_ns_resp_mba>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
@@ -423,9 +438,14 @@ lsion_cli16_uart: serial@db62000 {
 			reg = <0x0 0x0db62000 0x0 0x100>;
 
 			clock-frequency = <200000000>;
+			clocks = <&cpm LGA_LPCM_LSIO_N LSION_CLI16_UART_CLK>,
+				 <&cpm LGA_LPCM_LSIO_N LSION_CLI16_CFG_CLK>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&cpm LGA_PD_LSIO_N_CLI_GPIO>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
+			resets = <&cpm LGA_LPCM_LSIO_N LSION_CLI16_UART_IC_CFG_RST>;
 
 			status = "disabled";
 		};
-- 
2.56.0.307.g5fe7bd680c-goog

