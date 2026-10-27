Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112977;
	b=rRCLhZ+ttvMK4LHhrVQlG40zHsX7vL5NR9bCu54Tuzww0daFeLR5jJLPrW/wwzKr8er6
	 ZVp6eJNadndvB9y0KPf5HlTQ1bctVX8nzUfU5pbK55QqP9Dqzyqe95iKcTjRGgyhY4EbA
	 QoTXyC8UTTNE8windQuSGxPMBvqqZE4lJMbJY4kSQ/KDeBhwPUXMd9BHZ8d/u4mM2x+g/
	 K7UDWuP0O/Ze5etVFltcmNDl+P2LihKE/CwWVDKXXYNDV4IFnYXtFep40G9+gvsVBASjR
	 vjvl47/LibRopFICdKEw38uQiJKuVsEWNUmH2N/XHTzOH1BOnOs4SX8D9Gxi93MWAzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+nE9Gd42aXGNQb17vFxmdBja5NwQaYlcGM+6VUCeEsc=;
	b=j2z86rZplH7jgTgMT1KsGVB+E4fiOvDz6sJNywZu96vCKZScVCcl4V6kG6PVAoRnxr3i
	 ijOvC7fKGBEz1Pt6Md9mPftog1zfYObzwYHzJKbX1CSYA2s0Vf1VE5CJyRzIsLASMhafb
	 pgmsBirrDfOhI6KtdKWnYn4p+4iyhs3eIXX7QFvECpAov+FomQWcSBRMltvHeBQJABgfa
	 twpESp/Z/OpJ4ClnhHCIX+7LHu+O8PCz3Lc8VtyY8efK1OAUkVLOZG6Yuvm3+DbXAsnpX
	 uQ1VCiN5MiU7TacKcPnp9g81uSmaA0M9zm00lzs1E7Y3oOHQfwPLwsUKg+nUmA031Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwXy+72O;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD30606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD30606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IwXy+72O
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso27906485e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793112975; x=1793717775; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+nE9Gd42aXGNQb17vFxmdBja5NwQaYlcGM+6VUCeEsc=;
        b=IwXy+72O9KCdbCSqKeB/OwwfEycfIwkY2Bs/EWMK+EEu2S/UxFmvsm6Oam9NJm16P6
         C1/sNKFflR7nrI25OBClQsPKV2jeCxUpTpmXr0NaDNimvv+QQNANpduD6gjWdbO77pCE
         5lHdPyyO7rFMnHx59F83oBVzz+0dqKbCygAjLiYF6/eMMpk7NJjK6E3WxeZbtsS/AVvu
         So6hacP/6fMckVXWlpVyonO2zcXFkHELXYejz0/B+exf/x9l22XZgNRIwNgegBPJOjEJ
         AE5rdGC7p3nbA6s9FKwivfIi19wdsbR5VbQVYF2DczvSdy3Y/h0JKAW9MREmpXekdEoR
         wzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112975; x=1793717775;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nE9Gd42aXGNQb17vFxmdBja5NwQaYlcGM+6VUCeEsc=;
        b=KQptUg2mI05y/6owEh/VfzHMplYmYWTluJUdg/DPJSasKYjhmb0dno5Q11ufOWEM9E
         SnXv1zBtiisbNE2XzeggaADIMeAb03v/wbDaTCv1RrHXosXqi5+srRt3q3whl0jAfXA/
         LUDHpS3Soa8FwLBkdrEFcbHC9wJZp3nqC8Il651z22J5lfh+SyvdzxDLm1fOf//ENpcM
         oopZozIrbJueun6NeKC8UKSCTevhOgMAlbk7BzoBVp3XL2m9T2ybmJWV17s8VdnbJWWq
         Oez8sf3NV1IgWMqz1JbbLZS+NjdqRKKSffhpgUZQpsx5fNzDmA//HFrNMk7N8LeFgBXu
         E+OA==
X-Forwarded-Encrypted: i=1; AKwUvBwN8FtfXiY6Hbao+vZgfNhku57BKg72EdLZo6V0QRJjZ10zly6vppoKMsXqNpD2T9skNjDKUpRC24sfneE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbKGfO99dd6EhlKCTdoQGSwYU+11WTRF99148qnRzHGWuEIXwy
	c4OJXNrDGnLugqvkwjRx02RhcuCcvT6ak1wl3Fco2ZIuPXCdY75Sw8N7l17kldHeEyp5JHNpu8a
	yl9ydFBQ=
