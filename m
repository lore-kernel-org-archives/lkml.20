Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864414;
	b=yRo/IyLBK1sHkW+Nm6hN1TViMmNH9xivu5UrZI8uaq+ojTnKMKZFnVrLic8DpUmCnS+g
	 AAHetC2cbZGefFMQcBuvTSGJuCM6AIWUNmMvBLbBRL8p/Cepl9sfQ0WqtmuG8hxeQvuCh
	 cDmce30Kenx4/WX9AUwOVd2VzXRu2nJGnFrHWK6JBCO+lNKon23dVM6AGnu5lLZDX0yq/
	 oCTXM1OAEgbwviORgZbFxSQBODLHXzARAJy5TnRu+pMyU4nOn5t4TgRNhcThu/PmrgTJl
	 +g2wPPyTFhz/HrY4hhp1nd2DmhPdRLNTlZAqrCTrlVsSukRG65xEWYKIfPHyUROS3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=z6rA6NhSsSNYgmHE4HOWxaLACp76iCxEXmxTxg+43cL++46JEu4hMS9VXauwjElYJxSC
	 5bEKNyVkpV5rLU7J8592lvMSmpo0FE7fgL4QT7at8d4pNSviFUkd8t6QTt10pkzAL8gxn
	 n8ehTsOXNO85HfYu5RX7OExaK/kjxtFGZhsl8Ix7cxrcTEBorL6uePvoATSSGtXJxC3gK
	 LDEIRxTYIenuEUEYzyD8VgDButsLYlT25VwHHV7Ol64hwisCipMtHYOVmt2GhnYm1Xs6b
	 2hVBYUFPg0w6OrTZFrbuylpm0CWepeyX3h+4ocJPwjYGvmInlxJrdDgPA16Nu0J8boQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAURpxwo;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE3606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CE3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MAURpxwo
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso41038265e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864412; x=1795469212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=MAURpxwoicsksSVnc2WAsPB6JHUpT01pe/omkWv1cyD9LfvrkdfTpz9XI4PTsY+lD4
         SGrVtbMkILUcB8UlVxbff+5OGS2lWyRPg4+99wfZZJ3kK751LFxY/m8LTjr6oiMVus8k
         NLNpqxitTryKXQIbIcsKSMHDOxKylCzOFabOSB6t/1IlelEkuKnAU8DjjPvXU/qZDKLp
         LUS0foLTPneGc0r/9RGpT435PfWh/Tw1+g5u3NiaPw6KH3UroKGAVTBs+bDKLGIwpZ8n
         3wkffWoIIDLNuNqC9dnlPrAPuX1jUL9NxQr36U7VkPrRC2O736zzBd6z1/JXDHPc7i5T
         PENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864412; x=1795469212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=j+8pxD7ttwBEPP6K84SweJMoT9zNxR7fS3bab8q2CRUAUrSW7X8Q9v2jSJQh5M+iUF
         HoJD9ZwodgImUHpVEgJ9KNWCr8P7JH6tEH+q564EpcY6JIihhqy/peH7GyLKvXlqto9J
         qyrABOTGHwjwqPKAExob/q0JDS312RGpH3HMQWTKh1Ye3jTp9Lk4HhNut2/nA/XrUPC4
         6AJZ2VlDPwjiJ22N+2EgAEURB95iZAgI8ts6mf+zkQTnJGob8I45xaBPK0ykOXNp6mdO
         m3GwFpvRvc5hAzrEFxlglP0Xy9JxOJGWPYa2li6t9NfF0v5GqJjA3+v3Xa4GXyKhEpNi
         +3nQ==
X-Forwarded-Encrypted: i=1; AL+hErFc8mFzzZ7KSBl/Wnwl67xhrVk8ZHVkT0GEqiaG6M2bHHQrx2tCrXAht/xxw2nzvmmEo1tbcstYby+nK3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C8/lPMRm9yw50RBTZap1PNrVg41dVFn2ubMxQrD90tYiOrjZn
	kmm5sH7SJPQhqUK4E6L5J2n8DYycQGKooTjJvBWinwC6JIGHwWSDp/qj
X-Gm-Gg: AYBFou3+KYjf6bBJJ0rRFx5qMj5hbl3KvL8dm3yKf/mvzM3wR+k0Y+aofN7IuSJtOC+
	0G74ojtQmUg50IHOHZXLsD6gM9SY8CpcgbtXjJi0d71z2REERwLMk1LxR86XmXl1m/dp09EAZo/
	9hurvJfLprAvQxBb9IkxekmYlB/4ipmlezVgZWkHoOfDtzI0RLszyreaA8+v/XXGFs5PZ5abCHy
	syyqU21zaKZmU/MEN520xMHLo4coE3mwUbLSqoeW6Dp8kVEVTaFniZHjEIdbDz2I0V/OBonkcMh
	32KXE8IJWWOj37x9hcqkvkPA08cMRB67M+h2xweROa5n/I3vxGyL3p2u0s0FbzbdHc75hAmdIqG
	y+nb5vbymvV7eEUgg7WkbUHgwBqTfUuKhBOtF2r6BoQxHzhEqTOhPnHFXCbgawvFqc3HRRM8CkC
	0zNlNsKFl+Z7ZbkkvdRWiuYIJjLIWKNRITXtmceyrghDPl/EqjZcL937R9SapVr1xzPZwthCj1i
	q7ZAgr1V9Rcy1JawIMIqImPo2fiyxRA9lrY/CV13cbA81rIqeugk4TJUh/inBFfd419JmXP4bJd
	1U7GnFTHSXDHpJJmO/PEg+ZjZEgnkZZMEakQvQJW
X-Received: by 2002:a05:600c:3d92:b0:4ba:e7:ef3d with SMTP id 5b1f17b1804b1-4bb559f7044mr243891145e9.1.1794864412296;
        Mon, 16 Nov 2026 13:26:52 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:26:51 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:19 +0000
Subject: [PATCH v2 03/16] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
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
Message-Id: <20261116-halliday-dts-v2-3-2c92438c6c46@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=FqcgSljUbrxAce/Wb8/tWQg7D8BxyY05VfRoM3lIlKWOtWcZxkvJ+EYJdvTvvxol8FPPRApKu
 mw5+dUw4O8RDXBA5aD2L3Fg9fYj7OF5FtJNOsGNYBuFx4Z8h2/2ns31
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

