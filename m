Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184157;
	b=ph9UHpmzTDUbvxd48DNqPVrHju3mYKrwQzvZaFMQu29aaFIRWDkY44gwIWncV4OqbQpC
	 1hfd3yH3CIkjNEaGAvCc3iVLU75Geer4OmGVsDFwWQlC6DcICfcWUu1TwZAMNR32VySxk
	 J3QIKxGoBk908WpQpyQCUfVybhJ5LFzZMib+NI2zt2y7FpsEYohxjsH790FrUGHX7GR2c
	 XA2BYJv9W933sa6gSG2XVV3EeaTZ+jBzptzS7Chudsjj38Y09me2kkbsLcccqgmyW0JCV
	 LSnFgyNb/zmaZDL94QbKdW29crODqkwP+zMPYVlutb1Db457UoC8pmT0kmj143QGzQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
	b=Ai00SV7nKQiDdjBU8i8WhBZkrr/rFvMNp0FiD/6Hpq47dIzaITqQ43z3fMa3joM1z/iO
	 aRsx8Fp/oJYVvUoUzmwJJQTmvghyefrSpSlaFzVN14SGO4lTN1kjDSSgt2vEm28iJMG8q
	 4SHtmVR8W5NmbdpmE3xCD/VpxvYjc9SlqniBqnFJLYQSgI6CHei89CMw0CfIYXYgDm90c
	 2VOqGUyR6T+yGq74TONT7yIpM8OMR+1LjHxpyoTKAJ+LOmxy9hmIZiE8nn80Gdx60gN5+
	 hfmf2HlseG78sfYbZieORpxAPav4gEMpLGvAWRmwWlSzPj4Ina44ztV9Us2mqzKkpcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B7606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F3B7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeHVO1eH
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so2330555e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184156; x=1794788956; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=XeHVO1eHmzTpneED2NyUHi6QH0SGLEunvqndFg4qax/rhqQtMVeT/ES4fdDAiF3YTB
         ILc5TnUa0c5R1wx7DDLpX6VKiRNuQOoU/VVJ1MGfRbvSl9QKw4fAOF5Lw51dwGeYQ3QB
         wi4c+IMQqigaQl916Xw0Ad58fDMEHwobfwsei6eBkDruR84dzSrIE+VV23cjKD1Wq0Ys
         au0dWvo/sZ9LO//UrJHDYp1H+Do0tB7b0Rlx1GtRJTO/oDOzpOam2Sr+0trDj0XvFS1t
         m/JKtkd7PtVoCWJWOnRM9Vk+R+x/VddsEjWilgWqy+Pi4vDB2igl0gZOFOVCSruYILYq
         AMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184156; x=1794788956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/7Sjl5X8NYVtqrzoL9Q+ErBL/nm7puUgnIagdQ3DVag=;
        b=2Vy6nXkghx9/vb0PeQUwtYvT/lu7uPHbPATJUq+Bh+90G6nQ7M9DhU13/Hab7EjC4U
         IBD9f1j+gI8dQcIqAxvmM2QXJ5VGeMt/oOIHI6kvXrfbZbQpG/2U6HkdEmWoQJWReimt
         CwRoREAPwxY4q8TZPhDQgSiYcO5AcA4ebv7hbxc5Gmg1g9W6+YbQ0H1/sTgH84fzYdsv
         ZS83eE60F8zqbfvGoDNMkYhCS+2vdxkSz7ClttXEvws5WpIGzlztYN2p+OzTr2QEq1Vl
         L5GRf6M6BjFfJIgDFkNrzmInWVhIqugQi9596SUyAAKRGl3Xswo5/FlJdkxnr9IKOdlq
         a4Ew==
X-Forwarded-Encrypted: i=1; AL+hErHWw6ReneIZh8R3FBARw51qJKg/0nd49gjs4RNjenjUNhnI4F2MZ9EXx4ii1rodHfK5/SphDHvFUhBnfZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kIpc5CK3oCk1DedUSr61VlUdxcNDr70O8/tFDQP6FF4mwNIDA
	z2241ShUdrekj2L7Ft7/LnkWqHayTa5reb3nOZ0PCajjcC1h+WRx0FgA
