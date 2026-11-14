Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794642474;
	b=CNZJEBh4+a7ydWEHsWWOCk8gt4u+TkdeVr6imZGhSpXbM7hhjICNY3VJpDnNd1G/0CY7
	 cH/9anDsI6GN2cDZwhw4Riv+C+BlMG2+3z7uQeYkmbbpkDiFXHRmXGZX11el7TapEuSs9
	 Y3EoT0wssFsgWSRUjWft43coeyTZmoi84QADGMpRIgg/5z5aFgdLoujSQCStB+gDpAWnp
	 fS0c2SLmkQq2l9gWYbuuSSA/eJYbV5GfSU7l1L/jBM0mUt8yngv6N6aFuFdptTAQ8+HKB
	 r0COVtNJOLs7oY9saikXqIVFjBRZCm069iBaK9zGA92NUFDk8Nca4QN7Zgb/zGqQMAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794642474;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=gVvQnD3Ao7aYmekOSgIv2NqBMYbDg5gxg5h/9henKKg=;
	b=h4wDVs1GZ2XxKFI+h64gPDKtQgxBSNxA56WRcHoczTj3oOzOXn4i5yUCvcUFNQ5+40v1
	 Y1JnMu3GLc5DV472eg7YUP4Vr7W0Y4FMTcNJS2XB1VGcFB5YKq+jDMxrsR2ftJNK/Y4pl
	 0jnmm8lPUOwzI5KXGYPqnVd3IDf1fuZ0BCAEG0s7hklmkTVkeb6hNXeoI6eZBQKrxhuWb
	 ogQCQgAgmQt2Ww1laOFQkaLpDZm9QrFKX25sP5reGgh5SL/fa7TlmhDL9c8xk2qoe4uqk
	 3Fswc7tWCGqVdmqZzaLFrLvcxdn6rNLrzmMWzSMtHvYP6Zk6VcCoBTo+UKusysqgW9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gHvL7rzS;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12A4606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12A4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gHvL7rzS
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so1452827a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794642473; x=1795247273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gVvQnD3Ao7aYmekOSgIv2NqBMYbDg5gxg5h/9henKKg=;
        b=2iGO8adWQB89R3u/GJUEvU1fMd8g3O2eTnAU9h22k/ShDd99vZtO3UvTS28FexW6TS
         VZIce6SrOz1nAFUhgCwnAvsEp7WZAGPwU0Xd3uXHVT4L5tQRp6rY0VPEOynfSlmY6/nZ
         ejIQngXpFDRzpaNgGZbCpaKbeSFDiqAizKJSRoa3RntcHF2NKQhAs5298+wYfaJRhwSi
         RHeOLhdiPsJf0m14vIC2QY0NYHxDMa7iLOlokZhLBfhPDSadCBpQlMg0xzlwpYCC4OJ0
         JojmXsIhZOWiLionwr/ujluVP59FqcHWpkC0xWDRMXFROczPk2ajR6VK7gCI2YCLl/xL
         QjHg==
X-Forwarded-Encrypted: i=1; AL+hErEPHHyBFZlv8iXuVoht8pF8TUnry4vlll5fFYIXE5Xy2jT1j5oavvRpN2xdrJ8QDXHLy7sv9G3Ep5XWukw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+s3/sKRJiJdIYPtX8bR60hIif9zxOeCip0HKbQ4lw2H9/YETCG
	7NvreozTEoxLUjQ3Iv2TUUQD+rSmMgY3K/QBBZgXWStNSMBMZBkyGVTvWxRL3o/IpxtqdWbU7r8
	a6WGj0/JwXbBQaKIomW9Xl4fwHj8aP69Obrckvx8QpX0JaMvspF5jjJQr7K3W7+lZSaCeToqFjs
	2NjD+s3wn/PiAzSwfyV9wgDp4clQV9g2jdN7KqJ0rSIkCuORyYKX+EKvqqbyoN/HrS1LgG8+Cxd
	tAs/9qgWaHxeo0nUg==
X-Gm-Gg: AYBFou1lLDCkBVpLF0pk3Wg9j4Xmro68tCZx0g7LwhT1sOu9C2UUffl3QDXdmNmQvV0
	BUEZx3mL8vOhDuH8frmyvq2/eFO0RwvsWA1I4BNzd2jS1zqF+Xv5P2uIueIG0cTxwsB9qqYNdBT
	gTPnQxibQxnohk1FLoIOdiA8CBNbNYIo57Vf9EvYjQjWqhQRWMAHGPjR4u4SQsOpGEYI35/KpR5
	tgBKS8k/xTMRrC3ZM21BI6linvxDUDwuiUTgXA5s/S7j5sr4l4i8CrZFuVcqIxtAFyPbukorzte
	afbnw3hsi3FXVHLQX//JFEgvGpZi36/GzQ0Yme/Bqcwjv7rDXHyLBmo/LwbBI6R//dhDf5H6urK
	Rsm24RAA0s0msLQAdDhM8a7MAT3O7ljoR2foUur2EwononaYFmUAYf8nqDA==
X-Received: by 2002:a17:90a:e7c9:b0:3b0:ce1d:3398 with SMTP id 98e67ed59e1d1-3b1b09f3b5bmr5191351a91.18.1794642473140;
        Fri, 13 Nov 2026 23:47:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae9bbffcsm6820355a91.8.2026.11.13.23.47.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:47:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1531941c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794642471; x=1795247271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVvQnD3Ao7aYmekOSgIv2NqBMYbDg5gxg5h/9henKKg=;
        b=gHvL7rzSjHDEsPCzQ8C7iyia6L8UAg2IZWCht8BdRJpeDU0Mm3CrECO+VrUamO4F8T
         NqvuGNjy24pSsIbTlgyLYzR1XnJo0ImEoUVRLsWpus25YJz7uN5GeBF+f422LYP6BuNp
         AnfMGAa+8aIKySfEo6Yo00jL57RKfyzTflQQA=
X-Forwarded-Encrypted: i=1; AL+hErENDElh5M7q1QwaOVJa8WxuZ5vCGdr2d2dZrSgIDtK4jRAgv5NoHmjUFbOf9ke4z1f2JMeBP+43MkvfDw0=@vger.kernel.org
X-Received: by 2002:a05:7022:f97:b0:1a7:216d:157c with SMTP id a92af1059eb24-1b503175931mr7756863c88.34.1794642471261;
        Fri, 13 Nov 2026 23:47:51 -0800 (PST)
X-Received: by 2002:a05:7022:f97:b0:1a7:216d:157c with SMTP id a92af1059eb24-1b503175931mr7756793c88.34.1794642470355;
        Fri, 13 Nov 2026 23:47:50 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm23620914eec.21.2026.11.13.23.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:47:49 -0800 (PST)
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
Subject: [PATCH net-next v7 00/10] add features to bnge
Date: Sat, 14 Nov 2026 13:17:32 +0530
Message-ID: <20261114074742.1484603-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

v6-v7:
    - Addressed valid comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com
      https://sashiko.dev/#/patchset/20261106093524.838341-1-vikas.gupta%40broadcom.com

v5->v6:
    - Addressed comments from Sashiko
      https://sashiko.dev/#/patchset/20261103123651.442893-1-vikas.gupta%40broadcom.com
    - Fix inline keyword use in C file.

v4->v5:
    - Addressed comments from Sashiko
      https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260928061307.1172344-1-vikas.gupta%40broadcom.com

v3->v4:
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
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   28 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1145 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  838 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  137 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  192 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    9 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  551 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  160 ++-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  379 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3276 insertions(+), 358 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

