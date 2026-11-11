Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404377;
	b=Q488sh7nu4jCyVvXNWHG8UJsDjb3e/S/6Xs2BYuV6ZUIWXdbCZxtyVXG3eTMCGE2jCrX
	 JKoP+Es0t8ffm64sA0WF5ZFKEEOyoZ9IDTqjn8lAv5oKJDc7YEx+ySuNXfT7VLaORC+91
	 Z5nPchBcPHCWBOxEFZfk+yXUq+q5qRODDMFPr9PwET8Jsict5wBY6sOnR2q2GgqKbK5Xs
	 CBbFECL4TM7uc346Vf8EI8UpWyfFCv8WMXS/WYpPsb4mcy4x37RkHSKea9L1yQOx44m7M
	 sCTpKsxd8bQBZZuIcROsfagdIsTbLNtiFu560Eqjz4MaWkciSWpNrBiE7UEVpyUZUNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2kS9dicq9WJtkdcbUOwlBh5D/SqIBgi+IJdoGVG42Y0=;
	b=Aih1aty53dG7VJw+vt+scHGWO/IN+egLD+VoHzE+TbfoOBXpN78hlo8wYDYEs+nc+7Cr
	 7oAp8VLNjcgg/GvFsN4HTJRg8fGViRb6CebCpMoC9dOKcbY7dE3/1WVekd+uRJF+banlj
	 UyloFKk6VJrRaxmRdJgGsVq+oRqSY/Z8Ji8RSJgeu9thqySP2M+CWUh4kXJinDiayan0X
	 H4LTpIrUhA92p2nqPBgRwGs0aEHVVbEAI9nIHwU+qZ4myjyJtdWeADplue5uiKX/OkT0x
	 TPQSzaG2L9guCnWETX7TKvfp3BSfzUtuaNBBQpGm4yRBWzewTnm5MUVD7lIwVEGxLsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PlV2MFSu;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8C9606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D8C9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PlV2MFSu
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so32058245e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404375; x=1795009175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kS9dicq9WJtkdcbUOwlBh5D/SqIBgi+IJdoGVG42Y0=;
        b=PlV2MFSuY3H+C2n/mlx9LVvCgKhCSJ3Z65sL1DoxD8Z7od8VnEbTN4OWZ6J0odDZAg
         +pnCyEWSGy9wgrRviG/OyDetWNIbM+7xCzf0vwN5cgGN89Xts7c2T++JUAB6G4zFSaid
         ou6qfPzwAfMp0XXwvQh5kwTfRLw1qpe4KHvQSVrzSqlGEGTidG1zjt+VMHHrqbIuwJ1L
         tYq3X2GeA+UC5UxsxnfuhdviMK9HJ0bGmmlGUM2HQ6inABNIvOiXe5IED+r4kDeV1s8j
         asHIBcTEm/1LVCsTWZJpw2FlyJeStHEzdEcfjqYZK5fup4a8jKL8r9ppjO5mpxgfONTV
         Pkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404375; x=1795009175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kS9dicq9WJtkdcbUOwlBh5D/SqIBgi+IJdoGVG42Y0=;
        b=aCt/8/a0ki2Gxn6TipklqMBgqHCWNdLXoyGxYwvfZBXOAsOSwSZwvWErWQplYP061m
         /pxg6EICEAj9htKP+Kylro7ph3pOzAZCZ3sM6Tb8cBWoF/MV9we/OuNy0c7D9w9qLU4a
         WeaZgAYhoEG6J19sNzdVZdAE4smhap5ZfEYit6QSgwZYW8ro/biBlJ8vOBAtmgi57etN
         u2wjzF1NEPDfj4S+Fx8FQlFemXMV6dufxflGZ83HPxVF9OiOyP0T/Hb6Fq8iwN8zIj29
         ukHPxDrkF11xDF+rMkC9xXXWQHfRqBEB3EDGaXn61g1mrDi4HidbkueUB6n5ZEKZ77L4
         Iwmw==
X-Forwarded-Encrypted: i=1; AL+hErHFETAsw1HGtdlvIbfBg5ZnjMTG9i/r3GT7OO73zUQqSE4zFRWMJVd5c8FjKxmv9742IxW94IUI8e/6DAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uwfr2tjHAHcr37QbGnQMyUexq9t2TAIgwQD/65CElqj7zxsuf
	RBsEOYX38ctsJaZ06TX5yjqNckPcATSh3+4pD2QxBe3vGVHh1iNAtaD1
