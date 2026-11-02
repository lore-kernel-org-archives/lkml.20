Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600089;
	b=hSDw7PBpHKdPaHd1hV5kTiPoiH0xh5iF6FboKXNcSkkC6JgZxz9NHNw8gn+qtZmTlnsr
	 KUlsexlar2j3Fg7AkgpWUzG3E35Ub5GRa2es35f7np/qQiJdTm3CL7Cz2LQq6UZ5h8dUW
	 Da3vKW93a85pZgn6K1wB80RHkPOBFvgpXMQVcdzFrh/Xgyj9cYzCx70Zpd1uzSycI7/zh
	 CC9kYnvbStIB023I3lvjDaLeaLym3YetllnpDirnZNzvWRMkRstFXdQQrILDKIFBLYFYi
	 fLbZktngJ86i2FX+uvZuu2b1KHJFepIgyzvZOcHjpBIr0qxUDN/Ccrgr2CGFjIxeyVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=UYKyTKANHmNueSZX+Vts+dz5q7U+GTeUPWVYwIUP5po=;
	b=0dLWDo3/x4WfaSPFk8PwjAvzo/PUT9KMqDt/1oueqJaVUCBuReZlccv5nLjCWxgrxi3o
	 kcHbcnE/tjFboS6LOvVzxtHVxCsxcb/L8Xt4EbwGKEyMP9Edov3Jj6NXtb2Ga3KQgG57W
	 YvRmOObvZPTrJ++PsBFA/9wI7XC05yHo2EGi25MMH8rQR2AcagxNzDKeh/M3JGw8bwtx2
	 6ErWhUV5/k7DgkOPwr8+YooNWC2tj3wZb1AvzbrKVtglvhruAUUVtOb+LJs68MTjVMPEb
	 PzkWqgt9iTPMjGDA3UO8v5FQNcheaur/o5x2zefvZz5fM1BweHw38v9DFXxs3Ez/FCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juf1jwvj;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA79606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA79606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juf1jwvj
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1605753c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793600088; x=1794204888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UYKyTKANHmNueSZX+Vts+dz5q7U+GTeUPWVYwIUP5po=;
        b=juf1jwvjuVQts4E14edw9EOV/a773u93dE6UuWrjI4untug/WsMRXIOyaLsm/mRv8e
         NLomAgwC2EqEhqA+iknJ3B49Gd+ALaVoSTNYIOHEUiHTYQiYcKcONL9EtO7FDsx+2vrz
         uJNjMkJj0fR38sN2imgIcIAimKqQ/lJzBivsq4a950Dq7HiYjGH8/Jvqkt9JKb7RtNNO
         P142w2kGl8eWdSXLTxyASIXfNwquXzcpEr7kgn5x+F9Qg9F9MrQVY+J4l1SJVZRF5KpN
         ONiwdnWHwKEuKm0+CfONacuYqkJhoO/9GFkocmokIaBYrWmUfEU8G3/RH39EfyaqvZSY
         MafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600088; x=1794204888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYKyTKANHmNueSZX+Vts+dz5q7U+GTeUPWVYwIUP5po=;
        b=tvBC9OOWkdx1WlqU/Xso/uN/kXKPVlv0e8mZiNXT9z1ymqQ6aveXdHXKj/lWrzAAeh
         hGa0cAIr6xeF1z1ZlKlBwmLbngj1T2oj4biZgOLGRmjk/vrv9MVkoWqFbLrV9AR7SsHE
         nDYdZOC8T86aFh4puFS1igZDheAjvwsVQLnvEsrufPZC5zFQ9GT4rtBpZMce6Fzi2M7k
         fq/CIjN2lG1AsRaX+F0rf8GYgTYyDmOTl8dpP/h7Q21emjLadiHJmtPqX+Sw9WuAEhhV
         SvIDJY8eM+q7fgwIPE8TG0rtttCo+HhFN7t9yKto0NM6oFH9j+AAPqeHrWCnskeb6Rox
         AIbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxizt5Xcx62Ebt/d/uGrZ/WHdbD4Svj2CcFtGLKm/25UJlNIM+PyRTzg0EyrcGqSsZvUzgVlbNrPuS/i/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIyc5h4IOnS1KDXk6CZ+6PFRY9Wd3L3x+G1/Xv2jvjtptxYUzp
	sQGhTwK4THTazF+oyNZhprkAJEcqOsqhzEnJHSXRr+UNouj6/oHj4zSd
