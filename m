Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900993;
	b=1WgjxiaNgfP0FHe7ptp78L7RAzC6k5BVjFbMEw7LBWhqpt2xlNBwf7ot7RmGIdTqqsoE
	 BpKlJ/vHuhEpMMFR4zE9Ox0AH+jF4fOTfeidu6+6auGBsLINtubF9CkWbGk1u+pNcIVvp
	 uq6jvA4/ISt62A8jJBPs+MITPaunW4vxZk0IKhr3XqHi4TzZuthztqXH4jtuJJf2czKO6
	 KeAhU5o/x1HeCJsFKAQNm13W2tnS/xEvFcrQNG0QeMPKbaPp1Nfuf4TRG8H8ueOkIchEo
	 Qt0wNFYhkGWFAQoNPnf/sRKs0yGZEwKosXrfzq9bM0Eb2hVGMKzv5jJ+SzpL8qPioiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=bXXWN0U2LwSgs5yFSiYomIOkF6F+3ijFGiBpJE+lZgY=;
	b=Dw52xbl2ND7huqgdC5RxKQE0vpepUuVUKCc2DjhN/6qzWxhHy46zxC4AM2XaA+nlSwTR
	 n5EXRN+mtEBMAbWGM81WIH8kL/yskQEwbVW5/9UGdXAnH2JdvYAaO27d1FKWhmNT40QO2
	 bvpE3ioEiUwuNfkF1t88VdmyeC/UeH638n9AaRFwSEBzLVAKBV9YE3SRbtSTsSSm0NgYu
	 BwiRbuLrIB/Xtv8+nGK6vVNWF+8c/bVPfL1lE72J1mG1JSl0rxdutfiK74rWZPFz83BbR
	 Nd/V2Eljh+umLHR7Wefpq4U9msSdoXM3ssF4xgVbtNmt/sdpM+9LVnWTz4agJj4ghbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DNKNW9T7;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8072606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8072606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DNKNW9T7
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so250481a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900992; x=1793505792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXXWN0U2LwSgs5yFSiYomIOkF6F+3ijFGiBpJE+lZgY=;
        b=DNKNW9T7kGfS78TEh9BVgxXbbjDsK7FmBqAhYSl/KQ+eTH7raGVvtdvg1NUc98VoRU
         K+t6Nc6VFF63JU0nm30Oaoo7PWDuZqaJa/VGdjf1oEl1vKQws6xUEHvpigr1aU8XJKW9
         ARzBEbRowo/1PB62yadC/gAYjKkjUksvUtAWL5KNMcmW0it4u1TdjgS9IKYCVSUT/B4B
         5LmSmhiSWh9nYee/Q8xH/mbjnKv05BsnHAXumcfsZ1MU10WIv7HErjsSADO0LjhEhqVG
         kuOy2JsugMVzT+/xQMFxDhtCn1QSY8Ludbs8xew8apip8FeKjXp7edLasQnaxkyYNus2
         mgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900992; x=1793505792;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXXWN0U2LwSgs5yFSiYomIOkF6F+3ijFGiBpJE+lZgY=;
        b=LAtmRXa3itXGx7R8m0hsl1WYXEL3/4T1fVsbWpQRmMpc2QRj8bibLqKgSoxUvrPdAR
         ugqGqcqUyPbAECuiImGwP49LhV8+c7sWM/lbm9Pf5lyPxq+n8BL85YCypHf/GvtFFz2F
         EHKqnns58lP7tE75STy1JOqIh52nCdwt4RajJixsqtW/WRXhGwcoVC8hz0vjmtoqXTPh
         GcLflsRqFbR5LQbu2EP2qGQSvIYPNzkX+sVTAtlKNmYTFE1OQCrvtL5JNmyqk2P2BhXa
         R815rkgbQGa34aqAl+f2CPKaPOHrLpeJWvH1XIbYjwcn1DhJErF57l0y3rsPg2SztkFB
         rukA==
X-Forwarded-Encrypted: i=1; AKwUvBw+cda3CxYvDb1beAsFcYGh8L65yBcHKR1LVMrlhCeISTEF4v/YZZ3lhEAiO35rvjPXyqL7A9eDIL2F35s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyD7K7jCnbZDtAJVglU/koiit+dqm0v49Yl+9WupKVvxPo0/J3
	zhROnMF3GIpZZXNA5gJ5RmonWN3wW4zxC7NoutNUD2QaWeIu7IIgQYbh
