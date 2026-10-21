Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618143;
	b=4STNugsCocVSzjqh5zkt5S1XjgjgHwwKUI7TFQAvWZYfzKf8C7e/8Hy7ZEEJhkw0RCFo
	 5tBp2SH6+RuHcwcp5A+aOo5J0w3RmjNcPObEbQBk5raF3Wbf/+wJYWFBe43BvPayyOty2
	 FG9ymx0KlNgqG1mcFrquwemJOqclZNZgl9KTIw8CC0XEqYVDyT/EHrEo8SMixbDvcLlz4
	 MVzepAmM3uYKAZmjkwouQg+k5rYgrrQG13bmUM7YspMptlJHI4Uj8s1lbLzPs7ejbmuSd
	 Bi3bLXwQqMnZAkhkUeqh+awsYfhr4jvKKTgWy+xkiGrb1ONvpA0Zq3uxg1F0OGzpuyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=STfXp6czP7xhamjW51To5foTWFXsqjJT8ci8C4r7ssk=;
	b=xzia0LVD4BLD1XCiQHGKRmge0DHjF9Nn7Kf1SdhSWaMSQyDpW+IcLzODe/+TM0cnrP3r
	 PAD+5dThhjEdRxwN/cdQXsF3imZJ+hYQPdDaBGX3M3dgbY3PPTC7VJg5metEcSjhHl59c
	 3oNsMC2pVrmCECdh7zZzGYbcCTvgbZVFNQxvNIQMMhWev2tWqEACpdpwFOx+MUibVhjzm
	 0NqNzTxINm7Bq+k4lqTdd3b6GkmzDFMyK5+rSIszvq5Fhbj34c5axM6bqQa0+UPZ4JfWo
	 ZybOrg8AQh+gwA1eQlwMoH+8sDHxMsqmQqgUb3deEiSbbiQ9s9aLcXPkmOCV47bfNig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGABvHP8;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60E8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGABvHP8
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6faddda49e7so945779eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792618142; x=1793222942; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=STfXp6czP7xhamjW51To5foTWFXsqjJT8ci8C4r7ssk=;
        b=RGABvHP8Dyk6LxsQqpxlHRr1auM08NNzKrG6Zu9WIuX6WdM63LtxwAtz6pOtXWw3c2
         drEJunJyp4FL2zEmgvD8tWcW8OmQjcHx80JXVIvlTWjgC4o/BoiWVgNiHjvCGtl5QJot
         sijZFAgPuqjVAQypJxeFhrswKukLMXdAByBXHXV2z6jtUr9SVZDloeNU5xkWTvLn0Vou
         bXB3CIzkCQQNuNMVdMZTxEYYY+wRJWKNLeOLWXQBt5X/IbzfDJtBNomWzvcsBEIeGJ16
         bIVOq+kmDddMGPxU8XtlAl9dgWH/CUSiecH9lL+eg5jHu3DVpLFGjqiW00VleCHPFGeO
         FEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618142; x=1793222942;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=STfXp6czP7xhamjW51To5foTWFXsqjJT8ci8C4r7ssk=;
        b=1fVCnsz3HGkOrwN/hGu61QHP3/9hBrS0R62I09KzDgP7mqqc/CTWxVr8pI1wsuDDrk
         KGPc/3WJxA0s4BqRRlK6NALXGS+ZK+Gw0Ksf3xVaI1s03UrhDw7MXHBGDSOwBmhbry+n
         biTsmKczzqp4nQaiGnzjdyy9m04MzZntI5RXEjlyfIa/0Nj4PgUYAqC9yX/vIvujEkPP
         WY4LiD4T4+6yG4iipuk7HGmNs51AarFMTLx5m6MKc7TjO8JJM3lM7K18rULpOVcd0Dhs
         TOUIhpqQLI76LcADucrkQXNYVMvUpV+2LpU0eDo2p8dC6g95Pe2cOWJaPCcmxd8JaeNW
         dVtQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+aqlCtBxy2BxW5+Br9sCAKJYWVomzR4mNhr79qONJQYh5He56MAbvAQqqXFcusbGASBPV4rQkzHlZDLc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh/YX4LUcTCfa0+sbM9aSBg5tfTpvnrWh62h+MQOZrrrmXKE2c
	mjVRrTRSgswtJF62Bu2NF3HSJc+OCuTVjUxwlucoy5z2t7xJJMm5iIGfNISHPA==
