Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660761;
	b=fweXLqjG+q0cSKoJHhc3Srnu9gyHvLRsFiE4smQZPKV8Vluv+UR12qPgTcnJdQKyzfL+
	 5snFrrtyE4M0RSrUmwct0WLfNiHS0Xrv+RRFc3GcyGSwo7hqmL4LZ9ApTLtr3rx4Wj6LJ
	 IidJKs5ht6beAORAWFu/UCMXuc3BZazNw/O4I59mmJKCVRw9IOPj8iHmUXDPdixy/MHnP
	 eW5X6kHYP6nG5Y2PAPYNABGaWlKKhMoc8336jkNPlKMb+ZeyNznQYPv2OPa+HZv/HbkcU
	 fuGST9khzwzTonChTSXMIMG9xEcOUQdBr4WQFSEyjfpkVGqLEE/2fgoWfxmyMzO32pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
	b=CCLexz4v/qN7aw/fvE0EoK2K5iBPnX/PKJWz5jEMzLbv7UZ4ObPBbg++HpNSGkkUROWP
	 B6JsKL/V7Q2xD6L1q2kETtC8cXU2zpMzdE36tonMTIi0CCj+PlMMbANGgWVvNqYEiD0RV
	 fTeHlzWKi8UZOXBX3ukNIkyP+VyEJHV535l3mCocjvo/bkPSV6rliI4HnOzvXyUzE8VCO
	 hQEil31KzkLwUsZNawonvQEvqRs14vuz8jHt8qFyG+QHDyHQYbKXlVFn7ut7t40pdtyS6
	 17OzNW2M6qgaU9aakkDFwTeGfccll86TpVNZjBCzJutnr4Otyof9MZqZ/LNTc9IQklA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=eerU79Dn;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF4D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=eerU79Dn
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c414e5d282eso202322666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660759; x=1793265559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
        b=eerU79DnBIXSgkNX9XH5RvEx6v2IJwgHnx6cLavomh9+/x0S0S/nzMd/T8E7dX5dGX
         bbtHQZvIpitzL0W2/wWvPZYaE1stMzV+29nM+scZxGiDqIbP5ct3kZMfLVmGdvgsDGAM
         qTXoO594N5NrexjsKhZU+5ozQ1D0AepRPEgqXRUE0d6jdwLDQjge3ObyOjSciuomQF18
         NLTywnjVXikcxzX/HLHwQNIfxSfEmelm2GR/sVxIWNlqOA+t18EL2+jjjEEblZ+i0g+V
         ec31CyLmK5pVAGSaUmSO0UeJTDfwc7hSoqr19PSe4vB87eSLN8ud7gV8Zm4TIBkK17r4
         imTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660759; x=1793265559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmLU67b9anSH351lrdK4RsIBICbIuOZ+JS/MULhXqf8=;
        b=tNLcBz//yrnEwIF1EWgn4Oqs6V501Lhpgn4Zjf3D1V3FbVTmxam+qs8Z8fveFrMKH1
         CZt/RPoBzxMBdCQlqq0ELNwen++rN5VxSP+YrTyLuUsxCTrlC+z3LzSrjLild3n//W26
         AwY+GR4WTLnqwIAHr4bGy9U5e3GkomAPGbAb+TEYI6aNpxoD7RkdqcAoDU1NJD8flP9G
         mrRGH8CodQeB8l48YGz1z5MudNqnMYeiMBbbCRH2irk7GZyUVVa0ptWyp0NC2mA1l+GW
         ml3NIe06NgnOejt53L/QN6f7aGRV/3VEullj+Ip1VjOMCRMypWFpJrw2pJcOw01kJWES
         wrNg==
X-Forwarded-Encrypted: i=1; AKwUvBx42OaATZmFJ0AUw1H9dg0VFZksEzIVTSv7xhGA3Z6UWlChXd3vvXSel1JD/3VUkcjmlcLOlkunY30NDTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMWCZwgyRr7Iwzv+5YXPXqxDHEOh7xdfbOrFFxt/KCOeZjeYsX
	dLqhX1c0qtuTfdtKFrxLgU6wFC/5KvwfzmECdRdzwWdC/wuVpBFNsWENjV4sd0qdUlU=
X-Gm-Gg: AYBFou3RIdEhzVNzN5Dnmerjh7BjOO++D1IGdqh4LJ0xFYj+6V25hnl7ZgoV2UbjeDd
	FbRP8LN4ufr58L+nAxeyuqJTs9Gx1aWxw57JhjJWDhxuBH6KSId4TKjnDwO8HRJYo/PJWrdbGJT
	VEWqWEQV0D2yqG+hDj5moW4w6347yu3MJ7Q2iCZL/Ace5OEugFvZAGkPbM6DM+2HDBGjFFZWTwd
	cG5KdFrQqYIOl4y30rUE+y3aJptx16QNJUPbeloek9S73co6EPsSg9n/7WmcJtRs7Tt4Lj6+8RQ
	EJjZeQA6sLk7BaQ2guBohnlmww0OxPWgbcvqsXYL1pgiwwgAoHIYBlbWHNJcCGl3fwtRKc4swni
	fsU7tiMZwVgm4+Ewjh+LQs46/zCwrOge3JlIRFtxoIhsYPd8ikqFg0yYgVY20Ess0utmyq9uU0S
	AHAqL+8RzSWRhoWmr9zm061v7P/D3LGdztGVcy5A6eXCI/KF83rXrnw+qz94fjyWFw4S1H3oVJj
	cLz70rQj8zJaxr0K+HWCfgZAZPpq4eTNgNTiYheeQ9o0N2e18BXUJuWYw7Z3Umrlxr8TbEMkOEq
	CLZXu5qtUjs769BD2k3zAOZbZY6XYOA1m/DX5K2Ozd1526fSu5h2TG1Scp0dYqz4Hj29ea80/98
	5pYAja60JPKl63YBrG4RLhWqDFPt9ZVf/mgPp7VI/H0iL0/dMe/O4OYKCiyvWBtQJpyNV
X-Received: by 2002:a17:907:9711:b0:c2e:6498:5bb7 with SMTP id a640c23a62f3a-c46796bb426mr444488566b.31.1792660758671;
        Thu, 22 Oct 2026 02:19:18 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:18 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 22 Oct 2026 11:19:15 +0200
Subject: [PATCH v3 1/4] dt-bindings: input: Add compatibility for Awinic
 AW8695
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
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-1-ac8c14377e82@fairphone.com>
References: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
In-Reply-To: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1075;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=zMc7fnFtbUBSVjfmEWHaUyV/0ui2OWBr6T8F5VhNG4U=;
 b=VeVZAjOe4nh9A7LEj+L1Elp95Otpjsl/9uITlARbofk85O4zyU4uaNHE2dHFfXgq0BYw4byC4
 4vmCiqOGmW7D8nLkwe/t/3Aex4MoT4fYW6/E2SJVdNGCJp19WAcmA9T
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..58908ac4ca7964f63e392050aff5e15e836983f5 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - enum:
+          - awinic,aw8695
+          - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

