Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B52989B5
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790824246; cv=none; b=j0MSdXSXM5bFep/wK4IqxIACU32+dyobkdILxEXFeIxJDN8Cpe3ymmGk8pEBVvOwh+QvDOGFvBHCS720gsnSIkC8BZji/Re/jt1aKIkst2zGMdOMv957/ExMOmFTz4sN/vCYyhhdRpXKoU1YuGA0Sg5ygw66vD1JkttVpflRfOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790824246; c=relaxed/simple;
	bh=7//85heVGXO9H7UfS8HzbcjadhZneA7l3g7DTGwUt4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dILUKIZ6sNJbbD4g0LU2pGrx5BEr6qWM17B7os15q8MTlDIwei6WTKXeAqs11vYkeNSZ2RFbyCwREzLD2m4g2JaTirptB3UHIQQdTywyCMxzMl97CXoy6VPY68LdlOuyh+aaALaLM2ObTvtzwLl6QLZect38znVhggnKZtL/280=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqdTAd1N; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqdTAd1N"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so3485632eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 20:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790824244; x=1791429044; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=du/Qj4NGycFo/+y1OZ+i6rvXhibgURTGLPw6IzkgrIM=;
        b=QqdTAd1NJqRaqEOPthZLgo3Uldv9YmO90+cu/ylqIf4yUlBBUBr0UmVVDX0GW3Ktzq
         QXQ0Ypo5BtV3LHJTv2TCzMoOJKVfW2MMsKv0PK3J4AUoiuubkoHoJT85e9z/9HvKkWAJ
         7MNASBeI0Ky+bohLUEtaNtqYhMEiRQmWSoMJDcPctkMTp7/euy9yhJkG4RaQ0d6nc7yy
         6BtDfqFfMRCVMnuDubaqmz3Z3YtGJ+hKp5OOGIU2gXMWDnvm4guhQrJxrwH6Nnugsiq1
         Iow2qejziQcqH9UBxXmM0Z3bA3rr6vjqFmA2BDPMm3RKWQLD1wPhwvclWskTwd1m57FN
         asdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790824244; x=1791429044;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=du/Qj4NGycFo/+y1OZ+i6rvXhibgURTGLPw6IzkgrIM=;
        b=t7XpWE7kfo22VrylaIvKNQeEJCAzw6l85Q7/9KNtLq0+5qr26E061cK5cM/2oZr9Lz
         jlsotAJM4tC2oOm4bS5tDy7zwAFzhvPbGyUXzIHkqFdlFneMidPgC92JNSUMSKyde0q2
         6LS4nAtWZNe9yYAWbtAmcBSRdpcVCYWgLe9tUfraY1MK3iwjYTjpHD9qz4a21AAZjen9
         NZNYZE/cfrsAz/2LJvh4JpVQ6QYSUD0IbwAy76jR7WBHMhTNv8/Z0pl4S9evrIzQ9ZM+
         NYUWzLb7rMhOdDpykSam0m1vfU0Q5yCnehcTqpCj2jh2O5muNC2XMCC5WOD0Tcor8Y/l
         w/jw==
X-Forwarded-Encrypted: i=1; AKwUvBxgA4Eb6Rv5aNxib0PlnaK4lB+/R9eRXpJjEXejPIOFUfWzbREGEnFYwGfd4Qc+5t6x7eEF+m2H73re31A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYFfJBz+MBGggATpVrUcreE/CJVuICbmxGlzCpMiggqN3H8Yxo
	zLrOYbxNAA3iutM097A1ggwMhQi8BfleS27gXEp4TJUzUdjucRwh9bys
