Received: from mail-ed2-f29.google.com (mail-ed2-f29.google.com [74.125.228.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43BA4D596B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771000; cv=none; b=Da3MffVsSqLLQgN3IG2Guc0k6nsTBtV0npwz0iun0adqTTyU12VBz+KR8Rla0p1AqtKqSekkwJqrIgRSdITzC7GCV6iwk5aYHpcITpnOGb3BN7u17QTS8dGet241WJlOD6PGe6k57f3ofE0d6EdYSYjHFgt0c2KrPez0VC0lXfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771000; c=relaxed/simple;
	bh=KzU6pg3SAw7EdiiluA+LfyZ0KB6g8qtQQroQmsrGNVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfPxq5RrxQv+NvHGT7mZ2K9OQmEv82mvfxeEj8x2eSdkaRlMG+17rBlIRPaXVtZxQLPTKA9pPFBm7bllPSjQSAMGg2GR5DO5VdlsCHH9uG81nJVcvD2ugYl3VLvdRkGjVVZ69AdLAxrQDuGZQLXNDLmxb0TRpuX/ywnq/nJlorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=mKrQm24a; arc=none smtp.client-ip=74.125.228.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="mKrQm24a"
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso6384546a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1790770997; x=1791375797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaUSX4Um3mqfoQiqXI75sOkcRILE1IPyDF8mtJ1aFuk=;
        b=mKrQm24a0F/nmukkivO2gGaXahLkl1PI2IrxP8r+MkRB6FRSmNqannWWGYARuHRNyX
         /nEMUhqLRw5D/cI864lUCRq9wGiuuA9y4jIsFAF4eNGFgbqGRArzkx8gKIiRMPMCGW9d
         VWBmg0eclYDtjQ2fu4BY/aDJDP80umeRsaBxAGjMXunwgvLQJfJ+2OmvY/JmS4E7K1Y7
         Qo+g/XATrXNTTd6MtqHUo2uY1yspK/TLIbhId0KYAwuQsA6keefRUI2YAXoaFyWskgU9
         wQBN2hjE3o15HCLonNkzIRBWpPO51uE8WJmk4Bup0+t58jGyftHMT1xdpyAD+cEg5AcQ
         nUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770997; x=1791375797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaUSX4Um3mqfoQiqXI75sOkcRILE1IPyDF8mtJ1aFuk=;
        b=XkNFwmdmH0fR6iZB69Vy/7uPqwBcGztKPjAl6kg3l1IUl1KK5SbWLeqBCoVa9TfNBh
         GLBO2kzQh1/ZPt90Nxwrbr5VeURiaqQpzKlGPZFkTisqar0VKCBg0GP7G+7fzvHIiMut
         WahF5GLMRyIxl4WETMtmy4QXpR2t6GCaejThZ2jJf5jk+f+n7F2NKCxEuKjCiXuIuz7m
         tNC0nAFqb0WXolawjEZ338jYGXR9Q7gQSVA4kvYYYaMfA/5qJB7FG1eaMl3wBTH8nKGU
         aAiMAfOBs61V7X4KofcECZfCmf8jS380StffK1/67Xa6MPY9wme81O6nSlHqrY8sC5Vv
         /68Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXPKEk9YJsLFTpGXNkKj6elakT7zcIgHwLVpLpdpVqqVZ9f30Rgh6h3Vv/NUSviX3cSxrRxc3CQUaQYzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrV2X/PcD3AMkG95acLEjSG9DLmZ2Y2KstJF0QAw/cIhQta2rt
	TpSqA/BwHAfaNL1sxZmTolMtQNaqFpqM+JnWAldWKfmqrNYVUDCSNBAXSsZT4QmpvSI=
X-Gm-Gg: AYBFou0Y53KqnX4AM8pQ4wxn+7FVUE9vUtd90rwuqcl4KgBtU/C10UTV4Ti6WemX7Fk
	h/MIq50I6Wi7OvefWo+c6R5HHbbKHg4BDdlvewbDb6HOLR07B3DKmG7WCdeqO9ymLscTTtC+RlT
	icZWkhDo1SZpe+nw7B/NF2pQQgNLS4TOfFjDFW2A4rsNTSedtfAAzZiPyomPM1dOEV7fzSvwcpD
	xyW77gAcW6K1YpKfuJ2FmjX6i+0ymUvgElg24SteMqYk9GEzk9P398TOQYvc+zaWZr/SvF/Au+J
	yXq4lc7+xxyqGOZMkL5o9oumz+JDGeDhqJQOW7Zz3VVzZMibnPnuT55dHmAQNXB2jZr+/YvQWCR
	GtmpxGGpFtLBLhhLDwE7bwLYFMP7xJOnXtCwdm1toNSufa+6S9QX8KfYyrtPXIyCjBdCg3ZnuB5
	g/9KYjC8+ZqyHEpGrOXEckF0R6x1IlkGqfoGsufUzBQ6Yft6TnitzdZOPrr4FenKnqMMS9r6IvB
	RTY1GJIeBqQfrpzHfBPUaa0NSF2dtiHuPGbL3x4jkx9NSPQgFd1WXkd/WtOPPB2h+v9MKeiJSfy
	lGj1ggFcg8H5rEDB/J61t9Ezr/P9
X-Received: by 2002:a05:6402:24c6:b0:6aa:f630:f846 with SMTP id 4fb4d7f45d1cf-6ae19972f2cmr750838a12.31.1790770996750;
        Wed, 30 Sep 2026 05:23:16 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-187.xnet.hr. [88.207.15.187])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e5a3sm744042a12.20.2026.09.30.05.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 05:23:16 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hkallweit1@gmail.com,
	lxu@maxlinear.com,
	michael@walle.cc,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 4/5] dt-bindings: net: maxlinear: add MxL86211C lane mapping support
