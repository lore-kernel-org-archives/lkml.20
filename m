Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772820;
	b=Bg6nN7XzTzkJ1rM+nQHgjeu0tsZGhc8ZOiDBmCadhlxnEpH+kIGp/Q9uD3J6tESjOpr9
	 Wkj1rrCdFyQtaV0cZnFxThyC69iFzabG5C/df5xVg1BaoAiEXPUIwa0dzNiYuPxdZcPtl
	 zR75KH6fW7ieJ3RHidtcHXRR7KeDuTbQ2DRVHQltg2liL3c+uPMdY/d4pBXNqwkXwUvs9
	 MM6Flqop7ZCtqd3WJvjz0wCS8ofLAQhjqyNbbI54nvStMU1T9uhgdu/MC1DHa05bpayc2
	 z/2TX2Kdz5d3JaOBzdctH+5wZQJ2s997+wpyknpZkwQfW4uMQtpDoxaKLG1HzRQi4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vj9ktI48o7ufwGrRMOBI3Uxhb/8/rPw557mUsRk3qaM=;
	b=e4UtvlN5YHaZzlanFKDU8x7B/pT270AG64e/Pz6ifnDhCT/JA1bEMWro/Z6mq6OSo/zu
	 dgqMqKRTV/pWHBkWXjSiS7qZuXDr0kLxoDIVcwJ4g/bo0Sd3jz7XJP/L3/lJka7jb24p5
	 NX6eP7RGWFDuoEcdbkOzjesCYfvPEdEuf+qCo49ybOVRnQqvK0ncrS0Fe0GxeZG1txxQu
	 eMm5ZuQYTfLkUPwBugdopv6H6CSoKyN8QNWDRj/OYISDnAF0rmfy0sf1BiwAr0d56+9Jl
	 V1YobWm9EzE8dO0FH9lWpxdUBBcYy+ynH042BJ6yIcTWKRBQh8c7AgQyESKmgewAkkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I+iLkkqw;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B4D606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B4D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I+iLkkqw
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so443414eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793772817; x=1794377617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vj9ktI48o7ufwGrRMOBI3Uxhb/8/rPw557mUsRk3qaM=;
        b=I+iLkkqwfwuAggym/kUWMbPAvyClX/edd9SOd5Q+2Ht2LKoaF0iJJaSlkQDacb6gU1
         QPfWhvVsHabfsJUSytf0Z09bkekWtKfMPViypQRq9cPQR87bw+TBN6ZGB89hC8I4M3ZL
         iGMMPkRlJZInSUAhsI9zwvlMDmcd2UvAT+nIQ6oHd6PSqz32CVURE5IA3WSuDmAJGnCt
         tIFKq/uqSL/5nGMeIcRa0Uy868XTDdnCa9ipaWh5d4ZrmBoC7MK8DXSjXGOpwCWIEqQd
         CF37MBLtALZ+bW44NRfcXRmHXl6AKQyVoRuIyZD9dHpefYrnarn1jelFxBobWgB0DiXX
         3B9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772817; x=1794377617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vj9ktI48o7ufwGrRMOBI3Uxhb/8/rPw557mUsRk3qaM=;
        b=Yv5OWWMHl5AdLUJRD9r5uxliOoZbbl9HfEGSEz6mUAKUnYa9ggDtQrC7zZRh9/K+Al
         LAmKQzBjjEj4w4BeG4d7hVarg4Mzxw33Q6So6mz1sMwadEggi3rPJ0usVul/8WPqNNh0
         3hKzYZTQy63/4f/KKWT/wC0Nd6K20h/WxFy6SZiGd/WVOgoKLh2G2WoqYUHNes+SK7dH
         48NXD1/bM87WARg9yJOupcLPAnHk4lTYV2DnC/DOotcAjCnzN1g7sj6f8+T76zxf4mtc
         ZK+UX88b95tccZjTR4j6DB6m7UuNLuWkuUFIRlbI8eJE7S0uLGmdm1fnBnTvZfSyEbJ9
         IyjQ==
X-Forwarded-Encrypted: i=1; AKwUvByNbAlUpaJIP1saaISatVeAqFX2zcocIXFMWoUdF2MmU55QiPXFarnSlqjvEcV/SWKW4OCIvLIEhVIrdhc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iPITv41nUaN/wr3SOwVxX92AO1oRuh0zUzMXnEF8pWs+f5Z2T
	YyaRARt/2TwL3PSUjSugaHAJaplROiSBfE9KWRgi1Hh1TGpa3W0yWXiBfBGh4eef2Uks733Lm+h
	Ol+K92AY=
