Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548897;
	b=tVTdzWXf8OBiFY0lIfzVIi4QLGgB6gXaJHgmo8cKVNdU8rDkJqhpGSnIJyhW1FGBxhOo
	 Lh9u4nfJZUVytqaYzpNwCKRJ3QnKeOlbp/KjSI9arDeKlaYdWdeTxKPIIky++UxKF7j20
	 ONNj/hQUMxzYqYMq2wc2wB2gOSjYR3fhZ1pJ+pOdDaC+TJ81p9+wj8CfLccd24brSIYNJ
	 ayMq5GXVkaanhebRJMoqlBUNsqXLm9P6y7lp8qFmXzBhzNcGI4aHj5zxZrS28lneuy1qZ
	 PTjImNGJr09ZOARP//UoeeQIqg5BFH91WkEhpzAAIG520VkxDfcHA4ut1fn7qtqkCMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548897;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xZmCou/dQOtPrSIfRvBnurgCE/PSgpFzVUTx/UPlLZg=;
	b=FPhwKuWvM8DVqqUPcQbqkcu7Iov/9TJ/hAx+e/eWimXL5cq2gGCc6Z6Zkzi/dWvnYNS3
	 iFahMCOCJiIwq+QJhw72orMZhuLof1GwLD/iF3yR4+tjtUpc8b0I5mH38gzzk2LR2BFm3
	 xQcG8Na5VZdFz8ihQwsYTn9c/DeOGzGDA8Yitp7AP261v8AdEXng4z0CD5gcmPEX9jXjb
	 sk/TTqgtYIm2ihBsJIrH8QfYt8By/s/4Za7tqW1091oZkUNmrG3R1j4K8TijyDkz7oqtl
	 h2DCaGk2EmgxEjI4hJfxIuF/QFkDvDVXWKWeMzTQd2tLFjdE7iD1WKfBH5ta5YxZhqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foxmail.com;
	spf=pass smtp.mailfrom=foxmail.com;
	dkim=pass header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b="Au/9rfBH";
	arc=none smtp.remote-ip=203.205.221.192
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F2606A32F;
	Sun,  1 Nov 2026 16:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13F2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=Au/9rfBH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1793548888;
	bh=xZmCou/dQOtPrSIfRvBnurgCE/PSgpFzVUTx/UPlLZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Au/9rfBHYzd03/B3UlN+d8E0VEWgXy0rlzLbjWjKvOPgu/8bO5+R8lQGhPWBTlIfu
	 sdKgzNf2FeEYR3aJZ/0duLtHIc+33H89O7A14dWi948U6l1u4dV1LfQl102uy/whwK
	 JA2gwn6rMj/VKaNvjZfeCg+i6geYdWo6xJyUvFOg=
