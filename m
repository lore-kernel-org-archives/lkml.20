Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697745;
	b=hHrL0hvdvjCd7P7K9feXGMfKdos/aQ/P0NAPvY/OUkxr8iXEbas0RAdRf4Q37fq96EYh
	 URGs+Qi4LxuYHgR1ViOZhSTfOnIrh4XHaBRtQCbEbIREBik6B8SOhkyxwZNtCwyg+dkPk
	 8TXJWUDF5jvjDrsUtGNQH3sKocs4c8ZHOckCQaTH+zjIG8kllfKsx2xTirg2p6n6Y+S//
	 8SnfEANy6wPiWrV/uQdtjgbJ6ORdLYALSEbeDaiCP+95H/e71YyGgExswt8DLZQ/jLgeZ
	 ge39JFweGtXWwRCn/w7z3fkyK7w6zXQy41P82B9nVTh1+CiQIY98yuTfIxfkMsm7gsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
	b=RhIbQARFcA0cS/PzU2z8oBbeiZWcJdD9lv0qd6Y97EDvrX7Ix23UZwJYfN1oVFUN0vPm
	 Jt7TGcEJSDopD2Y/ZTg9vw4Na661Z/fAgjr3BcpCjtATDJlr+c8eUmG3tuhcS0FBZ4f3x
	 D0wFRsV8Km4DYIwW5eBycuSq7USVXmYLD1GN6ZUT41xNVrD/rlPY7271z5XThmhFUUOde
	 PCkDxKVjr8CY6gl1pe0MqpbflHumurHYvTTU8sVPS6WISP4tPnCmrnGJI6HeGSv3ogbG3
	 MPQUpOaSI+dxRYyjVnyCW7Sd7W8XE2Z44WrNKhv1jVYKvEOMDaFyGW5voRnhQknl5Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Gc8BxcR/";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B850A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B850A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gc8BxcR/
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso126001a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792697744; x=1793302544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
        b=Gc8BxcR/0O5k85KrrxERVtErIyEf3cZabHxvh7EqbjetE3siOF05Hl+LxAc2DJ3yxE
         0FkJOVPjiXzAnEVio4bEer8cUlMDPRFhK8GKLE6C3juZ0ZkygzEzi3KGdZZeAwSZVlYK
         44k80htg3yNeRB9DERPcTRimtlHzaKvrtaPJeRyM+MD1MhLDblZZFLLsgyszlsLbnkKI
         cyDgNkEmeZ+6tk5N/xdZlCSZZyq2Hst+nwO01LhHmqqTn73H6DJ/dXLEc7+lj0gIwKhf
         Q6Ch+Tba3tBLf1z5sfm085QXQXj7izRovs7TvZ+zInqt3X7LbdUE1kkaf/5PBxK9fSei
         8e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697744; x=1793302544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tGnlBktFh5eVn0yoSJXVJDZQZm2aLj1/BTVa+INKrzo=;
        b=b5nqjMtNpI9QfVeixhV9vN0nDy7sE/5vZNB0zNLzmYr8bzdyRQXS3dRkDkIYWCcqod
         HFlpygVlm4xPXpN44+lLqx7v7WWTvRbaPCE5gzvl6D8lCY3ub5uMTZ1Ia44j2fPSs4L8
         ck/SQSCtdvecfRMxrPkb1slO3mZ2suly33BzIPnVsMAvcImlgb7gqomBYIH6yQeLcsc1
         BNuKHqMGzr1EOsd3MP39Ke+YFp6hLTz4YfJHd0b2rCbagi8nSLJe3kN1mEXaDZE0coFz
         ZSO6KEj/J5mowrVOrD2VKoObGwM0lvcP6CHKIxn9yateB5g0eQj3h9nJhyt7IG9/7LEL
         VNUg==
X-Forwarded-Encrypted: i=1; AKwUvBwclD0siu9m4Kp2A6oW4zvfyvkzcGX1ErrsU9fvAPRhFOKj6+kkt19No/RQX4E6yh0h9T2Pd4fBUnEdHC8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJGZM1ib0dxNsf03KiVOIYR0MosxcMjc8Ep76b4EolvDb4tXaR
	GNnqUP04UI/JVm9t2Hwi1YFttDQcoPK71pwUVqOufg35RXzUNW27aLcu
