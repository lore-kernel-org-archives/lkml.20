Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530588;
	b=RKIvHmIEBGHlVxc7k4VboqzF7dQVSapyr61IvhGDBkFhMqZ6HswOXjdBsPPMnAd5j1X7
	 Ukbh1ZDWd9MQa2NU+n4LHZp5fS5NKwzMmSrRttdJtq6lkdkf56ZTH1v7LEkgAoZYCVHMi
	 zYoueNN8cmmuRujMM7JGsz12rjzU4cqk+JzAli50CITA4xdhvxgejtXYpNiAdPLq6bDcL
	 jqQ6PlqnhERZCIx3c3Pw8bjLtW3NaHcI1vMKrBe5zRyWqVnQmCZeNuwletcBg++FN5mMr
	 xHCvcbHO3lmJVVrHhbj4Zrs1AB9TByFNCWe7td95fJUxMI769r8UtDjB17GAoCNGmsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IaPEFj9f1Egxu858cRUniTuz6CxllUIciOWlHqTg4Jk=;
	b=OtJd3unpa4pYuSmizsH6LWw2FboFG77BLrM0M+EO0nt8nhGRzNoaHrVwl1VrkWYDUVC4
	 Y+1px5mekjRlxxV/Gof2bkpI6Iw3/Yz7dVKSLVIcEFqvkeD7DdhMXXMRqLoLkYWpoRKf6
	 79WlUbtL5vuavgpgi+F3q47Hw5u6Gj8Hmjl7tL2itLdzPboJG0NUEl2B3Sfp7JNqz8Jop
	 tYFzy28erEXj8DMdvWGWOhFilkhigXbMP9oy17uUR9WizfoTNACNp6/zzLbbrNcFthCJw
	 ygKqPRNlFBG4zHrLwLke/JaRPUgGtk5BYJHarhaulZ9Chwb4t6fxrTnwoDVXzbF4BJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRvWi9G3;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E45606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E45606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sRvWi9G3
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so2706908eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530587; x=1794135387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IaPEFj9f1Egxu858cRUniTuz6CxllUIciOWlHqTg4Jk=;
        b=sRvWi9G3GlbEiuE/IwPiDqaspOqyMuib+beHwvy8q+05xUVGrB1i+im4MlQcInspT4
         PfMvRpn3IvcO/oG1RUIcvA7hC9rVn7T3QxwUeTB1gQajxdig2OpSYj4Js5n+p9a1o3Zh
         qO/SmqS8m+z0/TyalflAdzTFBQowKPtiniOqFNJWv6WJYNtK1RhNuw7+o6uHjOayF5y7
         MuXGytZzSs46//cC8MvAZUqnkvRAyx3bVVJXf44fFoyyrE2i/gFokl8NAxkmiX9AKsKP
         rj9MTKgQJgbjFhrTK2rUQTsnzxhxlozNv2NEUKqH2yedm5eZZw0Lw8yylYQQ6k39K2RH
         mAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530587; x=1794135387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IaPEFj9f1Egxu858cRUniTuz6CxllUIciOWlHqTg4Jk=;
        b=PGo5paVM54T7OGpD/8gZtcxpUCeojR6KX/u9muM3JoGth3VHu4+BL/oB7TmjkcyfZf
         +bkwW6h4+OFPgxoqyx1dsEuAugwFzm372NYZC4/T1qNUkoOrvuW+aMMxcoCUo98MWoEL
         3aj1ciFhA7mc6BXjF7El/ncQif5HrTdrQCfQ38XcR49h4pZL4MS7hWtKkMn4Sz0SnJs8
         poU/5PbLtFNBi2uMHIs+2XrxjWGiGty77d0HhlOGDojgdUM4Iy1JmkaCpNJ3Kns6ofB0
         Q3xV7q7Nv1YRB3ETklKH2z9UkeOT5Vo89vTFGbmEUX4ofQWj/VV5k8CnrZSkyqmqi7G6
         0S1w==
X-Forwarded-Encrypted: i=1; AKwUvBzxfjY/+qiXdaAOZD3L7nodGW+IhCQxfnH5w+0NTVI71MmkITsZovpgQEFD+qFbBN+o3fg7dNZu+tqdj9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/l+hmUfi5xlWFKesAOPsD7joGRp72ZAuDD4E/ThrhgfUIc2ZsO
	sS13T06KbdedIj7Xct7WujfosiTr4KlLQbW5018rVgjDtPBmFuY5wsyb