X-Gm-Gg: AYBFou1lRx3xtNq9b/CV6GPYcsNrV9qn5ODfSNqjICU3nC7iFOeV/Ocm/FUi+7pU+Yo
	ij4HN2ote5wwCCBoOeltzOF7QqKsmbI29S2VO06eZrS1iSRO8hv25Xgy1jcUqmPieEpbhgy5Z32
	XyedRykSrPpPaEE06q/+Neg7b3H+PLmPhgd8SIsqKdRri/4crDku6KNgeMqkjSuXq1t1NOVYUYr
	s9I8mji7VST9S41jLUMrU2ezpDtrraPARwLnwccdrkiqNqsIuLL3fI8QGoe7uKbiDzsaaNGyi8X
	HBiaUWltEjjIvhkFVwPDOcp0EqQA177J229sfJwbZAnS961dbn9IV/H2Y17l1jxKh0vMUEH2TOF
	Ccox7c0ZkJR1Kgo/UzXY46rb32iEW5Grx3PTKwqFMJdMp9zLYv+LcQEagATMk9ePwb1VYN+2ebA
	wowmadCqxDE1+ZX1bvuKmFvDbyxnbmeBmCLL8w4Py6YNW5VahXAZVNHQF2u5Z0v9DdEaGWYpO2K
	jAs/LYjBW/57yEID1Lhvp98QjqjSevMQ3rQrtkIwJO5eI3yljljk7s3euEGLZt/VSlNLunVgWNt
	C5lksZ8OVJDgt6fEhv6vbGJNCku9vQ218H8x598oH3CBiSQIy/UcC4hJMHfq8djUPHhjV015oy9
	B30DHA7cRNYSDdBbWyE+sQPLhGhwIgWKLzXAjhAmH9CEwDzOvS848Wu+1zHhmSNugZGuA03jfmy
	TaeU6fKJYkqpEUFzJYkJwm/zKs
X-Received: by 2002:a05:6820:f023:b0:6d7:4f30:8f6c with SMTP id 006d021491bc7-7093fdb91e1mr2332072eaf.28.1792618141647;
        Wed, 21 Oct 2026 14:29:01 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-709043a60bfsm2960339eaf.13.2026.10.21.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:29:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:28:48 -0600
Subject: [PATCH] clk: send abort notifications when a parent change is
 vetoed
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
Message-Id: <20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3Q6CMAyG4VshPbaRjcSot2I86LYi9WeQbhITw
 r2zyeHb9HsWSKzCCa7NAsqzJBljCXNowA8UH4wSSoNt7cm01mD6uo9k9O8XTqQcM5IbNeNs0F1
 sZ8mfuxAMFGBS7uX3x2/3vcv6yT5XsX44SoxOKfqhngp6rPC+WtcNsR+8e54AAAA=
X-Change-ID: 20261021-submit-clk-parent-abort-v1-b9232ac83dd1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Mike Turquette <mturquette@linaro.org>, Thomas Gleixner <tglx@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

clk_core_set_parent_nolock() returns directly when a PRE_RATE_CHANGE
notifier rejects the proposed parent. Consumers notified before the veto
do not receive ABORT_RATE_CHANGE, even though they may have stopped I/O
or reserved resources until the transition finishes. The caller also
receives a positive notifier return value instead of a negative errno.

Recalculate and notify the unchanged subtree with ABORT_RATE_CHANGE before
returning -EBUSY, as for other failed parent changes. This lets prepared
consumers unwind without changing the parent or its rate.

Extend the mux notifier tests to cover both a self-veto and a later
notifier vetoing after the first consumer accepted the change. Check the
abort notification, errno and unchanged parent/rate in both cases.

Fixes: b2476490ef11 ("clk: introduce the common clock framework")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/clk/clk.c      |  5 +++-
 drivers/clk/clk_test.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..a9620d9e0db1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2983,8 +2983,11 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	ret = __clk_speculate_rates(core, p_rate);
 
 	/* abort if a driver objects */
