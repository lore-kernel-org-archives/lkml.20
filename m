Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281026;
	b=b8c4G0++w9OkMDqkiAYOsUrZtgH+L4y8j22k2YcByLLocxblCCC6nbqr5TSNPupwbuYP
	 JU5SH6O7P1cvyWlaNBz/7UnNtb2xNrK+czy/3r6pIB35otEl3EqydicZUDYiPYFW8XqI0
	 LqpEVEuTAcxMqJHlF/lvxUGalMasnrEmmzcjSc7ekLMz9xpC4jxDEqoOGtrPXLl+f8/wB
	 47o5zBzoVq9TZdVGfyDU5uzuxPlodUaGGN0Hk5OJdrgeaT11mkUOnK4xdadxPhrBSwgrB
	 4AAtQR47jwqnga4TYkUovGo+r99TgAq/M63wNG9SO2prVhe5prTlFewz72Z2nX1qYMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
	b=We2oYv2l7ld0qMt+1XWXY2L0fAWL+5a2ax3m8CsAFQITecAChzKcsH1/VDpdyQkvyZK8
	 CZCCUdGC4uKPt7FTs7C/9Ex0BGLH1kj+0gA5PFQi7t2+DYLcjjwG+tNVtD+PDF4wI5IlQ
	 m3CY2okh97x4OTYJwcIU6Eni+6FPsR9ovB30C1B4bQUUD0BPuAf99oMhY0pOcbj9oWaKb
	 KBVABy8pPh3UKyqre0r/gS8n82SbdXXEO62rJQmBIiYO2R0+UCGgqCyvuuZUHvO9HMu61
	 uU1trodfialtxrC5CqnbeSel558QDNhDI3ZcgZOrQCvY5/Trdl7i0iCpND2TZytkHLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GT+0KNJd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8460A2601
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E8460A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GT+0KNJd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35829219da8so930254eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281025; x=1793885825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
        b=GT+0KNJdIkRJdE8W4Gio2ibuEXT3n7impA3mxO3geWU8aZlinEeYdYdy07gFbSHHCX
         KhbsyXizO5+wfp7iifVvfkHhh/lLE8+fuhcdhWWY14Nvyv18Q2O5KBBNzRRaBblX1v5J
         zJqXETqUCazmqOkDpGVAY6Qng9fgVzLmLkAHYwB/Ba5TWDAEK0LZd16davtplEtlgsYB
         LcRi+7GxtepHatbRTZRFix6ZKSTeOQJqXRafyHg0BjKLWIMJJc0PGdzx8jXd78dDH9YX
         XIK9uJNHwM8wQ64A4R1HnVfKztxcFDHed7qbpgCh437XokySgXHWdN9bI2Xe1DUUff6z
         lovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281025; x=1793885825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB2jqsnVm5eEvKu1VwxOsMOI5d+IePdDWWZTVxh1rD4=;
        b=FTKvJThjIte9+1wXwxzs2gaN0Tmxo7k5E+MiHKjnBeAkRKFF7UVvOTOaSEFKb6+qVe
         bKWrED0Yo00T6m34NLztdmmyZkjctjGem4ZViMG9Ml1hwConqutIZSMTNsq1GljnyEnM
         2b7yn5RWaM+Yry8fHpDkV1/jy0njqBYZSUDUmuGJg9AMmjWlptJeFIibkLqfkyBQqlkL
         cc/TMMnfn5FI/lcWDURNSzltN6U5ASmyDL7bTvYYB9d42iAHNcdQJ6eRHppge9D1sTl+
         KC2D8PTtGeTIaAFpAjolwdiWheK+xeYpBlLbykkbcSF89T8Qy5SAt+5nuUjnwVEOX0/I
         4Fyw==
X-Forwarded-Encrypted: i=1; AKwUvBzuZB2xrIvzD9YhmL7GaQIW0Vw8TX2pzm0msMzS1bjFeRjB98mqM1ROeS3YfgkZuy0yXPahhPz3Cx7dcXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/4dKnTTQxedqzTmQ9eF/YrG4sFbDm4Ido57bsZDd+lFGC2Nui
	5Wgiztooa0niDPptBy6sYrjVt+PX7F3L6W440hlS8+Ryj+fH9/4P7csK
X-Gm-Gg: AYBFou2x3n/26O6dGhKKJHFigj2d/O5Vo6Y3e7+g8sGdCNdKw0qVJAi+elJ/OoL2AC8
	BXYF6ZjfXi01BBiI1nGZkabduklPHCFAT2o3Bayl68kL6nxN3O7iNsks2Y1Z9MQo7TDYQeuarNC
	6hbH9TOOfD6MPxGg490I0aiGFyRlvH3vQjsr0B/JNSUKMYDur/HuCGVy17hsFti4U8XNn3bMxBZ
	PuWIU9RB1eH9EJxrXdSuBydPUKXJpi6Up1ZSy4pY4mN7TGqwVAEKwaiXDy8cUY3u61IO5FUudA5
	5QpYo92KBUqrFlMooNzXUcmXx16KzVt4MvxJA7mUkd1QhPqjWYP2u9OChMz538/44G6meM/LR5J
	ZdD64kgToTCg72WRa3vkR4zwRV+Vl7r4yLgchk5Pma6xO3fl210TyDR7RXineg7BAe1yLlujrF8
	ZF2CMkQyvyl68M70C3UD3ZXFGnG3ZgZssE5SipbKZXsm2AFqYt2DmizZv9XGEyHEQlfYRPNKH6T
	Uizu8Cmp8jozn++LeGVSfnzk515qyFkegIuy5wijdowD5nLgfWd5cn8XJZ7DWX/O7v6gnxaHDSi
	Cv6fkbXmtKjq+aYI7rasfgu8q2Q4N2j+fR2frClKlf4bCTGb30+7/g==
X-Received: by 2002:a05:701b:4559:20b0:192:a481:361 with SMTP id a92af1059eb24-1a942c60314mr3416088c88.7.1793281024734;
        Thu, 29 Oct 2026 06:37:04 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:cd0f:5122:d067:9a24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm17046239c88.17.2026.10.29.06.37.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:37:04 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 29 Oct 2026 19:06:52 +0530
Message-ID: <20261029133654.6585-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add devicetree support for the Vicharak Axon Pro single-board computer,
based on the Qualcomm QCS9075 platform and using the QCS9100/SA8775P
compatible fallback.

The board description includes its PMIC regulators, debug UART, UFS,
USB 2.0 host with an onboard hub, PCIe, SGMII Ethernet with an RTL8221B
PHY, GPIO LEDs, GPU, DSPs, and audio through an ES8388 codec and two
digital microphones.

Ajit Singh (2):
  dt-bindings: arm: qcom: Add Vicharak Axon Pro
  arm64: dts: qcom: qcs9100: Add Vicharak Axon Pro

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 848 ++++++++++++++++++
 3 files changed, 850 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

