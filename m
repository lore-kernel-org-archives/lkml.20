Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810732;
	b=wqsCxXuQpwvTd5E89wujmybbBx1N1xTD8q92DAYPt6EckTjsVKsgdJ+E/2ZAD6Qz+U/t
	 xhCw79snka66P7snDV3gQHyUlbdlFMlcxvklLgG7J/G6Aya49fl2fa3XoD8FQy/8xM1mq
	 6qfNsfoFJLFVQTgjdvitfF+GuLFZD2gu37qeSw2D1kdNTFuQzeFySNpuB/bn8SnzrDW+O
	 /Z4hR8M2jWHxH/JQ1V6VwjQ3hbUFB+z7ZZEy56MgKF7CqEIQG7WlD2opW4bS4bcQj3VC6
	 4dyqipLzGsU5bMglH7oEBi9spHjJ+od6aBcNd+MvpOL1rvgMUbdqSrJQjhIeFQ7mv5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
	b=zeRVZeR5OJcSMcCDtXuUGKhDUhVpuGYMmmpOz0Lh05ioiKTITvkJNIsxFsbJqPmlooGU
	 dTp6NFkrLbLLMDd4f96461v6+5IC6el/g79sP3ItkIpLoh6mR1HQo7oLtCpwYEH2GJsAq
	 yjPRBxKZye0sDtJFPxCnps6CCjCPvFlpHRRZqDjO2KPD28WDoejOy8VnaPkq/MuT158jT
	 lUUF4vLThvJImn8mP+UQpBWVxm4zoDdjXKPi94A6Qd1OdEdSwvpQiOqJGLNDvPkoPjIpn
	 U8VA0ZBxlN6og18RNYHcX0NTHNbD/AKJLQAXrZC+/PZT7dLGKG32PXHcdGLy3bY52+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bn/OceYF";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4AB606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4AB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bn/OceYF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso1506166eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810731; x=1794415531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
        b=bn/OceYFwArPyDFSPPPx6F7fxbevCxKT8R7FeB0p2fbvIf+7OBijoe08vy0rwYc+5G
         /QZBWvJuKv/UYxDHvFcwLo1G5AofW5PO7IZT2FC4GT2O6VrxOvu2JcN1jB7k5hdV/kYN
         fS38yTExWUTJGvZc8YTuWCR+sxiYYi1vChhUP2aaBrFUuS7OpBt8gd/X4hXLV1RRI5mO
         ChyQV/5HOvlWE8Kuu1Qu8f1m4wzI2Nu/JhSro6UmNEX+Pux9AKYWt89R04k4H1B1tg0q
         BH8kBQIYND/ACmTt+ZaioNGqcPPB4bwc0yDq1hYXQKG2B83ZPSN2qQsgFmuGLfJUj+QH
         xj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810731; x=1794415531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/9ygPAkTkEPoEGsinPiA3vfqnT3GrgOWJ1i5yM5FwM=;
        b=MuxPzUPcEN+/DOl+nWax2ltfny0EAMKQkmiSfvjY4rEu9kk0LIRimyoXcKikO5qoam
         yIlqrWDhvU/Jl/AklO6yz1cpq4cZ37HSUBUWnCk/aUU3wHEkGq6hyjrQguaZQ6DbFhGm
         qCIZC0YkNgpCxtEiYXABWdLdV7AUypoj3WFlyHpYdKgRLzJUN10CSnaz3F8CbJ52Z7oz
         +st60uxMMJYlb4bNDZ/j0vskWBisQXI5CUzx6AqrwN/KeDoxuX/Isyt1B9ILwA5LJfXt
         +V1Byn6g6D5AX9bRd9All2vAKYJMYHEq8igYTYOcX3zsUfyddCNPOtIsRG7UfdplXUKl
         QR4g==
X-Forwarded-Encrypted: i=1; AKwUvByyu6hz6JT9VIf5Tbr3wNgY9HJq7i4Cc1Gpz+oW+wlRpMQIyyn32dF0/KxV2HFDv4WQKFPShb8fun2pKXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mCrzs7UCFGgoNB9m05npTjzkjhOlpDBiMKWSk7njhi3Pbtk+x
	ERHqzGyhvVNAPzK/YKq29/apZYuFutrldkNdl5EuG2ail+EPNdAnFequ
