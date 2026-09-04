Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F64908BA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526424; cv=none; b=YJmNk/d+lV77kW4CKbL5vRnA0Vk1P0FfKKfAfgEytCxIRtmZDE3c87tVb5BCgseSivuxd1sujy0fR+YQ/IYf2zxYX2NhrQxkOw43bQZSiUSSMU/6n6u08XWwyO/Uj9D6WZ8iQZKnFfRNdBXKIwyYdadbU17P6ecnsdFOq0Oe8CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526424; c=relaxed/simple;
	bh=yjPfhaBcxAXQGGaqhab4hyhaGjwtPFGhfMGgy5UWF+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dzl31/wKsNgQErKZC85PAqxSQSBgHx/lrFMIek7mgsQ0rhR1aKr1rCscx/8ExV2yEAfCAwAw5SqxIx67DfMgsNy6QMt5IJtnbKdADcfOkfy9sLHP/rdQbLK36mtbBdS8qgOZGrqcMTn1ddh4IlkLfmydu/cPdQ7l00pIH3XBTF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dfwv+ZMn; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dfwv+ZMn"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-499f6e0bbabso699654b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526421; x=1789131221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnySQky5/l0Pdt4Xmc1PGw8QVcKDQCdeEtD6/k7Pdqo=;
        b=Dfwv+ZMnsyWroltGOoHLy3NAvvJaRtIPAQoWzhPgZKwjT/qjL7TugEDX3oPk8p0IIG
         avx/wLD1UO1JH0IzY3Cuj91RqS7ZfDd3+z6dyUNg0qMCWNDdj0l/lAIMa+LHPHy+vhUk
         1rhMzDteUkhAHtK/9LksPuhn7T717QyjPYY/bNO/01K/M9d/Kv3fsml9Q5luPEcfcwje
         lN+g3xTYP2B2hbJH+6tfMa1Ak4i4ZhpRQudCeHdffPZmxQQj8goHE/bcRq1+qnBDp1Si
         KFYO5or2oBQAPA+S6ZshYnRpvcOjKZ3JJzuHWXB4WUvXp/vDzvnIqAjzhvctMCEEpCHG
         0XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526421; x=1789131221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnySQky5/l0Pdt4Xmc1PGw8QVcKDQCdeEtD6/k7Pdqo=;
        b=jJeWl+KXDOwFnEl0pvMZ2Mxb7CBHhGT5493FaVRk8GjC+wLydvZYndEPTgvo7vB5ly
         McyKDjjviZjqG5teHMegKWpUcbOAA2hx+Uv8cFnA4EITWnVe9A3wz0UnSQmgOyKuQsEc
         bTwoLYRmjHZCtCva56z7hDTQxJR6ax6oCVwXFQNjtpyD4nVk6CHW4tJZPF/kmCV5TlCi
         af1i+8t/1nlwlpdX5FELpzspYyxYrA0JC7ZPdy/8ZjXbhFxAwrWGe5aGWblSKwT+NRnJ
         YLbIP/Uy+S9hQ2N0P6gEHbSimqSQPXxhHHq4w6Z4lIFr4Ccnyjz1mNmePbO2VYTQVciv
         q1eQ==
X-Gm-Message-State: AFuF++kHTvQnqvX7UygApjvPTSk2RhRDbnjnsxZ2ICDJKCmsyKdUjSpS
	wgLrpnAEJp0Sm577RWIKjwOjXMSw4t41PzhJq9qZNGe1u+EKfdk6SU4h
X-Gm-Gg: AYBFou11+ANMLqN6e4iqiZ6C0NjCasEYLwgP0CgmoHUr00NgrDrxFbnTfaHP9mpGG8Y
	KSbXXOuWkywFlEhOmwgukbNh9oXKj/iiIsRVU4ykQCSCZ7n3Bpph3UQgU7jNvIBqMyiv1X81lP/
	jM8iiAJ8m97JGzuTIc5pXvhdb8vgXE0b53q7qT8FfO+i5TNNYWm7UBmrSr2oorqg+Jpn3vzyxw7
	BFNmfLJfKs2DinXHGE1Qppw/R1vxpv70ix4WtAuZbtYEK4IMgmEZnqj+/BnNGwQDCyGyFuORjUa
	q0WMqmWg0kY5t/2YgTc7ooPmp0KHUI3opHRqqRqYTYXxRLPmuZHWh17fXndBcbImL4ECuPftizj
	0oXmiEvIKb4CAtnlqkjY/6QKF77Hg5it10gkt6ezySZheaIrk3dVfGPP7eyNFqJmclGipDH+6P1
	RlmMhhGd9KU97msZJwOU6OZTVJLnSeOarDT3ctpRxuATzFfTOK7lTUdDW6oyLBNbl12FGklaFSM
	QBAtcOWcgyzjhw=
