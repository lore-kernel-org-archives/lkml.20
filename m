Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428959;
	b=w5Rz91omE5fCAgdVM7R/TTSg6BlwlUapm3Tnnebzyo+g2Ekv+u1OjXV38/SJsRkOqbtF
	 BwjQJWs9Eh7RST4Ka0Z5xigmD2JMMAGDk2hgjRsTetU2g7MIxG4P8uW8uQ4vnS7VoUoQv
	 6MjhJOQOEroRpAtxsDGvE/SmZCp7towa3P1bdAybYXcVacH7nitw4ThVdgcQ9objkpGnP
	 t5zxtdjjbR9ETwE0HM4yH+BCaIiuEWFIuic/OkcCWrdW/3jyE+TIVSE2Ga4L16IFZxzco
	 Je5r50tLUX87htwvy7c8jaqG6Jfjdp6piZNd1d8a+wNzGMLnxq4uI3oUnOHgRP6SPsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
	b=OJLogZSbXXDOMjNjkR1Q2u0Y6aj1WOIYQhvl4vQR8oCrrHWJX2t9hfHwtoOh2s4Y2nBT
	 qlD2sJ0czBwuEWKPpjuedYGSq+AHwfBz6W05wskNxirj1r4TYL7DIXAGDngSBRjPuzKFx
	 wfo2kYuLOYRBLdwWjw1tFKB5M1/r00Zz1p91tTRHgzim2gIIF4FrX+rPd8UUDX58QP4wB
	 eJOA1YsoRqpeZhpR2YBOKWQcIgWacLkJ0Yn6xLAB//5gjnMyt5Yn1B225pkiWiZgNRbqq
	 ++BMch6Yl54NAJMEsut74jD/cndGPUmh8/i+JBhcNSfrXyt/Lubh66PyjfThR7HwguQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzhTUC8T;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzhTUC8T
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso6071358eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794428958; x=1795033758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
        b=nzhTUC8TZZHNyEVGlhL/XBoNxd3gthYF16MskDBFwLq60PWD/gnXVaMSmTIRjmR/3n
         bxRRUjJX3qYjfa01AqbOzdd3bMGEZr36YaA9hTczhm/Ec2RQH2nTeRncbwbLLabYp2Dv
         C2/q7V5KPNLPqFV+aauaygaRa7e3EkMeBs5ilwLpVWQOlusG1mwostFd2Bev3tScNNjM
         73CRZDjRfcbIeQ20Vr3eS65HTPdVs+J0Di5tcV3diCM/J5yhajM3BSIsWgaHCkc9csUp
         sg8d6CoXXfcCAaaQswrtsKhHwLxHzJYFqhlevtuMg7fIUXvIsiCLllw0FZENXksUmITB
         8RjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794428958; x=1795033758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9It4hMqtt49l3ULmVv9787KtA2OXBi4xbJqqG9UksKs=;
        b=XfzUY4/DegOmd1HNLDQli6icFu+nGpY8YcJ8DeevUKFccXTQC781OmBH4ZqvePpPbf
         hwjde58X33vwAPO1cqsJwZMsah/pCW0FggPADHV0bp67Sw929DC1tK8e1LYuHsQltIBQ
         yXPIX7zm8namM2iOG10WuXCYElR1BhIPNlnWRlAsreV3GxWE9bPgPJDtAB4s5f/3//IC
         Yq9OSn3cbRhiYRnYNm/oA4ZPhN7sirAOWQK//mtamG5dxcQEfuP7GFs+P7E9wYR99QEl
         phsL8/5HY1c7dKMa3IQLZUhLRVBOUXmTJc8PhIr5c5YfL7xMBywqNG6A3f6BGZNCwntx
         OlIQ==
X-Forwarded-Encrypted: i=1; AL+hErGaOLoZKxVKKPKYcz3JPqCRh44tf2bDqr3kWjx8yp+KyV7keHqpNmisK+uiqONdXnia3HokTuYJllenpis=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xCwIDUkBtHN5Ck8BNCB51ukI8Vcz4DPf9rVHzdubGYnQQmrjY
	UEjYMB2CjsAqD+REBuOeswCxLQZ2Z0UJKhIgqugaaS7YXy3ZyQ1HDsEz
