Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002248;
	b=Zr5uD+zW9IMxgopPvgSLqpL4RDd6hh4cYlNg1rerhiFYXGUn9ZbrE5xybwNsW+eru7wC
	 h83CMR53NLGce89m83gnbcTVHXyS5DCmYl1MVogVO/TL3gGow0WCrWjmNrvw9CxwNnTE3
	 2QuU4f9xYWAfXSEN6CHnRnA4Y9WtJjaFXQqJXTnV6FpjaaO+P5gcRlTy+YUigrNA4/85K
	 MQrOXq5maHxWz3bMA8/p6o1LzU+Cc7TovXYb1VsPv39KNUxtBi4FCLcRpkBNQc8/ZShgm
	 uFQhe4IgRkNmGWHB1614T/Dn9n5e0/zohLC261aatHWNgFslGcfUrGkVV00FpEbuZIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002248;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AjJGDSnrqmYUipHDjzg+wif1A7ljv8jU279SjBH7dJ4=;
	b=OmmJjTPvUpmWNPG+qcTzzKcU795cEZrXWzOZBfP6BZvGWMsRbfyGBJxI8p3wLB9eSYqg
	 DJQPWotwoclOg5YrsxZqMSR08pl558fi7x+UcoYQqLMqLQxCzJUAfbvb9XGkyNtxOYMEy
	 pVIwp7TSSNa8S84ua2Mb/1UEKjR4bHsnjo9+6ESH8DnuI/6trfPhysYOOzjB2MkxLEoAR
	 JSyqdW+BFF7BKD2zU/tAqUztEvqGCSOAqOpGJyq4vot32PnaxiGfZQyD50Mf32GWewiRW
	 X/UejiWoTBFJQMK0i6gFSSfCj4Mkn2juKpS16CTa8cDxGNkkRhD5P+he99KTS+4dfVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b="JC5/HUVV";
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57477606A335;
	Fri,  6 Nov 2026 21:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57477606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JC5/HUVV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794002240;
	bh=GwsxCh0AXOERUXo7gF0gQrMDOeUWpvtvAN+2/W8c+Eg=;
	h=From:Subject:Date:To:Cc:From;
	b=JC5/HUVVUUKB+7jlmcuSkL1H69b/fsB0X7cx49xzmFlutM+WfmZV+B/Ja1+M7Xgug
	 D4z1kLG/8yWv7rIcCThR1ZACjPEx9euPq3Legd3BDQn3S+xQbiYqSTNh+hW9fWGOV3
	 5htShih36DZ85BzCvGSylSUQBdhAK0gd5nohKDus/J4ZxCFXqkACxALN6NdDBC/aDr
	 L19QKR3YPTxf9+oz8gR3DMDSgKcdDWSLO2Lfq0IK2am0pd9R7wdKgWryvgjiWh2wBt
	 W8MQfle4dHGWscBvhzexq95/ipvCAEOG9uuzkYt7o45M3B/2AIB9PMAVzeFd/V7eKH
	 79A9tyrpEs1zA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5ACCB17E0411;
	Fri, 06 Nov 2026 22:57:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1183348002B; Fri, 06 Nov 2026 22:57:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/5] arm64: dts: rockchip: Enable more features on RK3588
 EVB1
Date: Fri, 06 Nov 2026 22:57:05 +0100
Message-Id: <20261106-rk3588-evb1-dt-updates-v1-0-bdbe16223589@collabora.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPduEssjQVzEcxlq1miBZBzEhv
 LsTjt/h/1cwSSoG12qFJIuafsYCOlUQn2F8CCoXQ1M3LVHdYnq7c9ehLAMhZ5wnDlkM2Xl3Ie+
 jDwwlnpLc9buPb/1hm4eXxPy/wbb9AH7ewtZ6AAAA
X-Change-ID: 20261106-rk3588-evb1-dt-updates-d3739177c7ad
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GwsxCh0AXOERUXo7gF0gQrMDOeUWpvtvAN+2/W8c+Eg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGruTT8yHuUp5JsA0YUEcSipA8BPrEgv9tOTn
 BpyKhKn7iHae4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq7k0/AAoJENju1/PI
 O/qant8QAIDMrLDxob+tGOo/PrHD97F9SUAJP2RGPodQFfQpg+NG/3ouQBzRCayD5KaJCQHBAjt
 1BOMrZfXRUj/ZpFIldVJCvV69ybFHSLnqQv0emDwRFP4PGNJPPDv8sSAmvKaKdUGeDECvfpvfl2
 hrddw7mjU6LBzOT7nB98U5AKEY/cBBIYQfc4pSVYRdcvMendL9BHoaCSBkdky0AClNDpVqWAM4M
 ZtrcwchjkrzZS1l0WwKqPjDz+SqmNIKhVJfnxheJGWkXqpfw4+KGHU+VkWSZxQIL+7vMI614uOS
 Sn896Fp0XI5MTDXvk7M9I6Zs89sV4WC8wbCqv1qL6C/4Q6dZdWyIbuKjwea58Gl7AscjtRUNhY6
 rJpXQfpnE16e9YEEujM/E6fAKmz5KV8p2+bv4dggRPAsGFqRm4gMQi2v/xtBYL/FN0T75exnLAS
 n23770Hiviq39bY2B2VEcwXmAkgWRue37jIZ0AB5X2uJKbtvFysQ+dx3GknsKPWZdYl6vxgAm/z
 rRB5XUggr1L+uN7jbp1DVFnCMgHrHg5CO7EVDN+q1LwbsGnZYLeexO2FjDEsYUcjkEBnJ2npASr
 NEBn4MIPR/nP1SyifNTOYk9GUM7uLVAS6LWXVv65nErQrW1en6Aq29UltqXFbxsUBaheBUqcNvO
 v0Wklf9t7kLVpG/+iMewngg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Enable a bunch of features on the RK3588 EVB1.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (5):
      arm64: dts: rockchip: Add missing PCIe wake pinmux on RK3588 EVB1
      arm64: dts: rockchip: Enable NPU on RK3588 EVB1
      arm64: dts: rockchip: Enable HDMI sound on RK3588 EVB1
      arm64: dts: rockchip: Add DSI panel to RK3588 EVB1
      arm64: dts: rockchip: Add Bluetooth to RK3588 EVB1

 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts | 180 ++++++++++++++++++++++-
 1 file changed, 179 insertions(+), 1 deletion(-)
---
base-commit: cabb6811c38a46337d5f4252b4dc390f9296856c
change-id: 20261106-rk3588-evb1-dt-updates-d3739177c7ad

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>

