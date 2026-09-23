Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B17542ECF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180974; cv=none; b=JcnP/FSUtLou2Exeg/lb26w7eI3T78XalUJb+ygXH0pzf+m8plDweXo2rvyb9Z6w+/CH6AneuQrizqeTM4/nVaw9HU1/HyIKTT0tPVTjGSmnPwbCKYoFN1jxIow2WZeBk9Y9PqP+sS/R5MKufFySBHWrE9gYjzK7CSjcc9AsoFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180974; c=relaxed/simple;
	bh=irhQM6PxErm5/M+kv3sqG5uyQturgL5M9IxGLYEqK20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OyB3ifph8TIcA/9PW/o/TPa/qzcpxs5J/OrbAuFzD+a0rLv7L30bHWakFcZPx/tW/xXFRxvaJ34Ixi5gpaJ9JHRwS1oZoCFpXpWnx1AFBWWdKdMB/tzCrJ8bK/PTLjdpO6GyhoG1a+YZoFH5n6pf2AmbYef3bEYDA73agUSVwoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai; spf=pass smtp.mailfrom=getfieldwork.ai; dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b=EqJ+wIEB; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getfieldwork.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getfieldwork.ai header.i=@getfieldwork.ai header.b="EqJ+wIEB"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccff31419so9701585e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getfieldwork.ai; s=google; t=1790180971; x=1790785771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f/Oxl6B462qmt7DFjvZCs7ILkpn+AJOBiwnAliwsA84=;
        b=EqJ+wIEB0f+gQ+SGhn7TKYLXPom4hm6UaSTsosuUvIPsZ9zKL7f+QNiZ/uSaHGXWhY
         b9BrXRBs2kwPIoqf1thLnkPo8n+Qpbq8va70kOsnMInoohjXhNljrPqJ/Wn0eUK+yyJS
         1z3CkP2Kb0T7/hzyPNnuVGgfhUTdbH8W4x9tcRwZ/C+0HNQqFwQo0IHJtuMPIbsHI5Fp
         Xm9xK77PqIdr8DIjVS6fxfZCPWqSjsGpenrqRvMOSkWyUZTY0kHIOWfG14RXSXZEN1mF
         bPHh8V79krasKf7Ma3KN8yZb6If3XzJjq9GAVAti46y7NZWE1fXN2vgzNpo0BGV/YuND
         xCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180971; x=1790785771;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/Oxl6B462qmt7DFjvZCs7ILkpn+AJOBiwnAliwsA84=;
        b=JunDqPa7f+aTKPhmNMaPcvyVd9G1RxV47Bj2YHnhxE3ecCH5Ari/QTb9FZu1m2G4hI
         bo8sNjxBhRuN8WFwuR/aSFLoZ9s5NiD9UUIZijqlZ/IBW3hdydGOCedqGAH1+9igbCOs
         3R85XigHR9jufR7MxK8r5/vWCjCGwHpkolTtERB8cEx6wvSHcmA9gAzue9FzDxiIlBbJ
         i48EpP7Fkabnn7ft3ANkZymgKgUiZvUI0i2NX0f3FD231pckJh3ca97t64yjNwAG2qpY
         K8U7VQqNZi0NBApadiwlmxK6G9Jv/9nFBTcnw9KCdLXn1m0sfmg489HxClhmWyl2fZb5
         UABA==
X-Forwarded-Encrypted: i=1; AKwUvBynGKgI7BJbcYKd01dSH7IrfCA1qjf3M3olVdkiK+Yhz6SXP+8vbmvXFG+kPrJGXHQePhzjvmCdm3x+IPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nR9V0W9kTkzrfDvIMZf/w07qz+dqW15JLyRVPLjX5yM9hcOLjz
	1ynipLmihRuxJJOkcRwf0l/DzVrVLWegF8CZUE9UD6QtzerN0knwp+0uZb3oPBrdlBBFW1X9Lcw
	AkcF97iknw5w=
X-Gm-Gg: AYBFou3Ta3csql/+qEAtovHECr+8/nkx9dC8m4YbQ8pz1DKfhNPM/bZm7DqF8VEpQ1s
	JWlpNpXTesUq7bPkBW+pZI5qkAClexjGY9z3dQ7AWd+by3CAVZ67jAITUQKUY+jObe4laG6e8tj
	d5KCaMW/nHsvmd/mIuoC+Yo0UxZ4LaWIlotkP33VLk7R7INVxE0hBWI6OZU8qr6w9Tcs6X3Gk3s
	cOBAAg3Eu8lD3s0IifwJRnBw1tKOvxc4bpLoM2o/3G+CvbY5uF6GYNyiYILiWmm/44RZ53paMgU
	vemYiW0zLGQAQSy7oK98LvSfS42doN4YD7NTTmDtmvME9OhE5+IezKJfzZgRdso+lCislfMpV6z
	Z5XXOco/unGcJQYhvHDKW4//ro5ywn+MfEqN/CRdh1iHXxzuUHnnWb9aKrPbGX6bbEUceP3NjEl
	YL0IjGX1fLtO/aF08XcuPBY4W9I0rt7ks8bHsVVO7P5zjGBUJs9HzT9y79puWXP0un6g+TcpzWU
	tsDAILdJELoCRXL6g/8gHySt0iLWuTlkSeoGRolX/41oY8PoQUFq9rUhrgthvrCJOik32FKjIn7
	Z2nQuU00PYJ7pmkJw9e1QJ2EMnvwKtf0I/SFSyTD/wriQZaKpL+ixH26hsuM
