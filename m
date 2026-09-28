Received: from mail-dy2-f34.google.com (mail-dy2-f34.google.com [74.125.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD294848BF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586044; cv=none; b=KYXOUrfBcSfBL41qO1DmMNjOJca7UfWqF6Px14aV2GuvWroZIfnqlLIAIcs5gKNwcr4oEPaBcUsFYfsB0CeYI2X18Haf0F4HDXqWyYYOMvridz3wEGs9jSxd7mc4SRgAnOIqWJgwC2njJKLjv3BF10ZMwbcANoKjsWZW43XOKso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586044; c=relaxed/simple;
	bh=LKlCoviJ12VgG5jnRcP5Hso1CrjmmA02TTiTGOaT5l8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k94YWI5HEr8lA5rqstd6hZYh8A1wBS2sdUquNPCloMxpQAZdhHf1cgRZURmUG1L4g/cu7WfwNY/epkCgl7/dR500YWgdW5P7Vy9LrBOwuWcy/e8P6QQGzD3CLOf75VEv59qKdkq89xeMQ+xfnCllRxB3dJ7BCfgScPnM+iTlyBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D07nw3re; arc=none smtp.client-ip=74.125.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D07nw3re"
Received: by mail-dy2-f34.google.com with SMTP id 5a478bee46e88-33be7dfcfc1so3957092eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586042; x=1791190842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4As3nxVg8g8B3dLip3XefSLbWFq/mZSzoIcZeIzSfg=;
        b=D07nw3reiH69EjzEim6t0FoUB0kuO8Ntc/ZYaWRhvyG1BEsYBZhtjGN1TzYjMZWxqt
         E6JfKJQ/8UwzkWRsxo5YsjleoHjO9v5ru6FXUKrI83WWKPc34MdKVaqX3BXraObYyK4t
         1qRvdKoRTvkIDHifXQBOoidhe9vBSktiMR3eItJyWcezkuObT03GK+lT/Wbn1z1dlww3
         7zVNImKzDVKL8kpFTK1o3kDTsGzg5U2yOJju+QOjvky7OXBHxAFII03PbV5UM94uXk0o
         +SzE/GJ6npDB26DOUnriQni6S15X6CjvtKf5lzkEgGBgWkVI+dsC02JYyKBZNTtam2CM
         RgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586042; x=1791190842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4As3nxVg8g8B3dLip3XefSLbWFq/mZSzoIcZeIzSfg=;
        b=Py3S9stnBwrWROZ5/P4hufUb5v3U5CyHN+BgSOtESf7n91smEiNBSTYk7/Ndm1rNf3
         25yztqJkTkBdCpeWKT4aMKX8waskLgSEUCvWR+dTOOw/svUscoKsqq2Okahev7N6BrDy
         7TCSM8XpMIEQOQVlHKULSYRHWoSC8MjJmMMMoEAyHdDCbPZS0JxxEhGNdU226l8lPYHp
         wkQLGaly4OUUp7eBx98uCV9dk+FXGLKX8ug8W2Yw2QTJ0IfEH4hECn8ZZfDdGD70uqde
         Jb2khqtidQf9BxxMWfJGNbz4MsyJCY5knpPNQf1FPlAN77p4rBAOSRr139uTztSLd0w1
         YViQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8sqsWUheyCytO1DI0sASzcjGXgFjvkjbqWI7vf4SverPVarQf9ioDL0iHkK+4TBERNkmHy/cnktOYY6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqjVzbJyX0yJKYHsPBGE2kl67xXsb9gBtsHnDQehhu10ZB3SAx
	a4L/Da1tIhTh+vyEJ3dgxtSmA1EfPb3bQv5ZOx9Qg48cnnaPttJh6+/W
X-Gm-Gg: AYBFou2yh8f3RPnZfILGgg5ZaYumpdB1YVKZGebm4HcWvzKkocU+4OuV0o3MsMy0yQQ
	CllZ6jPUU87c7G2QaGuXctr2nm7VUmt45ipWRVwOi/5+TbAZQxgxx17U5xzsu4mo7YrhkhtIpjo
	aZwSNcVjQu74rYPSxe3Y3nGHMBCAGXVT3ZYGLgn6SZkkhd1WOJ5TSOhTlY/MgvETHvaJYZ/+zoo
	qdTZY0KDySi6p1FHDEGWFIWQZZHBQKiMJydoSDIKRIb1Q7fpN8UYvw92nWwecV0icCX7uPZZcbf
	LXMgjlRBkVAq+0mtZF1ztXR327NBwIFQ4fOeENCP4nTSot39QnL1Sp39M7bZBpCYriU6CE/go8t
	nrBQT9jyG/huOGfB1+GHDfL4poV5e4hX5xRAyzMzRH8Ol9LR9+XFN8bAfT5qKQxcIMW97v9br+F
	USAJdASk0b9zN1pxMxEsz7oVCudm2krxV8NI4DKdNRyfkhU7Kajh4yHwHvFHVm2eslrF/icfNdP
	aAyMBqhMZrbMngY05eDxPaiRh/2
X-Received: by 2002:a05:7300:8250:b0:342:94ae:98f8 with SMTP id 5a478bee46e88-34294ae9cd0mr9071212eec.33.1790586041380;
        Mon, 28 Sep 2026 02:00:41 -0700 (PDT)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:3430:2ac1:d99f:94d7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172de6sm43351473eec.9.2026.09.28.02.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:00:40 -0700 (PDT)
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
Subject: [PATCH v2 1/2] scsi: bfa: Use snprintf() in bfa_fcs_fabric_nsymb_init()
Date: Mon, 28 Sep 2026 02:00:29 -0700
Message-ID: <20260928090031.712418-2-nikitash.mariiaw@gmail.com>
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

bfa_fcs_fabric_nsymb_init() constructs the node symbolic name using
strscpy() followed by five strlcat() calls and explicit NUL-termination.

In preparation for removing the deprecated strlcat() API[1], replace the
chained string copies with a single snprintf() call.

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: LLM
Signed-off-by: Bill Wendling <morbo@google.com>
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/scsi/bfa/bfa_fcs.c | 31 +++++++------------------------
 1 file changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/scsi/bfa/bfa_fcs.c b/drivers/scsi/bfa/bfa_fcs.c
index 9b57312f43f5..7a4e0e8c7182 100644
--- a/drivers/scsi/bfa/bfa_fcs.c
+++ b/drivers/scsi/bfa/bfa_fcs.c
@@ -821,30 +821,13 @@ bfa_fcs_fabric_nsymb_init(struct bfa_fcs_fabric_s *fabric)
 
 	bfa_ioc_get_adapter_model(&fabric->fcs->bfa->ioc, model);
 
-	/* Model name/number */
-	strscpy(port_cfg->node_sym_name.symname, model,
-		BFA_SYMNAME_MAXLEN);
-	strlcat(port_cfg->node_sym_name.symname,
-			BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-			BFA_SYMNAME_MAXLEN);
-
-	/* Driver Version */
-	strlcat(port_cfg->node_sym_name.symname, (char *)driver_info->version,
-		BFA_SYMNAME_MAXLEN);
-	strlcat(port_cfg->node_sym_name.symname,
-			BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-			BFA_SYMNAME_MAXLEN);
-
-	/* Host machine name */
-	strlcat(port_cfg->node_sym_name.symname,
-		driver_info->host_machine_name,
-		BFA_SYMNAME_MAXLEN);
-	strlcat(port_cfg->node_sym_name.symname,
-			BFA_FCS_PORT_SYMBNAME_SEPARATOR,
-			BFA_SYMNAME_MAXLEN);
-
-	/* null terminate */
-	port_cfg->node_sym_name.symname[BFA_SYMNAME_MAXLEN - 1] = 0;
+	/* Model name/number, Driver Version, Host machine name */
+	snprintf(port_cfg->node_sym_name.symname, BFA_SYMNAME_MAXLEN,
+		 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
+		 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR
+		 "%s" BFA_FCS_PORT_SYMBNAME_SEPARATOR,
+		 model, (char *)driver_info->version,
+		 driver_info->host_machine_name);
 }
 
 /*
-- 
2.43.0

