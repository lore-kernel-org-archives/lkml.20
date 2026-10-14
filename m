Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B40330D25
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948648; cv=none; b=BpcBpMeC7FHofr/Zm43/QnkHtsZ2iGzqo43aNEqo0K8a+pUYNo6WK5Gl3j+HFEqJr44/1QFanSapzFeQDKxpvwVn7iEF0bJkOmJAvfmLF/YwIio/A+yWOntIkkUvB6pUxtWolHlLBUuTY5pfSQDnfPSwjLPfwPFFH+sbGFabuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948648; c=relaxed/simple;
	bh=OFqdtS1oJTHFvjngsO4Nq8qXONJKrjQgc65t4eunTXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LTcIkBpBBiltUkHQxoWNnCPJMp+J7h1MJFJNzueJawEwO4T2Z5MnCi6tGiS5L/ayMpkkng4jx9R0PQTcOO5DmYU69T4dhaY1z0CSFXXqKMtEmD2OFyXI2usnsgytR0KchkCsmV7qHy68f6uHJOSvK/WgFmkkvMccIS1v2G12E9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg6S6giP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg6S6giP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8662d5e95so3676685ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948647; x=1792553447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=Fg6S6giPy1cTGicIRev2RfQlt181dIfxGVdcFTizz5fzPIIUwt///clE9SNZmu+F08
         KksgRVk5iZVnT4Jev1vS4n01w1iktIhcARGV+Jb8zRWU5r48/KXSvDh1olXZvwNqRMWi
         z97yoPJp5PlyTT4E9/TQiyhAKrQ29J9AZnoan7GKbwHV7tyf8CQ16R2FF9O7dRJ99PvD
         tY6vYTHXgt1Bqg7QKSLUdR+n0uc3KiHSxK1LZ9Qs3YlPx2CTXqEBAvTK36fTsYz5TIhQ
         KzRhDNmslOjn0NyrqCvluKpTgTauzwLmNC92QNV0ZoLYa2ESmDX1M9IRK+ZYJX7L0/sG
         B/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948647; x=1792553447;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=J+TcPPRy1kOAmkJh7iBDvTf3cDzMVrtwhlAyd1wA3TtX82m3i8KVy694sApJBb+FJf
         UVtiBUdDUmBTggeMk5DntFME/tVBexf+UvVW9Bdi9aR6fcNNg2U2VpFI1GUm9uunoPUq
         W60KGt5nJNHc0K/8cGmZUe+nAsnkSaGnmhPuMYyB8eIaWYpDHhpym2EBj7Q+xiciu4sq
         yLB2Jm+16HB1aaeBBNNHIYv2UB/q4otX0J0eZpHRh9Bdvg33ObHPzteD0sUVF+jna0qo
         HpGJLkIWqct22lMCdy5zKM7nxCYqF7ul6Z94DlZx9jcAIvNzJmgUhg/2eXcasO/i7XPK
         kVHw==
X-Forwarded-Encrypted: i=1; AKwUvBzG2Y7RxzIJjRKPsOAMJiJlTGYOwOdHTux0sH3KKuj5OOBMLjVvOggnz+cn0eIWCbL+qkVlpu68M1KRbak=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/bT4r5HBBjrqonrd71y2XRbJ8l0SmJ6bULPZukPfn0ltybmlS
	1QI2TPHadD6lwrkfZSIOF0Wv8vliIUQXYOaC5NieorRfDHqQOEUFVA1x
X-Gm-Gg: AYBFou3OmxgIsP73S1PNUVbythFLSA+xM3D+959OJCrNif5hMObwFVTzNhM9+XUSVnb
	MHZdaM+FvPxSBtAlFnMLvpdJxOOAAYbZs97XewS1GAtL/M1lbFKdwd8eyy1piY6XUcRJUR9/+eg
	EFSnr5+bdiW+2Tzr5XsR+fbhLcXbMN6fD2KWMXIjAHnPKOV5ZSy2WwnN7T8Gr9qNmuqGjuqmv/4
	wu6uY1fmV4kjl9vnb8lUWicpLtc55wUIEdfWqz6xnzZGEw/6/CnJTIWj5hdDdgKjf1JVXHqMjxF
	sF1dmY7aOAQ/B4554XFlLucDV99CiUF9YxDDINL89LfLRYI0+F0lpAhSSpJmib7mrob9SyDeiU8
	RlsGZnA324pCclY5CI65CglfsWFBQ/g3GgeWSczJ4MzPDtAUNJvfQ3gaZc6ZkuR0Wa8g4ardAVr
	Nxjh/ua878NnBzXDxDiZpk2PlBcWMi9RFBtx+OPVPCw9YvRBcShNZcjSN4BKIl7oyJnszTOcNby
	yBS9RlffzNvIfp8cPwLSa1+N3XRdUJZcUp53lSBFifImIioPE8J1/bng+1fOu+ISDh6kffYefhq
	S8w6hTu0UjILtWxuPw==
X-Received: by 2002:a17:902:d4cb:b0:2e9:3dd2:a904 with SMTP id d9443c01a7336-2e93dd2c08dmr4245535ad.16.1791948646992;
        Tue, 13 Oct 2026 20:30:46 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a0124csm63352505ad.5.2026.10.13.20.30.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 20:30:46 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/1] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 14 Oct 2026 12:30:42 +0900
Message-ID: <rfc-generic-control-wait-1.112c40f0e9284eaa@gmail.com>
In-Reply-To: <rfc-generic-control-wait-0.112c40f0e9284eaa@gmail.com>
References: <rfc-generic-control-wait-0.112c40f0e9284eaa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 sound/virtio/virtio_ctl_msg.c | 15 ++++++++++++++-
 sound/virtio/virtio_ctl_msg.h |  3 +++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 2e0ff15e729d..e50e6c7f3b8d 100644
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -314,7 +314,20 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
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
index f867b9b9233d..d84f0740fcb0 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
