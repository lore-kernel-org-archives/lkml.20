Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A863D3CED
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627562; cv=none; b=BR4ckJ4YIWqliEJu/jsYIq7P1B/tGKZzqjfap4uqFb8KhL6p2CGnRkMow+6/lpEEqC7vNsOl6nHZsrIeZUp2/Q5VQW61Ftc3lL6Cm/XimfkaTtr+R9RAtyoEyI1vZ+8UOEN1T+Aj2g05+Wt9TOwLgn1KkKw2oo+m8S7WNSx01OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627562; c=relaxed/simple;
	bh=/UrTQiKP0ibGSC02CQR9xfmG9rEJrn04OlPMGKCo5VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ni3vavxf5aImL9gAwDWEpZ05yPu47UGnHa2NgJOoCpPPpQQ/LVO7ngiWjJnv5bxc2hoipVmJzFlw7SFdteCuvWLeNbGRFBHIdYHiL3YYxA9ORrFJAAD9QaPHk1tXkyc5NAefnxD8YTJ5F70IkJ+sqiw0KiCCAt4XQEsdgTPYohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PwSoyhXm; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PwSoyhXm"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2db858d60e0so1683395ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627560; x=1790232360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VJRXW9HWWl052ti3LILT2PBsoHZ9dSMO5khZPdV6FEI=;
        b=jgzv3PH32YaQy7Lf4MumywoZA1SNl0yLttN9K4W9qSM0sO0O1A4IgCQJDo+hwQbDRL
         9IKUb5mDKA2crBJAvyCxFvp/o3+bIqKIaeziignvMPKuGRn8/WmnZy/IqyFdVrpwqfxh
         7f1Xt+htp5+/PjYfT2v001wRQrjmAliDL275rc9tSTE+nqhBSoLHUuAHrUntQgBG+Kak
         BXLijvyy/Q3+hkqvGtoUvOshZF9B175dVqHt1B9PDTlTQtYW14utQrd3AIn14HVJp0aU
         ckAypAQ+WBrb3ArpOTHs2jlNEaqu8pps5PKhgQ6Q1afGj5FV2A8MlCQnzz0J+Azr2LVw
         qdYw==
X-Forwarded-Encrypted: i=1; AKwUvBwkoGsiI0k++IjxejOyKyBjU8/i9DbYcx2FFd5P8nZ2MoOqbMWK2GDOxnS5rliIP6cDsFdJcwGp5jXZ0a4=@vger.kernel.org
X-Gm-Message-State: AFuF++lkUa809wpHzxRLnFYh2VQjCoZ808Yh3HyDF63mVVrU7XvQEl7V
	4k4zzJtRBiwwPuMwPz8IEtecttm/ddpKwTFtF9xZRj7MOG/VcVIan6+WVTWlVB7hQKxDPKWhtkt
	Gm+V6t+8KY4CKbiUjDSB+4ijT8Olhya8pHhoql8vVzZLfOM4X9LkLuBV597szgpjIsWEgn2CiZK
	ykzVzcLAcEcwtE838vtz6QY3KcPITn5y7N+QtKwDlxBoXehg3ufAEJGwnOv/iHmSTyJY9k2AUok
	Dnsh1yQhZ2z+zQ3ug==
X-Gm-Gg: AYBFou3lXeJkAmhiK2FTBHeujF4dqrxrk6+ccKlCKSvOJRkqxr5L+FjqjB8GiKOmQf7
	WOJhKluqYMpb1XJR4glhqQhCW59Mvnzefo/n3d2hRUs2R9VcR8L+kzNMP9HfvL3JgsSdXy5aQW3
	ikSdFyX+I1ET1yJe/iKKOROLeibsW8Lsk3ik7wucVxLusZR2Uc1f5rK2xUaKbbrWTTYkFWocUzP
	cdLgZ7EI3a6dNO0TazLZZZuTfAQGKX79b2H6F5MRyP+urOnN3AixSnjP7k//Eatkw0yfWZcS9W8
	8k4Ozs2v2QRHVGIhFChAEzwaKH6lv7bwQOnVjtGXqWge4F8CWJjaQJnkOxle3umz1Ph1kfkPCNG
	J5KGJsespW4qf6AJ+C0Hphf+vksZGnJG30xK2vRObxnEHSBu7R8cTw8PogO/C14A1jm2TPtqLQJ
	y0GkscZyKbdtLelQcThuK6XS8Ct/CBwouT+v+0
X-Received: by 2002:a17:90a:6096:b0:39e:1fb7:5676 with SMTP id 98e67ed59e1d1-39e1fb757f8mr8428898a91.5.1789627559917;
        Wed, 16 Sep 2026 23:45:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39e35da8d7csm1103195a91.2.2026.09.16.23.45.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:45:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc2229450b4so455050a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789627558; x=1790232358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VJRXW9HWWl052ti3LILT2PBsoHZ9dSMO5khZPdV6FEI=;
        b=PwSoyhXmGYaTq7Ng5/y3R4dDf6VDqn44pZkXBy4Ppop9LjK7i2rHHNOdV31ldIdbkX
         7C8KHvQ/r1SbrJvrudyDV2L4YGWn5JUa3CYbMKjJj+2fI+fQTdMAL39BddL0B+M+QzdZ
         8C3vyHUSOGIBI8sBALc0zfjdLKX80J3E66Ebk=
X-Forwarded-Encrypted: i=1; AKwUvBzNjx2p0M+8XTJto+vxjR/Vzq2R0LrSxNocV/W9gZv8+mbLZD7jEAfff2QMaUBacxBrbcoVx8tJ5T23ui8=@vger.kernel.org
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr15018565637.28.1789627558203;
        Wed, 16 Sep 2026 23:45:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr15018507637.28.1789627557772;
        Wed, 16 Sep 2026 23:45:57 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm2754293a12.20.2026.09.16.23.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:45:57 -0700 (PDT)
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
Subject: [net-next, v3 00/11] add features to bnge
Date: Thu, 17 Sep 2026 12:15:37 +0530
Message-ID: <20260917064548.773334-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
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

v2->v3:
   - Build fix.
   - Addressed comments from Sashiko
    https://sashiko.dev/#/patchset/20260908093053.2596020-1-vikas.gupta%40broadcom.com
    Below Sashiko comments are not valid:
     Patch-8: 
                Comment under bnge_toeplitz().
                 Explanation: bnge_toeplitz() is not used for aRFS.
     Patch-9:
                Comment regarding bnge_clear_usr_fltrs().
                 Explanation:
                  Both bnge_clear_usr_fltrs() (only invoked while the
                  interface is down) and bnge_grxclsrule() execute
                  under the netdev instance lock, so they are
                  serialized and never touch the filter list at the 
                  same time.
      Patch-10: 
                Comment "Does this direct dereference of the MAC
                header need a linearization ...".
                 Explanation: ndo_rx_flow_steer runs on the RX path
                after eth_type_trans(), which already accesses and
                pulls the Ethernet header.

                Comment Related to bnge_cfg_ntp_filters().
                 Explanation:
                   bnge_cfg_ntp_filters() runs from bnge_sp_task(),
                   which holds the netdev instance lock while executing.
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

 drivers/net/ethernet/broadcom/bnge/Makefile   |    4 +-
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   20 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1030 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  684 +++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  123 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  155 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |   10 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  420 ++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   91 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  115 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  284 +++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   91 ++
 include/linux/bnge/hsi.h                      |  136 ++-
 14 files changed, 2868 insertions(+), 296 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

