Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B90501F3A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539469; cv=none; b=JoMYnc/L7s76gy8MhLpJfWww9FIUONsfhZvHuj5pZ3A+0ec3tD2Dc+Pqq5znRbdkdZtDOFnWkprcWaeeeZsz/pmogXA+s3tCVUGZCwpCJU5Vcv2U/PAYiKsEcV7Ap/2gd2HQ5P+X/I6R4Jq3vxWOmfqfeQtLmt6c3gtZMPzQT+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539469; c=relaxed/simple;
	bh=BRtus3WijRKxop17C3IlkNpfnbhJFmybZrEroOANEU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8qQp36ocTW6RDycKBEifipk+BXYrJ2SMdOyO+WZFq9Thn43s7HGYmP1YovGZrTWKfZyEbzJKEIUQUDD2sMcHn1Y9VBzAjMEyCI4y68vreonnUKr2fQ/U2jv5BG1IBf7wtDwreNkUGtVudBtvvnoDDuReWNJ8Gvy/jQWYPAU3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkMyqC9s; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkMyqC9s"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e041ea211so1002680a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539466; x=1789144266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn24/hQ8WxHkOsr+OJr9JovsNTvE+u6NKHbDOA+BSjg=;
        b=GkMyqC9srbI1v0hDJgBDiTNGgg7bGFyE5AWVwRNWAxLu9exT4alynzHk8O8YAnZlFV
         IIMOFYadMsPVUiTTjUsjpWjyjG8QS/SgIqpVJVOQJ1lryACKAG1BFb+xEcx4MNJ3aUE6
         w19JAwKX7b14jv5Dz9fuosuk9aU6vPjG0r3ANDd8BS6nXFlgmF/QKOOhL/gCOGIaWh46
         NYV71WtmqtXXSGAb2LIFLqtRBoIY40L0OSjNUv2qMl0IjYxdEYqtexzeRWZhhiR+ytzk
         QWuNcnNvNyepgZaQYOrH3ZQM7WaEO5OKZfOD1S66hB7iyXo1AaC2lT8Uz7wMETMzGNYb
         R3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539466; x=1789144266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn24/hQ8WxHkOsr+OJr9JovsNTvE+u6NKHbDOA+BSjg=;
        b=VDQj+Kf/dE1otCmL3uxv1qp2/0qCfo//iknMqI+A0x78l/RKZBWMkh4M1D+9G8yBO4
         ira+vBJDstGCouKRlY4ShVjwot3kYjHrHADibfZ+xEOVMbVjpilKZTT0Oaosy/Nar/VM
         PfPoK+9EcfNoFIBkfIZDZh5JaXicZ/F+EWc7bUcgq1saoLLaWQBgu0By5bZXUqLyYQ3b
         oUnceTMKV3oDxENJM3BqX/KaClDom0koNlIUibpbPCOGEHwQDTZHQ513NXVDdOXWdBmS
         JrxX8fqcDP5sTIgfEPbcKRGDITGZ8JfXM82IrzENQAnXt9v4SYOXNz6ERpQzta50Jcpm
         +IBQ==
X-Forwarded-Encrypted: i=1; AKwUvBynJA+PxVApCzwUwxNLzGE6VznAMMRNCsVgv8fVUhHpot3EEYl4FxQZFOCfxEkClA7E0GBH0udhfjFMgh8=@vger.kernel.org
X-Gm-Message-State: AFuF++npRuuRPRsuqw0XpRHC/nO7AGLbLMaAQ/dSkA2A+YCbCrqTieGk
	Zv+aJRzoW6FYogWqeV1sCFEo/4G5hOQET/7KBQ/HhvZ+ZF5Aidx9MJGz4t6eOcy7
X-Gm-Gg: AYBFou2I742qPMytKn1jT6E1v4O4nfwdDNvJPDw036QwJvT4kqkiVGMfDXvBRSIwKd6
	iW8nwtlmGB2SGloyXPGnVEV4as88oz1eH2ujZSaoORdLI1fFC8pvKOGMUYiMPtLQUVX6UGXthtm
	1d68Pwgdz7Csn6U3OaYYpBBqCRB7BW8RKIkxqMtrs9T8D9Isk4tD/+njMdkGOtLo6Cb8Xv6iwZG
	qSVsnkmOpT0ULyvKamOlGsaiWTM1EE57MyUEj2ug7NVqu/n3EqrIPPbNLvlPP8zczZt7oi4+OBh
	OzJ9e1Hr4iy0BsFgyu8qSVEc/oh/xL6nwyn4ayaCJ8XKF0WpUVtG1fc7x2LNTckie5D3PaXCwZk
	xZgc2DGmlV2/geBTbzzu0To+vIpmt77z7Wsk++g/QXrYK2tgww9clA276uHUybxYB+GWxFJuOr4
	n2WsQlqJHf8gMsFlsFGpSVdYOLQk8D1HMZ5y7Jm33y8oeUZw6uoL+olNc7eWelldo8zTP7oXFUp
	750mJNhDCdVqcM=
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr11728166a91.18.1788539465405;
        Fri, 04 Sep 2026 09:31:05 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661b:3050::4d0:46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm5383010a91.0.2026.09.04.09.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:31:04 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/6] net: dsa: motorcomm: MIB fixup
Date: Sat,  5 Sep 2026 00:29:42 +0800
Message-ID: <20260904162952.709368-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix (theoretical) MIB inconsistency and prepare for new devices. No new
features are introduced.

v2:
  - split patches
v1: https://lore.kernel.org/r/20260903143514.532023-1-mmyangfl@gmail.com

David Yang (6):
  net: dsa: motorcomm: Rename MIB stuffs
  net: dsa: motorcomm: Split MIB buffers
  net: dsa: motorcomm: Split MIB module
  net: dsa: motorcomm: Use u64_stats_t for MIB stats
  net: dsa: motorcomm: Fix MIB synchronization
  net: dsa: motorcomm: Use safe 64-bit counter reader

 drivers/net/dsa/motorcomm/Makefile |   1 +
 drivers/net/dsa/motorcomm/chip.c   | 408 +++------------------------
 drivers/net/dsa/motorcomm/chip.h   | 122 +-------
 drivers/net/dsa/motorcomm/mib.c    | 431 +++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/mib.h    | 167 +++++++++++
 drivers/net/dsa/motorcomm/smi.c    |  30 ++
 drivers/net/dsa/motorcomm/smi.h    |   2 +
 7 files changed, 669 insertions(+), 492 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mib.c
 create mode 100644 drivers/net/dsa/motorcomm/mib.h

-- 
2.53.0

