Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E71408623
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070556; cv=none; b=TO+QYLerLhHPQQCQjPJJnKb47JFnPaBxVBvMRqbS/qpW3vi9s8SXMrJPoi+oQBivZUFoDNuP63eJlkj4G4AcvwRfJqRbGYEVcXz9ZKd+WAyfrR6z0NVIIQ1HtVWzuubo9J2mibV5+owGUtQ1jNyJZvwD4iEZFSGVWqpcukA6jR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070556; c=relaxed/simple;
	bh=A3hZp6S0iVLSHK0F2SHRfV8fdm35uGWaIJU8a37QGP8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rd1YA7T9qcGL9LAUHmJ6ttY37YG6nSQFtU2mylzbiBEHOeg6URpELD59/+2k0aCMXKUMViEldILhfWRFmBmUEMwBVb4V8pPY+Z2tLPNZvwF8puzluCThM1qBkjcbVavrblCA8jc0qsUA4SqHn3XN6RnGlwujc68efHUr/7hBdWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdHeWh2E; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdHeWh2E"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so1368365e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070553; x=1789675353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ly0zpPrI27aaOVayRwfu5QMDzC7RwvjeeGzfZnLG77c=;
        b=QdHeWh2EOqi9mHZ2zFY1OU7P5N2FUR1Gtac7NDIpMd9L7HoWSNgWRU5lXDh4/g/1IF
         o3ubzxqQ+GCsocse9/TvNtSwNkZzQHbgKMkLMwBfxSTICcTphvFVEPMRXxgWkk9cWBNY
         shsCFlgV80mGNvm4xPcPnXqq93lSrK9o5rco21t3rKLFKkxZ4N44FxMa+NclsYfK7d4F
         mLWCzj/BObQNbCwYMml0YMWZI2xj91kPL4kzsEekwq/pUo2GbbwncoyJpK3+elD06jjs
         6s5RgKcdUx+Nyzqhd82u9vSWHWe5kpgw4svrgzRZWBvgN3MStV758iXfEgUN/oSD5Hrd
         u/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070553; x=1789675353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ly0zpPrI27aaOVayRwfu5QMDzC7RwvjeeGzfZnLG77c=;
        b=DE6/2Ts1v862LrdVNpcQ1cfTBdk4fRVpIqey1BeoqbFCrgVmFKECAgXylU/Eoseojw
         SIE2Bv+ATbvQeEBjhXvfOP92aWm+nH0hxvrYw5KWlM3O6Ha9KUMEl0qKvEPYVL4OwUax
         b/5XuMNDTDW7ZBw+zHOXWeIr74D3thezOSVmneuLLO9UNeanDVnpjio2O5vaX1z0Gb0I
         +QrWHDQ4gMpam852y0+5CZaBcMXeAud0jIhEuZLNpBScHe32muBsN93YTBOnOuYZ2Elt
         1TltpLg2SSIMA7YIc01yBdICxUKhUHowxXulhr2Eh1vCF3RCKgJ1OABtJqaDub7YrbWg
         y6ww==
X-Forwarded-Encrypted: i=1; AKwUvByTZ11VCNI5tosdiQ9Z/ejpa8Phvkyoa9OVQOF7SwQSociE9N4OduAALr3AnATLCIs4v5Nllu2DEBGJnq4=@vger.kernel.org
X-Gm-Message-State: AFuF++nEHECC9u31mLz/T7eD6LoaYorM68AQD52HWTMyLf71OVZlrsSn
	wBgPvkk7wH2f0+Zve7ZdA2lqXq1je4DjaERzgKB9vHuPGK8Tat9NHJ3/jKnCg+cY
