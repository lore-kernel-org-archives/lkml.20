Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060671;
	b=ubnutb1I+kB9fHPtj1egQxWST4oW131sysFEJlccVHWiqFbnLUS3Vo1JPz0X10fAw+G8
	 L9GYmBIHhBTZHHhOXGHnnVJVTqGPUdHQH9X9lva6P0sFaTQdv2U6B0SzZ9GfbZHJtxUON
	 SN2kp3Xw76m1R1w/S3p1K8GnsSbgI9XnwRa4FU3+wW/LB/cPMnQIXs0WKYQVKIzUHr2K9
	 kqn2XK8y5gOzVTuoTb3rXlduXa6vAyXy9IdodjYwRZRIpMMtQwF2WmOtrkoZEzgyfcQyR
	 bZxr2CDmmaY+KMNGInoHZXHVdZKr4h5rdTYk23RPneq+NGwAb28Z5rlR5nSQZ3u0Vjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N+Xvec07uoX87AO29/8Wl59FJ0uKiswGsShIgxHmlc8=;
	b=MH0PDv98rd04lE6i6DDZmIvrOTjJOA5LqkhsEtx9KzWvWb5udbcYqV7CE3g7oa6aYCX6
	 UM3Mz8ylwmE9wvr/3b9c/7DPqscJDF1RT0meune1qXgu3h84EjcjzHZ1JXdjUJXzgfoK2
	 ztqzOU2xxnk14e+Z/qjL2/t70CaeNuQkKWzVtdli/latrPBHq5zES6ZD/PofefxlrMJ3y
	 PjofUyi4UrwGHaDh4mRihVVcOjbuU+y5x8Hk5Z4DJcN5D8CRYbm4zS9ThmMvdimHXfnHM
	 gv7xH4BFLIR9J3N9I5yUVt02jOjYAPx2+ptvZ4ui1utePoig3K20ZsLcBK32bHWcH4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTHQsB8K;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF068606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF068606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YTHQsB8K
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so3904343a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060669; x=1793665469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+Xvec07uoX87AO29/8Wl59FJ0uKiswGsShIgxHmlc8=;
        b=YTHQsB8K71Utnq1y/7rscr+4aTy1kBdRaMpUyWRrzDckgv1pLXq/TxGhXAEchcSdZ7
         9BqLp2KGclRoUTiijnG7++I9eUCao71Sbb81RgOcvd/5nlvCC73iBasFeNo4YEbLsNTI
         w5ZWXvKqTYb4ffQl8pP6I1JAPotaWVPotKTkssHxy2c7V8ciZ6W1u1a9Khl8GpAcYHQh
         2O13EijZdnOiL9LBqmDV897fU92zp/L4cvZmi8iw2HqpLycd4DMAzn7fxunnHMxoOk2T
         fA2K/oaHJ82YsvDOLPHJ5LJzw1/LyxhbG2ouQUfdx4j99q+9Wu/cZkjDr7i/0fYnrLlD
         Uw/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060669; x=1793665469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+Xvec07uoX87AO29/8Wl59FJ0uKiswGsShIgxHmlc8=;
        b=vWdQIkMDLeqK09ILc3HdDqy1P49vde6uRZy7+IC/q9em5hIBRYVkifxRKWbYtVmuLA
         cfJFSplQv+vJkzi1szlcdT4SdTiGc0rnnDAswzkUpozyoDVAu924NxKB0CoyfbhMCfyG
         XWAm4bu4lqvddtszmdP02RRWIui98G0Z75WTzvY2AbBFXtvNvqFXXMQaftKno5vw3FyI
         zjwRiDVVcyhkMhH/FC5yTMnjOrbGF66+xQeTZwjYIoWGvHW4TAXfey+sUD+V7uy4e50n
         Z4qMOPnoqP/gNo9cclEUP7gBG+nQd9f5P807E45k0XOi1hkkFcv0Ma0bWcbZyFl/4Wpf
         iOaA==
X-Forwarded-Encrypted: i=1; AKwUvByoI6KjjSPbPEBlS3T37GdbS53z8xVxOwhBLEMC0TQEBLoAExTWyW0PQY9qMpPw9CaYhKnKF04EcnVVd+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN3vV7d+9/68PTeFDJtixVrGe69L31vdBLIjK3sPUQrdIbl9QP
	dYf9mIe2lBOonnpeXba6LZHSdA9g6okmLdGkm6VlEF2jvptpR3Q0rleP
