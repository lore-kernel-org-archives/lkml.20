Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843496;
	b=T2dqb8iig+DaMHA4XU4VFHO31SFfa2zOSrSmAIa9yvqAg2wrutrDQmVih8aVZwnCBgdf
	 wajHwVmOcNhaaM1XOgILg0ePTlIBEnjXSAtEfs84/Xm7dMckLd7xpkzRhQ52MWu8YsfCI
	 Eh9mY+7tjqwXxaLSHevoO36u93TVCAdD0WLqddqk2DD3yD1VHW4gXuAT7S6EB15oBcoB1
	 BqF7um5jtsxu7Coaz8VbKTkpkqekZoEOOjPbX1kMKZbb/TS7V46njO19eHnK0wOm1NeZj
	 PG352Sa05CKP95gGAQydTcCi1Q5UbKi8pU36i1SPjtAHmZBVShSyX8m/n9bqMYyYWXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/yYlcVbWauKdzvWIvsccZxgFQkxdIfYL+H0J9xQ3krg=;
	b=ZG5iUtLG4vlXC6qrUvwx2X+E8sHlmChHpy73e1n7JZU0h34m+y+lx8Z6+o0yDdI5hj7U
	 8vAIlqbMORdG3DzSclVzQ3yJZdm18ZUADrpWwNU7BeGVH7zYQzjBFvVEaXriMYg5RH+F2
	 V8HFJ/fcM0hW2ARJxjRx/3aMzwWW5nUB7Ytl0Zw0hfdLlQSTpAL6Zibnn41fCwpGLr4df
	 0URvVAFDehqjuEwVahUeGEhhtQcHvJXas5257VJaQmkBbIrcdLH5jnhAll1lpVkQqwWqP
	 Cep+s0JwJFco+Jio2w6Cefel+e4tBCyFwV8Vvidbc2Z01Qai6Mz2f+NV2ZMIy5mwMTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=QGdq+id4;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54F9606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B54F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=QGdq+id4
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EC91A4013A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792843492;
	bh=/yYlcVbWauKdzvWIvsccZxgFQkxdIfYL+H0J9xQ3krg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=QGdq+id4/9uQs4eJUb8AL6vI+zVsmPg22WctBuSbaYvx9ChZcU7x9I7j4/FFjXuM1
	 lFL3uf0NOQZB/W8U2vrmAMAzdLa8PzQqyLhLIishEXAf0LFWIXtK6spTPrtNKJsaaO
	 /O3Z4tIXy65DuSdXHPkjppaJhcoR5oll8JZ5TWRC0PXa76FCK+QgIdmy8U3QglJziq
	 xw7jF9B7nTD+dUv6x4UtA32N5kR/fPdjrfGzxJfXh5Y+oGXlEOLXBb+792algTDpWi
	 XaBzkwzpuaUvzHHk6pjGIXF4cyhfThC26/yKdiuWzM2o6QZLdUrArB2VVKacXghu61
	 NTQ26qLp+6OWC3mchn+jyXhWd8EWpdSIW0HUBV3NKDwHjKoThYRR0izjZ9pvazWbhy
	 Aa4iKYxJE/PI+KoTjbz4XqNmwcEx+9+KEkcsmJIwT8/JrnuqjgSFbuu5nQ0jA+wIvW
	 o8epwdrnTC9vH7jhFqdHDap8XELpfRN11pc/eDe2Y4muvI5CE5FnlzRVvAdIp6ScK5
	 zxlbRilNmLV5zp8NTuclw323BF5U8LjIKzShebpOTIIsEgWiZxKCm6Ks9xJ9PKRAoM
	 kCYUZ+xKffuKdNpnV2IHA9o7/dgyE6FsEI1NitsFdwNzXEbAw3Rpxqs3Q/yR9w27sf
	 ot055gwA+5ips0OvkzRndfZA=
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3addd0c1c07so267473a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843491; x=1793448291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yYlcVbWauKdzvWIvsccZxgFQkxdIfYL+H0J9xQ3krg=;
        b=wum5Lai0OWJalOIcXP4POt9Xm0jw2ZCOJX5bI2/zykDAGGMIbZFlsAngLxMzlWKcj8
         uke4aEDzHJpEbMvhS2KY1rdQ4u9SAhlZ/xtUF3ZwQrEk6z5aSlUgJWnco9PS0E/vUIcf
         ILVaHXffy7cjj6QXaxwgRv5YJ363wWurBVenypn1QSFw1f7ZnRuabLonUAok+Ux7QQLv
         qyLkQAteAlLEL/j5+5AiFCFcks6bJerGaeYXagjynRZBNMxqg0TvqXiHY0jFZX9/leAh
         xoioFKdure08jZ6raXr4lbBN4s22FX2/EdYxdYttlAWKUAv8L4xYu0olgR7zDcis7u6k
         GI+A==
X-Gm-Message-State: AFq9FYKh21wN8k8wFmPJNd1UeC+mHRf50SJlWRpZjV00rSHYu78zwG6K
	Swi0VY3doh68boPErw2zvCOfiGc3lKbjb70Zwu+b8DgOCrh3ikQHDP+93CYYCyPWr4GR0GGnXpu
	kyktIjfFanN/Xu7KCT/BSOVju+4EDxNgoPrGbn+x/QIZe1Ro725gnMMiBVLsuXLJIh3fDzGBPgg
	lYRPr6IQ==