Received: from ubuntu.lan ([223.160.115.26])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 4D84AD9; Mon, 02 Nov 2026 00:01:13 +0800
X-QQ-mid: xmsmtpt1793548884tyz0oq840
Message-ID: <tencent_B6F75567FAE05B5F2B1E793A9FC916E3A608@qq.com>
X-QQ-XMAILINFO: NmRjDopJZVxO80f01PFtXdtUikJMe9b8/vpXuv0QreLhYksdtShcaJucQw1GhE
	 0UYm2uVyv3lQkjTfpnq2/PtHM0gIH8ZKXQlscbMmisBcHyvMR9kZXh9hGyHJz5MX9iXsNOat8+xs
	 gYEalgnZXhEEULi43r19FIEMKsVVaZQKei7nJHJiqz/voTrj3DFBaEOUeMW+OF3V2hkoyebNNaHe
	 1F9+w6dZgGYbT26UJYRMZKk0KJ05yoQb0jen9xMFnpF/kZRcYwihpisyQ0DUJw7Rln66TNu/aLxY
	 QY24Kq8c456OBmawp4NBlYJ/JPnuOLet1ORGLu/dPPEE7Hatftd8Q93RCs1OzJg0dyAL3OvdtIUi
	 Mk0l+MUMGGvzLUtGQp+X/Ml3pVak7btfrL0ntrrD7JnBko02GWO+4IWhz6HItaYD3T5dRyaAezJQ
	 FKvp8yWf1SWx9IaYyC7lfhVeq3mBNull8JGFVuA7mR1kEh9aRl3cH1J/1fYIVYZOhkSjqGYBf0bc
	 56f0qDMVEkc/lwtVXP+54p5HiMaCklzfxlG2WflcmpMiw1AlLrd1+Rd/c31/KA+Hy4UR8S8TCQVe
	 N5kF+N0sQT0Mk+K/PY442DbjY1Cc1fzvHOM80udWaBvHCNaUryaZP063e2GMVKsunONEOmnxjC/C
	 /z9uXJ1c5tS7z5y1b/V0nTPvux24uRNrb9PSpivDz9CePZ0gdlYMTJzD2AGtsU6Rhf5aUoCsuHzh
	 4RmIBe/VwmkC6vrex96k1FbGvgCHS1inKoy0pp3tAvSAc7PvrK7LcA00hwI1QhMNP6SXOQTnD5ZO
	 FDpPk80/PTpL8Ifqp4BYnOZHc3dqgrSBaNOpz+IjVBDRH9gV5NXOK+6SmAMkd3m+700209jxCwxG
	 a380Czub/r+13gITRNlGMhp5SfBQz07qwd7RZ7z4hUtU7HuE1/3koVGeDIDfFSnn6kKDtrwI/S/c
	 ffczaFYCciab7zBKlYErDrDc3IaLv9fXFuDv9nv7MZKuVNkep+vyjowaM9SKf29Wl1fDBuUrN83K
	 WDbEyD16rMKsFfewKC4YMwiAdEcVYz4sIwFZDXjmtz5m0IceWWv6A4xzdDcNNGLxyJbeITrg59Rg
	 qhXQFvbeu3Sf8fnueCcXr8Ogeytg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Haozhen Li <dezige131@foxmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	=?UTF-8?q?Dawid=20Wr=C3=B3bel?= <me@dawidwrobel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haozhen Li <dezige131@foxmail.com>
Subject: [RFC PATCH 2/2] firmware: qcom: scm: Handle QSEECOM listener callbacks
Date: Sun,  1 Nov 2026 16:01:09 +0000
X-OQ-MSGID: <20261101160110.3622-3-dezige131@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101160110.3622-1-dezige131@foxmail.com>
References: <20261101160110.3622-1-dezige131@foxmail.com>
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

A QSEE app that needs something from the normal world -- nearly
always file I/O against its secure storage -- does not return from the
SCM call. Instead the call comes back as QSEECOM_RESULT_INCOMPLETE
naming the listener the app waits for, and stays that way until the
normal world answers. Answering is what resumes the app.

The QSEECOM SCM helpers have no way to answer: the TODO in
qcom_scm_qseecom_call() turns an incomplete call into a WARN and
returns success, the app stays parked in TZ, and every later QSEECOM
call returns -EBUSY until the device is power cycled. The machine
allowlist in qcom_scm_qseecom_init() exists because of problems of
this class.

Add listener support:

  - qcom_scm_qseecom_listener_register()/..._unregister() publish a
    listener, with its shared buffer, to TZ.

  - qcom_scm_qseecom_call() now services listener requests while it
    holds the call lock: it dispatches to the registered listener,
    answers with the LISTENER_RESPONSE call, and repeats while the
    interrupted command keeps coming back incomplete. An unknown
    listener id is answered with a failure rather than ignored, since
    ignoring it strands the app; a listener that never settles is
    failed after 256 rounds so a broken app cannot hold the call lock
    forever. A blocked call (the listener is busy in another
    conversation) is reported as -EBUSY as before, without the WARN.

