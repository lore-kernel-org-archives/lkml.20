Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631728;
	b=di5YaIDaBQWyb/9HT7rgIPJY6oyMNeAVtKqi9VIfP3D18Tuzowa/d/TcZx2jx8pG/Qon
	 Gc5G9eXbqb3TFC8DcU+hxz7IwBa4sXeiurwa0MR2MBij324RvlWUJtaq52Olnj3DZ23Xf
	 TN6pQaViPp/1ad9tvi+mqa+/eVUXb8q/AjxqxyuulFpC8uMXuM6JXLY4YByrrdPwiF+Rp
	 m8NNWMJP4nEuiaKMOjuAjquwB60ePc/paZz+aRY7nrlbXT8gjYNDdhRbihFdPuEa/UZe0
	 AGgenEg1XYiHsUlo+Rd5dntqSEXJeVVKOQmkW+G+vruTu8qKL3t2Wj9sRJTYWn++NYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vMjwo8cmw5PTMuLBYGwQtehcqEVVHRxZCPBH9RAmfLM=;
	b=n8YALxBfOkgShigwpYRwWfL7kGHZDXqMX4TJKx7j/7EX/0t4IqmpI1TGw5BJJQq3GQOc
	 NpC83G/nNf/3Jcx3e7Kp/A9kCH+Z3h2zgIg9bDHw3rb/srpAgzKb6EJPw6u5FbgXIIbt6
	 UkAlaYbQJFWHQad40P6NUl93+dVoHmOrjpvgpBU5qOzuSoC1dQ5UycMkSDMxVOpLWaLFh
	 7nYylK6xdLAhvWLkggShaE+zalh1nykgMEP5kbRKFTysOJK8jpyFfwXz69sZmW7y2wU6E
	 usc30LZE+S+5D25WCtFRS8W5vWcnrEBWiJt7tAu89GGaQjv4+KzIk/i2FCoxHHYB5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwxnj0DD;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7D60A382C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C7D60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwxnj0DD
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-18cdcfc05ffso3524280c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631727; x=1794236527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMjwo8cmw5PTMuLBYGwQtehcqEVVHRxZCPBH9RAmfLM=;
        b=xwxnj0DD1DKAFVLGNqn/LX/iHKyCUG5RpZ06KLrANvWczMx7mNH3POOJaQTlSKKzRX
         cZokFQKAXKVzNglOBI+mQ4XVUBXTw3W0475HWABkQPnUVW1CHwj5YTChR68ZEugPnfvV
         VR7yyicuAN3XPeGZ8SHMJtyfpwb1LLZSI3s+OVfQd/VHWnC/0G3nYNVyrxSnGZpDVkry
         O1qqcfiVmZjs2LNHitVY20/0RrsRk0HpKvjncr6ifd6OwHirJ4jFSDXYiULwnPsLuvUX
         5MbjirEj6mMVPT6QVtRrDz3RXhx558Mz5K4uQlOzS1WbBAOylrFf7qch6ZcRJMh+w1G2
         O24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631727; x=1794236527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMjwo8cmw5PTMuLBYGwQtehcqEVVHRxZCPBH9RAmfLM=;
        b=kNTMAcpfAVCDuXmGCpiGIDHh62Lcqqph5279GCtDDSH9POXib0wK+l1Uqg948+MZil
         LBwfQibl3uavoDqEJxGcA+OEV1IM/feLktye3F1Xl830Gtj+8yaxR3aWHKp91ZSWMJTU
         8Om8BoKNLA2ggHyW8unUF5V1nXwK+2Lfz3Lqs/BGjeWdvrYLwM4qnC3Xcn+8dm/IwyCo
         Dij3wPkP2yajg7w2x3vsSSI/81TuTIjkdpNVdoDJP8avTJm4mlyPQeBg9CBh0mOuxEVj
         Opo79aP0Idu7Pui9YAj0RV816AatJu6rZf6eryKCkt4Te5Bsa3t9nu2ZE2Yd0fUmvHwh
         9CAA==
X-Forwarded-Encrypted: i=1; AKwUvBxSSMDsANaDZQD8Eoao+zrfYi8yJigdcwYAUJwrh4wB4OOwUAQ+eto4sm+YHHYRNfH0p3QB3l9IgJLZgEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIc8l730GV3JLFRArIR9xyTvvpxbLlPouTHL214MLKsL+wztjzi
	GQ0kl3CEBiKk/+IRSYWYTpOde4JDjmkwA94DT527yLWk0oDIf/Ynx5Dm
