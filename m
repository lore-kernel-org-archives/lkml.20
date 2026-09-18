Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4724A6888
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716353; cv=none; b=XLYKs/QEw1tvpKTFLDU0cP2sk/aAl1o/PBdfsCZyeE9E++7dETyZf7IK2O/B16voWkMGaq3b7iHfcqWUScFRf088ra5FjCqSbApyK1WNDamom8oia3XiAIj5hn5BrcD0eGdyc9CkLclS/lg4BVmCxoJodVfuylnOKSQRe9J6ELA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716353; c=relaxed/simple;
	bh=EIcHz7r9SwgQ9xfhs7p1tSOdcaWcUCLZ3GAYhdRGBLA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ICogK9BkRHHWVhczxu27uQKgJjhVSzlomE4suOiRsjx1ozxYaVassEAsLB5lqSpdOunUC+kTsl9V/vksKVNAU7KrJizx1mmSJYXLHOWBw9NA20Kie7AJAJlaDYijEF26CC/eSWuQr6FQtX8zWK7JwmwO9ryM1hpwy6wCN20ribw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ki8zrb7c; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ki8zrb7c"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e2406so1996105e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789716343; x=1790321143; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BVjmlSNqtkbu5Qw02HVgZP7ffavDj/nhKRMIeX7I8Eg=;
        b=Ki8zrb7cLatx26hYShpaPUZDeaccGs4SjaHvHQlFHpW9j33z3st4ydUsntyEOc+kvm
         /P02NJgg/xhdkj04sT+4HPsG7UBjXkmqIqZmrzQ+lhuzBryOi06p9HdzecXHEna3gALb
         XsRZkpZss0wRYbg8EpuUZ3CKnirxwVhh3s1pTNmhWdnmfsusuBCFkKhvHBLNxXL8AU2J
         FDcamQ6qw/wcsKxSBjddnePPLD9tHyLTmghdT84UdL9tIiifjwuIphMsxYo7UdbULPab
         rQ4CgYvvkWnciiivJkY5yfCLmhWWjO6fni0WIznuSwyua6M748gGGPiMv4zvfNzbMjBl
         xFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716343; x=1790321143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BVjmlSNqtkbu5Qw02HVgZP7ffavDj/nhKRMIeX7I8Eg=;
        b=poYtAcBU62i5V3m0gS4k48UoroQhPHFrza2zmUbnd/id4MMbHZYtGVa7AG0vCqfFlJ
         dK4BwskOMUv6BiXMBQDaloJxLiTPGB8EpytmgwtnS2E+DayMoiiBWxLFbea/34mrN81+
         1YxkqYcR6AqoTZfjphGYo67sYHJ5TotF2WM/ObGUyEQh0vpP5Id6sY8XPyU2Y5qM1acw
         A9IJtsfNqx+NutZ871CGqQRmg7Tiuc7+K5QXPEe8YlyIHdNHh1S5RGjyBLUPTDkAmRKq
         dUa8hhfjS6In0Dadfo0LU2NkDq1HFOv+t1NwHTNja4weFUzqwavZsVTr6ZkNMFxiEVZi
         gy/g==
X-Forwarded-Encrypted: i=1; AKwUvBxZKdWmwLcSh2Go+WqXHJeN9GWXPgh9nufXeVBHZkGPKIxksF7j2FVZf4IbrMNRnPumiAFVdz35F70/V4s=@vger.kernel.org
X-Gm-Message-State: AFuF++lAcPYzaCGS5eWcwFB11Q5mUHivq2FceonvgBavlPaRVlHGC6/u
	CyG1XGEbwqJJcBEU7kuUuCkV4WyvK6ZEzPCNJiR84ARDqK5BJCfEFGr8Vx1PHfKjneXtJs7jNmS
	Q4Cq3
