Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56BB39479F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147605; cv=none; b=ogLpBBpRtGq0y+CPe2NBdhp19lXnloY4Y6eL/mkR1Svha0dDRBUqCMnkPBZRrQSFHHq1ZC+WnbS+FHx5Os068fQcHgKGUEx/qacXJiIvPY4M1P28Qc6HhdnssGHHaVQ8CGUmuHrZziBQMKx4th9iGzBFFqy8D0xWc/9ALrmcgKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147605; c=relaxed/simple;
	bh=hxUKFnQWCMz5ZEwHCDYh4QsTTG5Ih9yON1JhDdolfug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M5jMRYiJ8+seoh2btfzHjN+hEm4VvU/lsUK2s21wjujgYnBreW6PJzeTj5LVARFuOVMRJrwAU43wu7xmAocWDhlWk9TaUUn+/FMWE50PyCNR3go1N9sUCUsX0fifJU6FU8GNFLS6IhHN2voUZZXay2tKeYXKjRdAWZSTB7iAEJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWGISAs3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWGISAs3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48de72fc832so1079594f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792147601; x=1792752401; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uTBIuaJ6iARLuZWV7QgcnGg8p6Ik2I67yfxC7ANuV5M=;
        b=EWGISAs3Lupu8n4K2P5aUsmDXMYnnz2emsH8HXnEeC18/GEBfGjG3kk0V2oxiYXQs0
         qGabmj4Pu0YjHb+BCW5IVZ0zqf7T7Ty46jarcjLr0dFaunZJu8US9xldoVxe+CyrqhS4
         Lzg1noNixG9I9eisMuzYY04kLw5AwkUY7kGf8jiGt8JBhhjCytT1clTQK1/MZN0oPD4D
         8erw8t8v7byasXNjoaoGRiKgQMVvRwa34hvdHCpaYj+SfXIxYufsAtaA9+wqqhF58Oor
         6AtzsAdblUqdOIS276501MXIOF2350S8rz5qbdVbdtSmLRmgFtYQnnxpcbIg0vFMALUM
         WVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147601; x=1792752401;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uTBIuaJ6iARLuZWV7QgcnGg8p6Ik2I67yfxC7ANuV5M=;
        b=aQWgx4E5LSwFGENYZXoi+8Kq/Zyqgntv0D032o8LQX/iIhPfmNKwLhYSXsTbrrdG3m
         RDo8HHaEsH/bqRYP2RmunednovM/jKnoB4Il4xzJ7cM9cyVpVTiQ/WI7KdkJby+7dDwf
         XmZqeeioAIV7yJFQYzuENuCaVbllIpzuP/lD0JAqDKT5i52qR55sSyQ3XjhdRoruSlm+
         tJkf+zqAmEZ0Khvnw9mwH9qYkGNZyhYJarJdvXzOFCSvomsKSyVe4SwDA6Z3b/zX53Ez
         vQdV0MzM8fLmyx3lwDBqUBm/j6hvtjSkURIshScWToiwk3XuWC0lSqWYgG8OGfUYImR+
         uJhg==
X-Forwarded-Encrypted: i=1; AKwUvBxqVz3vbqWb6kXLWzXG3RYiOKrhTZYbMyZ4LmFGiRdissuECkAwJskU/O6RmA7SDkRW++P9hcOHgWxV/fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRr3R1GrjNQlMAF5/scTvV3rdZ6bN6B6/RkdlPACB+usxcNtgL
	ohFMoRPRue9NHHgpKqO2XlRgoCxIWz4dAo8pwOs57JMzWc20PYRp2AxLY3qD/Ob02Ng=
X-Gm-Gg: AYBFou2Ort0A5RrSn47cFz4FZI64FBCcs0m4OazRmOBd66GVEQBcQOkSq+s3lAv3vpw
	72p+GQYWdkcKbMWjHBoeY1CY0WHSc+7AneFzh2ZYmscoL2kJfL5s/R1zfK61N0+IstuvrcmCzeo
	5cElzEzncArztFm2JbxsbYlJNlizEBw3IcfcnuHykrELbrnUiUNdNrOSYrSm7WhI1KQJljacalM
	Li+s3MRMWmDPROo+fkmQf5YyzXcTJ/VcTGwgIs4S+No9oPs9UzTUUI0GtrHL7QRxZjKm7UeSIXD
	HR2/3xA6J9H/1mNfh2cnj/IOHnQCltylQx3oUX1Y88XnEKhV3Uob8e8G5jBpX7Lo1MXLIJsjCJc
	FqIzfZLVr+mDQkG1dLYTRgrEzkFPDSXAeqqv/2vndeMkvoNw8b6MexNwmIjmnj1/yV75V0O/8Ei
	NNUAIgDuYGCH1T6EHVCe7ylr4uQMn5/31XvY2CaZw/hykq1ahuGNRPVRHfs7iAblmaVo9L3Lgl2
	g==
X-Received: by 2002:a05:6000:400e:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48dee35b532mr15189988f8f.8.1792147600645;
        Fri, 16 Oct 2026 03:46:40 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm4556570f8f.25.2026.10.16.03.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:46:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/10] coresight: Prevent per-thread events from sharing
 a sink
