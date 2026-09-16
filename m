Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED15B233929
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565923; cv=none; b=jJz6/vFlAogaS7wzvcXmVfWDuDqUn6Ru44yijTB3IS5Z8ZRMHm33gxeNtSxMS7TS1cxCVKf1sFPUCRUPYFWzFY5CN5oHZu0FJ9u3qqZTgSSnGu9SKoPXQnH54VANL6B3mq5da/z8mDrzYImEl4eHOJHQC3yxXznLke8tNF/eq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565923; c=relaxed/simple;
	bh=wde2YlISpqgmhj6xyjKqRSnwNWyIWAQc1fg4Sjbagg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7Kit5nhIcoB54gVVYD9611h36LZgGkdpFx6MYWrcn5ftUNeNrP8tqdOaPgig6zocITyJ6etAldHQolf0E1uN7PRLGEpSomDNr7FiB+Lam450M2iLcJgEyAI5q9c0nyFIx710BQSx1rzXgs5RywLJ3XtslO28znJdunfsKZBCG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWbzhCg9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWbzhCg9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so5553465e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565904; x=1790170704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ju3lCVadqYYzbSITuTuPTwnYx7YPGhrLuUWNWr5KAzA=;
        b=JWbzhCg93XVc+bkI1FWBtf/ZbiqZu1+GdHfFKOj2ix+WEbtfIIZejDEV1BBDjD1WtL
         /BZ0waml7Na09F3Hv0JFj/MmyoPg2obc5qPy2aUMeKP+QBSpIEzWR0llQ+jUCG9NJ5wP
         JYv+nbigQjjdOU0fVCT89qLn2pUkDFkbBi0gBWIAANtMvP7/N1tKDVNKfZsil2aS8BdC
         vK2jEX0AX+diwL5r2Nak8co4yKCx6kSrsH4NdJeipJS7xM40k+idw8vRDjvTGwHj+rjT
         qjzc3RJKF1LpTiHLGSFEqq2d+5ePy6G+Fcv4WHU2PEp/eNK1aMpickvsV5L83Pj1c7fg
         BiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565904; x=1790170704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ju3lCVadqYYzbSITuTuPTwnYx7YPGhrLuUWNWr5KAzA=;
        b=bTerxrlAIrYKmvp6lV3f3bTP81G6Xgz6LgOTnEOibG/qnugJaklHRIAdWf2JGwONkg
         MLKF9OONFQYWmwIR+FLH4F8AUfo27ceurrfFZc3AxTs8auzJyxC7T8nkPt4mtZxmNmcV
         rT0vEQCoGLqI5LpzYJhslLPaM9rkOcywe8r9zhqcsXCSRTPSrNwoPRFrju8NBBBHtT5c
         l0g/FeEzll8jXu7OVYNeK+br+h54KbbXdHZ6LJ9ppSAEKypEQ/7TrLzNAcco0p21ExfQ
         x/GZPpKJqmlPgx8tj9ykHwFylHWqmn3LG4SEUd14WT/IyRLzJ4hlfrj7C5Bi4Ea3mYy0
         Wc7Q==
X-Forwarded-Encrypted: i=1; AKwUvBww8R9tZKWdn75cIWWFA/AgSfcfrUXBVv4LZwRMg5jjNkEtLtNwLUrr08Z34Ip7FDCPsISVcJMXCS6u6w8=@vger.kernel.org
X-Gm-Message-State: AFuF++m+Fh7SSKOOksFd6NcNAQalaqqvq3eCQbIZA6JnZECHS0FpB68s
	zgXEYwjHZPhBshRJ4Gt2vx6Wvjo065NoVmOhUcU50Hll/OfyE7XYVRCQ
X-Gm-Gg: AYBFou0d3jZiYwqGEoXH+hJxhLP/YrwF8KtDiuKw2H0tKlHjnrSX/r5F8ZADtitX4IF
	NQuZbEp5QSji7u6BLBoxd9qbs2Xi4k5ISbMHCa8WBLbLZJtUiPfO7nXdoY63fxNJe6VXkI7kydD
	2FoBLqj2pocNVadNYSK5sWjsNbTkyNutvv4s8Se+HcRC+VucNDaUEYBs46a9fvgjzwG6+ZfuA1q
	vbnDlgfUZTuotOjqY9O2xovxgTVxUAPCvqcHaS44dNeyElzdIsmn8uaSCIjiGVTOJnJt/BpBA8s
	+1ZXKN3CG32sV6mdTH5IKB8qS86I/lj3geKZWTohi5y/DdiX6Jxe8xiqDXHXwamFsWMxKhK+hBI
	8LX1/mXhb8n3ZXaeDzdbCYZL6jRg72sn/TZaM+FQ0I/5LBz3hgvIJ5rBLO973JQFZLek0o11xuM
	X3tj2dvIhRaJpJfEv5sooEvW+CGZK4PLUWBitRaeDsXR536c5PbxOcih4PbdaMrHnpe6x6c/EU1
	r27U4WhJgkp
X-Received: by 2002:a05:600c:1909:b0:49e:8418:389d with SMTP id 5b1f17b1804b1-49eb72f35bfmr30119185e9.9.1789565903614;
        Wed, 16 Sep 2026 06:38:23 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e83da9a7csm77085295e9.11.2026.09.16.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:38:23 -0700 (PDT)
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
Subject: [PATCH v3 0/2] phy: qcom: qmp-combo: keep the Type-C callbacks off unclocked registers
Date: Wed, 16 Sep 2026 15:38:12 +0200
Message-ID: <20260916133814.3977-1-okerixx@gmail.com>
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

Tested on next-20260915 on the Yoga Slim 7x Gen 11 with a USB-C DisplayPort
display: plug, unplug and orientation changes, no clock warnings.

Changes in v3:
- Patch 2: on a failed bringup restore the previously cached mode and
  clear the cached orientation, so the next Type-C event retries instead
  of being short-circuited as already configured (Sashiko review on v2).
  The commit message now also says plainly that a consumer's later
  phy_power_off() still reaches an unclocked PHY until that retry; that
  is pre-existing and not addressed by this series.
- Patch 1: unchanged.
- Link to v2: https://lore.kernel.org/all/20260916125619.4587-1-okerixx@gmail.com/

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

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

-- 
2.55.0

base-commit: a7728f5e1fc3d472a314acdabca6039f71ec3a9d