X-Gm-Gg: AYBFou1qIEyK3mxyB8QSuO8uEjLGcCQhMPXdbEu234JFFLGojPwm8fdUsvKJPxzQGQG
	BkIEYe57crHYpE/yWRr/sMmqNBr5uLjrqI5b4Ww7kNMrJUx5m8kplH6PXf08+lR7TipKOwaySaK
	NerzOfKRTCDZIMzRqxEMVy2zNhr97QLRzVcf83bspzwgmj0wu+hI3B+YL6noPa0Nu4CqnGRtGto
	MUhE1sHgvHr39gbE2iqC2czUXluked7mrWdh5US30ouoYIxXWEdg0v5f97qEEdxiQ6BkOjoyK++
	dxVGiPA9EoWB24mK5tITQpMCpP0kwX8P7r8Gtb7hsMIgg/5lKIsO+Jd0GayuHEjO9SqNrbojzG+
	dMpoZxzPel1Adgfyn0ZBtGVfxro2Fi0f87isFZF7GHXNXxA504ByOTSwaQuiWug7HibTLYty3UI
	FJM8CyyEmgm+sWG+BWbqf8JFwI1F1AGpTKQU6XaVju0u0aIy+FdMlUNqhNTJ+a3/lzCgQLxpZMR
	3VDBFPieUx0doA=
X-Received: by 2002:a05:600c:1389:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fc4f71c7dmr20760355e9.1.1789716343451;
        Fri, 18 Sep 2026 00:25:43 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd2160c2sm139523555e9.6.2026.09.18.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] regulator: add support for the Nexperia NEX10000UB
 dual output LCD bias power supply
Date: Fri, 18 Sep 2026 09:25:36 +0200
Message-Id: <20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDnrGoC/yXMwQ6CMBCE4Vche3aTFoSgr2I4wDLomlhIF0wTw
 rtbdW7fYf6dDFFhdC12inir6Rwy/KkgefThDtYxm0pXNu7iW17nRYXt1abacUDyLm8buBohfSV
 1g+lM+b1ETJp+5Vv3t23DE7J+c3QcHx3GKkV7AAAA
X-Change-ID: 20260918-topic-sm8x50-nex10000ub-3deca3c56ef4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=EIcHz7r9SwgQ9xfhs7p1tSOdcaWcUCLZ3GAYhdRGBLA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqrOd0mhL6FOYWAWXX8YnrZus06zPjs9OuKc++Ilyk
 /AcnCqaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaqzndAAKCRB33NvayMhJ0d5REA
 Cut5N7ISVUK4INtGOvm/8PnQBbASXIksVDaZViZ+CpE+FxhHfblqVV6KPuh0YiZeHezMX1tGoEM4Kq
 Ehp8+iRh9oaUbcI2s3pT/hRzkEDO9coDs+TPCTCBjz9RiAqq+4auYmLXEF9m2dqRFu9WDvmnoNdpRV
 Otz3G1uKbKcyJS+16qK10AGjViLarj847Cw/dHv+qygQwSgISt9HsDZlaIrxQVhL+xnnOxti4CNVZ0
 8YRlDgtXsc9YORMGXfYPqNf3S6t4kOnBwDOHz+NEy/CBqD2atGs8rT3ev53TAVaS5LoBkfmiQ2/wCT
 TBCEoUjxeojkSU1mEf+g24B3U9W9Psr9AVYvcO1Q8kMCwUSfBgBlIBpLI1eNyhixMiAu5vp/T/7pBu
 PC5YRNlAUWhsYGr0I2iMIFq5DTsp9BtZ+Y7C6ASi0k9IMr7rKSlt+QBBwznyR8zjqrIYUrJ4oKoSeF
 0IuHxwgkJhVDk6xx0IsZ3Dnpjtc5GCstb3s53melskskmJ4h3ULTZ5uIwMm7Y7sLGKSZ9Xcst8SEpM
 NvPH4sfE/o5ocKZynNu7LHKNSDxYwj3wtsymqa509xmtlWmtoYQ3yRM9pPchTuItsCfm5Lr2t53G5s
 PusUveg0m0hh3C7EApx1EX82/m8LR9Wnf9L3W0X8ZkDiZa+Yixscp/gD/KmQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add regulator support for the Nexperia NEX10000UB dual
output LCD bias power supply which provides programmable positive
and negative output voltages mainly for display panels applications.

The driver supports setting the output voltage from 4V to 6V in
100mV steps for each output via the I2C programming interface and
supports the enable GPIOs for both outputs.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: vendor-prefixes: add vendor prefix for Nexperia B.V.
      regulator: dt-bindings: document the Nexperia NEX10000UB dual output LCD bias power supply
      regulator: add regulator driver for the Nexperia NEX10000UB

 .../bindings/regulator/nexperia,nex10000ub.yaml    |  66 +++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/regulator/Kconfig                          |   8 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/nex10000ub-regulator.c           | 147 +++++++++++++++++++++
 5 files changed, 224 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-topic-sm8x50-nex10000ub-3deca3c56ef4

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

