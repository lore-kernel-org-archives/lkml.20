Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713865;
	b=B4f8d7/wwIFHbkqr0fV9vmzacFQ47XeDqTTh+aF2T5uiDlTjq4hcRdJacTIj6U5Y1F7b
	 YNC839mATFHde39FLzOVzdm26wyWpU7K4oVmOY/rQbuxLr3SV2tcjEy+Gx/hze/2fYKkp
	 RAVm3vYklXakEvKAsyS0oRX0Z6pnFfbcr0z2OTyfLMW1umQ0Jfn2OI5SQVDu75P4DOKRZ
	 is9bK59hACW2psopanRd+rkVn9HHXml9PaHhDqHxvMpr4JQsqdAByqwAeo7oQI0JpyvHB
	 2F1q3QGEiLbc9UCab34WyXPIi8FCY9aeblyNVfQHIs2ryzARLfpGFLEcTwPbkl8Dq4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
	b=33hZ/Jo1jO6sMOSpujc+rZ8rJGZRa+Ervz2n2bGZqHnaf0j1azES/t4yE3KHqIksmQdL
	 Gy2c4xVk4mFN5HlwNGm+iQPwFjQUHdnDDuSMPPwtnSjP29bCNL57JjKHWPAGOHFh3vu5R
	 NqDubmB4K/3vrZMP3Y5zqEqjak5tMtPbwMusmNZwUn2AAS9Gd4N4Ayif52PdylljAkkhB
	 hSsDx4MUOnJ6zksdl48hmHLcr3RQ8k5i7EU3sHAF2RHmedbKf+3pKFFeto0bEsL7KJplx
	 XoeKFhqmeQ2suNu29m1lrz74rNt1ehp5hgZpTWzkGX8TYBYdgEp7sTYQKCGlSt2OCMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fADzAqWq;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5BD6082BE0
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB5BD6082BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fADzAqWq
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so4267201c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713864; x=1794318664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
        b=fADzAqWqD4zUvJ80U2YuUArvszc6Y70kh+DWT3mFXa3hrhEkMQOpubbBpOKwPrn5P7
         DA36qLlzDfzi/UHQ985HwJcY5au+auPiL9oDfjSeo0ewNaraYF+liP9l4jbTAZQ/AsCW
         PTkoauBP3Zaiki9lnphrvAnF6dHWbYWfDF3zhOQfaR+WvbbvdmU9i8hsmnvIb/UhrTRq
         qwTM6KpwmAtK8KRtnB1Psj+EelNSsSPCAzGIFhVz1aG4aEm1qr8AyjEdjGnhR9esjNK5
         zVd0wKhj8Lke7L6v0D0ajWnD5fJZU3h81NP7YDUG+1IRQ4NF7sJi0lWJ+ZSfCe9QxmUV
         2ZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713864; x=1794318664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPDhSEdhh87ZnQbGrudXs4cxcaILOvv9vKy13A2WcdM=;
        b=qpVQvb2g1xdmoWRa3A5WjIyd4P7gl0vJWKQo+yQ6jzwzRGKUwAMWsCY2LrCCqOdmUH
         V6tzcFXUZNxPrhZfi25UOEq1r+w+ZF/0156gRh4tBKAhk2l0WOgFLs4Pe4PnEQsYlX9k
         ahOcBTz/Oz/DOmEBEdEptT4FxNGLuBL1/9EPpzDRK7Js6e8qOwnmU8Lv6hC31w0R41w+
         k6dgWEyLcpkTnjJD7QM6jJWH/hZoHBBnxiy8kJfrn4Jxz943iiKe3SBdmwn4ROxHv3Ty
         w2Ge+nhlTVmjfef3jsDw4uOyhbOazBTBceQ2FlvMyodm4cU11KfoQWPH/NBInQaMXIOu
         0ayg==
X-Forwarded-Encrypted: i=1; AKwUvBw7IY0QbE0x5g914gBG5GiNiBIzn2E9+Z4tiEWmjjQs4SdTBimn8qO0Dt6EOxzkWApSljQcmXOABmv/kDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z//WX8WPiZ4IdwYknBnxXDDIrHZYvB0uo2kNJl7pubzIsHGed4i
	uzMiUFKVbA8zdNYh/jJAEGkJAxIqQZy4ppJ9XXp/oiR6mg5ivzZx/rue
X-Gm-Gg: AYBFou10Xh5yxpU5aenCEPAlEBI12llgL9R9R8LYPOldmlafFmBCX2HBodLrF0FP9Bk
	Asc1YUGKithZGMW1KKiNDQ/L1YfnPiktLn32ArgAQdTyt6sU5p5kEXQXh0BvbixHTMteQzn9vYr
	EIvJ6kNOl6U34+RpVkGQNTpKQ3WqjzDV9aIKCcPglY3hXeYkpJD8pComk0/KUyCcNjE34BfGjA3
	1MOgXQokafOneaHRoEf7E//bmCiDrpqwOjhH09bmHJCu7+FguBeFor6lw7y05NYgJP6WKezRtER
	6kemz8u6Ydm38Nv+fTCDzATfsdbCpiJHYSJ4p8dFKDOM1A+q/2UA3QtlucILe+GQRwgVVFajejR
	FLVGoqxRsbBNeLh04GVmylgDTPzV0UuZCLCHs0NWbdUkP6qGPTWtcTnFkRv3i58fjPfVdaaEzQ6
	RLScj/bxz/TGJ3oWYPoT/N/MTjpRcV0behumx68S5NHqCeImfDUSA7NAnR7vN3mr8o6b0+132tV
	1iarnp6z/z0yZNyBPylyFzJinUWDPqaBk18mb0L5/PWlZNMmg59xyNDmSEVijPS57qsrY37pcgj
	LTWZE9q3KWECm1DbMzvHc5fQz+oLAVwCgwSlOm1LrWIS
X-Received: by 2002:a05:701b:454d:20b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b23b5bb847mr4423650c88.8.1793713863810;
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:03 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
Date: Tue,  3 Nov 2026 22:50:55 +0900
Message-ID: <20261103135057.1682-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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

The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
DisplayPort pin assignment gives it all four lanes for DisplayPort,
while the controller can keep running its USB 2.0 port. The controller
has to move to the UTMI clock before that happens, so it needs the
Type-C mux state as well. fwnode_typec_mux_get() only matches graph
nodes that have the "mode-switch" property, so allow it on the
controller node.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2:
- Use the common usb-switch schema instead of a local definition

 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index b77c02c64d45..14fc7e4ebc80 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -158,6 +158,8 @@ properties:
       HS/FS/LS modes are supported.
     type: boolean
 
+  mode-switch: true
+
   wakeup-source: true
 
 required:
@@ -170,6 +172,7 @@ required:
 
 allOf:
   - $ref: snps,dwc3-common.yaml#
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:
-- 
2.43.0

