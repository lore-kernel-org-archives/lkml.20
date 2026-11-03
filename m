Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709428;
	b=SMHWN1bgDo/czFDd8PewSpANLEolhswZOKjh3Ju4hb4lTXp2ERa1Exaz9t8vgp0agS/0
	 2IRthnuWfNuHC22uO760jC56UR2hokRVYzU4dl2u3yqWb4Hg/JmPKY/D/pCFHDEEhBJcJ
	 c9GsLnI5HUIieo16FbTmCtJNdAdKsFx4A1blYqb9vdzb7xRl7/9Ak90XvEovYujrosLEI
	 O/by1aou0HtT8YOtmJhE+Y/zj7Cu1heGzdGl8JC0irizDK0ue8NZWBsHL2rb+gMS3md+Z
	 xAUXmt6xTPjWYp3hQbIeIDbQ7FFHQPs5j+IaCTlG6u877e4frZaI9s5oPKUtC8S9Trw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709428;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=9yi6gOIzZud2vd+UmqWufIHcf5N7plfF2wRET9ypfz4=;
	b=su1u5M51YK540FW2NoWo1w1shbiu4jkYPw59fv8ox+JEO1ATk8uUCO506yMfLkLWqM6b
	 XxLiXL4jwAsuN46gqr5ctFGvwhBddiAP2Ym1Je1b9cn/lEC/MSCMgGRBA2upLQib9aJGq
	 ZDkyXkA8vonU+YoqLTIarH/g6jSA15vbdTTuzqPZWAfuPUPgvK7a0HWP6EUBQC+/+m3rq
	 QwiS0nYZLJWUcCC3tX6syQO4RucvWSAybVS4nhby2PR9k4pLkv0llFiAX7KNzolIbgffv
	 Nwr/5a+lrckH8mZ5SwHkacsK9gxlbmC1y95UmMYIlnlnRbsIkuIqh1ca/FxsPK92P2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f0hXN4Rb;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C0606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5C0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f0hXN4Rb
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so366325a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:37:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709427; x=1794314227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9yi6gOIzZud2vd+UmqWufIHcf5N7plfF2wRET9ypfz4=;
        b=NWbWxKjnvzKerl3tsu5zwoWIVJgOsHEclPkFEcEBDF61l0dh86yiEhbVd9sp2cFg8F
         fPrjZnN0Q4NzZBzqB7JijethaRerY9F9K7cGsB+yUt7F3CYLmywY5WPlXI3331BEtPjb
         VTFMTr+2zlKV/iFrNlS6fjNFS+1Dp5NcUrCfm6zGR8wmAWCFDAHiVpyucneF76wiNn05
         /qhZPff/2UTZBhBjpRdZP4gka8wz/tofZtGQeVO9U3KxeZj2Itc79DG5yzF2n2n7GIEW
         O2qZYh9wk0IHrHgW/Cydcf1qSLF3VQkxxRSw0Iu3rn7fKGpp9UBMgoXZVipJkX03Eo6i
         eC4A==
X-Forwarded-Encrypted: i=1; AKwUvByeatfF64CnNjuHBYgNpCkrgQCbCCApZLavLb4QBLyXBlQkM6kT/ufzABumnmrQgoqEZJwdfzMa5nbemXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JzhsbDySIKA1zx4kbmjs7hA5TZb4xcFmafou3zcY9A+nGCpHe
	otBvwdB2PJw9yr7jIFgXw1euG8W8QWjRS65SoocrueDcQ9oH7/yeBxnfZ1bgxxaeLXPO/kDMLar
	I9soub36IHkwrMW+0q1Kp95CnYDSamGUpbsDixweh0bI9uNNhhx5XenV77VsP3DyBUaGvOhMKoS
	CktgvPTQFdNuF0+H8m2wLZCaV1Qk4EcK5RNZCmP4r4BdKDtNIcgjrbN2xW49p+xonEIWmRviTFj
	BIRjMkYS/a+gHq5rQ==
X-Gm-Gg: AYBFou03WZR/W9N+WuJVSdZXSuzlFv820Jf3a9aRsaoXQCqmMNdUM14Nv1PKx9r8pQ8
	jaSagDH0OELJFGu0PVV7xSsKms3TgvSaKd3ugRF3UutdCiscefKRto4iwIBSXTCaPwyH8XwBlbo
	PI3sTsZT2SBFpfA5F1WW/K3PjebD+xU3/Rz9cxuF+yz4/QeGLXO7tnDTJZjWhRJyFEtRjMcM1xy
	z/cf/Q+ulL56bxZW3gbYnvnMi+9pMysQfHOtEk2QRnKu1PHpf+zoP7Kpz9jDs1FzayzYCOUoQCf
	VECej+N3Giff7b/3OKWTHMMbK+LrCIB8Z0dXcqdqFLfoqz31z1jAZehwJ6CTpRcHh8PGHT7jb7N
	PGJai+TLLh7mgUdFcbDD/HQUWhJcnsjJ3qlO9lN9E5pBDKyUxpIcK6oeiympt/V6EraU8/4fh1/
	1mMuHG4bIgs7qakVaXOeLqKiEu/IR/0Zk8DA==
X-Received: by 2002:a17:90b:5624:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3ae89758b67mr7048859a91.27.1793709426572;
        Tue, 03 Nov 2026 04:37:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07c9d77b9sm1765891a91.4.2026.11.03.04.37.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:37:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so546759a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793709425; x=1794314225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9yi6gOIzZud2vd+UmqWufIHcf5N7plfF2wRET9ypfz4=;
        b=f0hXN4RbdL6zPEUC10ej/8zR7cpZbOaUlNQHaaDqFHwO6tcUUFa5s0hKQyz0e0+xaH
         MNTXl8PKqME8UErtvqsYeiRqL1ydAu4c1M8YLUQbl/hTrp86LwTBtjPNEc95ClV0vlUL
         yEbMvS/jbraRPxcdLaMojFEbPqrIzkTWspoqk=
X-Forwarded-Encrypted: i=1; AKwUvByfYARpfFlFUGIW6ep1ze8TT7rvWA1oERNc/1gcbQARvwIDfUg+P7UfGmPY7oLoDomiDRHPzvuHhgPZhVo=@vger.kernel.org
X-Received: by 2002:a17:90b:5687:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3ae897c71e8mr6445129a91.39.1793709424725;
        Tue, 03 Nov 2026 04:37:04 -0800 (PST)
X-Received: by 2002:a17:90b:5687:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3ae897c71e8mr6445114a91.39.1793709424283;
        Tue, 03 Nov 2026 04:37:04 -0800 (PST)
Received: from H5-S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b08759344dsm2131567a91.13.2026.11.03.04.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:37:03 -0800 (PST)
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
Subject: [PATCH net-next v5 00/10] add features to bnge
Date: Tue,  3 Nov 2026 18:06:40 +0530
Message-ID: <20261103123651.442893-1-vikas.gupta@broadcom.com>
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
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   13 +-
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 1126 +++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.c  |  775 ++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_filter.h  |  129 ++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |  170 ++-
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.h    |    8 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  513 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   94 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.c    |  128 +-
 .../net/ethernet/broadcom/bnge/bnge_resc.h    |    1 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.c    |  378 ++++++
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   96 ++
 13 files changed, 3115 insertions(+), 320 deletions(-)
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_filter.h
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.c
 create mode 100644 drivers/net/ethernet/broadcom/bnge/bnge_vnic.h

-- 
2.52.0

