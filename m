Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C49D40E8D7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791400109; cv=none; b=gnhiVYON0JS14H00+qwwsEhHMzPFQ+fLbTVcF036dtjxaQxOk6XGRFkjzZ5SZRrqhAq+6N3H6iE9kYry7/I+ucZc3oFc3JyuKAuX5N3hRLbNFe7J3jfq7fQ0C3LiDovMGVbTF1Eqf3zo4bhjKTeyKc9jAfSSV4QTqEgTC3tFkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791400109; c=relaxed/simple;
	bh=Qwq+kY2o+T6ABRe+YklIrsklzg5y+LARPem0/vSKTos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWi4HoedHqMCma7k1X2WxeDsl/usTw0yCACZFipagp0AKBdQwSZw63mzsymxL7MTRbYMxqRYyjHUsuZkMO4YgQnsq/9g9u3QcSVjVXYJ/wkfdCifCpFbNPNOaJa98DxSUK9IUeFG1/EyYLuIrc2wDww/jqWyejhLw1u1a6RsvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwvg3eD0; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwvg3eD0"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98febe968deso216825241.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791400105; x=1792004905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Q7IO14t1uj+VV+wwgMKYEW/4gtW1MTypzaYfTUg1s0=;
        b=kwvg3eD0WugQu9WpE0a3AFtEGCSM8zSed/mXmSqGpuuhUi7QVmTTDYycgPAPDDudX0
         EsV1PU57OMMwD5A5qf2XHhJIYyOA/eKB70IJxORXxIL1NuASr3whCKvdxIloyu0ZkJyY
         70ZzDl69IkRswYOWVugVad6oWXmpIIkf4LLmUpeXRei0Ouak8xmrb7Ga268KvmI60qDS
         VJUiKm9D1N0JEEA8ZJX0Hc2nMoNciZhs71h1NP0xDPjuRsIRdRJZKL6nsm7WjH7dYwjE
         Xg0NDsz2/j/5yc1QDlT+kZ+vu5Vq+lHLQKlPNmAyv6LvAVhHobqopRew04MrVSSbiXn2
         1eOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791400105; x=1792004905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Q7IO14t1uj+VV+wwgMKYEW/4gtW1MTypzaYfTUg1s0=;
        b=CMmAsJP8u1F7hEKI0qbTUxpCLKLTDekeNe6CqpG9czjsejyh/NXjSILz2iBccQN+CK
         KZUZKg1U1WcLlIdSx7YO01OFBnaGcGNRLUtdyPthxuX55NtJATlCwumatfr+1IeRFyAz
         ldzfpMVX1ehAb3BgR7XSloAbyYGqhlMQcOZldxUiW7zx9VCcorT0BWYnFWWP/TQcrIS2
         RGwaLgAkRNJ5VcuFDQSX5p77gKF152fZEoblKQ7IieyttDl6SQ4MOg5Q2Mn7h6Ul/GoR
         wLQalpMUGCHRXuzw+hUsto4WFFI07kkkThtDJ9FtBcV9AOXP9jZ5mEc5AxeLh7iztnED
         jb7w==
X-Forwarded-Encrypted: i=1; AKwUvBz/awrShpXm9b4HroLoztlQJl4krpYmIguU5FQgLtvMUbsvWcOpKz9lP+pdliGbbdnLGecp2qKGG5aVRuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuIKLTSYhC7/gu4UcRFT9I+4gNpPHxRLjESukScX5nKDf3Gmjd
	Rg+Uth5GCKSv5rmq9s/y0qg36N5GmcmkPB2B+Z/Xv0aXM7nXtJD5s/Qs
