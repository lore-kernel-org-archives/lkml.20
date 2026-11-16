Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864246;
	b=jDBDLnYh3Sm/2NXd5DEK9zlKf9/h5HkgEGZzxQqj2C6kGEVdzs9RCpbN/1YdMc4m4UNP
	 1v8XG9J0Mfybeu4tjSRgAqSdiJQD8KVLrj3R8czvc6PjcqlVRstJTwyfzpYOeDSHldqce
	 Uei7XSLtKtj/o+ctrX2c22XDn2NYBEnRvbqxuE3PiFHqaxuW/JSddat1F1CGtq2HNFOgE
	 OAQgCFQtt+P1WA3MXlzT0AOksMlVKP+MS9x2n6MjJVFUNiyiKSNlwDSymQWtvDSngKOnd
	 O01QMju/tgzV5pLtsS5i6PDHwZxWgiFxf/iSB6Hl/9Tyj9pfeI+Q26OhDmUENolAdWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
	b=mXPsNUXyHfkGHKJo/5ApPnYO3mphfQk3A7vu3sVzev/4uJa2Lmvu5EX1NhjLTMrz5r9T
	 UiUbXixcMc4UGKMucWZ6Y7Z6CuZ6ViQ5okDZkqNF4smUgg6OuvzkgCDXy3jPUs1cEHaM6
	 bocqdcWaE2ebnRA+7VaBgUdsY0j2TnbMnVxZ2t9LumziR1lwAaz8SxGCXggwsTSrLIgVj
	 PTkv6+bnrebhE8hW2YzwkYL3mU9EK9jMxFldN+hgl4eF+/WhXTIZBol8zugzvpUOaYlQb
	 VPnIKDgRKGCIpoPFmZVD2ihsapxKiC/6xuTShk1yOWeH3kT79Nc6hVt2UdrDHMQSM6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FrVzVN/7";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57177606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57177606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FrVzVN/7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so41517515e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864244; x=1795469044; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=FrVzVN/7M8VJOf7RTuhHp8/yRHlOH+DRPTKtOhVt6u/fag+es6Esis6pYgs8iyLlvX
         Bj919y9GSQ3QC/2irvSwLiP9evSGkV8f/Q2ZT5ZaCPq6cvFC94YMDMTzE+1y+oc9xM+3
         ACmHgTLgInBx71qLZTLRe34YZUmhkGF9m0uktlQx3fIBG+Pr6AlPQ0vliGMG8svdkafT
         7gSjrkg0OI3JDU7Ob70hj9KnVK74R49PXhnNYiIv2mqivf8Bjn9iH3i/f5TOyL+9tMT5
         DN7TXmHLJa4bgPfpWmLU8UFWkD0Qj4ZrNo/pZdAsaqQXxgWltVY3AEcWs88TlOddR+Tg
         atZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864244; x=1795469044;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klZLWCiok3TPdWsvwnwKQ9IY7VOb4Jw4L7nWDxuHtHQ=;
        b=MV1mIPdtI0zQSt/mxw+vGsghDPT2q9XWmGYz3VDIwzvpzCHzZW6eXwx8xwXqIt+9qs
         EVCezdUiFYlhVTT0MxpL/GZ/aRziBYuNI9MGvZWZ7cLgZWDKrtmoEReS4tMTuWd4Nvw5
         0GJHqLeXtAjed38so6ut2/QZcOoEyAr3/zmgyO4f6E61ARpJfwRIw5EA1QT8HMEkhIWC
         yWoTLc56KNX2WaLlRZJTaBd+xiudgWyZ+aMQflQvI1KAd86V9nOk+JYqVzbQYehg4ULC
         3gz+WkdpeJiXnk9THT1M4XdhTGKQVdoSMtDJeYeJ3H1jg4bRZiFhLBGjJfDxHP8V3oIQ
         pn2A==
X-Forwarded-Encrypted: i=1; AL+hErHMMREjMe711K/Asik+ZiP9oaVz37Czgjaru3tJVVs/7dj99skJvPKowlk2ITmZyVf67m+SklnYB/xeb1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LOjTGDpeTDUAB7iH8im1DX+eKdMPOAm/btZQJr7hUR37Nxeae
	uESQTVjVt9scu5IBwOiguNO6n0EePEVdXT0KaNEAsckD3OQ5RQCEbI40
X-Gm-Gg: AYBFou2oP1PCSTUpFt5CKF4Eyr4YA+kRuo+0riA/QXqTFSvc9WQaY67CtGQAMQTPByx
	9yxnWXBd2PTevha8idlelFbvegmdLk158KdG5BSS0qLGCOEh7RiEv2G6AaqiIZswBGNat+CyYRb
	tyHFThHZ8gFLr9N1lymo+XLt7Kg+ApiKQcAlzF/UVUexbDPuNJ+xir/KDeXZz4oG3sdb0P4wV3a
	5FyLGWHHGISLawCzSsl8e6x2yNsN0MjW7gRKmZBUjN16JGUD/ZGS9CVvqjfS/1RMVNGxBhkPVZ6
	EFnfwWy+21P9wyoxBufCPn6TKkHeEWA+iwfxCYdCdBjqLCKaXRHVv9La1fTmiZEtvitBR7gFJW7
	G2X/T0QWoJP3h5sqqvvGDGy7juxgg/2563G8Ec8KeK60c70uSRm3YyuZKkD+LgHEkHC+n330GGX
	piCOVT8VEidARVcO5v3QWpNnvJ0L0fNIYon6pPGRH+MgdVPldO8gY+kagM6RO+8oV25Z/MXU6iF
	+hKAlsJCqWkeGVeAohCpGvlPYCoFsv21MT4TCW6Ei13N3rsyhu99S/rTzXE+AU11hwmDEa6OSaO
	H+DpzYJF3/V4r/kVRXaBKeHVxcSFkPwhezI8S7Nj
X-Received: by 2002:a05:600c:3551:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb55abdc18mr258614455e9.33.1794864243814;
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7839c5c3sm16520325e9.12.2026.11.16.13.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v2 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Mon, 16 Nov 2026 21:23:57 +0000
Message-Id: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAG10+2oC/12NwQ6CMBBEf4Xs2ZpuBUVP/ofhUNsF1rRgWiQSw
 r9bMF48vszMmxkiBaYIl2yGQCNH7rsEapeBaXXXkGCbGJRUR0RZilY7x1ZPYnDei1oV8nDKU0I
 S0uYZqOb35rtVX46v+4PMsErWRstx6MO0HY649n7u8597RCGFxhJtkSvMjb02XrPbm95DtSzLB
 6nbTti8AAAA
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864241; l=1289;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=xrLm+TfVvJoEp6IAVQCzFe0JVQwue5fgBOr1usvJ8nI=;
 b=7vzILpl8qrChpgALa3GHPPZN0zVDnay00lup4/uriiZw4XmAw75/hxuRsKAUVN+Q6+CVi4jHQ
 3dxYYOry4UtB0I+DDwkGBFfhcdaDos1AwtoUo4281yfyuVXiNDXDLWU
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v2:
- dt-bindings: Add the tlmm label that gpio-ranges refers to in the
  example (Bartosz)
- Link to v1: https://patch.msgid.link/20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1825 ++++++++++++++++++++
 4 files changed, 1982 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

