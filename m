Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852AF2F260C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789250047; cv=none; b=m9y+McJs/wGP9pI1f/wcEe40XXFB125AffXU6r7PSYRDumMZDP1PylsQqTYYG+oLwAaeWNl1bswmz/LTuM9o4oG2cpNGBRyrLql8UlGrl1oaa/4oR8Cul+ABw4Yf7+i4t9xwNMW16Pu8LtXptw2f3nWL1viiV+r96/HUIwnNX/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789250047; c=relaxed/simple;
	bh=2w2Xokvxv3Zza1WDoW8p2uRdZXNP1otSV6DskpOG3dI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d2dQOwh5NpitVWueC20JY1pj5qAZ2BvHkNGOYv5sply2DQwdFGDhMJK4A7nq49QsH2xTIdBbwq4WHrJ7OqDcEgPKdRyJfzwWLarRJw7hDgpcqPor0e91qAq4/tAHTElRvwFw+bj/lRoy4cLUnjE2VoS3uSYLjxCX7ZSgQrD1fYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=DdKdcAs4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="DdKdcAs4"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79fbso4992025ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789250045; x=1789854845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LExfl2fEFs87Gnc/CJkjB7Li4LuphLalhWsojqEvmUw=;
        b=DdKdcAs4Mkks026c4JirbiMixV+VsGamJLs0A3tnPo8pyDznWN6I8epdMOHy2xRDIe
         I8u13BrmTf4HnT13J8EmO/5+eiRiiHDHzdhjpCVgfFykDGDPD0PEJ+ncX1VMGG9ZQXFA
         UyipmaCrHpK4St1rYih95O5EOgNjRjaZmgOyp4/2WtGfKJ5vqPWThpztHdsBgLz4rUa8
         xyKw1cvR3rufdAaUFNmjYDnxMcX+TqMURtLTMMudPm2uby5+4cSMPC7T727SJUZrNRwy
         EaUfge23gyjPo00VpGQ2a4CW/71LWMw5bYrHCcodVvx6toH52YNF0PLaHFg4J/CIx+aZ
         MNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789250045; x=1789854845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LExfl2fEFs87Gnc/CJkjB7Li4LuphLalhWsojqEvmUw=;
        b=QJJ6VjJ0LNpTwhss841WycaOz7tlSeZzQd/vJQyu/8tzMsnelfbNN4JewFymU4eetE
         4j88gHYlGuOFzanqnawHZ7HzXC3ygynJrEmY3Bs+EpZDmzbFDTNx53rFahXBwrmH/Ufr
         7oQfdbOjsQt9Lmmepim+57oF34gBCPI3Z0Nluw2+SufuOUIutKv5eEQtMG7NP9w6xKWR
         r2Lco8Qa7RI5cE33b2NV8UqEbkPjRWckDkRiB/HvE2Lh9snENubHSF5gba1h9gy/tYFy
         mSMfsivi5PG8IzUt03HLnxXM5XoHrUgmJQC0Ppsh4qciGsP8e5tlPYHxVcil3ZP+jaOS
         Myhw==
X-Forwarded-Encrypted: i=1; AKwUvBzGGJ95ptp/7J5kCQxbbB4/fHGcCIc+D6NAcXGcAtEG4qrcduV50P6h/yXjTiqap1KIX0/LPqGh3dhhbww=@vger.kernel.org
X-Gm-Message-State: AFuF++lAKVWIfdI5FbHo7K+mkZJItBWbtBq/fZyL83cAXVPLaLmJrQhm
	GvzD3L4bVWpgxwg4eGXeSRMMeH987K519IIdjTXczHTybrvj5yiPfrZEOrDwClj2uw==
X-Gm-Gg: AYBFou1+NFj7vw6jP7wb4YdeKh5FOxquIKIwwaaeaKu45vQ+CLyZBzS/46zgiNDc8um
	mwtduzJ3HPZHQnfQMUsO7K4HQjnNvvGQUD0bo5rpcLN8ElaIs65SzHFKkcLh2njYDBFwgQlXFHc
	/YKCgaGjASyx0LO4foWJyab5N46gKmckWT9kNFmMlY6PJ32aoYMJ8qJR6ghjyMsu262VUaF4RIi
	yoP5TYX7r5+xFolebpV4N7CCLo6NOn+xmHVHCy20IIul/ZOG8XtnypS2rNHIALa+d0wf23IhL4q
	RPKw4+GXMHTpAczldQYkoCv+9PxUuMcNnSsSC+7ANT5bb/p+3NEBFy9YcTzGbO+/LyXgz71+zyl
	eYfwJDMqJVdVyqRZrBvFA/kvnCdeXsjAp1rQ57fmV5Y8J86UAplWqF9e/C4TpPa2ZvCBqvh1DG5
	k3Yqo/k6Z1IRf5iK99FExoxigSXriGqPuMMwR/WKCmyKp77RjrFpP8+HdAHGBOJG6LEFF6EiFxx
	lUWnGRt4PsKGbIhbrNT8VOfYiGABcQS2PXLqhRzzRZQ5tXOSbPis6Lw