X-Gm-Gg: AYBFou12ACZLxX9WiT4PSP4coEbkeA2KLHFz5uU0KM+GiVkFWq2KJ68zEU6irY+M8XY
	3X0xwsv9dLRZ26/WuNcGQCHBC3zvFgiNqPRcLApEDWWeSZJ+hQqLdTM/eVcrCdBA8nk2szjEc5z
	PiwmOBRePlt5tBzZ1GWCBxTmAXZTcjFkFu6gCLwzjW6Gnk6k8FGWtsVQ/hVlcRrmHgYXVNsXBVp
	zipF9d3ipo6VJOorEbH8p3m+i6NYY8XteaprvOpA5K6JvnrrEH7KUaQy44QgyIoHBaIDs3Fi6r5
	XaqEyXmtBOy2ex5f8qSImIuFuXV6mxHd4MC6mZMpydTYBCD0tYqgICYTMt8qRP6pazMKQrWQrTu
	xwDXo8XbF1xqOUIOpIwtFYbciJ+SmBY42+0L73Kb14X5ukuKVBeJHSUO61za874q1TSANyQJ2bF
	QU3RTzy+fGTErzfR4KvdnbIlF/Fyz3S+2swDbY7kqy284jIjyXb4WF9KkeoLbCyV9kP2zK8vKzQ
	uoPLluNkQNEop+zgq/0twnIRKpD/9Noh5QSOZ2Xaz/8qehQQ0U2ezcDJtB0l2EQxP2kLxHOzR2b
	QX2s
X-Received: by 2002:a05:600c:198e:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4a35ac9d1c2mr213929635e9.6.1793112975451;
        Tue, 27 Oct 2026 07:56:15 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a30e22csm273188835e9.2.2026.10.27.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:56:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/9] coresight: Fix assorted bugs reported by Sashiko
Date: Tue, 27 Oct 2026 14:55:46 +0000
Message-Id: <20261027-james-cs-sashiko-easy-fixes-1-v1-0-db43c4668644@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAHK74GoC/0WNzU7DMBAGXyXymUW2kzpOhBDvgXpY25vGbf7wJ
 hWo6rvjNkgcZ/fTzE0wpUgs2uImEl0jx3nKoF4K4XucTgQxZBZaaqOkruGMIzF4Bkbu42UGQv6
 BLn7nqwLT6GClVAZtI7JjSfR8ZcXncWfe3Jn8+pD+LRJ9bTm87jOR/YzPcFu87V1l/rvjNqxxG
 QgWSrD2iTAwXCuQECh0jVHoUdLHECdM8+ucTu+PjEMm8PM4xrUtyqr0nXeuJN8FZyXioTZYaes
 7LJ05YKhtaSstjvf7L8lN3r4iAQAA
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

This series depends on "coresight: Prevent per-thread events from
sharing a sink" v4 [1]. That series takes coresight_mutex for perf AUX
setup and adds coresight_release_path_locked(), which the
etm_setup_aux() and coresight_build_path() fixes here are based on.

[1]: https://lore.kernel.org/r/20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org/

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (9):
      coresight: cpu-debug: Fix PM usage counter leak in debug_enable_func()
      coresight: etm4x: Remove perf symlink if config registration fails
      coresight: etm4x: Fix truncation of nr_ext_inp
      coresight: etm-perf: Fix sink device reference leak in etm_setup_aux()
      coresight: syscfg: Take csdev lock when removing owned features
      coresight: syscfg: Fix deadlock in cscfg_create_device() error path
      coresight: Fix resource leaks on coresight_build_path() errors
      coresight: etm3x: Don't ignore etm_parse_event_config() errors
      coresight: etm3x: Prohibit modifying seq_curr_state while session is enabled

 drivers/hwtracing/coresight/coresight-core.c        | 6 ++++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c   | 4 ++--
 drivers/hwtracing/coresight/coresight-etm-perf.c    | 4 ++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c  | 6 +++++-
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 5 +++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 1 +
 drivers/hwtracing/coresight/coresight-etm4x.h       | 2 +-
 drivers/hwtracing/coresight/coresight-syscfg.c      | 8 +++++++-
 8 files changed, 29 insertions(+), 7 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20261027-james-cs-sashiko-easy-fixes-1-692d80016a89
prerequisite-message-id: <20261016-james-cs-multiple-per-threads-v4-0-dedf961aca0e@linaro.org>
prerequisite-patch-id: 81acda380ba25acd3845eb58d5ded812175b9631
prerequisite-patch-id: 430caddc9c87948d4e9a0d1967bf3d8a50bca06b
prerequisite-patch-id: 633377150141300f7578b265fcc02eba52e592a8
prerequisite-patch-id: 9a82ffe5d705ac1fdf1250ff6bf242cfcd9d8fbf
prerequisite-patch-id: cf211801575d6bd0aa7fc0f6e19c3b90cea446a0
prerequisite-patch-id: d22fee48bf4aa3e01536e4683ccd797b3dbe1c91
prerequisite-patch-id: 55eeffb37cae55a1f47c2827899e0512b47a6efa
prerequisite-patch-id: c542d74cd4bc76158d5872bab12b8bd7a00f0c27
prerequisite-patch-id: 71cd37ed83d3e01d7a0321cdfa5cfc5ee113fe7b
prerequisite-patch-id: 74c1e3ed6dba4e25bfd3c39f06d43b079eed45e1

Best regards,
--  
James Clark <james.clark@linaro.org>

