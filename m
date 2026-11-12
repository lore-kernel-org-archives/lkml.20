Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458175;
	b=UsYQgco6iue1WmzJ9YQjBpNE7Y1l1v8FSJnbjKG+gtEAJVqvBXJoS4SpgFisJBX1UUJC
	 AkXYq/9ajFBoSPV+W6w3cjjHxb23rkU3Nolw+61PJrIL5mTjv8BAqsV1VN09RfC9pMB4n
	 CwGaLuWiW735R+fWCno+kaDg6SXFqgvFpYUsNw0kfohnUj5mvN1/KX5f2SAhtKKSdznrK
	 kTXVNEZ66BEEoHanwqr7ol6YSsCXZuFeInpvSVjXFHhaAaMfVOztcKywEWF8u3U2xlMda
	 Xok2tLKFTQiZCLYLHv1cqHlezac2RFUHsZNf/8LtjfEPG3ABid10zZ+J5YN/90WG2og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
	b=wTMDLgwbwJeXWPKOjVoP3abMLRpF4pczfnQNfea3IeHRPCIWBI2cGocM6KaKMufFrv1h
	 R4A8CkUIxi42wO61Mg9lLOyps3zrWVc7SsuanDlq53RmbWZpI+ftBJFveC9hRMACd5ynT
	 1T07Rhs2qHA+8WcgQXTemk08ulVXlH/VG1HNFgM7qlzKtg14j6YNHDfHJhFzBn/vw321g
	 kBzW5izS2AYH2gGxetn/zmlFhvA5SRXerSCpK8Gf5tAhUzFiufO27M5rPC/7ySCBeA+9l
	 qmLncL/6yXJCJYxOIoHVet/C4SH4NK/x/BcnIpiXGHzHkHqvlekWO2AlRjFiyImJAmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7MQGE6;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9DA60A2611
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9DA60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TS7MQGE6
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1611123a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458174; x=1795062974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=TS7MQGE69+VhsF1sdcynqvEYy24ryABcEOVMNyXXCyOedAYVu5esZPeKOpvPoWPiNp
         SgMxNLtpTwZbYo0q27kvITp/yrdZnxy6+u8FLLGEBN3vVkBN3goJO+9OEwu1HZa0v7Mp
         Jm8y7ZMZoSD5AeBxQ7NN5wetAZKjX1XLvuglEucDZl8vgYaZPO4ISXfA9+D5ioabDHkw
         4G0NttZlPp5SQQnl+21VhB0+oodcMlRUa5Nbco0qMcllJ3fi6T62MewJCGW7WNYCZGAV
         hTpqmskvYcJCRkHFV/CreU/Mf81wTHqUaowXXmR9mbaiuzs/LphcieCBUvMbFEFtYSTp
         FHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458174; x=1795062974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=928OJa6yQ8fSO4+CgmYur7LQeG2ExiIpndY6iJl/WMw=;
        b=1QWg2ieY9bO2sQJ9IIsBpLBXcEK39YJxa6w6XaSpBlwAh1ss7hKSy1FFe5XoAkVfg9
         h8Tt6XJn8tWqwBl+xN0vrB6pbKDqAdD9WTW/bgAN3OYuyzzaLIGi2RGacagQyGZswERI
         WNjP8KcUSmc+k/hE3mrUkJLZ7v2C3gm6SrWBQkOP/b6qa7grU9Gy3r5huTEUJIfAX9tt
         ICiHo4Q+4ns1/0iXdRDW2YY19nLwngasYPstbku7K6DC3E6P8sebjMkTtI8SW0fNTlJZ
         eQrLqZ7GGLLCNNxXhnxb9emXVgior55GeX3Np3zjZzYzOf1A/uq8IzyZCS+F3Iw5uEjZ
         JKqw==
X-Forwarded-Encrypted: i=1; AL+hErGGhKQprv8PJOl078xGlIOORbaeRe0nEXY3hNiVPzvhKy3vQ38N/H7qhVqnaQREhY0WWYKyWMFRYbEhmgI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ynFsdiW7JCKq3GliEQxPp4f4T+Og9F1aD63YM8DuZ+84QNLDq
	CyaWGbcbJiJlJseDGUc2zHH24s/YfCTIY2/oP+fHjpQGHsl7lIlPtGLs6W81sA==
X-Gm-Gg: AYBFou1NXvTG/v+DFRUhmSrgHQ+gTKkiF+0rcKnNzS+eE5cwh29FJiWYVWBxUeL2Ccl
	0Stvpx4mHFbvTl8dStizXcZmDQ33jKIJgJkQ+YbPySBNEMbWBzUv8Tzjj8gAqAdPzfKl7CtMur8
	XHYfxUNvFPuedcsGnG0+h23VuWyYxkKbBIphkWW6i4idJgpC9uRF3ne/SPj/jlIXEwafQbYwPHR
	UrvNChv0WkdMiWeNZSHYjmea0GJMRrLd0K2xa3O4949OctLgJjT3bDKYJza9jYzmjgEevnoURTD
	rQzobmrL3GvQvhsmzEM1vu49WYZ3hwJDEfQ4QLj9y2A3sktoArKXAQXmLeMsElsCPh50Ghgsz26
	YaMTZjs75Jl4yKiQhRdE0EMwcVPkOkWgpatYHQUYTdFLJQvyfreF4GzWKuqTqPRACTZTTkr2aXb
	iA7puLGhcrjgY4nZHzoRXZ2RP3c7BJvaldKt6zCL+vz9g+Z0EfEF/y63c50zo8135y82rytG22K
	OPlMRsbJbcyKnsvTHeFTBegyxJzVR0sXPEJ5+7Jw6bU7ftCjngS7aT6lGfgANuLzAEzjzSOYDgh
	RtvDvxHEIGkGciO1NEdjBEsWlgUl9j9RYyLz/IHLA6eZbvAsMH956+ZaoKld5I9+EL7g/WAeLt7
	+zBjRnWRibViipdV8gS06OULZJC+UxKa+tC4LdgDkZeC8NQoixkBSd6J7AwdMod8kp43i
X-Received: by 2002:a17:90b:2649:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b182f235c3mr3670927a91.33.1794458173944;
        Wed, 11 Nov 2026 20:36:13 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.36.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:36:13 -0800 (PST)
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
Subject: [PATCH v28 15/17] ALSA: virtio: reject invalid playback completions
Date: Thu, 12 Nov 2026 13:35:14 +0900
Message-ID: <20261112043516.37010-16-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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

A TX completion currently advances the hardware position even when the
used length is malformed or the device reports an error. Validate the
fixed status response before publishing progress. Retire the request
once, latch XRUN and schedule error delivery while preparation is
active. Keep malformed or failed transfers out of successful playback
byte accounting.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm_msg.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1011,6 +1011,17 @@
 
 	/* Playback requests point directly at the ALSA ring. */
 	guard(spinlock)(&vss->lock);
+	if (written_bytes != sizeof(*msg->status) ||
+	    le32_to_cpu(msg->status->status) != VIRTIO_SND_S_OK) {
+		vss->xfer_xrun = true;
+		msg->length = 0;
+		vss->msg_count--;
+		if (!vss->msg_count)
+			wake_up_all(&vss->msg_empty);
+		if (vss->prepared && !vss->preparing)
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		return;
+	}
 	completed_bytes = msg->length;
 	latency_bytes = le32_to_cpu(msg->status->latency_bytes);
 	vss->hw_ptr += completed_bytes;
