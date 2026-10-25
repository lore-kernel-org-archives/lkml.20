Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792948132;
	b=EtabrlY3VcT2aiK5B7EjA0Mv7NQFprKqWriEkv4vndJC/onrXew2dhvFw9z0RL4Z5Fmz
	 hEeIFlMioZehilhkpmVGB7iFSkFDZ562YcBYSMIVK9unGpA816jkOBjQhRcXm7EJ+RXv0
	 8nF/cNwNcAj/6zfEG5qQTnDphd1auy+8jFb12VhY/Hqm5fLlb9Z7XtdE8kiY7GdCto992
	 DvslkxmC+4aVOrJ3M682N+/klmhETjB3H6QypucLha2mO4v9EdUx8cCtpTro0pv/C/fYh
	 MkMhA/DjMRp0WNGfAIZwvyEKdwNzWy9a/S0Q8WlAFCypwiaokp97MrW34rrXWgiLT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792948132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0qHMsvpYdTtICYKs6XsTEzbx4QQ6VbVSSfDD68IXe8Q=;
	b=lLlD2ozbKMbAv8c3XNzO3j8OuZDAzjwqRJeufnfQ62BXbp4N8EMZSYcPKLud860NA2gE
	 4krzp5mIhSl2N3DFP2kpUj5rGNF7rRxhtANu8OFxPz6/uowbt8sdleTGBcgPM4jyZ6JDf
	 jrLxOnovLlNTpIN8LDT51NfDNLaF8js7wMqEBDvTtGhgebxDla1Wr7kJNm2S3UGh3xLzw
	 WdTJGVrIHPu7LnPIEhpThzow3xK8w3kG7iyhRJaxYmHCYB+ECk0llJ3kjJnAtq90bGC2H
	 PKqKiuDCs+eOYarJztJYCf4Busx+X3/462/eQh8MzQ+3FdXl5EnuyUN4LJ75t7ADy9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FLO7kFJt;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697FC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 697FC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FLO7kFJt
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eabf7d5eb0so94039e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792948131; x=1793552931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0qHMsvpYdTtICYKs6XsTEzbx4QQ6VbVSSfDD68IXe8Q=;
        b=FLO7kFJtl76ieCHjn38sO3nkwDM4b3IjRHldlX07r6Fw+QkGunDwsAZu3LQPKYTmGS
         4XKBCRTrRgP812nlrMVFmUqbcfVnLXuA5ZSTbU4sgxaDd27me52F4abbPyWxsHwdFzpW
         cy3hPZiekJbcziFGzPJNDvnePIkIdWm1mix8iHWhefoLZktQ/nhZY0cdcTpJC4LkzP54
         ZVF3NlKOS0DNbs8ECFvNyTmECtdGk6sLnWqkqIoiH+/4QkuhZcBLOX/0GhE8F65b4DcK
         3wV8gtUng8bheVLTi5Mlzgb/a61vnWA/YS4tPNmehD0cD9/qfVicMkCtquFY7zaS8MX9
         43MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792948131; x=1793552931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0qHMsvpYdTtICYKs6XsTEzbx4QQ6VbVSSfDD68IXe8Q=;
        b=iP0XsgkIv6vzt6OyJAxx2mpsP75pieolf3R+f2oTmPLXcSiItjpOeCynbS1gTQc+kp
         QVd1ZrK2q7yAbddQv9CvZUH0sXdNHBb2aFFhuuS2jfcYDa+CDoF8H/nX7IS1uuhb33cW
         LzKT9xzXdUpZR4f5q5+2smvjIwYB4j+cZdAAE2l9f9z6IcA34f4+INuPQJtGXvESALvb
         tEkMNqKBEhKsz58QvOy8WiVJfcoQn3EeTsWNooRjZqkyTSGojffU5dKXLeYyQOYajIfa
         x1Mx/8k9ESPMei0BKo5vQ23PZKLrcyng99DsXE6BYsMuAfCdemByKSJe0zBlvUxJ7flo
         v0nQ==
X-Gm-Message-State: AFq9FYIjiVBKQOl53WHuisZIxhVjYZfJCxYkflu4SjGsiEw9lptuyxcQ
	tOT9XBBa94R+1lqX+EU4DN2LVIbQL7uv+KIv8gKttlYHJgZwYgdxKD9f
