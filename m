Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F22D41F35A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238815; cv=none; b=UAblS0WmWj9FuUrm5EjV4/U8HoCT5ZTzgalEJBP4ygO4+0aB7yr5oiNMGNCkjv+jQSYsRWbGM9x+cZ6lFZ6iX02+kMs1rPOVqcdv/7sI1YXK9HQH55BO7nm22joDzuJQ95JmqA6oOdPKRKj9p/FAvtDbDj43uKSzH8n5rRnZhHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238815; c=relaxed/simple;
	bh=BLYINOzG+j8wRTKT4ZsVkwaDP7ZaJIacVlW2Zo5nM8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GVseG7OFW7zMn/DTwbYr3Vi80qQtqzHO1nrTMQkddPxt0/vpgF23JNEiZQai2jnb7BfsyyIGXlP1MwDY3MNVlnv6S1d31wz3VC8Flq0F9H/thc1aOQahJsl0cHi/8Ipdvm+Yckj9upI0TczqfPZxgNurMLmlX71VErLHl0439QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knCE4RrF; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knCE4RrF"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddb3aea488so1366385ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238813; x=1790843613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRXNlYLipD/yiMI1wfZqSuy2Z9Ygn/v9sO3rrHh3+UU=;
        b=knCE4RrF3Xez7Q0aGfex2FBlUJNnUu9FCOrgEZqVMgZsxjLqHn+OhdZutlqNgThJqg
         nii5wujQoV9iajaOWEL+BukKczLX96HMYE6QNDkjZyCnYl7xKSGI7CbNS+olohywgfZw
         zQLnmb3MNfPFu3sF/lNTI1MFmrmRG6vlJir001pYaqrg3pfzePSDML3bzCii+QKSC+kO
         cN/PAqQyX0OIx6gjQ7FSysQayJ/xB99vuY14lCcyHJFKl+T9eSqCEKnROkQNFXJtFE7s
         FjNuTywqDilwNTLhrhLMAejG8bxmrbY54T6m8lObuCB9pOmoLB7UVRLK90tTOf3CkTsw
         T/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238813; x=1790843613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRXNlYLipD/yiMI1wfZqSuy2Z9Ygn/v9sO3rrHh3+UU=;
        b=jjOTjNY+91uwXp27o8Sk/barELZfkubMkpuR8Sdylugzleo1Ip9mMeNB3anI1kKEt/
         N2CpoikAtjX0Npl8cbHmNKl8+XSURHTcrkOvRvvvDY4t6NFO3L20VwNI6v9QQJER4Ypd
         2Xm5LvhmjYSvwH38azREBu+lybbMgDpXPYUn0zAeXqtCLaxXnvESOuwF0BjNzWgHvwtB
         mYDzybdl5tcaWzukewnH1HpBz3Mi6V5NjiuLEfsmaS4ALRli0A9KiOFQa9GQ/X28PKiJ
         7dkjXE6B2C8acPEgBQoiqqCEiCeUQ6e5ICaEwaIrFZfoyWJ8g/Pm5FSKl96O5V7/ltt4
         CwRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh3K8zdFc3ZWSXvusuNP0gmOuhLOlVE36/wDTcbWHCVFc3uYmm0hpNbh/dXAVA6MI0+QSP4rIvd8UIISA=@vger.kernel.org
X-Gm-Message-State: AFuF++ltXwohqR3bDjCyljoD87QoSfoPpT+wuIMvuSCYDFK7YuqxHx+w
	06AOX0BHr9GzYyHkjAPMY++8qjIOR0/sj6mCOt9ji7+c3OTK9Er6T/mX
X-Gm-Gg: AYBFou0RjjQeaIP8RpnPKvwHZCAsKuZxe93aOkN1HLZfa8Vv1YS6V2rx1zqhk5TVted
	Tk+Mfvzs5rCJRn+xLzcAPI3KaJqxmGn+hvYWc9U0xZYgawbqCeHwDWqhhX5+S88s52YVytPq4uY
	78LYrEIH8kC2IS+Gs2shdbyz3+7haz+8Yo+xHr46XZLAgH52WVse1CLkROnV3ToQXcENJ+KXJAO
	rchhIcJ8p9YhBm8aYJTE254C1IOLhvoaBxxy7aWM5LkUGD+ndL4EhmAVGoCA0xQE4OglhQZz7nL
	PcSmwwGACFmzh98EoYeRlWwJznaLk7mlVOq1QDt47CdEQwdBGcrpLGwrZPaY4+vzjIf39tUr0Qx
	aPkgnNN3PzLNj7QZEjR0C1qjbbYsVOPq8daOBB/DVv9scUfalJjTXtxDEqSdP7EeTF70xoBTpA1
	Df+AotceSVkwWnv268/bZReuU/jHce08MmtkDUTfWuaD5K8RBqjmzy6MLaHvYZIa1oONzk37uR2
	gquo9dz2elY7n7t+dbgGrRN
X-Received: by 2002:a17:903:1663:b0:2d8:d29b:c1e5 with SMTP id d9443c01a7336-2df7d71ee93mr26583735ad.0.1790238813321;
        Thu, 24 Sep 2026 01:33:33 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm22659015ad.9.2026.09.24.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:33:32 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Acer Swift SFA14-11
Date: Thu, 24 Sep 2026 16:33:01 +0800
Message-ID: <20260924083321.33129-2-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924083321.33129-1-liujianfeng1994@gmail.com>
References: <20260924083321.33129-1-liujianfeng1994@gmail.com>
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

(no changes since v1)

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

