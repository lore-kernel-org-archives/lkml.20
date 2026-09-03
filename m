Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D833263E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788446278; cv=none; b=UPdLZZLY9yFUaUVMjAX+qdm4SeQF76xmacLV6V7dzgS2OccjSyIFZL85A2dJ+Ye/bDjZBB+qL0eCh483g3WyB1yik0If3COSUnnuj5eLs4DDKKaNRcjO1EF84AEvE0jfPVg76J7GE6dMt5oITXQOH+fOz8oRWRtNFgRO4PK4mjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788446278; c=relaxed/simple;
	bh=vw9DD1Vx2E4GZHJgiuMPecbdPEKHD4tuL8+JVNkQCos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MDPYU2fxFGRPhIgSMeeUyMsp7NM5gifQzEWUgFC+y6ebhy8BBFEhthoRmkamnyTJL+YaQmoKWV5MiA8m/JJy3iB8hOG2/ZgRKfOsvJQtzP0OyIIhBAH66+P0w+NG5Y/fwhjmJrd2ifGP9D4cjF0HyehaT8aje37AIoBd1eNjelg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWTRD5ai; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWTRD5ai"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398b3d66515so3118328a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788446271; x=1789051071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUojcmzIkQc1EwQLVUybWEhXvEmtes5ZG7e6dFMsKjI=;
        b=IWTRD5aidknznqkiF+7EDYmth1lMwxtqTFKdbUUXCxfskGB8Yq5a/MP5ZFT5SdsnO+
         aoWmI3XOALl1iMG6OOnMZnpSaRxQC0Sv4guaKW6nyHMBxMJAiNtYwsv9NhM1khXy9PZo
         4JK6Rdv8iMMT0vNRimO/Bjs5fFMPT7vWRKHlvUKvtqI57M8sVf1/IF6WdRxZuAQqUl8g
         o/ohWUvhDSj9KHX5unwKOSaPWSlwCcuGEEwIp+AWgzfnZEk5r49TEOjn6WCPcEby9XXa
         O1GpvVZgthct4u2lnAF7lBT809lJhmbfeLFJw1Nc0EJLOsZkxN7ps4irjVu7etwmA55F
         mjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788446271; x=1789051071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUojcmzIkQc1EwQLVUybWEhXvEmtes5ZG7e6dFMsKjI=;
        b=WRjcku6AzPdfz3xDaYIdUKNvuip0l1QOnctTAMhldtVXBP/ZnvG/Ei0ftNmCGp6z3Y
         4edmgdFjE+pL7H8vYXdfU/B0t0Dt7oo/njBOVuZ/MaNQiz6g7pFMW1+PU7uDnXvcNqjk
         nBdlBvrUcP6c3pJ+KJyg/QkLyfVmkBgJVZAYf3BqmmfU6BPSOhFSL1R7pAtuGAbK5fwR
         sgxXceNAL4APN+nWWiUEat/kzMQQlDcOAhhLuScZSdN0ScyiNmDNTagwsKQa6ik1XOcm
         5kUagtvYXDQI5GVKNiTO+Nxoc1H6GASXUMF1Ul4iZoOtE3uEFweTjqMWyYVPq4A1Wt6O
         fgFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGOyYJn9wmRU81E6ue0bdXdxkzQf75Ud3SbMT3F3XPON67ZmKcrTVQdQaZ5S0L7P6xD2PMH2dDUSHt1l0=@vger.kernel.org
X-Gm-Message-State: AFuF++l+kCen8bVflbeG2ghor2U/CXRIKhG+R7ExckOOGrVMbvqUPepF
	y2Qbbbx1EXPr8IYZeDWC4tGMiroUFDAUfu/mvsDSWsMrlux5ivufVE0D
X-Gm-Gg: AYBFou02LTysCf9cWQvET6qdfnnc4UYVi8znrgao52W3yJVCpalckpANKmRTRu/kWWa
	7znTrllPELh+LsuZigX8etmOrmNIp7/2ONOCmScJ9mhmtlR7g0/5h8zGRHIGYvdhF56xQZ9q9dR
	U7ajtg0Ijry1gepaHd/StXPO6Sa8GZlaykG99mBsXAca1iYtAzhTlUrdHDmaUAjzvy8jzUO0ZmE
	F5RZQGySk2vEYUlVqLhV9xf9g28+SP3C5DWx1wCjB9zVUkG+WtbuSWBpBy0l8CHRrw9y7rglzUu
	VamRKxd34ApeJk1FbpX0678MT+cXXEGYfSmbzOKbo7LTXMzfdXxRf5W4q9VlFVhBTjtIQULuAtm
	APfeN3EgjNuYwf5ZhKEAIrjotfWi4jjFy6rvLLUzSYITvTZKZCVNRdRmZ1/kVUPUnItHgZeUx+B
	FFj8dkIM55BXNIH3KWuOBaq2J/Z3eTN6CLdNJgUWmFECEATgP6csfcGz13r4y4TgYhXDJyVhlfQ
	aVww8NWRkvzlmg=
X-Received: by 2002:a17:90b:2604:b0:398:9c00:29ec with SMTP id 98e67ed59e1d1-39aee1f5fb7mr19772691a91.20.1788446271251;
        Thu, 03 Sep 2026 07:37:51 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae9087d3dsm2741889a91.3.2026.09.03.07.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:37:50 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/4] net: dsa: motorcomm: MIB fixup
Date: Thu,  3 Sep 2026 22:35:05 +0800
Message-ID: <20260903143514.532023-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix (theoretical) MIB inconsistency. No new features are introduced.

David Yang (4):
  net: dsa: motorcomm: Split MIB module
  net: dsa: motorcomm: Split MIB buffers
  net: dsa: motorcomm: Use u64_stats_t for MIB stats
  net: dsa: motorcomm: Use safe 64-bit counter reader

 drivers/net/dsa/motorcomm/Makefile |   1 +
 drivers/net/dsa/motorcomm/chip.c   | 408 +++------------------------
 drivers/net/dsa/motorcomm/chip.h   | 126 +--------
 drivers/net/dsa/motorcomm/mib.c    | 430 +++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/mib.h    | 167 +++++++++++
 drivers/net/dsa/motorcomm/smi.c    |  30 ++
 drivers/net/dsa/motorcomm/smi.h    |   2 +
 7 files changed, 670 insertions(+), 494 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mib.c
 create mode 100644 drivers/net/dsa/motorcomm/mib.h

-- 
2.53.0

