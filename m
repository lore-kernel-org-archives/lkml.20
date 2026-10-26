Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019251;
	b=BwWFkG4CU46J+BQygiRu0Xq/XqUo+lnz0tcN7Bz5pqhDHEzDOY/CW+S1zwk5doO7TUP9
	 EoOYuZ0CLiV1H/gcqCOyh2NJ75jx4WPjtK+4xVpvODYFgrRpne13/mmD8tVoxa01tarVl
	 gAl7BS/gg6vuixpHEKq+mWDUprmdC9iRFtz9iImSX7V0ZoJVBL+bmGFPzV3orE0OTfR2c
	 PHDXDZk3Qe+ujlFJtMIswpTIDBzKHMYgSgb+vivQGtcdQ8TiUYSSFMRq4kM+nS0cGQbJZ
	 21XUG4zodl6gAm2hRT/VUtHAjVlizU4ajJuJVQbFFDEKh6IUSq7DhfxGs7Poo/OO1bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ON8KGnTevtZaUMygjMJTRTjAtMpKsCSCYzE2GSlB3gY=;
	b=AzENMsHZNIcYIZuFkBceht6iZsmccVxoZyvAk0hkt8AS9FAHz7suVSSZ5aClRBqHc01H
	 2+ySsYYznhMaY8sOHy1J4PsqvU1pz6dM2ZymhuEQUBy9ctTZahHN7W19yaFMckxBHTf83
	 77jUXJtrFdW2Xvl5//AYrNKhgqYG9JCWUKYU9EZiYxy1xeihcVmFkYNJIc4pg9ft7fJvG
	 WinGn8GRXgNG34QRA5akL+/jQp+bKm/Kec+pXpbsPukmllrkZSKmP0hogqFhF+XWM9Hxj
	 MdQMED+wkIqDgFS6OvdKDchjfwglERC+o1GOg+RKj4DJDj1TY7Z90yIoYFdoxsJCJ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDzSYXyZ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C759F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C759F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sDzSYXyZ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso151535e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019249; x=1793624049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON8KGnTevtZaUMygjMJTRTjAtMpKsCSCYzE2GSlB3gY=;
        b=sDzSYXyZ+vq7imqkUMma+W4UryInipeJhv4L1VqQXgNeOkXQ9tXO5KOjHRy+mtSIBJ
         3oFO5wnoY5pIBDXr/qSlv0WPbNVpJYl5uwf9Pgn7s0e73c6O219ohm34LJR5Qa2JiRGR
         +hozkl8ry4ddwlERmcvMSVXj4bIk1tvjz8t3IAn0wnOt8XcR2YVk7xORkQQOT96wlndJ
         a9ZWeY3Q4HYsCw8R09bpMVdpJyDbVDl4xvRtSW/O9oK+DzBBfRMChCk4ep5XyTt4NBPT
         +k9+5P3daotYgtB0Pk4s55r1FjBy52GVe4Mt1VHiujzkg5zSDtoG2JWz/TdBeEpIm7Zh
         IKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019249; x=1793624049;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ON8KGnTevtZaUMygjMJTRTjAtMpKsCSCYzE2GSlB3gY=;
        b=oPn6ApK1tKA8UbMlDzHHW5HTn1YLTUlelgeH+GFhcImrcAhqDkpyQowqClrqB/LtMS
         a5aLczaa2tQy5QqtIiLM13DbwlOH6hjQM1Vva0VvMl8QgKJUBThsBEJn+wAQB996ISd5
         9LFQ6z2duVZ61oR1F8z/a9ojuyNKst7U9JGgndXwArpLd+Bd/H2YE762C7Gy+OxW1KFc
         qxsxnttZ2xsJOVsXVsTr5Hi7dvE4tPaJH5FZV2SSOo7+0qyXyh3ScZWaCn1UyXnVvKOO
         Kk7v3QNPsNQN8m7pnaFkFWHtcTqASjhrQFxoefsYszJsO/DYE2Rh6gmX1KhicFGJeis6
         NbLg==
X-Forwarded-Encrypted: i=1; AKwUvBynxS0TSwWW6oSLH3FGJiMFFcqgf8z8FwCq9gQZoweywQPTfHeiaPwgb0qSSw+ybwKLHHmd/8NKVjgrmNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVvh0H8zA9UpQMFFAQueMgWYmEBW6DznpP8bCHpNDcQpy450Yo
	nyK34Vj6aUGUi0uKxuGtcXZgkiMsMkzT6u9mt8qNjG2vLW6UPou4uymH7VnulJkDYwh8pg==