X-Gm-Gg: AYBFou2pUisSF6c3N2iSsdcraGBg6ey20jhXP+f436zmCSadHwCVKUSwxQDMaDmG4Jy
	2h2GIP/uvpsZEt/PDvgXodHy4TRVDrNoOpaP7XkB27q+PT97cY3IDonklqyJrpbB1jvqJeRdoe/
	96sVjzJzzY/gvvXZdnw6fZmM1XcJaPAUCIOSP/2w6869b/6nwAvndKbpWmboaiXtxewfUTnP9tF
	on+0aDxIAugxv0ZUFE/4jYVkeLQZRJySkNzhVi4m2qqL842H+BYv97su7RjI8VpmiJus2DzOB76
	7n4eNxvatBnporcfDemfE565biHOlzeeHzyWmpWC0VW8QZCwb5qhkeH/PzmBdFIPxaxSlrzPlgF
	SvtL9SAy5eacVBJfZ6BZvujcVkdFTZoDYlWYpibUwy8d/UFG8JfoGHQY5VN+mygHSNydWcus5pu
	fZD6kQlLskT4he815dlkOAua3UTFvAuCgkeUW/vXU9RjwP89sWMsyDfJv9h/RVWgRC9xv3rB1EE
	OsVnZTDAZX7AujxYrbEVl8/TsVKypf+3KnsuEaCnr8ZRziBXQHwNQmC5s3/9rAb0rqgMJRsSrUM
	xLXvGgbY7u64TSc6gddZMrhzOjn4Hcxkt40=
X-Received: by 2002:a05:600c:3486:b0:4a1:d8fc:8165 with SMTP id 5b1f17b1804b1-4ba093b981fmr42016525e9.20.1794404375439;
        Wed, 11 Nov 2026 05:39:35 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm136757365e9.10.2026.11.11.05.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:39:34 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Wed, 11 Nov 2026 14:39:30 +0100
Message-Id: <20261111133930.3665251-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
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

l2x0_of_init() looks the L2 cache node up by compatible and enables the
cache whatever its status property says, so a device tree cannot keep
the L2 cache off.

On the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3) a PCIe read on one
CPU deadlocks against an L2C-310 line operation by physical address or a
Cache Sync on the other CPU, and the board hangs within seconds of WiFi
traffic.  Running with the L2 cache off avoids the deadlock, so a board
needs a way to say so.

Honour the status property, as the newer cache controller drivers
already do (drivers/cache/ax45mp_cache.c, starfive_starlink_cache.c).
If the firmware left the cache enabled, it cannot simply be ignored,
since nothing would maintain it: clean, invalidate and disable it
instead.  No in-tree L2 cache node is disabled, so nothing changes for
existing device trees.

Tested on the ZTE ZXHN H3600: with the node disabled the cache stays
off and the system runs normally; with it enabled the cache comes up as
before.  The firmware-enabled path was exercised with a test-only
change that enables the cache before the check.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index eaa1fb44886e..0687e5a6ad10 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1757,6 +1757,34 @@ static const struct of_device_id l2x0_ids[] __initconst = {
 	{}
 };
 
+/*
+ * The device tree marks the cache as disabled.  Leave it off; if the
+ * firmware enabled it, clean, invalidate and disable it rather than leave
+ * it running without any cache maintenance.
+ */
+static void __init l2c_of_disabled(void __iomem *base)
+{
+	u32 cache_id, aux;
+	unsigned int sync;
+
+	if (!(readl_relaxed(base + L2X0_CTRL) & L2X0_CTRL_EN)) {
+		pr_info("L2C: disabled by the device tree\n");
+		return;
+	}
+
+	pr_warn("L2C: disabled by the device tree but enabled by the firmware, disabling it\n");
+	cache_id = readl_relaxed(base + L2X0_CACHE_ID);
+	aux = readl_relaxed(base + L2X0_AUX_CTRL);
+	sync = (cache_id & L2X0_CACHE_ID_PART_MASK) == AURORA_CACHE_ID ?
+		AURORA_SYNC_REG : L2X0_CACHE_SYNC;
+	l2x0_way_mask = (1 << l2c_num_ways(cache_id, aux)) - 1;
+	__l2c_op_way(base + L2X0_CLEAN_INV_WAY);
+	writel_relaxed(0, base + sync);
+	l2c_wait_mask(base + sync, 1);
+	l2c_write_sec(0, base, L2X0_CTRL);
+	dsb(st);
+}
+
 int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 {
 	const struct l2c_init_data *data;
@@ -1779,6 +1807,13 @@ int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 
 	l2x0_saved_regs.phy_base = res.start;
 
+	if (!of_device_is_available(np)) {
+		l2c_of_disabled(l2x0_base);
+		iounmap(l2x0_base);
+		l2x0_base = NULL;
+		return -ENODEV;
+	}
+
 	data = of_match_node(l2x0_ids, np)->data;
 
 	if (of_device_is_compatible(np, "arm,pl310-cache") &&
-- 
2.30.2

