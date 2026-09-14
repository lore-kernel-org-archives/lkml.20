Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607A647F3D7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397719; cv=none; b=rll9GMKAidp6wdzC/LPEKc+NU1zHmTHqhIeUd7gkz6+JPTr5iDHNOqw7tGWNMheTgGr141SRdGYI+09l+6Z69trLkA175MnPZvSVdn3tMWtHH81xjHzJF012SeUAQxcRf1Gz6dbkGl2dvElzkG1YKrOinhL/+gf4P+DX64/R6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397719; c=relaxed/simple;
	bh=lIGJu87IDArxEyWhL0iXD9acKrDMnyg5SF/6N1cb1BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTY0cvnMSIlGY1uePZ/kAeBa78l5FGlFtP6Uc9zZ9bUqNx0W/VoBGnZkU/gToxDGd9Rbzkd0ifcdzYe38RPEsqqBRWcRxIhJibIz4XssxFal+VV+IDhPmZcZE3MnF3Su6kqnI0o2qRP3xeo4zCXxJL28Sr5pd2UQhpKCmZOOVwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WT8sk6+L; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WT8sk6+L"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1486624a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789397717; x=1790002517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITlXRLngn2slKcOGycWl5+67jdUQ/52QuImnyuHZebY=;
        b=WT8sk6+LDlMZjTQlawqOtZieOWochMLXnJcHUuE7n5F9cOXz4785zLZJWZkCWtIzrg
         q0wobQDD5Qvo/rqKgiFPQ1N+6b9nrmJs/8z1y4AMZQvKoG67sQg71hLoZ+tsHPIXUFwy
         xfL/9YNbOcowJhr8YHWXoe663rvz5UKhjp0eYN4XbxzgmUBQCV8FyS3D3RrNHtWyBV3U
         9z8LoXF/6fSKQyco9A3lvusT03k0+cCx9ZWahzDf2HV0n5fn2kGaUzavPCrZl1jcTtKH
         3lFk1fopy3Z20iVwhIS0rkgif29fdxHDXLUCzXnsIf0UGzQNt4gpbFydkevYwRpdZEkt
         MjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397717; x=1790002517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ITlXRLngn2slKcOGycWl5+67jdUQ/52QuImnyuHZebY=;
        b=BtQO7zEbch7As1U0ykDWelLpYJJOjPHlDAWEi9ca4j8iJNGFFoqyVvrJfM0z2cHgp6
         CFt/cnv3k4hUoBa6kzNrLA5uoRcqWmQdpPzmb1ONqZ8fmBYkytdBQFccfcTzq60oxdq/
         NuuCkhCuAJg3G63fILqPkVA4WdtlZvydRkaK8/9RHDb0T8ZhIs+KbAezW/LuVCJOEzXs
         iyhcqN/RkJkpVHw9y8XAl1+OB7W/RWyKc6PjPitThPjNoa/lIJRWiJObrW85QxzN/JWn
         iPmBDnDWsj6Z4aHNKKOWhouVptHiMMGM18r4XXBFv6JE0ihRfjEmwBFVgjO1r808ok4D
         jSYw==
X-Forwarded-Encrypted: i=1; AKwUvBwDzKqLwi/wujZc+4YZhr3zTQGSJws8slB0NZSbVqExbLvTop+k0LsqDSnP1gexUP9TjODVgd0DuoaY6qc=@vger.kernel.org
X-Gm-Message-State: AFuF++kPU+TCZo9eJmqBv7a+5++un7+Ab4PZTQizYUU0awr1zT3zj/Ts
	EMoSOSTa4k4tDnU+yucEy/r8DtCS79RTWUxAexOOzHbjyJrQclVrICcL
X-Gm-Gg: AYBFou38KqJgwa9dgRZVUIMN9saqMAu/KpGriTMN4UtTWugQux4Ks3O/inQHyLk2xUZ
	Yug5HYuhKuAzAzqY5kymk873W0ujz45kzkmOhTtke3mgECdLGHPFDmo/LULBml7DStTsdArohcZ
	uQOZf/2dEDiqy4EEVo8vgmHLUQ52ih7DHHCEcU6M/Fpf1pLZCahERZzSpbyjjsEQ65ZC5VEmOhO
	3ULG4h2WuG8tM9xGTViHSrYpbPcgBZRLywXq28WzQ2dIGG1GyIsRR7CTbXz7IrgYIP9r63HF9qZ
	RTCzreH1JBGAztuhVhPWPxJ6Dd840DFq4PJQs+J8wGIVU2SRhu3cDd4pD8Q8fWCOWuedga9sf+c
	sB3TAoKmE7JjOminlN2pulwovjS18QEQREp/QhRAn9UxeWLs2DCUiZCqBDOZ4PjI77iOb0llpjd
	IBr9Gm7ix3s7ylOHJ4UJS8bKfXV3043rk7/8xtBHFI6HUuM97vVMk/pAsYA/FPE4N+ZnKS+M4jZ
	2vtLSykUE+AXnLK4Jh+hFQ5bKV2kuE67Uahc+4=
X-Received: by 2002:a05:6a20:43ac:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3db4037cd96mr6822285637.3.1789397717314;
        Mon, 14 Sep 2026 07:55:17 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c615a65bsm5338805a12.3.2026.09.14.07.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 07:55:15 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] wifi: iwlwifi: mld: unpublish links before freeing on add failure
Date: Mon, 14 Sep 2026 22:54:33 +0800
Message-ID: <20260914145433.42830-4-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914145433.42830-1-enderaoelyther@gmail.com>
References: <20260914145433.42830-1-enderaoelyther@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During firmware restart, iwl_mld_add_link() can reuse a link that is
already published in mld_vif->link[]. If link initialization fails, the
common error path frees the link without clearing that pointer.

A later firmware-add failure does clear the pointer, but then immediately
frees the link while an RCU reader may still hold it.

Clear mld_vif->link[] in the common error path and defer freeing dynamic
links until after an RCU grace period, matching normal link removal.

iwl_mld_link_from_mac80211() reads that same slot under the wiphy mutex, so
a NULL link means the slot is already NULL; the common clear cannot discard
another link.

Fixes: d1e879ec600f ("wifi: iwlwifi: add iwlmld sub-driver")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/link.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/link.c b/drivers/net/wireless/intel/iwlwifi/mld/link.c
index 96e06940b34c..55b84801923d 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/link.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/link.c
@@ -541,15 +541,15 @@ int iwl_mld_add_link(struct iwl_mld *mld,
 	ret = iwl_mld_add_link_to_fw(mld, bss_conf);
 	if (ret) {
 		RCU_INIT_POINTER(mld->fw_id_to_bss_conf[link->fw_id], NULL);
-		RCU_INIT_POINTER(mld_vif->link[bss_conf->link_id], NULL);
 		goto free;
 	}
 
 	return ret;
 
 free:
+	RCU_INIT_POINTER(mld_vif->link[bss_conf->link_id], NULL);
 	if (!is_deflink)
-		kfree(link);
+		kfree_rcu(link, rcu_head);
 	return ret;
 }
 
-- 
2.55.0

