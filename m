Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659881;
	b=PMSPlCZZmKN3es3ERLvFo2xb77j7ucUJsouPupTpNaX0ZXXKKEYFRi+MtkXMBImISXrW
	 SpAyBIfwchHkBe1IGKs70rlZrVB2X+tS6slZ7isZdHSQfG88HTjLnb3uTPoLmztrCwgaR
	 Z0lbMRWYA5Bhgozp6Q4yntTIG6bDj485iyrvnEjojq8Flr4wKKIcG3uO00RzGqNyjePVW
	 1wb+TKxGp8zcRSXXx7KTayn27ZoiJ0GuaydUq2kg1C4/wGIXhfgyyCChXz15K6b9rm9+j
	 9ae0Z9zaj9WH0fGYzkX4rzY7i/MFEAIcNzEKAZn9OtWiZ+n2TrJgVUT32/SWUqKFDrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ppDEP6lrPx9xfq6MNzv2Y3tsqjuRimolFRwRFB5o2fM=;
	b=QHDZoFyMh08AokPeAMnZb/TbKHsBERcv/LGqSZOGSbt/Wp7Oiypy8wtvaMKboxmmfehr
	 3ILWWC4p+6xrGWMd4KcfNrXLWHtrMN7jfDkwMfn0T37JEgnm8bMfcVmEak7Sz8wmrveKL
	 /Ha6puCHqGPD7SQI7oMCDHUVMS6j+TfzBl6jzfJwHDD5ODsfJ/5Fi/HlfKDTRmlXgngpR
	 o9Y/LmmtVfV4rNRIITB1vbAk7zuGyKMng1kQLGRyhbF6toG/yZkp5DSrjqn0MFP9JWQNd
	 2eT+KXMu8trQyjzqGNJfvnj5nd6Cy+gTrDb+dYLIMqFnWqEsX62GoCkdYTR7VxRJPOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IJoTo9rd;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DBD606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2DBD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IJoTo9rd
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36681e85e87so3430854eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659880; x=1793264680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ppDEP6lrPx9xfq6MNzv2Y3tsqjuRimolFRwRFB5o2fM=;
        b=IJoTo9rdAbqSFGz7b2xuHJqrpSv6xT2Ady6/lLee/5qVeEyyXOkCyV96qbzMgPwj0W
         +0J9MGjZ7iIBfUYZ94hoNQZO9XRc670630CqdJhhkIpjjgyZIG9CRcDZLPNP/pr9XsCT
         rJ4kypdqrTipRYZvi7doTrwORMDoo0TUDRZCWSxIbsBPVHdhiatbzRJFOsb0c6wLubon
         pvxIto8AG+NOBe+7yW1Bw98BFOpQymH2v6fNfb2EZxVPlfrguSsGPLZhaqDY8pG7Fd8j
         UdjuzfoDmh3M5C4b12KYgA6HAnQowB0LvOvKJ9PlowEfkrt2Dl8Ip3AuvrrH5C88yUyB
         yzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659880; x=1793264680;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ppDEP6lrPx9xfq6MNzv2Y3tsqjuRimolFRwRFB5o2fM=;
        b=WldkHiyDXQ6wzZHGShvRUQPldKy+xAatPsRLZo0+2H3l5YpCkeV/yQ2mfyCog0DrTs
         +mtOj4mWVmgcZmK2pO89nzlPPue/Z8mSVZEBmAmqDbWaMn6bVPMudArYglz/vE4Mh9VV
         J1pEvEk3FAsm5HC+UJbga+KdB+TS9AIzbPGwJGDGpT9oBwihrZRWgPwofnsm5NKtEKJN
         ljKWIU3cAnI2MIzy0ufBUljko8yWV1FNJ12njiQD7Kc6qU8U9NTtCbirA6Po0mq9yzJB
         16/AYrnWmMfmGUpepRsKa58PffroYDVIuN8E7bQl7SZ2NAZI0zyzqxbB0G0SsISzyVk0
         m+FQ==
X-Forwarded-Encrypted: i=1; AKwUvByjHJlqQiko+ZWBF2NZo8rrndvPLKD5fO4tAttRqqq02SKvMD6aNLfCsK2wyBcYAH/CL/1cBirgu1c775s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhxujd5WBCK6lm+8yafiejA6UNCh5PDjlMmLAWdfzcbSXkYxa7
	T7D3ccaN4EquurkF0L8S6uixfkTn7kb+i2QWzYFlw8iKtgjVYj0fAlNv