X-Gm-Gg: AYBFou2LC5b3RdzFNeot0axDktkTy6Br9XpyV+PnnCgLnQaHFjWIBPXd50kCeHYeids
	l0GR3q/HZoDXf0AxYBclBB073w5Io8lgqKef3WJc7T9LFZ1aQfFsQ0fN9Y6/hANJm/H39kO3h30
	YfPJlS0QSROrjh91KykhroUnMqY9CaV/cSZ0XXW6y/7Ex1hDNwz+fltSg5+9NPSLxXdJ1jwfJpL
	0wSCby2VkrajbVUu2NmbJ6xHLr9qjvf5f+QobDFmCMC0YPowbNf2ymmiPFrO0v0di2gg3frOBCC
	aF0q+xTyqKiMR4FQno60uNGJLfOr166yU6LSfRdK6ithCzHVOiaAZMxwoB0i9m/LfhngpB9Ya+t
	n5DkU36CL3egHHLdHQfphnpJnUJcNTycHmxSPwuCRl2ewmjTkSpn3ZAnFu9kcQo2V1JeSqzhhHH
	M3keyGwkwRyjRyMfOKPELDao7+bdWiySDNNuhYBOnp31lIZ9EpalzVRmo0k28HB8DaTEP5a4G7J
	A7HKhB/IXx/hIzZ1z9qoc+qLChJLb/aEgK2HRXNGfgK+J/y88QBgbBIOo9NoqUnTDi5YbjPvefC
	8AubsR6c82HKQnnTZUs8pbw9tLjDv47r
X-Received: by 2002:a17:90a:d610:b0:3ab:7031:d962 with SMTP id 98e67ed59e1d1-3ad86ef29c0mr4945649a91.41.1792697743922;
        Thu, 22 Oct 2026 12:35:43 -0700 (PDT)
Received: from casta ([42.116.198.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e46csm272182a91.1.2026.10.22.12.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:35:43 -0700 (PDT)
From: Nguyen Duy Nhat Anh <neganhat@gmail.com>
To: mchehab@kernel.org
Cc: llinux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duy Nhat Anh <neganhat@gmail.com>,
	syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Subject: [PATCH 3/3] media: em28xx: fix refcount underflow in em28xx_free_v4l2()
Date: Fri, 23 Oct 2026 02:35:22 +0700
Message-ID: <20261022193522.12996-1-neganhat@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022193159.12713-1-neganhat@gmail.com>
References: <20261022193159.12713-1-neganhat@gmail.com>
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

em28xx_free_v4l2() is registered as the v4l2_dev release callback, invoked
when v4l2_dev's reference count drops to zero.

Calling v4l2_device_unregister() from inside this callback causes an extra
call to v4l2_device_put() on a zero reference count, triggering a refcount_t
underflow (0 -> -1) and a kernel BUG in lib/refcount.c.

Fix this by removing v4l2_device_unregister() from em28xx_free_v4l2() and
calling it in em28xx_v4l2_fini() during teardown instead.

Reported-by: syzbot+809dfc586f33fc44b6ac@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=809dfc586f33fc44b6ac
Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index d653341ffd16..45b62655ca3b 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2332,7 +2332,6 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
 	struct em28xx *dev = v4l2->dev;
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
-	v4l2_device_unregister(v4l2_dev);
 	dev->v4l2 = NULL;
 	kfree(v4l2);
 	kref_put(&dev->ref, em28xx_free_device);
@@ -2462,7 +2461,7 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 	 * The em28xx_free_v4l2() release callback will be invoked once all
 	 * userspace file handles to the video device nodes are closed.
 	 */
-	v4l2_device_put(&v4l2->v4l2_dev);
+	v4l2_device_unregister(&v4l2->v4l2_dev);
 
 	return 0;
 }
-- 
2.55.0

