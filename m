Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC71E5304CA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271312; cv=none; b=QamVuj5Ez4Cs+569WMeCIXmHJr1usQyXLQJqiCa1gfD0qqxqVOAsHxzxxCfbsIEzJD02fKyMJ3zq7T0u/O2k8n7dwmX9oqVnUnSMnbtayx/fIhZQ0BfUjrnMLiFlJf+Q4b9DQ7WqAyLNhW/RBkK9LkmEYwb/fywvvraF9b3TXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271312; c=relaxed/simple;
	bh=/0chTZvN7Ky+TA9HvI41ZWJ8tmuDbI07h2tw1R5aq3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JuBFxDJXiOWGja4xjEPsv5HAr/ulZnA9/TQFwuEcbhpdBvqYNm56aqnL2zlKuCFY6/7TlZnm/KwQHnsA20Bem2E4zuGu/f1894NxvtCaLuvIhKdtF0tCXYbbYljDwHEpMgvlQw4vtg5oWZ8Rte74o8rVrQ16llixHHrq3SVGxqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=f0NyiEPQ; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="f0NyiEPQ"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so10963a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790271309; x=1790876109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XmTxiFdIaWCCF0HjMXWXx42hXA6kt9BLAaeoJ6xE+TU=;
        b=f0NyiEPQQwTtinupWvlQRcBUbJaLkJ6RMStEfGPzGwImkmU30Pp2fk0/e6FucXnB7p
         7CmPTitA8K5bQqlP69h+JcfHcEf3cMm+nz2oWyXQoDIHc3lccSDZu6I33/pIhVq3q+fX
         Md8wJ/432kEl4tTeNxWTLKXMM3D1troMSujbytquQHiVW2aXy7B4LuZg6oKTYZURGR4R
         6wIO8unTyugSQ+5Nb20qCcD2eBVleeEFRWt2cCCsU2fBRmk7gW2nhmPjJFfnwBfEVVd4
         NWfv3CohdDLeQc3oRj4TFKNyKAjj2Ns0/Um39jzdVCHdnPfvB3ZJxkzD1A0jLMNP42HI
         CQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271309; x=1790876109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XmTxiFdIaWCCF0HjMXWXx42hXA6kt9BLAaeoJ6xE+TU=;
        b=TQx9EdxkLLykiAflMUPis83IYgnoaSW8y4jvGoulEMWOdMwVTuubHtc0L+JnYPab5+
         4Hw58HJUmfP8FK/EKD8VXZnNnoCeKuG3EPnn6wk7a65+bhv82kSMPcUl8H/jDPfZxCtM
         FM8dlirUTJ0jRCjHHz2t43Tpf6Da3ClKdJeWazOjc2/U1iwaRgDBjIEvrGKbf7AKofBk
         cW3PlH726CNi9uRMzdfNYgGAmh/+TWrW3u8J3D0+WSen6Ww6Lk5f5Jt7dm9voC7Uveef
         phfmZxC093lhXZnS5I2DiOBtr8+ybwt0z11klX+1ZAPDss/cihLLpp37HdFZE5y+jN0N
         ximw==
X-Forwarded-Encrypted: i=1; AKwUvBwnR4eHi9puHhASQ8VesctdPueV0I7VrHE7AQWXc1NNr6GeQlj3HKeMVAgBFfOK94jYV4pvFbUDLI/MYJc=@vger.kernel.org
X-Gm-Message-State: AFuF++lNLE8SIxeoAcBUGIiILAsh0tUJ0X19P+27iXCMkynQNTer6Cgz
	+nxNO86RP114dphCQ52Hak3nl4/d2uKmgMIQ+UFrkQjD1AbyjT74rXlghaZExq8Cw88=
X-Gm-Gg: AYBFou2TRsLaQ7eL5h52y85QmuuGG4+cvrnKkMuCcetebwojCF2xy9NoEU2vfCPsK/O
	1g9BddENwww92Y7QWlSUwbwOvN7mwDjWq+VJAbpW3sU2SF3dy5EGhdlyiyCeG12t7eXIqCljQB3
	eAfnve9DSgNFFjmZuqQ30nfPLf7YIsA+ThS423vqTrLFOapW0k6FAVwvC61NSkxwD1vEEl2rJiB
	QZ6cYRQChCyU8rCGQ6kJbe528RyEm7Pp0frax1gnpYa4F1MZ0YIodwso7j8AKvUynmBL3NcYfrD
	q1zHG+q+Q27apa3V8y2jyqST2d6JvDlpYR5K2L3QnA0bkWwvaVsz++dGuZYcMb4qxAYejTMvF9n
	4niyBsHQKgJYHx9PoSZO2GygR/5sYnhPFOcjznOX7VEdQc+59pzFEgjboeS9j07XcRtoXsmmelr
	wPp/BzP3Ig/m++vuzs07yZUpaZjSMFERYePFA6WXOXd50WEB66s7iyJ40YOO6FC0r1k12r3EDMu
	IPB1KUW/Rx6fq4+e0ocBB8utIAPWN8JesqWh7GNkLk1ON7wwLKLEG+dTBPDj0Ehrkh/Qzaj
X-Received: by 2002:a17:90b:3c45:b0:3a0:2646:7495 with SMTP id 98e67ed59e1d1-3a09897046fmr3104409a91.53.1790271309276;
        Thu, 24 Sep 2026 10:35:09 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:f875:3165:4649:e818])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097390328sm6144943a91.16.2026.09.24.10.35.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Sep 2026 10:35:08 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Roi Dayan <roid@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianbo Liu <jianbol@nvidia.com>,
	Vlad Buslov <vladbu@nvidia.com>
