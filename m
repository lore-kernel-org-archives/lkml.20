Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CD03B6BF1
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790493067; cv=none; b=nXfhllfeBGQd6xNUDMNnm02eEqUSMHGH760XSn3vJdIAEkck+47BBZ3GRFSNiNkBDKeOaGWV+m8yfRXhkn1RFPDLutdCJZ0BZG8xPFwKN1XIypcnGgn96Fe53qlrynaC0k4ZlmsLYcLiQyCuTTOZdluY0AucYd6A00+Xkb1v6lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790493067; c=relaxed/simple;
	bh=0RQ/z4AsypFufaAVkW1Ij7MYV02j0Bqz1PEMbVd8BqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqJ6/fJB1Xb4yKXeoFF2VZUw/j/VQgNNoMLAznpZv6WJkzd8BLmOS/D2yPfQddbYAD0aba5992NKDzMHolTQbrIRaJP9bHjccEqEZzugoUa2u05WqOCLzzOCNEfP3KK1F3bTGqOE1Q68sLWVLAcJaMl/1TKM2gY2v3CTrMcqmjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLImnVpB; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLImnVpB"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-334f6631916so240420eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790493064; x=1791097864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MoYf1WznKmzccMmbZmdq7UQiskOv2xS1v3NBQI1ZhMM=;
        b=XLImnVpBfKD3PnVFr7G0RORZnfsOwB4gxJNtHrbbAKgtuOmg6Se9a/y/3k2A2Ljgfo
         QGXOKb8MvdS5jweVDk6xHdYGra+fUGaQwylI9u4M5Bhl38mE+0AEmFGpfcIZcVdE+qmX
         IsnEe9kt0n8eXj+/4e903RTNVyKxh18mcsEUwElMOp/3XUiYV8X4zX5ReBiLEX5s6WHY
         brvfDWRiPfDMgca+dCWzF9CQCCbjB6p//RiHXYIkjWHFo2zqzCkULVy1ReVI6CLDHopI
         8Ei1g2nuR5V1E3qanIPiD6GnOaNGbWmMteK+1pE+koDVS//CMJT3TEsx7Eta0rHkRsUe
         blZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790493064; x=1791097864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MoYf1WznKmzccMmbZmdq7UQiskOv2xS1v3NBQI1ZhMM=;
        b=0CHpexkVLSc5k9XLjeTmq9rQ7L+bNbWCXKCXrViZqw+6TNq1K4zkGU2sOUhtb2d7zK
         En2LodOWGzhJJXHPqQH2LIS6u8VQroU7MkHjgZkkuF/WAkPZml2x3L1ciYALna4/79Lu
         drDcDKZaV8nggPWKoZuPglbhdaAF+MAm2k4FHgTMSC7c9D78a+IKWsYoOo1sa5eGO++f
         5d/e7PCgn57NdNFSSCOw2jP+URyNTqBxgaewDJm7fCBcVd7qYmf1K1fCizN4na+NQ0eW
         oUSZiRdCBfud2Vjjs51jZfPbAV/81UNY8HZtY71Kv60XyJ/WZ68K/7MUhVr/RrrLUdB9
         JCaA==
X-Forwarded-Encrypted: i=1; AKwUvBxghHkZRslWFDnAGM7ncuzuFv8CZr0pQiNM/lTUYqeh42a5ffugxGR4syCkW9LHMbHTYrKbWonHrClI4fU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEHpFnj4qogpc49c9XiHjk9DQZy9AV6zzbAuoGGW9NQ9sZE3jH
	E5OplTwKsPYub/UsvOy48uNka+D2KOHspO8JQVcSoXaYy4aDvp2I6UFW
