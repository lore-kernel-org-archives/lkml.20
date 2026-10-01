Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D931549B5C7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846279; cv=none; b=OnaszbxLqhfcd1l0RRhuPZk5kQoRz6s8b+87vKKQbBJyGTUrn8zWO8LNXDhinACV7mIwI14GaBzcKTvZ2/UoBJpYcMYwSpb7UPYJCVY8+ahRBmxal4fepFeI4AOixrIu/l2AGN0A5J6wr4njNiw2tbboQ9yQMA498woD4eHGW6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846279; c=relaxed/simple;
	bh=PmyQeC6LvDSnolw10ROUpGhiFr26/nakPx4MtOS9JWQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rd3prqjYXyCy9JTmn2EubU86y35A3G9EakYY7G6p5MUw6xG3jwpzguUxvL5C/4RXZm73gX1+oP28ovOcSU6RmL+UoRNp1dOyN2ZuxWW5Jf79gPx4yeQo5KDKvFlhg0NMjcjK5K5rfEtXiybVpdNNMtRXLkf8kjgBtm8lcAut8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YB2Qw11o; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YB2Qw11o"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bcb929cceso1621846eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790846277; x=1791451077; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2L2WfK0Lx3dhBYa+ZLW7j3Z03zzazet5f+sPTeR0f24=;
        b=YB2Qw11o+yWa+PBkksveKVdrmGqyeUyAd1QV0ZpYmKmeXpWBBGtcGivGf3nPkRcWU/
         WfuU9x+kCgPJ6ruZ/ubwVDbzOjpgdPrg4snG2HriIVl+dNSbXSQGfPkD4nDkrvwmeygg
         +p6yNSll7adDLeSeClaccDAFNK/NKHZWO6XhmNUcMLWr1tuss01n0QnVnAuDGoxoqVIP
         iMpdVUNL+P3dmSfiY0fcHyAmIWNpZ+O66U2xYCLnpWZQaJp4iy1BBJCWdYauxjdKNXpP
         gj8DaFAGXTYJTa4DYne4uMXyylX+ThveXa6skYTI9OWqx1w/nAzixLSdTp2GBJLrzOG1
         6CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846277; x=1791451077;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2L2WfK0Lx3dhBYa+ZLW7j3Z03zzazet5f+sPTeR0f24=;
        b=sbNCdQRw6HopaPuCBvG2zPs8wk+1IIcWaLdnEDbe75j6Sl6UzQUU7fe4T/qwg7Zyt+
         pM1NKkmjaFYw30DxtepXtYdUxgNSY4xpgoM6XOtNJs5MW460ri2zGjdaNbSNptKSp48Z
         ND5lZJDRqRK8+VWa4+rQBz4OWswCkc016wrcUv5uP0s4j4IfLpyt5q9uCtRbtpOKDgrc
         g+vulS8MGxUXjmDFMgYX0ZfVaVsRVTd9tux2PKixU/EJWfUgGRrdF9Cw8sQkezKzz1Yc
         9NlicxC/YZBF/U3F8SoqaHv+F1+tk/XPVCv5nVhCvy2SLjFv1vFUg9dwX/EWghLsS5mw
         +BhQ==
X-Forwarded-Encrypted: i=1; AKwUvByNcK/gEYScnhKLtjTGkxfu6mIaurZ5dtj/h23zmO31Vourq+X/0DfRpHDYQ1qS88w5N8Tv1ar2ytMEvmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgxJ1zc7cqpFADjKg+FjVThPiuMCtYMI1+oT+Ak1BsDbRIzgDu
	CSPGH+IWkmMVEcL6BE0IxmM44BaykMEXPxXbvZRorXvVJP28XLxmyth3
