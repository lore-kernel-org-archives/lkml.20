Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CD537A845
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723683; cv=none; b=I37dyM2YjqDuQdzaojsTawWLqpICGigSGYVC+LJUjwzcMiXkluMcoLzwanw8U+DtVSRu39BmKG7xtMQeFH1fbZUrS/PWnb156/oZKWD6wzn1HetouB5K0t22UkoIWL1NOl4mEKzV6r6wzQ3DR4TSsojEy1oxT+KFWODFOyAKvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723683; c=relaxed/simple;
	bh=gfyfmI/c9k+T3v97GqLFTmjkdngo/5etTTn9H2RVSBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oCzZD7Gnt5X81eeaD3IYe8t0qiM726Q+J2X+2tBBc6SetgUVKf76nVbR3TjHV0wWYEsUHpNELumW/iYytrvHH3anATMS7RtWsgRpKXP0a4tVDu74Lb4tpiZ8tFme9pirD5M1aTJce+ML0AyPXDR357z5ei8XgD9i5Cwh6Zy0rg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkZIorym; arc=none smtp.client-ip=74.125.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkZIorym"
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-485b1d2874aso344327f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789723680; x=1790328480; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ahb7X99xI5/f4Coc8xUhc23QGLKHkzyos4mwiCsRZng=;
        b=LkZIorymI9RQ2X7d9aqviH80b1N659zUU/obFZH9a6TUOJGJyCl9TUvqwJcklyhfHh
         BWwMQWqBVzPb1mV8L5D2jH8uypty1OqWITYo5yZ61Yc6N2JyO83Spxu37lsE9+8+LmIb
         TueHSEJ5IqbX7XOiO3Gvkz7u9R4mBh4gJV6lrSrPLZPB+RduIzE1vSoYgSEoJrml/pGV
         G7Si8oaHfrSfh6plj8ChGw397LgEpc7evZYaofTgMPDKK4ELhaLsG/voqwk98gXIlzJ7
         aE72LSlszJ4FgENGbrbk//UBfNObtPYJQZw5tdI43BbjvtlwsEri8ESKLmsu0ZZR36lI
         JY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723680; x=1790328480;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ahb7X99xI5/f4Coc8xUhc23QGLKHkzyos4mwiCsRZng=;
        b=wITEiQ1kjKg3hL7RjZlz/REBfV/dCA3GQIDEQH2vKHo0mo0nt80lk7jXxFiiG42vUc
         AQUk9/fZPlKMKdg0uZ4CrjuoiAQQHk5Bt/S+NXANV4cdYh5DZN2HY8+lN31Tye1OmXYT
         19a7BUYTN6V+K8r1OzsniLl9t7OuLqQWGWz+ne6Yp98NjSvKxiSjlLJuATt0KwgDprwi
         nDwUqkpOSXCFmmQB0vrYpjG/i++zGDlgsXfT588aCQRlUqKEQZzHs9r3XZix3cAVm3KV
         HPKqw7knKhSE8ECC3OxYPHzwOOPJVdN5+vrhf5kpXYRlsCHH7vF2xRx4COU3Co5/2Laz
         PIpg==
X-Forwarded-Encrypted: i=1; AKwUvBxeJo46JPvZSyuIMwhL8H2sr6XNLwyjsNboE4+jSX+yhCaT3TTAZKtPiutcVbj8qn2dnBwCEngP1ojicOc=@vger.kernel.org
X-Gm-Message-State: AFuF++lcsTtCJ/O+i5wB7fZyfyk2o0Ml06ChbrM91CtYy2roItFQzjES
	EmvfcKb6IbWcDhDOcVADdT/EaypPK3QL0Iqpcvpucm/F7ZBk7La4Ft0B