X-Gm-Gg: AYBFou0DpG6crWon/3PwdqZz+wX8vwatXs1tUQgaXZ6/5eAoxmswb75BVREZxCYEX9g
	dqeB5EoZe9vgYvIw/readH5TocuPkYEyEVwBjWMPCdzgKtMG76rMqFlG9ETRGOwf/A9iKPBqYuQ
	hpl0k9MuJI9k/3W25Jp+cSB14G4MEQ3PRGZM8EuvvJujPJlypM38Pph/7q/J0dgDMr+Ai4WVWI5
	ZN+z+Xw6TVXiRet+jJdZtAHYz1NU3TnEWnD17GESLcDaRoLKldYjjyLkkkYTvfZ2WSnaabWTswh
	VtGuIU6x7QLkFKblkC0YGhTdbYDpDONAiy04sj6AQHCTHszcQ51Wy/juJNG5dAC8vW7wo6X+e4i
	UMsVteUqyKNoiE1jZ3CrQOtqo0M5LVSOWk05wBYTz5VHPmZOTShwB7wR05Rl6DUurbj0qY/5AzA
	K5Nt6D3NWSX6MtYfkAQ9ChvJHIbn4SUFSHqV2EZhuMZrOmQTOXq9s40F6vm/l9vKefVZ5Yd50fW
	L0ibZgtR4BrR5F0YOvOSyzLXYKvzO6eizI5If+E8u45Orrfnu0+dmsdqez5bzQasCAvI/mTJVlf
	XfCZ
X-Received: by 2002:a05:7300:de0b:b0:341:f4d6:d9a5 with SMTP id 5a478bee46e88-3427169be76mr8534610eec.1.1790493063552;
        Sun, 27 Sep 2026 00:11:03 -0700 (PDT)
Received: from localhost.localdomain (95.169.12.199.16clouds.com. [95.169.12.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341447576b9sm22318886eec.15.2026.09.27.00.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:11:03 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	John Heffner <jheffner@psc.edu>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] ipv4: Fix device use-after-free in ip_skb_dst_mtu()
Date: Sun, 27 Sep 2026 15:10:51 +0800
Message-ID: <20260927071051.3693368-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a socket ignores the path MTU, ip_skb_dst_mtu() reads the device
MTU without RCU protection. The multicast and broadcast output path
through ip_mc_output() can reach this helper without an RCU read lock.
Netfilter releases its internal read lock before calling
ip_finish_output().

A sender can load dst->dev and then be preempted before reading dev->mtu.
Concurrent device unregistration replaces dst->dev with blackhole_netdev
and drops the old device reference. After the grace period and remaining
references drain, the device can be freed before the sender resumes and
reads its MTU, causing a use-after-free.

KASAN reported:

  BUG: KASAN: slab-use-after-free in ip_skb_dst_mtu+0x634/0x740
  Read of size 4 at addr ffff88810921c038 by task poc/98
  Call Trace:
   ip_skb_dst_mtu+0x634/0x740
   __ip_finish_output.part.0+0x22/0x2c0
   ip_mc_output+0x287/0x930
   ip_send_skb+0x11d/0x150
   udp_send_skb+0x63e/0xdf0
   udp_sendmsg+0x1235/0x1da0
   __sys_sendto+0x32c/0x3a0

  Allocated by task 97:
   __kvmalloc_node_noprof+0x1d4/0x620
   alloc_netdev_mqs+0x81/0x12c0
   rtnl_create_link+0xaa3/0xe30
   rtnl_newlink+0xabc/0x1f70

  Freed by task 99:
   kfree+0x131/0x3c0
   device_release+0xc8/0x240
   kobject_put+0x14d/0x280
   netdev_run_todo+0x4cb/0xc70
   rtnl_dellink+0x362/0xa90

Protect the device lookup and MTU read with RCU and use dst_dev_rcu() to
access the device pointer. Keep the MTU limit and headroom calculation
unchanged.

Fixes: 628a5c561890 ("[INET]: Add IP(V6)_PMTUDISC_RPOBE")
Cc: stable@vger.kernel.org
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 include/net/ip.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/net/ip.h b/include/net/ip.h
index 6f602df72ee6..14d6f77f3bb8 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -543,7 +543,9 @@ static inline unsigned int ip_skb_dst_mtu(struct sock *sk,
 		return ip_dst_mtu_maybe_forward(dst, forwarding);
 	}
 
-	mtu = min(READ_ONCE(dst_dev(dst)->mtu), IP_MAX_MTU);
+	rcu_read_lock();
+	mtu = min(READ_ONCE(dst_dev_rcu(dst)->mtu), IP_MAX_MTU);
+	rcu_read_unlock();
 	return mtu - lwtunnel_headroom(dst->lwtstate, mtu);
 }
 
-- 
2.43.0

