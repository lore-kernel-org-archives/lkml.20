Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC5370AFD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029145; cv=none; b=kGP38w8YuQW+Z+bV1PWNu/kiDxx/XrnzwDl5tj4LM1AsNoDCuHgIq2m9ItDw16BPAfRqTPeApgAp8tFk4gt9KtkobLHejpCkeBPNbnKYiLHmHgrKdqBrlM0oSbek0kcQ83fxjqT74yGQ8b22xRiNT48UQu5c/I50c1iiGZPRXYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029145; c=relaxed/simple;
	bh=gihWboRE85V7m8JwLGzpmc5MGT4+kT9xJPz2tjqtWJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TkKYz7n4OybgkFCFyZmoZ1AQtuYC3DnWu+b7Wxq7VpnaqDEvVqW/mnVV9e4INLbXXjUKRr+o5yhYIIcKp59NcqQ26qhUqdg6zV5oxCqvV1kn2OvAf/idiEEO9Bj7cflnSNLKqOhO++eimFvgVxZNXGSo3U2XRIfM8i+fo8nOcXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOFkJYxF; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOFkJYxF"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so4553215eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029144; x=1792633944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQ1+f0AAlHHUtqEE8yDxNIJCGiJRuQL1+LEEf2vlKAo=;
        b=nOFkJYxFn0kNk/GjLaHNgHfaTxeZ1z9BBIRImvMM7piiDbBv9M7G/UzKYerH1WOuND
         Hagghu/6Y/OnZACkwm59g8685Luw2NMSFWbtlEC0qoJzKZ+9yTI7zytF/Io0aMngYANA
         0P4FPynTdc7GGqAQkiTV1uj+4KFx3zZXsw1W+qieukjFtWHl1Kv2iSchpMS8cTY1mtkV
         bOJy4SkRdtJr2NjLkmt9ZAkXH8RGp5bf+ZOEQxcCyNu0f9Fr5IGqeQtiebhzDsz9kuaW
         xevfH/+ASzaaqx9O4rkT6jNvquBP2h3VwHrfQ7w8uXd018i3aASfk6kjakaAmdwBgaPM
         5T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029144; x=1792633944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQ1+f0AAlHHUtqEE8yDxNIJCGiJRuQL1+LEEf2vlKAo=;
        b=wjADDcITDFgpxCx5IBDvdOspF5cPCcVxWEukO2+VCjU7Fl3hf1ZEetdqf+Bn5UIarx
         Z1kSMy4NwqWVQDo5Z/JyDNsmXs+JC3qdM4xCRmJVDvLS5Q5ag2kTxBDCt2sYComtQ3Po
         m2ur1O1P6t1qe2u0lfxiRVTNoMeVMyHiJWjZKUEpCsDju4ISSgta2bBgzfRmTvwmXald
         a/xGsFneW1d1gO8HpiWXJtP9Q7CQQ4dCpB6cbcD1nMlc/+2w9gdfL7nhJhl54J0+x+G2
         oz4zUvQGw+CiLyA3YUDC7Kgm37vU5IGIDAfB5Z0qNw7B3uMSO7kDZN4TkxN+Vc2qvDRw
         A8cA==
X-Forwarded-Encrypted: i=1; AKwUvByQQ//sj5EYKEUhDgtiA+i5wpazYMl3U+6xr/VBC6Hq2KUjbQpJ7Nuj/YGugMIaP/madzmuQ5ZTDIr3kQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiU9hwYThbbxCB6I7sOlPvFa3zNBJb/APxc3LOWebp5eKb85r9
	JUfAPs7fixPCAzChnTxw3NAetuMO1+G00fIQyM8Nqk24fQyW0cW7cXM+
X-Gm-Gg: AYBFou1xv//e/bFCeTPURgP0/iamkHuK8i4E5IFVukWyRztZMwKivw4RH68Yy48aQRS
	JFFCpdgdS54866l8GFxUV6ujtFiYSODwGyWdj8wSNbe5ZGQUcTiTueKcGf+0+fHtJemd77FxFqW
	84IFUqW7tlRt7FmJiyu7UTM2ULtnwzqSUMJwn0fpL0jSlPfugyW3rCrMQy4Pv1EHvBn8IgNdWYE
	iffiDVJGxajb0he2aBQDo/G8OoeXVn7bj2JGb1/KUPHtkqiBQoz0s8WGw2h9JdU6l2Nuf+akmhx
	LYbSZGcbYLQ/STPMIwVBumTfbhdJkexZktSrJD1JAixhjO2s9m7Mf0za9JQcaLmX/lnP4159w0j
	QuDnKfqwT7ERLipWkI7AUlqq9NI5HZ9mAwQoAu3NyafrDo2WeHTF+eZopv2hvKnvtpetVZ3KJ/7
	JSKlFzW0JJNmaJUUlZi3NUwwqQW6Iof+SfwQy9Z0GR9rApUtwVGIp9IvCtc7khcJAesQ==
X-Received: by 2002:a05:701b:21d3:10b0:143:296a:3ee with SMTP id a92af1059eb24-16a5ef28797mr24120650c88.25.1792029143558;
        Wed, 14 Oct 2026 18:52:23 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm50647870c88.2.2026.10.14.18.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:52:23 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 15 Oct 2026 09:52:16 +0800
Subject: [PATCH v2 2/2] block: rename the out_unfreeze label in
 elevator_switch()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bug-block-elevator-init-quiesce-v2-2-505a2b0b1c07@gmail.com>
References: <20261015-bug-block-elevator-init-quiesce-v2-0-505a2b0b1c07@gmail.com>
In-Reply-To: <20261015-bug-block-elevator-init-quiesce-v2-0-505a2b0b1c07@gmail.com>
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <tom.leiming@gmail.com>, 
 Nilay Shroff <nilay@linux.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

Commit f8e111c859b9 ("block: don't call freeze queue in
elevator_switch() and elevator_disable()") moved freezing the queue
out of elevator_switch() into its callers, but kept the out_unfreeze
label, which used to unquiesce and unfreeze the queue.

The code at the label now unquiesces the queue but never unfreezes it,
so the name is misleading.

Rename the label to out_unquiesce.

Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 block/elevator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/elevator.c b/block/elevator.c
index da9ba70ac9321..80cbac91581b0 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -584,7 +584,7 @@ static int elevator_switch(struct request_queue *q, struct elv_change_ctx *ctx)
 	if (new_e) {
 		ret = blk_mq_init_sched(q, new_e, &ctx->res);
 		if (ret)
-			goto out_unfreeze;
+			goto out_unquiesce;
 		ctx->new = q->elevator;
 	} else {
 		blk_queue_flag_clear(QUEUE_FLAG_SQ_SCHED, q);
@@ -594,7 +594,7 @@ static int elevator_switch(struct request_queue *q, struct elv_change_ctx *ctx)
 	}
 	blk_add_trace_msg(q, "elv switch: %s", ctx->name);
 
-out_unfreeze:
+out_unquiesce:
 	if (!ctx->no_quiesce)
 		blk_mq_unquiesce_queue(q);
 

-- 
2.43.0

