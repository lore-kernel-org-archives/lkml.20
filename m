Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F58E4E13F8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647733; cv=none; b=jc/xT9eSasyLDW6u5iiQpi3e8UtNfBjqBjQPKNWCMwTyGlukmKn1lhXlwmPiwfgDOiaEBekj0uh9d44dOA/7Q8FppyZ5hoi+gS6ddppDO4FCB5aUfY+dM0fOWxGQaf9dXQKES2U+1sHqa2jmPFpRJlF4uZ6sSplQ9E+kxq2Y/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647733; c=relaxed/simple;
	bh=yv9V25MsTxXQ+CtBI34DZGk4K6MHpHhwH3ULOdiBLI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooJxpBvOha8RjJS84bmpNS+Ux89TQ6XM5/0TDsW7smG2oo43EUitXfRaMvG3+3mAMODdq2TgTMJPpk7HU1r/e+F3bgo1KJi62v/14M7YqvAWTcp3wrSQJpvZsYwFQMp0JR4l6jv/EKMbBDNy/JJRXbOCcocI0dnhXK4877EJEz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmAg5uYP; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmAg5uYP"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c7a0so423220a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647725; x=1790252525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUk0T8EqRqX4g3LbdKzV8ANkS9WrPtV8VqMhWs7aAjA=;
        b=YmAg5uYPhAvOEnUeGbBpL7/9s3DSigCAfcDuxs2yvE9I7I+vMnb9DxP4gxhMfrJ1dZ
         ug3XXNEi+vokUNRHCJ5Akq+/1ysGAfdX0lMBFKqJOpYVOuB8j7V8zoBvebpCICOt1z0y
         lo4TIxdN+0rSE9oTH+JmehejK3GigQFnWbRPIEM+bzEJEvsVNiAHYxccWM59piE4vC0K
         J4wOULEin39CDU8IhjVS0tcUyYB/UA4ffKXAY3EfqM1Ki69ygPW3w+2Y+3G/D3Y0Cs9I
         9EfJj8ISOjCsL9WtOD0zN30Quge5/cjBbpOG8ebB7PxU0E04AF+fCXZwwfMGuBCYSmnP
         29wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647725; x=1790252525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUk0T8EqRqX4g3LbdKzV8ANkS9WrPtV8VqMhWs7aAjA=;
        b=aGgRQqBvBB13M7zes2rLDu3XyFhGA4Pj13rOK4bMzFvJMji6fPIjwF/9uoKzbKt74b
         9E1j+paBc4Nb3Vh6MdWI50U957YXnRwgs6d1B2BsqerFVVpm2xD5rcKWb3xBDWx8mId5
         r0L7xY2fB1jdNNHsNU3BgVuE+tI2TdX98Sj822m44pUSiJzFJL8ZlPv8pBB8TLyw9ucV
         ptdVVkboDiGn0QHf90tT7YjXFpt2cOhuo48YZTgGY+3VgEhNtukBFcr0+49FXGr+tCVj
         EryXxu9DRcWMdAW4S3+7OS8wkGFIGuNVlI6gflNWf8pcQon9zn0s25B6KhCcu1kYtdtJ
         Wufg==
X-Forwarded-Encrypted: i=1; AKwUvBy8RLHYkEKGSzfxEKQBeEhVmV1QONgFtsRg6aW2TGLSkDTVreR5orOSGjzoMWU4SjPlJLWVJ5NDtjWcaSo=@vger.kernel.org
X-Gm-Message-State: AFuF++k61ASkUc4TFMjdFdI4pEdojKCIfVYKz5jFmichvj5hizXCznaJ
	F5Gf2HIP6/1Bslx54imtb5EIv16/qGtjyMrwA/NUkxsutN5tcUb8mb6L
X-Gm-Gg: AYBFou25ILkcONAB1OL2kapoZI9qzow5jvs0+7nKwcgq6bzBit+6O+ASS+mgagtur51
	o11b+Qt2UAJupQW4FK499D2k7+FvpbAkSKkzxPjp4jMU9iLsHztVU+BD3e1Bp+D9YUKxneaykYn
	xqiIUes8ZT1MASwEim6sgzgbnHrZa4ylH2IfgzTeTSCt26u25lBoDaaema6IUNGJIr7aHscNqYc
	QAtii9xJZnVDOLU5t4/BfPH90yLdMfNcXWB2gU4Owv6bxJj3OLhgy0W/FzhqOqbOBotHHz/1f0J
	8D7GKz8igH4NHX+MaG2MQl+p7HnPoIb21+hWsqXxARFEL3wLBywIzVCOnnNfQNSDrOdfkkUwta7
	2iBMpD+mwgpqup0i+yTebxLHj/RKoEua4NdHTbxwQjWqBUrktwffYdSC6+fDYJwAW1qTrSdFhcT
	Tg50L2HO9WcnBy+vKQ7UhyhKPYMsoZO5+WF9p5uv2mWxmd1VIQ+YrTVMG17hOcUy5XP0zrwvDKm
	nu0uXkI8sKs4ePqV4GUzoadjrJgLA==
X-Received: by 2002:a17:902:cf03:b0:2db:31d5:1448 with SMTP id d9443c01a7336-2dd8e77cddcmr147673095ad.22.1789647725459;
        Thu, 17 Sep 2026 05:22:05 -0700 (PDT)
Received: from localhost.localdomain ([183.194.144.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16360661eec.9.2026.09.17.05.21.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 05:22:04 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Jiri Pirko <jiri@resnulli.us>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zjamg <ndaugoing@gmail.com>
Subject: [PATCH 0/2] net: fix negative transport offset handling in GSO pkt len calculation
Date: Thu, 17 Sep 2026 20:21:51 +0800
Message-ID: <20260917122153.62722-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes an out-of-bounds read and kernel crash in
qdisc_pkt_len_segs_init() (and similar borrowed logic in sch_cake) when
processing packets whose transport offset has become negative.

Both skb_transport_offset() and skb_inner_transport_offset() return a
signed int. However, qdisc_pkt_len_segs_init() stores the offset into an
unsigned int hdr_len.

When an encapsulated or tagged packet has undergone header operations
(such as skb_vlan_untag() pulling stacked VLAN tags without updating
inner_transport_header, or other header stripping that advances skb->data
past the transport header), the computed offset becomes negative.

Converting this negative int to unsigned int results in a value near
UINT_MAX (e.g. 0xFFFFFFF0). Consequently:

1. pskb_may_pull(skb, hdr_len + sizeof(struct tcphdr)) computes
   0xFFFFFFF0 + 20, which wraps around in 32-bit unsigned arithmetic to 4.
   This passes the check if skb->len >= 4, completely defeating the guard.

2. th = (const struct tcphdr *)(skb->data + hdr_len) zero-extends hdr_len
   to 64 bits, producing a wild pointer ~4 GiB past skb->data.

3. __tcp_hdrlen(th) dereferences th->doff at that address, triggering an
   immediate translation fault / KASAN wild-memory-access panic.

Patch 1 declares hdr_len as int and drops packets with negative offset
via SKB_DROP_REASON_SKB_BAD_GSO.
Patch 2 fixes the corresponding logic borrowed in sch_cake.

Thanks,
zjamg

zjamg (2):
  net: fix OOB read in qdisc_pkt_len_segs_init() on negative transport
    offset
  net/sched: sch_cake: check negative transport offset in
    cake_overhead()

 net/core/dev.c       | 5 ++++-
 net/sched/sch_cake.c | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.53.0
