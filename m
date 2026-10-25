Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792902100;
	b=fQ1//slYwbkk46V+8IPeH5v1MfnliZrMbmfdXCx2syrmRUZ6tG8GonakNBKNGDiEKTXW
	 IVypR2pcut4VuISjTGJJJRCJtm4oY4xLTyfBJQdahuVmWciegz/YNbTkeiZ+/l4E24uA8
	 rUTUjLb/9Qe5q5r6ythJzhKtCkY7axUbGhyfTG5FtLgIE0NogXy5janda4UrzF5hiVa0f
	 ey2+hhs/iTGQvflJ1JnJpvvaEg/U8cgNRiUHCDgyfvGNG4CY4UfezoAaAzDymPsMsEauh
	 LRLSj9NslXLFICMjukfqTnW0Owx8mI6qxKwQcM1yblelkjy/vIcO7JnVCkEiyAnvdJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792902100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sQpV73Kcs4GI5xDw4C4m9SV0di9xYR8vy4GAZW0RqrE=;
	b=2PutlJkwhI8resM5s4kL0U5tIpbPL/Zhlp0NWiE2+ZRP/p7Sv6sya4EQIdtcpDELEhdO
	 GSZ6cjB3Nc9qDuomSmbPVOOGoHcGTT4NZD4NgNCyzWuJXA40rIurn2bifHn0usiQHOUsi
	 NnRrLu+fDq5TFZqgIMmPwfjZDQhTeXe57oSiymSXdURrnW3P2O3z2UV6x91jJHBBvwljy
	 j+2P/fgr+XYBny/P9SXoaO0V+Waqse+6C3KQtpEiP3uHE4qzNXfjY1iIxYAM292u2GdJA
	 9CS1JBuCO+A2oRHOwOaaWGAOtZSMMlEJaftJYGVvBbW3iq5tI+KU/Es5BGiMcqtSCJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbAJ2kgg;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A1606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8A1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbAJ2kgg
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-156cbe59524so1146336c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792902099; x=1793506899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQpV73Kcs4GI5xDw4C4m9SV0di9xYR8vy4GAZW0RqrE=;
        b=BbAJ2kggBXisKSYtQNvdmndB54XQ0cgBU3M8e5krx9TxDZ1vw2AH8FlDfRs3kQMra6
         4YOVd4xYXK6+NJ/apZB6S0E4yeta0IAt6Kq/DZuAdlXxgg81KTNBtX3TMT66zTYtRqat
         O3JoLVsmVMj3TJGPes5NDcUJ5P8MZbS4BTxhYVbLkK5d16WCE4F418uF2SbXdHQLmtfT
         8Vwt4ChIRw24QRz7eEjQXw4AV/1fUlkD2tdd+3KeShqjcFdPHz4G+SvkQpQwWvCnA+O6
         Vchh8ZgbXj+Hsc56Pq7rs1qkISVA8N2kisRuR06d29gFbMiq5J4BtE2KjAcCJKVq9FH4
         1fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792902099; x=1793506899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQpV73Kcs4GI5xDw4C4m9SV0di9xYR8vy4GAZW0RqrE=;
        b=K1MTqewqxZtKoe6dX7TO7CgJvosv18zJLlMR3Lp/Uw/gZD7jWJCVCrKUlXZgnczsgz
         /+JaH/tMs0WMLwR9FlM34GPuLh/Or2T2xYXg+Hj4uH3f89RDjZYZIqnsskD69sOMy/Rv
         Wjxn/PJ5Bk0/FkRpIi4F0SFDOeeDcJitHgngl0ZoCIZxbJacyNBZ6Qhp7BrjcdihvaPr
         4Qh7ZFoBjcChRI8Wbg3qHojkjFSQLjJWz/RTd4MZcNFgoLeaqjZmHT82FnqP9qwTNSIf
         t3l4zqw8aIm/JmJDTT3C8kjkd4661QTyH8Po3UIcfqAuH6nJ90rfZs/OrrHxndgrG9FW
         UupA==
