Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184451;
	b=gulA6Zw4eHqmJYmRk2F9bUDa5HVJdj8YwFDVufEA+MR+jkmLQnDKTJhveipsfjePKT0l
	 vdetkgk+bOZr56I3o5ZaDbKJYW0S3pF1xmLAjNaUSMuGzavLuEyqSJ8GXWhOkSTTW9icY
	 lvxLOI5dSet0wOzGiu1yYtW6rWVavuK9wzuV1bR8a2tPlMYuLvDh5qrfH+Mc63EwgJAdl
	 8pdfhYrxX38FDA9WcGFW0OD/ZwF2MIIZbq3z5RrnTJhf5RWTRRqFb9NPrhoQwnfzZo+dW
	 QArJrgMjR4e6zYPU/KQ9nuQyJYRv1nLIuO8HPjaz7RRXa/VkDUCI6JSEQYyfrFAMMtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
	b=zCHRRYbfEek65KQPqTWAYh77Wt03x4pqxE1g3vg2lvihceJBINhcynj/pJIr0tbm5HgP
	 +vCv/oJ2ULBWVfLCpUE6pG2/ChiUr61diX3E3D3WySH37FS7CIZuzb3btWcI5hBTiuXVY
	 PKAVtdg3kUwswAf2kEply3O6LCe1Msw077BBiWtrWECGyCcJadEjFSn+hsWp2mfN3MRy7
	 x+9938E5hYatBQgl05Mz8gVgZgL/vVzp5pJC8wxuZV7uTXGD4ZNQizwB57y7S0ayRwwp8
	 h341webOa6YP224h4pHy9XWwCsA+qOjj+lagbEn/slCXVM1F5GngYOuPhwmAP5elIvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSlqzKjX;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A68606A337
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A68606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSlqzKjX
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so2506055e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184446; x=1794789246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=qSlqzKjX/7sPDCZRvmng2Fd7M44NFkTn1QnTKlon15ILFRt36QNjsrqLJYYai8FaJT
         xqdBUzCmut3CjikZFdWRXcM18asXALumcNCoDZ8wkDUy/vLNU2Yu18uXCs9ENs9OPJGu
         nTOZcCyszK4wAzAPo3RgIbwzygxedCHuazWjHdx+F6NUU18zcCBMt/igNH+VXF7b6oYH
         qlTinMkSbUjNgaZL5pqDSb6HsOSqrLuMpY53PyfJXRmWyJcmK2xZiyNp6qhlx0aMWWyk
         XD5wvPWvs0D8+P9xSygLy6qITW/i8jKmud5s6HzgGS2nR4vlHSyW1pd61/CmzpTA+ZFX
         bwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184446; x=1794789246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GDSoMHQsxRWl9RceBND7eXD7fNs4JK2UCz+AN9Gniw=;
        b=oEHsHPSlvp1CwFAAUQPeVljj4zAUVKdUuE5HFn57b1dSjgpm2cqoUDgLk0YO1uAE9P
         Qd0GjLnqXuKmMLBuIZ88qaGemE31kcdyfIgNpYJ7kh+7zbi9AlIOi2/8zCcSs1nfsq0d
         rBz6K/XZGrjaymGb589Gk0/rG5f8frB5xS1jVo4Wza4cj4lPO4eyVXMVDPfQprYYqjfP
         wo1JaFTVMz4GwrLALuho3ishGyVLwTPWSrMH0XBNLZpnSTUsuOsr5TDZENJnxY71X9H5
         l5WhknaCCTLyzO2JaoeHBnwZ6hqRZkGa3XGTQA3dDkKhKIlzzYAQx03E6WbVZbAFZv9c
         4/pw==
X-Forwarded-Encrypted: i=1; AL+hErFYF29y9LxtTm3YvLARkpEBiIaPsWAmv+/kf2nAjCLYBKKdyjEgbl5MW9jeQHnHEueRt0EHnwFpyHWu/tw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/zKOog57V7o+osIi2xgiKuSNXQwPKjdpLF2bzscFHPj16DVfs
	9rkCb6BATcqv4DjihZW7K90wDeiP5QsbZWLdnduhcgAU7biEn/qr8/Md
X-Gm-Gg: AYBFou2FqXjV3rOrfFgY7yxVjY0vUwffwm4nrImSAJjh8k83qDTVZaItjxdF9f3ZunQ
	tMtgOEQ15t+uOus5YeKbRUN8C+ngYiayH0qRskmiSKo/Qh+RavHGk3CtVTunREhyF/RFeKxV1bF
	KeVVZsjpfMUe/QDx1a8QMJTOO4zeD1Dt5XLAv0WzWvbWR0rjX5LaH2qWtUnbHpCu6+oPUpym9im
	bXZeP7TGo8stCcIA5X9NB0x012Rdq/KDM2tMUii4OeUpEUeQGhqqMcq+A6QCIOeGW02KbNxBFV1
	cXZYSizRU1VIBYeBeFcxCpKJZre0B1y/V2cl9Ep3RIlVqFbXrIFBKXleYZMpHdwcmVwzpvXyjga
	oujg3FBGP8Ib8N9szSE1npwM6gO4/fwvQjg0qopFYXx9TygHr0JY6vKG8Ub1yxpWe2iEEnlPleG
	+3nf2STR9YDJNegy6FN9IBUBqlaxgtoMv2wmj8H2W9Lr81pZzcqRoV4BC0lpasu6yhUUGbeMKo3
	h8pmy+YhjoVBSS3Y7FrQeOZYXsKImD9p+1ujnx3f4W9skZDmMkYeTmlnJWEf3XJ2PxLIaf04nTB
	p2NV5zm/8+2yJO8qVj5Y2vYZT1DQrzTaiI8p8j9+
X-Received: by 2002:a05:600c:a010:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4b963ca3a7cmr51069905e9.35.1794184445733;
        Sun, 08 Nov 2026 16:34:05 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:04 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:20 +0000
Subject: [PATCH 08/17] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
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
Message-Id: <20261109-halliday-dts-v1-8-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=891;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=iomST/Qr961He4Ne7crBcxin7EtHuKLr8auNEsY1c6w=;
 b=4DxRuDlo3Sv6o3VM377FCKNLzrNNMHf6FsM5TYa93t66FIlBhCp/mgcC4QeOncc3ZgmuRzx3Y
 hjxDAxOeJv2BA5u50QEvvg0b3XgcZ1hYXm30qFoJ+yx+NwOICn4vuuC
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

