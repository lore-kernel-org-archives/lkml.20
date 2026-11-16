Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864452;
	b=nZbNCudobAkMJGvciQG6UHagySC8JExTUIRIOZVpPyKDaQ6QA9QUGDST4buWRscFoAl4
	 Tl90FUc8uyNyx4CBWFykUEkuqeF7d/a3Qun2yw1YTTwto8dsOKl5X9TSnQ68lZFhqyqaw
	 Iy1KotJiK4Z4dRbnBGLSIGOh56CHiCrqESymEr01fgUJVYSuskmgGwWSPF8+i/9f9Rnjs
	 DktBkc13+k2+PqOJe5FEFGZsckieOvW1uJt4wXptMqUTEdnwPIS1fg9qiMreZ8T523k01
	 dh/13vqEBeLS2W4F+5upWYTvX3ExRIPUXeQ/RMnM+vDmYG9SbfX6NpZwi1jhjatd/XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
	b=accJVhWdns0Az3e6g8ZreEZYht6r6C+XB9F1TrUvVq10IkSpNBgfcFSbn5BPs074ofh7
	 X9xFPVLqLs2otUoJYVgCjkjduY/yKlMAjjorbDop68ETl05glS0ctDqqJ6DPW8zGbDxUJ
	 Q8wQPZw206B6VIVJvWHRzAQQAOS+yQJ4jhIi4awcpzfXFan+kKVBmnIDp5M/ItO0Ij/HZ
	 B8ahiJ20OGdF0HBUEPmns/1Ol0DKoEBzNf0MBWAMikhxjGwShD4qm4QgEA9xHsdpDUqAw
	 G/mSOvI9qsVwAMiw6ZrkQyb17c2mjAHupl/O0GtFzRHkX9GBqdcNHfd+pygoH4/kSpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BC7606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BC7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pe94GAJI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3551400f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864450; x=1795469250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=Pe94GAJIWEr/y+mRBwb7Iog7Ajds3LL8wRIVBH/8xPQNrjbBDNlEcQCn+p1QOcbrOV
         bH70aW245d90T1wUfTfa0Sb1xipFO0e3BL/QPMT4jfWcMzOuboVOx66DzI97tdUkpVn8
         em63v1WpvLz1xDjpzkqtc09ikGmguqMkXF/iBCSCrH/7rvMJVikSjBvdeaH+nfm2b/iW
         Hjkp5FslDnjSyufprS3LahKBu44fJFSHmzAIkvAgbVTvZCwJLs5vDW8WjGCFxFP3mws8
         5H88Pj/ByqUxoJReDfmjknbzv2qH6Xj3kHe//wfRUbrzreMGjXoGLArpiGQAfFxpX0lR
         wpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864450; x=1795469250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNI0IawohcjDnjoicCHviRRe2GFEz6OyLASUQR+3Ovw=;
        b=MEO+b785amv2jkM/rGbb73xCsceUJTlPdn46+oRFRBFHBZ7nmELG2MESnm65hbFF4M
         rqbd4X99S4Mp024ePmpZog9QrvQs8hAeaQW8pNR8DeE+LPxppem/3SjF1wmrKKQldqbR
         VdmBXIEFsqEJdwpPVEFRxuKYtMXhEbTIV/HPNptPbtOLWw4LvjBULTGCnBpxWlQvGxqM
         YE49wcWpRlmnbjzxGzSPg2wLFfK9Kd1ej+rNSAFpOK/V1UQUrfguKPp87D1RgXZEb1VS
         mFeAr4d8+saU/b21+sw4shWbN634ZwDrgHdgokLNI0i6a95rqOCuUzw61uqDkb5Fiq55
         3w8w==
X-Forwarded-Encrypted: i=1; AL+hErHW0aKk7I3mA2XXCJRaTGin4xAwsYveQgLCzccHO2b7eKZoHIpxhxcBDL6ShIAO1FZgVdHFNlBl2pG40f4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EMuNmc8+XL07Wft2pwWeiunCppejTsxU/EkGgZScDLWLyooDx
	TH0BxrkZSrKjt0FzyRXRUpvdJoii2zPCtA0DzRlOYh9yTEjVDZcjcT7+
X-Gm-Gg: AZFdTZe7AQrYjZo0YQ+oTGETvIeHFonQtJk25yJsb25B+Rf3AR437GcVfPVJzgF4M68
	0+P7key2R6mNWyoeMpab4hj4S+2qROw0oONXs5FO1BhL9z174EbiLGFBaFvO6Q/escHIjfaxWeW
	kCGWQ9Ea2YL52/LKMtS+Sj/6IfgU/x1I/hcTDdS+wAZ6WcrzI4tsIRDykG+6CQ5slkZJ3XNzvkx
	o7j5ZkxQes9YwvfIsxCsmew+vg6ubsVqy4dlxvXwMDgTJK5s75EZNU81n9HPbqlZBWT5Enki1u6
	T3TRT9CsZZ1w9Lt+AZ+M6/EE5jdj6JwnC/6/fYk2G030LIEuUCGmv5rctkY8zKm1uXn17oW2bkk
	8/aSJuzIR0M7Ki+G++scYWzad6FC7UGcsxPCjU8vBZow0qJjeqiQ0foVTl4jSGabA+OYxHEekJI
	4Qyj0KWEqQWqyTdDLA2OdKa3XWWH2rNDMhD6zbLtdChtAHv4KMAtO7pptBLr0cnzMl6UGRq12Vr
	tmqhXFX/fdXGm0hP/k4xza7mC3wbLUXy5g6aP+ZIM+Xn5AOiHv8hqoNfHuwj2lcJ/QVGAbwCk6a
	NgLWvy+huLZ1GtIzgA7lbSSdyAjEEQRlz0U+DbQL
X-Received: by 2002:a05:6000:1a8f:b0:4a3:8b21:51c1 with SMTP id ffacd0b85a97d-4a38b2152c6mr1214677f8f.53.1794864450317;
        Mon, 16 Nov 2026 13:27:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:25 +0000
Subject: [PATCH v2 09/16] dt-bindings: crypto: qcom,inline-crypto-engine:
 Add Halliday
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
Message-Id: <20261116-halliday-dts-v2-9-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=921;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=LNBr+b73CKCaJq+Lcoy2dBwwEKE3EuPIoRzvD97HKJ8=;
 b=Oo5JC5eiOukaaqszf2JD96qfK1gjo4Z88L7lhFkJnmKZtf8EiRQqPApokWBgoFrRDRq84oEys
 dN0aV0Wol0LDOOw0PtPKsKDeYZp8RCTw6bkJAf6hQZCCV8VanxNS3ZJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Inline Crypto Engine on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 23bf98c2b9fa..1512fd1d7471 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -14,6 +14,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-inline-crypto-engine
+          - qcom,halliday-inline-crypto-engine
           - qcom,hawi-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,maili-inline-crypto-engine

-- 
2.55.0

