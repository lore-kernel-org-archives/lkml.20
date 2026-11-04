Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790417;
	b=W3LSx2uhni75QWV0wrD8EPTmRu7Tzvwist5HTiyjfkmhs0Qe2BtATNd7TCxZa01/UHfR
	 4l+Gp8Cf4a7gjpT1DXkem7JpzNKVW7skHIPp6OWVoMEP9UoWbI3H3yK7htFDYPJ2SYDGH
	 v6LV1I2lwB+gXotldrJvteZUmTs7m6mINijCNcdBfeE/s2lW1HEqxnw3RJLY3mLfcq7Ij
	 3LqM3O5e6ULKrpGA2XkiW51EznG1coKHJXZmij+w/0xehsi2mvTBccHFLV8C3VwpSwPB+
	 6fti9r8c3jVF8G2yDtCcjwuGsgiQ3knStjq6QIF1sIItlccLpl7cWl7eIEoiLqiAdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790417;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=28vupFRCAsQEK/lZrLM3S/FU2qxtBOxPy/hwdr6RjB0=;
	b=u6bSYRKKw7bF8qpveX038BxzZLfj+ef37t892Cq1/mvR2gZomRSb1lSEPumg6lbHrKkQ
	 5vZim+I1q2zyBzJWMiflBWZvX6gNmWX+zw3hEjIazqF+0JLbUvzCafb+fBCEeROcKALlY
	 rxNidSK+kGBHP+sY2B3YyerbOyFx3RfmBfxBZvIgB603kYfEix4pDSC53Lxk/2XMHCkac
	 DRD5nE/rE/i7JNkGxLj2A1PJX+vlGBwrbHgEAS4hPW7w45VYEx570bfBKjHIDg7Nf0qih
	 vTDNb4dAlRW/rLqDT8MWeINqIXWME8PoYF0BVwg19ljiIvclL3jx+zMPkAkE0gNCPRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=VmuuHQbT;
	arc=none smtp.remote-ip=91.218.175.70
Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE32606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE32606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=VmuuHQbT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NghsSAOsNM1EUmMpvZUVbGu97ngzH5wIbFHRrtkfsWY=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790413; v=1; x=1794395213;
 b=VmuuHQbTlg+J1MQBsJEYvffYl8L/eFSy2iRFOOTgbf1RriM0GgVtjYcAzHj8K8liMzXLp0xY
 X7UvzW0FeMQA0ujMXfAl02p6bdkabBDH6HoAgIQteeVE3SXR9wWAX6Hg9r/qDFa1gFLKIuhoLZ3
 S6Hfc6a57zfWNURm+cWYLUC2GUJb20T20+K2nWWT3nCdvScVLjCG/SE/HHhbCEKXI6ToSAN8gZv
 tZshpbNTzv2694g8npfBMz+Gb8zE+X1TwASILLEAG1Fl0ddEy3pJKKOsraaI1g8yRFbg4XiVv1W
 +Hx98/AUqhZ5h5armBFDiajQI4i2wqLDwcl5a+rOfE3jA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b32100028a2df84d;
	Wed, 04 Nov 2026 11:06:53 +0000
X-Mizu-Trace-ID: b32100028a2df84d
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 1/3] dt-bindings: arm: rockchip: Add FriendlyElec NanoPC-T6 Plus
Date: Wed,  4 Nov 2026 12:05:04 +0100
Message-ID: <20261104110640.1132917-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104110640.1132917-1-diederik@cknow-tech.com>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
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

The NanoPC-T6 Plus is the latest addition to the NanoPC-T6 series.
Add it to the NanoPC-T6 list.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..97d414024119 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -406,6 +406,7 @@ properties:
           - enum:
               - friendlyarm,nanopc-t6
               - friendlyarm,nanopc-t6-lts
+              - friendlyarm,nanopc-t6-plus
           - const: rockchip,rk3588
 
       - description: FriendlyElec CM3588-based boards
-- 
2.55.0

