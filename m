Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794163328;
	b=vir+ONuZoLU+5CdOKPjLJ012sufxI9IpZ3oTocucnpilg+rnndWoHLfJ9rW0knzByNcf
	 VS1YZdTIuqCmIfhoCxJ1WsIjgqfONRgxz4kDVghHc+D5kLkC9WTOi4qO6F6ft+v1w0kyI
	 xbaMgpws1MuQOYRkqQc8WLm3zyyTSw3ABSG+S2Z5K6YLUY91eNRljAl6jdYLL3Iybb8Yq
	 ZWyReFO7YD4m+TLmFnXfB4NsErB0j4okTox7kEunASjTl2ColMeCt7dA8T6iwtVljEuZZ
	 CI4+c8Gs6eODGD1WYUN8T2Ox5jOFxaPrcKIMKLOirNeDu2lPZhedXS/wcul8yC7E7Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794163328;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=2rcYPo1RLykPG5SSma2GDZMHR62HKeii8Ssfnfluhzs=;
	b=jtYBUJVlkIpII25IUheLSozTiNZD2e4u09gT4EIIXPTp304ARcxvZ/IM59Py9qY7mCwa
	 1VxaO53Y/bO/Hi9s0lBs6kVChKQ/LSFpLd5yTfFEakzZiImBLaAZvutw4x4J4V2qvpfUQ
	 4hpCClQpGSXwUQouPN7NQuuy589yo11GQcAGyUqL3LDdH3E/vLGgpkwvZqxkpWLGcvbqO
	 lyAUxu5UlJXsOsXEt8Xt6SFAp6ZzKVrX2GYOMTuxU3KHS6Y/AD7i5e8mKPizmUYoe6dlZ
	 epwYSKUB88YzV6RVvCDX1AAEzpy7SWoBdn+Qk05O0gQEBVfFLNa3HIzqJJgRZUtaM/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8BB606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83c2311eb1dso346603a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794163327; x=1794768127;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2rcYPo1RLykPG5SSma2GDZMHR62HKeii8Ssfnfluhzs=;
        b=QfJe6ba9gLW8t8JWu+MQb/bWD0HBVxzIfmQo8yMbXyqkzZwKoqi8dTFhaWN+ESQMzF
         kLE15a4THB671ywrC7nLAjtLteqZKAF717lXGbGdOezUM4CPVhMsTtPweuNBtxG6eFDR
         17t9QVp96E6dCvLxWx7swyWA4/lu6ubYyZ7BE0uSOuRfVZpaPXKV27UHCTL8m6TK1me0
         CYfsGYJVz73i5EIyM3kBsajqLPR0C7wukInuwq6TiWbAKEtWvb6j5zXH6jOk03un54s3
         vL3WJRKEU+rnP/iJLzch31taaaa8yEQJD1x6tYwmhaQPHKLgKlG3vIS1JdiFoh4vPYra
         CdsQ==
X-Gm-Message-State: APuU4Z91qJoZJj+HCKSPoJ44A+Lu+r1FRdSU6tQ4F+dKKa9W8gzeKRRy
	U7vs2l0WyTuNzHK0QWxsgpY3CsTzMIyAb8JILcOYjwASR8LZs5MPl79+vf4QembhQVgJClHPWpe
	4te9/WevV1HxB60/bI69mxjr2ybrXNV0oZg+8nnDXUer0IRFkXElQmFpL5ug=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3ea:b0:523:dee6:7ae0 with SMTP id
 5614622812f47-5681465d3demr1230201b6e.58.1794163326904; Sun, 08 Nov 2026
 10:42:06 -0800 (PST)
Date: Sun, 08 Nov 2026 10:42:06 -0800
In-Reply-To: <6aee17c4.8be4ead1.3b45e1.0199.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af0c27e.f27d6985.26ae05.0000.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [net?] [nfs?] WARNING in svc_destroy
From: syzbot <syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [net?] [nfs?] WARNING in svc_destroy
Author: pavankumaryalagada@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d164c7d754f0

diff --git a/fs/nfs/callback.c b/fs/nfs/callback.c
index bc282b744f34..29134e2c56cd 100644
--- a/fs/nfs/callback.c
+++ b/fs/nfs/callback.c
@@ -61,9 +61,11 @@ static int nfs4_callback_up_net(struct svc_serv *serv, struct net *net)
                dprintk("NFS: Callback listener port = %u (af %u, net %x)\n",
                        nn->nfs_callback_tcpport6, PF_INET6, net->ns.inum);
        } else if (ret != -EAFNOSUPPORT)
-               goto out_err;
+               goto out_destroy_xprts;
        return 0;
 
+out_destroy_xprts:
+       svc_xprt_destroy_all(serv, net, false);
 out_err:
        return (ret) ? ret : -ENOMEM;
 }
