Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793832120;
	b=tEMgbIspFzN8RRk99wtRhK7+iPJicv+43IKUvcx1dXLdQKk4m5ntXHGypG7JL1ZRCj8M
	 jCscZhgT1Lj3bp6HmWTUDvx3sAkwotumqJG4r01nKX6KK0p1OyVIf7rI5DfieVyPILLp6
	 S0MRRSH2vrr+/urSNfBSbgFu8JlS0vkikqSUlPgDvTjHyeEueWosWTxJ6r+XLC8t3F/O3
	 zYdHHT6WvpnN6J6sXTk8vzpyYvvz2znP4cZR6N697SJ9gt/9JrP0tMotfY/rdBadUYIAa
	 dCyosQrg4BlihXCmFx5EKWyke+XajY9k3/tLc9fX11Iljogds/TQX7VwSWoBBkddThA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:X-Mailer:In-Reply-To:References:MIME-Version:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Le7HKNyvunzvQx/aShnNzGNgI0iOTWFy0ku1BiRO6Xk=;
	b=WzDznE8XSNVNRiUoooVh3/jXsiydwpY4+/0qB/G2HbqcN/Dp9dL5fTeyEcMKHd5A4pEP
	 6IrJH1jC/cf1dV1SZ32vziaqIvi8ehnqCe9xbjQPc+XwDIx+LCyxLcMce3OfpbamWCdLJ
	 T5texEG7abI6ARUMKEPfPRRCSbQmBte/+b3pVl0smevt7YcdrNrgEwvnpc0OlUhsPkBd8
	 0Yo7w9yI06RxEa6nCcttlScWNSGwKlYSY9kZhvjjl+ts3t+/Bb1+4cnOkPAv/fpyS/eRO
	 CZw42ukX6rvgm8cuxN3Qdx6OdY42SVcvttxbcfhdI/3HJrZZe8Vq5tgkdy/tKwALx3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrJYosoc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1335606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1335606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nrJYosoc
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-49de8ea072cso517072fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793832119; cv=none;
        d=google.com; s=arc-20260327;
        b=eXNHtK6etZddwQMjkX/AaMBH2PABhvRwGPyr/o8j/WD0PXGsiLR7vdwH43DoF8Eot2
         F7ypDGLkSTJoJJtBtysrHuanhsjo6ANnqRCFho60/Rs3dKY1MmRg6fcaBS5795CVo1/+
         j9xjUDOVr2/oABHfpat4tzJWOoQzIADdpqP7BPTyf4phWG4t496NsrYmPXLNpobvjaDw
         w2LGRusIKxkYYOOuzqMNrhuowBzb9XktKYo2IodEA5IXDmZ8rWMvtZ3Nj2oewpwzTunf
         jLu46jVoz2IGrt0pwEZC/TqeR8Qpp/mv7IhLAYIACw9SDyeiPeupqRDyEkzUsg9z0jIr
         DPYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Le7HKNyvunzvQx/aShnNzGNgI0iOTWFy0ku1BiRO6Xk=;
        fh=1/w2MFVGVyjm0ehMdOBNf8Gwh6dtwiFwXp2wqPm8GZ8=;
        b=a82SnXf6Tj1HL3M/6N9S2WqkKE+aT3vyQHpebDjxnPf8NoXopzXBiBtrlFFr9xG1KN
         7gHULh7CPk5MrTvJqW1RXSYqtOFFFp4gvrmzKM+KEHzxXuq02eK8wpIQ30H3GN/2tuMx
         npHtBubxgq/knfcJQ35ScvkCx0aOw7F/3Nre1zTXSQsTLj6bKJNMQa6UAMUeuA5j7GBO
         b2fFVAFmYkwCDcveFmrgsolZ5NAxHKTQHUEyc6gv/Wd6FyDZphC3aobPGYrMprkQZeOj
         MviDqGOjq/GziqD1Yejsy2+DmmcLCMaoGsszrD5VNVuCrJgEQYz0jRjBdGb1hrMgZLay
         fyww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793832119; x=1794436919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Le7HKNyvunzvQx/aShnNzGNgI0iOTWFy0ku1BiRO6Xk=;
        b=nrJYosocl6Cgj7UFFT0f3IuLJLZzbYzD8JYNSuLY6nmx6k5rAOOgl2sLqWZ53No5/G
         Rdwgc4zwNZgKbtUafDAnG+ZpNXst8rD7tdmbm/leDSJoCGsRpdF59y6I2T+X866kCWUQ
         gMJFpRJa+VqueDUAdLZR/p6wg2YvL3lL/GJXgvkqPY5fL9077zgHllbNAGUkTZovF5WI
         oT7gNX0nM9TiDgVqdjD7UYJqsgJ9enHGPJgUsN2cv523Dace9Vew8fHiEavqXIc/sV1l
         z6D4n++vCwDwiZ9SAXtNqNneVD3ocOr40GtT8M/eKeZFotnjKKk2WK3XnOjAMGcEzR+V
         psfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832119; x=1794436919;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le7HKNyvunzvQx/aShnNzGNgI0iOTWFy0ku1BiRO6Xk=;
        b=j2QpJqFRPiAWjtLEXGyhNXpqLpYGzs3Uli/2QboMF0tj1rdDi5ML5FPWMNJDIx3RvS
         C4GhXEKaVx4R7x6KfpROXiZhKtEHLyDhOlfIM/MilpLDet8U++4cmdxheM59m03vPDZ3
         SOA+V0yjRyt2WLvd5HtgxRVA2D4ykr01p5X/y2IqvPlKez66Jsx0E3BPWXeRVZQ6+8y2
         MffQcomNoLgcrpxImg7IZ0izUwR0SRS4gqEmd/TiWhiTPH6k1X9nZOxez1zzJMwTripv
         xH2rytPha2gz2+yy+08N7AGHZ2wQGhedmHDrWzX55T2acEKHT88RUpa+M7kFFHYcSjlT
         kcwA==
