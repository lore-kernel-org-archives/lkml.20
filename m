Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A5E3EC81B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139397; cv=none; b=XV50yAoVjtwjp/b4eIOEjKtPq4IvwB96zc1+IGjaSRBBbR8T8HR/mrnQxf95DGclaKgtsBqm55uO0mBpPFe8i4puTUZupxFad3A+JWiqKR2NKYcxQFxcfwozOF0zAMk1LO/Gl0gDKjk1prFndik6Kg/2Xhv4zEUC1USYPuYSB6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139397; c=relaxed/simple;
	bh=i+9Kd1wcuXXlxSDwbur+MJoqMUdg4kpmkXMrI0+T3eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZk1JlCLbFaYDd3SpsACt6pfv5xcdHGTG5jWJGXNMxzYriVLxvH7w0zfweA6ewkBHC2avkle/HcroVkqPgo/UBoIXacsv7WwdWlR8dn4+iXm7S4LeeUSzxJW5ORjyCc5XBU2GbxQaAzvkvoienc45G8S+fFsSLxuPOG2VQjOSyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of9+bqSs; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of9+bqSs"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f204f6so319425b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790139386; x=1790744186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qra++7QT1u/2cZF1D+tg8w8VOq0NYWF4+x38DgQtB7M=;
        b=of9+bqSssdYNRkk+UXpJY230Th16Gvy5rnrFpH5neKMzQKK2igP5NoowLchLab8HuT
         JyZXWsVsLAJP8UDXt6rlLRFU1dPcCPSseOskypHh6yizokhDTGn2g9/EG5Vxep/dSsxl
         xgEUEcJ7QLXyvN9h0kRkMceM+EYSC4QmKrKY8KHPJcKVGYi8A8ZxYj/KOY7Q7bifvLOh
         +VwatlaB1npSP0bR3Rfk4tJXMAPBI8rPjiGSASLwu0b7U8ndm2U6LyhKY5zh9Ri8TSAe
         IFWJT25dZAUmFWLIVedXlyKZqVrnyedDTvquL+PXY2BO+xyh5kNX6j492dx+7YhTGkQL
         nmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790139386; x=1790744186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qra++7QT1u/2cZF1D+tg8w8VOq0NYWF4+x38DgQtB7M=;
        b=h0yKF4OkrxR15wl3jXq3Zm7SOsU8H0s2lo+cTjpR2BEoXo4bd7zfFwmRW6laJUrX02
         1mo3lQper3+fBGqAeiEHX0PACB3iYKh7XAC9CjWdp2k+71mZNw/MsV6wwhfcR5oO2pD8
         IFz3iRDjkt9SX7iwN3qaz9IWJegMDBkUi70Cww6BX8X8osvLQRnXNK01/MFAMquQ6rtp
         dk/uIvffMKdYoXb23RSCCpig98Qzq0Br5TCI6PqJU3X68qgYAxrlMuoXbAPX1/RSCJ8U
         mSgsXtJ4LjltyQqxN84FtBgtOcnaJSpUseaJKGcXgpTaWygXQNuZqxfGgxlb9I9Woee2
         kYMw==
X-Forwarded-Encrypted: i=1; AKwUvBwPq2EVAa4Rq3vU39nIT076KXyvjW9swqO37FWF28Td/RDs8yC0gtlWEb4W4aOyMw1tv6TqphvzEdoJnhc=@vger.kernel.org
X-Gm-Message-State: AFuF++mXLOPMBjg89jgm4nwMN1kgX6ovUGQGNcyYEw3QqAfwS339//WF
	f14Fdd6jniWXzgYhEd895i6eyqfxI7hrbDWsgyq7JGtL3HZXwcWXZk84
X-Gm-Gg: AYBFou2wcy00kZmkA8RK1jJLf+MggNTFSp0v6opWuaRbn+yyoQEo2+GReZeg2VHSqpQ
	AtJvJbt+ZA53pdAt5LCSb3VrPieRhq5N4YdM8Yh1wlmL97xSMgEBFgx/7ItlaVtFqMaCvg5yBJ1
	ETmDp6GHQX3FnBvIBrpoDvBzDj2c6k3PY2QnfR2xusg6oFifrF24ej3Dsf2O630Yic1OG6NhJnH
	TBctjDUiEHA75Y4J5VjsS/pmFr1eNUNXPDP2EKORAornKb2g4bp//7R+7NkMwt6CvA0PJPdEnHi
	246PovxkLmtTuajFfFR/PFWEPb31VEI6XHIX0wlY30KoGBx1uYwhRPEOmz2tp7QuN1ZXlkUjVrK
	lQ5b1oZFngUByMLSVtfR1liCfWJBaf+jAt1SG0svaE2OXkfX95QGMp6ctWPPBG+wR5QygQwZ0l1
	Eu4Hyv2wD6hAIIJ7D4asyV6FWFe+TE9hkpvsuvxNkv33jf9t7JSRMZiHSZizQEUfGrhd0s2fHYy
	bfj
X-Received: by 2002:a05:6a00:2354:b0:87c:d00a:f350 with SMTP id d2e1a72fcca58-87d1d6c1be0mr1485300b3a.48.1790139385958;
        Tue, 22 Sep 2026 21:56:25 -0700 (PDT)
Received: from localhost ([95.190.82.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cec2d34sm664129b3a.14.2026.09.22.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:56:25 -0700 (PDT)
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
Subject: [PATCH v5 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 23 Sep 2026 11:55:51 +0700
Message-ID: <20260923045551.229259-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923045551.229259-1-vladazaharova2018@gmail.com>
References: <20260923045551.229259-1-vladazaharova2018@gmail.com>
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

Assisted-by: LLM
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

