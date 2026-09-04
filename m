Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA9648F85A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525954; cv=none; b=h1cOuQXR0FTlARhoRvzCTnldY17ZhyDltNpbuz09fWrrerQ0AnwGTPDZJmrPMydsf81iY0ZF0Up7ZlTgXxnWaOCoyhgPuEyM0zDt2t9iWaOh7esKHcL7u4E33+INdHh7UgaBJmoz0ylmx7TmkMCcPMSW1D+/LBjxr4FmdJUDnKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525954; c=relaxed/simple;
	bh=B9+RcJgH3BwlBLjE7htFBsEu62bjBPCZaRnkNbdRkdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5ytmriknPkWuAbm5f3c3781J1q6RwJn1BcDtKuERL+2aiNkmXqdKSlGZsQA9lA7ORrOwpbJAILAzPwl9KqGqQYFVSBO6P+arZplIEFX6xNtOZXtIqsT/lWBdPybyy+EBfFw13Sa4UB5TgY7KUcOtuCsvzaxlZuxoLkoCVWoZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EOavkfiG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOavkfiG"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1055225a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525952; x=1789130752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9IRt2KlI91RpY4t7Vuou/M47pK7hKqwpxLHWK9iGk5Y=;
        b=EOavkfiG83mlea0htP5aB2SHq5oAl5U8Rzd6tRQz7joo0vqbRZJ0KWjwh89vuEgHnF
         GUxVu5S1AZBlfaJqd0dmx6iMc0JFswuytE4jrW8zdw9+sfQL8w6WekhIhWDAkABhN4y7
         g65J6+6TY4qosA7zjVUKYdLvapQ8fxYbKVkC7dS37ztjN9AcCtlmEXctJE2fBctVC1zX
         ffwZumi/GRG8X/inE87hBzEs8FptnxwvxrqnWMSRorR7NHuIuYfaerTmw3fM3IpTEe9e
         lgTDcS9Te8mJ58F8PwSHD8obv8eaGEbctTJZzrOHFfg44hKP+lgfiHE2fXz8BBA4trO7
         OIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525952; x=1789130752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9IRt2KlI91RpY4t7Vuou/M47pK7hKqwpxLHWK9iGk5Y=;
        b=Z9zX10MfucX04cpy830h07M3lyZdftoLU49yC4inpqJ0NeV2o/6vxeVvOr1TIYZc+N
         9nRy3yPm/0yr+bVoLOobCKcLWRViDMzjinEjhkcGVfUb+BJ1jMfQkzfaneNxB3EPX48u
         3Y9gcP9imkpR3xjpRK9DuHhZK5QaK5ncZpPKzqUv/1sKVKAAIPARZOQL+GHxwYCRgpdx
         uJF4ezero/zugoFbDdrIZe3xosN9QMR03f/sy1zwx8dSBsymXnjtHh4hZtBUilnMYKNA
         ivoDVwjn3hbCsPkzdja1SOEIuRDbS8T9Y2fuPcleF9Yod8dtI6zVEKttR3wIuh8qO1Jb
         8+ew==
X-Gm-Message-State: AFuF++m+gjfYiZA950oAfd7njMy8l0mvT3ls4wxrBE48tHUKZex4G8/c
	Mn9kdQAbLmKYmhgcDh2BRhp+BZr30BjqRMgbZA3veo/tWg/6bKn9bblq85i7g0UWvgw=
X-Gm-Gg: AYBFou3yFn4DW9Ne97Rj/Lk86mH+LOsxtPJQbThDsKTFyhZAel1wrCTnZiia8c11g7y
	yZdqmLtPMZVPb3lhFvSWs9vZF6t62MJD4H/ZMZ/rPfTp7w9XFm00gVmcSF5/yc+5n70WrUMvWFm
	0N98DTXnJitxErwqZXYCTBPPz+WW2UE6tVhxTQg3+aHfDn3nE/xHV7YrrBfRzxKds1m11S5xta0
	pR1R28BfHqHTvVtKc2Ho+inOFpy/pIU3AdHxgLueVs1PFwWwSBpvXEoWK4am4LIY9p4jMsdYmM9
	mMjd2VR1h0XeDw1ANAan2oYytvbbIWavgLUajIxLBAemY10tGysDUjASYgzJaBsCkawIJWInjtL
	aVsDqokt5pE0prgQLo+rdALPMJWoq4CXW6nEqlwEU/gTXv5mC1tTUsc6031QDppbPMZHLYlF/Oo
	gF618G2aRvC9QYcV4BZU7ov7fNRRouOZ5B2aP0g5bPhOPS7KL+Y45B2XRgRI+YNeilVDfEOd8Zd
	e9QN40o45hAufj0i4RryvWKds4=
X-Received: by 2002:a17:90b:5242:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39b08046aaamr15009313a91.14.1788525951767;
        Fri, 04 Sep 2026 05:45:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm6477419c88.13.2026.09.04.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:45:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] bus: fsl-mc: fix repeated word 'for' in comment
Date: Fri,  4 Sep 2026 18:15:36 +0530
Message-ID: <20260904124540.7652-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124540.7652-1-hemanth.selam@gmail.com>
References: <20260904124540.7652-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'for', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/bus/fsl-mc/fsl-mc-msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-msi.c b/drivers/bus/fsl-mc/fsl-mc-msi.c
index be38b43803de..7d760bfa63c1 100644
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -57,7 +57,7 @@ static void fsl_mc_write_msi_msg(struct msi_desc *msi_desc, struct msi_msg *msg)
 		}
 	} else {
 		/*
-		 * IRQ is for for a child device of mc_bus_dev
+		 * IRQ is for a child device of mc_bus_dev
 		 */
 		error = dprc_set_obj_irq(mc_bus_dev->mc_io,
 					 MC_CMD_FLAG_INTR_DIS | MC_CMD_FLAG_PRI,
-- 
2.48.1

