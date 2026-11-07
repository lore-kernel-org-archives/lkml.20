Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060968;
	b=a/8MRx2uVkhR++nhjfPBuPhNRsmi4eABYNyoHoH79S1XOcIIUhz25w0fy41iRm5EX++3
	 pTbGwbpfJRnocbUKfpvZfw5YKBC+1pxXx+QcNGx3+xnBg87hEQuExL/uGtqVNMOiW6CGx
	 o05l19iDcVri43EzQYrc/4OkTzgsRxh1FD/NFriCdnTPZsddaAe8k8Kln2f0226jhLgVB
	 djdyA6hVgz+vX0IvN0pxbUN+wGd/3tQ//juMgPxMhfOaJC23J6CeMUSSQS0ba0/W4x+lQ
	 m/LQS5jt0lseFxYiaKyGENezqiIDNDiWaDq4BsczcqidHwsZ9DBsbs9lBw4Y1nJMzNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Oj4hys2FBjnmV+wzZLqdGQJybNqQMsqYbvklsOJc02g=;
	b=stY32ek0CzAaH9ZcwP4ilruODjx2B2IA+m8F0X3MaUgJUSVZEFId/U1ynJ8dZTtF9K/j
	 K8XWG2FYUSeLv2sulStYJqCaZQU8NVKOkX7UILsLk4TVLE3lnfp5vtm59/luhcWFfqedv
	 +V1n3nitCsHTaBuDuuW6W/KE+q9bS/UmDbkYStvpaeiNd0VWAEJt7baudyf/uOYjhjZ9H
	 sz5gvBXeJWzEMrjIVQBOc4PppAHw7mK0pva0/mWdDjnZcdz7tRaKhIjKhMbjgXUCh6sIR
	 1jFMTta4kOEodX6lLj2E+tyGKpm2Is/lYUoRixMXic/oY70gYC+qeEzh49M1Zvpp/ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQHSi2JL;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C037C606D82F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C037C606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQHSi2JL
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b1015a4259so550230a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060967; x=1794665767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oj4hys2FBjnmV+wzZLqdGQJybNqQMsqYbvklsOJc02g=;
        b=aQHSi2JLbXZzRvHKmUV8NRbTN6TUdr2zNg+ceW1CK/ZlNcyZTXPvHYbYlqW2Ox/qJB
         ezcuSkzsniZZMwo63oZPOtqYWWfwZWecbejOrZSI6cq144s8w1aj7HExsylQIAzrl67J
         Wmh96XtIM5gPeusbRaeD6jFajJrVCs0xlT9Mzgd4KXmZv1JByFH3g80Dwkfl9FDbJNSO
         VRPaRJ9/ys5e0DGP04Wf5LL+aHOzlmYvxOwDnYc9cUPtkUQZuJCnRxP7X/q+BdgL5J4V
         s7ey9EDBpWJgczLcJqV/HVXZ4ZYBlGaC/8a0u2XpRLd//UuFjwG4MdiPzmhyG9fki47Q
         1kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060967; x=1794665767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oj4hys2FBjnmV+wzZLqdGQJybNqQMsqYbvklsOJc02g=;
        b=UCKH5LyT2gotexUqJGKrHVGF58dmLn9j2jACweNJ6OxQp/9TX2aPRgeAeuanb7Pj1D
         q+rMHlDOWI5Mma1Z4xEdlkKjXW+JvVti3+vhORiZvE1+/E0/FHLkNfpfPbNBZWxEEihr
         42s5v1aJ3wzttUaW1tNO60+2KkOGB4oEw+lXeGvxle58WrWSeD6vaL0XoKrLQzQyRxlQ
         +LuvkV4asbGJ9jjK7tvkvULiIX2yVUXFziil4CNkldEOys7rAh5zGwdxKzfpNy+6P5vG
         0SyRA3CjE6Y9+zNxo480M6QVOVUKJ1OeKU3sNw+AdcizcjF54MkeorzDrC7DK32stFLn
         Ztlg==
X-Forwarded-Encrypted: i=1; AL+hErHS392ZmH+vlrLdVN61RBeqR8t9lkIBXh7GyVEWhIGpkgdt4NifWa9nQoUYAhfOOBh6qiTVlqmiArAVRGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TlIi4Xhz/1EDOCuD96F04nL2UNbILs0Vw6RFbq5rD5xofCCVm
	JTIgMipta1MBa0pMktpJAgmh3WGTJI7RMCYJhVVNkQJSP0OfpbfbAzS9
