Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B6E38E5DC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853914; cv=none; b=hRFTKzjeVSK36Cr9N7bKylngRE4ywlIadnWiXHTpqo5fgREXbLs1X26/K3affS2QZQmj2lxm30cUvvFfb17mzzzo3Gza69z+5d5584gJx3GXNBvAE0LfQWQivcpX0JHhD8W59f8v3Tfs1hntFVaX91w7l4wYnwka/RLuNPHwJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853914; c=relaxed/simple;
	bh=MnzqmFryyqKnWLjnUS6aWjVVD6eJJFB1huY4ZJIHQnU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hoUdoeC1tiYL622wzT7nfy3xywpvFfUon3NdYVxkEGJ8fkJU3dEcwzzHO0PIhcYb9RaWRxN7WAQVC+w6TXveench0BJJyPsHtQoA3YMHt0ZRvTMsQAwtZuOcpe5Bf1SIWTFEVeRNgI5dICXtvhnmjXeFlpLN+9nwh5kIqO+VEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fxHQmbGd; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--robbarnes.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fxHQmbGd"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso325859a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787853913; x=1788458713; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0xVuyq4wjYUJdSC5HORoIWzL+nU0+uyo3jftFJ3RjY=;
        b=fxHQmbGdbODTHNeWvGrNiNHs01FehkTINMmhmIgPLXMeMDsGHlwbwkOQYwp0wmF/uK
         9HDcDHsPtkP23J6w0WSerzLrtSrQx1FghBknjLzYJDQmyldvvHYx6oQvrGKFHP/3atBw
         EMwAYkcJDpC6PJytQOrBRx8Zwh8qUglsA1dh+lIQ16ZWdahrzTJGHdLbareT2g/jfRAj
         YWJqwni/6LyyyO8y9PchDTFqwIfq7mCCU54Fz+BMWptDIWKLNBmciL7jMJ+4fNUItqqf
         rQGIU3pm7l5JSoQb4NkXcpVEPCss4yhGmSkkB0QMcucFz1n2DLDCQgmbq2ZaHFRtuiKY
         1oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853913; x=1788458713;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0xVuyq4wjYUJdSC5HORoIWzL+nU0+uyo3jftFJ3RjY=;
        b=kZ8IMw0bQnC56LmAU1R/SEJX4/TmYhXSv0QvhvyRs159BIIwAOK3qGPKrZXGmN3+yC
         2tXdxBk/im1hZ597b57WTg5Mpjoe+FZXKA/WuW62wxGCu1mv9KWH0N5BFS4QE/4wZ92X
         MZLnamHb2lxt1+wohiD5mgJzg0YF/V1Ug5HBpFgYvexig15C2hSA5nyjAbAeuROAn/mp
         FoG6XxZcufy/+keUsdpUIpFqV0IsSclzz9HdqAYBsp9Eg2oTyY+dHkvtRsbLk4VhhdT2
         NRdef51ASlTA7xID8/P+mdv0IeJGF2rm9bLaHjeyIBQeFj/qJ4Rx010S3X22Fn9bkPRT
         4vrA==
X-Forwarded-Encrypted: i=1; AHgh+RoZNNdWeBTg6q2x4edonVxR+Io63iKsXM5E9HeFNpeqBeTLib0aGdDqOtSdcp+KnoD1Iwg7PxzGqwZm90k=@vger.kernel.org
X-Gm-Message-State: AFuF++kABY9SxYlQ6dPHk7X4e0u7K+BiRERj8Xhv9QBpXzjF7cTfpkbY
	tzRz/xghC5OpfXXLBqJPtTT1F25KFibWndVsHco/gYUXQxFFS1c+ixdApy+xalJ388lQidFLiVM
	qEDVuPWrmUqMtFu60JQ==
