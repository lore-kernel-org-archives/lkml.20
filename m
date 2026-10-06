Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1CF49F105
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302586; cv=none; b=sRVUhH1IDBFcO4Cnc2YNEGyTwFy5DieE82uYwu0+EvoMCgqjMvos2eDIQ0ag+YTVQ3jkyahoHTKXhjiymJXGNk+l1WRjPgY+qx2hdJVit89IBG/7aansyuS0vISQO4vLq5+XHljr+Tnjrwbidz7EvgGMPlKk5EX1ip1G1GfvmIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302586; c=relaxed/simple;
	bh=DtVVqhzPhKpRS7Y/KUFbFu029wxRWP23ekIgrNJm73c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCoH5maBI2QfReAcU6mhgww4mY2GTaC/d/NMiHS97rR7H3eaKPrc+c9Ww/cBqt87/CJz9syzcLqnS53oEOkBCYqx6fKIrHi9/Fa3CG3Q5lL21cHRAo12L6DJlggKlxNvSCAhqIkyZhd/LrszLCfOekmRPC6QcqV9RzWmG4UCU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ctHA26fg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ctHA26fg"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b02a2359aso912431f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302583; x=1791907383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zNl6UGGxbhfecF/18HhuaAiuKj/2y2M+Jhf4QeVujQ=;
        b=ctHA26fg+15iI8u5bJLVJwK0IfIrLiuVqES14h0P8I2v3RtuLVuylXKknFKz8LjQzx
         BJsrMPCa0MesUmTiCpy39N6Z8+3w5q+9UJ+L3yOXcZLzHXyaCq2Kq+n7K++lRVXj50r+
         NU8c97HDgdrw7AqKwFo1r0DwQ1ofVv6/8RjuG/sQW/VkrjAtHAjjt2R6W1Kk/3+yRbgz
         RiIV+4pv9P42SqsGfqYRxH8KR33YYlHQXC2o1FEhvNkm2N3JlhfxPlJKD/nUSe4WTiwE
         nffJckFys2/3oCl8ZW9Kqs539Lmmh0pluglLYBrqB62fDQKP3iMDlVQY+qqyMJxLqa8A
         3UbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302583; x=1791907383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zNl6UGGxbhfecF/18HhuaAiuKj/2y2M+Jhf4QeVujQ=;
        b=F+wY4U3vbsGJKvBzaRdf3xOPIm2ZI3ix0qzrBcm9FW4dwlXaPISsEBJIQnG4bGK/zm
         DN59Ur/ZdkcO6wd9zXTRSsR3P+2FfydYxr+E6XO3cRlPQHLXIS5KlvV7DgJ112EPng3+
         SqnzHSCy6J9F2ROFMDk8q7DaAqIgzYF0ZV67ISXoGdp0OeUTd8jWS4lOiDqpmHspAFNZ
         XV5xxihprZmVg6rrFGJrzo8PAxxxewJsJhhoQgVIWVGwVf18esnlYWYznHtQpnqUtlP4
         iADI7dlqD+8IRsax/35f89N2jxLobAoOMFtCiCPxsjmyOtCFxf+VTUZuoZkwfnkuUfSW
         uITg==
X-Forwarded-Encrypted: i=1; AKwUvByvmcL8kKjO/d8KcXFoK+k/6em631G94fGslj7IbOh0saLecM8hWAqBrdmRm+MZFTdFSGlrSwq6goY/47Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKo7xyZskHolbwAO88OjQ61g++rJviyaXGf15i4Bpfy+n1lRHQV
	vVHnAx+/4AU1vOH+YWZjE/HSLrB1JhV73dyv264/c3JXPQ6/0gx26iJPY8qppH6nJdQ=
X-Gm-Gg: AYBFou3HiqZ07mOILqNVbYzqDRSkOxsv/d7JcPQOEHSafJZDrOGCBRcFt2J6zL1f4fB
	utKebbEaMexfBVkOdtiwNub9kg36myUVBnxHbeLJHosNLRicVZwm5Vr0RK+WGpk9jciYEnvhA3E
	JcaoSDA6/4kPYPVQIaNlkFtPf6qENV2gxvJABMlgqzQDYA23Xn0LI1yDzrkySTMKK3IOk5PY+C+
	RXTPF+M0ZyLOvS4Kbe4/b4cgKZOpuq8wmjwAXEZiJV8G+uSxNx9CQCWB6ZCkOkBDiB3uTSItAuy
	C5gzl0UkNTYR40Vfg02PBol7wamKtsI7EbZ7oP4SPBvcT8Nc0qb5IvfEcNg67AaGUlagjnNYwhm
	/af35D4fZD9fr/G103Duw8xkQDBtutm2lvIvXgunUiuAVsB6sVShdSbOKbq063kZ/15FhZWEnSl
	vWLp4Q8cIV8iKnPfN/hDYO+5TNW2NysLzzsncur1bi6BMQxngI4vxGvL3MH61zc5J/J0uMv2FiA
	W2SkFeTIAuEovw26A==
X-Received: by 2002:a5d:5f88:0:b0:48c:4a62:9b31 with SMTP id ffacd0b85a97d-48c6d164fa6mr4430220f8f.5.1791302582565;
        Tue, 06 Oct 2026 09:03:02 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:03:02 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:43 +0400
Subject: [PATCH v3 5/5] arm64: dts: rockchip: name the reboot mode supplies
 on RK3576 EVB1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-5-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1763; i=alchark@flipper.net;
 h=from:subject:message-id; bh=DtVVqhzPhKpRS7Y/KUFbFu029wxRWP23ekIgrNJm73c=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV5zMMsjyuKV/rLErP3XNq7l+/lozp9X/l5VzY/9X
 wZNmL5PqGMiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTSMdYxYuDiFICp/nya4a/sRJNX3Bof5p+oOy9yeUfrnttnuN0V1R3vZ+1LO6Wg88KdkaFdSUL
 OXnvJHnWLuJyWIqa1T0p6FDJPTRBaLpeRIPWihR8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

A reset that carries a boot mode request has to leave the mode register
intact, so it also leaves the regulators as the running system left
them. The DDR firmware that runs next configures bus QoS in the
interconnect, in CCI_GRF, DDR_GRF and NPU_GRF, and faults if a supply
behind any of those is down. The NPU rail is the one most easily left
unpowered, as nothing else on the board needs it.

Name every supply those blocks sit behind, so that requesting a boot
mode powers them regardless of what the running system happened to keep
enabled.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index f83d129f96f1..d8191ce8bd42 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -957,6 +957,22 @@ wifi_wake_host: wifi-wake-host {
 	};
 };
 
+&reboot_mode {
+	/*
+	 * A reset that carries a boot mode request leaves the regulators as
+	 * the running system left them, while the DDR firmware that runs next
+	 * configures bus QoS in the interconnect, CCI_GRF, DDR_GRF and
+	 * NPU_GRF, and it runs into a synchronous abort if any of the blocks
+	 * is unpowered when it accesses them.
+	 */
+	ddr-supply = <&vdd_ddr_s0>;
+	ddr2-supply = <&vdd2_ddr_s3>;
+	ddr-pll-supply = <&vdda_ddr_pll_s0>;
+	ddrq-supply = <&vddq_ddr_s0>;
+	logic-supply = <&vdd_logic_s0>;
+	npu-supply = <&vdd_npu_s0>;
+};
+
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sai1m0_lrck

-- 
2.55.0

