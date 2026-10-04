Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5623C0A15
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128741; cv=none; b=aXywShUdpfi+VqftavdtQRQUH35slUT37QghTEFCIOCid7u/u9NMUW/TuV/0qcxmWcRJkUHIsUgE/FaSZszo1I1gE4Z7pGY2ju5vO4DkdUWmzDY4RqtaG27dNvebEXeuZVKr+MM2bPBLwhviPEUdqB7sM2SWISu6SdSSbNRJNvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128741; c=relaxed/simple;
	bh=3MD4BSaEiNQZKARuhDvrcFucO1MvazbLvmRPiKQJgFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLWFZPWIDhZHqbBkhmDZZLhVkQKFIhMkLq/wro7NamTxQRxz6RzB0ZGxl1pej6bzXwsO3UlWJywBL/W2AQThNq9fTR1l3TbRTah8dt31cmuu3GcCLHYBRrpcNJfmnjGlEjx9QYZS3nzmVLE6de73zzuvQX5xTO6TSMPyt9ZnnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtR/SdK8; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtR/SdK8"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so9305795e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791128736; x=1791733536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6KRV3JoJ0uG0GcrMZQfb8S9vdxRD0/aDEvY1h+kt+gE=;
        b=PtR/SdK8edAKi9mDw9kz6xTMXQ8Kt4UsoUsiuKiUY3J0+B9IM3YS4VM68QVHUmm5Ba
         zvxIxQxqxGNMaQk1kC1qYkpz9oWdNayEdqBpFzlI3AUHTZeSI1baD2xcWIwSq5j9Uy6+
         1+jT+ZcEfydz5nFuxwZ4YsVc7h4o9z5Zg6pxrkwOCszP6qzG5vYnLl31pJZhROy06I7P
         NJEnqQMVrOy3y10mWN0MohhszsCYHSwJWirfoyLOV2BUagxIMvi1E3zotpTW1qWPX4aY
         obf5XhqSzlop5KT8Z58CHdZsMBoAjAyTg3haKbXjpCxZxQEo0sZFViu1E0t2bW2jZO+c
         fCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128736; x=1791733536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6KRV3JoJ0uG0GcrMZQfb8S9vdxRD0/aDEvY1h+kt+gE=;
        b=rel3vnuZ62I2GOhgCkzfqE0PHBEFfldUaUT0KmhgT/FMjDMPlXSUKbjoc7JY9GQ4P2
         jMRiHOkohJOOt0+xL5Bcj+u9ZMzlivGwb1nzsg3ewIHuZDMvCovw7o3QmVUXxa9WF1JJ
         ISX5lbDjmCcmDZdUXBc0UnVdtyLnJq7UCmlCfv0Aseo0KwpcC9LWwGVQc15YcO5Xd3dD
         o/MQjtKtwuMrDTHC4VgLr3uj9TI43G1OEbuuhXExzokA3XRbW7OOjlLJGuY2lTRJncnQ
         j9YnIGnDctxER1J3eryWQZdOlC6v2wXWhuBjfpXl8iMXrVRc314B++4mNebADb4FO/sn
         KrsA==
X-Forwarded-Encrypted: i=1; AKwUvBzJmPKxbja+31cWYhKXUoRrR1QKltdG7n1yjCWOs64enJJK+WSqgMlFRN+Y2Ri1WZBpQfeV6BLmQLbGI/4=@vger.kernel.org
X-Gm-Message-State: AFuF++lybb3aXTDwAzojCK3OFHXdU8gsGpaQN2QvqKwsAn4IXncTEWVz
	MaMQJbl/mgnjKOu4yL5KfODssbP8AXopJ59RgFmsITN3J7H3VfQjJv6A
X-Gm-Gg: AYBFou0YkDUFcOELX7oc6Dydi+XS4+X20SFqkKSqUmuxyWpCBIzsuxH/D44dvzyZMwu
	WsyQQ946V2vUxbjF7RfMSuSGkVwRhfrkd5YK8v0r2eCxXHwgQt3XQdtSi8HX3ihXvuP4/FgJ/0a
	RPumofzqdmtb+etMQ4O/Em16tu9NKfxj5Ad6DupzghktajB3uGtUt63B2TDdHFW1cJp+gs2QP0j
	EGlDu4KXNJj9wGMVLq74zIU5xvnH1klllbdCPvnOzIUHaqu2caufb1ytMuG3WUgjnTjZ2mbxvNf
	+OSgeRxuXBCbNqAiC550PMhwpYbvmI4phvn7L3L9UuTNzJ/j1s8vepw+7VcnHDRxcSuOF60NlBe
	Vmd1XRth+isuG28FLFHWiVtGuuIGNFURPiq90IEI09y/kEaru/RsmECBL48ghP+HOCV253Txmic
	0SJkkShLRpUkmlU9LnseMyzyiyIln6uPvIcl0noBTN+WxLUjrFi8hX3x7iQtrShMmzIbOEoRIwY
	6ED0TO4BjV9TWhVt0k=
X-Received: by 2002:a05:600c:4e13:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a0274565e1mr160503765e9.0.1791128736181;
        Sun, 04 Oct 2026 08:45:36 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm168639935e9.1.2026.10.04.08.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:45:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
Date: Sun,  4 Oct 2026 18:44:49 +0300
Message-ID: <20261004154456.145362-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004154456.145362-1-clamor95@gmail.com>
References: <20261004154456.145362-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinctrl-names and pinctrl-0 are defined in the common device tree,
having them in the individual trees is redundant. Remove them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts | 3 ---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
index 6b30e17459ac9..f888987ce1340 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts
@@ -25,9 +25,6 @@ ports {
 	};
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* WLAN SDIO pinmux */
 			host-wlan-wake {
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 896639599c126..bb20197bcdfff 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -8,9 +8,6 @@ / {
 	compatible = "lg,p895", "nvidia,tegra30";
 
 	pinmux@70000868 {
-		pinctrl-names = "default";
-		pinctrl-0 = <&state_default>;
-
 		state_default: pinmux {
 			/* GNSS UART-B pinmux */
 			uartb-cts-rxd {
-- 
2.53.0

