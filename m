Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B934E2F3D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671981; cv=none; b=gomDvs9DbphMpRRtC3FUQ5fSR1Vpjotefi3BNE1yv8Bierohvu6n5hFdAaX2adLqtfPdzF9kRCZzh6SkCXXQadkr5itt0ceBlDsMdsb0S6epam4OZSLwPhwKUQ7KEp8a/ebOV4TssnXbOp93JCNsFxXUNODigqpMg8VpdToY5PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671981; c=relaxed/simple;
	bh=kor4g0PeQkauNRyd0OjzQuYUAneb9p6DsERWXQ5HwI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDHQzT4OYMa2TM3kEDYAmiu8/UZJAnMFtbwEqVFBrP+SU6goJ7CFHtl4Bmew58wfmz14aU7KBQcG8boM3ULfS01ooF/RvjpNoRpRjjCUOdo32CeGDlkytPcS2aCtZI5Y+Bh6mEET/QmXx3ZLOYCMIJ7q/HGBWNWmPomXu0gVfMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnRqlXNm; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnRqlXNm"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7cadbe09dso64509a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671979; x=1791276779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=natEiwM6lNYiM813fc4eYfICSWQq4v/YxBaqZ21XGiU=;
        b=WnRqlXNmhQ9MUl/JM/LdaQPgF199Jxq5W+LqCGbVjvC9ME1nlsu+QELg0ISFkAcoDA
         XpJTS+3L+KDilcL8ejlprfCAxA2BtKM0taOEwLrDgfu3BgJ71M/4TPOHFZC4BYvO0kM4
         LaFC0rqMuSB+EBHCbW9qwIUveMY3toS8sRnZcvQpizX+X9EOlGE6utmDXsCZ9BKAahX0
         L8F0VByXnFMY7fHwAwaAHRIioDt4yqfFRZMQUXKBtkkM134hR1LNp56vGJhE1aDt8b3i
         SzgmZZfxjtpeOO30Ums4HYIffxI3f7s4GpMs+N4tMyOUK3t6iw7CP5LU/KL00OuUY5pe
         dFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671979; x=1791276779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=natEiwM6lNYiM813fc4eYfICSWQq4v/YxBaqZ21XGiU=;
        b=lFWkW4lLjwGW5W4ld4tla9P2DOmscqaa05jyOO3JNWg/bQiEqvsKRLRu0Mz0u1MWEf
         uyNe69w7ruUAWnMNJOjm8e15xRffiXrpDBsgUaYGgAG7qixYqFRCBY+maYYfB8+YcQPw
         K6yFHcaf3l9OGxcEpwKx4tFzhRCYz5et0o3/6cJ5xuFvbTH60s3/2wZYi9eM0M2FRuR2
         Rd59taowYr4ULdOrv7yuuQo7trLq0a8UZD0ed+lFtgoBRVU2HqIKZVMDy/01pGUZzMZ2
         qTDs1jEireMSVEtjvDGsoQmctqNMmw2Sm1CNkfCDgFSlw4wSt5IEtaB4yxxyodsK0LD7
         T7Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwtT2N9msSJ8vnOyzeuj4DZR2p2GerkWKhTnKFSxTtz/NKDtNbVDqLyDDwtLfElstfyveoK5UBmqArW7KY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5Qw4hGRL6icNGlGceenVx3oOWpOe/34d0j0LoihiX1Qf5stw/
	/6PK69lWJQ/Y0h1uwAOvLef+riS+hBwhUMpvUaXfkNnaWNckxGdjGjHw
