Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008663;
	b=fcH4TyHmX2L0SVfwrc/UyiLWZfmH2htPGbj/U8ElsFmnYx8icIy8EJdUQvLOs95C+GpB
	 LEUnl3OMlxVK/BnmqUAFDACwAXpnIBgLYSX1x6/ugOS2U5wdAs7Lw8+qCWpdtl68b6vmH
	 Q8Dx6/WQ5Wg/1yvmLUj9HIcSu5CqYRV/aBphs09bMZzWm+R00tLgSK5IyFD77VcKx1tP5
	 qMWcxdlDLDjtcnZ6P+D5YJ+qMEwmDCJYjOqX8dKaETcO+1581CkGytwdDxhr3wB9qk2WJ
	 2m7rEm4CgkksQgyhyVpY5qcNRuR2srOAbyHwTrP4LH7kLcGaL6+wTp7Gt4YtUFh7wAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
	b=K/iE8soAVrgPPH5zidQoEfRz5i4vNTpf1Hd5eHH52Ma4PqdForOOTqCzGIbjhXRemOd1
	 lXboXFl+WD1k8jA59gartLSS3Vd5QUW428eRb3/YDnE5RBXVt/eA2naQX1dXURLLw7r01
	 WTMqrLOFRA0XAvPT6XHJLdnzSgySUAtD2qgyDE4F5SDNwa6aarA03pFF/fDm/6F/mDvHG
	 ZV8C9zk8X++gXICPAAAARFRzkBmkfXBSdkbwwRSXYAEfYByCk/UbbIkbjTtmRoLKrl/tG
	 gMVzqQq0cNKgQ8/+l70QhkfJAuHtec1++0zz7b5Xz+uwoSKxls0obkmNrGt8YfVrfTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="UV/qb0HP";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F67660A5BE0
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F67660A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UV/qb0HP
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so22895695e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008661; x=1793613461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=UV/qb0HPbMrb2B6zXLYA4NlhLlaR2DPvvZIQmmoUo38gPZEtTgiFcItuCXB1+g4u+C
         E4/nOqZvYvtImM9zA8bp7McRQRP8meil2gvA7KznmyLj+DH9zj48lEriFN3wqHxyJFKS
         ngihqYgc0yKMUeyHuRskHrM1HZbRrL3Gb9W8GydJf+m2wFkHRbp4VqfDkLs5mvhtWTN1
         t1WVDQK0vC6sksHshR6wEXzapfoiUNZSb5HDDsxmLh/kHcs7KnJSPThCAkC5T+z9cD6c
         iNEDE+Ie5djLz8Dr1IsWv8XUjGa0QCAp5PHd4HT0IEUu+ZuxYvVJIU66Kvfd4JG1ZbCt
         bZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008661; x=1793613461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tpv5iqYSXjbesKglviGtVx3I0y7aYG/NoQbMyIgswYI=;
        b=FiO0MSsFUh2yTfxGFB3a9YUhlNJ+uLg7LcgabywpzlUtPrkqjVFieD6/3VFBVHBTeu
         v5ZpnCRxMdOAfR+k+kR+EC8HVGFFR2MpeCqiDp/tsVpAeLF+wkimrmWtdGznu9q4J4Vq
         9K9xYREFOaTJdRw7ijLqInizt8sNelheggQYXK+ftRMHuDtDK2KgC2J5iXskxtT+vHog
         gPCGqOC7dkxySgSGrNAqqhHyzLPUAhJdc3YOsZ9YDslDYKQGvmDOnVOejbZG6+nz4woQ
         9GThjXBJvKQc2s0Dmz2knrN264BsYAmFkukrmkFygbUSva3gdfYKgMdTKtAdDfJX3m4N
         j5GQ==
X-Forwarded-Encrypted: i=1; AKwUvBxj2/KicDPtQ/sFKM354AmfPE2cHfwYllAmBhViGSW9h/NBae3DCy6+pRzWesB6plmFncJ/cIpJJCyNb8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6I3fGMy/7g9UpO/qaqSu3jYexSjoywP2Sq8ym8Jr7bT/b/Fq9
	qauLLhVYrobBAZhO2bBx08P4rvf6k+YpJqfz4IWfvCVchogZuTAdZeDX
X-Gm-Gg: AYBFou2eFDgP/WOxmzQ7nK5jywaA/rWC3nTMdzhsAT1ARldjfS2UoeI9BN+lytzXGsZ
	UO6M54oVcliK5M6XbyFWyPVBh/4BEgU6tsMsug2yB4ynJAauagBnX5K38Ya9N6Q05AS1OkiZc8z
	kXXge1dhwMoKKRmCDZyGTfy1t4auBlkriF37/NxLvGYX+tJ1EsZ/0K0SW42b/UoJEq8Nkj/kuHr
	1Uz4uljq63Jfsf1OGsBwTgBuDeHIrAQNlHs0/hg//LfdIjovjpTDXa/36F5jOUGhAbQdyI9p+29
	Hos/rnYE+kXrofmXTR4bOw9jVqbp1aAtVcTGoekg5c9LGmqjZiu+NDa0wEpDzfo5/57e09PbCuh
	pe3/v8U1WVsqifw7JM/c7CmehLWVrDLiOrOhRq50xkL/GO5mftPXKjPL550TUUS7hYr26h3pTkN
	f36kra+od2kJJsGUNnASCk1ypY5vkCkeUQiXgRI61xfYLLa+jLycXuxUY3sTQ9XTv/dmnMgz8A1
	WXT1CcJORkc7gNL8nil8RBgfGF50YnKzU3XaMjq4NgnnplrTWyRHxQh0uyaFeqKy6WLtRRIVs2A
	MfEYH4NpuuqolnesMbqI5UK6xsW9QcwEaxLrDUT+e0BiFxHvGG0+x9FWfhwrICPSu4nkV4y9sR8
	qk5mBt8s=
X-Received: by 2002:a05:600c:4e87:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4a35acaa6c3mr112485855e9.30.1793008661422;
        Mon, 26 Oct 2026 02:57:41 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] arm64: dts: airoha: en7581: add watchdog node
Date: Mon, 26 Oct 2026 10:57:11 +0100
Message-ID: <20261026095727.31708-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
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

Add watchdog node to catch stall and correctly reboot the system.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 58bd8b318910..3a4a4fb0eba9 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -484,6 +484,14 @@ uart1: serial@1fbf0000 {
 			clock-frequency = <1843200>;
 		};
 
+		watchdog@1fbf0100 {
+			compatible = "airoha,en7581-wdt";
+			reg = <0x0 0x1fbf0100 0x0 0x38>;
+
+			clocks = <&scuclk EN7523_CLK_BUS>;
+			clock-names = "bus";
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.55.0

