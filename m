Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D554E0207
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397008; cv=none; b=XsWlIfBsNx1AldocAN5Cs6PLf1FWZFWMJRA/FWQxJZzO75k9bfPZ9cZPzDhHofF3D1O8Qk9YxYJrmtHFRjiGDYU5gT4THJ0bdQjbpG80xCP4H9LHELvpt+bhxn9e3UH5gXEJ8zld2uGmhCDgN1sg+ntb0tckeXeWokDeC41/L7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397008; c=relaxed/simple;
	bh=2XY23bjEEEbmilzyi/OT0dLNP6D+zOB3zspYb8/aVZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/jZreVQabQsFc/vg696kyBPhCEIdEjFg6dqtBpHrGWUGW4TYjLBPRjstloavGRA3dY+nJwEeCA93vU21TSxVQ0GGST+BTmxcwJvch1hBxL24A6DdvcIbdGcCYimZgG2HGSI533M8vs1q2ez49a68pxgVCI9PoAFNJgpZXSEUtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=qOmy5FJI; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="qOmy5FJI"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917a7c03eb8so36288996d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791397005; x=1792001805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgpiLoGoqA0xV5yWN2rO1XVw1oOPWsG2lgMDpzrz1ts=;
        b=qOmy5FJIFA9FgCRq/fAH4VNPjynO8hT/VcxYkbF6DB+9R9uzsJYBWSg8r0D+5uy0rZ
         vfmmVeQQMv5ZZXmJrMECkVpZ97DB3sy9/ch4lHeAN/ktUuG4QRVDCh8Huey3rZX8G90X
         aVvzXkhmtZRHqYvqyGK52JsjfRZDHVwt9SI1fyJQTg2XbSW157ywLBiOSYDE3k8bjpzR
         tXf2YjeuBU2fapXXNghankocvJPOuTzYWFd4TwBBkMH0KDHdL2OBOZ0I58i+jTvgUCkh
         0n3xow66uh0zXYQz1IOdlX2GRkBrlgA8qgU2Ho/F3nunZyqJqAxFQcIYQyG2d6M3H0ea
         u/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397005; x=1792001805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgpiLoGoqA0xV5yWN2rO1XVw1oOPWsG2lgMDpzrz1ts=;
        b=M3l8kTH+Z+H2TnAGGFnFi54/OviGfeW9ofCkU2upmBkBtg8VLvoKP+eKWmRzDOBYok
         EAzuT5OwbeSNMjYbKdj1EqYfS6r5n105H1kpv2OhUW61uD1TSMOnzC61hRhWALBXdNuC
         NiPPZRzRR8XR1l+gAfYFCAgXXL6hvP1Jrj6+IZacSyGlyIjR1WlRUNGofW3NXwFOEYcY
         L5jtZqw36RYi3DIGnk0FSoVVEl+0muWpukGpJ4YlWttmgU+VQIXJy/XIMYRsdjkrI/BU
         /cFn8ZhMTpHTNg2TCTHhqfqfF9IXYS3lv7gq04zz1AowIApJqjMMIW0gEeMRnrkg+pyd
         bJQA==
X-Forwarded-Encrypted: i=1; AKwUvBwGflCVGBn9KfJCih5SUSPt48IP3V3w9Vp73NGdEGL3G6CXAkKJdy/0jPyUVdbWtQCx4oaGqW+Cnkp3mjs=@vger.kernel.org
X-Gm-Message-State: AFuF++nDY5cvIH59xKbzlMLBimrWGbRPsz54UE3Px3FqroMldVW3o+yv
	DrgR6ZvfX9RH2Mjep/wA0y+qbJsDwR8n2pXEL8Ogkd7kvWeORnTFTvzhlQF82bJ0K9o=
X-Gm-Gg: AYBFou1PNyNpuMdqVJrNDIoHGk4HrIRZLc/BZLiOHL7IqOJfcMyDDvjgm3t9+2hk9Ch
	aT2Wkk7Uris9+GaTZhd1xulYasi6lW9aE4Zp/Ujkr2eISAx8CFAOK9L9dVDH6F85qowUXpHy19m
	ePfQ5GwUy4G6OFk2zx5niyrMHAw0IDWhBviCVPW5dO90TcTSkwSnwOTRdoNtFv16EL0oBk/5M4w
	eKafi+7q2Gtq3NZaqgpWPkFs8Vco1kIIdbtLvICcM4nQInoVl53fd1H64xHP9EJKrMK55OCW2/3
	n0ZQU1aVTXe3t5T2HzpnT/SkA64zH+2CPKQVXOYYLDbwMG2gxJCXPSddwnE7eoKSzqCJFV+6WOe
	ADR/WFY+7Q+NHqmHLiqM4JXCXZEfyeUY9zg6O4ZeWASs5IsdkTh4z8NjVXWhwid144zKD5mp5AU
	ttjilePbXBP0AypHOrWM5Ls8iqy5eMs88OIMGZjrSVJfE2J8BPbPjwfMQpiq3noEO0RCMfFKYuI
	4FbUT2MCB7h8VU=
X-Received: by 2002:a05:6214:2408:b0:90f:5154:6a93 with SMTP id 6a1803df08f44-919977eb9a4mr57210916d6.11.1791397004534;
        Wed, 07 Oct 2026 11:16:44 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919aa0ff38esm986706d6.26.2026.10.07.11.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:16:43 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:19 +0000
Subject: [PATCH net-next 6/9] e1000e: use pskb_may_pull() in the 82571/2/3
 TSO workaround
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-6-9512b0fb977b@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1188;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=2XY23bjEEEbmilzyi/OT0dLNP6D+zOB3zspYb8/aVZ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCZC1nd2AgIaYMzIFdyfEIqZLuxEhag0euZBWHhtKoqomivMvwvOvEoJ6R+5XulLE3AuLwN94C9
 RAHLj79e6mAY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

e1000_xmit_frame() uses __pskb_pull_tail() to pull up to 4 bytes of
payload into the head when the head holds only the TSO headers.  It
already checks the result.  Switch to pskb_may_pull(), which takes the
length the head should end up with and checks it against the skb, so
this driver no longer calls __pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 844f31ab37ad..e216868e15cb 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -5859,8 +5859,8 @@ static netdev_tx_t e1000_xmit_frame(struct sk_buff *skb,
 			unsigned int pull_size;
 
 			pull_size = min_t(unsigned int, 4, skb->data_len);
-			if (!__pskb_pull_tail(skb, pull_size)) {
-				e_err("__pskb_pull_tail failed.\n");
+			if (!pskb_may_pull(skb, len + pull_size)) {
+				e_err("pskb_may_pull failed.\n");
 				dev_kfree_skb_any(skb);
 				return NETDEV_TX_OK;
 			}

-- 
2.55.0

