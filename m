Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792752355;
	b=zB+ZzCK4IKjrmJ5ZFL4AJGnBiEFx5/+OesQQZFhJbmw7+12BNv36Zuk/i84tcAz6/f/U
	 zO9Z214o25EGjwVn36M/+3Tdvk9YYh6jGAaC8bx8bbC7kIDmKfsOqqRrjfQZCWUEkRPSd
	 KACL6IIfDVjPu8xHvLEQGDCC/5+uIRBYV/xdT7cxaVK+QVkMS0ljXsOmri/2E9yeu/Uev
	 QnbX64jiOG3SEatH1yLg8ZG9m5TRwMtBHo9es+rFKQi+rwsGPXo1jdmQ5Z336FggLw4q3
	 L2TtnKqsVJeLbfCrt7P35I0b25q6+iDFxgE5XS9If5uMDVdjnWnKdXVgmB89qIQKJxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792752355;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/QICUucPpXxojYxCmq3sRU8Eaip6NUcM3x+3QrmGv+8=;
	b=pYoELjSZxaemK/STwJnRQip5QOatbg3fb8bMyEHjwToqtM60QlC4AjGECLnnBg9C5P5+
	 GhnfeN5EQSyqfDIyUGPmlRFdHmshHuviNFoq46HdcyRfaEtQ4jX08P5giFXPENMX/bRdI
	 gpUnfBLkvko3zw9e3sm5iE84JYiaZw+Z/L+vybLZOqZXCqNpzrMkNMMG9iD7VGIrVL+9H
	 8spnrQaT4n0zd5yijau1pWib4rzIwDVTTIzlBCixkuHn5KAgEKPmeZzxvrqxzunR/Bk2F
	 FyEVwSXAv+Hv3WkLWQWefpJuAuhHlleTS6qzaizv+BL40NE/j6PpSogjoiCFt4Mp+Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V+NcyIHQ;
	arc=none smtp.remote-ip=91.218.175.130
Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDBF606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EDBF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V+NcyIHQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=e0Cethm8EB8vXNdwt1eCOrxjlbHI4XfqJVujITYWMIw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792752352; v=1; x=1793357152;
 b=V+NcyIHQGNlL4ANkXw2+HmP2z0N+fTkRRMsljxjqoAnz6HRPRMzojaDIawHsi8JQN5Ba/UqV
 p120TJq6xgbYpuT35AI4qcvRyTtifsukGs7fc2kDTzyOneBEwN6kk+amjAEdN7+ezkDw5YVNN44
 Lpu67SyKCVeXhJ/IVtLIBT7s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 536d72eef6148e6b;
	Fri, 23 Oct 2026 10:45:38 +0000
X-Mizu-Trace-ID: 536d72eef6148e6b
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	stable@vger.kernel.org,
	Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] bonding: fix out-of-bounds read of arp_ip_target
Date: Fri, 23 Oct 2026 18:45:27 +0800
Message-ID: <20261023104528.232427-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arp_ip_target is a module parameter array with BOND_MAX_ARP_TARGETS
entries. In the loop parsing it in bond_check_params(), arp_ip_count is
the number of accepted targets, while i is the index into
arp_ip_target. Invalid and duplicate entries are skipped without
bumping arp_ip_count, so bounding the loop with arp_ip_count lets i run
past the end of arp_ip_target, e.g. 16 targets with one duplicate:

  BUG: KASAN: global-out-of-bounds in bond_check_params.constprop.0+0x1148/0x1440
  Read of size 8 at addr ffffffff96e9ee00 by task swapper/0/1
  Call Trace:
   <TASK>
   dump_stack_lvl+0x91/0xf0
   print_report+0xd1/0x630
   kasan_report+0xf3/0x130
   __asan_report_load8_noabort+0x14/0x30
   bond_check_params.constprop.0+0x1148/0x1440
   bonding_init+0x13/0xe0
   do_one_initcall+0xe7/0x5b0
   kernel_init_freeable+0xa91/0x1120
   kernel_init+0x24/0x220
   ret_from_fork+0x5b3/0x820
   ret_from_fork_asm+0x1a/0x30
   </TASK>

  The buggy address belongs to the variable:
   arp_ip_target+0x80/0xa0

Bound the loop with i instead. arp_ip_count never exceeds i, so it
stays within BOND_MAX_ARP_TARGETS too.

Fixes: 5a5c5fd48e3b ("bonding: arp_ip_count and arp_targets can be wrong")
Cc: stable@vger.kernel.org
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 drivers/net/bonding/bond_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
index 09aa45d71fab..7019e5d8fdc8 100644
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@ -6273,7 +6273,7 @@ static int __init bond_check_params(struct bond_params *params)
 	}
 
 	for (arp_ip_count = 0, i = 0;
-	     (arp_ip_count < BOND_MAX_ARP_TARGETS) && arp_ip_target[i]; i++) {
+	     (i < BOND_MAX_ARP_TARGETS) && arp_ip_target[i]; i++) {
 		__be32 ip;
 
 		/* not a complete check, but good enough to catch mistakes */
-- 
2.43.0

