Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794764590;
	b=ijOIoaGrN79gNpH8WRT/rNW9AzSy3KUsDmVkXMcz0i/L+o1EuBgFwDHQmBsSbs9Dfnnv
	 6fZPhR6Gyg4fTn3j7Ki93DPisGKVDGwoAVx2cG+I3PbderxzA+xyAUvlOxUzQp9jxy3w5
	 A980hsZ1zzve8UPrIpfIM4gG9gt2wqoICMRqltjYN4nZvFDWuCADLL+5IsnymSpUB8TwP
	 4/aaMHu6OvWNVW3dcj2O7rmyuD7iw7ehcX+FsVCzgiObJZerlGJb/+KnzoF0oMvcf/0dh
	 7u4hd4VqJTcgn2jnreVlA7phiglfel7FGrSE34BktUDrHTSy7fGXe4a+1WwH0zTP7dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794764590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
	b=Xgrcz5JLq2NOSQrU2mfd1I+8oLWhDYgDeaIqGnvYddKWt509QNDF9BdwLEsCU64H+nbJ
	 JdlOs2kTk+kAMYUmY8DQ7VVoYM9Q9v4UA2vpNCVDE/vW79FQTl/eX+43KkCCUFQNAkXZA
	 bhOo5WbP1eM/CmGUbUEic56YTg7m2GBq3BtO5wFNPtJcoGaKO2HZO1dMIwD6c49QIFl8r
	 PDdWURpz7Q8dBgJ4hXs/QjJXDpNGWy6Q2VLGzlkBGFtpnEVcXKMvcZrwOzclOI5YNHCKe
	 nCtQhB0EWz5EHlq0LHXeV+wXE+1ahdTxy3adLGJ+qqCF9u9DWw5Wvv1JJxywHwUVNzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62890606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62890606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcvgdI2h
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3282652eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794764588; x=1795369388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=PcvgdI2hMpvMdiW1+HQUyQPn73hNMwjQBCwx2gkXPzGcBD40Rm7sqewFwAMwQCrvSt
         dujQtw5KC39VuO4ARpPHiz3Iu+zKcCuXu8Lq0tBgOi9SUEdX/QGMVciLkHTJEwOvAjfM
         Z9hMoL2L90bxWRmAxOxqdqU1DyiRABaDLILrtFT50DBkiGTsLzDOE48d/UAbjKMf1AwG
         feu6Fha2eouQLYBnnvCedkwY0fj4ZGKC4bXCNatK44fRWUVlJWVfupyap9ckJWUErR+0
         eUl3RMiNb7nhdmEhxuhtFwZ7jvv7hluUuX6DMiuvI+kXR41QKL7swfA8LdDJotG8cZfc
         2f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794764588; x=1795369388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nEj//Ut3LvAdBYHkruCpeRqw/TE1nQ9XZ0jccIaxI0M=;
        b=hsAoe8620uFB6t7ImOnVUSLIt5CdQS5gsNqkBtaOXF3orM9lLyFtg3LPEUMY8wQbJj
         ZfPkqbh3woazZl8BEZPNEaELjPH4IaaD8osSK2eyqOXKHT9JSXOYfo0r8pibXdqK67Gr
         R9BEnd0yMgJrHfeFY6dUyuoBQpWpbDJDOqm8vbOm8S2svDQD1GZWux1Go49gVs+yOah6
         R+OaEF4vhugdBeQa3MtTZ6CQyTZO6Lnoqs9Ppp7vGs6zzfLGA6LN2d7Gf31wnyo2/Uot
         IKYUJW/LmkDreq+NJAdsBUT85H/rRowIXAue/UE1Y0m+UInad75uGseUvjP8A9x2P+ep
         b21g==
X-Forwarded-Encrypted: i=1; AL+hErHFX3WzvINRQWGstq2dJGLAE1b8u/f0RuYfpiIminSESQtFGkIp+jREyVv4KkG8tDmYMeGe4hVlTP56lYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CYrFphJaXZk8iymEaK2y1Ist+KBtidTS1xW0unZ+dp6x4v4lf
	gfLiYM5w20rkwGzx4uh9+Y5nmdVCUkTUSeC/Msg/79beAbs8wBKsS7p6
X-Gm-Gg: AYBFou0WuWbrSRneEDJaCw5AohbDL03VMopgc2QBIYv4PvqO6kuWwXO1KOW3HUSKi4K
	Peuxg9CN/F1v0nwgzwZgB23q9sTKictNoJ2pZ9nbSAzapBa5FECTfKSf/tRAmoox/T7bgWXiyao
	2cRTDM1ZgMUEUJ79UT/kMQ5zwuN+jowlkz40tH6OJFTWKmZhqapFxq24n17G3g14FUCH7mYO+wu
	C4it9LvfT0TAWrWXyd2MKXNkIQx9kQxqdBf/1yFxsg2MGOyuQo+mVX4F5Cj7TjytsPiBypOn++1
	Crnl92VjNIyN3/1ilAaAxmpnnGwMe/TwTjweFsOVVvVlaZCmnPJ7aOHk/dSjrS8AaTDGLHtElUH
	/RRE2uu5yWtu98/ekp0GBy1CsTRhvRH8ncjW3JcXGVSD5+i4e4mD/WnKbJFkK1YxyFdtGeGePAN
	zreV5pcl9YO17jtq+EoEUqs6UV5AwtW8YCB3cltt6aOdYut4yVeeDAgWlCEPftgZwlZJq+QlJSs
	jaMCAkOIZNOMAPnhKHjkaKc4Tch5llPH7So1dYz2M7s4XIOlavPZat7fRCkiicM68Ild1f/oZmg
	hAM6jPGFCL5vtZEMCtDYC0mkPXixreDh1bQPIIOTxytyWrBy2vP/0rF3ZwV1bvn73RFYcb2CaQ1
	La2kEDJL27Kezx89gZuupTZPLZ0vLKD9nU0hC5S+mQr/vQTdhswI+el9Lb8BBGErpkG0o5qcEgb
	TNZl+mfV7s9f0adGWGDhH4lBDTXxpt5GCPqF6V3FN+/UluvoQ=
X-Received: by 2002:a05:693c:87d5:10b0:379:f7aa:1013 with SMTP id 5a478bee46e88-379f7aa1638mr6773932eec.15.1794764588005;
        Sun, 15 Nov 2026 09:43:08 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:9ac3:b274:12a6:a1c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm28204663eec.28.2026.11.15.09.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:43:07 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 15 Nov 2026 23:12:35 +0530
Message-Id: <20261115174237.48908-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

SC7280 LPASS LPI gpio5 can mux EXT_MCLK1_C, but the function slot was
unnamed and the binding did not allow it. Name the slot and allow
ext_mclk1_c in the DT schema.

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.
- No functional change to the driver patch.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

