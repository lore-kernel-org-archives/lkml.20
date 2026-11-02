Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628895;
	b=FrJymGL9VwT1n8lUl9rrlNMDHP2QnxZHv0RvI/ZDGWkZcGNH6W2JPyZRK28iTewSJ7Sb
	 aGe6YhekAR649iASg4VehI/ZJKE2KUJVk+nMyrGst/3SVSwR61Q7NY0mq2ZtDydt1ubIa
	 hY6A56QlzbAUdOJ8+3dnz4QU6fZbnb+oMDvUDW41qT7ydgcl0w6xaLCT19kv6doxXmFwz
	 ZFS7ATgVvuASl/yJBYbm4tqpYGK3jJ9zgPcPw18dLwWkoXJIUilgSC808YLcLgucp0NXV
	 FwNucN23vghj8bvjb/iSFXComgAxT4sUNooHPlpcfvwwx5Da6yYY0EzKBBJCf0+KSvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CaGO1paJM4OjtPkAMNdtAQqBLKhDW2cGrzUnOfVyoyY=;
	b=wt56K485wQH6zE9OGhKMQNu+HVIlT6SMQM0lpVe7jj9YE42qFAS0qpKR3+OU8NcxAYs4
	 Gp8kP0aww/axE1GGkh7JmfH6iOObANQ0KEdrPSeY3rZzok4ZP557+O0abUamub8XNFANT
	 65SnWmQsV8LvZjOeRCAkbBX2sDuD+nZeXMscLLPwpc6N+hHk7/3hdj7NSd89VvRwMPHOy
	 OSNCvd32kwRgHcguWc0xETDH/dGp0qKpB6kC5aHkVzwR1ae54eYMUKPzvt4yAsX2cbtRY
	 iqKjcBEEVqbBtW+HiegkWza7E5EhWeF5QBp9iiyqwkI6JXPwBOYx+ej1v2iRetB4G/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rivtYcgE;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AD660A2613
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AD660A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rivtYcgE
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so5738641eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793628894; x=1794233694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CaGO1paJM4OjtPkAMNdtAQqBLKhDW2cGrzUnOfVyoyY=;
        b=rivtYcgEdPT9DsMLv2bZD97+QGkZScESC3O8iYJZF9q1qDVLt07CSJ3FckAaulHl+Z
         EJOdRKt6thSeVc7XG9pnYOWxsM0xg6rbUT/ev9qH492AMTS6rthnD3rBy5dLU8I8Z+IT
         SjKJpLwkB6idMHuX687ZjyvyfQ/Z6U0np8fVmxFsgDeA+kGSGmc4NKndzUFswP8/YLSa
         8xVVtgPNqRvros9/0EcGmVPNZrUwqyVg8tQPTAninMvj0TXaQ0q0yq+6hgk6qWckETMz
         WN9IFxWoJuZ2i/14fkzsAwvbVmI1ox3fGVJp08tPOi4SEGgx80zoAkN7OhlB4x3fPJ4P
         a0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628894; x=1794233694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaGO1paJM4OjtPkAMNdtAQqBLKhDW2cGrzUnOfVyoyY=;
        b=PwmClnnI1ihEsMLc8aI5EZoUQXuwh+9D+Q25XCjAJ5ULKM+DDWto8ZcVY1W5Ndq+MW
         Y+0DTFCyfFfgstvKQyDMCqi0khjkwECv6qnNr7/a+KvM+mPKQRSeQ+fVkUh8YbNEvrRo
         Tj+WTYz4anPYXXEqdd/yzFbqoUVv+jfASZJshkpZgqF36kiI3WASMRAeqyZ3NEe/Gqow
         Bf4096IPsE6yb/KhqylNHFkr+KMT7vHqKerns+/wVb3wr7JjasnAiBMtx5pMMBV4Qvt0
         KhS/Q7Eoa8tFB4XQCnHY6MtoAldVfOumKwos9GISAbIRVcU71fr2BoOZuZJwNrMrRMqt
         Q1ug==
X-Forwarded-Encrypted: i=1; AKwUvBxsKnV3gaHAzGgFlKAG6QdHZOl8XuvtRuwPuXeOzpki4ixKHwl46KDpx2Erh15lDIiKJzVWB6G4ixVb0RY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rPbZVc7hB+FWane9H9oqjYZ359VtO7jp73mNucIp5geG1BPDR
	LJvpw8ca4t0978ABWX8b7GCRMQ7UnqztniBkpevWoqo11lNH9wA+yLYhb8/d/Q==