X-Gm-Gg: AYBFou1YFb8nrEoD80zy2Od3ArsHxpKOxsF4PYg9L42jsTm/reqkwk1h0WJ78no4Rqz
	UPpt8PRSCWaFTlZaDPVgPtTvi9jYHF9o3f8Xuk3q5VykQp97LqNAH3j3jgxyx5c+m17JyPM04or
	LGHi2dhlkeC7OZ13yTzxqPVv9yxJrsBrTAvFSW4M9xtYcrH7VRGhJoVB4+NWPaCnkzpJJYMJM8n
	sZbppbjNYSiDD663uLjfhIYHNfOjTirvsErCEILS3w/LJiErSdrHUGx15yztxeNz5xYSzUGuqUm
	uXI8W4PFs8TOh7Uevh5lfJ3jRMCSl3pDje6Oe6isuwL1DJXiK0ovBLjPAz3r7jT+Z2CSWLE1jEW
	fW4NIsBI8jbCN2InCzKQG2zho7PUlus7qwe8zPUEfLJIQozGE9eMIR402ZDF2VT7Erm7/rSFlB9
	e/WxH5PS1QZjjiFpipHPG2q7UF2hWmjJ27xqltm/NnR9VHfxf0+mBANtj7P9mWKz2hsxLgdTIX1
	bhkQGjZg7tvHrSx5QbWGXARYWitVfFAQ2bZOFbVmlsdM3njsGD4LIm0KlBS1J5T7WrQ8LYy2Kb0
	WelD9mMWFDAfBG/aEN+LUKPL1a5L0bF0Z5w=
X-Received: by 2002:a05:6122:1d01:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec2bff5089mr823233e0c.2.1792948131229;
        Sun, 25 Oct 2026 10:08:51 -0700 (PDT)
Received: from tacolabs ([2a02:6ea0:cc02:5480::14])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec23067632sm5772922e0c.0.2026.10.25.10.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:08:50 -0700 (PDT)
From: Reid Downing <skibletz@gmail.com>
To: krzk@kernel.org
Cc: linux-kernel@vger.kernel.org,
	skibletz@gmail.com
Subject: [PATCH v3] memory: fsl_ifc: Clear global controller pointer on probe failure and remove
Date: Sun, 25 Oct 2026 13:08:33 -0400
Message-ID: <20261025170833.1316443-1-skibletz@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_ifc_ctrl_dev is assigned early in fsl_ifc_ctrl_probe() to a
devm-allocated structure. If probe fails afterwards, or when the device
is removed, that memory is freed and the registers are unmapped, but the
global still points at it. fsl_ifc_find() and fsl_ifc_nand_probe() only
check it for NULL, so a later call can dereference freed memory or an
unmapped register region.

Clear the pointer on the probe error paths and in remove, once the IRQs
have been released. The global cannot be published later in probe
instead, because ifc_in32()/ifc_out32() and the NAND child probed from
of_platform_default_populate() depend on it.

Signed-off-by: Reid Downing <skibletz@gmail.com>
---
Changes in v3:
 - Use my real name in Author and Signed-off-by (earlier versions had a
   handle appended).
 - Generate the patch with git against drivers/memory/fsl_ifc.c; the
   earlier versions used a path that could not be applied. Sorry for the
   noise, and for sending two unversioned copies. Those were v1 and v2,
   and this v3 supersedes them.
 - Change of approach: v1 and v2 delayed publishing fsl_ifc_ctrl_dev until
   the end of probe, but ifc_in32()/ifc_out32() and fsl_ifc_nand_probe()
   use the global during probe, so that would break the driver. v3 keeps
   the early assignment and instead clears the pointer on probe failure
   and in remove.
 - Dropped the nand_irq guard from the earlier versions; it was unrelated
   to this fix.

Not compile-tested (no PowerPC build setup); the change is four
assignments of NULL.

 drivers/memory/fsl_ifc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
index e89e0c6cc..abacd90d6 100644
--- a/drivers/memory/fsl_ifc.c
+++ b/drivers/memory/fsl_ifc.c
@@ -95,6 +95,8 @@ static void fsl_ifc_ctrl_remove(struct platform_device *dev)
 	irq_dispose_mapping(ctrl->nand_irq);
 	irq_dispose_mapping(ctrl->irq);
 
+	/* Children and IRQs are gone; stop lookups before unmapping. */
+	fsl_ifc_ctrl_dev = NULL;
 	iounmap(ctrl->gregs);
 
 	dev_set_drvdata(&dev->dev, NULL);
@@ -218,6 +220,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	fsl_ifc_ctrl_dev->gregs = of_iomap(dev->dev.of_node, 0);
 	if (!fsl_ifc_ctrl_dev->gregs) {
 		dev_err(&dev->dev, "failed to get memory region\n");
+		fsl_ifc_ctrl_dev = NULL;
 		return -ENODEV;
 	}
 
@@ -300,6 +303,7 @@ static int fsl_ifc_ctrl_probe(struct platform_device *dev)
 	irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
 err:
 	iounmap(fsl_ifc_ctrl_dev->gregs);
+	fsl_ifc_ctrl_dev = NULL;
 	return ret;
 }
 
-- 
2.53.0

