Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A337DABD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131016; cv=none; b=M9N/wKOP2Taqh68sYVsuYRy6tAErr90P9G0D7GNuoUIyF6lGZB1J9AXQlCcg/yE6CcNwX8bZWU4afhC5NMwyD04m0L8mqU/haKYjWGPISFdcaZTnFaZDrwhKgiC3gRX1Mz/7GCtdDoSdeAM8xL5EQEGhX8H+G+fHrSCaCirGxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131016; c=relaxed/simple;
	bh=rfclI43Gt0jOxEzPCEKf62xMSKmmsFMZNhF9lP4Mfck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6EpWGNGNVBc9aQocFA91dOvnTkYshuJuRryvw+cFZj5QwvH20s5Slap7TDuNK0MQux5yxPA8EoEEeToFL5gLNfLfsdWBPBoAP7MJadvWfY/woW+lBxNoBppLbsVUtu+hfkoRAKrPrDFyaNsSJpe3kkCTOshEztJmnhOTl5TPzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgn96mft; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgn96mft"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15354aa70e8so2093472c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131014; x=1792735814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kItInSB7Il0bFX5rQnMMdEMc2ibDWAXPMzy5j1ycaRI=;
        b=Hgn96mftoFUSxo+xbH2o0Ww2+oSKGIq0bq0wOwcpWtah898wMdDR1+GjATgw8IU+mx
         K5ja4y8FQzij2GjCiwjhmswLB1O+lvjhbh4JHmCPMVlt5kIxsRbZmnTYNAjXknZDa7Ep
         uFcxF0eBAhJDOJKapYWvcA7ZD0jZIHudK50rdjyjTnbxsb1tTUTZf14oXXPGm9xZo6Zw
         8Cd3gxY6z+GmprqdJSjAjs9gksjDh+LDU1QhQsgWC1B+gAQCPcaUPDn/9JT5M6Q35jDO
         vmm5F3WqMvLGE/gAofa1ioYAkm9gxTMQzFBZr3h77VJrw4I7mjoeUVZrrqOcR3ZmB/q9
         +ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131014; x=1792735814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kItInSB7Il0bFX5rQnMMdEMc2ibDWAXPMzy5j1ycaRI=;
        b=JxpI0ERnlqL30m2fR7t+ovHqS5ofj+jHEdjLVPcMW7sH5CipMSmXB3tmFO2snV+Suy
         iHUPNDPkJs8uBCbUiTgJldvPkHsH7py3ejpz/NTUkFWnqpaEDz4FWNp2xUZUDD9gRezX
         Bpsq/NVGGAULmqMhcsFJ4st/xKkXAhCRnuVOChuSgsCoEABBadKZF+iA/oP9T0tASqQR
         rym1HQY6KgBi3V+NbB9pnKhnVRe5T/H+7L5bXCybuLsvo4BlwLWEwm5kv+G0p7+6AKGg
         nm9uxtE/Ip7JO0R2r2WOfyJBuxxft68WEts70WTGS+U2iOof1i4BZ3cfoGwA5WbyM+0Y
         QNoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHYimQFTCo0JBnwONHx+i62+yBm7q/r2jKFLDUtnclWsM9xyh1veU8qtwARZja+CakxgmylhqrcLXi0l8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmo3hnWyl1zi9reqkRJRV55R6wXPxxykrfYOcx2ICb/eERh4kx
	brQXXIBEKuxNjYqhSke1znuP5Dyo00vFPvCzFLkRDvLIe0xuMA6oTZQlXEXfs1LuKMQ=
X-Gm-Gg: AYBFou3pDPIvTgQSKncD1RP8ZcnhheoVIP1sxarjcYRynSb03eXrKBg3nbaSjzQ507Y
	/ZbeyjhCi9rtQ+71QPj62REtCL2oHfs4LOeCggJJ6eTQ5Bz28LUG6M3qclKZndhI/SHXG85T5m+
	G5xDe18PmgGGs9StIpXl9DXH+5EUErPn3kT1qpTuNHPPFDW1koKS7XTCqs79bPQeKiuB9TKdFaR
	mpelCwzzCgmWBFFJGGxOqpk2bqZLMlNsmC7/xuF+JsIL6pTNi0BymC1174ULGMBn72hB41HPmqp
	tCO7wzYcmAJ0mIijOtizvJ6Kx5kkPZ7qlQHqrHZv0uDM6fv3DEPry/+MZ8dO2CZUFxzen9kX7LC
	mYXXfjkSEEZV70ctBIZSx0WMTwmVIWxqlIKgyjA4o6XI4symDyXHlQdbPIwHKcUboNeBWn9yE+C
	n2QQNQ9NJGTXWJWuKgUl0swd4hcqoP6kjsCzHEyII0GANFdUyvmIOJ29ilpo6OJdC4jUOOnWit0
	5cK
X-Received: by 2002:a05:7022:3f0c:b0:151:2e62:fe8d with SMTP id a92af1059eb24-16a5dcf817bmr31111126c88.9.1792131014345;
        Thu, 15 Oct 2026 23:10:14 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm3309068c88.4.2026.10.15.23.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:10:13 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 16 Oct 2026 14:09:55 +0800
Subject: [PATCH net-next 3/3] net: remove rcu_barrier() from
 __dev_change_net_namespace()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-bug-net-netns-move-rcu-barrier-v1-3-4157d798658f@gmail.com>
References: <20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com>
In-Reply-To: <20261016-bug-net-netns-move-rcu-barrier-v1-0-4157d798658f@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Commit 6549dd43c043 ("net: dev: fix the incorrect hold of net
namespace's lo device") added rcu_barrier() before
NETDEV_UNREGISTER_FINAL in dev_change_net_namespace(), so that dst
entries released by RCU callbacks were on the dst garbage list before
dst_ifdown() moved them to the loopback device of the old netns.
Commit 070f2d7e264a ("net: Drop NETDEV_UNREGISTER_FINAL") removed the
event but kept the barrier, and dead dst entries now point to
blackhole_netdev instead of a loopback device.

The barrier waits for the RCU callbacks pending on every CPU while RTNL
is held, which takes a full grace period on each netns move. Container
and sandbox managers move one end of a veth pair for every new network
namespace, so this limits how fast such namespaces can be created on the
whole system, regardless of how many threads create them.

Remove the barrier. The RCU callbacks queued by NETDEV_UNREGISTER
handlers free memory and drop device references, which the move does not
wait for. Cached IPv4 and IPv6 routes through the moved device are
rejected once its netns changes, since rt_genid and fib6_sernum are now
unique across netns.

Creating 400 netns, each with a veth pair whose host end is moved back
to the initial netns, a tap device, addresses and routes, in a 16 vCPU
guest, median of 5 runs:

                   before      after
  1 thread        68 /s      440 /s
  4 threads       74 /s      409 /s
  16 threads      77 /s      283 /s

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 net/core/dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 8eb9bf1ff9eb6..ef172905109ee 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -12994,7 +12994,6 @@ int __dev_change_net_namespace(struct net_device *dev, struct net *net,
 	 * the device is just moving and can keep their slaves up.
 	 */
 	call_netdevice_notifiers(NETDEV_UNREGISTER, dev);
-	rcu_barrier();
 
 	new_nsid = peernet2id_alloc(dev_net(dev), net, GFP_KERNEL);
 

-- 
2.43.0

