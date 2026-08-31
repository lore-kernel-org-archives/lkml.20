Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F942885F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788191641; cv=none; b=BSOPVnvFhMjgnCz6U/T/mDrrbyXG20XKqSawhEy9WDIotW+QVTWKLEQpPTHNYZtjJZVAJ+eRdOq9XHnyprAcWcHggKU2u38h94lWe7OHksXLQPuzkjquuUmW3TzqmaEpCgoNjbdszXvDwDzxyk6oPAIDLBMz1hwhFjJFhliMtTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788191641; c=relaxed/simple;
	bh=ZfaqOfpsDAt2jYwwS6hA1i54o5KKQG9Nc06tnw6dqOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ll4lscr3v7jTKgg+JbG5MY+L9qTITO1S3Sh2BXBmkcNf4No/aH/DduOxZ53FqLx4gRc67jW2ENlN0tiVw4LqYy+BpmAVbHB9K+o+3PAeUIabB7xWaUJ6MUrYLIoUAj556Oj67xgdKPQae00NGhAnJaQvZ2bs1YfWc+FkUMYKOTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxC1N/Gi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxC1N/Gi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843e9c5960so751489f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788191638; x=1788796438; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Twy7b17Na20z7ALy6y2PMSAa/lret+4py5AIJQ0uo+A=;
        b=bxC1N/GiE9LGb9eN1Owepk1UZnknB1m51HzuSCZSMZVNJFANXI4eViEV693P9wTX++
         9aPETz23MCC34p58mfY0/W9FTCvJhyoGOlzB+fm5LWLtc7eOvdfMBxADqB6yQWuv14m2
         QtunKpiER4xt4fWGrSuAbofNQtHSqhoAXspS50vL1ydgEndlqjZKBqg6NAdrHtGjcKEv
         8lqxPT6K31FmkXjnG/B4PyNBGaZMYBTZXsZGxpGKHXCZKC8xr+btPd3DfCzzo93TWXw0
         6ZwU0/4RHo6F7qxFamhn7V2BTCySQEmS6FR4eMKnLrJrQ3G3o4s07xUNLe7aA6mcWo1V
         EaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788191638; x=1788796438;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Twy7b17Na20z7ALy6y2PMSAa/lret+4py5AIJQ0uo+A=;
        b=RvU9ns+N9QAuSk9uLHUxv2344/OjsGGLlf6485UWpJHlsEREurFzqIf2lmkNITUEw5
         3dawxMkWiJgpDm/H/aobbXC1UOCdf9x5FfzS0f1ix5a66f1NpErF6TQk7f1cC0C6bJ21
         VhD6LUpwBVZIkqXHN/gKpffY+bJqRqkQHdMj9EarYOvMIsRGxycnqD6Rp/yy7BoFTswo
         9apNDM3fabu7ctY8qH4c1H/wxm5ydnhom2N3OzGp7IsmJ9kWD1POZzO3uUJPxQskixis
         muv2ERlG/rQkBlLg2nBtrqcScuQKc0IhSfovnCKJO0ZlT+3ENv46rRhV0FYYt0ipgWP3
         u8tg==
X-Forwarded-Encrypted: i=1; AKwUvBzlSd9F29FfkqAgSN7mdBsKWD/kR+P+zwagFxS5jE1xSpGBMlasqoMyyW9wvr4TiEcZyjTW+xodFds4COc=@vger.kernel.org
X-Gm-Message-State: AFuF++ljZCxDZc7QF3stcUrA8QIlFGeKI44l6I8MbQVoW1cFsTq7OdpW
	M7m612oB8dhtqK5UXUA4bUeby4QDNVgwGcB9yAX9yg0SPsssgyL7A7SP
X-Gm-Gg: AYBFou0JTtNEP6ZzB1BGnSuzOULvBpJGlj1hFQ01yR5PqmSktEkf7oZyGx+kolL5++D
	hunq3pTcO08GVjww/X2tAlVlhklm06fhaDrGxjIpdhQlt7+o+iHg+AZuZbQqdX293GDBQESlOOv
	wR5GbLjSApl+1ap1I/kD9NkkMRqG7pRJGFiMpZD4TNnL0CtpwLD2tqCxCw/pMOVDupODQoJQQd5
	9dGQvRalPG6FJFeqFEh8hqkHs+Anro3WLtsH45V3kGlbKnHcKscHBpfEZMtz/hOmDE3KvytrRlq
	+SNawULmzq9gXJaJ3gnuXPHEcUI4n1LHTEIdVIrUA4eVvXZRXIivUBdD6yvsnZuyIWwT8+rDBNC
	54QvU4owM8YMgTm71DNA74t3kpgskOa3QxgLKMI0XKcdj8H1SrylfJyCQuWgmedMt9AXkzfSSmK
	txjWAlCD19mN9LqJu0nm9NBXfiOqD2IkWs/CfmVx6MAxr0wEE2w5Fk3bw62XRRqpb7Vxrb7Ob4r
	6O8717Pr3sd3ggrIe4tnJQc
X-Received: by 2002:a05:6000:1a86:b0:484:360d:17b8 with SMTP id ffacd0b85a97d-484360d1a2amr20053253f8f.16.1788191637800;
        Mon, 31 Aug 2026 08:53:57 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436e2af3asm12949099f8f.12.2026.08.31.08.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:53:55 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v1 0/5] power_supply: errno, hwmon rollback and docs/ABI sync
Date: Mon, 31 Aug 2026 12:53:34 -0300
Message-ID: <20260831155339.181487-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Small power_supply hygiene on top of v7.3-rc1.

Patch 1 returns -ENOMEM when OCV table allocation fails (was -EINVAL).
Patch 2 best-effort recreates hwmon after register_extension() rolls
back a failed update_sysfs_and_hwmon() that already removed the old
hwmon group.
Patches 3-4 align Documentation/power/power_supply_class.rst and the
sysfs-class-power ABI type values with the current enums/strings.
Patch 5 replaces spaces with tabs in get_property_direct().

Base: v7.3-rc1

Tested: built drivers/power/supply/power_supply_core.o with
CONFIG_POWER_SUPPLY=y; checkpatch clean on 0001-0005.

Thanks,
Iván

Iván Ezequiel Rodriguez (5):
  power: return -ENOMEM on OCV table alloc failure
  power: restore hwmon if extension update fails
  docs: power: fix power_supply_class.rst status, health and time_to
  docs: ABI: complete power_supply type valid values
  power: use tabs in power_supply_get_property_direct

 Documentation/ABI/testing/sysfs-class-power |  4 +++-
 Documentation/power/power_supply_class.rst  | 26 +++++++++++++-------------
 drivers/power/supply/power_supply_core.c    | 14 ++++++++++++--
 3 files changed, 28 insertions(+), 16 deletions(-)

-- 
2.43.0
