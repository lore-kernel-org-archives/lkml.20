Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E617148D874
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563396; cv=none; b=AfKbpB2rK4k9hPldCzrJ3Aj+3fthwEUhoV0qMd7MsBZ+fpPJJDOehclQdWOWG9ZxbtLiytQu1G31tp01iXk10/BPOP9SDZVeLcRRlqcUIuyD9fgBozc8iCoShQMDXC+98MiscftBqV0FTNIgx13rlkEjsi+mNIuBKrc0O0TM6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563396; c=relaxed/simple;
	bh=kkUupmneTSkSMAW1kU9Nr5OuWucHdCVY8m2X3BfaK5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UxMdVyUscnGkz0Zf8HtowZS2xeNF98+zTQh49fwQLD4hX0BjPTW0uspn3Yhmr3IFF9OQ63p3BQaDbJFCsxxRlxC3jPMs10GVCkJFgdTzJelp2hWzp+tiPLLBHNZXKEJtxeFBZJ3bvRjmrmDiefbJ5RQ97tma+APBpKBa9emv+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUxsUEnD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUxsUEnD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843172bff4so446331f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789563389; x=1790168189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K65vKL8xh3jtkztbOsGnSCiF0lSalpJ1jm2FXDGayB0=;
        b=DUxsUEnD97IDCA5BfpC36ym7geAsAKwxaFed54vB0AJ1WunEtJhXbIZPjM2ZuBZcWH
         hnwyzrDpPRHN8h6LlqSHiZ30a3qEJcFDxdTf+ri0mdNg+RludLTMKARZY5tnaNa26Eui
         8ozyeqx2iuZOTcRpuBQ9z7WU546Qlf4uKgdNarKv25rRDJhFoJ6KBEugelbc0mj+lbnK
         s4oRPzGYBhCRUzeTyDY+2ugg/eu/c1zAo/Hubmf9e4P3W5b1AQHdzvh4tnH/gfuM/pGL
         oh/s2kksdWlq+SFxZyaaoBLvlA+YRPGPXiKySvZKN3Dos5yChoecItyrJRlK56h+D2ui
         gssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563389; x=1790168189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K65vKL8xh3jtkztbOsGnSCiF0lSalpJ1jm2FXDGayB0=;
        b=lABxvVky1Ed9syAEyz3PgnvJM3GZ7C/FZuHyAsZKYnXsSWgykVZD+NiSdjLjDoD10V
         J/DepgChNg1NHldbnNqbK4uzHRG1YqPrNiYNGR8TN+uT76zgcXG2yfKcc1ZQNWDE9yRJ
         3/7FO40Js91/i8a1MEisqLFphEQ3lkjxmhejucX3fk0hVTUW7XC+05fWtdGTpubDPMRA
         +emH1t1ZtXjWbxvo6wXOp+YYdDf94jH+bme4qfmj8BMYWTlZZzE0GxRoxtxQE4nzVfq0
         Ks1wAImxnZUq7rtE0jCOKPMq63+3GRmwILh2OemPc+RbiAKkpNsr5uxY7goT994a5uHW
         zWaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEb6jp0W8xS1osOxfr9A5H0qk7htzpX4rwRqZF9pXBgwjZ0+TCjtvDNoXIA3OrxhGB4L+WttPE8K5LGyU=@vger.kernel.org
X-Gm-Message-State: AFuF++ld1kJ/hTU3M6q+TLkSfgr3eltancqeS0uki9vRIyw59IWJ60Cb
	M3LVlB5uiY23aSbF6QLsGDwVqpxMQf1NMlUFRoVfVMFIuAUy7YC01AYy
