Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C328F528425
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686194; cv=none; b=ZKlu1vv4VpKDKrfGV7ov04mcmPofQg3E13Lx1Od5KA/psyGZtzIw+7MIHPSLtEzcDU3mocgdsQomSQeSSBnj1X2YHyqsayh76Cr4V2uok/sho5tLsr3Rdn/eJZUGW8DfiEwImb5vHzbagfRCrUxgNq/BqKnFLiv22/Gj9egTfDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686194; c=relaxed/simple;
	bh=c8f1eqX7udRQUkjxP8hlmLfKMtqZm1LdPotaFvOnBzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tqw1jPCknIoU1g7X9z9lao5eVY9ASMLzRH0c52lmrqr0GxNLP0+vB69BaHqtXh73c6yUNUKmvG6vRqaXFFfx3R5BXRDUt2kaFQkWEM1gtdLKeFiWaTZ7o6JK8wfSl6W9cXkPe7fp84KCv9L8d5PlC580oHxsCj4PYF5/rOIfD2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MX0Yh6EC; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX0Yh6EC"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-8137b129131so2718688a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686192; x=1791290992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gK9kuE3ZJKv9P0L8HyUR2jEufhxAadJU9kTc40xDD5w=;
        b=MX0Yh6ECPGTh4UkDSO/FPgBDQpqQbkR/PaEbgm5dq2Tsy20gFdPHml29kPeM0P3Dav
         zN+Ul9kEX4WK11MDcjoayXmCX+YmqcYUdF42KhffULL8cwZe8Rtcypl1e+7XeCNpa6Qg
         Ozn5G8XxL5ac3Aiy3N+3V3EvcECQ8Q3JmCfNco/bmSKVY4+2RCGYFg8NS+cG0n0xYY24
         zeIE5TUuHJKzyOT83ojaBRvB+3s5QKs2qadAheIwjjeHpFE4uJXUxRo0UR4T8tFCn6c0
         IM7+wURS+/BJ53sNpl3nH48fmcvxi6ULW5Zsa5YGwMjzrLk+ZvFO5VwSQg42oKTUwSvc
         mg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686192; x=1791290992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gK9kuE3ZJKv9P0L8HyUR2jEufhxAadJU9kTc40xDD5w=;
        b=hXTP7CD0uoGJtHLDk2v5sgTiNvsKKOX0Mku/XxdsvMVFMUBt65euheV8Oa1qwrcsh5
         T2iOIlznwA1ywM4PB4/3z4jmRUNdLTLNr97MOIKpXINRMgrUloJ21ypsntSeMZFyF4Kd
         9lmKmW/kPp9lVVtwIZE815OQt+qW/Bmy6/6Ysbyx/5abQ3udLo+8jN7QM6vUoVb5LxHG
         UzpJoP61IWSI+0E6FESwoEkg6Dq4maHHWMqGYCoMKCxb6yAP7J0V/dLYbr609CCuIuWs
         Vu2/MlaM6a4XE9R1MsJg/JwB2DZQFFba5rkd7g5LCmz22El7rrgyNToitq0dSX9Fcahh
         2ixw==
X-Forwarded-Encrypted: i=1; AKwUvBxqtXBFFOlKtnS1vf4/0zzb59ezVUu3N6KMmUCXwsk1jkMnY9DjAoM8TiawYO3Ne3BBJrT0KDtf3urPZFc=@vger.kernel.org
X-Gm-Message-State: AFuF++nRpbr1tMPCZhjLx8ToIIRELGaBBISZMhJVQ/MzmS+MrVdGnJIC
	C0I0/gk62qk/uxHI57doLYUN3PkolItA2hMKB/f6PQecKvnmKKIdrUDX
