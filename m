Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606278;
	b=G/8DIzKxc5csVpPN78e4+wkoT6fOMPPTZLfRwiR9JnGo2svrVEA/LPnlsVs6qDDkPmYf
	 7notGnbdiUpGTfWvIuaOanjz3AFSSooanomoTLzZbEHeHuFQHv+Q7arpNGGjb3TOhwQzv
	 ysqRqH242BmNJlVOFYC2+FGRwOUGYqQ1nRC8Shgq/IwFsoOOdZBVQh76Z3U8ZBZXD3CBz
	 Nk1+Lii3bf4PQ/XFP4ehWZx+IoyiNbGuf5ipUq3uWRCC4ocBO4IUt+GX2OPl6ViDA+wsZ
	 iUd3rShdAvhS0jaSI2HNzLqlLXPEjKRHvFrnzkFt3EENjySbR3PjJbXMciJoo6AbAbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
	b=WBuWedcboSMvrCayMq7kCzMpeDgzP+h3PvxZ34F9ZmrqRUK5X+0jGy8+AHGdUhExE2/t
	 MUYc1TOgbXb2LPkuGIvnlptQ3pbtwrFoY71MufjCtc62U9mYwOJLy7QtnrK88kI7tn4Kf
	 DhIG36MtqeDV2As3zsgvfY7HskwCaEQvfdpY0vmF3ov9acHytHVerBwbCIUUWK9ta2L9A
	 YCt7ifJWGB3z15eqTEHKhJxvEsk1rzOgm/42/qcF8Kg+SO0rugEeGU7sL/2TCMqKU6nvh
	 mNuCawCeDOCqFzHjmafo0hC4Ly0/s6OOR4mO5N6EGioGS39AlCSeJEBEiE0MYyK4Zag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kI/JEfWF";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60153606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60153606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kI/JEfWF
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492690dd5daso1808736f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606276; x=1795211076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
        b=kI/JEfWFxnNd2OdQAFjZk6WGtBuxQ0b2J1AxChRphTz9LtqA+crMd6d/JSq2A4uEvW
         8xEn8XPjVKMiXFOIWmMKfD7MxNh+Bxuqn7hm+udWlxQdIzQXr7ZNCbFOydxEiXQ7F9uc
         zJwHZQR6kplPB0GxYj/ofAShObktk2YAAe8tx0E63/rUUtRWwGhQwJbTifwqsJkfT6IK
         4P9oXauZi3svoArETQAU2dnOgAqvKCFtIGvakO5vosGIW4BIqJp2Fu8WCFu4Z3m//yOX
         KmxHY5pZuciNqybfUReUFYuEiDGadUqgzzIPQVb+O4v1agvHqo28BTQztGYreMzNSdBv
         gNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606276; x=1795211076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idHWYPumru9E8eUEsbTnG7m5cr0Qeebr13UTD3g+dNk=;
        b=iknSa16SxRIbeAIdkvHhETEaB6D/qd+aktzORqxhZjfAyejBSvA76gmlpraEIiQivn
         Mv/djuGEfmvI44dSuMnDJXXRDGMifR7yMFwcd8hGFz/535boNqjCnWDHTQZSaUQDjRDS
         3Fmr3CNyYwI3gUWobI70JRUZV3JnSmEg24/NKqvWUWWWDOqMLs5q3I3GjSUnZCQUDKb4
         96VfxdwqUjvZY4MbWoD+8nLnjjLe1UIpUKBmFVflki0q13UWqP+4iiKHWXUOjryaPI3i
         Uzt0Mw4bqiTJ9go8T/A1HCL7aIxPEKPgRYlXU8LMDYpioezcCtUn1lfYF1K+7C0qkWhd
         o2/Q==
