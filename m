Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1EA383300
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334084; cv=none; b=t57UX1GKWlYmhnXDqNwszbR3/wNTCGRZPGYsTHByfz+bWIioNCxz3GJ21eXejvX99Ea85LfXHaSudW80Uz5o2koB/ItmczsgNAbW6qJd7qeF9KHkwdV7FZFSfww1BsadBsR7kKHo055XmALzL4Td8dgD/r+038x6LzHndWNZcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334084; c=relaxed/simple;
	bh=RYuywvqdjTiryWx0HZMQXcmBWyUUadoRXwkVxaTdKoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JPAYStChXKZEvUimc2ux1RIK+BoOwQjnyjdaro3+IUyYzbANwDbdT1JH4Ljt+iNf9h6/j1Pi4A4BdSnu0Ws/GZNwOxIppd3EHVUopHNq1LgokcScp8f3PPYIQgRKfH4AY5oBIExiV+BDCKFf6yl+j6jb/I1rDb79pFZNNTeNRwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r5QRQrxj; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r5QRQrxj"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39931869b4aso253500a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789334082; x=1789938882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=keGOAuFWtk7eVvvyNyqZYN9zhPLoleoThR6yxbotHPY=;
        b=r5QRQrxjQlldyKYYQjyCWVKVir8Xd/FKtbgNcRWheFkG3pyyRKpPEkVKfIrQUjXRKo
         pWgRqOaSoVl6cTEdptFOmBdhGFqv6IzxQi8HNXLFnQn44hbkY2WS++Wv5wumLOunNzIZ
         nT/Vp50zfIElETcpgyghrYO6kqTfuEdrFrn5Uz9gcvFrN4+FjySshrT5acUgAmVbWuO9
         eceH+gN2EICREwqMxD+8WS2WTAa0ml+ASJORW2dzQVidLi1EJJ+7ymr3cCdErDOxwDMl
         gSFqT8LsGokh570emrIhmDGPObZfsRR1PPbLetCHwAvxbtz+zvVyXaLEsx+ZLq3IOled
         vtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334082; x=1789938882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=keGOAuFWtk7eVvvyNyqZYN9zhPLoleoThR6yxbotHPY=;
        b=p+MS7Kbzl9F20xtTiJVg20jLIVdYhh3No3SS6U/PXaVQEQmta4k7D0Pp1vaccIB9P6
         5ffYtk+bcEFgO5mBeB9Lvi8WFxxrHUEQfuVXVHHBrcCTeNQ962LyRGG/ES5zKbkCxlIa
         WkucgGbk+st+pu028KR4ZePaoZYSBrBlwJjJF0OGEXPSLZz0b8KrH96hLZE5k1m+EzmU
         uUR4Qt37UU0KxbQdT/F7S86zJMaOV6v2jV5qPWgBGKMMxuIGRRvmEqUyWiwfvs/2u0XO
         fLEq/JkBcICJfikwUdHwaPsU4LgDTkrvqWpkJmIsw5YdA43JNJFI6CW7aBLSerljugdA
         2I5w==
X-Forwarded-Encrypted: i=1; AKwUvBzUOg/OnNIPPNmTvvPwJ2saK4XGRtHP8vnLuSaSm0sfAVSlYPDVr7vR+3n3WanWw+b5KjluGDkwnVHoR4w=@vger.kernel.org
X-Gm-Message-State: AFuF++kbeZNa8hkcOMFnWIXY5mlruQ+kMjSjz29VyBHLFEIEREQ4uW+v
	WuTpUQAE8zZsjCmaU/WPFao+l2wQItmne4etLpCKpRwSI0+M8s5waLNR
X-Gm-Gg: AYBFou0kSPWH0GUMmDUEoSvhU8XT5QV5Et0SAk2hJqUsY9B8FCscsmZmN9gm+CLwHxd
	eOkvYCHCrE+mvbkvU/OUQl7pzkf3sxYKjcxTQ/5sQCu0QCodrzYHveaVYRl0zuli6XO4Jv22y3K
	2HlMbO1X+nJPq+LO35NZ5QYKC7Kfrl0/JGOaWryvQm4R2hb966jds1AEpLckfJzyDF70ukVLDZz
	PZu6mvOrjwk+71PFZYSbe/Z4cZ/N7a7cQ0RFz+DkeQLh0rjLfvM1U4hThJMVnX3T6V87aiUkAfU
	iqBa4dHXxEJhLBxk+mGe+POH5xcOpPmd/5uurEv9SBWy2C67UN4+MTA7KW/aXeJBIA+MzfKafj3
	l4iJTf3qzeTuiDB5/tjG2DfxIkQ63uhH4TXiRD+nSGPiw6e8yY3Acn4Xcm/uoCoAZqaZkmc/vkQ
	MWgZN3dp+ES+0bcclqavJJa9QY0kmFt3l2C9Y8DKCEDjsjYe39keB4jXi52mRJPcK6lsrmbnwbm
	dKG4WD3ls0SnLbkOZMcqJOUsiZp11tb63YoXzS+sdm91BS0KN+0GMNAKADY1XbJzf6h7fIX72Fr
	CZ4JvDFYftZUX4Pyb8mP
X-Received: by 2002:a17:90b:588d:b0:398:bac0:238d with SMTP id 98e67ed59e1d1-39d9c362f8dmr16743869a91.5.1789334082514;
        Sun, 13 Sep 2026 14:14:42 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm21382925c88.3.2026.09.13.14.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:14:40 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: miriam.rachel.korenblit@intel.com,
	linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	helgaas@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	emmanuel.grumbach@intel.com,
	nika@nikableh.moe,
	mpearson-lenovo@squebb.ca,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH wireless v3 1/4] wifi: iwlwifi: pcie: cancel the ME recheck work on probe failure
Date: Mon, 14 Sep 2026 02:44:25 +0530
Message-ID: <856bd0ddb7f3391aec28e6af710edb077204076c.1789333511.git.navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1789333511.git.navonjohnlukose@gmail.com>
References: <cover.1789333511.git.navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iwl_pcie_check_me_status() schedules me_recheck_wk a second later. If
iwl_drv_start() then fails, the probe error path frees the trans without
cancelling it and the callback runs on freed memory.
iwl_pcie_gen1_2_remove() already cancels it; do the same here.

Sashiko's review of v2 1/3 pointed this out.

Cc: stable@vger.kernel.org
Fixes: 41fff83fe6cd ("wifi: iwlwifi: pcie: check for WiAMT/CSME presence")
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
index 28b276c..a30854d 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c
@@ -4369,6 +4369,8 @@ int iwl_pci_gen1_2_probe(struct pci_dev *pdev,
 
 	if (IS_ERR(iwl_trans->drv)) {
 		ret = PTR_ERR(iwl_trans->drv);
+		/* iwl_pcie_check_me_status() may have armed this */
+		cancel_delayed_work_sync(&trans_pcie->me_recheck_wk);
 		goto out_free_trans;
 	}
 
