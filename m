Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D143B8135
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324693; cv=none; b=FUFBqHSZpF5wrYZbk0zADxfeu1T4PfmUrjmVzAADLKkn6gOqoDIRo3QXq5SdAmjGk47dWrWO0xMOv4aGBVBHF7CH0m2Ee9aDe+xpGFwhVhqQRp3v1OFzM28yL0sZXX9u7GFaDcq7kjI04A5AsPXlES3MxCDJ2fEH6NQ+I0fRdwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324693; c=relaxed/simple;
	bh=+cBOmdfMRpo1mKp8ZhzrQDLiYCnzdvGdytXX8AvmtTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXMYMtddlVAFp4kJmYGyplhHiHLzw9nlTMr8hKydc+Ia+lA2CIzVIuQtFTKzTKwj3GfI9uQH+Y3HWuIf/4WIe9iJuHEpvJnm8R9eROWoWrZfMKlthFtx6Krk+c8fMBNhzI2GFHwVv9ARZ/wQZGyXbA7GzyyUObbebihcZH7YKZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SR1wEWcu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SR1wEWcu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so487012a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789324691; x=1789929491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8egR4dMbs0feNIgyGf2N4bg3BFUD4E92PNKo+p8ClY=;
        b=SR1wEWcuD/mMkbPBWlrbP1D/60M9OmaU+Yy/7tVisKQLnzOTSoVWuPxnoKWbGwnugN
         986M0OeCBZwK7RlX4NB62la4e2CQdZrbe73yaLoUk39tJGJmjRk4ISV3tT5C2QmVhSN4
         5mx1XMfwjH3tZ1eEvAYwy03ooRcEIte5tKgSJ7+5bWtdM4kwz8+eCXjuU2waR9ogO+wl
         cNSFes2SaPXPL851/HISNQplGpyjdGFVPOpCms1bqaFvQrVLeppdBOmmvgUvyuOcJzX5
         IHc37Lgk4M4dPqdtWxZpikcV5bUdttnpt7mibyYuMfVLVuTd2/AP5umnW7c5vu/cc3gw
         GSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789324691; x=1789929491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f8egR4dMbs0feNIgyGf2N4bg3BFUD4E92PNKo+p8ClY=;
        b=nY7qsttFzkjM/aci4aS+5WIAq+avC19FFoFUTIM56Hy0/Gg/Qn3FPQFNw8etN6FvUF
         YtL9gjG69ENCdyJ2vtBuiGit/y4K0q98P/uo3zn7kCgkTdKmtkPM1drQl9PHYUO4rO13
         VScALbT0UiYanjoyXhVp7ytbDo+pyMAzPH96wBJBQE3ux9jCubAqys0Zua64RYgS2NKF
         PWibehB1rsr85X9OGexQOg/bJODB/pLRK5DDInaaCBEPfTKXlvte6TBXgHZIJ4/s2WEK
         7eU4prOdlQ9mteYomJ24io7ajcPHbJ6CxSB3UG+wi7xzpkHBGayyNKSAvnBe7GYfhMXH
         jFPA==
X-Forwarded-Encrypted: i=1; AKwUvBwusGrCU6VGTk5IPt/ZTMUulw25eQOyeLELIuoaw7/84FBL2BaWvGUraJFyrS3nIsRWaBubwHeLrAFO7n8=@vger.kernel.org
X-Gm-Message-State: AFuF++lyp//hmKsB0m5ciVq8+uem2aXUiMWa77sPwui77qUmCutWoz0y
	TkOisjwnHSY3GnAfd9DmweGAgUdAIF/jwGLY0ukhstRFOCkektR8wxMO
X-Gm-Gg: AYBFou2Aihbr/5g45k2RpQVB3lnA2dQazxOvamki1ICiiQw1Kl74XrNh/KlH384l2gP
	1og71fLtPYTSb/dXIhpI58R086vMjUJtQ1jxUSvHYgq9c1yHwZnlQeouRWqMgTH3XYMvGj6oZOt
	qfg1hOvHjOct5uUaF4cPWN8RIJ8fybzD4mUuXv9xn5IiCmydJ/Tp2FxcOEpKbRiw1LNP12HmhmJ
	eYro/2jQVf9h+9S486Fl+5KhMy2gWvPLsBbDdnLx2fAxaBTeQfimN1JhrYqm5MO0DRqKT7l4z1q
	NQ68jsviGSE2Dj6U4IUlecQPs0pIO/Vaz1pX9Mi+6fv5HM0HgznL2HENqsopl46xoWDzdfiTbvp
	ykN26JCwi83/vpRyvtLfsek6i0iOr4+LDQ5H8GtCJSAOIku3uvjhIqLqiCLLNfxPSR9Brt35dLM
	CA0mNEhAAVpiKS7Jl2ZUr0kTcZLzSczOh94/ldIG12gULrxvf5MFsISDSAQDTQT6ywS/BcJ/wuS
	fa3RspUfGRk0jV1gA==
X-Received: by 2002:a17:90b:50cf:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39dd54d7dd3mr3783446a91.2.1789324690644;
        Sun, 13 Sep 2026 11:38:10 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b08165fsm4118447a91.1.2026.09.13.11.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:38:10 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v4 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Mon, 14 Sep 2026 01:37:34 +0700
Message-ID: <20260913183734.134307-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913183734.134307-1-vladazaharova2018@gmail.com>
References: <20260913183734.134307-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

