Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF33A838A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787888695; cv=none; b=mnyTM2fR+4imbUZ7kqJI1nYy+9BR4aS1RCP18H0TmbOQbJ7VHNZyZSpF+CbyaVIXFPv9elL8kJMYX2KrQ1Qp+5I8t67orAWsidyh4ulhmi9ss1SLBT+lQk6gMxdmzExDLo8P8erYKxdmzeIzelFMklWuZS73AGq8rh0Vrcggw+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787888695; c=relaxed/simple;
	bh=oyqO7yApbiBq84HOVVa9hmxDcvJ9fuCOtoFjK3Ayl00=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=vEuFffvcVQcZhFozS1Ow/adpCid2opFy2ngkxhYx9qjaDi5GXjwAih4cCjzlQzsa/iTfPHaDHoBHMrLJtVqbsoDa3WQQ3XxQWQ6yE+fCtp3K9+XTzEWCiAX5frtDiBf6ibLCOHJOf9w6NAvqxhigy9m6iKaSeDpY5jE4/0Z1eW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRinrNCg; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRinrNCg"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso338388a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787888693; x=1788493493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5k4SS5gxupECR4Og0IkmCwIimkhRF1YOiA+xzlWzz4=;
        b=CRinrNCgDI43q+FvqwEyXY2cq2cAYSgEdQqZUK1bpaGmfvsmL234yvTrec6VKDhy0P
         QF/QkZrMocA/JuErkzQizFrLXQvtEqiLh9qhMuK+3yF+ykDEZVAPiCl7LrgvIgcOcXTC
         tfDndXzkq55+PS8hN/Py1b0akqcF9YYyulESjG8WUra4vQAr3P0mKCl2XQz3/LBSgyBT
         sHVWzrmqgN28IXFdkp0ImTE9/1HNQSP4EjlrpxHlvxykS3KwvVQRU8SfFqMKkZ0tlqpv
         CA8IPYYpDjE9W4y2uEHGIlqvYoAWXJr1ijlOmy/186F+zpUES8cFqp48AQSjvLelQAbc
         Dbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787888693; x=1788493493;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5k4SS5gxupECR4Og0IkmCwIimkhRF1YOiA+xzlWzz4=;
        b=FZoB9T+lcQ+xWJKLSRrCQikZHV+l8Rfcz6YOWLNK37vhTG8e7NbOqJRjrhYyltwqJ+
         HzwK4l69yD2TV+2Njb4c28+eeN6Bq+uXEopehM5uf/j+ZNsbxCSS0ckNc5mIIDBBekIt
         4IEC+c5VrLllDYNaJtmAA9dearjwyMfQ+H3ND7HacXMRb2qntdIlwt7vCZW75Ue2EuwK
         XExOPuKAPt8ExwNsgcmPLGAsypywx64qpVi/xvT+i1SqtGd69S3NEfe+LG53os4mFV1z
         TOwtAE56sDKeb1XIx/tIbh/kuBP2W96ezwXdG/peeld0UN4n7a/USGRV4CjtqshIX/KK
         gcgg==
X-Gm-Message-State: AFuF++mbgEpkDsp+YTWVoQsxAo1yYxdrE7xrHj1KnnzPnkUfYQIUJF2c
	N4A1RMtZA0fClZ94CnHNpO9UWXfDF23YSkIsbTc5y482nrKr15y6uJvU
X-Gm-Gg: AR+sD10WUnzBT4/Z49T999A8B4pdxMtqZlZnlegfBL1Q+RVo80JRIPFiQX3q2YP/euF
	k26i3cXvoUJShDlcbBVxoHenkSRi8gzIYsqqOYChoYkEltJLfSKXuO3W5AYi0OYp5Ukq+AhhIuv
	yCViJ1+YG8n9b0zBYNUOaOzxmgtDtWXJLczVbaKILkQDjYWCRBayzUPSBHVoYRM0QuG/kYYthXh
	+MUdSEMVr/rKA20y82jXgG51yyuNaJx6Vy+XRp9z+i5Ix69jWOg0gPogQKa60j5NDFeoqTo5wdc
	RuMNvme8G1itsp9Msa/AHtqA6qEJ6vMRMoEGBKONg393ONOBmBEzlAqMDtLM1DfHqbfXvkxyBAE
	d41d9I/3vaArcDxz/5P3tDELLqilSBWr94bi8k4eMO2tX9Z7R8o/YSrB2NLzW9cOfYshUhAvtt6
	fKker6UISvStv6VHP9WFMwUKUZLL6MrKsDDoRdp2d8024Cpe6UTPmqQpH/dRmFUaXzigMxnM6uk
	6aSy62g6WDYcD6GdSladabRrmdmE2QgYCGcfRn5BVg=
X-Received: by 2002:a05:6a00:4fca:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-8562c24568cmr6389634b3a.17.1787888693036;
        Thu, 27 Aug 2026 20:44:53 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49f50bsm158541b3a.11.2026.08.27.20.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:44:52 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	linux-hyperv@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Drivers: hv: Remove !CPU_BIG_ENDIAN qualifier for arm64
Date: Thu, 27 Aug 2026 20:44:48 -0700
Message-Id: <20260828034448.8291-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for CPU_BIG_ENDIAN configurations on arm64 was deprecated
in commit 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend
on BROKEN"). The support is now in the process of being completely
removed.

The Kconfig for Hyper-V guests on arm64 currently has a
!CPU_BIG_ENDIAN qualifier since Hyper-V only supports little
endian. But with Linux on arm64 restricted to little endian,
that qualifier is no longer necessary. Remove it.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/hv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/Kconfig b/drivers/hv/Kconfig
index aa11bcefddf2..db8464fcd119 100644
--- a/drivers/hv/Kconfig
+++ b/drivers/hv/Kconfig
@@ -5,7 +5,7 @@ menu "Microsoft Hyper-V guest support"
 config HYPERV
 	bool "Microsoft Hyper-V core hypervisor support"
 	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
-		|| (ARM64 && !CPU_BIG_ENDIAN)
+		|| ARM64
 	select PARAVIRT
 	select X86_HV_CALLBACK_VECTOR if X86
 	select OF_EARLY_FLATTREE if OF
-- 
2.25.1