X-Gm-Gg: AYBFou35WEDXAWdXOUwUeRk0F8VJ/vp9UMyp1J2yhC08UTI/ynb30R5oMkAjtZ9Wo5D
	4EMkEEXa+KrZhEFxC60R6SL5XlFRUKi9ItZBRdU1guUD6xsr/Yuu1zwJvfe7PmxkfVguKcPh6KG
	5l2FwQBEpKC66mTaqy2E+KHbjwadXNE9zjPS45eBODeUz1Epd46QdDelW552mJLruNZzCTkxOrH
	MNC7lMc4ZVv9tD8D9EkP5mp1MUahsZfEiiH1s9TM0TpCOzCRu+MNotLO4e6qH1N1QNFeUaLy1Js
	nsWHQrj1WpnQ6hVCMp3zhg0Ury3zcHqm/BsXiz7GbCLxPvC3zdVYNZvuwuY1wlhobjY7nk9+6pS
	Mcd0yfJowrRKR+SzH7kRu1xmQfOIuRd2imVCgISGKJhvSEj/B2+fNnkUF4Ptt+s/WMEP7YGHPGy
	qbm/r8DFeHHHf4gfqgZ+9t3Fa6ZrIe7Uq7z7n5fTnVtdsa6yFC9tZHGdxh57RDGKd8LKJfySsZx
	Ij9WMgVo77iXR2fBTl7JTrh+acpmQ==
X-Received: by 2002:a5d:5d09:0:b0:486:e6a2:2d7c with SMTP id ffacd0b85a97d-4871e263c17mr3982801f8f.15.1789723679853;
        Fri, 18 Sep 2026 02:27:59 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4871ff56905sm2517653f8f.20.2026.09.18.02.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:27:59 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 18 Sep 2026 11:27:49 +0200
Subject: [PATCH] clk: qcom: gcc-ipq5018: mark 'gpll0_main' clock as
 critical
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ipq5018-mark-gpll0_main-critical-v1-1-fbe8f27a0106@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3N3QrCMAxA4VcZuTaQds6/VxGRWNMZ7Lqaighj7
 27x8rs5Z4EqplLh1C1g8tGqc25wmw7Cg/MoqPdm8OR3dHR71PIayB1wYnviWFKi68SaMZi+NXD
 C2N+49+IiDVtomWIS9ftfnC/r+gNq6nO1cgAAAA==
X-Change-ID: 20260917-ipq5018-mark-gpll0_main-critical-f3ba32e1f054
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Stanislaw Pal <kuncy7@gmail.com>, 
 Mieczyslaw Nalewaj <namiltd@yahoo.com>, Jie Luo <jie.luo@oss.qualcomm.com>, 
 Georg Seema <georgseema@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

On IPQ5018, the APCS core clock feeds the CPUs. It can use
different clocks as its parent, but during system boot it
utilizes GPLL0.

Under some cicumstances, the 'gpll0_main' clock is getting
disabled during kernel start which results in a system hang
then the hardware watchdog restarts the board after a while.

This can happen when a driver gets a clock in its probe function,
then releases it either directly or by devres cleanup on probe
failure.

For example, since v6.18 the kernel often fails to boot on the
TP-Link Archer AX55 v1 board by using the in-tree dts. In the
failing configuration, the 'ipq-cmn-pll' driver is built into
the kernel and the problem is caused by the pm_runtim_put()
call in the ipq_cmn_pll_clk_probe() function. Due to this call,
runtime pm disables the 'gcc_cmn_blk_ahb_clk' clock asynchronously
which results in disabling 'gpll0_main' as well.

Mark the clock as critical in order to avoid such hangs.

Cc: stable@vger.kernel.org
Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Note:
There is a patch [1] awaiting upstream which intends to solve the
problem in the case of the 'ipq-cmn-pll' driver. However the same
hang can be reproduced with several other drivers by triggering a
probe failure in them.

The actual patch aims to solve the root cause.

Link: https://lore.kernel.org/r/20260813093351.178419-1-kuncy7@gmail.com # [1]
---
 drivers/clk/qcom/gcc-ipq5018.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 594dae3bac4c..46da652956fb 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -68,6 +68,15 @@ static struct clk_alpha_pll gpll0_main = {
 			.parent_data = gcc_xo_data,
 			.num_parents = ARRAY_SIZE(gcc_xo_data),
 			.ops = &clk_alpha_pll_stromer_ops,
+			/*
+			 * During system boot, this PLL feeds the CPUs.
+			 * Mark it as critical to ensure that CCF does
+			 * not disable it, even if there are no active
+			 * consumers. This is needed to avoid a system
+			 * hang caused by turning off the clock driving
+			 * the CPUs.
+			 */
+			.flags = CLK_IS_CRITICAL,
 		},
 	},
 };

---
base-commit: 55981579b27b6541aeeab81c768f248dba0491ac
change-id: 20260917-ipq5018-mark-gpll0_main-critical-f3ba32e1f054

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