X-Gm-Gg: AYBFou0C9bCRSI9ltJPvxB6VTWaVwLhGsomee1x2vIHzRrWZnnyrbEozLnES8unSDnn
	v90attTQOIr3QhoWmKQbhJrnePjkzTnsSXEoE90z24vAnqHylzgkV76kzNbBlGCUuixxGDPUrGk
	flxAWMIXsv4s6gFmrQuQ6Z1I2vsCU9kI8sU1294PG+/hC6+5oD/+Lxk7YmdAs1xIhX3c0vfrklS
	+5pVNl/3zo2u1oiwCc2c2iaEZcZ3ODd5kFp3g11w9x5XDbnyxTLmVTEqFnh0FGnGdiVo5i++xyK
	dDsnL1zxJdTpNjzqKxcvs1COsY3jNbPovfLRsqr0JEezUG52TWF1EGhBSzjuNI4dGlZm6nhBOiZ
	hLVFVtjOGtcI0fHm8gCJuBwvnfJV6unNKy3dLwD8K4p1K0hsYsl6xmwzjAsCI3SP/Iawu//AVI4
	RUnfVX/qIp801SCKKQbXOuzitNMWWNxu009m40fp4PU4Y692DE+hj1bPy78QZfXp8+b/uuUdrS3
	EzhbwfYtn0LjtbFoXc=
X-Received: by 2002:a05:6102:5124:b0:7c4:5129:8e17 with SMTP id ada2fe7eead31-7ca38f24bb3mr1127791137.31.1791400105188;
        Wed, 07 Oct 2026 12:08:25 -0700 (PDT)