X-Received: from dlbqy10.prod.google.com ([2002:a05:7022:ef0a:b0:141:b6d:b7af])
 (user=robbarnes job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr2127530a91.6.1787853911845;
 Thu, 27 Aug 2026 11:05:11 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:05:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827180511.2825660-1-robbarnes@google.com>
Subject: [PATCH v4] platform/chrome: cros_ec_proto: Fix deferred response
From: Rob Barnes <robbarnes@google.com>
To: bleung@chromium.org, tzungbi@kernel.org
Cc: tomhughes@chromium.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Rob Barnes <robbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"

When cros_ec_wait_until_complete() succeeds after an
EC_RES_IN_PROGRESS status, it previously returned the 4-byte
transfer size of EC_CMD_GET_COMMS_STATUS. For 0-byte payload
commands (such as EC_CMD_FLASH_ERASE), userspace received 4
bytes instead of 0, causing response size validation errors.
For commands expecting non-zero response payloads, the kernel
exited without issuing EC_CMD_RESEND_RESPONSE, leaving response
buffers uninitialized.

Refactor cros_ec_wait_until_complete() to pass orig_msg, issue
EC_CMD_RESEND_RESPONSE into orig_msg->data when insize > 0, and
return 0 for 0-byte response commands.

Signed-off-by: Rob Barnes <robbarnes@google.com>
---
v4:
- Rebase against upstream chrome-platform/for-next branch (Tzung-Bi).
- Send patch using git-send-email via Google Mail Relay to prevent MTA line-wrapping (Tzung-Bi).

v3:
- Rebase against upstream chrome-platform tree (Tzung-Bi).

v2:
- Drop redundant commit description sentences (Tzung-Bi).
- Align function signature parameters to open parenthesis (Tzung-Bi).
- Check orig_msg->insize == 0 and add comments explaining the logic (Tzung-Bi / Rob).
- Use u32 instead of uint32_t (Tzung-Bi).
- Rename 0bytes test to 0byte (Tzung-Bi).
- Check header immutability for insize in test cases (Tzung-Bi).
---
 drivers/platform/chrome/cros_ec_proto.c      |  32 +++-
 drivers/platform/chrome/cros_ec_proto_test.c | 158 ++++++++++++++++++-
 2 files changed, 183 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 1d8d9168ec1a..6d7c57e381e5 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -138,7 +138,8 @@ static int cros_ec_xfer_command(struct cros_ec_device *ec_dev, struct cros_ec_co
 	return ret;
 }
 
-static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *result)
+static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev,
+				       struct cros_ec_command *orig_msg)
 {
 	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
 			sizeof(struct ec_response_get_comms_status));
@@ -161,7 +162,7 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 		if (ret < 0)
 			return ret;
 
-		*result = msg->result;
+		orig_msg->result = msg->result;
 		if (msg->result != EC_RES_SUCCESS)
 			return ret;
 
@@ -170,8 +171,31 @@ static int cros_ec_wait_until_complete(struct cros_ec_device *ec_dev, uint32_t *
 			break;
 		}
 
-		if (!(status->flags & EC_COMMS_STATUS_PROCESSING))
+		if (!(status->flags & EC_COMMS_STATUS_PROCESSING)) {
+			u32 orig_cmd, orig_outsize, orig_version;
+
+			/* If no response payload is expected, return 0. */
+			if (orig_msg->insize == 0)
+				return 0;
+
+			/*
+			 * Request the response using EC_CMD_RESEND_RESPONSE.
+			 * Restore the original message fields so it appears
+			 * to be a direct response to the original command.
+			 */
+			orig_cmd = orig_msg->command;
+			orig_outsize = orig_msg->outsize;
+			orig_version = orig_msg->version;
+
+			orig_msg->command = EC_CMD_RESEND_RESPONSE;
+			orig_msg->outsize = 0;
+			orig_msg->version = 0;
+			ret = cros_ec_xfer_command(ec_dev, orig_msg);
+			orig_msg->command = orig_cmd;
+			orig_msg->outsize = orig_outsize;
+			orig_msg->version = orig_version;
 			return ret;
+		}
 	}
 
 	if (i >= EC_COMMAND_RETRIES)
@@ -185,7 +209,7 @@ static int cros_ec_send_command(struct cros_ec_device *ec_dev, struct cros_ec_co
 	int ret = cros_ec_xfer_command(ec_dev, msg);
 
 	if (msg->result == EC_RES_IN_PROGRESS)
-		ret = cros_ec_wait_until_complete(ec_dev, &msg->result);
+		ret = cros_ec_wait_until_complete(ec_dev, msg);
 
 	return ret;
 }
diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 3f281996a686..a7b1d64f78ce 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -1744,7 +1744,7 @@ static void cros_ec_proto_test_cmd_xfer_protocol_v2_no_op(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ret, -EIO);
 }
 
-static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
 	struct cros_ec_device *ec_dev = &priv->ec_dev;
@@ -1774,7 +1774,7 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
 	}
 
 	ret = cros_ec_cmd_xfer(ec_dev, &msg);
-	KUNIT_EXPECT_EQ(test, ret, sizeof(struct ec_response_get_comms_status));
+	KUNIT_EXPECT_EQ(test, ret, 0);
 
 	KUNIT_EXPECT_EQ(test, msg.result, EC_RES_SUCCESS);
 
