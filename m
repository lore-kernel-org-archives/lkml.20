Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944EF4AB3C1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470760; cv=none; b=QydGwV+fFaRH+PNCMNFb9Z8yrYcABuWVaDiXW4DND8TIQnNcBoOh+2pdx/smmy9tdzIbgaFLvlRrYykoKR/yCq6BdkY9stZqUhNEUkLYUODL4T8Ts2wtMpx43F7ShjqWigZzaUDY5hgAV1mIasGynLKSJY41dNlUKFkKBRDtt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470760; c=relaxed/simple;
	bh=KPrnFm4hvayaaAFkwyvd3eY2Fapidg6IG//6MTrCfxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wu/RsDS6opwDtp4vnBsTAZRFpLgwJQyE68/BiWwoliWYcBl1l7co9cliA3Fe72tA9SRy2qVP02TbVN+2iVF24BtlZ8P6o2LRO8aRUWHe3CeRz6jspVGB+n/d+COKKDwkagLTXQYOgzPtdff/UqATP+CPwRZhKJ0hsDuwmibk1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTTgXDzA; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTTgXDzA"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so1433980eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791470750; x=1792075550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPyDT61lpGPDwAL+jIMx+i4dJWsWNrYrLbbV537VWp8=;
        b=GTTgXDzAASI97SbcMGXLGupRetuvW+ljdonr8qcPs04wPnKBHw5HZNqc2bZUShOS+f
         hFyu3MzbbSIv4MWDBvo9fkgqNqEUOUZy/Dz9AkiQtS5WuRf/guEzgdArcgOLF/1L+tEp
         t8+OzyAccpkDWxY/x4fb5ICwGxoHNOs1WG5WeehuZcmuEoQ1aLLej7fJPshEM+TOMZme
         GgMc500HcYFDZMemhPNHCrq/yUb+Nm90hM/XTNP2ZvS+/uh08M8leYxUf54CM3Cc77Wv
         gqvocF4qYsKwkh3zpPRtAF59IFPfA7DqSTgm9EsYR93zEEA7RZaWMXZA/73+C58D3HZv
         Js6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470750; x=1792075550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPyDT61lpGPDwAL+jIMx+i4dJWsWNrYrLbbV537VWp8=;
        b=G/bXMkwZeyQYyjAfRMrYMNQeVtON1FPGWKA24pwhPd+wipP5P3mVN3LUZOsedKboyy
         r/VQa20qvZIaMl6atIFIuDweWHLwPm3xDf1p55qJDBEgXrnq/HASfCyhQvevelDhojiF
         i1JeIzAKRlyMNLs4dzXYxvpaXZozQaSFnvZnaaKkgU17YN9vYyLTUQIJLtWmab/fP25x
         AwojQNmTc5+rl0iacoPVBm85AJc5hdLTuXOqzcqvd1TCzhsxbqe9kDgzAUQ7yby6A1k2
         4vaqz0uMvbRAmdlnIR6DceoKnrporpDAkXXyY8gdh1Z9byQ/KxUDVQ98CCC94WpRbcP7
         13aw==
X-Forwarded-Encrypted: i=1; AKwUvBxEi7th4bvd/j3GYJiQ2oOiKq1zXrLoWepOos/df4Wnkp2FWo+l8efK0CCSWkcfhh35MfdpTPON33+HSzE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB3bpBOGTTq3A6SAxxIWTVWEcK7okBTkTirhl4fOOyo8QXbXEa
	7XecQo7baFibLWxWx0BgWwB57XR9pEHlE8xGmI6r5NpUHNTfvA1UrS3s
