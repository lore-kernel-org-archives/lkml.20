Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E61374E55
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184935; cv=none; b=LSfMSf+A36E5acSA/BxgOg8vhgLk9w7YAhIxRaAOyi/5+fzmel7xbZmbcpcTtqQoFBR3gJOtHx4uDPEP2XohVUOOKcA6NcnJC6l6Pu6Mxt35Qo/1c0HTnXHqvkObm9BmVXMrOAuJgdBUwc/4ee67kvI2Uv2DXwwXVWI+SVK5bEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184935; c=relaxed/simple;
	bh=/M/AXYJrasDjCHQpa95uploDhmAOQabyy7j3FoDa+mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0SUHTvuGAo0u2ccnTzsNcbEsDoB9MXOBgOKP3/sNHiLIH8aW4gWmmOrE0ei7mOVslhhVF0omYVObdcpZaagyHc2n8dFAi5+BEk03WAgXSKECUBLoin5zTs1WLGLgGINaFEQY+x1Z6U5hsZ9FgAMMe/NRsitUQD36qICTlK1Zoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN2Z7U5n; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN2Z7U5n"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1188608f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184932; x=1791789732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDjIgUPUbdvr3LMgFzUcV+JuxSqaYeHjMxEe8VEos2I=;
        b=mN2Z7U5nd6oBTl/YognzkwyqvNeYsYXJkfi9iaKJz929t8jxCPdbuyt2k9gxj77URj
         hEG3oxkbLLMLZsRX6UeGJhkPNnDeTreHdZ0AjRIs69BD8yAf9/K8N04KztVS44LWOj74
         jvZID6L7A4qalgSjyQMDcAG4dGwtHxyPk6JPyf1npjSeZ/TFsbND8dXoomQfKQ8bFBez
         HVraGIiFiyDvTM+UdH4K/9eHgp9xuEmd9YGNb5bbv6K8wFCGDUAvi4Ae1+vjSrk0OSzw
         oQXRkLHlUCRArf4HDuk6YjhlBJUH1ZEqHpBjfm5sKkVFYolAccpjusUdEpdNh97063ab
         ybQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184932; x=1791789732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDjIgUPUbdvr3LMgFzUcV+JuxSqaYeHjMxEe8VEos2I=;
        b=sg/ecKIjjz2Uy1IP2qVAep+MMIr4DAnr5w3Q6q8Omll1PfvSblXNofwIrogrqj9+cx
         eUJ6MDEzUEqsnX6R0XqN9oYibhR20IgiYYe+le17V00QE1L1Szwr8RBXYBGNp/mZszcP
         zNR4BDd00BzRGLCeMA4LJ2Lr5rsMBGMLNaQbVqyc113dQXK3r0nvSexL5+GNcf2sfGZz
         QFciOsX4onlDxJwb1ersgh7WnYIN1pBsqEQSh4A05VfhPRZnzjHn5EqOMJpIqcLnGLi4
         cf4RHOIqzo7TVgRJHSY0z8bz2ANpGo+AmZlxbT8yKZq/4gErL230+asQSWNpE4VtuLl7
         a50A==
X-Forwarded-Encrypted: i=1; AKwUvByEjEsgeI/h4MAPpEeN6WX2O5hSe5ZGM4Eb/3pkyYQtxWXVFHMtpGne9YjC8JzdC8/FtRDGkSgElPuw8MA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf1S5PtVfc/+pbzZZtVSwM2zMVeP3j/fHv4VkaCb2Jvj/V/dfC
	uBbFXiSYwr+FLbmuBsgY2fFoP0kgxeqooEqnoMHO/tXPqOvXgyEc0N2r
X-Gm-Gg: AYBFou2mgcpYfOzVP3yjS8VWbh5K6w3J6YT77CGVGoDThtoALAFpZwx4j9yBSshzj8d
	KpXAwxfpJ8rXPOz0gWF0kWdj4hDfRp9hQ3VpngbtFxklbODSdbFhB5nJ70DiDsb4qLPCoU8WZJV
	H7jP2J61EWIW11LbvDtRsy6l8Xiy7z2o4JNjgplDkz8AnjpTugLlgpZ2FDNqzAWn5izCNjWckCu
	L1ujiAgHvro/FB8ekXSQ+UeHbW14R2JYVErRrZ2W28WIEEUfh08SFPqE2wzNJHDQYpBw8zE1Kai
	Mm2ZxRCMFk3vlRtVKuZ2k86ZUmXXcuV7HRXq623fJdjQP9DCt0FnJEnpIByDLyMUQVzdHmlzr1+
	QlLQF7i7ovRlDM9D0hfH5giNAO/tVnHXdPLfpL1agTcIxbg1JUV4pTFArI4Fd9H2C+yt89fpshI
	OQcZa/u17C970dr40YqA7q/PSzyZ5rGA9jiTn8ETxETs9v8X50ktkV9IFl1kywsELY2sTSQOtJ7
	K6d
X-Received: by 2002:a05:6000:420c:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48b1272a06dmr18194664f8f.29.1791184932153;
        Mon, 05 Oct 2026 00:22:12 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622affadsm1642847f8f.40.2026.10.05.00.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:22:11 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-current 1/2] wifi: ath9k_htc: do not start ANI before the first channel is set
Date: Mon,  5 Oct 2026 09:22:08 +0200
Message-ID: <20261005072209.4101009-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005072209.4101009-1-mehmet.fide@gmail.com>
References: <20261005072209.4101009-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

ath9k_htc_add_interface() starts ANI for the first AP interface, before
any channel is configured. The per-channel calibration data only gets
attached by the first ath9k_htc_set_channel() that is not a fast
channel change, and that same call cancels the ANI work a few
milliseconds after add_interface, so normally the work never runs.

When the bring-up stalls for more than the 100 ms ANI poll interval in
between, it does run, and ar9002_hw_per_calibration() records the IQ
calibration result in the calibration data that does not exist yet:

  Unable to handle kernel NULL pointer dereference at virtual address
  00000008
  PC is at ar9002_hw_calibrate+0x1f8/0x570 [ath9k_hw]
  Workqueue: phy0 ath9k_htc_ani_work [ath9k_htc]

Seen about once per thousand AP starts with an AR9271 on a Cortex-A5
board that starts hostapd while still booting; a 500 ms delay after
add_interface reproduces it on every start. The crashed work never
completes, so the next cancel_delayed_work_sync() blocks for good.

Drop the start; it has nothing to calibrate against and is cancelled
anyway. The TSF adjust bit that shared its condition is now set for
every AP interface, which is harmless: the next reset applies it. The
next patch starts ANI once the interface beacons.

Fixes: a236254c35f0 ("ath9k_htc: Add ANI for AP mode")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 0d6272ac0dac..a86dd28b0ab7 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -1098,11 +1098,8 @@ static int ath9k_htc_add_interface(struct ieee80211_hw *hw,
 
 	ath9k_htc_set_opmode(priv);
 
-	if ((priv->ah->opmode == NL80211_IFTYPE_AP) &&
-	    !test_bit(ATH_OP_ANI_RUN, &common->op_flags)) {
+	if (priv->ah->opmode == NL80211_IFTYPE_AP)
 		ath9k_hw_set_tsfadjust(priv->ah, true);
-		ath9k_htc_start_ani(priv);
-	}
 
 	ath_dbg(common, CONFIG, "Attach a VIF of type: %d at idx: %d\n",
 		vif->type, avp->index);
-- 
2.55.0

