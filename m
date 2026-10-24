Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817304;
	b=pW9pGMv/tPrcnY8gyouJSHT61U85dZlZHzcE6wMdaIunOUke1YYyc92816MOgezVAbKn
	 MyCfke/kI5+xXNrHLzLK0sd6a28XpDQiCP69wrwEWHHeL64Dl0I/4XZVOLiBA8fwE7D1m
	 fC589vm8uOmg/SxVhTUGORW7BK5wcZlp/FeRjEFuHme8YPH95xhHKh33Mc/kQsHFYqkqp
	 4UJ/nj7XSBxCasd+mzkN0Wm81hFCSX8BPGm1fchwDJfvJyidCqp1ccMcY+cmWxTwMic/c
	 GNI6GyN/3mTnuvog8i1RVdb2VAiGxpVdTYmcoQ+U3hBAfcrMLJmEgRpOz1wx8xesYuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
	b=x9NoKy2zMZLGsBU34vGYF2SozFp6kBpzGxF72L7pmKtFcTvKGaWa7rqL9gq663Sktzcd
	 15VxjAmAmpg4N6X/Rd99KPHCOcye+5WaxSV28IEALtuy1gtShqn7a/uZky0dpkpv99ltn
	 ASFC0kYwpWSFXiMxQrLMNkSdPoM8CmiNemFpzLTCiRrWLed+Aih3d/hEpf6oEW6GY/NVN
	 3/vRZEoKnUN1FPNO+bBKsZNPhlH91xV+mpa0k9yC+Jg+vcciWytWA8Lp34OfL5IBdCZOa
	 nJogbABgcWXv628Q/YYDgJA3xjUyBJX+6dQlUsVM8iE/+aJ7903vp4q5ZgcubmYiMwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="fazH6vL/";
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9D606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fazH6vL/
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6faddda49e7so1299175eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792817303; x=1793422103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
        b=fazH6vL/+ECq6VlN9mVl4gcyoOhvrjunanP0XqxebYzUtWEyMHM7cdG8Kvzwp/AzV/
         ZQxp6HqzfWkpwT5AjhLjRfbYXACK+2HsssnLWqSFhZ4EMKGt12Tpp9ePwdZT6fnlB8G6
         xleERqRgwKIVmQVPH41xf08ivhd7R0HGH5KGnV7kkpr2PAIL+XzflAPWlF/2GMWPt3lf
         BRMbcZ16slHFYOOHVIJnYeBwmGS2Q9jqeeNw5q+kANkAUZO3seTHKh0yir5GvQHnhnFq
         FZypiSonTMCqc3dcDPO3/WqnUfb/ElFbsXmltMUgF5ljZ21NTSUwnB6pWegswTUI+aU8
         Td8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792817303; x=1793422103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlEdQ2pqn8bP1dGq/hfVSoYb/UyZVHkJ6Hz5iIABDeg=;
        b=tdpRKSPeHPCJdoL0pAnJkEDAplEQQ9jO85TQQlJrjAjShWP3W6tLwmLTC9x7S0sn35
         EBo1Zd5ZFyWzaNABh/HNztkPH94RQXx9VmViDdfVmoEjAoaPvo9YbnMgJCRbsdh1rn42
         KcnmL8zBlS2EUAEHjGc5Ul+ujM270UCB+vDQ2uzE1600LAU3r5gs3e9R1bBSs+lf7z3I
         uzRTjzQQfFQbrEES+LJ+GRsClSZJmWmcf8YOW/E5bpHPgpJFb2ybanuu2NwSHSLpw0IV
         6tcSkdm7MnmfBelTGU3gUXxOjvYwSewMPWGmd8ro+ZQI5wggkEqFVp93NEOXqcPBd4nh
         eWow==
X-Forwarded-Encrypted: i=1; AKwUvBx/Z01EdRe2tx5W2jlDaokqvWIVwLGZdA973pHlgDbAvB1N1nZsbgm8zararb0Uasp86EhwKUARyZv9SU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ6+TH5nHv4YjgiG099UC6VXaS3uSneMQ8zoVly6RAV/xrMxZ5
	JhAcGcXTGLh9ibVwy3OT6uieC1kLKXOFXlvtq3brwdpArZGbUnkWIiHx
X-Gm-Gg: AYBFou2zpNLcnRZa0b1oNRkU4cUxCiFj4D5y2L0AGMiqFJpmhgrsY577bqj9a42MPZK
	x+aibIIS9R2xK/utYU7IV0Qk2Gd/BCC8K3GOoSz0BzM3MbeGDbOgoOMGNz1wu4grinvFrm6npDA
	/rps+evyq4OG/QJc8iAx9resq+DCKHgsP1gYfpQT+V3ywdIuYjYQ8uUccrd4N62gPQduouhpuAb
	wcN3/vOL+LvwhPAW45kQsLSTThqqEjcSAVhRCVFGgIhAbauQ8dzTV5mrKG3T7taCsf+ksdF08T+
	4tiK9W1N6XtxTwDv6kvA5NesQMsKdQyDyzkcBUI6e4JeP6nXCh/5uXy1Xva47Ytm3pxhS5nJ34w
	XVJVG0UFhTd6ID9NLtYwMkYEgYAhjNSARCeJaooA6/nrz3kZRnCsA42fiyez8Y2FUNWm4gvPYYm
	z1nw4n4hoAbQF5urQi6tM9HxmVoHKpE/BDxz4fxGGTD+1+fxVWxjJJiGK4XMtbtHnp9pYboMB4l
	X77zJ737/CNLmiN+bfSavUQvuRDKP9SsHBVVkkM6HrsgFQJNew5IfztxfteduV5YR7M2dySLtAv
	lgSt
X-Received: by 2002:a05:6820:4a1a:b0:6cd:3ffc:ad01 with SMTP id 006d021491bc7-70ba0ff073bmr381935eaf.81.1792817302835;
        Fri, 23 Oct 2026 21:48:22 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0749dcsm1331577a34.11.2026.10.23.21.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 21:48:22 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Fri, 23 Oct 2026 23:46:49 -0500
Message-ID: <20261024044650.9936-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261024044650.9936-1-jeff.roach0@gmail.com>
References: <20261024044650.9936-1-jeff.roach0@gmail.com>
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

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Assisted-by: Claude Opus 5.5
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

