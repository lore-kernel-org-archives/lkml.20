Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919199;
	b=ziO8XgCSQkkPoEG3ti5RaJLizuR0+LYgo7UNJa4mQsIfmwL2aYPxN6DEA1oqN86Eo8Qf
	 dtrR+wNTrgQnjgOZAbkUbB+T4MwHaiw7zgLV4GimmqwE7rfr4v+GbLyiarnEsBJS5aFvI
	 fLqffJ2ULhsgHMpk9piVd0oG0XaprKIVYtORRQB5Bv7zcls0zbLYx9S/2ifMRMiHZSChk
	 S5DAgQ4ceoH9qIU2xwto+4IhrHvb6StSeiqp9YVPQPhFRXTLubG3utbXfl36hYnWRYr3a
	 xOBQGFXKQsePEIQkM8M6I5NxxTKbCF7SjQgC5i9+YsFfr/XP3ZFddSimZgKCctB8q6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
	b=RwwRz4FcaIK8agk+GImErsOxOjBnIFt79olzpYaT7E9QZ8HA10ElrpuhnLHpy3PUzkhr
	 L5IUFWlhMJZ1Oplkw6vy8R/Xb5ycMahTg+M54rJM9yTQcyagaROgTBjTKq8PjN83uT6mZ
	 2+8dVI76ip1Rh2WSasfUTUZKud8zx20vaika28gOFHlrzSyXvXG5KooFQsiLc4ecxVAQ9
	 d1Lmkh1djhixGUewjAJOslF6GKoaxSY+ndfQcydken7f26PUXBB0urgRORWc2y/QC5zpB
	 Q6XBB3KPf2QVGb0OdicAfQgyyhFmVxCyvZx8JyRYQHAqMgRQhzo16ajZzF4VWY2PzIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYvJk5UD;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8D606A8B5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C8D606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYvJk5UD
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49134c8509fso4366261f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919197; x=1795523997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
        b=mYvJk5UDb5fY1RAaiAbz1ZaR7v4hnh+Nf3dD2aEUknU7gJH+VMHD4pmvofPyt/7iZj
         c3YlOgiC2zKp/KFrRsgtPLolPLB3NBgB92GVn8ZJrwalll7AjrLdDslnMVXqyIpwSgME
         P7K3LvBrX+gC2C0UwdgkfyrrHkzSz0toEZq+kFu+4k0MEru+y1OFbhxFnQHZYbfCHR4j
         iEhtzr5ClE4SzLx1u4gAyG0Xmy0pWQtbzIy4BO/W+fRxMeviEY1MWGwx7TI30t9oQLv9
         oSI6sK/rUwLLvO2OEYNN0fWpaqEFqoS6bWRg0toUmL6VXaahvbx7xOa1VFK9gWumkcQZ
         baHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919197; x=1795523997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
        b=PGCB/O547f7UHqEDSuOjgw0YpfQJF2TqqQKPBJtNZ8/vYDrwwPLt0SKNtH4TNQWtPZ
         pXPse15TOY/ugKalGUc/jvDXDvIxv5HQldkI2yRSMoTMPQEVk4nPVaBxSPax+EoKQa1m
         QpkFRXOBFBoiE+wDD5krc4gWHZ4JvbN9pdFUtaWLUHA0GJ4nOqzdBAUHNJkFOQhZv3on
         wMngsD4oOgupjBs6e1ugTv/5JXf344OdIkH5198m0JvbZcpGf1eMPr8KDfQURxyWiAlT
         fPlg6hnBEnIQ+mNHTMt3F4tVA9NjyWTopt4fN3QB//BB3bLh9YYwRdSriZG23lWZRRAj
         iXeQ==
X-Forwarded-Encrypted: i=1; AL+hErFhehSAJQkDmSOey4OdgzhvjA3Vxe8m/UTtVdQtmfujDkEqizn0XxsikLtGLPNEnRmsFpvekxJgb+gq1x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t+Qm2MEDU9bAPs6Q2dzx/8uxtvYJNV7U93RYvlwTPTv/c6Pnh
	6+65mxwZMmSICV/TKKhwSauE+5RiSZWGZJHnj+lb3lgzC2yY9CVlEByc
X-Gm-Gg: AYBFou0cfLe3R4jcPUTvwO8m1uhJIsh+11Oex6VNsdt+TGMl7ppk7KKyoNixIqXSTaW
	crU6BhhsCZ0hjQ/ObMLUoPGv9SvjCHlANNgtyW1Ut5qT9L6eZ6zHS9hi9znJ3EN3Dpjm+UGl+Mo
	uwheCttDV7TD25j1Wvh3bunA79l4I/wivXU5XKMskKipl+OVMgEA8WpJf1AYgVZnt7X7CEl07Gv
	3yQWmso3xuVTy78sr4vghhwToy/TIXdgK2PspouBzJ1Wtyq+OBL3yeNstnDeV6VKtykcOm0bz+1
	jBbws974lroYm0FW4Nt0hdGTaXx4a8FRzNbCSdpNIS84+f4TugEzsJZDEjVmlj1RRIyFj4/GZjV
	jpi9MqxZ6PR0U/VLLDzXrGQMHWXaU8qD7TxssrfppzwwJRvSeDoGDea7ddRxgdLunYDfCueNRvs
	PF4ekWgvhrFUE7JlpnqeYJWjDDAWj7SG8dB2P9jt2MHXZDlgfIYqGUKVJ5Fi/oXIv8gK3FshjAn
	oDfXo9+DvFCsJQvZeDKfWKjokyaMoEJcCghiC9R0vZlYREWfF99OO8SYiUfw1IGeuiMafKzi+8E
	Vb2JOW91Nh2oGy4iA2EAOdRPuW2gsKkzj+0baNUspDKNqwzF1AYRweMKLdW8/vWLcNHoBQ==
X-Received: by 2002:a05:600c:670b:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb7987fdc3mr32412055e9.1.1794919197198;
        Tue, 17 Nov 2026 04:39:57 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:56 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 08/11] arm64: dts: qcom: sm8250-lge-timelm: enable SW43103 panel
Date: Tue, 17 Nov 2026 13:39:43 +0100
Message-Id: <20261117123946.668557-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Enable DISPCC, MDSS, DSI0, and its PHY. Attach the SW43103 panel with
its power rails, reset GPIO, and four-lane DSI link.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index ecbff27976fc2..fca48472f5dfe 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -557,3 +557,42 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p9>;
 };
+
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in_0: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_0>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	phy-type = <PHY_TYPE_DPHY>;
+	status = "okay";
+};
-- 
2.39.5

