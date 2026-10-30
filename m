Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346260;
	b=v11Bu+z1tK84BIxgeVYb9FKlJb4f/Uk+oHQD7cIzfySwCsJU1mJPNe3L6VWiXtMqXptN
	 XzZ6riJ36Lnv20p1GXDaSAL3A3hUnUwuzat0krJrhhUYQ83vD4Wcc31bObGT9lXA8xTfU
	 BlSj+4b09QEeyF1CR5NDZRrEZrVNbka/K3EHPZmOYtSsC1O9vetFQND0nFRvMaFWD5R6Q
	 NurgG43s84Lc0ehMjm73+0ZPgmYACWcgBRKP5yqTpZznSxHXcNmHn5Jd2eaOqYzoqpi5r
	 jGR+V/Jsx/KmWyKPKLM5EgOjOUVOoiTYtghw7yqAkaEYcmf4AzTaRz0+upZR0R6I7Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
	b=PH5E+cnRtDGr7eljv8Pequ5KLcEepyxIMTDUmWLbelSOCITBMa4H8bjWzWMEsuu0FEXa
	 9nMDRUDkrgHrKdvWd22enpMr17eAxNWLtEj6BGVyB1GZS1SYFYzkY4WYfKDVC2C1+2zLZ
	 Lfn/u5/eusZfhRQjSYz0D1txp+BIVvZ46yCqudm04a/3/FDAG7dv6SGdWNkVbdLNU/bDz
	 jS8Z1IRBmPx4/5GewOg16oS6JvFZGN3oSZxpaUpLBRQlcxpajiJp7eBP1qvu3JPspNsPh
	 m6TsPwNeHx7pH3CuiiUwFhNvBUDws7Cxg1+XEjF1bCV6OHDJLkHlSsgWjgULhLRhgeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX8paL5q;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79917606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79917606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX8paL5q
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-188406bb948so367347c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793346260; x=1793951060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=wX8paL5qsDtcZsMgSgtZu/jOrHyINzw0qkafMwUUmyCKUP+cPCQ4QfoXL86d1EgC/J
         vrzscfNIIQQmsTpvtNi5putEQE64KNqjVHVR24bmfCR5IHqBbNc2O3KY/wajJsj47gTS
         eEelyAd1XBePozajS58A8fF5wVnwcLI3gIqhFgWdFyKQjuE2EfkO3QhNJeQBRJbjHSDi
         llooS3PoM7dSrbJerzmjnNuBNBQmx5BNdSrHxVzao/urNix0sPT8tzQnAZAso40RJXnJ
         7CY24bSy3DNsj8I9VxC2okaOrzxo3NVrwDd96BFgPyaxHRE6J5tgyigpCStizvxa9EA2
         sCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346260; x=1793951060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=IjfO+pVMo18r41kzBB8qaAsTHHKyHs+MYLS+kk0ls4pG0j+BvuoBuLdfga/I1sklTL
         Q+472ay7e7AQW0iGboJOWPF4Muxo5x7ADGtIcTUy6UcMfHi/l5SNW1QraSAc3Ub/fn2y
         YA+TWGDvptn5rK8XOauTKzT0M5wpujidq/YEfrp64fGyqRtrjbp+AIXMSrBb8r8DpEi+
         XjFLtACTzKVY5mjFKe08fg2NpaxC45xDVwWw21kcUYgkOeGZW8NMTyIKKOBb2BYmyZJD
         vHXWVKmeNCatBAgKS68f6+5yBmVayXC4/CfRR3Qp38yQnylRAM/HK0vulAaWXlVditOY
         ezCw==
X-Forwarded-Encrypted: i=1; AKwUvBwbFDuLhGD0aaN1cHcklMxyDYcUCO+OQ4wMS3HMVYYTnRAYLFwX3tEYCESyFpA66ZKLBNiiu9y+dw41a0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7D01Qg4g2V4LUUYTp7T/wlWnaQ9bVFN1v+oUnFSmAbOCnrzDN
	z4E5tQ+fKQagekt4cboOIhRBYmPdisBtCWY2LnrkTu3xVfZznHzvfWxo
X-Gm-Gg: AYBFou3PgsGvZiEe9lX2LhQ74xbnZMJ3TgU77PMPBNOIFJ+4dDMXWaoa8eUEeeg06HY
	DKA0DHWFvsfw1dJVXJC/bJSls55RK8prjdacOY4gGq0fJTL4+NsJ0YPLgpqraw5X8Uu2Dc/AxR2
	23lFDH6KNoBPy9SH/iHEJIvNiDzZq6Kp/wl8myeMhsnc5rtMJFai+IvnbP5QAq0jmVCZBi2kXlZ
	ZrEcqbdfzrPwFNUG+jEt6llyUtt7C8cQczrU+BYDl/hl57iFe+XU50MFbgxLL3TdHZ3qxZgb91c
	f3aOvUfz2kSedmGfNyhQXaD2RW1FVnZgJ0SpfXgI3hb3hzv0/q/uedf7RMLXXo9u07E40CBp2MF
	Fagy0pTJxQ6b+aiRNdvQnUbnwyWlaKcZrNXi6+1tjIhxIVU66yCD6SeMNE50K4m/a3vID7OWuCA
	Z7ehIHu6YhnDlEDpvC9xYDE8v3pdCpgWITFKeaWS7AqDZ+I//Ja1jNADg6SNtH2WAWYMqElBGtD
	X/dCUkDEKVhojpJubqR1cCvuW+XcGgrAK5o9EAOHyDuiEQJa4vscDvgT1l4+Xie6gVKUCDxVtgF
	MbW3IjSevC/sDYbvSXwJEQ575AwJNtDz5VvAO1zdA8Yn0N2qBzBv2w==
X-Received: by 2002:a05:7022:b0c8:b0:1ab:6b10:461 with SMTP id a92af1059eb24-1ac5e3231demr1805763c88.45.1793346259452;
        Fri, 30 Oct 2026 00:44:19 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:fd6e:e797:613b:a5eb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7466562c88.10.2026.10.30.00.44.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 00:44:18 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
Date: Fri, 30 Oct 2026 13:14:03 +0530
Message-ID: <20261030074404.33517-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261030074404.33517-1-blfizzyy@gmail.com>
References: <20261030074404.33517-1-blfizzyy@gmail.com>
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

Add the compatible string for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..02c0ebc3668e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -472,6 +472,7 @@ properties:
               - qcom,lemans-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
+              - vicharak,axon-pro
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
-- 
2.50.1 (Apple Git-155)