Received: from emedev.tailf75c28.ts.net ([74.244.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ca218138c6sm2456787137.12.2026.10.07.12.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 12:08:24 -0700 (PDT)
From: Emerson Busson <emersonbusson@gmail.com>
To: mhklinux@outlook.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 04/14] hv: vmbus: add KUnit tests for GPADL post failure injection
Date: Wed,  7 Oct 2026 16:07:42 -0300
Message-ID: <20261007190752.336426-5-emersonbusson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007190752.336426-1-emersonbusson@gmail.com>
References: <20261007190752.336426-1-emersonbusson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Route GPADL message posting through a private callback so KUnit can
inject header, each body, and teardown post failures without a live
host. Exercise uncertain host ownership after failed posts, host
rejection, and channel rescind response handling through the same
helpers used by production.

The cases join the existing ones in drivers/hv/vmbus_buffer_test.c,
which is built into the hv_vmbus object. That keeps tests out of the
production sources while still letting them drive
vmbus_post_gpadl_messages(), vmbus_gpadl_response_status() and
vmbus_post_gpadl_teardown(). Those three are therefore not static,
and their callback type is declared in hyperv_vmbus.h alongside the
sizing helpers. Nothing outside hv_vmbus links against them, and no
symbol is exported.

Signed-off-by: Emerson Busson <emersonbusson@gmail.com>
---
 drivers/hv/channel.c           | 142 ++++++++++++++++----------
 drivers/hv/hyperv_vmbus.h      |  19 ++++
 drivers/hv/vmbus_buffer_test.c | 176 +++++++++++++++++++++++++++++++++
 3 files changed, 286 insertions(+), 51 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index 7d5b99281872..6a1bc9b17869 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -488,6 +488,84 @@ static void vmbus_free_channel_msginfo(struct vmbus_channel_msginfo *msginfo)
  *              should be 0 for BUFFER type gpadl
  * @gpadl_handle: some funky thing
  */
+static int vmbus_gpadl_post_real(void *context, void *buffer,
+				 size_t buflen, bool can_sleep)
+{
+	(void)context;
+	return vmbus_post_msg(buffer, buflen, can_sleep);
+}
+
+int vmbus_post_gpadl_messages(struct vmbus_channel_msginfo *msginfo,
+			      u32 gpadl, bool *posted,
+			      vmbus_gpadl_post_fn post_msg,
+			      void *context)
+{
+	struct vmbus_channel_gpadl_header *gpadl_header;
+	struct vmbus_channel_msginfo *submsginfo;
+	struct list_head *curr;
+	int ret;
+
+	gpadl_header = (struct vmbus_channel_gpadl_header *)msginfo->msg;
+	gpadl_header->header.msgtype = CHANNELMSG_GPADL_HEADER;
+	gpadl_header->gpadl = gpadl;
+
+	/* A failed post may still have reached the host. */
+	*posted = true;
+	ret = post_msg(context, gpadl_header,
+		       msginfo->msgsize - sizeof(*msginfo), true);
+	trace_vmbus_establish_gpadl_header(gpadl_header, ret);
+	if (ret)
+		return ret;
+
+	list_for_each(curr, &msginfo->submsglist) {
+		struct vmbus_channel_gpadl_body *gpadl_body;
+
+		submsginfo = list_entry(curr, struct vmbus_channel_msginfo,
+					msglistentry);
+		gpadl_body = (struct vmbus_channel_gpadl_body *)submsginfo->msg;
+		gpadl_body->header.msgtype = CHANNELMSG_GPADL_BODY;
+		gpadl_body->gpadl = gpadl;
+
+		ret = post_msg(context, gpadl_body,
+			       submsginfo->msgsize - sizeof(*submsginfo), true);
+		trace_vmbus_establish_gpadl_body(gpadl_body, ret);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int vmbus_gpadl_response_status(u32 creation_status, bool rescind,
+				bool *posted)
+{
+	*posted = false;
+	if (creation_status)
+		return -EDQUOT;
+	if (rescind)
+		return -ENODEV;
+
+	return 0;
+}
+
+int vmbus_post_gpadl_teardown(u32 child_relid,
+			      struct vmbus_channel_gpadl_teardown *msg,
+			      u32 gpadl,
+			      vmbus_gpadl_post_fn post_msg,
+			      void *context)
+{
+	int ret;
+
+	msg->header.msgtype = CHANNELMSG_GPADL_TEARDOWN;
+	msg->child_relid = child_relid;
+	msg->gpadl = gpadl;
+
+	ret = post_msg(context, msg, sizeof(*msg), true);
+	trace_vmbus_teardown_gpadl(msg, ret);
+
+	return ret;
+}
+
 static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 				   enum hv_gpadl_type type, void *kbuffer,
 				   u32 size, u32 send_offset, bool memory_prepared,
@@ -495,11 +573,9 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 				   struct vmbus_gpadl *gpadl)
 {
 	struct vmbus_channel_gpadl_header *gpadlmsg;
-	struct vmbus_channel_gpadl_body *gpadl_body;
 	struct vmbus_channel_msginfo *msginfo = NULL;
-	struct vmbus_channel_msginfo *submsginfo;
-	struct list_head *curr;
 	u32 next_gpadl_handle;
+	u32 creation_status;
 	unsigned long flags;
 	bool posted = false;
 	int ret = 0;
@@ -558,49 +634,20 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 		goto cleanup;
 	}
 
-	/* A failed post may still have reached the host. */
-	posted = true;
-	ret = vmbus_post_msg(gpadlmsg, msginfo->msgsize -
-			     sizeof(*msginfo), true);
-
-	trace_vmbus_establish_gpadl_header(gpadlmsg, ret);
-
-	if (ret != 0)
+	ret = vmbus_post_gpadl_messages(msginfo, next_gpadl_handle, &posted,
+					vmbus_gpadl_post_real, NULL);
+	if (ret)
 		goto cleanup;
 
-	list_for_each(curr, &msginfo->submsglist) {
-		submsginfo = (struct vmbus_channel_msginfo *)curr;
-		gpadl_body =
-			(struct vmbus_channel_gpadl_body *)submsginfo->msg;
-
-		gpadl_body->header.msgtype =
-			CHANNELMSG_GPADL_BODY;
-		gpadl_body->gpadl = next_gpadl_handle;
-
-		ret = vmbus_post_msg(gpadl_body,
-				     submsginfo->msgsize - sizeof(*submsginfo),
-				     true);
-
-		trace_vmbus_establish_gpadl_body(gpadl_body, ret);
-
-		if (ret != 0)
-			goto cleanup;
-
-	}
 	wait_for_completion(&msginfo->waitevent);
 
-	if (msginfo->response.gpadl_created.creation_status != 0) {
-		posted = false;
-		pr_err("Failed to establish GPADL: err = 0x%x\n",
-		       msginfo->response.gpadl_created.creation_status);
-
-		ret = -EDQUOT;
-		goto cleanup;
-	}
-
-	if (channel->rescind) {
-		posted = false;
-		ret = -ENODEV;
+	creation_status = msginfo->response.gpadl_created.creation_status;
+	ret = vmbus_gpadl_response_status(creation_status, channel->rescind,
+					  &posted);
+	if (ret) {
+		if (creation_status)
+			pr_err("Failed to establish GPADL: err = 0x%x\n",
+			       creation_status);
 		goto cleanup;
 	}
 
@@ -608,8 +655,6 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	gpadl->gpadl_handle = gpadlmsg->gpadl;
 	gpadl->buffer = kbuffer;
 	gpadl->size = size;
-	posted = false;
-
 
 cleanup:
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
@@ -1118,9 +1163,6 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, struct vmbus_gpadl *gpad
 
 	msg = (struct vmbus_channel_gpadl_teardown *)info->msg;
 
-	msg->header.msgtype = CHANNELMSG_GPADL_TEARDOWN;
-	msg->child_relid = channel->offermsg.child_relid;
-	msg->gpadl = gpadl->gpadl_handle;
 
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
 	list_add_tail(&info->msglistentry,
@@ -1130,10 +1172,8 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, struct vmbus_gpadl *gpad
 	if (channel->rescind)
 		goto post_msg_err;
 
-	ret = vmbus_post_msg(msg, sizeof(struct vmbus_channel_gpadl_teardown),
-			     true);
-
-	trace_vmbus_teardown_gpadl(msg, ret);
+	ret = vmbus_post_gpadl_teardown(channel->offermsg.child_relid, msg, gpadl->gpadl_handle,
+					vmbus_gpadl_post_real, NULL);
 
 	if (ret)
 		goto post_msg_err;
diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 93df3b35cfd4..bb585ac2ceac 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -563,4 +563,23 @@ unsigned int vmbus_buffer_order(unsigned long remaining,
 bool vmbus_buffer_lower_order(unsigned int *order);
 bool vmbus_buffer_should_free(const struct vmbus_buffer *buffer);
 
+/*
+ * GPADL post and response helpers, also shared with vmbus_buffer_test.c.
+ * Same deal as the sizing helpers above: defined in channel.c, built into
+ * the hv_vmbus object, never exported.
+ */
+typedef int (*vmbus_gpadl_post_fn)(void *context, void *buffer,
+				   size_t buflen, bool can_sleep);
+int vmbus_post_gpadl_messages(struct vmbus_channel_msginfo *msginfo,
+			      u32 gpadl, bool *posted,
+			      vmbus_gpadl_post_fn post_msg,
+			      void *context);
+int vmbus_gpadl_response_status(u32 creation_status, bool rescind,
+				bool *posted);
+int vmbus_post_gpadl_teardown(u32 child_relid,
+			      struct vmbus_channel_gpadl_teardown *msg,
+			      u32 gpadl,
+			      vmbus_gpadl_post_fn post_msg,
+			      void *context);
+
 #endif /* _HYPERV_VMBUS_H */
diff --git a/drivers/hv/vmbus_buffer_test.c b/drivers/hv/vmbus_buffer_test.c
index d0a927a46caf..fbf7c4351d64 100644
--- a/drivers/hv/vmbus_buffer_test.c
+++ b/drivers/hv/vmbus_buffer_test.c
@@ -85,12 +85,188 @@ static void vmbus_buffer_partial_allocation_cleanup_test(struct kunit *test)
 	vmbus_release_buffer(&buffer);
 }
 
+struct vmbus_gpadl_post_test_context {
+	struct kunit *test;
+	unsigned int call_count;
+	unsigned int fail_call;
+	u32 first_msgtype;
+	u32 expected_gpadl;
+};
+
+static int vmbus_gpadl_test_post(void *context, void *buffer,
+				 size_t buflen, bool can_sleep)
+{
+	struct vmbus_gpadl_post_test_context *test_context = context;
+	struct vmbus_channel_message_header *header = buffer;
+
+	KUNIT_EXPECT_TRUE(test_context->test, can_sleep);
+	KUNIT_EXPECT_GT(test_context->test, buflen,
+			(size_t)sizeof(*header));
+	test_context->call_count++;
+	KUNIT_EXPECT_EQ(test_context->test, header->msgtype,
+			test_context->call_count == 1 ?
+			test_context->first_msgtype : CHANNELMSG_GPADL_BODY);
+	switch (header->msgtype) {
+	case CHANNELMSG_GPADL_HEADER: {
+		struct vmbus_channel_gpadl_header *gpadl_header = buffer;
+
+		KUNIT_EXPECT_EQ(test_context->test, gpadl_header->gpadl,
+				test_context->expected_gpadl);
+		break;
+	}
+	case CHANNELMSG_GPADL_BODY: {
+		struct vmbus_channel_gpadl_body *gpadl_body = buffer;
+
+		KUNIT_EXPECT_EQ(test_context->test, gpadl_body->gpadl,
+				test_context->expected_gpadl);
+		break;
+	}
+	case CHANNELMSG_GPADL_TEARDOWN: {
+		struct vmbus_channel_gpadl_teardown *teardown = buffer;
+
+		KUNIT_EXPECT_EQ(test_context->test, teardown->gpadl,
+				test_context->expected_gpadl);
+		KUNIT_EXPECT_EQ(test_context->test, teardown->child_relid,
+				7U);
+		break;
+	}
+	default:
+		KUNIT_FAIL(test_context->test,
+			   "unexpected GPADL message type: %d",
+			   header->msgtype);
+	}
+	if (test_context->call_count == test_context->fail_call)
+		return -EIO;
+
+	return 0;
+}
+
+static struct vmbus_channel_msginfo *
+vmbus_gpadl_test_msginfo(struct kunit *test, unsigned int body_count)
+{
+	struct vmbus_channel_msginfo *msginfo;
+	struct vmbus_channel_msginfo *body_info;
+	unsigned int i;
+
+	msginfo = kunit_kzalloc(test, sizeof(*msginfo) +
+			       sizeof(struct vmbus_channel_gpadl_header),
+			       GFP_KERNEL);
+	if (!msginfo)
+		return NULL;
+
+	msginfo->msgsize = sizeof(*msginfo) +
+			   sizeof(struct vmbus_channel_gpadl_header);
+	INIT_LIST_HEAD(&msginfo->submsglist);
+
+	for (i = 0; i < body_count; i++) {
+		body_info = kunit_kzalloc(test,
+					  sizeof(*body_info) +
+					  sizeof(struct vmbus_channel_gpadl_body),
+					  GFP_KERNEL);
+		if (!body_info)
+			return NULL;
+
+		body_info->msgsize = sizeof(*body_info) +
+				     sizeof(struct vmbus_channel_gpadl_body);
+		INIT_LIST_HEAD(&body_info->msglistentry);
+		list_add_tail(&body_info->msglistentry, &msginfo->submsglist);
+	}
+
+	return msginfo;
+}
+
+static void vmbus_gpadl_post_failure_test(struct kunit *test)
+{
+	unsigned int fail_call;
+
+	for (fail_call = 1; fail_call <= 3; fail_call++) {
+		struct vmbus_gpadl_post_test_context context = {
+			.test = test,
+			.fail_call = fail_call,
+			.first_msgtype = CHANNELMSG_GPADL_HEADER,
+			.expected_gpadl = 17,
+		};
+		struct vmbus_channel_msginfo *msginfo;
+		bool posted = false;
+		int ret;
+
+		msginfo = vmbus_gpadl_test_msginfo(test, 2);
+		KUNIT_ASSERT_NOT_NULL(test, msginfo);
+
+		ret = vmbus_post_gpadl_messages(msginfo, 17, &posted,
+						vmbus_gpadl_test_post, &context);
+		KUNIT_EXPECT_EQ(test, ret, -EIO);
+		KUNIT_EXPECT_EQ(test, context.call_count, fail_call);
+		KUNIT_EXPECT_TRUE(test, posted);
+	}
+}
+
+static void vmbus_gpadl_post_success_test(struct kunit *test)
+{
+	struct vmbus_gpadl_post_test_context context = {
+		.test = test,
+		.first_msgtype = CHANNELMSG_GPADL_HEADER,
+		.expected_gpadl = 17,
+	};
+	struct vmbus_channel_msginfo *msginfo;
+	bool posted = false;
+	int ret;
+
+	msginfo = vmbus_gpadl_test_msginfo(test, 2);
+	KUNIT_ASSERT_NOT_NULL(test, msginfo);
+
+	ret = vmbus_post_gpadl_messages(msginfo, 17, &posted,
+					vmbus_gpadl_test_post, &context);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	KUNIT_EXPECT_EQ(test, context.call_count, 3U);
+	KUNIT_EXPECT_TRUE(test, posted);
+}
+
+static void vmbus_gpadl_response_state_test(struct kunit *test)
+{
+	bool posted = true;
+
+	KUNIT_EXPECT_EQ(test, vmbus_gpadl_response_status(0, false, &posted), 0);
+	KUNIT_EXPECT_FALSE(test, posted);
+
+	posted = true;
+	KUNIT_EXPECT_EQ(test,
+			vmbus_gpadl_response_status(1, false, &posted), -EDQUOT);
+	KUNIT_EXPECT_FALSE(test, posted);
+
+	posted = true;
+	KUNIT_EXPECT_EQ(test,
+			vmbus_gpadl_response_status(0, true, &posted), -ENODEV);
+	KUNIT_EXPECT_FALSE(test, posted);
+}
+
+static void vmbus_gpadl_teardown_post_failure_test(struct kunit *test)
+{
+	struct vmbus_gpadl_post_test_context context = {
+		.test = test,
+		.fail_call = 1,
+		.first_msgtype = CHANNELMSG_GPADL_TEARDOWN,
+		.expected_gpadl = 17,
+	};
+	struct vmbus_channel_gpadl_teardown msg = {};
+	int ret;
+
+	ret = vmbus_post_gpadl_teardown(7, &msg, 17,
+					vmbus_gpadl_test_post, &context);
+	KUNIT_EXPECT_EQ(test, ret, -EIO);
+	KUNIT_EXPECT_EQ(test, context.call_count, 1U);
+}
+
 static struct kunit_case vmbus_buffer_test_cases[] = {
 	KUNIT_CASE(vmbus_buffer_size_rounding_test),
 	KUNIT_CASE(vmbus_buffer_size_overflow_test),
 	KUNIT_CASE(vmbus_ring_fallback_order_zero_test),
 	KUNIT_CASE(vmbus_buffer_failed_teardown_leaks_test),
 	KUNIT_CASE(vmbus_buffer_partial_allocation_cleanup_test),
+	KUNIT_CASE(vmbus_gpadl_post_failure_test),
+	KUNIT_CASE(vmbus_gpadl_post_success_test),
+	KUNIT_CASE(vmbus_gpadl_response_state_test),
+	KUNIT_CASE(vmbus_gpadl_teardown_post_failure_test),
 	{}
 };
 
-- 
2.43.0

