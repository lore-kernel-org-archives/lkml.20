Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209592;
	b=FVQTqMNJnoxV9ejflngs10POvWsgZZA3XwtRzJddfmeysP9t+EQbXv4kXabcqI96Grp6
	 YHL8deEmGkubaMVVYwsJ6bP42YaY65s5z+lH0vtGRKyx+bAo7PNZozDelvP4L9UNMuCo5
	 KSDzxYPZVSJJ48JOc9BNKMBZg4GvmZPHO21OP3AjJdaPvBCz20+JrCvKjhI6Hej3yT4xi
	 yH5pG8hJ4ryTyURO+1BrfYYmMkMVJxb6AcRvejmdbhLBsYyfi0CHpQpPLyI8todi9pmyo
	 N+2XC0OsN8mVwhYAsJY7F1z1w6M9YN/DRvCbyA9yJaMXz5tliUNRvEy98MzOnYwRCrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OE8OEA2joPPITRGS+av4AQ4EjtvJjhIqiZj/74OJ5qU=;
	b=x3HkpRH4FpYJuDMDO4EPbSU1x74aNaFNr3srOjUAJe5x2qkinRBUD5KqJi+4IvlgbURW
	 X5iaPKtpiLQZwshqv0z3iJvurxUQ5dbN91LcETTY+pbZ+aPBkNoGt9yS+ZAaCU/IBO8Le
	 ahDeX6AJNORcMEdMvFKV3tj5zgO2wSqDWXg2vvp6DN2EhyVCQMFbKY39nL7Jm5rpaPNvL
	 wuqkd9yq/N6DquBYTmOAIq1PyTWkt696lXNacntuFrQ4KjWKIw3NedTXVjgotAwev+dRZ
	 lrprvsAI28B8kFkAY58bDNy3zOr/BM4PHcx88A4iY5fnfxA8dGzVU2RWyHDFRqvTvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kBqzdIXa;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E66B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E66B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kBqzdIXa
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so1127098eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209591; x=1793814391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OE8OEA2joPPITRGS+av4AQ4EjtvJjhIqiZj/74OJ5qU=;
        b=kBqzdIXavLytvf9SYHCm/pkmonafEAIJbPTG5Ma0NNLs54dl5g/RNtnT6qbXe5+Z1G
         xYYSptCzJX1ERFY0T4kQfZb6V4hhJghI2eBDNhVGe6RdyQVQ6VSZU7gZ0HQ0V4Z/E9Wy
         iSnTXB7XwvSfxsKJsEEAYXlvl+uXEc/0R+oaYN3lalgR8MGQ98A5Qb80JP0VvXHUWqmn
         /SyOPMVSxn7fkIElA+z9Aoc0jLCkkJ/y8PtKPgz8sXeoHaf2lcWG/dUzDlttHZUEo/lw
         e21s6ac8uABLM4qYXO0nzCF3i41Ivy/XErOcywbIjZpabFjX3cTCiKNrTwlhz5m+GCiu
         C8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209591; x=1793814391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OE8OEA2joPPITRGS+av4AQ4EjtvJjhIqiZj/74OJ5qU=;
        b=En5Ikt/wuBxaqteE+FukqgPEp3PwDLuMIj7GGE1xsPCTjc68AEduCYmCptRhD4kMbf
         DPH6476e5VelDDdPM8wkDISDOUx33vRHYWUNpJBgZquFudqokJxKGTDqPpTq7kxb7el3
         F+p00GVG1g4XAJlo97NYdfLA68x+mDj4J7g3vtyYIXbjlns6AcBTlSer3leeduk+Ws+2
         YdHMZleZxvmvMVkKEQH4Iv7OIdX4BkMub0kgkOXmrNLXTsFl/udXS2UZwaD6Q+pc60op
         sJM9WUPykFJ1cTOp1O1np1QKkvf4CLJNEL/QWO3wkX0Zr49hM7A35HV0IT9TMFbtcElh
         G0/g==
X-Forwarded-Encrypted: i=1; AKwUvBwZ3EhvhGStFVJ7uqxf21seEYYkHEUGjaDCXZ9qxxFVfCRa2UdgLMGuGekDfBDgixmTpqwXqniraL3gYCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeWecRtK5kFU42b+CKGwuMX2FJpNVrBknZYnkj9JXOOD4TOjQ4
	KVeK5R9QqA6paJ/vnk0+MGVivCIr8d5ajH2ToPzM6bfVqN3Q6K+OxVM6
