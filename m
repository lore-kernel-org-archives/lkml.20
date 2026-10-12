Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A337F309
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813135; cv=none; b=MpOhRpBgwZX4ftkQ6cv43QEH8Q6YGDvNbHO1t0rRZE2NHFY11u43UTnAwg8PUCUFT2E/iyhDgPsHTK3g74rwwNUr+bzYWWqBqLVEeHSO7TEKbJWfsBaPfgCZfFnlvQ05rOqCQr2O1PRVYYkF8k25JkWIy6eae6yAsV1D4yw8rFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813135; c=relaxed/simple;
	bh=YZhhybZrv3s66S7NBzF5YFGgcc0+N0oUYnJXl+V0kxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzFRCNCkM1MpA8LEldGGl3E9WP5L2Iqddo1TZ3fYAPID0qxU/XPGlAwD18HiMDJGSE7+6CyS4yMyu0CKArAuXU/eEYLo5ecNZKMAuYzTU6NY23P8ZJkH+XLXg+IbWEi+sibH9IM2ec3QrOq9ebzgwPAaDTWbnsN3c19+Rou9OVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=YzCMm7I5; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="YzCMm7I5"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1804612f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813132; x=1792417932; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHuiEncoG0VoEV58mprVfME+rgEEB1pqeAB57KOc7lg=;
        b=YzCMm7I5ujsYZSZcsASfukyT4ugvljz2B5e5hqnqTWq0XWgY4qeucotytV1MzkoYAJ
         XAr88gf8RvJ/1Cle2dJ4+51LirrCyh88i3cHNrkfwSneLnOS13Huv96//soSUmksPWSZ
         +eC9sdrGb/E/Gzkmkr+x7Z+dp1NW9so+1XQOuIS/UKJ3pfNUsePvinqHlFNfbyS1S2Zd
         CiKuleR3VRwCaVPihJFpfd4H24o6HJEEwRYYXBHpecPNQe0iDHEpZ+AE8rCvbn/kXE5R
         1BO/4Vcm2xt4fC0FsWnMZlaL/hN9Yvg72Hap83tLnqi7PV0nBr55M9BDfLPNknSqNGZ9
         to8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813132; x=1792417932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHuiEncoG0VoEV58mprVfME+rgEEB1pqeAB57KOc7lg=;
        b=R5iHKCIQDEStABFTKg2lgW/i8gRzD8PFdKw7YlvaK5luzkiB4aWfY/o1m6Ayy/TPfC
         kUf/ikYRKZaau3MtLmCYcNgFIdK+Jnt4/Szugd016JdZqrAjO4IMX3fcIw8w7uxXtNGf
         LqlFT/EdmQkldgF3oR6a6qCizATAB+5ts/Pbd3d1w/7Bg0O5j0I15UlBqYAhsivvbhuM
         NrEegdjMFNIl9e1JP8Z2zxe6hqGnKrgDoQKYOki5Wxn6YdWSJkeJ9DYeZcXUtT/61o22
         0RJyZpxq8+kZXNKDjEoOOMdj6rJ+cummGkIovePvEcUtEALyTP8MgfbJ9fRmgJdlua05
         bSqw==
X-Forwarded-Encrypted: i=1; AKwUvBy4Uz0/5nlHweLuzwS8rpvaxo5bfatX1m+5ZNYbIbYy0hfePJUDR5S1BylaunoUbR4+FHZ4qpHN99h6130=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6bTv2nPuxp1sXGGex6jXS6F+TivmE96aFXTPiHFvbZhl2xUOI
	A+5X2NU7y3/rT6MtZWyKU/NXg3RPTGe9DIod5/7tVyTb3+3MtCvXnPiP/ZpdhI5lMvU=
X-Gm-Gg: AYBFou1Re9Y1Z3DK6oealJTpKy+GnyRHveOTYXtaw585xTJbw2cqZYRGZoonQsldG3r
	upnTB2pcGUWMKwN6gr8xWknxUNz68sLhfct/I8374HHIvhDk3Tu732DlnCMI+x7riv8VveEXeq2
	X5XfFQOfjASrzLnLBtbQlIJ7L6JnO+CD6qNQKnWJ8Sr6Zn8pE83KMn8Jxt4bukN+xCkpcwrWXUA
	v6oSCzIvPwmswhviNaFmYS+1tKGr+factBvGltdQ4AKr1fpynadb0A7c4Fihggixiifh/5s8MFi
	7dZqnRBEpuNfT9c+zd41itlBuSTBxi00hpxTu3qGzMbFvWVipabPPtvvEr7MfxOkHGG0LFj+Z+M
	H5uYgAxxKZf4dplkZqNY56WGSdZ55+1qqQr+TwILTuo6ZhZ0ndLPROsYGgLwKz2/EBB+cs8SLNj
	an+155JCHV3/3cAqPjNjRqCTHIpVQ40KBT1Zp5qPjPZKs/bofFgZcv9p6TFQM6wQ74ZxN8J+t/O
	pHSzUN5vf55SJ0lD9ckx9h9wQytZZzHXPf5IgXZ++lQSA5N3q9ojg9rZxffsdZvRVk/p7fMXNIw
	uqfW8xb5Px+GpHf5yk2UxQ==
X-Received: by 2002:a05:6000:29c3:b0:48a:ffc4:72e0 with SMTP id ffacd0b85a97d-48dba7892f4mr10814183f8f.4.1791813132156;
        Mon, 12 Oct 2026 06:52:12 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:11 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:52:00 +0100
Subject: [PATCH v2 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v2-1-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs.
Allow their register regions as optional trailing entries.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..05101dc97711 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,sm8550-camss
 
   reg:
-    maxItems: 19
+    minItems: 19
+    maxItems: 22
 
   reg-names:
     items:
@@ -40,6 +41,10 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+    minItems: 19
 
   clocks:
     maxItems: 36

-- 
2.43.0

