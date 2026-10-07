Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094E049D5B6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377988; cv=none; b=rGgXJj5+fysh/k82a63+CR42+iYdZk/FDJ6NXEQ4jBxFWWTOPThViI3FVJeGuvdRUdlWu+pgtwCxHHCAZ5PjsoS1WSJeyeR4apJhzUOj2wwpGnma7OE8x3AcaRCv4ejzAnCLwv2JmAr4+8iJwPRPRzNB13baKHSfcH0IoQa7wjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377988; c=relaxed/simple;
	bh=l7SkYiVt+inOyWQ8HPwyTsHjpygqZZlkOgPatJPOhU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eU967dGqyjFvNs5vttiWxJ8mXLDaQMp6SOoGksDcHGJ3wAyZeF9beo4WE/K8LaPS5VpJjp2aHiRjBMO63KbBA5WhRCfPc2xi5A9yezFvkYL4Oa4UZMACmI/8izDADXCC9EhAsqX44n1CA+QA/9DIqb3YvlwTHr1k+Kv6047E2M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+HcN9ld; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+HcN9ld"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39403555e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791377967; x=1791982767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jVQcZZB9AUNKjVqndRWHW4ED94+PoAgxgHXAlUExYI=;
        b=m+HcN9ldeMpv3OjaPUTuX/h3+IvWnp0RLaLgW9ted77MAUIgJOF5U5iLeEvXq11neU
         4mNPxUB0FT4Zj3NCO1eZgko4c9mRz7GRM73FXNlR50QZRB4IJyGcZ9smnGuNYM/2KsO2
         27MZIE1n90PpRcZqStO/5IO9lTk7zgBR+avsUfYKg4nudwZH6xRlDlkilatS7cTF1DP3
         13CxucdAKlNF5Xr/JRauKADIGk+0BqHBpJljspbW5OavpHz8WfKQGqSoOpHAoQqV5Oxu
         jFCcpwDrWEQwnj/iMg6lWUNG9VvqP9Uh2APwJ2C72goY+AVbFS3J9khPNh3CJsptOoGN
         NO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377967; x=1791982767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jVQcZZB9AUNKjVqndRWHW4ED94+PoAgxgHXAlUExYI=;
        b=sngj+ceOgEdX/pG44JSDoQ8MVyz/L2L7ezHTKJkIxhD19cAhnVzO7kZmdjwy6lnIIr
         OWwyHoUhII/saPYQFyvrddaunwyVIbPPtcOgloHIycNX3b4BTEC5vv9R0D/m60EFx//M
         DSAfp/NsFuzQSCqFTviTWBvWSfhpbFFIKNE8abZxbksjMUBFrTMy8QITA45YV/dZl/WY
         JqPjxAfSBj/rMHIBv+rzWX6jcyE6VuujLreH9gUmGNZgKO99VwZSTzGdAFfxvUdPk51L
         uK7/Ag7gn0iUShTutODzfnkxJszbEHMNEG14mIKo6TvwuOlXFaA+nwI0kCxlFsfLw/q1
         DDxw==
X-Forwarded-Encrypted: i=1; AKwUvBzMVd0lDFLvoV3/IwCZN1O7FWmkYsQXwfvPu1//dJZ1Z22kMQfb22zg9fBwiDwjS1C3KbkM6PY35xIupzY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJB3tbdzWecErt/UtAQhyRHURC2T5AxK6RVMoRpAv+zYGYCjxj
	/0Www+TE4VwOduIU4jm22Ln2N+EpoFsQdunDsT2e7bZazKyLjtVacu0w
X-Gm-Gg: AYBFou2653cZsi1EVMhXNWf7EhUy3by7t6lwcmPtq5tP1Fc2QX2jOcKVmponjOhMxIs
	R6EtFSOdEx5S+ZXWOOybxZPQfAxWW6c5jYJFOJK4axuts2zuxO06qeClaf7vV+cMMzG6BCqt6Qb
	tuyugctrQ3SYbAQ0GUTNpe68F/TPmlkqcHKfhiNH0wNQRRN1+il09iw5B1Z6j9yUI1KVO1b9mlQ
	eHJCfKOvrDkzwwV1ZENllU+vpUYAaa9amdn8VNwgiEvG/l9BUqKqU6SWYpQmC7hg+hFBmyx9VUE
	kqKGPEsxSYZK13R50i9xTPdLH0fUGok1V8L9VqmiYkeaBGj25V5CYOGgFw9dNFEEo3xX+Yr4ZPY
	szuuW7UFwW8Vk0J4iL28qffO9l5Wvn0kDxkPU4vMHJCZ8kVdnmlv8ugLcp0vl1GZBuja3TXO75v
	ukdCp5wkmfmL741GJTNpTPooJy+Zf7GFrPDpRkOLl0KQVUyPv7KszuRczq7MqI5Qe5RxWQFT11Q
	UhoI4NXl7fUGVJDpWhCQs2lsnEah3vvDUkFj1zmLlo=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a180660fd4mr42344425e9.27.1791377966649;
        Wed, 07 Oct 2026 05:59:26 -0700 (PDT)
Received: from PF5R4XJL.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm105304145e9.2.2026.10.07.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:59:26 -0700 (PDT)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] platform/x86/amd/hsmp: Unify per-socket sysfs metrics
Date: Wed,  7 Oct 2026 14:59:04 +0200
Message-ID: <20261007125908.321186-1-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Erwan Velu <e.velu@criteo.com>

The goal of this series is to ease server monitoring, by exposing the
HSMP metrics the same way whatever the driver, in a format that is
straightforward to integrate in metrics exporters.

The per-socket HSMP telemetry attributes (c0_residency_input,
ddr_max_bw, pwr_current_active_freq_limit, ...) are only implemented by
the ACPI driver, although they are plain HSMP messages the platform
driver can send as well. Systems probed by the platform driver therefore
only get metrics_bin.

Their location also depends on the driver: AMDI0097:0X with the ACPI
driver, amd_hsmp/socketN with the platform one.

This series moves the attributes to common code and exposes them from
both drivers under a single /sys/devices/amd_hsmp/socketN location. The
existing ACPI and platform sysfs paths are kept for compatibility.

Patch 1 is a pure code move, patch 2 adds the socket devices and wires
them in the ACPI driver, patch 3 does the same for the platform driver.
Patch 4 exposes the pwr_current_active_freq_limit_source bitmask as a
single hexadecimal value, whose interpretation can be centralized in the
monitoring stack (e.g. Grafana value mappings).

Tested on Zen3 and Zen4 (Family 19h) servers with the platform driver,
and on Zen5 (Family 1Ah) servers with the ACPI driver, in both single
and dual socket configurations.

Erwan Velu (4):
  platform/x86/amd/hsmp: Move per-socket sysfs attributes to common code
  platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp socket devices
  platform/x86/amd/hsmp: Expose socket attributes from the platform
    driver
  platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw

 Documentation/arch/x86/amd_hsmp.rst    |  20 +-
 drivers/platform/x86/amd/hsmp/Makefile |   2 +-
 drivers/platform/x86/amd/hsmp/acpi.c   | 327 +----------------
 drivers/platform/x86/amd/hsmp/hsmp.h   |   6 +
 drivers/platform/x86/amd/hsmp/plat.c   |  20 ++
 drivers/platform/x86/amd/hsmp/sysfs.c  | 466 +++++++++++++++++++++++++
 6 files changed, 517 insertions(+), 324 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c


base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.53.0

