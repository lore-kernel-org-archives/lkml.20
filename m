Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279663BED56
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439349; cv=none; b=rfuRDrM9k5iS6zotyJFJwEOU0NBJVys/iQb4PxZLM0sR4jV3v6pkh78PKKDzDmNnVE+2Kc4SSOSL/7k8D6i4R6/rZGzxlXkgqZ9JYuqCY/m3udF2+mNUyPeSBQqV4TZENqc8pbOA0dAOrDWutd9kNYmtJJesgl+GRIfDnGAqkA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439349; c=relaxed/simple;
	bh=Kjy0w4aMgvF06Qjs/zVb8hjt6qn6uga+GITltdixq1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXGR5CxNvB4ZGJi029Kc6PVhIpWW0PGLk+1wOMwnq2s+jkipT6kIyP0QIu8Yeauy2Ff5IjvUq3Sjx1K7vpKV0aCLA0ttuEfEHw8se131Y+Z1Tkr4B4K0F4oudRdKpi5Oj8Vv/wbNpDoknsbohfgzgOAiAgJPmMd5QvT9av+bSBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjeYG4NG; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjeYG4NG"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-351775aa1c0so728635eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439347; x=1792044147; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8gB+VaFbshbTE5r+HzTkwsdCgoKWrT+/L5WbH+AU9I=;
        b=hjeYG4NGTpSKJV7q1TxaEfq241//NzlPv3MzntqXq7oWnVoHJRHzROe13OW0m6TNMJ
         7QdE7P4+cLlqM04sk+8aehoVJB3S/4igZYvkZOvUNpGZuWnV4CSDGlQcf3cDX0lCf3QD
         O3jpoQWCfEep7bY4M3ZySP9gnGAnZqxzr1DoiEK2esxOXdCe5Es2Vp+OIncgW5iKXlSY
         VuyPetMdCtB98wO7dOmSeXVorCfydOJYuy13fg2fPGpXr6KNT+n2b9jOLgUWbO3eP+IB
         mdQMF7LWWGK3VLVMDNZttH6/ZIgHc/WiX8rzqqczoyTnW9rVATazVeqtiEuBvJRGYEsq
         BZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439347; x=1792044147;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8gB+VaFbshbTE5r+HzTkwsdCgoKWrT+/L5WbH+AU9I=;
        b=BT1haQuOIHv0T3H2uUD3F/4HXkeIdvOe/HW3vpSeeQPxXYzWiweun4iTVLVR5D5p46
         N4jBesrg/2WX1aGoCodQMPq/FcWBwrsfirDCu9KqY8PXo73YvdfMWq5xcVz2VDgPnLeh
         dmYq8ghYIYLDc3cmHWIK5OlL9dGxbDA1zYl95YljrFMuy7yyLgoKiLnsfKyfR46Mw/e3
         3pU7DnLSwdBrfn3Hz1QduCPL2N13SMxhKRCzFGwPJ9mIf04Rfz+6jf1q7LAad+bRogOL
         g22R0rN+h0GKI9MT1A3XPCAiRBzXv2EmhBvIa9Xn0l/8cYzsm0DE4IyBXiYBvXEfm5K9
         wH3g==
X-Gm-Message-State: AFuF++kzmtpUFWvDtzGZDDrB0FkMcu3rqWVMM8VnbP3NDEiTHOw/kQIa
	eK3lCnyMNH2wg2QYaB1+TWRU0G4WXAeVeDyTThZPUMvNZdy2eaVRLsyV
X-Gm-Gg: AYBFou2NEJqKz27FGOEHcsaJwUQJkrCBqZuOfokNJH5EG96S2/4mTC4x9Fi382bp/A3
	d7vUIqNI+ZImQh20NlAkn5+xJX0GNI768eB1TLi8VpdkHm0Rhd+2GHPIrBfBZOEYAY/fUiQD+1X
	Cql3VZKRlDTRmuOkQfNt48kPkSVL8M4BaScsmxYBWut8LhzaMLPp3SDobmPuLlBpeNL8Mxl/X2S
	h23LHxQP/HFB+AApwh/BKdRRMDDuz+c/koNNGZ1Yl9kYvBeOW4IYYLGLEC15pbS0QZtU1EYCwsG
	rAiSpq3AzsJdjecAYFwOafiBQ5mux2cGQAPVvjaBAaiWLlx6ADiox4vDZ6mBMkZQQ0Lh7CrG9M5
	2D176l1wUBBkFyV/bpa48jPcDeT30lZZ3pX88dkWW+34H4MM+0pZaF4DQ3MMGDVckXlJFipRLsw
	gs7Y49thV7ViQsML4av470CwOPQZDI22LZcZcbydwkzF34aRNq6dak1/MSLAWkY6PMHyvYvqauU
	Oj5Gin6ZmriHhnZ0chePot3HW0+f7+Hud/G7MSo
X-Received: by 2002:a05:7300:d194:b0:33b:a766:ea6a with SMTP id 5a478bee46e88-3515dee3e47mr4886145eec.32.1791439346597;
        Wed, 07 Oct 2026 23:02:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3002:e11e:c053:ebcb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af3ad13sm12120285eec.14.2026.10.07.23.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:02:24 -0700 (PDT)
Date: Wed, 7 Oct 2026 23:02:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Input: applespi - drop redundant input->dev.parent assignment
Message-ID: <ascx1Wys5ifBi4vN@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

devm_input_allocate_device() already initializes input->dev.parent to
the supplied parent device, so the explicit assignments in
applespi_register_touchpad_device() and applespi_probe() are redundant.
Remove them.

Reported-by: sashiko-bot@kernel.org
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/applespi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index b5ff71cd5a70..da8fa3938a36 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -1259,7 +1259,6 @@ applespi_register_touchpad_device(struct applespi_data *applespi,
 
 	touchpad_input_dev->name = "Apple SPI Touchpad";
 	touchpad_input_dev->phys = "applespi/input1";
-	touchpad_input_dev->dev.parent = &applespi->spi->dev;
 	touchpad_input_dev->id.bustype = BUS_SPI;
 	touchpad_input_dev->id.vendor = SYNAPTICS_VENDOR_ID;
 	touchpad_input_dev->id.product =
@@ -1686,7 +1685,6 @@ static int applespi_probe(struct spi_device *spi)
 
 	applespi->keyboard_input_dev->name = "Apple SPI Keyboard";
 	applespi->keyboard_input_dev->phys = "applespi/input0";
-	applespi->keyboard_input_dev->dev.parent = &spi->dev;
 	applespi->keyboard_input_dev->id.bustype = BUS_SPI;
 
 	applespi->keyboard_input_dev->evbit[0] =
-- 
2.56.0.385.gd3acb90ef8-goog


-- 
Dmitry
