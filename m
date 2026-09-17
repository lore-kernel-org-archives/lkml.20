Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765E838E121
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669688; cv=none; b=IR9Tkv/PDKVbdu4wOtEBBVuGRDRSpe4bzLmWTvZJgOBeJOtguQ47r5XwoHmS20a6/wpDjUVA/63R7T0ONWDn6pJo8RLu4u1qmhQvVg7fBJAhnjwBPO2dIc6UZ3yjUQHY65NZZ2wuPJPGfKO/phd4ycIz2sF/dnBGIeDp4sK6Nf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669688; c=relaxed/simple;
	bh=xdKyLiIvia9bLIAOVF5QT9eZb6J+17bObHxnS/Ki1Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzMISOk2E3gF0CVw1sA7KvoiZ+R8wXzG2qheY+o4zDuTpvbvqNE0WoDm+mkClRBZrOhffWxXnhgprNv+x95VGFdCIFSFy4R+rvG/AAPP4XIG5HZ3fqcTHawjmSCPv56eYRBQDseqVeAJaLBvjBo5DWB1C9aqG6MSL49ZdI8CNTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Vghfzm; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Vghfzm"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so6557805e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669684; x=1790274484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXQrE0cSC2j1UcC86SeRkMHcu0uW3qI+LeREPCrSbF4=;
        b=T0VghfzmgbFVPQqTJoIsA6iQIFywn4TP0cDpa5xxDsuy9hd5ESPNX5pIH6uLnCfeBb
         B+FMPnmTR/7bARa+pMPr0v96Vpv4qPOhbphBOfk3/MmuQ+j0hOcVMH9J1l1l6UpsPGur
         vLgZk3KVYrke4idxY7Y5tDlTH6aDzxaOM5zbabt9/V8VqM9da8MH8xtWvEhkxqKOqlx0
         KG71zMtt4DqkKwWf/S6FK0H7/7dFJRyzsqMRc437jgDg2X4/TMEJwS/5Zqynop8ItLR9
         Ev5YRnIBwXslmw5voAjlS1W3V2tEYT8jMaXmqUSxUaR2XSD3lVfl671O3xpEFTu0B70p
         ygOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669684; x=1790274484;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXQrE0cSC2j1UcC86SeRkMHcu0uW3qI+LeREPCrSbF4=;
        b=KIlu2mL4KRxbFq+SGyIIre82v6HcycUyXRYmAAiFXtFJj6Dxsq74x8LxW19p4Lh2dd
         PioBnGbHJIJVfat76uskBpuAXsMLP2QNc2hdIsGfYN0FwodZF2IYW6MXNr2mqowyuq74
         NuXTBtZxwO9yMW9Fy5zfR8CwUEr5BO0DWdRLWOtruwiC7TDrMH0TIMGUcK5bOZCD/H/W
         7b8srIgjdTVwuqdpJXNp7t/JyCQjnGfXkZbet0ZfUWLstgnQss3vT5c8WbxLE/pvXk/i
         FssaVs6e/9zmP9jUNG88xQbDwVdd+aDuGS8aAviBJLYlx0twBPwoBgp/avbMTchGLxRg
         8D+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPrWNe3vGEF+hCtOJDLHIxk2qf6CCz+3Cvus1VfsHbTGvOmbqEyKzJQpIKPpoTfrcmrAver56ywQjPl2k=@vger.kernel.org
X-Gm-Message-State: AFuF++nQw3XiAbNrNf+wThe1bquPOsy79zD0KT03pNlxsCLc/zjO0BbH
	7Qnr7Z1jOTUx69xzUgemoGEeVH1vpzqma5G+JxjxSelCNakrOGqXfzAo
