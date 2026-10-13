Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CD53905F0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881098; cv=none; b=DDSJ+oJeEq0Y71PpzCJtc3laTHfJLIaZzqgccuw5ldVg/WDmspXtaaN9bxM4Q2VNUuYk7G9VoH5xf3yurBK+Xx97NRa8fq/Si3d9Dr1OfW+f650ZS90axSaMtLByRndQZ2SAQMCc8/fvPFLp6iE7VGdrREt2ZOuANLZ0ky4QgdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881098; c=relaxed/simple;
	bh=fgcWuhWqbKq+G7VZsFTlr9r9FaqmS/HG5d+SVra0LIc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HGymECrQzcUx3ap0d649yf+jJUkDF6WDhkH7McB/yH2znmjZVypjy0sDrGKGsn2d6fTo88Xox7RJ1x6BL0s8ddHE27lMNWWa7FYa9VSvySAwH8xZjFbgGUK/+YUh0NAulRyIGbbponFVD3HSHpepjDCyhSRj/DAvTUj37FUaPk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=GS8493R6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="GS8493R6"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ff680331aso21765995e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791881095; x=1792485895; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sAQ/enMvzve+no+XLnLhYtDTqCf2p9kIi2WUjf2scRY=;
        b=GS8493R6BdxeCJdIo2YMDyfK6YkXNHRID7gylk/u02ZM+I6MYX/e+Vn6fN2ddh73ac
         q+wg9slX0EG8oh0gPee/jlyPKeaclO14tadVKyH92GKhVangsCpSaTjStyF5uUoFixg4
         W4RrIpHYBASZlum8m08HNJLG45Eo3jbY0wIfb47e8+DHWHOIdWX0h/Lom4UQiAfxJLof
         Xh4JthP8Uq2DebJRdPLzJL5K7o/NhDTUqwPljDxP/r0JlBzz9DUVi1rcUzErJWCWRCHg
         P21Dj7BnJ30P8IUH+hQCo5pjGi8vpMAvt6pyc5vgrV+KMM7cURn4X0zWHdKVTSWq5YWk
         wZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881095; x=1792485895;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sAQ/enMvzve+no+XLnLhYtDTqCf2p9kIi2WUjf2scRY=;
        b=P39fs6CqZRPo+xa/qm/m0ldQjWzQOwoOcT2KFXSsTrMxStwAS95k5YcNWE8B3bFKLk
         FhmTAyepTi2plIk2kpmVZnINPDdk6naGGasZ2IEK0F2g6g7emMuo+8qhRKb7VcvUcVvX
         inUHAsyGefWnBT/5ycYsoyhZWorDoAwKTzWgMP0mEz/ks0Kp+XnlAw2BWifjB/hNuvPP
         AyByx1Xp7efukFB1hboJTgSINRe2mHi7cQR7JGE/eQzR6DG268SGPFRFpt8gkvvS7XgT
         nZbYYcNRzTLwPXyMBG15DNyELFZ3ohr+ffy+qSnOX+TMaA9GOHDFC9SFmT8D2apspBDD
         3ahg==
X-Forwarded-Encrypted: i=1; AKwUvBy2o5exL8jSRXBOOXUGl6qYFFS939fLLio0oqrDudxicqhLuxYAsJRz04tmRzu8ieyl6kwbQI2GKMzFcok=@vger.kernel.org
X-Gm-Message-State: AFq9FYIum9JboKKwSah4g9s0GeuViFNAyT1uONX2otJxTzP69VljOFNN
	4Z64buRHl+N4Fx2aQeyRZPXDdwrgkr1A0j9jcxbaqNVgAMHIAGrf/5mysQtvc9XOCBs=