-	if (ret & NOTIFY_STOP_MASK)
+	if (ret & NOTIFY_STOP_MASK) {
+		__clk_recalc_rates(core, true, ABORT_RATE_CHANGE);
+		ret = -EBUSY;
 		goto runtime_put;
+	}
 
 	/* do the re-parent */
 	ret = __clk_set_parent(core, parent, p_index);
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1c5c8b7c1f3c..e9d0d6f5084b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -2364,6 +2364,8 @@ struct clk_mux_notifier_ctx {
 	struct notifier_block clk_nb;
 	struct clk_mux_notifier_rate_change pre_rate_change;
 	struct clk_mux_notifier_rate_change post_rate_change;
+	bool veto;
+	bool aborted;
 };
 
 #define NOTIFIER_TIMEOUT_MS 100
@@ -2381,6 +2383,8 @@ static int clk_mux_notifier_callback(struct notifier_block *nb,
 		ctx->pre_rate_change.new_rate = clk_data->new_rate;
 		ctx->pre_rate_change.done = true;
 		wake_up_interruptible(&ctx->pre_rate_change.wq);
+		if (ctx->veto)
+			return NOTIFY_BAD;
 	}
 
 	if (action & POST_RATE_CHANGE) {
@@ -2390,7 +2394,10 @@ static int clk_mux_notifier_callback(struct notifier_block *nb,
 		wake_up_interruptible(&ctx->post_rate_change.wq);
 	}
 
-	return 0;
+	if (action == ABORT_RATE_CHANGE)
+		ctx->aborted = true;
+
+	return NOTIFY_OK;
 }
 
 static int clk_mux_notifier_test_init(struct kunit *test)
@@ -2488,8 +2495,61 @@ static void clk_mux_notifier_set_parent_test(struct kunit *test)
 	clk_put(clk);
 }
 
+static void clk_mux_notifier_veto_parent_test(struct kunit *test)
+{
+	struct clk_mux_notifier_ctx *ctx = test->priv;
+	struct clk *parent = clk_hw_get_clk(&ctx->mux_ctx.parents_ctx[1].hw, NULL);
+	int ret;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+	ctx->veto = true;
+	ret = clk_set_parent(ctx->clk, parent);
+	clk_put(parent);
+
+	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+	KUNIT_EXPECT_TRUE(test, ctx->pre_rate_change.done);
+	KUNIT_EXPECT_TRUE(test, ctx->aborted);
+	KUNIT_EXPECT_FALSE(test, ctx->post_rate_change.done);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk), DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, ctx->mux_ctx.current_parent, 0);
+}
+
+static int clk_mux_veto_callback(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	return action == PRE_RATE_CHANGE ? NOTIFY_BAD : NOTIFY_OK;
+}
+
+static void clk_mux_notifier_abort_parent_test(struct kunit *test)
+{
+	struct clk_mux_notifier_ctx *ctx = test->priv;
+	struct notifier_block veto = { .notifier_call = clk_mux_veto_callback };
+	struct clk *parent = clk_hw_get_clk(&ctx->mux_ctx.parents_ctx[1].hw, NULL);
+	int ret;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+	ret = clk_notifier_register(ctx->clk, &veto);
+	if (ret)
+		clk_put(parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* The first consumer accepts PRE before the second consumer vetoes it. */
+	ret = clk_set_parent(ctx->clk, parent);
+	clk_put(parent);
+	clk_notifier_unregister(ctx->clk, &veto);
+
+	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+	KUNIT_EXPECT_TRUE(test, ctx->pre_rate_change.done);
+	KUNIT_EXPECT_TRUE(test, ctx->aborted);
+	KUNIT_EXPECT_FALSE(test, ctx->post_rate_change.done);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk), DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, ctx->mux_ctx.current_parent, 0);
+}
+
 static struct kunit_case clk_mux_notifier_test_cases[] = {
 	KUNIT_CASE(clk_mux_notifier_set_parent_test),
+	KUNIT_CASE(clk_mux_notifier_veto_parent_test),
+	KUNIT_CASE(clk_mux_notifier_abort_parent_test),
 	{}
 };
 

---
base-commit: 81493c1dd1b1ebecb2843a7815973a5bd9a37e5a
change-id: 20261021-submit-clk-parent-abort-v1-b9232ac83dd1

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