Subject: [PATCH 6.1.y] net/mlx5e: TC, Fix internal port memory leak
Date: Thu, 24 Sep 2026 13:35:04 -0400
Message-ID: <20260924173505.87763-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianbo Liu <jianbol@nvidia.com>

[ Upstream commit ac5da544a3c2047cbfd715acd9cec8380d7fe5c6 ]

The flow rule can be splited, and the extra post_act rules are added
to post_act table. It's possible to trigger memleak when the rule
forwards packets from internal port and over tunnel, in the case that,
for example, CT 'new' state offload is allowed. As int_port object is
assigned to the flow attribute of post_act rule, and its refcnt is
incremented by mlx5e_tc_int_port_get(), but mlx5e_tc_int_port_put() is
not called, the refcnt is never decremented, then int_port is never
freed.

The kmemleak reports the following error:
unreferenced object 0xffff888128204b80 (size 64):
  comm "handler20", pid 50121, jiffies 4296973009 (age 642.932s)
  hex dump (first 32 bytes):
    01 00 00 00 19 00 00 00 03 f0 00 00 04 00 00 00  ................
    98 77 67 41 81 88 ff ff 98 77 67 41 81 88 ff ff  .wgA.....wgA....
  backtrace:
    [<00000000e992680d>] kmalloc_trace+0x27/0x120
    [<000000009e945a98>] mlx5e_tc_int_port_get+0x3f3/0xe20 [mlx5_core]
    [<0000000035a537f0>] mlx5e_tc_add_fdb_flow+0x473/0xcf0 [mlx5_core]
    [<0000000070c2cec6>] __mlx5e_add_fdb_flow+0x7cf/0xe90 [mlx5_core]
    [<000000005cc84048>] mlx5e_configure_flower+0xd40/0x4c40 [mlx5_core]
    [<000000004f8a2031>] mlx5e_rep_indr_offload.isra.0+0x10e/0x1c0 [mlx5_core]
    [<000000007df797dc>] mlx5e_rep_indr_setup_tc_cb+0x90/0x130 [mlx5_core]
    [<0000000016c15cc3>] tc_setup_cb_add+0x1cf/0x410
    [<00000000a63305b4>] fl_hw_replace_filter+0x38f/0x670 [cls_flower]
    [<000000008bc9e77c>] fl_change+0x1fd5/0x4430 [cls_flower]
    [<00000000e7f766e4>] tc_new_tfilter+0x867/0x2010
    [<00000000e101c0ef>] rtnetlink_rcv_msg+0x6fc/0x9f0
    [<00000000e1111d44>] netlink_rcv_skb+0x12c/0x360
    [<0000000082dd6c8b>] netlink_unicast+0x438/0x710
    [<00000000fc568f70>] netlink_sendmsg+0x794/0xc50
    [<0000000016e92590>] sock_sendmsg+0xc5/0x190

So fix this by moving int_port cleanup code to the flow attribute
free helper, which is used by all the attribute free cases.

Fixes: 8300f225268b ("net/mlx5e: Create new flow attr for multi table actions")
Signed-off-by: Jianbo Liu <jianbol@nvidia.com>
Reviewed-by: Vlad Buslov <vladbu@nvidia.com>
Signed-off-by: Saeed Mahameed <saeedm@nvidia.com>

[ Backport to 6.1.y: this tree already releases the primary flow-attribute
  references in mlx5e_tc_del_fdb_flow() and lacks
  mlx5_free_flow_attr_actions(); release only cloned post-action attribute
  references from the corresponding free_flow_post_acts() cleanup. ]
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and mlx5e maintainers,

I am continuing CVE backports still missing from 6.1.y.
This fix is inherited by v6.6 and every later mainline release, but 6.1.y
still has the affected code. The target-specific adjustment is described
in the bracketed note above.

Could you please queue it for 6.1.y?

Thanks,
Artem Dinaburg

CVE: CVE-2023-53999

Build: This patch was included in an x86_64 allmodconfig and
CONFIG_WERROR=y build.
It produced vmlinux and modules with no new warnings or errors.

AI assistance: An LLM helped find, adapt, and validate this
backport; I reviewed the patch and test output.

 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 05888942ef276a..d2f226a09a0c7 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -3692,6 +3692,7 @@ free_flow_post_acts(struct mlx5e_tc_flow *flow)
 {
 	struct mlx5_core_dev *counter_dev = get_flow_counter_dev(flow);
 	struct mlx5e_post_act *post_act = get_post_action(flow->priv);
+	struct mlx5_esw_flow_attr *esw_attr;
 	struct mlx5_flow_attr *attr, *tmp;
 	bool vf_tun;
 
@@ -3713,6 +3714,16 @@ free_flow_post_acts(struct mlx5e_tc_flow *flow)
 				mlx5_modify_header_dealloc(flow->priv->mdev, attr->modify_hdr);
 		}
 
+		if (mlx5e_is_eswitch_flow(flow)) {
+			esw_attr = attr->esw_attr;
+			if (esw_attr->int_port)
+				mlx5e_tc_int_port_put(mlx5e_get_int_port_priv(flow->priv),
+						      esw_attr->int_port);
+			if (esw_attr->dest_int_port)
+				mlx5e_tc_int_port_put(mlx5e_get_int_port_priv(flow->priv),
+						      esw_attr->dest_int_port);
+		}
+
 		list_del(&attr->list);
 		kvfree(attr->parse_attr);
 		kfree(attr);
-- 
2.39.5
