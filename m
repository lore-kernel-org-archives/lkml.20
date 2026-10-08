Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C634EDCD5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475059; cv=none; b=XTzKk8YUZY8CfnKs0dcVud7we4getXQtmicskAhwxupH8L+f/QWvlzQ+pFvxxvhymTy4izZ3TKRexsgQ4J8VsDjhevKlHk30gwE5xpUwQI7FjqCsujGLs6zfAKhVt9jvXsLy4x3H7aw22gm/0RGihKYYK4lCdGztBnDm62MRsK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475059; c=relaxed/simple;
	bh=g87w9t8vnCLzrZ5kYjjQ10CHlRMA3AZMTXdHP6HQ6dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q51ggWwoXjDktFUxP62wRUUpuImxERWZWcMhgFP1POs1reL+P7QL34+WX78yGj30ieXGQwCZC6dNIycJbVJ7nIrt1j2OzlA3OANBbSXtru/Seumm5cD3xZ6/InXdVxg/Wgz0uxU9EG8A+yekKFSEPCDbg4rx/+rB93KZ1MPxfZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xnq/CdA4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xnq/CdA4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2df982e04c1so20496555ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791475056; x=1792079856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pvd67Pj74nWibOAWBO1VBH/KQr45t03+WGbHxBJCBV4=;
        b=Xnq/CdA4rwWXL59MOKFfbFlktylPJWrMeUjMIoyMZrSEuRpTHvNu9Y/ONPTIi/en4r
         rZRAH5nBz+BD3MSlG+VKRpQ466MlcGMEJknPkz5UmRHrrvry/dipyXUOsyNsv3GCtE47
         R+VcUoanA2jdgelgwxQiD5tuhabQTkmQnGw36jmceCc6uIjCNWFZFQtEg0xtLPpKXWfo
         PL2mxqPtyrX+2uW813EaQfs99SN9vPvlh8lnsLgIVSoS/C5FS4nkt2PzYJFhsamU3SQ8
         H/0/aE/HleJnmxeKPDgbnfrNwS6eIk41n5WgaSBCFnNdyu4d2Qr+LKtEbkwHjYlUwtA0
         yRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791475056; x=1792079856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pvd67Pj74nWibOAWBO1VBH/KQr45t03+WGbHxBJCBV4=;
        b=MFCEqmJjMewjgUgo4c0ig6lR3qMLSd/f4F75IddO3DjZnRnqnf5FQCk2sECQ/yLROq
         6uIgq3YY5qj95z5EcO9/Z0s/RperwXg1ZcMSSamTaOhjmpKfT3AvZGaCiO8DczAKY2a1
         6NJ2F2100rBIRYaEEEnMlfJDbgOnu0TlNmAMoGJwhWMriVju+nj8NrgS3iSr5CJdd6tn
         CFfZWtmAZO9RAHF2TmJldP5xa0pPcZeSdskdTLDW7hwVu1HOSJbCPll4mTonl+o4bIbv
         ZbLJMN4K4CBOLkn6xpIQta9uMEjbIZUnRo/6lQhLi5y91ZoXIk9xjXh6gh0nAk9QWaSS
         CFtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFhhBw+XBkohAT69dkFcxNC3tJnBlAeg+4WymbLSoahvloP30hQ+SYOkCBlqzVc4aGGP9tGo6gpRJQTDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4cec/OMrx0njYO7GeDFsk2gElIvTHXUPDC92oDtSbd13u7dgm
	eqc1JyURndFBI/QVAojhFRjYxxSBerWdbjhijHe+R/WGTuysy4qoxAxJ
X-Gm-Gg: AYBFou21DEl83hstHD2w2azDyuwXUvvh6mSZhjibQ+4U5pXw1pz6lJ+QbPBlgD55+zc
	yqATUklk0yo7ewwGo8RY7nUf2TFCEuIRgThuHKnERxjF4lyp3BATm8TP1ZA20/lJbRiSZ9T+O9S
	GuNmhWOdxBQItGnCT3N4DOUISQJT4oPmQFkVVK7QrJi9hqSlfgFg0LvDF9kEeJMWwiRfLYJXtFW
	IpI3bNTD9zeMOFlnIkfWCIohvUn9WnyJf8wea4ZwdslkVxv45r8Sn/1tNagkXPP0IPJ0M6EUOCn
	s6qOpAQIjXFgJOX/gTQ2jhqFdVCeQM3XyhTDUpywyTqJLkn2GOcdz17CsQMJwfIKaSzEIbGdMVH
	ZzxSFI4isHbr6gdrvaZcEiBGoR3DbPfovqrGb/l11w8JJC/1VSEXk52KUBlqqgBjkvY7YLAYSH8
	JGHs23qx8k9+f0RHuxyFrLvEyjzP+tCdEATItWi34RWXkthda2uQAZoXZFLO0KX40suCo7KORnc
	HWlQnK7C5VTHfps8IaJWU4mrg==
X-Received: by 2002:a17:903:2a84:b0:2e1:2ed2:7cee with SMTP id d9443c01a7336-2e600540d3bmr43995655ad.52.1791475055891;
        Thu, 08 Oct 2026 08:57:35 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe0aesm27694045ad.28.2026.10.08.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:57:35 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] regulator: support the HiSilicon STB PMOC voltage rails
Date: Thu,  8 Oct 2026 23:57:23 +0800
Message-ID: <20261008155727.3801095-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HiSilicon STB SoCs regulate their CPU and core supplies with PWM outputs of
the PMOC block feeding an external converter on the board. This adds the
binding for those registers and a driver for them.

David Yang (2):
  dt-bindings: regulator: add HiSilicon STB voltage regulator
  regulator: histb: add voltage regulator driver

 .../regulator/hisilicon,histb-volt.yaml       |  58 +++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/histb-regulator.c           | 163 ++++++++++++++++++
 5 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,histb-volt.yaml
 create mode 100644 drivers/regulator/histb-regulator.c

-- 
2.53.0

