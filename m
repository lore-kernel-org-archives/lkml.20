Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B0371880
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292217; cv=none; b=g+ymLRLecr1yCZI2ulmvxygGaHF78yJs/jsZC6Lt4lp+PBqWlwV/4cLKmwAgpiqdOixgZsfBzrOOc16xFcPqZfxCbowojKgV24nWyweU6zswcFarWIStmXk/JiUc6zFM2ZgOZ761ujz55/UkRyQYY7/jKjqCtRowr3tlfp7zpEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292217; c=relaxed/simple;
	bh=UbdV8dkOdR9vPuOfO9gFCEr2A0/7OA8pXSL2w/2FWYc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nW1C6CG8xbIEcSZpdlFzl3aIKMrB8OlYswD+JvJGrKJB6Zy7CDqCrNmKKHpEjYR1ldbDNe6eboXeiWTWhMLLVODPJTn6+V0rpYfRJdQ3kltMkbdNCNTGep0dE97+HpTBHxjXxe0plXnFwZUUIRGc6wJFWw1wKQ/JEBuN/HrR0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wwc4TSOg; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wwc4TSOg"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f36c18b75so20249985a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792292213; x=1792897013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Rs959E2LcbDEDwb+XDadmIuU6nNMzUxfauxEwFd3lE=;
        b=Wwc4TSOgVHs49rPWe999nXYaetiLXAx1UGMiw4WcKBmsmrISz91kEZbN63A/9RfaW3
         5IlrtMdsmJ35Y84nXBrVeQWw3lSTTnxULKM+PWx4v1jemIDGQCW6QAFkiIWc6S6k+2Kc
         Zq97FN3RJuGvEcup/ey3H8WYtJdna23UEWMGqTafSNhx2ASCi7R0pmJ1IGiB1QXUwuPj
         Tr9s/QNduCFjU8VOJokqN7xsPTE4NB0JqjQm8z2NXJjBkPWx0OzQ9hwAf6kIWIn8s32s
         Y3znqdRdO6/9YDsbTVFTW0hzkDhrGoNaeUvDKptHqgMLIvD2QDolSez6aurn4BjpDZAG
         aUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292213; x=1792897013;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Rs959E2LcbDEDwb+XDadmIuU6nNMzUxfauxEwFd3lE=;
        b=EfkXHI20S7k8HTQSBfHw0Hua53iFS0bwCuU76HFp5Y6G6gjzbQOui6B4Hi2zdygy20
         HMBM7Fh7OF/9toXGYi5dywewPs3x82XjJySG49/GdkMfHm8h1mp10/IwMSPSiqgT2Zu/
         7me9rLgC/VcSSl9OEeOUgabIzS189S7nMq0t/cmowxLMm1w/MDw6N9zb1K2oIroo4r0l
         7Ln203nCXlqCBW5pvn+Xl7E+vIaB7AnG8lNx6AGI9LMUBEIyRN+Zlf0BMkPrUqg+rBDX
         XowP4f0zf770s10NbDTfx3Ll6cnS/3I4n+/7gmEINAcAu+Noy4uK3F8FIavktqUJSc+U
         4GVg==
X-Forwarded-Encrypted: i=1; AKwUvBzzoqM8pvhBgTPYgZYcInRL+44FnEXn4wMHVq5YE3GlOsh2NHmcPC7DfCz1x2JEeFkt4Fl94SPUNmTg2BY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqQzIjl++52J/olWdmuBBQ+vUmDObSEHvUVlJBAdADCYH3BOG7
	H5Tlw6eSn7q/BytmFHmzuV5d0ErlTDbVtuFodsZIcG/PqxBV4NFgugI=
X-Gm-Gg: AYBFou1jasinMi3zGZiHmItgVYF2M6b0urOgiuHvPinD9SamZgAHF6UOldV4Ag+7lJa
	lhREAZ0JBhknZcBDUUjvvEBeXhGecmk6YmzABUcxjpJ9rl73TufanDBoMmNqyDi3WuO9brkFNte
	uZrHu8dKA6OLDxKXrIMYXFhKfo02e4LpakKYe+cAonUuDL1O8VtWYGu2vg29rzviR10gE5BnS+2
	VxGDMK6NLraDzxo6mxrerhFnob60A9micwgU0uAhLy71kiU53nS7bY2TzzbwuYP3brLyT+DtcYA
	MMBrz6qm/zMp+fi/kQVBu7QUVf+3MKnOasHKrgmD4u4U2BHoQE9TKdQsocgfIcz2EoU3DPFytTr
	yOIs46wOAxlDhRv+hr8skRImbC6Ml4bVb6vOIzGZO9condsbCaLOleO+WHArkknQd4gN1sOOFiW
	gZLYg/tbNpcZT7AB4TrFc+FH+375sKca1aZt5RD48DNLKpVy+YTHuwZI3KPC/FBResygX7Iz6C6
	p3+4IOjM1AyXjFl0oAIypaT1Frt19Cw+wBN7HCKLHzXIt1Vhp+Lp7k2U2KuESyLaPpZWHsKsFSa
	OhRQe1ulRob1WBl84wRwljoO4Gab
X-Received: by 2002:a05:620a:26a4:b0:93b:bce3:5499 with SMTP id af79cd13be357-93f29b80618mr714198785a.6.1792292213458;
        Sat, 17 Oct 2026 19:56:53 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1850cbsm597676985a.24.2026.10.17.19.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:56:52 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] Input: da9055_onkey - free the requested IRQ on removal
Date: Sat, 17 Oct 2026 22:56:50 -0400
Message-ID: <179229215687.3924264.8583597004889642167.da9055-onkey@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq_byname() returns the Linux IRQ number already
translated by the MFD core. The probe path requests this IRQ directly,
but remove passes it through regmap_irq_get_virq() again as a chip-local
index.

This can access beyond the chip IRQ table or yield a different IRQ, so
the requested ONKEY interrupt is not released. An interrupt after the
work cancellation can then access the unregistered input device or queue
work referencing the freed onkey state.

Remove the second translation so free_irq() stops the same producer that
probe installed before the delayed work and input device are torn down.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 06491e84f0f9 ("Input: da9055_onkey - remove use of regmap_irq_get_virq()")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/input/misc/da9055_onkey.c b/drivers/input/misc/da9055_onkey.c
index 3e4fc2f..20ee79a 100644
--- a/drivers/input/misc/da9055_onkey.c
+++ b/drivers/input/misc/da9055_onkey.c
@@ -137,7 +137,6 @@ static void da9055_onkey_remove(struct platform_device *pdev)
 	struct da9055_onkey *onkey = platform_get_drvdata(pdev);
 	int irq = platform_get_irq_byname(pdev, "ONKEY");
 
-	irq = regmap_irq_get_virq(onkey->da9055->irq_data, irq);
 	free_irq(irq, onkey);
 	cancel_delayed_work_sync(&onkey->work);
 	input_unregister_device(onkey->input);
