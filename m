Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445876;
	b=aXESy8qdu1M9O9ESsO9gY4XD3iCAR9w8Dqz29asBrYRJ7S9RZ2RtBGS3hh5v5k9PO9W0
	 jcbPyCzvF9n9jgHQtWu84W4KgfSiU44xAf25FZ+Rb9K9SY2Uwb5sLIeNhac6C9+0nQ1CL
	 2HpejVpX6X7w3EbuwkK0mSLv0XebtyZrzwOgFpRgwHgNNQ5TAEwRF+mqc2hRdqYNo2Ul8
	 gv4/I5Ttc4PRUw0YThmi5aqBqfrYt2737ETl2xtaAosz2CRjkI7RL6HynqL3GDnasv0a4
	 uie5p+ie7rtfJ0LEKzNGASWm66WcgWjQeO7NaZsnOpkZeoW66k6vnGvbApM61DFPDeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gCmBxRck2pGwY1dXy/qFuwaXSqXYOmKFVAr3BJpKxEo=;
	b=L0vnNYnFoUDnEAEyl5s7yb67YWfrRnMSTJ6E1NFeQOBhWKrB3umYJ16fN4Awv9vF2qZO
	 yBIkJAEctP5eyKguIG3WJpUqrZMfOnWOTXeQG8/vXFfGKdwV8lClx+JZUa83DMeGrasMu
	 DpwXfCh24JmcYwyRuqcFc3fu/7kYHkbwLLg6SeRYTHJIW4vCLln16s7F1/iXk8AXSnucH
	 C0V+ZdEA4+TH1mDl+RuRkU8u0LqoMcsALtzWs9exVUWQdCcuNQSQuO1I6YUgpYesSzt2n
	 M7BzhO+H8AiNw1Rh4RW2HAqkmY+lxouFyJca3l1+GDAI48xBz3NZJJdHzyBKTC5kzOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgzhang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="A4yh8/s/";
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A7606A889
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8A7606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgzhang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A4yh8/s/
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so1577036a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794445875; x=1795050675; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCmBxRck2pGwY1dXy/qFuwaXSqXYOmKFVAr3BJpKxEo=;
        b=A4yh8/s/4veuphfISgpMWpFShEQxcREmPnPrXBq2QjS33A1zcgG881ORYQi0M1szHM
         xnQXkAzlSouCdTtQ4Xlwae4jl+ma6s5tDdjtwzZS68iLOY/KzC+ZwbuX7itIzxXS7F5B
         Z+7uAxCnH3a3zRuh5yzUG2ecyY/zk/VJ3goiWLJGF0XBz8B9BAG4sIk2TrKl1LTezTVd
         NdlHFXeTH6eZZkEVpT0++/hZpGv0zwo3/ztqPkZ+FK2126BiKQUpWcIc+cFr33FyWU9l
         3itAr3l7snwe9qCvYsYI0pzjUolOmmE3Am+Wu0I0t7EPy85upJl1xJDyNcvQrbdMhVrD
         LVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794445875; x=1795050675;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCmBxRck2pGwY1dXy/qFuwaXSqXYOmKFVAr3BJpKxEo=;
        b=nJvGcdTqTvfDU0CA3m2rUAP762FaOOxt56Ax/2Rcwjbjj9oLeSwwBcK291tVFn63g7
         +H/u+CB0wyT6xGAISJCxb3uSKs3PqAR+Zvqp45UJaGIUDsgN3SdaxWIfUGPsRs95+RHK
         LXYuyZ1Sp+Ca1CRDlWuLCfcXKQs3b3y6GVgqZ1BLZzwwxDq/9zpMTo99IIlRhij4vE5e
         78JehOngia7k+c7VfOpWi8i70JBQ9/ShC8SGZX53oFihuf9cy3tjdoPCrWovMdeKuLEn
         VDMBdsP0qD9w1//ByEafGqCyGWMZAG3KT8SWe5SYh7DSV/yOGDdVZno4kzIP2598MsHA
         DoDQ==
