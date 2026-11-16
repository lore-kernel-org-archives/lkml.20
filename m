Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869452;
	b=KfqJIX0+BCUyo/7+cGJTimuzIbgdXFudcnYTwLlk4geQuO+GsWSign2Pcz5f6xUOnNld
	 QQZBvFxan70p7QO6xkVmUnmnu6he9z2qinfaCseDjuMEIGCV4FHeQxog9kcQdsIOI5V+P
	 d5Tb3ia/DLb4fqb0MYema336zUqAW8W4SNynsxXVyT/w9gnMP3YYkUJUn6dfNb9Oqc7PX
	 biCtXXAiduHi+22Uvj0iNSHoKUCjsGRWO0UfIAzAW5jgB/cvICYfMRfz+KE+m3rYlLsHZ
	 ZG5G8sebXoTR6/w/Hb0nEwiECf1lsrRDm6R+eM+8jKPrGeC0o+GmcyVgw0X4IpCJbag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869452;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2H3USPqsNDDSigy5x7XvWEz9VqPRsXwpNxxJiPmmYi0=;
	b=fXqtBP6suGVrU6jZYDiIHcpGhX2Jb2tQmhmRZ/RNfSWfrhtpQr2+HHpX0Cg5aIeJjCds
	 AEiS+QwqrEWhsD+Fl6ijYGpc1UGh9CuiSIWR6SP8uJd+p9Fb/00/wjuIwK4JkA4i15L+j
	 nni+jAP9admWKG+YIhgbCtTFN0Wh73lywUEW9KS6uD070muNvScoxsXPsOzFo64WT8kEL
	 utBKdt7q72IGf84b9a1RRE6vNAj9NLk6JbEy9G/NMsXnAZ/NhCxpveB4utaQhhVIUBnlg
	 tBL5cvGdNRq0AMbHT/slUrgETLhCXL2dd1TRGLHboLt3wuUVXCX5ZplgGTiEHe99D4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=f1155HqW;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b="Q/wcllCy";
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAF4606A333;
	Mon, 16 Nov 2026 22:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAF4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=f1155HqW;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=Q/wcllCy
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869436; bh=2H3USPqsNDDSigy5x7XvWEz
	9VqPRsXwpNxxJiPmmYi0=; b=f1155HqWXoHfX6ibHV1NloiZoL1sMJS3ccWUBPmwkqSUiXEaKa
	jQLpNz3FAQVKHdi1UMfOhqxAEeIscxu0MRAQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869436; bh=2H3USPqsNDDSigy5x7XvWEz
	9VqPRsXwpNxxJiPmmYi0=; b=Q/wcllCywLrE8vvHTi3DL6rMsa7xMogJVbnSNR7afxzHgAyzXn
	5yDzFM7XWQRZcZb44pmZktjXLB3AeIZLdFayezym6Qc+3nD+8FnPlwh8z/QGZJz+l7qx3MbC5Ss
	VRGteSqVMM7jodIpjO0QgdEQkiH6flpZzs9RkGCA1p9aQQfvrWcrcV+DsCcef9kOozrG9dSVmYh
	90fSse4301isEkktKJte06qY744oxJEfw8izt42U90bcWxUYw/vcC//0Xx/SB3Tpi9MrASA9OaT
	VJxPuVtQsuR9uNfIs+rEUymKZIKiWERsUja2EDJNuYFG3t7xHwlVgB2hszsFkJK6M7A==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:36 +0100
Subject: [PATCH v5 06/12] arm64: dts: qcom: sm6350-lena: Enable wifi
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
Message-Id: <20261116-pdx213-upstream-3-v5-6-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=969;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=rV3iaKjdfvCIrScoNBQZmYrZdzhOToTM5Ry31HH74sI=;
 b=VQAmkbbbweZTPL8KdXg7GhIiHPaJfbg/igvB1Pc+025m39i0GvMDCxuh7xqgK7oyUgIcODeqD
 dCTl8aAW3qzBUuqaHT9uTNM2tXjkv/N3+7lY0tBv2u1PqzDZCLWq2wU
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure regulators and enable it for the Xperia 10 III

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 12bf5420530d3..9d880f6baa531 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -541,3 +541,13 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm6350_l4>;
+	vdd-1.8-xo-supply = <&pm6350_l7>;
+	vdd-1.3-rfa-supply = <&pm6150l_l2>;
+	vdd-3.3-ch0-supply = <&pm6150l_l10>;
+	vdd-3.3-ch1-supply = <&pm6150l_l11>;
+
+	status = "okay";
+};

-- 
2.53.0

