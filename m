Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD86175A7F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792284723; cv=none; b=WlrK+7lJcfAYIjBzOurPiopsRR19fNV65Q7qCPkEbv29QkbZ9S7vz0EedJbKNb8WgD1zJ1PuBCixu2v8a7bfZq50Pa3bCVZvE/5brZKAyvqrkHXKHsUMcf4Cp+mPGLjQ89XZuCv6xbFPBee1pHOR+sehD1E6gaLxyCEGot0AMGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792284723; c=relaxed/simple;
	bh=eTUJ67U7/3BnLFH+qFQIlNgaP3/PqrNrZtJFDGZhTNU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SgLv1N3gGov6r9vW9jdse/AHRqy3O1Cf5Vv+A07Z2FUKtjoPnsu1cHdzOckC9S1Vw39CRUQtN4f2LSZLnc12wvN+hu4U9qwvsdCM/4O5ejWDSoSv8ld3qIQXOeYqO9gNuWDXZ8G2QijbBBlI/JaeIUHok/UkNahen7qVVZwwwXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMVzsHe3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMVzsHe3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bce4e278baso1332357e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792284720; x=1792889520; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7AXHPdZUYZbA72hWR34lPKHVl/XaRfzFZKPUd7IEbek=;
        b=GMVzsHe3uPcI/30D2LiG6SQnAoMk4kDqsxpv3tG+Y1+WdagUo/iZBmBNCIBr3lHrwh
         QP+qaCQRprfA6u6YmYe91jg4uUaE2bhwViQJK/6WPFmD+Obbuzjg84ZRYZzQZvfDkiwV
         pd+tY3/9m5bm8R6vSOerNXQ+Hl/oDqFKaLD8KwzeP4QyZXR2pneWS+T1vENHIcAAu9HT
         d8y9wtkidzEYvQC0wqcHle3cCJr/+O0wjyZ3UM98yf2YmdlOMbPg0mXSnSUkIDs5CamW
         1/is9s29Z+ksp1EvnR6WfibKp+bEPR5wEuxbb6yJBvc3+vN1iPI2g8xkDJ1FdqdFwU9Z
         XtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792284720; x=1792889520;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7AXHPdZUYZbA72hWR34lPKHVl/XaRfzFZKPUd7IEbek=;
        b=cXXj9FfDincqd+zNasYpac5bjfbBzvx/0u7ez7aXQoWN59ZXkl8ap3AxBxpaqG1O3d
         Vzm22DJoEKP4lpqhf5YrxQJu6ecXW05IYSN50a8AhyEERBC/dQGlPKv5MgM85k+48nmr
         iwxNkdGf2INdMufdM2STZULo4iidTfEuAPDcLem5pUZ2tI2MxQ+R2e7k+7+e4tEVycdH
         YE1qnQ9Stb2o2+3Hw0yiBpgmhNSfR67XqRd+RqHH6azlmQrHqkG9+D7SBU1DIljiKyfA
         mIHMulW9fSccQMYahj81h+KUctqrWB0Kh14uGgoad6G8zPOjmnMtbJNRMyvBBWACfhv8
         iTTA==
X-Forwarded-Encrypted: i=1; AKwUvBwpxFbZtB/ovw19JVwUJ4kG+Tye8Y/7G+DKwJ6OAADI6JYPoFuKNpVV3I9/2TnOC5FTuEK+6W80b51hYp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyqA6WQ9cgyIQ8TQfWdp6XhPoNMsOwuj1p7nmhtrhwzy6GMvxG
	ewAvh2gxhvwKk9ehDOVisulqNu3vjqG572olMpZPMxs4pHjZFuTx2HNI
X-Gm-Gg: AYBFou2Y/bK108u+KeRb+bqpYPowLtiLVyAz1wKQNfup5LTk4bAIaGKaEpgi1x5j0vG
	1Y4r1fODrWA6T4c/v8svMZsaCFBADZugTVypncK2K0CfLG3Zb43ICFHRjzBFyM9vL657LXWc9Xg
	dBZuAF2Ykmdm+ppecjcJJYvq5DRLPgBUcVRKGl86Cl/9S51mzwyxTekx8BRl/EIuhXeE7FKk6C9
	4EgsrQAx6lIUwWg6g5a9MDNMu5HoUyKHEyjSuJUZD6HBgyf95WBFMmfMzqEXiJi0+nhPG185FV5
	rWlU2slJVaZJYxgNv0C/27LFsYjgbTf0Oe2V9v3EoVP9c21hKLMO1KAsUYgw+tJnO755crkj077
	RCzL6jIev4vfToShSH2ulRfG4igjOtKLMeYdRt5VqBqckAixBx5T/+rQWrb/TqCCL/0MBS4ZGF0
	MyRC9DW2FJqGoHT+Hj+vgZ8OWefRTJHiaPPWlBUCW0N2ewSrV1mWWmj2HbcEak71/DvhLhV5kXR
	OhWIUv3tfA4HugxzpBa39wUrDccomPdDSCSM+PQTTw4