X-Forwarded-Encrypted: i=1; AL+hErGQBZvaVKuF756NYwqAPiQojL46deb3jl0BUX7QaTDJ9Qggs/u80RtHptmh/5dQSftdmNqApgkCNchQxCI=@vger.kernel.org
X-Gm-Message-State: APuU4Z97Go9oRwbetS8IqgzAZOfqEZG4Hu8ZJg2rCgiwdWNHxxnuXra+
	OoXB5tYpjvgVUZ57Zrdyfxx9MRGCFgQbR/8+ABkaS4QiqJiHfct3QtMxtE+sBY4acviS9/IoyD7
	nKfsnM/lqlA==
X-Received: from pjtf15.prod.google.com ([2002:a17:90a:c28f:b0:3b1:3798:48e0])
 (user=sgzhang job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57ec:b0:3b0:a9de:9884
 with SMTP id 98e67ed59e1d1-3b182f200a7mr3805638a91.40.1794445874792; Wed, 11
 Nov 2026 17:11:14 -0800 (PST)
Date: Wed, 11 Nov 2026 17:11:08 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261112011108.1524624-1-sgzhang@google.com>
Subject: [PATCH iwl-net] idpf: preserve tcp-data-split setting across hard resets
From: Ray Zhang <sgzhang@google.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, intel-wired-lan@lists.osuosl.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Kubiak <michal.kubiak@intel.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	David Decotigny <decot@google.com>, Li Li <boolli@google.com>, Brian Vazquez <brianvv@google.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
Content-Type: text/plain; charset="UTF-8"

idpf_vport_init() runs on both initial probe and hard reset, and
unconditionally calls idpf_vport_set_hsplit() with
ETHTOOL_TCP_DATA_SPLIT_ENABLED. If a user disabled header split via
'ethtool -G <dev> tcp-data-split off', a subsequent hard reset sets
__IDPF_USER_FLAG_HSPLIT again and silently re-enables header split.

Move the default idpf_vport_set_hsplit() call to idpf_cfg_netdev(),
which runs after idpf_vport_init() sets rxq_model and returns early on
hard reset when IDPF_VPORT_REG_NETDEV is already set.

Found by code inspection. Reproduced and verified on an Intel IPU PF
(8086:1452) by disabling tcp-data-split via ethtool and triggering a
function reset from a test module via idpf_idc_request_reset(): before
this change tcp-data-split reverted to 'on' after reset, and with this
change it stays 'off' (with rx-hsplit remaining 0).

Fixes: 9b1aa3ef2328 ("idpf: add get/set for Ethtool's header split ringparam")
Signed-off-by: Ray Zhang <sgzhang@google.com>
---
 drivers/net/ethernet/intel/idpf/idpf_lib.c      | 1 +
 drivers/net/ethernet/intel/idpf/idpf_virtchnl.c | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/idpf/idpf_lib.c b/drivers/net/ethernet/intel/idpf/idpf_lib.c
index cd1b173e3b27..db6603711be4 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_lib.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_lib.c
@@ -945,6 +945,7 @@ static int idpf_cfg_netdev(struct idpf_vport *vport)
 	netdev->vlan_features |= netdev->features | other_offloads;
 	netdev->hw_enc_features |= dflt_features | other_offloads;
 	idpf_xdp_set_features(vport);
+	idpf_vport_set_hsplit(vport, ETHTOOL_TCP_DATA_SPLIT_ENABLED);
 
 	idpf_set_ethtool_ops(netdev);
 	netif_set_affinity_auto(netdev);
diff --git a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
index 928de868fa62..fc56437b01ab 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_virtchnl.c
@@ -3381,8 +3381,6 @@ int idpf_vport_init(struct idpf_vport *vport, struct idpf_vport_max_q *max_q)
 	memcpy(vport->rx_itr_profile, rx_itr, IDPF_DIM_PROFILE_SLOTS);
 	memcpy(vport->tx_itr_profile, tx_itr, IDPF_DIM_PROFILE_SLOTS);
 
-	idpf_vport_set_hsplit(vport, ETHTOOL_TCP_DATA_SPLIT_ENABLED);
-
 	idpf_vport_init_num_qs(vport, vport_msg, rsrc);
 	idpf_vport_calc_num_q_desc(vport, rsrc);
 	idpf_vport_calc_num_q_groups(rsrc);
-- 
2.56.0.611.g1030f0b940-goog

