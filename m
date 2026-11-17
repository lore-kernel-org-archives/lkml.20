Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913133;
	b=xMYolqveeJtmrPoM1bCZc42U0/S0Z3QDZVT57mNYfHyKeUw0EPjT4wvty2DiPRuhHcYc
	 Wn7+JdQ5XHAFy99uNlwnpV8SgJTphwoMBq5HaJ0UZqA9JX3ZkZBbqE14cCOTQdO1nUBpJ
	 eAsrBL43n12wnIowL2W+SGwFqFPDQH8z3yG0ElbiK8tvZPB00Xs+e0L8z40RZ8QlNuJC1
	 t4hnrAlfl89zuP1jal9afO7bqUYOu8oVajUWTn/M2ajpiWxeoa7oly4cVvz9cF6AuuopC
	 yZnqI7mQ/eiy3Sq7m/XI55fFTudRKtRYAxi9UT0YjIjiXqm/shEkhcQ/w0auwAUjVxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913133;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=fbQvGbxMmP9kcDTrgeOTvwfYbL2AhH5t1IgaPsWtq58=;
	b=qdB5IFr+YimrrLWi2hN89KGwg9S1jcEyjCCP7J9mvmvZAuz+cE63ShhAM6ACu9mPW0TT
	 PhSChBib+M8nSbNe4Ka1zhAOp5DijJeOvR54D1fs6UmU13IQ4koPz+dU2oHRw6j+yrv0T
	 hMIoCXox7XVoYbut5tziY9HRIc8W6IQY6rsndvwwLz0BZ94rtPYo2/f2fOkCGHWZ/bM2F
	 fkYp+PJeLgzPsSzlUQgMCvvYlczRvGxAC55twHxe2QEDysJ8siOihj/L/v4C1NqTl/VA2
	 uprqffgd/v04Mgzu1b56GSQtB8VdGs+Zxqw+SMo5yvzqsJT+n6/grcP6pnMrwR6OXEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=MpDxcf0K;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD418606A32C;
	Tue, 17 Nov 2026 10:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD418606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=MpDxcf0K
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1794913121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbQvGbxMmP9kcDTrgeOTvwfYbL2AhH5t1IgaPsWtq58=;
	b=MpDxcf0KkTUFGX1cFL6MLVkeOFRdo3U+Hr/dQs0mVaQxfZUoyJEBSh1fsq/dir9u3Jqm/j
	jC8sNUVDtEIlFSftvG8o2l8/3hQmpo78rHQ6hnM8/ldTHOyi78in12B2eqzcy7FR44JH2Y
	AK6xJh07okqxfbLMHGs4S7QmFXZjiSg=
Date: Tue, 17 Nov 2026 11:57:56 +0100
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
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
Message-Id: <20261117-kebab_dts-v5-1-bdee1c9fe351@fhannenheim.net>
References: <20261117-kebab_dts-v5-0-bdee1c9fe351@fhannenheim.net>
In-Reply-To: <20261117-kebab_dts-v5-0-bdee1c9fe351@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=744; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=CeBRjPUFvwQTFpQjuReNKg163gglm/vs4m/E4rGk7Bo=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDFl/jN32SQh4LN5yjfX0h6DMWskXDGqZM5vur5zsKrdc5
 Kid+r3XHaUsDGJcDLJiiizO0yV/2FcK6+iH/1OEmcPKBDKEgYtTACYSncXwTyEt8O+96FkHti5z
 D3wclmXqrHmKa8O0R9cyrJWKM1i/X2ZkmDnjcXCOb519q2lWqdfE/6d8T/+rWuT2pDZcSGsRx25
 PfgA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add compatible for OnePlus 8T

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