X-Gm-Gg: AYBFou2g3zfTxmThO4RfAuk3TBMVdsIAexTFbJpn2Ot8dqYou1/KgbMFgXqoD6lzdkh
	lWpGmmSv5KEPcCpcGiM2+Z/4jJ+wBW6uYnLwZrCSDcXA23+as+M58dgWv3gs4ZRxS51ZLcL6Ino
	FUYZet1kUEbFPe8oFGkeRV/60BbHozgpcSMCwH3Hdv342cihZs+K/6O2TqJZEID4aAjMoeZ7iJe
	XEmrUT5fZ4mwLjXdGx159e4tN+gRwI4LzAwwGoTzFHB/TWVmNRUQ57TtmTNE0WmdH60zx7gYM4X
	EXoGnzY/vlO3ElhHAeLlZMVhwSiQAgse9f33StMNlKLifTVsmJs5jZRhQkBfBF6LNNUHNKcOVBL
	LklQx38Hj2T9jS05e+rmDkbuK958KRRyVkqhlb1yNFAxN8rC7GsmUvSDpXNGUS4gzMfPmEv7ZK7
	0AcrRE6b2n2X2P9WPmPi9ZXqaFDbac0CZXyZeDWrOF+fe2DW0HyBgc04qUfpgwBkqOvaTxGVnXY
	UI4
X-Received: by 2002:a05:7300:5625:b0:352:744f:80a3 with SMTP id 5a478bee46e88-352744f84bdmr1601776eec.16.1791470749495;
        Thu, 08 Oct 2026 07:45:49 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm17913731eec.26.2026.10.08.07.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:45:48 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:45:39 +0800
Subject: [PATCH 1/2] selftests: ublk: don't keep the fault_inject timespec
 on the stack
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-bug-ublk-selftest-fault-inject-delay-v1-1-a96af7ead06e@gmail.com>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

The fault_inject target delays each I/O with an IORING_OP_TIMEOUT, and
generic_06 relies on the delay to kill the server while an I/O is still
outstanding.

The timespec of the timeout is a local variable of
ublk_fault_inject_queue_io(). The SQE only records its address, and
io_uring reads it when the SQE is submitted, after the function has
returned. The timeout gets whatever the stack holds by then and expires
almost at once, so --delay_us has no effect, and generic_06 fails
because dd completes before the server is killed.

Store the timespec in the per-device fi_opts, and split the delay into
seconds and nanoseconds so that delays of a second or more give a valid
timespec.

fio 4k random reads for 10 s at queue depth 1 on a fault_inject device
with --delay_us 1000000:

                  before      after   expected
  I/Os            446927         10         10
  mean latency   18.3 us    1.000 s        1 s

Fixes: 81586652bb1f ("selftests: ublk: add generic_06 for covering fault inject")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/ublk/fault_inject.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/ublk/fault_inject.c b/tools/testing/selftests/ublk/fault_inject.c
index 150896e02ff8b..e055f51a65447 100644
--- a/tools/testing/selftests/ublk/fault_inject.c
+++ b/tools/testing/selftests/ublk/fault_inject.c
@@ -11,7 +11,7 @@
 #include "kublk.h"
 
 struct fi_opts {
-	long long delay_ns;
+	struct __kernel_timespec delay;
 	bool die_during_fetch;
 };
 
@@ -47,7 +47,8 @@ static int ublk_fault_inject_tgt_init(const struct dev_ctx *ctx,
 		return -ENOMEM;
 	}
 
-	opts->delay_ns = ctx->fault_inject.delay_us * 1000;
+	opts->delay.tv_sec = ctx->fault_inject.delay_us / 1000000;
+	opts->delay.tv_nsec = ctx->fault_inject.delay_us % 1000000 * 1000;
 	opts->die_during_fetch = ctx->fault_inject.die_during_fetch;
 	dev->private_data = opts;
 
@@ -85,12 +86,13 @@ static int ublk_fault_inject_queue_io(struct ublk_thread *t,
 	const struct ublksrv_io_desc *iod = ublk_get_iod(q, tag);
 	struct io_uring_sqe *sqe;
 	struct fi_opts *opts = q->dev->private_data;
-	struct __kernel_timespec ts = {
-		.tv_nsec = opts->delay_ns,
-	};
 
+	/*
+	 * Pass a timespec that outlives this function, since io_uring
+	 * reads it only when the SQE is submitted.
+	 */
 	ublk_io_alloc_sqes(t, &sqe, 1);
-	io_uring_prep_timeout(sqe, &ts, 1, 0);
+	io_uring_prep_timeout(sqe, &opts->delay, 1, 0);
 	sqe->user_data = build_user_data(tag, ublksrv_get_op(iod), 0, q->q_id, 1);
 
 	ublk_queued_tgt_io(t, q, tag, 1);

-- 
2.43.0