X-Gm-Gg: AYBFou1vbLKWd/Hm9RWb/y43TYd0DrvncrJdBLTKzN/wIxKAPCcBaVeZVlbJVZgmPaJ
	gGx6IR1+dmBDz2EhMvUJ1IYyWQkGfvFK6fVsigFK/Kw6F2+GOXoCEyhREUbcl7aiG17CsK0KfJF
	nBiyJiu3DqC/GHhiwZNXSjF/Aqj4cH5E8z1LFivgqpkmaQkCH/xdARItn2bA4lQLFPsEE2eP571
	n5c0JI/U1VLjOQXydaEg4TTi/T7IAlhCtb4zmd6KtuikyIfCEFIZwWxdqyc902MuwM+7Rv654+T
	VadE+XRuLlBy48be8+khg9WS7urHUu91Ty9j1GEF4pNJINOAGBtx3gRlK7iJ6y7xHkBjuID+pJ6
	BP1v21KjFn7gyLyB17GLTkuuLbbvdtxJKKApmL7GBBc7+LzkVEhqCiqMK8jZwkuGb1IJHErx4Gj
	B6G0g2LpyH9BBO7GpUfatlYUytd+3R7d+2bACNeTFeIdALPBZWWjTlUEKYla6zT8/YKjxYLAI9t
	08hIBnrEZWmEmCYP6ZucOP4gXhZ7wwMFaLVuyAa7lntduKOrfRSxeoEi00IteCLqWFxMiwkQSCP
	bqSKh1Zcs6NhOUTE4yEmPp6Sn4+CDbv60+zR6/sM
X-Received: by 2002:a05:600c:314a:b0:4a5:26b8:4507 with SMTP id 5b1f17b1804b1-4b963c74205mr50122005e9.21.1794184156029;
        Sun, 08 Nov 2026 16:29:16 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:15 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/5] Add RPMh and global clock controller support for
 Qualcomm Halliday (SXR2250P)
Date: Mon, 09 Nov 2026 00:29:09 +0000
Message-Id: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIANUT8WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwML3YzEnJzMlMRK3eScbF1jMyNDS4M0kzTTlBQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loA6Hz2LXAAAAA=
X-Change-ID: 20261108-halliday-clk-362190f4f5dd
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=1914;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=uKIpXSczL5GAI4liZmQ8OnhhHWMDKyKJ4I+wY+f+SRo=;
 b=jsWNwHFjnQup72vwLh+no3Ao6fRtevTWkJLU1Z/hEE5gAg5Re1X1JEkAl9lJnkkO0Q9uKeyFF
 5gBpTLle99/C9THaABeA1BqvXjQ/BbTsh8DHsSw9A3tE17VgISMKKtj
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the RPMh clocks and the Global Clock Controller of the Qualcomm
Halliday SoC.

The GCC has the clkref_en gates on the outputs of the QREF block, whose
supplies are shared with the UFS PHY. Patch 4 lets drivers built on
qcom_cc_desc register clk_ref clocks next to their other clocks, so
that the GCC can vote for those supplies.

Halliday (SXR2250P / Snapdragon XR2+ Gen 2) is the SoC in the Samsung
Galaxy XR headset. The DT changes follow in a separate series.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (5):
      dt-bindings: clock: qcom: document the Halliday RPMh Clock Controller
      clk: qcom: rpmh: Add support for RPMh clocks on Halliday
      dt-bindings: clock: qcom: document the Halliday Global Clock Controller
      clk: qcom: common: Register clk_ref clocks from qcom_cc_desc
      clk: qcom: Add support for Global clock controller on Halliday

 .../bindings/clock/qcom,halliday-gcc.yaml          |   84 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-ref.c                         |   91 +-
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/common.c                          |   60 +
 drivers/clk/qcom/common.h                          |    9 +
 drivers/clk/qcom/gcc-halliday.c                    | 3552 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,halliday-gcc.h      |  249 ++
 10 files changed, 4030 insertions(+), 50 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-clk-362190f4f5dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