X-Gm-Gg: AYBFou00Gp/chjRZ0cPVTwkaUnXLxY0BZydW+7uMbVG6ChaeI0SCH59nibI7kdwG5+b
	8Nqvs5ITiuTOfHcUnUqd/EaYYXrRcYUB8c7ROrmszeS0SgPqLK4QgNrXtAvhFigIkulgaUIQC9t
	l/fEfOQFSSyphce4HnIgG0WLg9tU9k3PQcon9WmdPl63RHjFaLCT5u7AadaHt3x7kdFKaLsJGXt
	S0A8tpO107e2Uq1Q03GbtnYYd9hQxOGTevHkeKuprOGCEFDmUlhVAUeF6aUBFl0bNbpUfLfC/KE
	6Yj6XANilYcXkHwtPdkx/v+UmH4nBhuNY3NWtCEhIrIfUM8f9DPB6gyVjbBg+9rDu76PxzXa7ew
	pWjG0I8VTreePRdTX2CQL4GYAH+YBaa5XjAHK7r028gcnoNJJJwNEmzNiU0QrlQ+G0+SyVr27Zu
	z5jOkoo82VvZR4t9U9u+JMxfX2tbJ9zc78p6TgK+6se51eX9Q4ww/7YZu8jvMoS1EVeSnE4dZJk
	k0OtGe8sB3Xv/rmDCtrxCsmrZosy7WaViIgc23618yrR23c4rMIISj86sHrwud2QSbj93ripZz9
	mjwokhr+1e22Hx3bXB/crp+3TfAH5s7mYuydLHl45trFhgAgGpI7bAnrut4NBQP673vdAKcOL8/
	fnXzcqc57PBQgqk2b5rzqXIf9Hv3QbTD/Q3HF0OpZgcpCpQZt++5nGESklm7jd+/3NM6SnATnBU
	f7/zp+hS//ZeslrZQ+P0CBwT9uLxjCi79kWqqF0OKabw==
X-Received: by 2002:a05:693c:4154:10b0:369:f4d7:19fc with SMTP id 5a478bee46e88-36a424988abmr28669874eec.41.1793810730934;
        Wed, 04 Nov 2026 08:45:30 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm10368825eec.12.2026.11.04.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:45:30 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: xlnx,zynqmp-ams: limit external channels to 30-50
Date: Wed,  4 Nov 2026 22:15:00 +0530
Message-ID: <20261104164510.105359-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104164510.105359-1-kapoorarnav43@gmail.com>
References: <20261104164510.105359-1-kapoorarnav43@gmail.com>
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

Channels 20 to 29 of the PL-SYSMON block are its fixed channels (PL
temperature to VCCADC), which the driver always provides. Only channels
30 to 50 (the differential input, VUser0-3 and VAux0-15) are external
channels that can be described as "channel@N" child nodes, yet the
binding accepts any N from 20 to 50. Listing one of the fixed channels
there only makes the driver add it a second time.

Limit the child nodes to channels 30 to 50.

Fixes: 39dd2d1e251d ("dt-bindings: iio: adc: Add Xilinx AMS binding documentation")
Suggested-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 .../devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
index 3ae1a0bab38f..0872f5f314c1 100644
--- a/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/xlnx,zynqmp-ams.yaml
@@ -160,17 +160,18 @@ properties:
         const: 0
 
     patternProperties:
-      "^channel@([2-4][0-9]|50)$":
+      "^channel@([34][0-9]|50)$":
         type: object
         description:
-          Describes the external channels connected.
+          Describes the external channels connected. Channels 20 to 29 are
+          always available and are not listed here.
 
         properties:
           reg:
             description:
               Pair of pins the channel is connected to. This value is
               same as Channel Number for a particular channel.
-            minimum: 20
+            minimum: 30
             maximum: 50
 
           xlnx,bipolar:
-- 
2.53.0

