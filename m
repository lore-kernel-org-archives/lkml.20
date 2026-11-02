Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639962;
	b=0Byn58xDRCpQKy7YNX4cK/0VbfP2SMaOWl2VQH8NAcy6MWIcM7LZy9RxA6FoEcmNgr13
	 GjZZfvNcFzA4OUnMsV3bDvTTRN8BSlVuKFybrMMe0OeVDB6JdTPsa8qMPRUWHLel+65Ex
	 UsuZM2xLw2FvP/FsnD+adtMVxj2Krsw2iAtJNi3/mFeryUGNZDBv6XUIKbVIMsVr6Lf5U
	 4lXImX027D1hNiT4TgpHV4+/EAbDaF3cOpUBgcbFvU/J6sTL4+/rKvBbJoS3dN6s9665U
	 p4zf3rkOfNWp7Y8B0Mo4feJSZvoppB7eFXEFG4RjO21dprQTfdpEM95Y7ZTderRp6Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
	b=jrK/J/GrQyItasW+DEmksZA5TCBUBfRc/nvrM7O8VMwLpNxMcj+RQGVd8brzGGTu3c5o
	 oAHaAef51lR5TNqYoX25s+BK1I3UBMjYXuOs9qsi3uujzVc65G0VpdcTAXpHhiJR1n970
	 yqznAZw9thrTDhs+Hi8Wn+HOVfTA9NvcgCV2wEZmMkCGTBwnldVmZr2JsX70/DKNZyDw+
	 wLOkKMNLwdM1x51Vd2Bsn/eFHJmHAFQCh64/jm1VJNX21XMM9dBPqhmwdBCs5u708LIh+
	 0su7yygBTyTAQCLS7WH9Uepg/nCpp+Y+YO2LrwYJxm57wLV3PbzChHyds/lp/iVFoXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQwvrX3O;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5E608763C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C5E608763C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CQwvrX3O
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36758ba1f01so1590341eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639961; x=1794244761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
        b=CQwvrX3OxWaAF/1od46y1MESRrbdPw7lzKGyqKUOWeGhNjWn0vDsj8i4tWSycRnqDS
         1h6HFN/Ypl8BGAwrCv5KBjHvKARoRu9gfbUowvgfVtFRB06PpC8KcLdOuyb+1e54DtqF
         Im0kUMhVwWEn0UJj2kVsnB4MqV/Et7iMPTCPx7uokplU9l3wYiByz4EpaJ5jRYyhkr2T
         uJJOMX8PWlarPg3Vgobhql0/RBGPQyX2Iq/sXkhId2aBymvkACQKcPcl14/RqZU3TE45
         RIiHYG48+PlSVQYWVyZGxFXaL1UGqAz64km+KHNbrP1j4avSEPCZwYa3th2Nj48EIt5Y
         K32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639961; x=1794244761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZwpDh7FxtOcNeBtjI56a9icbYmK+x0Sx9wOk6jqJPs=;
        b=hUwC7JcQnFtWjvVtilKPCg+MhtUPqn/xzEQO1EMOOE/gMd0Cza6hy9mX7M8XUruVaw
         8ujsqkjifJjvLma4pjZWh8bdkjC4am2gE+9q2QFpKFGElLCDLN0L5IZTEgBzFnkCfSPM
         qvSQDmgIghlRyS4SWQDNBzzHXESIgODktHJvtJK6vD/Aul/yhxcasacEXEl9nmTdDDzC
         W7PcwZGYdPLdOZROs1wvL4YGjuBwkTM/W++UmVz/WgJLm4WEfbxtnIKbgOe870FNIqFf
         UB9lVO1Pdz9FE6pt1ortHqSf0BZ4P70gwh1mp45MqAXIHittIhxcOxM6APFV4oetR4Rh
         c/fA==
X-Forwarded-Encrypted: i=1; AKwUvBzciSUuIicvXN78amkUYtZX0gvKngcmDY2CTtqX8gFjnWmjHHnSZCuKvkEAQdZS4MC5q7acvSH2e2OwwkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WsgVm98f9z2Rmr4ZhAQwY/h7fV9b593qJNZ74Wf61OdBpoxit
	z6fjvRCiWtFJVm19drGVc9O+7DvC9HCpJWwwumNUv5NP/EgEcF7Qm6pE
X-Gm-Gg: AYBFou0ReroJJ6z4j0ktT2X9YOCDaDlve3jBXNY6Pa53lf5ZH/0NVRXPoYYnQVDDT5A
	T3xZ+1cXAG5Ig3Uej+3td9u2MAKsON+rNfKF+jnN++vrb/V3fC+gOKvFKVW0irKc9dB9j0AUR4E
	nq6I9xH/N5FWcmiPKIbIsJ6OIpIIjMKjgirJm5nwCoiyH0xWgNaF+S7R47WdErwMSCGOkXyiIqI
	WXUgPkoanXrKj4S3b3GLWvrwvr7vadoWWEej30ZNj3mPZTW3bpAUbGKlSOMIdiIL9+9rpwVVxYO
	5RVhzK1KIA8QFgBk716yaQm/IzNpBbQ5FKp88ik37UPwskbRJ39VyHdHvNXVP85uObwmi+7mHAf
	HVNvIbjX6sdV/UcrheGlknEnji54elRYMcryh24eDMrx+IOHd4BTH1EtJfQjAMwCaZk3ReLuK7k
	Zt9S4Srq+HCOQxeJM/oIym2U76YCTkxX2XtnfToBcwo86G3Wzm1UIh7tc8jSERQzYaXCaDPa9GY
	fdZ5Q5Jmpt+n7PnpHkIMtgIlSY/k3uMZCqc7jnDN868QoIuNZtuqYMyDzdYR6JAJ/ugy1oJeZbI
	8H46/HgLZk1wZljzfS6AgXztnTY=
X-Received: by 2002:a05:7300:c00f:10b0:36a:1470:da0e with SMTP id 5a478bee46e88-36a423bececmr19525473eec.29.1793639960809;
        Mon, 02 Nov 2026 09:19:20 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:20 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 6/6] arm64: dts: rockchip: fix modem power supply on Photonicat
Date: Tue,  3 Nov 2026 01:18:38 +0800
Message-ID: <20261102171838.2958552-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
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

The vcc3v4_rf regulator supplies the M.2 B-Key 5G modem. It was
incorrectly modeled as being supplied by vccin_5v (the external DC
input). As a result, the modem loses power when the board runs on
battery.

Per the schematic, VCC3V4_RF is actually derived from VCC_SYSON (the
main system power rail after the power switch) via a ferrite bead
(B1). Change the vin-supply of vcc3v4_rf to vcc_syson to match the
hardware topology. This ensures the modem remains powered in both DC
and battery modes.

Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 11ac78acca3be..02d445d7968fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -177,7 +177,7 @@ vcc3v4_rf: regulator-vcc3v4-rf {
 		regulator-name = "vcc3v4_rf";
 		regulator-min-microvolt = <3400000>;
 		regulator-max-microvolt = <3400000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&vcc_syson>;
 	};
 
 	vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
-- 
2.47.3

