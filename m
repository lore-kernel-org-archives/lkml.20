Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3B45A297
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493428; cv=none; b=MXZVmNNjXn3vtenMitz1r+n8MKalTpEIOA4SarIhoQ6oEMwMbvW8u9UW473g4N7vy33wBKmLWmA0xhFf0TJKstZPemKmmRwCtEE88wWAUWtFovFBaO0eU+bDzdKu5+SP1iES2I8g4ruIj0ba2xT3jPm0vRAOuWUpTzzznzwSBhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493428; c=relaxed/simple;
	bh=2MH/LzfAfYyw21+HKj408easdoK7+Tc42GivpUT/gq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TSqv9V6TSHBTOjR052JvEgJRMaMhgMqYoLTkm0alo7iQqw5WFN902+4sFp0UtVInc18nTNPeHjDv6pOw+k/eDZ4MxnALi70qySJx6Tbf9cXfy3hw2pU/0iIGYqddJiA7X/nz9cij/dvC038CMAz/YRYoyR16LEIfrWq9PVhlvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=O70eZWfp; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="O70eZWfp"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917a707f37eso37623516d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791493421; x=1792098221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz4PLreF7SMRfFt85q6B38gbUo5+Y+8z8sLQb0vICiM=;
        b=O70eZWfp5eydpaWuMCHfD3EFx7CTyhkq+nTdXfrtOXrjnK6dGxhFu4hB49HcaAU5mq
         DlN7TDiP4adJkCy4SqP73k+DFpqDdBuTpdKrHbCUAT+1dyTASSK/aiZl/6V8jzwFPV/V
         jzkq7M5ko3DiCQEMIfsXdcVa0puuCxFM3Ge9OvWzV64jfhz8JgLMijBjeZxFuIMAuUHP
         tO1aLFriKVSqlh7Nek5LFxWWs7sBz7r3EwdGh7Q/eUwFjBEi7hqklfm+v+JboyPxw/sT
         alfXjqsKzTGbNo3zuRtWheFvQRVUP9p8Nvv6aVyUgG5FyO6fapLMWnY6/dqdXQ7iw8gA
         oSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493421; x=1792098221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4PLreF7SMRfFt85q6B38gbUo5+Y+8z8sLQb0vICiM=;
        b=Fb+ytGpPO2UHSbbXXDWy3ughoOeOIuM+WnEym4ILPmEK/co3oxp6i/AJIPi02CteEb
         7vCA0ByTIBe2lpQ7Lwh+dldfIyNMKyl9yQKo4sXqqm7wBQO4PjhQ3YJ9dd90JdLzGGg+
         VWkNb42QZQMeitg2C6fzmEB7QuI9gQ+JISie4qq7PC8ZQvzqwj+jZERYpxzXBlnZwBGc
         cci1Cru8+ijYv0hfsR2xubKwygMEmauEWwmXAkT0uXA+mOhksFmLCa1NHkzHWBZYPFvS
         luoWhsTqhupTOjMhNPf2iayveX6AhW1l3MTCGmwKVUrbmCSdZ+IwuwfS7PZie0AsDA3d
         GiSg==
X-Forwarded-Encrypted: i=1; AKwUvByMtaoySuEKELaLUAV41D7oIBz6NIfzCEOy4qSnZVlIRz0le0nfKqt4buZPEDzmmb5m838XD65d+A9U43c=@vger.kernel.org
X-Gm-Message-State: AFq9FYINX9uIRjSLjK+QF31ZLX+KEd72O2SSNt8EJgCR4s35Io3CATuw
	LZVfmQOIgr+tWZWlSP2C82MwZy926yCEXSMwlLYicHo9ZYP9lyXuPncBRZye5bRKYUE=
X-Gm-Gg: AYBFou1/GmGhvQDfpRWlh2r6LPbUcQsxEq/DAm8mr9osIzSfrgjRyrJTcPXDT/zxpYQ
	qNM77/uC14s2e4LptDMNOIgPtDHfBlwJedpiuFazbBOLufvymdXpXFRU3XSi/O11GXDSy4U/x10
	juePfAaHJ86irJIbq78R26OCxN5eZEjQfRiDi6/CWVYEdnxU2pRMORqb7ibukHENSYK5KtbUBmu
	ByL+r9a+x8NcTzyXKouvaGg3fBQQpLkjzEhUsrXy2doIUwQBjSgonxPQTLUNCrpRRkyrM9cz8n8
	EKytBNoWV2oecIdtnRg7lNaRtfwVUP5l09TLfKF/fUmkpgmr6W3GEKKbs+1sb/rjAf7Km9q4WMU
	xXky+IBuJZxIBreUpqo6lB5YwNIgQxE+cUXKp7BwF38SljTvgftugmq/lJ9m+N3pIhQTIqheWa1
	a/yr0ZWtiVk7Ecp7M7mxKcStjrhaZZNIlAJKmATsU1mOx6WpPzvCP+Ty9pQpQdTNYOw+f6hQuVU
	bifSQxg2a4W0dQ=
X-Received: by 2002:a05:6214:2b86:b0:919:952e:588d with SMTP id 6a1803df08f44-919978d6737mr122288916d6.56.1791493419767;
        Thu, 08 Oct 2026 14:03:39 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550ce8a5sm77746d6.40.2026.10.08.14.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 14:03:39 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 08 Oct 2026 21:02:55 +0000
Subject: [PATCH net-next v2 08/10] netxen: use pskb_may_pull() to pull
 excess TX frags into the head
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-b4-pskb-pull-tail-drivers-v2-8-8f2bd9bee138@toxicpanda.com>
References: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
In-Reply-To: <20261008-b4-pskb-pull-tail-drivers-v2-0-8f2bd9bee138@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1791493385; l=1424;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=2MH/LzfAfYyw21+HKj408easdoK7+Tc42GivpUT/gq0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKxQbKwa+3oPMIR9/8wstf89TfYBkXylWZ+7HP6SNMiYKVAMjbRgDk4LveZCkr1O9fxCwKO82Xi
 ZBjyd9+CX/ww=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

netxen_nic_xmit_frame() pulls the frags that don't fit in a TX
descriptor into the head with __pskb_pull_tail().  It already checks the
result.  Switch to pskb_may_pull(), which takes the length the head
should end up with and checks it against the skb, so this driver no
longer calls __pskb_pull_tail() directly.

__pskb_pull_tail() also releases empty frags, even when there's nothing
to pull, so if the frags being pulled are all empty it still gets the
frag count under the limit.  pskb_may_pull() returns early in that case,
so follow it with skb_drop_empty_frags().

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
index 67d9bf69f8f2..f5f89ed87d95 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
@@ -2045,7 +2045,8 @@ netxen_nic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
 			delta += skb_frag_size(frag);
 		}
 
-		if (!__pskb_pull_tail(skb, delta))
+		if (!pskb_may_pull(skb, skb_headlen(skb) + delta) ||
+		    skb_drop_empty_frags(skb, GFP_ATOMIC))
 			goto drop_packet;
 
 		frag_count = 1 + skb_shinfo(skb)->nr_frags;

-- 
2.55.0