X-Gm-Gg: AYBFou0oIxDvrtOTSC8UZYuT/rYxofQcXze1TKAghk6TkYcpRvaPRG9dNfRXURKrGGo
	BwLammwoGA4SobkFGN2H4p8XriKiLF9hge+Zb6/uglf3f4RHY+C0/+A33voLK7vgS2xtnthG1tn
	8+UZmWJcaVnroB6HS5xMouY1zG0x4gsqRQx4/5tdygIAFTVYBkRKnDWkZ0b1o19MrzEvnmYzKIt
	5f8rz9ZUsjsPwh8rLIEVkWsG5sSIIpgmcchKpBGO7anc1HlcNTp+djk7nQR8py/BWGI9eagPRp4
	3hLShJKKPlfAofUsgAYDJ0+zDScVMp1rwHpWJkMzrLoMdbkMj5Qe8P0hl1mnHx343JIpuoP3MEi
	0aThatdV2LH642rr6TDMbHUIphWpDzNSpD3/yotmfj6WPnRL98uS2Ipd6zpSktoOiPGSK7FZWAs
	uO77u4/gobkFI+kaqs+VeYkrhLuZvHddAug/3zuqpnDk45oCmdyXt9HdqkR+ffdgW6NSJzK2x9u
	QXjY3KAF2oqlWlbC4atIkbA8ZQzGfPZTYCLpDrn8gsOpSvNMLFPGAVLiaBfPnFOFxuT8E/ajpCo
	B+JIWVtHlxoNZrbYq9xwE4LBLZEpFDBJenOSbL5BEiYSIKuvZCG3hAV12EQazdwBlXVYGURPK5R
	B+sDxS0LxZ3Hpqoze5u2Nnnj02nEOR14zw7MKPJGLNlwV/MPz8cGHd3bHdFYmFUmPhb2VQNg13c
	Tg
X-Received: by 2002:a05:693c:41d4:10b0:35c:99e1:c755 with SMTP id 5a478bee46e88-36a4242c0e1mr15295070eec.38.1793628894445;
        Mon, 02 Nov 2026 06:14:54 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:9626:1a7c:c4cf:3e3b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm33556442eec.10.2026.11.02.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:14:53 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH 0/2] media: fix em28xx v4l2 init failure refcount underflow and a media core unregister race
Date: Mon,  2 Nov 2026 19:44:37 +0530
Message-ID: <20261102141439.13505-1-kartikey406@gmail.com>
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

syzbot reported a slab-use-after-free in dev_dbg_obj() on the close path
of a video device node. It is triggered when em28xx_v4l2_init() fails
after the video devices are registered while userspace still holds one
of the nodes open:

  https://syzkaller.appspot.com/bug?extid=54648a6c1187a7ef46a6

The cause is a double drop of the initial v4l2_device reference. When
init fails (e.g. in v4l2_mc_create_media_graph()), the unregister_dev
error path drops the initial reference but leaves dev->v4l2 set. On USB
disconnect, em28xx_v4l2_fini() sees the non-NULL pointer and drops the
reference a second time. The refcount underflows, em28xx_free_v4l2()
frees struct em28xx_v4l2 while the file handle is still open, and the
later close() makes v4l2_device_release() call
media_device_unregister_entity() on a media entity embedded in the freed
memory.

Patch 1 clears dev->v4l2 in the init error path, so that
em28xx_v4l2_fini() returns early and does not put the reference again.

With patch 1 applied, the same reproducer hits a second, separate
crash: a general protection fault in ida_free(), called from
__media_device_unregister_entity() via
v4l2_open() -> video_put() -> v4l2_device_release() ->
media_device_unregister_entity(). This is a race in
media_device_unregister_entity(). It checks entity->graph_obj.mdev for
NULL before taking mdev->graph_mutex, but not again afterwards. When
media_device_unregister() runs concurrently on USB disconnect (via
em28xx_release_resources()), it unregisters every entity and clears
graph_obj.mdev while the other thread waits for the mutex. The waiter
then calls __media_device_unregister_entity() with a NULL mdev and
faults on &mdev->entity_internal_idx.

Patch 2 re-checks graph_obj.mdev under graph_mutex and skips the
unregister if the entity is already gone. This GPF has no syzbot report
of its own, so patch 2 carries no Reported-by/Closes tags.

Testing:
Both patches were applied together on top of current mainline master and
tested with syzbot using the reproducer for the bug above. syzbot
reported no crash.

Known limitation:
Patch 2 does not close a remaining window in em28xx. After
media_device_unregister() drops graph_mutex,
em28xx_unregister_media_device() calls media_device_cleanup() and
kfree()s dev->media_dev without waiting for the last video device to be
released. A thread already waiting on graph_mutex could in principle
still lock a freed mutex. A complete fix would tie the media_device
lifetime to the last v4l2_device reference. I left that out because it
is a larger change to em28xx. I am happy to look at it as a follow-up if
the maintainers agree with the approach.

Deepanshu Kartikey (2):
  media: em28xx: clear dev->v4l2 on v4l2 init failure
  media: mc: fix race in media_device_unregister_entity()

 drivers/media/mc/mc-device.c            | 3 ++-
 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0

