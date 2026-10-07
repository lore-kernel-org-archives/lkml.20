Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E5C4D1786
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 16:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791392374; cv=none; b=naZNXfY3bwqhExAk4eYi6dSCV4K+sR6AqsHIk8XII1M8ODyV4ZUxX83gWYUrjq/qC5QLNuksaSKrYthqjW7m1RdsExQ4AvYuzfeEl2Y64Rv9vMKn99ROjQs6OFHXDZeKZuIugXWUMdYcBJlCddwLL7nIh6bqtgr3+vNF17/EF+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791392374; c=relaxed/simple;
	bh=Z+rLLrK6OAPFyZECPSb2YuF+nAqqG6Y/NbbCKPwZlKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YE5ZIs55rSEXh1OhWncc8ntj+Y29nA9B2C5EWDR0XCLTJ6GEa50SPiRr4pq4p+Pvne2xAxBxfmeRp6LSu78OvgG+swnp/6sDJ5JCiBwxQdkKh5rkl9/t2o6GHtDzQrYLRxdgUWOr888OcTsnx74DBC66gxF5ZTCrKAqZpRbfvWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g87bk6tK; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g87bk6tK"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1514093f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 09:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791392370; x=1791997170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sf+7K7Vn47mwcSJHOid1iW6b79xG37+P7VB8Mpvpf6Y=;
        b=g87bk6tK5lN5BD+0kthPH8ZRkbvzstCPF6tRkhfQbGbXF6GLybosisXk0bTTILszkD
         yrd/HpnxQPT0ZLK/23whZ+O9CuU1s8SctHgjBctG/mGvkVaouKtjoXXTsiFUY/7+ZMUA
         KuPexUxThJPBjd2C59nhzCBNMWuupF5zbKhXPKLR4l8fVJMCteZ5Iap+YvmFBlF2deAS
         lE9wL8myEo1nd0MLFoNzWTUlF90bs1mU537iuD7t0SvqWCkt4Sg4HTu82J6O/3mPvi8L
         2eFSMIhqXjg2MQffcLFzvPcwklx2+8QKt7Nh8VyLz/zFcUJ4CHahwHlYYuXe+odart3G
         e6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791392370; x=1791997170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sf+7K7Vn47mwcSJHOid1iW6b79xG37+P7VB8Mpvpf6Y=;
        b=DkI27ALKoBQXGU2eYlps/fKADxK4YsSbWGTPc44nyhS9Fqr94kKbHijXCuWk4qEFKj
         lTqnyMdI8tW+Pi7fWavnmo5Cy0R3ibC8Ft+slSmQN/kwBuV+Mry1wmQu7D/xPgl5JUvp
         Q6LthN63QMEcnS0YTaDRMwGEsI8xhYJ1vtWREHWj4oyAIfQyoUCRbYMFdjJ29b+d+Bxp
         cuX0dq5gzOotDGlmTG/bv5Ry6L8Cy/k+4p0Qe0MfEQjYnB/U+bOvRFXqwpu9gUKZblfU
         7tM2VygHhoCCR5hM2cjIzjbv3Z82ZCP9P1m9PdgZ/Ch88PE4EznWvYKpzthmo6iheXp/
         S5hg==
X-Forwarded-Encrypted: i=1; AKwUvBwt7IlNo2WOyK0awY+nSZnjMIiKgC+yBQqAuHL0Lw2qDUJD6QmCUl59PmyZ44ZsCOMoWExWBbX5zXlEKgQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mw2Sm162DQm8zieU1ylgtc5rKul6xS/SjQpbto4VPF+9s8DN87
	kYZWjKRlodBMRUTTwYRYmg+g5KGDNjcxMcibQOKFjdwo2io5wdobIsrG
X-Gm-Gg: AYBFou0pjSAo730OOV8Npjn8UQWqtleC1En/n6WzqtWoaWaI/NHSKYUj8TCzdW69Nto
	7XgsnLIDnRM4vLAplEXXplFBYmK7iGk/AcqQw3meji/DQcUo+QDqPGzVGOZIaCyUpGrOqEozt/v
	PLN6ZZ7vsfnrK6zENzoJZmOjVwaHXRWY8Ngmkel2GUIoaY00RLNCflE53zvX10kfhpoDAjW6ObO
	4RrvFbDNBx3KIxgAI5R4tqVSkwNAiWjiuNDq5YqOkL5IbGDJWjvAHxPBgv6kwdGKc0VBnkiD/zP
	GvoKSxR6NuZpdjI6Q878SeFNhAhh/IidWQ2aZwDN3jTr5cgH2mviMzmnS4vf/MCEQj5MwfaEgi4
	eGWV4banz+wReXSufDkxr4Q93LkiaC7w7bM0ESpDZU+2WgCOW97sbUSVPGcRjsaKT7Two32ojHZ
	p6QLsapMPq2NBKnMOnc5Wspgv3Hh2JpZIn0sar483bSjhqAVJfRUWW/LjiBcbd6fE5bx07LzAlE
	AdCw4yWUaSz2/LxTC1tUQ0ai9uHjwUhDJxaZw==
X-Received: by 2002:a05:600c:3e0a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a180455e96mr50949265e9.16.1791392369621;
        Wed, 07 Oct 2026 09:59:29 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1843d198csm4682525e9.7.2026.10.07.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 09:59:29 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 07 Oct 2026 18:59:21 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: ipq5018-tplink-archer-ax55-v1: add
 'qcom,ipq0518' compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-tplink-ax55-v1-ipq0518-v1-2-0ef058756596@gmail.com>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
new 'qcom,ipq0518' compatible string to the board dts file.

Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
compatible string as a fallback.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
index 7a25af57749c..49c4eba57855 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "TP-Link Archer AX55 v1";
-	compatible = "tplink,archer-ax55-v1", "qcom,ipq5018";
+	compatible = "tplink,archer-ax55-v1", "qcom,ipq0518", "qcom,ipq5018";
 
 	aliases {
 		serial0 = &blsp1_uart1;

-- 
2.55.0

