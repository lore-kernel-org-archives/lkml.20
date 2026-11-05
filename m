Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912858;
	b=GqMD0GjyGVkibwG9D2iHxGBykfvSdpomH60ez+tu6me8G0szuK+KKNVExUH37IuCp84n
	 q11UT/syCWGGe0mp8sNpOq4Ik77sAfekmg7Y0niV/lL/RAP0EP5i7OodattPgPHyfNnqJ
	 mdOOwc8PD9Z/tM8R69Yhtekp33AQ5rHby8ZM+DuJZbgx+7ZUgtDw2BPlMLtBHWIckoy1X
	 WTD230ASBDT2I5E2jGkUgYNl739/ltJhroKzJ0BudpyGi2p+gCCNle/jy/bgJfmDB2/q1
	 DDTKnV+gjgI1x0pgwaZ/2T/KLZKVQBLJKsma5e3ladrjaSwU+6fjhqIjQ2WWa70UR7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
	b=pwN10tyhO3dHUooyrOnb1flTiAH2+I/PuZr8RfoYqnR1YoWFiR6hjwCoCpGWVTTkNEP9
	 hry0TbYxMJlBEWVzFr3Q/cMrRLKJMnx6P/7Vl53Rvuhk8a5n0BHvbceqBUHLjWx8tTgKt
	 c6OsSDYpLrWYXXStd6hmRP3woOGQds2Wk3tyRt6ao0+zkZ0gIbzJxkP8t4Kdpnd7ToZOx
	 G8IIUCcoG70x0P21zRQYyg8k4qOFUhHTMtWb7I+SilkoyvSOQcufIwFwF8n+nwv0318vt
	 zeF+YvSAzT4p/hxmOZHoZsX8SGTikhaTyXRrycl/LHwZRL+xSVkAuigqWRknUDpSHJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLPNAKXz;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400AE606D80B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 400AE606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xLPNAKXz
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so182734a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912855; x=1794517655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=xLPNAKXz/+2OL1JIU9fSF/H9o5CsVHDfkas3Hk64JrZ4snO3WXPYSwFKiAIh8gSBXS
         zMgVGMXCUz2eiUONqXDPtuhTEm89cvnTx1g8KMBVQvAoYCOTcwGuMLtshO9AkGcvt+DB
         Bzrpz3wTHnoFKB/fnNdE261xbnPdVJNzTLjkCkjJ9cFS/kMSk82kIAp1Sfs+GDSsHP/9
         0OY0U40cNiA03aVAgOTcmcfhaSkHVm6Xg7cEjdgvw9Ev1aGiCBl4D5S0m/2GiY99S1+S
         GwYvuSPZBFPpmFUjyUY/bcDXlYkycOIALxwZkiWRdHdDWpV7MbDEuNPt3G2mcHJlDk9E
         1GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912855; x=1794517655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLyW+wsd3C3ATj3CVMuJf8KfUTB7e6UqhqMzErsAQ1g=;
        b=f08TJHkcEVUKekr2O9zVcbLmPPZoxASyZDZOntl4uW+y8Q+NYahvF1OaTaYnvgdX9Z
         fucIbA2L7SZMkPSYIzCuTQKbpzTRyJSjDQ//uSJSGSS8DtpNUw7fuTHph0sELnF7weFC
         rLgOaCYlyCIdDHbCVF1boPv1VrbQKfm1GtmoOFScIfkwFpQAd+ZtVba2nfNS9NDr+FqB
         1YQonumoIFDuAbYlk+ZLeM8XexRmmO1M/lKOSnV5YywHn6fMZmQ0nkbECgM4sDn8778L
         Q019atcjlxWKs3tLtX5++1Ozvj2OR01ILKVFjr8NPM9zlja9GWU6STHWZ1KLeLLPCIOX
         kZMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrxuUUqdky8ke0LUgNBvzK2jqgbuimydc5XybLNV2tEAMA73L7ii53oltzdE3VQTjmuW6FkrjXJmQWJSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DwjgioKmx4MgVgDfrD52fbhxDuhkZCF6vqhYD4ZtxFh2TeE82
	WlVaywWQHvf6defCZHx611p69TA0BV8/SNb5G8YmRcUKYOYdjJ9sNUPm
X-Gm-Gg: AYBFou1TSLPn7e563H/fVZIP+tMPA0BKRFv1oVpYWu6C/l5yprgpVLUs8AaagDAiPma
	/6Ejv6mQEGqncUBkeBc8fJQ4IKTapwJwCpzMn6pjUCrnJSqJpEvXPPO1+Mys6IsBP82sKTS5nur
	FEbrcc+raix85vruelcIwdRQJq7Ordpax8LwQ1AnhOitPhXWkynvvU3SEUSqdQUrz5yfx3NkZWo
	hPqO79QaOmp0D9NVqVbCYos4fcHTzsWN9c93Lt6SNmzIMk1kk3WPkq+T/ZaoEaTmMv1iBbr5hgh
	+wh4g3f+36sz/C165EWC3qu0Ah8dbhxMxMP0cqsxubxhvYYg2E6xe+4yWnPk03NbY0Ads3LfM9e
	8piXa0Xr6A2IbL+EmeQnr4Grvw8PhfloutS/QPbUCO9G80EF+9Wios4tZHhdOJmYcIzGS5H23iT
	+RSDa54anDOAVd14m5tHB9vrz4zQRXYt8pA3UJ95qEp6gbSUmNe1nurm+qg+PhrxaEABlM/yMyD
	vPxzc0k/cOghPcjunmeBOCVRwLKxrtfwvVOwAmgy+RvJf+7PSprwLCMkEhxRuWQn6SwgcRkfufp
	zxnYfOLkMD7/eFPbAwOHHnWAabxQxXnGzxbqFEWJdp1pJ39M3/KJgTk606owKkYYQHVnAwY=
X-Received: by 2002:a05:6402:234b:b0:6b4:bd6d:2eef with SMTP id 4fb4d7f45d1cf-6b597475582mr314181a12.0.1793912855525;
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
Received: from letov ([62.41.24.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d032sm1966949a12.25.2026.11.05.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:07:35 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Letuchiy <asalde.le1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zakariya Hadrami <zkh@mailbox.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
Date: Fri,  6 Nov 2026 00:05:59 +0300
Message-ID: <20261105210622.523747-2-asalde.le1@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105210622.523747-1-asalde.le1@gmail.com>
References: <20261105210622.523747-1-asalde.le1@gmail.com>
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

Add the compatible for the MediaTek MT6895 (Dimensity 8100) SoC, along
with the Xiaomi xaga board based on it, which is sold as Xiaomi Poco
X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..28180ed0e815 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -72,6 +72,10 @@ properties:
               - archermind,mt6797-x20-dev
               - mediatek,mt6797-evb
           - const: mediatek,mt6797
+      - items:
+          - enum:
+              - xiaomi,xaga
+          - const: mediatek,mt6895
       - items:
           - enum:
               - bananapi,bpi-r64
-- 
2.56.0

