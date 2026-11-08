Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794129561;
	b=t2KMXoACH28SMC0RBOM33B5xcqncHqhYgAbwPW6P2x4WIfBsKpnKOWHc/pHlEGvs79Db
	 1AUL9DFtuXoj2ECFBYs3RD6pfnmAodDg8SM476sVeq5djlCtqMaIceyhjm9Eh5rxR5HJq
	 mfxhmE2UklOz0Axzu53yemuMBGZd75WOoqh2AGq2DbZLTe7aDUxGX/V1AUzz4BwftSeZe
	 n1TlXZcd+Z2a0UYPvUND/gN/snaICA5aVmCY0tPjat6alsIMXscC/7chGOdpLXwYNX0X/
	 62nUTsX+sO0KHQAFW16j5njTO/Ddnq73TVK8dNwDaELnz0kv1t7V7o2YOFTXKwPIGzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794129561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6uUpvL+YwLioblRQLbYSDsaQDa3iQgozYi8OfO4zbek=;
	b=PsWa2xzMcUhWYRv4Baay3nDawYr529kBucSDPtgnRkHBDcy/JOHWwxSSeX11QA+Kojd+
	 GTFziRClAR7SPYUA5a5Bk063wCmD+kgvlB7T/my28BPvEQSP/HZ097AzoGN88owrZBUcG
	 zAYbsXewKxxhlIRN9r3qN7PasOOtqrI3I5LN9BSSzQRFyvPZGhcC5Wc25RQDy8dIGGj+e
	 P80eDhVGpTE5faVBYxcLBKZhKIjzGAfrWuN0zjqW0Zg59b02tH7AYnAakepcchI2XuB22
	 6u6j0PJQijeiAY62tb0DT/25wfxCVEAYDzkUVgQ8rkFWc45N4J/aB5Ne2xA2XoExJpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtwTKzds;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B7606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 772B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtwTKzds
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b244fb7fffso2130c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794129560; x=1794734360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6uUpvL+YwLioblRQLbYSDsaQDa3iQgozYi8OfO4zbek=;
        b=RtwTKzdsFGiwBACSqeOAkR+dkCeWYMGQNkrNYFgTXikDH3stO1cn+aJfGTK/Dty+w6
         QKueq5ZHucEL1R4f80DPzR3DdJkl+u6oI1nD01Cc8hrGLIDbmw5i2QTwUcefVsV/Stxr
         zHABn49sWVtvn1EQqZXdjZMEnzo4HaIT/5IVzKg3PVHWHQrJVaZe/4nKSM0crrmLgmiE
         8+OF+plHKbxFAR8jbWEIUFNAIwJpHrkZghOPV2jDPfCiu0ohGDGUBu+8syDZW5nQaLte
         XTBin04ggXUAv85OYsBoTasuzgE5CG2Y9j84PpuxtddlSRDWnJb48EsZJZaMISr9pgD2
         X/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794129560; x=1794734360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6uUpvL+YwLioblRQLbYSDsaQDa3iQgozYi8OfO4zbek=;
        b=GaJhudpgqNhdDNKhAU2mu1udF4SgW78dqB0vVLhgUxIMs/xO6eK2Cid6LS6KRHmeyN
         NgSgdsU3pWe05u1CpXjW8+gcNVxeSnF0P+O6DtMrkty9bRfXJaxXybL2N82WMZYJ3cBj
         fzs90jSCcJmOnRTYG1N19ILh6Hwz5opgIs1q8+cn29cGzgtQc9pSKIJN5R6ZXKO0j6+r
         4ywerN49ZRKg5m8os0B4GICqm8WlTOVo2ZTNK25J/Y2hDo9+GnLVQGH1H7Ad7zVuImOz
         hU0PC/IL6kbYA7qm9tYmBz5e0nrI2s5VQegtLgF/0WP+S2Treq4RKabm0i8dhvoFgDzK
         ENNA==
X-Forwarded-Encrypted: i=1; AL+hErHV74KoL5uL0evuv23OmoJpwPBux09Q9/kweTyuvXpFy4Gj86/ChQSzvtayMeWVNOyUJbkOv4LbPgtHYg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q4wbvClmtSFC8CXrZhca993L9QSibqTEk0/hC8VN8Y1FeuxQw
	SRH9AJ2W35qnbmSJYJ3PQmHBqYpUNq6EFD3z/b9yQxm9U4Dhs2jGQ0mH
