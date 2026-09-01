Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6FA47669D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253580; cv=none; b=j1YUp4tpOFvBmALaun0PEyVXqsoIgU5uFS5s47C/LcdAddij3Xd6CGOk2rVMW4eCxQ3D3XqYTd53q2XakqXvoiHQAlDdWnBYWixixyMWItUkK78lf+1G4ALg5PBbo1fZlgQbLyqBI/CXE+mSDeKaNkSYpi0TCzH0g8eBVrBPMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253580; c=relaxed/simple;
	bh=VLMCTblWAmcjvlydjiDQOaM9EY30ui47eVm7HFZNWD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sM9yt9p31AHZ/Ay1ulb4kXOnOc3Nohm4WvF12X3njQgTpK+hWxQGqyRK5vxySfu9Y+aDOoufhmCQpXchEdsi5c4Pn6wv0htEBqOhFt5u+ASEXzWMHXQeVFAguHKIKlIsBOI5nrMUKcXDzeWiStN0DCSHmJqCqc8HBZz8pSLk+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zwdczwa3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zwdczwa3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c169ae1cb26so127736466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253575; x=1788858375; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4RZfyoM5tD0q7WqcULgsURT8LaR6zOJsyJgPkVRkoT8=;
        b=zwdczwa3iQSrZKHoSS7DDDQ7f3Stbep0b0Wfmlg1EcCRX6SxYF/9MoNo2WEoq/01zy
         /PXQNiP2zkkWrAiEovCOABUVNTGVStO7sYtNrDIyWSa4R4UdMvM+0g6LCnriq1vW6PeB
         NUGGb4hwo72xPuhxuZ66Ni3bPLOeERjb8E9WCr1NBSl/x6a6LF0RR+huuBDHTOiDIDeN
         +kyHp8LgENnkYZkCXv7OxWlF1z7gzHmPkSYLajmA7T4dI+OMsMdguff9bvHItgxUwjiz
         5EeBUrRo/EiIvw2yTfB/mo0c5WoB1EBNk3zes/W9Rma5KmPZxvbkfuE2IN/bMN7VA1Qj
         4/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253575; x=1788858375;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4RZfyoM5tD0q7WqcULgsURT8LaR6zOJsyJgPkVRkoT8=;
        b=LPYnfhwS8oQ4RCvj+dSqd01C/h0gGuFb9O1PZuCE3fRANHKs4T6buXwx5o4Z7zxlFI
         X+Har+ifO18tsqy0+Ph0F1OOOXy9U4asKb+sHNEP3spDRFMeTmKVyNwH7mXD7QxxJluk
         OqjtmWmNVdtxn9uiTCUeFhRPFuMo13RZKRPx1+greep3q5OSrxNKHKrl6EgLh4xI5uM3
         KZJUfw9vB5Oy7SNq+FIQs4oP87/2QpLcdUj5IUVUGfRZFhwV9pfWa3DArA7gkA8cWGft
         alfUsKvkNKad4+FjbQW4T2Di/M5rYGFWyYOfWtyp8s7P8lHXW1mCilwCIannSui7aSaY
         nDGA==
X-Forwarded-Encrypted: i=1; AHgh+RoDsNcip9vPgZXSReImU/PcCaQ3gdmNAyelNQ62q3tXHV33xQ1BsFVNkZ2zdvnphGlLQPL4sddzR0lSufg=@vger.kernel.org
X-Gm-Message-State: AFuF++lklVep7RJVHNLDv6UrS/F62l6NDZNatuyyxE8hE58L/OZkYJSc
	IU1XB5OBXHHlNGU7UaHUH4/c6ptGt/hiH8liF3wxuuBS2HK5FUAKyheFMVLeCsNMBbM=
X-Gm-Gg: AR+sD10tXJl0UaGaGZU9uWfdft2ijpkvrZUUtNmIlkWxPr4IPNXqUyzRY9IwBwZZXjx
	QSyGWTG/YLbehAK0de5L1/QZMOX7Fzoyl1u5hkwh6mmbyv8lhv4wzZK9+1XFNPFvHrJYd0xFSf5
	kOdEs5iCTXvjeYBZmMWiSHpEQHR8VRuaOeI6LNS1zY6ZD3x4hTDSGuXPM1xEoUTGlRGMdvvWz6C
	lUALTtB/xciG14W4xmkBNzKAXyWyFVndg9FIJvKmJVESviW+QQPy/W8GttqpUAoR6Umbs18yLD/
	FUw/DfhmBSRf3zUsuuyR984pf1KZnNbTJQZH942SXJVm/NM+wlqs/MpiCrIpsl8Asabtw5a/HMd
	BxfPNg2QRQn9efbm6SagiuCBsf03P5zQpGYlUnMxj/+9t89LRD01XrkqykvvdtIsgs9DwsxAQ8o
	gYv40uGpyiVZN9ceRD6tGp7g0ruYfoyVLicDuke3hsuUZR9CThE5xI4i6b617qt+/YaGAKCt+zA
	SiPMR8dgYo7jzSEcWmSjH+gkOR0iX67eyzjs93a0GQ=
X-Received: by 2002:a17:907:80a:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c25b917f381mr253265866b.6.1788253574737;
        Tue, 01 Sep 2026 02:06:14 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee7335asm525484866b.27.2026.09.01.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:06:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 11:06:13 +0200
Subject: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Disable PMK8350
 PON
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-pmk8350-pon-v1-1-e05937e9c860@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB2Ixkj1KuKixpl2FGNIrAji3
 U3b5Vv8f0KkIBShzU4ItEuU1SUUeQb2/XQvQhmToVRlrRpVIPsK/TI/tFHoV4fGjGybWjMPBlL
 lA7Ecv2PX/x0/w0R2+27gum5fOokCcwAAAA==
X-Change-ID: 20260901-fp4-pmk8350-pon-55dfc963ffb5
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253574; l=982;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=VLMCTblWAmcjvlydjiDQOaM9EY30ui47eVm7HFZNWD0=;
 b=OLfQFq5Si7pDMICrd4APmwBWRMw+HenJSjX4WknR1Em3H7jb/DuDAJluqkvwR6PHLVY2xqAh3
 MwA6BCej4YeCiTxRg8BftPuiK9yE6nY0uI3LT7wbnq1CtTKNsD0eubw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Two PMICs on this phone have a PON block, the PM6350 and PMK8350. Only
one should be enabled at one time, so disable PMK8350 PON and keep the
PM6350 PON.

Fixes: 582e7c1026fa ("arm64: dts: qcom: sm7225-fairphone-fp4: Add pmk8350 PMIC")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 5d20ad93b0c5..773304b4759e 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -992,6 +992,10 @@ xo-therm@0 {
 	};
 };
 
+&pmk8350_pon {
+	status = "disabled";
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp4-pmk8350-pon-55dfc963ffb5

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

