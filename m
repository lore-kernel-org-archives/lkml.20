Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.78.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489188;
	b=3WvNtvDtdzTbKwgwivA+oncARKtbW6jAsyvyqg8ItJY4IlrKaTLpDf8HW7Uq1uFP6MnU
	 aMzk5j8v33vgXoxSS1MgtR9DcZqdusoCkO8ro5uE3gUEZmI3qOEKx0FaULuqzGbBZf6Ew
	 VvB1Hq0ZWw4UH6X7PmG4ifLWEuNE4zM8s9jcXEN2X6lGHTK26GCVGeyp1mcPJU1Hz4DvB
	 crZCo7g/6NxBjeJvPuRwTqYkyH3858QZ+Zkf6MyyLjh38+/Pr72aa/ZwVcuMNvZLMCNOW
	 E/QI0+tqOEynKfB+CNeNKpu4K5yP0L0E7pOl7N/42SRYjZVkXemtF7VzOubVxnhvrkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489188;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Proofpoint-ORIG-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-JNJ;
	bh=6l1dZYSkptDVN3YIf1wG8SBFkyOtovBr3ZWVhGRwtdU=;
	b=O4v5QnD1Ktk6pGEVs1a9OAOUvgyKbmha41OWEgodPpR3JYVtX1UrZDQvInoAkAkpHG9q
	 OIR7VFY1ROw4y2MKmgiXIsRDVKMuOm4WzGKL0GTIuEIWvnznAG9Dd6nE23+WQdrVk4lXd
	 NI2YrfVEugIoOYBky3UEZiEAHUKdvpCQe86tdTyP5jRuWNzmXAH1u3Tc568LwR8MrxKNK
	 IvPwnjUtEQ6BUzwwqEF1zaknQ8+wXZ4Kl9tE0mygidvWf9y9gC6+TmPHYWzGp23YeatjD
	 /hoL7UB9zA9DLp1Dojk6Q611qIa0z0F/TTd1hFJsyLfMlXmRPaU1N86Cmi9vS3GgsmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=r4UYBy9e;
	arc=none smtp.remote-ip=57.103.78.161