X-Gm-Gg: AYBFou0g3bIYGWQO/ae8y81wvmDGgCwF6MvVH8r2pX7UPAvb+FjZPTENDU42bfeZ18e
	OT99eC/Cl25zGfXoMdXtyX4uXSfKUwEPqacTK6qYMo9E79O8LQdNSQYG8RDkaJkZRUT7DR0KK5P
	ATrWsJtks4WIgMRza2qd7ujnF6HJUE+JAa8Ln9z+ifKCixf3pW3I4WLWcwibHF2WiN2khGc5rhq
	PQHvG9N/dtxDhrIM0ltYeqC/poX1wvfjLO+Pcginff23r1sCSOAC6Lnfxi55usIpjrX/kCVJ63z
	SZPLmBrRvv4nkof+a4NvJj9jHUzNj7a/CgdtxnQrVgtZXXg2isqZdKO3CGohlBeyFGt0zJyiua+
	1hK5/PX/AIm/RDfeidyxqmbCVt/cLKvL99oE1n2Wz0ktDXhGVU9vng33eS9zM8B1aQaHgBdWS1x
	t6ht8SsyGHvlrxWJZb0sIuUQCTMXIwvMqEtOboauWRTum2e5i2JoAw7CNNufR6FEp3HIibmVL49
	fGz0fsUOmP12HrLfVxP36GQbhBqd4RjOk2xxR/j4gOOld4VXqsN2/j+XCwezjVmlcBRN5K7pL64
	94USDQgFUvLknnX/Y7fB9TScqKsmQ+1ILiUo+g==
X-Received: by 2002:a05:600c:871b:b0:4a1:a2f3:e6f7 with SMTP id 5b1f17b1804b1-4a1a2f3e8a9mr85953505e9.29.1791881094886;
        Tue, 13 Oct 2026 01:44:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:6dd2:be4f:50f7:7ed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm271888055e9.2.2026.10.13.01.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:44:54 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH RFC 0/4] media: qcom: camss: Enable the IFE pixel path on
 SM8550
Date: Tue, 13 Oct 2026 09:44:43 +0100
Message-Id: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzvzWoC/y2O3QqCQBCFX0XmuoldyZ8kIgh6gG6ji9Udc1PX2
 lERpHdv026GOcOZ850ZmJwhhiyYwdFo2HTWC7kJoKiUfRAa7TWEIoylkCFym0aRwEK1zGhKwlz
 sdBpqKeIkB//2clSaaYm8wfVyhvt65CF/UtH/wv42R+/BA/u/tyVmtQCz4LDyRISNscOErTLWb
 4QJLhViX6HSNbqyQIGj9IP0Po0UlTqW8lSTs9RsO/c4wv3z+QKJgjEr5wAAAA==
X-Change-ID: 20261012-sm8550-camss-ife-b04d82d1067b
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

This builds on Bryan's RFC enabling the IFE YUV, stats and params paths
for SM8650 [1] and switches the same path on for SM8550.

The SM8550 IFE 780 shares the write master layout, the pixel pipe
register map and two pixels per clock with the SM8650 IFE 880, so the
first patch gives the full IFEs a PIX line and treats SM8550 like
SM8650 in the pixel path helpers.

Running the IFE 880 pixel pipe as is on the IFE 780 shows two
differences, both found on hardware:

- The WB gain registers only take bits 31:17, so the 0x1000 written for
  the IFE 880 reads back as zero and every frame is black.

- The demosaic leaks red and blue into green whenever green sits on a
  black level pedestal. With the AR1335 100% colour bars magenta comes
  out white and red and blue pick up half scale green. Subtracting the
  black level in the demux + BLS block ahead of demosaic fixes it.

Every other register the pipe programs reads back as written on the
IFE 780, so rather than fork the pipe the series keeps one and passes
it a small per-IFE description. Patch 2 adds the description with the
WB gain, patch 3 adds demux + BLS as an opt in stage and patch 4
describes the IFE 780. Demux + BLS is likely useful on the IFE 880
too, but stays off there until someone checks it on SM8650.

Tested on a QCS8550 board with an AR1335 on CSIPHY0 into CSID0 and the
IFE0 PIX line at 1920x1080 NV12. The sensor's colour bars come out with
the right colours and full range, and the SM8550 CSI TPGs [2] give the
same bar order as their RDI capture.

Renaming the IFE driver to indicate that its for both the IFE 780 and
IFE 880 hasn't been performed, I will leave it up to Bryan to decide on
what should be done regarding this.

