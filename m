Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33CE485CEA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858337; cv=none; b=Vhb8NWvAuMMSPXXLzo829NRMSUv3iujRiFrCIcKQJgI2OmXZCa1NoSvFv4Fv0kjDXsgFQdG2ICQX9mwAvEcCr5uIdEp99ybyWFBFHn+d0XqhizjRKU3CoAEYuml/rYSRsUpGm0RYktPFk0dGP1ipo3S774V0lgkHdv30q+TIqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858337; c=relaxed/simple;
	bh=ijCSYAcNTPTA0wNNkv0J05wEP7LaZbaGGMvktEbc4zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGdfmnMVGnvX4NH6UDDglM8HzPOn5uYt42aGbcKUfi6f+CiAPOS9GRMvM3se/bBI514+TeI64k+iaSkPvTQh5+BEEC1AYsmw9chcIegoJ/aTTLnDjraMSQrfep8LfGu3OcFIouUr4MV1PiYN2oFuvX9KxdxUSsJOUJuhLuVU7DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RVb6ekGQ; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RVb6ekGQ"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e402001e8so72341266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790858333; x=1791463133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CA+IFDE6Us+Oz3DiIKigMOa8DIe8IYh8RuelCKGNgE8=;
        b=RVb6ekGQEkV2OW/TLB24ohpC6fDUj/DclkaeagfP+mW8RshQ/qOdnQLWjFU2j6oka9
         9Sp/tJxRbrjfD9dIaEXJNqSint1s9tTNh52IRGxL58mft4MYKqes8TlPtgeNERTnk8u0
         +pjvm45IcZigNObB/mv+TSXWnh9R3oqi8J1/lmgosAfmYphuV0rR0sE9uWmf1EH8xpqu
         63P92f/LyelRYQEzbOlO6Onhk4Qd/0oWVbfto4poWpHW7CSbShfnkHJD8MqFmPCo0fgW
         ZKRjouLZl0vGEtNX7S8YFWcLNFhtxkNrJF1FvBjMteIHB9wBb1I8JHe/kV/gJs+1Fxx8
         4kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858333; x=1791463133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CA+IFDE6Us+Oz3DiIKigMOa8DIe8IYh8RuelCKGNgE8=;
        b=G6NjjY5eThwVHHGGvRTF3dUuChyjyUkysObQZirOsThvFzRJNTtwldCn2BTS/a9qUO
         qVBBQMZUy6RdCj1CEEAbqbGdyYtyBUlGXP/gsIeFnclHVweH7/ubJbrrJyYLODxKiJiO
         9KZH7uEAU7Jl7OO8TqlKAR7+sjI8Aj36GxJfYfHkG2l0EGIccnSR1bMp1D8Km9HRbNgU
         n6AmFrktr/WNSbK9FzJnXDs4PvhRJxFIBzD5cGdwpuA9Mby5hnfZxNVDD5wM3rbheXqT
         3NZCimoYDJJjPKiMinGOBhhgfN47u0yxsofOzjsWxEq3iR4PLYr1/u3RApynxfMn98Lz
         12ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9x8S0YJVRm8KYuiaGs1b1Bx7hy1z5Wa3uZHff1enf1c7KxFRlXngU1uxm9IXzH3rdCBjSxd1Scko26Os=@vger.kernel.org
X-Gm-Message-State: AFuF++nRpKvjiOymV30WjukMEM/grh+KOMZkRbRMTyh5vXP3LC899HYn
	JyEg8zzblb7GoS4COXSy1S3A+mcLJi45N+E+EYQgFRfkjPUIKQP8EMdwIouwIfXvEy2CTxq63xY
	3DkUa
X-Gm-Gg: AYBFou2lfQ47xZhWr7D6YU4db2030vA9jflRIqyXpVOhYJ03SMloH2Ee6qSoqrUbAb8
	yZBRk1yKCpah6pd2cQDOTXUst44PnDKA1ywrBIZ7A5BeTemzwIAkPDZe4+jsP8VkDgK+Zdfj7Q0
	b5mfTGIHNQw4hKxorWuepAUUH4z0hBEtED8RcjIz+nyOQcVwLU/K9Rc7dKH2MOeZ1kYL8K+4UML
	/uFAaD1ieiOD/2QAvMjMUIAiuNB3F7XGfYBrT3rbbCpxuM76xuo6lvg7+o7vEPljtdOP4gEMb3X
	YPPKs8uFZ5LtZXoejDQoAY+SFzCmkgr38FnPbdCpzBnY40AZHsD+njjCC7GRkg2iM+5J1eD68PQ
	B8BbYJQakV2+rvTFLyEXNQCrW//shOOgVwe099muKnAOhTBXl2pZ6S6K4PKqdhYEZ7afAOdXOuZ
	w6a0QHW6U4FV6CqyLNyENvCGDlUfjj6AWGUT5+47HXOKzWTBM3jbcIJ8tHx75HYgK/2esnmkKuU
	0aNoi0lXisXamPYhw59h23hH21jfhz5oTjmML6Ve5zDhtIBVwaIvOBF
X-Received: by 2002:a17:907:c486:b0:c2e:4705:467c with SMTP id a640c23a62f3a-c2e4705500emr17887566b.10.1790858332842;
        Thu, 01 Oct 2026 05:38:52 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8ee1fsm150346766b.24.2026.10.01.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:38:52 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 01 Oct 2026 14:38:50 +0200
Subject: [PATCH v2 1/3] dt-bindings: input: Add compatibility for Awinic
 AW8695
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-aw8695_haptic_fp4_driver-v2-1-1bd38b1943de@fairphone.com>
References: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
In-Reply-To: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858331; l=1106;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=ijCSYAcNTPTA0wNNkv0J05wEP7LaZbaGGMvktEbc4zI=;
 b=QaRqcEtOjzGLiwdtaz5YVC+TvWDqf5gnDYLqb1W2m7ZkyFILz/cchPg8+XL0McoVPg0AI0rCD
 5eo0xrpA81dAzQydsjVxQxEnv/fcG2q6qvRDiHne6E/BeJgyz9yUKrB
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add the AW8695 haptic driver to the binding documentation for the
AW86927 and AW86938, as this binding needs the same properties.

They are not compatible though, because the chip identification works
differently compared to the 86927/86938

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index bd74b81488f61d72b675b5701b321b30b3430be0..d7a2fe62c1b76456b0ea3260172d523f2761ea01 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -12,7 +12,10 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: awinic,aw86927
+      - items:
+          - enum:
+              - awinic,aw8695
+              - awinic,aw86927
       - items:
           - enum:
               - awinic,aw86938

-- 
2.43.0

