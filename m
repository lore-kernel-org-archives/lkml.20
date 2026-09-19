Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6E2361959
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845593; cv=none; b=T3+mBEVsik8K5IsDlinDNBVeyuCmlKYQThoDRz5VgoFrUv3cXtofw4fyV5j0QKPo5HDRlF+rVFHp2rNy+SEDsHS7X8fzq/TLgkVSmv46h4fpDp8ipi4+JrVcLD9VJxx2Up7c2Go53avDyK8c3jzHWKLcFxzv2xq/OMXGO5YEuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845593; c=relaxed/simple;
	bh=7eA14pkMyRijHLSluOg7mImGg2JgMqno00/5HbUy+ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJxv14O/udee7htOGTFbBYFcsxeSPaf94Dzi9W8zCff5oulVlFOhbkMQY1dEd5q01s/B4WVfIeiOaGw9+om1JYxgPpUb1UJdUt4p9j+IWyKoaY+GJq88BGqVjbNK/Ckxismnt1kfB5RzSsFcf6rOT9hlQKrmVAEfKYrZCyGaTSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaIJ6n/z; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaIJ6n/z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so587888f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845589; x=1790450389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNn5LfmzIp0Qiso4NKlxppBej7z4xYBUzlf1B0pA+mk=;
        b=iaIJ6n/zHZeWTzuP2gE5ZsxtT8MKkcx2CYcDnf79Lc4dSRxi8oUKDgrvz38rz/AukK
         jt+GuCGHOOLozo2p6CZh5tgnBN3INqnuHheCctPcbqHE+O6cKyHmW0742ZIRqQwwNe/H
         v5RhqInYwmTYHwRFVajiJS2NbKAFUA802vFyD4HAaPDkQqOQglJVU+GK0kLW9aGhM4Wd
         jS3vl4+a29Kh0h5p6ifyJPhzTRzH0TvesKkf1y/Fe+bq+F12cqMp8E3Rr+dNPyxii/zA
         ehnF8zAbM+QtLtu5ohM+q6I51R41FIhak5rZ+AZcCExjpunUQFDek+cVdYBclu82UCFG
         bryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845589; x=1790450389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DNn5LfmzIp0Qiso4NKlxppBej7z4xYBUzlf1B0pA+mk=;
        b=Az6Mix+8UTkWgzLFOUSRjZ3BO1b2IVsnoBNs+XqxUkTbJbS0UcBTQuU4lUPNckpoKR
         z+baq3OP+I+F+tae7LKUNLLVIzsXB/ZD+yxnoDUTpuicvKjowxcleBDImEG0SH/PtU+M
         jQ9pdz+AQWgFPuAqxGPWyLUgL+OCB1/deulDGJIPKhNLEIToWynQlyGY8F3fVPSnS06x
         rkgvkWLYaq0QZQaKR+TCJMrEAxaYajJ9doYp1FweA/hyb2jkB/xI33iwWZ5PfD22G4Za
         UX7bjXGqkTgwXTQcC2NcNAb5ByU2yZpuFPG/bT9OYPwmF+lG0IHwhH3hzcHOp2itjQIM
         qfGw==
X-Forwarded-Encrypted: i=1; AKwUvBz/ruYri9+DZIICPsyOxn81VpVMH2lQQFarklcrqQMiuOF4lfPUyQ46cyBC/lK7Olr5rDYK9fYiBANBYC0=@vger.kernel.org
X-Gm-Message-State: AFuF++k5wjPSuZhS7rRmy497XbNCup7OQ6g68o+ntInnMGGZD3NjwNlN
	MdlhTaNA+9R27HSGy5c5bISh+7fgZqQ/YkManSOdLJd4cYmorXVf2hd4
X-Gm-Gg: AYBFou083793ZtEN7FL5aITmwWjrMiV81GobY18kbBMcwV2Z/NPaKjG8/YVyRBem41+
	27x2wkADXC6Utij108XC5JBWCIPPY93IV8Fr+88mkfiN1hAn4xrMJ3m1axR4Iuiv2xRPROtLEN2
	5zy93vvGv359LfeB66nXgNuE+JkrhSYQz9F74tasg/MI7Ov8jpj/iTrHK9Xnfp3EFI/PWV/RPM0
	BDldt807EdN6ghtM/sjQWas3tivOzNC4Gy1B5KOcsaHAcrNomszQ7hftxTlPqw00t4z6M9toSMJ
	bpCSp0MSCCF+1UKDj9bVgKdV325Yi2DLe2qh4x4nJgSDaksUCkvPI0m0D0TEg7RQKTEfCtc+0gM
	iIfavQyTCHN0RwDieLsTfneV/9iZtlEuZwNdGoK2a8hv4hjZBw7HEDF8BzXmUCMXMTDb/EvfRTS
	OZqqf17guV4W6NKC8WLI1cjcP5sBvKXRIYEGORGixjTmzdW0sSu9GfWZlHdCALHM+xfP7ItvhQj
	d4Mb5/Xa9JLTlMBjS+hXopXIWw5/pXBAl/9sc/x/G9fMBI09y6D
X-Received: by 2002:a05:6000:41cb:b0:486:fed6:d7e with SMTP id ffacd0b85a97d-4871db11bbfmr10180389f8f.22.1789845589033;
        Sat, 19 Sep 2026 12:19:49 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724593bbfsm8097078f8f.27.2026.09.19.12.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 12:19:48 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: andrew+netdev@lunn.ch
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	dlan@kernel.org,
	wangruikang@iscas.ac.cn,
	vadim.fedorenko@linux.dev,
	maxime.chevallier@bootlin.com,
	troy.mitchell@linux.spacemit.com,
	netdev@vger.kernel.org,
	linux-riscv@infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] net: spacemit: clear TX descriptor on fragment mapping failure
Date: Sun, 20 Sep 2026 00:19:37 +0500
Message-ID: <20260919191937.271202-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

emac_tx_mem_map() writes TX_DESC_0_OWN into the ring descriptor for
every slot beyond old_head as soon as that slot's memset()'d local
copy is committed with "*tx_desc_addr = tx_desc", i.e. before the
buffers for that slot have necessarily all been mapped successfully.
If emac_tx_map_frag() then fails on a later fragment, the err_free_skb
path calls emac_free_tx_buf() to unmap and drop the skb, but leaves
the already-written descriptor memory untouched, and tx_ring->head is
never advanced past old_head (the "tx_ring->head = head" store is
skipped by the goto).

So a slot between old_head and the rolled-back head can be left with
TX_DESC_0_OWN set and buffer_addr_{1,2} pointing at DMA mappings that
emac_free_tx_buf() just tore down, while software considers that slot
free again. The next successful emac_tx_mem_map() call only rebuilds
old_head itself; if the DMA engine auto-advances into the following
descriptor once it finishes old_head's packet, it will fetch that
stale, already-unmapped address.

emac_tx_clean_desc() already treats emac_free_tx_buf() and clearing
the descriptor as a pair when reclaiming completed descriptors; do
the same in the mapping failure path.

Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index f7f16397a2c2..d641ac26a1e8 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -803,6 +803,9 @@ static void emac_tx_mem_map(struct emac_priv *priv, struct sk_buff *skb)
 	while (i != head) {
 		emac_free_tx_buf(priv, i);
 
+		tx_desc_addr = &((struct emac_desc *)tx_ring->desc_addr)[i];
+		memset(tx_desc_addr, 0, sizeof(*tx_desc_addr));
+
 		if (++i == tx_ring->total_cnt)
 			i = 0;
 	}
-- 
2.55.0

