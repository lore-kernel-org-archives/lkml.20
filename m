Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3AE3EFD3D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511073; cv=none; b=jwgCx2m4XhVGjVl4/X/kVGfBZqh3MRwa2W5gs7VseesCLj+hlOpht7miAQoHm8cbxogbEG9mfEZjOU1WYsT89WGQ5aXMjMnuRPkrMLLsWuakBwwwi2eTnu4nHuxRLFAyIqtiUQ04nyhM/jvTKNwyWSr5nmH6Bi08g5Ww3kTVkWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511073; c=relaxed/simple;
	bh=cCl4KoVJWQx2i783J8UMLPXppXAg1VvX5JgeEJVvjKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QgRUmQjUTGLzVx4TiSEcjk3lONub18Y4/P54DrWrLG3kVtKo2/oxWzi7K+kymWWfXFw5tE7qvJAWwbupp0QWsIDX/WwKBdL+l92L3u8L1xQJ4smLvjliXhzniz2UpyCHGhh7Kh4UsQeRfrSYyUHdwyVD7f0wDkWpg1V/hqFKyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2AuOzcu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2AuOzcu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so850642a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788511071; x=1789115871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6pXZOI1TlC9MwT6PyMRsLZ68Bknxu2fpSz6gtNlsdc=;
        b=i2AuOzcueqqGIPi4liw/x82Epl7yeRA5Zz4FZoWZKKgyCX4r4mJrKiPaRNyT4vaqgT
         vZ5921FFEEoPipaWNv6or/YNWU/Ve2McKUhhT5rQZQ7Pi4XnANnD1x73CJibNGW5Agms
         /X7v0+XIo+t2OhK+UY02/oA/4nipXIkX28+FX5u574MdDgCs5OmWRBbQEraaK3AeBbYh
         AZVZLmg1+o0k2bRlvz147UIxL2ceRqzq5wIhFBh1+eD9KNNtezn5zYQgpIJBKpSviQDS
         jkDD7HWNgiPAFtGUaBaESMMFXiSpRLPtkXMclPPjWTw3pSr5P+C+i6a0PGBiOiqmpHMS
         KW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511071; x=1789115871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6pXZOI1TlC9MwT6PyMRsLZ68Bknxu2fpSz6gtNlsdc=;
        b=QlV23aZHmTX2b3dx++kqXBp5f1WN90x8pRcMqoI5/tbpZ50cPhSK+3eHz4jfxJUY7O
         GbzYS3tRzt9joEYQAO8MLDnsYXJe2iG/rXP35FdPn6A8kkn+CAncnj35EL4UkwP/w9LV
         SL/c8CGCR0vxzzF4cjkyKC2qq+kT7eJuOZk/xQbh5OMr7FvisRyRr0Iax+gvAzYRArkD
         8+xOnNUN27Wasblg7d++XDZD1v++ob+SihT+9W/3RJP2ngLx2cduHErGA6gXPZjJWqIg
         Y6L+hl47aHOR1aSMEeE3nlZkFpFQMqU5s+XsAJ+ujQjJZplbAYxRP24lnNN7ACg4e5m7
         g7gA==
X-Forwarded-Encrypted: i=1; AKwUvBzMhGBrrCeFPNvNRA0oz4bJ0Rs5jeojGI/CFv7z8Xwh5XC/fmtOV0qrIS6moOiQMIRsgrUCV68Noic4adI=@vger.kernel.org
X-Gm-Message-State: AFuF++m9JVNL+rAZV+DNrRi74THlDzsX6LDocqVSR7vtjuXAVzmLawh+
	BKSisjQULSL9UXh8RrdI1Pw60fXbzNMn6vKAXpTGqnRTvPo0dbAyTAxZ
X-Gm-Gg: AYBFou3uUPeAsFSCXwD+/DQ8N8R2h+Kg2sFYn40/J8QeanC6hTOawV7M4FjmrrkA7VT
	Ay2iYpASbtznv0jjCvVCDzwb7g6/6+TiiYTAIysdKXfzJpN1cI5yBntSO4N/r2bAy4TcZGwpiJh
	y4JHZMQ5TkbXu1KzkOUX1tiSUn3rWvD0F64PKkNDdJ8GYJCYpPHiE96dUEpo4MjhUKIBuNAA9Fc
	rqbNAgAejhsP2Ec+GKQUHFX8LGz6V3P1heABE2rS8IXcjNXi7qvnzQt64BmE0eAFtVe3i+LkG/J
	xv41+aeoNevg32IvLH7Mt8hKM20H0KxI76ui4phhTNuvpmSgNT7zd1TzsOF1wMHMwzzBbBozWu7
	m16pZPmQSBUVEOBon7NdZN8u2aRBNZ8lGcBSe6LB95ZmmNOP7jo5dcY0L2fAolGvIlRXjRpj55h
	83V+s8Qfd6X33Ebvc3493/dIfjaiZi3X3Wyy38T9wmkv2k69L/gWeD8ctApKY=
X-Received: by 2002:a17:90b:2b45:b0:398:ba46:1d9f with SMTP id 98e67ed59e1d1-39b27ea735bmr2719594a91.13.1788511071333;
        Fri, 04 Sep 2026 01:37:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b261549f3sm3317687a91.16.2026.09.04.01.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:37:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/4] phy: core: Add phy bulk helpers support
Date: Fri,  4 Sep 2026 16:37:04 +0800
Message-ID: <20260904083709.425893-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in [1], some drivers may do not care the difference between
phys. Instead, they only need to treat them as a group and operate them
together. This means a bulk operation is needed.

Add some bulk helper functions for phy core by referencing the design of
clock/reset subsystem. This can relieve the driver owners' life who needs
to handle many phys, as well as each phy error reporting.

[1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/

Changed from v1:
- https://lore.kernel.org/linux-phy/20260831025319.94886-1-inochiama@gmail.com/
patch 1:
1. Update document.
patch 2:
1. Fix document format.
2. Fix several document description.
patch 3:
1. Split into two patches: one for non devm helpers, one for devm helpers.
2. All the bulk helper now use unsigned int for counts.
3. Fix multiple the while loop statement.
4. Rename of_phy_get_parent_count() to of_phy_get_count().
5. Fix some 80 line function problems.
6. Use PTR_ERR_OR_ZERO() to simplify the error handle.
7. Fix zero value in the document
8. Use two separate release function for devm helpers.

Inochi Amaoto (4):
  phy: core: Add common helper to add phy phandle device link
  phy: core: Add common helper for get phy phandle by index
  phy: core: Add phy bulk data helper functions
  phy: core: Add managed phy bulk data helper functions

 drivers/phy/phy-core.c  | 700 +++++++++++++++++++++++++++++++++++++---
 include/linux/phy/phy.h | 186 +++++++++++
 2 files changed, 850 insertions(+), 36 deletions(-)

--
2.55.0