X-Gm-Gg: AYBFou1oWD+Egr4aZx7RFhthZf7if2LTK8qs9GOougps+j3i9euI1baFXB0qChF21+J
	kn3hghnnytFnD7ZXtIMFIfo6CSIyw+VLONDoBIKKm11zK/tWEOzHsqu6yd5vBqyxiTc0SWFLCVl
	1VtJ9zHQWSkCchwQQv+bKLBwLkMt1WW4QznpzJagZeZq8FEJze+ehrFfQRgtxrSQXC0od6xH9D0
	s3+e1Ljq9W2uMotS3HO1ZEZEKDhMFJFA5UAjLtOfXCt/1v6tMJmHMFKdv388HKOd0bVX2Gz57a6
	17qCOebkFKbDwZkHciReUjKdrXyVhPK0yRs9H/R60Cp71t+LqJM8kpUZjgKjeXc5eReQmCIrH4L
	MJZzbQnHZyXE9gPISuEV8sVy7ZKxHZ2MbBEDV1De2mbeXR1U03K0/iivVhB8x1J2IkuSY33iujx
	2ZI85iX6Zfeb+1RABKbJZY/55q5W/B7fOjnsCoFPkqXpK20QR4WLJIOPW7kaOewfJ/D4i/iqqHc
	6x3yPxadaDnARKB3KaxjSclJJfyo0tHjYv1GHiT0ULcINpyL356VB6rTkuHHU/0WVQSArPhBtWz
	2mDVpXZmo4IJNa4NJ4Rip9j8k/nJlSVMuogH
X-Received: by 2002:a05:7022:92b:b0:1ab:fe29:5055 with SMTP id a92af1059eb24-1ac5bbb9041mr19879405c88.9.1793631727135;
        Mon, 02 Nov 2026 07:02:07 -0800 (PST)
Received: from xploitoverload ([2406:b400:f11:1bac:4040:640b:8a1:8629])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm34406419c88.18.2026.11.02.07.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:01:59 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: andrew@lunn.ch
Cc: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH] ieee802154: nl-mac: validate device pointers before dereference
Date: Mon,  2 Nov 2026 20:31:00 +0530
Message-ID: <20261102150100.44615-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Hi Andrew,

Thank you for the thoughtful feedback and for digging into the git history.
Your point, together with the Sashiko AI review report on this patch, makes
the architectural picture very clear.

1. Analysis of Sashiko AI's findings:
Sashiko correctly pointed out that guarding only nl-mac.c is incomplete:
- net/ieee802154/nl-phy.c: ieee802154_del_iface() unconditionally reads
  dev->ieee802154_ptr->wpan_phy when dev->type == ARPHRD_IEEE802154.
- net/ieee802154/socket.c: ieee802154_get_dev(), dgram_sendmsg() calling
  wpan_dev_hard_header(), and ieee802154_rcv() / ieee802154_dgram_deliver()
  all unconditionally dereference dev->ieee802154_ptr.

As you noted, sprinkling NULL checks across every one of these sites in the
ieee802154 subsystem would just be papering over the real issue and hiding
bugs rather than solving the fundamental cause.

2. Audit of other struct net_device subsystem pointers:
I audited the other pointers you highlighted in struct net_device:
- ieee80211_ptr (CFG80211): cfg80211 does not rely on dev->type to infer
  wireless_dev; it uses dev->wireless_data or wdev backpointers, and tun.c
  does not set 802.11 types in tun_get_addr_len().
- dsa_ptr (NET_DSA): strictly managed by DSA slave allocations (ARPHRD_ETHER).
- tipc_ptr (TIPC): managed through explicit bearer enable/disable, not dev->type.
- mpls_ptr / mctp_ptr: managed via rtnl/subsystem netlink ops rather than
  arbitrary dev->type mapping.

ieee802154_ptr is unique because drivers/net/tun.c explicitly recognized
ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR in tun_get_addr_len(),
allowing TUNSETLINK to stamp dev->type = ARPHRD_IEEE802154 onto a TUN device
without ever initializing dev->ieee802154_ptr or wpan_dev. The entire
ieee802154 subsystem operates on the invariant that any net_device with
dev->type == ARPHRD_IEEE802154 is a genuine wpan device with valid
ieee802154_ptr.

3. Proposed resolution:
Setting ieee802154_ptr to dummy ops in TUN does not make sense because TUN
devices cannot function as 802.15.4 radios (no wpan_phy, no channels, no
PAN ID, no MLME). Virtual 802.15.4 interfaces are already properly provided
by mac802154_hwsim and fakelb.

Therefore, the cleanest and most robust fix is to disallow setting
ARPHRD_IEEE802154 and ARPHRD_IEEE802154_MONITOR via TUNSETLINK in
drivers/net/tun.c (returning -EOPNOTSUPP or -EINVAL).

This single change:
- Closes the syzbot crash in nl-mac.c.
- Closes the crashes identified by Sashiko in nl-phy.c and socket.c.
- Preserves the invariant throughout net/ieee802154 that dev->type ==
  ARPHRD_IEEE802154 implies a valid dev->ieee802154_ptr.

Alexander, Stefan, Miquel: as IEEE 802.15.4 maintainers, could you please
confirm if there is any legitimate use case for a TUN device claiming to be
ARPHRD_IEEE802154?

If you agree with this direction, I will withdraw this patch and submit a v2
fixing it in drivers/net/tun.c instead.

Thanks,
Kalpesh

pw-bot: cr