X-Gm-Gg: AYBFou1DwNjM1a/Rvr/Ken3MnjoVffG0gEKo27zwGZquXpp9q9IeS1Eo+FXEU/TFPNZ
	9vWRJWukrgcPcuvn3/V5GNXM7hLknSnk2Pi8T3oZf8sCY+sdrakj8nyNDK6pC4pkXOjZiCRNJkq
	UnYTvEhYABIzAk+Tj6+dki6jHRRd5WJxBslw80LUTLnAgEAYntqvQ2bKa86b1DPJ+58MPvToMcr
	0nSMN+DVCLnWAONiDxAhLOp066ND5+8JgWsLHo5f497MwkK8qxAK4iPzR7p0qvfT2g2j0E/3wGQ
	BtU4wwg/zJyIeDJS4SO1ep6N616W3aWmqKADMl3skmttileNkPsQ3btkY2nHxHNpohVpLLJCMN3
	R0j1oq4Zg3DksZjIQmIm2Lg1IWqBT0OveyE6Bx8YlCWClZnaU4bCAKBLNlmIr7AWrfpRYr+JlBc
	AbgvsFWSRu7P4tllCrMniWRkpLpIjj8rEzu3jPBZGCyZNmnp+1hDszRRqE/B7lKgGXGg26a6Igr
	CFxnacl
X-Received: by 2002:a05:600c:3492:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49eb72fb7f2mr83849295e9.12.1789669684372;
        Thu, 17 Sep 2026 11:28:04 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbbd83e39sm126935705e9.4.2026.09.17.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:28:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/9] phy: qualcomm: qmp-combo: Add hardware-specific DP PHY config fields
Date: Thu, 17 Sep 2026 20:27:54 +0200
Message-ID: <178966967452.3333.16125740437772430030@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nabige,

On Tue, Sep 08, 2026, Nabige Aala wrote:
> Update qmp_combo_configure_dp_mode() to honor dp_mode_ignore_reverse,
> so Glymur can bypass TypeC orientation-based lane reversal.

This breaks 2-lane DP with a reversed plug on a Lenovo Yoga Slim 7x
Gen 11 (Glymur), with the whole v4 series on next-20260916.

With dp_mode_ignore_reverse set, qmp_combo_configure_dp_mode() always
programs the normal side (DP_PHY_MODE 0x5c, lane 2/3 power bits in
DP_PHY_PD_CTL), while qmp_v8_configure_dp_phy() still follows the real
orientation and enables TXA for a reversed plug. With fewer than four
lanes the two no longer match.

On a 2-lane DP + USB3 dock (HBR2, one LTTPR) the reversed plug passes
clock recovery and then never reaches channel EQ: the LTTPR reports
CR_DONE on both lanes but never EQ_DONE or SYMBOL_LOCKED, walks its
pre-emphasis request up to level 3 at swing level 0, and then clock
recovery is lost. All four attempts end the same way:

  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #2 on phy 1 failed. ret=-110
  [drm:msm_dp_ctrl_setup_main_link] *ERROR* link training of LTTPR(s) failed. ret=-110
  [drm:msm_dp_display_atomic_enable] *ERROR* Failed link training (rc=-104)

The same dock trains at once with the plug the other way round. UCSI
and pmic_glink_altmode report the same orientation in both cases, so
the orientation itself is right.

Ignoring the orientation only when all four lanes carry DP fixes it
here, both orientations train:

-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
-		       !cfg->dp_mode_ignore_reverse;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
+		       !(cfg->dp_mode_ignore_reverse && dp_opts->lanes == 4);

I have no 4-lane sink to check whether 0x5c is really needed for a
reversed 4-lane link; could you say what the flag is for?

Separately, on 7/9: LN0/LN1_DRV_LVL is now looked up from v/p levels,
but only in qmp_v8_configure_dp_clocks(), i.e. at power-on when both
are zero. Level changes during training go through configure_dp_tx(),
which does not touch these registers, so they stay at the [0][0] entry
(0x02 at HBR2) where the old code had 0x1f. I can test a v5 on this
machine.

Thanks,
Oleg
