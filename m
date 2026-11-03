Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693328;
	b=Ps8dSyMWtG0xYNN8dJXXbnNY5YSyvn0zOHxWFUIENA88+JV68YqtkpK+6Dz5rmAb9uA4
	 gKd2Fs/0t7j9SzESnhzLSxQ7YLa/V3gftT56BVAEH3+h0RLuMXiKg2oXlDVv3sdO5BKwE
	 PmDiFsCeG/Q3dsxTyDXW5iGzQQd5dLBNS/GZ3/CawTr6029J0rLI1HTl9UJFICpcsy09d
	 jdXuy286/Kxyp9UhgnjQ7nKiP8RvDbyJIrwq+pMcM4jINobPnr0jcSv+g6YvQanLaurON
	 wpA0zJXMlWtw/lhQjQKI+K13z0FZlZs3bxQq61jpUQZzG7flR73dsq1GosQ8Wg2g6sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
	b=HRkFKB0Bm1qNJFsQh3oEz58VG/Yhyi5Elt3ax5JrkMHSTwQzdLBxVK24YyLxAeb4mDyt
	 tC9eUJWpuQ/01hZGr3SQ/Dr4NLaQ8TQi9rW2dJt1vxcwEi8Am/pbj1G788oR8RhHOqrvj
	 V/xliob9sl8L3dkCQ9TX6xhpoIZIaMrpRPZUaUc9uG5EQga3tXeMfRWNcLIkFtcpCK8Qo
	 3FQ1P72q5/jnaDiWacWpCAejrRosoVQzj+Rmpf1WW274KbiWAc/p0vNJXTDyyiKPVAo8a
	 4S6fo2hYhlmbglA4b1UTdt4HIZOeI57XKQ5E1MINAz0Wo6LdZ56BVyFI0QEoI+fFjtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fU+h7AQt;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0D606D80F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F0D606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fU+h7AQt
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso7513469eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693328; x=1794298128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
        b=fU+h7AQtUyRV1ThAByL+bP/n5fuwlvQYIwDXUWYtZ6M0BetJBhhWF56TlPkk7IWmNU
         lMAPg2puy8Qlf+C5qqSrs+Ls3/8kML0KW85DtbH74QcAGL6jikXnPJMHdswQ0M2Q/Mzq
         kUpYy8GRAuVtN1EHR4sFGhKwkgDYSpiMKNjBmMuygQASLvSalTzIacJ5zb29G3OrjAIt
         nBdm6RJIwHShgZzPHJe1d3tafcryWlfKk2OJE1ZYOGsEXtV73/Z8S3ruwW9dzMbqXwZP
         VGI8xMGc+loKhZIkV7+K5xD+6UKoihNKYzYSYrre3CYKFTJ/g0wF2ym3LznnkFtC1FA7
         VbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693328; x=1794298128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v+nhGD2zjLwLi9y1syT+X5YMbxWrSCy0fEer5oAGFXI=;
        b=cPuxniElMUPjbvBPUm9nzY+eM33JmyZ1dIOAYb5KZfTWSTm5lk6J6rZhH5L1yDZj3A
         UB8CgRV4qDfC9eqGwYAW/88I6s/CKxTG3AtzRHc9kyURC/LFio3W4+VhbB3fEp0uMdEP
         NNA2L18DFLy/vWwIqfj0W7NL/GaFZjHiaNgMV7Z+S2EqBMdYFQRwlCfksQo1rIYdmLUQ
         fHGt9LQ4mxX71lMIwXetSxUyU1uqibrVUwdZTQB/q7o6fadBM0ZS22EariQ8TZGZSbRt
         qXl6LGs9KFE9lGqPHfxoQ+t19KCZEuSEg1/5NmBEmciFrk5F2McuSoampaF/xgPM19UF
         ry5g==
X-Forwarded-Encrypted: i=1; AKwUvBzR9XIxoBqUFhODeZWVhSV8sqTLlPWeVIXLHqVrlbRjrnhWk2OGJNpiJbhkKWRrS/KP4brN6tQm3zyD3pM=@vger.kernel.org
X-Gm-Message-State: APuU4Z93M/vI/MGppLju+slJc63i9/NHGr34JAPRFI1W0d6dxL6N9LpR
	h0L8sfLkT5eq8kFQ1pSBhD0QgiGaMu5PXc6CuLwj60kF3C3ZSDNlonMz
X-Gm-Gg: AYBFou0pNXIKnlUz5kZfDG3iC+uOxeNOi0wsdnicu/gSZ2Vhs0b8fbUJELwfWe50foM
	tL5Kg7kRTgZXfiShi8hNu3PuoPFGtrPA9qkwHJwCSeIDwLQzWDaa72UhGs7JABewNfKeaIlspKJ
	DTnCkg0v4xS/u8g05PQMWL4HGeqe4FaghSez2VJ+RPshAYrKIKJ/T0MZH7zcead4fxA5MAutJ05
	eQb/6GqNLkQYY50fh33Q2GiGWz2r1UVZfL8vlJ30ThdGB10VjEUv7EZ91xU+ap6D9Kg7p3x398O
	rEK9dhVjCrTkVT2EAUH+1Gvg2BraZmidF72Z+5yvHgiRVr2n9muokYZx5xyTZMk03YCKet1YsSE
	zxcCg8Mxejr3/xvNOnxKHzPnq3ua7MHv1QmSB3kfurk1Xb0wkQ1z8PyBcPPYwIZImHAz+13piaP
	DAkKZBxsVzSeRw5NXPNNirQDf0/hafP6rEt8eveYpwtFj5JYBPT+Cbxk9+CWdIp3d/iL6XlDPfg
	flfNTZ790jRu4cUgiS9ssCeOQyGyVDFcltskmg+YVSVSUj0xVCTC790wWCPHU+Pvu41b9wRU08/
	+vwmM8S+rObuHmnpRW3FKOkTIXjN+rEuYRlWnIdl0u1YkGE6YK1BvGTqNfdEcBX4KsU6aXAN1je
	0y2vNxPmWaftUPsvJ9OZbkUxzNv9Qgz3hF468T/GgzeizS70MZU52vj75wlAzL4NSEHhA
X-Received: by 2002:a05:7301:fa4:b0:36a:713:a76b with SMTP id 5a478bee46e88-36a4236a5c5mr20255970eec.6.1793693327465;
        Tue, 03 Nov 2026 00:08:47 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:46 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v13 06/12] ALSA: virtio: wait through signals for PCM teardown
Date: Tue,  3 Nov 2026 17:08:15 +0900
Message-ID: <20261103080821.16983-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request is
still pending. A later teardown may then submit another RELEASE before the
first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels the
pending request and wakes the waiter.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_ctl_msg.c |   15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