The listener path follows the QSEECOM transport work of Dawid Wrobel
and samcday (https://github.com/samcday/linux), which was verified on
SDM670; on sc8280xp the series is exercised through the fingerprint
trusted application, whose conversation with the normal world stays
on the plain request/response path.

Removing the machine allowlist remains future work: it needs users of
this interface to be audited for re-entrancy first, and this series
does not change which machines QSEECOM comes up on.

Signed-off-by: Haozhen Li <dezige131@foxmail.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 271 +++++++++++++++++++++++--
 include/linux/firmware/qcom/qcom_scm.h |  48 +++++
 2 files changed, 307 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index c77130693..7a1a93006 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -112,6 +112,7 @@ enum qcom_scm_qseecom_tz_owner {
 enum qcom_scm_qseecom_tz_svc {
 	QSEECOM_TZ_SVC_APP_ID_PLACEHOLDER	= 0,
 	QSEECOM_TZ_SVC_APP_MGR			= 1,
+	QSEECOM_TZ_SVC_LISTENER			= 2,
 	QSEECOM_TZ_SVC_INFO			= 6,
 };
 
@@ -127,6 +128,12 @@ enum qcom_scm_qseecom_tz_cmd_app {
 	QSEECOM_TZ_CMD_APP_LOOKUP		= 3,
 };
 
+enum qcom_scm_qseecom_tz_cmd_listener {
+	QSEECOM_TZ_CMD_LISTENER_REGISTER	= 1,
+	QSEECOM_TZ_CMD_LISTENER_DEREGISTER	= 2,
+	QSEECOM_TZ_CMD_LISTENER_RESPONSE	= 3,
+};
+
 enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
@@ -2041,13 +2048,146 @@ static int __qcom_scm_qseecom_call(const struct qcom_scm_desc *desc,
 	return 0;
 }
 
+/* Registered listener services, protected by qcom_scm_qseecom_call_lock. */
+static LIST_HEAD(qcom_scm_qseecom_listeners);
+
+/*
+ * An app that keeps asking for service without ever making progress would
+ * otherwise spin here forever with the call lock held. The real bound is
+ * set by the app; this only stops a broken one from taking the machine
+ * with it.
+ */
+#define QSEECOM_MAX_LISTENER_ROUNDS		256
+
+static struct qcom_scm_qseecom_listener *qcom_scm_qseecom_listener_find(u32 id)
+{
+	struct qcom_scm_qseecom_listener *listener;
+
+	lockdep_assert_held(&qcom_scm_qseecom_call_lock);
+
+	list_for_each_entry(listener, &qcom_scm_qseecom_listeners, node) {
+		if (listener->id == id)
+			return listener;
+	}
+
+	return NULL;
+}
+
+/*
+ * Tell TZ that a listener request has been dealt with. The response is
+ * what resumes the app, so this returns the outcome of the command that
+ * was interrupted -- which may itself be another listener request.
+ */
+static int qcom_scm_qseecom_listener_respond(u32 id, u32 status,
+					     struct qcom_scm_qseecom_resp *res)
+{
+	struct qcom_scm_desc desc = {};
+
+	lockdep_assert_held(&qcom_scm_qseecom_call_lock);
+
+	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
+	desc.svc = QSEECOM_TZ_SVC_LISTENER;
+	desc.cmd = QSEECOM_TZ_CMD_LISTENER_RESPONSE;
+	desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_VAL);
+	desc.args[0] = id;
+	desc.args[1] = status;
+
+	return __qcom_scm_qseecom_call(&desc, res);
+}
+
+/*
+ * Service listener requests until the interrupted command finally
+ * completes.
+ *
+ * A QSEE app that needs something from the normal world -- reading or
+ * writing its secure storage, overwhelmingly -- does not return; the SCM
+ * call comes back as QSEECOM_RESULT_INCOMPLETE naming the listener it
+ * wants, and stays that way until we answer. Answering is what resumes
+ * it.
+ *
+ * Not answering is not a neutral option. TZ waits, every later QSEECOM
+ * call returns -EBUSY, and the device generally has to be power cycled.
+ * So an unknown listener id is still answered, with a failure, which the
+ * app can at least handle.
+ */
+static int qcom_scm_qseecom_service_listeners(struct qcom_scm_qseecom_resp *res)
+{
+	struct qcom_scm_qseecom_listener *listener;
+	unsigned int rounds = 0;
+	u32 status;
+	u32 id;
+	int ret;
+
+	lockdep_assert_held(&qcom_scm_qseecom_call_lock);
+
+	while (res->result == QSEECOM_RESULT_INCOMPLETE) {
+		if (res->resp_type != QSEECOM_SCM_RES_QSEOS_LISTENER_ID) {
+			dev_err(__scm->dev, "qseecom: invalid response type: 0x%llx\n",
+				res->resp_type);
+			return -EPROTO;
+		}
+
+		if (res->data > U32_MAX) {
+			dev_err(__scm->dev, "qseecom: listener ID out of range: 0x%llx\n",
+				res->data);
+			return -EPROTO;
+		}
+
+		id = res->data;
+
+		if (++rounds > QSEECOM_MAX_LISTENER_ROUNDS) {
+			dev_err(__scm->dev, "qseecom: listener %u loop count exceeded\n", id);
+			status = QSEECOM_LISTENER_FAILURE;
+			ret = qcom_scm_qseecom_listener_respond(id, status, res);
+			if (ret)
+				dev_err(__scm->dev, "qseecom: failed to respond to listener %u: %d\n",
+					id, ret);
+			return -ELOOP;
+		}
+
+		listener = qcom_scm_qseecom_listener_find(id);
+		if (listener) {
+			status = listener->service(listener);
+		} else {
+			dev_warn_once(__scm->dev, "qseecom: unhandled listener ID: %u\n", id);
+			status = QSEECOM_LISTENER_FAILURE;
+		}
+
+		ret = qcom_scm_qseecom_listener_respond(id, status, res);
+		if (ret) {
+			dev_err(__scm->dev, "qseecom: failed to respond to listener %u: %d\n",
+				id, ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * A blocked call is a different problem: the app is waiting on a
+	 * listener that is already busy elsewhere, and unblocking it needs
+	 * TZ_OS_CONTINUE_BLOCKED_REQUEST. Nothing here generates that yet.
+	 *
+	 * Reported the same way as before this function existed: not a
+	 * kernel bug, so no backtrace, and rate-limited because a caller
+	 * that hits it will keep hitting it.
+	 */
+	if (res->result == QSEECOM_RESULT_BLOCKED_ON_LISTENER) {
+		dev_warn_ratelimited(__scm->dev,
+				     "qseecom: blocked on a busy listener\n");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 /**
  * qcom_scm_qseecom_call() - Perform a QSEECOM SCM call.
  * @desc: SCM call descriptor.
  * @res:  SCM call response (output).
  *
  * Performs the QSEECOM SCM call described by @desc, returning the response in
- * @rsp.
+ * @rsp. If the call is interrupted by a request for a listener service,
+ * that request is serviced and the call resumed, as many times as the
+ * application asks.
  *
  * Return: Zero on success, nonzero on failure.
  */
@@ -2058,12 +2198,16 @@ static int qcom_scm_qseecom_call(const struct qcom_scm_desc *desc,
 
 	/*
 	 * Note: Multiple QSEECOM SCM calls should not be executed same time,
-	 * so lock things here. This needs to be extended to callback/listener
-	 * handling when support for that is implemented.
+	 * so lock things here. The lock is held across listener servicing
+	 * too: from TZ's point of view the request and our answer are one
+	 * conversation, and letting another call in partway through would
+	 * interleave two of them.
 	 */
 
 	mutex_lock(&qcom_scm_qseecom_call_lock);
 	status = __qcom_scm_qseecom_call(desc, res);
+	if (!status)
+		status = qcom_scm_qseecom_service_listeners(res);
 	mutex_unlock(&qcom_scm_qseecom_call_lock);
 
 	dev_dbg(__scm->dev, "%s: owner=%x, svc=%x, cmd=%x, result=%lld, type=%llx, data=%llx\n",
@@ -2075,19 +2219,122 @@ static int qcom_scm_qseecom_call(const struct qcom_scm_desc *desc,
 		return status;
 	}
 
+	return 0;
+}
+
+/**
+ * qcom_scm_qseecom_listener_register() - Offer a listener service to QSEE
+ *                                        apps.
+ * @listener: The listener to register. See &struct qcom_scm_qseecom_listener
+ *            for what the caller has to fill in, and for the rules @service
+ *            has to follow.
+ *
+ * Registers @listener with TZ, after which any app may ask it for service
+ * by its ID. Requests arrive on whichever thread is driving the app at the
+ * time.
+ *
+ * Return: Zero on success, nonzero on failure.
+ */
+int qcom_scm_qseecom_listener_register(struct qcom_scm_qseecom_listener *listener)
+{
+	struct qcom_scm_qseecom_resp res = {};
+	struct qcom_scm_desc desc = {};
+	phys_addr_t sb_phys;
+	int status;
+
+	if (!listener->service || !listener->sb || !listener->sb_len)
+		return -EINVAL;
+
+	sb_phys = qcom_tzmem_to_phys(listener->sb);
+	if (!sb_phys)
+		return -EINVAL;
+
 	/*
-	 * TODO: Handle incomplete and blocked calls:
-	 *
-	 * Incomplete and blocked calls are not supported yet. Some devices
-	 * and/or commands require those, some don't. Let's warn about them
-	 * prominently in case someone attempts to try these commands with a
-	 * device/command combination that isn't supported yet.
+	 * The listener service belongs to the same 32-bit era of the
+	 * QSEECOM firmware as APP_START, and nothing establishes that
+	 * it reads the shared-buffer address at full width. An address
+	 * it would truncate would only surface as a secure-world fault
+	 * once a listener request arrives, so -- like
+	 * qcom_scm_qseecom_app_load() for its image -- reject anything
+	 * that does not lie entirely below 4 GiB.
 	 */
-	WARN_ON(res->result == QSEECOM_RESULT_INCOMPLETE);
-	WARN_ON(res->result == QSEECOM_RESULT_BLOCKED_ON_LISTENER);
+	if (upper_32_bits(sb_phys) ||
+	    (u64)sb_phys + listener->sb_len > SZ_4G)
+		return -EINVAL;
 
-	return 0;
+	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
+	desc.svc = QSEECOM_TZ_SVC_LISTENER;
+	desc.cmd = QSEECOM_TZ_CMD_LISTENER_REGISTER;
+	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+				     QCOM_SCM_VAL);
+	desc.args[0] = listener->id;
+	desc.args[1] = sb_phys;
+	desc.args[2] = listener->sb_len;
+
+	mutex_lock(&qcom_scm_qseecom_call_lock);
+
+	if (qcom_scm_qseecom_listener_find(listener->id)) {
+		mutex_unlock(&qcom_scm_qseecom_call_lock);
+		return -EBUSY;
+	}
+
+	status = __qcom_scm_qseecom_call(&desc, &res);
+	if (!status && res.result != QSEECOM_RESULT_SUCCESS)
+		status = -EIO;
+	if (!status)
+		list_add_tail(&listener->node, &qcom_scm_qseecom_listeners);
+
+	mutex_unlock(&qcom_scm_qseecom_call_lock);
+
+	if (status)
+		dev_err(__scm->dev, "qseecom: failed to register listener %u: %d\n",
+			listener->id, status);
+
+	return status;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_qseecom_listener_register);
+
+/**
+ * qcom_scm_qseecom_listener_unregister() - Deregister a QSEECOM listener
+ * @listener: Listener service to deregister
+ *
+ * Return: Zero on success, negative errno on failure.
+ */
+int qcom_scm_qseecom_listener_unregister(struct qcom_scm_qseecom_listener *listener)
+{
+	struct qcom_scm_qseecom_resp res = {};
+	struct qcom_scm_desc desc = {};
+	int status;
+
+	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
+	desc.svc = QSEECOM_TZ_SVC_LISTENER;
+	desc.cmd = QSEECOM_TZ_CMD_LISTENER_DEREGISTER;
+	desc.arginfo = QCOM_SCM_ARGS(1, QCOM_SCM_VAL);
+	desc.args[0] = listener->id;
+
+	mutex_lock(&qcom_scm_qseecom_call_lock);
+
+	if (qcom_scm_qseecom_listener_find(listener->id) != listener) {
+		mutex_unlock(&qcom_scm_qseecom_call_lock);
+		return -ENOENT;
+	}
+
+	/* Always remove from list to prevent use-after-free on caller unbind */
+	list_del(&listener->node);
+
+	status = __qcom_scm_qseecom_call(&desc, &res);
+	if (!status && res.result != QSEECOM_RESULT_SUCCESS)
+		status = -EIO;
+
+	mutex_unlock(&qcom_scm_qseecom_call_lock);
+
+	if (status)
+		dev_err(__scm->dev, "qseecom: failed to deregister listener %u: %d\n",
+			listener->id, status);
+
+	return status;
 }
+EXPORT_SYMBOL_GPL(qcom_scm_qseecom_listener_unregister);
 
 /**
  * qcom_scm_qseecom_get_version() - Query the QSEECOM version.
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 8f98b57e1..cf6d9bbc9 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -6,6 +6,7 @@
 #define __QCOM_SCM_H
 
 #include <linux/err.h>
+#include <linux/list.h>
 #include <linux/types.h>
 #include <linux/cpumask.h>
 
@@ -138,6 +139,39 @@ int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ns_vmids, u64 *handle);
 int qcom_scm_shm_bridge_delete(u64 handle);
 
+/**
+ * enum qcom_scm_qseecom_listener_status - Return status for listener services
+ * @QSEECOM_LISTENER_SUCCESS: Request processed, shared buffer contains response
+ * @QSEECOM_LISTENER_FAILURE: Failed to process request
+ */
+enum qcom_scm_qseecom_listener_status {
+	QSEECOM_LISTENER_SUCCESS	= 0,
+	QSEECOM_LISTENER_FAILURE	= 1,
+};
+
+/**
+ * struct qcom_scm_qseecom_listener - QSEECOM normal-world listener descriptor
+ * @id:      Unique identifier agreed upon with the target TA
+ * @sb:      Shared memory buffer mapped to TrustZone. Must remain valid
+ *           for as long as the listener is registered, and lie entirely
+ *           below 4 GiB, like the images passed to
+ *           qcom_scm_qseecom_app_load().
+ * @sb_len:  Size of @sb in bytes
+ * @service: Callback invoked to handle normal-world requests
+ * @node:    Internal list entry
+ *
+ * Context: @service is called with qcom_scm_qseecom_call_lock held. It must not
+ * invoke any SCM/QSEECOM functions (which would deadlock) and must not perform
+ * unbounded sleep.
+ */
+struct qcom_scm_qseecom_listener {
+	u32 id;
+	void *sb;
+	size_t sb_len;
+	int (*service)(struct qcom_scm_qseecom_listener *listener);
+	struct list_head node;
+};
+
 #ifdef CONFIG_QCOM_QSEECOM
 
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
@@ -146,6 +180,8 @@ int qcom_scm_qseecom_app_load(void *img, size_t mdt_len, size_t img_len,
 int qcom_scm_qseecom_app_shutdown(u32 app_id);
 int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 			      void *rsp, size_t rsp_size);
+int qcom_scm_qseecom_listener_register(struct qcom_scm_qseecom_listener *listener);
+int qcom_scm_qseecom_listener_unregister(struct qcom_scm_qseecom_listener *listener);
 
 #else /* CONFIG_QCOM_QSEECOM */
 
@@ -172,6 +208,18 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
 	return -EINVAL;
 }
 
+static inline int
+qcom_scm_qseecom_listener_register(struct qcom_scm_qseecom_listener *listener)
+{
+	return -EINVAL;
+}
+
+static inline int
+qcom_scm_qseecom_listener_unregister(struct qcom_scm_qseecom_listener *listener)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_QCOM_QSEECOM */
 
 int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
-- 
2.43.0