X-Gm-Gg: AYBFou2ocd0nntfuKFUEpNqh2xkvE7jo3kHFFd1C+nYJrai9uuM/54b9Zj/HbGAsr+F
	PTdfjtHFWTCbdDp6JCt99YEsR0RGxzmCNAc+7OgPKUMqiUSDC1X6Q9QG2EUd96hrzTA3Ml2Dpod
	4vhUYkxh9DuLIe+AEWZrQtJzi8/fremeJPjnK95TBpcdBVQD8JlofbCpnW5fgD5jiKA7u/7XFaf
	/2mIutljMQB864ZXYJ2i3vXwjTGeP6Nk3L+FNc55fj+rPf+xkichpd5+OYTi3Yb3fQuagPeMDz0
	mRFigkI6vF9ENcQjww7vLAXcUBe6Qg76dP6wimv/9PONX6D1/gPbattZGIQ/luluGXJaPKI2PN9
	xue4ogUD66jsa/fFCpfvBLDsFE9zTnUksOQNNiHdvadjvPi/zJhycB+44K+/PUXZDXRQfxKqkmJ
	Bza2+64byAaoAZUyqRgtY9fHmaDAIQ5LeOtaSe3+TD9xG4ZRBlPoOTeMAHuM67S3E3AASWfz99p
	se/UN1YFQyxn1tXpUXws8zFKynPLfnqrMlMPnde
X-Received: by 2002:a05:6820:61a:b0:6ca:4a52:797b with SMTP id 006d021491bc7-6d4411d248emr14131280eaf.50.1790686191517;
        Tue, 29 Sep 2026 05:49:51 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8830ab0d7sm6781572eaf.11.2026.09.29.05.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:49:50 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvin Owens <calvin@wbinvd.org>,
	Yibo Tan <lhfff@tju.edu.cn>,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v2 4/4] pps: generators: wake up PPS_GEN_FETCHEVENT readers on unregister
Date: Tue, 29 Sep 2026 07:49:37 -0500
Message-ID: <20260929124937.51114-5-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124937.51114-1-danishkhateeb03@gmail.com>
References: <20260929124937.51114-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A reader sleeping in PPS_GEN_FETCHEVENT waits for the next event, but
no event comes after pps_gen_unregister_source(), so the reader sleeps
until it gets a signal. A PPS_GEN_FETCHEVENT issued after the
unregister sleeps the same way.

Wake up the readers on unregister, and make PPS_GEN_FETCHEVENT fail
with -ENODEV once the generator is gone, like the other ioctls. The
wait checks info without info_lock, so clear it with WRITE_ONCE().

Fixes: 86b525bed275 ("drivers pps: add PPS generators support")
Suggested-by: Rodolfo Giometti <giometti@enneenne.com>
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested in the same setup. With a reader asleep in PPS_GEN_FETCHEVENT,
    unbinding the test driver used to leave it asleep until its alarm(5)
    fired (-EINTR after 5 s), and a PPS_GEN_FETCHEVENT after the unbind
    did the same. With this patch both return -ENODEV right away. Normal
    use of pps_gen-dummy, including PPS_GEN_FETCHEVENT, is unchanged.

 drivers/pps/generators/pps_gen.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pps/generators/pps_gen.c b/drivers/pps/generators/pps_gen.c
index 452cc12a96f2..474e17c36458 100644
--- a/drivers/pps/generators/pps_gen.c
+++ b/drivers/pps/generators/pps_gen.c
@@ -103,11 +103,14 @@ static long pps_gen_cdev_ioctl(struct file *file,
 		dev_dbg(&pps_gen->dev, "PPS_GEN_FETCHEVENT\n");
 
 		ret = wait_event_interruptible(pps_gen->queue,
-				ev != pps_gen->last_ev);
+				ev != pps_gen->last_ev ||
+				!READ_ONCE(pps_gen->info));
 		if (ret == -ERESTARTSYS) {
 			dev_dbg(&pps_gen->dev, "pending signal caught\n");
 			return -EINTR;
 		}
+		if (!READ_ONCE(pps_gen->info))
+			return -ENODEV;
 
 		spin_lock_irq(&pps_gen->lock);
 		info.sequence = pps_gen->sequence;
@@ -238,9 +241,12 @@ static void pps_gen_unregister_cdev(struct pps_gen_device *pps_gen)
 			pps_gen->info->enable(pps_gen, false);
 			pps_gen->enabled = false;
 		}
-		pps_gen->info = NULL;
+		WRITE_ONCE(pps_gen->info, NULL);
 	}
 
+	/* Wake up the readers in PPS_GEN_FETCHEVENT, they fail now as well */
+	wake_up_interruptible_all(&pps_gen->queue);
+
 	put_device(&pps_gen->dev);
 }
 
-- 
2.55.0

