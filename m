Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595AC37F8DB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619065; cv=none; b=f1+70TOMnL/IqiKDHiugaEL4YG0DTxfp9RrbmHR8Wgct+VNaRBq+jshNmUAZJRabd0yCrgSr+mPx8Ia9f0FFpjVD01oxiNJz1OHnaMxeEhZb4aD8ulr7HcJrLtme3y5SpGF+rYnr4kBZvvdhPeaxQFqFusETF04Ov/HJXb4kFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619065; c=relaxed/simple;
	bh=ysevVIWJ5TtntjDXiekqdlkXzHSTlLCPSnJtv8zueuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMOjWwesC6v8tSQYXSBcE1cRkAn7mJEW1X7wXWGurJ/fDlW0yd1xDI5uiJdlYCru4IavcBnGgus0AGF8ZGB2QvHNZWM973qQw+h9O001Zja99xZKuTTseBHzxZf14XpI8rwWzTicEz9bFj/Qz+q1LSmQ5QB/HcfeeeTUbT4BqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDUdNFr3; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDUdNFr3"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c5ac25089bso863482e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788619063; x=1789223863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ysevVIWJ5TtntjDXiekqdlkXzHSTlLCPSnJtv8zueuU=;
        b=tDUdNFr3V0K4/yIuRF5DH2iYLzo4cGsw1Y1EeTA16NZULeqbxDsUKl5AfG8CmxrLH6
         2/k2RbG6bC28yn4wJC04aTqXXxiGbK8fkFNR5MXE9b/XJDJZ/QHZzuHxA4Bu825F/5Zl
         euFN6Bf/yKMJC6fHG4RvbhxfeGFS7Z6jAk2enrVb6Caj09VcvRQ58B41W+lPBUHOlzrc
         Q+gDFQouF99rwdnlWXyTHz+6s6XFrbarVNBGACKrFvsLFiW1UBhypQ44FcqSYR1P2GeS
         Ln9nF2fS4FKRxodQAGbtEy5mdFxYMreBY2zZtJOz6qmPa0T16kbLMg5BF5Gf6hy5kn3K
         4zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619063; x=1789223863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysevVIWJ5TtntjDXiekqdlkXzHSTlLCPSnJtv8zueuU=;
        b=LRt9nSoB8SRT1sq+esNbAina0f8VxgUxaeCIJHTXqfo+4YWupZazm9xCb+zIR/G+hP
         lc/8gbXYXyy/nmotrDkbqHyPMqg18jQgmKduSjcgs73QdV2Cgj37yQQwZ48bGVcm/qKO
         Bqkz43ksNrNW5r9M+vXukyLIBrLag3C3UWz42uLFujM0WCcBlRakl53yJoTP0CxTFXE1
         Lxc583E3C/Yr8pJ6W9n9tmZYkZICJ7nS6bMGCD9oHKIH2PgptqaB1/VWoFvVoC/+RToU
         Q1csNibgAtVP7jl3ce735jMJTXbs6kTiX8M7XYMI7TXKvVnqmLRtgLWDfvDlyX/8db8D
         YJhQ==
X-Forwarded-Encrypted: i=1; AKwUvByIIKKWHeBw3gWOJms/UHL6/3dO7JU/Bq3gJhboZMzStA4AAnfAuTekORNe6VuSQ8PzoZ/wMoVHgVnogEA=@vger.kernel.org
X-Gm-Message-State: AFuF++mAkDsSOgy/BoeDUGoPzQtuy8O8m9Xp030KvjskBu0AAu2MEYMO
	uXrO8x4H8ha8kesP6BoBMLG4L4w2R47DM8A8mzWV9awNf5vzORcUKZSZ
X-Gm-Gg: AYBFou0wka4i2vf9vZqkvPKSSmevhainXGYO02uOq7RCPr6IDV8aKIViTeRDggdjFOG
	MiaartkTua3aI1fBJzjT0TQTKEf2S8G4x10nlXxAAdY491i2+RxOxLWj9tOWsT/MdCfQKUR14JW
	0ctrySCyS1p/OWfRztleUOKybo7cCT3Hd4wHcOqh7CDu9aS5Q4N4OdclOTXu+XKpD2DzCov3a7N
	eUKOc77LrOp46Solk0tJ8LZRCNxHqjPZtCGK45cYWjjfhQAv7yE8+DDnNZR4+dDA4Yje2wcawna
	8GAr9YXkGJswpVD21RSgb2i5/hgN6KSkiC48Em+lVjXoDGEOCnt+wqWjclxq8kHQmJJh3DNiAEW
	4ET92tNFXTzIWMvsXmK+a504k1lrFUj71sRerzqZ2VWohYR0taasDCyMvYXyskkX9VnEbDG6SDf
	YLzk7LQ3aytXSiHb50bnIVtdZ45mNFDIyHEuV1zsayluLkL4oMYQkzvH3xnlDr3T9sGHdLUWDwI
	7uzjcTVXDlhCSY82ogIgmqnEYsunLsU8Q==
X-Received: by 2002:a05:6122:1d50:b0:5c6:81c2:5496 with SMTP id 71dfb90a1353d-5c7ed7a8eaamr4533368e0c.4.1788619063063;
        Sat, 05 Sep 2026 07:37:43 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm4248210e0c.18.2026.09.05.07.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:37:41 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-media@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Request to withdraw all current and past patch submissions
Date: Sat,  5 Sep 2026 11:37:37 -0300
Message-ID: <20260905143737.25125-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

Please discard all patch series and submissions associated with my name, including all past contributions and current ones. I would like to completely withdraw my contributions at this time.

All the patches created by me contain many errors due to my lack of thorough review. I am very sorry for this kind of behavior and for any inconvenience caused to the maintainers and the community. I tend to overlook these verification steps, but I promise that in the future I will review everything properly and correctly before any submission.

Thank you very much for your time, patience, and understanding.

Best regards,
Breno Rodrigues Alves
