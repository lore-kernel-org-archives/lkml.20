Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A451589D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071528; cv=none; b=hZK4hC1leBYg3UbMkDUk6H+FaPM2sLKH/F/qCeHdTsHJjtCxnmG2R4N/yu8usV6FVFXZQbal9mGHIiJCHY/RMArOxShzRITFDnUqc5rKYB2hCahB4m9oqhJ+pM92YcX5zqKRNrGCI7NbtOb1/WlrEGirkXnOTR/z2nuTBWXleek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071528; c=relaxed/simple;
	bh=X446ITTdhXRNiM7YTNEvusfu90JyYJu+Hs/1GHYcdQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCzmEWeznJj+LLK6XkE+f4VomLfzR9dbi+up8pHHA9cw33aT+pxth22Ram4YZak6o2dHqpsvk9nyep/bW/VA06X7cVfqO9KZTsD6mW7xMayQkeeTElEAvVx6oOec+rOuU2BjMl4HQvhlnml9XtWOkOuiCHiKXGHR7whm3UF/me4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHn2B+wx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHn2B+wx"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad861b1so483880a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071526; x=1790676326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=arHmPU1bUxWfq8Vgi76eeXWsD0/kT35HZWCoWkjs938=;
        b=JHn2B+wxgCUCR+qNTT5taEtfwRMisoJcBUkxpVmNlf885MWu5rIrbewnnwfq9mfh1/
         FB5Ku6KP+F9Cqc0lz35a1ubepCchnX3Dl+m1JXAoYJ1bmI4YaD8gwcaG2LjnYqNOrEuA
         Yihem0CVAK+aVdDUzLUDu6Esi3+KdTzL6iM47tW3tD885VorNSTt/scVUAELDjM4mdLf
         C5i1k4leBNjF1zNH6nM65yI0/xcKxtPP/71YS49e5oLz1Ij3PK7haipQHYET5IFKr7IF
         Kd3PizW4crOR15HubzP1t/nd8ij0OhxM46G826vZL7bxMJyZjWqW5K34imqjwJ29beqc
         CxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071526; x=1790676326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=arHmPU1bUxWfq8Vgi76eeXWsD0/kT35HZWCoWkjs938=;
        b=eD/nWNF71l66ygWPJx+8ZzKymjh5ADw35X2fSn/QVBY15ToRnbMDInTAfSYobNbr52
         b8JwgRz4Za+DwD7Tz0VZEhT7rgaylkI9rRrhQeXMCdW17QC3FP4ITkxCNY+B5fxWCknx
         fEgBYPurlCIG/kjptdxyUJm7y2qkW58pNeBxiHXgRPEaW/Ck2iJ54wlBB5qbxclJvRne
         N6c6Y+yPR8zIZn6CYGfb+KfFpQySiQ1xp7e98znueSMLzJCT2PxWJxCE1YGAOkwdHGtO
         B2ruIBwXuraME0UfqYdXb9LIK9dCdFqRHqjqvMcllJ4tHPOulj9/OCTbxIPG4yyx43ns
         /+AA==
X-Forwarded-Encrypted: i=1; AKwUvBxkqxuiqRWP0JjkPLB+wwWeAejBgrCnhBhPffTiozbtrv9RT2Z44hZJrqyJEDN+SbFw8OD01/UBP7mOSAE=@vger.kernel.org
X-Gm-Message-State: AFuF++n+iq4RUfP5c0dtxd/AbwmtAIBnBrWISyq7fnf2Hc9n9cbtCPRq
	H+lwHNuwdw9Y6JlOiLkFpheqbuq13ebo9EtPLPd7rz2AUzBG1BH9NWdh
X-Gm-Gg: AYBFou38a0sFVo8UQKC3rFUjqWQtBmhbZmhqLFrMIP95eztSSJS2KrapmLJmVlBnNfg
	DlHVWY02qfRYgnRarSsSD77NxcHchW9D7jMAyIq6B0POYpth8pCvjO71N2ONDLWevXYwEnLg3p7
	88I/IQ+Lo9YgmcunZKepGK39CK+vS8av1QnTyr5QmsrkZ5+g1xBnmKNOWIVXljrLh7IQWGvqysp
	1oIn+ID3ar7MfhnzhukJLnrilvvMZk0pgCZU/TwSm8IFnoGG88GLlego2wFXjb1+QE/WJRN9N8G
	iTFbOUxObDVeZPeuBAt3s04XGMifrXypu9dXCE0uqee9FIuWXdrWM4+HglgQLx+4btqgebGVHiE
	32c5Xz+71+hkbbOTIGkqhyCMVWbQ11KWAuOi8BXAWMLToh2UPx0hl4PvYf+OPwQNaG07s0UwkFm
	VEToqgyWcHL4LIqCWIGPN/zh7lobM9OkN8pW5vkH7d9CdsT0bilUsK3OcO0N7GCFlDplHld/9ae
	1WOeBlsX5GU5uV0Ra4xYZ+/
X-Received: by 2002:a17:90b:2f90:b0:3a0:242e:7397 with SMTP id 98e67ed59e1d1-3a0732c5224mr1150055a91.4.1790071526290;
        Tue, 22 Sep 2026 03:05:26 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm3984718a91.2.2026.09.22.03.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:05:24 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Tue, 22 Sep 2026 18:04:35 +0800
Message-ID: <20260922100501.8888-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100501.8888-1-liujianfeng1994@gmail.com>
References: <20260922100501.8888-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the X1E78100-based Acer Swift SFA14-11.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5c0414d4af9b9..85e62b2c7093f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1203,6 +1203,7 @@ properties:
 
       - items:
           - enum:
+              - acer,sfa14-11
               - medion,sprchrgd14s1
               - tuxedo,elite14gen1
           - const: qcom,x1e78100
-- 
2.47.3

