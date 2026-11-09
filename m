Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184461;
	b=ERqO/ad6v7ClKPyW1KdS3Pqeo7EFTbWs9vyp/f6Q2wVTtc+kczFV3ozb7vvsuDDKQHMg
	 5eKdMZgeloGMmF+vb3d+04pAWjlyQQwYeY7ZEpimMrQVK4vDO6or9OSLdnYkk3WOLkz1z
	 qjonT6f+ZwyP3j7eOFkiH29GgfrRfiBy5cGHMWEN8Q8x1aufuO9pS0OxxpNb0EFW4U6Gb
	 LtJFibFprRPrqltKEXnHuzNk3bOI5hw7G25dqUy6x9cEKMrzm6la6QCv6/gdTQPkQbERe
	 fprT4CDZLdvdmpuSz/HPvH74Bj6wJcsx+8dWDpActeGk32Njm1szcm/DTo1GfdZi5Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
	b=Npb4OQ6HyRSEv+H6lDooaPyz6UDrKUimZvExmombw/un5+Lyml2tpG/FXJru7I+SJL50
	 VdbDpNsags3MyHqATpacDipeI8M2qxq9ob3UumT552FBvIsi5L3yuR6bQjdKiVbmRqHk7
	 +vufKLSvaJvVsCJHfRffEqLYta7oyK+MfXFPDxw1YetXbXieSBkiPD6TN+bCQJ5f5IRXd
	 2oTjUFmFybFXm1WAwMtHnpRWCObSUR/H2OtZDwPttC+EjloRyEFxzqtqcqqjQUeE/1CNH
	 00o+nTTT/YsLecdlfYegF1gNRyWD4nS5di/Gkwp4MPqjZdKCKlg33Vpw4q6F2L5+G/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7tYZs96;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24D6083605
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA24D6083605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7tYZs96
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490f38e9688so245586f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184459; x=1794789259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=N7tYZs96oQb/Ryz4NJ3+wLdB8gJYPV0iNzi0rgwTg8Dg6VnhJLQB9NE7KBBYmhqD6Q
         axv3akcYK460vYrVrYt3Y8pjMRxB16kOVcf0K48qc42a/8TGC86FwwuNSDSXLA1hshxp
         XP5NnH8JLh/r0xGiHagFvOyQe9k2AUIS1Pm+4EFPEOHWnjDLNssuwbLINZZGdJZhmIDh
         kbRkGnA3vcUMtNJahy6FnKi9GjefzyQbTZDRLiSLqJFXP5eAwsWARsf6et9MsoIBKEzN
         cBe8CuhK7MiiqlUEWwipkjXVaoHzBrSnLgAUTUGXqGTOzI71CsQIVtEWNZdH6oir6Aec
         712A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184459; x=1794789259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w98VdCA9EtnwfzZZ4SHf5Gk3YVXSBdJ/uT/O1NuBZJI=;
        b=h03+S8vunqQ0azhxmbXvJf6mnmJ/pboMI4bOgK+okdtR8ZkoJ+rH4p4ZzISbDPUyMf
         IrnvvEZeMJaXekSZkpRvXwtMqE4HJ3DusfA6FCx0W0rZHTGaQT6KwmJu3QhxW/bBHi19
         nhmqAsNLnpZyaKZ4QghCNB8uOsmn0NT8GwQmSUlrqe9k/rhBm6zct0zahlXeNUtD8PIB
         DnyWK6hGaSV12c8Ad20MJOsvBQx9srgOMCIMhQqstGPwzRdqSgMcSLJLMuQe/bzZ5Klk
         xILlxDS7yv2S1U3udaczz8XVh7w1BKA/MOSsftAbnZyFDdtfJsMlTE04OaqPWh8tkCVL
         wcpg==
X-Forwarded-Encrypted: i=1; AL+hErFqOiOROr6EVJ2D+zGmkMnEcj8kJcb+YjgJXr8EgIcI1rsAnTKbA2m4m+Zszf5Ul9wFhiSq+rcejt34ZUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5F3++cKWpwALS224fweqo1B849h5B9kX2e2sndy7ZRS8ao8kD
	E5mM9znQxQ5gyOC1BxTHwpnrlwRI2+wBoCBMcPN1W2gV2juIC7YAz3ZC
X-Gm-Gg: AYBFou2ObByXmMFH0PtGEPeZArJ+yZET2pH3OPlhcIRY00deDCB+mNHUN/NBcysAp/D
	g+E0SXFTnaye7eW+alOBpdz76Ho88tK9tVjoJ/+qY8ae5LtZuwA9/uuZPbBVLzqBKfCrSRskM8T
	I2a63p5rfto+YLobyopIWhmhPwHNrEtcxupxENg+giqBdcpyIkWqOmsglZdaIFaiA4H4qJRDdXT
	nY2Hm0t3ASvhRVMV/GgF5Jq3HySYauu+5xvDptTUoz6RnrxiY4O+1Fi8qqcrnyIavuW0xQrDJO+
	2ozQpG3sum3FE5UTDlUmuNTlywwONd47Ei0U+6AXani2QV2eAcARZ/OKzNmtKaVT8ZmFjES+8lA
	6mVWBJGxm6ZmRo1tk1BYdpDkX71yLULLt4/VdsXrEvw+bfB+wMLJ8QhiDPU3hxJDVdTO8d+Ra6u
	lyEkeKxqhripQbwYkdo4F4QIIBkEjKmOB1CQ7SgykbO2D8FV3/5wZMtG5ZWNxYEw46e7qGVNmhz
	uGKar6GLvWTqIkBbUE3h/w/3WrWZzmkKXMypuFu8avpvAE/QCl1mkPslSHbKsuXes3ksUEOfQFZ
	h7iBLs3mPug+rDafFYB3HFoBzpCTEAH0LTNkl0Fz
X-Received: by 2002:a05:6000:2511:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-494248ee013mr10847131f8f.21.1794184459219;
        Sun, 08 Nov 2026 16:34:19 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:17 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:22 +0000
Subject: [PATCH 10/17] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add
 Halliday
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
Message-Id: <20261109-halliday-dts-v1-10-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=993;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=Os3dtyGi4Umq8bQ7AEz34h0NK9e+Ws6GY42XJz6qujA=;
 b=whHNXCMkWBlbyRe6Xqxsfmk8vbhGS1Ie1Ck2sCxfwGhqRMBxKE4lbZ1T0XWovH16DltXzjMRT
 ok60qvi/6qNA6DJ9tcvRYuZUzSKXMRRZZv1H2XgMMF2zBm+cXxEQ/SB
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the QMP UFS PHY on the Qualcomm Halliday SoC, which is
compatible with the SM8450 one.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 10435a0b5230..a42bba9b550d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -28,6 +28,10 @@ properties:
           - enum:
               - qcom,qcs615-qmp-ufs-phy
           - const: qcom,sm6115-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,halliday-qmp-ufs-phy
+          - const: qcom,sm8450-qmp-ufs-phy
       - items:
           - enum:
               - qcom,x1e80100-qmp-ufs-phy

-- 
2.55.0

