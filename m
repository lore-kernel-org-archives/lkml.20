Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146888;
	b=miN7VVYqTXM3ycEC877/syKopOVgAQILwP2+gsUFLbtbfUoCUELRmuhsPjh/XDs9oBbW
	 +gHcMr4qcdopSo3Gq8PtXCjrExJwX5MlFazRgjN2NYxTNcI25B2fOTmKFpK5v6TQYSBCC
	 WU07VaquWM75Y6CfgWrcsIKzn2ct5C0CRMGwle5s9kcnDLfUzK8KxfiRqgQuEqqq4wJ7U
	 Ra2OKEsqw8MOCskoC6yWo5fcs8Edhm9WIJFz+cvC/QX7DCuCvjR3mvqFN+pM+ljXOjlAd
	 wyQ9ByNGqm++bq00n+OahPAFma+Y3eWkJI+uXxYXFDJIezN+NPv9kKxuA2kzWG18RTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146888;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=ks/fSaXENj2G87+dKwpcBMdl+Yql/DC38Jw8RAonNhE=;
	b=OBlU1rkz6+KHjuG1Pwli2UEdmrS4Hs4/+PbkS4CozjUY66VrphQZHjrN9aAsIl2sRi7C
	 yTwLh7+tDZJI+zKUVdTP2OCfm01goacwxviE14Lw0cqq7Ux6miA908wZ0qJ+inVNt7//Y
	 5kJCweMf1dvvlh7ucSiPYGpD+gKgHGYccqhPa2XmA/VZP9Ya1bfkTmAmXY3XxmW8vmi/A
	 okvFv9zG0pNRbwuCvUKwOpuyKFuuedDcnOM72yPpf7b9gvtK0PCM3Z61PDGcCC6WEgBDQ
	 mve5wfg4OX4TAXn0VM7ULX42TkHEVkuBHP10PmCXsI1q68AefH+BB8DbW/K+aGwibxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE3606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BBE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso186857b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:08:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146887; x=1794751687;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ks/fSaXENj2G87+dKwpcBMdl+Yql/DC38Jw8RAonNhE=;
        b=Cy8vOA9GHCLJKS0gKvgClM2fRmsnKFWateRgh4kvXZTSN8TkzNcz8Iw23Ww1yOvVrp
         mzMk4uKt397MgNTiOWou410sYHxev7dphamwtoGeWOJdl5U+SMLjTwasVf/2ENYomCJs
         JwjPCCXU9r26a/F3ZX4tkyJj/JfeModmrixwiVOr5Hvp/t+VRgIXoJT8VIV452EpqT1B
         31ye6MoJs0Qq2y3RY+YalAjgnM6AzGQIgj5sIBG6ssr8YC3KVQbveA1iBMJPpGZ6T364
         ouTjRAh7+I0VEOr2SrRutbImnBMl219keW2Jjcrf9o7JmqAtpcMtEQiFvZw4+rs+yJ6c
         pL8A==
X-Gm-Message-State: APuU4Z91HHKhNuJFcY2Pr7CReOEfQDq/cl83DBqg4zx14Q7yUNdmXdsz
	krpLI6lWVGGNFQvkFnHrTL5UU1265G+1LMmUpuJ4EMF0mu9JtXmQgDIO8NZDwLWTCbe6k/GqPrJ
	d0bLSfCRw7ecDHKHp5PhqDRtnsW9n03i3AX1XyU760LtBxI8aeTXHL7z56QI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1713:b0:4d6:9355:7547 with SMTP id
 5614622812f47-5681469fd52mr919007b6e.66.1794146887024; Sun, 08 Nov 2026
 06:08:07 -0800 (PST)
Date: Sun, 08 Nov 2026 06:08:07 -0800
In-Reply-To: <6aee17c4.8be4ead1.3b45e1.0199.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af08247.5a668245.1aceb6.000d.GAE@google.com>
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

