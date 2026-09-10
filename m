Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3677A481FB0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043260; cv=none; b=Lrn2ifkzS+CzE4/QrEjEJ6+7C9WP2/PlIcqgMsBbAd0+w3q6jf1RoBQV6RXG7t3ZGPRFiKbtbKk3OInUkvKFn5EydDojDHUGfhHfwuhJmWGvwvPaqra2lk6GJKYusJS1u+vLdeuwKNcrhO/VUixD9iomGUjQjbyYreb2OMPhJ0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043260; c=relaxed/simple;
	bh=swvAJsMf+noAdjAOdgZgJcavQOiTqHlXuhgcaBqarWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cfqx3ozsMIuEBkTC2kgjJiYYPCYlpq70Dh9NJMt1w71Es1k4eH9bthdsh6gm6J3D+wKAKhhJQQXCInB3fnVJZ1HbO8P5/Q8w4JzPJ+xkQURVv1yDgbT3Zn7Vn6n13L+T1XacOcLoY1i6sgpUJtN0Z5WEjSjxp89Ris91Zc4IDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxtQBUgK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxtQBUgK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2938116fefso311324066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789043257; x=1789648057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=HxtQBUgKkbJ8PcWJFV2I5wU8yez7n8Rq4OzdoQZSZKcvunqp0U3VBjWVfXFsXDuFt1
         Kmqzs0NaTk9rOsNBlGDSh7ZK6Eew73g6htKRiRbElAHLuMAy1omHa3UmvTolIrwBWWk3
         l0rEyartKf8hJd8EKMa1b7bXsWGogesXBS6F2KoTxtXNLgS5iDEgscwYrBkn2NmGicwb
         e7iDWTscoyjx2EZjfx29l2GTqCMXFRdf72yigVe0H7rAkXCXPr5Jl8OKzX/B/539KnAW
         adIJpRo9/rlm/gfdki2foe7ZNwYofABkGqWmgH6VdR1uTv0kaSwhIgB+g+J5bH+o5C22
         YqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789043257; x=1789648057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jo5o5mj93URUeV+7YiIiV0G/8Hcjq6XVQrtqV+XyI6g=;
        b=QPKWdidcGb4ulo8clQIFZM2WbtUKHJ4ZvpjtYM76WHjKZSDq3ddz+peYBYuKhwGVJ0
         b7ZA1ZuyL+GmKeeulJYN49RtTweRTMatvk9DAdSj7j4uq6EAEOOfC5P8+MgsKDWq+j7v
         V8RIvNtrdEvYnylyqgDZ2FqJn3KIPJEgCH8yvCcOzDTy/yIKpEDuV1plA/EEODdmAaUn
         pJgL9PFAgN/pPTX61WZrE/ca8Ze1Sx9Mh1fs0jfkHKVwbqLVMxEiNrpdmUA5hpOFkakK
         9Mtisv9yCq9Su7K3q5nJ9Z3aQZ9GDrRGsY2Ha8LNLLyimdtLTq4q/jW+7M8CuYoRUUwt
         LMAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9btZqVvw7bBEBLQc7wRGTRPLvoTDCP5tSFpRIV/SRFc3m9Y6xkZMPtExdIlMmQ4PQXKdSOb4+t51+Qqk=@vger.kernel.org
X-Gm-Message-State: AFuF++nW2tGfB24pKjjjnUU/MUM7dHdGVGT8VBCspxgkoNpGaXHM9Ios
	5oNAFAUr+eirRKDxQclx8AnCNN/VXMq3De8CuESSgVEgw6uJnSqabq6+
X-Gm-Gg: AYBFou2BdIDo1j2kTEdP2sDrrZQ9QbsT3CE+oWqUhC/UeTXDAQJZJpBgyYghuo846pL
	gECWp3vyiu7YIUlvYG2h21pe0eb9Eqcrw69Gt34/vw8JvAkTyLK6EyR1C1ZYfTvcDGQcJud+ZpE
	b72PmArMevSddRU9RuG+SyXVMDwe4gdyhCa20OYb0WbRrcNucW+zd6Ojc5bi8UtMkWl2LGBrPm9
	8ZrpiK4Mmr2IB+bJJS+1U+1f1OruHUQQU9oNI6C4l3ZUdUrfNbR0RahAAP2n+NAPhGULkrjSkJc
	zMrLBIWyXw48/ZLS0/ebFjdmaRTGAEM9IpbbDRXQSciXiAO3Li+Gonr2jc1fygRaakTlUUDf3Q2
	5WnxhLWdbTmzwjU7MASGwMPfsubdAcNirq+dqHcahqE6ytmcJme9MjOzLKPaaJohnVxjv/6DA0M
	2zixhAa9QOrP4Am5nU9JQ0w69JZy+J9k2DXbyN5zyunq86q4AsuhP3oacWRqSo5p7ycX+c3D17d
	CJ3aExHarU=
X-Received: by 2002:a17:907:3f89:b0:c29:386c:58f2 with SMTP id a640c23a62f3a-c29386c60d2mr385878066b.38.1789043257404;
        Thu, 10 Sep 2026 05:27:37 -0700 (PDT)
Received: from [192.168.0.68] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2951217d12sm65136066b.44.2026.09.10.05.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:27:37 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 10 Sep 2026 15:27:21 +0300
Subject: [PATCH RESEND v3 1/3] dt-bindings: arm: qcom: Document Samsung
 Galaxy A52/A72
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-sm7125-samsung-v3-1-c467bea0fb9c@gmail.com>
References: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
In-Reply-To: <20260910-sm7125-samsung-v3-0-c467bea0fb9c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Add compatibles for Samsung Galaxy A52 and A72.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..d3746bf6a106 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1068,6 +1068,8 @@ properties:
 
       - items:
           - enum:
+              - samsung,a52q
+              - samsung,a72q
               - xiaomi,curtana
               - xiaomi,joyeuse
           - const: qcom,sm7125

-- 
2.55.0

