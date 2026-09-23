Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E55DF59
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130840; cv=none; b=SSjJYTng0x0E3axe5LVDtAc2cQ0kUZVlzE1IE2pfO8GZQXZy89IcT9EqqgV0X58AQ7r/iwR6s2QLcsO8/pg93zJkh9k341Fur5IIkLoJZ2jocPK3/mHZhyHbIzkSR4WsIm0D3mQircH3/1seBAw/mrPRBaq1ucVE+2irn2nxpAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130840; c=relaxed/simple;
	bh=lbX+8MX2XSV3iEN/2HJiEl+KqtLde36H88oe+ujCBVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npY7b9WjO66HtytYmmvN6K1oRWH5J0u0nTg84c41TNO7Hydp8J+m7WfnD4HvhTpAUS0W2aYBJxc+QU9CRxRH7JY3LFXi1NfD5eeot0YQe6y3CEZIvjpJ3d7kuViFPRBEurNFTP3kIxbgoxhrENdhyhrbvSQddQH3lNJjHXP95Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPUokenq; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPUokenq"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso262161a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130839; x=1790735639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RevM+Pm4qTHqsRt7MmtP02SEgC+bsSUvf93SBWhNqHU=;
        b=gPUokenqIcBYnbddy0tP7CrYm2toSV/RrTRgfhp1aVMs8jr6Udey8sOyhr+tQpFpke
         tvQUeFPQvi0ly6qT6sV71nxa8lNGM8vobAuHlqIj8NYJHJeqvnhAgGfbXdEjdMcAj0gu
         OXXVckl8T9+cq2CPIT+if0U5xnXj3Yfqwp1lcfdnBujt/JrKAreMpEp1hIU97Si8Z+Yx
         OridMZgf9vfkuY5B4iuxMoNie4sHhRNOv6A6cGNuyMK39BiLF2q4JHvH4giGUGKP7kIl
         q3p0kzu5mBH24ewh3qlKHKOhFX4xtiQebinAwaQNWtvADV000TXeaRH8HkixC2Hxirzg
         Be9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130839; x=1790735639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RevM+Pm4qTHqsRt7MmtP02SEgC+bsSUvf93SBWhNqHU=;
        b=OHp9tenHm8ELEEyGGyuSFCWnevgFRoKK0kPnlov6q8vwyXWulzNc7Q/JB+Uyby4Cy3
         XBF6kBA5BxpKyiSfOrjZznX9KexmsCA5ah2vXEEfng4UzCYnG0CKdRAX+NMKonSBgvT4
         m+hzICpxmRXIh1n2khr/+vS+3aNlhfTRbkZMRKUyEYPQyjkq/q8Sndktgui/Ix0E9zuR
         c9tkmMZtTMlkq6N27NykvejCb4MkQhudnnE+d8D0l7BEnRNgpQaagFHD/CUEMPdJ4CJX
         E6HaGmHDrWCpBABaWvQPv8vwuEtn797CfpE6MR11um6fIcBL8kvUMcSL5uzK1GR2dnhz
         sFoA==
X-Forwarded-Encrypted: i=1; AKwUvBwD1gcUAbTc7/p7LNhHRG+MrzqQszX9Z8VonCqENt8+p6LGNhdHiLa53Kgcz4P65sEsTT0soWrwwfQhUCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lsenDDlbzZ7f1Kf1OZLRNXhCLilGJo6r5ZHP8BbjsgjOai/i+x
	MZdKFNd6jIlvNcWh4xNbH4CWjKqa3iZaNAEUno6tinz61P6JUU6ZTqvjbzAlnWK1
X-Gm-Gg: AYBFou3pmVUw57SuKxiVH+qc0nXS3LppgQYeRJX2Cxw0zDv01/zTD12i/e8nA9QA2cZ
	W+Ip/VOsqe+tVcPpuGqFuP6gSs7lKDG3OoiEChdy9eC+r/ZhNdorT3sw04Tq/nNiAJUTW3fQtBR
	StlyeMOB8vbhKZyehN+B7SWm/DoJNA/3xAXYWZkhXGCWA1zTF/pIkf5lGRuq5Y75qbHMISsmzha
	toOwQJ4G1ihdTrqhD1LxwleDrHof1n0ehXw+LD2TCwT8w/vACH9SFGlCybsSmGbVneRSG6VrOoJ
	AxRDKRJ1UT0ePJaFjvTtikcnc0Gqz0yY2G8TNr+UUZX5ZUy2gM1wl4z1LEQShy98XnBVhfalOfe
	kliG4IAHU36lxxbDBmEJettdn853LewictHbrqAJWJf0nFnkT/B3FpJ/+48Gnc70YdwNlk4hRf2
	d30P57vSWj1eqYkkFub8bczFPnl552p92e0zDuNjLLRDPGuRGWO2LhuBFnTXY+dMB5gpWe
X-Received: by 2002:a17:90b:1652:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-3a07e55b403mr1202832a91.23.1790130838813;
        Tue, 22 Sep 2026 19:33:58 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddae723sm2076064a91.5.2026.09.22.19.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:33:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/5] phy: core: Add phy bulk helpers support
Date: Wed, 23 Sep 2026 10:32:58 +0800
Message-ID: <20260923023304.78428-1-inochiama@gmail.com>
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

The example consumer driver is at [2], with the following function used:
- phy_bulk_init
- phy_bulk_exit
- phy_bulk_power_on
- phy_bulk_power_off
- devm_of_phy_bulk_get_all
The devm_phy_bulk_get_all() is also added as a simple wrapper of
devm_of_phy_bulk_get_all().

Note: The patch still uses -EOPNOTSUPP for dummy blob. Instead, I send
a new patch [3] for fixing the left function.

[1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/
[2] https://lore.kernel.org/linux-pci/20260923015016.64069-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260922024724.191412-1-inochiama@gmail.com/

Changed from v2:
patch 1:
1. Add Andy's tag
2. Update comment for phy_add_device_link
patch 2:
1. Add Andy's tag
2. Update comment for changed function
patch 3:
1. Remove all unused function and make the dependency as static things.
2. Update comments for struct phy_bulk_data and left functions
patch 4:
1. Remove all unused function and make the dependency as static things.
patch 5:
1. Add phy document for these newly added apis.

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

Inochi Amaoto (5):
  phy: core: Add common helper to add phy phandle device link
  phy: core: Add common helper for get phy phandle by index
  phy: core: Add phy bulk data helper functions
  phy: core: Add managed phy bulk data helper functions
  doc: phy: Document some bulk helper functions

 Documentation/driver-api/phy/phy.rst |  29 ++
 drivers/phy/phy-core.c               | 416 ++++++++++++++++++++++++---
 include/linux/phy/phy.h              |  74 +++++
 3 files changed, 483 insertions(+), 36 deletions(-)

--
2.55.0

