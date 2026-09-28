Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D11413787
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576005; cv=none; b=u7LDTq1ZSfuDxNuDhDXy8qNi4u17onpQQNvX/0Ya2sn9VA564rO0sB5R29ZldZCFfW0M456eu9Hv7cIIBjPwbp0mVB/aiAVo5Ug8pqpRx+3xC8nAkuyQS7j6XZv81iSRmMmwSJyQB9ZGZ13ztS5Rjhstt6N0xYbbEdBnP8Er6aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576005; c=relaxed/simple;
	bh=6tD42cqvdIX5kuE3J6jtYXGA/Dn7Do6Ay0I8SZ+eFkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DSR8OxjoGVV3jKtW1DawZlYUnSbtY0/7tMu2guaTAZZseae5VSI/QGzMBYuIYaLpjQtYoPnGB/BhxEgdEnbnmyrpGRv5J5h0r4J4UwwQfdel0oAc9ui43+f/X1LIZ8p7rkjmhhmTBYkQRLaI931OGlZOy3MAvZPlr8sKpG3Dobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=C8SSlWi4; arc=none smtp.client-ip=74.125.82.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="C8SSlWi4"
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-33fb4680717so3410789eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576000; x=1791180800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XJqX9wReYd0vAQ7JMnmN23yR6lPs88wXppo9VAOKHJo=;
        b=M2+zYOF+cjoo1aHFzYycLUG0gMgieLKLhqWLw+4U43RxDbBqwLZFe57FXRJVm2mWUZ
         5SnJ+0ADSyJDQkl/jZn+CAXm0NwVXvmXFMkHs041UpnFds84GV1/0vRWCJYaOG3eGbvP
         I/1rHfLoldhRaTpzYrI9wsivek8KJqt5WUsMtgVzoN9xNYyLZkgGnbeCTkdhTwcIrkr0
         wmzMC0vHLivdRzxd1kdbgk4ZFE+EZOkiTFUPoxkZpuM/ywZ+enCraCPAavagm82Twc3I
         EJAaI4ev88qIWbUdhrRxcwCcfGks3TOIJJhlbKwLCX4zrsFlBIEsboDeVVzGlmgenJ5j
         VSfg==
X-Forwarded-Encrypted: i=1; AKwUvBx1W4uYmR2jS/JyFZG7/wTFAzleHboyUq9u3mN7UHN9eYBkinFJy+RMP46RW0a6lL9zgnhqrDnay72tuso=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEvf0Q0nDmx12oqHgxvoiwb1oyjvqJWK3XJ/Q/Gj4EXHLGPQDU
	VAaAf2d6x9DAEvoafjso9ii72hNeH0YgQub/65AMRzyFLmhovkz+F3hmVqmDKxAl9y4dfI3URPC
	aw88TTagjuaQrdjb/YriEk/r+UMicwF6wQLBIzpgR5Y7RBwVwbPEka77MMcJ1jaXmP4GaRzecPe
	bl8WPKIqzZyG3uLbyg9mXYdGhpS58Ffsda9Am7r28hdzYwZGXzDb3+pHQJD8KVAvpMVlcgtKlRJ
	MhfYs8YqizDct9Lmw==
X-Gm-Gg: AYBFou1YpHmrp04KEJHAk6TNfqNPtRS72QQMExiS1Tmo2Kv/re1Xb44s1UhQbtvDGeE
	tw8YSxdsvk0mkuayynKCBA9KkRxETteXecPRtFxxMtTlpxGSWSFR8L5F521kaLI5PgouhG6DG0t
	AanEAP/Sxqfpg2iFacWdba4lBL1HiAqZi2yCD0xNgriJbjMadojIot3JU00p9fhaI+Sm02LiumX
	FlcEzC1c2NQgDg+D5OvcasBZ5Rc6MKjxBXSy3kAeUzRdyciS7X9KzPbwgAECbzvw5wUgoET9AWw
	noR+weDSVb1jFfKrWl8l2BNF/LuEMmzT+Vr5LYsDGKxDGLD4AQAb1ReiZN3okUTSD+oSh/bssoh
	3ZHm+VrGWUEM9ZoHErw40nvE5qOrl8T0gBTxmAm2bjlyNpJ6aYcIq0uUfh/ePx4stEO+DbwK1Vs
	zVcxTwHlL6YcYTXq9X8q8D8pBxAsWU1wNiXg==
X-Received: by 2002:a05:7300:3b28:b0:328:2ea5:bd39 with SMTP id 5a478bee46e88-342705b94bcmr13830720eec.4.1790575999603;
        Sun, 27 Sep 2026 23:13:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-341c4b38adfsm79730eec.3.2026.09.27.23.13.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:13:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-142f4306744so7603352c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790575998; x=1791180798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XJqX9wReYd0vAQ7JMnmN23yR6lPs88wXppo9VAOKHJo=;
        b=C8SSlWi408iq4gU3c4exk8c3GPMI0VLjIO2H6i6FX4VbWCJTFFvKA7Cxslrp2dGuvp
         TKHxRqs19Vcx2w5Uep8MEKEggCbAa4hP8tLxsfoxasiYbqxa4OyoC6Nn4VMy6uAoywAb
         wz69CUsRDFXmmrWr2uKv0kFXFoup/PKCsGEHE=
X-Forwarded-Encrypted: i=1; AKwUvBzSyFxtsU8xnnU1Srn9tbrHD9RUgLCxAhAowLW1A+mIzVBcB9Sxxz4d1MgZSNL/V4f56xcPIg+hvMKcUkg=@vger.kernel.org
X-Received: by 2002:a05:701b:4558:20b0:148:4522:560c with SMTP id a92af1059eb24-148452256a6mr5733436c88.11.1790575997756;
        Sun, 27 Sep 2026 23:13:17 -0700 (PDT)
X-Received: by 2002:a05:701b:4558:20b0:148:4522:560c with SMTP id a92af1059eb24-148452256a6mr5733398c88.11.1790575997013;
        Sun, 27 Sep 2026 23:13:17 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-147913a776fsm17355561c88.17.2026.09.27.23.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:13:16 -0700 (PDT)
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
Subject: [net-next, v4 00/10] add features to bnge
Date: Mon, 28 Sep 2026 11:42:57 +0530
Message-ID: <20260928061307.1172344-1-vikas.gupta@broadcom.com>
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
Patch 1 is a pure refactor (no functional change) that relocates the
filter and VNIC related code into the appropriate files. Patch 7 drops
the refcount usage from L2 filters, also with no functional change.
The subsequent patches then add the ethtool commands for configuring 
ntuple flows and RSS contexts.

Thanks,
Vikas

v3-v4:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20260917064548.773334-1-vikas.gupta%40broadcom.com
    - The patch count drops to 10 now that the HSI patches have been merged.

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


Vikas Gupta (10):
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
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   19 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1035 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  684 +++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  126 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  156 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    8 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  479 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   89 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  121 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  291 +++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   92 ++
 13 files changed, 2801 insertions(+), 304 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