@@ -1799,6 +1799,156 @@ static void cros_ec_proto_test_cmd_xfer_in_progress_normal(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 2);
 }
 
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	u8 resp_data[4] = {0x11, 0x22, 0x33, 0x44};
+	struct {
+		struct cros_ec_command msg;
+		u8 data[4];
+	} buf;
+	struct cros_ec_command *msg = &buf.msg;
+	int ret;
+
+	memset(&buf, 0, sizeof(buf));
+	msg->version = 1;
+	msg->command = 0x1234;
+	msg->outsize = 2;
+	msg->insize = sizeof(buf.data);
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+
+	/* For initial command returning EC_RES_IN_PROGRESS. */
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_IN_PROGRESS, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	/* For EC_CMD_GET_COMMS_STATUS status polling. */
+	{
+		struct ec_response_get_comms_status *data;
+
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+
+		data = (struct ec_response_get_comms_status *)mock->o_data;
+		data->flags = 0;
+	}
+
+	/* For EC_CMD_RESEND_RESPONSE returning 4 bytes payload. */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(resp_data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+		memcpy(mock->o_data, resp_data, sizeof(resp_data));
+	}
+
+	ret = cros_ec_cmd_xfer(ec_dev, msg);
+	KUNIT_EXPECT_EQ(test, ret, 4);
+	KUNIT_EXPECT_EQ(test, msg->result, EC_RES_SUCCESS);
+	KUNIT_EXPECT_EQ(test, msg->command, 0x1234);
+	KUNIT_EXPECT_EQ(test, msg->outsize, 2);
+	KUNIT_EXPECT_EQ(test, msg->insize, sizeof(buf.data));
+	KUNIT_EXPECT_EQ(test, msg->version, 1);
+	KUNIT_EXPECT_EQ(test, memcmp(msg->data, resp_data, sizeof(resp_data)), 0);
+
+	/* Verify mock sequence */
+	{
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_COMMS_STATUS);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_RESEND_RESPONSE);
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, 4);
+	}
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 3);
+}
+
+static void cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes(struct kunit *test)
+{
+	struct cros_ec_proto_test_priv *priv = test->priv;
+	struct cros_ec_device *ec_dev = &priv->ec_dev;
+	struct ec_xfer_mock *mock;
+	u8 resp_data[16];
+	struct {
+		struct cros_ec_command msg;
+		u8 data[16];
+	} buf;
+	struct cros_ec_command *msg = &buf.msg;
+	int ret, i;
+
+	for (i = 0; i < sizeof(resp_data); ++i)
+		resp_data[i] = (u8)(i + 1);
+
+	memset(&buf, 0, sizeof(buf));
+	msg->version = 0;
+	msg->command = 0x5678;
+	msg->insize = sizeof(buf.data);
+
+	ec_dev->pkt_xfer = cros_kunit_ec_pkt_xfer_mock;
+
+	/* For initial command returning EC_RES_IN_PROGRESS. */
+	{
+		mock = cros_kunit_ec_xfer_mock_addx(test, 0, EC_RES_IN_PROGRESS, 0);
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+	}
+
+	/* For EC_CMD_GET_COMMS_STATUS status polling. */
+	{
+		struct ec_response_get_comms_status *data;
+
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(*data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+
+		data = (struct ec_response_get_comms_status *)mock->o_data;
+		data->flags = 0;
+	}
+
+	/* For EC_CMD_RESEND_RESPONSE returning 16 bytes payload. */
+	{
+		mock = cros_kunit_ec_xfer_mock_add(test, sizeof(resp_data));
+		KUNIT_ASSERT_PTR_NE(test, mock, NULL);
+		memcpy(mock->o_data, resp_data, sizeof(resp_data));
+	}
+
+	ret = cros_ec_cmd_xfer(ec_dev, msg);
+	KUNIT_EXPECT_EQ(test, ret, 16);
+	KUNIT_EXPECT_EQ(test, msg->result, EC_RES_SUCCESS);
+	KUNIT_EXPECT_EQ(test, msg->command, 0x5678);
+	KUNIT_EXPECT_EQ(test, msg->outsize, 0);
+	KUNIT_EXPECT_EQ(test, msg->insize, sizeof(buf.data));
+	KUNIT_EXPECT_EQ(test, msg->version, 0);
+	KUNIT_EXPECT_EQ(test, memcmp(msg->data, resp_data, sizeof(resp_data)), 0);
+
+	/* Verify mock sequence */
+	{
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_GET_COMMS_STATUS);
+
+		mock = cros_kunit_ec_xfer_mock_next();
+		KUNIT_EXPECT_PTR_NE(test, mock, NULL);
+		KUNIT_EXPECT_EQ(test, mock->msg.command, EC_CMD_RESEND_RESPONSE);
+		KUNIT_EXPECT_EQ(test, mock->msg.outsize, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.version, 0);
+		KUNIT_EXPECT_EQ(test, mock->msg.insize, 16);
+	}
+
+	KUNIT_EXPECT_EQ(test, cros_kunit_ec_pkt_xfer_mock_called, 3);
+}
+
 static void cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain(struct kunit *test)
 {
 	struct cros_ec_proto_test_priv *priv = test->priv;
@@ -2703,7 +2853,9 @@ static struct kunit_case cros_ec_proto_test_cases[] = {
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v3_no_op),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_normal),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_protocol_v2_no_op),
-	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_normal),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_0byte),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_4bytes),
+	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_payload_gt4bytes),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_eagain),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_retries_status_processing),
 	KUNIT_CASE(cros_ec_proto_test_cmd_xfer_in_progress_xfer_error),
-- 
2.55.0.897.gb25b4bd76c-goog