X-Forwarded-Encrypted: i=1; AKwUvBxGPwYj5ArYrbKevyX65hPSDOcYBmFE6Fp43U+PiS2NLVDkfSUk0LnT8jvtTV3viqe8SemDSwTXw39BKPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CAphf0a+7NvKsdYuXYfinynQDRW9VxbVTm5Oro53YAHklhT3w
	c3wSmsUw1ixyeC9uWPMwdWwPwkCBX9J4N52PHdusexGcbB8PArzJuMQQe5ZiiNpz9cdAyuSvVvJ
	b9uLWvjvFQjYQ2SOserstTDCAzsROUH4=
X-Gm-Gg: AYBFou3r6qB/Vdzlt5A7p/ep3v+s5NLofM4Uh4sFlo4lQq3g8mFsjz192AmQvbunVgm
	/5SNoHRrYDqjr9/nJYLImUl6ZFieZCYpeMqxI6zBNguECm+VWHXJeCQgtwMGw/BzVM31zpDVDHD
	ZAFvHJmoMEuYTdmDOLXaoaEorf/qtUtPeLl3TyFUY99LzmwO96294iiKRZIw1kC23oha7LSoyvB
	HiYkTr3CRbSZZF0eokkG7Q+Ml70Ep9mH3E+zfN3+Z4ka/uwepMCSzTrARwCo1tsEEyuzgetqunk
	hIJlMRJufW3Fs2MriXsVAg9tCjK/R7sU4yzMrRSTEjkCsSk5azu71gfciDz3TPz5W3KZZKJFUkZ
	FlVC+6Xd3OH4O37qA/YBrXe91iCx64FgKv0xjWPab4iQ4JFgGMas/yoKpDKoMnd2F6ywD7ss=
X-Received: by 2002:a05:6808:3a13:b0:540:5827:6d8a with SMTP id
 5614622812f47-5640de8d663mr11690958b6e.66.1793832118868; Wed, 04 Nov 2026
 14:41:58 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 22:41:57 +0000
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 4 Nov 2026 22:41:57 +0000
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <CADZg-m1A5qKMfXGtQw_s9-tYDL-NinDX8bNAxurFkrWRRq7ZeA@mail.gmail.com>
References: <CADZg-m1A5qKMfXGtQw_s9-tYDL-NinDX8bNAxurFkrWRRq7ZeA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 22:41:57 +0000
X-Gm-Features: AclHuK8G_S36ePhSP8ix8BUldjXx979HTJRdUgyJDXB9GJjPu8eEhpUl8IqLEfM
Message-ID: <CADZg-m06Zf1c63em8uJaDKVQu68sHbdBi1oZw7JAbhUtvk5nXQ@mail.gmail.com>
Subject: [PATCH v2] dm: Reject table setup after queue or disk teardown
To: agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com, 
	bmarzins@redhat.com
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, 
	syzbot+5307e3bcacec2ce4c2f0@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

A failed table load can leave a mapped device in a state where its
queue has already been initialized or its disk has been removed, while
md->type is still DM_TYPE_NONE. A later table load then calls
blk_mq_init_allocated_queue() on the same queue. If del_gendisk() exited
the old hardware contexts, blk_mq_exit_hctx() dereferences their cleared
flush queue pointer.

Reject setup attempts after queue initialization or disk removal. A
failed request queue initialization still leaves md->tag_set NULL and
can be retried. Set the request-based disk operations only after that
initialization succeeds, so an unsuccessful attempt cannot leave a
bio-based retry with request-based operations.

Reported-by: syzbot+5307e3bcacec2ce4c2f0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5307e3bcacec2ce4c2f0
Signed-off-by: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
---
Changes in v2:
- Resend as plain text after the previous mail client reformatted the diff.

 drivers/md/dm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 1881d86..2f3f1ec 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -2606,13 +2606,17 @@ int dm_setup_md_queue(struct mapped_device
*md, struct dm_table *t)

 	WARN_ON_ONCE(type == DM_TYPE_NONE);

+	/* A failed setup may have left the queue initialized or the disk dead. */
+	if (md->tag_set || test_bit(GD_DEAD, &md->disk->state))
+		return -ENODEV;
+
 	if (type == DM_TYPE_REQUEST_BASED) {
-		md->disk->fops = &dm_rq_blk_dops;
 		r = dm_mq_init_request_queue(md, t);
 		if (r) {
 			DMERR("Cannot initialize queue for request-based dm mapped device");
 			return r;
 		}
+		md->disk->fops = &dm_rq_blk_dops;
 	}

 	r = dm_calculate_queue_limits(t, &limits);

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
