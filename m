Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421209;
	b=oXfbaGMQD9UgOpbkUCDj+L91uJzENQt7Q97dHqDya+axGRgosLiQZ6R/XFMjwZpnNM3v
	 Lj5e2P3TQpRZq7wR0VBVZa9ZWaSFAG5xIG9W0SvKbD3EunYpaChxumXQKgZim3EHoUR2I
	 3Vz0D2R2gH/G0yDr02Htau1M6ihd/i1qAJ1xJO9mPPa4g0wWi3g0X8RMQvf0WbQmLIxYT
	 2hEtTwnryQBXJv36/RLmMrY5EHbvpXNkL5ncsvp+Snd7SOSET1pt5vJIDKUtx9njz8wcV
	 aWwaoLB4dYC+0phoE7SDqmf4TXjkm7xpMq3x+oYb96TUd2dMxT194op3lgjScHSgAAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
	b=w5Ul4ZIvUlLK3JNWy4u+5/pdWwymPYBToARTUdZws/Oei9xH70NaXcnaFesz3biPjs51
	 Q3y05Qv9yXLwWdCKyFeUS0DWrPf+HzLHn7q/nKCPN3tsj2Zz8RlflKzBhTvD1rnd1TLPo
	 lg5RTo9Yxq51tYK/cL4eoa/mkZDglztxOui/c748m5bYtbXe5mExTj494ATy4tS48lwIh
	 RRQF53iiNKN8lYM+qGTB0sum9/Ujcx6cVLwlIZ/26WBBZbjMvc2At1nahvPaX8fLUMAcx
	 6PZoDPtMt/4h9gdHYYqAffIAckI6lbFqmKE2f613MwBWasmZ953gFzCWrNFIxxBkfkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cP8YBKFK;
	arc=none smtp.remote-ip=74.125.231.138