Received: from outbound.st.icloud.com (st-2004a-snip4-11.eps.apple.com [57.103.78.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E0460A262B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E0460A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=r4UYBy9e
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPS id 981B818006AE;
	Tue, 20 Oct 2026 09:39:42 +0000 (UTC)
X-ICL-RepId: 01a158ae-5520-7a72-87a3-73daf2035380
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQFMHV8EUxxCDFYAXRcOVk1KF1UYREVRMFAbXwJCDxwTVhUTC1NWWxNVF0YJGQhdHRkKUFAGXRIYXBRcUFgeRhJWDV0JGRhGXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlsTVRdGCRkIXR0ZFVoJClcAQAtOAl0FWx8RTxweGwRGA0cUQAYOVQpTQghKBgkPK1sTVRdGCRkIXR0HWEcURw4PGVoUXBhT
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1792489187; x=1824025187; bh=6l1dZYSkptDVN3YIf1wG8SBFkyOtovBr3ZWVhGRwtdU=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=r4UYBy9eOz8yTdwn1+rTTMwNidx473GMIdx+YxCvpL7VQg0+qMJNrHohmNn8huM09Q7AC0WqlwFpYbk5w8NkRBHvpQHuaG1F4W31shYoL3TnEOLDYj2ltCUs/S3QeDgc/BRXnQcH1mZq20zZK7UyWMSNrnMrezZJ6ipkbJ1FkfRsOtq6/WFOtC79kjBFN6VMLrqIYKe6U+Sr+zaDMiEj5Gqy5nuCLkLAAd6NlebxbV5/vNnDN3rPoXlF1Pf7UJFFHD8+MXvJBuTDuFQC6pmak8PANNSy0p2YfO1W+M9s6uVV9SB2PWGhrONmWk5y2oEFIWiwzWyXXL0TcQRKrXh6pg==
Received: from [127.0.0.1] (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-11 (Postfix) with ESMTPSA id BD4481800231;
	Tue, 20 Oct 2026 09:39:39 +0000 (UTC)
From: Sofus Forstreuter <sofus.c@icloud.com>
Date: Tue, 20 Oct 2026 11:37:58 +0200
Subject: [PATCH v3 17/17] arm64: dts: apple: t6031: add avd nodes
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
Message-Id: <20261020-avd-v3-17-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
In-Reply-To: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sofus Forstreuter <sofus.c@icloud.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: IWO6_OnO1QwV6aCSooLDyJlpZ6gQM1cX
X-Authority-Info-Out: v=2.4 cv=UZVciaSN c=1 sm=1 tr=0 ts=6ad736e0
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=kLM9Tyy99jAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=H9SxB0RbRSejM8bdbGsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX9PhocdzKsIP3
 sVLkUA2SkCRMQiSvDEc+E9wTzRV9Yknnp0/JZFZLiQOrFwsmObvlqD4+XwwCVtKztGskVpaTZuA
 yj/J4xO02X9guPXJBOr7Q1usiEPhNPn4Ai6VwtPUM5dmob2BIy50s1gW2Im7LSrMP3ICTAHoFNM
 LBNyV17yiUKQkKH3XQrvcrvjsdqYvWQo7BTp0RbNXWx3B50+NAyItySPx58FcwNTdM8UK90BmcR
 IqYcUvVQCcV8y5emkMvdOAocwyw7hSc/pdb1UIVOcT9W2pbUwpxiqr+1Earyrz2h9bV0RRaNt0O
 bBXP2GrG28QURxtOCi09/wKvleYuWQszZIYjlDWJyY0IlE/xM0JmpqjWY1kYb8=
X-Proofpoint-GUID: IWO6_OnO1QwV6aCSooLDyJlpZ6gQM1cX
X-JNJ: AAAAAAABR8myAEgP+tjd9UfkVqcC+VVUp0cDnpBjlBiBenK5qkdiu1hEppOv5mE/Ln48mJ9TzEFqgvvYtmPY1Y3f92xd14Bvx4b/trL5tsxylZ7JMOrPJT1AGcwy902j1BMZGJl1V8RSGtMkKA7XQ5Ku7ViYnF0Vuf2BTnVeg8vtB7iBZ70IoyJGD6BEIl/dSYH/2oIqFzYokJbAJFwVDIXW/WJkDy62cEJ2V3C8Tu7tbhZoyC/ASZ94dOhywwr7gXUpodTKcnNGf0uav0pkz0fOK6+ERZjCYi6pz7Y0LUfb5AjJAdAMhjNguKzxFiyBreJcKial1klWjX4q6GihbOAbrQk3R8hlzjAK+RdGktLf2QZwDb8T6XOhXiObBc0vsuCEX23qJ0ML7VF0oF1mvjx9J4bWSsAoIiLRj9IM4e2zdHUr2ucPRe/xIj1xhleA/gXXJ9zukvwktbCuv0jYbaQUlOEGSX6YFqRr5DkzHgOmAQ3m3vQAPfAWaEcwhgQBzpX81MWYwx445bAyFIeL3EYARReywAw1lZQI0GiRu0MEsBDExQXchtC5tTZBUbIwTvLMBFHH86Ivf1UcbGTQVdAXsKWnOOmk1tv6yLcHkYCB8pXmceTEBJ+dX1PkrfQoNnj0yfztM4yoOsqFBuWhZFGBGHwfiIudSacqVjEM7DN+Bq3eO+Z0UjlQzLf+xWlYz4S2Hq4gVMgSkmQ5EHWIQEtQpogEcp+cJ/mIgA40eqPC/NxBBoJUKNihQ5WID6rCiZb+dR4f+MdfpTpubMELG6CKHsWIQrPiXrXvWf/NngTX8NbYYK/5W609oeSslxl2NLgM+ghs3cv6qnXkL8sNxcUSceZdEiQhzo0jXM/LyR4tvdp3ai+4NR5/iWZ+hJ/PjTXolw96vqI3ncfTrBcXpvwYJsLQqKc=

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
---
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
index 2e9d3d2e6dea..4959190e13a3 100644
--- a/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-dieX.dtsi
@@ -98,6 +98,38 @@ DIE_NODE(pinctrl_ap): pinctrl@2b3000000 {
 		#interrupt-cells = <2>;
 	};
 
+	DIE_NODE(avd_dart): iommu@2cd010000 {
+		compatible = "apple,t6031-dart", "apple,t8110-dart";
+		reg = <0x2 0xcd010000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1192 IRQ_TYPE_LEVEL_HIGH>;
+		#iommu-cells = <1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+	};
+
+	video-codec@2cd070000 {
+		compatible = "apple,t6031-avd", "apple,t8122-avd";
+		reg = <0x2 0xcd070000 0x0 0x4000>,
+		      <0x2 0xcd080000 0x0 0x10000>,
+		      <0x2 0xcd090000 0x0 0x14000>,
+		      <0x2 0xcd0a4000 0x0 0x4000>,
+		      <0x2 0xcd100000 0x0 0x10000>;
+		reg-names = "piodma", "code", "sram", "mbox", "ctrl";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ DIE_NO 1185 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1186 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1187 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1188 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1189 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1190 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ DIE_NO 1191 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "mbox0", "mbox1", "mbox2", "mbox3",
+				  "flag0", "flag1", "piodma";
+		iommus = <&DIE_NODE(avd_dart) 0>, <&DIE_NODE(avd_dart) 1>;
+		power-domains = <&DIE_NODE(ps_avd_sys)>;
+		resets = <&DIE_NODE(ps_avd_sys)>;
+	};
+
 	DIE_NODE(pmgr_gfx): power-management@408e80000 {
 		compatible = "apple,t6031-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;

-- 
2.55.0

