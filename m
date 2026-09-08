Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60364FDE64
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859898; cv=none; b=gp1SdSVBO/9zx9AGWh9pEZ653N18a+v10bl/aGw0JDzd80OTBuI+DK0RMZDNh3JmsFU5K8RwBhUdfdPFbKrLkO9grP7QmKV4/dmqYfw6IIwbRewdEf8ZJrCxAyUt0tDM8VgJG+JYLjhEk9JEhcHOWluBCuKQS4oMr6D5PfQuRYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859898; c=relaxed/simple;
	bh=r6y+2XF3w/Nq3FYeRd1SJJWJu2qSw2QUOoHNeSVwAhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elk6mqjVfM/KFrN6wl8NfQ9OiLewo01Cj0F0qW9+ek6qYhUCuw1mT+mHpU/l+nUq4+Sb7JTEX2emZiTesAOPNfoGr97EwPCuGrN6jUsczkhKS+ugxUFZ99fiociOh4YshR7WgTQvMnBtYXsb4BaqmdUSQGQX2fEa+9dEJNvZJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Pwwcfd8z; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Pwwcfd8z"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2cc891373e0so45644635ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859896; x=1789464696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=netHJ9lyAcbXzjolOOikFRYCS8ocsEKzFL/kWM9D9EU=;
        b=Uo9cPHt+aIx+Z54uD+t3Trtr50AZLI2+EqPvl8VDKqw6v1hW+z8BnPUP8LrcWYAHKJ
         WG+kWISC82HMrbSqfXEj1Rbv72l6qfVsdRUU4RxjvdsqGICcw9LWe2bUchcR0NsjCCKc
         ZJ9vY6HyP7v0fRy+lmWX6VIacn8HZxYGouHr2iNDlui+WKzVbELZX82F/zucn2AjA/gu
         hhvYL+hgfRiLe0D/wJJmi6rqLMp6sl3PZoUru1h/e6yr/WLbeualo7sZTN3SKG+0fyqU
         hKNHMgMOZl1HV9w3tuQd/oZrI1fjpnJemrdmRxhx+RE6cgEn8C9Ry6xJAIp9DB/WksrM
         Qiqw==
X-Forwarded-Encrypted: i=1; AKwUvBxYlrwoxf+utg/zhppmAXxUbEfXDA126su75GUQkrDomiXIcbp28TWr0zbDkr8NY43ydqYwThjhY6NT6Sc=@vger.kernel.org
X-Gm-Message-State: AFuF++kr7r0nUEdu5iuaTNcAkF79YQrNQz/pHKKUZHi2mNF1q9Y7C52A
	oFDZU3xiNjnBmyBjNvgy8lPsKdtf8hX5S+uH6F5PGDoYqO/ucfNtDvgcanfhuXP/Wwxt9MCjB/O
	wA1nxT2SMyvwpwf8BoG+7D/4GjxiqsG80B6OO4OiQTs2qbNbs/Z9xiMWMjY7VGGM746ayjNkZeP
	zR3FGEzgK+DdYDLPdw0LGl39g+Wr2YCildCsUQlM/0IC8cbq7AXNp3ubHoP3Sa4iXJ9Ph+9cc63
	wSEYu5UEcymG+POfA==
X-Gm-Gg: AYBFou2oC029+QFypw63+FUsj9HROXgyjBclo1Q/vcnQGU/9pV3ZUTbYpU8GGSV1vSX
	RoXrg430K6v/xpdBbdvvyFagIFohk92d34ctBYY2Ui6z8t621DQJTbONrewMcYzb1qHVhrp2Csd
	S8nzGMmnRLwAekVQKnPDc5F7tP5JuxPpbsYHg1wEcAUcFydVzpHRn5brTPWhuu9IwHyZLDD+Ov8
	jjGEhZfD/FtRb6EAg2nJPiwNwWCOHVQ4u53sn1epEIfNU/WEcGNgIda0M5zMkGH5pJaBT5wAbWL
	/P7WQCXxt5cfD/kGsos7Nje+8aJcmdyRArhFGPvexswBMo1h3m4ITeTFRz9+UKiVT5/2one61PJ
	Pbp9Dv5l3o9emo6i9wRSTixKkk8rkZk55W33cASSPOwiDkS9LlbkvR+u6/VdGWKlqiO0aqrz4Xj
	H2hI/h8L7gP0NSKniS/Sv14U9TUeNSTBI=
X-Received: by 2002:a17:90b:4d87:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39b26100bfdmr38020659a91.6.1788859896047;
        Tue, 08 Sep 2026 02:31:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b260deb5esm8243836a91.3.2026.09.08.02.31.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:31:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1344914a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788859894; x=1789464694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=netHJ9lyAcbXzjolOOikFRYCS8ocsEKzFL/kWM9D9EU=;
        b=Pwwcfd8zHqryyTmO6LqSlrrq9YJ0zzhEvO5TD7jbD9TPb5sbbX40YgkwmTtBZwsnPI
         RH4uIkW4cDp6OcKoO3mmb3qytcgnWTDi1lJwcfdJRcVicJmYU6pB84Id/pbY6l4tOjdH
         h6wnXd4FUVUgCYqJElkNcAn2llp4xYmSZ4Huo=
X-Forwarded-Encrypted: i=1; AKwUvBx1FoUvm1jObu6Dr1rvTFBdOkwMFQUN1ONkdqQ4+lNaPGnbLUdolkUTHKdA+DmSbILAWVoGg519UJ55fug=@vger.kernel.org
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr42036788a91.8.1788859891001;
        Tue, 08 Sep 2026 02:31:31 -0700 (PDT)
X-Received: by 2002:a17:90b:3b52:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-39b26101d25mr42036176a91.8.1788859872058;
        Tue, 08 Sep 2026 02:31:12 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm31493316a91.11.2026.09.08.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:31:11 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [net-next, v2 00/11] add features to bnge
Date: Tue,  8 Sep 2026 15:00:42 +0530
Message-ID: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi,

This series adds ntuple filter, RSS context, and flow steering
support to bnge driver.
Patch 2 is a pure refactor (no functional change) that relocates the
filter and VNIC related code into the appropriate files. Patch 7 drops
the refcount usage from L2 filters, also with no functional change.
The subsequent patches then add the ethtool commands for configuring 
ntuple flows and RSS contexts.

Thanks,
Vikas

v1->v2:
   - Build fixes.
   - Addressed comments from Sashiko
   https://sashiko.dev/#/patchset/20260814011435.194631-1-vikas.gupta%40broadcom.com

Vikas Gupta (11):
  bnge: update HSI
  bnge: restructure VNIC and filter code
  bnge: add NTUPLE/ARFS VNIC
  bnge: add helper functions for multi RSS contexts
  bnge: add RXFH ethtool support
  bnge: add ethtool support to manage RSS contexts
  bnge: remove refcount from L2 filter
  bnge: add NTUPLE filter infrastructure
  bnge: add NTUPLE filter support in ethtool
  bnge: add aRFS flow steering ndo support
  bnge: add cpu_rmap support for IRQ affinity

 drivers/net/ethernet/broadcom/bnge/Makefile   |   4 +-
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  15 +-
 .../net/ethernet/broadcom/bnge/bnge_core.c    |   7 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 996 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  | 668 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  | 123 +++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    | 182 +++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |  10 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 406 +++----
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |  91 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 119 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |   1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    | 272 +++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |  91 ++
 include/linux/bnge/hsi.h                      | 136 ++-
 15 files changed, 2828 insertions(+), 293 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.47.1