X-Gm-Gg: AYBFou1DgTOFwbCcZ0ptpoS4q4AOVmSFH6Dz+5HFS5dmnNfTwWahkJSubVq66QnpKlU
	afX8JEtcuRWdA/yczp6u6hlZ7qSlpx9psg7lejGdadBRHLobXP9nwEy1D13iWRpqaoEw824h7jL
	uQb4coDGt9cj86pt5nW0+TVm710wxI2kz+BwU6WnhgUhihCNPb3HpJup0Q/3dSiejdbQscyrQQP
	bc5mI08caGzHOYhJhj0jh5IexUMJ+K0EpCJAcx1QYf90RFqfBvBsjuv5WBJy4EvjjgggZd1rZyv
	sy3cXpGHIHeFKS/XNUEXFtJeJwXuMs2gn0u8gUBW4w0kP871DxV+XXXp1mEC0ToR/IZU52260pg
	UAFWGa+1nGKaK5vfEdKsl+fjqoLymspCKQL1M0fH4UpfjM25wgha3u60j4JnHDweiIcp+HVzZ9i
	RJ+G7cmZMH1GTz9xD7h3j0kI3VvJb2qPUVAmWlOhmmC3VLk+4IdO4GyvhFyR2Ol2HI+VLLBRRUG
	BBHOTrZTcX9Xhre5LN7UZOe1/osF6xQbNr2Wy6Y3vkI114v56dl6/Eay8oIcFo=
X-Received: by 2002:a05:6402:3d1:b0:6b4:35af:328d with SMTP id 4fb4d7f45d1cf-6b442fc9e5fmr6712467a12.14.1793060668811;
        Mon, 26 Oct 2026 17:24:28 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984207sm3975344a12.22.2026.10.26.17.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:24:28 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nikolay Bryskin <nbryskin@gmail.com>
Subject: [PATCH] clk: rockchip: rk3588: keep the OTP gates shared with the secure world on
Date: Tue, 27 Oct 2026 02:24:19 +0200
Message-ID: <20261027002419.2099708-1-nbryskin@gmail.com>
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

The secure OTP controller (OTPC_S) shares three clock gates in
CRU_CLKGATE_CON18 with the non-secure one: clk_otpc_arb,
clk_otpc_auto_rd_g and clk_otp_phy_g. The kernel treats them as ordinary
gates: clk_otpc_auto_rd_g is disabled as unused at the end of boot, and
the rockchip-otp nvmem driver enables clk_otpc_arb and clk_otp_phy_g
around each read and disables them again afterwards.

Firmware in the secure world (OP-TEE reads its hardware unique key and
the secure boot state from OTPC_S, and programs them) has no way to take
a reference on these clocks. Once Linux has gated them, every secure OTP
access times out, and a normal-world nvmem read on another CPU can gate
them in the middle of a secure access, including a fuse programming
cycle.

Mark the three gates critical so the normal world never turns them off.
They are 24 MHz gates for the OTP block only.

Link: https://github.com/OP-TEE/optee_os/pull/8034
Signed-off-by: Nikolay Bryskin <nbryskin@gmail.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 24baa0ef9bf3..8e0f408fdfad 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1158,11 +1158,11 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(18), 9, GFLAGS),
 	GATE(CLK_OTPC_NS, "clk_otpc_ns", "xin24m", 0,
 			RK3588_CLKGATE_CON(18), 10, GFLAGS),
-	GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", 0,
+	GATE(CLK_OTPC_ARB, "clk_otpc_arb", "xin24m", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(18), 11, GFLAGS),
-	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", 0,
+	GATE(CLK_OTP_PHY_G, "clk_otp_phy_g", "xin24m", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(18), 13, GFLAGS),
-	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", 0,
+	GATE(CLK_OTPC_AUTO_RD_G, "clk_otpc_auto_rd_g", "xin24m", CLK_IS_CRITICAL,
 			RK3588_CLKGATE_CON(18), 12, GFLAGS),
 
 	GATE(PCLK_SARADC, "pclk_saradc", "pclk_top_root", 0,
-- 
2.56.0

