Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737625;
	b=tS4ezsdl3l5KDIBXjbLIlVxDORUfCx8AkuzL+1mxfFqxTDBloMwrsTJyy7WTDyRIjNXu
	 OYeDBUt43kKe/Ns/82uHNjNL5lTAJct3cDvXHbLK8fQ9Pld4DFWstdANeDUr6S/XYRR4g
	 UTKvQZDKl/DHotRvfpLMcEAV7CDwvUatxsrFL0pOsyLJPyQZqkw/BzeQEkiVIdaMMoR6D
	 YCgUtNbT0ebo+q1XOGMksmtNTkdQ/G919deWLLSXpjSwK/nWiRGDg1st7KdTmiWK1M7fa
	 TVFdPBZgN8DfFhEkCf6jD1hKLzSirW1c3ZrQoIBqQxWEheZcIHPiU9H1pxoIhcx8SJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
	b=KH3IAqIppzFqZkZlBClUoKaRSWe+f7DgCuvdTEMTqnuW2T0x6n7A+H44/lOi+3eYuqXA
	 6K1EOdc3YqJn7WZF+uKGQ8Sa1X7ILvOtAF6S8JfYvk6TwV5TgBFhMXRw8Y+TG1LZ2k5KW
	 9EDZj6ruhMl8UyAJ2J6BghutWHs60E1Y8DWWdvtKaxS+r2+cJXizNjitE+S5ZZiMLjNNt
	 hzezVXoD52lczjAQdzgbI2t/gU1Os/eOHDk96YRdojVaneM7Ko68tKzG7gYn8+i4JnZyV
	 vimrtpGFQl6HjxBDn0reZnEdn4hiRJ5udm3uqhCbu6oX1Xb0pt50AViigRrTCdCOFhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFvP+We7;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92699606A334
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92699606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nFvP+We7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so255111f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737624; x=1793342424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=nFvP+We7XiupT2noLK/fzdphPCutvS5h9ja53Rm7jDjlMjuga21PPGPfl3QjU/ECb7
         vJXjzgQQeHxBnTcpUCcDz9Mkzk1J149NiWxkGB4xjLLXKDnJufFFaCU+5G3nko0GgXB0
         p4oO49kFqiWVFd2j4tcut2GOmsdVA4DYdJYWI0HSTZX2HY1wTTai3F7dSrdaqCV3ZQ7R
         sxqKvZlsc7pcylJJ4PVh82aybrbqrD4CanpDTI8g79zfZb0x4tUAx9b9dY8phosjMRNf
         zP7C1OdO/tgqr/6IKB5+tnOqKqj13NexQpJdHS14JPGE4cAzw6Y1th+arl9wwks5uVeg
         Gc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737624; x=1793342424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UoeFHsO2E1Dm3EPGxkpKrzw1COi+rNj0JGJlw6wJw8=;
        b=VmVeW0H8mCTZYIwqqd+F/HpiHEINZ0h+AqYNm24Uacz9J6XpsG9K4YbVkByh5svlhT
         8JFer8NWetH46CWXkDxLtACeWPpLe8nVVrFTfaZFjhM0K/WZAIk7+AzIz6U22pl741At
         pWXX2gOd2DnoyODGfiUvYUVqWJmGDd6Oki+J9l5eZFa8Rj7Qlm0IqGRvu3oAXaM4gx4Q
         /qLTim7oHgpxfBSh5lnLV+Z8I/i3PCxjk7mNSbl+MHCuTRBYH3LtVlRzzg4ylnxhAuVl
         +ujrCfbeRMgX7ME0GOr+QkSYtZTSS5vcR3YMHY+TOSS8lpXEjY861H4hzcIhIXdXk0m2
         unlQ==
X-Forwarded-Encrypted: i=1; AKwUvBym3EwMQGV0afkotzmHs1ABsRrXmU7PMzG964BOhRtRQhihEt0J+cJTbV/nD4PlyP5jCcbQAwRmCo3y76o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeIsA70v51xcZboZoxIOMFq915oYfVpZ0qSNv7YfvM+1f9BuDk
	/5sSHPH324ycRHwvuPv/j4WJPtM3QB2eHXD6XKL8Coz+FfcT5Kkrap0+