X-Gm-Gg: AYBFou3mcup2D7+ALjhSAyzNfQ7P0NtQKg8seJabe/TOm69IiRF8H7IPsQ5wbuB3jAr
	9iP9jSU9TFsHcQ9U7nKZIEBEcXLV2rXrDcC7bxjuAh842YW0U6Jc9gYQDbGoI1spqcS5epIBtOa
	aoUOsbqH94VBMRmkppOPxe0qKhTeXG3Ytcaq2VrEs7Y2kyv7fHQ005MsMBnAzxpdlt3UcjSjIyl
	pmJjPIS1Bq58RJshQAFAEZ6+f3NTIH+9RMY2dD0KBwIuwbV0hVQjttRaHR+6TnUaMAi6Bh1vnKL
	+pt8bmqmxYOQFS+7GwLmgAMq/t5XVg4eAmLPQ2aybqvB88tlizzH95YaVaaiMlHy6u7kNqdnSga
	gHBFaQZEPisDZF/m7JSODqjie1gDOzDaLbx+aMYYI36b4eNuUfwcl02QYg7vAVgUrJZzSvzS0kq
	Wjr2xZOXyf+xnV3JCinaNYbKj5qmQvn8P8ysy9g+ZVUsKKkOcQlb2MSM2kHgC03A3rxEdzdsRrc
	IkThYbImDM4uKhKrMrC3vKKGsAgr+Fr49jWf9h4oNYLLHaymoIY+9etX5lr8bj4+XKWaP6wRC8h
	kjmlU3WV6XwHp8LuLHqHJY8N03FCeDaaPNUOV6HeOaFtppPJEzhuygsaJz0rH1JL/AKJMHorAk+
	ny/0ESyTNwYdbaXlxgwopaazL4XeGG5rzUYO570vfmz2dgJ5mOblt3dTaYw==
X-Received: by 2002:a05:7300:d58d:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36a4221aca2mr24932065eec.5.1793772816686;
        Tue, 03 Nov 2026 22:13:36 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38fe477sm3776719eec.17.2026.11.03.22.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:13:36 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH net] gve: bound the device reported rule count in the flow rules query
Date: Wed,  4 Nov 2026 15:13:29 +0900
Message-ID: <20261104061329.1881388-1-yhlee@isslab.korea.ac.kr>
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

gve_adminq_process_flow_rules_query() turns num_queried_rules, which the
device wrote into the admin queue buffer, into a copy length:

	num_queried_rules = be32_to_cpu(descriptor->num_queried_rules);
	rule_info = (void *)(descriptor + 1);
	...
	rule_info_len = num_queried_rules *
			sizeof(*flow_rules_cache->rules_cache);
	if (sizeof(*descriptor) + rule_info_len != total_memory_len) {
		dev_err(&priv->dev->dev, "flow rules query is out of memory.\n");
		return -ENOMEM;
	}

	memcpy(flow_rules_cache->rules_cache, rule_info, rule_info_len);

Nothing bounds that length.  The test above does not, because
total_memory_len is descriptor->total_length and the same device wrote it,
so it only asks the device to agree with itself.

There are two consequences.  For GVE_FLOW_RULE_QUERY_RULES the copy runs
past the cache: at 47 rules it writes 4136 bytes into the 4048 byte
rules_cache, and rules_cache_num is then set to that count for the ethtool
paths to walk.  For GVE_FLOW_RULE_QUERY_IDS the destination is large
enough, but the descriptor and the rule array share one
GVE_ADMINQ_BUFFER_SIZE block and the array starts after the descriptor, so
counts of 1021 to 1024 read past that 4096 byte block.  Those words reach
userspace through ETHTOOL_GRXCLSRLALL, which needs no CAP_NET_ADMIN
because net/ethtool/ioctl.c exempts it, and gve_get_flow_rule_ids() asks
the device again on every call.

Bound the count by the space the array actually has, the admin queue
buffer less the descriptor, before the multiply that cannot then overflow
either.  That is 46 rules and 1020 ids, and it is never larger than the
destination cache.  The total_length test stays, since it still catches a
descriptor whose payload was truncated.