X-Gm-Gg: AYBFou3lKDtWBNeN5Obiryl/5bsV+xlwwe6cjC+yqz/+FPdagVcsSwttEsZLUp46Izm
	2oCnMZ2sUzGJ9aCBayZiaqPLrQplwwKRMMt4EptckYpWBOERECP5xsWsGMSmRo4ePuuVG4/a3ha
	ImHwWgwgcKji0DgOQeH/uetV4Bpbe9APv1/Kx2xrGRWeQJnRFCPpdhzk46GoDpbrKsKf2robP19
	PPKHvmf1ObrN8qPfnY1aeVlkvBqHFDalnNcUQLz1k/w78itbnty5gIDDTWOiqLt8zTw01SS37Ew
	Mt5bhZdyOdNYRu3Hp5nkRyUaQRFfQg2zo9LBnpbN0n8hXf9CsiV3xOCkWpRKdJPU979yL4E+e3b
	i8y8dj1xUMCI3Dp/5/4N9r4tDBzHtJgWVEBuA0t/+Qh/Md1DRebvludUfjQXDpwvtKwJ01wa1aQ
	BOMzECXL7/qpSpdL5AWrwG5VpG0+dIFBFtOzmqtlGtKdT8s4MoiiQZc37z+BIORVLhOmgtPQ1ss
	JJDjji1J09Fk/baSviM/OSVor2/jlLPZWxkc5detmdwnjfFQxNGpH0+4KfNTnSfVesXYyQBlcxG
	bO/TZt9ANzp+WdowZxE=
X-Received: by 2002:a05:693c:620c:b0:356:b370:a0ee with SMTP id 5a478bee46e88-3674e15fa01mr7570801eec.20.1792659879720;
        Thu, 22 Oct 2026 02:04:39 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411b4145sm16789928eec.15.2026.10.22.02.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:04:39 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: late FDB learning can outlive an MRP port
Date: Thu, 22 Oct 2026 02:04:31 -0700
Message-Id: <20261022090431.3641707-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

An MRP-aware bridge port can remain in BR_STATE_FORWARDING during
del_nbp().  The terminal br_fdb_delete_by_port() runs before
netdev_rx_handler_unregister(), so a frame received in that window can
learn a new FDB entry whose dst is the port being deleted.  No second
FDB sweep follows.  The port is then RCU-freed, leaving the FDB entry
with a stale net_bridge_port pointer.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1, with KASAN+UBSAN:

  BUG: KASAN: slab-use-after-free in br_forward+0x55/0x3c0
  Read of size 8
    br_forward
    br_handle_frame_finish
    br_handle_frame
  Allocated by:
    new_nbp
    br_add_if
  Freed by:
    kfree
    kobject_put
    rcu_core

The failing sequence is:

  br_stp_disable_port() leaves the MRP-aware port forwarding
  br_mrp_del_impl() restores BR_STATE_FORWARDING
  br_fdb_delete_by_port()
  ... late ingress frame learns fdb->dst == p ...
  netdev_rx_handler_unregister()
  call_rcu(&p->rcu, destroy_nbp_rcu)
  later frame -> br_forward(stale dst)

This reproduced in three independent VM boots.  The target bridge code
was unchanged.  Because the test VM has no driver that accepts
SWITCHDEV_OBJ_ID_MRP, a small diagnostic switchdev endpoint claimed the
MRP object and widened the already-existing post-FDB-flush/pre-unregister
window.  It did not replace bridge logic, modify FDB entries, or alter
net_bridge_port lifetime.

The deletion path should stop new RX processing before the final FDB
sweep, or drain the deferred/FDB state after the RX handler is
unregistered and before queueing the port for RCU free.

I found no matching upstream fix.  Candidate BR-007, BR-040 and BR-058
are consequences of this same root cause.  BR-040 gives the forwarding
window; BR-058 independently describes the stale-FDB lifetime.

The reproducer, module source, and complete serial logs are available
on request.

This was found with AI-assisted source analysis and fuzzing; the kernel
behavior above was reproduced under KASAN.

Thanks,
Cheng Yongkang