X-Received: by 2002:a05:600c:a416:b0:49f:e238:e7cb with SMTP id 5b1f17b1804b1-49fe238e887mr34015775e9.29.1790180970792;
        Wed, 23 Sep 2026 09:29:30 -0700 (PDT)
Received: from NicksFWMBP.taile41d51.ts.net ([2a00:23c8:b064:8301:d086:f104:dfd3:b00b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aa057sm87184355e9.13.2026.09.23.09.29.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 09:29:30 -0700 (PDT)
From: Nick Rogers <nick@getfieldwork.ai>
To: Brian Daniels <briandaniels@google.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	adelva@google.com,
	aesteve@redhat.com,
	changyeon@google.com,
	daniel.almeida@collabora.com,
	eperezma@redhat.com,
	gnurou@gmail.com,
	gurchetansingh@google.com,
	hverkuil@xs4all.nl,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mst@redhat.com,
	nicolas.dufresne@collabora.com,
	virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com,
	dbassey@redhat.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v9 4/4] media: virtio: Add ioctl operations and driver logic
Date: Wed, 23 Sep 2026 17:29:28 +0100
Message-ID: <20260923162928.73497-1-nick@getfieldwork.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917171921.2810550-5-briandaniels@google.com>
References: <20260917171921.2810550-1-briandaniels@google.com> <20260917171921.2810550-5-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Brian, Alexandre,

We have been running v9 on 6.18 in lighter, a macOS VMM, against a
host-side stateful decoder and encoder backed by VideoToolbox, with
ffmpeg 5.1 and 7.1 and GStreamer 1.26 in the guest. It works well; we
found three problems along the way, all in this patch, and have been
carrying the fixes below.

1. queued_bufs can drift until poll stops reporting the queue writable

virtio_media_qbuf() increments queue->queued_bufs after the device has
replied, without queues_lock. A device that completes the buffer before
it replies (ours decodes within the command) sends the DQBUF event while
the QBUF caller is still waiting, and the event's decrement races the
unlocked increment. When the decrement is lost, queued_bufs creeps up
until it equals allocated_bufs and the OUTPUT queue is never reported
writable again. With our device this stalled ffmpeg about once a minute.
Counting the buffer before the device can see it, under the lock, and
undoing that if the command fails:

--- a/drivers/media/virtio/virtio_media_ioctls.c
+++ b/drivers/media/virtio/virtio_media_ioctls.c
@@ -899,15 +899,20 @@
 	old_flags = buffer->buffer.flags;
 	buffer->buffer.flags = V4L2_BUF_FLAG_QUEUED;

+	mutex_lock(&session->queues_lock);
+	queue->queued_bufs += 1;
+	mutex_unlock(&session->queues_lock);
+
 	ret = virtio_media_send_buffer_ioctl(vfh, VIDIOC_QBUF, b);
 	if (ret) {
 		/* Rollback the previous flags as the buffer is not queued. */
+		mutex_lock(&session->queues_lock);
+		queue->queued_bufs -= 1;
+		mutex_unlock(&session->queues_lock);
 		buffer->buffer.flags = old_flags;
 		return ret;
 	}

-	queue->queued_bufs += 1;
-
 	return 0;
 }

2. poll does not report the CAPTURE queue readable after the LAST buffer

Once the LAST buffer has been dequeued, DQBUF on the CAPTURE queue
returns -EPIPE, which is how clients such as ffmpeg's v4l2m2m wrapper
learn the stream has ended. vb2 reports the queue readable in that
state (vb2_core_poll() checks last_buffer_dequeued) so the client goes
on to call DQBUF; virtio_media_device_poll() does not, so a client that
polls once more after a drain waits forever. Debian's ffmpeg 5.1 does
exactly that at the end of a stream with no B-frames:

--- a/drivers/media/virtio/virtio_media_driver.c
+++ b/drivers/media/virtio/virtio_media_driver.c
@@ -633,7 +633,8 @@
 		    (capture_queue->queued_bufs == 0 &&
 		     list_empty(&capture_queue->pending_dqbufs)))
 			rc |= EPOLLERR;
-		else if (!list_empty(&capture_queue->pending_dqbufs))
+		else if (!list_empty(&capture_queue->pending_dqbufs) ||
+			 capture_queue->is_capture_last)
 			rc |= EPOLLIN | EPOLLRDNORM;
 	}
 	if (req_events & (EPOLLOUT | EPOLLWRNORM)) {

3. VIDIOC_G_CTRL and VIDIOC_S_CTRL fail with -EINVAL

The driver has no control handler, so the V4L2 core turns G_CTRL and
S_CTRL into a single extended control and calls the driver's
g/s_ext_ctrls. That control is built on the core's stack, and its size
field is never initialized; virtio_media_send_ext_controls_ioctl() takes
a nonzero size as a payload to copy from userspace, and the ioctl fails.
GStreamer's V4L2 encoders set their profile with S_CTRL and cannot
negotiate, and v4l2-ctl cannot read the MIN_BUFFERS controls.

The fault is really in the core, which should hand drivers a zeroed
structure, and I have sent a patch for that separately [1]. Until it
lands the driver sees garbage there, so you may also want to guard
against it; we have been clearing size when the controls array is on
the stack, which only the core's G/S_CTRL translation produces.

[1] https://lore.kernel.org/all/20260923160936.33445-1-nick@getfieldwork.ai/

Thanks for the driver,
Nick Rogers
