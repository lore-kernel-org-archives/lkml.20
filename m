Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD367414409
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615214; cv=none; b=EqkhsUBmlZWimnZNZKIFfyRsjY9lZBN8hKcwnC0TwVA7phh6o4oU9rXQnJl/Ie2QCsH52ExaiIW0YUEm9OCvBkf1yx7W7OusDvy/FR2hQgJC/kItKiK55fO4ZLvlnK7dDZiB/3usLtiASR36G5wfpJ2iK3lZCwB6TbXv/1R0jeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615214; c=relaxed/simple;
	bh=BJbdZ1qjwzTIJ8gWfsXQMP60H9ANekoYJIQma6jacu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtBPNlKaQFJAbMqJ4eMhd0eotUxXlBGQB1nzJo8pBgA0pOOAtZWfAc3z7Jg/xT7QHFf2cfomBPE5jELUciFaC8XyehYWE/mNYO6rzVaMUKjl0HZQYdwOzb6MQxh8bmpfDFar1tX9Ixs/04XtFAxoY3SmYh/7vzXAxVGnFcBG0G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcEB9/ty; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcEB9/ty"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-354ba08cfd1so719935eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791615213; x=1792220013; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfRbfRDY9eIlz5MV6EtJbnJLniP1KYHIxxFADZtz7ZM=;
        b=GcEB9/tyjEcjKvZmynesAVKPu9gZZisaNeXUyV2VmZUb3bfcP25JzxQ5zHZHPSv8HE
         qPo2GoURn9hgwULYaj8XVj4nj5rZqYmkY/hjXvzZKSQ6uc2grJ4MNrCuKarmETGA5gkL
         hlxOWaC7B8DcWjOP50INEMHy39jAAVOUk7BeFc/dRfuRjBc3j1kyY6Cus+oXv2tmELpJ
         fF/aEuKGE9+Qnx9sVnrO8e1vOuepRIpJz0BzQsmc8fKwTKmUr4NM99BJ48i4EQdcRegN
         sHZxxu0fDC/qvDAHnJIcbORiukLnrdYJmxmJhBsAUHLfytT4kbtBfCTEm2eG302n9mat
         LYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791615213; x=1792220013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfRbfRDY9eIlz5MV6EtJbnJLniP1KYHIxxFADZtz7ZM=;
        b=Cl/kwcELytZ7I+srzdv1jOBHY/Ja5XVYYh//MRRwRhISMXBLd1s7ZRxJhxIl4V4sQM
         SjE3H07hFL7T1FNFu3j1Hc4Q8dqp3OEVJTXlyWOqnrcm+3BrcHXa1VXS+U5Ytgn6U+zo
         VER8AUHjcbhUAlJ1+LDeMsviWszIk+fNoIVuRi1zGDSTii8/fsVOLyqBuEABWEDezS5g
         ez2JRPuHUY18C4j4LwZ/PytKdjrlcxwXc2IC+CY0AjIK3MrqotbORPUN5g72W3jsraj/
         bEI8uh7YL7aEzqoV/LyiqxH/td0oiZcAcnmQM+M6tz+K2L5g+412q9FaPHDr08dPZ+MY
         1h+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx3X9bl2eJl62HtdjXcFdVgCYVA1Y6+hrLorLeCsVMhByKPFi9+h1IT1uwrZReO/B7nhvXQ4fAZ5Bsxpjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWEwFrPymv5aW8NUrF0KODTdijBtaO0ePC0zLjPeYF8pSjOd4Q
	1OyRnarjU3Hy7Sc9G4gXyW3FbEPssXZcoodkJOvtSCKW5o+ycNOJuaiC
X-Gm-Gg: AYBFou2Y8s/GMGnZy08MI2Hf+lRIwG9Xm3E67HPbQtg7EMKy5VhaSStcxsGk5CjXns6
	t+rWBmnvffiYQ/OyV3fmiPDobOoTWdWM3E/9qLaZox9wpb8qkppfj5kdUv1k+tkyRYTxt+i0Xcq
	p3paBZAzmWVgplb+TzTeAS+H1rIQUZ2WTryx+iep4T/qqT+PfW8J4PiwvOGbNbk9kBifcYoPhKo
	1NYHqPsmpr/nuX/SPByZDx+7FInYHf9HM9zcs6CKp7Qaf37zK89DbizOgDHGuErtKIuT9UlWXOu
	lkEdNFtUP3mrR4W6ePBXZzMsvV/1cQmpXzyup/Ea6vCRJKKrNpriMF4nQhpO3F1ejEai6DBGvBN
	qb0l4R8dsG9YJE0RoJcOWpzKRrvexnRxedagWlD3eaGZf5DZGUwWvTLq4jjojc2B76RrLgb+AwO
	IlfSEta1OYZN15ON63otvgfjym/8ffpvc78UGlzGHLP3dVQbZ6lHiGkvuPOv0UdWeckA8//f1TO
	Q2MgntyAOvR0Kq7i8xTgvSpruGS78udgSO5LR8=
X-Received: by 2002:a05:7300:8819:b0:351:657e:a426 with SMTP id 5a478bee46e88-3537dc8b4a4mr5992720eec.0.1791615212719;
        Fri, 09 Oct 2026 23:53:32 -0700 (PDT)
Received: from [192.168.100.70] (host-200-61-172-117.iplanisp.com.ar. [200.61.172.117])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm13009650eec.20.2026.10.09.23.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 23:53:32 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 10 Oct 2026 03:52:40 -0300
Subject: [PATCH v5 01/10] dt-bindings: adc: add excitation-current-chopping
 property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-ads126x-v5-1-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
In-Reply-To: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=BJbdZ1qjwzTIJ8gWfsXQMP60H9ANekoYJIQma6jacu8=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFknHzzdczzM3LlX+XhiUO3R7p/mlaxPPHuO9m5jaH1nf
 Pll+NaNHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRXn5Ghvcvtz5yuOl9cvI3
 Lekz+27/vpa6peoMbxdr5NL7k45++beD4X9awheD4nth8/3tr8cc5DqtwDNfMjpudh/jb70NxeH
 pjqwA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add a generic excitation-current-chopping property. This is a feature
seen frequently in ADCs that are designed to ratiometrically measure
resistive loads, such as RTDs and strain gauges. Enabling this can
reduce any error due to excitation current mismatch by swapping
excitation sources of alternate conversions. This can have side-effects
in timing and filter response, so it is not always desirable to enable
this feature in some applications. Therefore, it is best to make this a
property that can be enabled or disabled in the device tree.

Suggested-by: David Lechner <dlechner@baylibre.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/devicetree/bindings/iio/adc/adc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b673eaa5d072..fe20aa8f1bfc 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -109,6 +109,14 @@ properties:
       sources. The index in the array corresponds to the same index in the
       excitation-channels array.
 
+  excitation-current-chopping:
+    type: boolean
+    description:
+      If set, the excitation current sources are swapped and averaged on every
+      other conversion to reduce current mismatch. This generally comes at the
+      expense of added settling time between conversions, so should be omitted
+      on systems with high-frequency signals or high data rate requirements.
+
   burn-out-current-nanoamp:
     description:
       Burn-out current sources provide current to the channel's input pins for

-- 
2.55.0

