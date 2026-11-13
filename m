Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581551;
	b=df38ijc3YdIwxhYJsOEtK8CJfy2GhYnQk9TWinLKB79xJBB7PnImi7OZZMvWGC++8rai
	 3UEt9HT7ytFUVRZkxXdV3gYGvd6PoHtYFKnAIpecuMV3ZdVxcUCjF7kACGWCAw5kf1iBm
	 4fRafoCDfzVCCeSbNElNDUjQcDpR5zAqT3TZkXyrWlMsYQ5/82B9a4CGl45kgLYTbk8k0
	 DkwZLp+EHtKyuvyAY1ogxSNkpeeVWAMmWHnXQoL4/p4BH8UNgreU7gaNX73rrwrMUDRhT
	 N9EGC0N17nNMOSOyK3GOdrDzMghHWeWXoDti3FaMOGK0RYAOjWjbAUt6yQ1c/OGgbWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
	b=iNa4BJ8C3gwX170/heLMF/SMsRCdutnxBPjMA71XNhnLOwYVQUs+BttTqe0EewgmwIE1
	 JRLEDFz+jNXUpyfUbMkdPcB8sxYlpneFZRRbMDM2vbl+nEg2R4PaJWr3Lyw73NfSd99Nd
	 3AJejC3MROf2QS+M9pCDGMMor0z/6nmNKEGpsBeuv476x2Cqw5XEzUVzwgT3OsUd5gz0N
	 bnczHX1iowSFjeE3QWnSQaF8soXbOcPmEY6oDURTXYokoM76vW6AOHGQqmdJI8XkY72OJ
	 tgzHS4y4iTJ2cLhCofKPznZGCa4ole/6IwXlcWWR/tRk5TWBpmQOzmEqZHzuH9Ao+pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C66606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C66606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=aFiWn8oQ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4322d310e7so284219766b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581548; x=1795186348; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=aFiWn8oQ/Gdg4T0XFGfb0riUMpESOKfoO+blWZhQoaQ3KXBLpAxYHhpASVfVWlv+eC
         hd5Xkd7VZxaaS34+U6oPmvp7dqvXD7S9GrX8nSgOCXXex+j1laODKF5G2z2+tjJAWGOc
         qAiaOWTXBxR+RiZ+STVemTty5R4xbYnIK613+GcMFWOTO3jj8zBx3R3FaIf529asBtYc
         ImLVfQ5UaMskbedLnsU9Qu9C6whXAOZGo7ji3n8sI3PLB4jq5aXvMhBrJdfvh+uU3Y84
         BPj6BYfSvF26pn2G5W0aZk51yHCVjqsU4upU/LCx7kRUaSn6MnJGVrBdWvyeCH03LQuL
         D13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581548; x=1795186348;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x6mtBBgalchnnplTaE4gth6kZXm1TRJPsm/TY03A6II=;
        b=yUQM0QVqfBYGAQa6BsJ67rU6PtnZeWwHrhBVEyG2X/Y/yFYnBkkwpqOFEvBox+3ER3
         goqI7QcNcIf4KxhnQxpjdhVNALzznNktiH87tSaChNJgZjc1R5rzsRS0qPiZd7FxU+4i
         dA+7wxEhxEwOd0as0t8eTs1XY16mQo+CpEXuYWAwCaPe1b6/BYzOGC/Bt0m2hCZZb683
         0TE9eR2RKRbnKWX2iDPiDTE62Ft47Z7Ul83KOsQ7yz4XdGBrCFGpSKa/whAUpusH59iu
         3WlWSgXqWwWvWIgHZXGQ/eUAMU6y6GhuezfNdLsIGYb68glPDjcDBp8ezkYRGoJqtIWV
         hD4A==
X-Forwarded-Encrypted: i=1; AL+hErHqvrl49jiWwzmTihF7ohQi+sK5legjUQHL5j+DhpynD7cEB4HMGi+ZMhZaLzsBX8VtrLOPTyYlE0ya68Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pda7Q0WRUJXf0sZQkZmGsedBbWb1OhG4S4I+941vNmil2VnJr
	4gKWt2rjE+u+BMhrWaCEBcztKAuVYElV0ZbNpCv/CHSjaKgfBF1eY2c9EzL/LcSasUk=
X-Gm-Gg: AYBFou2EGB3aJBvJ8x+5qu6bXGwJqlsf2/2voAWDWMeZNLGhJiInqKXgXSzk/g+8Ocb
	H1xkBf8jyPXDWg04f8N3MQY8Df+d19pfSVdWK7gmI0gvrG4iZ9nC3rSbHiFuCddyw0CyeVN2P+5
	2cJ+RI6rA/CAuHLoKo01/O//58TnQtgNzGmjMSO5hvh7DXTEQyY90Vw2X6mR6gPRFK8jUN0jD4n
	koL2NSrLGoNNah+Z46D1iajWFUMS7s0x37XnBnRP2OgMcfDUe2FYogupScz1Fq84yp6HtYzvov4
	clzvzm5onMXBgn7/tL3J+IllxQ3Rk4whkvvJ54NZ2yu86PlT52jWtoUCLRL7rATX/kAIV0cW5r6
	8UARGtzH9M+bqZ1E167q5Ya+ntCa0+SkE5hPYdS1fpVpshjj9K1RyijeaxU1EHUDuPJtFpNjqxy
	tqjAPxCeXFO7aCH3htefK4wbetfO0QrMsqT/0YmTN3Gr9lljCc4uXTDh2sLstoMNuFPcnKlU9Lg
	kbBDT7exnx/uoYPXTBiN1kOH++8XcyfS3XzL92Ou2LEgR18uoIxf4Sq0+F6esy7tdv4gj9E8iRS
	wAViaHuUd7qPWDE4MU2hCJa47GU+RbnFnn6Ouu7mCo2oKd9ybYQFf3i1MZyGiGI2InaphHiHfPq
	vTsj1aUQ=
X-Received: by 2002:a17:906:f59f:b0:c3f:c856:fb7a with SMTP id a640c23a62f3a-c509610fe94mr243168766b.3.1794581547988;
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40831sm112988566b.42.2026.11.13.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:52:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 15:52:23 +0100
Subject: [PATCH] arm64: dts: qcom: milos-fairphone-fp6: Enable Iris
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-fp6-iris-v1-1-5496b6d99911@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2kkYDBi5imHR1qmOCQU7xZAQ7
 m4Vli95/78VlJOwQmdWSPwRlTEWoJMB/7TxwSj3wlBXdUtEZwxTi5JE0YXmcrWhIm4Iij4lDrL
 8r279zjq7F/v82x9G4vdcGnnXwFll9OMwSO5M5CXj0SHot+0LWuOClZ0AAAA=
X-Change-ID: 20261113-fp6-iris-bf579af01e51
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794581547; l=900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=eOYybVYmm/vaSHdcDuworLmH2a8ysNCRIzxyd+Wv6Bk=;
 b=Oakb4yTV8EJe4CaVf0hGwMlwSdxXutNjtX2IXg+EVnvMzeZGSXydLJ2z4lMzaqf3VkYczrgNv
 kEoaXwbIYsXB/26LegEkRQcsr03nJhNjnMVCkPp4psMIYflweIFUM0L
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the firmware-name and enable Iris so that hardware-accelerated
video decoding & encoding works.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 5c4581410a40..e46db1b794cc 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -768,6 +768,12 @@ &ipa {
 	status = "okay";
 };
 
+&iris {
+	firmware-name = "qcom/milos/fairphone/fp6/vpu20_2v.mbn";
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };

---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20261113-fp6-iris-bf579af01e51

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

