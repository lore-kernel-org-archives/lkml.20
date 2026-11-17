Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884352;
	b=WnKMcelJ8iGs1LKM3l5Db3dKP9B2DKgPJ3RCyxsy5oTVDORwlFISn0cMKxxPfRb/SI15
	 3JKWeUmJLz0pZ2N1NCVsGcRQuvj4D9OafxlLiVJG3L/SDIKXsNpOIQtX1XLoNWNr2XOQG
	 ehYX59WC8Rl4jL+qypDFB8N8LChr1zKJxHgg0DUeFbygK8yVVzfJd93ahIM2+mW32VzHA
	 2ewpzBM9X5ileoWaCluvXiGcr7DbQrt0MoBqGRYNOgXJxixZDUNwA7hCsM0F7SLQmLowz
	 RBF1VwDi7a/iLLUSlBoMqZnxJ2MvTyvN7hLRW62nn5ZkXzTTEHg0VsHvlpkHpb4BjfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
	b=pP5WQy8WS2rTgfycYyUGeM7TOYBejqVKAQePhYeIFKNVZYXo0dAcRSbUcTt6eXvPYdZz
	 bwSzD0vAK9i3DBalCwaQDW53PvMC1LbGTI9vDnoJVPL4fJUo4xF0nmJ/Xv5wtowiwpgxk
	 sY0lTLqTrMFWKVY7RrI9HBSZyCBd4SVx3LdmDfyl/SOvmd94GzUMaM8rXn31CGC2JABlx
	 8IE3aYPb1ZONXrLL2GMtwJ4Cg2kh5rqxj5aSHo2bWooHx4XKzx0J+P/olW6oBIj/GAJvs
	 chtrgBBi+gJwXGa60z9V+RQS+ctaRoL9anKeIudi/R51VinmETMc4RdLzUvJwMMuHPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699CF606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699CF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4d26094beso16650897b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884351; x=1795489151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=dQoZW17jiNebFuE6azQ83jmKtjqcxcl5zox5/c9ay6PslDfs/OuTxMsQK+M93ZKxLu
         CyJYN8ep/zcVgJmJyDSjHdmSyO8In/0hZGEXZXgl188jmnl8t7EW4jrx2miND6RHUCGB
         CgJW+Q/Bf4JgPuTefi0kDMTb7iEg+i8irfbYxbN64//aJaiyIUsEG+siLRDJs0dpCndY
         CdzY5+RJF9PvDX9DgMSx0PK0f9olnMNJc8gppLDlmu23HGwYc2L7nHo2Y5I6ywE0mHNy
         31yP+aUy91KVf6nZ32brydM00jb9uxJAKYSP0ghepC3RbnV2VUvM1l7wM1KjfUWbyzDO
         u3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884351; x=1795489151;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=H/C/P5Q84L7ByZmxkjq4kKl6sXQnUwAq88FWGU+VcEmOPKdTAJ0SbHvZtrAsTFAkuU
         oXc+a8YGR53olT41drYnoO69srMf9pSJe4bsXIzoN3OmCYGhDI3sEEyKnAr0e9iJ+6AR
         iDagMpwydsYVkNGBUFPwfUXMu8i88VOoI5HgVxn5AUEseur7dAdc3FxTeVUMTF3Uy4ha
         rDaTdwOnXKkKgbidcG92TVLPCaiX/Dw/DGgfrSeIjanypGLVFbKpiolS1oc2B/PG7uJ6
         4iUeWfSC7nbIHNZ9EgtUyQk1jdH2xG3tu/bX/OdyzXkxh00mZDddGUGWO70yvNzELEo3
         3BUw==
X-Forwarded-Encrypted: i=1; AL+hErGPDjNRyqE+ITJbyPzH7t16J3iItGi3BwbuYvkk9B4lwaC3lLqYpir52296I6UzxKmFBVqLiIZM62Zl1VQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JxB28+132FsKQJB5qm1+XKNWjqSKdmkKwORyXyu+3gclqRFY0
	6Sg735W+MAqH+10je71zB3pNlegqDiWUrY2HGYemBXkyXVVo2AXlyela
X-Gm-Gg: AZFdTZeIPjASFaVcZP7L0qrPYfVswAeo9RLWX9m1Pwx34Qs6dXumWBZ/bDDGwTtEizN
	aVYtHuqWbIX9T8fYvc+WyMaSIJq7gxvCtYL2yOCPLY8mqpxNCyu9QnoxiEMMZkfZVE9m4VRJR1k
	noAjO+8csQsTG+/2/SHsUjs/PFv6B/VW/dm9CUb+TW8sTk6DFE78K0ghjRdDDc0HFOCP3dcGCRG
	s3SB/fgYiJCblLlyTcGj8ft32bIRpCqtGOZp5Gh+F3xu+xXpG4lYYA8HWVPh+hwOSEUDIOfMqKg
	v4vobyv4BNhG6y9T1yZL7RE066nKRGMCKguLJzALK9b+2WsE1RTLMltiT8RGi9nK6HeMc0z7oei
	rnJgyI4PPXXgrCCuMGEDTlumfiNK9n+HinmkOhB0r5zSEiyX4tGpB71hT+z6qb9DHB5Ll49yypQ
	HTk94pyE+gmZHZdnZM+8PJFQ/1CjljdIb/Cu8lEm2yOBHeViyPmjrpVXgz7Sp0ofeDVnj2f5ulY
	smxVCugvQ6hAWBsyoId+VQjGWKz9/6vCYa+W3ZXjfrH/BuqC1FEJLyyU6ezXauc/cM9hg+cBldf
	6Jb/gXTZT+j69f0YPpMh0UsDRmyj9oMCT5n3wHAogrDQd47bII9iMr0X28hpH0HkKcuM0WcIUZ2
	n9NChUGbpRrdQNkuW5rmXjQtw1GSPI6z+n91oniGioNhNH/b9n/7yIvA7dWATR006xYBvOQ6bdv
	GGVE/1XFr0qruQ2Y8Fcw==
