Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EEE51DAFE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755826; cv=none; b=pYNYOh1KKuZkGwFaFtxpDfrAV/P3KiVsJoNdPWb4tx6gt0uKGkZYe+vDFXEos++7XwD9q+sojlOcpO0eSEBUyMtFdDqCxuYmu+ada/MTMaCgKdFp6nCZFoOtGFigjRA/xRvUnB8NV7dV94GS8MZONm3zMNaDGmpkqUnQESPlQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755826; c=relaxed/simple;
	bh=3pUyyD39CAfpY6VKEgAB8JHfqZlwYOv9LPCjxeEJFT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKJI0sEFLaP/qpoYGxUNHqiZU5LVeBAJ2oD6RD0QP49CPx7UZQ/E3u0woZkZ6H916VHlMJwX4YXmko0YLgL1y/J6XUCGcAoWKcJXrh7bjrMKg/Mzh+zUbAhf878/WbOwqIcmOkAhbA0duYyBlTLY4BguCH2fIEWwQjM5+pqHCnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=fOaIf3kh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="fOaIf3kh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so6471375e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1789755823; x=1790360623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=fOaIf3kh03Pd/D3iBC6qds75+AWthuEKmnnZKrjxZbImN0DTNRSV5gt1ba73Gp+Q0I
         3uigIxNtRr9FWZr4Nt2yHioMjZcNM/+7IPEI4k1G8Ef3kxovWaY1wKYtur5fdGs3fto3
         mAD/xEtwmeWCqPdxI7JyfR4NvWKoCeI84Y+uqlaaFv++mTbGiN+hoAG7dnIO5hkRPIbH
         NqjMbb8rPzlpin3ImXv1pJw+oUuCSGw9AQqSDkzQG9HlRP11b05OMpk0tJc2q9uDqEnD
         EnzkLY7FTXk0TAhtoNeO9C4s0aXJ5U7FxrtjDuaHa6d8Ci/1aHNBVxig63/lBaCShmMY
         zwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755823; x=1790360623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UB4p6nqgB9EJz4EKrWNfvZJy1eYlyCEmUs8uOozwbt8=;
        b=wcjXvkdg3D/kDDG/8QhdGje02uEMkfeFfg5QcGfnZ2rKFlZ14gyE/qmji/OagvnqcS
         FtOfQrA7IaFsRra/wXOK4i2d+5ZjQKMqoVC69Ez+AzUU9UA1IGVffZ2bKcH8jrRBcPUn
         TeHbmzfuX7Pn4lk2kM8Kcb9BLULhSPeKC37ip9H5SKXHgDPd5gsi07PR6vQwsMP7ohY9
         zCWIitMFoOzr4M7/5M+Zq7S1XJABPS4vTX/ZAXOmpSASi5KQxtL8nI8YajPmVKSMaLhC
         NpQ4S+i5xbOIkLmGcQccgNEIlB3vTc3OcMNaeXtSAHgTf/nPNNCJa4RCIAxwqqhynbb1
         o0DQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ6GwV2X91dsl703tFw3uwW9HiPd6tJg810jJcy5ea1lYwc0Mb6VubvX18KfjZyva5g/Q9mb887LfhdIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lef90QrQCzSecSyw57qRR6l4L3kYFoROyQhwWBcOGI388KCCtZ
	fr//zTUoLwzU63g6MWijOGrX+vo0AZY4rs2CAXaPA25c6huCrY3GNDLXrI8APJXvxsE=
X-Gm-Gg: AYBFou3dIhOTjjEAPIykUjdsuNn95COKrIuTr9uRW+wgtvMFGCZ2iw5BrGWhMecWOvm
	Mq4T7dC1dDtnlIfRYDbOYiScqYUTP/YiPqJPVJF9cRM2adlHg07KaxnSq6wQ2/JLKe5GPSVHpy+
	CG7rbk2FP9Lf2Ea4HKor8jfLScDlsdDRqL0lZZM1veIKRtgt7+uTHQ1tjURns9dSD75UJlRAMaa
	ryQa6vqmY8I6YmQTllR+AXo5+IFVYjKcAIHMd6Q+kGtZa44vZiwDoMTGZOQhplSw3p5fSKOA9r9
	txr3SP+oqVwvyEyZZJEq3Ow6xWjeVxyuJiiRS6QlpW1Y94KAnmZi1ggdy5bMYSwMkd3Y4WNw8ra
	B7Vd5dw4Zl16wvxAdEQghYbEPsBamQJDu3DBLaRPqFPNtojGNykJtRsQ6P4HlUlmiOBTXidaCSW
	uZwwAtcOiXynKJGRU7AaYqQ+GFc3oWwuc2TGVsSoUUTfq492oX/agte6D3ofhStRaZQsCvMAc/4
	7Ep12oFUoEnbQ==
X-Received: by 2002:a05:600c:1f8b:b0:49c:cee2:1697 with SMTP id 5b1f17b1804b1-49fc5745fc0mr47069795e9.16.1789755822950;
        Fri, 18 Sep 2026 11:23:42 -0700 (PDT)
Received: from Behemoth.triland.local ([178.135.16.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0735c9sm12159755e9.6.2026.09.18.11.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:23:42 -0700 (PDT)
From: Karl Asseily <karl@asseily.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Asseily <karl@asseily.com>
Subject: [PATCH v4 4/4] MAINTAINERS: add entry for the ES9039Q2M codec driver
Date: Fri, 18 Sep 2026 21:23:17 +0300
Message-Id: <20260918182317.143223-5-karl@asseily.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260918182317.143223-1-karl@asseily.com>
References: <20260918182317.143223-1-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add myself as maintainer of the ES9039Q2M codec driver and its binding.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Asseily <karl@asseily.com>
---

Notes:
    v2: follow the binding rename

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 20d67cc0e7a..1095476c1d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9699,6 +9699,13 @@ S:	Maintained
 F:	include/linux/errseq.h
 F:	lib/errseq.c
 
+ES9039Q2M AUDIO CODEC DRIVER
+M:	Karl Asseily <karl@asseily.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml
+F:	sound/soc/codecs/es9039q2m.c
+
 ESD CAN NETWORK DRIVERS
 M:	Stefan Mätje <stefan.maetje@esd.eu>
 R:	socketcan@esd.eu
-- 
2.34.1

