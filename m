Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB6408026
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791712491; cv=none; b=DioJ25QNkopFaOd4LYUXGpIhWBTFID3OPveH/MZ6zRQEc/Ai01OAjiiLauWjJvJM3fovGFfylbMOBIOzxEkye4k06MEqTifigUyDCPtcp9LzbYE0ZgqaA3+KUCPasG5ebOy4WlyBNH+mRshOoZT+O+A1AiUFB3ifovf8SvLW+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791712491; c=relaxed/simple;
	bh=U2B7BU0Lxs3FsucnZq7AS8Yh/09iEnWsum1PYUMmvv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHS1w1sINCBTS0kUSg/i73Ubfep0+fD1OT6D2kgiVpf4ZgvGc3z+gruliGZ00tBoJUJKzJakbmG5bXvD6JI6wpa81g+M/EjkBUW9hFSc5DVWdF3MhheXCB3gsJLrmoPTI8Yq6Oj8zXHeR8aSU2m52B/h1VJ5DSxoGrB1D3U2fxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM6A/a+k; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM6A/a+k"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so2016985e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791712488; x=1792317288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QY/EzmyzTauwW5QelrR89nN81T0UYxkWsgWg8RAQUTY=;
        b=AM6A/a+kiIEkbC1HcxD2S9+zSHPsIeM06GrzAXDi+/cPJhBRR8ap5Vp43naBKP0SPO
         6N5zc2tp4OBLTZ1rXEvb1yiKDWui3voXcqXI5cvtpBtf2MFDu0yUEu+kca2HymoQS0ra
         bVATxnSOx9yt5yE9I06JCIcFxnqE0/e5JKTA4Qd6qoZHGj1ZX4m3RPUNFpTPnm5FF9MU
         NviYhitZT2NtdXr/yJEtlDKdXBjuoLZpoW/+Dnx6SP2Z46WDjPa+wq5Oy6iNy0c6sI4E
         5Sd+ePbcNizljEE7ZZVjT1k/FIp+ZDpgUqeMMGIAkJKAmAMIT+qH/KJxgStIItkljwCM
         Wt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791712488; x=1792317288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QY/EzmyzTauwW5QelrR89nN81T0UYxkWsgWg8RAQUTY=;
        b=jv1TRHS2G/GjcMFs/IQ8UgOX6kD0wR/9PtBkOZre8bYAT5kCrSqn6ol9tzEy5mUbO6
         9+jzgeqDufM7N7O3uVjAwMn3f6C0fh9E396udeakJUb8euqZ0Fgm9tzpA4U9T4vGv8ka
         4LsDE+qP4ar2W/ZhxHMVemksqPS17so+h1af6LDfXWrRqhLzacwrxQNOgczYIPYmMs14
         qsoCPHnlg4KWwTG2zGcUryIuHQOJwhtwNoGp671kmBKMZy23eQYbY2HGuHk4/VhVVcMy
         YT9UE8viWalGmPU5MxyzqN27Jjrj5kmnKyj1PDTWIZbxQbMdh1E43Po8WFDUWEZMWU16
         K5LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM3p4B5bSeooQAGovrsxxwclN+zxEUIweFJWWDkGVbf0acSo0y7wOK02OeNZjyWjVkLWCjtVzzYarL/JE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI96rufzmwekJwlgspDlfZ3Lu4S//dT4MFwJPEz7Q4haLviKeqS
	+Wh61M1mF8NuGim03Mqfct92UDn+EIvpEduJBAefZ76IUli252NRG/MoHhV0Tg==
X-Gm-Gg: AYBFou232tX0ISlyLRLtBDC4+I5v7DgVaYFvN7l6GHaz49gg20w8QA33BFb5UaoMfdO
	ntKvMwOa5n8A/nn/jZL86grC1e7zx5fYsrBcHULAVSS2mcdi7KRGQx24ezE/Cosw0uNhMeC4iOB
	IWCjC580oPltABGlY50ReAXnxu4odVd+dGqcegNQhxRiWKIBN+mJdkejSF8pqd74Ifrg31pX+WP
	iVD+HUFvxXEQPpM1zYacHu+NwSgprS4keFIkHJ+BcLJu5dYNqmUEwKC2E6eKiVe81chkbrlz/K/
	OVYDVl4bVq+4dKasRYN3JZzFxeNsakCBVQ8YgORHho/apZWJFfk2hkkI0M+/ZXtDza134xn083Q
	sIFLcurQghw6gx0jmipeuGrTwd4tytnBDY0co4NEoP4qVAy34OnzIWlauqGE8hdk6NCDmzPkj+R
	x2J9C3Nl631s/GTR9tR2cLEVr7nLcxzFvk3L/NI9NAkmNVBFgs3rMYxXtMhlh0VO/r11DTRupCI
	ahsPzfxj/vDEKg=
X-Received: by 2002:a05:600c:6297:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-4a18e4d6853mr119440645e9.25.1791712488276;
        Sun, 11 Oct 2026 02:54:48 -0700 (PDT)
Received: from localhost.localdomain ([151.27.249.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm377837785e9.9.2026.10.11.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:54:47 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Nothing Phone (4a) Pro support
Date: Sun, 11 Oct 2026 11:52:19 +0200
Message-ID: <20261011095221.24767-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Nothing Phone (4a) Pro
(FroggerPro), based on the Qualcomm Eliza platform.

The DTS describes the UART, GPIO keys and reserved memory,
including ramoops.

Boot-tested on the phone with Linux 7.3-rc3 using a minimal initramfs.
GPIO key events and ramoops persistence were verified. DTB and binding
checks pass.

LLM assistance was used to prepare and review the DTS and patch
descriptions. Hardware testing was performed by the author.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
  arm64: dts: qcom: Add initial Nothing Phone (4a) Pro support

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/eliza-nothing-froggerpro.dts     | 157 ++++++++++++++++++
 3 files changed, 159 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts


base-commit: 705529dab1fa872d8b53b09c95e1b03a95573376
-- 
2.56.0

