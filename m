Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB748594B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586049; cv=none; b=LhpATGZoqWbb4vPIOKS6sHt9oPCyxzkh/C8kTxkWEnXKxs1qcUcT10lUR2B6ZHidM7/fZF8c60eZVuYik82NQoKfu7U7MswRmWZadgD7CoyVdMpu1MN6vQ6gnafInRCQWoBZyD96oO/HXnLOQzfXatxAukTHGcZm2m8C8jAzvvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586049; c=relaxed/simple;
	bh=90Z+tq/rVthsa03WRevq69b5pMIoGPu1Al1piH2Xmw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSo1RooDRhvC81p+gZZmDBeZxqSUNM1JPnAxEAYbhc2babrte9HA4IeeGGKmG0ImldFLPWFO5axd/wYK7VoRi6XWfTmXWRWR3hScSWwmQ5phhh4zIzC2E7eSnws5oxwjFFFA8KScicxS9x22PjpfHmqMI5iuzVYfsTMV0btLn6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=so2ujzGR; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="so2ujzGR"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-347327e3aeaso866253eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586047; x=1791190847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9bnHwcjdxWdO3Bfc0MWq5AqnySTB+8KpwDsijUilmA=;
        b=so2ujzGRZEUzxnZV7fGSf8xLZfMOzeAM5ih74JejP6KRNmhx+atrtgcOmhNe5BGIjz
         y6yTHx/8jm5ZD5fF/8xeys3c7FQz1IOuDJ/4qa/7C1MkhjFgtiyweSwr0INA0afaTeuX
         z2gY/iyPGaJq2+4si4/eXqK6GHwiDxI5/gNjT8srAu07mpQqSiuleLIsxcwDwpfLB2MF
         2o+RkbetBhEOBa1rKRrneCujaGD2Kal3UVSHUd1c2UkmWKtWqVRgXu+bwVOi72WWW985
         hl/+/OfeEYSEk0hQbiIhgZSyoOMnR4m+ET4zP5JQbQOz/oZOepRuCXuMG6jhJcvy1Qx/
         8vOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586047; x=1791190847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9bnHwcjdxWdO3Bfc0MWq5AqnySTB+8KpwDsijUilmA=;
        b=2pjRZFIwlZ5b6BnsdDU7slbVRVF/bY1kXkciKshiZ3v8G3OOFR6BwNJZM4z4G8Vb+b
         qO0Jh41xZu2HuZlQXIykNnWj4qo+6G3SQcD35IwpVwi+GqdgIYQcpOFSjhDD2aYOpIl4
         i/LKZ056LaN5NXcUPZP7D0DY8EiPZUZPL7xdiFqDpCOmCUimbZw6mAxYoR3UW1hQKefx
         bMgUulETEnadED/P0WVY/Q/IYGbwJ1ks5aZ+fg7mH8JPyhZ2lkAuO7eDUBdySnMj8/ZW
         JZnu++WkxU6rGymYKZNjXC9KA6eEFCw7DO/OLZDt0j0oRbqkmmaBxaCmF1z9dDv0QLHN
         tFmA==
X-Forwarded-Encrypted: i=1; AKwUvBxTC3k1k9bb3GpPH2LokBVjbwD6/jQ1prsRPx1zBdmrfEYoTBDP5JaMpoqoB5Lb7gZT+MpUVORhXpUE8+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9hxrHirAduv/caheK3SGkWom8A04OWDHZiOa5aXISUyQQwFUy
	6D/g/ky98Q+4n0P7y59OyBNNPHLVq7KQBgszMilHopnb+WgZHns3p/3K
X-Gm-Gg: AYBFou1HoMs43kRup/JiCdPtO2wkCuTPV93tpByI6IdSgkfAHh6JWeqFD/GRN2HEi7a
	CxOthm4eDNnqtqyHSrWNc3YpU6ldthDbXgzfTb1t68C0X3xWtj/U7QvGXSWG38UVtip/+RPwMKF
	2kJSaZGqvPwurNFPHtHYGguf39o4iY0B2HV2dHd0GVQZ8+PtKLfgbLSjMEKGkdna7LDrAmwra8s
	lfMVNtAzojUdt0PEdomAYjjhrW/L9AtiLq6krscLibfNfVFG7anegQ7ZxYTTpTitdsAQAMBoPvq
	viUiccAcYJmXXi6V6W+9sBMHiyKv4ASYE7SARDIMbVPjuLxcC3ARVZMv5xoYZMwOPYnbBQ/P+DO
	piu4P7fp8fhEqJkt0wVqFJnVbOS6aN2qUthuBDOieLy8h3kTRoKjnnHJ14Yp5/ralprTRwpVc1L
	Gpcdxz4slZOuWKwYhgUIJfk2LRBFAWWL2ntvEvxm67HBtqgpS/noMywOWbxvBi3NoxL0Td28JyL
	drOYv4EjPDUfL/n37640ufo0j2S