X-Gm-Gg: AYBFou0V3HzhIVhF67KZcdfHeHm5tRQJC14+UBMbGQ98Vla/pN7a8IdvXvfz5PzVget
	0I0T51GXeiVsepjMguioEK1dtE4ezZt3jQ4JBjSOSDvkfwTZbb1sjuLM7K9q96ddEkvnULGnHkz
	WDZE+iIj8vvLkuBJtBx7+IVErIcz7EGO2G/rpNbpBAY7YlARXMvM0lNbA/EZ+XDuf1b/MM2TE50
	6DNhnjUn4vimU0f2r3t4HADC9+6HlHcWAupvZ+d/kdlCHxr2w1Md6cOMPCHrHQxhCcKqtZxVdIf
	Hy9HRps8O9A/sqHFIs2iJkCatyhF3f64yQVQJDKldiCjOj0cQRfVePiPG8/KPjfrGN/6MTm6ZRW
	x+zg3VPD493Lpj+a5dKvLEA5xAEdzScc5t5F7Hb6sws0COe+MzMZ2KcLXN0vH9o2Agqa2HSVpvU
	EFU1xvLfTngqJrlwpMF6JJHP7As8mvnolfkXptdDx8G67OCZveq5Owif79XDT61R9fphHEvli3S
	iZLy/usLzoINO/qGNz0WsA0GvJpuS6VEMrwvErDDHnwCB/dN/j/LHKr1AFdu7TaxaNX2cTueNxt
	SjRcrA0qgvnYZxI2WoDrydzIfUV3eJusy2uEr18qVMTI47XVrz9ATYKEwfEOUUmjVsEfF4eeW7S
	67v0Fa7Hofc1sEID+GZz1DMUXa+5ToXuRr/hUBpV8SZOughML68BPgk9usn/ufUeQZvEXWmWpH3
	Tq
X-Received: by 2002:a05:693c:880e:10b0:369:779c:6e0b with SMTP id 5a478bee46e88-36a4241bcc0mr11972021eec.36.1793530586957;
        Sun, 01 Nov 2026 02:56:26 -0800 (PST)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:8e3f:ca13:23cc:b148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4239ca82sm25088155eec.0.2026.11.01.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:56:25 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: jgg@ziepe.ca,
	leon@kernel.org
Cc: metze@samba.org,
	stfrench@microsoft.com,
	xiongweimin@kylinos.cn,
	yanjun.zhu@linux.dev,
	ammrat13@gmail.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com
Subject: [PATCH] RDMA/cma: Don't warn when device removal races with rdma_resolve_addr()
Date: Sun,  1 Nov 2026 16:26:15 +0530
Message-ID: <20261101105615.20253-1-kartikey406@gmail.com>
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

rdma_resolve_addr() on an unbound ID (RDMA_CM_IDLE) first binds it with
cma_bind_addr() and then moves it from RDMA_CM_ADDR_BOUND to
RDMA_CM_ADDR_QUERY with a second cma_comp_exch(). These are two
separate steps. Once the ID is bound it is attached to the device, so
cma_send_device_removal_put() can find it and set RDMA_CM_DEVICE_REMOVAL
before the second step runs. The exchange then fails and hits the
WARN_ON() added by the commit below.

syzbot triggers this with RDS over rxe, where rds_connect_worker()
calls rdma_resolve_addr() while the rxe device is being deleted:

  WARNING: drivers/infiniband/core/cma.c:4120 at resolve_prepare_src
  Call Trace:
   rdma_resolve_addr
   rds_ib_conn_path_connect
   rds_connect_worker

This is a valid race and not a kernel bug. If removal wins before the
bind, cma_bind_addr() already fails and the error is returned to the
caller, and err_state in the same function already ignores a failed
state exchange. The caller gets -EINVAL, and RDS destroys the ID on any
error from rdma_resolve_addr(), so nothing is leaked.

Drop the WARN_ON() and keep returning -EINVAL, and document in a comment
that the state may change because of device removal.

Reported-by: syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6699995b421c8ec7d2fe
Fixes: 732d41c545bb ("RDMA/cma: Make the locking for automatic state transition more clear")
Tested-by: syzbot+6699995b421c8ec7d2fe@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/infiniband/core/cma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
index 337a49d1acf7..46741c1fd34b 100644
--- a/drivers/infiniband/core/cma.c
+++ b/drivers/infiniband/core/cma.c
@@ -4117,8 +4117,8 @@ static int resolve_prepare_src(struct rdma_id_private *id_priv,
 		ret = cma_bind_addr(&id_priv->id, src_addr, dst_addr);
 		if (ret)
 			return ret;
-		if (WARN_ON(!cma_comp_exch(id_priv, RDMA_CM_ADDR_BOUND,
-					   RDMA_CM_ADDR_QUERY)))
+		if (!cma_comp_exch(id_priv, RDMA_CM_ADDR_BOUND,
+				   RDMA_CM_ADDR_QUERY))
 			return -EINVAL;
 
 	} else {
-- 
2.43.0

