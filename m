Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793928587;
	b=i8JDfdtJeN4sLLVF02pTMgFb0ez24ehDJPpjINJUMjL6Spp5m5nNM7HQ6He9q5lsIS0r
	 cS89cJoW2mRr9jnTzjO4I5v15MkA1hbqTWJfs+WYXvIX469cA3uUJuPcjKYN7Z+cZYp0E
	 M4+TUAJUBKxg3uWs0GH5W99kSu/L7pn0m51hSSkX5aUwFlUMm3DVuBFTq76WUSsGBhYel
	 vT3ZIxNZa6VKKWFaH7xrtM5xz5h5xOuspCZGvHlD3DgNFF+YuA0pXn9xkGiRwGSjnRNmv
	 y/FPF1aVPqgGKU14N0QJsMPSxfBy+As0BGSow9oOL1oRBQt5iQ9Zc/8jF27iFmjGzTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928587;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
	b=MU+PNl2CxsX8c9WkKU1SVuitCPAenfqv+6lkw4+ceKEBxfDzTZbG986wiYKEVF18Gou5
	 QboWW2fqgq/Bo2wByZEtOgm9LNAMMt423vMDOMebute2AFHmGXGctebPOu3c9Go9Sdsj6
	 pY/ycO3bGJlUxpaGSBDpp2PvSxPMUtOU/yi52PhFiXeV5tOhjvZ5kO2kQQLzM3FFRbFCq
	 Ri/EwjpvXRqMsamTyjnUx2+uFZngVaEDo/qqS1N4/bXKM2FppfZDfUCZQIX9Tff5GRoKX
	 aUdoqALssshCmadDVm8kiFNUlp8qntp0BsJ5fPm/K8HZhLqRBudLFoIIKlSwimh/6yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hoPrTfof;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iho2DIng;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BCF606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65BCF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hoPrTfof;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iho2DIng
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793928586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
	b=hoPrTfofoMsSl7OeMsycpnEnzDm8UuZ6O+VLNIr1lzc5Ho07GhZX07cZpoUnZNMJRwjDe+
	//10HURb7DJP4lvLQzabDPTngZHf+HnpazDIbhmsbpxaz1YAdnbB5hNB3M1xmCCSPo6ZZe
	xtw+CM+CQmVoMcbQM87lHXXaMrORivU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-a60UGQrJPY-rOetzwIRTfg-1; Thu, 05 Nov 2026 20:29:45 -0500
X-MC-Unique: a60UGQrJPY-rOetzwIRTfg-1
X-Mimecast-MFC-AGG-ID: a60UGQrJPY-rOetzwIRTfg_1793928584
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5363b06bcb2so1813421cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793928584; x=1794533384; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
        b=iho2DIngGNdfMQZh0qNOEMMYiW1V/t002h3uJ7L+4rpamSBPxPBDs4WyVryBdpf57T
         sapTrt2nv2h58mAXaPazBucGKlMz5Rc3RxkRbsLXfqRkFxpOSgZUVGGwv/skn/yv7Sky
         bIaiddr41cDnJLSrnilYKoqSuqDYjvi9hNoL+kQzJGsnHtL9Za0/Eo5rD1q0kBc0HsZD
         Buz6JE8iruHMvymb309lVxbigeHaV6NCxXTUrx5VM0Gkjgkeu6gmJD9rUEUPW9cRRanS
         CDzmrQy194WgzZFsnTc+zRALvS0vRod15krWhRxmorw9YqMq/b2ZYZp7O4WU/bAqxdlS
         cERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793928584; x=1794533384;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AX4jtNNignF/+yCJApxGo0phvhtY6ezMkAKbj47wwJ4=;
        b=zXeK6msqHWEDePUIULaXogAoUMS1eX7kEZ0ayP8SaxvYA6eR9DV5gNBlLH/yd4ZreH
         4gcNQoWyCzy8LBEaMqf89d+WcmOBMFj3qYDJUrNEl9StvRsUfaphun/3g8NHZ+kL7deK
         59KREBmNikqGahe+Og1h5GyhF1yea9IbyD7sIcM4DmOLxRM0FxdjTDdXl4nHyuC2dlvr
         JPtfpqBk6zE9XJOevSo+447pf70B6WZbacMMyltvO2+6ocR/mNgK3c6aXrCIP+hXpble
         MqpkJtQHaL4lR6yy8wCacK5HNuqUUjnKsCSagHtfHtwHwKr+RKbPOvnsqGXzFl6nV2X4
         ATVw==