[1] https://lore.kernel.org/all/20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org/
[2] https://lore.kernel.org/all/20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com/

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
William Bright (4):
      media: qcom: camss: Enable the IFE pixel path on SM8550
      media: qcom: camss: vfe: Describe the IFE pixel pipe per version
      media: qcom: camss: vfe: Add the demux + BLS stage to the pixel pipe
      media: qcom: camss: vfe: Add the IFE 780 pixel pipe description

 drivers/media/platform/qcom/camss/camss-vfe-780.c  | 12 ++-
 .../media/platform/qcom/camss/camss-vfe-880-pp.c   | 89 ++++++++++++++++++++--
 .../media/platform/qcom/camss/camss-vfe-880-pp.h   | 12 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  6 +-
 drivers/media/platform/qcom/camss/camss.c          | 12 +--
 5 files changed, 114 insertions(+), 17 deletions(-)
---
base-commit: c9579f4854ef36317a41e94961aa3aa4db578df0
change-id: 20261012-sm8550-camss-ife-b04d82d1067b
prerequisite-message-id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
prerequisite-patch-id: 64a75eca8552f66cee41724c5ada63abf6280395
prerequisite-patch-id: 8e2f527fde204b44afd266061097a276abe30b1f
prerequisite-patch-id: 2939dff7f477209138725aa8d86318d6580f4ea3
prerequisite-patch-id: f77370d8fc480b2e972a773f7d56f33ff1995eef
prerequisite-patch-id: bd3b231bc86129d25fca4ae34408a61db43bf883
prerequisite-patch-id: e44f05055f4bc9dc93ae6bd25af80c64f5ce627a
prerequisite-patch-id: a5f27213eba078f7ed5420d90df3ecd45151219e
prerequisite-patch-id: 9b2fbe610fb17689030c6da6c529f7db91b86d9c
prerequisite-patch-id: 4beec7ce45b83b4b578e6ad599db250358e5563f
prerequisite-patch-id: 5886e4828b6caaad3ae8ca243cdaf32bf9090f81
prerequisite-patch-id: cc719744978fe0cc52164734307d2be5970091e6
prerequisite-patch-id: 6acd149a1f7157d92adcf6607dafe14bc6dbae74
prerequisite-patch-id: 953d1e2d1178270416b806663d67571785a161e2
prerequisite-patch-id: ca55b5a758935241665519d91f22301df4baf77c
prerequisite-patch-id: 18e2975827c1895069be22801a65299df994dbbc
prerequisite-patch-id: 9c92f6844a2b65d01cbd678828e0104713e074fc
prerequisite-patch-id: 36fc0614ad729c6c430197ed50cd3f7f007657dc
prerequisite-patch-id: 98b149c4e58978cacf5f34c42449e008715ba8f5
prerequisite-patch-id: e03bd72767b38302093640b678b733d4793f79c2
prerequisite-patch-id: 0ac1a8f5230ac3570f284b2ce7beba19389838d7
prerequisite-patch-id: 9f4bfb7c47e056a31ff6e077247b714309911f2b
prerequisite-patch-id: 2333109e36a4f537899058a6d97b84297ce5d932
prerequisite-patch-id: c6db7007451fc5cbca692e693eccdd431ac995bc
prerequisite-patch-id: 40dacffb560cc55082680cc2d6aa07df96e494ac
prerequisite-patch-id: 90e0149007368597c2f287c485ab8e2070d08bde
prerequisite-patch-id: 5fd2587b4f5ede8b296f2e733b4a7fc77cb46383
prerequisite-patch-id: 4d9281232ab5f7d64ba2f03e916cc09c831f062c
prerequisite-patch-id: 065109c355b439aa41e071f16bcd9fab28da93c3
prerequisite-patch-id: 62277591618c67366b2b80dcbdb77ac4cc834617
prerequisite-patch-id: cd2e469e9cb0a1bf377f2efb77cf49ff292a3a5f
prerequisite-patch-id: f115b9f075efde377d9cd71a41eb2b972ceaafb2
prerequisite-patch-id: 2897e5a754aa5f57b514907cd28d7f36c07ee3f3
prerequisite-patch-id: d3a5f38102f736ad90bec2758f51dfc689df4e0a
prerequisite-patch-id: e0562876758c5e8d01fb3487a5ba76375de58284
prerequisite-patch-id: 2f0f257fb5a5d5e653892a383df9ef45ab3cbe31
prerequisite-patch-id: 694dba0efc7a4d072aeef8ce501c14f713d0e636
prerequisite-patch-id: c5d81a83d05002a0b5cd6e1f580618baddc45536
prerequisite-patch-id: d73c9933c3c03c4c6b11294b8c668f9082cadaff
prerequisite-patch-id: 5035749ba44631c4a1fdf5cea695dec60a07d6b8
prerequisite-patch-id: c77f30e0a0b4dc66c54b10be1e176623d4990d83
prerequisite-patch-id: 19c6758625753d10a452ea2c71a7f663b62ac03c
prerequisite-patch-id: def0ac8f21fd089b98c188ec6768d14d7bce38ed
prerequisite-patch-id: 140465680122b74225af733643db4c1143fcbd9c
prerequisite-patch-id: 0aa2a11f1dee7fdba5ed2e9bc01310b9e61d2f80
prerequisite-patch-id: e74e90b951ad34860acfaaf0f8a9db75513bfcf8
prerequisite-patch-id: 0cec71d3caa998e000e07edb17f20cd936186bdf
prerequisite-patch-id: b5e6afef6deffbbf3b9332a05fc02f19bc5f40ba
prerequisite-patch-id: afcfa6bfe37a51b433e08dcd43248a62c4417173
prerequisite-patch-id: 8a25ed52545e0d89eb0f9b29fc6b088f8832c1ae
prerequisite-patch-id: e6826a68e5b931fdfa938e5999593a1e345f05cf
prerequisite-patch-id: 4f5d62856f7c713710db3925634b359580879d20
prerequisite-patch-id: c0256114ac0ad258ebefea822af8d829f08e3951
prerequisite-patch-id: dafe013ad950a725e272ec6431502b599bd86fb8
prerequisite-patch-id: 4db85a01a9fd08b5341d8c52882dd647e92448e8
prerequisite-patch-id: ac63cdfb7895dc182eb502a169ee642b78b03d54
prerequisite-patch-id: 569f65af1580f1618e02cedc2e853617ce4c5109
prerequisite-patch-id: 9271d8f8178c3e23fbdca5c479ffef9504e0bcfd
prerequisite-patch-id: ed506a77a5fabb3fbaa54eb9962481eba5f0bfab
prerequisite-patch-id: 75b355e6490207fb9f79bfddec0d1498ff5e2d24
prerequisite-patch-id: 971c7c78690ea85fb2d31875ff530d86a7196cfb
prerequisite-patch-id: 2019927f2b18310b8a1b20ffd19dee9cf6fd0499
prerequisite-patch-id: 44010301d6cb283f688d868763177baa269b9c92
prerequisite-patch-id: 7aec625fd5c85cef8056a54698e30285ad3bfecf
prerequisite-patch-id: ec92b9680f7b8312879b820242b9b7acfd97a2de
prerequisite-patch-id: 7be3efcaa0eed4a3e1248c063b746bf52df9d135
prerequisite-patch-id: 133bfe82b6516894c003b74b44b66626a836bbc2
prerequisite-patch-id: 1be12dc685f79f7194aa8c49087c3a48c8cba58c
prerequisite-patch-id: 684d1fec1d0c3eb6017889609d26ad3467046295
prerequisite-patch-id: c99c3dd7797223ae5a38baa7d8735f906ca9f073
prerequisite-patch-id: 8bfccf3f3420113e977dbf0d68a29e343763d1b8
prerequisite-patch-id: b81c5f643444ed9ba6714271bb5af2206deb757e
prerequisite-patch-id: 91884344b76f679d11df2a0b354d0e4bbcd5e30c
prerequisite-patch-id: cc4e1eb14b4520fbc00dcdc3dd5593b5d1551c05
prerequisite-patch-id: 6a2314a098c5bbfffb52c1c728432d2595743d06

Best regards,
--  
William Bright <william.bright@imd-tec.com>

