Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749178;
	b=sYKRXUbAG4mxbU7J9eC9LA5Ex1SYJt0/ox5LAOdYmz1qKaJEOaCqrOQ3ShLIoF6brEhZ
	 N1g35nsyTYtSeWYJDY8G4+BgzWH8RxJK9a1g8FA5RW2NpHF/OfcMgU1VUEMa8W3CrTBTP
	 ezqyk6jjGxvPl7VupfspeAPnLyYqLX6vU8dj1niKAqSy8LeVsXNlW+z9CtmjYii1YX4P9
	 N/cZwl9VfDRm2RzEzuaHE1GTVbnbk0WyO73RTRuhoSD6wLuH4wDgC6GVrrRMrARmTjVdb
	 racgYw/HIJMdYx8EGJ9gCLCxWYPJA0g3Bg74xeNCn5+KkYRZTZ2Xftk8QjjmScROK/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
	b=Gx+XHkJASabyvLtPGtFVO9WG3f+z12K9NV6JiA63rszK+LZkCqGQ7Sjgaq3sypY9M5Ro
	 SVHY4etR0znSPxgV6WKYqN+D2slnOdUp6T3vzvZwVJK8kQ9Fb86xFIgICLxqi44tbEIXc
	 y3X2tP5TAUZbIdBiKkHmy1KdHVAgjXfc3jhYzC4PvaAOstowYeZbz47zBoloOGlF5Q7y5
	 2Ee9dIxAUbpm7/aNMZn6x0YHsWdgIJKCm+sB9Zeg6R0WQwt9VydswgnchFPBEiulKbNng
	 wpju3YqzGUV4j615PonzncabBFelMdJiMR7bIgTk2zhfBoMYoMR1+YDkvTjbsVtKWyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA6slowg;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE0606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WA6slowg
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso3144849eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794749177; x=1795353977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
        b=WA6slowgRj1VJByjh1ROMR0y30Jy0uu6JUq+8Scgum+oZRppAyM6CP6gBGgn8XU0Zu
         e0VJZ8IWpZ8L8mOlnpyiSHi9hhtk9jomRqhg9KOoL9DExWedZL1FH8d2m3uWM1WCXyK4
         /tJ6qsAnEeQ2vkCDOfonSC651rP8Bg3HrzwujTbhGS081nn0PtKiNj4Ztq3oYNooPNkg
         +PI0dtFHxXPfXmnKctSWUrAWWFwrSdNL+e+bqNvTZDfTquV6+KJS9F+HrQLuSdvZz0+4
         Cd6Dl7S9GEzKdslQ0kCV+F1cMKNO3sJfMhN1Gxk1zBSzWgtq9vAppsZD+5EST4c9v09Z
         ih5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749177; x=1795353977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+e9lBaxj2RZ0ZeX4Opx/X6I6Bw5jb8RH55Fa71bptw0=;
        b=Slj8mpq7eh4cCgMY/v6ylkA1P1aRFoLLBblowE50pD31u7tgrjvi9vHzXLZpASMXAI
         1zq3Sojdk8/zfRt4Br84vzdGTqjygKUCt5XSRKuuD87ZxNFCNkokNtmYwld92CKYtYDb
         RffbRQxr3l+V8+h2jLAqq0BkbzCGDLbDsaAUKZYyQiMDU25Mqku1dgtZU85rusnni1bO
         yKhpvg37QX3jXfLpRfOK/MjRyp9bmHY/tQzL9nL8hpJJnI0gH5PhoR882GkQFiy31Le+
         7Pwlex1CC9KzufG+C7sm3ndKP8WTGoPEzmh4muhOy2tes2+MtYR0b5iCR6pKhwhrias+
         5drA==
X-Forwarded-Encrypted: i=1; AL+hErGSMBwHrkrjF42bXHhL67x/SrQhPQWYIlH5cSBP3nRbsqYO147AQ4w7NwklsSi3DsfBGczKZ8GzpBNoASM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lwooed346Ne+awYm1cHHplvSf8e49ojUUtEA+JPimpMZ9uL+W
	e9paUJpSaDGxR6X4Ql38sPU1A2o5ibgPYBSt8wQFKzSJPKjh54F79Q6t