Reproduced with a KUnit harness that injects the device reply and is not
part of this patch.  Unpatched, 47 rules gave the report below, and 1021
and 1024 ids copied 4084 and 4096 bytes from the descriptor's end, 4 and
16 bytes past the block.  With the patch all three are rejected with
-EINVAL, and 46 rules and 1020 ids still work.

  BUG: KASAN: slab-out-of-bounds in gve_adminq_process_flow_rules_query+0xe7/0x390
  Write of size 4136 at addr ffff8880027ae000 by task kunit_try_catch/33

  CPU: 0 UID: 0 PID: 33 Comm: kunit_try_catch Tainted: G                 N  7.3.0-dirty #8 PREEMPT(lazy)
  Tainted: [N]=TEST
  Call Trace:
   <TASK>
   dump_stack_lvl+0x3f/0x50
   print_report+0xcd/0x620
   ? gve_adminq_process_flow_rules_query+0xe7/0x390
   kasan_report+0xde/0x110
   ? gve_adminq_process_flow_rules_query+0xe7/0x390
   kasan_check_range+0x105/0x1b0
   __asan_memcpy+0x3c/0x60
   gve_adminq_process_flow_rules_query+0xe7/0x390
   gve_fr_rules_overflow_test+0xc9/0x430
   ? __pfx_gve_fr_rules_overflow_test+0x10/0x10
   ? __pfx___set_cpus_allowed_ptr+0x10/0x10
   ? __pfx_read_tsc+0x10/0x10
   ? ktime_get_ts64+0x192/0x250
   kunit_try_run_case+0x1ca/0x4b0
   ? __pfx_kunit_try_run_case+0x10/0x10
   ? kthread_affine_node+0x247/0x360
   ? __pfx_kthread_affine_node+0x10/0x10
   ? __pfx_kunit_try_run_case+0x10/0x10
   ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
   kunit_generic_run_threadfn_adapter+0x7b/0xe0
   kthread+0x36a/0x4f0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x34d/0x620
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x22/0xde0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x19/0x30
   </TASK>

  Allocated by task 33:
   kasan_save_stack+0x33/0x60
   kasan_save_track+0x14/0x30
   __kasan_kmalloc+0x8f/0xa0
   __kvmalloc_node_noprof+0x1e8/0x4e0
   gve_fr_ctx_init+0x24d/0x920
   gve_fr_rules_overflow_test+0xae/0x430
   kunit_try_run_case+0x1ca/0x4b0
   kunit_generic_run_threadfn_adapter+0x7b/0xe0
   kthread+0x36a/0x4f0
   ret_from_fork+0x34d/0x620
   ret_from_fork_asm+0x19/0x30

  The buggy address belongs to the object at ffff8880027ae000
   which belongs to the cache kmalloc-4k of size 4096
  The buggy address is located 0 bytes inside of
   allocated 4048-byte region [ffff8880027ae000, ffff8880027aefd0)

  The buggy address belongs to the physical page:
  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x27a8
  head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
  flags: 0x4000000000000040(head|zone=1)
  page_type: f5(slab)
  raw: 4000000000000040 ffff888001042140 dead000000000122 0000000000000000
  raw: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
  head: 4000000000000040 ffff888001042140 dead000000000122 0000000000000000
  head: 0000000000000000 0000000000040004 00000000f5000000 0000000000000000
  head: 4000000000000003 ffffea000009ea01 00000000ffffffff 00000000ffffffff
  head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
  page dumped because: kasan: bad access detected

  Memory state around the buggy address:
   ffff8880027aee80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   ffff8880027aef00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  >ffff8880027aef80: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
                                                   ^
   ffff8880027af000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
   ffff8880027af080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc

Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/net/ethernet/google/gve/gve_adminq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c b/drivers/net/ethernet/google/gve/gve_adminq.c
index 8b215fca9c1b63..02c1f398f6e395 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -1542,14 +1542,20 @@ static int gve_adminq_process_flow_rules_query(struct gve_priv *priv, u16 query_
 {
 	struct gve_flow_rules_cache *flow_rules_cache = &priv->flow_rules_cache;
 	u32 num_queried_rules, total_memory_len, rule_info_len;
+	u32 rule_info_max_len;
 	void *rule_info;
 
 	total_memory_len = be32_to_cpu(descriptor->total_length);
 	num_queried_rules = be32_to_cpu(descriptor->num_queried_rules);
 	rule_info = (void *)(descriptor + 1);
+	rule_info_max_len = GVE_ADMINQ_BUFFER_SIZE - sizeof(*descriptor);
 
 	switch (query_opcode) {
 	case GVE_FLOW_RULE_QUERY_RULES:
+		if (num_queried_rules >
+		    rule_info_max_len / sizeof(*flow_rules_cache->rules_cache))
+			return -EINVAL;
+
 		rule_info_len = num_queried_rules * sizeof(*flow_rules_cache->rules_cache);
 		if (sizeof(*descriptor) + rule_info_len != total_memory_len) {
 			dev_err(&priv->dev->dev, "flow rules query is out of memory.\n");
@@ -1560,6 +1566,10 @@ static int gve_adminq_process_flow_rules_query(struct gve_priv *priv, u16 query_
 		flow_rules_cache->rules_cache_num = num_queried_rules;
 		break;
 	case GVE_FLOW_RULE_QUERY_IDS:
+		if (num_queried_rules >
+		    rule_info_max_len / sizeof(*flow_rules_cache->rule_ids_cache))
+			return -EINVAL;
+
 		rule_info_len = num_queried_rules * sizeof(*flow_rules_cache->rule_ids_cache);
 		if (sizeof(*descriptor) + rule_info_len != total_memory_len) {
 			dev_err(&priv->dev->dev, "flow rule ids query is out of memory.\n");

base-commit: 787268686c64be60023743b527645a907e38ccca
-- 
2.43.0

