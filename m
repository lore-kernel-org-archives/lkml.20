Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793138960;
	b=LEOtyivRZHHYm7JQ5OcFcoX88Vshw799DDN8iqMoe1ZkRdO7M+OkJeiTrNWIVae9x2nw
	 tdbeMySQbt+xY71czqBJByZA+ykRgGOEp8uhDNIWKDdaBpu1XIqgzDZRKn9DyACTSGvbP
	 fPorLEneGzlySf4vWnvAHdjTmklZ+2ZdlFxCpAJ6DMN1UNYO/fv/B6Bg4lCOWkBegoiud
	 ZtrFpxASprYIBixQupNbkz8+LiHOzgzsJvgMdwxn9JAzkaXyvaPEAP4+8HJROQPnbipGN
	 duVYQLZbF4A0Vm9i2FlE6CHPMOYw7qNkJAHdGV2UuwV+s48iaO0dO604CYOuYa0nQ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
	b=VTjsOhRJkDzFh2yCQlWfbU08GoyUvSAISpotNUC+zQUvoNHzGeofYvqnS7wuRgQbk386
	 I+1fhxkfmKK4isYdqSXf7e9Qx0vl9zyPHDdcchfbGjS2eZnnCXarqTdanQb7NCuHCEHF1
	 Hkek7eiPvo/rn/WaktKNcwH56k951OB9lr0cR8PO2iOqZedaQVuUgg5LtwCgRo7khpuvu
	 FGrMlePnL60v8TrhyNeR9J99EAkEDGcHw2Vfik2LgdQrSvs5w/DYzR8zhebrdBQS97fUS
	 u9CACoySgvDyWh6PQYcSk/4h5zGsDZe+/4WrWUvHeZr5PxGofCMCkQzv5ndcztIBSbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PdkMk9ke;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371E8606A335
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 371E8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PdkMk9ke
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so9258815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793138958; x=1793743758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
        b=PdkMk9kewIP8utyRGSc4jW43jNTAMvQDKKnT3gKuktZwVf28pYzlLA/+8SiuCRAfrI
         iTP6Wp32ZYmkYmhcNHY+LWMn13O7ReplBh3xR1RTmCprKzhXgsxWqnqvaqpUJ8giL+V1
         +xe0jxSNWptp05NM6xsnj84Gham/RG7I0v7BixpSZKpen9On/xnh5L/fo/U7koThVBIs
         HkAGjIXALNX70uCl3tdEmETxOS2rCvbb6GpILbnhsIveWjpCvtJ7r+xzlfu8vNUfNXfp
         uI9APCpJhu2wiO6jOdmntGI32eOTlFJirCXh5Dkr1AW6sJNNS0tkpH1V/MPuBRsJjy0s
         UL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138958; x=1793743758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PLmL+V/SYmlIq7ZPKJzSVA7G2MVgEzQyQAcifW2km0=;
        b=jtINNrcLL2Q85p4MmSpIaaQ56Po0csF/fxvx29p03HAHLigHTo14cZqJ91f248zDnW
         5CAeWAPVHgdQeFwsgVgmeKdPdVGoe9rl2tytkwpDaFKXUnAe2jaNHCBuCH8yxFsL+f3l
         FhwAXGW0YJXQIuyXUCWiHTFhl5tUZo15CTRtQETnP5tKrmhyqJPmEHfHLCqrGm1eJWpR
         6OFBzn0wc/Zb16xM2JjIFMUbZuEqtMxIuCMhCoGaZlXdnv7wc6WG1fPuGGBhBpbhXqiL
         6msTIbxmVPtxtkusNOrcayKPigrQlSr9Xj3VburMHH+4y/J2PYa2O0I9EQIn+EE3Bf6A
         aLzw==
X-Forwarded-Encrypted: i=1; AKwUvBwz7knuu54mSkJORxwfh6bqptg/fFIgJHS8wIQ0KW2AAOmvWTvK8i4JYCbrqxe57+lEYVr090K5a9AWKt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbEOVsTP3+hW1EMn0u9la6056ztnvSe4zn8A/9WLxun+IG29v3
	LchYTt5SmBUIiyIoPQOk+f5PfFFyvYLJMp+8gWdCPLFRZzq+tEwvUlQ9Cp8wtBL79uw=
X-Gm-Gg: AYBFou0dWtj/OTfo/vQjdcZuVc84BBloIB8wnt3t2aOnsfvFYAZjUF1zB+Bzv03vk7N
	O/rj3JEXETszlJVYDjXmEoRMLCg2vbvOT/ptSIayktunSfP7i0uDH7uX+7RjGM90lDYYEGDp4yv
	2ASr1V7+/wvgX0Pf9OyyAz7qivzo0pQ5pbsQulBMPAwUpLH5Dbb8jw6AZMiJTc6L+KVDQ9J5m1q
	AGhxHduT7DElb2QJDshVmb86OK4hklWVW6aRgZx4+GHC8pLkkW5TQ6/sDRGG/9ZiHdV1IkBnazR
	uRaAocMrhzzbh/v6AAUN3Eu21GY6LFl8bgxRgtWTEvuTGe4+44yKhMneCZ/mhr0PfJTD0MKr4uR
	pZfbgOIESuTeDILWsXJP2jXkoqY/0lXM5z8dCdggC5mnG+hOyfXfkjaJBQ6dmRKVNBWd57EfVnM
	o1xpurJkWD8yZbkInJm1JV/YbF6rHy/JnuipLeK9brkAb2jj3a0bqMrV314aQohSemvw1wBl5Fb
	tYcAZgQxvirTB2gfOKUj5DLR/AY/Er12ZgTmsfl1Rnh+mFCqbaPsVPVgBUyRR+XbceZhU/+huBw
	ehpvrAEzAqri
X-Received: by 2002:a05:6000:46c6:b0:48e:6f:19b2 with SMTP id ffacd0b85a97d-48e55a51a7dmr5924445f8f.25.1793138958515;
        Tue, 27 Oct 2026 15:09:18 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5cfb:af57:9834:741b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm25306661f8f.21.2026.10.27.15.09.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 15:09:17 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: Add the Ingenic X1600 LCD controller
Date: Tue, 27 Oct 2026 23:08:02 +0100
Message-ID: <20261027220802.56348-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
References: <270ef5220fdd5ec3e0b88ba5c4ce044992fca41a.camel@crapouillou.net> <465cb935-2648-458b-9cfc-9b7fd5dc53c5@kernel.org>
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

Hi Krzysztof,

No, it does not. The X1600's controller fetches its frames from memory
itself, through its own descriptors and DMA (programming manual,
section 10.3.1 and Figure 10-1: AXI -> DMA -> async FIFO -> TFT/SLCD),
and the manual has no IPU or other block in front of it.

So the only link in its datapath is the output, to the panel or bridge,
which the binding's port describes.

Will send a v3 with your other points after -rc1.

Thanks,
Olivier
