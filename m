Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144652;
	b=HAENMDyzFPs0+9zVTceLDXaq+oJmId9L8Ygp/9lL9DAroe2vZU54M/DYspXjfaK2c8EL
	 BARnnl5ld5IndZ2hCbON/ZyrMwc9/mq2KcE0wbOqlor0pA8gmveOA/LQuS4knDF5+s0hT
	 4SrT4Z1pfWLgGNGd+dOORKHvLn8C+28sHURD6Lnoz1Am6owel/LG1HTp/ycTFVm4m9fMU
	 yWtz/fX7MMVPsWYHq84lklUu/d9R9PV50bt63Jr9dy98D3Jlgg/5EG7RXDbfTMQqELkgl
	 T0/CkGf9BAfT8RdsftjByLwuM23U72svMNG6x9m5/zIcG2jO89X1VjDlB4EFWYgk/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
	b=TzAGgtOELlHZrUn4Nt/+CQIbkSrys+dx3FPgOD6SDcFECHubPy4SLjdkKEvWC3kvKy7q
	 nYPGmX3ZnCy+x0r/OIcAabMnyq+N3lHzSKO3Z7PKMVDrXnLqio5IE/OmKnxYHOuPo1z9x
	 q/MauOhzfrdXB87hoBGC3lRkG89gqrGtJgq3HAl8D6HZsxm1aUK33SBL6AQvdaOl2l9sl
	 9Yf8W8Ztn6UsP+08/0eof1wE5Mp+WhGdUNpa+3GGlL8/Y0JkWAeCngFY996AjGagNjwaS
	 oilkBiBAzBTlkeY2WH6gdq+kT8GIdxGw5i9JXxC/9ohUsmSZjnDK8NGp1tBJnB3TR5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ju/5OYpU";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6419C606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6419C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ju/5OYpU
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso297398a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144652; x=1793749452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=ju/5OYpUx3ZBb1W5FpEMD1e8tUxrvaB52IWKctldHbfUJplB/kBhGPfBpqwMOdaM7h
         +NTCMHVaBHu3AlyN3aUDpadSF8k8ugxxdRCcW3cdfM4FDvSkAPqmlUQUSEyvCYqU9BF6
         1KukDBirH26PpoZARXAoZPXO53R/biItfXovDZ2hHVqDCpdZ4oYBEuY+f5FKroQ64auF
         LXhzX7aKpk6rf8iwzXZxOPNHPEwnKYm7dXw6IqqZsD8GlIZlKJyaQyGlwkK/4pybwDAQ
         8+hhcnXRp/YPSAq4z6Pby7+xKV2e9RQZu3s9w7gPtJYdm7RbQ/Mq3nDKMzGYWjF/nCV7
         W8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144652; x=1793749452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=THGvSriruXU51ZqrJHmjnjtWkdka3P5vgj19t9/O78M=;
        b=j77vJkNAoAKHi+la3hn+8GC8OYKPPNwK21GQU/3g7bc6VMbw1e6tYQiDMPdzCu+6VL
         ewhNNULVbw5JYgJDFkQAsjn4EkUrHvxwlFTBkEojyCtsItxmvTKRRmWp6r/AmueJpc41
         DxaEILzSSClr/KWgBXSgSP2ojGXwLH1A/Ky7FXOKS501gtulfkjGjDlfOAGsZzg2Rca2
         oasCTyBQ4F9BQR/BKGleKYiCa4k4IGfgQOft63gIAAlaO/14VfrRW/OxOsidV/7q/DL7
         CTtM/zxxEP00kYskDwkg9zwqjy/AlQthhf9qHPtEoTOQ1fh+LLPLadwd3gR9M4g6F3zr
         Kz8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwPJiIdgnfLJdjo73ik/FYmh7CLGhO8McNZNCAor+rebQP3mEXcxOf75gaLmoK734GMpT2B7otyTf1I6MM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQmduFF/11wf+PY5gRpYB00TKdHEA0V4Y54e8Uu3BL8sICuyzF
	iMdkHkplf9K77wd5Vn5BcsHTVwSb1Q6TKHWmiyHpm6Ia+MYGK/65Nokx
X-Gm-Gg: AYBFou1FFd+65sFiIakyNbNBavWGOvtg6IexnEkj6WVJEsIOmDSxriF2OnwKxo7buGi
	qwaHsSfPNw77oIm86Jkc2+38GFRVnTfPJn7WW7DHqtaWfnEmTYFFRxmMUy/tIZ6O8nK1/+rSb4r
	SPIKDALQj9r75dMIt8uE2rQKHwsaymybWVYgFMwT63ufX3ll6TvgFY5zUYFx8xe8cheYQGy4q5G
	wYMFh0f84LmLaAsiaNE+CwPgmWNRoJkI7m8Y54J4m4epbzZm/Uznj022T0WuFbKvBbMWC0w95WD
	HAbsrvs1YksdzNyqKxO5u9L7fyfW6v9lc0j4nx+7qtplr+pPkYimsJKyWOOP+mDjkoTcKpmrXOm
	NoTvMJMJz7dt4K+ohP/UYuBmxbR9sIIskUx7LH0A6uvJabRVQ2jaEH5BjfUKBbrHt8nAJcW0G2f
	9pP5Rvzi36jobp//lziDMDjKywndDMktktHzCLu+iU7w8Bzdbsz+RetrdbQYugZ2WriqlIXaRps
	njVNo4UQrqkOOZ9sQ+aBT4DYTIU5jM5neTEv6N8BCuoR2hUEwn4ql0MTbm3+WX3mooLqYdNYNLm
	LfKoXt2wyW7+A1P/SrtMnpPtuMAj5iYW/xOQutomh+Mdf4AcIF+lhZqx6hiKrTI4/KqmI9RMig=
	=
X-Received: by 2002:a05:6a21:a94:b0:3e2:b416:3c8e with SMTP id adf61e73a8af0-3e9024879d6mr509126637.60.1793144651785;
        Tue, 27 Oct 2026 16:44:11 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.44.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:44:10 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 06/11] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 28 Oct 2026 08:43:29 +0900
Message-ID: <20261027234334.32551-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027234334.32551-1-mynameisjune111@gmail.com>
References: <20261027234334.32551-1-mynameisjune111@gmail.com>
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