Received: from mail-oo2-f10.google.com (mail-oo2-f10.google.com [74.125.231.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89010606C15F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89010606C15F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cP8YBKFK
Received: by mail-oo2-f10.google.com with SMTP id 46e09a7af769-820ff812cd8so875254a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794421208; x=1795026008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=cP8YBKFKTdX027+PZIDPljkzt5BteeSi34Ethbc1zRuWERzEQDqqZ3kDvNXUIgDerM
         /Np1b6wmOE/bUqw53zaAO/gt3l2OcuWlB6RqBOW/f9yYwIkaRu+UYQR+or84KypC/RB+
         wtBSMOE3b1WfV/cA3ref+sGoZla47XKYylsBy0w7beSahgoWkKFARw5eS05jLSXXjdgT
         oWnu0bl7TumAA6EjpLnhCYhqad84cmXlj8/3eNlpPn7KFxlEkNxj/7SasfFlXCIygb4z
         MU3sljri5d5zasyS0RzbP8pYqNJsmWoio8I6O+SCSnsRZMPO04Zm1C5pJIXFB0Bno8EV
         QMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794421208; x=1795026008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3p1f8Yec85jLXGY1wQELmw04hKpnMA5OmY/Vm2aQaMI=;
        b=NOX9jYSF70yil//diP/B7OMv2H/n/bLcVHppkC7L2b30+5dhAUjUdB95QgxchMDQvJ
         WstnJH2kofSwdKL/5k1rVxkSX4S3QAlh2mnFlndXwyYRrmXDNY5m5bQzfXRSCvrb73JU
         NdcgJLPfTQuox7QZUxR2YLvuzAeUubMObbSIJWzZ0yi9n5Q0O/okV8MzMsfdLIYQLDUi
         DQEt46n9Rm6LYap+eQ9QcJ8gbcSsApXskt8Mc5MLKPFoN7c4Ky2DKxzTk/SbbrYYBh3m
         CXn8EB9gewHVWQjvaEivfbhhJ1n+9v8UN8pLKvZmWq1PYmqwcMi3mJGHC5ikIeAlJPsH
         J/pQ==
X-Forwarded-Encrypted: i=1; AL+hErGKl0O/AffITbhhxMhwSb2Q8XC31//347EZvIS3u7NBqsiWntwAk1azresSx6CgzF1aKkT9TBmXTFFKLhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MUJNkvyUKU9kCdFdw3qsGNspQgiku0eDuVch+j7w7SNnqxXxb
	4pPdDdexCzsGQSGspHvA19GrFvze6KFutDDkGmvZ6pAWvIj9ehKCz+CT
X-Gm-Gg: AYBFou0p/Wf+/vlAq/MI0ataUjdMZ12xxMsShgGghl16J2rtZXylKxXpDBklnKL2lWC
	zFUrBvZTZx4lUgXaQa29hc60sYtTiO2H9VwwpsGjAFBRzJOG3cKqGNMbi4NUs4uFlzknvm2q1N4
	0elKPSfnHzxDLhk78oMzYfMXLVBjadHmENLfh4FSWipXg0q73N/GWWvEl/N+9SmMVWXUdFAC52F
	nQb9vAzATln1at7nPXu3clF6MREDIkao/H3uEjZvkuppUVtOxZmNt0eyot9slFepedPuCFWn+5U
	SNa3EnNpjRLnFnRoyqDiBm/DP/XwyeU6l4FENLxurs+B131Wn4e2L0eUyxgbB119vbpkZFPlm3C
	jNJjbSkYNt34tvAi3GIHvRdEQyXVpeZLQQdYHM+2GiTGn1l3bDR0gUEHHcbE2VfXzUrLPCjdIf1
	u+5gMjR9zyM4TFDBp4xmrd3KsLMFvS7Swkg1GNWEjKRwGNRjPsOPzrr8ULN6IUx6gugGtjLM6+U
	m4wWETJ0TxkyzFmqKHqx0vbr6FE09zbsIVkQKLFmjkbXRNiVPICt0W5Y7S5fwb8PVj1kQG+foTe
	z3k5B8CTPUE2XOqG9mbdOjDx9+6tcsjAm0aOKmjEpd0GLujoAZ+rBlKFBlSIA4hHoNGyV7kAegN
	tKZLHZZhmGH/uDrQ2LAU=
X-Received: by 2002:a05:6830:2e07:b0:81b:864b:7f02 with SMTP id 46e09a7af769-860f25e9047mr4277570a34.2.1794421203737;
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcb5f847sm4824708a34.8.2026.11.11.10.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:20:03 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 11 Nov 2026 12:19:52 -0600
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8173: Add the keypad
 controller
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
Message-Id: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-3-77b47cdea702@gmail.com>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794421198; l=1040;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=XWTgqrmP7rORvhppkX5O4ecuuFFQiKCRGXT4o7Blnls=;
 b=3naZYMrXC7w2FeYZunhhVF3fjUGhFJRhyC1EwGqndsw2Uvt/Vy4tRBxmpspeKTjgLQIaHzQBL
 G+jVqjThFk8AXAHg/aysmbransIpv4bPfqEkl6CtjrE6Nmuidatej3H
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

The MT8173's keypad controller is register-compatible with the MT6779's.
Describe it, disabled, for boards to enable with their key map.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 2ecdea33672e..61261fe643ab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -555,6 +555,16 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
+		keyboard: keyboard@10010000 {
+			compatible = "mediatek,mt8173-keypad",
+				     "mediatek,mt6779-keypad";
+			reg = <0 0x10010000 0 0x1000>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_EDGE_FALLING>;
+			clocks = <&infracfg CLK_INFRA_KP>;
+			clock-names = "kpd";
+			status = "disabled";
+		};
+
 		cec: cec@10013000 {
 			compatible = "mediatek,mt8173-cec";
 			reg = <0 0x10013000 0 0xbc>;

-- 
2.56.0

