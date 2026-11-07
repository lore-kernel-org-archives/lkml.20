Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060996;
	b=lvdEq25B41WWjJ+D0j82Fpt1c5fDDsSr+813gL9WNKGwsKhhk1VdzZjni+5PsjJ8sSz8
	 OZRxoUalcp1K5gS479WRxzTMXRYd93yAumItBh2VDEzdNFOJ/4jR3uq+7LjmQjMgXVOZs
	 QQIxW1xuMnx2JTrfuT8DRrVhUxhQZfFw0bZbl2CInNy/9l2h5YkGFBjxEfJSbIkCa/pfg
	 OGLZdoFmVU2Eacy56w3talKq2bgdvmtfqQcJYUkI4xGjfYusI0HxWNLzsum9KFl45hZP4
	 gPM0DAfBk7s35rydrL0DfHhNPU4DrurQb8lLcy9+h+IAOCrOqQ0/nLyssr5LcWLh3LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
	b=Qp82BK9+IPQfuN3rs4rsjpln/17tYqrPEyT23665xXvn1m+9aoesNZwBFyCShVrIIj9d
	 HLS9PTQ+5S0O23jgRuUQvJFhvS+8Y45ja8j8hGRLzLzU5kU2JbzVHFiPft/9OFhnpSxxm
	 liC61q4yJHbX8d/4hp+GicGgFXsea0CRIaWtEeFF6Qk7xJ4NhaZ9OqdCO0Iier1KTUTsJ
	 nPCcVEoR5m71cUDeeZ30p37SQPGkXfvmwgEFkpWFeYj43G+bCXdPDUDraI0+l70EnHX2m
	 kDtBWLB0AFH/KF7IFqsMXhI2CI3+opl0qT0da/xAl4uPnVzlzp1c7a92BPOxhvAWyJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgsNWJML;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78AA606D81D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D78AA606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgsNWJML
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso719017a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060992; x=1794665792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
        b=DgsNWJMLaWLaY7DRlU3QPpnB+WCMugD0AjOdjiIV10CyVDff0zqfGWYulb2kQmxGTs
         lpVx7Z0G0BUq4/UZx2qVv3zlh8C/LPFOsXcn7tYps+KUavPbwOk7gWTxq8TKvJmT7vc1
         KYrk5uTdsMb3cCns/IHKigfz3uVYiCDK7V5gNgy+shhIgb8fCr+w2gZhMkEqvM5ReVVt
         FxCSfqx2QaHAvpXsvpSWm4MTRneoW1diM2H/admtHsdGKDSzguBZJqZKLdLTxtlYPbUo
         s2sdkvyiwBtAMwg90+Azb8Lz8F0GxXwLy8zagsEMJjYDXpIxnsmS59xyK/Rxtj7WIoDb
         bvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060992; x=1794665792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NPDzjIR12JgNdbXICHbZZJFPUuiNbjBtyKXnk1/JvjE=;
        b=mMNrfQNlVu9gSgRiF0G8kEys9UtnCOYIrbFBXUT6HyyAixcNWC/2XxoobppNirxZdc
         sKHt453tO8hw4W20CR1iZ0nbSs39g5UkOw6YEzWu1lodJ1FdAb3vmOtLgSoa68xOxAlF
         eh6ekEr8sj+v0Ze4cyhVL98plOXxK0s44bCMoFm+egmczxAcuUQmjDfSwqv6oFN3fM0b
         zRph2IUNguFJzCjrCPQ/iWiT/xXDE+fi6tDkliwl9Nvqst4JxyNZfziu5AiMBQC6kBWI
         L/zWQj90WzqtOu4zMYy34NoCv+qga4FeMjUxhahSLGl0v8WigYHeqgNnUVXX1jOQoOEt
         1iKA==
X-Forwarded-Encrypted: i=1; AL+hErHQakiODPz3NBZ/dopdO7KBMEOtwB8OuBmHWz6OT0LuVhkd7D4/QwbFKQ/IrJwE7ldlww8JR++37N42UY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DaoM4NFIIKNTSGGpKHzwgYyBXtb4fe3JHNqLNOkQUKjhy4d+i
	HIrTN0ikhfqOBIghAiM4E9zV5pgrG5W5k10WyOEJiJdgwzEPyz75CkIh
X-Gm-Gg: AYBFou1AJiPbMBXwVSD7+10OCHyBSQWfR2wTYIslLCZ8JjekCWy0uwP1C2Y5BxJUpA3
	Fo1a3NWuwZlAhWvGSSfnGsHgYOu08UAe/4PEyK7txaU+5FClcCAOYqXSiPd4FktoJ0etg5PAQqK
	2540iHXPeQGXzp6x/9J+ExoZYSRlGCIfYE4ghXk9NUN4TE5LdcOADiKToimgPvhIUTzYitd3B/U
	iB6omA3TLNBb30Lres+z6YHUghNscIGIT5TOyCKGzRG1x1H5p7LIB18Hu7T3jicIrf+/E+mBGpK
	bB8exLzHdz+KyfZb+G5TvUpF12vTO8frZf7GwxGfx00wGcShZF7rNi9au78Enu3Iayr1l7VYXO3
	JGOZNH7uAQb2Bt7KravsuUnRlRgNz7LmucbkjVhE11ai9VQ+IS+CQTsrwIDHC/0WQUrrtyNUBXS
	7snXyQHnUJNoqoCkdnjPijcnoLe6aQcbp+JrOzuSsVaKQisExlTMjj5NquTiK1E3GlUE4v2QEZq
	6D8NtRSkW0gkJbgsynEYNuOEyIu6Q/lYZinKx4lrBhBmcrQY2b5cjur+M/LK1wu4OG3leXwLxg/
	AXlFWfXbvkF/sbT/iQTmnrLUoGueTSw=
X-Received: by 2002:a17:90b:3d81:b0:3a7:bb1d:3688 with SMTP id 98e67ed59e1d1-3b0db6bb44bmr5357577a91.27.1794060992102;
        Sat, 07 Nov 2026 06:16:32 -0800 (PST)
Received: from debian.lan ([103.189.116.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm3503778a91.6.2026.11.07.06.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:16:31 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	barnabas.czeman@mainlining.org,
	a39skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Document Xiaomi Poco M3
Date: Sat,  7 Nov 2026 21:14:30 +0700
Message-ID: <20261107141432.39099-2-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107141432.39099-1-killdeath104@gmail.com>
References: <20261107141432.39099-1-killdeath104@gmail.com>
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

Add compatible for Xiaomi Poco M3 codename citrus, which is
based on Snapdragon 662 (SM6115) SoC.

Signed-off-by: Amir Hanip <killdeath104@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..8d2e4f0e34 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,7 @@ properties:
       - items:
           - enum:
               - fxtec,pro1x
+              - xiaomi,citrus
               - xiaomi,lemon
           - const: qcom,sm6115
 
-- 
2.47.3

