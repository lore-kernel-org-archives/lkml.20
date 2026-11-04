Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806618;
	b=dC7LIS7NZY/rvZ73lYY4ujN5ib8BbiPczpcwRq9zIJx3eJkm05J2GmK/DtnW4hLyor+s
	 0XLbRbUVDs8/ULXnN5Pkqg2JPOIIHUDUzMhmsZ+f9iTPc3xgv6s7cG3vZgZsjd9Wkld7W
	 6qs6WrF5xzkw1Tx/kJvcgX/w3xVJkh1SSYOR+DIWc8+5l5UfMZmIuA5nInTB6kaGRTG7p
	 jw2i8UugzJMe3O8pkuGqta0lF1/RUCtQGP8bAnE04mkT4IV96Cu4sBvRLDYXsZCbt/UWc
	 tag9kDFcJjs08PPaocKiJLABjra80IIhh6Bm889onvwtl4zOQlMPpdkWSc/4ph2sn6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=kiG3OFFZO2sk4pIuDgRSDTGCM5T88WnpOks4GGWq8jg=;
	b=z+XEcJF25ll1A0wdDSt/UicyeTZC8df4tepHtr44sbCL430BW0UbCIzMkRdVA5N8aFVO
	 XtqNqqDCX3rze49jhZ6G7g76GMt7rHCa5RXFwPESdtgrpYxq1isPQzWWtotz4Ht9UXvSr
	 Yv+/gbShzxu99iOwz5CWggC14x4TuqlswJbWpc+7k4vw4AHuKd10lAiZYLOqzjXeTPRRK
	 t59q3+9Fh8YJqZqUtjD7En9KUJvg5MMMNRy7hC25UKoShzkO56Uu7x3M7CZoDLSzVX8IH
	 cRoNCFFMEa9Y9kyxykil/C81n9KrZ41nb1DHgus0CwfpuEMLpyOEfKV+XGogTbKHrJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xD7kp5H9;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8577606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8577606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xD7kp5H9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so7655995e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806616; x=1794411416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kiG3OFFZO2sk4pIuDgRSDTGCM5T88WnpOks4GGWq8jg=;
        b=xD7kp5H94zNUN3VZh11xnvdp5BBh/fpXwTRQYmfoDQvKxhZ1l0nJM9aS1o/nYUuR+f
         uMOKRC9a+X7zSmBrhcPqong7L59DZkd1YKSINnHm0M/RRgUKqxl2lLmCgoPJR9i5JSli
         ZVNHAZic+KHyzRpl3SOHkc8O6PuCqhRB/Bm8NXo+XgJEQcu8h/NaJ91wyuBBcfBUQpXz
         zt6/kQT0BUx+xeRg1FfVu3XSFItTDVQHA/J/gKSHlJco9iwl6SRL9y+dgDtLZOfM1V8H
         5VI4upET3l6mqqsv4XeHxEWnzbfxIQ+WgQevxDr4c7ZVEAH5H/Fr0TWco9u4Fo6Y5toy
         pEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806616; x=1794411416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kiG3OFFZO2sk4pIuDgRSDTGCM5T88WnpOks4GGWq8jg=;
        b=u1zb2QZ6Snf2PJvGQsjqrSfioPteR5tqJ9dg/D1WAPI4196S8JTiAanGaFIivu3fLT
         b0jZbPCrpkOUYJ5NHTeku3xHp+b0n1mNrTFfjl9aZiYB09VqUuTKYoYZ9jyqUOXxb6qq
         pCcO4EkfS8k9uVsHuEg5E+M3vQ3v12fal3k2fVWGJTCrGEzybNnpJpvBkUYprwAvhEP3
         mTQDlTQ1V3fz0t16mun/35rMFdNjUBNsR145NAWFMW6uhD61VslXYV+kr52nnar+4RnM
         F3NPvCRZdHOs4WsyTLdH8W1DTESB4mYeu+2gTsmtd3bAgfPU+YNaFUNWkxzslVGfZMOy
         TwaQ==
X-Forwarded-Encrypted: i=1; AKwUvBynFjif1ssLHMp1e4XTIoV0ahh/6MAmu+SCxsgeb5fcWJJ50WOCciovQ9Eqvy027vbRGchhGo+plLb45eM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kXHke8nvVPkBqHIjzQ0yvL+ARoO4pwHcXir1pwi/I/ufQsHoF
	juksUzCV01KoYm8zmMDlkZLGQZ/dv6qDXB3TKLZyUPh9AvVjOW5wpQ/lHDyslxULajA=
