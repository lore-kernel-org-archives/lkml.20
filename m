Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D34AE115;
	Mon, 19 Oct 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.251.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405128; cv=none; b=nvgxTxlYQY6we9T49eHO6715Pz6UhZFVj4lWqm7Td5+UaT0XBfcGSpLCYqENTqx4qyYvqrTx5MDti9Hne6dHuVUNQBJKAuT0lkjs2kkidHJIAyvRGqVdOjoJzDWpd9Uji60TbNmAeH9EuzYxgq/ZHUi7QRFS1wb1I9cIAj98fSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405128; c=relaxed/simple;
	bh=NQUQKX6vdIpRc5m7OmejF4IqzMpYkMdMuguX9oiFD+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKwFEHF0l5xig5FyqtUsXvKQquwZqs95TIjg+T2OvJQ1SI4e8MEN7Bu15f+GE/fxjlAsR3x5eKmmUwJWwVLCi/PhmiobIKrXNbAuXvaFnnmg+9U1k17Snpg5F/JJCom9c5f8j9kvLZ/i0xhz2jpzleNwlewssZWd2WU4C6IjvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net; spf=pass smtp.mailfrom=fhannenheim.net; dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b=TPVD+Mdl; arc=none smtp.client-ip=188.245.251.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.b="TPVD+Mdl"
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1792405119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S6/GdF6jTDLamz1c8AHvOGiXT6K7K2AClu0N1DJ1wA8=;
	b=TPVD+MdlnBRSnVQIgA9dEgI5d1MejCGvkclM8LSFdH4GLc9e1IQzuJ7ROeYVInAbhqk8UZ
	OBX8r2Fze8G3svhV012YTzglgiC6d8HLbgm91mCnLyzf8/WtSEjrrlEZ9HxGsuJp87+wWf
	S6O2/VyJnD+DS4P/UjTfebxzvENad3U=
Date: Mon, 19 Oct 2026 12:18:08 +0200
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-kebab_dts-v4-1-bb6db87ff15f@fhannenheim.net>
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
In-Reply-To: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=674; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=NQUQKX6vdIpRc5m7OmejF4IqzMpYkMdMuguX9oiFD+s=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFlX3+VKhnBJeil9eDmp8civ5y+mBpuksTVfyr1+x+Fo+
 ZH9jvMMO0pZGMS4GGTFFFmcp0v+sK8U1tEP/6cIM4eVCWQIAxenAExkCiMjw6Rf2tJd804UnOib
 qf9yd8Z1v2Vybyp/OWxf7q7RE8jU3MTwv7z43baST/xxtVUHS37bKXuw7zsg73zInXN5RqeAzCx
 +BgA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add compatible for OnePlus 8T

Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..c21ef16e9ac8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1067,6 +1067,7 @@ properties:
 
       - items:
           - enum:
+              - oneplus,kebab
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp

-- 
2.54.0