X-Gm-Gg: AYBFou2iJ8SlW+zFdvsiB4HzFPUIaACA0rT4V4L01zIOrU/h2rqHJF7pIj5+cLj4O4k
	6tvIFIppzI7bkiGF9I25OqO4Zlsset1vF1o+I3vCafsH6E+LNd0Ib2j6nDqr+aztFqzay39SFbo
	kgbC+iqtL62+8DS1iJ2QrcvcQ32rw6IM6qvqbzA2rWnOnzohS+xKOPyA73rAdnQOo/G8Afc1Pqi
	gRpD25HXY8E+NM4mxNoNz0rc5dN5psZRVuhErGzuBQvIt63P1C9mHqX4KU3CuRPpWGSRvS3O4mo
	fwz5AuzD+vSBmR3eIxQ3c8mfzRiCwMTiwFFOG00NYw2So4RFtFWj8Dcyh6kAA1I0LddQCte0Ot/
	hBcUmF9HVAU0+cGR7+5GaV2Si89xflh8klVxfMHDe38G6XLi9l7asi0YW3AvztLna+lH8CEF0oT
	JkrxzBtzKwxHM4SOHFhh7kS4G1OlRe+46cztsqS9BnEB7Oxku9oyMqgwwSqqh0tgkJBg==
X-Received: by 2002:a05:7301:3a94:b0:339:79c9:a711 with SMTP id 5a478bee46e88-34cdcfaaccbmr3339009eec.33.1790824243878;
        Wed, 30 Sep 2026 20:10:43 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4926277sm3131875eec.25.2026.09.30.20.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:10:43 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 01 Oct 2026 11:10:40 +0800
Subject: [PATCH] ublk: don't use an I/O scheduler by default
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bug-ublk-no-sched-by-default-v1-1-0bc91b6f075e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAC/PvWoC/x3MQQ6DIBAAwK+YPXcTsJaoX2l6AFlwo0EDpdEY/
 i7pcS5zQaLIlGBsLoj048RbqJCPBqZZB0/Ithpa0SophESTPWazLhg2TNNMFs2JlpzO6xeVez2
 d7vp+IAW12CM5Pv79+1PKDf8HhtpuAAAA
To: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Requests of a ublk device are handed to the ublk server through
io_uring, and the server does its own queueing and ordering, so an I/O
scheduler in front of the device only adds overhead. A single-queue
ublk device still gets mq-deadline by default, which costs throughput
on every I/O and an elevator setup on every START_DEV.

Set BLK_MQ_F_NO_SCHED_BY_DEFAULT so that add_disk() selects "none", as
loop does since commit 2112f5c1330a ("loop: Select I/O scheduler 'none'
from inside add_disk()"). Doing it in the kernel also avoids switching
the scheduler from user space after the device has been added, which
waits for RCU grace periods. A scheduler can still be selected through
sysfs. Zoned ublk devices don't need mq-deadline either, zone write
plugging serializes writes per zone in the block layer since
commit fde02699c242 ("block: mq-deadline: Remove support for zone write
locking").

ublk null target, single-queue devices with depth 16, fio io_uring 4k
randread at iodepth=16, 16 vCPU KVM guest:

                                 mq-deadline       none
  1 device                          111K IOPS   342K IOPS
  4 devices                         286K IOPS  1070K IOPS
  START_DEV p50 (1000 devices)        8.53ms      0.36ms

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Zoned ublk devices were not tested at runtime: none of the ublk servers
at hand (ublksrv, the kublk selftest server) serves zoned I/O.
---
 drivers/block/ublk_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 66eb55e7162e5..8053666c04482 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -4389,6 +4389,7 @@ static int ublk_add_tag_set(struct ublk_device *ub)
 	ub->tag_set.nr_hw_queues = ub->dev_info.nr_hw_queues;
 	ub->tag_set.queue_depth = ub->dev_info.queue_depth;
 	ub->tag_set.numa_node = NUMA_NO_NODE;
+	ub->tag_set.flags = BLK_MQ_F_NO_SCHED_BY_DEFAULT;
 	ub->tag_set.driver_data = ub;
 	return blk_mq_alloc_tag_set(&ub->tag_set);
 }

---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-bug-ublk-no-sched-by-default-6f53fa4889e6

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

