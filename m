Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A617C4A68B5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017067; cv=none; b=GpBGC8LA1jwEMBQSqBYyUYmLBKnEwQWg1doIvoBakgZYpzUYzwbAt3iCjBikhgT0NMwXyEO+oxAxZ8dIrEoW9Owrt7r6kUl6gmZTr9EJ4WkFNMkOAAGXox2uEIdg1t4gqMjAg1rdudqh07BolfL1E4s2L7g1Z3gKv/XY+q2+K74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017067; c=relaxed/simple;
	bh=lJ9fL4dvaDu8YJNJXqtBjhC9KAFVn7GltFAR71ifad4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HuHaXasO/V9AfgEkSBUDljoj6XivdqwFafDto7dc6XYP4NQHvZnXO3c5W7f1+Y+fQgD8A6KAZxEo3timBOpM15WZCXpnHLp/1GkJuMwzgeTs9qHCvKBxYYv1wnHw/xGG0goO3CirjlDvymq89urzj7+yZNnUonNxK2gmsB4tIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=FjWy5Hdm; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="FjWy5Hdm"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-535f9de49fcso5527891cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792017064; x=1792621864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GdSWkhIFW3k9LSDhQXw9Gu4uXo4armuoaIxm/22kOrU=;
        b=FjWy5Hdmhdzs2sapqcveuGzGzz2+SByiq/4Sks0FIzaeMWsZL/OPk8a9KaI34iDuY5
         N31krfx7Yd7ehqVGXr2bIAlo9Qz9Yf8kgt66jRDzJpgnZHdAoESQcLVBKhk30pcWqm27
         lpT11s2A1EKC1D7/xkw2gAG0wPoDmm4aD+RoinmKiDiGL4TBSEpU5z/DWHZneEzuFO44
         qzBLoc8NbJaNaFgHl91x5Ozgs4MCT37twyGJJTHaWdsfatPncigwOVY+S4iIuDnAuM1C
         a1/+Cm21aLLcTMBSELjrCZfDiMQnaorE436ywBJFsaFbCq72JDE7af+BqknTAiX4sWa4
         Jt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792017064; x=1792621864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GdSWkhIFW3k9LSDhQXw9Gu4uXo4armuoaIxm/22kOrU=;
        b=CuYR6gxyzlrWCFSDBPhQuqYD2YUUICk0qcqGl87rCYBPjAN1sEFEGbjFX86jgY2XJk
         sMj3nmplh5nHzUWTqtmuLKSDOyRRDVbMUirK2FOmNeZEH75mfUzWGZa58vPXgvDhxxc2
         lRw6ut3/BfDiqW40TXWasf7Z5d8UnUk7ICIs7VbkXWj0RhgMWie3ojpb94N/65OLZU8q
         hNnjsXVYpaqQ+eTBwc/vMbqCH12CYIk1n91mnOrdS22XubyMlkb7qTIxRqK7J3r481c2
         wWgp9OknurYytTGMf08ugJCD6nsWy1AfV7t/dS2DNL3XNOmynQ/m6E6E4wIG+VcOqSKm
         ZNaw==
X-Forwarded-Encrypted: i=1; AKwUvBw445pGKh5BoItV51e+GopaKKdNJyNrH11UGiJPIc5ElD2PtWsgLEIWfy1s4tw2ZUHamYA2Y3ROsUhkRgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmSQrBG4lbMQvxVp+VLxtzwEgG+OLUYAiJiK6puJJUuMSgLRew
	bgEYMrYziRSqzNR+IWAzWuF3L8b5qe/C53CrhggxGSg6sIkvFp283l9RbsXdHkOGCu8=
X-Gm-Gg: AYBFou2kvDOOC/1pZUKJW8ANci+WOWwETibDumoX9uiW759J09LEqw5VsudDvTbSs3X
	FjZ8gaAyBku8PwOoOvJcn6D/lDmUKC1GZCmRUzq3/LFoMEb7QaC5ohrsg4XBOK0qjIXiN8GjKT3
	jBQJ5XjLJipWFPaxhrVSvOpLDWfwOQrnVfx3q4tD5RV8+HKX2B6SR7hmFnKDmqEeURzL8QuSEnn
	E1x6vQBaC897ubUy1WPJPMDwnD1eQsS9P/7FvD/XF4PCFVWMCazks7M98j1QrusDxNMQXzoS9Ki
	W2l+hnGfUe6DtFrbtifdzty5xkrTQZQy6tCdJ+BMpMkLrA0JC0WYIvNOuU2gIQX9mDbTDpHwHoo
	E0qlJRSLd8T3TWUqsW80lul6x74myiFvRaG8OCukeNIZdDBIX9z+eRX6zt0n/PzOafdTo5tMfkF
	9NrHJo+IoAsKdhb5p4Q/Gyx1dg5VjsJOUPNnCMKx4tL5BVeLtCJfXFc4aGw5cZVBvGkFTx9hrgp
	W4=
X-Received: by 2002:ac8:5fd3:0:b0:535:2df:131e with SMTP id d75a77b69052e-5359faf44f9mr299085941cf.32.1792017064429;
        Wed, 14 Oct 2026 15:31:04 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdfb89sm63708466d6.40.2026.10.14.15.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:31:04 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: pcs: xpcs: fix operating mode selection
Date: Wed, 14 Oct 2026 17:30:57 -0500
Message-ID: <20261014223100.304486-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The XPCS found on Toshiba TC9564 is unable to operate at 2500base-X
and slower with a PHY connected using SGMII/2500base-X.  This XPCS
supports 10Gbase-R, which is the default operating mode, and this
causes mode selection to fail for slower interfaces (SGMII, 1000baseX,
and 2500baseX).  Writing a reserved value to the MDIO_CTRL2 register
avoids this failure.

Wangxun already addresses a similar scenario, but includes custom
quirk handling.

This series implements handling for slower rates for an XPCS that
supports 10Gbase-R.  The first patch rearranges code that performs
soft reset so that it is done *before* the interface mode is
switched.  The second adds code to xpcs_switch_interface_mode()
to update the MDIO_CTRL2 register for interfaces that support
10Gbase-R so that the desired rate change works as intended.

					-Alex

Daniel Thompson (2):
  net: pcs: xpcs: re-order xpcs_pre_config() to update after the reset
  net: pcs: xpcs: select operating mode for 10G-baseR capable PCS

 drivers/net/pcs/pcs-xpcs.c | 94 +++++++++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 27 deletions(-)


base-commit: 05b5019b01fb9443b09ae4ed34af1135a80a84c8
-- 
2.53.0

