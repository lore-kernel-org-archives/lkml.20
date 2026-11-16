Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864457;
	b=bA03bQlXmwDFYqjdnCbyUngunVzyaF30csKag09MSsGzDvYNHwW85ukQVxcfeidrO+VU
	 iTzKj7rfpNyYBjdOeQ+uQBlajykLqCAg6qct3h6ty3oHZxlXZUfdEr/QuxjkkmA7hoYiU
	 LJgDbw91ff4l3XRZTJ20RO9WoLYvxuGuuJgokxHhjY55RjmGNheDPVgYhQvMH60auCA0N
	 NrRTHbhBiii+vETfwepaD7f2nKa81h1KAMRIIU1r/XoO8kkxRV4OVhykzZbcMTioJPQjG
	 cehiIxFwDGVps5kZ6hOQO2oDToJk1EiKt9ozUvppv7Ra5SfQhK1E+FeEOZZXcg92V2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
	b=qx0lMJUkv6h/TRmEhffvA7hLl9khUPIrM8bDW7MPH2utjeH/dDJz7KRF7AkgwIBuL/xa
	 OPJKFXIo07IyFFfDxiqvePUJxNypZ9zcOhXEBV42tu0mbbX9Sn0GNVPYy3vWGdLyZnbjM
	 59HriEj4MDqNvcYFCVZqjui2LC4/CJpNgEklpO0GFjNHOy+yr0v7sCUXkC9DrjwKrflBD
	 o1ulPYMzQ8Fx3E6xFYT+YUiaLbkIqiwEOWJsUdUL8Y0m6t9EdHNpr6Pzx//z84+gSXop5
	 sSoRDGw0z8IcJuFpx+KzKvgSe3fhP9HYvqMjgpIGZ1d/yurHWBtJ5BwO59muzxDpNDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEwrHomr;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B74606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51B74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEwrHomr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4246278f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864456; x=1795469256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=aEwrHomrXoLkAiILddo3V8DFgxCuIXh9nv9z9CGp99Mvv9q7rqS8WWfJjEVZyPKHzl
         BJcrzkqstHqVy4gz1/y4oTWYkRx+2g14yun07x+dBnVAXWbxJ6Pi8XR06lfkxtBvqCY9
         iLfFme7fheT+0AavzMAdfuk0LNIbBb4A/fuWyckPSLx8IQoPwrMmA2E7Ut++Patm8fWZ
         5Z3yyawCVkfdeHckJNnYoaWNHRgUbs68NL4nZXkxamHwG2zmOimO4uoTqxyi0KJ8H74v
         KgRMh5LPcsoko2D3/7aPeGtRlw0wksD9UiL+6PyQMe8GGRsHDiMrNoZmXU6ZdSAHjYHb
         hHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864456; x=1795469256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHyunwqhqqpQQZSm8FsYLG0nPatLuBc3TvD/xVa6m3c=;
        b=H7MFiykxHNBx7nfmFNe5Cv3PPjivbhKPdKI7eEkjaiPsmx4yut7aOmVFO0aKULIg6T
         ZN4CeeI7DQdq259XLi8TlYzHhnbmtH3cy1i7CXHOemLYMiRISKTaNI2+rxufq0X4CZpN
         Qj5v/mQK5D9SmZ6/DHV7ixXYNDvTIQyVrtjEbVS7uY4DDJ3HtAtwEr3KhGLEz0nAOqp7
         Dq37NOmKioUvQtsvLGq6HzUKdvqbz7P+VQ1g/NgeZxuWnsgOrnbhg2RfOHkdpU7vfz3T
         7pfH12W7jwMeT6aCbDOMQPH9k4s/ggSvYtsBf+zexJJmecdJbWI+PwOt0y73a+85qhcl
         Lo1w==
X-Forwarded-Encrypted: i=1; AL+hErGgQtXDi6yyrZUDGGxKYGpG8dWz4pZRkpL5Fo61JhwNobUMSH5IAELzC9EwA6qWo8Ph25NBehBvTtkmJTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I8FJujLL/c59bQUILm8lSHGmYXpaRFAvMGBQpqKX9AmlnZX0x
	oOOSWqOI6KD4al+EB+8cmpO/o5KzkuuV39acHUhtNRQzufOa1cEtgRwi
X-Gm-Gg: AZFdTZcKSHSelyt90VSnzVtE4G0g9qOPRe7lNxfIcCd/gCJBIPROeGPZq/FpzNMl1Ws
	21znB+BxuEc7/dMernesU6ZN0hESlNk0WzJU1IpmCsiMwbhSbpnwohrnse3uzKhILg+pZWq8ADP
	l74mB++joqFYAaeybJwrmwFG4/KFNpSmW733aXD4g7lfVtLgBnvMUfrQoVXF9A4HfGs+Ld38nrZ
	pcNbp4/gjza9ohF4yselpC7M4K80Cf84FMQJ47HRn1uptuSY48zuZga4niI8jNELq1P6eTGJqHT
	5xrcpRQ4LygH/mKsbcjhtgEsMwbDclWRiZPzbeABRdOdbDnhW+Frd7cQy4rkFagxZzkpBGZ0J/r
	k46NEu0fDfbOBHX9qZo50ZfAqzssxTN/5IY7mv5tOVDalgYMDI9tsgKilZDKqzBTjm7R57BJtzi
	03ZUhH/fM0OjuJNxFVRp1KIgJwou5yK3WXilSQIENU0eSmftyw4kYkU0/7SG9i4aOq1MzsHo0+w
	QyJ1uaSVHr52p2d7LMd1oW58G8j1UUTzq1uGAAHirqQf8cWNw3yAUNfxuGYCHISCvnEB3VJzUrq
	P99ow267KPpZ45hXBOdS2e4NzXi95H1CmxodF/K7
X-Received: by 2002:a05:6000:25ee:b0:490:b23b:802d with SMTP id ffacd0b85a97d-49c71d475ddmr22315194f8f.37.1794864455894;
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:27:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:26 +0000
Subject: [PATCH v2 10/16] dt-bindings: thermal: qcom-tsens: Document the
 Halliday Temperature Sensor
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
Message-Id: <20261116-halliday-dts-v2-10-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=829;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=QaX1Uqhi9JFBTyniSmrOqgkrx65fb+cn/pSnBpltl3Q=;
 b=9cBm/5Mi8IeF1ejOwJZWQD4SfyJ7BWDjVcE5y5kBsTodKh6u91I9h5To2Rc8ArYF4KPYJAO96
 griT0U/fTv6BDQooM53jxYIwB3vuzMj024ajCLGGuHNM9Pf4WE6Noed
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the Temperature Sensor (TSENS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index c78074fbcecf..3b440f395fe8 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -57,6 +57,7 @@ properties:
           - enum:
               - qcom,eliza-tsens
               - qcom,glymur-tsens
+              - qcom,halliday-tsens
               - qcom,hawi-tsens
               - qcom,kaanapali-tsens
               - qcom,maili-tsens

-- 
2.55.0