X-Gm-Gg: AYBFou0AupvS3DrsLNhpdzuk5Uo2D/Pp/qzezqIbPpkCNOlH6GWEjcoan9G+LRa/tqe
	OWLk1gF2HbhnIcLV7c+/AVZGZADwCpXxFL9QVm53nvfTYfFct8XhtW3FxG3BuYu2JVq2ynbhIkX
	3dOxRqrtyKFH9RKmJf45i6Tpvj6LdZuVptGWR03C+HkRoPLDpVXlVqlO2upkcfCGGbJqDCsfLYg
	M3pjBsbt3LrsoHzHafn3PV4/IBrWQhAzabzQi/DNrA2NXtgeFguOV1mGUnMzUddp71Hj0DRXLeO
	pFsmYqTt86q2lMYB/9pmibY/ATAJ6OkPIkJuma8sxcM0e5MdjBs+Pz0VtRBC8OyVeo7uY0e6j9a
	jUy8FZez2jhFuw3loUwyigy2YdhUqhjMUop5Jd8QVaRSclR7MdyCNzy8cBnFncvc73yowV0SmYS
	VhBPHnjq3Er+lAe6qNccsaHRzp1Qo1McAf/XMtLKZITBDHtnOAiweW0PWqLmBxNBwrJQ==
X-Received: by 2002:a05:693c:87d5:10b0:341:dd10:c9f with SMTP id 5a478bee46e88-34cdd0aaeccmr4374420eec.35.1790846276662;
        Thu, 01 Oct 2026 02:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3750fa8sm6271798eec.11.2026.10.01.02.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:17:56 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH 0/2] blk-mq: stop waiting for an SRCU grace period when
 freeing a tag set
Date: Thu, 01 Oct 2026 17:17:49 +0800
Message-Id: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD0lvmoC/x3MSwqDMBAA0KvIrB3IBCppryIuEp2mQ+Mvo1IQ7
 27o8m3eCcpZWOFVnZD5EJV5KqC6gv7jp8goQzFYYxsyhjDsEUP64rhiTHPwCTcfFTX3OzoidsP
 z4awjKMOS+S2//95213UDMfXAd20AAAA=
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>
Cc: Yu Kuai <yukuai@fygo.io>, Hannes Reinecke <hare@suse.de>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

blk_mq_free_tag_set() calls srcu_barrier() on the tag set's own
tags_srcu before cleaning it up. That costs a full SRCU grace period,
1-3 ms, on every tag set teardown. When the free happens under a lock,
the cost multiplies. ublk drops its last device reference under the
global ublk_ctl_mutex, which caps 16-thread deletion of 4000 devices at
19 s on 7.3-rc5.

The SRCU callbacks free only blk-mq-owned memory and never touch the
tag set, so patch 1 makes the SRCU instance global and drops the
per-set barrier and cleanup. Patch 2 removes the tag_set argument that
was added to blk_mq_free_rq_map() and blk_mq_free_tags() only to reach
the per-set instance.

With patch 1, 16-thread deletion of 4000 ublk devices takes 2.9 s and
serial DEL_DEV drops from 3.45 ms to 0.17 ms. Destroying 256 null_blk
devices from 16 threads goes from 5.15 s to 4.30 s.

Tested on 7.3-rc5 with ublk and null_blk create/destroy loops. A
KASAN + lockdep + DEBUG_OBJECTS_RCU_HEAD kernel ran a 10-minute stress
that raced device creation and destruction, I/O, scheduler and
nr_requests changes, and CPU hotplug against inflight, debugfs busy and
tags readers. It produced no reports.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
Qiliang Yuan (2):
      blk-mq: share one tags_srcu instance across all tag sets
      blk-mq: drop the tag_set argument from blk_mq_free_rq_map/tags

 block/blk-mq-tag.c     | 19 +++++++++++++------
 block/blk-mq.c         | 25 +++++++++----------------
 block/blk-mq.h         |  6 ++++--
 include/linux/blk-mq.h |  3 ---
 4 files changed, 26 insertions(+), 27 deletions(-)
---
base-commit: 551c722f40809618230001baccf219193e22fc5a
change-id: 20261001-bug-blk-mq-global-tags-srcu-811e8d958281

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