X-Received: by 2002:a05:690c:ec5:b0:8ab:4c8f:2844 with SMTP id 00721157ae682-8b4aa2a0f51mr73400777b3.39.1794884351354;
        Mon, 16 Nov 2026 18:59:11 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec065f84sm14469217b3.29.2026.11.16.18.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:10 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/7] alpha: marvel: environmental sensors
Date: Mon, 16 Nov 2026 21:59:07 -0500
Message-Id: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NyQ6CMBRFf4W8tTUdkGnlfxgWpTzhGQbTYqMh/
 Xdb3Lo8ybnn7uDQEjposh0senK0LhHkKQMz6mVARn1kkFwWQoiczdp6nBgunvVcVrUpVdFpBXH
 wtHin9xG7tT92r+6BZkuFZIzkttV+jjcvkvc37AXjrKq5khXmXYmX6zBrms5mnaENIXwBKOuc4
 7YAAAA=
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2N/yDN2Wcz2QGAy54x4oEamhIu757IC6EK7THi85BJc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/qzetuVvIoC36zY7Wp/JHPDE9069+2S91qsMs2uz
 mTrw/PbOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa5EKG/xmWhp8D69
 iDJVPk5pfFlyZecviS9/LQ9jZLC6aXNpYOBYwMH21/XNZ/Ha52r7HnW2zxNcuUpg9XXkQIMD1QW
 HUm8OpyFgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, patch 4 passes the
firmware's events to a notifier chain, and patch 5 registers a platform
device. Patch 6 is the hwmon driver, which polls, and patch 7 makes it
reread the sensors and notify userspace when the firmware reports an
event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply status. Disconnecting AC from one of its two
power supplies raised a system event that set the supply's in_fault and
woke poll() and udev, and reconnecting it cleared the fault the same
way. No voltage is out of range, so the voltage alarms were checked by
forcing the warning and failure states in the console's packets.

I used Claude Code to help write this series: working out the packet
layout, drafting the code and changelogs, and checking the firmware
documentation. I reviewed and tested the result.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- hwmon: report the firmware's states by their documented meaning: a
  sensor's warning and failure states are its reading reaching the
  warning and failure limits, not a broken sensor (Guenter)
- hwmon: report power supplies as in channels with only a fault
  attribute instead of power alarms (Guenter)
- hwmon: depend on !ALPHA_LEGACY_START_ADDRESS for generic kernels,
  which leave out core_marvel.o (Sashiko)
- hwmon: drop the private mutex, rely on the hwmon core lock and take
  hwmon_lock() in the event work (Sashiko)
- hwmon: notify each alarm attribute whose value changed, and only those
  (Sashiko, Magnus)
- hwmon: report a voltage outside its limits as in_min_alarm and
  in_lcrit_alarm or in_max_alarm and in_crit_alarm, by comparing it with
  the nominal voltage in the console's packet (Guenter, Magnus)
- alpha: define CCB_CFGTREE in asm/console.h instead of the uapi header,
  since it is a Marvel console extension, and say it comes from Tru64
  (Magnus)
- hwmon: return -ENODATA from every alarm of a sensor that became unknown
- alpha: drop the unreachable SRM check from
  marvel_cfgtree_partial_update(), and move the GCT node type and
  subtype the driver uses to asm/gct.h
- Reorder: fix the event layout before printing it unconditionally, and
  put the alpha patches first
- Drop the Assisted-by trailers, describe tool use here instead (Guenter)
- Link to v1: https://patch.msgid.link/20261114-marvel-env-v1-0-890328e4b7e5@gmail.com

---
Matt Turner (7):
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: notify environmental events
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/marvel-env.rst  |  76 ++++
 MAINTAINERS                         |   8 +
 arch/alpha/include/asm/console.h    |   5 +
 arch/alpha/include/asm/err_ev7.h    |  16 +-
 arch/alpha/include/asm/gct.h        |   2 +
 arch/alpha/include/asm/marvel_env.h |  17 +
 arch/alpha/kernel/core_marvel.c     |  56 +++
 arch/alpha/kernel/err_marvel.c      |  39 +-
 arch/alpha/kernel/proto.h           |   1 +
 arch/alpha/kernel/srmcons.c         |   3 +-
 arch/alpha/lib/callback_srm.S       |   1 +
 drivers/hwmon/Kconfig               |  12 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/marvel-env.c          | 690 ++++++++++++++++++++++++++++++++++++
 15 files changed, 909 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

