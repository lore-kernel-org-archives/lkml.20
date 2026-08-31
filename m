Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4076378D72
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204482; cv=none; b=kWScAdlAFV0hdIpuRXTj9cjzx1tZdS7Ki9Rqc/Fo8ExrKQmpkO+CGqEUcW5JN4TpbA4GsXGmEb08qoFlNL2o1R69Pw7hl6v+KY8To4462j59XoQlQhszVXw2klCMBZIrZD8a9oYSQxRAGvQGHoL0bQ6uFCYli/mXPWwPCVXxd94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204482; c=relaxed/simple;
	bh=xF4vDxhZsiTA4r2A8/vCm1EiUkqmg5AbA5+SGktjuhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKXRGU235FGQSuWhjkpbm1HA56rR9p9z/pCAMjUcumlx8FPIs9bsOJccWxmSK9q7zCX3Bqbu2sj4mw3DW8K5VFl5sqOg/ek2L+uHDCWeOnbAF+f13ZltclRE68xt1GoLUYylu23T08uEmneZMOvUWU3JCS8xgAGQAnLYR3zff1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHdbXuLj; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHdbXuLj"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-777c2d69446so2452002137.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788204479; x=1788809279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0rSuKTGURsC+BjATOKT6I6iefn9uhHjm15dQZzDRO74=;
        b=JHdbXuLjs/uvzE0KKURgJQtzVvjb0QIrI06ntbD2DqYHJpBdJC3I0V6dVpAvgQZeL7
         K9QGL/WhMygN+0AatxaAzPRRwEFEe0xuYpeXC5Dg6mRcfdYxj94wCJEcEaUbzH5NTrFW
         plTfz992Ry0isMW8lFWRiwcBCOmznyUutaWUXs8iEUIhcq6SzZqdupmo5RBLFJEcoJT3
         GB75C4P8maHiAx8mNL4C5MvDneo1Sjcdm+/zPMqq51TYzjuHsjLdLraF3LFrub7OvRpv
         ufPJUbEmjPA/hL4Ig1lC/O11+MtqdQ0geiuywzkhFV0wLo1abkIsl1cvrKwalP8crMmt
         SR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788204479; x=1788809279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rSuKTGURsC+BjATOKT6I6iefn9uhHjm15dQZzDRO74=;
        b=jxeMTgKY1UovR9yl6ABhSw2x1qt65wKFmleWMMHI8NFogw7z5v9eEtxWpABHbA0BuA
         cUIgr7x0F2jK3sX6AETPjaGp99QhzJ0ZEOlmIkMV9PVJW06hMd0RfrvEyKZAt759PEiK
         6yf77jw9gbficcQTmU5YKTywMvXlOoDAa1hcC+HveXjDO7/F90h7n8CkU+2aQq2vxJZJ
         YL3cg9LyoVtmSsjlD2nUO3+xjtqsgA7iZd26VQ/TLfU1rd2ma9WGaST11FoKdmlNKSTy
         80D+7kROv1ctjwDu5QitQ1IpyxSmBXDb4rwEAdkjiyHhZH8BMDbtbp9zcyJKrA+MTgTx
         WK5w==
X-Forwarded-Encrypted: i=1; AHgh+RrfUw08ikey1XiysUoOSCsMxOtmcjeeVUEcJcijFkbNw/+Gt8x1kxSZMTE8HUR9im6ExXMIz090XH0zcQY=@vger.kernel.org
X-Gm-Message-State: AFuF++kWklphh7rP3Dqqa/Cv+oNfhxprfDdcmTLV0lzp0vzEGrgXOC0B
	tsnhlSahMszdGuU2MmdHAGvNRBht41kgZT/6VMPDOMUFntko8FwxhXIJ
X-Gm-Gg: AR+sD13TWyw6J6hz4s2nRQ7w8k3e2cBBmVoBxO3m9KGHp7UQcypDmjJLRs1YIs+Gpz0
	BzoMrlX2Az1JjIwKkjFb+D9oE37JhQVD4lkuqUsrGygZ/OTf4ekzp7h8rn65lEUjcpLx0wMCA11
	XT9rL2ISPPZbOC6UjEI/8JMS5RyLRMVlUB/iCKWNYYmhaaHHbZtlb4fgzZMgPRREpwVL8szH8+p
	1ax8Zp6S0ncJagXp+U2fCQmQukRpxbQaSfjot2g5snS1ujtYlfZO/skffRCaQFdADq5tEONhaQm
	1j7xoW0MpqZ/A1ZNu9wiDdGpc24GcYc++gDvAO6yk4jT+d15F9KpJgTmKkgHv78Ol/MypxsljYi
	uwF4mPPux2r9twjA4hWEXidJkI3PXgOMXnV6exMADOBcTDAJJnpdipjWxTOppOoltnKg8ge1vi4
	5HdxWQwg8Yvr/IdT/VDo0XFk3dXMGxGdf/lVUg+EWjuAFg7Yn3uw4uXg==
X-Received: by 2002:a05:6102:f0e:b0:785:10ea:be93 with SMTP id ada2fe7eead31-78597c00625mr11953348137.4.1788204479427;
        Mon, 31 Aug 2026 12:27:59 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f247e397sm7359428137.0.2026.08.31.12.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:27:58 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v2 1/2] Input: evdev: propagate EVIOCSFF copy errors correctly
Date: Mon, 31 Aug 2026 16:27:51 -0300
Message-ID: <20260831192752.258550-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831152156.166514-1-ivanrwcm25@gmail.com>
References: <20260831152156.166514-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Return the error from input_ff_effect_from_user() instead of always
mapping failures to -EFAULT, so wrong buffer sizes surface as -EINVAL.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 drivers/input/evdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 3a718d600006..27bcf4f099be 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -1180,8 +1180,9 @@ static long evdev_do_ioctl(struct file *file, unsigned int cmd,
 		return str_to_user(dev->uniq, size, p);
 
 	case EVIOC_MASK_SIZE(EVIOCSFF):
-		if (input_ff_effect_from_user(p, size, &effect))
-			return -EFAULT;
+		error = input_ff_effect_from_user(p, size, &effect);
+		if (error)
+			return error;
 
 		error = input_ff_upload(dev, &effect, file);
 		if (error)
-- 
2.43.0

