Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364274C77A3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164943; cv=none; b=gpLZG/6nNcD2tGmpzHP7kS9ZRHgvHPrtM94/lzm0pJ43tzCedj29Z4u1rNcsFg60c3l20diKjzgceI5FHHI0B5o/QzwL4z0L7+bLiQThqsc+hOJBGOqpTcEpnzh54spC7qDirpCW5h0/WKlJbA9D3xzGCpAWUpOyS7A9QTZhabU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164943; c=relaxed/simple;
	bh=HQ4Pj7Q7nmHe8ZG4IoM50c88eztmRXYD88gxFA5urxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9tZXCLkVV5embHRw3EU+VGZdu1qFr58X/+1A6GXp0I+Drvdclg4CHUp9EZ6mQoHveKVGSlhk3R592+XHEFkifx1kVH9jZPZO1UlJTvEuivjYPlhVjrVXyG2VqwJkSDPaCneaxhV7DU6OnIxTEoC8WnwFLjzx4FqHdQGRvj/7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVvCp/uG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVvCp/uG"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso7533322a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164939; x=1792769739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qm8eZB2avE8gS3tjlwo2WEfgb/ASMpWMg+gWErFlwrQ=;
        b=BVvCp/uGDLpCIPjXDK/SNNTbaC8c/u5Jc0h3WKFnUD1F09KFmZLq2gcNAwJeQs5ceZ
         4dKPbtXzvqIrlCTYi4y5Ek3PwpQ529VRw1+ZGPrulWBe6M6+LVCc5WVFSvxoyh1FsXqb
         QBkPQH/G/3x/zSkrVqeFym/5TuJvo8NbO7XN141IKlPK//1P3ZgRjaZwB18Gg9Yif5nm
         nnycOHbPz4Nhx82FID9OJ6rWVzy1gGdieOjmg9IWgTbIqSP/7neFGgu9cy2JBP5rSbMC
         iJ393EtPpDCk6Kfcq2RfiVk0TJjamSszdFIwhRTI4cPaTQQZjG+qLHSFGhq4ddPOIC9n
         6pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164939; x=1792769739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qm8eZB2avE8gS3tjlwo2WEfgb/ASMpWMg+gWErFlwrQ=;
        b=yaKGc7wThBlDHCMAaepcTrUAM52ZrTqLHC2iRnIBNx2+fmPez3Eo/vqUUjhSeVnBfS
         37xnjLmKznNQt8Ku9kI4L+6/Lk3Rv29dOGLLLt/wYAkJpPc7manAV+lqtfPk6ncwqkaB
         x2XawyWg6Ck7UiithzjVyQvtUkOOGuge/RcDOqeTfXM1ixdCZNf0e2vbVKhFzxESUdae
         5+9XNMmGVP52jI06gWr9YgpfJa+p/UO/2U94oAGvFqd8YQMafz2gLHXYG3Of5cfdaYux
         vW1qZXwIWs7R+T0MDJAl/rhgfVMj+7servtJ0JjsZdpqp3YhH8jXCEg6UBIifnlJskeu
         hSdw==
X-Forwarded-Encrypted: i=1; AKwUvBwS2vBveF2vxUiswYo4IVWIwW0AwGQJ3vf9Ewc2s74MUToVEgg4o3Oil7OI7np1BlKunmJzMdZRDPvmls0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+AY9/CkOL9pwR9gDJaBF1dBdyShMZ6I9vhAO65d+1oiiBDhtF
	XzjNkATzUWxYuVF6kK3NdTKwP8VpUuiQNUmp3gN14LEpOZ7y5Dxhfosn
X-Gm-Gg: AYBFou3BObN7UkV/rgF6forCe0Ba454rPuH3dC9y79punHn2tml4PHUlvluZW6VHy9I
	6XmCNL4xxSap3T41mmi2/4esxjKsABC4rqQcZyJrCWrEtJsslP68TcVRw3ygbt2h4R039gwWHbG
	Meog5ET0z/f9menLD+vqYyez4EMPUTclr7qvuOGqiVR/dlkMWagSIn0naTIxCSGeK8BRRHDpSAq
	Gi9DiaaO29NZtsH+kWH4QqqknDtX/4w6+puBo7rZVkRBShvHmTIR6JUqnQSzBr9Qoq5RQiWHzw9
	2SkZfvKhtL7ofII9l8yO+IQ5YpAqKoc+CAw//N+5F/IbQNzR1Gj6eb2tVCix0bBFEv+3BSJCp8X
	jZAl3F1uwecRY3pw7hlgAt9ktNnoRSiem2HRv4Ug1yxsbQ5c9ZNtPJdHoUBsqPSx2yTrdwl9nG4
	LjjImzxgzeFYWwCt3TtVjCTg3MQGJBiYeqrFKTr7x5XmW/WKa8o4CnDwrFi5nZjASWUpAjy6QH2
	UUn++Q1Iw3+7nytp7qEqPZ0oGzzhPGXfeD4MqxU7gO0W0o128nGEBL5cL27Zny45H7r2fH+tovM
	L95QcTsGoH1xA9RyoZlcgZWoMzw=
X-Received: by 2002:a05:6402:2b92:b0:6b1:ef16:1850 with SMTP id 4fb4d7f45d1cf-6b1ef161c44mr9864244a12.43.1792164939192;
        Fri, 16 Oct 2026 08:35:39 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:38 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] dt-bindings: vendor-prefixes: Add ZillTek Technology
Date: Fri, 16 Oct 2026 18:35:29 +0300
Message-ID: <20261016153533.3701000-2-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZillTek Technology Corp. (Hsinchu, Taiwan) makes MEMS microphones and
barometric pressure sensors such as the ZTS8032.

Link: https://www.zilltek.com/
Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..255dc56edc36 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1977,6 +1977,8 @@ patternProperties:
     description: Shenzhen Zidoo Technology Co., Ltd.
   "^zii,.*":
     description: Zodiac Inflight Innovations
+  "^zilltek,.*":
+    description: ZillTek Technology Corp.
   "^zinitix,.*":
     description: Zinitix Co., Ltd
   "^zkmagic,.*":
-- 
2.55.0