X-Gm-Gg: AYBFou3wrOZ1BYzTGtwjIAWLpHHkdKCL2Tklp9ykCugjD4XBonK5nLwSRZYf5lzZKSB
	EyV4NmK0lwX1cZ53i1qVUk4P52YHRy8KUxdNmzRc9aWTmRHwmiH7ip9CK5DabR5rK06yASYNKkW
	F0E2tt9kAzMOqMDmjZCnkzceeaBtQHVD7bymDRi8v4omC5P105yv/in7M6L7FMqtUi3Rv/4ErpY
	NdZ9I9Pl+23QNE3Nd9p7ppAo+r0aMo2IAe60JwPpwXAYQLTSOBrKQHj5mLDd5W/gSbhwKGf3h0N
	tQb+lruUlEVyRNZZ7QxgzODwFiiYDhlFeE8o5RGnqvK+H7Q6eIah9m7zFmjdc210EfosQo3uyAQ
	8ZDRWZsPLqp0T+W7Wv4dN3KzL7nb9bXHl5/Ofkc4eEqJiNaKUapqTwT6KSAQGpmciRwbuq9a6VQ
	/20Hq2aaWf/vz6VXCinZp5iczKEUswfwQc398J2as32GftkuLCuvyFYGTvA3wNGK4LvgPx23t9W
	fQlChsTiLTmIvyRQW5xDhsrmtTwPEdPvqcT/P1shWHkF/Aa1ABusYroQ/gSfLhfEQzGYLAomDzq
	orMx0r0Orp2j+aA9TU1K5/C/F5kmxAFQEseAG9tgn+0Hzr8=
X-Received: by 2002:a05:7023:d09:b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1ac5e320bd8mr13624659c88.28.1793600088113;
        Sun, 01 Nov 2026 22:14:48 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm30288043c88.14.2026.11.01.22.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:14:47 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 02 Nov 2026 01:14:37 -0500
Subject: [PATCH 2/2] block: set QUEUE_FLAG_NO_ELV_SWITCH under the read
 lock in del_gendisk()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bug-nvme-remove-ns-async-v1-2-61780fee111c@gmail.com>
References: <20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com>
In-Reply-To: <20261102-bug-nvme-remove-ns-async-v1-0-61780fee111c@gmail.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, 
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, 
 Stuart Hayes <stuart.w.hayes@gmail.com>, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

del_gendisk() takes the tag set's update_nr_hwq_lock for write to set
QUEUE_FLAG_NO_ELV_SWITCH, then for read around __del_gendisk(). The
write lock was there to wait for elevator switches from sysfs, which
held the lock for read when the flag was added.

When several disks of one tag set are deleted at once, as nvme does for
the namespaces of a controller, each write lock waits for the other
disks to get through __del_gendisk() under the read lock, and the
deletions run one after another.

Elevator switches from sysfs have taken update_nr_hwq_lock for write
since commit 4ff58d6bc9dd4 ("block: serialize elevator changes for the
same queue using a writer lock"), as updates of nr_hw_queues do. Set the
flag under the read lock instead, which still waits for both and keeps
them out.

Disconnect time of an nvme controller that removes its namespaces in
parallel, from a target on the same host, over tcp to 127.0.0.1 and
over nvme-loop, with 4 I/O queues, median of 3 runs on each of two
boots per kernel:

  namespaces  transport  before              after
           8  tcp          85 /   91 ms        51 /   47 ms
          32  tcp         294 /  293 ms        75 /   70 ms
          64  tcp         533 /  550 ms       115 /  124 ms
          64  loop       1283 / 1200 ms       185 /  204 ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 block/genhd.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 10ca8b4d6eea7..5afc60bf139e6 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -781,16 +781,6 @@ static void __del_gendisk(struct gendisk *disk)
 		blk_unfreeze_release_lock(q);
 }
 
-static void disable_elv_switch(struct request_queue *q)
-{
-	struct blk_mq_tag_set *set = q->tag_set;
-	WARN_ON_ONCE(!queue_is_mq(q));
-
-	down_write(&set->update_nr_hwq_lock);
-	blk_queue_flag_set(QUEUE_FLAG_NO_ELV_SWITCH, q);
-	up_write(&set->update_nr_hwq_lock);
-}
-
 /**
  * del_gendisk - remove the gendisk
  * @disk: the struct gendisk to remove
@@ -820,10 +810,13 @@ void del_gendisk(struct gendisk *disk)
 	} else {
 		set = disk->queue->tag_set;
 
-		disable_elv_switch(disk->queue);
-
 		memflags = memalloc_noio_save();
 		down_read(&set->update_nr_hwq_lock);
+		/*
+		 * Set the flag under the read lock, as elevator switches take
+		 * update_nr_hwq_lock for write.
+		 */
+		blk_queue_flag_set(QUEUE_FLAG_NO_ELV_SWITCH, disk->queue);
 		__del_gendisk(disk);
 		up_read(&set->update_nr_hwq_lock);
 		memalloc_noio_restore(memflags);

-- 
2.43.0