X-Gm-Gg: AYBFou07EgKtBWLMXs+TesjTy60WBpjqQI75g4JRW3lnC1PH6pLoa5/JtaIMcrm/q89
	OgrF3bJiuhymClF/NkLgQp+DfWp1h/sk1lTow/rOI5KaXDOnLz48DJXUTcre+u7u+M9tGIRQiCM
	FYxlMyiCbd55CIqtwbkKYVLurU6/qAr9amnH7Qa6zaVsRtDv6YhlotSCxnrQdcrGjOhFyj0uCDy
	5pes/nhYiEq1fNvOHYV7UaXDYGAvz0tU8JSVQb9S7ffNPt7lxpRxlONZ4Hi/xuUldVIYWo+S9UX
	PCV1Q6DrdvLvLBXkGm7VfKrbwKax1ojhnSYnnj2M2hQrbgfxDryFKnBVfxtnRzAE5bs7gePz+p7
	n0b6FnhOQ/LkpEHX0HSkm4fDkUzfIdRh+7D1OGXfChpXX8sCDduZB4VRAoN+/f45sYmZDDjmJVf
	7qPUzvBFuJwCOxFo2W3aI+6aUM7CQfq1uwPDZQa7i//bkfZmycun8fZbmAf45gT5Nd9V7SJma2z
	DzsCqqH5wedfMHQy6WZKHowLZKWh+oZEAiWVxhwegJxtlzDWxOsBmVVw8xf0b1s3bIDLQvYsYdg
	8qBMccnWSsLe6pf3/JiPKC6dyC0UypUWudUH5UJCBQ==
X-Received: by 2002:a05:693c:42d3:b0:366:9f06:3c4c with SMTP id 5a478bee46e88-3768694ff22mr3227743eec.32.1794428957949;
        Wed, 11 Nov 2026 12:29:17 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm20740200eec.17.2026.11.11.12.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:29:17 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Vincent Mailhol <mailhol@kernel.org>,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] arm64: defconfig: drop four symbols that no longer exist
Date: Wed, 11 Nov 2026 20:29:14 +0000
Message-ID: <20261111202914.2558187-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

None of these symbols exists any more, so the lines look like options that
can still be chosen:

  NFS_V4_1                  folded into NFS_V4 (7537db24806f, 2025-12-04)
  SLIM_QCOM_CTRL            driver removed     (7cbba32a2d62, 2025-09-12)
  NET_VENDOR_PACKET_ENGINES vendor removed     (aec3202247b4, 2026-04-22)
  SCHED_DEBUG               option removed     (b52173065e0a, 2025-03-17)

Three of the lines went stale when their symbol disappeared.  The Ethernet
line was added by commit 32379ad4060b ("arm64: defconfig: Drop unused
Ethernet vendors") on 2026-04-29, a week after the packetengines vendor
directory had been removed, so it was stale from the start.

Scanning every Kconfig definition in the tree leaves no other stale line
in this file.  Similar leftovers remain in other architectures'
defconfigs; those are not touched here.

Mikko Rapeli sent a patch for the SLIM_QCOM_CTRL line in December 2025,
and Vincent Mailhol's "configs: cleanup obsolete or incorrect assignments"
series carried the NFS_V4_1 and SLIM_QCOM_CTRL lines in March 2026; both
submissions are still unmerged.  This patch covers all four lines and
would supersede those hunks; I am happy to drop the corresponding hunk if
either author would rather keep their own.

Tested as configuration text only: "make ARCH=arm64 defconfig" on v7.4-rc2
with and without this change gives a byte-identical .config, and "make
savedefconfig" emits none of the four lines.  No kernel was built or
booted from this change.

The change and the changelog text were produced with an AI coding
assistant (Hermes Agent, model deepseek-v4.1-flash) working from the tree
and the git history.  I reviewed the diff and the reasoning, and I am
responsible for the submission.

Link: https://lore.kernel.org/all/20251223134807.3543642-1-mikko.rapeli@linaro.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-3-8eecb7fdd24d@kernel.org/
Link: https://lore.kernel.org/all/20260317-arm_defconf_cleanup-v1-9-8eecb7fdd24d@kernel.org/
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 arch/arm64/configs/defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21..513f8d6be073 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -424,7 +424,6 @@ CONFIG_MLX5_CORE_EN=y
 # CONFIG_NET_VENDOR_NETRONOME is not set
 # CONFIG_NET_VENDOR_NVIDIA is not set
 # CONFIG_NET_VENDOR_OKI is not set
-# CONFIG_NET_VENDOR_PACKET_ENGINES is not set
 # CONFIG_NET_VENDOR_QLOGIC is not set
 # CONFIG_NET_VENDOR_BROCADE is not set
 CONFIG_QCOM_EMAC=m
@@ -1756,7 +1755,6 @@ CONFIG_QCOMTEE=m
 CONFIG_MUX_GPIO=m
 CONFIG_MUX_MMIO=y
 CONFIG_SLIMBUS=m
-CONFIG_SLIM_QCOM_CTRL=m
 CONFIG_SLIM_QCOM_NGD_CTRL=m
 CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_IMX=y
@@ -1824,7 +1822,6 @@ CONFIG_SQUASHFS=y
 CONFIG_PSTORE_RAM=m
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=m
@@ -1861,7 +1858,6 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_INFO_REDUCED=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_CORESIGHT=m

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