Date: Wed, 30 Sep 2026 14:22:16 +0200
Message-ID: <20260930122305.293686-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930122305.293686-1-robert.marko@sartura.hr>
References: <20260930122305.293686-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the optional lane-to-ASP mapping for the MxL86211C PHY.

The mapping accounts for board-level swaps between its physical TPI
lanes and analog signal processing lanes.

MxL86211C supports per lane mapping.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../bindings/net/maxlinear,gpy2xx.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
index 0645e885f1747..b98cb3c3e6d49 100644
--- a/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
+++ b/Documentation/devicetree/bindings/net/maxlinear,gpy2xx.yaml
@@ -22,6 +22,21 @@ allOf:
 
     then:
       properties:
+        maxlinear,lane-asp-map:
+          description: |
+            Mapping of the physical TPI lanes A through D to the PHY's
+            analog signal processing lanes (ASPs). The array index identifies
+            physical lane A, B, C, or D, while its value identifies ASP A, B,
+            C, or D, encoded as 0 through 3. Each ASP must be mapped exactly
+            once. Omit the property to retain the hardware reset mapping.
+          $ref: /schemas/types.yaml#/definitions/uint32-array
+          minItems: 4
+          maxItems: 4
+          uniqueItems: true
+          items:
+            minimum: 0
+            maximum: 3
+
         mdio-regulator:
           type: object
           description: |
@@ -34,6 +49,7 @@ allOf:
 
     else:
       properties:
+        maxlinear,lane-asp-map: false
         mdio-regulator: false
 
 properties:
@@ -78,6 +94,9 @@ examples:
                          "ethernet-phy-ieee802.3-c45";
             reg = <0>;
 
+            /* Swap physical TPI lanes C and D. */
+            maxlinear,lane-asp-map = <0 1 3 2>;
+
             mdio: mdio-regulator {
                 regulator-min-microvolt = <1800000>;
                 regulator-max-microvolt = <1800000>;
-- 
2.55.0