X-Forwarded-Encrypted: i=1; AKwUvBwJdOiLV1NfxUUvba+QJ4l8ccdll0EKXE+CNjdNzUfCMooCp9DMnBMKnXQZGZ11yGBjA99g2NfguFIrU8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eQ5LFnCg3jI413GrfYKKWvLCs9pA2ntZiIr/A0cMv+oMoCK3g
	WeR2HGQmO9cQ9BcoI7D12aRrKZS9dr+gfyKQDiO9rdAoeNHtbF5302aheGAaKOVhqRSXI1kc77e
	/mAfGGToH1SpNfL0eoEZuctlREgI5gOh4ZUVTtSuq5CXgcYchQz0QQIfDgt8kTeatvDJtAqWyuF
	djkFI/V6LIBHhwgR4ddN3Gjv/TJ7z+LFGjBsPxD7b/mu3jF2U6
X-Gm-Gg: AYBFou1nAXWvtWONN9Hpn59bPbblSHD4s7rBMLUKYu1d0uMdWUyybmsd6Gls6cbN06e
	v2+akvGOEVEU8hWrSDlbPuHE9Jir/982S+ny64EtGQWh6jaQqmz+pKwFprXn0YpaCKbX4r/a6cd
	HFrZik3s+1q8tnGJo6Yv+OjsjneXIyPZpfZ195lsCiocOz3mfvzpDRzJcAVZE0EKelukTiYubEC
	2Y1oNMnevKa7eht/zBFPKPQGt1F6B0bvuBHr3h1TFr36DiUqFceKu35ETtHEPgK67G6VHjVBvTS
	jZArDgnbfBOqk8zFFD+V3GLjwldpo5MfLo9+RJfcLmebuolx9Ys7+Lbq/UbukZUKmnx/A0UHMPo
	k6e5BrGCB8YbLUVOQzcPphM3wL9vTmISVIKaxKY1sKJYaIH8UR4oKVnkHixljszAPJQgcDYhlY1
	JVKCqLgvHLl6B4qMTI
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17839131cf.60.1793928584454;
        Thu, 05 Nov 2026 17:29:44 -0800 (PST)
X-Received: by 2002:a05:622a:353:b0:536:65fb:fff5 with SMTP id d75a77b69052e-54e1596c231mr17838791cf.60.1793928583742;
        Thu, 05 Nov 2026 17:29:43 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26f1bd64sm7404091cf.23.2026.11.05.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:29:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 05 Nov 2026 20:29:27 -0500
Subject: [PATCH] clk: samsung: exynos3250: convert to
 subsys_platform_driver_probe()
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
Message-Id: <20261105-clk-subsys-v1-1-993c474e7860@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDXRCsFVxKLawSBIByHi7orll
 7z3X8DoCBmK4AKHOzHNk4cMAzCdnloUZL1BRSqVMkqEGQfBW80nC6tsbrM4zoxW4A+Lw4aOL1Z
 Wv/2yR7O+BbjvB+zBcuhuAAAA
X-Change-ID: 20261105-clk-subsys-d2d9d8338ca2
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=7ycUhYaTHTijLETgf34xYgBmPS7y03e26r0FoL8ptEI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLe6jZ+3Syw76dB9vH8aLXHwRdfqzR/tl6m6Wv57V/1l
 RJ3E63fHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAExEbhLD/8o5AYtijIRnM2W+
 PCXU0K3huJuJv/u/k9WpNfMleSa9lWD4X3E+quGxUEJjlMKOTBshycnPN5t21InbX/0a7XMrtPY
 aHwA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use the
macro subsys_platform_driver_probe().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/samsung/clk-exynos3250.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 32d12658e1a9..bf36d2f2a3f8 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -1093,10 +1093,6 @@ static struct platform_driver exynos3250_cmu_isp_driver __initdata = {
 	},
 };
 
-static int __init exynos3250_cmu_platform_init(void)
-{
-	return platform_driver_probe(&exynos3250_cmu_isp_driver,
-					exynos3250_cmu_isp_probe);
-}
-subsys_initcall(exynos3250_cmu_platform_init);
+subsys_platform_driver_probe(exynos3250_cmu_isp_driver,
+			     exynos3250_cmu_isp_probe);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261105-clk-subsys-d2d9d8338ca2

Best regards,
--  
Brian Masney <bmasney@redhat.com>

