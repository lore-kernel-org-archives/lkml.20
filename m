Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832853;
	b=XNJrMqVrZMm+0LE1exUlGCDssTYAOEP9DwF74TCdJ/4ZTyMBpaCsJ4OXVTGeaPOwJytF
	 WgwkQFD4OK6Ax2FtAdNcQ8QA6tNiQ4ExL6qn+KPMHkCHR5nzJOENJ/a25MF8FbVYbpaU/
	 /fhQvB0IXiJshBgQ/hALb10XDe4GxMXE2ib0w5NPJE2zdITo4BVbo0A1ZME9vPJk8keOT
	 Xs+y8IAyB+E/wW8EekavaGX0u9PRe9H15MzoG6ghRfF/ZoYQoti4bKg36uwG6/UKBUP+n
	 Lfq4sC5PCTTjUug07OGnWMjE8ehbjUNPNCooDdjKsFNo1YqwtAMHAL7g8jX1UqStahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Y+w5BW6OIJpaIiG+ViK5HqW8ZESkaD2jY5QKwGClmw=;
	b=2megAcWz3nldTU/hKWq2utF8VXNPLXJlKlZWrYm1gGY86CykaAjNgqAG8jW8e0C5eYN9
	 ZIaDkdex0JOpZMFPFTm9PsI8ncq99EDKNrwam0kpGee56tim8z/KMl6pxscVrCbxN5W/9
	 1EZ/QGJXTevT+F7fGKa6gsVpf1/WDJ6Qkn5OTOe74al9Y1/1F79P9lXg3oYNKJ6EVBXJH
	 f1pTMfhDpWA0u+GU2TQtPsYNirh7saPQB3n6M2CCe03IH3WLLyYvWuNktBqkQat0gbyrS
	 E16bFaxu5KLiqGLuuV2V57z8CJpKnriBrfllU27BU5t4q9y2j2l/Bm2RmR/U/JFhIxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0Fzeo07;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DB606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 062DB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0Fzeo07
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-86288992de5so3029033a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832852; x=1795437652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Y+w5BW6OIJpaIiG+ViK5HqW8ZESkaD2jY5QKwGClmw=;
        b=Z0Fzeo075bZN77RomANlawJdtpvPJWRw30R8A0yMlWSmrV9xS+lSHUwrbYQ3Y8Nh9s
         epLkqEZExPULIb8JunxwmFDFdpcoDgLVlu9UfgYWxdxuhGWXZ9osi711VhOQWq++81Iv
         9C7lm2t2pZq0bUpE28wJ6MfXX1tL6mmqzpTFWQrdi5PTOuDfqe4DDkn6N1IHhVbl2pvA
         3v8kJ1/qVsNJSuYnFlgawAshz9oftKjTzs9rsOAXkBc9wI3dIroiJZjipoJTK5DFedFG
         va5gnGcxlv8EHbJSLQnxhmkH9zD0hrFrZiIS5iBzdkmQsG6SY9Wtzo3N0+EBvGjDil51
         f2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832852; x=1795437652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Y+w5BW6OIJpaIiG+ViK5HqW8ZESkaD2jY5QKwGClmw=;
        b=VYDGG6Qv473aJ9PKFIjiN4mMUu+2Uwe3POB6982+/e5zAMKGOhZarUvXQUF2/DpW0y
         1q0LaeJmuQ4xdRiqbXmNzdmHQxBC0EZzN5uXuvmf7uWr7gZvz2bDXncT2p0CfhpopldX
         JNtTlY/j5J1FGKeXkw9lJPh7oDXjfzWNPRimg8NpZcM4TV6Dp4QwqObxbjN7D0U0wNEy
         A8nwjUPI+s4C0+h483gc/m1JAt0AwziOGtz9DaSYdGYlgyOa+R4uDezP6H0gQvy5HhUc
         Q1i1vx1Ye1gVwoxW6cOjNPYGrx/8B+vpxIP+oWK2F9k4N1b0SSpX/d+X63nwNI9eA6/+
         sqUg==
X-Forwarded-Encrypted: i=1; AL+hErGSpNnDg1U7tE+wioWNu6TqC75xncHMXE8/Fg2C/OA4MriRI19PB/3BqDAwrv800E0ZLRX+W4SyWaG5ms0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8apOyQpYVcJekyqPV346u2bBDqzWiQ6jl9obE5nfvDuC9XXLBI
	RUDdwiEwwiBt+JvpD679687GKyuTjzZZuRqlLLmvZ9TDIF/HH5a7xtY+
X-Gm-Gg: AYBFou3W6vvHONfTCvF+VNogzqinklAfkNFMi8zHSFWnnupD9HeX/NiCmaUqDgl9NCn
	27QFt9b//BFc9dpomTRdw2xZCesgj5iY0tkRMeivMOJ1+mW/xblWMY6fUCWT4e2BJdNJkr1C3bU
	gLK4X32BhVzkYAuoFDg2H+q8NPxWHgjwjJT3Fi8TUeHgargdqMqMy9Nr7rzNU1kV93sVZzMnWKK
	yLdiBx0IjOCSuSr00nvL7hiXU3KrvGaHtIrAOPjcYJu8LkcvkP6Rgupfrx6VhV5qBMTmfg4qE19
	EBGQ8HlxFdGiGXjpIkOnN/UF501c7obz0pyoNoK6NLky+7JAv5LV9esHXhgrkkHffR3Mwa+GZ7Q
	yHywlhB7G2tOJs8J1/j6DLLHqlSTF8MeuOTtF3LzectQ9K1pLODOCStUwCbjw5Z3hQAwEzEQLXT
	PL+lvTRUWlN9pOFfJ5+CTpAIh6fboibY2a9/MBBqYh3DWeRqF7QghKUp211VSohsogl9NDK3Alv
	430WQqx6ixYgAjz9yGvUQbeoLIXcicMt8h8/CPd2UY7Y4ceEjIJoBjd87fY3YLDqtN5ifXyjJGv
	cTv6WLZE5SffHVgDiUHvRU5igJ+xiQK9TwS8MukzWXODqM3MyEK9I31XQ03nPcHzUE8HUIR4GhF
	12nhvWc5hybC23eYqO0+twQ8WTGpSyvZHmEtIf/axb9JHXuTYHuCJ7w1xZatgSQNWtOXQApLXrQ
	==
