Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B534DEC2D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397006; cv=none; b=kJiN2XhpZ8dFPH0q3Y6Sy/uosEbNEW9xMy96T7kD8yy8Ir07X6Xtj8VkZ9Af3a9Wm9FyhYV/LKekkphp+dC3O8TCcYq3IHKu8z45nfXFAmnIyrVrNvpxxTwKhI/nQr4jsQk7hsb1p8Pq4nywgL3Fg8QR/77Ea9jQMIoNp6Feia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397006; c=relaxed/simple;
	bh=3f5WzTjnDsDOAnT0hR8gZXIWFT9KoT8c/AVMjDx6NOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBVcTykF3elcdeSn9/Mb+VsWdJrpE2bD+fgY3DqObcZbzOj9iXcKfhXMHVsVOKzZBdbRpOYQyQLuNJETs6/9lnjr/gPdjJVfsrpK3qkH4mBW3cFCo4PeKXXFLVE7VL1OLWWLYrkWlfbT6tnzmFE0wHU97Y152zwin66nmmJlbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=IgU+MJoW; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="IgU+MJoW"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53505bc6524so37826201cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791396999; x=1792001799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=IgU+MJoWLuObc2XG00qLChJqslorgxFmiugvO9MVsdFghTeLqXN781FVVWV89At1Sq
         r1hsw3aBnTrAFPwE/na12WB56zt5huZOnsJg7B5lT8ysleur/ABBcVQME9pZ7foka494
         dHNXVIWz/6GV1Jsp4ndgqmddb22wpi9rPFoi/W6vL0sl4EwPB5iHXxxQLxZTftnQ0Wf8
         J+n/sqa1cTwPF6eRLZ+cM85Lr6sTQ1RonBpEoRxXq8TrP7IKpzEo6wY0XsB7956GB13e
         +K4zCTsHWHjB6D1P/1+H0pbT9k5EmBzRI23MRK714J+H9oOncMwKuIy5Iqkl0YxKbKa3
         3jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396999; x=1792001799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blrnvRK83a0BrC00ZsKjSLnGbEsSK17m6K1yrBXm/SE=;
        b=uQEls8RmkbE0Eq7Vr5SFTiR3Pvs88C46k3oka5EvZ+PUseosGhnSAJZPtQ3d+h+48k
         KwJOi3v3Ga1cRF5twkA5VhKbjeNYFIrlSwZQKXuvf6M5DXTn0RrDPCxJK0uJBVFeQaVq
         719eOcU017r2kyUio1dUJzgbjMkqfzXoil7om6o+7Crt2jABehFywYOvp5ZEWz98twxE
         m80JYXgqXG6fcp1Nk5onN/08CCOmY8XUAKNplKWfoeOKspF/zj4T4uX+PEcndq9EhAoA
         xjgNF9yMhFibCc3ii4eK/e2nX5gHdqqRhXL8HICAKrKpXc4TgpM7mAK+duBtae5y/x74
         yqiA==
X-Forwarded-Encrypted: i=1; AKwUvBy2JfexmSjPrpxV2WTTTA3I20FYSG+Yk1nWgkurbr/SL2KquLTJNXd1ogxwvD8sRvrfrd3GlxLGROVdsGk=@vger.kernel.org
X-Gm-Message-State: AFuF++nM2STk0QQ78otOFbHNychTywThg92/zGBtUglAzocumV6XNomR
	M1L38JKqq+ycADCku2c2pGf7KPKSGI+3Z8FcabumzRktaQ2vgqMuhTJepsVdGoc3OR4=
X-Gm-Gg: AYBFou3BG5zYAbnfCnBuDyPumB3AkUdBCYELQ8t/B5rS/LypICYvzXXCCEg19UOzLbx
	H2/Fa0d/EQiE/v6BwtDS7DutlQ/Nx6LlqINP3vkk2hpZgBdL9X4RfR3/qTYhX3kWSf3LGg7s2+Y
	7yPqiSenZUzRq6OspZqhd87V4bKNgW6qICq0vIm9CjpTNSg8ZGd/Y7oLTMbB95VtiV6CTE01l92
	v5PQ7BsMEV0lx1fG28GOZA659tGK0ckWb564zC7BCBr+5SQS3od8ZeN7fRiaGra3EmNnTyws3WV
	e8Oi1WM/2v7nRIAhAwc952X/9oGSQnkQdVjPPVKZc1WS/Tt7S1QWPzHGJpG8Vpupy21QD2IPPMR
	roW6doKqnoscZXpD7sjCQCtkTUFbB2NSzPVWpf5M38MYJWNp3la5TCIeTHYgdP/Kohy4sYAMi1b
	aQoGRmqoE+ObZsko/yfytlg587Mib2Yt8L2HSEFfUD7QgmjhM7K/fMT0Kl5V3ab1SZ07y9J865X
	/aBf5SG4R9xzwDtlKNvISnDVA==
X-Received: by 2002:ac8:59d2:0:b0:535:1740:d334 with SMTP id d75a77b69052e-53575201aa2mr52033281cf.3.1791396998937;
        Wed, 07 Oct 2026 11:16:38 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535720ea17csm25632781cf.12.2026.10.07.11.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:16:38 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:16 +0000
Subject: [PATCH net-next 3/9] net: niu: check for failure when pulling in
 the RX header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-3-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1236;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=3f5WzTjnDsDOAnT0hR8gZXIWFT9KoT8c/AVMjDx6NOM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPE8F38TpAIjOskJy1CfHBTawvG2+Cdej+o6C6KckWCrmqZc3RT77tIgX51AS0sYEQy/f1nhpBP
 sPFJm2+lltwI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

niu_process_rx_pkt() uses __pskb_pull_tail() to pull the hardware RX
header and the Ethernet header into the skb head, and ignores the
return value.  If that pull failed, the skb_pull() of the RX header
right after it would BUG() in __skb_pull().

It doesn't fail today because the skb is freshly allocated, isn't
shared and has room in the head.  Use pskb_may_pull() anyway and drop
the packet if it fails, rather than depending on that.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/sun/niu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index c74a97fe5464..d1c0e868004d 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -3488,7 +3488,11 @@ static int niu_process_rx_pkt(struct napi_struct *napi, struct niu *np,
 
 	len += sizeof(*rh);
 	len = min_t(int, len, sizeof(*rh) + VLAN_ETH_HLEN);
-	__pskb_pull_tail(skb, len);
+	if (unlikely(!pskb_may_pull(skb, len))) {
+		rp->rx_dropped++;
+		kfree_skb(skb);
+		return num_rcr;
+	}
 
 	rh = (struct rx_pkt_hdr1 *) skb->data;
 	if (np->dev->features & NETIF_F_RXHASH)

-- 
2.55.0