X-Gm-Gg: AYBFou0f/VLCug0bKFvuGf2SjLh4dvJoTu3qhYIpdgTtgkTrMBHrJNgRj8Oq3DdtyfL
	BzDe7t4d5XhQQ5mbhNG4DlsJovK3XunegLUy5csm/loXgc7RVdlFFd7yX3UoFfl2QAa1QFawHim
	31pR90MC+vZ134wZUc8/Q/OF6qz1wCoyzdIGJbtwjglIdH9msW0aKRw1g0fZTJmggvfl6+uKDhJ
	UQ7yUgzDanQRU7qjuxsXWHKm4+ph+Lq6LawDfUx5uVI7el73a94eaTCr9KUXieEc91MjEquKI8p
	vt8SAPomrBYLKLt/fWpJHAfuOVUe8tMe9PMoZ8z45lEt7lPUEEmymagXErqNQQeUONFEbq6GDDk
	H82iaTAFY/yK4U2OCDhQOaBQ2xsRFgU+gr1BvYCktGErHwyPDXeNGHU7Egq2eLbZsSXZDwMv14M
	R4g+gQoAXv76uUftYt7VmzFNKG52GnKNX6q7vA4pgM6J1m9z/pXk6ek0+CnFt1xPItzlnlSfOwr
	O2D+9vXf1M758jZS6YoTvcgoetldKmo9HdrjVyk67qr5V8z5l97Ng3ndF+ZXFFtA9LLbF3WVm+L
	4680SwWpTu1KtNIG
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr121818255e9.8.1793019248846;
        Mon, 26 Oct 2026 05:54:08 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a046fefsm245927875e9.5.2026.10.26.05.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:54:08 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fan Wu <fanwu01@zju.edu.cn>,
	Huang Wei <huangwei@kylinos.cn>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [RESEND PATCH] usb: typec: ucsi: acpi: fix use-after-free on driver removal
Date: Mon, 26 Oct 2026 09:53:50 -0300
Message-ID: <20261026125350.816530-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ucsi_acpi_remove() destroys the UCSI instance before removing the ACPI
notify handler:

	ucsi_unregister(ua->ucsi);
	ucsi_destroy(ua->ucsi);

	acpi_remove_notify_handler(...);

ucsi_acpi_notify() dereferences ua->ucsi, so a notify arriving after
ucsi_destroy() uses freed memory:

  CPU0					CPU1
  ----					----
  ucsi_acpi_remove()
    ucsi_unregister()
    ucsi_destroy()
      kfree(ucsi)
					ucsi_acpi_notify()
					  ua->ucsi->ops->read_cci()   <-- UAF

Simply removing the handler before ucsi_unregister() is not correct
either. ucsi_unregister() drains work that needs the notify path to make
progress: ucsi_handle_connector_change() issues GET_CONNECTOR_STATUS and
ucsi_unregister_port() drains and destroys con->wq, and those commands
block in wait_for_completion_timeout() on ucsi->complete for up to
UCSI_TIMEOUT_MS. That completion is signalled only from
ucsi_notify_common(), i.e. from the notify handler. Tearing the handler
down first would leave cancel_work_sync() and destroy_workqueue()
waiting the full timeout for a completion that can no longer arrive.

Moving the removal between ucsi_unregister() and ucsi_destroy() is not
sufficient on its own: at that point the connector array has already
been freed, so a late notify reaching ucsi_connector_change() would
queue work on a freed connector.

Teardown therefore needs two properties at the same time: no new
connector changes once connectors start going away, but the notify path
still available for command and acknowledge completions until that work
has been drained. Whether the PPM actually produces those completions is
a firmware matter; what changes here is that the path able to deliver
them is no longer torn down first.

Introduce a quiescing state, local to the ACPI backend, that provides
both. ucsi_acpi_remove() sets ua->quiescing under ua->notify_lock before
calling ucsi_unregister(); ucsi_acpi_notify() takes the same lock and,
when quiescing, reduces the CCI to the bits that ucsi_notify_common()
consumes for completions. ucsi_notify_common() looks at exactly
UCSI_CCI_BUSY, the connector number, UCSI_CCI_ACK_COMPLETE and
UCSI_CCI_COMMAND_COMPLETE; keeping the first and the last two preserves
the completion and bogus-data behaviour unchanged, while clearing the
connector number makes ucsi_connector_change() unreachable. The CCI that
the command path inspects is unaffected, because
ucsi_sync_control_common() re-reads it from the interface after the
completion.

The resulting order is:

  mutex_lock(&ua->notify_lock);
  ua->quiescing = true;			-- no new connector work
  mutex_unlock(&ua->notify_lock);

  ucsi_unregister();			-- drains work, notify path still
					   available for completions

  acpi_remove_notify_handler();		-- unlinks, then flushes
					   kacpi_notify_wq

  ucsi_destroy();			-- no notify can be in flight

which gives the following happens-before chain:

- A notify that acquires notify_lock before ucsi_acpi_remove() runs to
  completion while remove() waits on the lock, so any schedule_work() it
  performs happens before ucsi_unregister() starts cancelling.
- A notify that acquires notify_lock after remove() released it observes
  quiescing == true, so it cannot reach ucsi_connector_change() and
  cannot touch ucsi->connector.
- acpi_remove_notify_handler() unlinks the handler and then calls
  acpi_os_wait_events_complete(), which flushes kacpi_notify_wq, so a
  notify already dispatched on another CPU has returned before
  ucsi_destroy() frees the instance.