X-Gm-Gg: AYBFou0ev/hlelgiLSpkjbNkMx7fmWgfgi5xDlOUKiQ5ILPyCN4xLnfT68nB8LhdOer
	Z5b6Lwg+plvu1S24XyNlJq+zkp/yLhFxqdFm7sCp8PpB0OHk2DaaWiuu0ZUdbkQvXUM896huHn9
	zdE0aexKdNVr0KDiW/JZc24/5L2BCUqSpmRPZ5Ku7JU5Ju/WiqNPogI8EV1tbOnZs8qEVbmJM6h
	TPHqjq4mj/e6gNhWYoT1vox+KeR8WKqzkTuV/S6ev+ScJEGIJYcjcuGg8N8v18kQ+CUGJWdX8XR
	u+8iDOs7Vhk9LsTK0wnvwpzpz+it8Cl/hChjzKD4/8/Rtd5oBjGOt7M/pcZk+BvkA8rL25+uKjv
	rlgLNJULMoXIohdDvwcM0LxgvDINeTOk5yoaEplOVx49HVjMNfvwjhBZ+P7gI3nFW8twFN3sRRK
	zYyp4B1Q7Q0Qaom3N7v89bumzADte3gFpuJTuAdzDSNU7yRj2e2+bpezFum4Wdv0Jkn5qnwsmo8
	s++c74r5ec=
X-Received: by 2002:a05:6000:200e:b0:487:c4b:71c5 with SMTP id ffacd0b85a97d-4870cf0498cmr3375808f8f.17.1789563388825;
        Wed, 16 Sep 2026 05:56:28 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm6750729f8f.24.2026.09.16.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:56:28 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 0/2] phy: qcom: qmp-combo: keep the Type-C callbacks off unclocked registers
Date: Wed, 16 Sep 2026 14:56:17 +0200
Message-ID: <20260916125619.4587-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The typec_switch and typec_mux callbacks of the QMP combo PHY tear the
common block down and bring it back up with force=true on every USB-C
orientation or altmode change.  Two things go wrong on that path.

Patch 1: the callbacks hold no runtime PM reference, so releasing the
clocks during the teardown can drop the device's last reference and
re-enter qmp_combo_runtime_suspend() from clk_core_unprepare(), which
then disables clocks that are already being torn down.  Seen as
"gcc_usb3_prim_phy_pipe_clk already disabled" warnings from the
pmic_glink_altmode_worker on a Lenovo Yoga Slim 7x Gen 11 (Snapdragon X2
Elite) once runtime PM is allowed from userspace.

Patch 2: the result of the forced qmp_combo_com_init() is discarded, so a
failed bringup is followed by register writes with the clocks off.  Found
by inspection; it needs the bringup to fail.

Both were posted separately on 2026-09-09, patch 1 on its own and patch 2
as 2/2 of "fix forced com_init() error handling", whose 1/2 was withdrawn
the same day and is not resent: its remedy was wrong, and the init_count
imbalance it described is left for a separate patch.

Tested on next-20260915 on the Yoga Slim 7x Gen 11 with a USB-C DisplayPort
display: plug, unplug and orientation changes, no clock warnings.

Changes in v2:
- Rebased on next-20260915, where "phy: qualcomm: qmp-combo: Add
  preliminary USB4 support" moved the mux callback's teardown and bringup
  into qmp_combo_reconfigure_phy().  The runtime PM reference is now
  taken in both callbacks before that helper runs; the com_init() check
  moved into the helper, so qmp_combo_usb4_init(), which already checks
  the helper's return value, sees the failure too.
- Both patches carry a Fixes: tag for the commit that introduced the
  forced re-init path.
- Link to patch 1 v1: https://lore.kernel.org/all/20260909140345.4239-1-okerixx@gmail.com/
- Link to patch 2 v1: https://lore.kernel.org/all/20260909151443.10276-3-okerixx@gmail.com/


Oleg Keri (2):
  phy: qcom: qmp-combo: hold a runtime PM reference in the typec
    callbacks
  phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec
    callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

-- 
2.55.0

base-commit: a7728f5e1fc3d472a314acdabca6039f71ec3a9d