X-Gm-Gg: AYBFou2TydCosGWfkOXoOU2+vLSqRovcdmlkdzEyIBlR4+sWi/rfTJ9YgLkQGJI7iQ7
	Tl3dBgAmKw+En+uqJ6J7YLV23rUJveXfYRb0AgPjGG0CepUAUO/oTVMFHEO4XqWDyUrTU1jMr+d
	T579pvF9z8pEJddVKdTirbwSTwaLphLOHxMFPFMs/uYZlAL+2aMSiiN2AXRcszADzxHOZ5XAltu
	NpIPU6hCo37Afe9VI1uy6Ql08bYFh0So0iY5zn46sESYMYB/1WggnTSGWYHyUv+Y9VhjRA6FuaJ
	I15LXy8C5L8GGYRiB7/56b5uUEdQHr6Y6GdLGgfMJg/75q6BqHd/YD7daTDxnBEkm9GGTgiQjS4
	Nv1yo93mufOiJO1vhRALpmOLkpQoM/3as1HQR/o3RSpwU/i3t9mbpEYjYuZY8EjIXgrsNOOpX4n
	PwKVoFzl/Cubp/CvC6DIS+09FbVu4bLHUPiOci0NqHkuY75qvgAO+EZjmIENAq04nu+FtubTd/C
	DtSqsxYNpD51oWgKFbzQFgJnmB5W3QiUn4vh3+TgSu/QlE7keVfMVoXkhRiHeWoYLQAOgdUmsg/
	SQut
X-Received: by 2002:a17:90b:3c0d:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3ade9b35f05mr4994498a91.1.1792900992309;
        Sat, 24 Oct 2026 21:03:12 -0700 (PDT)
Received: from melokc-laptop ([101.90.152.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb82761esm2921587a91.0.2026.10.24.21.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:03:10 -0700 (PDT)
From: Anfernee Cao <anferneemelokc5@gmail.com>
To: D. Wythe <alibuda@linux.alibaba.com>, Dust Li <dust.li@linux.alibaba.com>, Sidraya Jayagond <sidraya@linux.ibm.com>, Mahanta Jambigi <mjambigi@linux.ibm.com>
Cc: Tony Lu <tonylu@linux.alibaba.com>, Wen Gu <guwen@linux.alibaba.com>, linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] net/smc: fix possible recursive locking in
 __smc_lgr_terminate()
Date: Sun, 25 Oct 2026 11:53:35 +0800
Message-ID: <179290097759.51540.15412712294727302463@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

syzbot reports a possible recursive locking in the SMC listen path:

  WARNING: possible recursive locking detected
    kworker/0:2 is trying to acquire lock: sk_lock-AF_SMC
      at __smc_lgr_terminate() (net/smc/smc_core.c:1580)
    but task is already holding lock: sk_lock-AF_SMC
      at smc_listen_work() (net/smc/af_smc.c:2463)

smc_listen_work() holds new_smc->sk while calling
smc_listen_decline() -> smc_conn_abort() -> smc_lgr_cleanup_early().
smc_conn_free() unregisters new_smc from lgr->conns_all before the
early cleanup, so __smc_lgr_terminate() walks the remaining
connections and locks another socket, not the one already held.

All sockets use the same sk_lock class, so lockdep cannot tell the
two instances apart and reports a possible recursive acquisition.
Annotate the per-connection lock as a nested acquisition, as
smc_listen_out() already does for the listener socket.

Reported-by: syzbot+7ea1f5efd5de7e24f1de@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7ea1f5efd5de7e24f1de
Fixes: 2c7f14ed9c19 ("net/smc: fix LGR and link use-after-free issue")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Anfernee Cao <anferneemelokc5@gmail.com>
---
 net/smc/smc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/smc/smc_core.c b/net/smc/smc_core.c
index 9974149659c2..5911368ae520 100644
--- a/net/smc/smc_core.c
+++ b/net/smc/smc_core.c
@@ -1577,7 +1577,7 @@ static void __smc_lgr_terminate(struct smc_link_group *lgr, bool soft)
 		smc = container_of(conn, struct smc_sock, conn);
 		sock_hold(&smc->sk); /* sock_put below */
 		read_unlock_bh(&lgr->conns_lock);
-		lock_sock(&smc->sk);
+		lock_sock_nested(&smc->sk, SINGLE_DEPTH_NESTING);
 		smc_conn_kill(conn, soft);
 		release_sock(&smc->sk);
 		sock_put(&smc->sk); /* sock_hold above */
-- 
2.54.0.windows.1