X-Forwarded-Encrypted: i=1; AL+hErFwGPr+1xwk56dM2Iejp7IkgXn7mbw3CB+Ya1suoudrK01c0C6UyRJvsL81xfy15c56Un0oq2tU//kINnw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DAexp8rBlPxaBswiKrAxQTfa3bARKIKJJCG3TRJRT0tYffwFR
	59OowKvRgHlBtI+05h0a1NL4MwrdWVfLMJ52dU8DJsNXEX1kh5SzDK+Q
X-Gm-Gg: AYBFou2ympBmAjRitCa6akjC6pahZ+LwSX8BGWLMhkkV1paetBLAgQ2RouG2sdCEjMz
	P4yzJN6nz7JIHdFFBmm0JDcU2Gep95NgMsfvitTWzYAXiWQR/cPzb/dntnYQKwizSFBkVEHL2VW
	6XIabm9yM7F1wYgT2cE/hF820tDS40Vy3HAD8uDFYQA3hPvUvWuzWTSwKwLVpB+VJLFUoA26Re/
	phi0nEcYIwgK08KjNZy1OXdmbtdqM9lkPTAB8qCX9SQWPsFTzpWJHGWv9xg5fcxNNEs99egW2xS
	mxiTwLs/kfxB0zzAauxWvewgfoL2jy+B4mbZg8hu6GT/DcFXqE2V0Sx+TKV0EBsazPl0zuaXrd9
	IsQathGjzcspKtyWn2+ow7CuXV7HMcV5TFyYe32zyjHgyaa/GKXGs8euXFzdLPAar/YemONnbPE
	duNwvp8kf+2OjNbEdbzNOgK1+7WOk3Uv06Ged5sUtIyl6NNQx+gKinj8Gj8wbSlInAEBipBy2bs
	4fKGBYzwWqvAzYatdLMkwcCxMgqKkt6vlLn4EW5R4eWLjnBsPHeyxPBIhoh2HQl7zszlgs2xh7+
	4D33+mGLvY1zIMFVotLPecC9SbgttVhC3ULxXxyA9C26KyyQAQ==
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr8024260f8f.12.1794606275654;
        Fri, 13 Nov 2026 13:44:35 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm11644595f8f.7.2026.11.13.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:44:35 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:43:39 +0100
Message-ID: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds support for the ASUS Vivobook S 16 S3607QA, a 16" laptop
based on the Snapdragon X X1-26-100 (X1P42100, Purwa) with 16 GB RAM.

The device tree was derived from the Windows ACPI tables (DSDT, PEP) and
the existing X1 laptop device trees (Vivobook S15, Zenbook A14).

Working: eDP panel and backlight, GPU (Adreno X1-45), HDMI, USB-A,
USB-C, NVMe, Wi-Fi/BT (WCN6855 NFA765), keyboard,
touchpad, lid switch, battery, speakers (2x WSA8845), headphone jack
(WCD9385), efivars/RTC via QSEECOM, CPU frequency scaling.

Not enabled yet: video codec (iris; the Windows firmware is rejected) and
the camera.

Note for review: the CPU thermal zones get 90 C passive trips with
cpufreq cooling; the SoC dtsi only has critical trips, and without an
EC fan driver the machine reached its thermal limit under sustained
load.

Tooling: the changes were drafted with an AI coding assistant (Anthropic
Claude) from the Windows ACPI tables, the existing X1 device trees and
boot/test logs, then reviewed, built (dtbs_check clean) and tested on the
device by me. The laptop runs it daily with Linux 7.3.3; this version was
tested with next-20261112 (several cold boots, all hardware listed above,
without clk_ignore_unused/pd_ignore_unused on kernel cmdline).

Related patches sent separately: panel-edp entry for the BOE NE160QDM-NX4
panel, the qcom_scm QSEECOM allowlist entry and an ASoC line-out jack fix.


Ingo A. Kubbilun (2):
  dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
  arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../dts/qcom/x1p42100-asus-vivobook-s16.dts   | 2137 +++++++++++++++++
 3 files changed, 2139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts

-- 
2.47.3

