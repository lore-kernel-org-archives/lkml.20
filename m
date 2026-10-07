Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B64DDB4F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396999; cv=none; b=n0bMRzk6PnEyvLoLgAhSfCQsx24lyrJ2V4Qzhi2izCFWRbSSvdl4FXDvoZXY7C5CQhbF4Qq0a24lf18vGfs+yFRbnCv+kMj2311lyzWdI8q15XDdMuA45neQpxaF7OqOtcGpM1rJQLbeKwn+biFzXv7cr2/Z+oZY+2CY/2upWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396999; c=relaxed/simple;
	bh=zznhnNGgkEt9ZSSy2T9PlgogR6INn8I/GpUQzjq8ahE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JCysNw9V9DNwXCkaKd1EqJJhGt1B9zGIS1HmNIMNr/UtWSUD4+SFlkQzhZR1ATXzQtL3nFgfiusF+pn/GK2SdU/sNq+VlFFGObtbZ8wCAe2x0kFngIAipYY6e09kh481RZIDkRaU+DMd4g+psBkSGhBmCIdIUn3DOJJHoqHoDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Z3bBgEpI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Z3bBgEpI"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-9144e8021d3so72041406d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791396997; x=1792001797; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9GuqCKMi/hN2ncI5Ot6sRINUqKwZdItx3f86TmeMcg=;
        b=Z3bBgEpIg9si/rzGnkwx+hT3M9EhY7/mvvbue/rYLQRjusEjYgVIgoGNA2MG3mxjPF
         v7zSLDDRKmZqwzY2fx/MX74Ew73hieAd1+7D8M8RnEkPCzI2qO9P3nc8kEY1tD2X+4Y5
         9nWS8H6ttd8Mzq/iHfJ3f3Bpt55fx3PkxYtWaz0sE2m60wB5q0MZmSL4hFGFVk0iHPYv
         SEL3342Uw7HLnAjVMPqbD1R4BJNUISBEizwrlRJq/KuvCWcJBGCkeCTTcUlYaP8NvOgD
         UB6bs8GToQ0lO3wuzoCXUvG1LJjBhsL6mq87YMtOLnwxq48X19+zITlCqdzvHvf+JwsF
         ZxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396997; x=1792001797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9GuqCKMi/hN2ncI5Ot6sRINUqKwZdItx3f86TmeMcg=;
        b=JUWnJWAxi2WHCk/76xI2e3WJWcTB8hM14Vu3uFpsDh91NKz3qk5dinNQj4nkQC4HAh
         Sgg7Xk6NYEcZ1MgZyJcGN4EgSeW6TADR/cKHC6zl813jr1b0VUbZcXtqgK5c3FKK71hP
         9fM50P+Pi/SVFvwx/BFEbSuBN+FBUEN8WZ0ryPOewoabMUkmjCTrb3wSJ0G2v/EbArl3
         icz3LIj1HrZ0o1aI5b28H7M2ld9JPp86GCC38HVqUzSGr2ThrjCBbJIHlcb3xz8/BWx6
         kIhODYIRQwUdBlFMTQ/MpMMcYLXSPb0Oj3FudoBznfXAdwWUVm1Jo9cwVxaN3RJLs9oa
         OV6g==
X-Forwarded-Encrypted: i=1; AKwUvBxsdyxXiq67LydPfg5Qfotfmqd6h1CpX+O/z05ZArBk50RcHFic5FJFfmkwnWWbYZizz/W2dckaxrK0bx0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGi1eKpHfLwY23ffd9u0cBInF+/JQRRBq/qSBs2RHoK4xDK+e6
	WKemUAFgJouUeYPPKmqsa3Xv/zC4uSK4AsrW7ylnHnK4fOrqsDQeI97MrGCveD41sCU=
X-Gm-Gg: AYBFou3RofsjpULcL/VDopVE4mXcJsu7KZ/rYwv4sLUXLpA2KoURlN/NoiVxnKuIM0l
	aaF+fTcHw7exVse0zNiI8zFLL9qdDURtIQeMOtiy9Uy11xxzyMGYCsFwFr24vjr4tnfJI4NtBDd
	24yHjy7QharYEPTO6wWJV9QolOjPZ5q24Qqh8oYAsRWpZX5s7lVcg7HvAi2Sm6PM/4Yyp5Zfq9Q
	62okHPoTr3QAuu6of6hVI5DaoRvsR3wjYG3M8qlFgPb0Musqs0eBwRV7DlDQHNNd8LPr2gwVOzL
	aD7ciX0fO/nbYg7ZHVm8lwqP98CohNumx3HqVVK2v2Fja74xXk2CqWka6pbbYgWyh2laNWUmQMa
	/fPvzPdMTskFfx5hFBqsOlfK/QyXpwYD9wyfbj3kOylt2KcSWvdpmLYigNq+N7CMJHdUl7eICb4
	CzZWb28l5dTSO6EmzWTVdZQvJtJ3hIC1TRMqDkRB5O1v9QJv5wuor4lD1sqXyIPdwxd9PTkiCxi
	iAu7nRFmqB+L6c=
X-Received: by 2002:a05:6214:29ea:b0:917:8400:5eec with SMTP id 6a1803df08f44-919976fd758mr60391986d6.5.1791396996945;
        Wed, 07 Oct 2026 11:16:36 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996bac803sm26531506d6.3.2026.10.07.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:16:35 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:15 +0000
Subject: [PATCH net-next 2/9] net/mlx5e: check for failure when pulling the
 Ethernet header after XDP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-2-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1491;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=zznhnNGgkEt9ZSSy2T9PlgogR6INn8I/GpUQzjq8ahE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM+jiGljpi2X00qowHNyzmeos/hw24wETOq7O8HQRrlF1LPa5A0l/9HtyUoj5T4Hstal4F6tvLe
 zEFqab3/2JAY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When an XDP program leaves less than ETH_HLEN in the linear part of a
multi-buffer packet, mlx5e_skb_from_cqe_mpwrq_nonlinear() pulls the rest
of the Ethernet header in from the frags with __pskb_pull_tail() and
ignores the return value.  If that pull fails, eth_type_trans() later
finds less than ETH_HLEN in the head and BUG()s in __skb_pull().

Use pskb_may_pull() instead and drop the packet if it fails.  Pulling
min(ETH_HLEN, skb->len) keeps today's behaviour for a frame shorter
than an Ethernet header.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index e3f915beebe1..b1e1e30a77e2 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -2060,9 +2060,12 @@ mlx5e_skb_from_cqe_mpwrq_nonlinear(struct mlx5e_rq *rq, struct mlx5e_mpw_info *w
 				pagep->frags++;
 			while (++pagep < frag_page);
 
-			if (len < ETH_HLEN)
-				__pskb_pull_tail(skb, min(ETH_HLEN - len,
-							  skb->data_len));
+			if (len < ETH_HLEN &&
+			    !pskb_may_pull(skb, min(ETH_HLEN, skb->len))) {
+				rq->stats->buff_alloc_err++;
+				dev_kfree_skb_any(skb);
+				return NULL;
+			}
 		}
 	} else {
 		if (xdp_buff_has_frags(&mxbuf->xdp)) {

-- 
2.55.0