X-Gm-Gg: AYBFou2GLJjmIpKhFDj0ArTHfqV2PSgUOqaePGVXmHwToQsXxoGSMPgFBolHbuy855K
	lKMuR8WmOHNQvP2ZYvtiWfnwzkkzaa2Y5YUShqA+Ym3aellt0edSgn340akjJfqGJk6L+iywFgA
	JrbYjnw8s7CcroXyzVCRDgrt9zZf4oaEoa47m1rJbnXTyc+rLyVBk++cNMD+8k8SGguFxqSHuLk
	vHPN5UL8nITr6sk5jmiB21vAjs+SHK0GFiHcyHltxqBURYMzxHfMwvjYZVibVVjLFrSK+G8aeLX
	IztrotWiTqFPRClu+nCKbunqqnZlR4l2Z5JqdundUrAjgvE14ZPZN+nIxsSGP1sWJcDZNoq2NOl
	EXy70yY8Xp2kSmDMg+37w0OgELhazcwYfZlyTBrYBThPuvRgK8jmYjRC50SbATeBl0SdRkG3I9B
	/rXxE36zdb4+b30N4UXY7yaslowQW7NnePvOm1j9lgTdEv6KmsvXqX6VR2Upd9Z5hjH/hbrm6FN
	BfH9KO6qFi22QvEq7yxUMBZGF6FbkM/ocq3T6Gd1nyLWzi94onrB8rfcegZ3PpXWoh3ymeSU8tY
	iaOmTULEo+q1EzdqOOYZcCEP1rv65y0JO/23kg==
X-Received: by 2002:a05:7022:628a:b0:1b2:6eef:3f32 with SMTP id a92af1059eb24-1b39febf214mr1870562c88.37.1794129560390;
        Sun, 08 Nov 2026 01:19:20 -0800 (PST)
Received: from Hruday.lan ([2409:4091:903b:c404:6c1e:2d0d:b35:6b46])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3731487edsm4884409c88.2.2026.11.08.01.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:19:20 -0800 (PST)
From: Hruday Rao <shreeramrahul94@gmail.com>
To: linux-nfs@vger.kernel.org
Cc: trondmy@kernel.org,
	anna@kernel.org,
	linux-kernel@vger.kernel.org,
	Rahul Rao <shreeramrahul94@gmail.com>
Subject: [PATCH] nfs: fix resource leak and warning in svc_destroy on callback init error
Date: Sun,  8 Nov 2026 14:48:46 +0530
Message-ID: <20261108091846.114471-1-shreeramrahul94@gmail.com>
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

From: Rahul Rao <shreeramrahul94@gmail.com>

During NFSv4 callback initialization, if creating the PF_INET TCP
listener succeeds but the subsequent PF_INET6 listener creation fails
with an error other than -EAFNOSUPPORT, the function bails out without
cleaning up the previously created IPv4 transport.

This leaves serv->sv_permsocks non-empty when svc_destroy() is called
during error unwinding, triggering a svc_destroy warning.

Fix this by invoking svc_xprt_destroy_all(serv, net, true) to properly
tear down active transports upon initialization failure.

Signed-off-by: Rahul Rao <shreeramrahul94@gmail.com>
---
 fs/nfs/callback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/callback.c b/fs/nfs/callback.c
index bc282b744f34..3d2ad5297297 100644
--- a/fs/nfs/callback.c
+++ b/fs/nfs/callback.c
@@ -61,9 +61,11 @@ static int nfs4_callback_up_net(struct svc_serv *serv, struct net *net)
 		dprintk("NFS: Callback listener port = %u (af %u, net %x)\n",
 			nn->nfs_callback_tcpport6, PF_INET6, net->ns.inum);
 	} else if (ret != -EAFNOSUPPORT)
-		goto out_err;
+		goto out_destroy_xprt;
 	return 0;
 
+out_destroy_xprt:
+	svc_xprt_destroy_all(serv, net, true);
 out_err:
 	return (ret) ? ret : -ENOMEM;
 }
-- 
2.43.0

