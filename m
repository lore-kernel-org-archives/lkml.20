Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426040;
	b=JDr0bwtbXkLzCeGGhWhHhhMJSc6906IOhjWR0gyJfoTZa+4MaX5ewlNJgunlGuainSHt
	 meSIwD8iFG95wEt2MwY7CUK7Ai0rIH/aWcDYoJsu66Oz/WhxUIRLYhYl1lSFRyzCuEABi
	 FB5DOuQfQUA1VbGGfyzh9qLy1mIwt6I7ZVhMiUp7n7CMoQYQnx4iSrA7MeRsuX7W9BHkj
	 rAxgzZRIHi7HmMR/NV2lQ/xc86WzsuFZJ7Jeq8LLlYE5zZ1dKqNzgnwFrNNScSfeubC0D
	 w2ile4uuN1uHpnq0kEydXsc1ltLH8AgeERtRpSPz9evrebnyuSIjJI2b+bHSE/q7/NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426040;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=sV07NUFdFEUChvvq9JQ9jX1g0Au9Mf6nya4n4B1WSVc=;
	b=qTRIr3L9jUebExfcGqa6klqtwe4mtJZcWJpZ3l/am80V8qiaaqM18NgkReIjx56BAIMk
	 gRW7FfZ4WzwaNYgimh34XIA0NdtN44K+7D3mZb15nKy8j+RmAQVUjE3EWs/IstwdLq5Mk
	 o5WF0OV7k3frFR1rXFrzQ7JoK94l1gmo8iMZs6LtycbDLPKVszwMo3Idh30Y+iR7dCQzy
	 oXFyQFjSXmAivBvrwSgYvhO+tiKuGviNYZy2ST2WKl89EHGo+gccmWf/fdxe5ndfn7EEZ
	 /r1LoRKUfK2FG+U/N3gWZwCdGlpNUbahcVY0UZ8HAGkgSH6H7BSmrLJA8BcCiLIaMYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCdrMZ2Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE456070089;
	Wed, 11 Nov 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCdrMZ2Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27131F00A09;
	Wed, 11 Nov 2026 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426039;
	bh=sV07NUFdFEUChvvq9JQ9jX1g0Au9Mf6nya4n4B1WSVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YCdrMZ2QaFEWHIRTYRS7dOIqS0gpVDXWzdVAOqCK0VxhwakcpPGjMPhqCtenzSbUP
	 bHaZXFCm6sIHZwi9dQjnq7sGY3mdfIZeE4y3MeR2lyABkRL8GmTYuJsN2FvyYSFbsX
	 XUNIPGyTKxRKuVYWY1Za5tN24Z2V7s9p5NGPhGGnN9lbBp4LbaSP6LoViiUHdOJa0A
	 IKE6KJV+IiDxoI1aO1Iu1LxlNNdyvTIEkVhwZiammZTkqtfGNgg04lAWcqVSZsZC5w
	 +T4/eg0c5I6ZAt3TzL5Cq6LcVkQfVcAzKM61QKDoO1fks73wsaboosb6dNi5WLlzPi
	 /7/Elo92r7llQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:19 -0600
Subject: [PATCH 09/12] arm64: dts: hisilicon: Correct DMA node names
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
Message-Id: <20261111-dtbs-hisi-v1-9-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Use the dma-controller node name required by the K3 DMA binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index 9f0b5d5b97cb..f9c1f7718b82 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -604,7 +604,7 @@ uart6: serial@fff32000 {
 			status = "disabled";
 		};
 
-		dma0: dma@fdf30000 {
+		dma0: dma-controller@fdf30000 {
 			compatible = "hisilicon,k3-dma-1.0";
 			reg = <0x0 0xfdf30000 0x0 0x1000>;
 			#dma-cells = <1>;
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 8bb74b4274a9..1cf552d02ecd 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -412,7 +412,7 @@ uart4: serial@f7114000 {
 			status = "disabled";
 		};
 
-		dma0: dma@f7370000 {
+		dma0: dma-controller@f7370000 {
 			compatible = "hisilicon,k3-dma-1.0";
 			reg = <0x0 0xf7370000 0x0 0x1000>;
 			#dma-cells = <1>;

-- 
2.53.0