X-Received: by 2002:a05:6512:a83:b0:5be:4f62:5b84 with SMTP id 2adb3069b0e04-5be4f625f92mr1163822e87.19.1792284719388;
        Sat, 17 Oct 2026 17:51:59 -0700 (PDT)
Received: from [127.0.1.1] ([93.189.202.99])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a6335fesm1158148e87.57.2026.10.17.17.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 17:51:57 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH v5] bq27xxx: support interchangeable OnePlus 6/6T fuel
 gauges
Date: Sun, 18 Oct 2026 03:51:22 +0300
Message-Id: <20261018-master-v5-0-0be16441cdd1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWOQQ6CMBBFr2JmbbVUaMWV9zAs2jLAGGlNi0RDu
 LsUwvLN/Hl/JogYCCPcDhMEHCmSdwsUxwPYTrsWGdULg+BC8lIo1us4YGCm5rqpS1lKbGAJvwM
 29F1Fj2rj+DFPtEO6TgmjIzITtLNdGvlALbnzpkv7juLgw2/9ZMyTZy+97qVjzjLGC2HVBW2mp
 Lq3vabXyfoeqnme/+1Z0knOAAAA
X-Change-ID: 20260927-master-bd0afd9696ef
To: linux-pm@vger.kernel.org
Cc: pali@kernel.org, sre@kernel.org, afd@ti.com, 
 konrad.dybcio@oss.qualcomm.com, david@ixit.cz, krzk@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792284715; l=1522;
 i=rinat.muhamedgaliev@gmail.com; s=default; h=from:subject:message-id;
 bh=eTUJ67U7/3BnLFH+qFQIlNgaP3/PqrNrZtJFDGZhTNU=;
 b=uiGK+g5pHQItU5xVxRjt8VNW+ZCmDvRM3V11IWSecneXJCH+CRkZxvse2DbTG8loYZ3qLdd6H
 f6ItcjEytIhCoJc/KwaeLzxB8oF8HRcodNTbYIqdFlangqBPQhgOSq2
X-Developer-Key: i=rinat.muhamedgaliev@gmail.com; a=ed25519;
 pk=qkYQO8LRlRErWiLzlpK8jHbRIxv8+7v06+ytcxX8mec=

OnePlus 6 and 6T replacement battery packs can contain either a bq27411 or a
bq27541 fuel gauge. The latter requires a different register map and produces
invalid battery readings when interpreted as a bq27411.

v4 drops the proposed generic DT compatible and DTS changes. The I2C driver
instead reads DeviceType while probing the existing bq27411 compatible, and
selects the bq27541 profile if the device reports 0x0541.

The bq27541 path was tested on a OnePlus 6T with DeviceType 0x0541. It
reported 4.338 V, 100% capacity, 27.8 C, and Full/Good battery status.
Testing on an OnePlus 6 or 6T whose fuel gauge reports DeviceType 0x0421
(bq27411) would be appreciated.

Changes in v5:
- Report detected and expected DeviceType values instead of hard-coding chip names.
- Describe an unknown DeviceType as unrecognized.
- Link to v4: https://patch.msgid.link/20260928-master-v4-1-052c73ec1767@gmail.com

Changes in v4:
- Drop the generic compatible and binding update.
- Keep the established OnePlus DTS unchanged.
- Detect bq27541 from DeviceType in the bq27411 probe path.
- Send as a new thread.

---
Rinat Muhamedgaliev (1):
      power: supply: bq27xxx: detect bq27541 behind bq27411 compatible

 drivers/power/supply/bq27xxx_battery_i2c.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
---
base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
change-id: 20260927-master-bd0afd9696ef

Best regards,
--  
Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>