X-Gm-Gg: AYBFou1ZKNqaCM1AYBg/weH6LfvTT6LLxHCRb+2UEZSjhiQLQeWORJXI6CTZ9ECdDPE
	msQiIiZtoCvimrk7OyNA9cvK7tSZJDF3/U2UUp3yIEgcj274QQkfeH2b9DN+hAuE7sfIYd5kY3O
	cqn9vVRY+9jUQ2gydrXvgIgNnXlVc3Hp4IhHSYNGGwAcf4qb5EmN5+FKsFqvXB7L1M1l4J72jba
	PhAQheUAp/xXpp7xe5Hz2wC3PJbxpMHfjmnal3b1ajn9NgOrshdJ7p6hSeL9a68uzw6Uq16cGNr
	SObZSbmpB25BnoSMSdRZbiAADzF2oI8L/oM1QzkEdvgr6mqADmtFDl02uq4V5eEa+qj2Jjxt4is
	7MJwaSyxPsls17xHFK2OqQsqk2E7GRfTX4e6gtQtNwq4GvRvf+DDIApQWnI8tavNjPTgNfNEDhp
	U5zBn/4ghfj/H/cRMWT032C6lqo8hy771KcuWapDQeRbT8B8w6klSkwDxK2hwL6SXIr/0B/KktK
	fuhNrGyR4CeU4o9/+3W4EW7slzdzQzbvzHarav7Lw==
X-Received: by 2002:a17:90b:2645:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ade9b2ce6bmr2893147a91.1.1792843491092;
        Sat, 24 Oct 2026 05:04:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2645:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ade9b2ce6bmr2893103a91.1.1792843490725;
        Sat, 24 Oct 2026 05:04:50 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb24a04sm2893409a91.16.2026.10.24.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:04:50 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v5 0/3] serdev: handle devices without an ACPI or device tree node
Date: Sat, 24 Oct 2026 20:04:37 +0800
Message-Id: <cover.1792831564.git.an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
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

Driver-created serdev clients without an ACPI companion or device tree
node currently have no modalias and cannot be matched to a driver:
their modalias sysfs read returns -ENODEV and their creators force a
bind with device_driver_attach().

Backlight function on dell-uart-backlight is not affected: that class
device is registered independently and gets its own add uevent. The
user-visible breakage is the failing modalias read on an existing
serdev child -- Checkbox dkms_info_attachment aborts with
"OSError: [Errno 19] No such device".

Resolve the two long-standing serdev-core TODOs by letting the creator
pass a modalias to serdev_device_add() and giving the serdev driver an
id_table, modelled on the SPI bus. ACPI and OF match first and are
unchanged. Convert dell-uart-backlight and the Lenovo Yoga Tab 2 Pro
fastcharger to this path and drop their force-attach workarounds.

Changes in v5:
- Patch 1: restore is_serdev_device() guard at the top of
  serdev_device_match(). Dropping it was correct when match only
  called acpi/of helpers, but Patch 1 also adds
  serdev_match_id(sdrv->id_table, serdev->modalias), which
  dereferences serdev_device-only memory. Since serdev_controller
  shares serdev_bus_type, the driver core calls .match on controllers
  too; without the guard, serdev->modalias on a controller reads bytes
  from inside host/nr/serdev/ops, and strcmp() can walk past the end of
  the controller struct. Reported by sashiko-bot on 2/3 and 3/3.

Changes in v4:
- Patch 1: drop the dead is_serdev_device() guard from the match
  callback, and dereference serdev once at the top
- Patch 1: drop the "large enough" comment on SERDEV_NAME_SIZE
- Patch 1: in struct serdev_device_driver, place id_table right under
  driver, next to driver->of_match_table and driver->acpi_match_table
- Patch 1: merge serdev_device_set_modalias() into serdev_device_add()
  so the modalias is set at the only point where forgetting it would
  matter; internal firmware callers pass NULL
- All three patches: tightened commit messages and moved the v2/v3
  changelog narrative out of Patch 1 into this cover letter

Changes in v3:
- Rename struct serdev_device::name to ::modalias; dev_name() is
  unchanged
- Model matching on the SPI bus: add struct serdev_device_id and
  id_table; drop driver->name matching
- Add serdev_device_set_modalias() helper and SERDEV_MODULE_PREFIX
- No MODULE_DEVICE_TABLE(serdev, ...) support: both in-tree
  firmware-less clients are created by the same module that provides
  their driver, so udev has nothing to autoload

Changes in v2:
- Instead of silently returning success with no modalias, use a
  creator-supplied name as a "serial:<name>" modalias fallback and as
  the matching key, so clients can bind through normal serdev matching

v4: https://lore.kernel.org/lkml/20261024022930.2704030-1-an.wu@canonical.com/
v3: https://lore.kernel.org/lkml/20261023052717.2577234-1-an.wu@canonical.com/
v2: https://lore.kernel.org/lkml/20261022032842.2492572-1-an.wu@canonical.com/
v1: https://lore.kernel.org/lkml/20261021092124.2306053-1-an.wu@canonical.com/

ChunAn Wu (3):
  serdev: handle devices without an ACPI or device tree node
  platform/x86: dell-uart-backlight: Bind through normal serdev matching
  platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through
    normal serdev matching

 MAINTAINERS                                   |  1 +
 .../platform/x86/dell/dell-uart-backlight.c   | 18 +++---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 25 +++-----
 .../platform/x86/x86-android-tablets/core.c   |  2 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  2 +-
 drivers/tty/serdev/core.c                     | 62 ++++++++++++++++---
 include/linux/device-id/serdev.h              | 19 ++++++
 include/linux/serdev.h                        | 12 +++-
 8 files changed, 102 insertions(+), 39 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h


base-commit: 9e947d96915af63e28896caae85a81b74855621b
--
2.34.1

