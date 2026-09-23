Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0780246EF8D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152204; cv=none; b=o6198t8aL9ONa7ZA/Zd3Kk8pr8lm5r3DAgNgOY1QwKHu4s46aiMkeaLuba+MR2SyFkz7cwD1sJzqD0rKef5EeUGuYBTbA1QVkX02oOfckHy4vZxdB1XhfS8lG7UzxOcZbYwwD48rl0uIbUHlC0a89sqHbDmv9nM9HQ37JDA6U9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152204; c=relaxed/simple;
	bh=KWVFcR8axhKHBUEznO09Np4NmCs9jEUEVgGXBR1vWJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hr0fPwvb+4rclt4KwS4+4SFFcPrBCLD14+RLbvucf/6rxO5qPHV3VxxsH+wqRoTtZb+MU9aJC5l+fv+SwB7ixJJ15JF/cz8wsP6CvrSML+tFqyEkOJExzDNoyWacb/FlrXmuH/tUx+KT6A2R7TqJuce9M8xQv3K7iF1cNt6OKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJthJzRp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJthJzRp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso391688a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152199; x=1790756999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWVFcR8axhKHBUEznO09Np4NmCs9jEUEVgGXBR1vWJM=;
        b=HJthJzRpgb8kctdVoMy42oxRTnEvxrHzUkm1mzLloMN5TjM5B6Oy7Ttjnv+xB242uA
         aW3iNk/7kmsKAaQeOxxoBC8EDuRrNKhWoqXdWkHqz4IAzoDpBXFiPYU2rrGNhQv6eRNi
         2zAWZmAs4zRYI0AAf8lvdKdifeSdvHNzvMuBIyO3UBN0zED/Pc9i4MusXev0Cfga0g+w
         ADUJLMpj+5NlIrofzXAQj2Zr8UT3mhECJA0wNHEC/ihmR9w3g379HIiI+6oMvgYPINt9
         Zcg8hFph2h51zBT80rpUtoln23FO43fmkuGq/ddJjw68goGyyiCSXF8LV3M3Fqdz4YPI
         zUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152199; x=1790756999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWVFcR8axhKHBUEznO09Np4NmCs9jEUEVgGXBR1vWJM=;
        b=GkA+TgWtvMw3BnRgP9ueB3IEskOb3JBtCcuRHVTsSOMqXaXaOxcvnbAQ/mm72Xeuec
         SO4I/pqtJ/KsdCMbWv9/p7r4vrB7ZOTZEKpWlcmmC0cPVxxffyTFbuYrT+krZyLdHteK
         XD37/U10NzyrGHATaiOsxjKiRhfqhS4E5WTwv8Xgk1fvzdwgUnu5ji1JKyadhgnqhykj
         Z+u5FzvvhD92yVq1nx7ukOnamokcT534idXi0oWk62esJ/FipuvFI4fqUq3NeHY+Docw
         ikdOnrsy9O2k0Ex0sTQA9wcp85vBS0cIEnlTUq7yIX4mRETzb8v2sJZoEKxi0avlmN0f
         p3zA==
X-Forwarded-Encrypted: i=1; AKwUvByhye5WAeLv68M4E3nBVBh7cfitAocZiEgBBUk1NvgIOub5goU6puN2JQ52ahvDkTF+X6iFk3Z4BXvDN8k=@vger.kernel.org
X-Gm-Message-State: AFuF++kH6yvTXo1uFSC2gXIjfVj5Vw5eXnqEUxj2GdZgNO0e+S3icbHj
	9GeG6u2O/0u/d66aK8ZdUSd7/DDcRAaAOGLKXv7TJExMGYLag8is396p
X-Gm-Gg: AYBFou3I2hWCEobSNPwW/CEHWl4kQhlOZsJWScyuB9VPzH+6bBUxEllN1YUrkDVPBxp
	nCaWzDYFSvHioyKUrmuFFcBhfE+7xdQPW7ZhltVBJT8BA416wm0k5QrjVCQmrZFbUmPNUoUMBzA
	uamEvPJcoE/JDkDNxkFdEroEuQ6KNw94AKjSTf3rTxUApyYtv6jnazFMQ87o635MHkBmqqLGvyv
	3T7sG4oh/OUcMOCVsyGkB9RPUQ93YXtdVSFvF+NM32gvdfZzgH7OZ0l35LmzHa5QvTBQVVtTfhU
	kas/554fesIaJz2B9K5eP8+PC0t/Pj4vL0ACzvL0ouxBYLmkMC47L9IYsQfdCvwEqG+nDL+fV4P
	ghyLPN4Tfn3sk26CIwVSGLV5FqnSZPFUbE8xQENir+kT7wpr5pgZV5AoCkGf8B6i4MYR8etYFKp
	WSxDhsoqaXE7J8ETSFIbThIujsndT8No8znBtJz3xlKB6WuSTEezPG1MNt4dGVSWjsU37Qpe9UZ
	E02px6ZVzPsM2TobS+76Vt29SGFX/ZF/XQ=
X-Received: by 2002:a17:90a:fc4b:b0:39e:6a81:c91f with SMTP id 98e67ed59e1d1-3a07e640fc0mr1490714a91.18.1790152199191;
        Wed, 23 Sep 2026 01:29:59 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc01df8sm3706355a91.10.2026.09.23.01.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:29:58 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	scardracs@disroot.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Wed, 23 Sep 2026 16:29:23 +0800
Message-ID: <20260923082923.154732-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202609221954.123456@gmx.de>
References: <202609221954.123456@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin, Hans, and all,

Thank you for the feedback, Armin!

I completely agree that separating WMI core infrastructure from WMI client
drivers makes logical sense. The reason v3 relocated the drivers to
drivers/platform/wmi/asus/ was based on Hans's earlier suggestion to use the
WMI subsystem hierarchy. However, Armin's point about keeping client drivers in
a brand-specific directory like drivers/platform/asus/ also provides a very
clean, cross-architecture solution for all ASUS platform drivers.

Regarding the background: yes, the RTX Spark is indeed our target platform.
ASUS plans to provide user-space applications on Ubuntu to control platform
features via the WMI interface. During our bring-up on ARM64, we found that no
ASUS WMI modules were currently available for this architecture due to the
existing x86 Kconfig restriction. This patch series aims to enable
cross-architecture WMI support to address this gap.

I am happy to go with either path (wmi/asus/ vs. platform/asus/). Hans, Armin,
what would be the preferred target directory before I prepare [PATCH v4]?

Best regards,
Chipang Kao
