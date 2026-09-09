Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76855C337
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966899; cv=none; b=tuk2WJazTg/HGIUb27jRfGNUmrIJJK8jUMOB2qQ0HcmUpy6WXs8toeMlA/hNVeeDIevUo6Vp5KLdh7HavE50888aTewuYsyG6cQ0dhQ3ISJCqD2/uQoZFaUwFWJ+0FIm5kTyGH3f78omdFXbdaQq0Wf15Kv8YaKr4gZ7nrLDFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966899; c=relaxed/simple;
	bh=1GVj8X2p7lufsZ2voQnUOUhtIUq5oY3o4qE1B5AjqkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2gCg1RlaeBr/RMqv5SkFAw4HL9Yx23Bf6iZ9dBFGT3fLMjwOvhDPYGkEk1BmGUIKHZHkBEXagGNw6Cd7jQQGYUiuh9qS/QgFHvjIB++zUHPRjZKE/QH9791YXRT6YDcGawVZm5eYyRn8RJjpAVdVFBBhte0iFNdbpyQcbXAw40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzK8gas6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzK8gas6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4375455e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966895; x=1789571695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NMvm8qf6zXuBrsZ4ksCDxs4+LTSFOsWcxQZ6U5RW1A=;
        b=hzK8gas6mMzwGwYzJW6PO4S4W92fuaxlcM5mCt1Z36FdWxfpk9uCgFVX2W8f6vM6s9
         67iCyYAKOiPD/eWUAmY+oEEFqgdok17yRM+9Y28YP1KBZrdTOSedDUhKLtFtpUVyyiF0
         aBCQyuL42aY2fngRaoYGPmj/DHgwrkZr6fJt2lcyiwE5vCQa9WNBbt33796j0zOx54Vq
         53009QarmZI4GkCD33g+zeFrMK70DubcLOfEJrHscoLEcZqP3qpuNdSGKdXTFDbp/Osx
         EOz43cNngZIDBCwktP1hj/nhNtz8NjcdeAeK8IK9ZenPDcenzSOSGL9Caw7NeiZE8nTf
         PJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966895; x=1789571695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NMvm8qf6zXuBrsZ4ksCDxs4+LTSFOsWcxQZ6U5RW1A=;
        b=lY2nn1JRYcLRoiqv+j4XiL/8VX2CwNzKVafYHkgwqViNsf4n5zowmAdpaLmKGX/g32
         DfPrERipQq6+p5MIHsDEYMnYht/GsWznLgedHGFV2/zYv+xXuiZtyuECunF4gzW0QuDH
         o1ouDQbsE6Hq3D5B+rLZ6CV+VekTMz2iRjdz+742R0PwoZLwC3oLHNV70kmHxD491gdH
         sczkBM/O+gYKFRReSGrHHG+kLo8qZp8muqPS5pehQfcJruMtjJnpTi/Sg7RfqpJyZEjl
         xrEWc73Q7G+X1/lZbV8EoaVRLEc6gpx7wqhmtFD2BrC7Zm6HytOP9yx+S3gkBXqbN31l
         BFKg==
X-Forwarded-Encrypted: i=1; AKwUvBzXPd/qGkPlBhB8hgMb85TS8R64McgYKRwkQ9ov9tb5nALRulaQEg2ShaYBJJSW2kEDi7HLfnB9q3AQWhs=@vger.kernel.org
X-Gm-Message-State: AFuF++n0smcaxX/LF3pZWk7HthTYZe+mUnCYBFxG2tED353C0U53OLbH
	I4DKjGT6LNyrXgPxbMwqf6B6hZuhjnYffa5xNAQcLoDaz6bgKFmA4S4p
X-Gm-Gg: AYBFou2NGn9L8j+3vtkERrPLDNcnSfg5VwuZQ4ThEZiuVPtKKWJjOhW6bZc5V1V65/u
	2CMLbkn8uHBUBjd2k7OvTxgFQtD4lRAVv7SPMnsaSvkG9wAsYbffgk/cz0Loc34BwWQ2vVNILOS
	Y2wjjEorVT6NF5zqZRKk8/SVceCZCzzwXl9ppeDjCo8PwpIoHTpoQvDA/nGmpH4CXqs4t1yRzXo
	/r+ivA0eIQaqwf6LCIk85fOorB8onc/h8TVrECLrS/i9Cqc+HsQMKHpnsGOvXv/hCISM6r99/Q+
	3LRSnRn9ZZ3eKTLzJIlZxRd8BdjUCB4WwL6SlclLWXm9diSsEHDlFGIC8E7TsyRb8PtCM3FYwHU
	02+FLsG5P3/bZcgSt4MLtGQcCY1NtG7XFHd7Zs8qtAaFTRGpd4c7elCVJyU+T15wYGEUNo4ut+r
	chU7/IG+1VszUk8QeAPYOFrBCLmRTYEf4IQDwBWpx5Qx37PN3rYxdX3fLiY93QAtw196zigRKgz
	4uF0KFPotCOQ9wEAlBI0qIrwRWH5F6D+oJ6i+jyeuF6ODm0bQ5vgFQ=
X-Received: by 2002:a05:600c:150a:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49d2592e85bmr25190535e9.13.1788966894942;
        Wed, 09 Sep 2026 08:14:54 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm483644155e9.0.2026.09.09.08.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:14:53 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH 0/2] phy: qcom: qmp-combo: fix forced com_init() error handling
Date: Wed,  9 Sep 2026 17:14:41 +0200
Message-ID: <20260909151443.10276-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two pre-existing problems in the typec_switch and typec_mux callbacks,
both on the force=true path that tears the common block down and brings it
back up.  Found while looking at that code for

  https://lore.kernel.org/all/20260909140345.4239-1-okerixx@gmail.com/

which is an unrelated fix to the same two functions and does not depend on
these; they can be applied in either order.

Patch 1 stops a forced qmp_combo_com_init() failure from dropping an
init_count reference it never took, which drives the counter negative and
makes qmp_combo_com_exit() return early for the rest of the boot.

Patch 2 stops both callbacks from carrying on to write PHY registers after
the bringup has failed and left the clocks disabled.

Neither is easy to trigger deliberately - both need qmp_combo_com_init() to
fail - so they are found by inspection rather than reproduced.  The tree
they were written against is exercised daily on a Lenovo Yoga Slim 7x Gen 11
(Snapdragon X2 Elite), where the typec callbacks run on every USB-C
orientation and altmode change.

Oleg Keri (2):
  phy: qcom: qmp-combo: do not decrement init_count on a forced init
    failure
  phy: qcom: qmp-combo: check qmp_combo_com_init() in the typec
    callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
