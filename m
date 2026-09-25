Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F70EEC0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790296528; cv=none; b=rSUdPHi0dRhJ2MJdhstWk6xtwGSy57I4BVSyLNxBeP7349BNvZaDOfdarRARGxrqDymBSbMpP0IIW3eVzUMOT1wgbwMs0aPVrmTzd+ra9QTpvTtiWYo15LuUyl5VG+ZwpDamM7L4dKYrrR1NpEPE/zZGpDc4O/fFNBFKs+sfQZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790296528; c=relaxed/simple;
	bh=4lANU3BofogRNYfE4vWKObbLjcbrSe6tKSZmwj46Atg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lhg417roYNfLM0inHeVmpPN2cI96u/tUqI6Irz/VMSO9uFE1anVKF634vAaRWn4dM22yID8weeQfyXBN1Apz2QtdPBOsm9bb1vb+mLEftMcs+CiQSuiuiGDjj5P3q5/BoSgtyITcnulwH0n1QIJ6MJcmJaSh3UqwfzQxrjQqGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9VvcQYA; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9VvcQYA"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6c72bd8a017so233937eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790296525; x=1790901325; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yGf2S7+iIEjxwnQ5sDYTKes+bw7Xvh6I4ay+/HABYvs=;
        b=K9VvcQYAunMFye/m5VZPH6bSBvvUfhlHXaBzqrjQiITIeXR95WltXIDJN7q3PsaVlu
         UH0lkJmO3fSkcVXFDt+ZHBidS3diwRuL+qbl1rRgG/ia0ihQrPYy+U873/m6OoT0I4NF
         q1Cf85fienqso7bfpQIHhPa1xH7w4CDUAbXw6Q9aOOSKgPyxexP2o6TDjy5HMtZmM6cx
         VRFJJhAlXNhU4gb1lkYVfnpv05Bx4lrSDACkELFErRxIN4tR14Hd2NmFapczVHTcn7pk
         AV7IFGldpyHswCgtY8a+5Bd2Rj7I2aN/+R4A0DwjQSiWuWwdWFGQ0E82yvfOXrxckDM4
         nFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296525; x=1790901325;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yGf2S7+iIEjxwnQ5sDYTKes+bw7Xvh6I4ay+/HABYvs=;
        b=M4xPLxpXaiUb4b2Yi2o/4JN49BgA+FNj+hYgaKrQFIHvDBbwStaNbFRptP5fIyA/e8
         2x/STRFZlXUoUdhdhsM/Ij6xDsWyNjPUHjwSOHyKqcqJWuIktZD9NwxmAPsjF9pObqIb
         4+fEtoFfpFurLODljSPbFYBBiUrtpcUmnCMcaD82Rp030eKfMaeMLjriO2ziaa/INS12
         H3yj/quUoEKB8ClEHzHpZTx2+v9TzIsP/QdZCzCPJz1yvArDAZPN6FH5IZAtmjSK1Kjc
         U5rpdIJDwWqnXErc6KKwRqQwfmrWrmxXUnai141tSU0YU6gtZFcnfVW8huHdWX5xuKWW
         Lmtg==
X-Gm-Message-State: AFuF++mDfeV90WXypDeTsV2TcECw8ivWux7JA0xH0wlokTlK2BxBgfYX
	gS68pwiTwnt6OzGJYzl0yPOvHnRNoECb9CWvcdM8DGpHaGMEJPzoHF6I
X-Gm-Gg: AYBFou1sQGO1zZupQDiciZIQfgCicoFPOeWit5Q3eF75VFNwn9mdpGpZ7dOknbVoDas
	um4KR5cjRULSChJT9yQ/23YyLFJ5JHVpCbXPyKm6hcI5HBAtkbyKYk5wB//FiJDAgFVquTgasnp
	BSgBkhxrnE1+WsiLyN9u6jILKvEXP6S/7Yvf7Tj9vh6oQISpy98or4ZQeCP6FhaYntItPxmesEy
	aT1Cd1py/bckjoO0Lv8dk61k6m+dBbITyIXP7pJSPLgAFq9pWkAOILZR5uMBJHMlHZTBvwYe3N3
	UevynQ1OY6eIBV6/3StawXueEjDVQ6qMUPrU1AvCmVWanAZ2nW7pMXdWUPtFfD8e8p4ZCs+6vXi
	G8jC7xRTK9dYTdFzlJyC/p+lP37IgeIMV6Ixw5cZSg8wXgdnI9nmVc0cVFU9xmF8QPE38tJwn1/
	TNFGgXLvf8CTSeW/4NIOqN0wuluGzUZYYn1aEk+8gcMq3he87T6CB1Ofxh9d1ux3IA
