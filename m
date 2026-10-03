Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1A3A783F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018926; cv=none; b=erbGnsy7R7I5caztNwEC2IJNF3QFVQvRHrP6plzejWj2nPqdBgzlg8AuEa72U/uhfXUnaJfdYS9UVCMhKlemqa/NZ7mDKswC/1rNEj4HX+RJm0hf/oy0RZfvNAPVYwMARj4ODbpHIX8T7lYGw9BUJoSwP0/gqK1odHa6ytLJZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018926; c=relaxed/simple;
	bh=EdzahQprnb0c9a6ntcCV4R7dCiXc6EsdaJ6ixRzGubk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB/r760B2iNm95wl7CW/sNMfHxEqgX1bqkSqCIkz7IXkUMs6JXm1dZJRExDTAzyg9iSvUDcz9555n1/rQOVcF4tLM1d7KLYEkst1J0p0cRUfjTfTEoqaJ949zL2xL2KvhbEfnwzhBpsN7Kt8c+5BGBKKgNnaYRUyPsSNVrNyVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1K5sVQV; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1K5sVQV"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so105110f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018923; x=1791623723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xzpCaloDfGqbRqjVRILlsh6zNRsWeHOx+x+KXRywfI=;
        b=I1K5sVQVe7dUSDOh3v68UpFmLQQfOq10zg4yffaBKhU7cxCP0H0wspx3kY+GUxLsHY
         nB/ujfB8XTjP1LkwbIj01t59e0JEnpvwhiNhs4wfzuzOsu4xg4lkoE0so1tPyCC85lQP
         xXgLnpfRc81OwIR7cpOrLpp3UfClVq5AwcTzQp9CewK3ZtLxE2EERo8asz2Jdf6kbKv2
         Ro/ef5hxnXLkQAF1tyPYDjO8Wl8RVQ6KMmoBD7OjDcWFzeV8xBsZRR7oAvxPoqePMd6B
         vILoIbJ5encDzN7VZXZCLLKlJ+j0p+OySeP9ceSaOfhlA05Q153cehF6hdi+/ncmfE7f
         QATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018923; x=1791623723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xzpCaloDfGqbRqjVRILlsh6zNRsWeHOx+x+KXRywfI=;
        b=bZ87IEvP4ZFudox9J7LmOsJbJa/cVxUvphiu9UfmLq61iw6AKRb7gbOLfgd7maCkMQ
         084QZzLYIbnoBqQl89XDAqy7ykAomrfGEzzUTmS8ySEEMq1akU2I0yX15D/vjMHFsJhz
         aVzfnQtvOq0fxcxO7fC4KnvMhqPnmnpZQExvVNh2oplwd++9qKWrRQfUbbj6rg3W0mV5
         8n7/v5vU1Yux8FF/hhDZUqjnJI418k7DqwXLOBjtd9/xXa9wY7e0JkQHxfp+Z9cet58P
         HMkGB/S8YovedVGoF+gpHeghyz+Afhj3OdeSpCYbIVUNFVymXSjR0vSWBf0ATjdHC/PI
         f+8g==
X-Forwarded-Encrypted: i=1; AKwUvByBTRrjvscV0jHv7BAJLJb674LMUubZDUQjwq8FNhF6Z7PyVzBDMBSQjOIBPBXUtOxp50AgOznUmxmxp2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL39kLwMCkEZsOCiBtAdx8G/Pu/JJ4KWc9IuYeHcCi1XV+Mz8rU
	wHSrCUhfcQOjtXrobiRnTyK2z6oyDJGCyACu6b8Ml4WwWYxoi37QHymH
X-Gm-Gg: AYBFou2hsY/glF85nzLs1/wC8Pe27pis1n/+9uPP+ZncuUxUIsDAlJg9rlNB3LUs2vu
	ga5lEgZFB/01S9ztpltNiJgroCnot2wXLH8RdrkTetenC5CMZMfCgURwf6N6jUTs/H8DraTK1aM
	YlH2PpYdsirKzMI8/tIpIvLRrPT3dmp6MU5mKkZE9V8ZZU5waWJn5zzyqNU3b2R6KsKIedhHMip
	EM/xf4Z4dI9M6SSVfq9/qtG+eTnSjHDfGd+BkBokVbdcmP+qwPxJdCv3SsuDMfA7L9vgTY0u6Ls
	vKJZHFVlckA5ZKk2eQLdLfxiKuvzvKy7f8rLPJ76wAjHCGOw147jnNTiq58DESiYb31UPv11xAT
	A+6OQb8XU3wu7fVdArbGSPWVpCqis1POjK2sqtkfONLPsLPMHJXQ39TTW/hgBhcmKH6jWbRMG44
	CY0yaiAcZtEDISdFh+rZFi50yg4shsrwJojbNh9QpF0Z6ReinRnO3egNyKqLOMR3NT5S3fIl8Gd
	SuH2d5sd18=
X-Received: by 2002:adf:e19d:0:b0:48b:11ee:de66 with SMTP id ffacd0b85a97d-48b1274c63amr9409397f8f.34.1791018922988;
        Sat, 03 Oct 2026 02:15:22 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253dc9sm11336161f8f.3.2026.10.03.02.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:15:22 -0700 (PDT)
From: Franz <franzelfranzel@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/3] dt-bindings: net: wireless: qcom,ath12k: add disable-rfkill
Date: Sat,  3 Oct 2026 11:15:07 +0200
Message-ID: <20261003091509.4822-2-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003091509.4822-1-franzelfranzel@gmail.com>
References: <20261003091509.4822-1-franzelfranzel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards do not wire the WCN7850 hardware rfkill input, or wire it so
that it always reads as "radio off". On the Microsoft Surface Pro 11
(X1E80100), ath12k enables hardware rfkill handling and the interface
ends up hard-blocked for good.

ACPI platforms can already turn this off through a firmware setting
that ath12k reads (ath12k_acpi_get_disable_rfkill()). Add a boolean
property so that DT-based boards can describe the same thing.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Franz <franzelfranzel@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
index dc68dd599..d56050e77 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml
@@ -27,6 +27,13 @@ properties:
       If present, a board or platform specific string used to lookup
       usecase-specific firmware files for the device.
 
+  disable-rfkill:
+    type: boolean
+    description:
+      The device's hardware rfkill input is not usable on this board (for
+      example, it is not wired and reads as "radio off"). The driver must
+      not enable hardware rfkill handling.
+
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
-- 
2.56.0

