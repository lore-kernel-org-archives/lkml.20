Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919192;
	b=cX+hbBzeK15YKFueCxedHh8uDZsdfEBvfCK1p9OFsR3DPkfAMhi8LmUADAqwxUslKzvD
	 qpayTk4HRnIqQDbFaf6ngUZgI5u2ci2IS6oP0n4tZDShcTXqgRvtXV3+5Xk0wAy12mRaR
	 p1znuseA9A+IH4ajqNfu5ljGYCRyS5LJPs8Z5066L1+kaGo6Y0+u/Gqm6bkqFk1evJul9
	 g7XnzO/2WivP8QvICvnzhU1q6AhNZ8KsQ0JkRTLE9bIm7UFuSOlva06Khoow0NaP6uvMh
	 yI36m6yN5WXWyqyznZsg2HgOGArWUOM+NAq7fpPfaBnZG5Ydu20g2C255L5QWu0cMcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
	b=HLJUe9PkauW7L1R6fZGfflbDf5ektek7sFUwKEeHYrgOVjyoUuAYcy3cQydr7m4N/fZC
	 2UtmJCYeILfpUqsrtOINVdwQW9AAneqqREjsAdl9F5LCu0AbqU42J06CMyGEsExiWP16z
	 D6MQKnwN8LPBe1g6AGBmduk5GKCiDhW7GF9FVUCis2TUK0u/DYnRbmrRefUIXvuZ2ejQt
	 3HhD3PW2BRsTB3+EE4MRwEwHc1q0oOCIPNUcfgbp+1uG7FVpxLW2R7rKk6yk3yn1j38jd
	 YCWkWIwB2/8DajJXAU4jZUQCzYEoPX4Tx60X4kOgCrACZDDgkg2+eWtxI8Ps5usx6ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2QL0sBf;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349F606A88C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C349F606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p2QL0sBf
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49d64a88222so540976f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919190; x=1795523990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
        b=p2QL0sBfCSrXZK7z69n/Xb5ZdxxmzCyFRVDFk9wG3bCxvJeWlHMSFo5kACNIcbQFgc
         AGUGL9NwLq2UbaN39WK9LRWGrJy9A9jWBfhVlV7JIIVmIyrjHqDqIYzWNpo9+doUSEE/
         b2op19hmatQWsUEaoBJuZk0hAotqj4jEHwBiDmVlsq4qOmZ49EdcctCVV8pQzjYeuD6+
         Ls3mkpF1ZAoJpETbTHVANgq7VQfCXs/Yv54qoOF3Z6ImNn88EGN7MDc1SU0RHRWLKE4q
         GVe86wbn+mRFXQQteW/6yy/qNXoWf0sHWfr//IuZMSJlc+K44K9rVevgEP2urq3qYHwf
         c8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919190; x=1795523990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwJM/btZEuTlA5fjq2BpjxzgulZAXHvNDImvE1z8MG8=;
        b=DyM/7YgFZCvikIld92KQD1TyTG++HCSzOWeqfUSVKx7L2pYHoxMDn7uH9UtFFlGrT7
         vru6veKKp7L6eYzc17+YKpg47UndgBkhYfS33hHuxIYP5XbaL3rIuW4lvnoPTvoayW85
         ZWl/O2jRd9UcQjRmn8ZEOEaIywAKbZtP/VDhjUHn0P7Ip7u4VpHQOCaShGchoTQGFa8U
         kYqtFdMKo49OzYw3r7x75TJjecp8WPhbMS79UfJUvazTsF7iJkTnx9/S9vG1Xcc8WUBF
         MpzeBvPJ7YPpkfS0ILzrb+pqUBTiuh4o0TSxxSB5+xWDeJcvk6jt4fPEb81SmxHT7jqn
         ZVig==
X-Forwarded-Encrypted: i=1; AL+hErFgDRANV82aPOBdF7WaeZCXIQQxRG96cantK6JclXWCzTSuj9nmiZYjenx0MwA/d1T9NstqMVrAZ1FZ/Zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VFWWQBpJv1BS7OLxj54HRMcS3GNTxeOSfbrFZ7Qm5vDe8Bwyv
	2vl6sHSecxRVCKQ8sSSrsG/3eCWOhwpKiiAcHMMs/GLF1x3C9VOfNmOC
X-Gm-Gg: AYBFou3TlawGlskjy5bxrJxosd50/diur1esIImhW9FMAqR14v02E3oANcWxoZRqO8f
	d9rCQjpJ3dG+4DlmAhVSZeAFGwfR9eFc9qMalmu4LRQw3DPHlvtNBmBswMQ5QBZVFveCsypqVT+
	hgVuBnXpJDoYeZsIUU4DS2nt00+yzxdDcFmMRFsCSyt6u/6gLWKd1DhqX4AbVN3Bj5YbYWGNmRJ
	s5EXFwyMmybvPm73hfEr9eNT3aLGWxbSWv5ZO8j3Q6fgW37/FGvoJqWf4iuaSG5UNyXTqjBKMzq
	mfTv/FBU0xvUVYWaptWC2KkDHsblRMuqP7/GqftxWqKs0OzATvr9ca52+yQLOyW0aLcwllu3Ghx
	K47i+MnALHRvpZBrr9qb+2CICkN7ooN2x7UmbRWlJV+lBaiGQfEWyDR2LM/btgI4qS+5fiSOtEx
	NUEpDckzWWS5F8jpvocMq5f2Y0oSeYqi/LAdkfO2XhfHB1F/6hAFnmATfAwDD4AVA708i9F4YRN
	8F9605rWPNIqz233iAC56xlqdak0wFqeW9v/zWdjQcsnUy2TaOGpYV0/+Oy2kt6lbtuVSm4OLXC
	mRb6Sa8fVLhUjq3GhPk8Wj6yHkZxtdRrNmL1qexHaQhZQk1QJmtCK4YpjOcXZYs3smPX2rKUkVF
	XegXxdwNYCBCE1LM=
X-Received: by 2002:a05:600c:4513:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb7837c4e5mr56003575e9.8.1794919189862;
        Tue, 17 Nov 2026 04:39:49 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:49 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 01/11] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Tue, 17 Nov 2026 13:39:36 +0100
Message-Id: <20261117123946.668557-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
SM8250, and register the LG Electronics vendor prefix.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml        | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..f8b34109171d0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lge,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f10..fa50a81880f0b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -971,6 +971,8 @@ patternProperties:
     description: Lenovo Group Ltd.
   "^lg,.*":
     description: LG Corporation
+  "^lge,.*":
+    description: LG Electronics
   "^lgphilips,.*":
     description: LG Display
   "^libretech,.*":
-- 
2.39.5

