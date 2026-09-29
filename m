Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A5B50E5B4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677745; cv=none; b=jCZWsr1YuLFNKA+4dc362SMXn4lnRV7fR4O1iIqUlzH8MhfszgSWDXN6kARErJprZXTpk8dD4G+vmzS2Re2s1+MVcA8ODXYlQmykUjG+oWQDic+sr+1DsKhcCpO4NQVfBMg0OoicuPZDS5PdVglcbBlzlRQJpChn8M88svyVS/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677745; c=relaxed/simple;
	bh=q4j4QY4leyzrLjrQxisvqoEVE4/IisdbZD2H5tvHyPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nhO66uauZvc7COO1JbA3g02bzngt5U8ut3yzoOqz1eYsexhs7A+bk6wn1w6veiB8eduNTcQxVNdgXCf3HfbXHTWwDKHc306cg7siZHSATc37HzeZYJr1MWbDVnUd/lemRTZfI4CAX/CEdptpZsu0L4Ui83+yOJCSjM4wwYl4tBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=Q2a3ivIM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="Q2a3ivIM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so14225475e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677726; x=1791282526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BSZ/gXDOHxG9VvtIRs2yHB3ZSsRLqGiGUtuNcgzCuxo=;
        b=Q2a3ivIMoZrznwZy9Bh7WR0k/BanALvuhYpuIAfk5wrx+NMpP5SiRumVvuddrSGqUG
         da/uXnMT1xpxb0s+KZvaEf8IrNV1czrNGfAsELSAOOEOLkdYpaoNS6Y3mnoQuTtvEmDW
         xplwj46i2abbP48S1HscYl/2qlK0hmQXXES3Xh1bWUxZUvHQGRrbBGPtAnwUfGDQv3Wa
         HwLYFw5hzi8sm4Acwvu8/tb8stFraFdk/YjQeDH6oJyEA8VgmTv1gGgZfsVg7YrqDOnA
         cX+yFyJKpEUOOD+JdtVamx1B+oC05BhL7l1X9hCDJW+FsUPYUG4HVoz/Y8JfVOCVzH8K
         8wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677726; x=1791282526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSZ/gXDOHxG9VvtIRs2yHB3ZSsRLqGiGUtuNcgzCuxo=;
        b=rYkr7mCWfsCFTi2BRtwUuqzKNaqwnuYPGfKI3Iwi1LyhfURC+kK4DphRpoE6sBdxtQ
         jPhKhzr79Hc4jjP40D9+Rv9K6deMXv/25ptIJQCdxLj7H7qcpCB+5EYgTWoODxtE9xqJ
         cyqXeTsEf05A+RlaVffyfjNWK4ScTQHTs0EId8Hh+DXh+wdPC+aEu2nTI1LKbftf7O7A
         4BvnU4NemEuTCtebS+pwXrOrqTZvqBbYyeUQLN6bgMRR/Ym02DAlSFpAd9S4AOturcxU
         sNXfvAbKIaRncbLSon8Aml1tbGaUJdlUWmX+zm9pV5iERRKH6sMDzhMz7s5vqqntdbNY
         4NNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg/LhRgtOMD9W1T6Ak0i3yvC2nL5cWlUELGFKyrXO8Z9IBEsGpCRyYou4Sewnxgr0DrabHIz9T8fMhB1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m/zGBrJbHB2hJpNJLqn0YHt1bp1emVgnTfyIEg7WiAKiikI7br
	hyy9ZGzD/RXj+69ONfLZOw+GqKpv9o6m1u/vd6r5zgTHS+25EYAu9vdqXd4C80D260o=
X-Gm-Gg: AYBFou2O/y8j0ZuiJyLZgaVdi8RZfdxc001bSDW3WAk77Tjs7oQl48+dR8CLeiE4eKn
	x9J169HGgee2e+Ov9xZmMmRx4xABeB9Uk6PI/7YE5Xt1YN5bkgfEvm0o5A/BD6jh3JMJWOzJ8U3
	RRpAbFB+nbGEPNAobW81Q+6Ek6T/xCvee39Ovlxn4TMeNYAkFwMdW4eTUf6UkQv6Vp4530q5DfP
	C1P8RV/0UhxdePnjcHv+VTrL7bUinNcNm2Ph1myVH0mmxmR0WTs5pHDdExoAiO/QC1a1Y9yUV/L
	9woaiQbfnDQv966mazEP5W+3bfWD/FtS/wpvuuaZpvhaFVRv0H2hBmqCbaWS4qIYtxuE43kR5yL
	wP24sAc+qMZCgUyy9pN1pUFLqivditquSs2MoFCMEZ3rTlchoZIVxYMikXKDJjEBqzUZoYExFPr
	HOdaUxq13AJwDBu96NhlfvB0sWmJOk4QQkkNVQhJDwbpqgVtYdgzfYJn/tycD/1WofPqO7FTqRC
	m0QtwW87g3QDSu5eQ==
X-Received: by 2002:a05:600c:a08:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fe66c8a3emr289485105e9.4.1790677716604;
        Tue, 29 Sep 2026 03:28:36 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:36 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:18 +0400
Subject: [PATCH v2 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-1-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=alchark@flipper.net;
 h=from:subject:message-id; bh=q4j4QY4leyzrLjrQxisvqoEVE4/IisdbZD2H5tvHyPE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnSxWWD91pz53CYh8tEJyStOv7gqYVyyf5PzVjlrr
 Xs+ly83dUxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV9v8YGQ4ZW0svarESvfuy0Ulrrcjv1b93zzsscyboaOf9B4WPDkgw/LP7XFI
 U0rP8gUaIUFOywwwtRY/Ev3F/tySWzU5YpfeglBkA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0