notify_lock is never held across ucsi_unregister() or
acpi_remove_notify_handler(); holding it there would deadlock against
the notify work those calls wait for. It is only ever taken as a leaf:
ucsi_notify_common() and ucsi_connector_change() take no locks, so it
cannot invert against ucsi->ppm_lock or con->lock, which the drained
work holds while waiting for the completion. The handler runs from
kacpi_notify_wq via acpi_os_execute(OSL_NOTIFY_HANDLER, ...), i.e. in
process context, so sleeping on the mutex is allowed.

The probe error path already removes the handler before ucsi_destroy()
and is left unchanged.

Fixes: f56de278e8ec ("usb: typec: ucsi: acpi: Move to the new API")
Cc: stable@vger.kernel.org
Reported-by: Fan Wu <fanwu01@zju.edu.cn>
Link: https://lore.kernel.org/all/20260718021142.3146566-1-fanwu01@zju.edu.cn/
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Reviewed-by: Huang Wei <huangwei@kylinos.cn>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Resend as a new thread per Heikki's request. Same code as v2
<20260903232121.271776-1-ivanrwcm25@gmail.com>, with collected
Reviewed-by tags.

 drivers/usb/typec/ucsi/ucsi_acpi.c | 53 ++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 5697ccc24ec3..2dd8e6d00c73 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -24,6 +24,15 @@ struct ucsi_acpi {
 	bool check_bogus_event;
 	guid_t guid;
 	u64 cmd;
+	/*
+	 * notify_lock serialises ucsi_acpi_notify() against the start of
+	 * teardown, so that @quiescing is observed by every notify that has
+	 * not yet run. It must not be held across ucsi_unregister(), whose
+	 * drained work may depend on the notify path, nor across
+	 * acpi_remove_notify_handler(), which flushes notify work.
+	 */
+	struct mutex notify_lock;
+	bool quiescing;
 };
 
 static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
@@ -213,11 +222,31 @@ static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 	u32 cci;
 	int ret;
 
+	mutex_lock(&ua->notify_lock);
+
 	ret = ua->ucsi->ops->read_cci(ua->ucsi, &cci);
 	if (ret)
-		return;
+		goto out_unlock;
+
+	/*
+	 * Once teardown has started the connectors are being unregistered and
+	 * freed, so a connector change must not be reported any more. Command
+	 * and acknowledge completions must still be able to reach the core:
+	 * ucsi_unregister() drains connector and partner work that can be
+	 * blocked in wait_for_completion_timeout() on ucsi->complete, and that
+	 * completion is only signalled from here. Keep exactly the bits that
+	 * ucsi_notify_common() needs for that, which drops the connector
+	 * number and with it the path to ucsi_connector_change(). The busy
+	 * indicator is kept so that bogus CCI data is still ignored.
+	 */
+	if (ua->quiescing)
+		cci &= UCSI_CCI_BUSY | UCSI_CCI_ACK_COMPLETE |
+		       UCSI_CCI_COMMAND_COMPLETE;
 
 	ucsi_notify_common(ua->ucsi, cci);
+
+out_unlock:
+	mutex_unlock(&ua->notify_lock);
 }
 
 static int ucsi_acpi_probe(struct platform_device *pdev)
@@ -253,6 +282,8 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 
 	ua->dev = &pdev->dev;
 
+	mutex_init(&ua->notify_lock);
+
 	id = dmi_first_match(ucsi_acpi_quirks);
 	if (id)
 		ops = id->driver_data;
@@ -290,11 +321,29 @@ static void ucsi_acpi_remove(struct platform_device *pdev)
 {
 	struct ucsi_acpi *ua = platform_get_drvdata(pdev);
 
+	/*
+	 * Stop reporting connector changes, but keep the notify handler
+	 * installed so that the work ucsi_unregister() drains can still be
+	 * reached by the command completions it may be waiting for. Any notify
+	 * that already passed this point runs to completion first, so no
+	 * connector work can be queued once ucsi_unregister() starts.
+	 */
+	mutex_lock(&ua->notify_lock);
+	ua->quiescing = true;
+	mutex_unlock(&ua->notify_lock);
+
 	ucsi_unregister(ua->ucsi);
-	ucsi_destroy(ua->ucsi);
 
+	/*
+	 * Now that no work is left to serve, drop the handler. This unlinks it
+	 * and then calls acpi_os_wait_events_complete(), which flushes
+	 * kacpi_notify_wq, so a notify running on another CPU has returned
+	 * before ucsi_destroy() frees the instance that it dereferences.
+	 */
 	acpi_remove_notify_handler(ACPI_HANDLE(&pdev->dev), ACPI_DEVICE_NOTIFY,
 				   ucsi_acpi_notify);
+
+	ucsi_destroy(ua->ucsi);
 }
 
 static int ucsi_acpi_suspend(struct device *dev)
-- 
2.43.0