X-Gm-Gg: AYBFou0Xvg9O1QUrJHXtjfL6E+2LiqdDcDW2rjbPldyuODCsszKer6KTY24qRAzQBSo
	8Ut9rFdbihq6TaDmKWg+18K2pwTuSBytR6CdZLxi5lAS1LdUbVs9MWu7on8BZeKFKShpEYzSAVZ
	AhkMGMjFeVlEs1v0TjwVd/VzSrqxG8yzUifDQ4rh6AiIwVx1hMenNS3pnGMKM4XTfcKSMA29iBc
	UTSiDIRQ1/x3dwOTu7r5U9qaDTRE3o1RzYZUiYoZcezu7bN0j7+gEWbIR4Sxs423mz7FDWsok92
	HOYS+qW4qL51OCRndmaMpSl4HBiygF+Lpu5dwlMxpuEeC29VhsVsPFlpBDcbG2hZwwPD7z0vEv7
	7sTyR+uUYHR0Pc05kdN8ZR2tbvs8hjB/nktrAJp9AW4e0aGES7z0ILK4xIC4tK8idNB2papmfN+
	GUmET958yOuPRGs73PDcBETvK4sBhOHM7GQmzrzDOgxnpOc8kiZkOF/cQBnVJeNPIvsBdPZxt1N
	/BcV7cDl/1RuI6z6aINW9PBUslbCnbxf1SSoCObGIWH4LUcIIDHGHyudYALzyAppKmXDXljUZ7r
	McRxiJAyxsG7HAkbwmaQdTWdsoa9iYc6
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr387140215e9.31.1793806616374;
        Wed, 04 Nov 2026 07:36:56 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:36:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/9] coresight: Fix assorted bugs reported by Sashiko
Date: Wed, 04 Nov 2026 15:36:31 +0000
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAP9Q62oC/42OQQ6CMBBFr0K6dkxbmwquuIdhUcoIg0pNB4mEc
 HcLXsDl+/Pz/iyCMRKyuGSLiDgRUxgS6EMmfOeGFoGaxEJLbZXUZ+jdExk8Azvu6B4AHc9wo09
 KFdhCN7mUyrq8EMnxirifkuJa/ZjfdY9+3KRboyMeQ5z3Bya19f7dmhRIaGpz8sba3BpTPmhwM
 RxDbEW1rusXPSBqkN0AAAA=
X-Change-ID: 20261027-james-cs-sashiko-easy-fixes-1-692d80016a89
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

Small fixes for bugs in the CoreSight drivers that were found by
Sashiko. Mostly reference and resource leaks on error paths, plus a
deadlock, a missing lock, and a sysfs store that should return -EBUSY
while a sysfs session is enabled.

Assisted by Claude Opus 5.5 and Sashiko

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Cherry pick "coresight: etm-perf: Serialize AUX topology access"
  into this set so that it now has no dependencies.
- Drop "coresight: cpu-debug: Fix PM usage counter leak in
  debug_enable_func()" which is fixed more generally by
  https://lore.kernel.org/linux-arm-kernel/20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com/#r

- Link to v1: https://patch.msgid.link/20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org

---
James Clark (9):
      coresight: etm-perf: Serialize AUX topology access
      coresight: etm4x: Remove perf symlink if config registration fails
      coresight: etm4x: Fix truncation of nr_ext_inp
      coresight: etm-perf: Fix sink device reference leak in etm_setup_aux()
      coresight: syscfg: Take csdev lock when removing owned features
      coresight: syscfg: Fix deadlock in cscfg_create_device() error path
      coresight: Fix resource leaks on coresight_build_path() errors
      coresight: etm3x: Don't ignore etm_parse_event_config() errors
      coresight: etm3x: Prohibit modifying seq_curr_state while session is enabled

 drivers/hwtracing/coresight/coresight-core.c       | 26 +++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-etm-perf.c   | 15 +++++++++----
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  6 ++++-
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  5 +++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  1 +
 drivers/hwtracing/coresight/coresight-etm4x.h      |  2 +-
 drivers/hwtracing/coresight/coresight-priv.h       |  1 +
 drivers/hwtracing/coresight/coresight-syscfg.c     |  8 ++++++-
 drivers/hwtracing/coresight/coresight-sysfs.c      |  4 ++--
 9 files changed, 53 insertions(+), 15 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20261027-james-cs-sashiko-easy-fixes-1-692d80016a89

Best regards,
--  
James Clark <james.clark@linaro.org>

