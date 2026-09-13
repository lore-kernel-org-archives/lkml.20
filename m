Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634323E4115
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303083; cv=none; b=BC1MiMl5xXsXAnzo/x0CCBmDBr6gMS1zb0WNwePEglPf9Z5wrEOkHwtQaWWwlo7OQV/+no2JG2dqHDUsD8VEP8AkMg/MQahqVUAcQMNkdzSr/81QDj16kt/nwABVUnbt3zky75NlHNfMONCR93twTpyzfUO9amjRXZAxKyu9R/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303083; c=relaxed/simple;
	bh=WopdJzA3/twob5Fm9r2GzrgRY9PMRSEOdNbuBbpJ4cA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgJa2zn7QiftTs2q7hcqzuxGltaWpAlBik6jeBJnRS0IK7nu7Jlsrp5PbOixXLnDZ/GobfR8CagWvbk8kGnbeVmtNU9sa1pvYc/nIofUAv1OvFkvl9ZH5hq+WDPGEh++2djAyz451mzuvGA1RqEl0ULQ6TGaa7BVOjrZq4EVgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org; dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b=wCJPHeiG; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lineageos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.lineageos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lineageos.org header.i=@lineageos.org header.b="wCJPHeiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-2eefaa527c;
 t=1789303076; bh=C9vbUExTnSfxpeKoDbrmG4gAzUATjo+nnHLBYfJpQBc=;
 b=wCJPHeiGFNQxL2lkT7Hl/ehKEQn1u+PyY4xW5I/HSETDbPYA19ZFgxhI44tjpJQFoPxj6mBn3
 yraX41XlnHN48Rei9+/HvDx+2uvPE6bb+k5hlpTkXPF9mWHMsfSew8PUNr5E2dThFRZms7UYaXY
 G+wqXguSCP1kIGUF/Oa1+Vc=
X-Forward-Email-ID: 6aa6991b53bb319e9d04cad9
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 149.28.215.223
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Thomas Turner <tturner@lineageos.org>
To: semen.protsenko@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas_turner@talktalk.net,
	alexey.klimov@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy A21s (SM-A217F)
Date: Sun, 13 Sep 2026 13:37:39 +0100
Message-ID: <20260913123740.203698-2-tturner@lineageos.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913123740.203698-1-tturner@lineageos.org>
References: <20260913123740.203698-1-tturner@lineageos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the Samsung Galaxy A21s (SM-A217F) board, which is
based on the Samsung Exynos850 SoC.

Signed-off-by: Thomas Turner <tturner@lineageos.org>
---
Changes in v2:
 - Sort via alphabetical order

 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 753b3ba1b607..021250497da9 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -232,6 +232,7 @@ properties:
       - description: Exynos850 based boards
         items:
           - enum:
+              - samsung,a217f                   # Samsung Galaxy A21s (SM-A217F)
               - winlink,e850-96                 # WinLink E850-96
           - const: samsung,exynos850
 
-- 
2.47.3