X-Gm-Gg: AYBFou3AlAHbv2WQlIMb3gDqJEx7sm5a3ttl44gAUvyDtPTyOE6GdmOB4Yh5MOiLBq/
	4cUEpbfvwM/Lup98dh8b+lo3jxSMOKFU3OOpofhYY3mV6wHlPD61S1JxumTmePFn0mEnszWyMBn
	CJw209QarLwtDxP6dCDT41L6bxGhiuRsuhFHMWSpP7OvZrEQt9lBXM2N9qRfZPai07KfaGm5gOL
	FJICDdVG/HHDwo3+jMsbDUvoRi/tmpYy0G2p1eqWjML35Z581Xvr7c7Q1yLjZGNy+8a3iaIdAO4
	mhbqW9rteVtuZsiES+VilalBTmH/z/oV2ph2DJkfWY4F3164FQ58qLGeh+42HC7FwJH6iCqPtEL
	zClmhriunQkpUJ5U3RPMPVolMC6+wy273GWalToGTA4VHEjVb/jbxaJbXoNWaRcm4UZ4vmVkvpQ
	JvV8w/puEOE+3cFCZGvnPc3f46a7LgXC0e6vaY+T1plLrcyA/qimZ4Z2VIoix1EK/xbAc6
X-Received: by 2002:a17:903:1ae7:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2df7da5ce18mr136442545ad.6.1790671979024;
        Tue, 29 Sep 2026 01:52:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm4296499a91.13.2026.09.29.01.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:52:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
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
Subject: [PATCH v4 5/5] doc: phy: Document some bulk helper functions
Date: Tue, 29 Sep 2026 16:52:35 +0800
Message-ID: <20260929085235.469515-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929085235.469515-1-inochiama@gmail.com>
References: <20260929085235.469515-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document all newly added bulk helper function, it can be used to manage
a set of PHYs automatically. This is useful when the driver want to
simplify the management of multiple PHYs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/driver-api/phy/phy.rst | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 0865c2e94eec..9d238ba0296d 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -114,6 +114,10 @@ it. This framework provides the following APIs to get a reference to the PHY.
 	struct phy *devm_of_phy_get_by_index(struct device *dev,
 					     struct device_node *np,
 					     int index);
+	int devm_phy_bulk_get_all(struct device *dev,
+				  struct phy_bulk_data **phys);
+	int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
+				     struct phy_bulk_data **phys);
 
 phy_get, devm_phy_get and devm_phy_optional_get can be used to get the PHY.
 In the case of dt boot, the string arguments
@@ -129,6 +133,13 @@ Some generic drivers, such as ehci, may use multiple phys. In this case,
 devm_of_phy_get or devm_of_phy_get_by_index can be used to get a phy
 reference based on name or index.
 
+When a controller needs every PHY listed in a device node's ``phys`` property,
+devm_phy_bulk_get_all() obtains them from the controller's device node.
+devm_of_phy_bulk_get_all() does the same for an explicitly supplied device
+node. On success, these functions return the number of PHYs and store an array
+of ``struct phy_bulk_data`` in ``*phys``. The PHY references and array are
+managed by devres and are released when the device is detached.
+
 It should be noted that NULL is a valid phy reference. All phy
 consumer calls on the NULL phy become NOPs. That is the release calls,
 the phy_init() and phy_exit() calls, and phy_power_on() and
@@ -149,6 +160,19 @@ The general order of calls should be::
     phy_exit()
     [[of_]phy_put()]
 
+For a set of PHYs acquired with devm_phy_bulk_get_all() or
+devm_of_phy_bulk_get_all(), the corresponding order is::
+
+    devm_[of_]phy_bulk_get_all()
+    phy_bulk_init()
+    phy_bulk_power_on()
+    ...
+    phy_bulk_power_off()
+    phy_bulk_exit()
+
+The bulk get-all APIs release the PHY references and the array automatically
+when the device is detached.
+
 Some PHY drivers may not implement :c:func:`phy_init` or :c:func:`phy_power_on`,
 but controllers should always call these functions to be compatible with other
 PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
@@ -221,3 +245,8 @@ DeviceTree Binding
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
+
+Missing Bulk Helpers
+====================
+Currently, only a few bulk helper functions are added as they have users.
+Function not upstreamed can be found at https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/
-- 
2.55.0