X-Received: by 2002:a05:7300:3b28:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-342705b94bcmr14473911eec.4.1790586046805;
        Mon, 28 Sep 2026 02:00:46 -0700 (PDT)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:3430:2ac1:d99f:94d7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm43351473eec.9.2026.09.28.02.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:00:46 -0700 (PDT)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: anil.gurumurthy@qlogic.com,
	sudarsana.kalluru@qlogic.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	morbo@google.com,
	kees@kernel.org,
	justinstitt@google.com,
	codemender-patching+linux@google.com,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH v2 2/2] scsi: bfa: Use snprintf() in bfa_fcs_fabric_psymb_init()
Date: Mon, 28 Sep 2026 02:00:30 -0700
Message-ID: <20260928090031.712418-3-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928090031.712418-1-nikitash.mariiaw@gmail.com>
References: <20260928090031.712418-1-nikitash.mariiaw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bill Wendling <morbo@google.com>

Similar to bfa_fcs_fabric_nsymb_init(), bfa_fcs_fabric_psymb_init()
builds the port symbolic name using strscpy() and a chain of seven or
eight strlcat() calls.

In preparation for removing the deprecated strlcat() API[1], replace the
chained strscpy() and strlcat() calls with a single snprintf() call.

An empty host_os_patch naturally contributes no characters through %s,
allowing both cases to be handled by the same snprintf() call. Since
snprintf() also NUL-terminates the destination, the explicit final NUL
assignment can be dropped.

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/scsi/bfa/bfa_fcs.c | 57 +++++++-------------------------------
 1 file changed, 10 insertions(+), 47 deletions(-)

diff --git a/drivers/scsi/bfa/bfa_fcs.c b/drivers/scsi/bfa/bfa_fcs.c
index 7a4e0e8c7182..3e5d3a141f32 100644
--- a/drivers/scsi/bfa/bfa_fcs.c
+++ b/drivers/scsi/bfa/bfa_fcs.c
@@ -760,53 +760,16 @@ bfa_fcs_fabric_psymb_init(struct bfa_fcs_fabric_s *fabric)
 
 	bfa_ioc_get_adapter_model(&fabric->fcs->bfa->ioc, model);
 
-	/* Model name/number */
-	strscpy(port_cfg->sym_name.symname, model,
-		BFA_SYMNAME_MAXLEN);
-	strlcat(port_cfg->sym_name.symname, BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-		BFA_SYMNAME_MAXLEN);
-
-	/* Driver Version */
-	strlcat(port_cfg->sym_name.symname, driver_info->version,
-		BFA_SYMNAME_MAXLEN);
-	strlcat(port_cfg->sym_name.symname, BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-		BFA_SYMNAME_MAXLEN);
-
-	/* Host machine name */
-	strlcat(port_cfg->sym_name.symname,
-		driver_info->host_machine_name,
-		BFA_SYMNAME_MAXLEN);
-	strlcat(port_cfg->sym_name.symname, BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-		BFA_SYMNAME_MAXLEN);
-
-	/*
-	 * Host OS Info :
-	 * If OS Patch Info is not there, do not truncate any bytes from the
-	 * OS name string and instead copy the entire OS info string (64 bytes).
-	 */
-	if (driver_info->host_os_patch[0] == '\0') {
-		strlcat(port_cfg->sym_name.symname,
-			driver_info->host_os_name,
-			BFA_SYMNAME_MAXLEN);
-		strlcat(port_cfg->sym_name.symname,
-			BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-			BFA_SYMNAME_MAXLEN);
-	} else {
-		strlcat(port_cfg->sym_name.symname,
-			driver_info->host_os_name,
-			BFA_SYMNAME_MAXLEN);
-		strlcat(port_cfg->sym_name.symname,
-			BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-			BFA_SYMNAME_MAXLEN);
-
-		/* Append host OS Patch Info */
-		strlcat(port_cfg->sym_name.symname,
-			driver_info->host_os_patch,
-			BFA_SYMNAME_MAXLEN);
-	}
-
-	/* null terminate */
-	port_cfg->sym_name.symname[BFA_SYMNAME_MAXLEN - 1] = 0;
+	snprintf(port_cfg->sym_name.symname, BFA_SYMNAME_MAXLEN,
+		 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
+		 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
+		 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
+		 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
+		 "%s",
+		 model, driver_info->version,
+		 driver_info->host_machine_name,
+		 driver_info->host_os_name,
+		 driver_info->host_os_patch);
 }
 
 /*
-- 
2.43.0

