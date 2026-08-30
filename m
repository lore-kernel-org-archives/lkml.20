Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630793ACEE0
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088518; cv=none; b=PKNi1nklE0yG7Bc2aciFo6YeELGYKPfNXBb+BLZ+JMnT/wEF+04GtSOJOndaFYp/Cg4yUl2ExHr+xcTInHWgE1xTsB7qE5Ik0hShKtk1ZTEl0yA0lo7h9/ieeN+1MGPHoNTpoLY9eDiIs7gKhtofUIp1T60ReiBlJ7q2XS66XZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088518; c=relaxed/simple;
	bh=7JC7WsOLkSZR7QF0lv+xw2ku0Pg/QnGWHEpCmQnckiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nHmksZyF44PfxSgZyelUZJUrVNnU50yBxeF1IETyr3ZgKSvVwfdaawYys51/HKoJWODpLCKLi4MVR+vfiiylbVLhlTPeKkT1UCO0Sklxh2C5mzyj9epDrSks15LwJvD0FKs9j74y0G7lr4M1N0hmTVe674+Qgg25hdrAvSmI/ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbyf5TaE; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbyf5TaE"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so2728613a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088514; x=1788693314; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=swnMIm+9bRtjZwoNNtbbuIBoOIF6i0dGJB4V71AxU5I=;
        b=Pbyf5TaE5uv6s2SdP+VBLaWdwug8458VrEYALbBZKIfT+q6Tfnfxx6fU5lC+oUxlj8
         Npmoq7ea5hOqv1BvkZ5l2vSg82YZMnvQVWn2ls1yt8JkMIVjy0ZAQbRw6qQVzonuSVPj
         nRZT2g1PvOWzwULaO9zlJXyp+vvtETRMahEJRkMbSmQB0WEZuxuWa4ABD2Fff4VeQMGU
         sj1sJFr0d0t1g+0I3od1KopJ6Y2nCdJKIKjFi0uvCtqJaHign3gW8phjFO7AeyB7cKkO
         KeZvpwTnjH5luysT8A5Js0LjMkFm7g0NnK3gbMPofqh+PS3h1awgQQ4mbLsd8AXOA2VL
         2ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088514; x=1788693314;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=swnMIm+9bRtjZwoNNtbbuIBoOIF6i0dGJB4V71AxU5I=;
        b=FdMZQEFWAUj7U2ynJIAHiGgS35tR6CNml8g3B6LMjyOGFUkZQzTIjegddIz4PecyaV
         1peDnKWPLmf4dMpXWgxK76ZxUGIXMzfo6ZGwonoHK8PECohEtUrvyJSmmbUIS6cX3ASb
         Xn1XYqxraJY4jUxvJUyXNbgSn03/9Va/mN7zzso8M5dUeZ0MAnv7/VeHlSKVQ9fPhmy9
         DJmrS7r0XYkGbH6weUe3lZBf5i+Ycc1sM6JFlK4xjxQEk4OuLU3ScDBtvrNlmB5w2gSX
         z+zfj5qsSuGJ/SH41bpNTruaLMHoBmzD968Dq2WEKiSFayfZacdVJz0APia40QeYkmVg
         OGKg==
X-Forwarded-Encrypted: i=1; AKwUvByitdXry8tpJaXmVpa7XsdTlEgBgawp1W66qijnW/7whSQK1holn3uDEll9uYUHi64DAc5E/7fT6U+gxZc=@vger.kernel.org
X-Gm-Message-State: AFuF++nOgKOUvbO2lH3oXJNkenXdsP7HUwEufd+jjJWiqZMJ5SHPV/IF
	emq61VCpZ+l5E7ZhV08CiBST5/FyjR3pV4LL9dHwXF3mdaF+9djE05wC
X-Gm-Gg: AYBFou2l8bhBgTCF20IY4Nz3OqeT+zCFEc6z7Au8l9fiR+gSvDXTxtkMBfWr69uUfO7
	VRktWAHun6czL6KOdcOnstWkcDOlNnO3+iuhi+6kqZhnn5uLMDSzPI1nlBPDEVydBo4CByTP2YH
	d5s9Niv6XsCtUJue/+fE4C01tqsQRfwrSzer0L+JoqolhiCG9WssknB6Y4sHPISj7KWftdx+xSh
	vydY6cVrJNwCnnGBOkz77K062VqQ+/du2FVIwe+of/JkKMjEIcYIKrH+AjN2NSTB7yfLqt9comx
	YjVV7FeZMaXAA6MuKawNTHGQuCxT+HkIWv5ABtB7CIGaB/Whx1XHey0KTBGtuoLZc4Kt/OBRfZl
	9li1DfH0YvMkFLuFnY1/hpWoQjR58rHr/1BVxfjuLYsAWcYa3YYv/gnUj4qhxFLk9HgjEQ3JhiJ
	jV+Jg5qXmO2CXAcNEPnYXdLHRXGdMcFiwa567Y/4FKBgce6lTeJ3wBrSLiBbm3ggS4QZiBGKkrl
	fOAWGXvjdz+R0Vid7aNCaKbfQuHBtsYeXg62oG60P/z4mfBSm8=
X-Received: by 2002:a17:90b:3b90:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-398c150e8d3mr7415565a91.4.1788088513714;
        Sun, 30 Aug 2026 04:15:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Date: Sun, 30 Aug 2026 04:15:04 -0700
Message-Id: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgQlGoC/yXMQQ6CMBBG4auQWTsJNFKrVzEugP7oGDM1HUQSw
 t2tuvwW761kyAKjU7VSxiwmSQuaXUXDrdMrWGIxudr5OrgjL8FzpzEnifyApjmxvTVF8CG04x6
 Nb9E7Kv0zY5Tl9z5f/rZXf8cwfYe0bR+uuGNCfQAAAA==
X-Change-ID: 20260829-x86-android-lenovo-swnode-785f4e165eb2
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

When gpiolib dropped name-against-label matching in favor of firmware node
identity mapping, lookups referencing unattached software nodes (such as
arizona and gpio_crystalcove in x86-android-tablets) stopped working.

This series fixes the lookups and cleans up redundant software node
registrations on Lenovo tablets:
- Point Arizona GPIO property entries directly to the codec device software
  node, which is attached to the parent device.
- Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
  during devres action teardown.
- Generalize gpio_secondary_fwnode_init() to accept a node group argument
  and use it to attach crystalcove_gpiochip_node as a secondary firmware
  node to INT33FD:00 on Lenovo Yoga Tab 2 models.
- Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
  Yoga Tab 2 models where codec software nodes are already registered when
  attached to their respective devices.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (6):
      platform/x86: x86-android-tablets: fix Arizona GPIO swnode references
      platform/x86: x86-android-tablets: hold device reference for secondary fwnode teardown
      platform/x86: x86-android-tablets: pass node group to gpio_secondary_fwnode_init()
      platform/x86: x86-android-tablets: add Crystal Cove GPIO swnode support
      platform/x86: x86-android-tablets: drop redundant swnode group on YT3
      platform/x86: x86-android-tablets: use shared battery swnode group on Yoga Tab 2

 drivers/platform/x86/x86-android-tablets/core.c    | 35 +++++++++++++++-----
 drivers/platform/x86/x86-android-tablets/lenovo.c  | 37 +++++++---------------
 .../x86/x86-android-tablets/x86-android-tablets.h  |  2 ++
 3 files changed, 40 insertions(+), 34 deletions(-)
---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260829-x86-android-lenovo-swnode-785f4e165eb2

Thanks.

-- 
Dmitry