X-Gm-Gg: AYBFou0aWYsscTlkVm+CMDKVLQ968Av9f0gndVmGv2JtEAxmLx00jCBDHIkc6Iz7Xwq
	5UXQBDh/fNcl3Ns/z8bPf5DX5POiVefd2iKRsUWKGSsGXyO/7Lm3sDSizT7Nppal/UdOmZnCmAg
	caaleGzXj9+b8txS852cYqCFAAh8UuTghvCIWIbbXVB3kSsKAJtQGkgJgTc2e1ncgl6Gw28gY1f
	MiOloyqigQKpmBz+QEzkrHvpxoE7ooBcW4+S4mJHe8SXYqau6sD7/mEfXCJNZGdGKo1hs3VdS66
	Lx0STESehXu5NsQM66XGdodp61rZ1GSeaNyX/cGL5uPyeMT9NsojxyOFYfygladNgDElCvk8tJm
	djiUSA1OM068WPFk/LpyHV0fo7tA1XFNpSbFlN4x6RIGbj5GfgrO2LQ61mQGCD6QvwTpFt6dYi9
	fSUf0W1pj0JHoy0Sw/Hr2/fQ83EWYyYGJW6Yngp/+G1oDCrLgveHPP1FUlfcGx1Gzed/VuIfRum
	v0q6a+KAdQ7Y260AltLhGcl2l5HP8ogcLt4kHiJjRjki/DZeSJnPc0at3R1RZiGALe5BacoclS9
	8buvHjg+n9y4czf/kSirkB6cn2DM/c63u5pSFkoKbvatURuMTy4oaXaQT/NQx3fL2mfQWfxM9Eb
	DrCu2F+gJtgaG82kyZGNEDJyF
X-Received: by 2002:a05:6000:4910:b0:48e:1c2:55a1 with SMTP id ffacd0b85a97d-48e385c0867mr1563144f8f.52.1792737623908;
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:23 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:40 +0200
Subject: [PATCH v3 15/16] arm64: dts: ti: k3-j722s: Add second submailbox
 to the C7x cores
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
Message-Id: <20261023-thames-v3-15-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

For firmware that uses something other than RPMsg for communication with
the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index a59c3648d805..611220ff2655 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -86,6 +86,11 @@ mbox_c7x_0: mbox-c7x-0 {
 		ti,mbox-rx = <0 0 0>;
 		ti,mbox-tx = <1 0 0>;
 	};
+
+	mbox_c7x_0_client: mbox-c7x-0-client {
+		ti,mbox-rx = <3 0 0>;
+		ti,mbox-tx = <2 0 0>;
+	};
 };
 
 &mailbox0_cluster3 {
@@ -100,6 +105,11 @@ mbox_c7x_1: mbox-c7x-1 {
 		ti,mbox-rx = <2 0 0>;
 		ti,mbox-tx = <3 0 0>;
 	};
+
+	mbox_c7x_1_client: mbox-c7x-1-client {
+		ti,mbox-rx = <5 0 0>;
+		ti,mbox-tx = <4 0 0>;
+	};
 };
 
 /* Timers are used by Remoteproc firmware */
@@ -152,14 +162,16 @@ &main_r5fss0_core0 {
 };
 
 &c7x_0 {
-	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
+	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>,
+		 <&mailbox0_cluster2 &mbox_c7x_0_client>;
 	memory-region = <&c7x_0_dma_memory_region>,
 			<&c7x_0_memory_region>;
 	status = "okay";
 };
 
 &c7x_1 {
-	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
+	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>,
+		 <&mailbox0_cluster3 &mbox_c7x_1_client>;
 	memory-region = <&c7x_1_dma_memory_region>,
 			<&c7x_1_memory_region>;
 	status = "okay";

-- 
2.54.0

