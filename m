Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F847481664
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139019; cv=none; b=n1GATUu2WrmnD2FLsPCd5pji7S6i61uBJI+3F2ynGQUWpcHxu87CQyzeawArYZkxwoXzd/CxdV3h5Dvfk3Z0L7JmBpr0bkpJ+NJvIXXd1DvsG26t9G2+H5/5aXHMpV2YxhZKNBK/H466CompjyVeVhAE+dFx2SfoK3OZSf6eBnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139019; c=relaxed/simple;
	bh=AYG17D6Wl8lQoyFM4SrlS0/FBrq5A+9TZGeoLoVaYeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WM3YxU+R2ENRzQP9UPCYwGiEMlfhQ3+NxnNvxi7RBr6T8tn5M/Cgji8WdmqN715yh0D3yR4FYNNxudv2xlHOSjHwdSr/oJpDWqUeIkrDrcLPIhNyJi+ag8tWATvj4SyO5Bo12Djj81DTDYynch/e88LNI/1cZAvVAcGqi/or7gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOW2axp2; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOW2axp2"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7e13e2a77so187158a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791139017; x=1791743817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BuiyGQCsGUvMKzQTzVwhfdyik8CFWRCmKc+QiofMxYQ=;
        b=XOW2axp2c42uPXcmkE8aHp3pjzTed9oD08UXqBkLTTK0sHKWbuE9IaO31388jNgBvM
         DeUsXaT1EOyMV+mpKIxGsOKb/x35ciT0+iYvNV7Jmp9HoAc3tH5EyXEmQMAJL/LSjrkk
         r6HyV91jHqrcLHn8ZpjAi4nbKOxSU33Zr24DkfFQuetFulkt0wqqVTlxxAT7Iy+oSeL/
         293iVE2B5fiUbmKMok33QD+fmsLlWM+oBZFQ7n5hJlksIj6gZsOi+t3JU54hPifiFLIJ
         Jx21k1ljvdEsQpmQvs9mn/onpnCxg43/KvpknC5QEBda0ny9bjy0Wn4Qhz/HswayS10X
         bgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791139017; x=1791743817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BuiyGQCsGUvMKzQTzVwhfdyik8CFWRCmKc+QiofMxYQ=;
        b=P/V9OXe4UlvuXIw73J/RWVUfxTxrn7plBpAwqKp/8ESHlEOsO57tzID3sxcGZ/JqXT
         Dm2AXezTAmyjUKgmewczEWvMU7aOd//4BtSPaCH15KhjoS/okTFf3p3+zO5kpOdsHm5b
         VjJ8d/b2xtTWyYLZyOf3uKCtacZo4RZFkToKt+S73PwnCEo74Qx5axZeraAJOqERhfgt
         gwM2/DrlVpT2ttaB7u36RRc4ZWybE3oS686DtbepAFet+vpk/lA8NOnsmZJJI2OE0A/b
         BQgyEIEbnEgyfBTfE1jvXfZ3B42buxMlL4Buh8eH4mnVVzDMtl/FRoEJHGnajhnH7Esz
         a0rA==
X-Forwarded-Encrypted: i=1; AKwUvBxBR5K250cb4ycB9wId6yQqRTvXvGVHNDDnZtNakMybgMyVAI7gB0D/nzQgBYSbYjbYGAel4hfHHJtBkN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx+X2AAk466RrydHSV4T2E47T+FM/8CQYBXMFodL19x1HFaOBI
	qVSUKBKoplzR82UnDVSGLursW4FXOHUl7t4m4jItsm2Ax+Q44lD2MzuU
X-Gm-Gg: AYBFou1w3FiRpl3nlxeq4qZ8pqk06vmpFNR8BF7aDm8SekbSb5lwrjdMKCM6v3BJPP1
	0ozIGl+D3KniwvPtITwmoJ0kmB3sgaXg1ePq9M3Nq9liB/z0nrMQ9QaFwYenqMpZsvQEzkMHO1Z
	6i9M+okhnjW+aqZDVF0qHdVJSCatDYqKJXXCy3a9GYTaj/ALKwIniCpCQw3g0eGu4On3COD0HUx
	IiWKotH3bTqWoUzTlHfOX8G2JHOJSgn2Z4xwRbuepVlVR8l2T7Fy5pAHlvbdNATwpU4NngNccTk
	C8EtajYjMIcyi0LxNZeOS0C6Hb0+wvWcVeSwvG8KywEN63OtfetPJAdS/S8KAdeBwpjWdWwOANy
	hX8JMo35B3p8sq8oFmpEqm9sKkDwBH97X4mjlh5V9gb2p9OvQ+L8DUcuC/HCCsBVr0KY2lcUNz3
	8mOPGHormtSueYEX3Qj+ugiOqb+LbolpaTyg2Jue1uT92MVlWNIvAiYFQZCG2YY/cZG+SJBn8Ob
	Avvn6Bmqh8=
X-Received: by 2002:a17:90b:5106:b0:39e:2192:97dc with SMTP id 98e67ed59e1d1-3a78351960fmr3378126a91.6.1791139017312;
        Sun, 04 Oct 2026 11:36:57 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4262cfsm7522854a91.6.2026.10.04.11.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:36:56 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v2 1/2] ipv6: serialize address publication with device teardown
Date: Mon,  5 Oct 2026 03:36:38 +0900
Message-ID: <20261004183639.3773498-2-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261004183639.3773498-1-4ncienth@gmail.com>
References: <20261004183639.3773498-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipv6_add_addr() checks idev state before allocating an ifaddr, but
publishes the object later. addrconf_ifdown() can mark and detach the
idev between the check and publication.

This happens when a non-loopback device MTU falls below IPV6_MIN_MTU. A
forced interleaving published an address on a dead idev, and later device
deletion waited indefinitely for the leaked references.

Protect the dead indication with idev->lock and keep that lock across
both hash and device-list publication. Recheck both dead and
disable_ipv6 before publishing. If teardown wins, reject the unpublished
object.

Fixes: 8814c4b53381 ("[IPV6] ADDRCONF: Convert addrconf_lock to RCU.")
Cc: stable@vger.kernel.org
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv6/addrconf.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index c90ee6dd7446cd..426739abb07440 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -1168,14 +1168,20 @@ ipv6_add_addr(struct inet6_dev *idev, struct ifa6_config *cfg,
 
 	rcu_read_lock();
 
-	err = ipv6_add_addr_hash(idev->dev, ifa);
+	write_lock_bh(&idev->lock);
+
+	if (idev->dead)
+		err = -ENODEV;
+	else if (READ_ONCE(idev->cnf.disable_ipv6))
+		err = -EACCES;
+	else
+		err = ipv6_add_addr_hash(idev->dev, ifa);
 	if (err < 0) {
+		write_unlock_bh(&idev->lock);
 		rcu_read_unlock();
 		goto out;
 	}
 
-	write_lock_bh(&idev->lock);
-
 	/* Add to inet6_dev unicast addr list. */
 	ipv6_link_dev_addr(idev, ifa);
 
@@ -3897,7 +3903,9 @@ static int addrconf_ifdown(struct net_device *dev, bool unregister)
 	 *	   Do not dev_put!
 	 */
 	if (unregister) {
+		write_lock_bh(&idev->lock);
 		WRITE_ONCE(idev->dead, 1);
+		write_unlock_bh(&idev->lock);
 
 		/* protected by rtnl_lock */
 		RCU_INIT_POINTER(dev->ip6_ptr, NULL);
-- 
2.55.0

