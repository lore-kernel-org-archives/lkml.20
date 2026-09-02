Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3080356742
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383006; cv=none; b=jJT9Q2l2oHkotfqrBfBgBHpKTcRwShwhu0SCPlzhY0cHyJB9KvsYZnSv097LlLJtw6inzyXudzGc3dffe+wdFxFyv+mRCPmPKEKfHQrgXAQUPgOJmsXubsAJKobRxC1+fC6M6oaXdZHiQdn7uTNYS2fsO2JKMCc2WBxa/VmKJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383006; c=relaxed/simple;
	bh=HCyWfdZphcYau0fYYUAqLOKget0oXna5JKrdT18pOyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pZ10UKcZ6dAT0AAmZx3v9jWQ9Nc8hojpVQ7/vqj0pYnYcFTGxWfhJk3Z9juwUKVB55FP0vp/rgLimS6RLQU+whsb4v+KYY8FKeJO5whPhFixxauow7E2OX+J1hRggCIF2jq7tVtPg4L3xMCxcA98Uku4rNS4MsqG+8bVp7OjSUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWsA/kdV; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWsA/kdV"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1bcd9e00bso1079259eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 14:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788382999; x=1788987799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pab9MovL5V6IqQA5mU5VDCmIqD2b0v4m2h5+1m/xuv4=;
        b=YWsA/kdVORQBYjgDdMj1Ma27h0zb35UBuoQfg9NJqeKgbCsWOV5uLZ+/hunbqgmBdK
         yQGR98oC4UXZZaydpEfvYAIvGV38Pvoa9xsaAi21hFSSHK6hLIOztLyTXVBLhBslYXYo
         NJkFhFelx6kNzWRc22H0M6GzO8K9/lHMgNeZUlUpSllOZWUToks0/gCfEBHucdffuT/8
         CWrHGOk8YxiyUfl5LH7HpD6p8Z4sXZlZJ7oURuWC0lkeiQJXBrMCSA74HGynA2UbBqp2
         Mrypk/v/hswgkesWB39mLow9wfm8WtvcVVkyf3StXM1xoqBj1819lien5LkzZt6MhK56
         WxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788382999; x=1788987799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pab9MovL5V6IqQA5mU5VDCmIqD2b0v4m2h5+1m/xuv4=;
        b=gUc8yI06M1Ttz3sqOqygPH965e71WTT1rz+6pGSbN+5JlbfC8lYWULIi8NqdzqE+lV
         iioCwoKONVHwUa01QV5QGM/JGt7O4CM2WtmQO9YyU/NurxZHFjiejEGgCa1Ko85eSlFR
         5GlRX7deZYciAmVIB7Vc9xkIsC3YZkEj7K81t0+abGCpqo+LtfATvEwiOmTN60lJ0wQk
         dmJzncATziCMbhyal7EGLqfGQovQClgW3McHAQkLORAt7/TlqxrFBbX/K30lr0NUabxS
         xLf9y1yxGe9+oxyMVyTozTIGdo3a83+68Z04vJJ1oZk0bCb00RFhaqL+/X07kqyeJzPJ
         XEBg==
X-Forwarded-Encrypted: i=1; AHgh+RqCnA7objBdJEtINXPEe8CiqUxTFtaCW14ownqUzFq5cGhdoqbXG3xkITrsiPdbAxCJnffCbjeD8yVsiQM=@vger.kernel.org
X-Gm-Message-State: AFuF++l5buBasU4mGZAECtwZQtdmd5XUepXrMsbcR8r8bjW0ZzNex4nx
	VrFk2IJvSVpWyVB0P8DNF3RMUSvRIgnrOqpVR82lYEyQTRDOKstOdyrT
X-Gm-Gg: AR+sD13XYTqPoKh7UDZTO0TcC4QE6IMejxdUO2bixhE+BUPZrhOwmSEuakg35csHzJ9
	35F6jjF2pf1ZAFNQiuppHaGNwrCvIsvhgxu1RpKvSW6DlyhM4VR/vIaaSFBBP2GQ5S+3dYNmZ2a
	o6noEtGldJ6TqZPgd6VJCTSj3aTJFDfbZJkSe0QpajA2AJgFirm8ZrN2yuj/e8O7qsrRxP153ti
	qa00zVOibpGiTS7IW5KydPqoJJjIAcHaPbjjDn3eUIvppoWYt7GpiFrxwj/1vIRbZzO92YODDsH
	7G0OZdKOodeev5hgI03UztTvb/2r+9G7PjRY7jYUgUJvnMpKZQly0qfjhEOnOkN2Y3y4yntWTCu
	N4oaRhSuHEq/vOxIn0wioEi6i4///Q1dPFvpWqwlDKw9rJXxKsJbObUWsBOyeg5dHJiZNR2XQzq
	CB5CgK6CeTfP+2ovhC9NC6P2GoaF8sCC/0KBwLo3pTj5u/VbfH9xzeT6MAXF/rJkqFdM3WqswOr
	HU=
X-Received: by 2002:a05:6820:200a:b0:6b0:1ba4:dcc5 with SMTP id 006d021491bc7-6b481039390mr5531478eaf.20.1788382998571;
        Wed, 02 Sep 2026 14:03:18 -0700 (PDT)
Received: from localhost ([2600:1702:2f06:6c0:72f2:e1f9:8fe4:eed8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm3742773eaf.2.2026.09.02.14.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:03:17 -0700 (PDT)
From: Jack Boykin <jtboykin.jb@gmail.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jack Boykin <jtboykin.jb@gmail.com>,
	stable@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: Fix power_supply refcount leak in amd_pmf_get_battery_prop()
Date: Wed,  2 Sep 2026 16:02:12 -0500
Message-ID: <20260902210217.69483-1-jtboykin.jb@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

power_supply_get_by_name() takes a reference that is only dropped on
the error path. On success it leaks, five times per policy evaluation.
Unregistering the battery later trips the use_cnt WARN_ON in
power_supply_unregister() and never frees it.

While here, return -ENODEV instead of an uninitialised 'value' when
no battery matches, and stop at the first supply found rather than
letting the last one in the table win.

Found by reading the code. Fix and changelog drafted with Claude Code
(Fable 5.1) and reviewed by hand. Compile-tested only (allmodconfig,
W=1, sparse); not run on Smart PC hardware.

Fixes: f4627dfd0e19 ("platform/x86/amd/pmf: Add support to get inputs from other subsystems")
Cc: stable@vger.kernel.org
Assisted-by: LLM sparse
Signed-off-by: Jack Boykin <jtboykin.jb@gmail.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 94355b435..ba852397c 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -199,13 +199,11 @@ static int amd_pmf_get_battery_prop(enum power_supply_property prop)
 			continue;
 
 		ret = power_supply_get_property(psy, prop, &value);
-		if (ret) {
-			power_supply_put(psy);
-			return ret;
-		}
+		power_supply_put(psy);
+		return ret ? ret : value.intval;
 	}
 
-	return value.intval;
+	return -ENODEV;
 }
 
 static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
-- 
2.55.0