X-Gm-Gg: AYBFou0Wrha8Gr63m0xOPWIqa9wbWEaYX7vnhgb5cnpIy7btCRiAgaajDkWd8+HI3ZT
	YWbkCb5rjNZRX/WLN1ow8x4o0KapGIzKAKJiwBrk3Ce0Oyni7V9Bq+ip5p5t+O8S/jX7Fhqtkrh
	lETk58DwQqQC+25N3jDSu3/ik6oxm4T9tJbvlPYc5rADreIPDya6VjLTiWbjEqjVrtWuzMJ7/dB
	DzgR9g2KXTgMrb88Reb6aga5aGKuINtp6g0hrdMzRYAWiMEMiqmiMJgDYIfp+JXyS7V8+EMQX++
	VhDQZtzNyEsIsBzFcQJS8YZKirurHuHGrWPfZRFWRwovS/L2e6Fggau07d1/+zwSUC7bI9ll7cK
	ou0aolvohw0UDP+Aa1rtRYIMYNH9FUR+gztPPenunAHLE2/oIbdZD4NjZ5QbIjq21eyVjpkuEAj
	dOyfGRAu3LtT/olEb37Dv38AwqaZ61C1zwJYF7SExsvc0p3evz8WBi9/En7uzwcC8f61TOblXyQ
	pwi6/N/rhyyWcOKbec1rhDrIKZl9oapfKEfk/ubxndDLOStFwGUMvClGUjE7OJDDLTPOC694HvL
	3OBTMOQEEMFJ38E5xf5yOPlTgTr49lg=
X-Received: by 2002:a17:90b:33cc:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b0db6d37famr5526170a91.35.1794060966901;
        Sat, 07 Nov 2026 06:16:06 -0800 (PST)
Received: from debian.lan ([103.189.116.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm3503778a91.6.2026.11.07.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:16:05 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: abelvesa@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	barnabas.czeman@mainlining.org,
	a39skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com
Subject: [PATCH v3 0/3] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Sat,  7 Nov 2026 21:14:29 +0700
Message-ID: <20261107141432.39099-1-killdeath104@gmail.com>
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

This series adds initial support for the Xiaomi Poco M3 (codename
citrus), a smartphone based on the Qualcomm Snapdragon 662 (SM6115).
As suggested by Barnabas, the shared parts of lemon are moved into a
common dtsi, and citrus is added on top of it. The series is based on
v7.4-rc1.

Currently working on citrus:
- UFS and microSD
- USB host (OTG), limited to high-speed (SuperSpeed is untested)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

Not included yet: the display panel, touchscreen and the display
pipeline, which depend on drivers that are not upstream. The GPU and
its zap shader are enabled, but no DRM device is registered without
the display subsystem, so the GPU is not usable with this series
alone. Audio is not included either.

Firmware and userspace: WiFi, Bluetooth, the remoteprocs and the GPU
zap shader need device-specific firmware which is not part of this
series. WiFi additionally needs qrtr, tqftpserv and rmtfs running in
userspace, and the Bluetooth controller needs its BD address set from
userspace.

Testing: citrus was tested on a Poco M3 booted from microSD with a
v7.2-based kernel. I do not own a Redmi 9T, so lemon is untested on
hardware. Instead, I compared the lemon DTS before and after the
split, normalized with dtc (dtc -I dts -O dts -s). The only
difference is the numbering of auto-generated phandles.

Changes in v3:
- Split lemon into sm6115-xiaomi-lime-common.dtsi and add citrus on
  top of it (Barnabas). The IPA carve-outs are in the common dtsi.
- Fixed the unit addresses of the IPA and GPU reserved-memory nodes
  (Sashiko).
- Split the card detect pinctrl of the microSD slot into separate
  states, as lemon does. The pin configuration is unchanged.
- Kept the ADSP carve-out per variant. A larger range common to both
  works on citrus (tested), as Barnabas suggested, but wastes 4 MiB
  of RAM, as Konrad pointed out. I did not touch lemon's value
  because I cannot test it.
- Kept the deletion of cdsp_sec_mem and of the orientation-switch
  property of usb_qmpphy in citrus, as in v2, since that is the
  tested configuration. Barnabas suggested they may be leftovers from
  the reference design. I will test dropping them and follow up.
- Dropped Konrad's Reviewed-by on patch 3 because of the rework.
  Krzysztof's Acked-by on patch 1 is kept.
- Clarified in the commit message that the GPU is enabled but not
  usable without the display pipeline.

Open questions, mainly for Adam:
- lemon's GPU carve-out is 0xfa400000, citrus uses 0x55a15000 (right
  after pil_ipa_gsi_mem). Is the lemon value intentional?
- lemon's ADSP carve-out is 0x53400000/0x2600000. Barnabas reported
  that lemon's stock layout (from MIUI sysfs) starts at 0x53800000.
  If lemon also works with 0x53800000/0x2200000, the node could move
  to the common dtsi in a follow-up.
- lemon marks l5, l7 and l22 as always-on, citrus does not need it.
  Is it needed on lemon?

Link to v1:
https://lore.kernel.org/linux-arm-msm/20261027075116.41673-1-killdeath104@gmail.com/
Link to v2:
https://lore.kernel.org/linux-arm-msm/20261027205146.16384-1-killdeath104@gmail.com/

Amir Hanip (3):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: sm6115-xiaomi-lemon: Split out a common dtsi
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 237 +++++++++++++
 .../boot/dts/qcom/sm6115-xiaomi-lemon.dts     | 317 +----------------
 .../dts/qcom/sm6115-xiaomi-lime-common.dtsi   | 335 ++++++++++++++++++
 5 files changed, 575 insertions(+), 316 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-lime-common.dtsi


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

