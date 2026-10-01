Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CCF367B9F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814762; cv=none; b=HBzMewbvI9k9dmyLGYoqI1urRc+47ApvR8pSV1/FLTjIIslySW/IGYLNoIZstSjCAq570OuBw4Kw5qUsCLOjWzxxbTXn4UUoGRWmGyWEyY6eW2eP6pNNgJGcuCCz0JWGPwjxC6nibNpqSJ5kMAkt7/U+/4ucaq4Qe2+LtuKxnSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814762; c=relaxed/simple;
	bh=x7Xeqy22CeVPYIZ5A9Tn9NRH39uHncyxeijFI0NRiNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XPsImNqVfjDj+yHcUxNqTJz/cpX8rq9dHM9erl8lO8JytH1a0vNLD2/pBxye/t9G/O05sDkMJbX72ee2jhHHUh/rYdZL53x049suwJb8SRCnGQaX9AnDHQV7VIB4C14hn5qGLR3DLQ3tvmfu7jBGOtND8Zc0E6/jZIjELwOa28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6lhTWti; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6lhTWti"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09dso937193a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814752; x=1791419552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iv9L/+HVFnM7i9eClWaaSdn+muF0U9djx0l6n2F2CZA=;
        b=L6lhTWtieN697WJWtvFM+7BvL6AROJz9ftrfjGQ0d91XmUhjqNbJyoaNZ8EBdwFfk/
         kikyZyQo3JjMgzjYCcnB1+dX0Q3ZbbXeorfuFzheiX2VtXurNCnRYVeKspnLdOhUOABx
         GTIeIXJI7SXL0ZE0So371pxCFEk32ZES936iEZyCmMdhMDEtxc/QFXwcb/bVIsJ0Lq+d
         Yl1g9jql2nqNadqG/iUQsMXDqeJUMqroyDYGV5S3icZnZ+P+GWLMvVftA3mTtuhNsUMu
         H5Xu+eLwKiT2oEr1w7mUnm9YHqXe/baSU6wOmNWdjZvmtQ9lhcOYvKO4cJNtXgxUydJL
         EIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814752; x=1791419552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iv9L/+HVFnM7i9eClWaaSdn+muF0U9djx0l6n2F2CZA=;
        b=ya2q9qlL1qp94mvSy7IEDnFXxJLQqPu8x1HHXjqXGO9PpvpMK9IfjNAIUvDUrbPltY
         ByguSlAoTOSr0PeDNqHPlAFiaKOL+Ua67ccuebWgV76E+ZWGVcXOFRxTiXj0sfacioAX
         ze72uQuGZRKJkYckL2PJWHQeBRmvUnuOx9kUy7MrXELLKcvSaIq6kQSwn11oxPBMNQQ/
         zWoDCuD3kLxMDh6PJ/q9xTCuCwxB+rdHM5ByN49lkZuvZCnohbiheMwjafFGP/GdS2XY
         ha46HRZtJUPcmH+Rqgb2LTsVcuQJ+HiauNniL4N73ncDbbcoGxYhU+x2BrTbH941i3zO
         xkSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKghXs0FrwuzS9aCea253g1zA4PLmvxeCwAZ3L4vYSX8jTPgwlMMNCLTZEZ+L5hDmgfdGL0KfoUd5jmv8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgkYdg6IVfrLEW7LbssYD053oGcr+YGoXA6zMtFZnAOoDJu4Xr
	qqNhmirl8bHpVAcejjPwQZlBLOOhB+XdtA2pQJ6OaZlXA9i5i13/wP0K
X-Gm-Gg: AYBFou0kG75bsBoUX9CwHRIINlSq2zgSVVZjcGLkIp3PE+scByzBnN2uSLoU8NY4aK6
	eQAlCxo6MnB7LAvRZMovBGmIaI1l6PO/ebtURx3phnJcpSYKYEFcatmANjoq00Op8zCrhPA2R0O
	91WOWzp9vw3UJ/dE/8n4S5Py5exkSvg9xlwsGBAb7gPOcjriTpsHLmdHI06Rg0pHGD/Yg2Q2OXO
	D2apfBT6d7iJhjIA9GJRQl00Ab0eJx5WRKuYsnfyNrbg+LXdNcXe+EEhLpX17Z2iIohn7v9nxQz
	4bKg0Uwjv58E7cQqvEpMzFih02lzSGmnuK4GjDDnvY2FmOhdkEP/hBqf8UaJRfxiZNPcSE1ivPc
	ofET/czPNUl4gDEi2CUtuZCESbFBgQDNBBHVUSfzQFO96j6LxqJoMWRNtKP3fU2ULagm1mV3X0Y
	/gIj4bL0Vj+RqGiX4XQa864m42ZsohzQcpwqL1jhqliUKgqG+Xu4Yg
X-Received: by 2002:a17:903:2d2:b0:2e2:c28d:ab6b with SMTP id d9443c01a7336-2e2e43d3ac5mr23912735ad.0.1790814751860;
        Wed, 30 Sep 2026 17:32:31 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b58345sm3161615ad.66.2026.09.30.17.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:32:31 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v7 0/5] Merge redmi-wmi into bitland-mifs-wmi
Date: Thu,  1 Oct 2026 00:32:13 +0000
Message-ID: <20261001003218.39421-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks
and dropped the previous redmi-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (5):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add per-machine ops table

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 259 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 --------------
 5 files changed, 195 insertions(+), 238 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

