Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174C3DE44E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340492; cv=none; b=epOf1mRX9E27Fkg73vhlPoIJYTHBL/1429iUXiAjHqfMWaHa8F+Lj/OI+wNhEk5I7N4hKBGMFxPhj8Q0SjWK6fOPRcCS4D37MWrj7XArzdpstpFFRIsZuzpfjhQmjsvArbg/P6wzAWfraqe/m5aw+mj6xlivcQzU6y+VyUjIEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340492; c=relaxed/simple;
	bh=pjUUw4hJYxF1X34eP8oUA4Qvp739kD7LK7JPdMLwD64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=luQ3UHajCWaCJXGq0p5+TiwAt0G1xoG0JhnMDUvRx/9E8CpmlUTPgKIU6kbtNsxDyU/5MxoSKZVlOa5tvVzsW+ePjSQ98wHa7eenLDhBZau6wLfsL8hZK/QPEQRW8BbPjKHE3bJu+e1wwaY5X8ERw+SyVCoVZqCiGKndeYGCi6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjQQTfoD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjQQTfoD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f635552aso630013f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340489; x=1790945289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mb/FTfEtET6YgPWtFLjQYy9z8TLsr4HMB0wFXAmYD3c=;
        b=cjQQTfoD3axKNof5IbuIeJknJ6qhcMuw0AoORdT8tRrUp2PuwvndRcC6A+3vOZJrwL
         nWhTysXYokCSS6YSRm6sN+lpEIhsEVjXjzqQPOpo8yTTWjehHXLKPfC6QTtF9FH2oNtz
         dyTtMjkmCvXVvn3kvbHjtA2sl28DDs1ga9r+tFc68GH8jilZEM6PSeFlnz6jrEJjigcL
         5qoHOtIwSF0xgHCEALxoXdXSz3T3fNHXyZXVtWU4I1L/Wi2JTav4RYQ9lBGGq4d8d7Tq
         KqOUSJPg+2jLzu6wGByayTejmwmldbkV9zFPEy/caH3Fnu16t1wSJXi557fDHixBcvRH
         X9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340489; x=1790945289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mb/FTfEtET6YgPWtFLjQYy9z8TLsr4HMB0wFXAmYD3c=;
        b=bIrSjKSGXfrySpVPfE5BTXmXr9y+FhUlzQ/ASLBZvWm1oZDweB1Jc4xv3rHPdcrj2n
         hKpSOqFzxe43NRpZeFV3onEH/+vS2JpvJmNp9kbM2OdUP5AXMKm4dNmwgczBNEqRIsWD
         bZZi8UqeGEz9Cf/5fJcvPjw5T+sW08DsKjF8OQZ4bSEx986cu/uXM6ci3V2b8k5Cia2j
         C1Eh7PSOqpKu03sBlwaaia4QOS8835hkaP7NVxhR23Nv7J9NFdHM5V4DCNiEnboryyD9
         rKJTd7Pl/IkZEZ325j3yuqXeEhyhLOwHXrjKr8Fl8i6Z8+CmtOvWzRMe7OLpklJdNZGl
         EFFw==
X-Forwarded-Encrypted: i=1; AKwUvBwPaJosRE+lTS8lX2tF+3YggcE16/gU3ne+5o9P7vN3qg0YL2dudKGhIbr559GDvskoY0PMcpZTcdE0ftA=@vger.kernel.org
X-Gm-Message-State: AFuF++kJpOZFpQif/3T/tB0NjygtpM2BuHPUjrkkXeoWYnEHyr9/XS+B
	yv2Oa5Zy9Z/Q9lRXq6/CUgqtVOloU5H9vjkvLuHwRxhmoa+E6GjNP0Vo
X-Gm-Gg: AYBFou3ZJc42r3qqkVAjbVU9yDq5s+7w0Iw6SFKlwpXcIMp/WCm2OxIEnTZ2l9cs6WO
	uAb8KiPkDY7Ue6sgsMCTBBlV21QFtR5A5DDlsb+8hXSUcWKK4CgkADGVtWJdM2oUBv4A0YpsWhb
	ezBLriP2EvGNi9Tbk03vi4qUVf1AG7+2LqpqAY4gJwuEo7RrxHGTf+33VWXDI1/OhUIoJltJvHf
	TfPrEcewioXKIBeM/K9ZAU9HIb9xyCJgplFQ3hwmkbGSrd9MOiYqfuW1qZc3BotIaGYQSJLRJmT
	WjqJv73QSeISYf2zjKNUBExExhFdc6sDLKopGiNVRVTa5Wga8GBTxnEZe51qL/fzMlL8/w1KTVX
	ODCnrswkh8MTYdcSxV9LoSAEMnGbu9irWjZ1AuVYnVweRf3q372x4soNBzT3/FpklL9WOWsWW9l
	mCqCEmD87wHUaCbHCfqxfEx/sg6k0diJ7egKiv2rDKCthHd4r+EVVpLJ/TuOc=
X-Received: by 2002:a05:6000:400f:b0:486:f856:1975 with SMTP id ffacd0b85a97d-48872a7ed6emr10250041f8f.22.1790340489018;
        Fri, 25 Sep 2026 05:48:09 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a36189bsm6670499f8f.21.2026.09.25.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:48:08 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Koby Elbaz <koby.elbaz@intel.com>,
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH 0/2] accel: Replace deprecated create_singlethread_workqueue
Date: Fri, 25 Sep 2026 15:48:02 +0300
Message-ID: <20260925124804.58808-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi maintainers,

This patch series replaces the deprecated create_singlethread_workqueue()
with the more efficient alloc_ordered_workqueue() in the amdxdna and
habanalabs accel drivers.

Both patches have been compile tested with W=1 and produce no warnings.

Best regards,
George

George Karagounis (2):
  accel/amdxdna: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue
  accel/habanalabs: Replace create_singlethread_workqueue with
    alloc_ordered_workqueue

 drivers/accel/amdxdna/amdxdna_mailbox.c  | 2 +-
 drivers/accel/habanalabs/common/device.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.55.0