X-Received: by 2002:a05:6830:917:b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-86152678b21mr11542797a34.9.1794832851876;
        Mon, 16 Nov 2026 04:40:51 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c4dd9abesm2830937a34.20.2026.11.16.04.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:40:51 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v7 2/2] selftests: net: test joining genetlink groups no family owns
Date: Mon, 16 Nov 2026 12:40:30 +0000
Message-Id: <20261116124030.1595567-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
References: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
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

Check that a Generic Netlink group ID no family owns cannot be joined:

- setsockopt(NETLINK_ADD_MEMBERSHIP) on a free ID fails with ENOENT,
  and still works on an owned group.
- bind() with a mask of free IDs succeeds and joins nothing. With an
  owned group in the mask, it joins only that group.
- A socket bound to the free IDs is not a member of the NET_DM groups
  after drop_monitor is loaded. Skipped when NET_DM is already
  registered or drop_monitor is not available.

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 109 +++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 85f51a30c6a1..a765bc77e14c 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -74,6 +74,7 @@ TEST_PROGS := \
 	netns-name.sh \
 	netns-sysctl.sh \
 	nk_qlease.py \
+	nl_genl_mcast.py \
 	nl_netdev.py \
 	nl_nlctrl.py \
 	pmtu.sh \
diff --git a/tools/testing/selftests/net/nl_genl_mcast.py b/tools/testing/selftests/net/nl_genl_mcast.py
new file mode 100755
index 000000000000..71fba0280440
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,109 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Tests for joining Generic Netlink multicast groups that no family owns.
+"""
+
+import socket
+
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_raises
+from lib.py import KsftSkipEx, NlctrlFamily, NlError
+
+NETLINK_GENERIC = 16
+SOL_NETLINK = 270
+NETLINK_ADD_MEMBERSHIP = 1
+NETLINK_LIST_MEMBERSHIPS = 9
+
+
+def _groups(fam):
+    """Return the multicast groups of a family as {name: id}."""
+    return {g['name']: g['id']
+            for grp in fam.get('mcast-groups', []) for g in grp.values()}
+
+
+def _free_ids(ctrl):
+    """Return the IDs in 1..32 that no family owns."""
+    owned = set()
+    for fam in ctrl.getfamily({}, dump=True):
+        owned.update(_groups(fam).values())
+    free = [gid for gid in range(1, 33) if gid not in owned]
+    if not free:
+        raise KsftSkipEx("no free group ID in 1..32")
+    return free
+
+
+def _sock():
+    return socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, NETLINK_GENERIC)
+
+
+def _members(sk):
+    buf = sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64)
+    return int.from_bytes(buf, 'little')
+
+
+def _bit(gid):
+    return 1 << (gid - 1)
+
+
+def _notify_id(ctrl):
+    return _groups(ctrl.getfamily({'family-name': 'nlctrl'}))['notify']
+
+
+def join_free(ctrl) -> None:
+    """setsockopt() on an ID no family owns fails with ENOENT."""
+    sk = _sock()
+    sk.bind((0, 0))
+    for gid in _free_ids(ctrl):
+        # ENOENT
+        with ksft_raises(FileNotFoundError):
+            sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, gid)
+
+    notify = _notify_id(ctrl)
+    sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, notify)
+    ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_mask(ctrl) -> None:
+    """bind() skips the IDs no family owns and joins the others."""
+    free = sum(_bit(gid) for gid in _free_ids(ctrl))
+    notify = _notify_id(ctrl)
+
+    sk = _sock()
+    sk.bind((0, free))
+    ksft_eq(_members(sk), 0)
+
+    sk = _sock()
+    sk.bind((0, free | _bit(notify)))
+    ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_before_family(ctrl) -> None:
+    """A free ID joined with bind() stays unjoined when a family takes it."""
+    names = [fam['family-name'] for fam in ctrl.getfamily({}, dump=True)]
+    if 'NET_DM' in names:
+        raise KsftSkipEx("NET_DM is already registered")
+
+    sk = _sock()
+    sk.bind((0, sum(_bit(gid) for gid in _free_ids(ctrl))))
+
+    # Looking up the family loads drop_monitor.
+    try:
+        ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
+    except NlError as e:
+        raise KsftSkipEx("drop_monitor is not available") from e
+
+    for name, gid in ids.items():
+        ksft_eq(_members(sk) & _bit(gid), 0,
+                comment=f"member of NET_DM {name}")
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+    ctrl = NlctrlFamily()
+    ksft_run([join_free, bind_mask, bind_before_family], args=(ctrl, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.25.1

