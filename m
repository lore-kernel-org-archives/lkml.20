Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864436;
	b=unLukXtZYc1QwQpnDxqPBkEcKFocbIuDsHzZKAho+epe9hHAVEuWIoY4Z0Qy2utTccnt
	 aiebfz8pVVdRK/HSESjx2ztVvKxm1l/xBNzD3vofw+Tf0YZX0IL1b5ImFwHL23p5UAzIP
	 PCk4FOYGBvttTULjH7wtOR323SNFXNDogHALxWtB+hAki9EMTmlxftW9HtTqtaZGWdPhR
	 Kosa3vz2QXOKXTbD/cFg9fs0Uud44iBg+BtP5/cNG1l8bs99OLEdFfay65BvaV2enarfN
	 7w87ofb7Mbz+xjLkPK2LQ+MWGqJGdtV1KKOgcqvFcpHDjq1IFLJ851x2h0fDlAu1Zcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=PwBPgT4iDAMwopsNVei9VMxIYOLzhJhCgxolbXcuEOE8XV648yN/1u/F60EGJTjmgeqF
	 4+heh4wNKM7WgsG7m0p7HMT+fLWUD0Ra9hAixuhe5HFMU5DA2NC89rqmG2/N5U0yrdkeN
	 QNXPk1rLEXEPD83+E9cDHklC4+FZSDTuWmq430XD1hMaNp9YmEupQSq3F4xkhWI49RBxS
	 Jps21N2MHJTv/KN5LDAZfIe3G1JkVnxyH6JV/IebllbTgsb7Q5Y1jTIjbpaYF2uRlgF6U
	 JYpDqUnsGGhOE1flQ5NPfaabpS0iA+/Kb33S2WtUoEFTV8d7CWT58nfpxt4Zbk+NxDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16518606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16518606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P16DvILv
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a357b1c649so215173f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864433; x=1795469233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=P16DvILvAkJjX6pET/OY1y6yCbL6KHNvFmQ8Vc5ms2Nh4pBtOsH5swOYSMdfoItM4b
         t5MUV5RS8EsfFWLaJSSS5E70h3/UCARtpvqtPXICi2MnbVDPa95XtCUmcFtAYjMi3iD9
         sCZvL8DZRUZv/G7eI4SHBKPuYPPoNAExEKI30EQbOIauyxIQR0kIV/+D532rj4kB4ZjR
         LbaVAAYCUUzAIoRJt6nlQejAo2Qj82puHxbZwDW1Fa8tRWYcjQNNMrBV4t0c64r9Bq5k
         XxoBse3bOdVc5KRCAVJVYP/0nrxUtbAZayRyyja7hKGad0rPdK7UrkQNvPW9f3BimHA9
         xUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864433; x=1795469233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=wlBSQ/E5BBbMgW3bQU2XAcCkJujwTHr1dTJsWprmuL5A7q5dlMp5fRhocRWyjhkxFP
         n5k7sz2LQo2EwkIfUhPErclYBUE0z6SayNZib/3C7FOjHIobF++J2rQIohvzf+UN+dp+
         G+DsyEV8fbSGFAfgx+S/Yiw0cuco27udkh7XuyT8rEB/fIQDqU5AQtMgb6YGfCyp1Z3+
         a9+Fjq28CcfgoN0PkHXJYCqEIxr3R7Ph5y3TeNpBR5M/gX2viV6K70tLVUVjPBrc9Qhp
         x9gzHUvIXuEH+oCLeoQxr9JmFixvgpCBdWLXe8Te1jwiMvf+K4lPVTDNc9AHevo3b84/
         dcFg==
X-Forwarded-Encrypted: i=1; AL+hErGGDlSaxpIvWYNVsioS3s+yjfMdaWl4dJX4K4ak2kV+9TigVnKBJkDrlhfD0oxjj/7m4X4WWtWPUs3hTEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z92k/wQgrZjmrdxd4onFoKi9Hlk5EFcbd/etnSn6B4y5g04XZLy
	Jk8G7HSeYFu/mjvBGvRTxMEeM+SKJSAdDT079FJfSlfFLTLVVtMkPDp/
X-Gm-Gg: AZFdTZf7Ce1yzxkIjjrXwGWbCl0HgHj3Yf8k5sHBWEvoDjdioqk8ejFtp8qOLRQ6uNI
	9tAfgnI7z4CJLBcdhYSeGFSKBIKCRG0YzJyWUNr22vNkBXtrF1VYBzqPKcf8xq+O9b1FKaD2ZWM
	YI8Z2/a+40j7Vd0Ml2KB35yW8c2OqCMCpkhO1p8WuTZQbVPns8JNjN7KfjIwFntpMsKl4xe9Y2F
	gUDIibxeNRAC4wUaK7Y8UL/j2TXHVNoLRayyUf04xCHjberHM4JbZ2jHAjeGJ9thRiD7XLg3yZ0
	EoNd5NPmYYcTlRvgfZ9Fkiku8+c42nSEZI4bKivHAYsxmg0m1RXoCNUtseSEe5njj+48GopxVyV
	sf+xAJqrC2IRziyTmKxkWikGyaVc4/AmaZix61YqjYktxC+ESOxVARwzZ4yyCMsHV6Ib5T47Ikd
	UsznTZSK9/6CO/WyqV7eN9Lqh06HF4ZOtV6xv2UJH499CWyfBqW7kcSH958cuAky7/Bo3bFUpuB
	fdiI7ev9aHjOOLwpvE/7nxa3JkOZjPj+YI4ER+Q7m1Ptcdm8sKOlUsDibqTIu9hHKl1HAB89bOM
	DAkcSBm6MrYE0CIDVvMqbzAoudKBwG/taLQQJDoG
X-Received: by 2002:a05:6000:610:b0:495:5c83:51b9 with SMTP id ffacd0b85a97d-49c7467a893mr27328310f8f.50.1794864433590;
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:22 +0000
Subject: [PATCH v2 06/16] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 Halliday HS PHY
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
Message-Id: <20261116-halliday-dts-v2-6-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=XlBnHuuXKSsmwBoy79zd7CM/aQS0V4vz73O5I/ykrhOgY3nFJG4rnY0qnm4zfFTA5sK35VFT6
 GeLVT3WztE2DdDA/hh0iSPFr/rHt5tVJ5B9S1do1YbNU2FqHh/CJpdT
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Synopsys femto USB high-speed PHY on the Qualcomm Halliday
SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..8ff1db4a1d79 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -22,6 +22,7 @@ properties:
           - const: qcom,usb-snps-hs-5nm-phy
       - items:
           - enum:
+              - qcom,halliday-usb-hs-phy
               - qcom,qcs8300-usb-hs-phy
               - qcom,qdu1000-usb-hs-phy
               - qcom,sc7280-usb-hs-phy

-- 
2.55.0

