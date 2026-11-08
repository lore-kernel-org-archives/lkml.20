Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146902;
	b=Q9W4uKDXiZlKyWDBhAGgt0YoaV3Zvou4Dt7L5Scz0lmiv6pASHmdymYjqS6pQzoMmSLV
	 y2VfeqzlXF7FbTzbuAdjuOWh7Hx5fUlHzPxlvtAcCOywlfOqoPI4FPzbK89oIw8gzyji3
	 ArZS9mKtJOVnDdWh2QrrCEw4xcJjlJ7p+TJRxW+VRTalvEjyLX2tRYIKGV/faaHaf07ny
	 YBvo356L0Xu8qC1gdDjK7L153dRf/XsfO211AlKZZesRRN7vsqTYg9tlIoQ7ljjuC2BYA
	 CcTwEgMxP37f4rcVA9R4t/zLhpkxpSgvgkC8i7g+wqjs2G4v4f90JhRJVJI2aITNr4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146902;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=ks/fSaXENj2G87+dKwpcBMdl+Yql/DC38Jw8RAonNhE=;
	b=aCTBwFRUlhSVTBrspIEmimlyJ7GsxajngFMkeWpkPiWPeSTdZMsuIrJIhq6VzcSg4giR
	 1AB2KcgI0sdVjDx1anFI9bmXfEpiT9KScIja0Wd4coo71SHnMe/MOYdsihs7+8kxzVsn8
	 1NA7pR5atTVbbhe7Hix35CkpW9M0yoGrnWl4z3ODbzHnFZpEocwfC0M+bb51QdKtt6tKu
	 RVY0C+kUyASX4p8mfr8TLUxzCTALtYfZXhQ4bEY2IYOrXfqE9GJDW12NqfxMoSBLFyYNi
	 lKvft6EVq9BFYyjrKhf0fNLdKLjN8I4In8xhkjv7YxI4GzDE2dpwMmSr8P1U5xr5t1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4046D606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4046D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4519ef1babeso21531fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:08:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146901; x=1794751701;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ks/fSaXENj2G87+dKwpcBMdl+Yql/DC38Jw8RAonNhE=;
        b=OqBl+nU6ewPALjX4CryneWeqpA2Ash+EkEbn+X0ZxrHC3eZHuUvl7SfgjUWD6ykb4V
         +M1jjzwPY9fZTjCnK+90s5JptcbGsChDMyHTLvm6yjfDbNFXUai3fMwmUmWzncPbyjZi
         PxVsEq5NZTF3oI5y49SO92ya6mwS6ZCLHiDq46j8w5kOdRYootyoaqY8M23CL8OvPBFh
         J1Tm0/7Q3E2wU9llArgF1nxZyV3S1sqF6LBY3tYyNlV9lXF5AN9ICy7vgKue6zggZJ2M
         NvWpYdCViOgygiFsRdaUR/BUTLO0OPvCRIQdJa83TB+MA4kli0QaZ+ZVnZrCBtEtzfbS
         9yfA==
X-Gm-Message-State: APuU4Z/NoCi7R4jrBc+9Fwivg1wKJ5KAZc+1mE3o+AHcExwZj4yyNCfo
	JmD7PhtF2FS0MuYG5bwdDZZOmx6rh1kCtUSMHsXZ36b/gaJLovSrumzUP/mhuPyDCSKjGFZraUb
	t0DnUyWO7oBKzvD2ndyhdjEHDJ1oR2S+/yYbIPYSE3oxXyYNXbKuQ7YdqzpY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:192a:b0:55e:fa63:7001 with SMTP id
 5614622812f47-568146c5a1dmr1124676b6e.36.1794146901261; Sun, 08 Nov 2026
 06:08:21 -0800 (PST)
Date: Sun, 08 Nov 2026 06:08:21 -0800
In-Reply-To: <6aee17c4.8be4ead1.3b45e1.0199.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af08255.5a668245.1aceb6.000e.GAE@google.com>
Subject: Forwarded: [PATCH] Fix warning empty list in svc_destroy
From: syzbot <syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Fix warning empty list in svc_destroy
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/fs/nfs/callback.c b/fs/nfs/callback.c
index bc282b744f34..ebcca3dd1269 100644
--- a/fs/nfs/callback.c
+++ b/fs/nfs/callback.c
@@ -60,8 +60,15 @@ static int nfs4_callback_up_net(struct svc_serv *serv, struct net *net)
 		nn->nfs_callback_tcpport6 = ret;
 		dprintk("NFS: Callback listener port = %u (af %u, net %x)\n",
 			nn->nfs_callback_tcpport6, PF_INET6, net->ns.inum);
-	} else if (ret != -EAFNOSUPPORT)
+	} else if (ret != -EAFNOSUPPORT) {
+		struct svc_xprt *xprt = svc_find_xprt(serv, "tcp", net, PF_INET,
+			     nn->nfs_callback_tcpport);
+		if (xprt) {
+			svc_xprt_close(xprt);
+			svc_xprt_put(xprt);
+		}
 		goto out_err;
+	}
 	return 0;
 
 out_err:
-- 
2.47.3

