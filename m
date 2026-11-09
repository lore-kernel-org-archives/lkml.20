Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794199350;
	b=o8ZA/toaid0LUF9YaQa3j+cT47DwJIKBkzoF7qtRg1XUQPw3VIxyErg64TQX7sG0uqTq
	 /zFODyUlpnx+5dQ11boTxb2v6ObYMU6OciYz5lbERtB2hLYANa1icZZm1n1pvnOxwU0vP
	 YZPQ9asKNB5s+q+OJ+bOYSJRgiL8GHv37D3efxEjE2lIqe2rhTJjntyzJPbmt3Y8yWe5w
	 T7I1hwCpguWurlzYGne+ScAV03/ipN9nwdyra+NJV0uKBemn6QBpdLF4JvciKYIoGPx+m
	 mClqC0RX94OVJyPy2NvLu1EeI+1dExtR8YEE/BGBU2u2W6a+iZ2y+G6sSzcJcitoOqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794199350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=;
	b=UjiNS1AlJIDC9amH7wq+QaUxbRiMwhghqTxQZ+vaiLO5VN7Qy2Xulb0yHifiZXPPmfiR
	 nBtqV6VTuGsKBrwvzjYRA+wKwmynDG8brGog63+noDB8zzbTrqsESIuEk4rJgnqeN/wyT
	 7B2lR8ir5fGaa2MoBz5CwQjqPL6mYZsE6jQNdsXzieIcyX3xC4xcr3A1crEB+GjWYS+5U
	 q4v3itEbxynksxt9YPZz8Gb6kgFfD4MA8omYj02tgp427olQZ1A51zh85VD0pLtVHt7/r
	 BVElexFSX+hu7DyeD2LwIhD2hkYqLj/+bMZLbfQqG94F6Guxmz/PqudtvqRzT84XmEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEkn3dZ3;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8B606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC8B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SEkn3dZ3
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so860888eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199349; x=1794804149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=;
        b=SEkn3dZ3Dhm0ayrX5XWGwr2O8QZ4/4IYdJhisBIoiyVXuzcBivcRLJha5Ecw7gRtbm
         e2isRw/YG9RMQk4KxDxlMGIUDGX9ZbUTlSinamICEU7VQHj53/IWt9bAMV4oCEq1VC7h
         xvzlB8noKsH05vDpKXNR8cokriBUsI/tKBPESV0IZGwW6KrdbHkLAn31cDR2DTJJ11/s
         FxZ0/dxnHrFP2gUk9FRTzTJK5rCJyiUHXBFIIY34Ci0yx2/aLffYNTcwQNVp0Nww7I3O
         QoehyF6+lpwk/B35HkCHbHOc1gWLq5/Yxy/LQ3+pXQ+njiMXopiHGo4Y1RHIsKbJXV4C
         5CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199349; x=1794804149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=;
        b=RS7LezLk+n+P09tPzQI3nQ94+RUlNCV3cTSE8pCW1UR1VYfpTP+Y/bKSAeLGKhmQmX
         5cTI2P/ujHTlw8PzR0wL19w1Il/Zrvx2LxLbftEd/R6RFNC0zDdioUDvFCIgANdWmKTn
         f0euaLP9yTQ2q2mLu78MMy5j+J9FKFUbtTJcHLQQ1jrU9xNXfqVf0No28VD1fFPIpZjl
         fxm+jXOYbV0yZ/I5AWpWxl36tbs/TmTc1pT1lWaBqgzTyzhR62jmBn5InG34RRZhDXQ7
         7L7eQ0kSBm8F+kjdRvXyv8A689klzAnSIqFl0gMOXrZuvbvMjqtIcwRszsVRlGGm5A5b
         wzQA==
X-Forwarded-Encrypted: i=1; AL+hErEGObSIZZ6sLai4gyljwMV4jJpucplcX84vtBvPBZ5P7EU2+R2LDDWUEKcP//fGL70T7uz1QQ/z+pY/LWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JK94zAEShQUuNMVTAHGSlt8upiPOE7mpzJ233d9PpPf8O6Ty8
	8cBljmhJTswn6cqseLSoBYKaPdYA0XCmKjwEss7i1A1oQNKBa3QUeKY+
X-Gm-Gg: AYBFou0gLv7EOplpb6jgkUztB6dDoVXg/w6r3kLV2UhiueqehLtpgN3Ydtn4/S5FW7/
	RwyYHc7KCwvg3BOV52Wm41pXgdvbuJFsn8QdfMztb68Nhf72MjtUzKwWJtdYwp56z8iqj48HkCH
	uPAyMiooHwHHHSxJvmA0QTpkpJ1jvWElx0j4XHxtB2sFBGzsOaLj9YT4VlZH3+sFxOtiZ9QxC2C
	zFbzTQKgH+6Cfgjfe1e4lUX3v/HpXXk9bE+qnvsszsYzkdcUA1sAXjDCU07MoSXwTPavpLYCjL6
	XQTS4paGsdf25QayHzHrbXAs1WByAMfIe5pt0mO6y2kCN+1CINlT4hLZh8xAC+BhqHc1Qtkj1Ek
	vJnxZKld6hJ6eAX30vB51JDpxqOsUSAPrApHnjyUV3KzJW50SoU9ZmYKe7fFw2qR7thDdWxfapn
	jRPBibQtUhU51GqQ2Em6IgCpnjlYnit6u1jd2/TIIyVY24cCDUMEhMEbuKxqSGyxlB/dUILyrvv
	bPnU5amJDF4rCWJORQXv/xk2AJEhRn/RTggMN8FwAmexDQ5U+nGkdviTVeczwCiw/9lVMAemR8c
	K7QhVnsIWsNoD2noIWVISzbkaN/267gcBc9h+m5lZfL7wrWh3jzYFiwhXaRmZ+fY7TeC1A==
X-Received: by 2002:a05:7300:c8c6:b0:369:f420:8679 with SMTP id 5a478bee46e88-37257d9496emr5721564eec.38.1794199348727;
        Sun, 08 Nov 2026 20:42:28 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:28 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2 0/3] power: supply: fix work-vs-devres teardown use-after-free
Date: Mon,  9 Nov 2026 13:42:09 +0900
Message-ID: <20261109044212.1157357-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

Three power-supply drivers register a poll/detect work for devm
cancellation before devm_power_supply_register(). devres unwinds in
reverse, so on unbind the power supply is freed before the work is
cancelled, and the work's power_supply_changed() then dereferences the
freed supply. Each patch moves the devm work-cancel registration to after
devm_power_supply_register() so teardown drains the work first. No
functional change.

v2 (thanks Sebastian Reichel):
 - trim the commit messages down to the bug and the fix
 - drop the inline comments
 - no code change vs v1 other than that comment removal

Hyunjung Ko (3):
  power: supply: ltc2941: drain poll work before unregistering the supply
  power: supply: axp20x_usb_power: drain vbus_detect work before
    unregistering the supply
  power: supply: mt6360_charger: drain chrdet_work before unregistering
    the supply

 drivers/power/supply/axp20x_usb_power.c      | 10 +++++-----
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 drivers/power/supply/mt6360_charger.c        |  7 ++++---
 3 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.43.0