Date: Fri, 16 Oct 2026 11:46:10 +0100
Message-Id: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHMA0moC/5XPTQrCMBAF4KtI1o4kaZq0rryHuIjNtI30j6QGp
 fTupgVBcVHcDLxZfG9mIh6dRU+Ou4k4DNbbvotB7HekqHVXIVgTM+GUS6poBjfdoofCQ3tvRjs
 0CAM6GGuH2nhAwwxP41SJINEYHJb2sfrnS8y19WPvnmtdYMv2LecbcmBAwSSZQGmEUro4NbbTr
 j/0riILHfhfHI8co7qIktQlvf5wyQfHt/4OSeSkRlSpyktmvq+b5/kFNDipk2kBAAA=
X-Change-ID: 20260708-james-cs-multiple-per-threads-ed1d25ed1734
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2

Concurrent per-thread events results in a WARN on N1SDP which leads to
the realization that per-thread events shouldn't have been sharing sinks
in the first place.

This slips through because different per-thread events will have the
same PID if owned by the same process, and we only check the PID and
nothing else. That results in unexpected WARNs because it looks like we
assumed it couldn't happen (although exclusive PMU rules allow it). But
even if it was supported it would result in trace from the wrong thread
in another event's per-thread buffer, so we should disallow it.

Fix it by determining if sharing can happen at setup time. Then remove
everywhere the same PID checking logic was copy pasted in each sink.

The first three patches fix configuration initialization, AUX cleanup
and topology locking. The remaining patches enforce the sharing rules
and simplify the sink drivers.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v4:
- Count CPU sources in the registered topology and retain each sink's
  sharing classification until its last AUX session ends.
- Serialize AUX topology access and provide locked and locking path
  release functions.
- Reject unexpected path setup errors while retaining silent skips for
  missing ETMs and unreachable sinks.
- Prevent all problematic sharing cases at aux setup rather than at
  runtime. (Leo)
- Drop "coresight: tmc-etr: Don't stop Perf cleanup for active sysfs
  reads". It was a pre-existing bug and is even more unrelated now with
  the new model.
- Remove workqueue rather than fix the lifecycle, its no longer
  needed. (Leo)
- Add a getter for the config manager, cscfg_get_state(). (Leo)
- Link to v3: https://lore.kernel.org/r/20260728-james-cs-multiple-per-threads-v3-0-6aee7579f1dc@linaro.org

Changes in v3:
- Storing and accessing event owners at runtime causes problems due to
  various scenarios of: events (and sibling events) exiting, children
  inheriting event FDs, PID reuse, CPU affine events that also have a
  target process set but different inherit settings. Fix it by creating
  a session ID in etm_setup_aux() and holding the references in it for
  the duration of the whole session. (Leo)
- Make the ETR buffer allocator consistent with sink sharing rules by
  not doing numeric PID comparisons there either.
- Fix up some Sashiko reports that it sees after interacting with cscfg
  and taking extra references to tasks and PIDs.
- Link to v2: https://lore.kernel.org/r/20260709-james-cs-multiple-per-threads-v2-0-10ac7ac6af0b@linaro.org

Changes in v2:
- Fix inherited events by following event->parent
- Link to v1: https://lore.kernel.org/r/20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org

---
James Clark (10):
      coresight: configfs: Don't assume active until cscfg_mgr is set
      coresight: etm-perf: Remove workqueue for freeing AUX data
      coresight: etm-perf: Serialize AUX topology access
      coresight: etm-perf: Reject event if building path fails
      coresight: etm-perf: Prevent sink sharing at setup time
      coresight: tmc-etr: Reflect new sharing rules in allocator
      coresight: tmc-etr: Remove sharing guards from ETR
      coresight: tmc-etf: Remove sharing guards from ETF
      coresight: etb10: Remove sharing guards from ETB10
      coresight: ultrasoc-smb: Remove sharing guards from SMB

 drivers/hwtracing/coresight/coresight-core.c     | 104 +++++++++++++++--
 drivers/hwtracing/coresight/coresight-etb10.c    |  28 +----
 drivers/hwtracing/coresight/coresight-etm-perf.c | 119 ++++++++++---------
 drivers/hwtracing/coresight/coresight-etm-perf.h |   2 -
 drivers/hwtracing/coresight/coresight-priv.h     |   4 +-
 drivers/hwtracing/coresight/coresight-syscfg.c   |  11 +-
 drivers/hwtracing/coresight/coresight-sysfs.c    |   4 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c |   6 +-
 drivers/hwtracing/coresight/coresight-tmc-etf.c  |  22 +---
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 142 +++++++----------------
 drivers/hwtracing/coresight/coresight-tmc.h      |  16 +--
 drivers/hwtracing/coresight/coresight-trace-id.c |  97 ++++++++++++++--
 drivers/hwtracing/coresight/coresight-trace-id.h |  26 +++--
 drivers/hwtracing/coresight/ultrasoc-smb.c       |  20 +---
 drivers/hwtracing/coresight/ultrasoc-smb.h       |   3 -
 include/linux/coresight.h                        |  26 ++++-
 16 files changed, 346 insertions(+), 284 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20260708-james-cs-multiple-per-threads-ed1d25ed1734

Best regards,
--  
James Clark <james.clark@linaro.org>

