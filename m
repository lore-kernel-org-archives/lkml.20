Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184427;
	b=rv420nGtxcQ70qpniTVxvnIhwxTqDloXi2PFPqxRkuZzv4bPLB6HYoyiRYSRxHdGfLUz
	 BA6mdBdzU2qB1s9CJWurJ9gvKcam88iZR9aNY/TuHvIu+KWFmasAK60H36ap6LqIki+N5
	 8A4n26oEmAonhDzHeK9zMy2QzZMVEDoQhEgp4dfAyPoYe0Y0dzpfuARb0E6kC/gyk4avy
	 S6yyeS1S/yOaoQSu1zfdm3hMND6JkS0dlEWHy5ocxcEh1JSXnkuGJyfagbi0BjvJmtbG+
	 a/9mf2+IEsD8stenTS9Sivd5EiNMeQFuusKo2ENFy3B2wS901AF8GYN6UFOYQQjyTxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
	b=feayx6fS/oIWd6oVvm1TmbdTy864dnxCj6f6nFsCXKf9bJdfOSJS2GgYqbgDWgiHWXwl
	 JnwJvVv9GczX7xYY5bfD47D0+YRcSnTG1zUceSeR9IxRqhTmIubooRbJFVcYd1wY/+NSP
	 7CzFh5p18/NX+5DmQsTKSFz18jt03pd5SN8C5cWe0qOttuj06WbZPl0wgMqlcmktLatPm
	 yW5TxBWFMSzE1rrjiOeERc4eOwdx0bH3qCdHGKWqSn2WbUtrGCEbGCD79Q2z4lOYaT8sp
	 TcoWOo1xo8LOdKHUrT/saBD2mIl1RlIyKaAZ+Whdcd6fiscxKRroWi2QH40TFTtbadw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyDzKlyt;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD6C606D806
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD6C606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FyDzKlyt
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3288515e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184426; x=1794789226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=FyDzKlytNlxAxLxC2gOdtwF1+dCkfYwbnWO6d6oPLIvthh1fBT5kqIqv3qhAxjwF+S
         PFR8nekUaUaUbx6CeF7ug3qsqKHwR/kTO9V1T4Gh8dASycorY7RcdrnLPeG1D5Txou55
         xgDbR4iPItBw5wvy3bOWz0Iyu/+OIfpLVhUWEPhctXpoFJ8gpgnVrNIaGCrAUOL0ZPyt
         NxOLj8n/xATQtJPIEPyzFjU842UmMjHxhCBNhBfhWuqVNq1zEGFr9t43gIXHmKQ8IbKc
         HMtuRXvOTX5bhQuwRu6FbfL0UoFdw7t7IXKyKMYwATRvVboP24aPvmrx5uB0BcbSe3Hm
         TZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184426; x=1794789226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkFPVfDx+55MAHBA3oCOcT0HjrgdVU03z1VGaEKFF3w=;
        b=SO2TcBsVCxIn1dCexQ4tis/6+7+Jr7NzLIrOnis8XHxUwXrTfbXsjdQ+N7HTcChxBR
         2IW3pdqQA2lPlYMCnKYliDgMAFqDcsuHdEuSrixvXxw8J2arRBukFrgOBFfKqQwx8Nkh
         TjyRh4Vbz11F4tvTI0tatu1AoZ/cQYbTpXPplNBhMkYoKYObF3WCoHztJajbbIIIKSRO
         uHbbG8SglYZD67AZIXaNWNeMB35ScZznIMA8xb6weRPefn3hPV3rAF93q30T8Jk+HpnK
         yQqy5IoQnsNvWea/zT8FqtLGBR+8ljhVnmmnYD9LhSdtQOCCfurA1X+fZFzEWZ2iBBBH
         16Qw==
X-Forwarded-Encrypted: i=1; AL+hErEs9nJ+7ui7tBcZWNGESvLO2li0NCjRl9Crl1uBIHM5yCApQG+MSfyqVD6RpXN85xELWLHy58HSP9nQUWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zq/N27BxKkw0zDGvSUtYxxmNWjj79mwk4Es/hw7kJCWgDXUjX
	GSwqlrKmDfGMk81WsYuk0HWPNkKwm2OUB7ZoPDQCWEi/GNC7KOSQVtdL
X-Gm-Gg: AYBFou1BrVlRfXGzY2CKNHnvwDdZJE3G56BUfIVTRdJq2t9Iw8QoDDT677jyrPJZR3u
	1c4RPl1QD8BuhH41IoYWksHeKXFTLxgmKxsS/7wwxglw0A4Li3g73vSaA1PKaVD4ngkTf7o3ZIU
	5bKod8uf8j+XTLFGMrsNPkYy4dk4HZV3t2EmgPb0woLAb3HEZTiLbwrS/6GguH4FBO24zcxiUsH
	rk3WQja1rvFj9gRI7iaxPW9mhWIO4ydv+ZWgJRE7D45cH1MU8M77U8v4Q6zeXba3kVK38ltHsKg
	XSj0OlBsh/hXA0R/pcSm9jpUrqfqchDSbOJWjvpDgbt9/oIUwSubFlvhYW1vauosjW3u1fusXNq
	5fE3gjYkg3Tb+54ulyRpVe6pWk84SmLnm/GQhQ4DKcujvRpN/BtmBwD4uVRBpzQISTp4MvheFVe
	PuCBByysMQWzgqxzekNeb/m2zz7JFJ/ppfbdo9vFkJO/36oc+0LDuCkHD638oiSrIpqS6bX9/xz
	TCeyyNyWKjkvTbF66IaWzP0I0InbWUiQrrHd/u+/yT1wnPdzOP65BWiLptYwTkU/a+zq7F1fN77
	Lq4V3wXmErmb2ej6LlD85KyY0mhR+X8GaXky9QFl
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr43372595e9.35.1794184425700;
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:45 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:16 +0000
Subject: [PATCH 04/17] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
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
Message-Id: <20261109-halliday-dts-v1-4-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1003;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=el/mD1li+25cayhCgWCSoEmU7xbrdbDdv2bm0vKCgf0=;
 b=AAbKZuaWziyLaKTlH3TAQLDLLUPJbQQuUGnW2/exeZlWjcPjeJvTUQ3Mzs5Xy0Jsi923+4Jy6
 HYpQrlT+Y7QBXM0fnEs6fk3DZfReSJNsf74HPnCiwzI9V/RMLtbXEW8
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Power Domains on the Qualcomm Halliday SoC
(SXR2250P). Its command DB has the same power domains as SM8450
(CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
qcom,sm8450-rpmhpd as the fallback compatible.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8ee1c25a7c9d..663baae9cc64 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -82,6 +82,10 @@ properties:
           - enum:
               - qcom,maili-rpmhpd
           - const: qcom,hawi-rpmhpd
+      - items:
+          - enum:
+              - qcom,halliday-rpmhpd
+          - const: qcom,sm8450-rpmhpd
 
   '#power-domain-cells':
     const: 1

-- 
2.55.0

