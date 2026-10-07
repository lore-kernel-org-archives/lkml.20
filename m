Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E7A4DEC2A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397016; cv=none; b=NnTRxDH4CHtJ/Dkslh8WzwhyaD5FoiUHu4lVn6BG7SDcrrE0/In9e9pJh+VLsXO5tq5jr+Dnldu1+rX9YgxW+GUn4k80Ny0zpoQI0FIeFIV34ABRyrI0SoXr2oZqftRiEPoi8TKEMFEDfknhFDvA0fi5CVrYq8Qns7PnXYJCkEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397016; c=relaxed/simple;
	bh=aE3S/MO9vLOemBhMvEWEtBv4CYrulZjUcAw8T5FEx9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPYQ0QvLRsE2GGANkqysXJ64M04lBb5zAHW3siaLcyOSlYA5rJo8bRF4IXlTB796rsfwibQCPijw+hKv5vSByDyT82PqJqiXm7I/9g/yt2zeLmIoBfQY3/zkJGPb0Pq15KqKtGBhDtgw35jTCHPewDpNlRf7fB20eP0lDxDexa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=phZMt/nm; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="phZMt/nm"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533930955a4so19992161cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397010; x=1792001810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbLtENrG5I00kMX4i+UCiZIr5Qm/AkQbhE28uvMASeM=;
        b=phZMt/nmufB2UOX8QExs+B0insi7qEQd58keteUiSUff+59nBs+4T7aQ0NYM1CaM6m
         oIBw+vu471oZ/TgqD6oWPkHnN4iizvcrGhH1mFQgP+AzTOjEoss1lzpDEaCApKein7eM
         rN86Lfzv0euZe1WaJVvDrJmmnuvSJyu2ilmvwIj7tpUHti20nzP93I1eqhXjmAr2hdPB
         9E8TXZ1YjE8aeGgl45pgDzfYVwd0CNJYUF1c7uJ82DKtrruwwWm3rdgZ2wQIwI/xIBIo
         RENmXtgiytt7usnSxWAPCDSKVB6oR0ttFzqWZkZBw8r7e8AOwJ1/PQzQ2dJi7JaVW3kn
         dqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397010; x=1792001810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbLtENrG5I00kMX4i+UCiZIr5Qm/AkQbhE28uvMASeM=;
        b=B/+DMakLOPP2xbSygCFMmUQPiCgpvL/f/ePk9ngrq55EyjnuVJDpKTxchL2wxP0L+s
         9pN2FdPpv+8RHuz9dtqoU31GXXch7ybQo4cNWsp1Skfw678QPcOGrp5e0j7E7v/UGnbR
         wgLBP23oOYeIqUh8YEmFq1WY6mWAq3o/LxsNngXxE1mdys6MvX9u7exZE9vISR6thhhu
         WjFYj3UxvchvW0Z7TNoKLAXFrw8Z0S+EQY9PmHzO7voYvdeM1FTC6acjN/Lx5v0lPmXU
         N9izkGWxBkBmolQDQuCWL6iu/5S86O37jmpWrTT1UmEknboS5n6mORyZUnp9R6XIl/XH
         g1tQ==
X-Forwarded-Encrypted: i=1; AKwUvBygb2ilNTfscO5p15hE3s8KRDPXkufWPPpUD2YOZbPny9mnSnSRbdFmVTkG3KpTesCqqsvBOLO+VrBsM4o=@vger.kernel.org
X-Gm-Message-State: AFuF++kg8DvTxO6QfcB3rF26sFDWl20gX8dYt2zSfDsa/Z7Kx+jAuy+L
	T4APHyFI5nLJRqrfZXMrYD1cJJQ44NR3F/rvJ1U6T4AWdFq+5ICK0Gn7LBmAGoS1A8s=
X-Gm-Gg: AYBFou0x11GNL4dzW2z+DKOOeOmEDe1vDxOBG0sVvUqUcFX0sQJj1j7x0j7URM6vXLD
	vHGQHRSBq7iJC6FPYdsw1TeXA55XnrkT40ZsTD4LHa5xoknjbyUEqtEc5RKglvvpCHkr8fwfP4Z
	1O71golIkLN++ESymVl4Q3Aa9LkYDG+LYrrNtrPBvD0srIFd/r0KAzWVm8SVVf54Eqg/w2/6uYD
	el/6mc4pjic1WVt9sYterb4O9VqKMQzFQ/0u9r8nqXn18iuoGqasEqEvoeP6axoYCD87Uw4wuKW
	RTpdckjGFCpQMwrvU0hwK5Cn7IxBJbhq1CtNEb2JRm3BPQ+Ez3bJvsmFKaeW32sKcjzWR65R8+7
	8Lt+zE4jMlXdf+N1BY6jgsqMw/yACQ1e5xIAxc0bDSILVBRtf+g2YyhvE//UE9LM1tJB8Q3X4SL
	24Rm6aiKMJWAIMLkYuRNDs6emNdbK0X5fwqZeeuxx4VG290/TCxS2i7WCmFnqwJqdw7OfLV/++e
	p8Ln9UH88BLw18IjC8ZzCWqmA==
X-Received: by 2002:a05:622a:60b:b0:533:94fc:1e69 with SMTP id d75a77b69052e-535755237d0mr54333081cf.21.1791397010017;
        Wed, 07 Oct 2026 11:16:50 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5357214830fsm26034571cf.19.2026.10.07.11.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:16:49 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:22 +0000
Subject: [PATCH net-next 9/9] net: skbuff: don't reset truesize in
 skb_condense() if the pull fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-9-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1285;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=aE3S/MO9vLOemBhMvEWEtBv4CYrulZjUcAw8T5FEx9E=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAKmlD/cXgBiooOoWC6A+H7tw5dWzG4gHatAYnnjbF9tFpPNqC/1rDXMvdLjveUvTCKNu/kJ24U
 cYCfNc2tlrQI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

skb_condense() pulls all of the frag data into the head and then sets
truesize to cover just the head, but it ignores the return value of
__pskb_pull_tail().  If the pull failed, the frags would still be
attached and truesize would undercount them.

It can't fail today.  The caller has checked that the head has room,
that the skb isn't cloned and that the frags are readable, and pulling
all of data_len eats every frag_list skb whole, so nothing is
allocated.  Check the result anyway and leave the skb alone on
failure, so this stays correct if any of that changes.  Use
__skb_linearize(), which is what this pull is.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 43ebe61c7fc4..70df607da05e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -7118,7 +7118,8 @@ void skb_condense(struct sk_buff *skb)
 			return;
 
 		/* Nice, we can free page frag(s) right now */
-		__pskb_pull_tail(skb, skb->data_len);
+		if (__skb_linearize(skb))
+			return;
 	}
 	/* At this point, skb->truesize might be over estimated,
 	 * because skb had a fragment, and fragments do not tell

-- 
2.55.0

