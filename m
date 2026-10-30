Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357782;
	b=UpPuAkqqi9E++v+vOdRNKYw7cUa15Asv1zQae10XvCh/aK4wz5K/KpMskk7qePuwnVpW
	 x38QmLhWdYW3u54YP3CMnEnsV+Sq58uj/iCeKpY/rm833v13ANngUUEMJlI/wXy7sGZi/
	 ql33v/Hn1r3lxHgtP+Oxa++9CioOpuF9f49KjraPUIiG4/ePFvp0Cf9MiI2VjOZ5HBGmU
	 DpHybU4ZbimmiI22gtoHk7gvceLxHUuudsQNUq4XQA3dEQlm4uJ+0vw0r+G7YODxRbbO8
	 RyNGIG9WBFzXxDTzpNq9dtpRqBiYxCZrSxPMXycnM2vh57G1Q2MNlDvuFgW2ThMEXdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357782;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wJe0umuqp0gpxHBN0e/q3xGdapc1vXFbfr7ab2zgNnY=;
	b=ZEAfcNaEupMh8rQ3ZhyhKc+eMSzN1RqYkKnJ46jG2CxpZKl4k/fsetv/+9wr4xSpAQPl
	 0xltt/yMoKKtKyl5GsnQS5F63f0pRRnsGvhYN4mpfHzLsXfSZ+XocXrNpR74o/sVih/qP
	 qXzBUVvHK79UC4NIWV9yzxdbodHNP/+Cwti7itfw7bpuCu6F2huKP7WDEGxJ8Cx0tZpn0
	 fTGk8Z3fw8+tce1/TfXCQ8aiTqRuIxt4Fag36jIc9CWH51lCL0HPccm5wUIVXFxRRDEDf
	 Xb5WeS3QcLa4Q4m1KPinzcrxDPx/qWwoT+6uU4H1efYVtV94vs1pBCrgyu7Xknlh1PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=XTgJLUgq;
	arc=none smtp.remote-ip=202.108.3.163
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55A5606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A55A5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=XTgJLUgq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793357779;
	bh=wJe0umuqp0gpxHBN0e/q3xGdapc1vXFbfr7ab2zgNnY=;
	h=From:Subject:Date:Message-ID;
	b=XTgJLUgq29WwtrpcWjhkHZkYS0skahFwDGsnhHs5yEHrvlQiVQRbDFo0YebfuvlRm
	 /RZFYbdBPe28KmD0pkgv1fzU8uoZizUVu22+q/8mt0NWJ8NCKTFm/YgufZ7LGFRrQ1
	 RgtrFRLcxuhcqmP02hLC43pJmF6M5KTplSzCndPc=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AE477CE0000480D; Fri, 30 Oct 2026 18:56:16 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 7359056291668
X-SMAIL-UIID: FC006E671CDD47A2B1D2E33C0B859FAF-20261030-185616-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+08318698e045b4b85f51@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	syzkaller-bugs@googlegroups.com,
	tglx@kernel.org,
	bigeasy@linutronix.de,
	song@kernel.org,
	yukuai@fygo.io,
	magiclinan@didiglobal.com,
	xiao@kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH] md/raid5: Cancel remove instance if adding it fails
Date: Fri, 30 Oct 2026 18:56:14 +0800
Message-ID: <20261030105614.378971-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ae34c61.bc88765f.313a3f.00b3.GAE@google.com>
References: <6ae34c61.bc88765f.313a3f.00b3.GAE@google.com>
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

The failure of raid456_cpu_up_prepare() to allocate memory causes
cpuhp_state_add_instance() to fail; consequently, the corresponding
instance is not initialized, potentially hitting [1].

Additionally, there is another null-ptr-deref issue: conf->mddev is
assigned too late, meaning that any error-handling exit occurring before
this assignment, which jumps to the abort label, potentially hitting [2].

[1]
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
Call Trace:
 cpuhp_state_remove_instance include/linux/cpuhotplug.h:480 [inline]
 raid5_free_percpu drivers/md/raid5.c:7541 [inline]
 free_conf+0x238/0x710 drivers/md/raid5.c:7554
 setup_conf+0xd80/0x2a20 drivers/md/raid5.c:7885
 raid5_run+0x1260/0x1670 drivers/md/raid5.c:8129

[2]
BUG: KASAN: null-ptr-deref in free_conf+0xfd/0x7e0
Read of size 8 at addr 0000000000000028 by task rp0/9459
Call Trace:
 free_conf+0xfd/0x7e0
 setup_conf.cold+0x6e/0x4a1
 raid5_run+0x1260/0x1670

Add a check before removing an instance, if the instance was not successfully
added, skip the removal process. Move the assignment of conf->mddev after the
memory allocation for conf.

Fixes: 29c6d1bbd7a2 ("md/raid5: Convert to hotplug state machine")
Reported-by: syzbot+08318698e045b4b85f51@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=08318698e045b4b85f51
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/md/raid5.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index b91545ce090d..e1f9ec8f25be 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7538,7 +7538,8 @@ static void raid5_free_percpu(struct r5conf *conf)
 	if (!conf->percpu)
 		return;
 
-	cpuhp_state_remove_instance(CPUHP_MD_RAID5_PREPARE, &conf->node);
+	if (!hlist_unhashed(&conf->node))
+		cpuhp_state_remove_instance(CPUHP_MD_RAID5_PREPARE, &conf->node);
 	free_percpu(conf->percpu);
 }
 
@@ -7675,6 +7676,7 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	if (conf == NULL)
 		goto abort;
 
+	conf->mddev = mddev;
 #if PAGE_SIZE != DEFAULT_STRIPE_SIZE
 	conf->stripe_size = DEFAULT_STRIPE_SIZE;
 	conf->stripe_shift = ilog2(DEFAULT_STRIPE_SIZE) - 9;
@@ -7743,7 +7745,6 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	ret = bioset_init(&conf->bio_split, BIO_POOL_SIZE, 0, 0);
 	if (ret)
 		goto abort;
-	conf->mddev = mddev;
 
 	ret = -ENOMEM;
 	conf->stripe_hashtbl = kzalloc(PAGE_SIZE, GFP_KERNEL);
-- 
2.43.0