X-Gm-Gg: AYBFou2I3Y0fTKGCzcPDh2ZZHu9EwHpIhhTNrAODYw6f7leqEnX/eHa2/2TUW6Fgccu
	XgwowX9qjKeP0aI19Ybf8JOeBG9euQRdHNKzSidc5hdwVQ0VQDgHZiYicP+cg+dWma1LOZiC0cH
	UCSxgIbLbUiBTUDuxyCtmC9GqD0f9tDuQQR8fLZVf7EhNHkZ+TcM96DGDLx9OY/DcWKuOrtg1lu
	Lj2wmOgYUf/QUAqrTQn5YACtDwoLQEDOFEjdfntjUaKQxZIckjeu5WoBFpW2Wsb5xCZeQkWCEHi
	MGh5z4h74BvzPY64KvRy2adc5xfi57tyiRgGhdkwbOl3cubwwCiJqqjhwQWhm+pVMQ7Dd3UVsVT
	Z9+93puoZZffF6J19PS/7q7xrnWdPg/hbz3GZUKMKqibXUb5PYFv04XrNgfmwczCfnZL3brlD5h
	ef/KdHzFpVUujo/4lZ6hXzgDkRwh+nZDXFWkpKaHp5tIVwuGIMvl3ibE6Cpp28qjhsB0zVdyVbt
	WJmlNcmtbxEumc99OaehucJ10tSIixKcXZakljP02QFgTpR8YyQzHNaEbJXDDMSks+k8u7vGZmR
	t+wHBNxqHr47KkvqeWijlt4zIdzS0Z5Zt5A0i5jO8VeiHgZgBL5T9d7xwxME50s+0qWG
X-Received: by 2002:a05:693c:2411:b0:36a:1bd4:628a with SMTP id 5a478bee46e88-36a203abe0bmr4120169eec.9.1793209590886;
        Wed, 28 Oct 2026 10:46:30 -0700 (PDT)
Received: from toolbx (2607-8700-5500-3d9a-0000-0000-0000-0003.16clouds.com. [2607:8700:5500:3d9a::3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm17883633eec.2.2026.10.28.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:46:30 -0700 (PDT)
From: ZiAo Wang <ziaowang2007@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	ZiAo Wang <ziaowang2007@gmail.com>
Subject: [PATCH v2 0/2] Add support for Valkyrie USB LCD displays
Date: Thu, 29 Oct 2026 01:44:23 +0800
Message-ID: <20261028174425.21704-1-ziaowang2007@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hi,

This series adds a DRM/KMS driver for Valkyrie USB LCD displays.

Vendor website here:
https://www.my-valkyrie.com

This driver is devloped from scratch via black-box analysis on
vendor software. Currently only supports two variants, I'm sure
there are more variants, but I don't have them.

The devices use a vendor-specific USB protocol. The driver exposes
them as standard DRM outputs and converts XRGB8888 framebuffer data
to UYVY, the only format device accepts.

Patch 1 was authored by Ho Jie Feng and provides the XRGB8888-to-UYVY
conversion helper used by the driver. It was previously posted but
was not merged because it lacked an in-tree user. It is included
here without changes to the original code, with my Signed-off-by
added as the submitter. Ho Jie Feng is CC'd on this series.

Original posting:
https://lore.kernel.org/lkml/20261019154820.68659-2-hjf3108@gmail.com/

Patch 2 adds the Valkyrie DRM driver.

I wish merging this series through the DRM tree.

I tested both supported variants on physical hardware using the
Sway compositor and verified that rendering, suspend, and reset
work correctly on all of them.

Thanks,
ZiAo Wang

Ho Jie Feng (1):
  drm/format-helper: Add XRGB8888 to UYVY conversion

ZiAo Wang (1):
  drm/tiny: Add driver for Valkyrie USB LCD displays

 MAINTAINERS                           |    7 +
 drivers/gpu/drm/drm_format_helper.c   |   73 ++
 drivers/gpu/drm/drm_format_internal.h |   21 +
 drivers/gpu/drm/tiny/Kconfig          |   15 +
 drivers/gpu/drm/tiny/Makefile         |    1 +
 drivers/gpu/drm/tiny/valkyrie-lcd.c   | 1416 +++++++++++++++++++++++++
 include/drm/drm_format_helper.h       |    4 +
 7 files changed, 1537 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/valkyrie-lcd.c


base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
-- 
2.56.0

