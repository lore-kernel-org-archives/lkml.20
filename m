Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99523515E3;
	Sat, 17 Oct 2026 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792249992; cv=none; b=ptLkGWwxT769q4ezRqKm7PvOEa+QMth+2BB9cqu7WrqgLYsQtKeHwPZAmjDnBOtO6+4HRGkznHtQGyGwHYIcjY7XTnMYJ1iSfEHfZmos9WaaqFbAbecKLcgczk4lEDW+RWA82E4nvaaDjgo9ZPo9I3nR+yoehSohWeJMqmzLxP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792249992; c=relaxed/simple;
	bh=HTgEpA3wvjgMmORg8/TEDusewTLPDzjz4yiugn2k5GU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hcf2DURc1gHRJmy/g7Av9BrXXy5groANDhwKX6VSjaZKmoLjfjjz8MCziM4iijiypeN1W/P5Z+K5rum4UcgJwCelN4/ITEP61p9hLNxtgHngydaYaHbqV2KYJCwYaqmC717QzSkYSvRjlBy24AtbcjflzQJv7TkL+huR2QEGRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=WKQnJMSE; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="WKQnJMSE"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792249988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNcnaaOF/5d7HdNph5GR5LUOZE/5XPU8OnIv96U+uWs=;
	b=WKQnJMSE2LWv+CRVrNjEZEGdedMuEXk6GE35QUz7tIaysFL+d4A6eLX5nEDDc/kOizXULU
	LY0pkMN6eYP0cWSOO7jkj2VOM+i2dRcBgcAHOqMmo36tZaPPlWVPcp2b6Q+HDc7mrO+iI8
	YzAQndn/7+SHf6mdsVD9AneNZu1Sapg=
Date: Sat, 17 Oct 2026 17:12:34 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-kebab_dts-v3-1-5fc3ca52a383@fhannenheim.net>
References: <20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net>
In-Reply-To: <20261017-kebab_dts-v3-0-5fc3ca52a383@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=HTgEpA3wvjgMmORg8/TEDusewTLPDzjz4yiugn2k5GU=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFmXJ5SU3Mlhrqs47SIT0197RO9Q10SDHxwxK9yFki9Ef
 t/+Qpuxo5SFQYyLQVZMkcV5uuQP+0phHf3wf4owc1iZQIYwcHEKwES+mDEyPIrJMzrKelZ8W8UG
 l1uLK25rtnrGtLyfYGwUvDpvwevjPIwMZyJOHWNc9ZRnt8ZH9TdFzkuEt7wvq9n3VNM5508kt3Q
 SMwA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add compatible for OnePlus 8T

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..6e3fdce92798 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1070,6 +1070,7 @@ properties:
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
+              - oneplus,kebab
               - samsung,r8q
               - samsung,x1q
               - sony,pdx203-generic

-- 
2.54.0