X-Received: by 2002:a17:903:19cf:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2dd2a1ea679mr208126375ad.7.1789250044780;
        Sat, 12 Sep 2026 14:54:04 -0700 (PDT)
Received: from xps.tailc0aff1.ts.net (149-169-99-5.nat.asu.edu. [149.169.99.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4efc398sm18474475eec.19.2026.09.12.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 14:54:04 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: mst@redhat.com,
	jasowangio@gmail.com,
	eperezma@redhat.com,
	xuanzhuo@linux.alibaba.com
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	co+6dcbccedc9ec6452@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] vdpa: fix double free of the reply skb in vdpa_nl_cmd_dev_config_get_doit()
Date: Sat, 12 Sep 2026 14:54:01 -0700
Message-ID: <20260912215401.126194-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

genlmsg_reply() consumes the reply skb on every outcome: netlink_unicast()
frees it whether it queues it, drops it, or bails out early.
vdpa_nl_cmd_dev_config_get_doit() lets its return value fall through to the
shared error label, which calls nlmsg_free(msg) again and double-frees the
sk_buff on any reply failure. The failure is reachable unprivileged:
VDPA_CMD_DEV_CONFIG_GET carries no GENL_ADMIN_PERM, so batching several
requests into one sendto() on a socket with a shrunken SO_RCVBUF fills the
receive queue, and netlink_attachskb() then takes its MSG_DONTWAIT path,
freeing the skb and returning -EAGAIN.

Set msg to NULL once genlmsg_reply() has consumed it so the shared exit
path frees the skb only on the early error gotos that still own it;
nlmsg_free(NULL) is a no-op.

  BUG: KASAN: slab-use-after-free in sk_skb_reason_drop (net/core/skbuff.c:1220)
  Read of size 4 at addr ffff88800d99d49c by task exploit/147
  Call Trace:
   sk_skb_reason_drop (net/core/skbuff.c:1220)
   vdpa_nl_cmd_dev_config_get_doit (drivers/vdpa/vdpa.c:1324)
   genl_family_rcv_msg_doit (net/netlink/genetlink.c:1114)
   genl_rcv_msg (net/netlink/genetlink.c:1194)
   netlink_rcv_skb (net/netlink/af_netlink.c:2556)
   genl_rcv (net/netlink/genetlink.c:1218)
   netlink_unicast (net/netlink/af_netlink.c:1345)
   netlink_sendmsg (net/netlink/af_netlink.c:1900)
   __sys_sendto (net/socket.c:2281)
   __x64_sys_sendto (net/socket.c:2284)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

  The buggy address belongs to the object at ffff88800d99d3c0
   which belongs to the cache skbuff_head_cache of size 232
  The buggy address is located 220 bytes inside of
   freed 232-byte region [ffff88800d99d3c0, ffff88800d99d4a8)

Fixes: ad69dd0bf26b ("vdpa: Introduce query of device config layout")
Reported-by: co+6dcbccedc9ec6452@bugs.sh
Closes: https://lore.kernel.org/all/ILTHcT8oe1HP47sY25JVxssvKmkCTjYlX9Hs%40bugs.sh/
Assisted-by: Claude:claude-opus-5
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 drivers/vdpa/vdpa.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
index 47c6c3d23f5c..6455f837dd26 100644
--- a/drivers/vdpa/vdpa.c
+++ b/drivers/vdpa/vdpa.c
@@ -1313,15 +1313,16 @@ static int vdpa_nl_cmd_dev_config_get_doit(struct sk_buff *skb, struct genl_info
 	}
 	err = vdpa_dev_config_fill(vdev, msg, info->snd_portid, info->snd_seq,
 				   0, info->extack);
-	if (!err)
+	if (!err) {
 		err = genlmsg_reply(msg, info);
+		msg = NULL;
+	}
 
 mdev_err:
 	put_device(dev);
 dev_err:
 	up_read(&vdpa_dev_lock);
-	if (err)
-		nlmsg_free(msg);
+	nlmsg_free(msg);
 	return err;
 }
 
-- 
2.43.0

