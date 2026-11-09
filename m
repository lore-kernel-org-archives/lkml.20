Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213062;
	b=YIY/EU72SUM67r4NEOMmzw0E+DT3mVNpnk0Cny/idKXsYTb7/+a7alDK8YkyBgKpxg4J
	 Jk61kGmn/i1XmZAu71iSYyVg00gkkWWCbs0waGzpBJfuhYDPDNQgWzxASlcUQxfCk/izd
	 QAjQ3ukQpEdVGL+X9ZXoHIOi26VlGZkDtPNvmICB2JlwtH2Ugs4CYEZzFI33xEPwFz0di
	 XcdRKWg43RebqfOPZt9yM+WdAMBS1/Dm8PjcVdO8eVj0UeeT02VLQ2SK/2jwnMrbOMmRz
	 QNEKWau1l4mDr00gZE2Q7xecuUGW63aIV5TmLW4gmZVNjnbUqT5j3Pl7gHxhUyaXZvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vfC+pb0AJgv0GKU95tThougH9ZxYjEepJvXJA7a1FV8=;
	b=Nn6qLwfwjTSpOe8GjmHLJl6PNRUJlEfkEe3RRE9FNaMS0uUpyo1fsAbXSUcVCueZoecA
	 YeQzlJ95hNl0kgkp43GCtYEq/nKd/dRVJZv9XfLI9tON0eLgHhG9ywOszIyofxYGpINSf
	 GISEWumMuR2x2t741Rfbq2Wr9KzhqsO596lJkPwA1rma7ojMKWXwYwgBtv2mN6iDW+SVl
	 XzbEbByO5BqQQye7Rx/X52mj6HG3nhiS5BVtvoceBYO9i8PfTTxeQbKQVGmOK6I3uyYi5
	 UjCT0EgIiscZyVRhxetFoPGomDLCvMtZSozQz81F3DZcm06s2b0+ZePiiK8rm9nw7wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jU89jaK5;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B5606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E07B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jU89jaK5
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37000e7234bso80777eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794213061; x=1794817861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfC+pb0AJgv0GKU95tThougH9ZxYjEepJvXJA7a1FV8=;
        b=jU89jaK5dnAFqhr6/U60Wm+KBdemIPUAoWBa9y10Mk9AEUfHm1Pa0iMz/lxQ0n5Ux4
         pky21JLLJrd7tLJ5GFtAHPV8h7ntqQ0ebFN57Mqh9J8Te8+Ci8tDEsqhM+pUmaS2BgHu
         mmUR0X9uzi9jE6ezViLjRCO2xdnpkXw0Afm8sdF4ZZJp+i081byH6OhPjYvEYUN4t3Lf
         kbUmVJXdx+bzkVRkGBJmz839qzNhXzSs0nUVeveROtfFCWtmktSQQCLTPwDcoEB9a79y
         vPwQN/OgLAXAFSUr22w17OWIIFVRE6X9nBuzYJQkok3mltOVDZdLWBr6IEcCPFIqTV7E
         PPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794213061; x=1794817861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfC+pb0AJgv0GKU95tThougH9ZxYjEepJvXJA7a1FV8=;
        b=Xs3tINWsnJGueuvmJ/z18w9hKdD/17687I/KiKJhAl/eDbWK9oPh7V7DOSdv+/hCv9
         LdzFiFHSCL5+T21vjIdbcd96GmHeJe9/e+DTSZDj15yro6jtRhgYTglfhfRNT4M9bz4m
         o2oW9k16uL4v5nqjTzV91OEUTUOpRBb3X95QtjLBTCBaReDH26p+npvSQ0oe8tVpPZA+
         3t6oSci9CtLs2T3lm7weeJ2KYQdEaywlIuNWUxDPzu0p5RJsR7uL1TRD2jBUrelye7DV
         q2Jr5HuQoPs5kZSNoL6DQSFVuNOjrKPpnA2s7UKxZRGggpcroSJONZm8MJ3dXF3mfKVm
         xkwg==
X-Forwarded-Encrypted: i=1; AL+hErGU4lI11XALIQy5aKNNVLqOQzkymRopYtjYtdDjA9LhLnlQ67i4/rnIH2dfmdJ8W+So2ThhowN0XWat/L4=@vger.kernel.org
X-Gm-Message-State: APuU4Z89np8X10Dk/+YAvOKkQQ9+MX9CZ3BvrMAVE/q2dzVu3Tw7KEq5
	1XXurOsKYaB139fC4Ruo8U4q4Pmg0k3ICGJvLf+7IdT2nOdrJVqZTOh2aTAbZziKZzA=
