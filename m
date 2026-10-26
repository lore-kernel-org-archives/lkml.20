Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052632;
	b=kxJxKUUDSwt0pXhEQqCTkCQVIchyK4IRPml/4AsSNQ73nAug41UN/qG2BwCxL6c246zE
	 1/idP9e1vy1qWvA1eF9QuYVN5FZdCCVDkMBm3XuyGlS4eWtS3LmLfDuxlhKqtxyvoQFxC
	 I2E/rSY2PMTZmvVTiCDf65dOYkQVOgRCLuPHKReX0e2D4y0LTIQapXQUwmfNPeB3CceO4
	 uPP2ArMxdFxCq9m0fD1DeTUJrB1/l86L4aLQdPIft2RX3UTFnhqv9pQNsnAv2Wk4bwztt
	 HdOKHxFOb09sidgii9xf1hP/Tp+6OUGMM7x5drYa+Uh1+MkLl2MWyP2r9QqTD+m8UIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052632;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vrN/hhQMXGkcFSMs0B04j/tOS77VxRcxqT3bC1JP7+Y=;
	b=aXh85KtM9TTrAUgXArfw5TABHO1KnQsy/vUTBuBS9RjoYPxRJ5EeeoZyssLWS/g2vm5U
	 KjbBbM1NsWkXpCXhguA+h44A7iytxCfff6ca+ml8oPXrQQ3FcHr+fubPqqWzGCaTiayQM
	 Gz6IqHMQVqHSFhT6RECVNNzCk1TEmMNwFVYNx4SAEZtAfXE28zzAqWF7+3nopbYyGRx+W
	 QY+tDNgYzk0QyRypyH5tupgtVOZ9iufpqcXh4PnRqxuRZUgrzFgre1+/IJmy6C0VMPE0e
	 737TbuCw9qsU3RkbDQAzc0bszB6htUv2HmN9SlXqdMcJQeWHfDke5wgorHzALH3B7cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=GxJXWp5I;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E2606A33A;
	Mon, 26 Oct 2026 22:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1E2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=GxJXWp5I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793052629; x=1793311829;
	bh=vrN/hhQMXGkcFSMs0B04j/tOS77VxRcxqT3bC1JP7+Y=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GxJXWp5IxsO6KxTWyDMyqiGpAkKcpU6SqYtDUGHDiibxKhZ2+EuDB20RvGa31d3Sy
	 5lQmpHfviGTnBFjo8tqkhOoh9AdU3SZa89uT+IKzUySlOf1N9oVj+AaBhZDfT4drKi
	 MMbdfdOxrvzmAD9IT2ZkCFWKSw64YYNsyVqqP1ZwLmjQPWoM595YEZDfGEmzdglxpC
	 Q0VA+xnRU1XuccsKwWedhtWnoS6b91YwCW8mUxyCde/LqqQzR+5M/h7ZhOpXtWm/pR
	 m8hQLLO8JzWHUfRPLqdfxKF8tOpD/dG1uu0TWQGIUqZtxgt3F7x+Fv2kwzT/XK8eKv
	 giKmCEyvAUQEw==
X-Pm-Submission-Id: 4jD79H3jjxz2ScXb
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 22:10:16 +0000
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <179305261664.94591.14378868402048469857.capri-dts-v3-2@michaelmcallister.org>
In-Reply-To:
 <179305261663.94591.5491359960257085739.capri-dts-v3-0@michaelmcallister.org>
References: <cover.1792840208.git.me@michaelmcallister.org>
 <179305261663.94591.5491359960257085739.capri-dts-v3-0@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Document the Motorola Moto G10 (capri), a smartphone based on the
Qualcomm Snapdragon 460 (SM4250).

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Add the received Acked-by tag.

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557c..963fd482b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1051,6 +1051,7 @@ properties:
 
       - items:
           - enum:
+              - motorola,capri
               - oneplus,billie2
           - const: qcom,sm4250
 