X-Gm-Gg: AYBFou3lz9GGeH9U/NRSy50odlQ0gtY1uU6vDYJnWWFia/uMiJXZuajSHaPRHJc7/Sn
	3YSDtYaJ7keWMm5GxtoyO1bm8dZjHCnPwwXEnJ6ZnDN36g2Sa79X0oEfajntU71zl2FaOj78YHv
	UKKAD0P0uQRzGxj10x4RdzsaHJ3TGcDSrvAY5wnObSj4zoaWUmux5YvrqyMWskdNtyxCPaMj9lK
	jF6l+QtqANvvNLSM2Nb6J9Okk5ZNOdHJQU3f2XQrZ3HAWPzAr3b5b8DOaF28epCNOXpe9BpPvQS
	tnqclPMI+9BtjuNbwrD2EI9qOb7eULIRnecF8U4WgrL6HpUrWUCejd2R7M4bxNNwbhZQCa4tp5M
	jFixwCNmZ4WWf4HfllIlJaMzLTnxlZ1oIGJT5oTTZF4PJq3nISMZbcernAoTfSfYN7rn+n23P9z
	AFvhQAcEnZ9Zd29ZomP1Av0A1K11o/LX75s1SXJYU1JNvQRBIxQjS7jlOUsqsa1qKVqNYMCGkxR
	xSXm+jLo4xpxC9x9YoLlN0X4QjS2b7KZudo3yzETsg5OyRG2tC5gUTXKKwrlRucHS68yq0fqA0w
	WBV+ZalIiaSUus1CPfzB5SrXvHKU
X-Received: by 2002:a05:7301:5518:b0:379:d02f:dfe8 with SMTP id 5a478bee46e88-379d02fe0b9mr6467112eec.14.1794749177124;
        Sun, 15 Nov 2026 05:26:17 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d45c:e6::17:34a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm24465309eec.26.2026.11.15.05.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:26:16 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Christian Hopps <chopps@labn.net>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com
Subject: [PATCH ipsec] xfrm: iptfs: force a dst reference before queueing an skb
Date: Sun, 15 Nov 2026 20:26:11 +0700
Message-ID: <20261115132611.427311-1-ngocthang2710.1999@gmail.com>
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

iptfs_output_collect() is the dst->output hook and runs under the
caller's RCU read lock. It queues the skb and sends it later from the
iptfs hrtimer. The skb may still carry a noref dst, e.g. one set by
__ip_queue_xmit() via skb_dst_set_noref(). Once the RCU section ends,
nothing keeps that dst alive.

When the timer fires, xfrm_output_one() calls skb_dst_force() outside
any RCU section:

  WARNING: include/net/dst.h:326 at xfrm_output_resume+0x41d9/0x64e0
  Call Trace:
   xfrm_output_one net/xfrm/xfrm_output.c:549 [inline]
   xfrm_output_resume+0x41d9/0x64e0 net/xfrm/xfrm_output.c:597
   iptfs_output_queued net/xfrm/xfrm_iptfs.c:2325 [inline]
   iptfs_delay_timer+0x3803/0x4310 net/xfrm/xfrm_iptfs.c:2362
   __run_hrtimer kernel/time/hrtimer.c [inline]
   __hrtimer_run_queues+0x3bc/0xa10 kernel/time/hrtimer.c
   hrtimer_run_softirq+0x1e3/0x2e0 kernel/time/hrtimer.c:2153
   handle_softirqs+0x265/0x8d0 kernel/softirq.c:669

The warning also means the queued skb may point to a dst that has
already been freed.

Take a reference with skb_dst_force() while still under RCU, as other
deferred xmit paths do, and drop the skb if its dst is already gone.

Fixes: 0e4fbf013fa5 ("xfrm: iptfs: add user packet (tunnel ingress) handling")
Reported-by: syzbot+622de7e1f18a30fc404a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=622de7e1f18a30fc404a
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU with the syzbot C reproducer on origin/master (23c62304dde2),
60s per run: unpatched kernel hits 48 of these warnings; patched kernel
hits 0 in 3 runs, with no KASAN reports.

 net/xfrm/xfrm_iptfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 0313a43aa8a9..3fff835497b9 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -1914,6 +1914,13 @@ static int iptfs_output_collect(struct net *net, struct sock *sk, struct sk_buff
 			continue;
 		}
 
+		/* The queued skb outlives our RCU section, so pin its dst. */
+		if (!skb_dst_force(skb)) {
+			XFRM_INC_STATS(net, LINUX_MIB_XFRMOUTERROR);
+			kfree_skb(skb);
+			continue;
+		}
+
 		/* Enqueue to send in tunnel */
 		ok = iptfs_enqueue(xtfs, skb);
 		if (!ok)
-- 
2.43.0

