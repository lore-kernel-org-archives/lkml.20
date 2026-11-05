Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862566;
	b=Q/iMyo4SUAQ9YeT0UcgsQgh2rKSbmh3Ot1tE4yd8aFApUZjWZR0Ge7yXOCtATmSfGqDP
	 6cYXoW6KqQ3n13TALxAWCcHJZm/2faLWCvg2FuSxrpETqQdX5ik9TneO5En3zrq7rjVA6
	 zk8XoH282ZTRXx9MXRQMGf5q0Cbhbjk+tf3p+MHogJIr0ALf8iG82CRlgd8seWf0iC/zy
	 Rr0hK6HnL/d5WzbsiLKra7Wwp3hvQyfbAcFZ6bugGIQwlnTJXJAVEzHaaPRCqQ0iLckr3
	 /I4pxMs90pGRB1jnxGnG06b1Jpzi+WSRvwUtzWfv/goOTPe/9BOa3oDva6zkWEhxMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
	b=PWz2CtgijxKDBbGXQUmZbiXi2pfft7Sy90uUOzIpReNUNbIwRDiokBILgjxAtXocw0Ll
	 Wf96iinqWc9iGBFV58udchzmef5tHWPmxuJQNCyRENeuUs2+mTKshlC/zHTgKt3dCLp4p
	 KtAnI7VYOorWYiNGbC3xv9RwCvlOFiPC7OMoTcB65aea5IBHq44eiXYpeAaB8AzfROOPC
	 xngnsCXjYh9xX5UvGllvHzr8dQOncaZga0/21/k38h7fP3jrAwtTroMmguVn7aTFVc48n
	 IckYGlxSTqLFgfpboi0djZEs9u9FgpuyQlKFxWB6PAHNHGEGhSwMMcu1epvfctBRt6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VoN/PEsd";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2D606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B2D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VoN/PEsd
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so2995696eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862565; x=1794467365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
        b=VoN/PEsdJpiWRA1ncgCpX/2JoQUoG8TuaRp+iKG7TtcNUAsCf54u9QixqdCVsOkJpv
         3MulJH4YjMxjZQ1tY5KbwymqR/NzoHd2jQXmCG5NecyJ06nvLXzNdR6jevfX7Tsw60Ug
         JbQUCVEv4FA+O/wLf9Xh03e6Tovxj67lAHAjMIedyDgWp4wVQUpdHWO0YB3vOvODIFgj
         dMNd0UArWzMKC10Z1RRWFQB1soXRN8cZza1pbtUiyxlvOHOw20hXVQAwd94A+5Z9BDc5
         FY9agZc2XM8YU1P9DwMCu3uHThWUwc0TFLDPzRWs7OGDNUmHK2w9pRWML6947dWrJI3F
         2HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862565; x=1794467365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uAb7bK+oRWXf9bD+sbQ9BK8EE9xp2VcjvnyDo4nUrT0=;
        b=RbaaJ/6xSRzY6+670voQS4b9YqoTp51fOP1CfoizXU/xYc6G5XaAs4Ra0P+ZbXskkO
         q93MxYYJ0JPg7gWc8/NpezAVaBgJz1zNZCglXX2tcmjKvkodiPzBZ372yBuDubAi5JgL
         1El/SCnkq/0u+1kqTcde90NBhNTiIaJOQpthA3EeMi/MVF+NtzcNZdt7it46nGoVGEbP
         IbVVOw16PRHJj4T5jRKQ/lFP9C5l3LCwb3rQZehUYpFS/33EqHed9RuJhBmRpvJCpuGg
         oc8L+hxbZDh07ZGBrV1NS3IqsfStrbxy96PGNwnNKHQTbnlaRF5Yr9ebppDWQ/Lx3YpG
         TVog==
X-Forwarded-Encrypted: i=1; AKwUvByr69lS29NxkRuTo2KXJdDuFvdFC+jfXaQx79jXEBDBLvq61SnyUqOUDUMfHLnYujAfKqw7JTupy5aYvXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z88EyoWUIe3SvRZJ1952HldiI9OB2zMmpL9Fq7D6fXEF4BryP/0
	RC1yosIp9tTGRSQH8MPpP/ghq3CqDYKNUb6RVq+Hy9ch8DuDw+xe0fdT
X-Gm-Gg: AYBFou2++iqnN1xYQ9t+LDv088RgZ6K67f9GHRRBZKCOD1VUoV+525doJkv0QQ4GV/q
	2pdnuJ5FRaZBWDO6MF6Psril9aof+A83JpYmj+LHQ7TMD4/3tLX4WT+sPcPF2BcAFsbt0hNhrPE
	ZD0kYqRe6AqppTw5INeFsC13Hp1y7J9D3weN+pNod8wGBffLcpsEbGpKrW8swuVQeej4gZUNV1q
	BqGKgaz/5PqWmgEySzdFA+Vs8iZ5f/aTgG8IFuIiYQ1PHTpTuKV6YWXoAGDmlAHVFjQjMUgH5FD
	+d+aPcdaX21t7bM2smIuw6OOBSl8nH74shWy/RxBI3Ks5lyYo3inWYmQcVlKjgTe/aapa/8TtZt
	C+f4d9MBtN+FenoqiwvYzr5AuOmN0RELK3mg13P9Lyskhh3hX6Gf4HKy/zJhjyYQYDVRl3bbyEe
	Xaz5TfTlcDB4lkJfWuZi23iB2sL55RJwFq4AZo7NIt+ezpHySYwaOmfRvdIDBXScjENbtgcbR/I
	FRNiYeX8MAcLjq9Om0QDXe/CuJNfMVXB/zOYX4IVm7A4fXI6CaH71KqCcJumWcBK6396uRqHeYs
	fcnAXtJ6nuYjseKkG9KqOlRucNQdRqb2CEuFQEs6e+gkPC/JNUCb4C25oECNWsMwlL7+dHS3sZJ
	1YJTg2Gr/TdmPvrAlzMs+ySH/+SNYMdL3MzkcoSpx8KVT8Vw=
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-36a423408a1mr27278440eec.8.1793862564710;
        Wed, 04 Nov 2026 23:09:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:24 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v17 09/12] ALSA: virtio: wait through signals for PCM teardown
Date: Thu,  5 Nov 2026 16:08:42 +0900
Message-ID: <20261105070845.6449-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep completion timeout and wait return values wide enough for the full timeout range on 32-bit and HZ=1000 builds.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
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