X-Forwarded-Encrypted: i=1; AKwUvBw0D9lrVst8GbNwxEZC1jnOsckUOZ/Zd5GLZSg6oolOvz1XoopG/cHqLlEJuCrXwtXuOPjYORFfAUwySrg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe+Pr9TUH09oFoyUWKcyorbiZ6kk9slbxH/GUABgIv31cn/qJX
	mTv1c0+FikvH4NLOo5pjwSpM7BdTNyvG5yflJrQ/CL5mGnF0njyWposn
X-Gm-Gg: AYBFou0FX9hBJm5zYM/dBEDcOcRk/7a8+QCdmRWYwNN7gnlNIwv9UScsQofhlZtfdEp
	Zkx6DMDYPe79Sr8nT/qfTpgSS5F+LTBrr9woyT17S4JYOkd+7MHVeZWKyyoZH777gPtuk5dd4Mf
	ysNW8IAB7qbSKbxFUGpyPebTH262ITIeXbNK7+AEB1pTxJgpfE5Y1j8jAF3N9kJ0/6C4ZrBIqZH
	nXSjh4RAzrNsXbjFHDaCbEfD0ix+UyQMIGVYrVxtjuJjO7lH+mISEma4JyASsMkg3RgTsbzy806
	0gaL7sckekpjTTAO2o+SVTE2Jvuzuw1K7twTu9DNPb/4UlXFxqdlwQBHOhnkT9dMOGkBEwc1gi8
	/NrRx3UIJji52M9TgziN3fOoxjo3/oMeALxHT7GFiyk2LVWEkqPGrV0W7rWkihcI0+nsrw+qBNz
	LYp6XWd8o7pe89qW2qt8lMlUfdFVrd09KzFLJsRlzAfEwZUG0+LfsQ1bTYg4xteOc7SMlPzVGjF
	BxuEQGZLskRZ0CYAYvAOS5YahMdVAs5+LlOgWV52SNXytvd7aZa7oSIdgzYnnm66siPF2T13L52
	81ap4UQT/PcmaXGD4c3Qhg==
X-Received: by 2002:a05:7022:1e13:b0:143:271a:308 with SMTP id a92af1059eb24-1993f6d7a1bmr4400139c88.46.1792902099202;
        Sat, 24 Oct 2026 21:21:39 -0700 (PDT)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm14037825c88.11.2026.10.24.21.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:21:38 -0700 (PDT)
From: John Macias <dencity7@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manikanta.mylavarapu@oss.qualcomm.com,
	varadarajan.narayanan@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/2] remoteproc: qcom: wcss-sec: add IPQ8074 with a separate M3 image
Date: Sat, 24 Oct 2026 21:20:58 -0700
Message-ID: <20261025042100.1356088-1-dencity7@gmail.com>
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

This adds IPQ8074 to the WCSS secure PIL driver, on top of v14 of
"Add new driver for WCSS secure PIL loading":
https://lore.kernel.org/all/20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com/

IPQ8074 needs the PRNG AHB clock, and its firmware ships the M3 image
separately from Q6 with its own load address. On the board I have, the
M3 image goes into its own reserved region with board data between the
two. Patch 1 lets IPQ8074 name its regions "q6" and "m3" and give a
second firmware name; patch 2 loads M3 into that region before the
authenticated Q6 image. Without memory-region-names nothing changes for
any compatible.

Testing:
- dt_binding_check (dtschema 2026.9) passes; the schema also rejects
  named regions on other compatibles and a named IPQ8074 node with only
  one region or one firmware name.
- arm64 W=1 build of the driver as a module, no warnings.
- Not booted in this form. The equivalent change on OpenWrt's earlier
  copy of this driver has run on every boot of a Netgear RAX120 v1
  (IPQ8074 hw1.0, WLAN.HK.2.0-01792-QCAHKSWPL_SILICONZ-1).

Varadarajan, would you rather fold this into your series, or should I
resend it once v14 is merged? I am happy to test either way on that
board.

This work was developed with AI assistance (Assisted-by tags on each
patch).

John Macias (2):
  dt-bindings: remoteproc: qcom: wcss-sec: add IPQ8074
  remoteproc: qcom: wcss-sec: add IPQ8074 support

 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 96 ++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_wcss_sec.c       | 97 ++++++++++++++++++-
 2 files changed, 184 insertions(+), 9 deletions(-)

-- 
2.47.3