X-Received: by 2002:a4a:ee10:0:b0:6c3:616d:efb with SMTP id 006d021491bc7-6d43ebf032emr4594513eaf.17.1790296525381;
        Thu, 24 Sep 2026 17:35:25 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49335c8040dsm894146fac.11.2026.09.24.17.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:35:24 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v2 0/8] eth: mpnic: initial support for Meta
 Platforms NIC
Date: Thu, 24 Sep 2026 17:35:13 -0700
Message-Id: <20260924-linux-mpnic-v2-0-4badc9b58b9e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMHBtWoC/1WNQQqDMBBFryKz7pRktDZ11XsUF0EnOqBREisW8
 e4NdtXl4/Hf3yFyEI5QZTsEXiXK5BPQJYOmt75jlDYxkKJSPbTBQfx7w3H20qBxNtemveXKWUi
 LObCT7ay9wPOCnrcF6mR6icsUPufNqk//KxL9FVeNCikvTVG4lL3TsxutDNdmGqE+juMLPQtjs
 bAAAAA=
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 bpf@vger.kernel.org
X-Mailer: b4 0.13.0

Meta Platforms NIC is the second-generation NIC from Meta. There are
quite a few high-level similarities to fbnic, but all of the CSRs and
descriptors have been reshuffled, and new features have been added.
Since the device is sufficiently different from fbnic, and the design of
our FW is minimal, we have decided a separate driver is appropriate.

Major new features compared to fbnic will take a while to land. This
series includes only the bare-bones Tx/Rx datapath.

Our high-level patch sequence and plan for the upcoming series is:
 1. Core datapath (this series)
 2. Basic offloads, RSS, and counters
 3. Firmware mailbox support
 4. Base ethtool operations

This patch series was prepared in part with these LLM prompts:
https://github.com/kuba-moo/ai-prompts/blob/main/driver-upstreaming-prompts.md

The prompts were used to distill our fully-featured OOT driver into this
minimal Tx/Rx capable upstream driver. We then performed human review on
the output to create this posting. Jakub has made the prompts public in
case people would like to take a look. 

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Changes in v2:
- eth: mpnic: add register init for the device
  - derive the TQS TXB credit limits from the TXB private credit config
  - program the BMC to MAC XOFF threshold (TXB_THRESHOLDS_P0[16])
    instead of the host to BMC one, and drop the now unused
    MPNIC_TXB_BMC_THRESH
  - drop L2_HLEN from the default TWD, it only matters for csum/LSO
- eth: mpnic: implement Tx queue allocation and cleanup
  - add mpnic_nv_irq_trigger()
- eth: mpnic: add a netdevice and basic Tx handling
  - trim the real Tx queue count before register_netdev()
- eth: mpnic: implement Rx queue allocation and cleanup
  - drop an inaccurate comment on mpnic_bdq_desc_unused()
  - drop the unused data_truesize field from struct mpnic_pkt_ctxt
  - trim the real Rx queue count before register_netdev() too
- eth: mpnic: add basic Rx handling
  - skip Rx cleaning and BDQ refill when polled with a budget of 0
    (netpoll), page pool must not be used in that context
  - keep struct mpnic_pkt_ctxt instead of replacing it with a bare
    xdp_buff, and move add_frag_failed into it
  - give each Rx queue only the NAPI budget left over by the previous
    ones instead of the full budget
  - sync Rx buffers for the CPU with page_pool_dma_sync_for_cpu() instead
    of dma_sync_single_range_for_cpu()
- Link to v1: https://lore.kernel.org/r/20260922-linux-mpnic-v1-0-236844f53072@gmail.com

---
Daniel Zahka (7):
      eth: mpnic: add scaffolding for Meta Platforms NIC
      eth: mpnic: allocate MSI-X vectors
      eth: mpnic: implement Tx queue allocation and cleanup
      eth: mpnic: start and stop the Tx HW queues
      eth: mpnic: add a netdevice and basic Tx handling
      eth: mpnic: implement Rx queue allocation and cleanup
      eth: mpnic: add basic Rx handling

Mohsin Bashir (1):
      eth: mpnic: add register init for the device

 drivers/net/ethernet/meta/Kconfig              |   13 +
 drivers/net/ethernet/meta/Makefile             |    1 +
 drivers/net/ethernet/meta/mpnic/Makefile       |   16 +
 drivers/net/ethernet/meta/mpnic/mpnic.h        |   66 ++
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  319 ++++++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  556 ++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_irq.c    |   64 ++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  186 ++++
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.h |   35 +
 drivers/net/ethernet/meta/mpnic/mpnic_pci.c    |  187 ++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 1395 ++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.h   |  151 +++
 12 files changed, 2989 insertions(+)
---
base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
change-id: 20260918-linux-mpnic-8fa318d530fa

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