X-Gm-Gg: AYBFou35iYaDS7q6oBJ7a8QJRLhXTML8EKnY/OUlS8cBsjx43QiD6LtOfXfq5EGePz7
	Tz6CCIC+0D3k8jZHf4r0D1jVhkpd0ogAHrsQ7acBHvPka/1DBagb5hfXo8I6OmA9eyQU9aNMt3l
	jMCj8/kSw9vcHJNWznMaDuIhtH5Db0P4ZHWaJxRP91plTxaSesPZrD7o8FFXjTxx7GsD00Z7c34
	HMFA1is+9Uxj0lZ1GXeVztr2noUMIRZaVMYBVDE2CcugyJslAgQCbKDPWc72O4xxcBoSiAzvmVj
	WdAPrlM+xU3jy7RGfmQTkOCDahrrsoa2LeGf/WazF2L1/kE80Sew9hpII4Pb83rwOQK+O+h6lm+
	pH1MURM+e+muYkJPdETsA0ypDsvo0BQqe+h97aIONkIwdINtydxpxzTo3fF3PogkgmgaGAPg2VQ
	HpfAHyMMXoJpGeawaz2mcpWUIXckZKsKSd0Rw7F7qG3E0+JZLR8QPGhNDOzLTC2t1gf0Y9kq4nq
	x3AR+xDi0+d0z4Rl/Ky729+4VSQu5tJtLN1SvvZA+Wf/8LEZXwjL1O+VGxmDDYX+AjmdFzkDGOT
	4q1Z+XGMZWdtC/2TYUDr6KRLKS2fk8jeV2Y9y/jd8abNtdjWozCVMez2y+yduMWFetB7mlKSkKZ
	Xiuw9ncGYqKz22ymX
X-Received: by 2002:a05:600c:348a:b0:49d:29ab:67f8 with SMTP id 5b1f17b1804b1-49e6108ad2amr10904115e9.12.1789070553232;
        Thu, 10 Sep 2026 13:02:33 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b3d9-b901-601c-58ef-b3f5-74f5.310.pool.telefonica.de. [2a02:3100:b3d9:b901:601c:58ef:b3f5:74f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62227071sm638505e9.3.2026.09.10.13.02.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 13:02:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Phil Sutter <phil@nwl.cc>,
	Fernando Fernandez Mancera <ffmancera@riseup.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] netfilter: nft_synproxy: use the family-aware checksum helper
Date: Thu, 10 Sep 2026 22:02:28 +0200
Message-Id: <20260910200228.5127-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nft_synproxy_do_eval() verifies the TCP checksum before it switches on
skb->protocol.  It uses nf_ip_checksum(), which constructs an IPv4
pseudo header and relies on the IPv4 header checksum when folding the
whole skb.  Neither operation is valid for an IPv6 packet.

A correctly checksummed IPv6 segment can therefore fail verification
when it reaches the hook as CHECKSUM_NONE or, at NF_INET_LOCAL_IN,
CHECKSUM_COMPLETE.  nft_synproxy_do_eval() returns NF_DROP before
nft_synproxy_eval_v6() can send a SYN-ACK.

nft_synproxy_validate() deliberately admits NFPROTO_IPV6 and
NFPROTO_INET, and the xtables counterpart ip6t_SYNPROXY.c already calls
nf_ip6_checksum().

Use nf_checksum() with nft_pf() so the checksum helper dispatches to the
packet family's implementation.

Fixes: ad49d86e07a4 ("netfilter: nf_tables: Add synproxy support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes (testing):
    Testing:
    - Raspberry Pi 400 with bcmgenet and 6.18.39+rpt-rpi-v8: the base kernel
      received IPv6 SYNs but sent no reply.  IPv4 with the same synproxy rule
      and IPv6 without synproxy completed normally.
    - Two x86_64 QEMU guests with pcnet CHECKSUM_NONE receive packets: the
      current-mainline base completed the IPv4 handshake but dropped six
      IPv6 SYNs.  With this patch, both families completed SYN, SYN-ACK and
      ACK.  ICMP controls passed and the invalid-drop counters stayed zero.

 net/netfilter/nft_synproxy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_synproxy.c b/net/netfilter/nft_synproxy.c
index 9ed288c9d168..554a96a000f4 100644
--- a/net/netfilter/nft_synproxy.c
+++ b/net/netfilter/nft_synproxy.c
@@ -118,7 +118,8 @@ static void nft_synproxy_do_eval(const struct nft_synproxy *priv,
 		return;
 	}
 
-	if (nf_ip_checksum(skb, nft_hook(pkt), thoff, IPPROTO_TCP)) {
+	if (nf_checksum(skb, nft_hook(pkt), thoff, IPPROTO_TCP,
+			nft_pf(pkt))) {
 		regs->verdict.code = NF_DROP;
 		return;
 	}

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.53.0

