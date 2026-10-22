Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792706342;
	b=AqfqE+wLGLfidMIkiScCHAtQ6t7ITd9K7f5eor9hDIWoRNdJpQXyvWy4Du8mbzRtzGhM
	 LdXZ331aBp/FOPiPO9LIUm773n0Gax/QkQoXVKkQtUQLbSjRoctQF8oDHFy3BuLHvtGs4
	 CwuI1PSHmNQ+t+3xcHtWOImexGKzeD+1/UqSxakbXaDQ76EviQvQnFjanKqyu5I+8ioiI
	 ybZqH9KOZmVghrC4VTxq0e/KrTNOdo9uQugHbqdSNkPMW8CezdiTLQHZox9bJNrsEfwV2
	 6z2FJLe2sc9sbQbxlw27ai6WcXARmy3UlxLA6/SfddE+XGaQA1DT3c49xuwodqfhZMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706342;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TLrmBgRAwOW0mUHNBf1ByblFHvpKFtK23BGn4OBtp80=;
	b=H6VHZgvPrLgMQBOiWPwCUEIxi94UDw6YJUNN7+OqPz7mtmoGbXOaU8ceTXSkTKpymyn0
	 /oT4Ywud3uFAUjo08LvFpsdvOhf2hm3PzDcjBaDEiFAl9RprzeGvQSQslJZt3oTiMNhKF
	 l5Ff8FZBUElqe4gkioXa75cL9ARAAunZCB6W/lKZEFSFBSvWEnKTq+937iWB3e+tSVnqt
	 P2NwuBl6Rzrfz3e4kFGvK6cMTI7B7DkoqIp7trcBDNRwbZDTL/D1/OjNEP9nENuMhsvUq
	 zRgACZmqKtJ7a5/SNGLX2zEZ+Hwghj1dFNd9pdllYpX0ldE72SHCtL7A7pf4p5ww7+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SQjb5oyA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED9606A319;
	Thu, 22 Oct 2026 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SQjb5oyA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792706342;
	b=p7Awnx3dhwHEbPHXjRum8y/UklLn88KMgvbiK4YUbTIEbBk/Kszxg4F8JzUXN8HfJkHy
	 BXXGf44chMzbS4nWUWRr/k0Ni2YUCYUpxDU7CMmQoohqrPcF5GDf9dCJ5J/B7ExwCxSsf
	 Y4751e7lm8XOd0oxv7SDUu7WjURUFmHK5WYHG0wqm9qLbbQr2TVGeqXizNrJg4nFHtuJx
	 vKAogZ3iQ7B+PjV+qOScUQFUYRUcmtMHoQpNBHTuOmPbDMsEDpAImkx45dcNsjg85n7De
	 mvmbNxW97g6oO2rc2XKyO34r+H+m8LdbNYhfXXCrMIcKm4gNheVn5UPDlT7tSZyPEgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792706342;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TLrmBgRAwOW0mUHNBf1ByblFHvpKFtK23BGn4OBtp80=;
	b=I5pxq7hBOPdnP87ZFdcNsRgP4NdwHVNFflCaytup7JZcIp0Tqpm3zZHj8PxF4OuJkC9d
	 wBneT826QJsO7LZDepdJ6wRoVB92tw73X4mffFzq08jkAUJUxE4/erH9p5NhDj0TknPUh
	 p0Ld83G8itq4Sj2zqYCzdk678qWxDCylbFaXdlHncNh9cxeItQrspywtefixvgpP1tbEx
	 mykzggGQgNqCTpYU4zGnaXy6Orf4G5gekLUcgurqnjWsOhBtevDbmDvf7niL7Ko957fM4
	 7dmx3OLmEKgMomn7N+Vlbl6mpqkum0bIjAXujl8ZOFRYVPqbX/4vTfDuCU8jTI/cUjw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69A071F01828;
	Thu, 22 Oct 2026 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792706341;
	bh=TLrmBgRAwOW0mUHNBf1ByblFHvpKFtK23BGn4OBtp80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SQjb5oyAtA71iGMvzMxWI1rhz9I9ufWyJvwSmgF895ZOw9N2PxOqjHTI2j3LQPZO8
	 J508vMl2pDgg4928EbNLcQ6iZ7OsCCyOJrvp/gl/4brUdj0Y5TXWfK5XRJA6zOoZgH
	 +ZHVZo+0kteeJjxrwrMSeb4NKQ2K0v1Um9pWJyzVj1gAyKFasETX5sVP0BIshnayZe
	 S9TFwP86BjRoNBguRXIBpys5Spk8YE2FYQsa1wvB0YK72/bq6Nig+7SNjT4Yh67Vl2
	 sFLJZMcVGyST4wbug6a0oWHQEI+H6/hFCOEHUFFBjhyJJACP131+EcOxEFCPGrpDxH
	 XzwWDrL8U2Z6Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C404741FA5;
	Thu, 22 Oct 2026 21:59:00 +0000 (UTC)
From: Nizat Mikayilli via B4 Relay <devnull+nacht.dxdmail.cc@kernel.org>
Date: Thu, 22 Oct 2026 23:58:19 +0200
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S9
 Wi-Fi
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
Message-Id: <20261022-gts9wifi-dts-v4-1-a361428fe59c@dxdmail.cc>
References: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
In-Reply-To: <20261022-gts9wifi-dts-v4-0-a361428fe59c@dxdmail.cc>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Nizat Mikayilli <nacht@dxdmail.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792706340; l=868;
 i=nacht@dxdmail.cc; s=20261004; h=from:subject:message-id;
 bh=sR0cnCpdpiTlMKTOwU1tkGMcO6qB707MJF9oZ3BW5c0=;
 b=NvF4OuzgNYKzChkgRnLZYtfM6HNeebohmLGyi7XddbqBWrSouH9iRxO940j40KNS6HJuaq+Kz
 zXkynryPgZAAaBzQcqjr4v6uQC3DgxloyghNeMNS0D+fKmognaezyGn
X-Developer-Key: i=nacht@dxdmail.cc; a=ed25519;
 pk=Kay3P3pOJq5klUD+0/I8QX8JGOh0CeQXEwRVv7CMm4k=
X-Endpoint-Received: by B4 Relay for nacht@dxdmail.cc/20261004 with
 auth_id=1111
X-Original-From: Nizat Mikayilli <nacht@dxdmail.cc>
Reply-To: nacht@dxdmail.cc
Content-Transfer-Encoding: 7bit

From: Nizat Mikayilli <nacht@dxdmail.cc>

Document the Samsung Galaxy Tab S9 Wi-Fi (SM-X710), a tablet based on
the SM8550 SoC.

Assisted-by: LLM
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..5e560f523d32 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1173,6 +1173,7 @@ properties:
               - qcom,sm8550-hdk
               - qcom,sm8550-mtp
               - qcom,sm8550-qrd
+              - samsung,gts9wifi
               - samsung,q5q
               - sony,pdx234
           - const: qcom,sm8550

-- 
2.56.0