X-Received: by 2002:a05:6808:13cc:b0:4b9:e5fa:890b with SMTP id 5614622812f47-4b9e5fa8da2mr1661457b6e.30.1788526421025;
        Fri, 04 Sep 2026 05:53:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm6101642c88.3.2026.09.04.05.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:53:40 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 0/8] net: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 18:22:53 +0530
Message-ID: <20260904125336.12749-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 8 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (8):
  net: fix typos in comments
  Documentation/networking: fix repeated word 'in' in comment
  net: broadcom: fix repeated word 'will' in comment
  net: llc: fix repeated word 'all' in comment
  net: sfc: fix repeated words in comments
  selftests: net: fix repeated word 'use' in comment
  tools/net: fix repeated word 'with' in comment
  net: usb: fix repeated words in log messages

 Documentation/networking/switchdev.rst                 |  2 +-
 drivers/net/dsa/bcm_sf2_cfp.c                          |  2 +-
 drivers/net/dsa/microchip/ksz_dcb.c                    |  2 +-
 drivers/net/dsa/realtek/rtl8366rb.c                    |  2 +-
 drivers/net/dsa/sja1105/sja1105_tas.c                  |  2 +-
 drivers/net/ethernet/3com/typhoon.h                    |  2 +-
 drivers/net/ethernet/8390/ax88796.c                    |  2 +-
 drivers/net/ethernet/airoha/airoha_eth.c               |  2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c            |  2 +-
 drivers/net/ethernet/amazon/ena/ena_eth_com.h          |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-dev.c               |  2 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c       |  2 +-
 drivers/net/ethernet/atheros/atl1c/atl1c_hw.h          |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e.h             |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_hw.c          |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c        |  2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c               |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c               |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.c           |  2 +-
 drivers/net/ethernet/broadcom/bcm63xx_enet.h           |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.h             |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x.h            |  4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_dcb.c        |  4 ++--
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_hsi.h        |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_init_ops.h   |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_link.c       |  8 ++++----
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c       |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_reg.h        |  4 ++--
 drivers/net/ethernet/brocade/bna/bfa_ioc.c             |  4 ++--
 drivers/net/ethernet/brocade/bna/bna_enet.c            |  4 ++--
 drivers/net/ethernet/calxeda/xgmac.c                   |  2 +-
 drivers/net/ethernet/cavium/liquidio/cn66xx_device.c   |  2 +-
 drivers/net/ethernet/cavium/liquidio/lio_core.c        |  2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_config.h   |  4 ++--
 drivers/net/ethernet/cavium/liquidio/octeon_iq.h       |  2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_main.h     |  2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_nic.h      |  2 +-
 drivers/net/ethernet/cavium/liquidio/request_manager.c |  2 +-
 drivers/net/ethernet/cavium/thunder/nic.h              |  2 +-
 drivers/net/ethernet/cavium/thunder/nic_main.c         |  2 +-
 drivers/net/ethernet/chelsio/cxgb3/sge.c               |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_dcb.c         |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.c     |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c             |  2 +-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
 drivers/net/ethernet/cirrus/cs89x0.c                   |  4 ++--
 drivers/net/ethernet/dec/tulip/de2104x.c               |  2 +-
 drivers/net/ethernet/dec/tulip/interrupt.c             |  4 ++--
 drivers/net/ethernet/dec/tulip/media.c                 |  2 +-
 drivers/net/ethernet/dec/tulip/tulip.h                 |  4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c           |  2 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c       |  2 +-
 drivers/net/ethernet/freescale/fman/fman_memac.c       |  2 +-
 drivers/net/ethernet/freescale/gianfar.c               |  2 +-
 drivers/net/ethernet/freescale/gianfar.h               |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c     |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c      |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c          |  4 ++--
 .../net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c    |  2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c  |  2 +-
 .../net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c  |  2 +-
 drivers/net/ethernet/ibm/emac/emac.h                   |  2 +-
 drivers/net/ethernet/ibm/emac/phy.h                    |  2 +-
 drivers/net/ethernet/jme.h                             |  2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h             |  2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_prs.c         |  8 ++++----
 drivers/net/ethernet/marvell/octeontx2/af/npc.h        |  4 ++--
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c    |  2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/cn10k.c     |  2 +-
 .../net/ethernet/marvell/octeontx2/nic/otx2_dcbnl.c    |  2 +-
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c   |  2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c              |  4 ++--
 drivers/net/ethernet/mellanox/mlx4/eq.c                |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/en/tc/sample.c |  2 +-
 drivers/net/ethernet/mellanox/mlx5/core/lib/tout.c     |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/i2c.c              |  2 +-
 drivers/net/ethernet/mellanox/mlxsw/reg.h              |  2 +-
 drivers/net/ethernet/natsemi/sonic.h                   |  2 +-
 drivers/net/ethernet/nvidia/forcedeth.c                |  4 ++--
 drivers/net/ethernet/qlogic/netxen/netxen_nic_ctx.c    |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_cxt.c              |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_dev.c              |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_mcp.h              |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic.h            |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c  |  4 ++--
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c        |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c       |  4 ++--
 drivers/net/ethernet/qualcomm/emac/emac-mac.c          |  2 +-
 drivers/net/ethernet/realtek/8139too.c                 |  2 +-
 drivers/net/ethernet/realtek/rtase/rtase_main.c        |  2 +-
 drivers/net/ethernet/seeq/sgiseeq.c                    |  2 +-
 drivers/net/ethernet/sfc/bitfield.h                    |  2 +-
 drivers/net/ethernet/sfc/falcon/falcon.c               |  2 +-
 drivers/net/ethernet/sfc/mcdi_pcol.h                   | 10 +++++-----
 drivers/net/ethernet/sfc/siena/bitfield.h              |  2 +-
 drivers/net/ethernet/sfc/siena/mcdi_pcol.h             |  6 +++---
 drivers/net/ethernet/sfc/siena/ptp.c                   |  2 +-
 drivers/net/ethernet/sgi/meth.h                        |  2 +-
 drivers/net/ethernet/silan/sc92031.c                   |  6 +++---
 drivers/net/ethernet/sis/sis900.c                      |  2 +-
 drivers/net/ethernet/smsc/smsc9420.c                   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c      |  2 +-
 drivers/net/ethernet/sun/cassini.h                     |  2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-common.c      |  2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-hw.c          |  2 +-
 drivers/net/ethernet/tehuti/tehuti.c                   |  8 ++++----
 drivers/net/ethernet/ti/tlan.c                         |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c           |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.h           |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_wireless.c      |  2 +-
 drivers/net/ethernet/via/via-rhine.c                   |  2 +-
 drivers/net/ethernet/via/via-velocity.c                | 10 +++++-----
 drivers/net/fddi/skfp/cfm.c                            |  2 +-
 drivers/net/fddi/skfp/ecm.c                            |  2 +-
 drivers/net/fddi/skfp/fplustm.c                        |  4 ++--
 drivers/net/fddi/skfp/h/hwmtm.h                        |  2 +-
 drivers/net/fddi/skfp/h/sba.h                          |  2 +-
 drivers/net/fddi/skfp/pcmplc.c                         |  2 +-
 drivers/net/fddi/skfp/rmt.c                            |  2 +-
 drivers/net/ipa/ipa_interrupt.h                        |  2 +-
 drivers/net/phy/bcm87xx.c                              |  2 +-
 drivers/net/phy/marvell.c                              |  2 +-
 drivers/net/ppp/ppp_generic.c                          |  4 ++--
 drivers/net/usb/asix_common.c                          |  2 +-
 drivers/net/usb/ax88179_178a.c                         |  4 ++--
 drivers/net/usb/sr9800.c                               |  2 +-
 drivers/net/wan/slic_ds26522.c                         |  2 +-
 drivers/s390/net/ctcm_main.c                           |  4 ++--
 drivers/s390/net/qeth_core.h                           |  2 +-
 include/net/inet_hashtables.h                          |  2 +-
 include/net/sock.h                                     |  2 +-
 net/ipv4/tcp.c                                         |  2 +-
 net/ipv4/tcp_input.c                                   |  2 +-
 net/ipv4/tcp_output.c                                  |  2 +-
 net/ipv6/calipso.c                                     |  4 ++--
 net/llc/llc_c_ac.c                                     |  2 +-
 net/llc/llc_conn.c                                     |  2 +-
 net/netlink/af_netlink.c                               |  2 +-
 net/sctp/protocol.c                                    |  4 ++--
 net/sctp/sm_make_chunk.c                               |  4 ++--
 net/sctp/sm_sideeffect.c                               |  2 +-
 net/sctp/transport.c                                   |  2 +-
 net/sctp/ulpqueue.c                                    |  2 +-
 samples/pktgen/README.rst                              |  2 +-
 tools/net/ynl/pyynl/ynl_gen_c.py                       |  2 +-
 tools/testing/selftests/drivers/net/team/options.sh    |  2 +-
 .../selftests/net/arp_ndisc_untracked_subnets.sh       |  4 ++--
 tools/testing/selftests/net/forwarding/lib.sh          |  2 +-
 tools/testing/selftests/net/ip_defrag.c                |  2 +-
 tools/testing/selftests/net/xfrm_policy.sh             |  2 +-
 150 files changed, 194 insertions(+), 194 deletions(-)

-- 
2.48.1

