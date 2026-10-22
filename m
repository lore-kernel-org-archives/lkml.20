Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673641;
	b=C2mbCWkUCmsruW85incx0GBSoAZ5UeiIcxrlwIDIK1sVt6HaWZOkV91e+ni589pZ/FSo
	 jojAu4q9fPevHEmsqmbH9EXZ8u2/+TBK1w4rrKGXVr+5TEsvWvjcyDiu7vgoo0C5fAWAN
	 XYBJ77Dg55P6gdSpEnAKamL3ORnQknlNB3cVl2BEOHI/SRy9z+h0OpF7v47gNQMsysnT/
	 ThZgSzezJbl12Wn7r2rWJrJ2+qYZS7mKahXdSihfl75HUtzpWDnJ28AVDCKQ2LEoCwZvu
	 +g3AesOFcFVlFuSIoT2U9mfdwb2tQlI9mSHgt2xL+313TgeC0AY/+rlWTLujM4DPW6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
	b=XnqRXcRAfC76/1CNrrzjOtyxwORNzxjg/AD3j9hsxQdJKySUMlmRbi0oXUCGfP9sW1D3
	 OkqnkqeNw4+o9Z0+F3yp9IDNfBx2MxBVqKLYGsoPmVZ9D8gs39214YyqpfeMgCrJoN2Fx
	 Br33naMXPD94I9dZm7VtUFC08+JgiMZfkP+CnPFsi6Z84nVW4OelrDBPGuaGvvuwHHoNZ
	 p3CPtr9GAJA0umQgeIA7dXEfOzOKlenGvbwS7z0ku661qJrqXXlhNYO5EowukiYexUOIc
	 QPDAFvZuYyRqx+sHp3RSwJ+T0/TwfwtCwEh3gNmB5vwAqUFTVyfsm9Ra6VMr0bQh1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZK8QEbjQ;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B996606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B996606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZK8QEbjQ
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9400d26b5so2366735ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792673640; x=1793278440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
        b=ZK8QEbjQ7+4is+OUrnWk7R35dN/7olNzkaWpzVSAlcXmUnTaQEV3vkMkQ86Fv/jeaZ
         7RjNFwxqNIIoe6MT3QnXVlhpe3cVVsJUaEtcfDuM1SOZH5K5fGaq1QroKufkLP1R+NvD
         pXKSn1THSitcx5mV3N68GwkiKC3/Z+OUJdnpeKObvR3qlsbXMaMpYvFkmelyhtmosQhi
         PCuO0EVq3dyAyHcl/7SdN0Jy+Tkpkj2AvWMc//iHfXl3hyHLjKT91YwmHe9W3YVcuWgl
         afq8Bcoig9m00JUzzDZGCPNEqMj+MswmNlXJyBxnzzbWDLb2ByjuHo8TdatWgP/Cl2gQ
         FLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673640; x=1793278440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUN0wSbCxufL+1zQC0DuNs4VauEfRZkkrTtPoiI3bLQ=;
        b=GUq9FrQ6jG3RjV06PLj96vlyVvqVaOuxtuWC9AlBAKhfiCulqfnizOgWxTsbZb2fYU
         ZlfV8zNKDMDDJXt/ZBUDQ1niTHSDRdabugr1Zuw3cqYIdTFWv3MXhojRPM5Qw3GOO22O
         Jkcag9dSxnzb47WBji0lZJF9UQBFmVIQ77tmUq0f+3Ntbar2wdxmLx+P39SyvIcFQOYg
         UtnKQoyvzW/hB3EONEZDKikFUKy3vtQ+SReeD1obinFYaxTZ6esSFcUu0gE1b+b5HpQT
         kBFyEs1GX1sjVaO7xiwARNEfopxoMqOXvD6kL94bK29uJvB9u9X3akumhWrQvTRRhUO5
         h5CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv8SF+CcI6WXizDYBVGYfRas5VLyT/3/C/HHjpQhyWUUDIyAMF4q10zRonjCYc+vvDZ4cEZ3F7UJKypCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeQWswUGO4HqYF0B6nIKjibRPfJISBmIyDqvsKLviGc6qRK6XV
	8ZVtF/NG2gwxhFutGGPwbDyN1BdA81bhREHpUn7JyFXz+3rFdP89xxuN
X-Gm-Gg: AYBFou0K2Cyq0i8MKgHOiV1GInuHc30zcj867ADjkBWoeLSb7GdBwWi9b1NTvEhfjDT
	zlcMSeii9d59Di4qkoPLJssd8CGj2PGg0caYf900xumP86HTfDmjgltfeULAq5bJSWzcH20iM4E
	m+d/rtqqbVLBeuSJ0buZZ8zcZsaXKDeq92VpPBU5M2V4qwV9paL/5yWdZmVlVeIQjx5MsvfQ5+r
	EIz91/6b+Vnrb+mj15Iqw+i9NnESyx9NEAG1YPWb3VUNUGHyuknGq60TRUZG4Z0/mNtWKffToYA
	vflfedvir0Q0GuE3+KYU4MbLDAOqf26xGTiyIw8aZAxMVpJL2JNjQXWBuSF83/Q+DHH+ATqGy36
	TrYWR2U8Nmpv8baMi5neA+cMPdMf+05yBTpASael5JBulbG8OrOghHWTx+0sfYaK9rPyv/aPzNx
	vLitKWZfX+2GhzoHZkD0OWSngVQ0FQDgjABjK8U8lL5/nZydrp/+8GZ1JE0bw9zWcasXNHweh/O
	m7vy7jQmxqBG80o2tYKL/baZpV9s8dlgzKhaulyvyGaM5tqHLSq/viJaUc=
X-Received: by 2002:a17:902:c94d:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2ea4321cee8mr68893965ad.0.1792673640404;
        Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b435243sm23704165ad.31.2026.10.22.05.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:54:00 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Thu, 22 Oct 2026 20:52:52 +0800
Message-ID: <20261022125339.82746-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022125339.82746-1-liujianfeng1994@gmail.com>
References: <20261022125339.82746-1-liujianfeng1994@gmail.com>
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

The ArmSoM Sige7s is an RK3588S-based single-board computer which
shares its hardware design with the CoolPi 4B.

Add its board compatible with coolpi,pi-4b as a fallback.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cff..1b905a7af8009 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -99,6 +99,12 @@ properties:
           - const: armsom,sige7
           - const: rockchip,rk3588
 
+      - description: ArmSoM Sige7s board
+        items:
+          - const: armsom,sige7s
+          - const: coolpi,pi-4b
+          - const: rockchip,rk3588s
+
       - description: ArmSoM LM7 SoM
         items:
           - enum:
-- 
2.47.3