X-Gm-Gg: AYBFou0VWkeH3uyqHTyuuWyNybzYOvQpZDTXUaW8stNYrejZsdPUX/wg75cfDFSfrTs
	X4io+Kig6R83ypahAr/O8N9UY64AeHCNhTV8q3WuCiCapxyOpG+Gp03WbP8DHXJsQOxccSKTVvL
	llAJh1UHX/EuYExANY+cp2ZblI5TT98/UrkEEKFO4H/NZXjPPvB6/ZDxR8NpUYjf/yuoZPiRio9
	ZsAh5lG4dyoCJHXXmw6r6nyti9huEBkm7amdjFXCINrusYoxb8BaFRTvKduD5w//JNHWKNfKJlk
	VPLW2EqDd3VIOHxbrN3f3EeZnBrnCO65yKLx/h5cVeQmNlHZYvV6nE2kMx9pcAq7cXuo7ZdNY4L
	DUtfNYO5eBmSI1ZjE+yF8Pum0p2c6zDkzIuuvlQPKMrOqkhO9qwct1N3R1FF8o+BZpnbtBHQv97
	QQ2RzKY7/0kITFucRokLs0kwRoAiLVHA5bTAVQ+5SGRymeycmET/LD1rKsZKlaJtvFYXeK/4dB4
	pRQ0fgwKGGGEpjqwDFFvcLniRhN0r7kz0aBqc5YthlXPIh1Mu2VfIBfkt5eys7yMEaqqqEhFlR4
	hfmuHywCAb5+2k3VVJlyIcS7rxUo9VJODXmwWQU=
X-Received: by 2002:a05:693c:65c6:b0:36e:53bc:4681 with SMTP id 5a478bee46e88-372569fae2emr6648368eec.37.1794213061041;
        Mon, 09 Nov 2026 00:31:01 -0800 (PST)
Received: from xploitoverload ([2409:40c1:400f:1382:e6ca:3a31:da44:4020])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm12131756eec.26.2026.11.09.00.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:31:00 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: willemdebruijn.kernel@gmail.com,
	jasowangio@gmail.com,
	alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: andrew+netdev@lunn.ch,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH net v4] tun: disallow setting IEEE 802.15.4 and 6LoWPAN link types via TUNSETLINK
Date: Mon,  9 Nov 2026 14:00:37 +0530
Message-ID: <20261109083037.22337-1-skalpesh942@gmail.com>
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

A userspace application can set the link type of a TUN/TAP interface
to ARPHRD_IEEE802154, ARPHRD_IEEE802154_MONITOR, or ARPHRD_6LOWPAN
via ioctl(fd, TUNSETLINK, arg) because tun_get_addr_len() explicitly
recognized these types.

However, TUN devices cannot function as genuine IEEE 802.15.4 or 6LoWPAN
interfaces:

1. They lack wpan_phy, channels, PAN IDs, and MLME operations, and tun
   never initializes dev->ieee802154_ptr or dev->ml_priv. When an
   unprivileged user creates a TUN interface in a user+net namespace,
   changes its link type to ARPHRD_IEEE802154, and issues a netlink dump
   request (such as IEEE802154_LLSEC_LIST_KEY),
   ieee802154_llsec_dump_table() unconditionally dereferences
   dev->ieee802154_ptr / ieee802154_mlme_ops(dev), triggering a supervisor
   null-pointer dereference / general protection fault. Similar
   dereferences occur across net/ieee802154/nl-phy.c (ieee802154_del_iface)
   and net/ieee802154/socket.c.

2. Similarly, the 6LoWPAN subsystem assumes via lowpan_dev(dev) that
   netdev_priv(dev) is struct lowpan_dev. On a TUN device, netdev_priv(dev)
   is struct tun_struct. On netdev events (such as NETDEV_DOWN in
   net/6lowpan/core.c:lowpan_device_event), it clears bits in
   lowpan_dev(dev)->ctx.table flags, which corrupts private memory inside
   tun_struct.

Rather than scattering checks across subsystems, fix the issue at the
source: disallow setting ARPHRD_IEEE802154, ARPHRD_IEEE802154_MONITOR, and
ARPHRD_6LOWPAN via TUNSETLINK by returning -EINVAL. Cast arg to unsigned
short in the comparison to prevent upper-bit truncation bypasses (e.g.
arg = ARPHRD_IEEE802154 | 0x10000).

Fixes: ff4cc3ac93e1 ("[TUNTAP]: Allow setting the linktype of the tap device from userspace")
Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
Signed-off-by: Kalpesh Solanki <skalpesh942@gmail.com>
---
 drivers/net/tun.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index dcec7311e60..b50a7245be9 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -3362,6 +3362,10 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 			netif_info(tun, drv, tun->dev,
 				   "Linktype set failed because interface is up\n");
 			ret = -EBUSY;
+		} else if ((unsigned short)arg == ARPHRD_IEEE802154 ||
+			   (unsigned short)arg == ARPHRD_IEEE802154_MONITOR ||
+			   (unsigned short)arg == ARPHRD_6LOWPAN) {
+			ret = -EINVAL;
 		} else {
 			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
 						       tun->dev);
-- 
2.53.0

