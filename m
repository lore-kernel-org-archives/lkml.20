Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876573D5673
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788818084; cv=none; b=hfQjx8uXR/g9k0ofcpruKGNcIFvYG42htwt5qWM6hHGKMYIi0nn4hJW4xpFOeQK1VQ+SXWqIc+X4CXYREqD9BQd7EZkCG445Jt1I1fxPYmkN975sB8qJcYWTag7j2u/vwuiPin9p5IamK8/Cs+aaw5ueazxR7+a0ZL0u9RGQJ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788818084; c=relaxed/simple;
	bh=N2ns42t2lkowA7Fk1OVBdhHQEf1nFZ75mrokscC9jI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fyt/OpKw0idsIKAoj5u+3lx89YqyG/PHK8d+3E5+yv/vuCc1dzFyCw37Zz5iKSWnPHuUcjI0Mtek4PpPdbmzMM1CTCPJtYD2IdTqH3e07mmfNl5r5iwsE/98HQl6+yz+3L3NG3j/sV+wiPHFAM5WYGAD5JogATSJVjExm6gpASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESc7aepS; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESc7aepS"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-86d43cdee51so46880547b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788818081; x=1789422881; darn=vger.kernel.org;
        h=content-transfer-encoding:f:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwpffGrF0yp02BONayMPau7nafrjjaDgDJ94lomGBcc=;
        b=ESc7aepSBuly/9ppsfLYBRYJLWl3bY6U3Zqi8NERXRZXHTQtkmGORKatwI9JFWodCT
         Jr2Upbd6VVDQnbKS2KEl5dDCWsTK7KmSNUi0u0yO9qqpIvtEEt4I3c9lVTF+NT7Y/hte
         ypD97wM1OKM3oE2v3b64UPmW7wUc6HuxTurJaqolOZ3ulgLDMqfwu0yly09DormaVeIW
         6UmuFZqQIC/anicxTFgsVJRT3iFJ4QMpqQE7lvu7DlDIhTMWRxE0PoQryv2K0VzakQ8Z
         OZrhwaDI3b3kR633Qp6SmeuupwQkm5/h76TC5KzPQxN0fyNOnkcBcPMSUv7gqCehx+TZ
         sKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818081; x=1789422881;
        h=content-transfer-encoding:f:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwpffGrF0yp02BONayMPau7nafrjjaDgDJ94lomGBcc=;
        b=BGF3VS6FoqpT/5vl/hWoMH1/y9kfc8/mB8T5a8t8AHElfnMTW6DS0F3lGfB8OpIGa9
         8a2fjfPUOVPYwfIjLh8WIzMOUPnXH8D5oIxUP+DAWujlmbgqQt6o1BAIptADcVq58ui1
         55YUfS43sBBE+WkJMGK6oHDVQhEzFnuprUt+znbMpbjqJvmZ+CJGZaoNG5dy4t5aXgUv
         sueeAEKwzAfIEDnRIxu5gAXkep2xNSyfG49UonTqZ3Xh5D/X9JB8KAvhlTn4qs4MXDgy
         OwAuxOYr60nKJM5/mSBvsfnaSw2xGxMqi8WebR3VW9/lVBkcjW1mDio/mI9qXL4z0lAA
         RIBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+ak5kLh3YbEC8NLsMeALwC13nG9OlwCHUmfZDx2+5OzU5VYhydW3Gy2fHThYspLtHe0aFp8mEuaReD2w=@vger.kernel.org
X-Gm-Message-State: AFuF++koUOz7SgYzITKI5qnl5TlTe/rhCStCak5Uzp8vmGSEs8jM48w1
	WMgMyew/cCRxHO9NGQ/Jb52aQ2kBNm4UeT6qi8fVM0bOX2qlu2yG2o0M
X-Gm-Gg: AYBFou2ZWJx7VbppBoJfY43EwGnzKJyGhJOMXY/Rz3QVHEBfw8jkmEU50PKyd0UR9JV
	iWXlMb2jgNyKwGQ0pPKh1uxQbZkV7QS4xEmOe6rDY8OpqQhdbvbdsCENPSezgziigRRzg5vG2YP
	CXBdKYEBK/9/ASjmt8ADntoHKsqumTGgV2MiwQnMu+KqflaovSbTH4sPTqrGpr6VJUZxFus/GSH
	stzufTMLNNnxm3o+2BH6kJKp9RoyrKPxUj5o5ZSRXHfxAXwJAQPinjrgX7RtpWeGRKUOmbpXwep
	6HifCtvVbpltK5tsZOp3GyfDAPXUwb8LSTd88tKLeK8u1xTVyRk7JwgBQ0bOTuveng2Ga3qtH80
	bsjYh+xQCZiiCpXBSptqH4dQVdn2C+VY6VpZchouu7qnQY1S1Cf7oVzxJgnHJ8oxJIOlMY6YDq1
	w7mrYIaArwmkGCqztcGJ6tltKqncpNgJu5bBycXPNF1iBunv6h6K809G66TvLddZDXTtE8PUMfr
	uFN2nmINH84rvE0ug==
X-Received: by 2002:a05:690c:c509:b0:873:5bb2:6c21 with SMTP id 00721157ae682-8735bb26f1emr64757207b3.40.1788818081486;
        Mon, 07 Sep 2026 14:54:41 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493168dasm78139017b3.11.2026.09.07.14.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:54:41 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-usb@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/9] linkmode: better use bitmap API
Date: Mon,  7 Sep 2026 17:54:29 -0400
Message-ID: <20260907215439.409858-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
F:	include/linux/linkmode.h
Content-Transfer-Encoding: 8bit

Several linkmode users discard the return value of bitmap_and() and
then call linkmode_empty() on the result. Propagate the return value
through linkmode_and() and use it to avoid redundant bitmap scans.

Add bitmap_and_and() and bitmap_and_andnot() for callers that combine
three masks. The new helpers perform the operation and emptiness check
in a single pass.

Yury Norov (9):
  bitmap: add bitmap_and_and() and bitmap_and_andnot()
  linkmode: make linkmode_and() return boolean
  net: amd: xgbe: use linkmode_and() return value in
    xgbe_set_link_ksettings()
  ixgbe: use linkmode_and() return value in ixgbe_get_eee_fw()
  net: phy: use linkmode_and() return value in
    genphy_c45_eee_is_active()
  net: avoid copies before linkmode_and()
  net: phy: use linkmode operation return values in phy_device.c
  r8152: use linkmode_and_and() in EEE checks
  MAINTAINERS: co-maintain linkmode.h under BITMAP

 MAINTAINERS                                   |  1 +
 drivers/net/ethernet/amd/xgbe/xgbe-ethtool.c  |  9 ++-
 .../hisilicon/hns3/hns3pf/hclge_mdio.c        |  5 +-
 .../net/ethernet/intel/ixgbe/ixgbe_ethtool.c  |  3 +-
 drivers/net/phy/phy-c45.c                     |  3 +-
 drivers/net/phy/phy.c                         |  7 +-
 drivers/net/phy/phy_device.c                  | 14 ++--
 drivers/net/usb/r8152.c                       | 10 +--
 include/linux/bitmap.h                        | 32 ++++++++
 include/linux/linkmode.h                      | 21 ++++-
 lib/bitmap.c                                  | 46 ++++++++---
 lib/test_bitmap.c                             | 78 +++++++++++++++++++
 12 files changed, 188 insertions(+), 41 deletions(-)

-- 
2.53.0

