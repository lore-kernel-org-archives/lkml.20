Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693878;
	b=KAdWcT87E6hv+14m3JJ2Lgt7vVak4px1JsR7Ky/Hjn5y4FK7f4EPcdBSbPacXUtJfC3a
	 f7wJAQL7UrTL4/B6mcmTjcFw9Ti7sDx2Gj1+DlDZSvnjjttSJ69FnLARWg9iY2aWZinSr
	 vOTmZUCfzz0FfpgGn13XuyRRLFtZ29BPsylm0bd5q/di+8FYUihUIAbgAdF9fwJRUQg5t
	 j4xhbjYg9X/6UYPFwz+W8SJxosXFHFXLvJ/lPJFI9YDI3647uxvBQENBPEObvqklO9CMi
	 t6zWT61C1YalgihYAB0HiHZkZXFkgSFanBBa4Tyex1KWvrMXXJ8dFXjr3BJQD44bwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
	b=pSZ+5nKr02XuxuqXcihJnRlOPOjpAE95LzhpyWhNAIy3cubNMx8Mz09gRCnRMAfkhHPS
	 1wHsaBhfSAxjcd/xD4Z+DI2GtxAhgUPnyGVM4RpbDBE13Y/AwLVBgY7/pl25vXp2pFJIM
	 2mMH8zeoApVeXgF2Timz5nGB3dk8oR9s0tKK8l1Jsov6QuYbs1WlEuoXCSluH4MlZVGw8
	 ywt6Z+LIuvP6bMSLJyybu0VxPkHMQ4bCCfVRDA8tywOHAslY4SsznXy0KIqqUm8mtz0CQ
	 P+KG3Cx3GgM80as2B82ov3CEtfhxCJpNgSJ4dnopYDs2ftAifMKG7gp9yDiqf8MbVfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KUl4wyUq;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E233860A2614
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E233860A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KUl4wyUq
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20568c8c0so1084325e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693876; x=1793298676; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=KUl4wyUqYOpZkQN0agnn58oJoBlqpUZTS8nJJxND/opK9vgTTxiqGUROLVWODBEYtq
         et1nNyUCeneSvTzmFt7NgVBX6wcRgk0gGim2xln/GByIdLpagBJ4N1wChatX04cKS/iO
         jggg6+R7Xybfw2O2nQzuDs8AJ9GuC3XcPgV+9N3Z1ilUQT4Ej1stbNByohTsdimsWmeE
         R9/STk/alN2f3TFRRIDFvGh9hdpNyaXBKUpW6uZAyn9yzAV6ik2pfIGhMmf6swm/sDcc
         ojaggAf0v+uoP9j4TwNeKMbZkNKyIfRTd1bMoYS/XexC3lbrTto3NNVIPZ7bQGPbmKne
         zrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693876; x=1793298676;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=WGN4NT2HR5GODNFxsjeII39cPIT8Z/lRDP90q0quWtbj8Oqg6oDbqY0TqCiPqhn34C
         SMRBAJ15NycArjA5nt/zywLNyD16YkYB3h7BhdGQj3gNM5P/1xj8UuzBd6NzFyWP+taZ
         hrAgqEqm6D6PeqwyRlrpopxU6yeQO6HI4Jx6K/yKr3R9LwVPwZaJVszOhGaWlTT5nfXQ
         11TQsD4W3cOWZqzcvhcroSBjJkwmR2ecwwdAiVfRZE9kHWriM5xrpyRb0t11kH2uc2NS
         BHaMZJQXvYtefMr9m+CB12sFnaypRVgKVRQuFtnGHxGbkjOy6MRoClqU12yL80ojSwOc
         h+rw==
X-Forwarded-Encrypted: i=1; AKwUvBy+dk229YSB3QykUId+wo7cMpBcWg3KrTvZY7xKD7wQcusEuv76FykZhKDRxY+KhpghVW1Ds5vIBNe53n0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLw9Utf0PCgitCdM1CUItNLrB0Ol4nhEsZAKBjONyQgcw1KJ8F
	FtF+41lX5j5UGJROk9UNA7FZnAagLVQ/EN52VtUQeEvWoFm2yW4zFe4OCH1hRmifryESHKIN3Qm
	2Jp3G
X-Gm-Gg: AYBFou1HUYRF6TfyM4C15lXh+nhLrFj1Dk9WNGeUuNgtQA9SXOASLlrESHYj3HJYWaa
	VHCRKvOJnps7Ai7XZ8JQ1pNrC9OOnPvwssuu/bMGymSinhyhoaEgz/P0C0py/A6EBTd0dfQpIbI
	LojRsYENLkjanKL1hnlGYbUSaFJ6pfO/qkZjcEi6tYuVgvoS3yMrfFkPxJ1CxXNi1Z2maNROKiw
	Jz2WQaUQmlThpyGFyWRUl9Iq0nGT5ydr1rXPClYCP3HeEQM14UwK4G5HsdoM31e7nWCqYMMLO82
	JL04bclKMZJeYRWrr0ekwzcYvn+3QIk6K2fzr03ppciXjJsfRNFG4ZeuqPAihg+HE68TwbaYzzh
	rQo+zXSMdMJUM9RoLv5TRDtDqoB6XjWfQTI49e+eR8/PGr7N0gGm+20YTYPkZZncnxBIeMoleyh
	5jaW3fVouUFj3gm2pHWXmzcXQH6q4hIzTviOX5U93/B+ajWVCSKzvo37gvUWClc07tzVPlR0jQ+
	LEYppHfzOjkhY2f1W/r21RnT5mbgbDNwVmEYUjtOjrKoVWViNik/kdAPbxeuI9xHVaf9oy/SJB3
	8DPocugEDs4T4MN8QLktbJRCHP4+Jn+KsV4+rplIMA==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr127571525e9.16.1792693876294;
        Thu, 22 Oct 2026 11:31:16 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:15 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7 and
 S7D
Date: Thu, 22 Oct 2026 20:30:26 +0200
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAyF4VeRrBvQUafoqxQXTia1EbwwUSkV3
 93Rwtl8i/PvoByEFepkh8CbqExjRPZIgD7t2DGKjwaTGpulxuA66xK4HVCfcR47IUKVH6N3VUH
 OltbnFuJ/DvyW791+NX/r6nqm5QrCcZxFFhwhfQAAAA==
X-Change-ID: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The S7 and S7D device trees describe only the first 256 bytes of the
GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
interface control (GICH) and virtual CPU interface (GICV) regions.

With the short CPU interface, the GIC driver disables the split priority
drop and deactivation mode and warns at boot (patches 1 and 2). Without
GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
needs the split mode for that too, so KVM gets its in-kernel vGIC only
with the whole series.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (4):
      arm64: dts: amlogic: s7: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7: describe the GIC virtualization regions
      arm64: dts: amlogic: s7d: describe the GIC virtualization regions

 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 8610d31587e139380db9cb8708f4263833b482d0
change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

